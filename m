Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7BA8073187
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 23:58:13 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id 186so204674919iow.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 15:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lNxlpFr1j6c6VRYIWxbPiiZqQp6Qg8t8Dk1d5soE0jg=;
	b=fmtO0Cb/5vqfyejbB2VR+mLh2YemxGBlTpJ6ZDTkQoNS0LlltBDmwcu2Uv43wz5Yrj
	JipgieXKckXy7IqvsxE7KUY2B/rrd2IcZCZg1WcW0CMwAcGg1scO3udR3xXuxlTvRs62
	ig1r6yhg9S42KDnl63KKi2W+RdD6SoVRu3hgeAFfDFe3kV9QzKrRoKhDbpVPru7VU6B3
	8ZXJXoGOpVNo3yp9nkGVkF69J5A2NOxq5BoJpzeF/HDG1J77Aq7U0yas2Uno/xzE/3sx
	foJNP/ZpKUfigdFgO+UsiSLAYxyzZZIgMCgQb9TK/jUSXArLDpBsZA6bOBj796YEZV/A
	01rQ==
X-Received: by 10.107.138.15 with SMTP id m15mr29053805iod.40.1450828694225;
	Tue, 22 Dec 2015 15:58:14 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id 4sm10079020igz.2.2015.12.22.15.58.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 Dec 2015 15:58:13 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 15:57:59 -0800
Message-Id: <1450828680-662-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1450828680-662-1-git-send-email-armccurdy@gmail.com>
References: <1450828680-662-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/3] valgrind: don't restrict to armv7a
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
X-List-Received-Date: Tue, 22 Dec 2015 23:58:13 -0000

Valgrind has been tested on armv5te/qemuarm, so it seems
that valgrind's configure check for armv7 is over cautious.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
index 3dc3cc1..bb3f6e1 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
@@ -26,14 +26,16 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "4ea62074da73ae82e0162d6550d3f129"
 SRC_URI[sha256sum] = "6c396271a8c1ddd5a6fb9abe714ea1e8a86fce85b30ab26b4266aeb4c2413b42"
 
-COMPATIBLE_HOST = '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
-COMPATIBLE_HOST_armv7a = 'arm.*-linux'
+COMPATIBLE_HOST = '(i.86|x86_64|arm|mips|powerpc|powerpc64).*-linux'
 
 inherit autotools ptest
 
 EXTRA_OECONF = "--enable-tls --without-mpicc"
-EXTRA_OECONF_armv7a = "--enable-tls -host=armv7-none-linux-gnueabi --without-mpicc"
 EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEINFO_BITS', True) != '32']}"
+
+# valgrind checks host_cpu "armv7*)", so we need to over-ride the autotools.bbclass default --host option
+EXTRA_OECONF_append_arm = " --host=armv7${HOST_VENDOR}-${HOST_OS}"
+
 EXTRA_OEMAKE = "-w"
 
 do_install_append () {
-- 
1.9.1


