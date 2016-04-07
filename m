Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id E5726731FA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 00:42:11 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id kb1so2829991igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Apr 2016 17:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0Un07A+6FI2OUku/F2WLNXsfjlTV99ZxrRE6o+8V/Sw=;
	b=JngwzJ8QeEmDh/5I4YmXBD4pzZWAdEn/lCUyOY4INCxBwcmGvhNml5sZPYn9vcZrcS
	zicBi735gR3Mb8Z2F/fLI0VQBEIkiOmokbBUyW9AsvClr3aJPNy6iD24pnztPGq/xNsv
	8RNpuG5HLZzHexoTqoYfEKiqEiwguYaL70nAgpYwhS0LXmHq2xhA5Gh2LSmlvjf1BP3H
	myG+YuvgXfhRUzjFG+t4wip3GOHhfluTogT1GDG/j99fen8WkLgr2rnv7tjtufOw1tod
	d9jJ8IqM+6u5Pp+lG07P83nI/Bs42O2V8G0bcNxmAjlkx2rOOd5vMBuQ6aY8UKxToej8
	T4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0Un07A+6FI2OUku/F2WLNXsfjlTV99ZxrRE6o+8V/Sw=;
	b=ILWyNwh4YpLYiSpDtYDVkExzNNhStT9i84T+0BGWOX4flz4AmZflR5kJ/tJGEHGFDz
	MDTB0w+ZBVzVUrthjr9ZiQGEU1c57LDDy6vrSeZmQrN/QeZIytBTvxWwQHzvo/Hfhgpk
	XExY1I778cg5XRLYG9bEuSCq0f9dPpIjdzWFgHcQF0M1YVfkM4ZhnrFrOb6YC7H47lGa
	lpQzF72sZ2qMqDjYKzO7dFAI46CGUTauYH8CZN2C7SiweIJnYGzjZfaOerNwOn6/YmXC
	Pv76SJDTJqjTWWv8MjbsnRlMKf0w+uSFm4ieeagOscjKStgO261theySUUuKhctAHQTn
	hZUQ==
X-Gm-Message-State: AD7BkJKxcAqCRBTz5pRp+s4iPlAlgPXX2Y73ea8X/zqWiLZ6c4uZdyzpkbQj1By5ILceGw==
X-Received: by 10.50.70.102 with SMTP id l6mr819378igu.18.1459989732147;
	Wed, 06 Apr 2016 17:42:12 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	n19sm7385507igi.19.2016.04.06.17.42.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Apr 2016 17:42:10 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Apr 2016 17:42:05 -0700
Message-Id: <1459989725-23476-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] openssl.inc: minor packaging cleanup
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
X-List-Received-Date: Thu, 07 Apr 2016 00:42:13 -0000

libcrypto.so was explicitly added to FILES_${PN}-dev as part of moving
libcrypto from libdir -> base_libdir to support dhclient [1].

However, the line has been unnecessary since ${base_libdir}/lib*.so
files started to be included in FILES_${PN}-dev by default [2] (and
it's still unnecessary now, after moving libcrypto from back to libdir
to support ntp [3]).

 [1] http://git.openembedded.org/openembedded-core/commit/?id=01ea85f7f6c53c66c76d6f832518b28bf06ec072
 [2] http://git.openembedded.org/openembedded-core/commit/?id=66c36bcb7d9368718453265e58bd5e3c854c786a
 [3] http://git.openembedded.org/openembedded-core/commit/?id=0be2ab32f690a2fcba0e821abe11460958bbc6dc

Also define FILES_libssl using SOLIBS instead of a hardcoded pattern.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 0c7e192..a5ddf4d 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -34,11 +34,10 @@ inherit pkgconfig siteinfo multilib_header ptest
 
 PACKAGES =+ "libcrypto libssl ${PN}-misc openssl-conf"
 FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
-FILES_libssl = "${libdir}/libssl.so.*"
+FILES_libssl = "${libdir}/libssl${SOLIBS}"
 FILES_${PN} =+ " ${libdir}/ssl/*"
 FILES_${PN}-misc = "${libdir}/ssl/misc ${bindir}/c_rehash"
 RDEPENDS_${PN}-misc = "${@bb.utils.contains('PACKAGECONFIG', 'perl', 'perl', '', d)}"
-FILES_${PN}-dev += "${libdir}/libcrypto${SOLIBSDEV}"
 
 # Add the openssl.cnf file to the openssl-conf package.  Make the libcrypto
 # package RRECOMMENDS on this package.  This will enable the configuration
-- 
1.9.1


