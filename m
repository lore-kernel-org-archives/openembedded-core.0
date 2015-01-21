Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id E73EE6AD01
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 09:07:39 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id bs8so31600349wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 01:07:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UzTvR1l6oZk26aLWcjTXdbYtVX84YDI2QHPFprrPYpI=;
	b=gSNRuVrOQfkmqfLC2BHSfqk2pUpep0U+d9yLuahcuZAuMRpw7ZGS5QjIPJ9hD24APL
	3FsAoQMZJGfLrgwtPTS1QUq2AMaJPs7mav7so0wMvRR28WqaWsK+hli4TQaP4H1KUpq8
	qRPtUbqKQgQoxBEDHNp8CopKREiaN6WBVRE3CGrDxU3MvJ3Zzg8gV1vgGuWGqFUAgWAT
	b91uwrSkMrFFCbc39691RfJFteg/oVMBJCe2QMIoDZMtWFEqnl64xiLlPBAi1EggvZCG
	r5Bbi0N7sjV3/xEtVAU7V+QzFjK2TZdtQvnsHHp2KxL/yf2joJgtDsmAQZz4pGihcDwT
	rDMA==
X-Gm-Message-State: ALoCoQnFwWQ3NpFn1jbvxh5UAi7fZhSQA1rZ53vWvYh1y1TZFxdLg7WtpYivOCpzKxhBd/wktwO1
X-Received: by 10.180.93.103 with SMTP id ct7mr826616wib.77.1421831260311;
	Wed, 21 Jan 2015 01:07:40 -0800 (PST)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id 7sm24613598wjq.29.2015.01.21.01.07.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Jan 2015 01:07:39 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Jan 2015 10:07:35 +0100
Message-Id: <1421831255-3639-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] linux-dummy: provide empty shared_workdir method
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
X-List-Received-Date: Wed, 21 Jan 2015 09:07:47 -0000

Perf.bb (among others) requires access to the kernel source, so have linux-dummy fake that as well. As before, perf will fail to build, but there are use cases where this patch is needed. For example a perf.bbappend that will always build it from the debian linux-tools tarball.

Using linux-dummy is still a bad, bad idea, but it shouldn't start breaking existing use cases.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-kernel/linux/linux-dummy.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index 8f25f17..cc0e4e6 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -33,6 +33,10 @@ do_compile () {
 	:
 }
 
+do_shared_workdir () {
+	:
+}
+
 do_install() {
 	:
 }
@@ -47,4 +51,4 @@ do_deploy() {
 
 addtask bundle_initramfs after do_install before do_deploy
 addtask deploy after do_install
-
+addtask shared_workdir after do_compile before do_install
-- 
1.9.3


