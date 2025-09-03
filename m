Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78554CA1012
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 16:15:23 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.16917.1756916113651177615
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 09:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CbhqA7ed;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7722c8d2694so67351b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 09:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756916113; x=1757520913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jPANE6bFlQwt9AbjIJSs1v+hC2sum4MsW/AqS0PKUd8=;
        b=CbhqA7eddizfZHFv2IpD+XrKuRp/+zEWze3Uo3Mepe/ysAJu7hm2zMNd8xvExARuYC
         pPWYgm3SZTBa048lmKFE+s+1H6Q/PveZbzkssDbV2bKDmdT+F7EXEVBYcpeIRvHxIMiG
         rvKI64xpnWAK7Za2VbFp6KmYUvP1XVl9lpT7Ylpvc7nCHl2se4JrO/4UZlLY6KiTV2eK
         CgGpHZ6vH36r8Khrs//s7puOLhv78innv+nsM4cOG95D/ctoVSM0nRYeQ49hjBJsJr7m
         UbDxA8bS97MLteM1F1DYRxjqSPbtuS3yozaXzNfQNprQRglwyZ33VwBZfAV93m+S1grr
         10Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756916113; x=1757520913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPANE6bFlQwt9AbjIJSs1v+hC2sum4MsW/AqS0PKUd8=;
        b=b4lkGlCuH/x5H36veBimWMUDXyrI/QmhRw8IABgKin28c3XPCA2mQIj+SXNZyElfBR
         zsWcHbClBcZiadWQp5ispXm/Lbm/J28zAgtUiloOxaxTRfvGkn7YMFpT5VW21uHFhXJW
         UMyMCLCv4M/ZdPul9Yv0/lEtvJ/lCR90AVK2LxAAcEB+4l1Uw9nYV7vh0DUb3NTRKl2g
         hJqrjxbvJ4YsXeilxQqKQmYJkmDje7is5rcYLu/GBf/Cezr94Pt3kKGczZ7Xw7WWPvUz
         G50w0azfrEVHK/SgoNVK2n/P/OoVTkWyA2KKt5B9Ej2+FKufcAe88tKUAS7NDl73WiKa
         I9nA==
X-Gm-Message-State: AOJu0YyIJBQleRV9j8bNda2gx2Ih2yVKoMj8MpLTjf+nnahYM7RGb7BA
	ITRpZak3+e4AT79rm3GvfMSxrsZCWuvNQL7hIAOj0EoCN2hcXbCObvwKa8sY/B8qa3lIKZkhx1v
	jKIw+
X-Gm-Gg: ASbGncvJzK/mlKRdhAye21QwePSt8kCVoZEOLN9+VcUPeRNDSL7oGMQqAv3W8YMAax7
	9CDTTjkKGGJd+uFg8IT1rIU9eb8QmLfGhZd/FyvnXNGYSjYz2Mjo2uFX4iJhE4/gmus1sM9NyBE
	IPdaR+Wg4pxHD8nuPFhoadgm48962qJZsjt7mzDde7Ww8fLm3N9VRZG6ah7423RTmxzamZ5OPJ7
	NgzjagLGylDrKl7lbWWpFz0ooLZgGW5+w+2VyQPeF+OTOq50KIICiRzaOZgnF2WVcwFCKOhXEJZ
	miaVfSoLxvfHJGU6WRv0jmflnTRMYRU33k7DP4zKymBC2O1rdwthB+D3YPujzy05hnosgS6m6Av
	fHJ1ZIHxtAfY9dyXLuDjk61vC
X-Google-Smtp-Source: AGHT+IHso0ULd8n67vwSCv138FyAMt4Op6oYAMAd7iOZ2lkwKsesSJKma2NuHqtoj81+vEe6imHIbQ==
X-Received: by 2002:a05:6a20:958f:b0:243:ce0f:e809 with SMTP id adf61e73a8af0-243d6e06ae5mr20992768637.23.1756916112626;
        Wed, 03 Sep 2025 09:15:12 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:9ffe:4bb4:e2b3:4b1c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7724f079b88sm11027602b3a.40.2025.09.03.09.15.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 09:15:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/9] git: fix CVE-2025-48384
Date: Wed,  3 Sep 2025 09:14:54 -0700
Message-ID: <34cb9674a5ce337a75af0dc415706d0323c427a6.1756915922.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756915922.git.steve@sakoman.com>
References: <cover.1756915922.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 16:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222869

From: Praveen Kumar <praveen.kumar@windriver.com>

Git is a fast, scalable, distributed revision control system with an
unusually rich command set that provides both high-level operations
and full access to internals. When reading a config value, Git strips
any trailing carriage return and line feed (CRLF). When writing a
config entry, values with a trailing CR are not quoted, causing the CR
to be lost when the config is later read. When initializing a
submodule, if the submodule path contains a trailing CR, the altered
path is read resulting in the submodule being checked out to an
incorrect location. If a symlink exists that points the altered path
to the submodule hooks directory, and the submodule contains an
executable post-checkout hook, the script may be unintentionally
executed after checkout. This vulnerability is fixed in v2.43.7,
v2.44.4, v2.45.4, v2.46.4, v2.47.3, v2.48.2, v2.49.1, and v2.50.1.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-48384

Upstream-patch:
https://github.com/git/git/commit/05e9cd64ee23bbadcea6bcffd6660ed02b8eab89

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../git/git/CVE-2025-48384.patch              | 85 +++++++++++++++++++
 meta/recipes-devtools/git/git_2.35.7.bb       |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git/CVE-2025-48384.patch

diff --git a/meta/recipes-devtools/git/git/CVE-2025-48384.patch b/meta/recipes-devtools/git/git/CVE-2025-48384.patch
new file mode 100644
index 0000000000..6c21a3c352
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2025-48384.patch
@@ -0,0 +1,85 @@
+From 05e9cd64ee23bbadcea6bcffd6660ed02b8eab89 Mon Sep 17 00:00:00 2001
+From: Justin Tobler <jltobler@gmail.com>
+Date: Mon, 19 May 2025 21:26:04 -0500
+Subject: [PATCH] config: quote values containing CR character
+
+When reading the config, values that contain a trailing CRLF are
+stripped. If the value itself has a trailing CR, the normal LF that
+follows results in the CR being unintentionally stripped. This may lead
+to unintended behavior due to the config value written being different
+when it gets read.
+
+One such issue involves a repository with a submodule path containing a
+trailing CR. When the submodule gets initialized, the submodule is
+cloned without being checked out and has "core.worktree" set to the
+submodule path. The git-checkout(1) that gets spawned later reads the
+"core.worktree" config value, but without the trailing CR, and
+consequently attempts to checkout to a different path than intended.
+
+If the repository contains a matching path that is a symlink, it is
+possible for the submodule repository to be checked out in arbitrary
+locations. This is extra bad when the symlink points to the submodule
+hooks directory and the submodule repository contains an executable
+"post-checkout" hook. Once the submodule repository checkout completes,
+the "post-checkout" hook immediately executes.
+
+To prevent mismatched config state due to misinterpreting a trailing CR,
+wrap config values containing CR in double quotes when writing the
+entry. This ensures a trailing CR is always separated for an LF and thus
+prevented from getting stripped.
+
+Note that this problem cannot be addressed by just quoting each CR with
+"\r". The reading side of the config interprets only a few backslash
+escapes, and "\r" is not among them. This fix is sufficient though
+because it only affects the CR at the end of a line and any literal CR
+in the interior is already preserved.
+
+Co-authored-by: David Leadbeater <dgl@dgl.cx>
+Signed-off-by: Justin Tobler <jltobler@gmail.com>
+Signed-off-by: Taylor Blau <me@ttaylorr.com>
+
+CVE: CVE-2025-48384
+
+Upstream-Status: Backport [https://github.com/git/git/commit/05e9cd64ee23bbadcea6bcffd6660ed02b8eab89]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ config.c          |  2 +-
+ t/t1300-config.sh | 10 ++++++++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/config.c b/config.c
+index 6a01938..4fbff51 100644
+--- a/config.c
++++ b/config.c
+@@ -2756,7 +2756,7 @@ static ssize_t write_pair(int fd, const char *key, const char *value,
+	if (value[0] == ' ')
+		quote = "\"";
+	for (i = 0; value[i]; i++)
+-		if (value[i] == ';' || value[i] == '#')
++		if (value[i] == ';' || value[i] == '#' || value[i] == '\r')
+			quote = "\"";
+	if (i && value[i - 1] == ' ')
+		quote = "\"";
+diff --git a/t/t1300-config.sh b/t/t1300-config.sh
+index b07feb1..49f4971 100755
+--- a/t/t1300-config.sh
++++ b/t/t1300-config.sh
+@@ -2417,5 +2417,15 @@ test_expect_success '--get and --get-all with --fixed-value' '
+	git config --file=config --get-regexp --fixed-value fixed+ "$META" &&
+	test_must_fail git config --file=config --get-regexp --fixed-value fixed+ non-existent
+ '
++test_expect_success 'writing value with trailing CR not stripped on read' '
++       test_when_finished "rm -rf cr-test" &&
++
++       printf "bar\r\n" >expect &&
++       git init cr-test &&
++       git -C cr-test config set core.foo $(printf "bar\r") &&
++       git -C cr-test config get core.foo >actual &&
++
++       test_cmp expect actual
++'
+
+ test_done
+--
+2.40.0
diff --git a/meta/recipes-devtools/git/git_2.35.7.bb b/meta/recipes-devtools/git/git_2.35.7.bb
index 3520b4db90..2079c3ddc8 100644
--- a/meta/recipes-devtools/git/git_2.35.7.bb
+++ b/meta/recipes-devtools/git/git_2.35.7.bb
@@ -27,6 +27,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://CVE-2024-50349-0002.patch \
            file://CVE-2024-52006.patch \
            file://CVE-2025-27614-CVE-2025-27613-CVE-2025-46334-CVE-2025-46835.patch \
+           file://CVE-2025-48384.patch \
            "
 
 S = "${WORKDIR}/git-${PV}"
-- 
2.43.0


