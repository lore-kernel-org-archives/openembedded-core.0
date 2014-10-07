Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 0721E71186
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Oct 2014 12:07:47 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s97C7ksY006470
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Oct 2014 14:07:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1412683668;
	bh=/Y16z/iv1iMpZjn2nmkkN3RXMELefNWQAwyajFpin6w=;
	h=From:To:Cc:Subject:Date:Message-Id:Sender;
	b=iP9Z4bs/lh/t6XdUBWMtM7ImgaHbBWW6CvHsa/jD8PywReDeNPEvcvtMsXBiimGmS
	/Ih90KMWp4lD3IASRx1aSdLPFEDXEI4XNnbTOma446UXTBzAqR1lq81QVEnb0jYNH7
	Q3JmYmtlj4EiVT4YM9yg5Ixt4MSK8TjJzWhFo9Bk=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s97C7g7D022591
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Oct 2014 14:07:43 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1XbTYM-0007vr-9j; Tue, 07 Oct 2014 14:07:42 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Oct 2014 14:07:33 +0200
Message-Id: <1412683653-30457-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.9.3
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.0
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] dosfstools: place files in /sbin, not in /usr/sbin
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
X-List-Received-Date: Tue, 07 Oct 2014 12:07:48 -0000

systemd expects fsck programs to be located in /sbin and fails for
dosfstools with

| Checking was requested for ..., but /sbin/fsck.vfat cannot be used: No such file or directory

Other fsck programs (e.g. ext4) are located in /sbin already so move
vfat programs into this directory too.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/recipes-devtools/dosfstools/dosfstools_2.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
index a6a7ddc..b59b250 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
@@ -27,7 +27,7 @@ SRC_URI[sha256sum] = "0eac6d12388b3d9ed78684529c1b0d9346fa2abbe406c4d4a3eb5a023c
 CFLAGS_append = " -D_FILE_OFFSET_BITS=64"
 
 do_install () {
-	oe_runmake "PREFIX=${D}" "SBINDIR=${D}${sbindir}" \
+	oe_runmake "PREFIX=${D}" "SBINDIR=${D}${base_sbindir}" \
 		   "MANDIR=${D}${mandir}/man8" install
 }
 
-- 
1.9.3


