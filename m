Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.8465.1594980782007768411
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 03:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mm2dLl4a;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: rehsack@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id lx13so10187400ejb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 03:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=RKSzGCHr6XIqhMJHVd9t4aclYPgPkj7KHl8PKG/Jju4=;
        b=mm2dLl4aqm/1pO98tHg85wh3l7O59sIO/AJJHJNcfCmB9p3jY0PZb3GdL3iHxcy3W3
         tikPd2TUWLdpN/E74XBUVvtLvd9phpbg742+vHebw8O/cbEyL6N3tiLbPQAKzJjdUqKF
         ZI4VGuZ2Fj/yC6pRadnVRJjRGrI718reBpAJBVWwa0rX0uGV/3XtrJwhdEfeZV/zCU4W
         Qm3WtmofaIDhDN9M37PnCH1z2nZIVdW2cPp0FLvtphTEPdMr8ce7Z1Q4uceCmZNRx4CN
         a3/1ZBYf8TTSYq8qJw8uOtFSrn/m7Cpd6YsBiPELyGUEkdjaCdo4cqhGIvezU4E2jQe0
         Z09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=RKSzGCHr6XIqhMJHVd9t4aclYPgPkj7KHl8PKG/Jju4=;
        b=C9h7CgAZLph+QG2ttzHoWtTXqcbfMgrpg8EkN/MNP1cRq31RmZ91O7s9i7GIw8aQS/
         9ZC96/YCL/YjPlqQpy4ssqjvH6p4ZAURw90qnEBWUx0rRYGS1pAeeIAnscanBuwL2SPP
         WsJhPuGHDrTPP4bdgr8ZFO8TefrAUs0kfrBlYpN9NajbXsn/PQ1I9Qw9EnNZKp0f/ceT
         HMal0f+cXvc7/2/5BalpOOhcR6rC2Y2YJCpEJJ4bD+3sKtyYPsHib65vQJK+sSG2r3Al
         Rs3/KBNOh6oKNgpnOF/8S3XMD7lBAko9MtypaNLs2mgMUyMHOAYZsg82q0h2cv4Yf80d
         cKBQ==
X-Gm-Message-State: AOAM5324CB9TXuiApKKERF6d92FgbK6+oEUaCzoLkwhP6TEXKK/nXbve
	rNkzjIRR9KploUE11MxD7QkLY/2H
X-Google-Smtp-Source: ABdhPJwzjibEdpa7gzIgDfg0EPOtTEzMkgfwr/Ze7A8kZ01YMYHVld1z2/TlLF48tk4f4wbZsfqNzw==
X-Received: by 2002:a17:906:454d:: with SMTP id s13mr7643770ejq.319.1594980780030;
        Fri, 17 Jul 2020 03:13:00 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from beaker.muppets.liwing.de (p5b25b9cc.dip0.t-ipconnect.de. [91.37.185.204])
        by smtp.gmail.com with ESMTPSA id p4sm7663908eji.123.2020.07.17.03.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 03:12:59 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: "Jens Rehsack" <rehsack@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [OE-core][PATCH] kmod: add packageconfig for xz and ssl
Date: Fri, 17 Jul 2020 12:12:54 +0200
Message-Id: <20200717101254.17073-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1

Add the opportunity for kmod (and depmod etc.) to deal with Xz-compressed
kernel modules and handle PKCS7 signatures, if desired.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-kernel/kmod/kmod.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index b7c5cbef12..edff191700 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -31,5 +31,7 @@ EXTRA_OECONF +=" --enable-tools --with-zlib"
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[logging] = " --enable-logging,--disable-logging"
 PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
+PACKAGECONFIG[xz] = "--with-xz,--without-xz,xz"
+PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
 
 GTKDOC_DOCDIR = "${S}/libkmod/docs"
-- 
2.17.1

