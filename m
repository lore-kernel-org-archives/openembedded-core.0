Received: from mail-qt1-f201.google.com (mail-qt1-f201.google.com [209.85.160.201])
 by mx.groups.io with SMTP id smtpd.web11.554.1628273649764276361
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 11:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=HPXIe737;
 spf=pass (domain: flex--maxims.bounces.google.com, ip: 209.85.160.201, mailfrom: 38hsnyqykac0vjgrvbpxxpun.lxv@flex--maxims.bounces.google.com)
Received: by mail-qt1-f201.google.com with SMTP id u16-20020a05622a14d0b029028ca201eab9so4118020qtx.21
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 11:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=/wCNb3TUoKk6adf7wqqEj700nR/0WDCWyxeo2Euj7qU=;
        b=HPXIe737oaoLhMr0mSN6en80JLP6LL9L6Mo9bos3BwtUgc0y3aZJYKMEs8KaEmxZSe
         u0a2Uta67d89cPLJbCOR4nTEfYGWCACE/Z+7uxb5f+aWm88l57ZFBC9UFH4IJiMxQzuk
         rvZiAdGmR7paoe2MbuaMxXrCQ4NhXwug/HGyOzkTLxFuRsPuBQ8yRRBnKn5Jb7fynLoC
         s6WLhJX6Mlqb2PiZmi+Sqr/58fHRMu3NzEbvEDe0NuJanhFAi4Zp/SdO6YOXmIV4fJH0
         rv737m/i1/sYGtUmnR8VpHmkp1HgcQulv1jXEedPgDje2Q7ccS6lTHbc8Cc9SjLyoPCj
         ELNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=/wCNb3TUoKk6adf7wqqEj700nR/0WDCWyxeo2Euj7qU=;
        b=VTJCX/066Cp09LNB8bTmajeZH+HbHSIIV4LOmP4oBpjaepsGkx/OMynuHW4hWDx5EB
         XeK82xJrM//FyRc0xoFGwUsNQV026VuZ92gn7IIDwiyA2twbjm2sSj5KvIAWhqaAb4EU
         r989kzxzLn1XMg1UQ8MSoT2ajOvC4IoPuiMuQ71A3Do54NgvehlhVK49kidLQ7QdtWo0
         UIdXHQVYBFQPwg2FRxsraO6m3q1s3RK9RADEWSjJpGMEN5a8ujx1nr5iP01nr0oUFzB8
         112x8sKBQWtJlUV4pQe23/5u5PoRNtcD3wCi9sxRDkM/2kkDyhcDPE/rpoaYmyonB4mh
         KgBw==
X-Gm-Message-State: AOAM53253nLqr8DoP3AImzrRuRFv+oNbPWRZu22lHydRhkG9g1ikOsMq
	MxJ5PX7HuM3UF1AxWf77UH5OYy4trrPK4JMhPi70OKZ2WciElpWYhRu3KMDtWVkWgOsVGp5FOfS
	6LIGhjviArepsEoxfiTOmOXd7iVtsRkUTkSijjVR8GeDgB2Ap8Bvxmd/OXx0bhnt07c0zNC3gYD
	fEdn6Kf+iDhw==
X-Google-Smtp-Source: ABdhPJzKUGW6IwQ26fiDbeqsYjvptoosAzDXALRnn3XoMOOqSVPiLOhGwjiS25jexJLMRbHuLPFFnsSYPNQ=
X-Received: from mxsl.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:221c])
 (user=maxims job=sendgmr) by 2002:a0c:ca12:: with SMTP id c18mr1264285qvk.14.1628273648761;
 Fri, 06 Aug 2021 11:14:08 -0700 (PDT)
Date: Fri,  6 Aug 2021 18:14:02 +0000
Message-Id: <20210806181402.3014345-1-maxims@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [meta-oe][PATCH] meta-oe: libusbgx: Configure the Devices Used
From: "Maxim Sloyko" <maxims@google.com>
To: openembedded-core@lists.openembedded.org
Cc: Maksym Sloyko <maxims@google.com>
Content-Type: text/plain; charset="UTF-8"

Add ability to configure the UDC used for specific schema.
The feature is backwards compatible, so existing users don't need to
change anything.

If one wants to specify which UDC is used for specific schema,
for example, `eth0`, they can add this variable to the configuration
file:

UDC_FOR_SCHEMA_eth0=f8000000.udc

If the device file exists in /sys/class/udc when the gadget is started,
it will be used for this schema.

If this configuration is not present, first available device is picked.

Signed-off-by: Maksym Sloyko <maxims@google.com>
---
 meta-oe/recipes-support/libusbgx/libusbgx/gadget-start | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 mode change 100644 => 100755 meta-oe/recipes-support/libusbgx/libusbgx/gadget-start

diff --git a/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start b/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
old mode 100644
new mode 100755
index 1a106b785..9e22671a9
--- a/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
+++ b/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
@@ -7,5 +7,10 @@ for i in $IMPORT_SCHEMAS; do
 done
 
 for i in $ENABLED_SCHEMAS; do
-    ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/"$i"/UDC
+    configured_udc=$(eval 'echo ${UDC_FOR_SCHEMA_'"$i"'}')
+    if [ -n "${configured_udc}" ] && [ -e "/sys/class/udc/${configured_udc}" ]; then
+        echo ${configured_udc} > /sys/kernel/config/usb_gadget/"$i"/UDC
+    else
+        ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/"$i"/UDC
+    fi
 done
-- 
2.32.0.605.g8dce9f2422-goog

