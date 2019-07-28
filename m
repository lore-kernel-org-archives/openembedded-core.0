Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id D5F277F214
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jul 2019 10:01:15 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id c19so39965486lfm.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jul 2019 03:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JugRUVAycst3scv5c8zUqQRIQ2Pl9vs2bu88gB9vT74=;
	b=GSkA8HO342q3HullitC+DyVZEd6M4EEFcxXBeOdVmm3vbgFmQf5AZXTAARstJK33ut
	ooP//EX80uXbJ7c55zC3lvIiUNoNsR4jnOha6oTs8l8HoRZoYVNWJbGb8qkJeryG/OW/
	iPcPOc0Tx8A1l+3WEkUqzTfbfC45hMow355Y5oSyIfKtMjcg2NNv33cAIHoJ7EptNxkO
	d11e/7kWRIT7uckNC/5jSoRugdfSimn4zGIXRGSBUdS/+0TRdA0p1Z07ygrCOpodLIb6
	QCQ9HhQC45FfrqiVa817dFND+qMbohCvUhjME1khfWMzSHygMuYpe7YgYUE73Ef5kJvl
	xkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JugRUVAycst3scv5c8zUqQRIQ2Pl9vs2bu88gB9vT74=;
	b=mZ9M9LJE4ryZ0ywbVsep1QyXLjMFCipG+2DMA5WFMtqswWcUZsFVkvF3QDtRkTzzHw
	vb+2P0kh1znor6hTKnz/XUMEcRkN7rBE9MRbhOSX6DsmUfwzdX44J0Nxdj5wxAhkQwJR
	TZcy+AiUutbDuEiIrhk2Um2F7Mzk4yB6NtyE+um/4Hp2JnSROobqKA0Dw9aB3GlFMUCX
	M83HdSnqWJEyWE4UUWpISpFcCO92wPlzdECJe65XgkTiz6OLFNF6nNBZ0dPhxyphU0WK
	Rc89aAxbBYTw5l9lH+pQxV0tbo12misXzmBrSqdH7dZY6y2ehKXJAZlrpL3VLQiLXLXy
	q/+w==
X-Gm-Message-State: APjAAAWyHceePpmS+Jfg8w4ezW/IDT4jAH4WIx5Wj/BuGK1eVp6Rv9Jz
	x2MGwL8rK27ArnjbafFzk84wCe5A1H0=
X-Google-Smtp-Source: APXvYqzrBm3ZGJwKfDshWjYuP+y1tqL89tzZMd4mrNFDWOL+VfnGcuO5aZGXcE/rAxkaDCBnG/7Wzg==
X-Received: by 2002:ac2:563c:: with SMTP id b28mr35647572lff.93.1564308075887; 
	Sun, 28 Jul 2019 03:01:15 -0700 (PDT)
Received: from localhost.localdomain ([94.25.228.154])
	by smtp.gmail.com with ESMTPSA id
	u15sm11960939lje.89.2019.07.28.03.01.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 28 Jul 2019 03:01:14 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 28 Jul 2019 13:01:03 +0300
Message-Id: <20190728100103.21136-1-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] kernel.bbclass: fix installation of modules signing certificates
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
X-List-Received-Date: Sun, 28 Jul 2019 10:01:16 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

If one has provided external key/certificate for modules signing, Kbuild
will skip creating signing_key.pem and will write only signing_key.x509
certificate. Thus we have to check for .x509 file existence rather than
.pem one.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a60e15b57814..bf3674238f02 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -454,7 +454,7 @@ do_shared_workdir () {
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
-	if [ -e certs/signing_key.pem ]; then
+	if [ -e certs/signing_key.x509 ]; then
 		# The signing_key.* files are stored in the certs/ dir in
 		# newer Linux kernels
 		mkdir -p $kerneldir/certs
-- 
2.20.1


