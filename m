Return-Path: <logan.gallois@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066FEEB26F6
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 17:47:16 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25612.1770745632577415483
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 09:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cFVCyKsj;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: logan.gallois@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b8845cb580bso725982866b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 09:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770745627; x=1771350427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7mJuS1GVVrAjL37fCDGMtpE92RruPvoLq12j7Jw0Ik=;
        b=cFVCyKsjFNg8G8fnQmb5hIAcYfx9pqIJztBoPsqDXJCIUxwHH9DVvPzOj8t1gMDd/U
         6wAbaLTsiHmSGL+s0eypiUI0dkG6L+tcfVgR2RlstuioQe5AK3bWuzOKruxnhGiPrq86
         utcoclpOXOJm+kbEqyS4IW/5BR6wlwT81rKSEtXhDUU2cM4atcP7Xl2XlJcRgDr4wd6A
         X5AkFxE78ddiexJy5BTvctaBf1ASYYIjIJs33hKwXOnc78GQHkhbiQAaqPRHjhn9IPrw
         /xv84eafTQxOCh1MhCNka8Gl93aS6XQUQ29QJdKe7F19fTh6tad0hrhFQ3yMgfHP6D6n
         hABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770745627; x=1771350427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/7mJuS1GVVrAjL37fCDGMtpE92RruPvoLq12j7Jw0Ik=;
        b=tarBIy/lD/RO7PqB5kr241fZq9UB+1NhhpzuEwsTp/158q/5xWy7Dbbyi/u4QUk9ua
         gvGyGW2XCJMp2QELWpbuZHmH+xzh8wchzY5oO5lqHZtXo+wxexN5DP+vm+fCIIbiFXv2
         7owgqNs5WG5tIq3KhHVBiky8DRckTmfZNszQyy/G4iyppsR5FiffvyJrPN7uPMJ5hYtT
         W8n6gN6wa7nGLXpTB7u+cb3rGLM9vIFQRJ5O58JylcuIJItvovzqncVMWm/7fJ69Azcw
         Efd2a9Bl09/pK+/PlubqsF3sU7yO0usY4Kiy/y2Fn0kjGKf0naHmuIvEv5/6O7YTLSMX
         VOHA==
X-Forwarded-Encrypted: i=1; AJvYcCUZYPEfBtR8vvT6wxjNzPugKRUW8hBNlsUdYT8GQ2cnQt7dq6JKwg8Crx0MGVID2UnPhPvgb37Zay4ygeZbNPSFtQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx9rlyfscTfGL1NUrHkhjrsA06pmeaFg5YyqsIClh2mYj2k4uXv
	PkFPQ4XOy/UAMUj8ZXksgZeg9i7MzbtMotZOc9ZvHi9FFerVLrDFOwNXrfPsnQ==
X-Gm-Gg: AZuq6aI9bJh8XJzHeeyRZbQs5Fp61NjoI+SKZfvDTEI+pedBCzT1Ls+aachYQ+0XiMh
	bdxvlKmCCQ4ru/ldTfWxp//2SNTBZXdwxz/c6H9lyoiq2aHjFkco2T9xAqaaXEH2H70ANaPtibP
	/jLNEiSUJaswf1GRKKaFELHXiw1sgWUzGZn5MGLCH8Iv9V+zh2B1nWgnbuKVsK37mxftRXUoI/h
	IAMiSwSOQFEiYUQhNqVSmo+3NpdgnmYjtA0sz5vi47eyQlJrErLcvgZxhMqKaVBzawBTSJcWIDD
	mvkn2nUjnUunEgJkkwK+WGtooPXq91HrSGSxxblFnx6XLw/H9pXTbtZfn7CdbleBpjyDMDuSB6w
	MvBR7i4x6A5I3CZf+TGxPoIqxgKaL6yINirB53+Pf8SrEWHTByOON6SR6roowDMk9LKzB0AC9t7
	m5nhhrHBnDNqw6TPOpGw7pB9ccz5eoCn78Q3I41RfiFzR+H2yohOrANhQj2TX4LBoFvJwbeGYlS
	ZDNZQ==
X-Received: by 2002:a05:600c:4f88:b0:47e:e946:3a57 with SMTP id 5b1f17b1804b1-483202272e0mr225284465e9.36.1770745192895;
        Tue, 10 Feb 2026 09:39:52 -0800 (PST)
Received: from Minicarpet.home (lfbn-orl-1-620-177.w86-196.abo.wanadoo.fr. [86.196.80.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d78cfsm99743355e9.1.2026.02.10.09.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 09:39:51 -0800 (PST)
From: Logan Gallois <logan.gallois@gmail.com>
To: logan.gallois@gmail.com
Cc: alex.kanavin@gmail.com,
	openembedded-core@lists.openembedded.org,
	Logan Gallois <logan.gallois@hexagon.com>
Subject: [PATCH v6] oe-setup-build: TEMPLATECONF were not applied correctly
Date: Tue, 10 Feb 2026 18:39:49 +0100
Message-ID: <20260210173949.2589-1-logan.gallois@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209224444.17275-1-logan.gallois@gmail.com>
References: <20260209224444.17275-1-logan.gallois@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 17:47:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230924

Since a recent change to support dash, cmd_base is a set of several
commands, separated by newlines.
TEMPLATECONF was only effective for the first command in that set,
which is not where it's needed.
Putting it on its own line will ensure that it's present for
everything in cmd_base.

Signed-off-by: Logan Gallois <logan.gallois@hexagon.com>
---
 scripts/oe-setup-build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-setup-build b/scripts/oe-setup-build
index b391f3b9254..ab543506451 100755
--- a/scripts/oe-setup-build
+++ b/scripts/oe-setup-build
@@ -101,7 +101,7 @@ def setup_build_env(args):
             f.write(cmd_base)
     print("\nRun '. {}' to initialize the build in a current shell session.\n".format(initbuild))
 
-    cmd = "TEMPLATECONF={} {}".format(template["templatepath"], cmd_base)
+    cmd = "TEMPLATECONF={}\n{}".format(template["templatepath"], cmd_base)
     if not no_shell:
         cmd = cmd + " && {}".format(os.environ.get('SHELL','bash'))
     print("Running:", cmd)
-- 
2.43.0


