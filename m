Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.12831.1615311144532572875
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 09:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a1Yh+2eV;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id jx13so1246343pjb.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 09:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LIVuhRS4mw+uEQmtY3pT4gb1qbWVkQPk+blSL30SMCE=;
        b=a1Yh+2eVq+yAiOtONBOGC/Zk3QJnnKGu/3joxvAFGsfihFIEMH+2VVVHm49QB/9vQX
         OYDiNPwObmIprwYzGHQeVoYlqBuLRBfEvwYYXsQ9GzQNWN8qI/wjRG0en7SF8fFRY0wY
         xkINJJQwxDEj1Fyarm58Y/Fu0z0/qq3MNhiAPOQv6jOV64pLKcUQ9K/YBoEepXt4js94
         iONXhJ7cE98VGvexZDUyhVNB0+ceAxEYfMSmpa/FaN5C/jXGZkUmYQaH1/oob26aZBU3
         11Dc5TMZmexDSfx2dInTavHj8vnkjK62f4bMPwo/sD2rES1DnWTGzvjxt4GOOx0SUvsF
         f/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LIVuhRS4mw+uEQmtY3pT4gb1qbWVkQPk+blSL30SMCE=;
        b=G227QFR6pFlybpAzMTGddJ60NSG9DOXUW4aGd5PKqCqQCkKSYeset2iKPO8ljD5gNH
         MI8Dabylb50QigOICbMQprt3bTu82rYP6e9+A73UZtDIzWe1ckXLw5x5v08UjRRfWnXe
         OuMel7GMynjxpkTby61LOoxN1chmc3vDMc+kanVh9Ehl/BH78AYOYeVvH+n13xYkkkLn
         FGAMG1h07HqK3L24Wy9V7PCFIzdki90oW+SVKxxuiPVf+InZ2eqFj0pE/4j6CcTnPUxS
         7mDsKYeN/ut4PPKvo+gnUct8VT8onbEblmeno7YotdnVSeZLLnAnI83sAn7nrr2L6/DJ
         YQsA==
X-Gm-Message-State: AOAM531uU8hYHL5EEgIGThduX3A8ckuYUxIYU+TTH9fJhmEXony4AAxw
	CQWNVhZHBKuIzCe+WDVNXf3nDolSHUrvxw==
X-Google-Smtp-Source: ABdhPJyxM5qdlLxUCBuxQuCoWqr2/RpLfFpJgpJ6LQNXugTqzXwFjNyKYjDA0VIRHJki1L/e4gWI6A==
X-Received: by 2002:a17:902:edc6:b029:e4:6dba:415e with SMTP id q6-20020a170902edc6b02900e46dba415emr26641701plk.65.1615311143793;
        Tue, 09 Mar 2021 09:32:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id k128sm13541568pfd.137.2021.03.09.09.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 09:32:23 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/5] inittab: Add getty launch on hvc0 for qemuppc64
Date: Tue,  9 Mar 2021 09:32:09 -0800
Message-Id: <20210309173210.295033-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309173210.295033-1-raj.khem@gmail.com>
References: <20210309173210.295033-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/busybox/busybox-inittab_1.32.0.bb    | 3 +++
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb b/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
index 3804f4f7b2..0021e45511 100644
--- a/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
+++ b/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
@@ -44,6 +44,9 @@ EOF
 	fi
 
 }
+do_install_append_qemuppc64 () {
+            echo "9:12345:respawn:${base_sbindir}/getty 38400 hvc0" >> ${D}${sysconfdir}/inittab
+}
 
 pkg_postinst_${PN} () {
 # run this on host and on target
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index d95d1a63f5..0af116f35c 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -53,6 +53,10 @@ EOF
     fi
 }
 
+do_install_append_qemuppc64 () {
+            echo "9:12345:respawn:${base_sbindir}/getty 38400 hvc0" >> ${D}${sysconfdir}/inittab
+}
+
 pkg_postinst_${PN} () {
 # run this on host and on target
 if [ "${SERIAL_CONSOLES_CHECK}" = "" ]; then
-- 
2.30.1

