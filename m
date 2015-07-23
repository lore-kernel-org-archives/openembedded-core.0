Return-Path: <christian.ziethen@linaro.org>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id DEE03761D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 14:32:55 +0000 (UTC)
Received: by lagw2 with SMTP id w2so158742367lag.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 07:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=LrT/6ssC1PCzo941du59hcvT/LS/fxwWX8+xfuNqpy8=;
	b=QFjA2r9pvUtHZXB6jgSJglaDO6Q4ZqXWiFzd+eGYIyRGjDIXIPAdzL9hWzD+HMQ6D3
	1FkXoyR8dmgWD3vcd2b818bejYjVZ9D7ubq7lhIGQKiyinkdL8afiCg9tNdHkFlVVBxB
	yevHSKmMT1eEzer47rSwhwr6bJkenHKj1D4Ke3rfXZRuMrg1lnOS8dV5hAe0Am2K/xY0
	auLmPeHtaHuJ4B6gr85kNGu8QcpQv5ixiinLqWPmXxfAyjo+m3g9K/GfsHcrYIKpjVhf
	pPJvzRUMLrXpKt/bR4D4T5lXQN9r2VMooyqVTfR4y5Bu7sYx9jm+hhJwxXRIq4bB/d8W
	Ekaw==
X-Gm-Message-State: ALoCoQm+E3bYQN99/pPynW9XR4o43CazhGKjbXd47JdNBB2MPuCjiIZUGZppd4K9zqcHZH0t9ZLU
X-Received: by 10.152.8.38 with SMTP id o6mr8425991laa.116.1437661974630;
	Thu, 23 Jul 2015 07:32:54 -0700 (PDT)
Received: from chzi-linux.enea.se (sestofw01.enea.se. [192.36.1.252])
	by smtp.googlemail.com with ESMTPSA id
	z1sm1060444lbj.11.2015.07.23.07.32.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jul 2015 07:32:53 -0700 (PDT)
From: =?UTF-8?q?Christian=20Zieth=C3=A9n?= <christian.ziethen@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 16:32:29 +0200
Message-Id: <1437661949-9295-2-git-send-email-christian.ziethen@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1437661949-9295-1-git-send-email-christian.ziethen@linaro.org>
References: <1437661949-9295-1-git-send-email-christian.ziethen@linaro.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] boot-directdisk: Make kernel image inclusion conditional.
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
X-List-Received-Date: Thu, 23 Jul 2015 14:32:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When building for qcow2 and a dummy kernel, avoid installing
a non existing bzImage.

Signed-off-by: Christian Ziethén <christian.ziethen@linaro.org>
---
 meta/classes/boot-directdisk.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index d256fff..600e21a 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -70,7 +70,9 @@ boot_direct_populate() {
 	install -d $dest
 
 	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
-	install -m 0644 ${DEPLOY_DIR_IMAGE}/bzImage $dest/vmlinuz
+	if [ -e ${DEPLOY_DIR_IMAGE}/bzImage ]; then
+		install -m 0644 ${DEPLOY_DIR_IMAGE}/bzImage $dest/vmlinuz
+	fi
 
 	# initrd is made of concatenation of multiple filesystem images
 	if [ -n "${INITRD}" ]; then
-- 
2.1.4


