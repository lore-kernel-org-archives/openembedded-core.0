Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DB16960030
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 17:25:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB3HP8ep017226
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Dec 2014 09:25:08 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Wed, 3 Dec 2014 09:25:07 -0800
Message-ID: <547F4773.9020006@windriver.com>
Date: Wed, 3 Dec 2014 11:25:07 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1417623235.git.alejandro.hernandez@linux.intel.com>
	<8d53e3e985f526e6c845328dc6bfa9c27cc63413.1417623235.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <8d53e3e985f526e6c845328dc6bfa9c27cc63413.1417623235.git.alejandro.hernandez@linux.intel.com>
Subject: Re: [PATCH 1/1] insane.bbclass: Added QA test for unexpanded ${D}
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
X-List-Received-Date: Wed, 03 Dec 2014 17:25:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/3/14, 11:00 AM, Alejandro Hernandez wrote:
> Checks in FILES and pkg_* variables ,solves common mistake
> of using ${D} instead of $D and warns the user accordingly.
>
> [YOCTO #6642]
>
> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> ---
>   meta/classes/insane.bbclass | 34 +++++++++++++++++++++++++++++++++-
>   1 file changed, 33 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 0b45374..419c89b 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -906,6 +906,39 @@ def package_qa_check_deps(pkg, pkgdest, skip, d):
>
>       return sane
>
> +def package_qa_check_unexpanded_d(d):
> +    """
> +    Check for unexpanded D variable in pkg_* and FILES
> +    variables, warn the user to use it correctly.
> +    """
> +
> +    sane = True
> +
> +    # Get variables for current package
> +    pkg = d.getVar('PN', True)
> +    localdata = bb.data.createCopy(d)
> +    localdata.setVar('OVERRIDES', pkg)
> +    bb.data.update_data(localdata)
> +
> +    # Go through all variables and check if unexpanded D is found, warn the user accordingly
> +    for var in 'FILES','pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm':
> +        bbvar = localdata.getVar(var, False)
> +        if bbvar:
> +            if "${D}" in bbvar:
> +                if var == 'FILES':
> +                    bb.error("FILES should not contain the ${D} variable as it references the local build directory not the target filesystem, best solution is to remove the ${D} reference")
> +                    sane = False
> +                else:
> +                    bb.error("%s in %s recipe contains ${D}, it should be replaced by $D instead" % (var, pkg))
> +                    sane = False
> +    return sane
> +
> +# Actual task to check for ${D
> +python do_qa_check_unexpanded_d(){
> +    package_qa_check_unexpanded_d(d)
> +}
> +addtask qa_check_unexpanded_d before do_compile
> +

would it make more sense to have a qa check -before- compile, then add this to 
that task.. and then have one (current place) after install?

That way we could add additional checks (as needed) for things that are 
setup/confgiured incorrectly.. and checks for the build/install stuff..

--Mark

>   # The PACKAGE FUNC to scan each package
>   python do_package_qa () {
>       import subprocess
> @@ -1000,7 +1033,6 @@ python do_package_qa () {
>           if not package_qa_check_deps(package, pkgdest, skip, d):
>               deps_sane = False
>
> -
>       if 'libdir' in d.getVar("ALL_QA", True).split():
>           package_qa_check_libdir(d)
>
>


