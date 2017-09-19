Return-Path: <tomasz.meresinski@comarch.pl>
Received: from odzwierny0.comarch.com (odzwierny0.comarch.com [217.74.69.8])
	by mail.openembedded.org (Postfix) with ESMTP id 70CE9779C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 10:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	authenticated as tomasz.meresinski@comarch.com
	by odzwierny0.comarch.com with esmtpsa (TLSv1:AES128-SHA:128)(ComArch
	ESMTP) id 1duFti-000Exb-5G; Tue, 19 Sep 2017 12:36:58 +0200
From: =?UTF-8?q?Tomasz=20Meresi=C5=84ski?= <tomasz.meresinski@comarch.pl>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Sep 2017 12:36:53 +0200
Message-Id: <20170919103653.23870-1-tomasz.meresinski@comarch.pl>
X-Mailer: git-send-email 2.12.3
MIME-Version: 1.0
X-CA-Antivirus: Scanned by ComArch Antivirus on odzwierny0.comarch.com
X-CA-Is-Spam: No
Subject: [PATCH] classes/image: fix do_image_qa dependencies
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
X-List-Received-Date: Tue, 19 Sep 2017 10:36:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After do_image_complete IMAGE_ROOTFS directory is empty so qa checks do not work

Signed-off-by: Tomasz Meresiński <tomasz.meresinski@comarch.pl>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 3639aa44f4..7059f947ed 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -320,7 +320,7 @@ fakeroot python do_image_qa () {
         imgname = d.getVar('IMAGE_NAME')
         bb.fatal("QA errors found whilst validating image: %s\n%s" % (imgname, qamsg))
 }
-addtask do_image_qa after do_image_complete before do_build
+addtask do_image_qa after do_image before do_image_complete

 SSTATETASKS += "do_image_qa"
 SSTATE_SKIP_CREATION_task-image-qa = '1'
--
2.12.3


