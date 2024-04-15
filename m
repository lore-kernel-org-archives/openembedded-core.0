Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7192CC4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 11:07:37 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.18266.1713179249054621456
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 04:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout10.t-online.de (Postfix) with SMTP id 8B1FE2D8F;
	Mon, 15 Apr 2024 13:07:27 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.43.130]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rwKBJ-379kxs0; Mon, 15 Apr 2024 13:07:25 +0200
Date: Mon, 15 Apr 2024 13:07:46 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][oe-core][PATCHv2 1/2] libei: import recipe from meta-oe
To: Markus Volk <f_l_k@t-online.de>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <YKDZBS.QFD0S4Q09SWT@t-online.de>
In-Reply-To: <17C66EFC7A908A1D.10598@lists.openembedded.org>
References: <17C66EFC7A908A1D.10598@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-49gcmafP3JJpBRxTPgM5"
X-TOI-EXPURGATEID: 150726::1713179245-2B7FDD65-CE94254A/0/0 CLEAN NORMAL
X-TOI-MSGID: 4c85f6aa-7ed8-49ff-ae93-ee28f87b0e5a
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 11:07:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198231

--=-49gcmafP3JJpBRxTPgM5
Content-Type: text/plain; charset=us-ascii; format=flowed

One thing I have just seen. If not using systemd the libei recipe will 
depend on the external sd-bus library 'basu' which
is also not available in oe-core. How do you want to deal with this?

Also include basu or make this recipe systemd only by default?


On Mon, Apr 15 2024 at 12:59:10 PM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> Libei has been the multi-year effort by Red Hat's Peter Hutterer on 
> emulated
> input handling for Wayland. Libei consists of a client side library 
> and EIS
> as the "Emulated Input Server" for this Wayland-focused emulated 
> input device
> solution.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta/recipes-graphics/wayland/libei_1.2.1.bb | 25 
> ++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta/recipes-graphics/wayland/libei_1.2.1.bb
> 
> diff --git a/meta/recipes-graphics/wayland/libei_1.2.1.bb 
> b/meta/recipes-graphics/wayland/libei_1.2.1.bb
> new file mode 100644
> index 0000000000..807dcea1ed
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/libei_1.2.1.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "libei is a library for Emulated Input, primarily aimed at 
> the Wayland stack."
> +HOMEPAGE = "<https://gitlab.freedesktop.org/libinput/libei>"
> +SECTION = "graphics"
> +LICENSE = "MIT"
> +
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=a98fa76460f96f41696611d6f07e8d49" 
> <file://copying;md5=a98fa76460f96f41696611d6f07e8d49/>
> +
> +DEPENDS = " \
> +	libxkbcommon \
> +	libevdev \
> +	libxslt-native \
> +	python3-attrs-native \
> +	python3-jinja2-native \
> +	${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'systemd', 
> 'systemd', 'basu', d)} \
> +"
> +
> +SRC_URI = 
> "git://gitlab.freedesktop.org/libinput/libei.git;protocol=https;branch=main"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "08f1d41085a6ae4bac7bc52abe2955d3354342cb"
> +
> +inherit meson pkgconfig
> +
> +EXTRA_OEMESON = "-Dtests=disabled"
> +
> --
> 2.44.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198228): 
> <https://lists.openembedded.org/g/openembedded-core/message/198228>
> Mute This Topic: <https://lists.openembedded.org/mt/105533281/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-49gcmafP3JJpBRxTPgM5
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>One thing I have just seen. If not using systemd the libei recipe will depend on the external sd-bus library 'basu' which</div><div>is also not available in oe-core. How do you want to deal with this?</div><div><br></div><div>Also include basu or make this recipe systemd only by default?</div><div><br></div></div><div id="geary-quote" dir="auto"><br>On Mon, Apr 15 2024 at 12:59:10 PM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Libei has been the multi-year effort by Red Hat's Peter Hutterer on emulated
input handling for Wayland. Libei consists of a client side library and EIS
as the "Emulated Input Server" for this Wayland-focused emulated input device
solution.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta/recipes-graphics/wayland/libei_1.2.1.bb | 25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/libei_1.2.1.bb

diff --git a/meta/recipes-graphics/wayland/libei_1.2.1.bb b/meta/recipes-graphics/wayland/libei_1.2.1.bb
new file mode 100644
index 0000000000..807dcea1ed
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libei_1.2.1.bb
@@ -0,0 +1,25 @@
+SUMMARY = "libei is a library for Emulated Input, primarily aimed at the Wayland stack."
+HOMEPAGE = "<a href="https://gitlab.freedesktop.org/libinput/libei">https://gitlab.freedesktop.org/libinput/libei</a>"
+SECTION = "graphics"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=a98fa76460f96f41696611d6f07e8d49" "="">file://COPYING;md5=a98fa76460f96f41696611d6f07e8d49"</a>
+
+DEPENDS = " \
+	libxkbcommon \
+	libevdev \
+	libxslt-native \
+	python3-attrs-native \
+	python3-jinja2-native \
+	<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'systemd', 'systemd', 'basu', d)} \
+"
+
+SRC_URI = "git://gitlab.freedesktop.org/libinput/libei.git;protocol=https;branch=main"
+
+S = "${WORKDIR}/git"
+SRCREV = "08f1d41085a6ae4bac7bc52abe2955d3354342cb"
+
+inherit meson pkgconfig
+
+EXTRA_OEMESON = "-Dtests=disabled"
+
<div>-- 
</div>2.44.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#198228): <a href="https://lists.openembedded.org/g/openembedded-core/message/198228">https://lists.openembedded.org/g/openembedded-core/message/198228</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/105533281/3618223">https://lists.openembedded.org/mt/105533281/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-49gcmafP3JJpBRxTPgM5--


