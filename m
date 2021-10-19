Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63852C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:55:29 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.15318.1634673328782848313
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4jCOvEYn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id t11so14454598plq.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6k8hrh/O6t+39ax552uQkY2Nsa7xeyT3uH36FIx4VjQ=;
        b=4jCOvEYnSmI8H71Xr2HGqlBO6kvptA5q4wcy+6btZSCYHk+Dg0KzB6jW3WfUxEKfM3
         UtM9lyO7PsheOJeUxtYdHOYWAe2PtHV3k6E9bwbF9uUfPeoORcOoUOjkDwDAGdbvlj2o
         loUMsHVaPbFvXV13O+1DV0hKVRn38gK7uLyqfSy7RoxEhV84WOo8vMB+WijtiSyjdeRk
         /9RcSIytHc4V+6poOa8/WYcKXPMhjpn1hJeIXh6h1RgfkRyUmNBXCgrmtNhru8R3lgG2
         DXlyz9px5V+6k4DFba6Mkx2vUhYCaf1qpq6aVSAVNOZ2n0g0yM8lFgjyLYhnixGB5IVq
         Y1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6k8hrh/O6t+39ax552uQkY2Nsa7xeyT3uH36FIx4VjQ=;
        b=NnRz0MP5zGQBtEMb+3HdCuvH2p1raGfidPC7SyHvJ6IEIip+v9iwaoAeTh0jmooUeX
         kwQZJqZuLfWoK8G4BxB0DUNFW2M56yDY/CTBbURYHcRaw36b2xG6vtoSZXVGkbhsML3Z
         2pthIYBDyc8CXB7gRX0TSIvxOYrd2Lmzu1B5hxHhmuZ1ORgivpLLZZIlmU4jUktdR6Di
         Cj2JZMcp1nQFD4fYjkEWagkzNR+AV89JbkI3RAiVnP/CO9jcSHYWzlYn0bjKTLQxuiaz
         3rormrfOWexTp9O9nCWq7KypUjfewQX+0SnoqIWC6dquwR9N7YFPgHslVLSkn5zp2GA0
         eN8A==
X-Gm-Message-State: AOAM533Jc0PrsM9AtxKjDryjOVDip43WoPaKRgAZLSpScEo1qolJpjSk
	3URnPHrJDSo+f0UgxISiWoJCc84b0M+4e8HuLds=
X-Google-Smtp-Source: 
 ABdhPJzP9hJdTeUk2aUNAVgRo8N6dFpGxHIHlFDaaDDlSL+ihEiQwX+74u6drjWmnUTWonJK00YvmQ==
X-Received: by 2002:a17:902:6ac5:b0:13f:ca85:3d97 with SMTP id
 i5-20020a1709026ac500b0013fca853d97mr8966595plt.73.1634673327815;
        Tue, 19 Oct 2021 12:55:27 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.55.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:55:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 34/38] externalsrc: Fix a source date epoch race in
 reproducible builds
Date: Tue, 19 Oct 2021 09:53:45 -1000
Message-Id: 
 <e30c2be8b9534a8dbec5520b41a00c6dc8aa65a4.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:55:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157239

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When reproducible builds are enabled and externalsrc is in use, the
source date epoch function is added. The conditions on the conditional
code removing the unpack task need to match the deltask function, else
the source date epoch function can end up running twice and the functions
can race with each other causing build failures or corruption.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e82095c02881410035ca23dc12692f074d8ed39b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index e94a5cc2af..0e0a3ae89c 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -108,16 +108,15 @@ python () {
             if local_srcuri and task in fetch_tasks:
                 continue
             bb.build.deltask(task, d)
-
-        if bb.data.inherits_class('reproducible_build', d) and 'do_unpack' in d.getVar("SRCTREECOVEREDTASKS").split():
-            # The reproducible_build's create_source_date_epoch_stamp function must
-            # be run after the source is available and before the
-            # do_deploy_source_date_epoch task.  In the normal case, it's attached
-            # to do_unpack as a postfuncs, but since we removed do_unpack (above)
-            # we need to move the function elsewhere.  The easiest thing to do is
-            # move it into the prefuncs of the do_deploy_source_date_epoch task.
-            # This is safe, as externalsrc runs with the source already unpacked.
-            d.prependVarFlag('do_deploy_source_date_epoch', 'prefuncs', 'create_source_date_epoch_stamp ')
+            if bb.data.inherits_class('reproducible_build', d) and task == 'do_unpack':
+                # The reproducible_build's create_source_date_epoch_stamp function must
+                # be run after the source is available and before the
+                # do_deploy_source_date_epoch task.  In the normal case, it's attached
+                # to do_unpack as a postfuncs, but since we removed do_unpack (above)
+                # we need to move the function elsewhere.  The easiest thing to do is
+                # move it into the prefuncs of the do_deploy_source_date_epoch task.
+                # This is safe, as externalsrc runs with the source already unpacked.
+                d.prependVarFlag('do_deploy_source_date_epoch', 'prefuncs', 'create_source_date_epoch_stamp ')
 
         d.prependVarFlag('do_compile', 'prefuncs', "externalsrc_compile_prefunc ")
         d.prependVarFlag('do_configure', 'prefuncs', "externalsrc_configure_prefunc ")
-- 
2.25.1


