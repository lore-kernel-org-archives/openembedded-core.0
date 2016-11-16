Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 0490C6E650
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 11:40:20 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	uAGBeKhi018398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 12:40:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1479296420;
	bh=017mF5ZRZtsDWWZeoEoXpA7ZTL8s7wnwrEbOG293eEE=;
	h=From:To:Cc:Subject:Date:Message-Id:Sender;
	b=FvBTGAoIYejTrhdIvSmTcSacUFNJGtMGrtqcpS9rMIFocNjxVkfp/cRnG11WanFrN
	36sIqNw2gW7eK5bJagX8EPCALRkQDKSmcUKdDCc6uo+dWPqzx3cob3Ovu2KXlnuWF0
	M+uK7TfJwR0JqLXvHT1jhiCyVD/EFtQS69P+iX2w=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	uAGBeCuQ019371 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Wed, 16 Nov 2016 12:40:13 +0100
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 79B37A6B23C;
	Wed, 16 Nov 2016 12:40:00 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	uAGBeADf019368
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 16 Nov 2016 12:40:11 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.86_2) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1c6yZO-0000cd-V5; Wed, 16 Nov 2016 12:40:06 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2016 12:39:56 +0100
Message-Id: <1479296396-724-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.5.5
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -6.8
X-Spam-Level: ------
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.78
Cc: Enrico Scholz <enrico.scholz@ensc.de>
Subject: [PATCH] sanity: removed broken compiler check
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
X-List-Received-Date: Wed, 16 Nov 2016 11:40:22 -0000

From: Enrico Scholz <enrico.scholz@ensc.de>

The compiler check is broken because it checks for the existance of
${CC} as a file.  This fails with ccache with

|    Please install the following missing utilities: C Compiler (ccache
gcc ),C++ Compiler (ccache g++ )

Remove this check for now.

Signed-off-by: Enrico Scholz <enrico.scholz@ensc.de>
---
 meta/classes/sanity.bbclass | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 7388da6..46f54df 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -669,12 +669,6 @@ def check_sanity_version_change(status, d):
     if not check_app_exists("${MAKE}", d):
         missing = missing + "GNU make,"
 
-    if not check_app_exists('${BUILD_CC}', d):
-        missing = missing + "C Compiler (%s)," % d.getVar("BUILD_CC", True)
-
-    if not check_app_exists('${BUILD_CXX}', d):
-        missing = missing + "C++ Compiler (%s)," % d.getVar("BUILD_CXX", True)
-
     required_utilities = d.getVar('SANITY_REQUIRED_UTILITIES', True)
 
     for util in required_utilities.split():
-- 
2.7.4


