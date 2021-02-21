Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web12.22360.1613926169786962977
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 08:49:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=OIQSSWcm;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.194, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f194.google.com with SMTP id g1so45327605ljj.13
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 08:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r/3wepuaccNKrQjM4OMt0/wot28W0mp0YlHGENhUg50=;
        b=OIQSSWcmoywZNOJQwUrbK3/X52EgMszWhOjNRy+R5k+AbfVItJSzHKCFhfpq2Cunju
         ytOH+hNCOiV/5sY30+sqtN1kzw1O4U5wob66scS7jUx/9VLBgOuIGO0qR+4KmBU3iQ5I
         /FM8I/ci0A0EJkui7U0Vzp4OWL6iQ1j6Mu5fR1wOICBjv3AczUJLkknyIQDuiwRj4Tk+
         Zk1T1xLKJEVpDIaw8BI5fJ73FBnot9bi1EaMvrGFIGhZfGj+n/CDPeaX/eVsUdyE0r9B
         Yy0pW304LLawGwvljXOZiIZxsA2X9rQAztGIa7LxLPcSXkGvPHbzmDnfOFz6bySIpbQ6
         xz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r/3wepuaccNKrQjM4OMt0/wot28W0mp0YlHGENhUg50=;
        b=b6exmlDhjJpLMNZbavb+TbDsrY9H0RYeAIZyoJW+wuHo5X6GUpOprVxylDWjwgAvi3
         RzZiS36dRoW5VJelwSxkvf1MwfM6NKOcHvyJg/45IIoWXyvJ3E+kz8sloJ8OHziGIwEs
         UIYduR7sk20RNY5LaTSazitQt1yOmjVMfHV8wPn1MDTzs6mEIwmdo6gojkrrXBqX2p6y
         zvFagdMvXBRmSCC+VoUzJntjh15DJBmQkV6GG/UGe1YZxPX45kYShEIbTYQGDzZ8yPe6
         3DwSFSdyK18925tyzlJjAk0o/QHUxiMZq09M3WNKbJOLoKBOe3SJAWycj/C5bvoJ0RyP
         ZsMA==
X-Gm-Message-State: AOAM531c/cETYRz5Z9vEJwYzVsPn1stzGgVsnZaxUCmY4F02AjISPkAU
	J1SYN3bCP/hQtoXRF2Y5fFg/Yf49kB2v2Hfq
X-Google-Smtp-Source: ABdhPJz0JHuNGcs3HauLCQ8gzinri9sZ/cahikREREZ0ODd63Ay17jvzMgE3KglcUb8/Krz4DtSLkg==
X-Received: by 2002:a05:651c:503:: with SMTP id o3mr12456939ljp.2.1613926167580;
        Sun, 21 Feb 2021 08:49:27 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id b5sm693136lfa.189.2021.02.21.08.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 08:49:27 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: kai.kang@windriver.com,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] cups: set rundir to /run/cups if systemd is used
Date: Sun, 21 Feb 2021 17:49:19 +0100
Message-Id: <20210221164919.389109-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running under systemd, cups needs to be configured with
'--with-rundir=/run/cups', as systemd takes an exception to the
activation socket being under /var/run and relocates it.

This leads to fd duplication in cupsd and an inadvertent closure of the
activation socket when the daemon exits due to inactivity, so that the
daemon cannot be activated again.

[YOCTO #14152]

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-extended/cups/cups.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index e7a704134c..a8e8d115da 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -56,8 +56,11 @@ EXTRA_OECONF = " \
                --enable-libusb \
                --with-domainsocket=/run/cups/cups.sock \
                DSOFLAGS='${LDFLAGS}' \
+               ${EXTRA_OECONF_SYSTEMD} \
                "
 
+EXTRA_OECONF_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES','systemd','--with-rundir=/run/cups','',d)}"
+
 EXTRA_AUTORECONF += "--exclude=autoheader"
 
 do_compile () {
@@ -105,6 +108,8 @@ RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'procps',
 FILES_${PN} += "${libexecdir}/cups/ \
 	       "
 
+FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '/run/cups/certs', '', d)}"
+
 FILES_${PN}-lib = "${libdir}/libcups.so.*"
 
 FILES_${PN}-libimage = "${libdir}/libcupsimage.so.*"
-- 
2.25.1

