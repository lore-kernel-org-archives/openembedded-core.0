Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E840AC10DC1
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 23:05:28 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.57647.1701299126102952493
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 15:05:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AUEcS8AA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1cf80a7be0aso3465575ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 15:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701299125; x=1701903925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/umzPpFMv3ik3YrL7xum2IO2Ep4r8XYhwzpNxlpaiQ=;
        b=AUEcS8AAtFp3dOQ1vIqrvPXvU2pLapjgHPlXviDTAD//ijVAmFCZSPxx1ACGIVsmji
         bqFHRT8/GuwyUjB7CloeT1BGVhUYHnwNcjFkwOwoohWZCVg2i15YsjKcIWSM9UJnR9kh
         C6rlPuE1Q9PHJQuL6PUKtnbB02GvBEWTf96mjPF6Sm9zkGOfPlvFxW/SEfqMJpEWPx1E
         RbimY4X/mBVTyOPw8TpHbSLoNZO/PdqQ+kgvswPyBJ/vOCbkTmZkCfJkLxOWxwurTCmO
         D5049hTTQogpmMnlZIoiByrDGs6UQPwoM+VMccI/WabBqTrGn+AezhXRRx/48PxNROUo
         7X3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701299125; x=1701903925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/umzPpFMv3ik3YrL7xum2IO2Ep4r8XYhwzpNxlpaiQ=;
        b=w4CB/cvfbu7i7yQhmpQ0gFVMy6Rmah2Xi9WLqrYmYTZs9OPdZ7hzSYt5s+AI63wUQw
         0UwiHtMXu9HEigQhzwiRuJYR1gzayJTQdT2govd0LK8cjBjv4CFauugANokmvTRMbagL
         AK5jIa+JRim7soyCqeRXYDn6A2pc3khA0r9vpRcYA4GYlzt8TPtt2I7NmlUjH2busEj2
         AwvaoGH9Y8sH+ZYpeneDmuMjoSQAHi+dwaJuVfQG66ec7j6MyV3t0wMyiVKCi9+8F2QQ
         p4bscy+mPHOPjXklZSelvv6hkMJBWGvJ99EgdNZmyieruW/ZRNh71nPBYjz3+dIUnmc9
         LU7g==
X-Gm-Message-State: AOJu0YzkhrS61zCjR0Q96ei6UQ75+xpxA6prP2j7pIoVJdgIodwlsmzj
	kWh8z4Nbm4XfmtEgp/8NTXBczyly8GtVQF9qJJslWg==
X-Google-Smtp-Source: AGHT+IEQytTmtHOJCBUSaWrp3WKAT1KT9P+P8vOeyqwhowoLB7QYre6Ahd7HTiG3ud9bl10sbn1zTg==
X-Received: by 2002:a17:902:c38c:b0:1cf:d0fe:8e51 with SMTP id g12-20020a170902c38c00b001cfd0fe8e51mr12590819plg.29.1701299125215;
        Wed, 29 Nov 2023 15:05:25 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id u4-20020a17090341c400b001cfc9c926b7sm6918999ple.75.2023.11.29.15.05.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 15:05:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/8] systemtap_git: fix used uninitialized error
Date: Wed, 29 Nov 2023 13:05:01 -1000
Message-Id: <11da43b58e19583a9bc16044309610cfb2e86469.1701299008.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701299008.git.steve@sakoman.com>
References: <cover.1701299008.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 23:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191472

From: Li Wang <li.wang@windriver.com>

bpf-translate.cxx: error: 'this_column_size' may be used uninitialized in this function [-Werror=maybe-uninitialized]
bpf-translate.cxx: error: 'num' may be used uninitialized in this function [-Werror=maybe-uninitialized]

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...x-Prevent-Werror-maybe-uninitialized.patch | 53 +++++++++++++++++++
 .../recipes-kernel/systemtap/systemtap_git.bb |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-bpf-translate.cxx-Prevent-Werror-maybe-uninitialized.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-bpf-translate.cxx-Prevent-Werror-maybe-uninitialized.patch b/meta/recipes-kernel/systemtap/systemtap/0001-bpf-translate.cxx-Prevent-Werror-maybe-uninitialized.patch
new file mode 100644
index 0000000000..130eefab5d
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-bpf-translate.cxx-Prevent-Werror-maybe-uninitialized.patch
@@ -0,0 +1,53 @@
+From df3425f51a512f65522522daf1f78c7fab0a63fd Mon Sep 17 00:00:00 2001
+From: Aaron Merey <amerey@redhat.com>
+Date: Fri, 25 Feb 2022 19:18:29 -0500
+Subject: [PATCH] bpf-translate.cxx: Prevent -Werror=maybe-uninitialized
+
+Two variables in bpf-translate.cxx can trigger -Werror=maybe-uninitialized.
+The code is designed so that uninitialized uses are not actually possible,
+but to convince gcc of this we move a throw statement and initialize one
+of the variables with a value.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=systemtap.git;a=commit;h=df3425f51a512f65522522daf1f78c7fab0a63fd]
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ bpf-translate.cxx | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/bpf-translate.cxx b/bpf-translate.cxx
+index 3f45c721f..1b63d6078 100644
+--- a/bpf-translate.cxx
++++ b/bpf-translate.cxx
+@@ -1203,7 +1203,7 @@ bpf_unparser::emit_asm_arg (const asm_stmt &stmt, const std::string &arg,
+     {
+       /* arg is a register number */
+       std::string reg = arg[0] == 'r' ? arg.substr(1) : arg;
+-      unsigned long num;
++      unsigned long num = ULONG_MAX;
+       bool parsed = false;
+       try {
+         num = stoul(reg, 0, 0);
+@@ -1941,8 +1941,6 @@ bpf_unparser::visit_foreach_loop(foreach_loop* s)
+   for (unsigned k = 0; k < arraydecl->index_types.size(); k++)
+     {
+       auto type = arraydecl->index_types[k];
+-      if (type != pe_long && type != pe_string)
+-        throw SEMANTIC_ERROR(_("unhandled foreach index type"), s->tok);
+       int this_column_size;
+       // PR23875: foreach should handle string keys
+       if (type == pe_long)
+@@ -1953,6 +1951,10 @@ bpf_unparser::visit_foreach_loop(foreach_loop* s)
+         {
+           this_column_size = BPF_MAXSTRINGLEN;
+         }
++      else
++        {
++          throw SEMANTIC_ERROR(_("unhandled foreach index type"), s->tok);
++        }
+       if (info.sort_column == k + 1) // record sort column
+         {
+           info.sort_column_size = this_column_size;
+-- 
+2.25.1
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index ce86d5274d..c84fc27001 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -9,6 +9,7 @@ require systemtap_git.inc
 SRC_URI += "file://0001-improve-reproducibility-for-c-compiling.patch \
             file://0001-staprun-address-ncurses-6.3-failures.patch \
             file://0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch \
+            file://0001-bpf-translate.cxx-Prevent-Werror-maybe-uninitialized.patch \
            "
 
 DEPENDS = "elfutils"
-- 
2.34.1


