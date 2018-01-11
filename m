Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 65BB977E92
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 15:18:37 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id s13so2472074wra.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 07:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=/OHq5g0hmw/y+gPFsfNnXEPfOaHUSeQi81TrjR7QZlg=;
	b=g9KEEd5p+ha0HWUF3xwIAd4oaj+I1pMXAmfzvOy9iBxsNpnoyUbMkQ+PadAsdlspvu
	yPeN0E4Nc2k011CY+mJHboAcEyISPlG5hFqGTz99Q9EWjIF8HwiqQW2Lx1G8BI/V+jcp
	1IE+1WjcjYz1yNOJb0G1JWIU6PMYEcaAUAE0p8Gy0tGjHlTups8l4JgkjpqK5adOd8UX
	vTP6llD7jCc0hZF5toueSMDI8fmJWa1z055HNb43eCT/Z/pu6j1yMy+q1o1L6/2Aze0X
	u2mJ30bFRv1GivG4RJIQ5DMqy4l9hUOVje0vaWZUVEhjvodu1WGHLLJAmHKL9D8rtuAI
	DWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/OHq5g0hmw/y+gPFsfNnXEPfOaHUSeQi81TrjR7QZlg=;
	b=RvRWeMB8lM3yJ7uIMqskxv/6hft+8mO2YkmIK7tWqqF6Xh5L43btTzrTk2QgEm/h/D
	A/c1vfO1myiMr60bcJoKEnQNouf4GdKC3fHIWSa4BNgA2dhDXd8u5bLb+/M+Af/PWc6h
	TXwny1/bYWVDgXpTl7p2iiFOeb8gFFp0qExR432zarkhh9aEyNYpdXXkYTpIFVRxtOEh
	qxjkGR+QGJvT7NM9jAuSZk+yCOKKdlZKRW8ZY9jCNb/6/lYIFkVs5uZGhPN0ZTj1MjDB
	FhFvvR+fd0pitrrWAxR1C4OHptU5flxZJBS38WZWD623PIS5TJBfssSgzA/pFDe48whr
	nOYg==
X-Gm-Message-State: AKGB3mIx3mSepTuY134ahGzmsDq9qBb30vawg48tzJPnFJDe4mTIGVhZ
	+/RvcihheGFhlwxhvEozJ+1HxLBG
X-Google-Smtp-Source: ACJfBovU61GAPtVc3r+X2rzgBFr1dHxSGJBQ9O0ReRLHhXVd8uB6O0mHOrb7cq5RdeYlmmmhWeldfg==
X-Received: by 10.223.208.206 with SMTP id z14mr21096399wrh.109.1515683917969; 
	Thu, 11 Jan 2018 07:18:37 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	a2sm11181445wrf.56.2018.01.11.07.18.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 07:18:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jan 2018 15:18:34 +0000
Message-Id: <20180111151834.4169-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] image: use du --apparent-size when calculating rootfs size
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
X-List-Received-Date: Thu, 11 Jan 2018 15:18:37 -0000

We should pass --apparent-size to du when calculating how large the rootfs is as
otherwise we get the actual disk usage, which if the files are compressed by the
file system (such as ZFS) may be sufficiently smaller than the space required by
the image that construction will fail.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/image.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 4531aa2a57a..8e763e4d543 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -534,6 +534,7 @@ def get_rootfs_size(d):
     initramfs_maxsize = d.getVar('INITRAMFS_MAXSIZE')
 
     output = subprocess.check_output(['du', '-ks',
+                                      '--apparent-size',
                                       d.getVar('IMAGE_ROOTFS')])
     size_kb = int(output.split()[0])
 
-- 
2.11.0


