Return-Path: <tanuk@iki.fi>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id C207C606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 00:29:25 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 46CE920585
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 20:20:36 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute3.internal (MEProxy); Tue, 19 Jul 2016 20:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:in-reply-to
	:message-id:references:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=52qa9mAjajrhCgpoaQoUZmA5BQU=; b=HQTP5
	S7aD8e82wj0vnHR/WJ9IHifNnf7JmhdJAQdZc9zz2x1oNsDm0lgrvJLku7QDauEd
	xlWE9jN0Z+KpfhgNMdil0ishvr//a2tHtG+V7p1Ge3JniRZUxI0x0rTucmjK4utC
	zGe3nZpDI64OY1iHzlkxLXAqIZ4Tn5mGQ5WeYk=
X-Sasl-enc: AybWBAzBBkGu11er3JdTk2H6HNELZBitM2rUktv26Dlm 1468974035
Received: from laptop.tanuk.dy.fi (a88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id B2373CCD81
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 20:20:35 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2016 03:20:23 +0300
Message-Id: <425887ce6e0187155974cabc2071f5189f7cc1a1.1468973641.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1468973641.git.tanuk@iki.fi>
References: <cover.1468973641.git.tanuk@iki.fi>
In-Reply-To: <cover.1468973641.git.tanuk@iki.fi>
References: <cover.1468973641.git.tanuk@iki.fi>
Subject: [PATCH 3/3] pulseaudio: disable WebRTC code
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
X-List-Received-Date: Wed, 20 Jul 2016 00:29:28 -0000

When updating pulseaudio to 9.0, I noticed webrtc-audio-processing is
a potential floating dependency. It's not an issue right now, because
webrtc-audio-processing isn't packaged for OpenEmbedded, but it would
become an issue if anyone added the library to OE.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index accafe1..2cf3fb4 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -37,6 +37,10 @@ EXTRA_OECONF = "\
 # oe-core nor meta-oe, so let's not add a PACKAGECONFIG entry for it for now.
 EXTRA_OECONF += "--without-soxr"
 
+# The WebRTC echo canceller depends on the webrtc-audio-processing library,
+# which is not yet packaged for OpenEmbedded.
+EXTRA_OECONF += "--disable-webrtc-aec"
+
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-- 
2.8.1


