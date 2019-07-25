Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8D8ED7EED3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 15:20:27 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a15so45367435wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 08:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Mj4DGyzqPshGumu7rM+iKWAcExkp5KdIsmj+cA1O5uU=;
	b=FsmUp9UH5Zyf9LfD5WP+Dx3NVHzsxKXK6On7xxql9gMxynwHEYzVdoBcV8RUGcQ8Zu
	JY8C+KMTTBxUnRO53xuLuXtrV7vrKxanqMAx3g0yEpD3Gli1JnQ51hUHK0zyGx8wRsxr
	InfPEp/bxBpE7+4dQqBbwn7ZgmayUv5MMOlfE4dd45nqdt4nq7R4F8dsjUSYc8HsQa1Z
	JgSMK5kimwJAvQyUD07Z0G/lLFKf0yO4qLciGSYrYvbp033Y0xSZ19Qfo0wqOjVjSRrY
	xf0RfIXsfTG8bf3EUb55C7Sl8keAC2Fbdwe6QfIYx1uUumqdhnWyLg0ONpCbBwo3uQpe
	Gn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Mj4DGyzqPshGumu7rM+iKWAcExkp5KdIsmj+cA1O5uU=;
	b=F5lBz4PBF/pun71isMVZwXfYzB6z6h/zE0cNLNzoa7FKKc9cyJlM+GFKbuDmIjkkPm
	CUT14v/z/ZI3bN6UqKjonVbuiNieO5fTgWHzi3lnj41ZTIgSocuGQV7byeYHRApTgkUk
	W6wKEnycsm7isSTIfrcQU+2qZyfGf2rpfPHNRa4dWXChvGbqRFcjhiYWdp6j+cWuaI3c
	P6ZJUM+ky0x6YZw4WYaEhh0zWNtDLeSbw6cjmnyriv8GMjwMkmY52Aznj+sp01cRetWO
	OnCSGcCp3jlF7hyT1gLMUzlbD9O+R/5r9qnXUQEHhLJtatb9drXDaAfI1+5ZBCcqDlwd
	GjwA==
X-Gm-Message-State: APjAAAUMdxYpvtyaQyvJRFY5v4kJaFvFe0IYOiW0I6PID9mNfTXsuAhl
	aqjV0dYx2qoQlajSrlKFVTZ8FbsmBbg=
X-Google-Smtp-Source: APXvYqzh04Yb4eXJX1JPJ6xg2SMMrA20W4L0FatxIb9qlUDLDR8ep4xM7a7Dc4j9MTynzf/eWowZ8Q==
X-Received: by 2002:a05:600c:34a:: with SMTP id
	u10mr41081052wmd.43.1564068027693; 
	Thu, 25 Jul 2019 08:20:27 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z7sm47532602wrh.67.2019.07.25.08.20.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 25 Jul 2019 08:20:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2019 16:20:22 +0100
Message-Id: <20190725152023.30135-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] libidn2: remove build paths from libidn2.pc
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
X-List-Received-Date: Thu, 25 Jul 2019 15:20:27 -0000
Content-Transfer-Encoding: 8bit

The libunistring m4 macros end up putting the full build-time library path into
the .pc file, which is no good on target.  Sed it out to stop build paths
leaking onto the target.

[ YOCTO #13403 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/libidn/libidn2_2.2.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/libidn/libidn2_2.2.0.bb b/meta/recipes-extended/libidn/libidn2_2.2.0.bb
index d7fec89fba2..bcbfdd85b91 100644
--- a/meta/recipes-extended/libidn/libidn2_2.2.0.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.2.0.bb
@@ -21,6 +21,10 @@ EXTRA_OECONF += "--disable-rpath \
                  --with-libunistring-prefix=${STAGING_EXECPREFIXDIR} \
                  "
 
+do_install_append() {
+	sed -i -e 's|-L${STAGING_LIBDIR}||' ${D}${libdir}/pkgconfig/libidn2.pc
+}
+
 LICENSE_${PN} = "(GPLv2+ | LGPLv3)"
 LICENSE_${PN}-bin = "GPLv3+"
 
-- 
2.20.1


