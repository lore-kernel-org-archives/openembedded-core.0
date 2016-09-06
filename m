Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id CD0B8776F9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 21:41:35 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id w12so11217620wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Sep 2016 14:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8KMrLpEUArZC3bnQu14XXW9GZ4PY2Wx4ebwlckELqSI=;
	b=pdvDVyUd/bA19s7vzl2WIrV/xEvmsy0r7WyERCEEN0arANf1oH91v7bkMziVj9V/av
	O0LZb0xNip5Txk2sT0rw3WV1FKBqmktpvDDGHrJknnag1jkojquoaO8+yh+8+EhvCmgk
	zyfDJ0JyQosep4/ZlmUWkWbRPetLA5TUcDVz+rheiszSKG3nx6oTQBeDHtH4QKkM0SEm
	ezlXShB/bzPj6aHhfoDmXGlpsxBxdUts5oHiNtgxVRNrslWR9FyBAJPBc2jj0/LrPkwT
	mkCOE8EwN0woLwKoALI9cKxpaZbbtAblAQj8rd9YnpGwwZdMDC8f2rZsB10uQJExjrE4
	Z34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8KMrLpEUArZC3bnQu14XXW9GZ4PY2Wx4ebwlckELqSI=;
	b=MxtW9P2O3QVlS+G9qgDURDGUZqejyem2rHPAFUO8Li3Hi2VjrYbLelnFcPTE1nQExF
	8e+GNi/5aHrku1wqThY6YwKD44Oqw2+ESZ2s+g9mOcuH4JWeB05b1gudCbSP1mom+2o1
	PiuqkT17sFBhcKtrujbA60oHfqTNRWEDQq8Lvk2Fk6gmvZ+TJTHJ/YLGKVLMfu6m9RCD
	Dj7f1GeGLVpG1szIk051XcELWDk5cW+RyordQaouPcrDNCOO1SOGk0mPW5Q/7H9dUMCM
	4ByrfRDeYGRkYImwgf/kKnbAT8CvOXWPVTq0Buc/V5xaKeiEQDxnPjFxxfGQZVwcGYR8
	53HA==
X-Gm-Message-State: AE9vXwMHLPya1FVyrBUgNzhdEhsCpoEHpMmRoJk9r12N+01gc1jkYnhDIphSmskrtkvPdw==
X-Received: by 10.194.116.1 with SMTP id js1mr42269098wjb.183.1473198095412;
	Tue, 06 Sep 2016 14:41:35 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2A5F.dip0.t-ipconnect.de.
	[91.10.42.95]) by smtp.googlemail.com with ESMTPSA id
	g141sm827722wmd.1.2016.09.06.14.41.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Sep 2016 14:41:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2016 23:41:23 +0200
Message-Id: <1473198083-19785-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] cmake.bbclass: avoid treating imports as system includes
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
X-List-Received-Date: Tue, 06 Sep 2016 21:41:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

CMake sets all imported headers as system headers. This causes trouble for c++
projects [1].

Thanks to Jack Mitchell for pointing to the setting [2]. Build tested upon
meta-qt5-extra-world which had lots of fallout before.

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70129
[2] http://lists.openembedded.org/pipermail/openembedded-core/2016-September/126067.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/classes/cmake.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 5203d8a..7091f8b 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -120,6 +120,7 @@ cmake_do_configure() {
 	  -DCMAKE_INSTALL_SO_NO_EXE=0 \
 	  -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
 	  -DCMAKE_VERBOSE_MAKEFILE=1 \
+	  -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 \
 	  ${EXTRA_OECMAKE} \
 	  -Wno-dev
 }
-- 
2.5.5


