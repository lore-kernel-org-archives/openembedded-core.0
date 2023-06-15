Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0DBDEB64DD
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 11:44:20 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.15870.1686829457912971528
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 04:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=aUb+e4fJ;
 spf=pass (domain: baylibre.com, ip: 209.85.221.45, mailfrom: lrannou@baylibre.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-311153ec442so431570f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 04:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686829456; x=1689421456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Io0T/CEtWRjKJfGXwbUtSm6KPIfw+PKNbsPHG17mCow=;
        b=aUb+e4fJdWJUYXK9b0xbIjhLA31fPDaHGwvpTP/A8+Ba6L3j0Ihl0bC67EIU4+b6Ap
         bX2TxN9lczEZmTAfTXRnqlAICIoN6xXw4tYOtchEXhp/2DJqjV4YCKoAqKusRyHzWMWO
         9A7OjykZDRhKzMyQb1sgvWo402WBJH8aH1ccRp4EflJqiyBrFgzt3QwY+EayZN46EPzL
         gW4f2Bd+SeYG8uThrsi0mQumueNqjhCmq++QibHb2SsDd6iGSnOnNJA09i6qroMdl2LR
         fIk0feppA1pffZNpCsXvCs89stvZt8ESzN07CPdNzi9dA4hldePGBsk39tfbmpENqxst
         R9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686829456; x=1689421456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Io0T/CEtWRjKJfGXwbUtSm6KPIfw+PKNbsPHG17mCow=;
        b=dkgh6KJAkOOnr6GF3PMqeT5HiN9B304kzPz+qWO5E+cUKFc88cug46HZ9RIqgsfATT
         vLKbCXYDZYfLupGXDi4EZy8j6l4uQwKEo4Ne6Rncprun42JHPIfyw5Q2CLAG8WmTeVp8
         qyWyLnRCDAwADf8YQCAzqUWKCDvEhXo1a/kqBtb2FuqJUFjTVbMSs214gKrn17b/JEur
         ZYyELYSSFinUA/zv7KGPs2VLKmi2QmiU7W8yJYrlMSUBTMIZGZ1So+6N0f9KqpkOjPiH
         R0/lbx2edDDQVjig7J/E8Vd7JbwYpIvu7vG/++e8SM3Ui8xd6WX/J92AtgSzx/BdNCQ9
         wa7g==
X-Gm-Message-State: AC+VfDwNlI+BuBFg47Br57oCbgM/+SSG4/Te8imbKojvSX13x4NrQtwR
	Rd3ZhErLqPgL3nMJ6NLcvYu3d37Koy4pHLtLPkw=
X-Google-Smtp-Source: ACHHUZ7cT07AB9+zJFHzy/WvV3gzVdfeJE2Y7HcGmaOzNTxeOB0sv4ZZCMXzJmCrEsYbIzuzBhW/oQ==
X-Received: by 2002:a5d:4010:0:b0:311:10ae:123e with SMTP id n16-20020a5d4010000000b0031110ae123emr2866972wrp.2.1686829456486;
        Thu, 15 Jun 2023 04:44:16 -0700 (PDT)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id i17-20020a5d6311000000b0030fae360f14sm15429154wru.68.2023.06.15.04.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 04:44:16 -0700 (PDT)
From: Louis Rannou <lrannou@baylibre.com>
Date: Thu, 15 Jun 2023 13:43:55 +0200
Subject: [PATCH 3/3] base-passwd: add the wheel group
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230613-sysusersd-v1-3-eaddf3179773@baylibre.com>
References: <20230613-sysusersd-v1-0-eaddf3179773@baylibre.com>
In-Reply-To: <20230613-sysusersd-v1-0-eaddf3179773@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Louis Rannou <lrannou@baylibre.com>, anuj.mittal@intel.com
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686829453; l=2172;
 i=lrannou@baylibre.com; s=20230614; h=from:subject:message-id;
 bh=0Hz5U53wSFJMPDG0EqB1W3h3lPTRyLbh6z8qDRSDdOo=;
 b=E6FqJNr13ct0Mt4oVCGJUuk5V26LcMCv38dHYrlKG5Bhae9uJRbdYuDIkaNeQW8TT3e3Tc3qr
 F4T6PoXtjXqAyK/CvxvuPKNeyv1F0xL9l9gjTlasmLT6lrqpGlyPDpU
X-Developer-Key: i=lrannou@baylibre.com; a=ed25519;
 pk=QLSK64UNeqThVe2CiH917a68zTpexYuA7iXw6WQ0bbI=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 11:44:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182849

The wheel group is not declared while it can be used to access the systemd
journal and to configure printers in CUPS. It can also be used for su and sudo
permissions.

So far it was created later in the rootfs postcommand systemd_create_users.

Signed-off-by: Louis Rannou <lrannou@baylibre.com>
---
 .../base-passwd/0007-Add-wheel-group.patch           | 20 ++++++++++++++++++++
 meta/recipes-core/base-passwd/base-passwd_3.6.1.bb   |  1 +
 2 files changed, 21 insertions(+)

diff --git a/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
new file mode 100644
index 0000000000..00eaec38a2
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0007-Add-wheel-group.patch
@@ -0,0 +1,20 @@
+
+We need to have a wheel group which has some system privileges to consult the
+systemd journal or manage printers with cups.
+
+Upstream status says the group does not exist by default.
+
+Upstream-Status: Inappropriate [enable feature]
+
+Signed-off-by: Louis Rannou <lrannou@baylibre.com>
+Index: base-passwd-3.5.26/group.master
+===================================================================
+--- base-passwd-3.5.29.orig/group.master
++++ base-passwd-3.5.29/group.master
+@@ -38,5 +38,6 @@
+ staff:*:50:
+ games:*:60:
+ shutdown:*:70:
++wheel:*:80:
+ users:*:100:
+ nogroup:*:65534:
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
index 853717176d..204016b3e7 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0004-Add-an-input-group-for-the-dev-input-devices.patch \
            file://0005-Add-kvm-group.patch \
            file://0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch \
+           file://0007-Add-wheel-group.patch \
            "
 
 SRC_URI[sha256sum] = "6ff369be59d586ba63c0c5fcb00f75f9953fe49db88bc6c6428f2c92866f79af"

-- 
2.41.0


