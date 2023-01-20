Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09035C52D77
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:12:10 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.82081.1674238325522008280
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:12:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=5wkZsasB;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id t12-20020a17090aae0c00b00229f4cff534so1824476pjq.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D2mKmSR8Nx5VcP081dVhF/n6zDOqcZQIVnoclGbVGTA=;
        b=5wkZsasBLpRPSVnl5mkFTKOvdo1hXK7moJ/mcYuCXQUnp2E8zB9KWepyUUgPIFR85K
         Z5HQiPRW4wyV1kOAZoOz/fHDrH8yxhxG9pUyHUrJq6cQsInUlrgj9vSe46Mfh+/cilqX
         QMuXJXfy+gEVt11tLulESLE4T5CNjR4lkb1xpCKC1p/NK6fiNic1nfaZuDgHKkpQO3ib
         tRYyURJdBKZZSLWm57au7ZWPpzxjsWPX9H6X/9gRV7gvG7e8R2Si/KCt6ODjBpLDDhSQ
         hiKNq925g3x/l/HJmjRUcCII+tHvBNB+sBfPZkMM+g5IzheW4rpBbb8wO9Zd0Fcg31pj
         m0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D2mKmSR8Nx5VcP081dVhF/n6zDOqcZQIVnoclGbVGTA=;
        b=sB6P5BDGudTXr3irnscIr72LtfVDucbyd/tm/6V9MJB6MPOKcaA4wQ8OizLbbEorf/
         xGbuSOCVGaiGSY4cBSwuEkFUMCuysYfIblTd7i6/6pigjdC9Byccab5QbHpN502xu1dh
         mtx/FbI6kJiWeun0L6rOBpKsvMaaQqTBxqK65/M6zk+TnmgR8ui+W5w3C6TNqPBP4qR1
         PGaLzF/gE7GLa/Bs+m6NaYO3j2A5A6WxEqL1muSJxtFUC1WFpE+8mfYAlWMKX6VA599d
         EOqTSJCVdjqewB9t+5kzojflOFmFpzakYg4JniUxwl2sM3AKPtq7gBziAO4p++Qkqctm
         SvQg==
X-Gm-Message-State: AFqh2kprczhIZ5CVJwpjxunOtOGrsyRovdZEGEjmVYclBh6TR3BdCHdc
	Xyw+Cxu3mcUxTjA8pWYTKzYp8Qed8WNgO+NlXl8=
X-Google-Smtp-Source: AMrXdXuZlXO9T5+jOnDqIRBd36w3iRljCeyPMnJofVjRoVlVnBsKyYOci9fS9oaJSB5IdqnQoS6GqA==
X-Received: by 2002:a05:6a20:c705:b0:b8:827c:42c0 with SMTP id hi5-20020a056a20c70500b000b8827c42c0mr14925047pzb.61.1674238324543;
        Fri, 20 Jan 2023 10:12:04 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.12.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:12:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 33/41] opkg: ensure opkg uses private gpg.conf when applying keys.
Date: Fri, 20 Jan 2023 08:10:50 -1000
Message-Id: <f206f5c55bd6ba59ba1455ea8a8a146c901c5194.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176240

From: Charlie Johnston <charlie.johnston@ni.com>

Currently, the opkg-key utility calls gpg with --no-options,
which uses /dev/null as the configuration file. This means
any configurations in /etc/opkg/gpg/gpg.conf were being
ignored. This change applies a patch to remove the
--no-options flag.

Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3699096f3214e77fe4aa1daebe85308d02940f2f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...emove-no-options-flag-from-gpg-calls.patch | 34 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.6.1.bb      |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch b/meta/recipes-devtools/opkg/opkg/0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch
new file mode 100644
index 0000000000..f216950002
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch
@@ -0,0 +1,34 @@
+From a658e6402382250f0164c5b47b744740e04f3611 Mon Sep 17 00:00:00 2001
+From: Charlie Johnston <charlie.johnston@ni.com>
+Date: Fri, 30 Dec 2022 15:21:14 -0600
+Subject: [PATCH] opkg-key: Remove --no-options flag from gpg calls.
+
+The opkg-key script was always passing the --no-options
+flag to gpg, which uses /dev/null as the options file.
+As a result, the opkg gpg.conf file was not getting
+used. This change removes that flag so that gpg.conf
+in the GPGHOMEDIR for opkg (currently /etc/opkg/gpg/)
+will be used if present.
+
+Upstream-Status: Accepted [https://git.yoctoproject.org/opkg/commit/?id=cee294e72d257417b5e55ef7a76a0fd15313e46b]
+Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
+---
+ utils/opkg-key | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/utils/opkg-key b/utils/opkg-key
+index e395a59..8645ebc 100755
+--- a/utils/opkg-key
++++ b/utils/opkg-key
+@@ -53,7 +53,7 @@ else
+     exit 1
+ fi
+ 
+-GPG="$GPGCMD --no-options --homedir $GPGHOMEDIR"
++GPG="$GPGCMD --homedir $GPGHOMEDIR"
+ 
+ # Gpg home dir isn't created automatically when --homedir option is used
+ if [ ! -e "$GPGHOMEDIR" ]; then
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.6.1.bb b/meta/recipes-devtools/opkg/opkg_0.6.1.bb
index 50c9451a57..712f066f0e 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.1.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.1.bb
@@ -15,6 +15,7 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
+           file://0002-opkg-key-remove-no-options-flag-from-gpg-calls.patch \
            file://run-ptest \
 "
 
-- 
2.25.1


