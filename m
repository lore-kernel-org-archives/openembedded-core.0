Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 08BAA78F49
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2018 00:59:39 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id a26-v6so4182214pfo.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 17:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HzGtbooerGsSSo73E6L3Dx+fyyzTk9VG7okdFsE2o1A=;
	b=fRbC0oxGR5CDCY/M+GkBEgspfAikjRrdiLS1s2dAith7tKIObLwdO/eUPHkmpbwr1H
	qZKcl2Mw3qK8iWTHo23KPFnyQ2SVPpcaiC4zzExBuUi+7IszhG+2QbQjV8hhyq5zAs7W
	sG8gJUZASNnBqbaqegwnsvfvrf+61592Hsqa+5FLDHawYqo4jQUrLH92+AY5lFVJFXyG
	IxlXI8Q11R7ocTBGWDsQRg0lWGkAgs8S5QZdINZQd/g5S/8D8ZdW+cEOM3k0j9kjyn6k
	tJajrjCYJkZv0Ah44bmfQEsXtXJX0YIe4iwBtYxxfalrZALDxiwbEWePNFegJ7XjZNEC
	uw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HzGtbooerGsSSo73E6L3Dx+fyyzTk9VG7okdFsE2o1A=;
	b=suqrZ+pXZm9ktAimeHne26sdlxncl9Y40pouUs7NHT443T1C81BdnofkNgZTEjRcTV
	FOZ7UOqWbBfg8TuR1Da0g8coQKWRBvUQB9z4Vmvcg1irv2JfUT74XacjDr+YniBXUyev
	g+VA0lT7IDBkMeLynqijQVEQBMx0bvYQP682GBw+5yY9CEeFr52/uIjUPAB7dG9JL1BU
	NcmpaZkGYXNT+6LBh5hWeUuQ4zgt1rytB8AO+pd76WrJuj6lf459lS7z2Q1qEZtZUIiK
	mxMwslmc9snY4kRLc6PMipMc1wOsXvzPXBXdXVneQyAdPIFlF4uSOE4f6nX0P6jdu214
	YO5w==
X-Gm-Message-State: AOUpUlEjbKzeS4CgHSg2MF0mk3pFEqp88/nGZwPuUcON8wSbJJuNHSfe
	HOtwW0Fbn0wj8Ra6N1lzptXVs/Xv
X-Google-Smtp-Source: AA+uWPwVXrIYwdbaN9OIrqCmlWepdZtjBuDSiql8CSWrZ7L6EWPNBwwMGFfPKZC+Qyah2+YLSkDqTQ==
X-Received: by 2002:a63:f616:: with SMTP id
	m22-v6mr34459375pgh.293.1534553980839; 
	Fri, 17 Aug 2018 17:59:40 -0700 (PDT)
Received: from localhost.localdomain (163-47-106-192.flip.co.nz.
	[163.47.106.192]) by smtp.gmail.com with ESMTPSA id
	t15-v6sm5986311pfa.158.2018.08.17.17.59.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Aug 2018 17:59:40 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Aug 2018 12:59:23 +1200
Message-Id: <1534553964-16157-1-git-send-email-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [rocko][sumo][master][PATCH 1/2] bitbake.conf: add PERSISTENT_LOG_DIR variable
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
X-List-Received-Date: Sat, 18 Aug 2018 00:59:40 -0000

This variable is only respected when VOLATILE_LOG_DIR is "no".

The default value is "" which results in the /var/log being log directory.

The user could override this value to a path e.g "/home/root/log" which
results /var/log being a link pointing to /home/root/log directory on
persistent storage.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/conf/bitbake.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e5dc1ac..9db22c8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -88,6 +88,8 @@ ROOT_HOME ??= "/home/root"
 # If set to boolean true ('yes', 'y', 'true', 't', '1'), /var/log links to /var/volatile/log.
 # If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log is on persistent storage.
 VOLATILE_LOG_DIR ?= "yes"
+# If VOLATILE_LOG_DIR is false and PERSISTENT_LOG_DIR is set, /var/log links to PERSISTENT_LOG_DIR
+PERSISTENT_LOG_DIR ??= ""
 
 ##################################################################
 # Architecture-dependent build variables.
-- 
2.7.4


