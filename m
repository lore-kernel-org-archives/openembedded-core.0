Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 60DE86FF3D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 18:24:01 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id b136so25308670qkg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 11:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=5Cx5tN7NNvxfQP/bBRNwxbAv9uSFE6U5VgBzA0FSikA=;
	b=BtEOYrjOc9mTQj7EaTlZmQ2b19OelLaQBCe5Kd9fsAjvYxZRHZcMMZxSnDOMXkipGQ
	IT3to7KmVaFLZlhuF8dK0lMFhDEcRSVzURBfCVKM2iajfIquNjTQvJ7jPp+npy1ptp/s
	tWhg4KG9h0Nj812UJL5qJdJm1mLhsRr0KnXO4dbJ4HfKtPTFb8q71WBfXmWyXHWR7fvk
	oP1Ar9cQYoA8Y9KPgMSBPrl9m92sZw9gQVWD9dBCseCaMT0YW6wTZQsWnyfVpMPfKJNs
	Qm8K3Tm3Ysy55b0S490Nq9Ngb3wxWZMGdlhd2xwNxMOPn5Ks15mVZTUWUPHRapyBjULc
	+y9Q==
X-Gm-Message-State: ALyK8tLMS6BubieaKwOPtldBPNLEfpX/uXvpMaRzlSf353jUAR8DCJdwW5cQJyrgXBketA==
X-Received: by 10.55.173.84 with SMTP id w81mr24986279qke.115.1466447042485;
	Mon, 20 Jun 2016 11:24:02 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	131sm21382818qkf.17.2016.06.20.11.23.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jun 2016 11:24:01 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 20 Jun 2016 15:23:55 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jun 2016 15:23:52 -0300
Message-Id: <20160620182354.23988-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] initramfs-framework: mdev: Add a runtime dependency on busybox-mdev
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
X-List-Received-Date: Mon, 20 Jun 2016 18:24:03 -0000

The mdev support relies on the mdev support inside busybox, which thus
builds the busybox-mdev package. Adding the runtime dependency ensures
its installation fails if mdev support is disabled.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 0664a95..e5cf9cb 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -50,7 +50,7 @@ PACKAGES = "${PN}-base \
 FILES_${PN}-base = "/init /init.d/99-finish /dev"
 
 SUMMARY_initramfs-module-mdev = "initramfs support for mdev"
-RDEPENDS_initramfs-module-mdev = "${PN}-base"
+RDEPENDS_initramfs-module-mdev = "${PN}-base busybox-mdev"
 FILES_initramfs-module-mdev = "/init.d/01-mdev"
 
 SUMMARY_initramfs-module-udev = "initramfs support for udev"
-- 
2.8.3


