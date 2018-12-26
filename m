Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4D4726C230
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 20:10:28 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id s198so7911600pgs.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 12:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pINMDN3e6ph5452cRwpb+SXrJLEfaqLuCeYdA73rRng=;
	b=S9R4PfHe5IluoG6XZw8f0HYt7ap0JRju3Z0M5ds8Iyql8iO5qNEpfPGkFr6rjITCDk
	4Pdon4xOUCPMpphH5zYgmVSNBOvj0ZhLgYboiPUTcScmHcgMXCgEmOaPJiV1vutkly2E
	pnyYnDC9s8xomrPz8wFi6dOa16acCNafzJP+s2OyQO0Lo/HJq0ytqRm9CzlDZ/+R9mB8
	QjUm+v3PAziUtL9txS4sTb+JVdTrbXYX4BHCGy7vciHZOI4bHqVAHxKOhIj6gae/n2RP
	OzfIGDkRyvudGJXSt5laCibIVyL/QIuXqEQk6vk5cC51e0tedJgm93WojzDQfQFXHJPy
	+dnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pINMDN3e6ph5452cRwpb+SXrJLEfaqLuCeYdA73rRng=;
	b=lfhoCyHRMHupP98am6PCpldiLK2TiBfrXu7rRpH3bMyepWi3hsJZ3nrej02nTOLlI4
	Zl6PLQ3q1fXUPtJ4slcB5h5R3s5F5lMcnoqe0ucnHZP1lKpKwLWEhNELPti8Blf/dYnJ
	xJFjW8y79Nm5BDM/s1R1OhJF9PaC1y//aSYt84ZM1cEyk9Eh/oP/Ob5L4Ay92aLScmt+
	li34ZcVq/j0bPdXqmMffhN3Ssfrni2lmRUb7O/LjXkGCVx/VEr5Z6ePAxZtGanuwBN+9
	yE6N7xD9za1A8CGTbVtekmpgDoVPntYg9A+LpFczsMPiowZi+2g060Kn9V5aoB1XuS8L
	lmBw==
X-Gm-Message-State: AJcUuke6dmzArKaOeyXqPZuAwM9F0ooJh+hoQS0pZqYGZhZpNrtuGv2W
	408x9b30yYUDBqkpA757eXeE+tME8Iw=
X-Google-Smtp-Source: ALg8bN4Nu1tYMQemdN4X5RhyCPNx1n8i6EAdKZS3OzjgL4zA9xlkYfiIjETIGTb0XgYe4ctHUkSnKw==
X-Received: by 2002:a63:fe48:: with SMTP id x8mr20474082pgj.261.1545855029014; 
	Wed, 26 Dec 2018 12:10:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6e98])
	by smtp.gmail.com with ESMTPSA id
	l3sm60029493pga.92.2018.12.26.12.10.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 12:10:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Dec 2018 12:09:52 -0800
Message-Id: <20181226200954.5267-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181226200954.5267-1-raj.khem@gmail.com>
References: <20181226200954.5267-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/10] valgrind: Fix x86_64 build failure with gcc9
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
X-List-Received-Date: Wed, 26 Dec 2018 20:10:28 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ts-amd64-Do-not-clobber-rsp-register.patch | 37 +++++++++++++++++++
 .../valgrind/valgrind_3.14.0.bb               |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-tests-amd64-Do-not-clobber-rsp-register.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-tests-amd64-Do-not-clobber-rsp-register.patch b/meta/recipes-devtools/valgrind/valgrind/0001-tests-amd64-Do-not-clobber-rsp-register.patch
new file mode 100644
index 0000000000..657f80335d
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-tests-amd64-Do-not-clobber-rsp-register.patch
@@ -0,0 +1,37 @@
+From 8c1ebb564f5eca2baeedc27a703200786d1abb0b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Dec 2018 15:28:40 -0800
+Subject: [PATCH] tests/amd64: Do not clobber %rsp register
+
+This is seen with gcc-9.0 compiler now which is fix that gcc community
+did recently
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52813
+
+Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=402480]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ none/tests/amd64-linux/bug345887.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/none/tests/amd64-linux/bug345887.c b/none/tests/amd64-linux/bug345887.c
+index 0f9237d..4b07fe1 100644
+--- a/none/tests/amd64-linux/bug345887.c
++++ b/none/tests/amd64-linux/bug345887.c
+@@ -20,13 +20,14 @@ static void inner(void)
+       "movq $0x10d, %%r14\n"
+       "movq $0x10e, %%r15\n"
+       // not %rbp as mdb is then not able to reconstruct stack trace
+-      "movq $0x10f, %%rsp\n"
++      // not %rsp since gcc ignores it and since gcc >= 9.0 errors about it
++      // see https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52813
+       "movq $0x1234, (%%rax)\n"  // should cause SEGV here
+       "ud2"                      // should never get here
+       : // no output registers
+       : // no input registers
+       : "memory", "%rax", "%rbx", "%rcx", "%rdx", "%rsi", "%rdi",
+-        "%r8", "%r9", "%r10", "%r11", "%r12", "%r13", "%r14", "%r15", "%rsp");
++        "%r8", "%r9", "%r10", "%r11", "%r12", "%r13", "%r14", "%r15");
+ }
+ 
+ __attribute__((noinline))
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
index 50f8221ebb..bbbc3bf695 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://0001-fix-opcode-not-supported-on-mips32-linux.patch \
            file://0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch \
            file://0001-Make-local-functions-static-to-avoid-assembler-error.patch \
+           file://0001-tests-amd64-Do-not-clobber-rsp-register.patch \
            "
 SRC_URI[md5sum] = "74175426afa280184b62591b58c671b3"
 SRC_URI[sha256sum] = "037c11bfefd477cc6e9ebe8f193bb237fe397f7ce791b4a4ce3fa1c6a520baa5"
-- 
2.20.1


