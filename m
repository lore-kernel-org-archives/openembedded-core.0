Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 393FD61596
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 13:56:20 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c9so24069320wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 05:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OlhYYONmTM/dTbTu3D4cKfvftoKmqx/4Snx5Sdpjdc8=;
	b=IUpC8I5sijKZhpLoisyVVwPW8/lFfu3wJNfBdDMpWZFZm1MOzLVY/xWwDBt9Kt+72d
	a5qLss1gpq6gHPz0fCNCOQgHs+ntq6horozHZAATtBzUAFMP8UelzZVdE9Yjz3N+r//6
	DmR/WNAVoSzikl8X2ige7xh9gzcEdH4ij0X80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OlhYYONmTM/dTbTu3D4cKfvftoKmqx/4Snx5Sdpjdc8=;
	b=Tmoh23Tab/sJ4CAzKhyU90C2SA5SVUk+zXBCdr5WsYpVG+iWfHVwkTafv8F0qk/VmO
	Ci641FGGCQJ3N9xaG05WXtWdqqA4pnjYxICCVb0GvixleYV5qLVelHoJ1Nyu44Yya7N1
	6cfCtyR7HTkNvogdCCpPm5970CJYaD6F2GxXztg2Yf5ZGaYhQaPMhQnFZFswOoSEISg5
	N0RCWSNEIG3aFqF03jLScOptJr/Dk4cPV92X3O0gRi16S7SNsiGRPAzq/9QDFO23G4PJ
	rgeYUfrnIvZbNdB+MA/FCRYsKKVeALoWULwOLrEc3TREzSOUOL5Fhk+1Iaq/vfrGl++w
	yCAA==
X-Gm-Message-State: APjAAAXUxcBKY0IdFuVAevB1s3cN0ihkijxzcuzNtf6L5CofbML8r+SK
	n7jhFBGGQ7bnwqj69Zfc0+WXzjNnKJM=
X-Google-Smtp-Source: APXvYqzzMkQtgsymOppytejDBEkiVtrf7n+gvo2gmuZ/Y+aAwf1fw9VS5xdHwe1SLxi8yM475WwOcQ==
X-Received: by 2002:a5d:5742:: with SMTP id q2mr24123278wrw.145.1582034180614; 
	Tue, 18 Feb 2020 05:56:20 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x6sm6232160wrr.6.2020.02.18.05.56.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 05:56:20 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2020 13:56:19 +0000
Message-Id: <20200218135619.60419-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] p11-kit: Fix builds with systemd
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
X-List-Received-Date: Tue, 18 Feb 2020 13:56:20 -0000
Content-Transfer-Encoding: 8bit

In systemd enabled builds this was failing with unpackaged unit files.
Fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb
index 03c8158ae62..19895ec2690 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb
@@ -20,7 +20,8 @@ GTKDOC_MESON_OPTION = 'gtk_doc'
 FILES_${PN} += " \
     ${libdir}/p11-kit-proxy.so \
     ${libdir}/pkcs11/*.so \
-    ${libdir}/pkcs11/*.la"
+    ${libdir}/pkcs11/*.la \
+    ${systemd_user_unitdir}/*"
 
 # PN contains p11-kit-proxy.so, a symlink to a loadable module
 INSANE_SKIP_${PN} = "dev-so"
-- 
2.25.0


