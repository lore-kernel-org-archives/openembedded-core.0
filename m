Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ss4TY-0000Pk-LG
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 06:06:00 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jul 2012 20:54:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181037096"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2012 20:54:36 -0700
Message-ID: <5008D67C.6020509@linux.intel.com>
Date: Thu, 19 Jul 2012 20:54:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20120717141241.GA21603@windriver.com> <5890853.sDQ4cHnidx@helios>
	<20120717143034.GA21707@windriver.com>
In-Reply-To: <20120717143034.GA21707@windriver.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] busybox: busybox wget -P option ignored
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jul 2012 04:06:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2012 07:30 AM, Amy Fong wrote:
> busybox wget testing fails
>
> In cases where busybox wget is invoked with -P <...> and the url ends
> in "/", the download directory is ignored (ie the file index.html is
> implied), this change enables the -P option for those urls.
>
> Signed-off-by: Amy Fong <amy.fong@windriver.com>
> ---
>   busybox-1.19.4/wget_dl_dir_fix.patch |   30 ++++++++++++++++++++++++++++++
>   busybox_1.19.4.bb                    |    3 ++-
>   2 files changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/busybox/busybox-1.19.4/wget_dl_dir_fix.patch b/meta/recipes-core/busybox/busybox-1.19.4/wget_dl_dir_fix.patch
> new file mode 100644
> index 0000000..3003965
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox-1.19.4/wget_dl_dir_fix.patch
> @@ -0,0 +1,30 @@
> +In cases where busybox wget is invoked with -P <...> and the url ends
> +in "/", the download directory is ignored (ie the file index.html is
> +implied), this change enables the -P option for those urls.
> +
> +Signed-off-by: Amy Fong <amy.fong@windriver.com>
> +Upstream-Status: Submitted
> +---
> + networking/wget.c |   10 +++++++---
> + 1 file changed, 7 insertions(+), 3 deletions(-)
> +
> +--- a/networking/wget.c
> ++++ b/networking/wget.c
> +@@ -589,10 +589,14 @@
> + 	if (!(option_mask32 & WGET_OPT_OUTNAME)) {
> + 		G.fname_out = bb_get_last_path_component_nostrip(target.path);
> + 		/* handle "wget http://kernel.org//" */
> +-		if (G.fname_out[0] == '/' || !G.fname_out[0])
> +-			G.fname_out = (char*)"index.html";
> ++		if (G.fname_out[0] == '/' || !G.fname_out[0]) {
> ++			/* bug: if we provide a default name, we should still look at -P option */
> ++			if (G.dir_prefix)
> ++				G.fname_out = fname_out_alloc = concat_path_file(G.dir_prefix, "index.html");
> ++			else
> ++				G.fname_out = (char*)"index.html";
> + 		/* -P DIR is considered only if there was no -O FILE */
> +-		else {
> ++		} else {
> + 			if (G.dir_prefix)
> + 				G.fname_out = fname_out_alloc = concat_path_file(G.dir_prefix, G.fname_out);
> + 			else {
> diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.19.4.bb
> index 5b3f356..8a06497 100644
> --- a/meta/recipes-core/busybox/busybox_1.19.4.bb
> +++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
> @@ -1,5 +1,5 @@
>   require busybox.inc
> -PR = "r7"
> +PR = "r8"
>
>   SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://B921600.patch \
> @@ -8,6 +8,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://run-parts.in.usr-bin.patch \
>              file://watch.in.usr-bin.patch \
>              file://busybox-udhcpc-no_deconfig.patch \
> +           file://wget_dl_dir_fix.patch \
>              file://find-touchscreen.sh \
>              file://busybox-cron \
>              file://busybox-httpd \
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

Merged into OE-Core

Thanks
	Sau!


