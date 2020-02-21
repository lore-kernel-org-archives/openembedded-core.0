Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5B68260C61
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 17:46:10 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id p7so2555221qkh.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 09:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZmD4JmAkVqXLO7FvbDVLz2f2/QwbvksAn3p9BB/IMUw=;
	b=QzAnL/SI6cAv4Ps4CZJq+J51YdLknOknbjPg6f776FbE3CWOUGwqUMy+fC/t5JCT+C
	FwjO2FIZIud0bn1gXZ7OJEkg6/J0gRbBRl1vqj8aVNoJOKqT6p3YxV0F0RjTEJfCaZub
	qNZEKzMyuU2CsqeLSpHaYZRW9oTGhUPXVDgB9j13WJIK5Owcp9EydidVOkzaKuF9ULCJ
	GzK0dWDF1lO0wX9js4oC4Eq/u5SjRewjsw3/wmvlc5bHU75073/a5VvCj5jp+hCPP9Te
	k7tFthvqhbQ8AgZ1k9t3UOUWOU12dF4Mcqth7+HdHqpZ4nI7PlDzX8p1OmcK0rFQ4KXk
	bZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZmD4JmAkVqXLO7FvbDVLz2f2/QwbvksAn3p9BB/IMUw=;
	b=SIEUPaz3KtlP8d/VnpSQuGFsIxpxyiDIIClzDG6x+68vHpCaKMyYCfXjXIXsKOPgtI
	uUrW2oKAXvFnTJHNJr1BhmcSQ4c2eE3QkJSGXhUCaieNPFKZmJLBtZWhrlcfmnMwfmYn
	AP/HVOrCpBYwBo132kJLqBRJo+qyK1Y1B58QcdeSNQ9x2NO7GT+sBimFHYFsnb0OB4nT
	1WaT6YbMUxBB5PTjQozdEqBZ1ruuF4/xLXDxejTgIxpPVG+Ff0jIhhv5ZjP65FS96/Ye
	a9Q9rqMWMAN0qcR0cVxDLlWPeAvPMAHt/zlCKZd2C3b5tObkqfk2z3kcr7PKV1iZkNj1
	wOoQ==
X-Gm-Message-State: APjAAAXoZLX445h0vvuwqFSL52hmnIWPKu7A3ig6VuA2EAmIhp/0PeKx
	1SoirxhAQzV3HHqWEpYZcuM=
X-Google-Smtp-Source: APXvYqz4fmtnWFBtHTNEFed6WCpHmbn9BKuqZiPzYVFshToeDVoNlGy4o2B6CvaklCyCN2EqMjmpiQ==
X-Received: by 2002:ae9:e8d2:: with SMTP id a201mr34419669qkg.47.1582307171392;
	Fri, 21 Feb 2020 09:46:11 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	g17sm1855153qtq.29.2020.02.21.09.46.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 09:46:10 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri, 21 Feb 2020 12:45:59 -0500
Message-Id: <5528a17947c2b33032d6d051b99c53927c64f3b9.1582306887.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1582306887.git.bruce.ashfield@gmail.com>
References: <cover.1582306887.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/10] linux-yocto: perf: Make perf able to build with latest libbfd
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
X-List-Received-Date: Fri, 21 Feb 2020 17:46:11 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Khem pointed out that we need to backport the following change to get
perf building with the latest binutils:

commit 0ada120c883d4f1f6 upstream:

[
    Subject: perf: Make perf able to build with latest libbfd

    libbfd has changed the bfd_section_* macros to inline functions
    bfd_section_<field> since 2019-09-18. See below two commits:
      o http://www.sourceware.org/ml/gdb-cvs/2019-09/msg00064.html
      o https://www.sourceware.org/ml/gdb-cvs/2019-09/msg00072.html

    This fix make perf able to build with both old and new libbfd.

    Signed-off-by: Changbin Du <changbin.du@gmail.com>
    Acked-by: Jiri Olsa <jolsa@redhat.com>
    Cc: Peter Zijlstra <peterz@infradead.org>
    Link: http://lore.kernel.org/lkml/20200128152938.31413-1-changbin.du@gmail.com
    Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
]

Reported-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_5.4.bb |  2 +-
 .../linux/linux-yocto-tiny_5.4.bb              |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb   | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 94a8e052e7..2a35e33830 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2f533134cfb54b0f77e39a9a9108836aafc3eea1"
+SRCREV_machine ?= "97cb5fe4e4fa529a5b8165c4f84182d2d4751b39"
 SRCREV_meta ?= "c11911d4d1cf0d0b069dfd1922b41256f61442de"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 622f5e60c0..463451fa35 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "b73dad53d5bfa6b53f56a9022dd9f965d47c93e2"
-SRCREV_machine ?= "239eea7ef5dd5ec7ce6712ea6fc8e9ba9bd49ece"
+SRCREV_machine_qemuarm ?= "f0aeaeffb8ba6d0c24f9f0212fd7a11866c918b8"
+SRCREV_machine ?= "f4d7dbafb103e4f782323017c239c548871c1567"
 SRCREV_meta ?= "c11911d4d1cf0d0b069dfd1922b41256f61442de"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index feb89780ea..5dd7b68063 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,15 +12,15 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "65ea2729e3e6a8db8512a80a9838a975ca38f1b3"
-SRCREV_machine_qemuarm64 ?= "239eea7ef5dd5ec7ce6712ea6fc8e9ba9bd49ece"
-SRCREV_machine_qemumips ?= "75b3ff96ee76cdfbf5320ddf97b1c929bb8400c8"
-SRCREV_machine_qemuppc ?= "239eea7ef5dd5ec7ce6712ea6fc8e9ba9bd49ece"
-SRCREV_machine_qemuriscv64 ?= "239eea7ef5dd5ec7ce6712ea6fc8e9ba9bd49ece"
-SRCREV_machine_qemux86 ?= "239eea7ef5dd5ec7ce6712ea6fc8e9ba9bd49ece"
-SRCREV_machine_qemux86-64 ?= "239eea7ef5dd5ec7ce6712ea6fc8e9ba9bd49ece"
-SRCREV_machine_qemumips64 ?= "419af24bb95f01a2106b7cf25b0adc965368d486"
-SRCREV_machine ?= "239eea7ef5dd5ec7ce6712ea6fc8e9ba9bd49ece"
+SRCREV_machine_qemuarm ?= "aa91aac123d12d9d4f420862238a437781fe3825"
+SRCREV_machine_qemuarm64 ?= "f4d7dbafb103e4f782323017c239c548871c1567"
+SRCREV_machine_qemumips ?= "6cb162ab5262318fc52a7cbef86afcf48c6b2449"
+SRCREV_machine_qemuppc ?= "f4d7dbafb103e4f782323017c239c548871c1567"
+SRCREV_machine_qemuriscv64 ?= "f4d7dbafb103e4f782323017c239c548871c1567"
+SRCREV_machine_qemux86 ?= "f4d7dbafb103e4f782323017c239c548871c1567"
+SRCREV_machine_qemux86-64 ?= "f4d7dbafb103e4f782323017c239c548871c1567"
+SRCREV_machine_qemumips64 ?= "fcbec8b4f0f2f24a31ce5c6e6439c69f7512fb31"
+SRCREV_machine ?= "f4d7dbafb103e4f782323017c239c548871c1567"
 SRCREV_meta ?= "c11911d4d1cf0d0b069dfd1922b41256f61442de"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
-- 
2.19.1


