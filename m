Return-Path: <psidhu@gateworks.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id AF4B173E11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 22:22:14 +0000 (UTC)
Received: by padfo6 with SMTP id fo6so416600pad.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 15:22:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7O3ibU723RfyIc1hwk8vlZrlcKntBvvt8mCASL80oa0=;
	b=FqQuYlG/CtTLd1pNOqbrloEYEeM1j34O+A6dEXuLzPrj19PGKoAVboMM3tj293Z8FC
	R84IbUNnAIVOy6e74QewKPjyvS3ZR2b424838B8D6zx5CvCCnCLRag+5E/mo2U5+7s7b
	DLvhMpxr4vsezeL7kEjV4pYacfzKf24wvA/o9usIlWcPlg7wlg037hJSXeq9DVqdDQ6W
	qR4sWsDSi8OkTFbgT9/AM1vosZIotz4QAZKAXdSkVzfPXMt/F8FEct+7iCI/L8mTcRy+
	yjg8StXNdTSqHV2Nx7siDXHMa0ka0bbJ7fC7sTdW7cUSYYA6HDXn1eoymUncZL/OmFJx
	WaKw==
X-Gm-Message-State: ALoCoQkjPQYXcKeO0h8r2lI+0fTNKdVkNIS7kvHQ5+moi011d2UU4tJ7MEkKRLjJAFC9ZQzHOEGj
X-Received: by 10.68.206.74 with SMTP id lm10mr9843889pbc.117.1440714134819;
	Thu, 27 Aug 2015 15:22:14 -0700 (PDT)
Received: from psidhu.gw (68-189-91-139.static.snlo.ca.charter.com.
	[68.189.91.139]) by smtp.gmail.com with ESMTPSA id
	ea13sm3519254pac.30.2015.08.27.15.22.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Aug 2015 15:22:14 -0700 (PDT)
From: Pushpal Sidhu <psidhu@gateworks.com>
To: Ross Burton <ross.burton@intel.com>
Date: Thu, 27 Aug 2015 15:22:00 -0700
Message-Id: <1440714120-13204-1-git-send-email-psidhu@gateworks.com>
X-Mailer: git-send-email 2.5.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] mtd-utils: add acl dependency
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
X-List-Received-Date: Thu, 27 Aug 2015 22:22:15 -0000

Without this DEPEND, build will break for mtd-utils-ubifs as shown below:
   ...
   CC      mkfs.jffs2.o
 mkfs.jffs2.c:70:21: fatal error: sys/acl.h: No such file or directory
  #include <sys/acl.h>

This was introduced in commit cbf8dcc9f326faca0fbc8efe52f2920022576631 when
reintroducing xattr support.

Signed-off-by: Pushpal Sidhu <psidhu@gateworks.com>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 8d4892a..72ce9ed 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
-DEPENDS = "zlib lzo e2fsprogs util-linux"
+DEPENDS = "zlib lzo e2fsprogs util-linux acl"
 
 PV = "1.5.1+git${SRCPV}"
 
-- 
2.5.0


