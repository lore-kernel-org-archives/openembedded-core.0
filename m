Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.10267.1619186427801297918
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 07:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=tf4cGFt/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id c3so15340987pfo.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 07:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=B4GKDy4Iv8Nr3R7WsR1qySjXxgRA6KhSbIKETkcnfKs=;
        b=tf4cGFt/rUkyiSvx+SbsAna4CJ5F5T6wnmfdP9WYU2L5oQz7HKrAbX9Wzw4PB82j3I
         86AtcKJL8J5cUfaCAd69h79Wtzp0xFION4ij5QLnreTTrRvl9Pi2RNXdigQbI+fGWbeL
         YagYVMeOd1eymogueVAT/IGWveCj/JXTgSMhPD2CuYnLh+D+ZQjZjlmIK5DI+p8jr0ZO
         dZbmzqJXNWObWs7QRzElQK/ZuCzACEjdeP+tZw8j9mC/pl3tVo+lQUNnZVkLxixind20
         ieKICLIcAuOVPoH8LLUm0Mt/LVJI00XbJ95Ve6xQOXV4bS+AaI3uoj9D9JnxEmBdSPZY
         hstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B4GKDy4Iv8Nr3R7WsR1qySjXxgRA6KhSbIKETkcnfKs=;
        b=FTsVdat29WM/2zypaegqUecWf6a3ilao+QHi8hdLwaw1kWhCvf5jodfuosh2NmMsAL
         0UnFg7pb5WQp2kcRrY7jycuJ3okB3xgIBcKu5Q65cDrESj8AWmYQ8IPwv7hRlg6WJUbu
         fsX02qbe5hiDZ6UYUcX362Rfio/N7iGng2O7XI3cQlG6hsgoEPNQb4XV9YajzcnZGZSW
         ZbRcqHOxc2VhpjDGsK+pgKZzsyz6DwkorClMP/mZ1yMqNON5rHGAg9Q2xvsyVvU74q+V
         ZoDcCxtPzwmHUj54tLTe2gTzkl7kKFecCeDr2MpCQFRbl0Xmh8FE6UDnBsuPr3JlAzpB
         g9/w==
X-Gm-Message-State: AOAM531yvr6HCSWD4NpECyzvOnwQZpLYNX2AKZY3Ew4Y+ClTDvLJEJ28
	H+VAERdh6RRvydMB6ss9pLFMUde+5Izvcxo86zc=
X-Google-Smtp-Source: ABdhPJxvY9rKGRKZm+5CtEiTaVzk7jX7P8E0jv85Rn3YsqUbmM4td75NAz0ZtHooVSdzQqJhHZ9Q1A==
X-Received: by 2002:a63:5214:: with SMTP id g20mr4004441pgb.158.1619186426888;
        Fri, 23 Apr 2021 07:00:26 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b25sm4988379pfd.7.2021.04.23.07.00.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:00:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/19] kmod: do not symlink config.guess/config.sub during autoreconf
Date: Fri, 23 Apr 2021 03:58:53 -1000
Message-Id: <38026e5f94228506ea110f725148d335495265e8.1619186107.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619186107.git.steve@sakoman.com>
References: <cover.1619186107.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gavin Li <gavin@matician.com>

I was encountering the following race condition on poky:

- automake-native does do_install.
- automake-native does do_populate_sysroot. This hardlinks config.guess
  and config.sub into ${D}.
- kmod-native does do_configure. This runs `autoreconf`, which runs
  `automake --add-missing` (symlinks config.guess/config.sub from
  recipe-sysroot-native to build dir), then runs `gnu-configize` (copies
  _its own_ config.guess/config.sub _on top_ of the already existing
  ones). Since the destinations already had symlinks, the copy would
  overwrite config.guess/config.sub in recipe-sysroot-native, which
  would in turn overwrite the same in ${D} due to being hardlinked.
- automake-native does do_package. The outhash is thus calculated on the
  clobbered config.guess/config.sub files.

With hash equivalency enabled, the different outhash produced a
different unihash, which kept me from reusing sstate between my laptop
and my build server. This race condition would happen only on the build
server (BB_NUMBER_THREADS = 32) but never on my laptop
(BB_NUMBER_THREADS = 6).

I didn't see the --install and --symlink flags being used by any other
recipe, so I removed them, and that fixed the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 89d675efd633b495daa4a3a57420b9c309497035)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/kmod/kmod.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index 5dae30ed88..bb678c6900 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -26,7 +26,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
 
 S = "${WORKDIR}/git"
 
-EXTRA_AUTORECONF += "--install --symlink"
 EXTRA_OECONF +=" --enable-tools --with-zlib"
 
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
-- 
2.25.1

