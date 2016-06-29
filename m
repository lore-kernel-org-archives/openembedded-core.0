Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id D26A660043
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 20:08:19 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id b136so12119787qkg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 13:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=oTM+OjMNUu6bMM7NKjDCnwJvZrVt86Paa2hf+WIeH/8=;
	b=VWze0SZ+jpcBuupov59xpt6LdIWA58K1XI3UqZprzcMwo7SVjzR4/2JyISbG4VC9mb
	tEmB/dB6+xWIdKKocds79h994xUxhoC/eSg9OeqjdwyBaNwTXoUyOCaDfqbolhUVSO4V
	xaeQtDIPsX1epi5YuDVSFefOusFV3ZTgNfOYj7AZAxJfJWkp/Y7H+1tfHagxbF0xItmj
	ZuEUN1G/VzK08jKAEFFG8vFq6jfe3+8IhtP5iRABWYjKtVOxW05ZoCucQTnbNJ/P2zx9
	Z0IgZus6D1xLaJOmVTsNptBOCl9uDvkAb2/FiTmBS4GoceThxu2aYniQv/EvaO6IwaED
	hk1Q==
X-Gm-Message-State: ALyK8tIvQKRTmwCLsEzSxpZzIId3iZqmKCuJ2pPQpLt+ACRa+E3uO1U6CN9MBD6TS8nftA==
X-Received: by 10.55.179.195 with SMTP id c186mr13197113qkf.28.1467230900016; 
	Wed, 29 Jun 2016 13:08:20 -0700 (PDT)
Received: from localhost ([179.105.243.72]) by smtp.gmail.com with ESMTPSA id
	a83sm2734757qkb.11.2016.06.29.13.08.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jun 2016 13:08:18 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 29 Jun 2016 17:08:12 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jun 2016 17:08:11 -0300
Message-Id: <20160629200811.15721-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.9.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] runqemu: Avoid duplicating custom QEMU options for AArch64
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
X-List-Received-Date: Wed, 29 Jun 2016 20:08:20 -0000

When detecting the second serial options we shouldn't append the
custom QEMU options otherwise we will end duplicating those.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- New commit log

 scripts/runqemu-internal | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index ea1a307..3f413e7 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -681,7 +681,7 @@ fi
 # qemuarm64 uses virtio for any additional serial ports so the normal mechanism
 # of using -serial will not work
 if [ "$MACHINE" = "qemuarm64" ]; then
-    SECOND_SERIAL_OPT="$SCRIPT_QEMU_EXTRA_OPT -device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
+    SECOND_SERIAL_OPT="-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
 else
     SECOND_SERIAL_OPT="-serial null"
 fi
-- 
2.9.0


