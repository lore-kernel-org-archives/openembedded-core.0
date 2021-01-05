Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.5894.1609856767118480620
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:26:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=cWA+2PPC;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id m5so1777411pjv.5
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=0aAonZ88I7mIk+GQTtDVzVrFBgvXf9zpqhTrnpWnWZ8=;
        b=cWA+2PPCrZKfIvtE7kqabLOPSO8za4W9O+LKTySl7Ge7c9LcW4225yMt5odHyM/8D7
         u8jnX+gvjtobj/VDyE3Lo+VioVvYvnPk1Vi+LyUaG1F/eQroLMK89zUN4QdOIk3mNpf4
         AGSQfsVoNglB5NridTPyyamj1P68dF15UN2lF4s4/Rf2bkrx7hAn7XDdSDbGWw74Ww6U
         QpqShKTWr3sbPtsA6O8B6OKZ6g8KjaHAxDGaAW8tM/VB0xA6CRUy+NyMBGeqarwPsu3l
         8IlXmmfJ4GuwzlQIUNf0gresSGmQ09YK1fq4j5ZQe+DRrkhPmS4rm2mXREEKS/XkNstp
         A6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=0aAonZ88I7mIk+GQTtDVzVrFBgvXf9zpqhTrnpWnWZ8=;
        b=lG3q/qeaZPnQ4If81ZItcMHUhTSK2bkVz8PROgJ+uzdLXZb53fxeos9MRx6TsuV3Ll
         EV75Kg/Pmf0b6C7bob1lZtsoJlx/TSXM3+NIdevB97YxmK5o16BFeIz+I+Sgl2qvh4OH
         wXo4Rj9lNrmdOFRzHw/E0R+YzdYbU4AjfNSQa879SiJUDdW72WrnnBROSUeTUNxrbUHz
         6vqwgYAtsvOIq/0Oq2UCngKfPlBxzf7t8SKN78X2eaZW1yP6XF52ou1aRxVfLy9c4EsD
         1KGwd7xvBJAbvrrADhTwT8x/6tK0eWx2d4c+yJX7/6TJQuEND4r3FIyx/93H5CmV0EDJ
         8hyQ==
X-Gm-Message-State: AOAM531GNTcTCw0kPEEOcPP6R+027VG7fZiYL3+xQSjDOxAVe8Jgfr6m
	K1yTJ8CBHGzWAV8BqtCw/Qty6PSHb8M38jGQNwc=
X-Google-Smtp-Source: ABdhPJwMhoZO97OpahpVOV3hFAK0HUfui9X7ix/1Hi0FZD11WcxQY5qGSMMNRXLpkrtydNk43O2cjQ==
X-Received: by 2002:a17:90a:6ba4:: with SMTP id w33mr4465809pjj.32.1609856766293;
        Tue, 05 Jan 2021 06:26:06 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.26.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:26:05 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/30] apr-util: Only specify --with-dbm=gdbm if gdbm support is enabled
Date: Tue,  5 Jan 2021 04:23:46 -1000
Message-Id: <d4efeada4b8011f18a1ba9464c70e1a2ebe33d3b.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Support for gdbm was made optional in 3260ad9e, but it was still being
used unconditionally.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 09d303ca295dc27874c72b30c37a64d1fdf4c5c0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/apr/apr-util_1.6.1.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/apr/apr-util_1.6.1.bb b/meta/recipes-support/apr/apr-util_1.6.1.bb
index 0dd8f025e8..f7d827a1d8 100644
--- a/meta/recipes-support/apr/apr-util_1.6.1.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.1.bb
@@ -19,10 +19,9 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "bd502b9a8670a8012c4d90c31a84955f"
 SRC_URI[sha256sum] = "b65e40713da57d004123b6319828be7f1273fbc6490e145874ee1177e112c459"
 
-EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \ 
+EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
 		--without-odbc \
 		--without-pgsql \
-		--with-dbm=gdbm \
 		--without-sqlite2 \
 		--with-expat=${STAGING_DIR_HOST}${prefix}"
 
@@ -69,7 +68,7 @@ PACKAGECONFIG ??= "crypto gdbm"
 PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
 PACKAGECONFIG[crypto] = "--with-openssl=${STAGING_DIR_HOST}${prefix} --with-crypto,--without-crypto,openssl"
 PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_DIR_HOST}${prefix},--without-sqlite3,sqlite3"
-PACKAGECONFIG[gdbm] = "--with-gdbm=${STAGING_DIR_HOST}${prefix},--without-gdbm,gdbm"
+PACKAGECONFIG[gdbm] = "--with-dbm=gdbm --with-gdbm=${STAGING_DIR_HOST}${prefix},--without-gdbm,gdbm"
 
 #files ${libdir}/apr-util-1/*.so are not symlinks but loadable modules thus they are packaged in ${PN}
 FILES_${PN}     += "${libdir}/apr-util-1/apr*${SOLIBS} ${libdir}/apr-util-1/apr*${SOLIBSDEV}"
-- 
2.17.1

