Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.36777.1607962049926093942
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 08:07:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tDhawQ0A;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id m5so16953683wrx.9
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 08:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zo284+hWD5+I08vnEZn2z5O7xMZ5rNZ/mUNM92KpMfA=;
        b=tDhawQ0AVTlebZLtMBWUAKWEBfy6dPEkXYnH2+6sUGtMHn9y7/iQawFtImY4xhuatz
         fOlDz6Aixw9lu7soPtpBJCyNkosxwiWt7Swe0ZSsIBKzk02mkXTpAUSlYvC+cMdo/GOu
         khvW53NlDr5+8Gfn7MB4Wsk7Hs1w+zb0RbN12/csEX+Z2W+ZeHrWZRfJxuw0XvgRX7f/
         MXSPIbQbcdRanSk5h04vcOU4Vt7gvvDCLSXDeHaBelOYAeXfCefSv4NiCOD9qVI4tu2U
         zCNvvU7l6gnr42yOo+029a3H5R6rUhlTtpetUg94bSYB5ANeq7eEdRNrPfSJBiblGugs
         Y6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zo284+hWD5+I08vnEZn2z5O7xMZ5rNZ/mUNM92KpMfA=;
        b=RBwbCqRpu4yLDBP5RvGH4M1FciILlM7aAoeLR+rv/GK2yKYuBsmbGa8WoPlOkypg3G
         uKoa+m6hK0xIu5Aw/2Oi6/pUVVhKmCN3CUW6l9c5aCNsqTpgF1So7WnL2nryYpIFsJxM
         rjVPSt2TztapcXjStKWanuJNOfT+Cp1gQAkmg+yJKjcf/+lRBxS/AwRt3JlFs8EirIPV
         ToZthPt345CZRc/lQvvIraU7glQvf5LiwsGwJG7M98WW9++S6LTbCU5QVKOt4wtGYKg3
         HlTOHRsEfbQvfFxpQHCu2gPfO/2YkeEY5s3vdBmcdQp1D2UO9Q1uTALtENqrI/XMytEN
         jhaA==
X-Gm-Message-State: AOAM53173i+swxUZyrMXKMNuDMtPY1157kM5IE3fOAr6BHHsJCyWzn3x
	1mCcXF/wZJugbYmX1L7rpXtsc3iY/BX7kg==
X-Google-Smtp-Source: ABdhPJyhAwipTQ+uDO3hvmxZrrVO+qoiVD3qk1+32QSwx2zAR8nhM2o3zdn5Ajzq8xNf8ZkXfaHK8g==
X-Received: by 2002:adf:9b9b:: with SMTP id d27mr30139394wrc.125.1607962047924;
        Mon, 14 Dec 2020 08:07:27 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id h184sm33334345wmh.23.2020.12.14.08.07.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 08:07:27 -0800 (PST)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: add support for mingw64 as target
Date: Mon, 14 Dec 2020 16:07:23 +0000
Message-Id: <20201214160723.145124-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Deepak Rawat <derawa@microsoft.com>

Engines are installed in a slightly different path, and
the host type doesn't precisely match in x86_64

Co-authored-by: Paul Eggleton <paul.eggleton@microsoft.com>
Co-authored-by: Deepak Rawat <derawa@microsoft.com>
Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1h.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
index 1827167201..b8ba10e324 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
@@ -113,6 +113,9 @@ do_configure () {
 	linux-sparc | linux-supersparc)
 		target=linux-sparcv9
 		;;
+	mingw32-x86_64)
+		target=mingw64
+		;;
 	esac
 
 	useprefix=${prefix}
@@ -195,6 +198,8 @@ FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf \
                       ${libdir}/ssl-1.1/openssl.cnf* \
                       "
 FILES_${PN}-engines = "${libdir}/engines-1.1"
+# ${prefix} comes from what we pass into --prefix at configure time (which is used for INSTALLTOP)
+FILES_${PN}-engines_append_mingw32_class-nativesdk = " ${prefix}${libdir}/engines-1_1"
 FILES_${PN}-misc = "${libdir}/ssl-1.1/misc ${bindir}/c_rehash"
 FILES_${PN} =+ "${libdir}/ssl-1.1/*"
 FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
-- 
2.29.2

