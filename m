Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3B66871BB4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 18:48:17 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 128so13279949pfz.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 11:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wMvSwEEluaAPORI3D0iCGM4bQXFyWGsiel+bNswU/Bk=;
	b=Ec6H8C4PPxfHGgABtwW/KIDIHf+LFNqopm1mkVeaBGqB8qdo7hMlNDRRT/1xMY/AEF
	FJXfAQ4aync6KaT5gN/8mt5FJ7K/TQ5EkN4xPouNkLvYLK+lTXE62rh+TYphHO1ikU7G
	GdO+ZRaCNcCcIBlkNtt1mZtSUfAf+M+ghcZk8PdcmTk3eVG9yYxAWLcYRcDsyYWPCeFu
	DTd1XSlmzDH/3V3ScFsR1+apcjUsQPL/UPWhWGxWXiU3XXc7q3GdUADGgxK8wjCOrVMQ
	ICtkTjcsENnP9Zjr7L2q91G2UQIkq0esCoKzzyel72SIpjJxhTowGgqmjOAeLX17wutX
	1BPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wMvSwEEluaAPORI3D0iCGM4bQXFyWGsiel+bNswU/Bk=;
	b=DYiSfXeRrZeq6mXl7zEXUtTtj2dq4g2fvIBdWokfvAK2qQd9FJISOtZ5g/oL9vGn0d
	kdvlgfEituyQ0jGbMC5wqiZYA9qjoivFMaMJnW2mrwhXFNIf5xwClUf2cxNXVrWzx9F8
	s+k06TPuyNmtd8v8DfN5PiCqyh4k/FlW7DSyQwuHIIeKRV2077ueZTTnPR++10qzKY6P
	CzaATBRMLkynTad0qWJLLdumaX0JOlufS8Kia504e7hZmqRBshQ747ozebfb6MHtxE/w
	j7nYLMBaQPRWD/OY4nG8eVifMqeZZAkrDhMgUolCeWw+D3ktYVcWDnm+3pw3c3CmUqpz
	nbeQ==
X-Gm-Message-State: AA6/9RkPsY33kT9d7XhoVoUnW+rduCNIRUVtsFSWw5F6Vc6E7Bj7keP1aUPoMzYmxdfFiw==
X-Received: by 10.99.117.19 with SMTP id q19mr33030285pgc.162.1476730098688;
	Mon, 17 Oct 2016 11:48:18 -0700 (PDT)
Received: from e6520.adbgroup.pl
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	b88sm49813745pfe.72.2016.10.17.11.48.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Oct 2016 11:48:17 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2016 11:48:10 -0700
Message-Id: <1476730090-21255-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] cmake: avoid configure failures if CFLAGS contains -Wstrict-prototypes
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
X-List-Received-Date: Mon, 17 Oct 2016 18:48:18 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
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


