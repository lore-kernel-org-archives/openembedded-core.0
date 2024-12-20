Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89739E7718A
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 09:13:00 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.148465.1734685972281292319
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Dec 2024 01:12:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NQqua7di;
 spf=pass (domain: linaro.org, ip: 209.85.208.180, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30225b2586cso28623241fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 01:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734685970; x=1735290770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jjey3dQZqIgZv111LfLZ7I2Rf1SvseQm3+rkGxnAboM=;
        b=NQqua7dihHLvG2fLSY2RbRAduV5TgDWdYIjOkNXm1V3Sl8t2vr4m3a3CI6DZAjhRV6
         jpVKqzVTX+uxQ0dkkgY3hNmreJDTkwNskBQpIyvNlSMpVsuh+HszgUqDSiYvEb2dGVvJ
         nIwJ7HHVy55Zp3IcWan9cGiIk3UprSYq7nvH6Hm3MgrYvbHsbNM7z5ZjojqrPzuob/Rb
         qS5hR6cLED0G+BSW86mb1+vCbReeunT739xJSIRL+bqzRQ90Z/x03Xhj4auFrhAhrGnU
         Tuyc5dP6mgSZCsd/0DCrTjAu1xvMr/NFZ32XvH12+K+RYabCadbeGd28yJP/leY04hHX
         Epjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734685970; x=1735290770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjey3dQZqIgZv111LfLZ7I2Rf1SvseQm3+rkGxnAboM=;
        b=eZXPJ+g1CRf7b4yHvw3BP5Ca0a4Acx1YBNjdl3dA2l+CS9Qki8UjeOeo5E0JH3zMJ4
         5+C2yihWoOUyf3C2HViSqjr+D0lASvN5tWG7hwrHXgE608ytF5E2jcaO9xAXJh29/56f
         TsdBu0K7F4vr41YyMpTA41AY/sOu0AvcrrXXCOtqDPhgcWnTnnC7x7iphU7wdonwf8El
         mf2VAFhSCZyrlvb6BlMvnK+Spk0svRhtZNw9ZsnUANQPR7TFFjbBrIl46VaXNm3MsSAL
         xX1bgy4qUbgA2+tpc8gpqXouQUgPWU98YW9I/dx4rG7oPyzhUMO7fyxjPBUU49fyt5ek
         o5zQ==
X-Gm-Message-State: AOJu0YzAAQYnlKClJ4QM5EkzkEefBRNLmsJ72LWhJg7AOkbEdoPJIVFd
	/enXPTGKo1YMSUSHbasuR0lb3O6nJKjj4iHW9y3ULZ2Gx1FL28kjxvo7yfi2Gb49xxsXGkvufjw
	Yd94=
X-Gm-Gg: ASbGncsdlHPhuKtKJk0t4Rk+0tSK2UnCniBbsXs6nCZABigbJaWqKLUzekJHnbOpl5x
	79TMbbglMa6+ilzKB1znEfD4xbeGP24d5wqJRC0tUYh5gcsOBEo/hdxmhN+KX0KAkPRjn4OnhY5
	ByKrfahQejBqswCVjed0URtU1/x2ySzfPWTzxx+b6SVTrr15/gJwdRvUcn+1KVOsvHrPFs+k6SR
	oMiOf7SHFPPLIZm/+LshsRQBq83TMY9aKw19BgNXxntvIdDKlZyKXvNr7nDrDUhsn6pdNC5//fs
	mIuLg9U9te5r3jS6ZXjKP9I+LQ==
X-Google-Smtp-Source: AGHT+IGG1KfICzH6zi85Psz6ToB+OZTmGYbPPCy5E+vO6BjrAK7XkwVy93+c7HtBwNvicDBeBkn9ng==
X-Received: by 2002:ac2:5681:0:b0:53e:2098:861d with SMTP id 2adb3069b0e04-542212f0034mr2394688e87.15.1734685969093;
        Fri, 20 Dec 2024 01:12:49 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235fed36sm429868e87.62.2024.12.20.01.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 01:12:47 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 1/2] systemd: add apparmor PACKAGECONFIG support
Date: Fri, 20 Dec 2024 11:12:31 +0200
Message-ID: <20241220091232.230242-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 09:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208972

For meta-security to enable with "apparmor" in DISTRO_FEATURES.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/systemd/systemd_256.9.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_256.9.bb b/meta/recipes-core/systemd/systemd_256.9.bb
index a9224915c6..c047964953 100644
--- a/meta/recipes-core/systemd/systemd_256.9.bb
+++ b/meta/recipes-core/systemd/systemd_256.9.bb
@@ -69,7 +69,7 @@ PAM_PLUGINS = " \
 "
 
 PACKAGECONFIG ??= " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig pam pni-names selinux smack polkit seccomp', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit apparmor efi ldconfig pam pni-names selinux smack polkit seccomp', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'coredump elfutils', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
@@ -132,6 +132,7 @@ PACKAGECONFIG[serial-getty-generator] = ""
 
 PACKAGECONFIG[acl] = "-Dacl=enabled,-Dacl=disabled,acl"
 PACKAGECONFIG[audit] = "-Daudit=enabled,-Daudit=disabled,audit"
+PACKAGECONFIG[apparmor] = "-Dapparmor=enabled,-Dapparmor=disabled,apparmor"
 PACKAGECONFIG[backlight] = "-Dbacklight=true,-Dbacklight=false"
 PACKAGECONFIG[binfmt] = "-Dbinfmt=true,-Dbinfmt=false"
 PACKAGECONFIG[bpf-framework] = "-Dbpf-framework=enabled,-Dbpf-framework=disabled,clang-native bpftool-native libbpf,libbpf"
-- 
2.43.0


