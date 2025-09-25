Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF217CAC5B1
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 14:06:50 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.12466.1758809204139958026
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 07:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=rSy2Pksn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202509251406415587c66ef600020797-hqgl6r@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202509251406415587c66ef600020797
        for <openembedded-core@lists.openembedded.org>;
        Thu, 25 Sep 2025 16:06:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=sUaLTSKRQzZRXJ2V3hqLzaUxCUDH72IuDC2un7vG7nM=;
 b=rSy2PksnCbhMX0uPP48hKuuBQOQITVLqpWkWvTjlVwhzNAZX1XFUdRIbiEEBs/KJK1kg9P
 V/kTUuZt50iQBwzgt1vrl5J+o33TYHcHUPxlqOODQFW1dg8fgYHtOSNluKDaFV3OBbTYq1fD
 CS19TrbOkHFmPe8hA5RSlDHnej0GNt55ZqIxzLKaGYuMGY7SqqXmgARLLqEr9EvFFjGLr0t6
 +KZS0nR+hrmV9BdeJ8cEO3Q0Cz0PoKVUBpvm9XlYORW4QoR9tkTAOn5NdSfAzqN4qpPH4DK9
 nXATOryEYuVuvgt98uWGElMikOjriXipX6iYnPa3YyUrSuTqkHQIBaPg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH 10/10] tiff: patch CVE-2025-8961
Date: Thu, 25 Sep 2025 16:05:14 +0200
Message-Id: <20250925140514.1103300-10-peter.marko@siemens.com>
In-Reply-To: <20250925140514.1103300-1-peter.marko@siemens.com>
References: <20250925140514.1103300-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 14:06:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224039

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioned in [1].

[1] https://security-tracker.debian.org/tracker/CVE-2025-8961

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libtiff/tiff/CVE-2025-8961.patch          | 73 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.7.0.bb |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8961.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8961.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8961.patch
new file mode 100644
index 00000000000..90207da42b1
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8961.patch
@@ -0,0 +1,73 @@
+From 0ac97aa7a5bffddd88f7cdbe517264e9db3f5bd5 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Fri, 5 Sep 2025 21:42:35 +0000
+Subject: [PATCH] tiffcrop: fix double-free and memory leak exposed by issue
+ #721
+
+CVE: CVE-2025-8961
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/0ac97aa7a5bffddd88f7cdbe517264e9db3f5bd5]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tools/tiffcrop.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index ae414efc..be250cc9 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -1072,6 +1072,7 @@ static int readContigTilesIntoBuffer(TIFF *in, uint8_t *buf,
+                                           "Unable to extract row %" PRIu32
+                                           " from tile %" PRIu32,
+                                           row, TIFFCurrentTile(in));
++                                _TIFFfree(tilebuf);
+                                 return 1;
+                             }
+                             break;
+@@ -1086,6 +1087,7 @@ static int readContigTilesIntoBuffer(TIFF *in, uint8_t *buf,
+                                               "Unable to extract row %" PRIu32
+                                               " from tile %" PRIu32,
+                                               row, TIFFCurrentTile(in));
++                                    _TIFFfree(tilebuf);
+                                     return 1;
+                                 }
+                                 break;
+@@ -1098,6 +1100,7 @@ static int readContigTilesIntoBuffer(TIFF *in, uint8_t *buf,
+                                           "Unable to extract row %" PRIu32
+                                           " from tile %" PRIu32,
+                                           row, TIFFCurrentTile(in));
++                                _TIFFfree(tilebuf);
+                                 return 1;
+                             }
+                             break;
+@@ -1110,6 +1113,7 @@ static int readContigTilesIntoBuffer(TIFF *in, uint8_t *buf,
+                                           "Unable to extract row %" PRIu32
+                                           " from tile %" PRIu32,
+                                           row, TIFFCurrentTile(in));
++                                _TIFFfree(tilebuf);
+                                 return 1;
+                             }
+                             break;
+@@ -1124,12 +1128,14 @@ static int readContigTilesIntoBuffer(TIFF *in, uint8_t *buf,
+                                           "Unable to extract row %" PRIu32
+                                           " from tile %" PRIu32,
+                                           row, TIFFCurrentTile(in));
++                                _TIFFfree(tilebuf);
+                                 return 1;
+                             }
+                             break;
+                         default:
+                             TIFFError("readContigTilesIntoBuffer",
+                                       "Unsupported bit depth %" PRIu16, bps);
++                            _TIFFfree(tilebuf);
+                             return 1;
+                     }
+                 }
+@@ -2901,7 +2907,7 @@ int main(int argc, char *argv[])
+     }
+ 
+     /* If we did not use the read buffer as the crop buffer */
+-    if (read_buff)
++    if (read_buff && read_buff != crop_buff)
+         _TIFFfree(read_buff);
+ 
+     if (crop_buff)
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
index 405edabe6f4..91e7bfbe172 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
 	   file://CVE-2025-8177_2.patch \
            file://CVE-2025-8534.patch \
            file://CVE-2025-9165.patch \
+           file://CVE-2025-8961.patch \
 	   "
 
 SRC_URI[sha256sum] = "67160e3457365ab96c5b3286a0903aa6e78bdc44c4bc737d2e486bcecb6ba976"

