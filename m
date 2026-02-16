Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE72E63F3F
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 08:47:00 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15896.1771231615646134139
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 00:46:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZTyZRRfB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4806bf39419so35089325e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 00:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771231613; x=1771836413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AbwoIBwWx3nWvJtM0cksxF42vH9bp4IzV3tepdZvLVg=;
        b=ZTyZRRfB9wEAyWRDUnoQImxjbcCcWFt1utZQ31HV36SGugaz1dMz5keyoCCfpWgkfQ
         cf5nQ2Cs07xKwEg2yFcTmIt7HmNdYiYJrkcQ+Ma4WCm/VYjaiRXMVrYNU1ihDrVQJ2m1
         iror49FZOc60PqhRjaIvEJFivor/+qcd6Jjnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771231613; x=1771836413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AbwoIBwWx3nWvJtM0cksxF42vH9bp4IzV3tepdZvLVg=;
        b=kqCbu/MWnYh053Gt6Ycs01V+DC/t/nlpOgTfyrriMf9sQpRqPNJHjaZ8s14WgezJqj
         txqPlCnM9bxRCuunCC2m2ivKi7+rw008S+xThohUVx8nUU3wf/IoSLHaghLFIbF1YOyh
         JNpuI9XG4vyoby8AtjiUN27pXddTmMTRpirqpH+IY/M5cn17Uct61KdeTJi+xJcfnzXH
         +ecxChbdSNxVRmFXGhYQXuplX46YNDee6EqLRbx5nMgh95evyNzRRpjPa3ubfvl5+VFn
         5ru5koDi/DnCJ74EyiInMgjOBO7QL0zNxJenZZc4cW0dQI14hEUytHJfaHUyx+FGGxZg
         i7yg==
X-Gm-Message-State: AOJu0YxFrxnBQcEv+1AtW3vPcwhkQScTjTn1229UR4SKFRTFrg8/JzDb
	E7hZe+ggIILkK8gZydH1qYkxBrVfkL5u77NBetM6NSgqKVMwY+nJC6cgqugYI+mDM43m0S8MsdA
	zoqA3rJ6srw==
X-Gm-Gg: AZuq6aKwMKZ4zra6IICD5TBkTFq3zLyBmb0muY2+OrxaGDWNJI8yWWcNLrG3SLZebNK
	/zS6yClMBx7QX1bEYdCzpzqMDx8x7XsgBkZnQw7CCyA9UOiNvEPZjWtfaUBT8VmAdAfqc11J7An
	gaLIX9GgQ/ASvaJM7ex0UufRQbAqB05+56z93iIJnbHMJfq+MURk7tTbJiJSzuHlR8RVgA/Nse5
	+qZdHPOgu6jg3mD0Ga30JAj6cuxRgWFXYocUZ5N2OmYOPzot2wUFpGHzYQZMVrKT5oqatkEFZzg
	MWVCdFa4+3vHOdGMPKaFyDsXDVlmbmBeghWYl4qbLqz7eFxiri/ZzCzx+9fy4XP9BVkavR1i3Lo
	Bm52feXT+ARB5ulgStYCynLyxaRN8nvcw95Ba8Zi+i7++j4kysVm4O4MK2ZOFZHCh1L5gWqMz+y
	VzF/UQcvI4eDsUFD3K2onVbr+83Ax4kmxqZCykE1+ep9OtFw26PcRGy7uLhdcgAA==
X-Received: by 2002:a05:600c:3b87:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-48378da53a2mr128365745e9.13.1771231613270;
        Mon, 16 Feb 2026 00:46:53 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c30e:78c8:ded9:8375])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5ebd34sm473648485e9.7.2026.02.16.00.46.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 00:46:52 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] oeqa/selftest/bbclasses: Drop systemd+sysvinit test
Date: Mon, 16 Feb 2026 08:46:48 +0000
Message-ID: <20260216084649.2127586-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 08:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231186

This configuration is no longer possible with recent systemd changes, drop
the test.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/bbclasses.py | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/bbclasses.py b/meta/lib/oeqa/selftest/cases/bbclasses.py
index 10545ebe658..8595bb5d6f1 100644
--- a/meta/lib/oeqa/selftest/cases/bbclasses.py
+++ b/meta/lib/oeqa/selftest/cases/bbclasses.py
@@ -54,29 +54,6 @@ VIRTUAL-RUNTIME_init_manager = "systemd"
         self.fileExists("{D}{systemd_system_unitdir}/{BPN}.service")
         self.fileNotExists("{D}{sysconfdir}")
 
-    def test_systemd_and_sysvinit_in_distro(self):
-        """
-        Summary:    Verify that both systemd and sysvinit files are installed
-                    when both the systemd and sysvinit distro features are
-                    enabled.
-        Expected:   Systemd service file and sysvinit initscript exist.
-        Product:    OE-Core
-        Author:     Peter Kjellerstedt <peter.kjellerstedt@axis.com>
-        """
-
-        self.write_config("""
-DISTRO_FEATURES:append = " systemd sysvinit usrmerge"
-VIRTUAL-RUNTIME_init_manager = "systemd"
-""")
-        bitbake("systemd-only systemd-and-sysvinit -c install")
-
-        self.getVars("systemd-only")
-        self.fileExists("{D}{systemd_system_unitdir}/{BPN}.service")
-
-        self.getVars("systemd-and-sysvinit")
-        self.fileExists("{D}{systemd_system_unitdir}/{BPN}.service")
-        self.fileExists("{D}{INIT_D_DIR}/{BPN}")
-
     def test_sysvinit_in_distro(self):
         """
         Summary:    Verify that no systemd service files are installed when the

