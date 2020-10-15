Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.13147.1602771355688045582
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 07:15:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=h24+LfjS;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id a17so1931177pju.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 07:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=JP0u47ezldPkKvZcf1RQA0VaQK+OWR7SAqbjwEuy2UE=;
        b=h24+LfjSU+/d/dyaulxNWbO1rIcAlwy9mB/hDkvji0a26UE1Pqx6BJqSrvMfEpuYX+
         8BBgHXd3BwRTyIPdcaJj5Q+9PcL0HTXVUpSa6waUoN2Xd3MFBhtf41jg/A3TKOkjlfC4
         h1NePI/zU/McPTdyzDsqv0N6kUpiIZOFP6RM8jelMpl1QF6VzxhErhRBLctyEOZHmnII
         bkRa+x+VqKILXGxHNDNRHgSHxTV7rvfPqXnzIDHCovVRSLEyiPnE+S0/DrCPcEbq1/8m
         wylgs47zQ8vd44qi4Ua91CJ7jm+f5CQlUzzlr7CNk4N+SOcg/DiUCbNIt+VHk0gDRwpd
         nT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=JP0u47ezldPkKvZcf1RQA0VaQK+OWR7SAqbjwEuy2UE=;
        b=DFUSbB9zC6EyLbUHVQkEI1cZ1N7RUQpDpktot+7xZ1KF7oomej1j/qNIvo01oU3LtL
         Nx6XKo7NY6sF8CmvUt3RRQBnN8qQKGdybx42j970HDgX7SrMPrn6pJQT7zgKrtqC0SZF
         GnZZZ1uciCe7QBrTQNyWqG2TNxxCYli+KGJaz9LUPJuXR7dBCybV+9d5GhmcF+G/e4mu
         Civ9DPxD1RCB7o0JVBXEVx1fPyU9Um4lmDVNzifmUKUc32wCgPILOSqja2vxx2rZaFvd
         Vm+wV/9YpnhiUIQENykvAAYdWqaooaj7cqisi1PfpbnOEWvCSzBRUnHyAF574fec+E+r
         muqg==
X-Gm-Message-State: AOAM533QA8Z8jSFUWky+Jze9rVjepDJ1Gjl5hVKCrRi2fH1MZpb/YOS8
	sezffFMGDiJiiwBfw8dMSwYyWark13HUDU/n
X-Google-Smtp-Source: ABdhPJxZbH7HAhtqEVcyDvH+o4GAfQfSGMXDT9eiR0qMDaYjA8mkrzJS27/d1matPALhZp0QbpB3mA==
X-Received: by 2002:a17:90b:11c7:: with SMTP id gv7mr4608843pjb.228.1602771354497;
        Thu, 15 Oct 2020 07:15:54 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i9sm3565138pgc.71.2020.10.15.07.15.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 07:15:53 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 8/8] qemumips: use 34Kf-64tlb CPU emulation
Date: Thu, 15 Oct 2020 04:15:12 -1000
Message-Id: <cfd2401581dcb122c8dcde6af6b5b61501af422a.1602771116.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1602771116.git.steve@sakoman.com>
References: <cover.1602771116.git.steve@sakoman.com>

From: Victor Kamensky <kamensky@cisco.com>

In order to improve performance of qemumips autobuilder
test runs, let's use 34Kf-64tlb cpu type that was introduced
in OE version of qemu. 34Kf-64tlb cpu type is identical to
34Kf but it has 64 TLBs configure vs original 16 TLBs.

The change in number of TLBs in emulated CPU reduces
TLB trash and reduces number of times TLB refill kernel
code runs, and therefore siginificantly improves tests
execution time.

Note 34Kf-64tlb qemu cpu type does not exist in upstream,
so far it is added as patch in OE. See qemu 34Kf-64tlb
cpu addition commit for more details.

Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=13992

Signed-off-by: Victor Kamensky <kamensky@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6a9568401cbf8bed89d1f63dae61a07a83a20b50)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/machine/qemumips.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
index 1373e4cba0..b8c80f02ef 100644
--- a/meta/conf/machine/qemumips.conf
+++ b/meta/conf/machine/qemumips.conf
@@ -15,4 +15,4 @@ SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
 
 QB_SYSTEM_NAME = "qemu-system-mips"
 
-QB_CPU = "-cpu 34Kf"
+QB_CPU = "-cpu 34Kf-64tlb"
-- 
2.17.1

