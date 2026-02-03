Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDE7E6E7EF
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:19:34 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13355.1770113966103773807
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:19:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WHO1pvaS;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-435a11957f6so4228337f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770113964; x=1770718764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+BzhpS/sSwy4fvSNjCvJN3XhrgXofjWG4LRJNMT3B8=;
        b=WHO1pvaSubEZLPvD4XfDuSysg8l/CYVTvGx12ALMXAibLHcI5d7zO/a+BIzYdguWqC
         GsUhcGQUHlpS2k0pzpICOPETGoHqxsza+mwAfZTLIimObteRFSyYkD27Eah2Y6nC5ieh
         r4KG4B0rXY8cnjVzz52KopQfy0sa6xCEBu4kY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113964; x=1770718764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d+BzhpS/sSwy4fvSNjCvJN3XhrgXofjWG4LRJNMT3B8=;
        b=F+Qwmec8eOxphpSc2206qcAdUQaqhRkw0GST8cq5H/k7iLXrSEFxTVwrmN0UNpMcxR
         t5MVVtijgQ9ShwI36gEZdZBWf5o/P4SZoNC0z9NiThZJwtcT56WVZUEVfC+SpJPXbjTL
         vR2g8bO5nI+zHza2CArUy7fdrWIN8FSiNvMW88gMj32kk7F5btvmvLSJQ9b2R/Oe48T+
         Ca59ZNLwAy2p4qbgpPsGZxIU4Tu5FiSNe4C6iY0NjKd2gsHLKUKpVfW+y+dsqKl9t1N6
         hQbjqFH9x4izZDymjFpcBdIudnnvV5/20Lx0ocXM3rCTgASNJzeQvM0orLIpDzRESMNB
         m39w==
X-Gm-Message-State: AOJu0YwTD3ICnbOn/ua2/09lVbibeahPuTIVA/f2DDcxVCfZg89IEB90
	Vuc62I02Ype4QdSx/KyJjnnwdDPjL1WYWo/fPBk1jPxf1YjqxPvx4doayKBDbCQjREMwu7JMk+2
	izUxe5XQ=
X-Gm-Gg: AZuq6aIilgdKtPWoa9AdPqNlx6/AISCzRK7pTx/yY/CMfRVOPNqNVT4D9tarZh9/7dV
	ab70vbuJu8ZcavuovfajNcopbJn/9sxv43lNznu3V+2PR48fQwtjrEWL4MdE7X4y7bm/tVmDymg
	VWLhOSU3a4+ph6JvHCRDaAey+XJdTzGsI71UQns+PwPcjW1PkbpB+KhGKBNHliSMb38DGxCQLmv
	b9/qci7ab7GKgowFiwQD0RoRXHTc+kxg/vNSXJ1QlyjMuKMv54jX/fE4yHHRV1iiYuzNveeLsc6
	2jprkuekgFTk8W7q8SQ/kWfUJXvxJO+8io0xZN+vepPLBuLfuk7k60o7i+gAxD0HscdiCXNH+T9
	bw7o24wiOcUYochzf51eSU0oezGReiiHYPPXdD+lVcWl22g/v2cjcwHFIKsrLUSvpkGZR5oYGTs
	M/b7902mElxL1qmKj70GKkdB1yFs6olwMc8RMpI9LKb/jlCx9qI0BaxbtsbluWtZwPx7s1CHIep
	m6CfelFJ0SyVFzTsPc3UYdxXA==
X-Received: by 2002:a05:6000:61e:b0:435:9241:37b4 with SMTP id ffacd0b85a97d-435f3aafcb4mr20615623f8f.53.1770113964178;
        Tue, 03 Feb 2026 02:19:24 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm52293041f8f.27.2026.02.03.02.19.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:19:23 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 03/22] scripts/oe-git-archive: Ensure new push parameter is specified
Date: Tue,  3 Feb 2026 11:16:32 +0100
Message-ID: <ff3f70212c4ddf2892663d831fd53097247f87c7.1770109549.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770109549.git.yoann.congal@smile.fr>
References: <cover.1770109549.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230431

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fixes a regresion in "oeqa/gitarchive: Fix git push URL parameter" due to a missing parameter.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 983cb2171e53564bc9dd188136439f3e2ad9e188)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/oe-git-archive | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-git-archive b/scripts/oe-git-archive
index 9305ed0b0f9..9484fc53c7d 100755
--- a/scripts/oe-git-archive
+++ b/scripts/oe-git-archive
@@ -106,7 +106,7 @@ def main(argv=None):
         gitarchive.gitarchive(args.data_dir, args.git_dir, args.no_create, args.bare,
                               args.commit_msg_subject.strip(), args.commit_msg_body, args.branch_name,
                               args.no_tag, args.tag_name, args.tag_msg_subject, args.tag_msg_body,
-                              args.exclude, args.notes, args.push, keywords, log)
+                              args.exclude, args.notes, bool(args.push), args.push, keywords, log)
 
     except gitarchive.ArchiveError as err:
         log.error(str(err))

