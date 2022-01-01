Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B8EC433EF
	for <webhook@archiver.kernel.org>; Sat,  1 Jan 2022 11:30:07 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.24119.1641036606105456164
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jan 2022 03:30:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y4EzkvCV;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id q16so60176523wrg.7
        for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jan 2022 03:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lAAVPCwQcCd/esPvVRkH52q+23ldRhR5KpqJR2JYKG4=;
        b=Y4EzkvCVzyqVcMdi5D02SNWyYaxQxc3WCWU+9Pn3ropwyaM3woTWCt4sYQYr6Y4nvn
         KYSgRYp990wTPoGGjP/UZ2Ig029S0jXfVovQGqZXzeMQ+TlQMKrP5pzAgF/uvsNlniBx
         UH+buz2XfUO5fNEy0UTh0Gnrbju1LbSjXooT1IuYFdqMAoj2AIebIIool8fNSjBsacvu
         isiyooGnpmQ9L1tP29yp15le621i6O/1FFWrDyqHGYr8M6eLOm220qtrU2xC+GwXOISj
         OtURLFmRBsqzB8X5yMo58gHAR0rrIpqE2ixHNuIDxL3n7GSOmKBN8h6yJ8ew6LYe6JBj
         D8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lAAVPCwQcCd/esPvVRkH52q+23ldRhR5KpqJR2JYKG4=;
        b=gFGqd1VOzMuU3jgrqGY47XRsU+ZMs3BMps+7/s+isrQD5R5zS/pTh848H4x/u9JVm9
         4NVZSBdOF9rFm9Dwt03soG+boEl0hTPS9CQB05XqZuOl8ntkJGMLzqQeYHZtLJyGSR+h
         vz2sXirfXWK4yljyJBNUTNSIBD8zrgYcGJRi03/WjoIqm/zonXU5GdsKKXWxRCMZ7i5N
         0n15tZqMO1CeTRDxNXbqNiUoiX7H3ehsQNsipIPbMZ/4qCVO4mH1/YMQME3j2Q8AMPx3
         418QTbsWWqFOjnQwzONudnLbJVvY3nMruf/8irBQx8VyhR5NV5+7YvZWjM0Lapl0aJJ7
         WEew==
X-Gm-Message-State: AOAM531Yv63GMQiCYv54AowcISQkTBJncRQZPippKFz0a9BKFd8K0YcX
	xtK+zFs1aGueWrR/nbPl+Xwu/n8noRc=
X-Google-Smtp-Source: 
 ABdhPJxFEPH1+pexGdDaQQCJJVEW6SfZJdmujI/MwYP2kXqgcuAjjrm+L7wpzXreytDRNMpiBEIBEA==
X-Received: by 2002:a5d:6d0a:: with SMTP id e10mr32222027wrq.65.1641036604486;
        Sat, 01 Jan 2022 03:30:04 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j85sm44679935wmj.3.2022.01.01.03.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 03:30:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/6] go: log build id computations
Date: Sat,  1 Jan 2022 12:29:54 +0100
Message-Id: <20220101112959.1866747-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jan 2022 11:30:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160094

go writes build-specific ids into binaries it produces
and has a custom system for calculating them from
file hashes, environment variables and other inputs
(not that dissimilar to sstate cache, actually). This can
go wrong :) in various ways (for purposes of reproducibility
in particular), so this enables useful logs to see what
happens and why.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/go.bbclass                | 2 ++
 meta/recipes-devtools/go/go-common.inc | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index aa54b4a08c..5c1fdd7d5f 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -2,6 +2,8 @@ inherit goarch
 
 GO_PARALLEL_BUILD ?= "${@oe.utils.parallel_make_argument(d, '-p %d')}"
 
+export GODEBUG = "gocachehash=1"
+
 GOROOT:class-native = "${STAGING_LIBDIR_NATIVE}/go"
 GOROOT:class-nativesdk = "${STAGING_DIR_TARGET}${libdir}/go"
 GOROOT = "${STAGING_LIBDIR}/go"
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index dfccebdb83..5bbf35b787 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -37,6 +37,8 @@ export GO386 ?= "${TARGET_GO386}"
 export GOMIPS ?= "${TARGET_GOMIPS}"
 export GOROOT_FINAL ?= "${libdir}/go"
 
+export GODEBUG = "gocachehash=1"
+
 do_compile:prepend() {
 	BUILD_CC=${BUILD_CC}
 }
-- 
2.20.1


