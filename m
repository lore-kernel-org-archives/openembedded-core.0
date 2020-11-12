Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.7855.1605202098540069844
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 09:28:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=qEt0SQ8k;
 spf=pass (domain: blade-group.com, ip: 209.85.128.42, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f42.google.com with SMTP id a65so6239417wme.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 09:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VaEuWGBBEICWoB8rp2SaJc4WStM524mHAQWeAvQc/30=;
        b=qEt0SQ8k36DrWgJydP8IplU+Ubn/zyRLsAWhEGpplTAlogvZOw+9aNSdpCgqLl4Sz9
         gXil8yzs8IVqzmuVMmsAMbC/02/j++8Kx50bixr14f2RMQVKrMYnIZA9gRqc0XjYXHem
         HlKPDVv42SYEE1wobE1dVsiaQsJSsCMQq8hrjd/8v+ZkJQT01fl5Syxt+hY4ltvCIf+L
         +49hXT4U2+y/4sCSYRGz0zI2RwHrA7aPhcQEpg8VW0cBXif+aeojoF3TM6ppwLleslUC
         0gbabryTEOgAFYeXgqMGt7BQFjMnITrq8TNV5LJR5baPbyPE9jMiGc3QDjVGlVl/uO2Q
         y0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VaEuWGBBEICWoB8rp2SaJc4WStM524mHAQWeAvQc/30=;
        b=KZ08mRFdZQAa0Wv7h+7yefYzocv+tklw1XK6Yiu492qYZL3HgwUujNVJMPg18pPUwu
         ohEjN7KeV0Rm+JjIjp56QP3GTN7ypOygZO1BnvHzEToBpHaKhACs6xWo+DJ/F6Q6b69q
         wOM8HT0xvnHkAhy0NbtlDtZ3oZZvkBq+EczliZS6IiBIo+BmVoEMYbUMp2ygdjp7ronl
         Y4dohrHhcDp1C9Ol6N9Z2wOeFQbXtfMqXaJaytorNr9URo5Ecxed8dNO3aVm0O8pjWyb
         CVrlqnTVoMH7UFTQTIHvYgqIlUuFp1+2S+7c9ZgU0XrslaPIFFO82JoKcBMH2YKexLv0
         RQfQ==
X-Gm-Message-State: AOAM533o5L9/gW1novYUBW9yVQvmZlw7GPPGftWyB0LvajJSixUCCdMX
	EurT5Vf9p0GCbhJ8zqU1UT/cT6YsghFS5A==
X-Google-Smtp-Source: ABdhPJx2vD84UWo0AAWmS6Kkjl/Vu6KLiWJ0CRtqBLnZTg4oeoB3qwSTkerQoVdRmy472a418iAhQw==
X-Received: by 2002:a1c:4c0a:: with SMTP id z10mr707984wmf.96.1605202096445;
        Thu, 12 Nov 2020 09:28:16 -0800 (PST)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id j15sm8198906wrm.62.2020.11.12.09.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 09:28:15 -0800 (PST)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH v2 1/5] systemtap: split examples and python scripts out of main package
Date: Thu, 12 Nov 2020 18:26:12 +0100
Message-Id: <20201112172616.784945-2-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201112172616.784945-1-yann@blade-group.com>
References: <20201112172616.784945-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 1c9f2aed16..e98aff1851 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -38,6 +38,23 @@ RDEPENDS_${PN}-exporter = "${PN} python3-core python3-netclient"
 
 SYSTEMD_SERVICE_${PN}-exporter = "stap-exporter.service"
 
+PACKAGES =+ "${PN}-examples"
+FILES_${PN}-examples = "${datadir}/${BPN}/examples/"
+RDEPENDS_${PN}-examples += "${PN}"
+
+# don't complain that some examples involve bash, perl, php...
+INSANE_SKIP_${PN}-examples += "file-rdeps"
+
+PACKAGES =+ "${PN}-python"
+FILES_${PN}-python += "\
+ ${bindir}/dtrace \
+ ${libdir}/python*/ \
+ ${libexecdir}/${BPN}/python/ \
+"
+# python material requires sdt headers
+RDEPENDS_${PN}-python += "${PN}-dev python3-core"
+INSANE_SKIP_${PN}-python += "dev-deps"
+
 do_configure_prepend () {
     # Improve reproducibility for c++ object files
     reltivepath="${@os.path.relpath(d.getVar('STAGING_INCDIR'), d.getVar('S'))}"
-- 
2.28.0

