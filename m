Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9277EB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 12:37:45 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.7031.1688042258019268804
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 05:37:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=kur04ng/;
 spf=pass (domain: baylibre.com, ip: 209.85.221.68, mailfrom: lrannou@baylibre.com)
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-31297125334so526166f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 05:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688042256; x=1690634256;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WG2G5a8mtf+nkXZxl49wGTeK24a1fxZzDb/46HAdgYY=;
        b=kur04ng/wSBVtxdYN4kfbb4CUPyHT2+bjw7pUOS8o4kg9BfMLBYYmvnm9QkdQZaeEk
         /4SA6bHBYpNLiOantYoL8dNnmEnaItd6yTFEnwIyP23wZ8zaJKNTHOx9UUqHLkwWx6sG
         0CCtMZKgl2hh5vqAphegqKvBre0JwTu7dPvKRzfvWnkL0J1btSEY9pzXy+hOoVVeo0ST
         fFb9r1vckxuHPXeAjbGh3jIq+iJ+FZa9Ykn4l4/NR0nQSYZVpVhqFGC9biK6r4vnYoPD
         M9FyffoUIOuZmSMhi2a2Jm8tZ0xa+VS8Rhg4u6rVPrueV4+ikwjdrQlXsgwnccH4Tdup
         +7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688042256; x=1690634256;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WG2G5a8mtf+nkXZxl49wGTeK24a1fxZzDb/46HAdgYY=;
        b=A79jt3IYS0AGahQTIwPuGmRVJN/iUYaG64eJdY0OOkGi6zO8VEsnMLlUBLEKblntlz
         MHHkS8VwyjGfSBzw+QLwWKfglhaLCOoBfpKkjC+l1CPHloeQctGxpyg7hPPUZChJZvvn
         g0edZ4aTV2PZM0LhZ6xn9sO3UB1j+k9adfALMIncKINdTFw3sAjcyadHcrY6XVPQMEVB
         kV3EenZFivyGSL3tFabwaEzHLC1sB7Ur8eO4FWrBFLX0bIfcu2OvpNt4S5YXaCerAXsn
         ETtjBU3qHSXbrsbkJgGRfMiD8M4PTy1zdFKuNW3g9HnxLS695JkADjfCSY2Gip4OjVQv
         2GSw==
X-Gm-Message-State: AC+VfDxXJPQkwyQw8mX0iSKZoHSAn6SUUPk7OMKvVEhgIwRjKqJlQoFx
	U+f41EdrR60ZWoFQC3bwu2eVUVgYOszCaF6egmDrDAHrMds=
X-Google-Smtp-Source: ACHHUZ5snF+IPRPskKjTyvm+zMjbXWOOBV/PR0GbhfKG2oPx+CGM614W/5LokagNBbMlRedgbGDtCA==
X-Received: by 2002:a5d:4ec9:0:b0:30a:e63b:950 with SMTP id s9-20020a5d4ec9000000b0030ae63b0950mr4113025wrv.31.1688042256131;
        Thu, 29 Jun 2023 05:37:36 -0700 (PDT)
Received: from [127.0.1.1] (163-172-78-30.rev.poneytelecom.eu. [163.172.78.30])
        by smtp.gmail.com with ESMTPSA id hn8-20020a05600ca38800b003fa722e8b48sm19441693wmb.32.2023.06.29.05.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 05:37:35 -0700 (PDT)
From: Louis Rannou <lrannou@baylibre.com>
Date: Thu, 29 Jun 2023 12:37:21 +0000
Subject: [PATCH] util-linux: fix the pylibmount installation path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230629-pylibmount-v1-1-342da6733d5d@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAB7nWQC/3WMyw6CMBBFf4V0bU2nlJcr/8Ow6GOUSYSSFomE8
 O8Wdia6PPfmnJVFDISRXbKVBZwpkh8SwCljttPDAzm5xEwKmYtSNnxcnmR6/xomXiunTe2k0QA
 sCWPAO72P2K1N3FGcfFiO9gz7+jMzAweupLaigUJVhbgavb8Bz9b3e/ivVeVNmZvCIdT4bbXbt
 n0A6tVhBt0AAAA=
To: openembedded-core@lists.openembedded.org
Cc: khilman@baylibre.com, tgamblin@baylibre.com, 
 Louis Rannou <lrannou@baylibre.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688042255; l=1800;
 i=lrannou@baylibre.com; s=20230629; h=from:subject:message-id;
 bh=oIQ7iE6kLssjsntcLf91/Z23UXo+NXBX4/TL7e4qO7g=;
 b=H9GO93KN3kv3wu0GQetqfnRQLLjkM4uYJ72aPGc+ZrZ+V8YYnMAKpBsp0Im/iP2Dvrt/d1vSB
 5I+HZwUsi3xCpWkPtdWMKp2YTMYGyBxNdJlC0DGMekip53rVIXmj83L
X-Developer-Key: i=lrannou@baylibre.com; a=ed25519;
 pk=hdvSPn4bE9wXmtWG03dv5dC2d7X4ObwNkul/+ZeQWn8=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 12:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183622

Append the install task to move the python library from ${base_libdir}
to ${PYTHON_SITEPACKAGES_DIR}.

Signed-off-by: Louis Rannou <lrannou@baylibre.com>
---
As we install libraries of util-linux in ${base_libdir} (/lib), the
python library pylibmount is also installed there. An issue was raised
when pylibmount was added to PACKAGECONFIG.
---
 meta/recipes-core/util-linux/util-linux_2.38.1.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.38.1.bb b/meta/recipes-core/util-linux/util-linux_2.38.1.bb
index 9ea7a04e8a..f9a9fdcfaf 100644
--- a/meta/recipes-core/util-linux/util-linux_2.38.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.38.1.bb
@@ -1,7 +1,7 @@
 require util-linux.inc
 
 #gtk-doc is not enabled as it requires xmlto which requires util-linux
-inherit autotools gettext manpages pkgconfig systemd update-alternatives python3-dir bash-completion ptest
+inherit autotools gettext manpages pkgconfig systemd update-alternatives python3-dir python3targetconfig bash-completion ptest
 DEPENDS = "libcap-ng ncurses virtual/crypt zlib util-linux-libuuid"
 
 PACKAGES =+ "${PN}-swaponoff"
@@ -320,3 +320,12 @@ do_install_ptest() {
         rm -rf ${D}${PTEST_PATH}/tests/ts/chfn
     fi
 }
+
+do_install:append() {
+    if [ -d ${D}${base_libdir}/${PYTHON_DIR}/site-packages/libmount ]
+    then
+        install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+        mv ${D}${base_libdir}/${PYTHON_DIR}/site-packages/libmount ${D}${PYTHON_SITEPACKAGES_DIR}/
+        rm -rf ${D}${base_libdir}/${PYTHON_DIR}
+    fi
+}

---
base-commit: ed04d429f742288bdc547a6537d536c97c89831f
change-id: 20230629-pylibmount-84dab8d2ba11

Best regards,
-- 
Louis Rannou <lrannou@baylibre.com>


