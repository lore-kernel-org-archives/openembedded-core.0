Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web09.14832.1605815671814205821
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 11:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HnHs22ep;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: mklntf@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id c17so7671439wrc.11
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 11:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hhJZmXH9w6ngFcbZ38skKgR6gXqeBoJUHHh4SlXswrs=;
        b=HnHs22eppZ4kkCTGhZFrwIWiHTYX+pKiV/rg1f0+8ktUOircw124o6vEHaL9fDJiJ6
         JfqW27hMwwvW2y/MMF3Ot7U5Guwf/mpqI+8WKMLJGZThSG1OleQBTCYY4DoJdBiE55hz
         dnf9pA+jO2+kM7FMsxnE44wiPqCUFixno4HnTfDcvWatM8DVwTIYb83tK9ZdTd0jtsBD
         31Q1sCBofB4Hibzy38YpzAqj3OenLLMvb/UikImzhphYp7zscrPmVO9LS4wmPp3u08+T
         i/pxcSb2v196LLt31c4VoV8uKOc+iRxJIWkATvJhRKHTWDc52TDx6Ugn7U8+ZbbbvQOS
         YIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hhJZmXH9w6ngFcbZ38skKgR6gXqeBoJUHHh4SlXswrs=;
        b=JkMTIrvfktEwFgVpBiitvyFV51fM5E2zHfBZXmziCXjG/EgNqofDBICEeaPRwMaEEW
         KCMBlsWjchjAb2W61VYg6ga6RIODwJ4kvkVzNRwwHgIHsyZM8F8It2+YRcrO7T8UpbYl
         8u+vSJ5q4CcOEd6SOhPHZab38XKMKWLR+Fb0dE18B2x86wOkPfYZb/dRcbSTta21S3IX
         S9rX9GYbpihSLxiF95dr9yHBj0yl4z4NHG7oUZZavVAzmWRwpvoByRqxA2VBpSHtohsr
         7KUYcrSz1Ud0+okrb7sr5msn6xWmkcM1Vi/byWhkldTwfGOD7bTd9gxs1mxf5B5DqW9M
         wFqg==
X-Gm-Message-State: AOAM533MerScb6Xn00Ee4EGmC1kTntdB+QFU421QAQ3mhsNrusZkoBkc
	av3a7EjsJrVLPQd2/3sng0+K1s0jPj8=
X-Google-Smtp-Source: ABdhPJz8PJyy5QP21l/D7B5SetfPTJtnr3mDOSbx8nG86vr2r6wZd6hRdtKA0S5sDG4aKPUY/9U2Lg==
X-Received: by 2002:adf:a495:: with SMTP id g21mr12845103wrb.213.1605815670306;
        Thu, 19 Nov 2020 11:54:30 -0800 (PST)
Return-Path: <mklntf@gmail.com>
Received: from localhost.localdomain ([2a02:810d:6e3f:e9a0:db66:7c53:5f42:fe5])
        by smtp.gmail.com with ESMTPSA id b145sm1566483wmd.0.2020.11.19.11.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 11:54:29 -0800 (PST)
From: "Markus Fuchs" <mklntf@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Markus Fuchs <mklntf@gmail.com>
Subject: [meta-oe][PATCH] haveged: remove appending of the service file
Date: Thu, 19 Nov 2020 20:54:27 +0100
Message-Id: <20201119195427.11968-1-mklntf@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit c1dd93296ff69c0c29dfaa22f586b8738e71ee52 ("haveged: use the
Fedora service file available from upstream") changed the systemd
service file from service.redhat to service.fedora.
The line "SuccessExitStatus=137 143" is available in service.fedora, so
it is not necessary to append SuccessExitStatus=137 to the service file.

Signed-off-by: Markus Fuchs <mklntf@gmail.com>
---
 meta-oe/recipes-extended/haveged/haveged_1.9.13.bb | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.13.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.13.bb
index 50326ea2f..6d4979f4a 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.13.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.13.bb
@@ -32,15 +32,11 @@ SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "haveged.service"
 
 do_install_append() {
-    # The exit status is 143 when the service is stopped
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        sed -i '/ExecStart/a SuccessExitStatus=143' ${D}${systemd_system_unitdir}/haveged.service
-        # Hybrid systemd-sysvinit distros must install the initscript manually
-        if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-            install -d ${D}${INIT_D_DIR}
-            sed -e "s,@SBINDIR@,${sbindir},g" <${S}/init.d/sysv.redhat >${D}${INIT_D_DIR}/haveged
-            chmod 755 ${D}${INIT_D_DIR}/haveged
-        fi
+    # Hybrid systemd-sysvinit distros must install the initscript manually
+    if ${@bb.utils.contains('DISTRO_FEATURES', ['systemd', 'sysvinit'], 'true', 'false', d)}; then
+        install -d ${D}${INIT_D_DIR}
+        sed -e "s,@SBINDIR@,${sbindir},g" <${S}/init.d/sysv.redhat >${D}${INIT_D_DIR}/haveged
+        chmod 755 ${D}${INIT_D_DIR}/haveged
     fi
 }
 
-- 
2.29.2

