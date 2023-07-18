Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EDAEB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:27:19 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.9129.1689690430154451536
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=0o8nJS3f;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-666e64e97e2so3838111b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690429; x=1692282429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aAbs1GHDQZzGwomCw1Vlrky/p6QTk4MBpA44/yJrOM4=;
        b=0o8nJS3fPFah/pejW7PZEm3DeAvQLC7TirWAt03eGtuFiUJsvCMom4zmljEz8inzPH
         yPC4yNbMzEQdqF8aI41JuKw0tXPKm4i0pwSiSfsvVzQBng/xsLTtwwcf7qs8glSXhtLL
         Xb/QFiD61X1zzyWWBA+FT7lCYtVnCHXXOdruDelPDtzkZPsSHy3y39oURiiEveW6MjpF
         K/ibLxjN1/LqY29uILDOy9u3fM/5hBeOURrXPkI43qF9eAERRKd+AwJCH7N0G49UY0I+
         8l8RX92htQRpzjUGtPq3l4ckpHSQdQbk1tHuNZIG1gCwH3mAYEb1K5nvpxOJ7yaIIRh0
         mpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690429; x=1692282429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aAbs1GHDQZzGwomCw1Vlrky/p6QTk4MBpA44/yJrOM4=;
        b=PVkV9+PdCyRGxQZDLafUqNkj4UsFCaskVeZQFbH0QS23w8zB5OmtPNGAm/Ng2QQrZt
         qCT09Rz4O+qtOpIsOT1FxlEbQN1/D1kofEFrws+KmHiyTeCT95biNYbkqRre2UyGxZZ0
         aziQCmY7zdUpTalIjJn35BF0FKMijlQoXqtNFOPXUe/E8eABCOShl8nuYULan3g5tFJl
         azEfCvJ9EgB5w/TgoIKUtiOmKIS98o2XZkO2h/9S4aAEdufwGx4EuRiQdSQSKgycr6jd
         Fp3uvIadGi4zprSqtfSsqJyqE3I7t+X0YwfTyNBWb2WDymewLQVnCs8nCaKI+z7LpCn2
         jJ8A==
X-Gm-Message-State: ABy/qLb0FAcOFeUNtx3Ej3niZZQzE39JPQzlW2a1rDnfVNvIkdZm4cx4
	xAVSeFo88ptZXtRe82Cw1+2ThmTQP41RU5L2zXQ=
X-Google-Smtp-Source: APBJJlEdPqThO69FirE9/yUVX9XmhsKxPNNjpHqaQIKh2wMQGT+mx6exegbEsix8woqyHFi+FVsz2A==
X-Received: by 2002:a05:6a20:a122:b0:132:86ea:4725 with SMTP id q34-20020a056a20a12200b0013286ea4725mr16985273pzk.45.1689690429299;
        Tue, 18 Jul 2023 07:27:09 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.27.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:27:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/27] sdk.py: fix moving dnf contents
Date: Tue, 18 Jul 2023 04:25:56 -1000
Message-Id: <006ff31ddad4c53c63adf1dacecbf2783404a546.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184526

From: Chen Qi <Qi.Chen@windriver.com>

The dnf contents should be moved to <host_sysroot>/etc/dnf/xxx
instead of just <host_sysroot>/etc.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 74b78d160a985e98f869c777847ab798e419dd2d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/package_manager/rpm/sdk.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/rpm/sdk.py b/meta/lib/oe/package_manager/rpm/sdk.py
index c5f232431f..04dccf49d7 100644
--- a/meta/lib/oe/package_manager/rpm/sdk.py
+++ b/meta/lib/oe/package_manager/rpm/sdk.py
@@ -110,5 +110,6 @@ class PkgSdk(Sdk):
         for f in glob.glob(os.path.join(self.sdk_output, "etc", "rpm*")):
             self.movefile(f, native_sysconf_dir)
         for f in glob.glob(os.path.join(self.sdk_output, "etc", "dnf", "*")):
-            self.movefile(f, native_sysconf_dir)
+            self.mkdirhier(native_sysconf_dir + "/dnf")
+            self.movefile(f, native_sysconf_dir + "/dnf")
         self.remove(os.path.join(self.sdk_output, "etc"), True)
-- 
2.34.1


