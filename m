Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E02F36B87
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:40 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.144838.1775776294809129668
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tV1VSwUv;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso11150635e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776293; x=1776381093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hh1S4I66m4GVSBIIy1BtX/Md276XqDavCSzcnFAEIKc=;
        b=tV1VSwUvZtwFD3X2PFpuJyZwfsrkM68eRO6Vcnx7K676rOKXcNUGt7vPwBrOCYtyb+
         ZOBZStK0D9EFnLWxkZVZW+/AE7ZZZA+2GZ3ggfr0lwVLRRuwcZV+Aki3bOrBNp1+q+6h
         KPfZ20rmJw4Cy6TnMl9hspJlsMjL57Cs3jv7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776293; x=1776381093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hh1S4I66m4GVSBIIy1BtX/Md276XqDavCSzcnFAEIKc=;
        b=LBKh4UBjT+hgNf2yd9ixyiODlVrRSbg3iPgces4azrVHbMsKAbHwfoKgb/anTiVHNE
         GE7O1VHHCvc8SAkNCxGXG+9PvJ9NM89fWp3slmS6Mw6YHmxL0LxyXI+ynuA1CUcx15VI
         Qg93+8Y6hAQH8Qvi0y8q8LVkxgt9NBS6mbvVp2IHbHxtLnxt4lk8bpZWMjCdVSV5wmko
         jwRJYdXJ6kdhZqj1O4yOa6tFpb3Fheqzz/Fmbio/m0NzWN6y4CsozxRYCmK7Z4pE/vW7
         qxjkzeSkblLaY2EeC+rQuD0ENBpj13yC+yi6oUcVP24mhXKYpROZO1/5YX8pN2oJhtmC
         ZAkQ==
X-Gm-Message-State: AOJu0Yy/n86c3NcR3RwSHppBzTiAZdcYol5TdZpuKD6iP2ymQyOtlDDZ
	6jcCpdG6dUx9Xd3+zrUqQDgMsRfGO2AFBxrfv3tD79N09ldenQLH3SdGd/k+pCbJM1ovNrBw29J
	VWCa8/q0dHHmG
X-Gm-Gg: AeBDies5atst6YyDSd8QEnNklBUexUYfXAQ5mffSFrap7uMX3yiP4ijz+LSOYsIjZ5F
	s/6qZX6kMbC0pKUISkslJ7cyOCIewCWWlQu44D9O7GDKMmFvZoL7DiL57+RZuo1sy2LYiGXYoI8
	Kz1MiHr4hrAB+rMUhhJO+UaJEEnGt3h11HNKIUQJ2LaE/Qwx2mum/36ye276fgTI3pglvOOWA3w
	mjos7YToYm6nsFsXEAAE4cH7KYiKqApVFzl1FSwBagiL3SAyV+qVTQNFL19rexvWhTBCn5x46kh
	OdUPD1rBNQxcOfQHSNSM6MPSGMILfg1da1dvpbpqKvVMUE9fp3OBkP7ScZcL7wQtV4ZA/PkP2aj
	ggt4C67UGnpAKq/YOrGkvU3XI6sd/wDomhZLDoclLHwnDyIHyo22OYeLHXbh9LyjvOqwaNIlOeC
	D40Lkib17ZwFxoqv4u3BNGd8N8J09dX/EqcXay+bFxnGt2mTJeMQgjePYM3baupVxR+CnTkY4lC
	m5CLJB39KcC6Fd16GEBFqKHH7B6
X-Received: by 2002:a05:600c:4e48:b0:486:fb0b:ad79 with SMTP id 5b1f17b1804b1-488d6858368mr7498195e9.20.1775776292934;
        Thu, 09 Apr 2026 16:11:32 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 20/30] oeqa/manual: Default to https git protocol for YP/OE repos
Date: Fri, 10 Apr 2026 01:10:20 +0200
Message-ID: <e0ed2030a9cdfa0d6c200c73d65f33381fe314ce.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234979

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/manual/crops.json                  | 2 +-
 meta/lib/oeqa/manual/eclipse-plugin.json         | 2 +-
 meta/lib/oeqa/manual/toaster-unmanaged-mode.json | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/manual/crops.json b/meta/lib/oeqa/manual/crops.json
index 5cfa6538432..cf6d19e6bf3 100644
--- a/meta/lib/oeqa/manual/crops.json
+++ b/meta/lib/oeqa/manual/crops.json
@@ -276,7 +276,7 @@
                     "expected_results": "this should output the directory of the devtool script and it should be within the sdk workdir you are working in.  \n\n"
                 },
                 "5": {
-                    "action": " 4a) git clone git://git.openembedded.org/meta-openembedded in  layers/build  directory   \n \n4b) Add meta-openembedded/meta-oe in bblayer.conf as mentioned below: ${SDKBASEMETAPATH}/layers/build/meta-openembedded/meta-oe \\   \n\n4c) devtool add \"npm://registry.npmjs.org;name=npm;version=2.2.0\"   \n\n",
+                    "action": " 4a) git clone https://git.openembedded.org/meta-openembedded in  layers/build  directory   \n \n4b) Add meta-openembedded/meta-oe in bblayer.conf as mentioned below: ${SDKBASEMETAPATH}/layers/build/meta-openembedded/meta-oe \\   \n\n4c) devtool add \"npm://registry.npmjs.org;name=npm;version=2.2.0\"   \n\n",
                     "expected_results": " This should automatically create the recipe npm.bb under /recipes/npm/npm.bb  \n\n"
                 },
                 "6": {
diff --git a/meta/lib/oeqa/manual/eclipse-plugin.json b/meta/lib/oeqa/manual/eclipse-plugin.json
index 6c110d0656e..6f655a2ba90 100644
--- a/meta/lib/oeqa/manual/eclipse-plugin.json
+++ b/meta/lib/oeqa/manual/eclipse-plugin.json
@@ -246,7 +246,7 @@
             ],
             "execution": {
                 "1": {
-                    "action": "Clone eclipse-poky source.   \n    \n    - git clone git://git.yoctoproject.org/eclipse-poky  \n\n",
+                    "action": "Clone eclipse-poky source.   \n    \n    - git clone https://git.yoctoproject.org/eclipse-poky  \n\n",
                     "expected_results": "Eclipse plugin is successfully installed  \n\nDocumentation is there. For example if you have release yocto-2.0.1 you will found on   https://downloads.yoctoproject.org/releases/yocto/yocto-2.0.1/eclipse-plugin/mars/  archive with documentation like org.yocto.doc-development-$date.zip  \n  \n"
                 },
                 "2": {
diff --git a/meta/lib/oeqa/manual/toaster-unmanaged-mode.json b/meta/lib/oeqa/manual/toaster-unmanaged-mode.json
index 29d11a87d5b..3d1dba447b3 100644
--- a/meta/lib/oeqa/manual/toaster-unmanaged-mode.json
+++ b/meta/lib/oeqa/manual/toaster-unmanaged-mode.json
@@ -10,7 +10,7 @@
       ],
       "execution": {
         "1": {
-          "action": "Set up yocto project and toaster test environment. \ncd ${installdir} \ngit clone git://git.yoctoproject.org/poky  \n\n",
+          "action": "Set up yocto project and toaster test environment. \ncd ${installdir} \ngit clone https://git.yoctoproject.org/poky  \n\n",
           "expected_results": "NA \n\n"
         },
         "2": {

