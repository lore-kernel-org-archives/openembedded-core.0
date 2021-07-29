Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.15990.1627594190037779705
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jul 2021 14:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LAv36yIW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id a192-20020a1c7fc90000b0290253b32e8796so6015789wmd.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jul 2021 14:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mieul4S5xKxNzolmxfZuSXKVLjnaeZBIJDluaW3RTpc=;
        b=LAv36yIWv+qNo84vSDM+9KLcWsFY1hc6pgmpm+LvTL886uItIDTHfhwTrUYKx94V3p
         wUmDX0XC98TWH3XMhbDpdHUBcSqSyu5I7Ms9nQYMER+O6jgDRfl3BfJP25hhuUC0OaqV
         qY+J2bygGBdazDOORUZACfZul3JJAKONH1cXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mieul4S5xKxNzolmxfZuSXKVLjnaeZBIJDluaW3RTpc=;
        b=iUTv4n6OUPLRubaRxQ7TtdANDyqOAmUsi80oPxKRj/q1xUVbRubA6vzv6nB3ywOG3w
         q5fsLk4BsJfRSPJ0F9mg9kIOALBtJiwtto1BWSWp0cBbvx5TBsbh1+/XXcLi3a/4hc67
         c8puOtloFluYtEUGWrplYyaYT9/64yctp4+MWax/n9GWCHGnL6Frj0CEFoCEMiSaIPXd
         AGtE4d0MuSDjg2bkyTzxuMgVLVhuwLjtmjZVBZbCc+YTM02X5uaRUqVms3gAdsGiiYbV
         hFdV8F39/MVxfZT+oRkI+zJHSOhu3UTX7qXar8UkLUqZFVxGcSCkOv4hY4xw1eVG1ENb
         dZmg==
X-Gm-Message-State: AOAM533DzBvqbLW6UzbvlO9FDEOfc+WB27R2E2Inw/cfHmtvku9BwSUU
	gSSCFG7K4F+Th+BEMLgMYEa2W+7kFTI1eA==
X-Google-Smtp-Source: ABdhPJw2YUwry45mMdmGgqKWa0vLL7ZLABzLsAW9WiTYmPfo9oYb5pFbmX4fD2guI2aP50T808bC5g==
X-Received: by 2002:a7b:c750:: with SMTP id w16mr6713284wmk.152.1627594188102;
        Thu, 29 Jul 2021 14:29:48 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:89c8:a51f:1301:604b])
        by smtp.gmail.com with ESMTPSA id x15sm4582284wrs.57.2021.07.29.14.29.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 14:29:47 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] autotools/base/icecc: Remove prepend from function names
Date: Thu, 29 Jul 2021 22:29:46 +0100
Message-Id: <20210729212946.3331758-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using prepend as part of a function name is a poor choice. Whilst we're
about to make the syntax explict, improve the names anyway making the
conversion easier and the intent clear that this isn't an override.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/autotools.bbclass | 4 ++--
 meta/classes/base.bbclass      | 6 +++---
 meta/classes/icecc.bbclass     | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 9dc8ebdaa79..77d90a3df53 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -1,4 +1,4 @@
-def autotools_dep_prepend(d):
+def get_autotools_dep(d):
     if d.getVar('INHIBIT_AUTOTOOLS_DEPS'):
         return ''
 
@@ -19,7 +19,7 @@ def autotools_dep_prepend(d):
 
     return deps
 
-DEPENDS_prepend = "${@autotools_dep_prepend(d)} "
+DEPENDS_prepend = "${@get_autotools_dep(d)} "
 
 inherit siteinfo
 
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 42fb84c4d50..ff0579c7d69 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -66,7 +66,7 @@ oe_runmake() {
 }
 
 
-def base_dep_prepend(d):
+def get_base_dep(d):
     if d.getVar('INHIBIT_DEFAULT_DEPS', False):
         return ""
     return "${BASE_DEFAULT_DEPS}"
@@ -74,8 +74,8 @@ def base_dep_prepend(d):
 BASE_DEFAULT_DEPS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
 
 BASEDEPENDS = ""
-BASEDEPENDS_class-target = "${@base_dep_prepend(d)}"
-BASEDEPENDS_class-nativesdk = "${@base_dep_prepend(d)}"
+BASEDEPENDS_class-target = "${@get_base_dep(d)}"
+BASEDEPENDS_class-nativesdk = "${@get_base_dep(d)}"
 
 DEPENDS_prepend="${BASEDEPENDS} "
 
diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 80943fcf026..089d52732f8 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -97,7 +97,7 @@ ICECC_SYSTEM_CLASS_BL += "\
     image \
     "
 
-def icecc_dep_prepend(d):
+def get_icecc_dep(d):
     # INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether or  not
     # we need that built is the responsibility of the patch function / class, not
     # the application.
@@ -105,7 +105,7 @@ def icecc_dep_prepend(d):
         return "icecc-create-env-native"
     return ""
 
-DEPENDS_prepend = "${@icecc_dep_prepend(d)} "
+DEPENDS_prepend = "${@get_icecc_dep(d)} "
 
 get_cross_kernel_cc[vardepsexclude] += "KERNEL_CC"
 def get_cross_kernel_cc(bb,d):
-- 
2.30.2

