Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TDL5W-0000G3-AL
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Sep 2012 22:05:06 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Sep 2012 12:52:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,431,1344236400"; d="scan'208";a="145682424"
Received: from unknown (HELO [10.255.13.185]) ([10.255.13.185])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Sep 2012 12:52:26 -0700
Message-ID: <50562DFA.6010508@linux.intel.com>
Date: Sun, 16 Sep 2012 12:52:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <1347632702-16313-1-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1347632702-16313-1-git-send-email-constantinx.musca@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4] patch.bbclass: increase security
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
X-List-Received-Date: Sun, 16 Sep 2012 20:05:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/14/2012 07:25 AM, Constantin Musca wrote:
> - Use mkdtemp for generating temp dir names
> - Use bb.utils.remove for removing temp dirs
> - Add comment for explaining the "patch" workaround
>
> [YOCTO #3070]
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>   meta/classes/patch.bbclass |   16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
> index d010438..ed12802 100644
> --- a/meta/classes/patch.bbclass
> +++ b/meta/classes/patch.bbclass
> @@ -139,11 +139,11 @@ python patch_do_patch() {
>       path = os.getenv('PATH')
>       os.putenv('PATH', d.getVar('PATH', True))
>
> -    import shutil
> -    process_tmpdir = os.path.join('/tmp', str(os.getpid()))
> -    if os.path.exists(process_tmpdir):
> -        shutil.rmtree(process_tmpdir)
> -    os.makedirs(process_tmpdir)
> +    # We must use one TMPDIR per process so that the "patch" processes
> +    # don't generate the same temp file name.
> +
> +    import tempfile
> +    process_tmpdir = tempfile.mkdtemp()
>       os.environ['TMPDIR'] = process_tmpdir
>
>       for patch in src_patches(d):
> @@ -168,15 +168,15 @@ python patch_do_patch() {
>           try:
>               patchset.Import({"file":local, "strippath": parm['striplevel']}, True)
>           except Exception as exc:
> -            shutil.rmtree(process_tmpdir)
> +            bb.utils.remove(process_tmpdir, True)
>               bb.fatal(str(exc))
>           try:
>               resolver.Resolve()
>           except bb.BBHandledException as e:
> -            shutil.rmtree(process_tmpdir)
> +            bb.utils.remove(process_tmpdir, True)
>               bb.fatal(str(e))
>
> -    shutil.rmtree(process_tmpdir)
> +    bb.utils.remove(process_tmpdir, True)
>   }
>   patch_do_patch[vardepsexclude] = "PATCHRESOLVE"
>
>
Merged into OE-Core

Thanks
	Sau!



