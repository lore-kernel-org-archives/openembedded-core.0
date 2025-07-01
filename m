Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6196C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 21:56:18 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.9271.1751406977868528386
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 14:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout04.t-online.de (Postfix) with SMTP id 7066CE55E
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jul 2025 23:56:07 +0200 (CEST)
Received: from [192.168.178.20] ([84.154.169.229]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uWixR-2JUEFc0; Tue, 1 Jul 2025 23:56:05 +0200
Date: Tue, 01 Jul 2025 23:56:00 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv4] tcl: fix tclConfig.sh after UNPACKDIR change
To: openembedded-core@lists.openembedded.org
Message-Id: <C9QQYS.9N0CDQP1HCZR2@t-online.de>
In-Reply-To: <184E3F4A84F5C74E.30429@lists.openembedded.org>
References: <184E3F4A84F5C74E.30429@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-U2FGifQa6xTwGs7fygSX"
X-TOI-EXPURGATEID: 150726::1751406965-1BFF5538-69DE399B/0/0 CLEAN NORMAL
X-TOI-MSGID: 1a6daf76-43c9-4e52-b18f-4bf5a40d321c
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 21:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219734

--=-U2FGifQa6xTwGs7fygSX
Content-Type: text/plain; charset=us-ascii; format=flowed

v4: mention what the second sed command does

On Tue, Jul 1 2025 at 23:54:34 +02:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> Adapt the  sed command that edits TCL_SRC_DIR in tclConfig.sh
> This is needed so that tk in meta-oe is capable of reading
> the required header file
> 
> Remove buildpath from TCL_BUILD_STUB_LIB_PATH in tclConfig.sh
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta/recipes-devtools/tcltk/tcl_9.0.1.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb 
> b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
> index 70aa9b606c..765dc64e4d 100644
> --- a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
> +++ b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
> @@ -51,7 +51,7 @@ do_install() {
>  	ln -sf ./tclsh${VER} ${D}${bindir}/tclsh
>  	ln -sf tclsh9.0 ${D}${bindir}/tclsh${VER}
>  	sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tclConfig.sh
> -	sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tclConfig.sh
> +	sed -i "s;'${UNPACKDIR};'${STAGING_INCDIR};g" tclConfig.sh
>  	install -d ${D}${bindir_crossscripts}
>  	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
>  	install -m 0755 tclConfig.sh ${D}${libdir}
> @@ -105,6 +105,7 @@ tcl_package_preprocess() {
>  	       -e "s;-L${STAGING_LIBDIR};-L${libdir};g" \
>  	       -e "s;${STAGING_INCDIR};${includedir};g" \
>  	       -e "s;--sysroot=${RECIPE_SYSROOT};;g" \
> +	       -e "s;${B};${libdir};g" ${PKGD}${libdir}/tclConfig.sh \
>  	       ${PKGD}${libdir}/tclConfig.sh
> 
>  	rm -f ${PKGD}${bindir_crossscripts}/tclConfig.sh
> --
> 2.49.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219733): 
> <https://lists.openembedded.org/g/openembedded-core/message/219733>
> Mute This Topic: <https://lists.openembedded.org/mt/113937966/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-U2FGifQa6xTwGs7fygSX
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v4: mention what the second sed command does</div></div><div id="geary-quote" dir="auto"><br>On Tue, Jul 1 2025 at 23:54:34 +02:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Adapt the  sed command that edits TCL_SRC_DIR in tclConfig.sh
This is needed so that tk in meta-oe is capable of reading
the required header file

Remove buildpath from TCL_BUILD_STUB_LIB_PATH in tclConfig.sh

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta/recipes-devtools/tcltk/tcl_9.0.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
index 70aa9b606c..765dc64e4d 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.1.bb
@@ -51,7 +51,7 @@ do_install() {
 	ln -sf ./tclsh${VER} ${D}${bindir}/tclsh
 	ln -sf tclsh9.0 ${D}${bindir}/tclsh${VER}
 	sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tclConfig.sh
-	sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tclConfig.sh
+	sed -i "s;'${UNPACKDIR};'${STAGING_INCDIR};g" tclConfig.sh
 	install -d ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
 	install -m 0755 tclConfig.sh ${D}${libdir}
@@ -105,6 +105,7 @@ tcl_package_preprocess() {
 	       -e "s;-L${STAGING_LIBDIR};-L${libdir};g" \
 	       -e "s;${STAGING_INCDIR};${includedir};g" \
 	       -e "s;--sysroot=${RECIPE_SYSROOT};;g" \
+	       -e "s;${B};${libdir};g" ${PKGD}${libdir}/tclConfig.sh \
 	       ${PKGD}${libdir}/tclConfig.sh
 
 	rm -f ${PKGD}${bindir_crossscripts}/tclConfig.sh
<div>-- 
</div>2.49.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#219733): <a href="https://lists.openembedded.org/g/openembedded-core/message/219733">https://lists.openembedded.org/g/openembedded-core/message/219733</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/113937966/3618223">https://lists.openembedded.org/mt/113937966/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-U2FGifQa6xTwGs7fygSX--


