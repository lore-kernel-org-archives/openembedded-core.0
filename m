Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.21745.1620583389960105621
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 May 2021 11:03:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AoZy+r/m;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id l13so14218284wru.11
        for <openembedded-core@lists.openembedded.org>; Sun, 09 May 2021 11:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+tDpEXvJJC40SK0+wtIbaTkdwAIasUQAy2L45h7sp7I=;
        b=AoZy+r/mtanheNnu5JBnB49ecMrYqtSn8Xocx6n3WTYRVvgkuuz1B0gg2SlPbLXJJ0
         /OkTT0bEAquhbM8Fp5RRr0O3Yzm5VnH7de84MU09N/EnDlYcs91zewUDhj+32+R+O9vz
         ZVrJNVewkkFK0Yc9zNlXnUjQnCajlU2efSakI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+tDpEXvJJC40SK0+wtIbaTkdwAIasUQAy2L45h7sp7I=;
        b=Gpa/+1XiUolLNkB4ShKVL2Yf56LxRDzcnoh6/NsPa42lcOrvptxb5KT9dndTlEki22
         rqk+JzRicCJvrrKYJM54m0KlYeV71vxILLF5krmt91MQSd1QlrNz+Ets14onuQSyMuI5
         3/kq2Z5WIZkDV7HoPqnEbbSuYwlCFayp6pfXmq9YyJjUMpdPeq57kawUSFge/mlyGgg8
         s9+HanWS7hZDeSuRWwg4B0+z2A9YGcM2XIou7xN0KdQOmUMw0N36OPT+25i3YdN+6kzo
         6hJduD8G3UHFLYCgDADfHBpvJvJcPraiW4ADPK7pd/z6hVnUfQRqSaRv/CAI3mxR9IJ/
         6j+A==
X-Gm-Message-State: AOAM532qcxCiR4qWMXvodLFwuqC3MSMSGmnpo13e+UVad/GKZuLV2Plx
	OhxF9wQLOShBaVQK/VsnGuvrR2rC2ZGOUQ==
X-Google-Smtp-Source: ABdhPJx/OcRhZAEU2urTuj/YpV3d6y9CLDXTyK8R3LwWc61vwgQoktjzR6/dfEbPAMLQdz5uQq7jYw==
X-Received: by 2002:adf:efca:: with SMTP id i10mr26370898wrp.284.1620583388104;
        Sun, 09 May 2021 11:03:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751ab90.skybroadband.com. [87.81.171.144])
        by smtp.gmail.com with ESMTPSA id p7sm18244785wrt.24.2021.05.09.11.03.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 11:03:07 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] grub2: Add CVE whitelist entries for issues fixed in 2.06
Date: Sun,  9 May 2021 19:03:06 +0100
Message-Id: <20210509180306.2134605-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We're using a pre-release version of 2.06 so these issues are fixed but
continue to show up in the checks since it is pre-2.06 and the CPE
entries are "before but excluding 2.06".

Adding these will clean up CVE reports until the 2.06 release comes out.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/grub/grub2.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 6de683ee1c5..f0fa86b1823 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -27,6 +27,13 @@ SRC_URI[sha256sum] = "2c87f1f21e2ab50043e6cd9163c08f1b6c3a6171556bf23ff9ed65b074
 REALPV = "2.06~rc1"
 PV = "2.04+${REALPV}"
 
+# Fixed in 2.06~rc1, can be removed for 2.06 final
+CVE_CHECK_WHITELIST += "\
+    CVE-2020-14308 CVE-2020-14309 CVE-2020-14310 CVE-2020-14311 CVE-2020-10713 \
+    CVE-2020-14372 CVE-2020-15705 CVE-2020-15706 CVE-2020-15707 \
+    CVE-2020-25632 CVE-2020-25647 CVE-2020-27749 CVE-2020-27779 \
+    CVE-2021-3418 CVE-2021-20225 CVE-2021-20233"
+
 S = "${WORKDIR}/grub-${REALPV}"
 
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/grub"
-- 
2.30.2

