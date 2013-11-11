Return-Path: <layliu@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 301AB6D7E1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 09:28:02 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id xa7so4978983pbc.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 01:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BgIH1xCb/wUFmOBdRlXPHxCeh6xE9uj5povbBEm8HeM=;
	b=CD/MuIxM3s1TRclYHo/elxf0xSr0FQnyOn6Pu+/5GLElj3hhGR8ZNJ+ljBN8L+wN5l
	GK9NG0w/B8dAk01V51Mn3FFiWOy3JjetOayx6Uv3iodBoMh+SJNE6YyVWmz6jCHhJyTe
	wcI5QCD1Y50dWtizVv6QaUB/SKvcDQk52/DNZY/bseeGqoicvnr4cjDVOjkYMNftd3BV
	+Qv9pBH9L8x78oehoaueudTsZYCAa0KiTWF8RhgVdoZg4nI2zoEbPFY/qtpSiQ7jOI8I
	CsJqJct700HObzzd8azxmRW8r8vuBYey5t+cSjAb+ohu+mXzgfCmSFrTnpg62QyJJdoC
	1Ivg==
X-Received: by 10.69.25.38 with SMTP id in6mr906945pbd.178.1384162084377;
	Mon, 11 Nov 2013 01:28:04 -0800 (PST)
Received: from localhost.localdomain ([1.202.252.122])
	by mx.google.com with ESMTPSA id rv9sm29563307pbc.4.2013.11.11.01.28.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Nov 2013 01:28:03 -0800 (PST)
From: Lei Liu <layliu@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2013 17:27:42 +0800
Message-Id: <1384162062-30319-2-git-send-email-layliu@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <no>
References: <no>
Subject: [PATCH 2/2] Fix grep pattern when mklibs collects executables in rootfs
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
X-List-Received-Date: Mon, 11 Nov 2013 09:28:02 -0000

From: Lei Liu <lei.liu2@windriver.com>

File command in some version could print extra space between
"LSB" and "executable" - it causes mklibs can't find any executables
using grep "LSB executable".  Fix the grep pattern to catch
multiple spaces.

Signed-off-by: Lei Liu <lei.liu2@windriver.com>
---
 meta/classes/image-mklibs.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
index 66b0f52..e975f5d 100644
--- a/meta/classes/image-mklibs.bbclass
+++ b/meta/classes/image-mklibs.bbclass
@@ -9,7 +9,7 @@ mklibs_optimize_image_doit() {
 	du -bs > ${WORKDIR}/mklibs/du.before.mklibs.txt
 	for i in `find .`; do file $i; done \
 		| grep ELF \
-		| grep "LSB executable" \
+		| grep "LSB *executable" \
 		| grep "dynamically linked" \
 		| sed "s/:.*//" \
 		| sed "s+^\./++" \
-- 
1.7.0.4


