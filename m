Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.5911.1605606921952626379
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 01:55:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=hhwYTc0f;
 spf=pass (domain: blade-group.com, ip: 209.85.128.51, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f51.google.com with SMTP id s13so2615946wmh.4
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 01:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XW+am/0XI//pqpiV65riyBzFxq7v+X29Vj0vURD02D8=;
        b=hhwYTc0f3eo+niBTAY8SViMTtu93Z5WC5UGoNRxgWGITrc8hvL6cRk0KlhERLHdhSR
         vuhnHR86NamwQnuVcnxmdWxPGQh4PE6dwBU2iMDNAJl6BVo48UKNdzC3YvHQ+7aQpD6T
         6Igi06BP3k/fZa9jSGp2LDXNhyIVxujE/gAqP2Uwzaa4pM1LPh39g+KboF4rTeKaqu1S
         8yZgHRXwEkwT392Ml4FKQpxi8YWgbiaiGOeidyT9aekOo9qLtLXBb9+XiQKn+A6JiPFu
         XaBQt0DXO/g8SY8E5S9kvVIgB5Ee48PcxecBaOl9ro41yWmxcwGfh/SzgGDzGC+bk7T4
         3a6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XW+am/0XI//pqpiV65riyBzFxq7v+X29Vj0vURD02D8=;
        b=Qc2BgC8AsVLcKOkzyt+uJU47v4GIWJ9sT4SQhcFjFGKyixF8cnuxHIwfWLtAyDexh/
         IFFaY4apTVUu7f259VcdXR8N6Ziy8NN/furHjkfiSdhCbJ0jgvoTfwSE8dfkHNkCVRz0
         AVWnJR9a6PfwZDSbjqK17Q8mh1i95uCykC6oHqIXorGrYuY4lDDobwj72CmBtV5i1ecu
         a7hHAMp5JitQOcD5IVsht3/Kb/V87PZtaVhetrLvvaXCV60wz1uZWxZ7Qhzsw7oTwYTx
         lm6yYu/1mui8XZtHJwykvOX0dH+4W+9kz65ygfIWm36ds5s+1mHMZidvVV+agATqtSqy
         6edg==
X-Gm-Message-State: AOAM5335EnSMd3BTuhQSim2oBQsV+db+dGsK2rinqptFTJElcx8CWBk5
	A6K/LbE7eFXxxxEoez76BZyWDOD6Q0AjDw==
X-Google-Smtp-Source: ABdhPJyNtFnFu68nMCDTjFKFP+WYdwNXn9l6wx8u11qQoGBcwkIdFS2T4PTIQZDdrjLPJSoiq9/LeA==
X-Received: by 2002:a1c:1f08:: with SMTP id f8mr3442152wmf.30.1605606920108;
        Tue, 17 Nov 2020 01:55:20 -0800 (PST)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id j8sm22963275wrx.11.2020.11.17.01.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 01:55:19 -0800 (PST)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH] systemtap: avoid RDEPENDS on python3-core when not using python3
Date: Tue, 17 Nov 2020 10:54:48 +0100
Message-Id: <20201117095448.1701563-1-yann@blade-group.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

distutils3-base.bbclass unconditionally adds python3-core to RDEPENDS_${PN},
yuck.
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 8dad5b15f0..923d64b975 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -25,7 +25,8 @@ PACKAGECONFIG[sqlite] = "--enable-sqlite,--disable-sqlite,sqlite3"
 PACKAGECONFIG[monitor] = "--enable-monitor,--disable-monitor,ncurses json-c"
 PACKAGECONFIG[python3-probes] = "--with-python3-probes,--without-python3-probes,python3-setuptools-native"
 
-inherit autotools gettext pkgconfig distutils3-base systemd
+inherit autotools gettext pkgconfig systemd
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3-probes', 'distutils3-base', '', d)}
 
 # exporter comes with python3-probes
 PACKAGES =+ "${PN}-exporter"
-- 
2.29.2

