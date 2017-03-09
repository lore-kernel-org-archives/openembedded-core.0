Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id A138573133
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 07:25:17 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id y193so24275517lfd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 23:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=3PD4yHtGsp8j+qED8qwA+u7rzDnRnphNDhYKZvaLQ8U=;
	b=bVEalJlA/ZZ7C/xaavQD6t1qyD8sX+jjyb7FUHFSfJ170mlrAVStCjX/XRcHPSDjb3
	n42CKGucNb26Aik+3lHs2//8crtbtrPa9r4wSj3EHmd2AxHNrw8HtWQyHAI4hRtjhG7Q
	3iyJ7Oy3wawRYnh0BvsK2o9d8a3LNVM1qxEV9Thyed+9IT17y0/Z+/Cx4VxuyYbV70Qs
	xoI0eUqtQ9rH0qLNProc2IdO+/Ca/yk2BxudhsR+2KLGk0xLTWPCldhzfhcyw6eKKe7v
	DW/8DdXEiYgKjF42ZRRFrZXKVpn8R63m2P4Ard8qxDNCFY/nLO+R0WwbkHtj3IhynxuS
	WMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3PD4yHtGsp8j+qED8qwA+u7rzDnRnphNDhYKZvaLQ8U=;
	b=RfTONsZ3J2X1w8gIfF6bK4yBkNrRhPL6hw6tbkjul9Ne95FPxaHxRYCCHC43xvfAaT
	0aCH2Xmj748n7YfCdbTGzFR+uVGMi3EqlRQ261lzPUDRMHzSVGEPQccEd2Hz8dIwfXov
	TW9J2Vgai8LSv3Mn3buj2QwpNZZItiKW+HYuI+79Hf8mpmE9u/mEh1gIX4zV+HD1yWAH
	4357o2cmiBvp2EeeeES6+RkU61Q+sa/VPU6VQDEYWw16gPiZvU6D5J1/xY1N4VuwPYlK
	xw2eOPdluh/6GRiwkG7NV6xycqzjxEBL+wuhlRDCYIlLFySXr6zBoSARxKlw6ResENB2
	2SIA==
X-Gm-Message-State: AMke39nQo2IsauLlUMyO2kHITVr6vFx2EfyMLUfYm6Ed/ndqbT2GZS31UCTAab/HI1DHog==
X-Received: by 10.25.79.15 with SMTP id d15mr819321lfb.14.1489044318345;
	Wed, 08 Mar 2017 23:25:18 -0800 (PST)
Received: from localhost.localdomain ([77.88.92.6])
	by smtp.googlemail.com with ESMTPSA id
	p27sm1114441lfg.5.2017.03.08.23.25.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Mar 2017 23:25:17 -0800 (PST)
From: Kristian Amlie <kristian.amlie@mender.io>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Mar 2017 08:25:16 +0100
Message-Id: <1489044316-14196-1-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] wic/direct.py: Avoid exception if using multiple rawcopy/no-table entries.
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
X-List-Received-Date: Thu, 09 Mar 2017 07:25:18 -0000

If we are both having a bootloader and a U-Boot environment file, we
can end up with two entries using "--source rawcopy" and "--no-table",
and since they reuse the same file [1], their cleanup handlers will
try to delete the same file twice. So just ignore the error if the
file doesn't exist.

[1] Although they reuse the same file, the resulting output is
correct, so it appears the file is accessed in properly sequential
order.

Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
---
 scripts/lib/wic/plugins/imager/direct.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index b7e324a..0e8d436 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -548,7 +548,10 @@ class PartitionedImage():
     def cleanup(self):
         # remove partition images
         for image in self.partimages:
-            os.remove(image)
+            try:
+                os.remove(image)
+            except FileNotFoundError:
+                pass
 
     def assemble(self):
         logger.debug("Installing partitions")
-- 
2.7.4


