Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2C63160132
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 15:12:34 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id f89so1067169qtd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 08:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=X64yIa59Wn2rWF6gqPSMHiqwT6KcxczkjLxZqC5GxOg=;
	b=lY/RqRf0kGmVOOLP9jIGMRP4RGHS6vPhapDeuppo0oUPYGLbq1PYIGkGo/d7jiNilT
	iib+EAfgkFTQEzFJo237mKZRkKDhl5RdVVxS9hzSGUV2js5vzkeBE1FeHF8HXhgzk0aC
	tyIrncIpY96bK+2evZ4QzEV0QJ2qT6h9EyzRpUvZVnAz2u3otvRObTsByxEjZdUuAMOy
	/+oSXei6qikRlF6KD9bWONcDduRcI8dxBVT7ncZSghh/0a9Z2Wsy2HwIid51th8HTbSj
	MBU5v/hcttyGp/e4w0TwnudPhVeIxJK4dTwkwWUd6swH6PJVLeUac5myDq9Vz8+SJdXZ
	tRqQ==
X-Gm-Message-State: ALyK8tI90eN1Co+cPuuWMnQn13ElAnpdnhqVM8lYKp6gxXjmLUWRnNuS9/P4ghr2zB2PrQ==
X-Received: by 10.200.48.74 with SMTP id g10mr2724286qte.40.1467126755021;
	Tue, 28 Jun 2016 08:12:35 -0700 (PDT)
Received: from localhost ([179.105.243.72])
	by smtp.gmail.com with ESMTPSA id 1sm949859qtv.13.2016.06.28.08.12.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jun 2016 08:12:34 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 28 Jun 2016 12:12:26 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jun 2016 12:12:25 -0300
Message-Id: <20160628151225.11344-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.9.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] runqemu: Avoid duplicating custom QEMU options for AArch64
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
X-List-Received-Date: Tue, 28 Jun 2016 15:12:35 -0000

When detecting the second serial availability we shouldn't append the
custom QEMU options otherwise we will end duplicating those.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


