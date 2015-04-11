Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8B09073D41
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 01:21:09 +0000 (UTC)
Received: by pdea3 with SMTP id a3so39367459pde.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 18:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=9skz1fg4jb3fzZS08QLAlfGJU1JV7ag+wWL2HufePbs=;
	b=sH0Qn/elSp6FWrQN2ciVD+U3petIUxU21TsBVneQo/qChjqIjc3nx2sgZOCRa/fisI
	1j7hXJfF+T6K/N3iWS1RPDPiMCH7HJlaplIZt65LWm3Y3WW/p6gU7s3GjUV9FtntXmVo
	V/a2F5ikJWorYrn3/iBPmIoUVSw8rlqQ9XxuaqgXeIVKrDNFUCS14ouUrHV++Kk9w72S
	/upYcz6xTX0lkMudKLGaFIujdHOViYfHRIi1LhGVzWU2QIIO6uDn4kQGyhhTn+0QLe9+
	LHWRTLHTA2n6JZz51wz3XZkgG3qdpqPW/JMbjP8ldXVitgiShgxYGZ9wNGJ10WY3JJ62
	tWSA==
X-Received: by 10.70.135.168 with SMTP id pt8mr7258704pdb.8.1428715270911;
	Fri, 10 Apr 2015 18:21:10 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id nb10sm259984pdb.76.2015.04.10.18.21.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Apr 2015 18:21:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2015 18:20:48 -0700
Message-Id: <c8117308ef5d12d8bdeb088d2bea4dff4bb686ff.1428714999.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
References: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428714999.git.raj.khem@gmail.com>
References: <cover.1428714999.git.raj.khem@gmail.com>
Cc: Khem Raj <khem_raj@cable.comcast.com>
Subject: [PATCH 17/17] e2fsprogs: Delete identical binaries and create symlinks instead
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
X-List-Received-Date: Sat, 11 Apr 2015 01:21:09 -0000

Here is what build history tells now

e2fsprogs-tune2fs:

-PKGSIZE = 144336
+PKGSIZE = 72175

e2fsprogs-e2fsck:

-PKGSIZE = 1345500
+PKGSIZE = 269124

e2fsprogs-mke2fs:

-PKGSIZE = 551316
+PKGSIZE = 111036

Change-Id: I0902484ad506d892292c4bea6789467179b5ea8d
Signed-off-by: Khem Raj <khem_raj@cable.comcast.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index 66065bc..e6ff5f9 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
@@ -43,6 +43,9 @@ do_install () {
 	rm -f ${D}${base_sbindir}/blkid
 	rm -f ${D}${base_sbindir}/fsck
 	rm -f ${D}${base_sbindir}/findfs
+	rm -f ${D}${base_sbindir}/mkfs.ext*
+	rm -f ${D}${base_sbindir}/fsck.ext*
+	rm -f ${D}${base_sbindir}/e2label
 
 	# e2initrd_helper and the pkgconfig files belong in libdir
 	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
@@ -50,6 +53,11 @@ do_install () {
 		mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
 		mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
 	fi
+	for ext in ext2 ext3 ext4 ext4dev; do
+		ln -sf mke2fs ${D}${base_sbindir}/mkfs.${ext}
+		ln -sf e2fsck ${D}${base_sbindir}/fsck.${ext}
+	done
+	ln -sf tune2fs ${D}${base_sbindir}/e2label
 
 	oe_multilib_header ext2fs/ext2_types.h
 	install -d ${D}${base_bindir}
-- 
2.1.4


