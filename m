Return-Path: <coldnew.tw@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id F00CF7139F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 01:38:59 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id y13so18307950pdi.31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 17:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gy3w0VCV3v9/Rl+TPehc07Byil1j3BRuQQeRcnpf48Y=;
	b=Wh4MtlSg4KXMs6+YlgczxNu82KumyxW2X+ZcC/1zMsWxV5OtqsMn7kFTWuwbea7cjD
	LnuiCvDsGYvovBYN4qC28P93WtjvuetvHWs/2+eTgmGCwQS3+1lcLJk2Y+ibVbl7bOzL
	qdqzDyvhlDDxh9mNrBMi6DohrszyB4WKGri7o5HcN2AXBsMRhGXHiOg5QQ5oFEquuZ3I
	ipUKyqqs9372R+CTL/3ybJNyCkBycVVhT27olQEcJmHzrCSxFMlpvnjLMv4SitaZ7ijH
	U5x1W3udibZjIogq5KtLbTY4XxbSntyI969j9eHhO1fmKa4J67vEjclVYxTRvzvhCczp
	HuVA==
X-Received: by 10.70.25.98 with SMTP id b2mr53633893pdg.10.1419903540446;
	Mon, 29 Dec 2014 17:39:00 -0800 (PST)
Received: from localhost.localdomain ([203.70.194.104])
	by mx.google.com with ESMTPSA id
	lm3sm37048336pab.34.2014.12.29.17.38.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Dec 2014 17:38:59 -0800 (PST)
From: Yen-Chin Lee <coldnew.tw@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Dec 2014 09:38:53 +0800
Message-Id: <1419903533-7766-1-git-send-email-coldnew.tw@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [oe][dizzy][PATCH] kernel.bbclass: prevent rename not exist dirs
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
X-List-Received-Date: Tue, 30 Dec 2014 01:39:08 -0000

During kernel_do_install it will use mv command to make some dirs be
hidden dirs then rename back, but kernel version below 2.6.30 doesn't has
tools dir.

Check if dir exist or not to make kernel_do_install not failed for
kernel <2.6.30.

Signed-off-by: Yen-Chin Lee <coldnew.tw@gmail.com>
---
 meta/classes/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f300fa3..58922c2 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -265,7 +265,7 @@ kernel_do_install() {
 
 	# hide directories that shouldn't have their .c, s and S files deleted
 	for d in tools scripts lib; do
-		mv $kerneldir/$d $kerneldir/.$d
+		[ -d $kerneldir/$d ] && mv $kerneldir/$d $kerneldir/.$d
 	done
 
 	# delete .c, .s and .S files, unless we hid a directory as .<dir>. This technique is 
@@ -274,7 +274,7 @@ kernel_do_install() {
 
 	# put the hidden dirs back
 	for d in tools scripts lib; do
-		mv $kerneldir/.$d $kerneldir/$d
+		[ -d $kerneldir/.$d ] && mv $kerneldir/.$d $kerneldir/$d
 	done
 
 	# As of Linux kernel version 3.0.1, the clean target removes
-- 
2.2.1


