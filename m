Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1D0C02194
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 17:34:44 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.75564.1738949679401848883
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 09:34:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gxkPEFeA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38dc6d55ebaso787953f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 09:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738949677; x=1739554477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eqcz0bzwwIU9UbEDOsyzo3ahgo/2Hkn27JyWf7y8FQM=;
        b=gxkPEFeAi85u7ZDKo91ihIDRY9Mot9tuOVTlArZXoHQKIwdF3z+0kjmr1e7u+/NZXV
         MM+LzNdIQ1m7zATBKcmSbFlR2LpxT/CkTQGMABbTbZL28TZC00njnpuKsd+ddrs5vWdT
         59QQ7GpabwokIuGi/Bvki7hYkQ1ghPFGxHMYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738949677; x=1739554477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eqcz0bzwwIU9UbEDOsyzo3ahgo/2Hkn27JyWf7y8FQM=;
        b=o5rgflGLKl1Se2ldBQlwi+WJlWHGqHto9wLnldE2ZtZa4o/GhErDeXqSfy69tRMaw8
         +qOUu6IyRYDDYU+fmURzte9LVvZJH6s5meUZw6H84Ls0lTKtI9e2CXflivq/frBhb8PW
         C9SaBtyA8I8el1biXCmAyzux94TQkT7RSNR+EWzocolaTuq46B4tmxmjYyz10TCeJ2AI
         WJrcyZjm4yMRv6q/8GXFrV4k9H0p+ue095SdJ7az1ZV23SoA99+/UMQ+HtvncS8G6mpM
         aQQoC5WzAiogPJ1OfTostxNBGtNL/8vOyFkACCzVN5a32gpmt9pBCmPv+p/6RN3TzdMI
         g8OQ==
X-Gm-Message-State: AOJu0Yz4TfY+j+OTL3wdZuzGLFqd1nat+jFuB2VSKs34oSQud5pNWtLX
	9gnuAP3wTMrPKTJt/RXOQ1ysD0tkVw9to7xWEcrxDIlw9tUL/z4JOvK9bngBblZSD1XhfEfGFDd
	0
X-Gm-Gg: ASbGncsvAjQl7cIPKYibhZyWqcKomrfVNhQlffTDsewPclkjd1NcNOjyhrRClDLgwJs
	EXRAr3rZVonTnPmesWVvzxTQc1ngF3ppSERdVBOj2Kh7h+AtqkbzoGJuvfzGWey2Rewjr73RBcT
	TnuztWGPzyIMbbf4XjlfZ8bkh7YBbbBFGyMc5kBDinj3mww6BEX9IUqLyGpMluepLXnkKGzhCYu
	u8bx7s1cNATPLxkrCPd/HLxw0hivW4JK7euIXv81iIvkAj380565i1dU06+xkqk6RgGpdLM7TSA
	OhBgUSsavaNWyGHxzu4fWfD/NaS97wMQPmWa/1zs3fCB
X-Google-Smtp-Source: AGHT+IGOXvXQYeZHCCV7cRVtvBQB9kBBjgQ1V91VFI77zfTVCBy5wVJW1HCRx5HNaMLJ1qSF4XW4kg==
X-Received: by 2002:a5d:6da4:0:b0:38a:4df5:a08 with SMTP id ffacd0b85a97d-38dbb2d56c6mr7286619f8f.22.1738949677118;
        Fri, 07 Feb 2025 09:34:37 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:dcae:28d1:c97a:4196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db11064sm96941275e9.37.2025.02.07.09.34.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:34:36 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] go: Fix to work without gold on aarch64
Date: Fri,  7 Feb 2025 17:34:33 +0000
Message-ID: <20250207173435.4007181-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 17:34:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210994

If we remove gold from binutils, go-runtime fails to build. There was a
workaround in go to use gold as the nfd linker had a bug. The issue was
fixed so backport dropping the workaround fmr upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/go/go-1.22.11.inc       |  1 +
 ...5b008e3d106b2706645e5a88cd8e2fb98953.patch | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/6d265b008e3d106b2706645e5a88cd8e2fb98953.patch

diff --git a/meta/recipes-devtools/go/go-1.22.11.inc b/meta/recipes-devtools/go/go-1.22.11.inc
index 21222bea4ec..2dca7be9eb4 100644
--- a/meta/recipes-devtools/go/go-1.22.11.inc
+++ b/meta/recipes-devtools/go/go-1.22.11.inc
@@ -14,5 +14,6 @@ SRC_URI += "\
     file://0007-exec.go-filter-out-build-specific-paths-from-linker-.patch \
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
+    file://6d265b008e3d106b2706645e5a88cd8e2fb98953.patch \
 "
 SRC_URI[main.sha256sum] = "a60c23dec95d10a2576265ce580f57869d5ac2471c4f4aca805addc9ea0fc9fe"
diff --git a/meta/recipes-devtools/go/go/6d265b008e3d106b2706645e5a88cd8e2fb98953.patch b/meta/recipes-devtools/go/go/6d265b008e3d106b2706645e5a88cd8e2fb98953.patch
new file mode 100644
index 00000000000..2f394d17914
--- /dev/null
+++ b/meta/recipes-devtools/go/go/6d265b008e3d106b2706645e5a88cd8e2fb98953.patch
@@ -0,0 +1,70 @@
+From 6d265b008e3d106b2706645e5a88cd8e2fb98953 Mon Sep 17 00:00:00 2001
+From: Dirk Müller <dirk@dmllr.de>
+Date: Wed, 09 Mar 2022 17:47:23 +0100
+Subject: [PATCH] cmd/link: stop forcing binutils-gold dependency on aarch64
+
+The bfd linker appears to be working just fine at least in version
+2.41 or above. Reject the known broken one instead, which
+avoids an architecture specific linker dependency that
+is cumbersome for distributions.
+
+Fixes #22040.
+
+Change-Id: I9f377e47c22ef20497479c0978c053ed5de46a38
+
+Upstream-Status: Backport [https://go.googlesource.com/go/+/6d265b008e3d106b2706645e5a88cd8e2fb98953]
+---
+
+diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
+index 2d8f964..fcf0bc7 100644
+--- a/src/cmd/link/internal/ld/lib.go
++++ b/src/cmd/link/internal/ld/lib.go
+@@ -1670,27 +1670,6 @@
+ 			// Use lld to avoid errors from default linker (issue #38838)
+ 			altLinker = "lld"
+ 		}
+-
+-		if ctxt.Arch.InFamily(sys.ARM64) && buildcfg.GOOS == "linux" {
+-			// On ARM64, the GNU linker will fail with
+-			// -znocopyreloc if it thinks a COPY relocation is
+-			// required. Switch to gold.
+-			// https://sourceware.org/bugzilla/show_bug.cgi?id=19962
+-			// https://go.dev/issue/22040
+-			altLinker = "gold"
+-
+-			// If gold is not installed, gcc will silently switch
+-			// back to ld.bfd. So we parse the version information
+-			// and provide a useful error if gold is missing.
+-			name, args := flagExtld[0], flagExtld[1:]
+-			args = append(args, "-fuse-ld=gold", "-Wl,--version")
+-			cmd := exec.Command(name, args...)
+-			if out, err := cmd.CombinedOutput(); err == nil {
+-				if !bytes.Contains(out, []byte("GNU gold")) {
+-					log.Fatalf("ARM64 external linker must be gold (issue #15696, 22040), but is not: %s", out)
+-				}
+-			}
+-		}
+ 	}
+ 	if ctxt.Arch.Family == sys.ARM64 && buildcfg.GOOS == "freebsd" {
+ 		// Switch to ld.bfd on freebsd/arm64.
+diff --git a/src/make.bash b/src/make.bash
+index b67ae15..7df4910 100755
+--- a/src/make.bash
++++ b/src/make.bash
+@@ -94,6 +94,16 @@
+ 	;;
+ esac
+ 
++# Test for bad bfd.ld
++if test "$(uname -m)" = "aarch64" && ld -v | grep -E "GNU ld.* 2\.([0-3]|40)"; then
++	echo 'ERROR: Your system uses bfd.LD 2.40 or older which has issues with dynamic linking on aarch64'
++	echo 'Consider upgrading or switching to binutils-gold.'
++	echo
++	echo 'See https://sourceware.org/bugzilla/show_bug.cgi?id=30437'
++
++	exit 1
++fi
++
+ # Test for bad ld.
+ if ld --version 2>&1 | grep 'gold.* 2\.20' >/dev/null; then
+ 	echo 'ERROR: Your system has gold 2.20 installed.'

