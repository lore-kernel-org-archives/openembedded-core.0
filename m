Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EEC1CD4F26
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 07:19:53 +0000 (UTC)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70310.1778570386999536475
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 00:19:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gclT9V8L;
 spf=pass (domain: mvista.com, ip: 74.125.82.43, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12ddbe104ccso4747434c88.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 00:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1778570386; x=1779175186; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TvVMk2NPd3nKhix7HkZKXwSFiSBxcIAYlFKOjG4CZ2k=;
        b=gclT9V8LcCEx4eHVLUzcLRZdn5XHSpOXnchagJKYaFvpz7GWOdCjqIntZlSRKALi6c
         VShTof5IXXos3S6qm4jgbh35FflvxeAkDlj5Usejov5W8JEmJewT+ZDuAQqridnE+btH
         6E1QhUwlzbilp+7V6bb4iwWCZXetTuS9JZ2qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778570386; x=1779175186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvVMk2NPd3nKhix7HkZKXwSFiSBxcIAYlFKOjG4CZ2k=;
        b=IBvAX9o7YEKQQzancgPXG30xPZRNIeAe+zZix0Rj3FNqGE14FM9nZFW54HYWRkTi6v
         Ykq9+WHKu7KayPj6tU1JKMWciN9rBKn5vofPZLLv/Nn/kVMGOeAz+ncqdEMYWj1o6UOJ
         KEzKtlhMPXlxubTmVcA6gNPE6fCaSHNapM6TVE1UKsF2Vb1dEr6NtN/b6JYq55hmfwme
         4i4DPEuKzghQAHdHV0zfiUvT7fyN46FADa66gLsT2UNSSHPzANVkJnw93JfoAGCAGxp0
         x8FdTKxnYnL2nntPiDWm+OZ6igdQMls3i2pS8vXL2D6Sx67+Uq8kXVGcQjvT3lxT2i6j
         yfxg==
X-Gm-Message-State: AOJu0Yzx6RP6RqPsag1EUssUbC/kI92khUO5JrbVgTskfuzPfotcplj3
	Sl0ilZSJLEP7FvvoK6wu8QnH91VCwDGbC1quL0epEgt86ehjBkfna+6pEE5OS8A1fS6D1KT8PYm
	DJrt0Ipo=
X-Gm-Gg: Acq92OEsC0a6NzzZJEiATzzQViDk8dSLUb0EsUrqExIZHivK8VcYJtboucAqfs798IW
	H56vn5QOr81NyN8IXVR0t+EbNXe7E6hB/ZxdHG3NcUNwKpn55p2gEbsXvYDEEx4lNFt3e9v4bG4
	fdeHNBWCw7MQXfvvwdeVDzMMMj9JXQSm+pejJx9szd6/eVjbeOZhUxQgCjtrXyT+cwhqIG0DoXM
	e2TNsuC+5YdPbKjsl8yBFrgjeeeFPN6epKw3yrWD8nUpbqFLvAdTEn3f8P/64yg9DFSkVL458Qy
	7N1AhHJeumBNDVIEc/lXZF+UI9FHoj8J+WBga6vNq+CBaU2vqWqNOHBN0JaBIQCxAsI8RPFwteU
	l/KzT4tWhu3WTEbmBQyJNQA2Y0y2bhhjY+cE+CSkUM/8JdHtOtjdKFZRUhpMQT8q4RBRNCrVg2m
	Obo+nUthnEZC/AUZlpTME/NsMd6EwsA1bB1de8
X-Received: by 2002:a05:7022:6987:b0:12d:b6de:8da7 with SMTP id a92af1059eb24-13344c42e92mr1242836c88.6.1778570385969;
        Tue, 12 May 2026 00:19:45 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.207])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278758e0csm18778221c88.12.2026.05.12.00.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 00:19:45 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] go 1.22.12: fix CVE-2026-27140
Date: Tue, 12 May 2026 12:49:32 +0530
Message-ID: <20260512071934.82378-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 07:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236852

Pick patch from [1] also mentioned at Debian report in [2]

[1] https://github.com/golang/go/commit/abaa0cbb259e059ee60c33a7507eddc1fe7d20fa
[2] https://security-tracker.debian.org/tracker/CVE-2026-27140
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-27140

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2026-27140.patch                | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-27140.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 3fa421e223..7ece9095ff 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -41,6 +41,7 @@ SRC_URI += "\
     file://CVE-2025-68121_p1.patch \
     file://CVE-2025-68121_p2.patch \
     file://CVE-2025-68121_p3.patch \
+    file://CVE-2026-27140.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-27140.patch b/meta/recipes-devtools/go/go/CVE-2026-27140.patch
new file mode 100644
index 0000000000..5c9fb31c23
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-27140.patch
@@ -0,0 +1,58 @@
+From abaa0cbb259e059ee60c33a7507eddc1fe7d20fa Mon Sep 17 00:00:00 2001
+From: Neal Patel <nealpatel@google.com>
+Date: Tue, 24 Feb 2026 23:05:34 +0000
+Subject: [PATCH] [release-branch.go1.25] cmd/go: disallow cgo trust boundary
+ bypass
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The cgo compiler implicitly trusts generated files
+with 'cgo' prefixes; thus, SWIG files containing 'cgo'
+in their names will cause bypass of the trust boundary,
+leading to code smuggling or arbitrary code execution.
+
+The cgo compiler will now produce an error if it
+encounters any SWIG files containing this prefix.
+
+Thanks to Juho Forsén of Mattermost for reporting this issue.
+
+Fixes #78335
+Fixes CVE-2026-27140
+
+Change-Id: I44185a84e07739b3b347efdb86be7d8fa560b030
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3520
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3989
+Reviewed-on: https://go-review.googlesource.com/c/go/+/763556
+Reviewed-by: David Chase <drchase@google.com>
+TryBot-Bypass: Gopher Robot <gobot@golang.org>
+Reviewed-by: Junyang Shao <shaojunyang@google.com>
+Auto-Submit: Gopher Robot <gobot@golang.org>
+
+CVE: CVE-2026-27140
+Upstream-Status: Backport [https://github.com/golang/go/commit/abaa0cbb259e059ee60c33a7507eddc1fe7d20fa]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/cmd/go/internal/work/exec.go | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index 815942a..520c478 100644
+--- a/src/cmd/go/internal/work/exec.go
++++ b/src/cmd/go/internal/work/exec.go
+@@ -3347,6 +3347,10 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
+ 
+ // Run SWIG on one SWIG input file.
+ func (b *Builder) swigOne(a *Action, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
++	if strings.HasPrefix(file, "cgo") {
++		return "", "", errors.New("SWIG file must not use prefix 'cgo'")
++	}
++
+ 	p := a.Package
+ 	sh := b.Shell(a)
+ 
+-- 
+2.50.1
+
-- 
2.50.1


