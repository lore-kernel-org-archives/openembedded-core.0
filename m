Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6CAC47073
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:38 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.151522.1703864737438992217
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=A3aJGYEY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d3f29fea66so30873185ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864736; x=1704469536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MNKdjTpS6MpbNmzFJbwJJ3DqBC11LZEpcMIgjRMaDdM=;
        b=A3aJGYEYAEOAyBdsRVaQs29kcq7XP4+h8Ij3vGPC0Rqii0ABynxeElvB+0YCLJ3IF2
         7RWezqozoe1TVj/dit1R5mjqeMhk2c0MRa8DgpBdvg88Efar81PjwHDY0lmPy2dgFK19
         eBYhi6X7nioQi3ZWmHtT56kow5A7APoSKwauJN7gxQBO8er0p1+rhzPulcYp+wdubSom
         nbVE98XkJvSUxpVb7zvD3hLcmRcFzc8D9qq9F+16Th+dlm+Ug001ScepV80BLKhy6eig
         /q3Nva73gJhG8WGZvgfkWKFkZ/fQ9GFw4yUvSdFFONXlDx8dePykqyGh/4D2qIpmJcvO
         K3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864736; x=1704469536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNKdjTpS6MpbNmzFJbwJJ3DqBC11LZEpcMIgjRMaDdM=;
        b=Sc5BTVtPFll8FSnvKrIXlrF72zlw9hl3ijYhNBAlCwsSUkcqtBB2eT0wkrtOxLReC6
         rwquPPIW5hULQUnvE/F5Yp9uUbEBrIlCHMvoj5cXdnHyzxMnZIcth+i6iFSrVPNT/9+N
         cc2yCIo90zMaVwUK1pJiq3qVlcLV5m1YhQZOzbgZcnaTy5NiQTKMKILN4GSZxR1FrJ+1
         iQUYYFiCgqc63eY47J9oFEKCU30Unz0PuyKXGZTFde0fIuIJe5QUw5vTsXofE/STrZcc
         INLE1/TlAvDo1jozwB+TNAltHyjpGIJE2HzHFzgvQEMNRoN0HtODchOVnM6Rbc3934b/
         iBRA==
X-Gm-Message-State: AOJu0YxvcRsAJi0PfKyAuB3NcBu0zSkC6tlxeCDNGzryB6lvYHuVNwUP
	3Oo584wWD2M1Uv1VpUhTuMxGUXlXjXH52fCpLPj2biANcHwjBw==
X-Google-Smtp-Source: AGHT+IFjKh1JlqxHEzISugcatPuHlWrFzTLyT4x7dCAhoP/RLkFZgIQS5Mbdjd/6X+lsLkRvsgxt6g==
X-Received: by 2002:a17:902:e843:b0:1d4:2774:363f with SMTP id t3-20020a170902e84300b001d42774363fmr6142175plg.130.1703864736094;
        Fri, 29 Dec 2023 07:45:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 17/41] bind: upgrade 9.18.19 -> 9.18.20
Date: Fri, 29 Dec 2023 05:44:31 -1000
Message-Id: <6103a28c3b3df76a679acae577140d4ad2346894.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193034

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Fix missing newlines in the output of "rndc nta -dump".
-Take into account local authoritative zones when falling back to serve-stale.
-Fix assertion failure when using lock-file configuration option together -X
 argument to named.
-The 'lock-file' file was being removed when it shouldn't have been making it
 ineffective if named was started 3 or more times.
-Fix a shutdown race in dns__catz_update_cb().
-B.ROOT-SERVERS.NET addresses are now 170.247.170.2 and 2801:1b8:10::b.
-The timeouts for resending zone refresh queries over UDP were lowered to enable
 named to more quickly determine that a primary is down.
-Don't schedule resign operations on the raw version of an inline-signing zone.
-Fix a possible assertion failure on an error path in resolver.c:fctx_query(),
 when using an uninitialized link.
-Add semantic patch to do an explicit cast from char to unsigned char in ctype.h
 class of functions.
-Python system tests have to be executed by invoking pytest directly. Executing
 them with the legacy test runner is no longer supported.
-The wrong covered value was being set by dns_ncache_current for RRSIG records
 in the returned rdataset structure. This resulted in TYPE0 being reported as
 the covered value of the RRSIG when dumping the cache contents.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 9b34124561d926d9273c52163853161515e5666a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/{bind_9.18.19.bb => bind_9.18.20.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.19.bb => bind_9.18.20.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.19.bb b/meta/recipes-connectivity/bind/bind_9.18.20.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.19.bb
rename to meta/recipes-connectivity/bind/bind_9.18.20.bb
index 8124c5c591..187685eef5 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.19.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.20.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "115e09c05439bebade1d272eda08fa88eb3b60129edef690588c87a4d27612cc"
+SRC_URI[sha256sum] = "4b891ebf58d3f2a7ac3dd2682990f528a3448eaa1c992ddc5c141b8587a98ec5"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1


