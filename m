Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8FBB46E7B0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 14:02:23 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so1090414eae.23
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 06:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=4RzLB/dWdC3rW6W+90rU8r/A4j2bxVvfA/qmguWbg60=;
	b=yEM81ScuvLPEGTNoL8Fk2oMLJ9zCNmS4YNEnrNtfzDBDX0NLF4zEY7KW4+Oh5TSRNY
	FrNAKPa7jLmeFxNcmmHMRxmNG5pg7I0ZkehGKY6AV2GwvdpjTIsrjPyS57cuXwc7kNKM
	BNKdWKcQtO4RDyKW5j5iwwSsMx+ltNoZA8SnzOs2mMWQ6Fk8YdlYXMudfW/0rd8L21yL
	dTxRe/HVbYdpTB521GmcVmCRLHPXIzBq2d/WewUv6yxxX1gIEQPA/qt/j39+btZm8YCd
	lYm3OJUTPqzHtNxqpBHpGeCWIdBlVEJBoi+qS2obS1qH/H64piwTCAF2k+VbooKZb/4L
	9IXw==
X-Received: by 10.15.26.6 with SMTP id m6mr1867520eeu.80.1390053744325;
	Sat, 18 Jan 2014 06:02:24 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o13sm35502542eex.19.2014.01.18.06.02.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jan 2014 06:02:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2014 15:02:40 +0100
Message-Id: <5ab2ec42ef117ebff89094ce0c5e30c07c58a1cf.1390052619.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1390052619.git.Martin.Jansa@gmail.com>
References: <cover.1390052619.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1390052619.git.Martin.Jansa@gmail.com>
References: <cover.1390052619.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] allarch: Set empty TARGET_PREFIX and TARGET_FPU
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
X-List-Received-Date: Sat, 18 Jan 2014 14:02:24 -0000

* set empty TARGET_PREFIX
  This has a bit weird reason caused by unsupported setup where
  external-toolchain is used in some DISTRO only for some MACHINEs
  and internal is used for other MACHINEs.
  Because external-toolchain usually comes with different TARGET_PREFIX
  it was causing allarch recipes to have different signatures even
  when they don't use toolchain at all.
  Empty TARGET_PREFIX also helps to find allarch recipes which still
  have default dependency on e.g. virtual/${TARGET_PREFIX}gcc.
* add TARGET_FPU just for completeness (it was used in icecc.bbclass
  but now it's vardepexcluded there as well)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/allarch.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 3ef1e9c..d41dd4b 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -22,6 +22,8 @@ python () {
         d.setVar("TARGET_CC_ARCH", "none")
         d.setVar("TARGET_LD_ARCH", "none")
         d.setVar("TARGET_AS_ARCH", "none")
+        d.setVar("TARGET_FPU", "")
+        d.setVar("TARGET_PREFIX", "")
         d.setVar("PACKAGE_EXTRA_ARCHS", "")
         d.setVar("SDK_ARCH", "none")
         d.setVar("SDK_CC_ARCH", "none")
-- 
1.8.5.2


