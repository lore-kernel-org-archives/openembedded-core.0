Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7127.1794521113683482026
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 14:05:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=OXehXnqZ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202611122205117b33605c6f00020762-w9ek_r@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202611122205117b33605c6f00020762
        for <openembedded-core@lists.openembedded.org>;
        Thu, 12 Nov 2026 23:05:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=KoAG6fJF7UWdNs4ORcA17Ni6BR7xdLI5Sb9c3BtymqU=;
 b=OXehXnqZLSssc7blliRaBegYgNbTBNRoZB/jcRORxAQ+K5aqvXTsU3m/kbWNaKuzpW0Gy7
 qQJjSG1CUIaaTUbeZP5oMSkXcsspuG4nsJTj5kkIh0erdPJA+rRSbKg5yFwDd1pnKoCiVepD
 Nxjk+jyBXMiHnxuzbZUtGnCR/5adkoC7t2fkD9/6jPe6X3CoJtr3q/j2gTAWHnbLP9mk4NwA
 gKgErOLg/rIJkUay/E5wfHPNhPyQn5Z2zmwLV9bTQKzcLpaM+RlSM2fhoTKRsM177JopriGA
 zgfZu+gMAuiHoyWZ09PWSentTYRrW4qK0sGON2+/tXkd6S/PFVSBCI8w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] speex: patch CVE-2026-116741
Date: Thu, 12 Nov 2026 23:05:02 +0100
Message-ID: <20261112220502.1044597-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 22:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250130
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [1] linked from CVE report.

[1] https://gitlab.xiph.org/xiph/speex/-/merge_requests/32

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../speex/speex/CVE-2026-116741.patch         | 29 +++++++++++++++++++
 meta/recipes-multimedia/speex/speex_1.2.1.bb  |  5 +++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/speex/speex/CVE-2026-116741.patch

diff --git a/meta/recipes-multimedia/speex/speex/CVE-2026-116741.patch b/meta/recipes-multimedia/speex/speex/CVE-2026-116741.patch
new file mode 100644
index 00000000000..4d71f7fa82c
--- /dev/null
+++ b/meta/recipes-multimedia/speex/speex/CVE-2026-116741.patch
@@ -0,0 +1,29 @@
+From 09b569d1b437e5edccf3406a38714ad795e46d38 Mon Sep 17 00:00:00 2001
+From: Tristan Matthews <tmatth@videolan.org>
+Date: Thu, 22 Oct 2026 09:00:44 -0400
+Subject: [PATCH] bits: fix OOB write in read_whole_bytes for non-owned buffers
+
+Fixes https://github.com/xiph/speex/issues/42
+
+Reported by HaiND (Nguyen Dinh Hai), Post and Telecommunication Institute of Technology, github.com/Haind03.
+
+CVE: CVE-2026-116741
+Upstream-Status: Backport [https://gitlab.xiph.org/xiph/speex/-/commit/09b569d1b437e5edccf3406a38714ad795e46d38]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libspeex/bits.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libspeex/bits.c b/libspeex/bits.c
+index 4f457af..c5546e8 100644
+--- a/libspeex/bits.c
++++ b/libspeex/bits.c
+@@ -174,7 +174,7 @@ EXPORT void speex_bits_read_whole_bytes(SpeexBits *bits, const char *chars, int
+          }
+       } else {
+          speex_warning("Do not own input buffer: truncating oversize input");
+-         nchars=bits->buf_size;
++         nchars=bits->buf_size-(bits->nbBits>>LOG2_BITS_PER_CHAR)-1;
+       }
+    }
+ 
diff --git a/meta/recipes-multimedia/speex/speex_1.2.1.bb b/meta/recipes-multimedia/speex/speex_1.2.1.bb
index c40198fa8f3..2a174db0aa4 100644
--- a/meta/recipes-multimedia/speex/speex_1.2.1.bb
+++ b/meta/recipes-multimedia/speex/speex_1.2.1.bb
@@ -8,7 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eff3f76350f52a99a3df5eec6b79c02a \
                     "
 DEPENDS = "libogg speexdsp"
 
-SRC_URI = "http://downloads.xiph.org/releases/speex/speex-${PV}.tar.gz"
+SRC_URI = " \
+    http://downloads.xiph.org/releases/speex/speex-${PV}.tar.gz \
+    file://CVE-2026-116741.patch \
+"
 UPSTREAM_CHECK_REGEX = "speex-(?P<pver>\d+(\.\d+)+)\.tar"
 
 SRC_URI[sha256sum] = "4b44d4f2b38a370a2d98a78329fefc56a0cf93d1c1be70029217baae6628feea"
