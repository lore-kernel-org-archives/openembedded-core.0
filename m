Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5F3DC6C108
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 11:42:19 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j2so1576955wrw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 03:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=K9KUa7QNiihkKshb4uf6HMiXuxs2D1pCkv3EeOUZnUo=;
	b=zkJDs4S8y76QxdDu8m1EqxDR57Mg9UI5Tww/Dt02ndJZ2h8xP3fmNKqeWW4ZFF+gvV
	LGDbWpT6tBv7DkF09F5lDEMtwPD0/Rw1sxHv6K0BKXUCJfol5WKjj22myYXsX4utZlpG
	/d3fBtlJqdVN6QLS+7+OipesTRAE1tTbVpGBOqrvuY8W0M84C2LlC4ozG2l8LXCfwAii
	rUZ0N1hgp0NKRvYfd6jxnnUzp9FnE05kq9u6irIliNY8Y6jdzTqt3rBsy/aaMIdyLmJr
	a7/06os2RucSvjWoa0uEfifFcjJvEIEO0qdJRljs6zpje8cTfGcT5VK8+sbtC0o24P93
	VEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=K9KUa7QNiihkKshb4uf6HMiXuxs2D1pCkv3EeOUZnUo=;
	b=LFioE0nXlYo7RjEvRsk/1gxiZoGuphD1Za6YDVUnHNWwssfSvBlLO/pycljxbWgip/
	DakulCGlrJpH11lS86VFCJgBBkr0ADEieCJCH1cOC2AKVPF+V6GfJsg7H+EBXScULxit
	OFTzY383OP4VH0kssQhXvgesJUkLzBy4+v51R5iPOdpcN+mU00Wf5vScgFrj6bGZL3y/
	rVZo2xMoTUX2NqVjbYEDearSzuPmwOrzeWfpTqjsYJ0YxYC2v8nhIv3iXDmtA/CkmbWF
	sjoGZ5LX8+x8zaXNwYNRZ9QJ5tjtldOMvQpTViGzNhiJqMn2iJsNfKKC3gGvXLiD0usj
	avBQ==
X-Gm-Message-State: AA+aEWaw2gXB0C9sQtF+65FTw2bGyHx7kMH/xIQe8+m4rVnCooSTzk47
	lFZLUlPZHFc94/IuC39ANxHCgSTf9Pg=
X-Google-Smtp-Source: AFSGD/V/wSv6D3UXyWUSZz9D/QoPrrm1w6uvS69vVW//7I2UO0R8mRBD70yK11CFlTLe3rLxO/VoHA==
X-Received: by 2002:adf:9287:: with SMTP id 7-v6mr1106559wrn.3.1543491739586; 
	Thu, 29 Nov 2018 03:42:19 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q12sm1568081wrx.31.2018.11.29.03.42.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Nov 2018 03:42:18 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 11:42:15 +0000
Message-Id: <20181129114215.4679-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181129114215.4679-1-ross.burton@intel.com>
References: <20181129114215.4679-1-ross.burton@intel.com>
Subject: [PATCH 2/2] image_types: use cpio-native to build cpio images
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
X-List-Received-Date: Thu, 29 Nov 2018 11:42:19 -0000

As per the previous commit, upstream cpio has a bug which means it crashes on
append. If the image being built has already had testimage ran then cpio-native
will be in the sysroot.  It's also possible that some distributions are shipping
this broken CVE patch too.

Now that our cpio-native is fixed, until we can be sure that the host cpio isn't
broken depend on cpio-native if building a cpio image.

[ YOCTO #13042 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/image_types.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 5c406481ef0..70bd3153067 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -239,6 +239,7 @@ EXTRA_IMAGECMD_ext4 ?= "-i 4096"
 EXTRA_IMAGECMD_btrfs ?= "-n 4096"
 EXTRA_IMAGECMD_f2fs ?= ""
 
+do_image_cpio[depends] += "cpio-native:do_populate_sysroot"
 do_image_jffs2[depends] += "mtd-utils-native:do_populate_sysroot"
 do_image_cramfs[depends] += "util-linux-native:do_populate_sysroot"
 do_image_ext2[depends] += "e2fsprogs-native:do_populate_sysroot"
-- 
2.11.0


