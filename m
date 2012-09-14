Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TCYWl-0006Xb-Bx
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 18:13:59 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 Sep 2012 09:01:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,423,1344236400"; d="scan'208";a="222215125"
Received: from unknown (HELO [10.255.13.94]) ([10.255.13.94])
	by fmsmga001.fm.intel.com with ESMTP; 14 Sep 2012 09:00:59 -0700
Message-ID: <505354BB.1010705@linux.intel.com>
Date: Fri, 14 Sep 2012 09:00:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <1347451098-16659-1-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1347451098-16659-1-git-send-email-constantinx.musca@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] patch.bbclass: Use one TMPDIR per patching process
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Sep 2012 16:13:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2012 04:58 AM, Constantin Musca wrote:
> We must use one TMPDIR per process (/tmp/${PID}) so that the patching
> processes don't generate the same temp file name (the "patch" program
> uses the TMPDIR environment variable for deciding where to create the
> temp files).
>
> [YOCTO #3070]
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>   meta/classes/patch.bbclass |   11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
> index a724972..d010438 100644
> --- a/meta/classes/patch.bbclass
> +++ b/meta/classes/patch.bbclass
> @@ -139,6 +139,13 @@ python patch_do_patch() {
>       path = os.getenv('PATH')
>       os.putenv('PATH', d.getVar('PATH', True))
>
> +    import shutil
> +    process_tmpdir = os.path.join('/tmp', str(os.getpid()))
> +    if os.path.exists(process_tmpdir):
> +        shutil.rmtree(process_tmpdir)
> +    os.makedirs(process_tmpdir)
> +    os.environ['TMPDIR'] = process_tmpdir
> +
>       for patch in src_patches(d):
>           _, _, local, _, _, parm = bb.decodeurl(patch)
>   On 09/12/2012 04:58 AM, Constantin Musca wrote:> We must use one TMPDIR per process (/tmp/${PID}) so that the patching
> processes don't generate the same temp file name (the "patch" program
> uses the TMPDIR environment variable for deciding where to create the
> temp files).
>
> [YOCTO #3070]
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>   meta/classes/patch.bbclass |   11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
> index a724972..d010438 100644
> --- a/meta/classes/patch.bbclass
> +++ b/meta/classes/patch.bbclass
> @@ -139,6 +139,13 @@ python patch_do_patch() {
>       path = os.getenv('PATH')
>       os.putenv('PATH', d.getVar('PATH', True))
>
> +    import shutil
> +    process_tmpdir = os.path.join('/tmp', str(os.getpid()))
> +    if os.path.exists(process_tmpdir):
> +        shutil.rmtree(process_tmpdir)
> +    os.makedirs(process_tmpdir)
> +    os.environ['TMPDIR'] = process_tmpdir
> +
>       for patch in src_patches(d):
>           _, _, local, _, _, parm = bb.decodeurl(patch)
>
> @@ -161,11 +168,15 @@ python patch_do_patch() {
>           try:
>               patchset.Import({"file":local, "strippath": parm['striplevel']}, True)
>           except Exception as exc:
> +            shutil.rmtree(process_tmpdir)
>               bb.fatal(str(exc))
>           try:
>               resolver.Resolve()
>           except bb.BBHandledException as e:
> +            shutil.rmtree(process_tmpdir)
>               bb.fatal(str(e))
> +
> +    shutil.rmtree(process_tmpdir)
>   }
>   patch_do_patch[vardepsexclude] = "PATCHRESOLVE"
>
>

This initial version was merged into OE-Core

Thanks
	Sau!

> @@ -161,11 +168,15 @@ python patch_do_patch() {
>           try:
>               patchset.Import({"file":local, "strippath": parm['striplevel']}, True)
>           except Exception as exc:
> +            shutil.rmtree(process_tmpdir)
>               bb.fatal(str(exc))
>           try:
>               resolver.Resolve()
>           except bb.BBHandledException as e:
> +            shutil.rmtree(process_tmpdir)
>               bb.fatal(str(e))
> +
> +    shutil.rmtree(process_tmpdir)
>   }
>   patch_do_patch[vardepsexclude] = "PATCHRESOLVE"
>
>


