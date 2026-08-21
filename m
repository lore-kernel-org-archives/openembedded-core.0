Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81AFCC5DF8C
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 09:10:12 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3667.1787303408543690570
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 02:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T8rEuN48;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47fe377a217so446679f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 02:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787303407; x=1787908207; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a2bIPKD+4YqAH9wx3EeFK3RsklStgMs+1kM4yKRIFcs=;
        b=T8rEuN48Eq2MIa6ObtXTGwPxB+uC2tpchoycvoSWX9BHUi9gRNVRYAjfWJ1FzVLi5R
         sEgKBl2eje6xgHx1QvxkPIrXd3CrQDvWxzOG9/ZiRiAA03mW1h0r06WEm9sCGWNUrr1G
         wS30L4DrAqkxNUOIItuZ2dokx2f6JkQM1d2pU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787303407; x=1787908207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=a2bIPKD+4YqAH9wx3EeFK3RsklStgMs+1kM4yKRIFcs=;
        b=CVMDFM/wVZkCGq+M4sVqC/I5jAB2sGkOYg0WfGY2xpmRXIbPqKzGiphrgSmYvcOCQA
         cdFaVYPjMCWpwA/pwU6dyPY3TpQQujpMcLSFehb/ArnjWMvqg6qZMUjm6DhDamDIVsIc
         I87cAhLlHUwn0TTWLODvdCpxXf8qgS/6hBpXEUp773Zi5ACaaf7Cx5kUgW+88reDlv/i
         mdPCtTIsla+XO+r5Ptj4sm0e3SD4avHLq+Dn7EBo90fXN9dyKMKLvRPatv0YH+j+Imkz
         3c8uvfHlpvQXhu1IvNbKE8N9VLCxoad04qmt+h4tYn5gwTtmZvO09DKPlz+Q8q3+n4Wa
         pVUA==
X-Gm-Message-State: AFuF++nnXMAqrdKXJshUW54fn9vBUIie7WaWRAyqSgODnIq/6+3pSLMc
	pyvZKvPmRVCeUYQ6P04yBlNSRiGCgHnawk8wOw6ajnQWVVmZEce+68U8yISm/gDJyUJYtw+XOw4
	jg7PUVs4=
X-Gm-Gg: AR+sD131Ss59EQ3fu987ulyr7724tKFOgv/eFxdZ+UDTPOAv3cOC61/Wjyj2FkOV1hl
	E+Ia8GU3W5Vu4BMQ1h3tc8DPob1daXe/3BHelEKFFXRK8kRxHVvVtWkzxV5DAR2tJYYt2nkhJA+
	iXIaALSMhQqrsP2oDBFWcK5YWrh2tAwGF1eTRttNUy14gDI/aEBdpVxk+4Ye91zpwFGPsB/KL22
	rNS7yxeTNE4XZDAYyFT+ClBd1Jm4iLbfGpQWi7PsXwmqg/ElM6gkHu4A3xwavznh1UjLGbmbu9X
	Ib/ytu5TWBIBPnKxRr4cXbeTb3qw6b+IehbUbq970S/UFXKnXOW43x3PgRXoPS6vtiaSHePigyu
	idmvWx+eszlVC8Wqn6vjFnNeObZ6y379lBUKWwzIf6K7wlZxc01httO3vd65XUuw+vy5nvnn2uY
	0j3BLx61q6eFhnX6DpK6fTr67SbRW+1iu5qY2/1O39rxJ7rvGvqeaLREUNTtb/HqU3oUkktFX0w
	qjnLG8ufsoahXSFPQ==
X-Received: by 2002:adf:e193:0:b0:47f:e760:e5b9 with SMTP id ffacd0b85a97d-482c0ba3a3amr7361265f8f.18.1787303406747;
        Fri, 21 Aug 2026 02:10:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e5fd:eed9:eff8:d030])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b7d23sm17049620f8f.22.2026.08.21.02.10.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:10:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] stress-ng: upgrade 0.21.04 -> 0.22.00
Date: Fri, 21 Aug 2026 10:09:56 +0100
Message-ID: <20260821090959.3859632-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821090959.3859632-1-richard.purdie@linuxfoundation.org>
References: <20260821090959.3859632-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 09:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243912

New stressors

    dentrycache - negative dentries dentry cache stressor
    epollmany - many nested epoll file descriptors stressor
    fp-subnormal - float/double/long double subnormal stressor
    hugepage - huge page merging and splitting stressor
    spec-rollback - speculation branch prediction rollback stressor

New options

    --bad-ioctl-alldev - force exercising all devices (bad-ioctl stressor)
    --branch-jumps - specify number of branches to perform (branch stressor)
    --cache-badpage - cache flush on an unmapped page (cache stressor)
    --copy-file-io-bytes - specify copy-file-range I/O copy size (copy-file stressor)
    --dentrystat - periodically shows the directory entry cache (global option)
    --dentry-negative - create negative dentries (dentry stressor)
    --daemon-bloat option to simulte memory usage (daemon stressor)
    --dev-alldev - option to force exercising all devices (dev stressor)
    --no-madvise-opts - disable madvise advise on mmap/munmaps (global option)
    --ovpn-tunnel - two-endpoint DCO data path (ovpn stressor)
    --pagescatter-numa - mbind pages to NUMA nodes (pagescatter stressor)
    --vm-nt - non-temporal store/load option (vm stressor)

Notable bug fixes

    stress-sem-sysv: --verify "corrupted bogo-ops counter" from concurrent counter updates in forked children - #657
    Makefile: misleading 'readelf' message and removed OBJDUMP variable - #656
    --fp-misc: bogus values in 'fail:' messages and typo in help text - #645
    --far-branch: memory mapped file needs x-permission (at least) on Cygwin - #644
    Possible missed MSG_NOSIGNAL in stress-fd-race - #643
    --exec: fails if 'program_invocation_name' is used and the program has been found in - #642

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../stress-ng/{stress-ng_0.21.04.bb => stress-ng_0.22.00.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.21.04.bb => stress-ng_0.22.00.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.21.04.bb b/meta/recipes-extended/stress-ng/stress-ng_0.22.00.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.21.04.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.22.00.bb
index 79717d3018a..5c68f813110 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.21.04.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.22.00.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master;tag=V${PV}"
-SRCREV = "62993352975ec4efbd27ee3627ae6ff776f5cf6c"
+SRCREV = "6c2ab8831bca51f17d97538d106996ca411c4c79"
 
 DEPENDS = "coreutils-native libbsd"
 

