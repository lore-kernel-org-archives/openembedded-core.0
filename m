Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C9D247622A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 20:49:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jul 2015 13:49:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,572,1432623600"; d="scan'208";a="773831948"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO [10.252.9.176])
	([10.252.9.176])
	by orsmga002.jf.intel.com with ESMTP; 29 Jul 2015 13:49:39 -0700
Message-ID: <1438202978.10150.16.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: Yuqing Zhu <b54851@freescale.com>
Date: Wed, 29 Jul 2015 23:49:38 +0300
In-Reply-To: <1438213787-19374-2-git-send-email-b54851@freescale.com>
References: <1438213787-19374-1-git-send-email-b54851@freescale.com>
	<1438213787-19374-2-git-send-email-b54851@freescale.com>
Organization: Intel Finland Oy - BIC 0357606-4 - PL 281, 00181 Helsinki
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [poky][PATCH v4] pulseaudio: revert commit 42156d2b5ac797e5f28f8d0d38b691053f3f6fc7
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
X-List-Received-Date: Wed, 29 Jul 2015 20:49:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-07-30 at 07:49 +0800, Yuqing Zhu wrote:
> Revert "launch: Avoid specifically starting PA and rely on autospawn/socket activation"
> or the pulseaudio can't be opened in yocto.
> 
> Signed-off-by: Yuqing Zhu <b54851@freescale.com>
> ---
>  ...ch-Avoid-specifically-starting-PA-and-rel.patch | 31 ++++++++++++++++++++++
>  .../pulseaudio/pulseaudio_6.0.bb                   |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0002-Revert-launch-Avoid-specifically-starting-PA-and-rel.patch
> 
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-Revert-launch-Avoid-specifically-starting-PA-and-rel.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-Revert-launch-Avoid-specifically-starting-PA-and-rel.patch
> new file mode 100644
> index 0000000..669c355
> --- /dev/null
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-Revert-launch-Avoid-specifically-starting-PA-and-rel.patch
> @@ -0,0 +1,31 @@
> +From 5760c6b1a3c9b6dd8e70c9d1ea78fcf192250b4a Mon Sep 17 00:00:00 2001
> +From: Shengjiu Wang <shengjiu.wang@freescale.com>
> +Date: Mon, 16 Mar 2015 15:30:11 +0800
> +Subject: [PATCH] Revert "launch: Avoid specifically starting PA and rely on
> + autospawn/socket activation"
> +
> +This reverts commit 42156d2b5ac797e5f28f8d0d38b691053f3f6fc7.
> +
> +Upstream-Status: Pending 
> +
> +Signed-off-by: shengjiu.wang <b02247@freescale.com>
> +---
> + src/daemon/start-pulseaudio-x11.in |    2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/daemon/start-pulseaudio-x11.in b/src/daemon/start-pulseaudio-x11.in
> +index 16e46b1..e108645 100755
> +--- a/src/daemon/start-pulseaudio-x11.in
> ++++ b/src/daemon/start-pulseaudio-x11.in
> +@@ -17,6 +17,8 @@
> + 
> + set -e
> + 
> ++@PA_BINARY@ --start "$@"
> ++
> + if [ x"$DISPLAY" != x ] ; then
> + 
> +     @PACTL_BINARY@ load-module module-x11-publish "display=$DISPLAY" > /dev/null
> +-- 
> +1.7.9.5
> +
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
> index 31e9096..10c3d7a 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
> @@ -6,6 +6,7 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
>             file://0001-conf-parser-add-support-for-.d-directories.patch \
>             file://fix-git-version-gen.patch \
>             file://volatiles.04_pulse \
> +           file://0002-Revert-launch-Avoid-specifically-starting-PA-and-rel.patch \
>  "
>  SRC_URI[md5sum] = "b691e83b7434c678dffacfa3a027750e"
>  SRC_URI[sha256sum] = "b50640e0b80b1607600accfad2e45aabb79d379bf6354c9671efa2065477f6f6"
> -- 
> 1.9.1

This is safe to apply, but I'd like to understand why you think this is
needed. The commit message says that without this patch, "pulseaudio
can't be opened in yocto". PulseAudio works fine in core-image-sato at
least, so what is different in your setup? Have you disabled
autospawning for some reason?

-- 
Tanu


