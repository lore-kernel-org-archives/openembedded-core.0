Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id DCE197F265
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 14:23:31 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 205so10896207pfw.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 07:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=HA6DEzwsC427CfeMTAoSAnhllJZ8PN0qXE6FQ5jQdiY=;
	b=BCZHu8+UGOxls6gd/nDuL7aIHIc0Rl+7WVhmz7fyDkC63UF6j9CXXOvC54Jm611Gwm
	6zVskpQ5y2Ply9tVRaajcIrMir3e2/DDR2i/ygupBmUXpuJQiE+L+7B5Js4YFrbz9ds5
	cQxSMcSQY3B4DEAZg+cLmi5kd3KKM7zqKU1fcgjw3wLD06eDsWD47OT5lmvBiJvHjvbp
	NwpHujOoeby51apYiuXmYpIrqbOqjWlckNLOMc/Hv1mrzyn9aBUwX/y8PouvM9dyx8+g
	NqqFnnNGtieaoK0DNk9HLGtHiqkONXH4ZF0jOGywmihYci49pT2pLS4CPIEAis9GycC2
	PMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=HA6DEzwsC427CfeMTAoSAnhllJZ8PN0qXE6FQ5jQdiY=;
	b=uMGOce4yObkm4Wb1JXi30t5VfmaK6ss2Ckd4JDX31HFXbbz3+VLloMQ6fl6+bCOWS/
	ek+FutGSMvi6doG+OIBWtwzGXHFaBaxf5gxCbnJFtqNEpyBllVIZFmfbeq1/CgTgqg8E
	/nyJKnDWfuTCUziwUmbu/wBEpUjOKhjrqDRYJqI9wdxa0T4C7Md9GRqKRYM2nMNM7S4e
	t1QMsaLn3YGH+KxYMtEIJlYt6u9/Fq//edYpdARZcWAhRGg/VoxDsWyhKOPOaecFiPyy
	MyP/GOATB0riSt1cQwxeNhH9wochzFKnqZ4C2WOHNIboWzV2dPLERxdkLWcuL2egLGzH
	2nUw==
X-Gm-Message-State: APjAAAUZDifyn1drG9YWwFXnWlwynai8P05W6uX2jqvcGTBAHThUxuTx
	xm2PcOps88581GIx5kKWhCc4Hg==
X-Google-Smtp-Source: APXvYqxUJ6b438lML7gFJymUmFCD/8rVqAeoY5hIKRqX9xG55ZVm7qxqhuqyByFYX8nmMIED408cAA==
X-Received: by 2002:aa7:9591:: with SMTP id z17mr46936500pfj.215.1567607012876;
	Wed, 04 Sep 2019 07:23:32 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	u8sm2138173pfm.112.2019.09.04.07.23.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Sep 2019 07:23:32 -0700 (PDT)
Date: Wed, 04 Sep 2019 14:23:23 +0000
Message-Id: <20190904142323.21781-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 1/4] oeqa/selftest/cases/glibc.py: Don't install python3 and pexpect
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
X-List-Received-Date: Wed, 04 Sep 2019 14:23:32 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

When running the system emulation test case, do not include python3 or
pexpect in the image. The test cases that use these also need gdb (with
python configured).

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/lib/oeqa/selftest/cases/glibc.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index f836367094..6a34da39d9 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -60,8 +60,8 @@ class GlibcSelfTestSystemEmulated(GlibcSelfTest):
         "libstdc++",
         "libatomic",
         "libgomp",
-        "python3",
-        "python3-pexpect",
+        # "python3",
+        # "python3-pexpect",
         "nfs-utils",
         ]
 
---
2.23.0.rc1

