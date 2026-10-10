Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C216CCA6017
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 13:21:12 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9278.1791638471192215231
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Oct 2026 06:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=f/M6BL8w;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3535a54bed9so743623eec.1
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2026 06:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791638470; x=1792243270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pQrG2cY9SJgntoiZJCoSiUXwtUfw1ksAoyIVe/MQies=;
        b=f/M6BL8wUf9acK39sgXmfl29sHG5vSouOC1m24Zj9mVLejcCjir31mgqchsUjLai+E
         3CRPDuLOBlVEDSTTc9z0wbEIFal3T8Ph/Oovscg7xptFDrsrkuG7BQaqC1ER5lqaM930
         2skuQCHAkxC1JGa9K2UaxQFKUc2xBl40u6CRWynpPrRxGAdw/LcanJ5+OTSme4AnqdEz
         n3saUbWjSR15fcZW6G4vFjYdcjY+Mqrio7tPGAq7aTqI9CgXtrTQq9mWFka0pu05d313
         o9pBjspNVzjA+rBGVbsSzA5ARgp3KYkq1H0B9sF3MyhLHFWbpax9eAnxN5qTGKAQtqNG
         UOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791638470; x=1792243270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQrG2cY9SJgntoiZJCoSiUXwtUfw1ksAoyIVe/MQies=;
        b=2WhyJUmESQ3TGEFeumIq43hdAUrIeWOaqA31kgIvJjGQhpFWkMWWGajWhnPfcWG3iR
         9XEBdgSDAITINLBNDEVe0e92ib8FKReHHtCz0UlfHv2Vu5QeMLQ/7qwzV2vlBqgM2OkP
         EF7qScVlmTnxjw70aknuKwdVYbMvWUgmEEN2kFEtu9QNDjT4agIL/1SxSzEMDEffSjMZ
         cRex5vetb050WI7iy9qPt90+wshjL18PyR2/jGDSOuiiieJVmepIiILveuPCtp+M2Un4
         rhaJ66iu6xIe1iQSKQLzzdZZPoft2sX0RH2chOMw4VH2huQfmsLGtFHo2sMEV+DDqFqr
         JUNA==
X-Gm-Message-State: AFq9FYJ02WLpWJsJXv872hjG/YrvULAuI5e/yv6t0A5h6yeBExppFwdk
	eiV0aXHExH8IUMCyaPRvA6jGV2ImbJjSXBOT/N5XTRdnrg1HevU1Ybr6/0IogQ==
X-Gm-Gg: AYBFou1pSqIP8/JTGpe+d27iJ2odDvB1hWI+uEZqdlTxasMXELbqlmZmErq1iyyDebs
	Hyi06ZkJGiYaPA7q37WO9dA37Rx1NvuYZnSeW6LpoUVjtWZH9+cy+XzHoklj5i06rx/6VbQovYf
	A8gXwRIMcLNO2n5WARjocGsWgJoe36LjArajgDnn/ho4XimMyb6Ojfet4+6f8RlqJxZmzQktdLV
	/IKLiJQgfJQzIZmFSSAi6B60rLX49T1ba7nHyXBDdq2r6rIc2jjPX+ETStCRAtxo8m8Yez4s5xi
	i45xkgAVOPRUwjmH8GDBHs/XcmuRoWHUP8v3o0Y8ThVtQUZL52iCTDqKEC8Me+oM1cejlqbqETI
	XFl0NEqq2Ww/P07Xlp8U9UvpAQHWPGF7VQwokrZ6g3vlf6tNLdmNX3y3/xgCIXsceyLqQg7daru
	dOKacUnAvu/fBXaytt83Kcz5yb8F83w4ogoFc7yoXlzzzVbfJ97Ksi2ty3NmylpX3dKZ3QAbdXZ
	rFdhxb9Yv/fEux7cC0A7Os8KbiK97JXquATLwtiGYWyzyXYzZq1NVXCfzOVA44b7dLRwORhBmzJ
	vpv1AedrMe6helg1XmT69JJoYJVSSLBPt58uP1HG8MToLLBzTU5hVQlB90BYeVHuepmNqp1hTjV
	5ff946VV2GNFMB5NcL0vTb+e3a9lECtMUCNHW6rlHmkO1PAl/26NNzIF1Z4vM9ejls+FgpGJhX1
	Fe4GDMJ4J1gsJjw8Icg2tglvP2M1IeKSwdcjwBbiKVA+UA7rMQgfysNftU
X-Received: by 2002:a05:7300:2214:b0:33c:259a:759 with SMTP id 5a478bee46e88-3537e24a076mr9834434eec.36.1791638470163;
        Sat, 10 Oct 2026 06:21:10 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2954bsm16250200eec.26.2026.10.10.06.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:21:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] ptest-packagelists: Skip dbus ptest when dbus-broker is the dbus provider
Date: Sat, 10 Oct 2026 06:21:07 -0700
Message-ID: <20261010132107.2159495-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2026 13:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247498

When a distro sets VIRTUAL-RUNTIME_dbus = "dbus-broker", systemd
RDEPENDS on dbus-broker, which RCONFLICTS with dbus. dbus-ptest
RDEPENDS on dbus, so core-image-ptest-dbus fails in do_rootfs:

  package systemd requires dbus-broker, but none of the providers can be installed
  package dbus-broker conflicts with dbus provided by dbus-1
  package dbus-ptest requires dbus, but none of the providers can be installed

Only add dbus to PTESTS_SLOW when dbus-broker is not the dbus provider.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index e8c9c18f92..1f00a67f99 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -122,7 +122,7 @@ PTESTS_SLOW = "\
     bzip2 \
     coreutils \
     curl \
-    dbus \
+    ${@'' if d.getVar('VIRTUAL-RUNTIME_dbus') == 'dbus-broker' else 'dbus'} \
     dosfstools \
     dpkg \
     e2fsprogs \

