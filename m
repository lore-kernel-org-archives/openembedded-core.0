Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 05B546DED7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 12:04:41 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id hq4so4649826wib.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2013 04:04:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oovio3PtNrdtvZzUAeI1SJaLkq9hWAsq0lJEmowA1Qo=;
	b=S0oT2weqOP3N2o5EmUXxmPI2NwxJIAnmQaAgs5DYG7kaihQz97kfBMa44mEw/UyeEG
	DjxKrOiQRs9t0nppNdXzzFlngTHlQqklFTlmTpzb1iEizln14jYSG9w/Z+siohM6eaUl
	5bP7KmLh2mVFtV+DKXQqARLJ3PKYbvpkRsfW+YkddyZFMDyGy/83eVO15x+njVNdvc9k
	2rybF4vWgv0eXIQ8Hx1dG0U8Mkr9PLVEvT+HO3miF31lyqzsayNgVgd29zKwsYeReU9q
	k0vWf6QS5zKeGgZfvyatZRyK77kngJmDh3auA+rZ30M/XbnrM6mQGQuF0lVOo5E0rdQi
	Ig0A==
X-Gm-Message-State: ALoCoQl56lTb5yMeA1EWOHMhxp+T7ZlBSWu9T434w6RG4PS4BgIzE4bLBim1s1GzF/CMgEA/96My
X-Received: by 10.194.240.129 with SMTP id wa1mr52694152wjc.31.1385985880871; 
	Mon, 02 Dec 2013 04:04:40 -0800 (PST)
Received: from localhost (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	bk7sm39485841wib.10.2013.12.02.04.04.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Dec 2013 04:04:40 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2013 13:04:37 +0100
Message-Id: <1385985877-6840-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] linux-dummy: catch up with image.bbclass changes
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
X-List-Received-Date: Mon, 02 Dec 2013 12:04:42 -0000

image.bbclass now depends on virtual/kernel:do_deploy, so add a task for that.

This fixes errors like this:

	ERROR: Task do_build in /build/linaro/build/meta-linaro/meta-linaro/recipes-linaro/images/linaro-image-lng.bb depends upon non-existent task do_deploy in /build/linaro/build/openembedded-core/meta/recipes-kernel/linux/linux-dummy.bb

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-kernel/linux/linux-dummy.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index 8a211da..1c837c9 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -31,6 +31,12 @@ do_install() {
 do_bundle_initramfs() {
         :
 }
+
+do_deploy() {
+	:
+}
+
 do_bundle_initramfs[nostamp] = "1"
 addtask bundle_initramfs after do_compile
+addtask deploy after do_install
 
-- 
1.8.4.2


