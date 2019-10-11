Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id D80476BC19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 08:16:53 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 5so9460810wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 01:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Iict8K2aWiAw2pk1YK3/BzAGI8M/IAhg9mM2exQVhf8=;
	b=DMOFryqaBTDjWezvlupkb67RLmjfe54FG8R/zWMSVnm6wCqYX8Vv9ly4XxVbUioFY/
	o13y4LnZD1jCzs+F1lTxhBBasI+ULi8XgamCluhiq69i70a+QF3ApNn1ygFnDcz/V1qB
	+lIKc5lHMWo5QKCJsmu2YXoUvfKwdoMw98/aWJu2jMR+b+G2EGU/mFswmvt6rC4dR/aV
	u39i8FiuSMzA4y6TZYlzeuitTZ6SqtI7K+D4PJQi/33mSLRWlLpOpi4tV6Aj1dtptnyV
	ljW5IFUvIYY5hR9FoSBqzaRDfxF2kK3EX01L00PkO+Z2ywvoRoKs59k3SgsNJmgWQ+Ww
	2CGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Iict8K2aWiAw2pk1YK3/BzAGI8M/IAhg9mM2exQVhf8=;
	b=r9M5N1pSBuSzeZIP+uM8pUpyZ5l443kQjq8AIh0DloeuVL5EA1bXtLxeyGY41T0Prn
	xqTakG/8cRDavatZiMwQzEGz1pZLG1RKEhHZH34fBq/x3LRd223S1u8O+mB3IprcSTvz
	o97+nbthQIxvifBuPgSF81ZFkHSTaZbBMHcdNuskTuBfdiuRCBqRv3gifXBUA57SnKGi
	wm2AyFWibUaTLa54jxfRPzbRX5aThYDj6f2yxwhFpe8cK+IfqISK5hQfwAkR2suEa8c/
	9g6qAv2N6uq9RmyVkHT8VtFedyBPjanguoCCNbZ3YWpkUMhqJ2YhLO1gomv9NdKmKwg5
	QlCA==
X-Gm-Message-State: APjAAAUGNal1nFZJWeGXYaEGUo/7U9X96sxUBwC2A1ijiaaMUuin13AA
	T82wai88AfGj7ZJD4tg4nvF7bg==
X-Google-Smtp-Source: APXvYqwt9Q2LrMvpFAjYJ+/47o6zzjWSUvSQuQhjC7GYKNw6FJwUw5dQTrpnYASoP+CRMH/s59MBOg==
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr2120017wmj.11.1570781814375; 
	Fri, 11 Oct 2019 01:16:54 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8])
	by smtp.gmail.com with ESMTPSA id v6sm1408995wru.72.2019.10.11.01.16.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Oct 2019 01:16:53 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2019 10:16:49 +0200
Message-Id: <20191011081649.18474-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [warrior][PATCH] kernel.bbclass: fix installation of modules signing certificates
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
X-List-Received-Date: Fri, 11 Oct 2019 08:16:54 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

If one has provided external key/certificate for modules signing, Kbuild
will skip creating signing_key.pem and will write only signing_key.x509
certificate. Thus we have to check for .x509 file existence rather than
.pem one.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2527e731eba43bd36d0ea268aca6b03155376134)
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 111a0b2eeb..fb1f49327c 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -453,7 +453,7 @@ do_shared_workdir () {
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


