Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 363127F421
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:35 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id n9so5950000pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DV3wxV7U8GnVd9aHr7mE3uyL2SY8eDkb5vMJu0tnB9A=;
	b=vPzPYpkEe5B7o+l/tXB078UZV7ygD9Pp359852C2IyHsff57pz92VyZQj9rSoVBYBD
	hwOfozX2dn5WVbXndp3ZPib4QtGGyFWCIZiry7T5ZU5csMNtCLFBMw0rOnQA8QD31c91
	eibkVp4aSOK+qRfvU8p30otropcqZjmr4xNlGpeZ1Hzcziq7UYQ5BwwjJLaoucv4ZFSw
	JfPZkitgdObdsStcRSB6w+bWv9MsGtBu0MqckuKzrw2qRSgdoOaQ1NspCINkHYjHJ5Gs
	emTfoIFK+kktqnlwE1teFPF/Zx7ZIL+1Ayn1Z3/Zbqtc8lRLfAW3SXP1EjbaEuoU1hp2
	pADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DV3wxV7U8GnVd9aHr7mE3uyL2SY8eDkb5vMJu0tnB9A=;
	b=pqfH5CixjAE9vOq7eptCYQ5BgdjsakHU911s4ZE5IEZozbuAJM2ay7PYCuca5S/4mp
	z/H4cmovUDHMyQ4TVH/hTSPJCjdJa9tYP/S89JevV3UbEXMDhg6MvGqRs7Q3ryO7Lkz3
	Vw17vpV+iHWRoTc1MxWQQNMRdyOHeFfBpBsIjBd8KTEGiVRzl3kVSEDIXGjA1wEwJEfm
	PUpOaeGffyiKj9woI6EQHvonqx9rGJ7tE7lWTkmxflLSHdEvynaW/kNde0Rfjb0X56jY
	HOqObqPFwE/wSv/BfAECTZgt2SKWa1Gw55/MMyv+o2eMlwBC5SP5IJJO99vh816b61m/
	quHw==
X-Gm-Message-State: APjAAAXxtN51lbQjmS9v9NI/FDzpp5mbSqZKCUZsQWEahS2Z+N7f1EXl
	iRY6zyOkwNp6a8gp7S+CWIkvjCr1
X-Google-Smtp-Source: APXvYqxbes+a3k4SR6sFBoDpEczHefwdcCXTeLfyr+Tq3j7xEVStNss1Hqjl3FQEbMtzd8KvKxtNMQ==
X-Received: by 2002:aa7:8814:: with SMTP id c20mr29038766pfo.87.1567348596304; 
	Sun, 01 Sep 2019 07:36:36 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:35:50 -0700
Message-Id: <184672b59e4c20ec34da0974fa59a045f9d478c1.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 12/43] package: Improve determinism
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:35 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Its possible in cases with multiple shlib providers we were not being
deterministic. Add in a couple of sorted() calls to fix the shlibs and
pkgconfig cases with this potential issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/package.bbclass | 2 +-
 meta/lib/oe/package.py       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index eef1f7b..2c44fc1 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1918,7 +1918,7 @@ python package_do_pkgconfig () {
     for dir in reversed(shlibs_dirs):
         if not os.path.exists(dir):
             continue
-        for file in os.listdir(dir):
+        for file in sorted(os.listdir(dir)):
             m = re.match(r'^(.*)\.pclist$', file)
             if m:
                 pkg = m.group(1)
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index b595132..b8585d4 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -265,7 +265,7 @@ def read_shlib_providers(d):
         bb.debug(2, "Reading shlib providers in %s" % (dir))
         if not os.path.exists(dir):
             continue
-        for file in os.listdir(dir):
+        for file in sorted(os.listdir(dir)):
             m = list_re.match(file)
             if m:
                 dep_pkg = m.group(1)
-- 
2.7.4


