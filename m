Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id CF6E470018
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 19:13:51 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id n62so8758645qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 12:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=oCcdXwbt0DqZGlNNFvwCSTKHdKFt40HfqnX46eL8qHA=;
	b=RuFuFlcpc2dzgN4Q2crV/nCEdrxk6l25xOg1zwkurZMXDzbF0nFjm0DjBnLc5iqk+q
	leIG0//GdJKab3Uq81W3W3xy8M8JP2rs/rfZl/B2yT3kNeuvt2LAaqz1G6jJA588Ccyu
	MdMeFkQvqeTUtyo0QoxvK91t9q8V4tYosfr4YPj2t9YYzFHNl9UYek0YK0SyBiZbWy5O
	E84w17UNTfytqblJkMUqBYuOXPjRWkQSJJfcuhf6HbYSkjt8bGTgqzHmIwqhz9iBMULz
	qzwltmSzhdcvkORt49NszTwD44Lj8GhVBejMDrgMrUs696hjz94PuEixuaqoeNrf7mHv
	woEQ==
X-Gm-Message-State: AOPr4FVcv3is9e0jVveYvgrZ6G2XYwU5gPtxNpMefGv+PPkNACrSZxkN5GvVlUPtCjNxrA==
X-Received: by 10.55.31.166 with SMTP id n38mr25526583qkh.147.1463426032413;
	Mon, 16 May 2016 12:13:52 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id 76sm6708078qho.16.2016.05.16.12.13.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 May 2016 12:13:50 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 16 May 2016 16:13:42 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 16 May 2016 16:12:06 -0300
Message-Id: <1463425932-10080-9-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
References: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v6 08/14] weston-init: Rework do_install to use install -D option
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
X-List-Received-Date: Mon, 16 May 2016 19:13:52 -0000

The install -D allow for the parent directories to be created in a
single command line, reducing the code and number of fork during the
build.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 meta/recipes-graphics/wayland/weston-init.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 653541e..4ad62cf 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -8,11 +8,8 @@ SRC_URI = "file://init \
 S = "${WORKDIR}"
 
 do_install() {
-	install -d ${D}/${sysconfdir}/init.d
-	install -m755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
-
-	install -d ${D}${systemd_system_unitdir}
-	install -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}
+	install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
+	install -Dm0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
 }
 
 inherit allarch update-rc.d distro_features_check systemd
-- 
2.8.2


