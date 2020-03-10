Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id C7F0C601C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 13:03:22 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id m3so1259767wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 06:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=veX2j1QsUDpv1lmV+wa5NDOCyfqokc6nzrwcm6EAg0M=;
	b=eTdcLhL3FODvMeQ91lV8TI8f+59XiVZGi6mepz38+qPo+g2wu0TdL93QFsEWVfIjfy
	bzcxEO2mCdhdHrkFNqRMu+IAYXQ8k25OOktvR/hOYtAEU1NaTECN1TkV/yqMGgDUUVuk
	ApuWUdej2hruqUTqyWY0FqYbfT48HWIvo5rO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=veX2j1QsUDpv1lmV+wa5NDOCyfqokc6nzrwcm6EAg0M=;
	b=gbPvRXdmLQjHyA1V1cNeP5OwpoSlfa8bFKCL7axxvsgaSdA0Lmmva/8z6uhKtPSzTG
	tPFKizHizugXrdQaIC7yRR7l39yI0W3em3PP/OXk4+kuxwW6jHT9s+sziyMmImIGefFN
	7p0gvYEmTWNv5u8pITN8oqC+PBSH1s3XJCFmnayaj4sdz2rF6mF/GY04hZvcyUmPA16A
	OzKmkuYX0S+zDrWfg5c0KrimIX4LSddfkJjIBpRWpxRSBov3Uswm0UBlmM4YTBariAq3
	OW+A+mctJUIJZ7g+pac1aNgk2+Fgzvnb+5DiCY0qxDDUk7wO0ZRZ0YWbCpdHohuDc0Qc
	u0aQ==
X-Gm-Message-State: ANhLgQ0+Cxmr7rLAHGX3l25lcAINTGMwgqaZdMEve2e9jXn3LO1EzUKR
	xm+/dNl8pUeUklvnPc3xH+YqKAbBd9w=
X-Google-Smtp-Source: ADFU+vudqYJtUcvmB+0qSj8ClhCV75EkTVa/xYmU+g+DMKsVrepaM45ccwj1a8vmjWIRhLEBnQhAvQ==
X-Received: by 2002:a1c:a908:: with SMTP id s8mr2182703wme.133.1583845400693; 
	Tue, 10 Mar 2020 06:03:20 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h13sm7997782wrv.39.2020.03.10.06.03.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 06:03:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2020 13:03:18 +0000
Message-Id: <20200310130318.27749-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] oeqa/selftest: Ensure buildtools in environment variables isn't replaced
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Mar 2020 13:03:23 -0000
Content-Transfer-Encoding: 8bit

This avoids the seeing broken replacements like:
oe-selftest-centos/build/build-st-926tools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt
which understandably break builds.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/context.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 409698d57ce..48ec5d419c7 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -46,7 +46,7 @@ class OESelftestTestContext(OETestContext):
         oe.path.copytree(selftestdir, newselftestdir)
 
         for e in os.environ:
-            if builddir in os.environ[e]:
+            if builddir + "/" in os.environ[e] or os.environ[e].endswith(builddir):
                 os.environ[e] = os.environ[e].replace(builddir, newbuilddir)
 
         subprocess.check_output("git init; git add *; git commit -a -m 'initial'", cwd=newselftestdir, shell=True)
-- 
2.25.0


