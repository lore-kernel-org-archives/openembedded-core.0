Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8F6D47317F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 23:30:11 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id b14so104931571wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 15:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=UIkHN+F8m0IT+lEdcf+I5MSPGrYLBxj+Oyl66C40/Ss=;
	b=Ep29zfBUSV1SqMFmwog2RWN3tQ+VwZjoWIeW++gUtnpMwy2y7zGrmyvAR2DWLzLaba
	HM1cTsd2ETUpPSgRjo9/2zxNLLsBB8LjWbh7eIAKOKA6EDL6U/+gBgGCIG9YwMs6dsTJ
	/fBg2X7TDZlvfLRKF9O+//YzwErp7nPW9Rs8ek65y4fa9sQChHlRXWHOoWMscJrZeFkR
	nczUatb0qO6tE7iN3De94rXpjZvuawVn/SRj8P+DBwyM7Qz32poC/0bjaLY7RFpdodmq
	yEgtuJ3zTnX65zGkGtlbWUnmMoB/Xz5/iq7oxtV6Tlst+8PU9xoceTyJAxNs13N9D9BL
	dJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=UIkHN+F8m0IT+lEdcf+I5MSPGrYLBxj+Oyl66C40/Ss=;
	b=S9P88O1d4RfXifbgBcXs/fx2JlsDjFk6rHXycbv0wRTTEpZ4hFcEFVJytrcrXdQPIx
	zBOW+Vl4BBqpAT2vFy55hPoKx+u9hvb2SKGnRUR2RMHHZ8eukRIXWuQ7I00kOHD0m3z+
	KUvpJuPAGpHqJteFjJAQZpODs2cLoFEas6/s0zPXdeQHLd5MoQ1YHFh3aTGqmOrhsX8X
	z1+QKYf1FBhnLWL/imASIvwNm/JOw4hoqqC6GJc8t8SyEA+FK+ZRa40yBvzhzI83UgBf
	HQybARMtDzRSvXUmvIwIdTUqTzO8g/czO2rkf/aYUS7VKhUD2bVbaTP5jqH/WTPffIqT
	va2g==
X-Gm-Message-State: AG10YOQ6AMdop4tHVJNeQ9KlmMMgjrqg7w4R6AK4A/Zp3SkOZCNAXkqZsEhT1RFjgbh8sA==
X-Received: by 10.194.176.170 with SMTP id cj10mr20096917wjc.165.1453764611338;
	Mon, 25 Jan 2016 15:30:11 -0800 (PST)
Received: from localhost.localdomain (p5B0A324E.dip0.t-ipconnect.de.
	[91.10.50.78]) by smtp.googlemail.com with ESMTPSA id
	u4sm21202722wjz.4.2016.01.25.15.30.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jan 2016 15:30:10 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jan 2016 00:29:57 +0100
Message-Id: <1453764597-22146-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH] distutils-common-base: do not set PACKAGES - use defaults from bitbake.conf
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
X-List-Received-Date: Mon, 25 Jan 2016 23:30:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

it took me a while to understand why PACKAGE_BEFORE_PN did not work...

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/classes/distutils-common-base.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
index 11722b8..08511f5 100644
--- a/meta/classes/distutils-common-base.bbclass
+++ b/meta/classes/distutils-common-base.bbclass
@@ -5,8 +5,6 @@ EXTRA_OEMAKE = ""
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
-PACKAGES = "${PN}-staticdev ${PN}-dev ${PN}-dbg ${PN}-doc ${PN}"
-
 FILES_${PN} += "${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 
 FILES_${PN}-staticdev += "\
-- 
2.5.0


