Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id EC9376FFA1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2017 08:05:22 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u63so8837683wmu.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2017 00:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=DJ9GkCN97esouVvNf5k0lU2fgim46pWYez/ZFL3tjMY=;
	b=dqkb++h1RDYiQka9Q5o8sn/hj98fUgFgmYu6N6TcirSNvIIep4djSEHxP8N+P3nJtG
	2vQaEovFOsHPe5I/NsSYnHrmCMsVr4p+sSAs+wQDvhX9nsrg0+o5YjMJCqxEagTSnehF
	FeywWAwizbG86Zl2XeTYvV/3/hkd6tgoMMUekkw7e6vlA0R2KP19C9SNyzA6XmgQHdvp
	R2PLp/Cm6eh5o1mht0uHP9aWBfqnShHPSa4vrN9XVUd1ySu1SE4IQX3ls5kUvqmbHN7A
	jQVeC+sIJ3ioOkRZZib/H+QygLSxBb0aPzIECpZ6siMhXT7tQIR3NMmasuFK1+T3dfeq
	6zNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DJ9GkCN97esouVvNf5k0lU2fgim46pWYez/ZFL3tjMY=;
	b=EQ+pO6yNpEsqKqRR5wI6SbKCjo1o32KWKBXSr2w+kvzUhjZqeXlLrWrx3SSeZCVQoF
	TZJSM3UEsViBJZNo4nVdYYgws5uGzeflkQ19RQvc6ovONo7P5xg3KEHS1eNg6vMj++5m
	LoOt8s8SjdblC1LODcVWUin0wpNuiCjYzt7KXLTQEH3aVeVMDf5wOqICV9klD4/LdJ0r
	ogN/1iUsiHqCqkOZ7or94m6p1lY7d7nyQX/LhMIE3/aiLK4yl1C85587zUkkd4vbES4y
	cDT+xBdO8Zr918Hubfd09m6fWdxPk+eUVfM8j/S9HofX0aH/nxXB6yAb9sTyBMr0ZabU
	Q/KA==
X-Gm-Message-State: AMke39kPkqbQj0d5Dt6qVguCVLr7h5Cbm7I94aYk2BPgisbVFd81/X+WnUDR2QxV7KCerA==
X-Received: by 10.28.68.10 with SMTP id r10mr9461245wma.68.1488096323258;
	Sun, 26 Feb 2017 00:05:23 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([117.136.38.27]) by smtp.gmail.com with ESMTPSA id
	o106sm8575601wrb.63.2017.02.26.00.05.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Feb 2017 00:05:22 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Feb 2017 09:05:11 +0100
Message-Id: <1488096311-20449-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] generate-manifest-2.7.py: fix python-tests rdepends
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
X-List-Received-Date: Sun, 26 Feb 2017 08:05:23 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

A potential flaw was introduced by commit a8dc4bc0:
[ python: fix python-tests rdepends ]

It made python-tests RDEPENDS on python-modules which is correct, but
this should be done in generate-manifest-2.7.py, and re-generate the
manifest.

Fixed by adding this dependency in generate-manifest-2.7.py as well.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 scripts/contrib/python/generate-manifest-2.7.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index f2ecf8d..c8f305b 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -360,7 +360,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-terminal", "Python terminal controlling support", "${PN}-core ${PN}-io",
     "pty.* tty.*" )
 
-    m.addPackage( "${PN}-tests", "Python tests", "${PN}-core",
+    m.addPackage( "${PN}-tests", "Python tests", "${PN}-core ${PN}-modules",
     "test" ) # package
 
     m.addPackage( "${PN}-threading", "Python threading & synchronization support", "${PN}-core ${PN}-lang",
-- 
1.9.1


