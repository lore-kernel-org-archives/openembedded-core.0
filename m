Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4BE6B7FAA7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:47:43 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w18so12886168wrt.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=uQ18F8h5Pdv8RkMasABBJK4HVU0NyFBPGkvwGBB2MWQ=;
	b=FF27eqCOnRvt1Atqew8m3nZop+InkTKz00BRR5CQvTAIzDV0UFgJ0+vhDi50Xe6JLi
	iAQNbprQ0jEmn77lrTEyZigb/tiHlaHT/RgSTwfbzC5vPEIsnEfRZKxetUE7VETfE5sx
	Nc7TB2CTBHVIsafVuHzp1h2qMW8jce6V9FQfBf2/LGXv2VQFtuqRDyMSH+FhqLzm8b/n
	8i8cFVIwM7znce/NGqvuLSyOVqe73xeAMgo64lXB4DYi07WNE/CNwmfMuDZIdS72W9iS
	KGWAKeHx+FoTxTQzY+uhPPhSBRLhizPqt0xVrjI5NB5T14RVLTFATl1L5QulYCbJcH+x
	qjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uQ18F8h5Pdv8RkMasABBJK4HVU0NyFBPGkvwGBB2MWQ=;
	b=jne9YzOcBC4qT3frbA/sm7PGfi7TtbA0kBofmG+7kXDHKvjeXdfTlH315TLjTDkxbC
	dGHePAKwjejdgkRcEBPjDbnbsdRbTJKb6sktU5tgJVBEpov03hDZ7CURh/cy7HXEeIav
	pJhphiQzWP8Y95aDlIQgM8uv9Ddx025bHyNd1N/MW3I5p0Lt2F6DmhVjhS76lG5rixyJ
	5PO5iG99A1iMKl1mov83cNLEDnEgoDW2ujpV8QAkV47ypyW3GR5OC2vD7N67HhhhseHC
	b1SSh51P7luiWs6GlI6AchaFGlvmGz7VOLOWhnTgpJqYgrpXSzIgNpzTxYofcP/Ufn6Z
	eZnw==
X-Gm-Message-State: APjAAAUikQzRwR70yV95fLqvPvR45/K5CDl9tZDCscYZoszwRmOhHI+6
	UjQ5UEQMalT/FbWHW82SG3Q0RvOXC90=
X-Google-Smtp-Source: APXvYqy4y+P+5wOCznwsmsgXKuvEtOBaEn2b/ZjVg03M5fA4UZm/rUTSZCIjoPK3TWyzzkanFjCnlQ==
X-Received: by 2002:a5d:6402:: with SMTP id z2mr19193607wru.211.1572342463579; 
	Tue, 29 Oct 2019 02:47:43 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	36sm29150537wrj.42.2019.10.29.02.47.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Oct 2019 02:47:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2019 10:47:14 +0100
Message-Id: <c3cfbce4265214fedae71817b04c53e30cf3143a.1572341125.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572341125.git.akuster808@gmail.com>
References: <cover.1572341125.git.akuster808@gmail.com>
Subject: [warrior 01/19] kernel.bbclass: fix installation of modules signing certificates
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
X-List-Received-Date: Tue, 29 Oct 2019 09:47:43 -0000

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

If one has provided external key/certificate for modules signing, Kbuild
will skip creating signing_key.pem and will write only signing_key.x509
certificate. Thus we have to check for .x509 file existence rather than
.pem one.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2527e731eba43bd36d0ea268aca6b03155376134)
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 111a0b2..fb1f493 100644
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
2.7.4


