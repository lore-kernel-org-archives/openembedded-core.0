Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 13C6C6077F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 19:48:15 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c84so1990003wme.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 11:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iSqvl7ZiJSMpdMVrp/n3Ex6v3m56qjrvXpmw4yRfLAA=;
	b=c5wDuPr4PAs6heYBBa6xHDrM5h4Ywh00AmKUqXLPt/F+hYwRj+WfjIhnfNFOo/d7Ew
	R34zpfdBzlaaNDug53bpKKhOKytfgSZxb3wBiGMgUgOP0TiaVBjmS6Z1C/sGhQfxLcxX
	tIToW9QyDTt+1PY6zt7AclnAVcYXVKzNZXWdxbcQSj9PDHU/atfCKBk0rmjwF0+R2kpH
	68I20oGTNZbkk95d1NVIXIVtABfb/xY+KVBIO5X9nff0qTQZ74HRrzNJ1L9RfXkaaLwd
	YzGZz1wCnMoI0VYDXKSSsNq1jO0UNr5xQjI0v3wjTLmB9FQX1HiQpjJik2hFUKCrI4ql
	8/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iSqvl7ZiJSMpdMVrp/n3Ex6v3m56qjrvXpmw4yRfLAA=;
	b=s3V6TAp8BZT/cFikelHtB/+bCqkgD5wGLP+CTIqjaOb1oySEB7NFyVGdLbWzimeiPm
	bdT1HIG4ExmZi/TZ9xywjQQqeY4RQEzNh4umA2Ha+e+1pr1DkYrMLHW3mNTj0jKvrku0
	B1+MfgacEsROPgefVGwYwwvetbWts7r3ndAxMYU1ijQjLTt3GvDIJWdjfH8krZkDbJxe
	FPqMtamktNlpJPSNdESYaNsvk7Pof+f7YwTRwNtnYi7KmGBUtEDnxHHZjswHHHH3g7nY
	KSHNtwVew1qHVSUp8+xsKhkh4ng6fB3c8TniOJPxqsCcGI0L3VVw7Z9pRhmpnzFmYB6U
	jhvg==
X-Gm-Message-State: APjAAAWskt/8U5ZrUHBLTr1Cj9NGZ0fDa9Fpk7Aoh4G36Tuy234ucISz
	eEftJdLnqHVIjZw30H6oM/fgoCyF
X-Google-Smtp-Source: APXvYqyP3IMWau/t4uJw9UrvB12RV/0+kGTtfmVjQ2mkA1jDcKd9Mv52jjXZR/VAO2zMDQEGk6IqSA==
X-Received: by 2002:a05:600c:2255:: with SMTP id
	a21mr11883924wmm.79.1582141696272; 
	Wed, 19 Feb 2020 11:48:16 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	y185sm1204049wmg.2.2020.02.19.11.48.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 11:48:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 20:47:40 +0100
Message-Id: <20200219194752.7967-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH 01/13] core-image-sato-sdk-ptest: do not pull in ptest-pkgs
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
X-List-Received-Date: Wed, 19 Feb 2020 19:48:16 -0000
Content-Transfer-Encoding: 8bit

The lists of ptests are defined via PTESTS_FAST and PTESTS_SLOW;
specifying 'ptests-pkgs' also pulls in additional ptests that
are specifically excluded from those lists due to causing issues with
ptesting. (particularly bash-ptest is one such item)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
index 85b5adbc69..58c257c49f 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -3,8 +3,6 @@ require conf/distro/include/ptest-packagelists.inc
 
 DESCRIPTION += "Also includes ptest packages."
 
-IMAGE_FEATURES += "ptest-pkgs"
-
 PROVIDES += "core-image-sato-ptest"
 
 # Also include ptests which may not otherwise be included in a sato image
-- 
2.25.0


