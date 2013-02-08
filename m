Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U3w2D-0008NI-2W
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 23:03:07 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so1927732dak.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 13:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=7AyqnOSUlPMzAlBcSDfWo4mDh+f9iM9JTSIBIb47730=;
	b=TK/fpRBt48HjBlZSjloJkbAfAwQpLA94d3ckoklMSMFhly3V8nj4iHRbfrDb1Dw6KA
	Je+PJBWdXYXZ071YOCUYRvYZu3e1owtFe2PVvES8Nzbp4JywMTh91+8dFBxVlQ/IbvEl
	9B8J+HaMyhYFDPU91/Ttw6Q8gwlrCajR6ouW965i/vCcanmUPkP880r9zreUBW5Btj+g
	iEEG9aSKdWTLGGY/OMy3/Hw17NNvwIe3M9pk6owmyQp4LhlTnOZChcJgfa8vXpYFBpmc
	paGawVC2zj3CVdeQqEJ593oEpmknqBMDbmmgz9tyUZT2q+cxHEQSihiehRmOhFs4c9gD
	FeJQ==
X-Received: by 10.66.75.136 with SMTP id c8mr21414171paw.25.1360360028861;
	Fri, 08 Feb 2013 13:47:08 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id f9sm57396130paz.12.2013.02.08.13.47.04
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 Feb 2013 13:47:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2013 13:46:35 -0800
Message-Id: <1360359996-13509-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] nfs-utils: Create the default statdpath
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
X-List-Received-Date: Fri, 08 Feb 2013 22:03:07 -0000

packaging these extra directories is needed
Otherwise rpcbind wont start as it
expects /var/lib/nfs/statd to exist.

This fixes the issue where automounter fails
to mount since rpcbind did not start correctly

Failed to open directory sm: No such file or directory

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nfs-utils/nfs-utils_1.2.7.bb                   |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb
index 5bad6f1..cf51f21 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.7.bb
@@ -56,6 +56,7 @@ RDEPENDS_${PN}-stats = "python"
 
 do_install_append () {
 	install -d ${D}${sysconfdir}/init.d
+	install -d ${D}${localstatedir}/lib/nfs/statd
 	install -m 0755 ${WORKDIR}/nfsserver ${D}${sysconfdir}/init.d/nfsserver
 
 	# the following are built by CC_FOR_BUILD
-- 
1.7.9.5



