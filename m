Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89641CCA470
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 02:31:43 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.3124.1759977096824686338
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 19:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NSPNDUuE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-77f67ba775aso647878b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 19:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759977096; x=1760581896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y55770J7y5a+UOBLm+tqKQV/g7w8DsbxYeXk7KW995o=;
        b=NSPNDUuEHLQdmfbFuQ5fn4qzFxbs+32tF/m/4OU/t+3FDIRnv7G/q1dMzfuHSEHox5
         8QZcvQqWicZxNKErRnZtoZQqBBKTgJc0Klub1Xw10KqtPslkEjb17e/Ro6l8mdr1fMPv
         GDF4Xc1pOhTsfmymHIuBK2Guq4Czh0SZpcmrLGRFvx+a5MksLNVvLNCxNYBTu2Sl9JmW
         vwps9ca7793BYxTikG3+CptUUYKkX5Z2C079sJPPb0rlXE/1Cxb35MDjU7Eb7qSIMVnv
         6E4nBqgZz1DhFQATYc3+q7cip8rBx9eoOIL+RCWZC5bcHj2HztmsJ+pJeJzyGUINeN3s
         iWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759977096; x=1760581896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y55770J7y5a+UOBLm+tqKQV/g7w8DsbxYeXk7KW995o=;
        b=Fonkwv2tKMm2p9LMeSwVOXbEwx7Ot7UYyNFGTLCfnfV1hlf9blKZhfZGUH8V4RKxiR
         Oa4KD9AgtaLQhD+PvXopuV+IDfT8Od6XNE4rKfDUKlpG98YrqPfFaFAuWxtf9TekIaI+
         vcbfPO80BqyxVdmQSzPe41mKqqCiVftvO9iQJqHuuXpDRicKCTmCGjffQFjrUsqQJQIu
         PiUZHGEQX6oQt4UfUthPF4yJPn14OluAvebBGKa4WzC8ossfTgh8vIYYnQRgspdpaYaC
         vUaT//aSNc1CWOndv0zSVmkzgPKRm6IhydfKAtusWQxsjgcr3dLXW5sX4jVVcX7LlAsX
         3iTg==
X-Gm-Message-State: AOJu0YxJ7j/pQCAZJwlxDDAO0aSvU6Ca5o3OarYeSptZPv9cZt8M003X
	Zwp5e7yBcHfc10KYMYAjOnm67lQ3WsK+hpNEGnRF1r7ONNVWlXAQaKWKsgz2Aulg969U9DSc/U8
	Eg4W1
X-Gm-Gg: ASbGncstMRN8KZtyIAVDQ+DKfL8Joz9ZAt1Xtk23mLusZUBqQtA0bY1WCiIBYIk6xt7
	/aj4zCLgMUKIJjQHMONVQ35P0/eeOwhEYTfw4ogSsuhKPhoYm86Gyxqe0ls747Jxt/u9wpBF607
	Ex18kxM2mJqr9pGRh8XWSa3pI3LZ/03QMRgfaHaZkB7mVK9X3TLvOQe/igBWoGAzNsmiYR23DTx
	YzlT7cZTnIzxovd6FRyxfQ1Y0Ya3MhXpGc057+oD3p8X1f1e1am4DcvNbQSzSeK652AcljbF9oJ
	S0sgRRVJv8IT7QGXms/eIxaNGOI8ljnYHd1huwGl1aIe9LLv6WHqUxhKrKSomLmjFRvFdX1fp47
	uokeC2jG/Di3Nnp+Z3k4o+FvIFH2K7shfDgQvPA==
X-Google-Smtp-Source: AGHT+IH1z9v5c9lVLK70XvsGfBoMfOfpjr9pGLN6E9EPXHGvhSKHmlDnyUjT9pUBGmdr7E50x9NsLA==
X-Received: by 2002:a05:6a00:1741:b0:781:17ee:610 with SMTP id d2e1a72fcca58-79386e51022mr7823483b3a.17.1759977095849;
        Wed, 08 Oct 2025 19:31:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3186:2c36:6c8c:efb2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794dbc5af9esm1147946b3a.40.2025.10.08.19.31.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 19:31:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] oeqa/sdk/cases/autotools.py: use gnu mirror instead of main server
Date: Wed,  8 Oct 2025 19:31:23 -0700
Message-ID: <20251009023123.245604-2-steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 02:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224604

ftp.gnu.org is the main server of the GNU project, however download speed
can vary greatly based on one's location.

Using ftpmirror.gnu.org should redirect the request to the closest up-to-date mirror,
which should result sometimes in significantly faster download speed, depending
on one's location. This should also distribute the traffic more across the mirrors.

This information was sourced from https://www.gnu.org/prep/ftp.html

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/sdk/cases/autotools.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/cases/autotools.py b/meta/lib/oeqa/sdk/cases/autotools.py
index 3f51854e3d..ecafafa7d6 100644
--- a/meta/lib/oeqa/sdk/cases/autotools.py
+++ b/meta/lib/oeqa/sdk/cases/autotools.py
@@ -27,7 +27,7 @@ class AutotoolsTest(OESDKTestCase):
         pmv = parallel_make_value((self.td.get('PARALLEL_MAKE') or '').split())
 
         with tempfile.TemporaryDirectory(prefix="cpio-", dir=self.tc.sdk_dir) as testdir:
-            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://ftp.gnu.org/gnu/cpio/cpio-2.15.tar.gz")
+            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://ftpmirror.gnu.org/gnu/cpio/cpio-2.15.tar.gz")
 
             opts = {}
             opts["source"] = os.path.join(testdir, "cpio-2.15")
-- 
2.43.0


