Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B5AC54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 10:21:51 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.48375.1711362104878040611
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 03:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=if9YSBln;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5688eaf1165so5754633a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Mar 2024 03:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711362102; x=1711966902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gn7iXuq5Jcg9NXzIZH5NMWfFgkunXwSKZymCmpERCp8=;
        b=if9YSBlnRb5+3wlla5B6XVK1dyD7LKlGlWcRhd1BUJnZ2pjxAjOZ9HDNU3zY3zEfBK
         DVe2hBNiWnLuwAP8vE53RghXuI43vOEM8wG4KY24UJw3T1ViIW3stVKMkRdPRzFxSRMk
         ArzQCyqTNlREPQOEN1lFZlDDJb/YIpDOQm5MFsuYljpLRzHdC7LWr82go0bL/Pxhflcb
         KA/Jmq+O0R85/OF/z13XQHihjd0/SUJ/f3Ituwnhw3NXNiKdNQ4R8HUnmyHl3GnMxyV+
         d4X8Od+c93jlAjCDgU0A56BIYyaDkU5DNG16QpTRF6gTNQU/ENIaz/1RmVWZVwGYWOxh
         OOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711362102; x=1711966902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gn7iXuq5Jcg9NXzIZH5NMWfFgkunXwSKZymCmpERCp8=;
        b=HHxAkEPNX8pQGMITrhVgUX7CDh6fqTIU0GQ9UekUMvfEN59+xOL02kGEQEkyAVYJl5
         xD65EKLOUBFkbFwUT3A8fw8idhP+CFr9uWv8j5ZJR5wbnOSF04+NAe3MjzOUFKu8Hnbw
         9bDkBAXTmr2CYWIuDqu1UfKT6Je8e9jRjDLdQkcBiRwg/w1LPFM2hCj9xnAZyi2xa4Lo
         eD/0sFGljuEpSs+PEfxPBin4Xo8A11zX6bVX7Asqv0oMsukl/rTA3m/id5IMmWb6R+Rp
         wOG1397U1zkvKm8PWG14Qmn5B+fp8dx9UYqxlEuvzDaHrxDwo0YlGuutFfra730SsTxE
         P8HA==
X-Gm-Message-State: AOJu0Yw4oNrT0FNFmXABFh/r7Ec3AjbXiLA1zCD8pj9HPHN9mr+1hu5/
	W8E7bTx+bNCXCk2XP7q/WXVex01Bmghgaigo/YtG6Tl1tiInk0oB8KVfpUXv
X-Google-Smtp-Source: AGHT+IFc7f68uZh7pSp+1mNzijQ4oDwevs2IMt+OjedBRJjypuP+8ZWYBVgNCVhFiXXvV3HikZvPIw==
X-Received: by 2002:a50:c357:0:b0:56c:1884:90cb with SMTP id q23-20020a50c357000000b0056c188490cbmr780706edb.5.1711362102515;
        Mon, 25 Mar 2024 03:21:42 -0700 (PDT)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id r13-20020a056402018d00b0056c18b79cd3sm423441edv.22.2024.03.25.03.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:21:42 -0700 (PDT)
From: max.oss.09@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch v1 2/2] perf: tests: fix qa error, missing perl
Date: Mon, 25 Mar 2024 11:20:55 +0100
Message-ID: <20240325102055.1037135-2-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240325102055.1037135-1-max.oss.09@gmail.com>
References: <20240325102055.1037135-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Mar 2024 10:21:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197484

From: Max Krummenacher <max.krummenacher@toradex.com>

Kernel commit 61d348f1e96f ("perf testsuite: Add common output checking
helpers") added with 6.9-rc1 added addional testscripts written in perl.

Fixes:
| ERROR: perf-1.0-r0 do_package_qa: QA Issue: /usr/libexec/perf-core/tests/shell/common/check_no_patterns_found.pl contained in package perf-tests requires /usr/bin/perl, but no providers found in RDEPENDS:perf-tests? [file-rdeps]

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 6408c65462..4b6834e614 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -383,7 +383,7 @@ RDEPENDS:${PN} += "elfutils bash"
 RDEPENDS:${PN}-archive =+ "bash"
 RDEPENDS:${PN}-python =+ "bash python3 python3-modules ${@bb.utils.contains('PACKAGECONFIG', 'audit', 'audit-python', '', d)}"
 RDEPENDS:${PN}-perl =+ "bash perl perl-modules"
-RDEPENDS:${PN}-tests =+ "python3 bash"
+RDEPENDS:${PN}-tests =+ "perl python3 bash"
 
 RSUGGESTS:${PN} += "${PN}-archive ${PN}-tests \
                     ${@bb.utils.contains('PACKAGECONFIG', 'perl', '${PN}-perl', '', d)} \
-- 
2.42.0


