Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2843876932
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 08:45:14 +0000 (UTC)
Received: by ioeg141 with SMTP id g141so195170879ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 01:45:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=SI1InDMqlg2d9IBLyRz0iRZ7wXyeeua/akC0wSs1424=;
	b=h+XvZ6EvhsNOVUkSHuLlsgc4JvfI9Yt/m+jyzmWVVoXFaDI3rMrLAMtGz64p2VwbqE
	73jNWwUA8IeDTBQXvz29ahgcbhSHLjypCNrs/L5cjloeK0HCICN2oPXyQC8i2l6tHysu
	q5sCjFO++xrqi51cPMnTOGkfCJQitR4/6xqXgCazE+paXhA1mAYjNTlfVerbyEIAofPB
	ko7unmlCvyyPpjx7/1N0Gf/ENQ/zclGr0om48jx5BZtjKhndolygvxmTqC+pXm7WQltm
	F/8W6wZkHmaBsebs0bBWJg3b9191LE7tLE3nDFa+5ntZdUHhkL6nxqga66riyUUA1b3n
	uzZA==
X-Gm-Message-State: ALoCoQkZT+/I/nw5uHVG03GlXaC54QwMevTmTO2AmPjw1yIh/hU+6lc8RQoLC9UpS4sXYbcK0Usf
X-Received: by 10.107.136.146 with SMTP id s18mr26626891ioi.25.1439282714817; 
	Tue, 11 Aug 2015 01:45:14 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8C212.dip0.t-ipconnect.de.
	[93.232.194.18]) by smtp.gmail.com with ESMTPSA id
	bd7sm7684942igb.19.2015.08.11.01.45.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Aug 2015 01:45:14 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2015 10:45:00 +0200
Message-Id: <6af40fe1752b8cf25efca4a906361c4437249841.1439281753.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439281753.git.patrick.ohly@intel.com>
References: <cover.1439281753.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1439281753.git.patrick.ohly@intel.com>
References: <cover.1439281753.git.patrick.ohly@intel.com>
Subject: [PATCH 3/3] mtd-utils: keep xattr support enabled
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
X-List-Received-Date: Tue, 11 Aug 2015 08:45:15 -0000

xattrs may be needed by some distros. Support that by compiling in the
necessary code, even if it is not used by default. Then .jffs2 images
including xattrs can be created with:

   EXTRA_IMAGECMD_jffs2_append = " --with-xattr"

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 7010cac..8d4892a 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git \
 
 S = "${WORKDIR}/git/"
 
-EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
+EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include' 'BUILDDIR=${S}'"
 
 do_install () {
 	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
-- 
2.1.4


