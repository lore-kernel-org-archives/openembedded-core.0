Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id E3640606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 19:19:54 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id f65so186048506wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 12:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=2d1jAAzrArov4elmPKLViVePWc03yYZMod1gAh49B8E=;
	b=gV5+JmhwBMntN/Z/HO6TlOtuWpqq2BN/Ta3rmIVpPRVDv2hUm4c6ibX1k5xpkw8pnw
	SR6/Hv9Hsh4YGMQhz3cNgvVf6iV/i1xgY+cHMNh3DrV8h03dMhsgQFhmrw7dtp9ZbIwa
	MMVG/mBpbhY2Gi8QR/aXqUq+Kur8sYsSDlPE2qBGgu+6o6opg8hLZWNAJGzqmNcIxkN9
	03IhhKDh65tnvYb22XZbwJQ5afsPYWL/xI6PiTXuPO6GE+LQEApC00WdD9f3opwHs2ip
	/+vTF51iIG/rE0nGaUiQDauDolcGlE2epZoIePkhd18kfrLb2KZlqEtXItP64/QR/0rB
	KnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=2d1jAAzrArov4elmPKLViVePWc03yYZMod1gAh49B8E=;
	b=ZiiLQEYYlBTK+zaf9tOEHtSfMvMiGdyeeA/PUugjQGQ6iyUoueW7A8fh2kH9mybu8C
	NQ9Ys4g9bYM16snlXL7hsgFRVsBTlhTJWlRj7+gy9RG9x8TPAxMbc6j3eevqyzr8Uq5K
	4Wt/pUxtFBQjyZ8pjghu/4N9PuS+qNUox0t8aySv+NwAqQJIpQmCSU9elUM+DbbF7k7c
	s17smCc07eiIIoyL919F0gE7YdI0Umn9yE2Z6SzBm5KVTLbSk3KsrVUdDTgMFbw1uq6+
	pOo1jED/6/Dzw93klE0oKUmpuX8fIBRIaKouHFuTKfA+fXNevV7ljY2aKX2zwbJNhVhk
	pJHg==
X-Gm-Message-State: AEkoouvxC6LJt3ep+b8d8GL4tqC/pL+sV1azLAGdks7I5PKhNa8exuxRrOzh51SIXAUKTOvC
X-Received: by 10.28.1.23 with SMTP id 23mr28133368wmb.22.1469560794524;
	Tue, 26 Jul 2016 12:19:54 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	qe2sm2427660wjc.28.2016.07.26.12.19.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jul 2016 12:19:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2016 20:19:52 +0100
Message-Id: <1469560792-20437-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] sysprof: clean up FILES
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
X-List-Received-Date: Tue, 26 Jul 2016 19:19:55 -0000

This recipe ships unversioned libraries so fiddle the intermediate variables
instead of rewriting FILES directly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/sysprof/sysprof_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
index 6324d20..8d8b626 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
@@ -30,8 +30,9 @@ PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATU
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
 PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit,polkit dbus"
 
-FILES_${PN} += "${datadir}/icons/ ${libdir}/libsysprof* ${datadir}/dbus-1/"
-FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
+SOLIBS = ".so"
+FILES_SOLIBSDEV = ""
+FILES_${PN} += "${datadir}/icons/"
 
 SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'sysprof2.service', '', d)}"
 
-- 
2.8.1


