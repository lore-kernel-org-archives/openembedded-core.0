Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F25FCD0CF
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 08:09:28 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9003.1773821361578939502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 01:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=JqbMF3I7;
 spf=pass (domain: mvista.com, ip: 209.85.216.51, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35a09e0dd63so7505391a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 01:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773821360; x=1774426160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AhWMH484dTGjEe8ieOw7Tnx4MK8/gXJlWie+PLk4oPw=;
        b=JqbMF3I7Ij+V+v40aMJKZWXc92+6xMznlwB5J5M8alLgsjiebsX48oYxnnSz4elNGL
         MHvVZ107DRuObHnJqR8J9GaSO8BSlBW9Ii005/Pgf9+RRW9i4gMySWqxqW1uUYyY2blw
         iGhnVeEr/I/ireje4d9ZGSwy2jBgMzT02gg0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773821360; x=1774426160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhWMH484dTGjEe8ieOw7Tnx4MK8/gXJlWie+PLk4oPw=;
        b=rkaDZktjujjg+SLBXUGfQ5aPgdSG8PLpywNGWimxfr8gMFJP8c284FVrYrZlLLk4Ek
         mJvaU1LUeWZ78hs9vz9w5cVyHgnMXsnoYX3WycGidcC8rgx1ALltWECSOMlMPH0QoPRK
         kKYNGkuUWDJ66h0K+SpEQXdxKJ8/pKLo4HIwIqDUjfxCTYZqbYMH8ISNpxroEVt9lEd4
         9sFvqc3eAzqo77GHkKVYIp7JZFu1+bISJviI5wQ7CnYY/v61J6Qr2bZrL51weUG5Ql5r
         yqon+CZld0fy5lh3SLnEEQnTxe6/ppnnyKej6q1+V6HxBHtH0Egv//UOwkYFb3g2oaAT
         nlnQ==
X-Gm-Message-State: AOJu0YwJOIzuSOdFzRs2/1nkr4TLTbu1rjc+K2W/2k9eG0gBOi2Fy5FV
	yxC95Gk8GGbmMjo/YNWJo31TrVIeeMQSijfVoQOYmzVOvpmivwC4kLIn2uIkQyfUtiqdYV1PRd5
	n5ioRxJI=
X-Gm-Gg: ATEYQzwa622UX029vU+sWBYN0vXFU7gEouqsOrKMfWpeKzD1//ixRxxyK5NGVPEn0+Q
	p98SP9aCZDLjNdfHJNENfCQQ4GwVwYfddHWQwB4lxxPaURA+P/c6xgMi43qPSRQUSfaJ1ltI66s
	G+Ccx9jdQNauMqocD8VWpYq7YldNEgJoMOeVyfmYF7W9SLPuWgBmc1NlewPEzILkN34MDBeJZGC
	5YHwK9cwCkuHB7NW8OKwmR4VEAq8qLDBuZrtiluMDQvwZSlvCLg1N8ui2vX+uLjcWx+2oKlLROL
	AJhE1+qxSeoTV+u2ZHzIXmwCNIh4lNLgCYjkiyRh1ELKpNDXWZH44td3uyoUTIbSz+bH1Y4h15z
	JzFHZBKF6hSzVNGgk9Exngk8wb22zLSosBTWCyJ1e2ymo7crqvXmFcW1vOYFF7tYZlINBFeeNVg
	mAlo13/eqRIsdCNpg6ABdVa0PNUcU=
X-Received: by 2002:a17:90b:2e49:b0:359:877:370f with SMTP id 98e67ed59e1d1-35bb9ef1cbemr2010163a91.17.1773821360386;
        Wed, 18 Mar 2026 01:09:20 -0700 (PDT)
Received: from MVIN00352.. ([2401:4900:6304:fa7e:40dc:826f:d868:e60f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bbabae770sm740199a91.1.2026.03.18.01.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:09:19 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch] inetutils: Fix CVE-2026-32746
Date: Wed, 18 Mar 2026 13:39:10 +0530
Message-ID: <20260318080910.1095604-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 08:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233369

Pick patch according to [1]

[1] https://security-tracker.debian.org/tracker/CVE-2026-32746
[2] https://lists.gnu.org/archive/html/bug-inetutils/2026-03/msg00031.html
[3] https://codeberg.org/inetutils/inetutils/pulls/17/files

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../inetutils/inetutils/CVE-2026-32746.patch  | 40 +++++++++++++++++++
 .../inetutils/inetutils_2.5.bb                |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch

diff --git a/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch
new file mode 100644
index 0000000000..0e55f3f0a4
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/CVE-2026-32746.patch
@@ -0,0 +1,40 @@
+From 6864598a29b652a6b69a958f5cd1318aa2b258af Mon Sep 17 00:00:00 2001
+From: Collin Funk <collin.funk1@gmail.com>
+Date: Wed, 11 Mar 2026 23:06:46 -0700
+Subject: [PATCH] telnetd: fix stack buffer overflow processing SLC suboption triplets
+
+Previously a client could write past the end of an internal buffer using
+an SLC suboption with many triplets using function octets greater than
+18, possibly leading to remote code execution. Reported by Adiel Sol,
+Arad Inbar, Erez Cohen, Nir Somech, Ben Grinberg, Daniel Lubel at DREAM
+Security Research Team at:
+<https://lists.gnu.org/r/bug-inetutils/2026-03/msg00031.html>.
+
+* telnetd/slc.c (add_slc): Return early if writing the tuple would lead
+us to writing past the end of the buffer.
+* NEWS.md: Mention the fix.
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/inetutils.git/commit/?id=6864598a29b652a6b69a958f5cd1318aa2b258af]
+CVE: CVE-2026-32746
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ telnetd/slc.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/telnetd/slc.c b/telnetd/slc.c
+index b3cc117..9d6bad1 100644
+--- a/telnetd/slc.c
++++ b/telnetd/slc.c
+@@ -162,6 +162,9 @@ get_slc_defaults (void)
+ void
+ add_slc (register char func, register char flag, register cc_t val)
+ {
++  /* Do nothing if the entire triplet cannot fit in the buffer.  */
++  if (slcbuf + sizeof slcbuf - slcptr <= 6)
++    return;
+ 
+   if ((*slcptr++ = (unsigned char) func) == 0xff)
+     *slcptr++ = 0xff;
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb b/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
index 6c53902356..29ff62379d 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.xz \
            file://CVE-2026-24061-1.patch \
            file://CVE-2026-24061-2.patch \
            file://CVE-2026-28372.patch \
+           file://CVE-2026-32746.patch \
            "
 
 inherit autotools gettext update-alternatives texinfo
-- 
2.43.0


