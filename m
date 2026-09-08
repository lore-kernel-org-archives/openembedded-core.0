Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E555C79FAD
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 09:58:42 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3543.1788861518267265177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 02:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gjfVu4u0;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9BE7E1A1A56
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 09:58:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70927603C4
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 09:58:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C8D811C7A34F;
	Tue,  8 Sep 2026 11:58:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788861515; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q5n2TO8kFt8Q8E0bfsfJy62AkkHQlWDwq7ZToyUGCKo=;
	b=gjfVu4u0ZAGafKscycFCiHJYjoBbocseKqJEYg2KBt3VbnmJvnZm7BNVgYdxxeDQoD6x3R
	jCcKQuizsTU/BxZHzk1uskngBgWdWcmBlgdPppS+RTBlGrxzySTJAz0MIgWYXWDIOjaH1x
	i4c5Mp0LxxFDMyv0YZzac7+kXWZTi/jAl4HGXZCmbNwTTNUoQeGLQHf5n4yb/3iTihDVqn
	p5RtqMLIYG8ZaAAd1vSc2L+zSpNWfD/66cXAw9wmlfHQkigmKCrpe6t+cP5DIfV0w3b8il
	atN7WI2yR/jxyS+nJqrq0wqOR2kNkN5t7cDiq9BYn2whGbxNNXBzWV0kMmegLQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 08 Sep 2026 11:58:23 +0200
Subject: [PATCH 01/10] gstreamer1.0: upgrade 1.28.6 -> 1.28.7
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-mathieu-gstreamer-1-28-7-v1-1-9694738804f6@bootlin.com>
References: <20260908-mathieu-gstreamer-1-28-7-v1-0-9694738804f6@bootlin.com>
In-Reply-To: <20260908-mathieu-gstreamer-1-28-7-v1-0-9694738804f6@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788861512; l=6426;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=PxYieX3hO0XDlhfLDcR7l2uSas+3CKvihWDi23hwTtY=;
 b=nks6IQi4NWtlDTVITxAT/Rc+wmG+eOY9+u/BmWMyqY5JTB4oHhM/aer+ahhvSKePkBmJG2ZYD
 sAgXxbIsYBSCq8e11mkksJhmanBRKSj/0Ffdqgyqc4GbBAmWhFC5Unr
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 09:58:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245341

Highlighted bugfixes in 1.28.6:
- Various security fixes and playback fixes
- playbin3, playbin: fix stalls after re-enabling previously disabled subtitles
- Fix regression in core if a pad is re-linked while changed sticky events are being pushed
- dtls/webrtc: fix some issues with OpenSSL 4.0.0
- RTP retransmission bitrate estimation fixes
- Fix RTP depayloading of SMPTE ST291 frames with multiple ANC packets
- Add H.266 muxing support to the Rust (f)mp4 muxers
- Better handling of input buffers without timestamps in Rust (f)mp4 muxers
- webrtcsink H.264 level/profile negotiation fixes and support for nvv4l2h265enc encoder
- SMPTE ST2038 ancillary metadata and closed caption combiner improvements
- Fix SEI insertion into H.265/HEVC streams with alpha
- Windows D3D11 WinRT screen capture element fixes
- Improved coded buffer size handling for VA encoders
- Textaccumulate: various tweaks how the element outputs text, plus better handling of French punctuation
- hlssink3: improved handling of input buffers without timestamps
- Fix build against FFmpeg 9.0
- cerbero: fix Windows packages binary size increase regression; upgrade libsrt recipe to 1.5.6
- Various bug fixes, build fixes, memory leak fixes, and other stability and reliability improvements

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../0001-tests-respect-the-idententaion-used-in-meson.patch         | 2 +-
 .../gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch | 6 +++---
 .../0003-tests-use-a-dictionaries-for-environment.patch             | 2 +-
 .../0004-tests-add-helper-script-to-run-the-installed_tests.patch   | 2 +-
 .../gstreamer/{gstreamer1.0_1.28.6.bb => gstreamer1.0_1.28.7.bb}    | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index de255bf79189..61844d793aaf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From 4e6aae8cbddb4567388f8f19919c2c17e36e0356 Mon Sep 17 00:00:00 2001
+From 27bae0561a09f06375c6c6d1d3fec2a142a1ca20 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: respect the idententaion used in meson
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index 5b52d66190db..9752ebe921ed 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From 34d24b8d66088d92ca306a488028dee82a6f6982 Mon Sep 17 00:00:00 2001
+From 00dad437c119cd23883cbef35d2a620ccdf3816b Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -19,10 +19,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index abd0ad6..93cd692 100644
+index bffea3b..a51b1af 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -662,6 +662,10 @@ if bashcomp_dep.found()
+@@ -665,6 +665,10 @@ if bashcomp_dep.found()
    endif
  endif
  
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index bc6dfe353a3e..5637eff7a59d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From f34bc3040b1564a3d39de4a4426326866c437dae Mon Sep 17 00:00:00 2001
+From a686b15bf7ec5ca99467f138c57ebb17aa25c24f Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH] tests: use a dictionaries for environment
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
index 8eb4bc2a8160..eb14d519fe75 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -1,4 +1,4 @@
-From ee4f5bd19394e055109486d88ff8e876c5c2572f Mon Sep 17 00:00:00 2001
+From e0290fc20f52ad7dfc21e8a572587ad826e5b32e Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 2 May 2021 01:58:01 +0100
 Subject: [PATCH] tests: add helper script to run the installed_tests
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.7.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.7.bb
index 9376fbe67e33..0d1a931ceda3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.28.7.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "62b6b9f0ad3147a6dd6420ac64a91180b14e990695bddd353b96041611d052ca"
+SRC_URI[sha256sum] = "787329b2c5758e228a71d926a6dcf960bceaacca3cadd63874ba665dfcda013e"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \

-- 
2.47.3


