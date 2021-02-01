Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web12.36656.1612196730263555242
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 08:25:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ugwoCTkM;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.177, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f177.google.com with SMTP id k25so19366345oik.13
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 08:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lVJ4PFZJ18Ol0F6NsuuDMUqaIBDzW9b1f/58WiRJbpI=;
        b=ugwoCTkMmaS+pykL4YcSH9uu0RhNFxCY4FZVk1r01NH3uf2AB2xDBq5dhJ2SqT44xa
         tK2bS2KDvIkwNPJWA9GM7WpXdb8X/uvfdfnrOwiCaVBb1+ReAfmXz3vnGelaGr6ekdjl
         D8EQblyu5o3VfNH9tqeoytzPFVYCdLn3/fD5GVrqBT6tOIC63s5PHc7cCnWjq5sC2hO9
         FrPGKA6JUgBEf4J7UlLI86D5rZdu8GsgMgRMLPrByJ1C5ipK2nfEAuhxFiI9aUq3fyUm
         MtUsRnQoYolAO5tZkJLRQI3TEVFaNtM11Tmpo8nqaSsh29Vd2NchPo90FF28YhGYDr2F
         ZKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lVJ4PFZJ18Ol0F6NsuuDMUqaIBDzW9b1f/58WiRJbpI=;
        b=rORwlcwxQWOnFhfs2sQAefRot5WhGJ5eyBhlcARTDAgh6kz+EruwDWS5qaNz54NyyB
         K3NRr6UyvMoRFYjdpN1H/iWBSzGI+M/doEGhAZyyJAtEmyQx9i4Baoo3bNT1DJjMscfa
         r5qQSgz8cZxiX55HC3RvpBE6aka1OHPDpY5poaGIksezRZtcSqplAvG8DK2l1r8E3p0U
         R4UGGqGVKFRx1bIOdvgICIlH7wDO+r06A0nqMtXN9Tf6Zf8OKSYUXJ0Y05pvw98Ae0xC
         gUYUHkZmWa1dPz9EKk5crnLp5ETNsFK7ADkd3qCY8jok4UO24o9bRDI2Y9UGvvg3LYKZ
         n49A==
X-Gm-Message-State: AOAM532lOksOc6MikM9xLqnuxnfsA3AYy/SfuoSP1eVGtB3joN3yDXHD
	dR7kn3N2hYqJwo//4lPXrSiiVsMRyIWoL2pIkYY=
X-Google-Smtp-Source: ABdhPJwaiIxJQkjX7UCbsHeAwO6B8L2arhc7+RSEmTkIQOplmWST9sgFlKIhT4D2mlt1zxkWGYAxZg==
X-Received: by 2002:aca:dad5:: with SMTP id r204mr7543215oig.162.1612196729211;
        Mon, 01 Feb 2021 08:25:29 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id o16sm3980726ote.79.2021.02.01.08.25.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 08:25:28 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/21] sanity: Verify that user isn't building in PSEUDO_IGNORE_PATHS
Date: Mon,  1 Feb 2021 06:24:32 -1000
Message-Id: <a20b0f80c2d169115a0336f155a834a5801982f9.1612188857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612188857.git.steve@sakoman.com>
References: <cover.1612188857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dorinda <dorindabassey@gmail.com>

If a user builds in a path in PSEUDO_IGNORE_PATHS, random failures
are generated. Hence this patch adds a sanity check in sanity.bbclass
to ensure that a user isn't building in PSEUDO_IGNORE_PATHS.

[YOCTO #14179]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7a681525e904914e938de25df5cc64209097d15d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sanity.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index cdef8e0c7d..4dc21bf0a9 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -703,6 +703,13 @@ def check_sanity_version_change(status, d):
     if (tmpdirmode & stat.S_ISUID):
         status.addresult("TMPDIR is setuid, please don't build in a setuid directory")
 
+    # Check that a user isn't building in a path in PSEUDO_IGNORE_PATHS
+    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS', expand=True).split(",")
+    workdir = d.getVar('WORKDIR', expand=True)
+    for i in pseudoignorepaths:
+        if i and workdir.startswith(i):
+            status.addresult("You are building in a path included in PSEUDO_IGNORE_PATHS " + str(i) + " please locate the build outside this path.\n")
+
     # Some third-party software apparently relies on chmod etc. being suid root (!!)
     import stat
     suid_check_bins = "chown chmod mknod".split()
-- 
2.25.1

