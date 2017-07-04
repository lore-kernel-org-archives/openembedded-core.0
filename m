Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 36FB477BDE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 15:51:11 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id d193so9442551pgc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jul 2017 08:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZKfzVds5iSQOoYAVBcWFX0w3X6CqxkgFpniCD/a5kJA=;
	b=cLDP4rJmN3B8tzxufTGU7m0ja5xpDENf8x5A4ijMUXf9sFXXndP7pNeM/90X/6SNSl
	TE0stWzEPzhisjx274VzRSmcLX/OhnThn0TEnK/YtzC+VDZWbGttlgPMizBLyZpL0v8O
	6V3wc6RSu9eyVKsZYLORFwORHan61cVs2IiM1/30M/idgfb0Tx1IqgXyZy97ll9Io/B9
	6RUBvAiD6qg/u9C9yFQMliPdJ/SFL5ooQ3HNPCXMFvvli6P44uYzIHbHjpO7wB/0QgPC
	xj2vSNuJiJX6NpklssfdMqOBlD4udWFICjOEJdWNIVUdtOFMuis9Czdq02s4d968Y9vq
	6wyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZKfzVds5iSQOoYAVBcWFX0w3X6CqxkgFpniCD/a5kJA=;
	b=lVJ3QiwFpt55Kp58N+FxKeNLli/8Qnd7mdLqLH0MknEIWdr7NrPbA8Mkr2dKsM47uO
	A9+v3ImCP+ar0eKuoLLrViMlLWwXCldu50+x83ehwEdXDYlbKhwQNEr0Iwo3tNce/tdl
	3eDnc/kHx81l7FpFCTb/8nnXqij0ZuB+YsD8tUQf+a6Ww8YFmQkoFvjiObaHaGC9JZiu
	C/MTAIwpEDcJiL35jp3shkJZrLA4T6F9t+77NyPSebIgOCJYQWkb0QBzxt/mSoY311Re
	AS+q70Klz2aGeqEeNZ09yguvetFvhuJqrLZO4SfgSx7RUuvVYsJ2WkdNFrViyG47HcPN
	XJJQ==
X-Gm-Message-State: AIVw112l4K3HPiELz2RF9/2kJ/iexuxhhYvwfJpghNZ2aGQe8vmNv7Lp
	+lNRokE+gS4TJ33W
X-Received: by 10.84.140.107 with SMTP id 98mr17304762pls.97.1499183473129;
	Tue, 04 Jul 2017 08:51:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	r63sm36545914pgr.65.2017.07.04.08.51.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Jul 2017 08:51:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Jul 2017 08:50:55 -0700
Message-Id: <20170704155056.12467-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170704155056.12467-1-raj.khem@gmail.com>
References: <20170704155056.12467-1-raj.khem@gmail.com>
Subject: [PATCH 2/3] security_flags.inc: Do not build gcc for powerpc with PIE defaults
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
X-List-Received-Date: Tue, 04 Jul 2017 15:51:12 -0000

Since we have disabled FPIE from SECURITY_CFLAGS already, we have
to ensure the same with gcc, otherwise gcc (on-device) will be built
defaulting to PIE, and such binaries will fail to execute

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index dd713b9818..ab2062b78f 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -29,6 +29,7 @@ SECURITY_X_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro"
 # powerpc does not get on with pie for reasons not looked into as yet
 SECURITY_CFLAGS_powerpc = "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_NOPIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libgcc_powerpc = ""
+GCCPIE_powerpc = ""
 
 # arm specific security flag issues
 SECURITY_CFLAGS_pn-glibc = ""
-- 
2.13.2


