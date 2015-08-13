Return-Path: <clemens.lang@bmw-carit.de>
Received: from mail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 8C20773D64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 09:15:03 +0000 (UTC)
Received: from exchange2010.bmw-carit.intra ([192.168.100.28]:25655
	helo=mail.bmw-carit.de)
	by mail.bmw-carit.de with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <Clemens.Lang@bmw-carit.de>)
	id 1ZPoWJ-0007tl-25 for openembedded-core@lists.openembedded.org;
	Thu, 13 Aug 2015 11:09:55 +0200
Received: from localhost (172.20.20.163) by Exchange2010.bmw-carit.intra
	(192.168.100.28) with Microsoft SMTP Server (TLS) id 14.1.218.12;
	Thu, 13 Aug 2015 11:09:54 +0200
X-CTCH-RefID: str=0001.0A0C0202.55CC5EE3.025C, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
From: Clemens Lang <clemens.lang@bmw-carit.de>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Aug 2015 11:09:16 +0200
Message-ID: <1439456956-21602-2-git-send-email-clemens.lang@bmw-carit.de>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1439456956-21602-1-git-send-email-clemens.lang@bmw-carit.de>
References: <1439456956-21602-1-git-send-email-clemens.lang@bmw-carit.de>
MIME-Version: 1.0
X-Originating-IP: [172.20.20.163]
Subject: [PATCH] archiver.bbclass: Run after do_unpack
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
X-List-Received-Date: Thu, 13 Aug 2015 09:15:03 -0000
Content-Type: text/plain

In recipes that are exempt from source code archiving due to
COPYLEFT_LICENSE_EXCLUDE, do_deploy_archives does not have a transitive
dependency on do_unpack. Given enough parallelism, this means
do_deploy_archives can run at the same time or before do_unpack.

Because do_deploy_archives does not specify a working directory, its
working directory is ${B}, which defaults to ${S}, which may be set by
a recipe to a directory that is created by do_unpack.

In this case, do_deploy_archives fails because it cannot change into the
non-existent directory. Avoid this problem by always running
do_deploy_archives after do_unpack.

Signed-off-by: Clemens Lang <clemens.lang@bmw-carit.de>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index d908d16..407e538 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -373,7 +373,7 @@ addtask do_ar_patched after do_unpack_and_patch
 addtask do_ar_configured after do_unpack_and_patch
 addtask do_dumpdata
 addtask do_ar_recipe
-addtask do_deploy_archives before do_build
+addtask do_deploy_archives after do_unpack before do_build
 
 addtask do_deploy_all_archives after do_deploy_archives
 do_deploy_all_archives[recrdeptask] = "do_deploy_archives"
-- 
2.1.0


