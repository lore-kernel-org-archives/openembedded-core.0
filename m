Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9549261A8D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2020 01:42:50 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id dw13so2879307pjb.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 17:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BWFsd4YX2XFbopinKqZmV6lJI3qQTyuAiUn/bl46tDE=;
	b=l3zHUqenc8EJp/KmKL1uhLMzHDzOWwzUHYps03AhapmEM3D9kiNAO4MZ9jWnh8eHzA
	jY9bjg3OjJUlQtPHzTnNieTkovRpKTsrbQ/mt7L+AhwkJk2XLu0q2glfuU2dTXIsFDds
	wso6jO6gkVVhE0SfYixvGAB2nFbR6QcNU/yFyOU8NczWSWhAtSo3s9clqZiFZpseYxzn
	IbZafJ0QJ5mpkybwy63j8XQbEZfSaOrtIokwpuQMsxUI2spQQvvtafncFSX2oaHLzYXt
	R8iaL9hqcQRDjg8Cd6wPAoD3GLhlaLLkEj82Ck1NMAhco/r2wd7zV2uVknZGFuE7jzG8
	yYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BWFsd4YX2XFbopinKqZmV6lJI3qQTyuAiUn/bl46tDE=;
	b=UOy/WKoNz42NpxreSejp4XVr/WG9yn2s6feaOQZtTyaI/RkZgSMHj3d8gX36pJs/bu
	oZRawjQjLBC/RlJzuvK5m4XWVjMNG+fOOxajhSKQtsbnkE0PTn/GVkmkzugwNrgtxvCw
	mgRokY+8Zkud8NCq20YyNV3tzQLNS9GPTq/J2sE99C3rVPmay8dpZXAZ/IO9DV0QCEgW
	5y3jHr/v9SFV2XHmdCOt1l1fW0JNhJ8LQd50WB2fe8hNUz3Iu8qs1QSYDcvQgbydA/x8
	jFVvEf1bxmI631XAe9bRiGtHMMFkzSeoB4CVl5Z0Ij4E/g+JmpnDJf0q4Ebxk4QRlvoq
	374Q==
X-Gm-Message-State: APjAAAVpHRnbo3ahxKv1VM2AOtkOu3D26ORr8uvxzYN4eJjjz63AR/Hf
	hW2UZIEeVd/1OHF5Y70NXrvH328578U=
X-Google-Smtp-Source: APXvYqwF4/AUmk0l/nXvAOQSgw1jOGCUML8EY68RlU0KV7TB/+sBVlU+EMdvDSwZzchO4xp4ppEIjg==
X-Received: by 2002:a17:902:5a42:: with SMTP id
	f2mr11242615plm.19.1583026971083; 
	Sat, 29 Feb 2020 17:42:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1634])
	by smtp.gmail.com with ESMTPSA id
	hg11sm6753702pjb.14.2020.02.29.17.42.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 17:42:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 17:42:59 -0800
Message-Id: <20200301014301.805156-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200301014301.805156-1-raj.khem@gmail.com>
References: <20200301014301.805156-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] dbus-test: Fix QA host-contamination errors
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
X-List-Received-Date: Sun, 01 Mar 2020 01:42:50 -0000
Content-Transfer-Encoding: 8bit

Errors like below are fixed

bus/connection.h is owned by uid 1000, which is the same as t
he user running bitbake. This may be due to host contamination

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/dbus/dbus-test_1.12.16.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.16.bb b/meta/recipes-core/dbus/dbus-test_1.12.16.bb
index bea0e74ed0..91e2ba69d2 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.16.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.16.bb
@@ -70,11 +70,11 @@ do_install_ptest() {
 
 	install ${B}/test/test-segfault ${D}${PTEST_PATH}/test
 
-	cp -r ${B}/test/data ${D}${PTEST_PATH}/test
+	cp -R --no-dereference --preserve=mode,links ${B}/test/data ${D}${PTEST_PATH}/test
 	install ${B}/dbus/.libs/test-dbus ${D}${PTEST_PATH}/test
 
 	install -d ${D}${PTEST_PATH}/test/.libs
-	cp -a ${B}/dbus/.libs/*.so* ${D}${PTEST_PATH}/test/.libs
+	cp -R --no-dereference --preserve=mode,links ${B}/dbus/.libs/*.so* ${D}${PTEST_PATH}/test/.libs
 
 	# Remove build host references...
 	find "${D}${PTEST_PATH}/test/data" \( -name *.service -o -name *.conf -o -name "*.aaprofile" \) -type f -exec \
-- 
2.25.1


