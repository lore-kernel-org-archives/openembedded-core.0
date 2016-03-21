Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3BAF46E660
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 20:13:33 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id r129so65674673wmr.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 13:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=69yY/LGLH0iUPHKDTPkSiUYxJg8bVdswRaswBcE6wBY=;
	b=klSkfiRblnP+Pxw26Yz9eeaYj+9DnnVlqin/1vCdYrKIZFqOUG/zFExC9+4xVO8yU/
	MZ/B8sDt/MSm8fPV/zi2cXwXnGM3xLelBpjxdXBCEC9M3fGuj1SnLg8bkga6YsuEU8Uo
	TGUoTnJEtNJ9pabPSyWN7Fe5rPtZvVmmXKKeZgsd3uNbD4s8duaLR97neQVDyI+0cmoI
	dDWsQOS69dycSAp+aPKfpO+vso8KCw7SubZozgMV3pDRUEWJCNqaP4XKaKO1pj0j5Mcd
	+F6ihQBcPI+LwHPE7yeKmmbaSSNM7k4Tg5wTMS5EaKwpGOm4kJ3S9cpafkpAgqVnptoB
	kG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=69yY/LGLH0iUPHKDTPkSiUYxJg8bVdswRaswBcE6wBY=;
	b=lusJBbpei9WEqEjibWu5HwoxDubGZsdBTgmuaLBQmt7zMJMHuA+QhI5NArjiJL27PX
	MO8ln+yhFA5GB+W7cFfCQe6BdSrSN0FJL0SunQ7TZ/0wdBXcOFx+jygJTBGB0Q4WfVVY
	KsxaSdV1wQdc73VeXtvNRKCkn2T7ktVM+597SV74+l2417m/09gwee0oJ+zFyg45v9RO
	Ku9P2G5Va/608RGxFn/ioKKMPkQ0dh8t11uiVgNQt/DnkK8ZLS5oHRz8D7prd2PiT6WF
	wXxPMjIuNzc2WC6/aqAwiEUUBPgL5QSg3IoHLTYo7mMBAOEMC2+AZvzxof/cCdIgCeAc
	Rrjw==
X-Gm-Message-State: AD7BkJL8raoYd8h1ziMrfxOhztdoIMhgGdrnphRuvhULa1bi7RxBiDcGtBhRJfAdqvoh9w==
X-Received: by 10.28.174.72 with SMTP id x69mr15858081wme.68.1458591214361;
	Mon, 21 Mar 2016 13:13:34 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	et11sm26986096wjc.30.2016.03.21.13.13.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Mar 2016 13:13:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 21:17:49 +0100
Message-Id: <1458591469-24233-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.3
Subject: [PATCH][jethro] ruby-native: Depend on openssl-native
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
X-List-Received-Date: Mon, 21 Mar 2016 20:13:37 -0000

From: Khem Raj <raj.khem@gmail.com>

This dependency is floating otherwise, It races against openssl-native
and when openssl config does not match with openssl on build host the
build fails occasionally

x86_64-linux/usr/include/openssl/ripemd.h:70:4: error: #error RIPEMD is
disabled.
 #  error RIPEMD is disabled.

Change-Id: I5ff6d8f058ff99c64ad4dc7c0377724071003ae6
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/ruby/ruby.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index 17aa789..313e752 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
 "
 
 DEPENDS = "ruby-native zlib openssl tcl libyaml db gdbm readline"
-DEPENDS_class-native = "libyaml-native"
+DEPENDS_class-native = "openssl-native libyaml-native"
 
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
-- 
2.7.3


