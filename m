Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 913DB73285
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:40 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id p186so118756715qke.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Kc8IH0Wp5olOmKw4WGnjSmcB9CqHokZF9kwCuL6TOyY=;
	b=i88XriCKMVXGfiUfU17Net6yn2P/TciPfj4DVztZNKfwiHw1V+eYHlGjkYqWYyxfrY
	kV6w85etBTGZoEBfQR2tSBw03sxTnsR/9SEF3PmlBQUwPbZLAGqyL8ixPSfFCmsjrvrq
	4HacrXKCRXOL6L3CnfADgRh2Uu9OZRPcMTjgGeK+MOgJ5zFV5KurZo6rJQb15N9WDLE8
	9rmyDOQVWvNSJwc0mVWWKesIHBqhqrhcJ/PZHFSaS+t2fBF9Oz+siTAzUCiOS3PSAQw3
	UgdcNFgmtU/i3c1rabnpuy0kg8FsuKqT665h3/q9uVBMCOOAv3ae2t18ybjP/QvfL+Hf
	1bZQ==
X-Received: by 10.55.81.70 with SMTP id f67mr22880631qkb.28.1452248380897;
	Fri, 08 Jan 2016 02:19:40 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:48 +0000
Message-Id: <baa98869574d7bb44be4171ff58d5abdc76f7d69.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 20/53] mtools: Fix build with uclibc
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:41 -0000

unlike glibc, uclibc does not have internal APIs implemented for
libiconv, so it needs to depend upon libiconv

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/mtools/mtools_4.0.18.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/mtools/mtools_4.0.18.bb b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
index bc9b79c..479fd32 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
@@ -5,6 +5,7 @@ SECTION = "optional"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
+DEPENDS += "virtual/libiconv"
 
 RDEPENDS_${PN}_libc-glibc = "glibc-gconv-ibm850"
 RRECOMMENDS_${PN}_libc-glibc = "\
@@ -35,6 +36,8 @@ inherit autotools texinfo
 
 EXTRA_OECONF = "--without-x"
 
+LDFLAGS_append_libc-uclibc = " -liconv "
+
 BBCLASSEXTEND = "native nativesdk"
 
 PACKAGECONFIG ??= ""
-- 
2.7.0


