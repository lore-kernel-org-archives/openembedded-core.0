Return-Path: <net147@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9B4B47396A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 00:46:23 +0000 (UTC)
Received: by padfb1 with SMTP id fb1so67561314pad.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 17:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=EsMYl/arScpAMejAC5AL6A0oQmAixqsH0QkXe1W6rmA=;
	b=eMjuoMCOiQstlW2MZBw8Bx/NiWar6oA+wX2xmcvJlCcJ6vb1jRZB33uoSod+QwnRbB
	3zZV3hygP2EhltHTlvv15oIcGLopXV+ed7UezENIbMbXW6fcomNG4Jv8S2jYhQpszylN
	XpT1VQt40gLAhVaC0GrakRx+RKFIvfvH5gI9zIQG+uE82FpaGk//qLhAoynR5kODsHpj
	aDyu6j1OS4mGwjkWEItZmSL7IY4Oe6nYsJd3aoEWTZlkJ9uS9W5LiC5TWEfwq7OWTMkk
	NMeOCBemEVqpVNvAjkboCqIs0eeAR/6fh0AoFs+kNjveB0Z1X+io/eVlIHctXaAHj3H4
	ZR4g==
X-Received: by 10.70.51.197 with SMTP id m5mr59928198pdo.90.1425948384501;
	Mon, 09 Mar 2015 17:46:24 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	np6sm14001775pdb.80.2015.03.09.17.46.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Mar 2015 17:46:23 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2015 11:45:26 +1100
Message-Id: <1425948326-26628-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [PATCH] kernel-devsrc: fix file ownership
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
X-List-Received-Date: Tue, 10 Mar 2015 00:46:26 -0000

The file ownership needs to be explicitly set otherwise it inherits
the user and group id of the build user.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index e36de1b..dd65788 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -65,6 +65,8 @@ do_install() {
                 mkdir -p $kerneldir/arch/powerpc/lib/
                 cp ${B}/arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
         fi
+
+        chown -R root:root ${D}
 }
 # Ensure we don't race against "make scripts" during cpio
 do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
-- 
2.3.1


