Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523FEC47077
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 16:56:57 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.28483.1704473814448388656
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 08:56:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XETwjC/H;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: ticotimo@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5968b4a073fso214449eaf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 08:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704473813; x=1705078613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HLnprbXNp52RlxM6wIwYghsFWgz5kwo/ARUDJMs7GZo=;
        b=XETwjC/HlS20/vJ+uVJu/Gag2iqgQbtAuJxmP/XMWa7xHa20Jkf/gPLjXheXDzedD2
         udPXP/WxwcnR7DGQgQx/4GPLzND9lua0acgI8zlVAIcOkFxi35A0ETM6UBpEKaS0Q9Sv
         hHHteRKri+HqKAq8WTlX+qyCthAs3KNJRdoKuhcL/HCSiHz1IKGuhY9nRm8pMgVwVFvs
         xH9Kbl3oplDyyFRw6TO5LrZxuIYqpcHXIbu4wU2EJvZwpTozrAyjpchxrXGk9gNrkybZ
         TcT7t4WFMqWxY9D+KxaJsvEta984B48w7xTFrQhLLuTwiUQwEBvcAwJ1E9blGkomDKWa
         ueTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704473813; x=1705078613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HLnprbXNp52RlxM6wIwYghsFWgz5kwo/ARUDJMs7GZo=;
        b=MphL5D0J3OxiKEyNyQtqMDeIuF+vz5Vpur+l9zrdQjqDfkxTZsvicHpTWoip3az4Nf
         9wHz0+qRniZYtDrY/twv45FcWCrWMWy0SOigYt6htEoxAL6KIHR5YrDdTKk1DGj+pQ4/
         ZYcI7kNQdKVVI6ZMAiEzOz3FAXUCkh/OlbdMjj9sSeVEn+c/kiuocNjvrre9dcLdvH7f
         kbfj8XSlGqnOjwhy8OL4zVNGKhdXNOySZLlC7NGo7seWfjftu7tbMrt+GsPbRAx9vlFw
         FazrCYEV8JnO7RkRJimDIGxpAKWmGtW1TIrvz2pANx3GutC6oTZz69AyAruZubKAE8Fn
         MbbQ==
X-Gm-Message-State: AOJu0Yzg9dZDySEMwbHnyKbZllzRY7mCqeqELI2SUwzpWeAhBYQ+nbmP
	8XRYzQ+/+Ru4dC3LI78oAt8+XPkTtH4=
X-Google-Smtp-Source: AGHT+IH2tPYXr3ckemUlZm8vltnyqjAeePyyt9Xm0N11bVZ9I9sYd53kXZXJuhKJWXZxooaCQGRiew==
X-Received: by 2002:a05:6358:3381:b0:172:eb9c:1d4c with SMTP id i1-20020a056358338100b00172eb9c1d4cmr2345046rwd.11.1704473813118;
        Fri, 05 Jan 2024 08:56:53 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:1ef8:e4e3:e071:1cf1])
        by smtp.gmail.com with ESMTPSA id bm13-20020a056a00320d00b006d9b8572e77sm1617151pfb.120.2024.01.05.08.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 08:56:51 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] openssh: upgrade 9.5p1 -> 9.6p1
Date: Fri,  5 Jan 2024 08:55:55 -0800
Message-Id: <20240105165554.1401517-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 16:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193372

* Relocate Upstream-Status in 0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
  so it will not throw an error in AUH

https://www.openssh.com/txt/release-9.6
https://github.com/openssh/openssh-portable/compare/V_9_5_P1...V_9_6_P1

https://nvd.nist.gov/vuln/detail/CVE-2023-48795
https://nvd.nist.gov/vuln/detail/CVE-2023-51384
https://nvd.nist.gov/vuln/detail/CVE-2023-51385

CVE: CVE-2023-48795
CVE: CVE-2023-51384
CVE: CVE-2023-51385

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All ptests passed on core-image-ptest-openssh on qemux86-64

 ...regress-banner.sh-log-input-and-output-files-on-erro.patch | 4 ++--
 .../openssh/{openssh_9.5p1.bb => openssh_9.6p1.bb}            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_9.5p1.bb => openssh_9.6p1.bb} (98%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
index 2c14014fed8..8763f30f4b3 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
@@ -34,13 +34,13 @@ return value: 1
 
 See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15178
 
+Upstream-Status: Denied [https://github.com/openssh/openssh-portable/pull/437]
+
 Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
 ---
  regress/banner.sh | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
-Upstream-Status: Denied [https://github.com/openssh/openssh-portable/pull/437]
-
 diff --git a/regress/banner.sh b/regress/banner.sh
 index a84feb5a..de84957a 100644
 --- a/regress/banner.sh
diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
similarity index 98%
rename from meta/recipes-connectivity/openssh/openssh_9.5p1.bb
rename to meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index bbb8fb091ad..fa44eb0bd4e 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -28,7 +28,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch \
            "
-SRC_URI[sha256sum] = "f026e7b79ba7fb540f75182af96dc8a8f1db395f922bbc9f6ca603672686086b"
+SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
 CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
 
-- 
2.34.1


