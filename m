Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 47F6B6011A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 21:14:16 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id s5so72188178qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 13:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gzFyCV5TW5JbVEf+T0U78Pullns1q6bkjUWoPw8Vj0U=;
	b=VXPjdukDzmay7RCAbPBGzQwVZxQDdmSi9LaMrCTe4mC2ufGqNelQZ+aR1MlntMaxOU
	3MjPJW5GrrptxZx9GltcwpZNMZ+uqjH0Fl86JKai01T6aHhpwgNMg9li4lCKMECtIXpd
	HUT2JZlFUMniysdOSxlwRgOfhlzA4Z15uMeirWr4MJI20gST8Pg/wMgm7YCteic+Z5mv
	Ie+ZOX8cUihwLuB+0ryZzHje+UzDo860wLZJ7REwQ2skAYqcQCbl71VvxwruLJpWGhos
	k19baZiCps+iISI6M++yXTYT0RUWvweLIiHQcy0vLq19Qfh/oUoNdCdw76JjhyG1Gz2X
	pwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gzFyCV5TW5JbVEf+T0U78Pullns1q6bkjUWoPw8Vj0U=;
	b=YUlsSxA8vRN+/jD+5s36tdozf/viPGgapYSLtkwNQYo8Rxpum9K5wopWDodjMcg++U
	4OoQ9HCwSpPUkgLTtIIWSEcaLBf3GYtVFMKEV7zwcxem3H60cx6hfFVNCUUK4YYsuxcb
	39XiIGd/N7KYJbULm6Dexi52t7mLQ0Cpu+aqHdNSV7wMsjDYIh2LNwHY9Izqyh4hMJMb
	ag1x3p89N7suX8MKtY7hOCkBvmJGI05qanktuQwDr7DBh0WknUP9gL7WK2c2nGHQyEXY
	KnP44ff4us368Oqf2hBJU021TdvVzL86JkKGqGP/egYBJELMQ5i1damv9Uz/xDLQ9NgW
	0+TA==
X-Gm-Message-State: AG10YOSBFZC9ZhEXw/nSMgXN3hGXsStOXuL+x8P1F0tzqGLEtc0S8QpH/UQGOnA9hkfBKA==
X-Received: by 10.55.78.198 with SMTP id c189mr30592374qkb.95.1455657257602;
	Tue, 16 Feb 2016 13:14:17 -0800 (PST)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135]) by smtp.gmail.com with ESMTPSA id
	z93sm13528477qge.18.2016.02.16.13.14.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Feb 2016 13:14:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Feb 2016 21:14:09 +0000
Message-Id: <1455657250-10214-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH V2 1/2] binutils: Fix useless rpaths QA warning
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
X-List-Received-Date: Tue, 16 Feb 2016 21:14:17 -0000

elfedit and readelf contains /usr/lib in elf header
this patch deletes them from binaries, ideally it
should be fixed in libtool and Makery of binutils

mips target binutils dont build gold so remove
them from ALTERNATIVES list

depend on own version of chrpath native, so builds on
build OS like Centos can work, the verison of chrpath
on centos is old enough to not support dealing with
multi-arch ELF files.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 79e2a12..43e2aa2 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -13,6 +13,12 @@ LICENSE = "GPLv3"
 
 DEPENDS = "flex-native bison-native zlib-native gnu-config-native autoconf-native"
 
+#
+# we need chrpath > 0.14 and some distros like centos 7 still have older chrpath
+#
+DEPENDS_append_class-target = " chrpath-replacement-native"
+EXTRANATIVEPATH_append_class-target = " chrpath-native"
+
 inherit autotools gettext multilib_header texinfo
 
 FILES_${PN} = " \
@@ -51,6 +57,7 @@ USE_ALTERNATIVES_FOR = " \
 	strings \
 	strip \
 "
+USE_ALTERNATIVES_FOR_remove_mips = "ld.gold dwp"
 
 python do_package_prepend() {
     make_alts = d.getVar("USE_ALTERNATIVES_FOR", True) or ""
@@ -111,6 +118,10 @@ do_configure () {
 	done
 }
 
+do_compile_append_class-target() {
+	chrpath -d ${B}/binutils/elfedit
+	chrpath -d ${B}/binutils/readelf
+}
 do_install () {
 	autotools_do_install
 
-- 
1.8.3.1


