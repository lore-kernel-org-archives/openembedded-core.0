Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185BAC001DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 16:41:33 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.1446.1689612087131756897
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 09:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=q4/T7c3R;
 spf=pass (domain: baylibre.com, ip: 209.85.167.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3a3790a0a48so3540892b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689612086; x=1690216886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=O3UY8+CKPFSyZIEwUp28Yj/Nn875TX+OOxQQ4p9YjsM=;
        b=q4/T7c3Ro7zCwGWI0Iq2yJoih/JqbO/KUycsHheFdUjIVHVSmoItDpFeKson6FtgWF
         nT0vDReOGpUvKgzRHUTrUWa5sOLg6GrrAKR9uLBBG4P1Sq0rcZsWS6MuR6aSN8LrhVSo
         csHlrce6c692SfNkAUTl/tSOb8W5Lhbjt++L5kpI1xB0kiORhYXub1OG5GsUDFtuCCgC
         jCPx19l8g3c6yyO6uEqkw8PhGLGCI4FudhUV9TZHHeVrPkmGGZFze2KYauP3nBa4VDDc
         I3m4HrRm2HPpGR5E7hnmGsfPGYEwtmhaFdWtHgxaqJbC03K0UGkQUHLrjgTSIy+Qc7C3
         lAjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689612086; x=1690216886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O3UY8+CKPFSyZIEwUp28Yj/Nn875TX+OOxQQ4p9YjsM=;
        b=TzbmKN68EZZUDBoRlBeDpC2kGsJHlyWoflAg1QbGYwGHASb9QgJhFC01N1Jqe3qLBI
         MN1eHnUc6T9kW9S36iafLGaNY7MUGcqYdRyC81r3eZO8ijfaWYJHztpWpk3KDc6YBmsH
         Klm/QrU//nUjmdFSbquiM5tkCGbr1OSPF6XRfcJhhHm+V2w4LzeVpdEPfVzWdJKtwp+r
         ZFZyw2A/Da6X+FKR5PnDPyJA4+N9ZawSXiGNqQbdsE0yNWEgHJIo8twIF9zlztx0A/xB
         yypiRdYWGkzcSTYV569lhB2jl6IkHqFv0qyUrRM0k/d7wMkoBbjJXCxuaq0HS6adTULb
         yXPg==
X-Gm-Message-State: ABy/qLaBuvdO6EvJ6SCXmz+2+52BfiQcE4Zu6HM/pZipQLxKhw948lkZ
	a8C4DcpdoZDjIT4jW6Kz1qGpkbIv0RdTNtpI2EY=
X-Google-Smtp-Source: APBJJlEFvGjkgrh6S4mJVO4W32QMjKA5OtHKYGwHhwPkeAq/1o1OVJDLPYSulKsZl/rgABV4RbHHWA==
X-Received: by 2002:aca:f045:0:b0:3a3:96db:8da8 with SMTP id o66-20020acaf045000000b003a396db8da8mr11971625oih.32.1689612085985;
        Mon, 17 Jul 2023 09:41:25 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id a24-20020a0cb358000000b0062dfdafa0b7sm9189qvf.136.2023.07.17.09.41.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 09:41:25 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][RESEND][PATCH 1/3] python3-dtschema: upgrade 2023.4 -> 2023.6.1
Date: Mon, 17 Jul 2023 12:41:22 -0400
Message-ID: <20230717164124.1026028-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 16:41:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184475

No changelog provided. Diff between versions:

08ab41a (tag: v2023.06.1, origin/master) Fix undocumented compatible check
90ce246 (tag: v2023.06) Revert "Partially Revert "dtschema: add nanoamp unit""
a4fe59b schemas: Allow 'fail' value for 'status'
1ea798a schemas: Allow 'status' for node names
2945ab5 schemas: Allow node names starting with number
33cbf96 schemas: Allow '/' in compatible strings
470b522 fixups: Handle 'multipleOf' keyword in schemas
6fc2e30 meta-schemas: Ensure "enum" contains only strings or integers
bd525a4 meta-schemas: Disallow 'binding' or 'schema' in schema 'title'
822ce6a schemas: cpu: Add some missing common properties
e3dfc1e schemas: Use 'oneOf' rather than if/then for *-supply properties
26b0e53 dtschema: Use format strings for printing
bc164f9 Split DTValidator class into 2 classes
4ddf315 meta-schemas: Ensure DT property names contain either an object or boolean
3db9af1 meta-schemas: add $defs schema checking
85e967f schemas: iio: add label
31cc52a dtschema: Move fixups to separate file
9e4dd3b dtschema: Drop unnecessary quote checking
41e1192 dtb: Drop unused pprint import

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...{python3-dtschema_2023.4.bb => python3-dtschema_2023.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2023.4.bb => python3-dtschema_2023.6.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2023.4.bb b/meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dtschema_2023.4.bb
rename to meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb
index f87563facd..38ff2714f2 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2023.4.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2023.6.1.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "6daefb8f54403b4d82961b3346571200571747ab01950fd36c1f69950fa7a8cf"
+SRC_URI[sha256sum] = "d9dc11cea6a46ae2ee5ac4a5a1c7da7cb3704417cb390881820460f7c61eb784"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
-- 
2.41.0


