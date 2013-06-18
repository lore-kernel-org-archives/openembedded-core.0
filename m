Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58ABC60304
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 21:09:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5IL98ne002022
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 14:09:09 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 18 Jun 2013 14:09:08 -0700
Message-ID: <51C0CC71.3030205@windriver.com>
Date: Tue, 18 Jun 2013 16:09:05 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1371586647-26145-1-git-send-email-mark.hatle@windriver.com>
In-Reply-To: <1371586647-26145-1-git-send-email-mark.hatle@windriver.com>
Subject: Re: [PATCH 1/1 v2] sanity.bbclass: Check for the known broken version of make
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Jun 2013 21:09:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Just an FYI -- this fails (correctly I might add) on many Fedora systems.  It 
turns out that their version of make 3.82 is only partially patched.

The specific check we look for looks for two different problems.  The first is a 
target that includes target(dep1 dep2 dep3).  The second is a target that starts 
with leading spaces.

 From what I can tell, most Fedora 3.82 versions are patched for the first 
problem, but not the second.

There are other problems with 3.82, but this patch appears to detect the most 
broken of 3.82 versions in common use.

(And no, this is no longer an RFC.  I think this is the correct patch!)

--Mark

On 6/18/13 3:17 PM, Mark Hatle wrote:
> See GNU Savannah bug 30612 -- make 3.82 is known to be broken.
>
> A number of vendors are providing a modified version, so checking
> for just the version string is not enough.  We also need to check
> if the patch for the issue has been applied.  We use a modified
> version of the reproduced to check for the issue.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>   meta/classes/sanity.bbclass | 39 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 3b9934b..012c40d 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -336,6 +336,41 @@ def check_gcc_march(sanity_data):
>
>       return result
>
> +# Unpatched versions of make 3.82 are known to be broken.  See GNU Savannah Bug 30612.
> +# Use a modified reproducer from http://savannah.gnu.org/bugs/?30612 to validate.
> +def check_make_version(sanity_data, loosever):
> +    status, result = oe.utils.getstatusoutput("make --version")
> +    if status != 0:
> +        return "Unable to execute make --version, exit code %s\n" % status
> +    version = result.split()[2]
> +    if loosever(version) == loosever("3.82"):
> +        # Construct a test file
> +        f = open("makefile_test", "w")
> +        f.write("makefile_test.a: makefile_test_a.c makefile_test_b.c makefile_test.a( makefile_test_a.c makefile_test_b.c)\n")
> +        f.write("\n")
> +        f.write("makefile_test_a.c:\n")
> +        f.write("	touch $@\n")
> +        f.write("\n")
> +        f.write("makefile_test_b.c:\n")
> +        f.write("	touch $@\n")
> +        f.close()
> +
> +        # Check if make 3.82 has been patched
> +        status,result = oe.utils.getstatusoutput("make -f makefile_test")
> +
> +        os.remove("makefile_test")
> +        if os.path.exists("makefile_test_a.c"):
> +            os.remove("makefile_test_a.c")
> +        if os.path.exists("makefile_test_b.c"):
> +            os.remove("makefile_test_b.c")
> +        if os.path.exists("makefile_test.a"):
> +            os.remove("makefile_test.a")
> +
> +        if status != 0:
> +            return "Your version of make 3.82 is broken. Please revert to 3.81 or install a patched version.\n"
> +    return None
> +
> +
>   # Tar version 1.24 and onwards handle overwriting symlinks correctly
>   # but earlier versions do not; this needs to work properly for sstate
>   def check_tar_version(sanity_data, loosever):
> @@ -407,6 +442,10 @@ def check_sanity(sanity_data):
>           messages = messages + 'Please set a MACHINE in your local.conf or environment\n'
>           machinevalid = False
>
> +    makemsg = check_make_version(sanity_data, LooseVersion)
> +    if makemsg:
> +        messages = messages + makemsg
> +
>       tarmsg = check_tar_version(sanity_data, LooseVersion)
>       if tarmsg:
>           messages = messages + tarmsg
>


