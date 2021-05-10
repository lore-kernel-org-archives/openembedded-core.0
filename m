Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web09.32538.1620657022782824003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=P8p7wnXW;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id z3so14729581oib.5
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=apEONxcAgqRwkGnnJ6R4Ciatv54y/vEpOLEHTBwsCrg=;
        b=P8p7wnXWUbZxR3vlyE17eUn/nggYbMG/n9hUWvXQs9c1Wu8l88Z1uKG9MFG7O5Nyrf
         dIL54fo7wJzLNWjGX/nY8bUb087zKBlZHY5R/+ASDLtY26zHEhU9wCSSnneyCwu1mw+5
         t8NvgMFb5yoECnXfmoISzuOVXi51HXzBJgV9DwdHqasBA3wIM9IIcp/BV3FL1EoMUffm
         DsejX6cxx4tMjT1vtSQWsHEVQJxpVTHhATK5aOQ96shZThppzHJR+f4ilDRLsdjyp+Ow
         pygHL3D6BVrjD6bH91dBSYRCtBOHtm9AMWOC41AVrsmSoH+u/WlzJ5QCoEIRJvHfyEui
         wEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=apEONxcAgqRwkGnnJ6R4Ciatv54y/vEpOLEHTBwsCrg=;
        b=EulZ9WB9Jq+vWaqwuDhXiumRU8EldbDtV/9aleebrihRbi3Ka9vPNouauT+ogzUA7t
         c/rRjYA2RPRbALdR9jF4Cq2P4wiISCA8UVv7gemB2wAWrbPalSVc5vnswI/vFiIJ6lQc
         wL36KB0Q/BoFP3V0Vt4QCSwtx3I9PHVhFATYvsEKLuU6CNuBrZnL6uNW9a6dLi2Jp1Ar
         5D2XjsePOwMgWhGD9hN7TzhngWF8KRfX5uyrphgtTx9P1xV3wa6a1xAuJC/EVb/FgxP/
         pWl1u2iuicJG7CtiP4IMogUOymST5IsisWqgL3NAlB0r2Tz9aUHLBbYy9v117Ch28heq
         ss3w==
X-Gm-Message-State: AOAM530eziDs7N4HLS6ODJPKFcquNeD5jRRDSprmTsIPPeHs+oWxg7+I
	pxB5e2/cf28RRc+2pojFNg5kXCpnbc6AlRYQZpI=
X-Google-Smtp-Source: ABdhPJwybnl5umqHcgWVo29y/pZeGPBgeiSRU4aRflXP1FXJfE1evAB/4G/XBeeHShDBdH/rnLuQSw==
X-Received: by 2002:aca:5783:: with SMTP id l125mr18598249oib.130.1620657021642;
        Mon, 10 May 2021 07:30:21 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id g16sm2661309oof.43.2021.05.10.07.30.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:30:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/25] ptest-runner: libgcc must be installed for pthread_cancel to work
Date: Mon, 10 May 2021 04:28:49 -1000
Message-Id: <b7435fae07c7f6859e951d4796486b4cc65d44bc.1620656333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620656333.git.steve@sakoman.com>
References: <cover.1620656333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jose Quaresma <quaresma.jose@gmail.com>

This only affects glibc systems and have been
found on runqemu core-image-minimal with gstreamer ptest-runner

STOP: ptest-runner
libgcc_s.so.1 must be installed for pthread_cancel to work
Aborted

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1cb679e6a4528a2cef16f65342d5e65adb14cb16)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
index 8b9938f572..7290dc90e5 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
@@ -27,3 +27,5 @@ do_compile () {
 do_install () {
 	install -D -m 0755 ${S}/ptest-runner ${D}${bindir}/ptest-runner
 }
+
+RDEPENDS_${PN}_append_libc-glibc = " libgcc"
-- 
2.25.1

