Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.4248.1614119632634093613
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 14:33:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jv84R+65;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id 7so33182wrz.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Feb 2021 14:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bDqhv4WyOgr1AbOrCH0oRIniVJdiey+Omy5tVC9GAUg=;
        b=Jv84R+65obXXKbSmLnZ4nox0jUNiVkv/1BJdE8G6KXgc3vhJ7U1a/C43la2EwPtyz/
         zq+mf/Sil/b/o++d26sEMCL1+6JC/LASt35nVDzLWjTI+Zarg4qHqrFdYufRliuvAYE5
         xFZR32qH+nx9MFWZuAxzWpFyTCdriHJV+KKpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bDqhv4WyOgr1AbOrCH0oRIniVJdiey+Omy5tVC9GAUg=;
        b=kTGJBrh2nJ8/Zc/EjkwRkUIVD6kBqcsTHMbpZpP98107amz29NXVbWKuAY+YWbK8yX
         qpSikdqMwnJk9hBIbc2uWZucvQpjKkrHgfpzp06vrZiJzmA4PvxWc77RF7av/nn0vIb9
         Q54DU65oSwScHFhz8ySwAG4Z6ESgyBfQTLxRULpeCNzs9V2SIDmjddwynw3QUlDQLHoV
         CNXURXi4ULhvwUB/OCSSaTG6JXHt0kjv6S9/1FLJGIWK0mys6lwHXDOoZj5GQ2kRIQpZ
         T3ZdP2Dm/Te4XS4Y2gXqSC20Pep2u0Bq6Pp9iOWnqqKQIB9eiFpqxZkwy9NEg1NZ2Hvq
         cp5w==
X-Gm-Message-State: AOAM532sIf0Y/aS5MLsxvkBKewu+LAFFFsuj74BlMTgSh1J5aAQSWQyF
	tBgOKIxomSgOLpjzFvU8hJhblB4/yn1e6A==
X-Google-Smtp-Source: ABdhPJyJgTCYwKUy+WPGZ5cvaB2HOGkRnddelJ6TMgx0hBFNaF9OGDpNxK9Egmckb1FmcMnILDMvew==
X-Received: by 2002:adf:97d5:: with SMTP id t21mr4380374wrb.139.1614119630967;
        Tue, 23 Feb 2021 14:33:50 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:4476:47d0:b128:f21a])
        by smtp.gmail.com with ESMTPSA id z11sm1529wmi.35.2021.02.23.14.33.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 14:33:50 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] diffoscope: Ensure the correct magic file is used
Date: Tue, 23 Feb 2021 22:33:49 +0000
Message-Id: <20210223223350.3809626-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

diffoscope uses libmagic and it was searching in file-native's sysroot
for the magic file. Wrap it and set MAGIC in the environment to
ensure the file is found correctly and avoid build failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/diffoscope/diffoscope_167.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/diffoscope/diffoscope_167.bb b/meta/recipes-support/diffoscope/diffoscope_167.bb
index 9ce59a0ba01..1882d549a4d 100644
--- a/meta/recipes-support/diffoscope/diffoscope_167.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_167.bb
@@ -14,4 +14,8 @@ RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magi
 # Dependencies don't build for musl
 COMPATIBLE_HOST_libc-musl = 'null'
 
+do_install_append_class-native() {
+	create_wrapper ${D}${bindir}/diffoscope MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc
+}
+
 BBCLASSEXTEND = "native"
-- 
2.27.0

