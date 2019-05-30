Return-Path: <andrei@gherzan.ro>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6A5937E409
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 12:22:38 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 7so3699433wmo.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 05:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.ro; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=UvrY+CJTc0O1idMQ1BhYJnL8eQCU5wdkmZhQaNOxIw0=;
	b=hiYrJnJV2BBVQT3Lw782IN+Qz7mWmRLZhnCu+oUdn1z8QQ547ewZ/KfeaC84IaWfKg
	ty/4uQlicnD4PTItcDcz/9PWh6NRi33ij8nd2RualpU4pLyny9/Q0LXHumB5KsoX3ezD
	OxInWMilIe3NS4EWIDFROqjQirWVYUYTke9AYSTOHT9VLPEcbtEF3/VryxB8xKNdgySH
	eqBKfQrpu9xYEGZGXOe8ITqno1TaLCErBvFpCWRmoI9A+7HuYXYWAAwmHItbsqWUsxHS
	9W2y/tJxk+UKjmFiGW9xTK2eqGNEOD7NN5JJwO1J7vNxH5c66OFHZ9vADOOAdkUTlXLo
	zPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UvrY+CJTc0O1idMQ1BhYJnL8eQCU5wdkmZhQaNOxIw0=;
	b=EqCF2GG87VG9RDaTlJnnFZRtqys3RPbhEXLemsnDF1nvYbQ+dwt8QBaazJSF0qipvm
	USwYQzYsVyQ3Swy1kLjk3y2bkvo7fAJEP3+iq5SwbP3GKEKinkVHpIcgHK2utKS7kpyI
	7c3EIHalnkqPKMOwJGZDlYTwmMr4MTAsnWaasFb5bSi7+bjLC1qEwTWc2Ud5JpG759uC
	xBeB9oKv8GYzortVZEDz45fk/k1EQigEsZH7E5BwhsT58XTHQaQXyNLonGk69fyvU/iy
	1jBwah8kAbwhm/FsRgpPaGN0tMJQSPJdjdvHish2GgQ+SIpxKqeWXUkYnwKHWdWVX9QP
	aggQ==
X-Gm-Message-State: APjAAAVY+sgrnNj0Qnm6a6MdwapqnXXNaWhpXtbeJB+FtquqgfGMFei4
	hwlKt1Ez8kxNSvk+w+F7lfe/Fg630Y0=
X-Google-Smtp-Source: APXvYqzee7vOYY1FIDSt6IfdMrCPOn5eIM71eHT+2KGTUurq2mDl3opz46L4vCoUb8KdmnVaxteD2w==
X-Received: by 2002:a7b:c8cb:: with SMTP id f11mr2092996wml.54.1559218958781; 
	Thu, 30 May 2019 05:22:38 -0700 (PDT)
Received: from localhost.localdomain (host90-152-4-101.ipv4.regusnet.com.
	[90.152.4.101]) by smtp.gmail.com with ESMTPSA id
	h12sm2375185wre.14.2019.05.30.05.22.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 05:22:38 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 13:22:23 +0100
Message-Id: <20190530122223.9083-1-andrei@gherzan.ro>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH V3] ca-certificates: Fix openssl runtime dependencies
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
X-List-Received-Date: Thu, 30 May 2019 12:22:39 -0000

Since yocto thud, and more specifically since poky switched to
openssl 1.1 line, the openssl binary is provided by 'openssl-bin'. This
impacts the native and nativesdk recipe variants as well.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../ca-certificates/ca-certificates_20190110.bb               | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb b/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
index 4c0425302f..efd9eaa71e 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20190110.bb
@@ -82,6 +82,8 @@ do_install_append_class-native () {
     SYSROOT="${D}${base_prefix}" ${D}${sbindir}/update-ca-certificates
 }
 
-RDEPENDS_${PN} += "openssl"
+RDEPENDS_${PN}_class-target = "openssl-bin"
+RDEPENDS_${PN}_class-native = "openssl-native"
+RDEPENDS_${PN}_class-nativesdk = "nativesdk-openssl-bin"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


