Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 231A260B24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 21:09:41 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id gv17so20643pjb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 13:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zpTeBhGXY0Xm6Qfr/QmQYSJNQexq8n4kF2EkyJ3iCt0=;
	b=oY/RcopKiZ8X6Kl2XqJ6TWxtNwJ4hBiXyYsjQCg8v/dwr6UIQPZgnc5XA7+EjZR3MM
	7VL5N5j+b7DRp62wLJkI2oVeVr/bR8xuv0MwPlgUnijVU9eL9jfj3z6gsEfdCFEDMbZ1
	k/DMxDQEn4PnQrW9UumkQjAyNtgiwxqhieTC/Qme344ReWw54ZTbPaRwwjW4MqA4iNOf
	gRYsAIVg3ig+Tq+Dymwzxb0PGeYozn52HZgB5dlH8CTkaA15R2A2dzrkMiTzhlItJzqX
	kjj0wexoHfdlLMl0ptBlO0F4y2ZL1UMgaW/EQtGcZzi+zs4BMbd0jNLtjIcA7hjWUakn
	+zBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zpTeBhGXY0Xm6Qfr/QmQYSJNQexq8n4kF2EkyJ3iCt0=;
	b=NuHEfWv5+aFyP77QXSup//9Tg70i/QRGLNsq6LgVzscrJFm4dn74vBvdAvpVw5boOt
	RQHsg3WOVhUB5Or9fvGFr6JMCRT3R84H9S/ERQelV/T9bzMHYEEL3zoF7dFwQGFFb/tR
	wUuLDhVJeMpyu1UAUA1njzSdnmN1SWmyPjzqXddoxpu/koU7vkF6IWZLK/AJ6B8XL/6j
	AWG4mX9rpJVGfGyxafxuvzq6oiagUQugBP2sbfjEbjBaC4uiMBbaZWEzcQoWkaNGkcWd
	UGfSqs+Zy0sgL2zA89DA5uOWIQixemGAgCAWmgLi13WgryZ+/9U3PiUO/E9trQtsnD+J
	wiHQ==
X-Gm-Message-State: APjAAAXStnZ5CkuC8a+TpZ4P6qADSzviqDzyeK/9KNF0t0bWwyqdwWnl
	oJ+fDO8gV1BM0rDUWfVF2m3GcLLTWQE=
X-Google-Smtp-Source: APXvYqwGgDD7x4PJ5ZknvflKz6a/XIxCvO5G+991ZCLWWcZg+Um6WVa/RppryEskdgKnAMbfswljwg==
X-Received: by 2002:a17:90b:90d:: with SMTP id
	bo13mr5772526pjb.54.1582232982463; 
	Thu, 20 Feb 2020 13:09:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id v9sm324413pja.26.2020.02.20.13.09.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 13:09:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2020 13:09:52 -0800
Message-Id: <20200220210952.3934161-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH v3] dnf, libdnf: Ignore if PACKAGE_CLASSES does not have rpm
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
X-List-Received-Date: Thu, 20 Feb 2020 21:09:42 -0000
Content-Transfer-Encoding: 8bit

dnf depends on libsolv, and libsolv does not have and easy way to
jusr enable rpmdb support, it either has full rpm or nothing, perhaps it
could be improved in libsolv and we can use that but from now we have
no other option

dnf support only rpm backend and wont work with opkg or dpkg/apt anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Improve commit message
v3: Enhance blacklist message

 meta/recipes-devtools/dnf/dnf_4.2.2.bb        | 2 ++
 meta/recipes-devtools/libdnf/libdnf_0.28.1.bb | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
index f38167f1ad..f6e616e7f1 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
@@ -84,3 +84,5 @@ SYSTEMD_SERVICE_${PN} = "dnf-makecache.service dnf-makecache.timer \
                          dnf-automatic-notifyonly.service dnf-automatic-notifyonly.timer \
 "
 SYSTEMD_AUTO_ENABLE ?= "disable"
+
+PNBLACKLIST[dnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build without package_rpm in PACKAGE_CLASSES due disabled rpm support in libsolv', d)}"
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
index 882c435b32..d498347094 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
@@ -26,4 +26,5 @@ EXTRA_OECMAKE_append_class-native = " -DWITH_GIR=OFF"
 EXTRA_OECMAKE_append_class-nativesdk = " -DWITH_GIR=OFF"
 
 BBCLASSEXTEND = "native nativesdk"
+PNBLACKLIST[libdnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'Does not build without package_rpm in PACKAGE_CLASSES due disabled rpm support in libsolv', d)}"
 
-- 
2.25.1


