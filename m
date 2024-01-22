Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B44C47DDE
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 13:59:31 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.74367.1705931966967662372
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 05:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fAnmpjk8;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50eaaf2c7deso3440644e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 05:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705931965; x=1706536765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sz9hf9rJQjPVy4Q9SbgvcNjWvjydRtS609XVC+jICFg=;
        b=fAnmpjk8WiqCmqCSvblTlXzFz5q42/8uxzqMs3xjuuUZ+9OC7RysVBHRj0YeuBTXgh
         AnCPqSq/elF/V9qHLLOYJ21X6L5oLO63w4Os4ICun3b76X3gRrC//igIIY5bdkkpbeXJ
         Zb8qd5JQbWURBvzBUFFYrIvsxpZOX6BLxorF15mPe3zcHOp6ZMW3leJakI+7oRaB48CK
         lTEkUNLZopcbvO5d0y7Fq3AoTyPMv8t5enZK7xe4XkrfqzFr1hgpG9r3YMw2RLjS3ND0
         SBbjMZg9romBhGcxHYGyCUwXV7QmTpgc5wpM4APIIAutGijcm+Ol6RT5NE3ukw019FiX
         vZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705931965; x=1706536765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sz9hf9rJQjPVy4Q9SbgvcNjWvjydRtS609XVC+jICFg=;
        b=c6OP5aS8k23BiQyLWov3hV+8MyLWG+cumZF49MtorsmOTxwk2EjrYaE2O8okKolOA7
         LrR22Ue/lf0zM/2BKEdjSH6ERGLBijy8hTNyzd3bm9D8N1iaW9VhvtRDMrAtJvng2L/R
         YW/k1YGgzUJhWOjsOElU0ti9yLToJ27PrfYaRobAqSUxw7hgK5xIaxdoLdrpWlR7Dnul
         iSCTy+E4WhbIP8zbt1m9EdERPLO+30on+/2pp2d7RtB/CipDABQT37NipSP+VV0Oig4m
         TmwfDuuOP4JJKa+gy9vzdTHf/ZtgFhEp6kBJo1BNev318MXfV33WiSjOaJXLEwCszyRH
         ty2A==
X-Gm-Message-State: AOJu0Yy5MplvqxKpyM4Gj489Ru05giH3vbZZaVPuQKZSohllukMcuaTj
	42yFgdIQI77EnZNICK5EPGJbm9IRzh55zuNxYuLn3I7Rho/sIxjxLsw9MqjD
X-Google-Smtp-Source: AGHT+IGvmd+9wRU3dwkJjQ/DPo7iKy7AI5CPdOBBtmo5zsb1m+7H+97E/ypbkKmFFRrB9osmxGvcMg==
X-Received: by 2002:a05:6512:b20:b0:50e:8100:c0c3 with SMTP id w32-20020a0565120b2000b0050e8100c0c3mr2038668lfu.2.1705931964680;
        Mon, 22 Jan 2024 05:59:24 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id vw15-20020a170907a70f00b00a2d0595cd0dsm11568513ejc.86.2024.01.22.05.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 05:59:24 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v10 5/9] devtool: refactor exec_fakeroot
Date: Mon, 22 Jan 2024 14:58:23 +0100
Message-ID: <20240122135901.171596-6-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122135901.171596-1-adrian.freihofer@siemens.com>
References: <20240122135901.171596-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 13:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194154

Provide a function exec_fakeroot_no_d which does the same like
exec_fakeroot does, but is usable independenlty from bitbake. This
allows to use the fanction from scripts where the d variable is not
available.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/__init__.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index b4f998a5bc4..c7fc3cfc410 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -78,12 +78,15 @@ def exec_fakeroot(d, cmd, **kwargs):
     """Run a command under fakeroot (pseudo, in fact) so that it picks up the appropriate file permissions"""
     # Grab the command and check it actually exists
     fakerootcmd = d.getVar('FAKEROOTCMD')
+    fakerootenv = d.getVar('FAKEROOTENV')
+    exec_fakeroot_no_d(fakerootcmd, fakerootenv, cmd, kwargs)
+
+def exec_fakeroot_no_d(fakerootcmd, fakerootenv, cmd, **kwargs):
     if not os.path.exists(fakerootcmd):
         logger.error('pseudo executable %s could not be found - have you run a build yet? pseudo-native should install this and if you have run any build then that should have been built')
         return 2
     # Set up the appropriate environment
     newenv = dict(os.environ)
-    fakerootenv = d.getVar('FAKEROOTENV')
     for varvalue in fakerootenv.split():
         if '=' in varvalue:
             splitval = varvalue.split('=', 1)
-- 
2.43.0


