Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9687C982C9
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 19:32:06 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23475.1789587123919187983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 12:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=eskrKXyh;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout10.t-online.de (Postfix) with SMTP id 0B57237FD3
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 21:32:02 +0200 (CEST)
Received: from [192.168.178.36] ([84.163.32.21]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6vMM-1b0Ql60; Wed, 16 Sep 2026 21:31:58 +0200
Date: Wed, 16 Sep 2026 21:31:53 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] kernel-module-split: don't re-sign compressed
 kernel modules
To: openembedded-core@lists.openembedded.org
Message-Id: <592HLT.02695VONGXT8@t-online.de>
In-Reply-To: <18D5E3F31DB4B630.1924412@lists.openembedded.org>
References: <18D5E3F31DB4B630.1924412@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-8FIIJVZVXJhrG1F8Z+8c"
X-TOI-EXPURGATEID: 150726::1789587118-067FB83F-CDCAD4FB/0/0 CLEAN NORMAL
X-TOI-MSGID: 087eb622-4b55-4282-a7d1-9bd66bf379d2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789587121; i=f_l_k@t-online.de;
	bh=vd9QmGDfMQ9zTiJtgenz09AZpEyROs53Kv5teydzWAI=;
	h=Date:From:Subject:To:In-Reply-To:References;
	b=eskrKXyhxQpCAWX5HCI22yfzG7EdsoPTyF/zFaN1J0OoyF3vPV3BVB/xdFKv++gCg
	 S5O/ayRIXQ1SfoVGqES3hyrbX8dxeAdHTeCEeDjPYPWHwXPvDMNk99uD9i+rvaaWOu
	 fTZO3CLl+/RbvyEGiXOBWe1kvy2OHYdyGhwcp7e3y90VYb6RE6KeVDrqdnrAmc2IXq
	 tNJB8d3ZtjdGLsD+NK4dTndxViFNXV5Z2cw5qmFf0ZV3g3GdXQMZ46NH+JV6/hjKhY
	 PlmreNXDjTHzLG/JCg9pveKrGJV3fQUHM+XDP3VgMvdmvz1Oa0tIC/TVnmtx7Jw2VK
	 Scf9DgpnQQ1Rg==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 19:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245996

--=-8FIIJVZVXJhrG1F8Z+8c
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: added Signed-off-by

On Wed, Sep 16 2026 at 21:30:51 +02:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> With CONFIG_MODULE_COMPRESS_ALL the kernel installs modules with a
> compression suffix, and scripts/Makefile.modinst derives the 
> compressed
> file from the signed uncompressed one, which is removed afterwards.
> The modules_sign target then has nothing to sign below ${PKGD} and
> do_package fails in sign-file with an openssl "no such file" error.
> 
> Re-signing is not needed there either: compressed modules are not ELF
> files, so package stripping leaves them alone and the signature made
> during modules_install is still valid.
> 
> Found on a raspberrypi4-64 kernel, which enables both MODULE_SIG_ALL
> and MODULE_COMPRESS_XZ. Tested by building linux-raspberrypi through
> do_package, which now packages 1861 signed .ko.xz modules.
> 
> AI-Generated: Uses Claude Code
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta/classes-recipe/kernel-module-split.bbclass | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes-recipe/kernel-module-split.bbclass 
> b/meta/classes-recipe/kernel-module-split.bbclass
> index 99c2d12962..9a7f04f37b 100644
> --- a/meta/classes-recipe/kernel-module-split.bbclass
> +++ b/meta/classes-recipe/kernel-module-split.bbclass
> @@ -53,8 +53,15 @@ post_strip_kernel_modules_signing(){
>      is_modules="$(${STAGING_KERNEL_DIR}/scripts/config --file 
> ${KBUILD_OUTPUT}/.config --state MODULES)"
>      is_module_sig="$(${STAGING_KERNEL_DIR}/scripts/config --file 
> ${KBUILD_OUTPUT}/.config --state MODULE_SIG)"
>      is_module_sig_all="$(${STAGING_KERNEL_DIR}/scripts/config --file 
> ${KBUILD_OUTPUT}/.config --state MODULE_SIG_ALL)"
> -
> -    if [ "$is_modules" = "y" ] && [ "$is_module_sig" = "y" ] && [ 
> "$is_module_sig_all" = "y" ]; then
> +    is_module_compress_all="$(${STAGING_KERNEL_DIR}/scripts/config 
> --file ${KBUILD_OUTPUT}/.config --state MODULE_COMPRESS_ALL)"
> +
> +    # Compressed modules are not ELF files, so package stripping 
> leaves them
> +    # untouched and the signature made during modules_install is 
> still valid.
> +    # Re-signing them is not only unnecessary but fails: with
> +    # CONFIG_MODULE_COMPRESS_ALL the install targets carry the 
> compression
> +    # suffix, and the uncompressed module their rule depends on does 
> not
> +    # exist below ${PKGD}.
> +    if [ "$is_modules" = "y" ] && [ "$is_module_sig" = "y" ] && [ 
> "$is_module_sig_all" = "y" ] && [ "$is_module_compress_all" != "y" ]; 
> then
>          # Sign modules under ${PKGD}, with M= if out-of-tree module.
>          # Out-of-tree module Makefiles invoke the kernel Makefile by 
> appending M= (the module directory) to MAKEFLAGS.
>          # However, they usually do not provide a modules_sign 
> target. Therefore, the kernel modules_sign target has to
> --
> 2.55.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#245995): 
> <https://lists.openembedded.org/g/openembedded-core/message/245995>
> Mute This Topic: <https://lists.openembedded.org/mt/121284810/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-8FIIJVZVXJhrG1F8Z+8c
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2: added Signed-off-by</div></div><div id="geary-quote" dir="auto"><br>On Wed, Sep 16 2026 at 21:30:51 +02:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">With CONFIG_MODULE_COMPRESS_ALL the kernel installs modules with a
compression suffix, and scripts/Makefile.modinst derives the compressed
file from the signed uncompressed one, which is removed afterwards.
The modules_sign target then has nothing to sign below ${PKGD} and
do_package fails in sign-file with an openssl "no such file" error.

Re-signing is not needed there either: compressed modules are not ELF
files, so package stripping leaves them alone and the signature made
during modules_install is still valid.

Found on a raspberrypi4-64 kernel, which enables both MODULE_SIG_ALL
and MODULE_COMPRESS_XZ. Tested by building linux-raspberrypi through
do_package, which now packages 1861 signed .ko.xz modules.

AI-Generated: Uses Claude Code
Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta/classes-recipe/kernel-module-split.bbclass | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index 99c2d12962..9a7f04f37b 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -53,8 +53,15 @@ post_strip_kernel_modules_signing(){
     is_modules="$(${STAGING_KERNEL_DIR}/scripts/config --file ${KBUILD_OUTPUT}/.config --state MODULES)"
     is_module_sig="$(${STAGING_KERNEL_DIR}/scripts/config --file ${KBUILD_OUTPUT}/.config --state MODULE_SIG)"
     is_module_sig_all="$(${STAGING_KERNEL_DIR}/scripts/config --file ${KBUILD_OUTPUT}/.config --state MODULE_SIG_ALL)"
-
-    if [ "$is_modules" = "y" ] &amp;&amp; [ "$is_module_sig" = "y" ] &amp;&amp; [ "$is_module_sig_all" = "y" ]; then
+    is_module_compress_all="$(${STAGING_KERNEL_DIR}/scripts/config --file ${KBUILD_OUTPUT}/.config --state MODULE_COMPRESS_ALL)"
+
+    # Compressed modules are not ELF files, so package stripping leaves them
+    # untouched and the signature made during modules_install is still valid.
+    # Re-signing them is not only unnecessary but fails: with
+    # CONFIG_MODULE_COMPRESS_ALL the install targets carry the compression
+    # suffix, and the uncompressed module their rule depends on does not
+    # exist below ${PKGD}.
+    if [ "$is_modules" = "y" ] &amp;&amp; [ "$is_module_sig" = "y" ] &amp;&amp; [ "$is_module_sig_all" = "y" ] &amp;&amp; [ "$is_module_compress_all" != "y" ]; then
         # Sign modules under ${PKGD}, with M= if out-of-tree module.
         # Out-of-tree module Makefiles invoke the kernel Makefile by appending M= (the module directory) to MAKEFLAGS.
         # However, they usually do not provide a modules_sign target. Therefore, the kernel modules_sign target has to
<div>-- 
</div>2.55.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#245995): <a href="https://lists.openembedded.org/g/openembedded-core/message/245995">https://lists.openembedded.org/g/openembedded-core/message/245995</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/121284810/3618223">https://lists.openembedded.org/mt/121284810/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-8FIIJVZVXJhrG1F8Z+8c--


