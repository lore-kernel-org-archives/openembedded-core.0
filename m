Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EFDFC4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 16:34:23 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.207770.1672331661830212988
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 08:34:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout10.t-online.de (Postfix) with SMTP id 9562411D4A;
	Thu, 29 Dec 2022 17:34:19 +0100 (CET)
Received: from [192.168.178.83] ([79.219.226.205]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pAvrG-1UdpZo0; Thu, 29 Dec 2022 17:34:18 +0100
Date: Thu, 29 Dec 2022 17:34:12 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH 08/10] epiphany: update 42.4 -> 43.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	<alex@linutronix.de>
Message-Id: <0DVNNR.Q4CA1GXU22T31@t-online.de>
In-Reply-To: <20221229160110.255775-8-alex@linutronix.de>
References: <20221229160110.255775-1-alex@linutronix.de>
	<20221229160110.255775-8-alex@linutronix.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-1ZL1XKTzcomZ2hRUjhUE"
X-TOI-EXPURGATEID: 150726::1672331658-17FE898D-81C5FA9D/0/0 CLEAN NORMAL
X-TOI-MSGID: d2c26de2-9247-4c2f-8c5f-247df36c9ae1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 16:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175120

--=-1ZL1XKTzcomZ2hRUjhUE
Content-Type: text/plain; charset=us-ascii; format=flowed

By adding gtk-icon-cache to the inherit line gtk+3-native could be 
removed from DEPENDS.

Am Do, 29. Dez 2022 um 17:01:08 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> soup 2.x support has been removed upstream.
> libportal is no longer optional.
> epiphany now also needs some native executables from
> gtk and desktop-file-utils.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de 
> <mailto:alex@linutronix.de>>
> ---
>  .../epiphany/{epiphany_42.4.bb => epiphany_43.0.bb}  | 12 
> +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>  rename meta/recipes-gnome/epiphany/{epiphany_42.4.bb => 
> epiphany_43.0.bb} (78%)
> 
> diff --git a/meta/recipes-gnome/epiphany/epiphany_42.4.bb 
> b/meta/recipes-gnome/epiphany/epiphany_43.0.bb
> similarity index 78%
> rename from meta/recipes-gnome/epiphany/epiphany_42.4.bb
> rename to meta/recipes-gnome/epiphany/epiphany_43.0.bb
> index 0cbe1c9c58..071be328f3 100644
> --- a/meta/recipes-gnome/epiphany/epiphany_42.4.bb
> +++ b/meta/recipes-gnome/epiphany/epiphany_43.0.bb
> @@ -15,8 +15,12 @@ DEPENDS = " \
>            libarchive \
>            libdazzle \
>            libhandy \
> +          libportal \
> +          libsoup \
>            glib-2.0-native \
>            coreutils-native \
> +          gtk+3-native \
> +          desktop-file-utils-native \
>            "
> 
>  GNOMEBASEBUILDCLASS = "meson"
> @@ -28,16 +32,10 @@ SRC_URI = 
> "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
>             file://migrator.patch <file://migrator.patch/> \
>             file://distributor.patch <file://distributor.patch/> \
>             "
> -SRC_URI[archive.sha256sum] = 
> "370938ad2920eeb28bc2435944776b7ba55a0e2ede65836f79818cfb7e8f0860"
> -
> -PACKAGECONFIG_SOUP ?= "soup3"
> -PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
> +SRC_URI[archive.sha256sum] = 
> "b66d499f9ee72696d83cf844125377181a954554a4bb3785b73293380ac0c227"
> 
>  # Developer mode enables debugging
>  PACKAGECONFIG[developer-mode] = 
> "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
> -PACKAGECONFIG[soup2] = 
> "-Dsoup2=enabled,-Dsoup2=disabled,libsoup-2.4,,,soup3"
> -PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
> -PACKAGECONFIG[libportal] = 
> "-Dlibportal=enabled,-Dlibportal=disabled,libportal"
> 
>  FILES:${PN} += "${datadir}/dbus-1 
> ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
>  RDEPENDS:${PN} = "iso-codes adwaita-icon-theme 
> gsettings-desktop-schemas"
> --
> 2.30.2




--=-1ZL1XKTzcomZ2hRUjhUE
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>By adding gtk-icon-cache to the inherit line gtk+3-native could be removed from DEPENDS.</div><div><br></div>Am Do, 29. Dez 2022 um 17:01:08 +0100 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">soup 2.x support has been removed upstream.
libportal is no longer optional.
epiphany now also needs some native executables from
gtk and desktop-file-utils.

Signed-off-by: Alexander Kanavin &lt;<a href="mailto:alex@linutronix.de">alex@linutronix.de</a>&gt;
---
 .../epiphany/{epiphany_42.4.bb =&gt; epiphany_43.0.bb}  | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_42.4.bb =&gt; epiphany_43.0.bb} (78%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_42.4.bb b/meta/recipes-gnome/epiphany/epiphany_43.0.bb
similarity index 78%
rename from meta/recipes-gnome/epiphany/epiphany_42.4.bb
rename to meta/recipes-gnome/epiphany/epiphany_43.0.bb
index 0cbe1c9c58..071be328f3 100644
--- a/meta/recipes-gnome/epiphany/epiphany_42.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_43.0.bb
@@ -15,8 +15,12 @@ DEPENDS = " \
           libarchive \
           libdazzle \
           libhandy \
+          libportal \
+          libsoup \
           glib-2.0-native \
           coreutils-native \
+          gtk+3-native \
+          desktop-file-utils-native \
           "
 
 GNOMEBASEBUILDCLASS = "meson"
@@ -28,16 +32,10 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            <a href="file://migrator.patch">file://migrator.patch</a> \
            <a href="file://distributor.patch">file://distributor.patch</a> \
            "
-SRC_URI[archive.sha256sum] = "370938ad2920eeb28bc2435944776b7ba55a0e2ede65836f79818cfb7e8f0860"
-
-PACKAGECONFIG_SOUP ?= "soup3"
-PACKAGECONFIG ??= "${PACKAGECONFIG_SOUP}"
+SRC_URI[archive.sha256sum] = "b66d499f9ee72696d83cf844125377181a954554a4bb3785b73293380ac0c227"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-PACKAGECONFIG[soup2] = "-Dsoup2=enabled,-Dsoup2=disabled,libsoup-2.4,,,soup3"
-PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
-PACKAGECONFIG[libportal] = "-Dlibportal=enabled,-Dlibportal=disabled,libportal"
 
 FILES:${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS:${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
<div class="geary-signature"><div>-- 
</div>2.30.2</div></div></blockquote><div><br></div><div><br></div></div>
--=-1ZL1XKTzcomZ2hRUjhUE--


