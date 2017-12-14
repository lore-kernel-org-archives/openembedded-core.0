Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1B60D78784
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 01:00:37 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id b18so2286441pgv.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 17:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YwV3OqdQwn+/7hZ5YW/miTnCwLtViXvmsGyqAlXyLpQ=;
	b=CRGJWfSEI2nLjhYLgmO6RXJIj2h7WaizxBn4HHh6BPl94/zCGjz9YnVZHXibOhFUpm
	IPu1HkyIbyhDZY05iYilQf2YJ6OBEiullEBrd2jWKL9SHfb5/5HjhpyoHpOqhyFgzwfn
	SNlLf3aYtEZmCXC+zTJRxuEBxfb0WaG1bFh6OMNiN+B0djusnJwja4byQ7Ilp2pz6KIs
	my/rZanx+XyAanIhx8eMKmWC1jem07k809oBHUA3e/U268Qn/sf9dje3JK5hd1I37ZuC
	kBVBaugqWxs6WVzs0gFbIgkyrFlEueCCDSx44+xht0fSmBIRG69zhahCXmEATtIj42AT
	pQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YwV3OqdQwn+/7hZ5YW/miTnCwLtViXvmsGyqAlXyLpQ=;
	b=U4gdpaDRGvfdyichsaBmr35PlydzIjD6HvZ2ZRmFiz/HwHdhSD1SRNJD0TLLpGu0qQ
	BT4X313DzyZdMNv7PSeR39G/ohKurrKB/LOIFdBmTuc6SsKhH8RQmijWJbNIKqlv6umc
	dDwlC9S5DdSJ5LOwgR1dXgiuN0IHo8xMGGh8n7fpIiyHsuQyKOEoU+SASBtFh7gi1c2B
	wogglQhm8ByjC1IReH53f9UL32IEVJqYBzidQs5G4AdoHsreEH3zDRlrbic23a+wJErE
	SUEu+PyVKY1DV75kQVGri0pcZ3Xg9N1Ude8aIbfUynyazmIYyQtc0cqoNxgiPFrH1JFI
	R2WA==
X-Gm-Message-State: AKGB3mL0X3Nz0e5A83YN+K0fRmJ81cWPZEwlQsgf1x3lntGfHaqYkpAK
	DQbP42zXn3mYHuWFIddhmcCYmw==
X-Google-Smtp-Source: ACJfBouxjgJQXvJ5cRMYVLMjvRzIZI/TIjjmBjW7PwNc+rDtGLCSoSVLhIg/NONjJD7YDzYlS38q0w==
X-Received: by 10.101.97.173 with SMTP id i13mr6879773pgv.449.1513213238757;
	Wed, 13 Dec 2017 17:00:38 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	x21sm5460451pfi.174.2017.12.13.17.00.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Dec 2017 17:00:37 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Dec 2017 17:00:31 -0800
Message-Id: <1513213231-16818-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [morty][PATCH] cmake: avoid configure failures if CFLAGS contains -Wstrict-prototypes
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
X-List-Received-Date: Thu, 14 Dec 2017 01:00:38 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 0c89b010ce2e426f55ac7c6f94befef988913834)
---
 meta/recipes-devtools/cmake/cmake.inc              |  1 +
 ...void-gcc-warnings-with-Wstrict-prototypes.patch | 42 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/avoid-gcc-warnings-with-Wstrict-prototypes.patch

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 4fcb0b1..821bb81 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -14,6 +14,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV', True).split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://support-oe-qt4-tools-names.patch \
            file://qt4-fail-silent.patch \
+           file://avoid-gcc-warnings-with-Wstrict-prototypes.patch \
            "
 
 SRC_URI[md5sum] = "d6dd661380adacdb12f41b926ec99545"
diff --git a/meta/recipes-devtools/cmake/cmake/avoid-gcc-warnings-with-Wstrict-prototypes.patch b/meta/recipes-devtools/cmake/cmake/avoid-gcc-warnings-with-Wstrict-prototypes.patch
new file mode 100644
index 0000000..8b8d480
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/avoid-gcc-warnings-with-Wstrict-prototypes.patch
@@ -0,0 +1,42 @@
+From 4bc17345c01ea467099e28c7df30c23ace9e7811 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Fri, 14 Oct 2016 16:26:58 -0700
+Subject: [PATCH] CheckFunctionExists.c: avoid gcc warnings with
+ -Wstrict-prototypes
+
+Avoid warnings (and therefore build failures etc) if a user happens
+to add -Wstrict-prototypes to CFLAGS.
+
+ | $ gcc --version
+ | gcc (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4
+ |
+ | $ gcc -Wstrict-prototypes -Werror -DCHECK_FUNCTION_EXISTS=pthread_create -o foo.o -c Modules/CheckFunctionExists.c
+ | Modules/CheckFunctionExists.c:7:3: error: function declaration isn't a prototype [-Werror=strict-prototypes]
+ |    CHECK_FUNCTION_EXISTS();
+ |    ^
+ | cc1: all warnings being treated as errors
+ |
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ Modules/CheckFunctionExists.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Modules/CheckFunctionExists.c b/Modules/CheckFunctionExists.c
+index 2304000..224e340 100644
+--- a/Modules/CheckFunctionExists.c
++++ b/Modules/CheckFunctionExists.c
+@@ -4,7 +4,7 @@
+ extern "C"
+ #endif
+   char
+-  CHECK_FUNCTION_EXISTS();
++  CHECK_FUNCTION_EXISTS(void);
+ #ifdef __CLASSIC_C__
+ int main()
+ {
+-- 
+1.9.1
+
-- 
1.9.1


