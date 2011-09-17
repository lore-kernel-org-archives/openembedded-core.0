Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R53IY-0002Z7-NS
	for openembedded-core@lists.openembedded.org;
	Sun, 18 Sep 2011 00:23:46 +0200
Received: by fxi1 with SMTP id 1so3133338fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2011 15:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=iE3iY7cWQYBkOTAswoGt9p0YxpROs+2INQtQEubY2ok=;
	b=csSZXGL/TLr+i1yNrxWi4wywf133A2Ox7/92vWXbxoJMyjOuJzcyVAIIv/B2dtBxS0
	sdM2T/vPJq+oYdTbuqP8ovwQ0bc6sHO29broMcsjZmrVQmMb6MPJW0RXvTfOCkEdbQ3g
	winc1Mfccs1e8/uDWP+iHTpGNSHd0DDjH9DnU=
Received: by 10.223.25.195 with SMTP id a3mr688683fac.139.1316297912709;
	Sat, 17 Sep 2011 15:18:32 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id l20sm16037887fad.12.2011.09.17.15.18.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 17 Sep 2011 15:18:32 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Sep 2011 02:18:14 +0400
Message-Id: <1316297897-698-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 2/5] kernel.bbclass: respect MACHINE_KERNEL_PR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Sep 2011 22:23:46 -0000

MACHINE_KERNEL_PR was introduced long ago in org.oe.dev. It's present in
meta-oe kernel.bbclass. Several machines depend on this functionality.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/classes/kernel.bbclass |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index c577011..b44e3b5 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -20,6 +20,11 @@ python __anonymous () {
     image = bb.data.getVar('INITRAMFS_IMAGE', d, True)
     if image:
         bb.data.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs', d)
+
+    machine_kernel_pr = bb.data.getVar('MACHINE_KERNEL_PR', d, True)
+
+    if machine_kernel_pr:
+        bb.data.setVar('PR', machine_kernel_pr, d)
 }
 
 inherit kernel-arch deploy
-- 
1.7.2.5



