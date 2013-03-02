Received: from mail-da0-f41.google.com ([209.85.210.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBqKi-00022T-AZ
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 18:35:12 +0100
Received: by mail-da0-f41.google.com with SMTP id j17so1895030dan.28
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2013 09:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=ORenqhywNxLdLay/jJLyc3xcjqeUEQjfhLutBKB0hbg=;
	b=uZ/Xmey+C4lD/GmMGHVkXNucRRapUBMZBGgwxf56BFv2GIFT6xBHwxRbfORSadnlfN
	c5VzrZ8Fpf+j7fhoNPmt8/VReI3hhkkR2w314w98FYWZBXpgagbs4IxAuUz/rk8DzQS/
	xTMNHVfnjqI8mhr16yQ/21JcNgXJu6JSUmarjQ1eyFpLtW/hL6hJjPGkw3DGdNDzIzhN
	fnnBmbeOM/aCI3jcO7DhqxyGLieTwfaI6jktcTzb12zJtsg35ZgrPY1rfhEsah4gCtRS
	6TigxH80qP5gJLIpiI7OIBArythw2/bu7ZBqFrH1Chv7LqntkC67SB63pgX3ZBocITgh
	Pvsw==
X-Received: by 10.68.220.230 with SMTP id pz6mr20259887pbc.46.1362244706565;
	Sat, 02 Mar 2013 09:18:26 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qf7sm16109570pbb.2.2013.03.02.09.18.22
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 02 Mar 2013 09:18:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Mar 2013 18:18:15 +0100
Message-Id: <1362244695-31538-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] bitbake.conf: move PERSISTENT_DIR outside TMPDIR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 02 Mar 2013 17:35:17 -0000

* PR service cache needs to be persistent between rebuilds
  having it in directory starting with tmp* does not help
  people to understand that it needs to be persistent, so
  move it to TOPDIR

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b1c8dac..3afaf4a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -327,7 +327,7 @@ FILE_DIRNAME = "${@os.path.dirname(d.getVar('FILE'))}"
 TMPDIR ?= "${TOPDIR}/tmp"
 CACHE = "${TMPDIR}/cache${@['', '/' + str(d.getVar('MACHINE', True))][bool(d.getVar('MACHINE', True))]}${@['', '/' + str(d.getVar('SDKMACHINE', True))][bool(d.getVar('SDKMACHINE', True))]}"
 # The persistent cache should be shared by all builds
-PERSISTENT_DIR = "${TMPDIR}/cache"
+PERSISTENT_DIR = "${TOPDIR}/cache"
 LOG_DIR = "${TMPDIR}/log"
 CO_DIR = "${DL_DIR}"
 CVSDIR = "${CO_DIR}/cvs"
-- 
1.8.1.4



