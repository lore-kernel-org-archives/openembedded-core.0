Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5EF3776803
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:40 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id p186so118756778qke.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=QU7281lhoBO+qDlSTViMEuU8SvYF96B6/H2CLOPTkl4=;
	b=YRQM+BK1ubU3b/CHT2GjrMmM+kvlmTQ8CpyRB5TdQJ0T86fGdua0A6NE3OKxhwadmz
	zgfWrbQwdP8FsJv/Jx/C9gP/EEmjnIsXGqPlmJovylIWWHSK95QvbxSFdhgYdANP+pJY
	V1cH5xaLp5saortkIvvvUMdypTL8nBho38kY+FZcv9+Mn0U335goO9nE9hpjq4qk5cFx
	mhNF8MUgZ4M21HMO5qUk0NrnYfL6jf09e+saxZSf7S9XJ41lGBBBJUBJ7+Q7C5j6pXgf
	rhnCNyHH8rDy/IiILtm8jHCgpwWnlksU6NhZvJ2ml9M6QMD1wTCCxmdW512LrG3XxDn6
	EPtA==
X-Received: by 10.55.72.3 with SMTP id v3mr142920527qka.107.1452248381595;
	Fri, 08 Jan 2016 02:19:41 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:49 +0000
Message-Id: <22552601170e81b2c3ea62cee46b535a9f41e48a.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 21/53] parted: Fix build with uclibc
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:42 -0000

unlike glibc, uclibc does not have internal APIs implemented for
libiconv, so it needs to depend upon libiconv

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/parted/parted_3.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/parted/parted_3.2.bb b/meta/recipes-extended/parted/parted_3.2.bb
index ff8ae09..30c00c8 100644
--- a/meta/recipes-extended/parted/parted_3.2.bb
+++ b/meta/recipes-extended/parted/parted_3.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/parted/parted.html"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2f31b266d3440dd7ee50f92cf67d8e6c"
 SECTION = "console/tools"
-DEPENDS = "ncurses readline util-linux"
+DEPENDS = "ncurses readline util-linux virtual/libiconv"
 PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
@@ -21,6 +21,7 @@ SRC_URI[md5sum] = "0247b6a7b314f8edeb618159fa95f9cb"
 SRC_URI[sha256sum] = "858b589c22297cacdf437f3baff6f04b333087521ab274f7ab677cb8c6bb78e4"
 
 EXTRA_OECONF = "--disable-device-mapper"
+LDFLAGS_append_libc-uclibc = " -liconv "
 
 inherit autotools pkgconfig gettext texinfo ptest
 
-- 
2.7.0


