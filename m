Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web08.1028.1624474013445688633
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jun 2021 11:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gu6+mjXy;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bkylerussell@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id x6so1974580qvx.4
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 11:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aZkh3Toyr82x5K7+fLAh3q4Ubl9BNdcirHiaMVF5R1g=;
        b=gu6+mjXyuGqM5kWdzlHb1/W48ITMDNEG9OPaTgRj47FGBOT5HDW+Ty72WQPGvJKJgt
         4bAmxbDTNGZ+gslqXdVFGUh2wc16GXbLBov8DwpkmDYNB+qzzmeUoHRJZqsOXHWACRtn
         ql1YLmYOQSoYIfYZ6takqeCn/MGemosPhrILgk+erAqnCku3jNlymtst5jZC4khdpYR1
         1Iuq2tj70/tTNiKkHH8+RTNkcTGC3AOh3sdEnU1wMOXJEHBVBYy2LgvpPlrM/jCHH0Dt
         G2DqIc/FESszPw73PB5vq1XBj3NdMdjBnW3oZjLkDINXO3XzknJ4o0wsiMTpYJDj4FxK
         pCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aZkh3Toyr82x5K7+fLAh3q4Ubl9BNdcirHiaMVF5R1g=;
        b=ou7jnjiCWiFb18P43WV6IFsSNcC0SqTkpGuB/Hx5mrw8AlNgkfQKrdM47klhyHIszu
         Iz9PB/zWb1hEg9V4+8qR+22c2Tnzu2oYQ2V8hDSMZPfnjKJCmPTkVPuWSWBnaEQJSOgu
         D4ycernyO0lsvb6ngdJSOzwM7sXYPU6I2htmUGODT7JTlamYeqdnQisghUHgiG1uZt3V
         ueJZayspnQP4TT1aCWgCgmX/pKHQritjHKv/Xh5pHGDRQjIQ+skNNo2XXI6CUa1Az2ta
         yksiJJxBth4Av2FTtAP/770P6QdDU158dzuh2Bl78Um54PkMGFhtQDspo/uvJIc4BRP7
         DEOg==
X-Gm-Message-State: AOAM532YCuTjYvitz/cyScnhOIm6kjDSy4zXnPcGI9vwM6+1OCfrhjgr
	HxNWYxJ9xwEwSJMzmRKpWIDHVxSQwa0s2A==
X-Google-Smtp-Source: ABdhPJwsE8prKluS93d0qUyRH42HRPddr65zfUghStlMvvdg23NgtWno7Ik26xWEnucupoEVR2vp1A==
X-Received: by 2002:a05:6214:686:: with SMTP id r6mr1391325qvz.19.1624474012489;
        Wed, 23 Jun 2021 11:46:52 -0700 (PDT)
Return-Path: <bkylerussell@gmail.com>
Received: from poirot.file.core.windows.net (cpe-65-24-166-29.columbus.res.rr.com. [65.24.166.29])
        by smtp.gmail.com with ESMTPSA id x7sm495838qke.62.2021.06.23.11.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 11:46:51 -0700 (PDT)
From: bkylerussell@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Kyle Russell <bkylerussell@gmail.com>
Subject: [PATCH] uninative: allow PREMIRRORS to use versioned url subpath
Date: Wed, 23 Jun 2021 14:46:44 -0400
Message-Id: <20210623184644.12328-1-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows users running their own mirrors to store uninative tarballs
under versioned paths just like the default UNINATIVE_URL without having
to completely override UNINATIVE_URL in their distro configuration and
manually update the versioned URL on each upgrade.

The hashed subpath is left for compatibility, but not practical for
mirror management.

Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
---
 meta/classes/uninative.bbclass               | 1 +
 meta/conf/distro/include/yocto-uninative.inc | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 1e19917a97..543f747358 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -64,6 +64,7 @@ python uninative_event_fetchloader() {
                     continue
                 if find.startswith("http"):
                     localdata.appendVar("PREMIRRORS", " ${UNINATIVE_URL}${UNINATIVE_TARBALL} %s/uninative/%s/${UNINATIVE_TARBALL}" % (replace, chksum))
+                    localdata.appendVar("PREMIRRORS", " ${UNINATIVE_URL}${UNINATIVE_TARBALL} %s/uninative/${UNINATIVE_VERSION}/${UNINATIVE_TARBALL}" % replace)
 
             srcuri = d.expand("${UNINATIVE_URL}${UNINATIVE_TARBALL};sha256sum=%s" % chksum)
             bb.note("Fetching uninative binary shim %s (will check PREMIRRORS first)" % srcuri)
diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 740cca0ecf..d7d1e2cb59 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,8 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.33"
+UNINATIVE_VERSION = "3.2"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.2/"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
 UNINATIVE_CHECKSUM[aarch64] ?= "4f0872cdca2775b637a8a99815ca5c8dd42146abe903a24a50ee0448358c764b"
 UNINATIVE_CHECKSUM[i686] ?= "e2eeab92e67263db37d9bb6d4c58579abd1f47ff4cded3171bde572fece124b2"
 UNINATIVE_CHECKSUM[x86_64] ?= "3ee8c7d55e2d4c7ae3887cddb97219f97b94efddfeee2e24923c0cb0e8ce84c6"
-- 
2.25.1

