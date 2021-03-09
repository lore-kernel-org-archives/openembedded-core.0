Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web09.12685.1615311145160325616
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 09:32:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gyj1grMm;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id mz6-20020a17090b3786b02900c16cb41d63so5581820pjb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 09:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZoLGo6XS9xSmX2bCrU6qGaAIxpinEz3VvexziAUGSSY=;
        b=Gyj1grMmZXB6sevnQ8CWkhwCzdgS/tp9gsQE7+ANwX+2u9sA8RuhGp432xcfXAJQ+P
         WZc5mPIflgQup8te1FbkXN5uLlhumqeuV/Z30gZTYwbPZyRSd2H6D94tOoVH1y/39nMZ
         0HgQypYANsqJpczgNhr8s3+Ts1ZjD/m8Gi0HO3E3NfvXjfrFTBqvcj203Qka2imdhaa+
         p1OX6XIWHtWa3bWhjl7AWYCTmMFZ6/xO2J7qTwWMUm7VT0ZwYuARtpTIQbe3atBhEV3k
         mJxoSnznBycVB7lPBQlb2zarMqL63yxo19x9XzDYfli4tH4ZwBQ8AtWc42zh2/p/2WFl
         JVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZoLGo6XS9xSmX2bCrU6qGaAIxpinEz3VvexziAUGSSY=;
        b=U2+bGi1cOAvmETKQrTAVsXk9u/zvUZP+aASqgFsTVmgA/xL2wtSPKDHZKI8sTd6IE/
         i9SLFNlgt9S4c4oGHmy+VwrWXFjGgPNiAqptSG78XZg2NABPUmz0+5lt10wxNHWkahAn
         yqnJHo92ZcqgBY4WPB82CFqqohUy1id8h0fXLI3gO/Ygl0LNgQdPIn0SY4u9udi8Gqeo
         98uy5TZANcUrF+YrtSsvbkoP+FVCBirH850JYydtsrh7g09bVKycrof6F2Mv96ZKfrth
         4ZmtKXop6emTGb7k1NDPwqx93cPz6DCuLe+DG7UPFdx28FPF4nGpsRHLRCvgWZmso9gc
         v6+w==
X-Gm-Message-State: AOAM530AV577fnidpGUEEwwGYoGRU+sO1x9N12dY8qx2w33FAPbXb8bv
	A95ZlnWdCdrUwRjNyor18wrcgdFR4Vsyxg==
X-Google-Smtp-Source: ABdhPJzZnLvjNOCMM1x2HYb4mW4YpkdKJEXhxcYo4EzQe2MeUdd992ZJkM2oMk/g9ODibWC0iYoSWg==
X-Received: by 2002:a17:902:b60f:b029:e5:e0e6:b643 with SMTP id b15-20020a170902b60fb02900e5e0e6b643mr24344781pls.64.1615311144503;
        Tue, 09 Mar 2021 09:32:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id k128sm13541568pfd.137.2021.03.09.09.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 09:32:24 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/5] parselogs: Allow expected kernel messages for qemuppc64
Date: Tue,  9 Mar 2021 09:32:10 -0800
Message-Id: <20210309173210.295033-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309173210.295033-1-raj.khem@gmail.com>
References: <20210309173210.295033-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pseries machine emulation ends up with these three messages in kernel
logs which are harmless, so ignore them for now

https://www.mail-archive.com/ubuntu-bugs@lists.ubuntu.com/msg5600561.html
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1827162

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index a1791b5cca..4714741aff 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -114,6 +114,11 @@ ignore_errors = {
         'can\'t handle BAR above 4GB',
         'Cannot reserve Legacy IO',
         ] + common_errors,
+    'qemuppc64' : [
+        'vio vio: uevent: failed to send synthetic uevent',
+        'synth uevent: /devices/vio: failed to send uevent',
+        'PCI 0000:00 Cannot reserve Legacy IO [io  0x10000-0x10fff]',
+        ] + common_errors,
     'qemuarm' : [
         'mmci-pl18x: probe of fpga:05 failed with error -22',
         'mmci-pl18x: probe of fpga:0b failed with error -22',
-- 
2.30.1

