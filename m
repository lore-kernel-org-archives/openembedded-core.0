Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E8D6177B04
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 12:21:17 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u132so16191557wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 05:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=f6lPHJyxsw2TWHM6CA4bjEk+KM5ID7oqpmAqJ9aDrtg=;
	b=hX+3iIO6+PxwEJN/wD+LWfmbAfmSdGZZEWnFTvCoDwnA8NjP/Q7IWi2JjfXzWrNVRG
	7AuBNNxyPTzvNE/en6faJ6TgyhKBbPeHcxitAkJFtqNI6BTudXCjNRSdSf8U1GTRv4f7
	HX1tlt1HlJ1qKv5herdneRUhQhzJpYrWpFXKISKMIl4htllL6nJiZkZG4wpQ9LQOcnPR
	BuXcgm+OkQ1xv5g1EC27xT5di79+M0VMZl54dzeXDgur7Bk1f5Wag6HNcgTJZagg6g6O
	Sn38BsaxndiKgmboJwSdU/mjrMbyAzRJCVPQMZlKtebvyik+PfRmsJ4hKRlIhVhJAK+m
	/kkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=f6lPHJyxsw2TWHM6CA4bjEk+KM5ID7oqpmAqJ9aDrtg=;
	b=K9rg6kfl4+dW8JXgiZua/Q1MsVrBOQ7LrCYiFi34yu9au5myvzBiykrPxW04cCuDCF
	A7uID1/8dkIHwC7J1BW/CCX6lnW1ZGdO91TKgXGT2C70f0pabRHi0/tin9xJZe56oeCw
	Wh8ZXDPbCX2zurmEzXtzV/W8deb7VEiCweWNc3uSeFVeJoFfShlVCvcP+y4H3WRoj/BR
	tnpgs3B3/vzvUquQML1bGutJkXAXS5A1kIqYjwuRC3/lxtTPLirKS8il+r5yD/zgttMd
	rKK9tbxUCHy3yTRifgM3r8i1bcPLz0+B5wgNZWDv0wMYvjXI5/DVnSmADKQDfRxY5b1x
	PrNg==
X-Gm-Message-State: AFeK/H3YWxuzuadOj02l3IY1tPXTaejd6cFGzYAds1fRfq+7+14dVfC60JgSbmAgtgYTiw==
X-Received: by 10.28.166.133 with SMTP id p127mr13258757wme.62.1490271679223; 
	Thu, 23 Mar 2017 05:21:19 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id c8sm5658542wrd.57.2017.03.23.05.21.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Mar 2017 05:21:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2017 13:21:22 +0100
Message-Id: <8b1e4421b2a14b516f1ea83c46cc54809f2fb170.1490271643.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <3d7e2a0b6f99a996eb981c0fb64a9954247002d2.1490265213.git.Martin.Jansa@gmail.com>
References: <3d7e2a0b6f99a996eb981c0fb64a9954247002d2.1490265213.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1490271643.git.Martin.Jansa@gmail.com>
References: <cover.1490271643.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 1/2] rootfs.py: Respect OPKGLIBDIR variable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Mar 2017 12:21:25 -0000

* when OPKGLIBDIR doesn't have the default /var/lib value it will
  silently fail to copy package database from normal rootfs to debugfs
  rootfs and then when trying to install *-dbg complimentary packages
  it won't install anything, because installed_pkgs.txt file generated
  from debugfs is empty

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oe/rootfs.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 5e1c09762a..96591f370e 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -946,7 +946,9 @@ class OpkgRootfs(DpkgOpkgRootfs):
         if self.progress_reporter:
             self.progress_reporter.next_stage()
 
-        self._setup_dbg_rootfs(['/var/lib/opkg'])
+        opkg_lib_dir = self.d.getVar('OPKGLIBDIR')
+        opkg_dir = os.path.join(opkg_lib_dir, 'opkg')
+        self._setup_dbg_rootfs([opkg_dir])
 
         execute_pre_post_process(self.d, opkg_post_process_cmds)
 
-- 
2.12.0


