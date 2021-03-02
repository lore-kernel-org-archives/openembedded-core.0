Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.6122.1614677107541267412
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 01:25:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RB+IdJkL;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id mj10so13795667ejb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 01:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3nxnrrfZ8MfYzn2pgey4BpYUNbMPeYTZFo6JszuVrBc=;
        b=RB+IdJkLiYDZ8her7fvXQsVe31fhn2aykRkJmIzF7VNzT8OQ1nIQfPZzeM1Waszrih
         KhxWF/NDJDyUYZK1H/d7tpj+7UCEfrcrbnM73OupBYqv1X/LAXa59WzIUh7i/n9ubMTp
         xmK7w6EiLw+pvcGUVCmKtKjHsYAhEcpck47fCJU0BhiBcbaKCdiMtnYRbeyicwQaTLhd
         674Idle5z4aFppNZOEJQ0S222n/DpIl8O/jkSfm4Gpf2Gavb5GIpyndOmB9xHP2hzRlo
         S/RzVrTkCxoYB3n1HtddeywOopCZy4ks36JhB8noL6tzk1eIZHHF5rMZajxensqIgGeF
         2jPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3nxnrrfZ8MfYzn2pgey4BpYUNbMPeYTZFo6JszuVrBc=;
        b=BMWnaDo2L6QfVJTRHYlGuuAYwxUB635cm+sLhgDqNz2NsNQqOUW9P6PuhuQvbJFqjc
         bAU327n603oJj/jEPxEx4GR0GoCkfIJcBFyVwatXMlpQ0FTKu2EUmP1qRZfKcF/1SFid
         iw8YC5RWq6TsAv9R4fGoAR7ugsdkdmeM6MXFIHKt2KlcndWUSl8SojK1lZPFMis+ZL4+
         8p8//vl4RgkE5iOYm2Z64XsbX/VPWPW9HplEvmonJ4g8hLdH5y9YAx7liVoDpZfW7SDU
         IuLuPE+RRWF8GP1H0i4gmxaEvRtF0lPYyRY180xnf5fGorGRk/V3ScOPu1QUTeR6VPUG
         J+Wg==
X-Gm-Message-State: AOAM53235KJlxhexh+/IZkLopepvKzq+EfrIboydCnvG88eXrHvo5goY
	BsleqiXdE1W7eyyX9IZPOfrYgmgvp+s=
X-Google-Smtp-Source: ABdhPJzN8Y4yl5UOy4e/0KQQjPlM1FSD5XKhbDXbvfrZpJ1FHoDwD68BUi15CzP4eioUnXGGnHXh4A==
X-Received: by 2002:a17:906:4f02:: with SMTP id t2mr19786270eju.121.1614677105834;
        Tue, 02 Mar 2021 01:25:05 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id bv9sm11873273ejb.21.2021.03.02.01.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 01:25:05 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] coreutils: use u-a for base32
Date: Tue,  2 Mar 2021 10:25:02 +0100
Message-Id: <20210302092502.8771-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* busybox 1.33.0 added base32 applet and now do_rootfs for read-only images is failing with:
  do_rootfs: busybox.postinst returned 1, marking as unpacked only, configuration required on target.
  ERROR: image-devel-1.0-r2 do_rootfs: Postinstall scriptlets of ['busybox'] have failed. If the intention is to defer them to first boot,
         then please place them into pkg_postinst_ontarget_${PN} ().
         Deferring to first boot via 'exit 1' is no longer supported.
         Details of the failure are in image-devel/1.0-r2/temp/log.do_rootfs.

  and log.do_rootfs shows:
  update-alternatives: Error: not linking image-devel/1.0-r2/rootfs/usr/bin/base32 to /usr/bin/busybox.nosuid since image-devel/1.0-r2/rootfs/usr/bin/base32 exists and is not a link

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/coreutils/coreutils_8.32.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.32.bb b/meta/recipes-core/coreutils/coreutils_8.32.bb
index 320f93bdc2..c1962ccb90 100644
--- a/meta/recipes-core/coreutils/coreutils_8.32.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.32.bb
@@ -117,7 +117,7 @@ inherit update-alternatives
 ALTERNATIVE_PRIORITY = "100"
 # Make hostname's priority higher than busybox but lower than net-tools
 ALTERNATIVE_PRIORITY[hostname] = "90"
-ALTERNATIVE_${PN} = "lbracket ${bindir_progs} ${base_bindir_progs} ${sbindir_progs} base64 nice printenv mktemp df"
+ALTERNATIVE_${PN} = "lbracket ${bindir_progs} ${base_bindir_progs} ${sbindir_progs} base32 base64 nice printenv mktemp df"
 ALTERNATIVE_${PN}-doc = "base64.1 nice.1 mktemp.1 df.1 groups.1 kill.1 uptime.1 stat.1 hostname.1"
 
 ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
-- 
2.30.0

