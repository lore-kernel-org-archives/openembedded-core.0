Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1AA6F60B9A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 15:28:58 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id 6so26235429wre.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 08:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OEBxDQL1fR+8OaxRWXaa2QcFqNST7H5ztTbKw871iw0=;
	b=Su0KhRTcq9bHKFZjUFDrcD57H4HeuYZs/nAuG+mROzZAk048URQQ82wG+isXH+8vTZ
	R3Q5nPhu8d9KKkvTyZOW6/n+F3/bGla8UrcCKVaUlBjslhy95cWkXKeMGvzLPnzAmJPm
	U+TbAJPgvcjwtw+8obU8OjZdEns/35K/rViik06+cmflFN7LNHT1Qij/6F7CSnQVyqSK
	phiP4T43leeIwTv8MCj2nEZWlu3nGopp4NDig/+P5UjbNk9fz5nt7OLghC8eMbatzHDa
	pTO4XPVD5bdDjFQGoytH/L39p5SyEeyHl6JGIP05IRBwTj8SgfZ6yQSAdqBWO9O/OrFD
	Av9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OEBxDQL1fR+8OaxRWXaa2QcFqNST7H5ztTbKw871iw0=;
	b=UE826yywQ1vRS30V1SuzLIJMqkM+Oa38gkcI/xI9ze277m7tM2E/sA5wJ+Q2QrKv2Y
	ovPnIi2E5jvm+2KN4MNTT2syhc4e+i+LSPWVBNrhu0j0sEGCuFiH1sZgJEEIKJW8mGOV
	zQDbJ4NZmxAV3MSFidDjsEGqpl9mXqPmDb9xTkl4moKYBd2t3sBmzILwBjEQ7/rAeSA3
	7taK+z6U+iIS1NuCEPZTgLocmwN/QFcVRhzC2N8T8D27nEAN7JtTHIy1wvR63KNRRL0H
	qszqQsb1JoowcqkQmuynwZFLOPzT96fxcBiHZvSXu8d8ptHeWDrrAh0SbStHzSKe7SAL
	wm9g==
X-Gm-Message-State: ANhLgQ2HBPAmJMp6B2wMLnX9WuSbRnJk4SgTMVkn7nT0adPolZkIZ9Ka
	xXm8IVrQ2Xe80fFf/kHTMurJw3MS
X-Google-Smtp-Source: ADFU+vuhnyWfWBbwMz4OwPUKfUQ2pgiXPJmdUISx/cX5Dm4ZbWolJj4Lsas9VdGjjF052XYunnEp4g==
X-Received: by 2002:adf:80cb:: with SMTP id 69mr6344004wrl.320.1584458939049; 
	Tue, 17 Mar 2020 08:28:59 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id c2sm4307128wma.39.2020.03.17.08.28.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2020 08:28:58 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2020 15:22:59 +0000
Message-Id: <20200317152303.4600-8-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200317152303.4600-1-alex.kiernan@gmail.com>
References: <20200317152303.4600-1-alex.kiernan@gmail.com>
Subject: [RFC PATCH 07/11] oeqa/runtime/cases: Disable and stop systemd-timesyncd
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
X-List-Received-Date: Tue, 17 Mar 2020 15:28:59 -0000

Stopping systemd-timesyncd doesn't prevent it being restarted by a
different transaction within systemd. Disable the service instead during
the date test to ensure it can't be restarted.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/lib/oeqa/runtime/cases/date.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/date.py b/meta/lib/oeqa/runtime/cases/date.py
index 7750a7293f8e..fdd2a6ae587e 100644
--- a/meta/lib/oeqa/runtime/cases/date.py
+++ b/meta/lib/oeqa/runtime/cases/date.py
@@ -13,12 +13,12 @@ class DateTest(OERuntimeTestCase):
     def setUp(self):
         if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
             self.logger.debug('Stopping systemd-timesyncd daemon')
-            self.target.run('systemctl stop systemd-timesyncd')
+            self.target.run('systemctl disable --now systemd-timesyncd')
 
     def tearDown(self):
         if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
             self.logger.debug('Starting systemd-timesyncd daemon')
-            self.target.run('systemctl start systemd-timesyncd')
+            self.target.run('systemctl enable --now systemd-timesyncd')
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['coreutils', 'busybox'])
-- 
2.17.1


