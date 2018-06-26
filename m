Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8F4EE74751
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 12:09:03 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id f16-v6so17013298wrm.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 05:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=koyAE7ScNm+EkjDcw0Q1znuLAlR8q5zmjK8N6LJsc9Q=;
	b=KtrRPoUG5XyzMukjcPTfY6LUgfd6hlS+GfXcfCF60/aJpWxaE65AIKNVdw+KwUrMdd
	WgUp9H6tz9GOOJVx2W7BQi0qfEZ01Fu+6J3X5SclIm/ctjRXl3fdsTTYKMLcqzxCjiZs
	081EfD6QNXm/y6pWqQ8chho4JM9KTAVOz6pZr9rjMj2oRn8H69DwNTJB2zFyQCIps0rp
	Oh3+YeUyGuT8Sn3dpFdNaj2JsxuRwCVkIof/V6WaK0MmD1umKPUvNCgAWlaLdQh758hf
	shnutBvHslljxetSYamAm04kMJJB//eWJyDhuqtznzzfQha5rVWLTPJEEkNb1inY8Wbz
	xalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=koyAE7ScNm+EkjDcw0Q1znuLAlR8q5zmjK8N6LJsc9Q=;
	b=SXW5Ph4GA2NqNPqT0y0yQeSzYVG7PkweGUqDOnq2EgQU+rlg91Lf1F4u49VrlauExl
	c4S/cHrhsHqiVgF3nSNhB+7cEXquch+fcN5L0WF3UtHAfsERG2PX1Fmc/Q5nbBqyuY0d
	94V2DcO+nzcSc2l4m1P1nF4UhJ0wYXkDA5IabicE/hMQoDIzhCT89M/h1ImVLH07wEhz
	ckEKbRcT5/oZEuJfueEy4jUeI7hcF2QX4lscKOFZGWpgsyYgoPYbb5q0B8sT43Mg+ECR
	Y5J7RHaVc+p16SPGC8gtgtpe5lGdPe1EsfVDQ+8bUU72u2IxGJuJivs/5S/SUxE2m6+l
	Qtow==
X-Gm-Message-State: APt69E0o6T8uUT/hbfzZRzxnsLrZHyEN3pfQJM+J/pHXJXfqFQJ6Br6A
	b7yzJ0wIQrwwNdY7yXtcpZgRn6Jn
X-Google-Smtp-Source: AAOMgpd9ew6o5vjUkF/QxOwz9DjvXxCLAHXtHCRufyunGHSkWYLITizmxiiBs4FeOaduM3MFQYzkRg==
X-Received: by 2002:adf:a20a:: with SMTP id
	p10-v6mr1297987wra.196.1530014944008; 
	Tue, 26 Jun 2018 05:09:04 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18]) by smtp.gmail.com with ESMTPSA id
	139-v6sm2017233wmu.47.2018.06.26.05.09.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jun 2018 05:09:03 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jun 2018 12:08:55 +0000
Message-Id: <1530014936-10858-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] image: Set COREBASE as the git directory for timestamp
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
X-List-Received-Date: Tue, 26 Jun 2018 12:09:03 -0000

When REPRODUCIBLE_TIMESTAMP_ROOTFS is unset and we want to parse one
from git, use COREBASE as the base for the git command so we have a
known repository which we're using. Without this the build may fail
if the current directory is not part of a git repository.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 8ef06c0..2e88024 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -651,7 +651,7 @@ POPULATE_SDK_PRE_TARGET_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usr
 reproducible_final_image_task () {
     if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
         if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
-            REPRODUCIBLE_TIMESTAMP_ROOTFS=`git log -1 --pretty=%ct`
+            REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}" log -1 --pretty=%ct`
         fi
         # Set mtime of all files to a reproducible value
         bbnote "reproducible_final_image_task: mtime set to $REPRODUCIBLE_TIMESTAMP_ROOTFS"
-- 
2.7.4


