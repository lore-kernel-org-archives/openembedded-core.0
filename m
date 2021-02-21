Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.25578.1613940427441430078
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 12:47:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=Uo633Qmy;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.170, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f170.google.com with SMTP id a17so52370439ljq.2
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 12:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zA6I0vtBf9rC92YVmRO382/PzNo8hJgt+4+KWuTKtP4=;
        b=Uo633QmyhQVecwymyqmpoZV+ypJlgWtfXrjhLp4KhwO9nw+M5Ku8njIk6xiKidEwc0
         eimZ6zjUrQONl5/sVjeFc6beW3dA1bSGgWWcK1GWPfe1xzOhOS7jYY9W14YGDOjNmmle
         wQ62n1uE3cJZq2A5hoTWD7K1+AGBQmCB+dhkhGY7KmPpOMWXE2x6tYwB2DaIF3cpTt7O
         5ZZ+NqdStYGinxdOI7XHuJuNWDd090myrKoqvxjRdFmfGgf3cH1y6zUWzSOqS6Agn7J8
         LqiZR50zz9rGA10o+l3dmwX8Dmby7o/81B/gH+5s7GNnjxzXNigGNOrbLUSVLyROqonY
         mpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zA6I0vtBf9rC92YVmRO382/PzNo8hJgt+4+KWuTKtP4=;
        b=Mt50VJ3iNVFrPZUt+utdCikm5WGRqpVF1/t49jUdKJlgILjKrlQolezHQCO6gD+eQq
         vCyizZu2UttVd2/vSd1w6PdIj++dpll1aD8hoS5XXzv314KWW7tdBsBxEP5gA1CqTANN
         U41guCF/zPM7TUGnF7ABej9LSKQdP76Ir2XOWc2N4ncJ1sZ2y/XABJ27yOISuvyIuzp1
         oJYrYfQBQRgKuOZooWQI9GzxNyUN8qvosBN8MBTfIRQPKrrP/JPomzSkGAfNFK9AkmOD
         xtXmj7WbOKH9uKNWdzVfIvVQG7aGkAqVGSCryL2IBjO7EHmM+CrDT6ZM2kmHB+YL38X/
         38NA==
X-Gm-Message-State: AOAM531TFvRGE6pCn4dmPXUa9/rAdvdBgy4eY/cvDIaONQQL2W4AYVlc
	d/KbwMBvCq3DfRrZ0bnZESfflNb3R27ywSsN
X-Google-Smtp-Source: ABdhPJx53hkHAVUZKwET7Q2979SsSO0BLJHjr5p4lcO8NUrlAxuCzQIwNDdYvwAPYiHBY1CiZYn72w==
X-Received: by 2002:a19:8111:: with SMTP id c17mr11444822lfd.574.1613940424873;
        Sun, 21 Feb 2021 12:47:04 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id q3sm1779933ljp.108.2021.02.21.12.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 12:47:04 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: kai.kang@windriver.com,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2] cups: set rundir to /run/cups if systemd is used
Date: Sun, 21 Feb 2021 21:47:02 +0100
Message-Id: <20210221204702.504297-1-open.source@oleksandr-kravchuk.com>
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
 meta/recipes-extended/cups/cups.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index e7a704134c..ff1ab70be9 100644
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
@@ -77,6 +80,7 @@ do_install () {
 
 	# Remove /var/run from package as cupsd will populate it on startup
 	rm -fr ${D}/${localstatedir}/run
+	rm -rf ${D}/run
 	rm -fr ${D}/${localstatedir}/log
 	rmdir ${D}/${libexecdir}/${BPN}/driver
 
@@ -97,6 +101,11 @@ do_install () {
 	    install -m 0644 ${WORKDIR}/volatiles.99_cups \
 		    ${D}${sysconfdir}/default/volatiles/99_cups
 	fi
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/tmpfiles.d
+        echo "d /run/${BPN}/cert 0755 - - - -" > ${D}${sysconfdir}/tmpfiles.d/cups.conf
+    fi
 }
 
 PACKAGES =+ "${PN}-lib ${PN}-libimage"
-- 
2.25.1

