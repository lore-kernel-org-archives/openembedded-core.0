Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 42F456F718
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 03:00:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2R30RkA011423
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 20:00:27 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Wed, 26 Mar 2014 20:00:27 -0700
Message-ID: <53339463.7020209@windriver.com>
Date: Thu, 27 Mar 2014 11:00:51 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1389147012.git.Qi.Chen@windriver.com>
	<3773149379f857be55c29570c664603f189833d2.1389147012.git.Qi.Chen@windriver.com>
In-Reply-To: <3773149379f857be55c29570c664603f189833d2.1389147012.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH V3 1/1] sanity.bbclass: check for validity of TMPDIR
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
X-List-Received-Date: Thu, 27 Mar 2014 03:00:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping

Any comment on this one?

//Chen Qi

On 01/08/2014 10:12 AM, Chen Qi wrote:
> TMPDIR must be an absolute path, otherwise, the build will fail.
> Special characters and trailing slashes in TMPDIR will also cause
> build failures.
>
> This patch enables checking for the validity of TMPDIR.
>
> The logic in sanity.bbclass has also been changed a little bit. For now,
> we only create the directory hierarch for TMPDIR if TMPDIR is valid. And
> also, we only handle ABI version change only if the TMPDIR directory hierarchy
> has been created.
>
> [YOCTO #5690]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/classes/sanity.bbclass |   27 +++++++++++++++++++++++----
>   1 file changed, 23 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 8531df1..a8742ee 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -666,6 +666,16 @@ def check_sanity_everybuild(status, d):
>       if oeroot.find(' ') != -1:
>           status.addresult("Error, you have a space in your COREBASE directory path. Please move the installation to a directory which doesn't include a space since autotools doesn't support this.")
>   
> +    # Function to check if TMPDIR contains invalid characters, and check if it is an absolute path
> +    def is_tmpdir_valid(path):
> +        import re
> +        valid_tmpdir_regexp = "^/[a-zA-Z0-9\-_/.~]*[a-zA-Z0-9\-_.~]$"
> +        valid_pattern = re.compile(valid_tmpdir_regexp)
> +        if valid_pattern.match(path):
> +            return True
> +        else:
> +            return False
> +
>       # Check that TMPDIR hasn't changed location since the last time we were run
>       tmpdir = d.getVar('TMPDIR', True)
>       checkfile = os.path.join(tmpdir, "saved_tmpdir")
> @@ -674,10 +684,16 @@ def check_sanity_everybuild(status, d):
>               saved_tmpdir = f.read().strip()
>               if (saved_tmpdir != tmpdir):
>                   status.addresult("Error, TMPDIR has changed location. You need to either move it back to %s or rebuild\n" % saved_tmpdir)
> +            if not is_tmpdir_valid(tmpdir):
> +                status.addresult("Error, you an invalid TMPDIR path. The TMPDIR must be an absolute path with no special characters and no trailing slashes.")
>       else:
> -        bb.utils.mkdirhier(tmpdir)
> -        with open(checkfile, "w") as f:
> -            f.write(tmpdir)
> +        if not is_tmpdir_valid(tmpdir):
> +            status.addresult("Error, you an invalid TMPDIR path. The TMPDIR must be an absolute path with no special characters and no trailing slashes.")
> +        else:
> +            # Make directory hierarchy for TMPDIR only if TMPDIR is valid
> +            bb.utils.mkdirhier(tmpdir)
> +            with open(checkfile, "w") as f:
> +                f.write(tmpdir)
>   
>   def check_sanity(sanity_data):
>       import subprocess
> @@ -729,7 +745,10 @@ def check_sanity(sanity_data):
>               f.write("TMPDIR %s\n" % tmpdir)
>               f.write("SSTATE_DIR %s\n" % sstate_dir)
>   
> -    sanity_handle_abichanges(status, sanity_data)
> +    # Handle ABI version change only if TMPDIR hierarchy has been created
> +    saved_tmpdir = os.path.join(tmpdir, "saved_tmpdir")
> +    if os.path.exists(saved_tmpdir):
> +        sanity_handle_abichanges(status, sanity_data)
>   
>       if status.messages != "":
>           raise_sanity_error(sanity_data.expand(status.messages), sanity_data, status.network_error)


