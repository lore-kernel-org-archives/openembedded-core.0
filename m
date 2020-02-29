Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8891861A41
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 15:23:41 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id s2so2245508pgv.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 07:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Dr/HkEFW5+zkqkHgeWHq4ipcGemlZsZ1bkxqLV2WdnQ=;
	b=RQ8aKzP84HM5c6VKOZZkPH0o5EgSjfkPGHkFPH8fSI7N1LNdN1ewuhAiLfcbGAHT9h
	aq2LJl1irmtBKO+J9VD9JgnZIbV99rWi4p1ACJTQC2cv5OlfDOFD8wee+ZIT3NkQJQwB
	QXET5C+pMJU71mO4MN+MyqFQcYAuJOlHRdw6RQqeDuVek7741LIIrGwazBw2hZMVYzOp
	lFjSSf8L13W6X+WVYoNTTuIugszv9974qZM4lQQZGUkXE/bjoZVoGQKYrm8+7ud6P1/Z
	WOuV6gOM5aD0SC9OAuDvg4bDLMRoMGCg5W6vyspy7Ro1qY+jdp4Cv3cjOROH7+UPaUan
	x1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Dr/HkEFW5+zkqkHgeWHq4ipcGemlZsZ1bkxqLV2WdnQ=;
	b=BG3UBpsh+rFFC6NfAvxfa8TIqNiMRuo22tT96CASx72Hzwmk0IvwMfclqKA3Mys4fe
	3f98UU7srD2KrujhbtoORJvwM6YYxX8xwMBSEMRKbfGFlu9DCJ0PtrYubd/BuBc4UiLD
	vlONHSlF0Uu7pbao/DziU0rR/y5EGjK2XhkO9kCmUWcJ/L4Du36rVikhmWbI1ovhTmRV
	eBXSGKfI7QrxSY3/uuPtVbk8ekMjzdTtiZVIKdX9L49w9DsOf0C8YCf/3do81Krrzo1S
	dV7tLoslWPyPFpUO4AnYSs0BMZ4fGTczjkmRrE2xAdCgspfAA7ACJAqEdZXS8bpJ3Vsf
	wLZA==
X-Gm-Message-State: APjAAAVqMMD85oJrk9Cmg4pt80etTF0pYcGF2RFBJWfTpBim6qa2QZo9
	UWu7w4e3eEiiTf2SOuZFXhIV9XLmi7c=
X-Google-Smtp-Source: APXvYqwSKjbRpyB2n6Q4FGLua38qwbLRlJNSJGql6qvuos1z3vX/UjtuL5JPSodA5I+fmT0Li+kq+Q==
X-Received: by 2002:a63:a1e:: with SMTP id 30mr10677231pgk.238.1582989821988; 
	Sat, 29 Feb 2020 07:23:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1634])
	by smtp.gmail.com with ESMTPSA id
	y23sm15358811pfn.101.2020.02.29.07.23.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 29 Feb 2020 07:23:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Feb 2020 07:23:52 -0800
Message-Id: <20200229152352.1993520-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] glibc: Syscall fixes for mips/risc-v/mucroblaze
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
X-List-Received-Date: Sat, 29 Feb 2020 15:23:41 -0000
Content-Transfer-Encoding: 8bit

Should fix the mips make 4.3 issue on target

Changes in this delta

* 71f2b249a2 malloc/tst-mallocfork2: Kill lingering process for unexpected failures
* 5d31b083e4 riscv: Avoid clobbering register parameters in syscall
* f4f8843515 microblaze: Avoid clobbering register parameters in syscall
* aa638b86b2 mips: Fix argument passing for inlined syscalls on Linux [BZ #25523]
* ae1b6b13d4 mips: Use 'long int' and 'long long int' in linux syscall code

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index f489650f70..f7acf99752 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.31/master"
 PV = "2.31"
-SRCREV_glibc ?= "9ea3686266dca3f004ba874745a4087a89682617"
+SRCREV_glibc ?= "71f2b249a28e17eac0e47c53af44d5c5b65101aa"
 SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.25.1


