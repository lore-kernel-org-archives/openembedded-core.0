Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1B37478F1A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 14:28:37 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id c13-v6so14488881wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 07:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=T8/H6Cdmo29s3/zzME/+icb1o9jm49Nnlz+Fjl+C454=;
	b=L0lttXOWUI5nFJl6pozOY4y9/ORohkcVrSBhsJP9gWaPdsd2vmFdef22CF0SaHrku5
	BfPUMok0ZWjA+Oj2WeW5sND2L00KIPVh5qBWoVdLHsjLIh6tnFZzVoOugdEK77u+sifE
	QcKPuirw3jy2ErpqpG+ZjLzQE5SqyrcQvTC/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=T8/H6Cdmo29s3/zzME/+icb1o9jm49Nnlz+Fjl+C454=;
	b=N+sFGOUouDdsouueiWh26TxA4TTBom9L/IHe8kbxX2Zs7g2nvyI6JKJh5cSjLNPdgY
	E4ZzqZNtdToXAFQ/fqhZv3O9b3+UcDOvTps7Lr1T1sqTdF3ndS9oqXsFqkGlDpKNxySr
	6qZofunuJVU04xC4CRqn7hj7Tw06VwmI4ez57mYbr7AOxJ364CDWlcf5q2k54wxt2hFa
	Os46pvh2+tHiaAiAZinXu4f8AhLDm0dmSuyoJvP7k7vcYjkdnDicXfCOkwnM6iBQT21q
	fKSf2h4lYLhkBWP+LZAg8aWYR8EZxRsF1BXTdFRuDoSZ6zQh2ozh7uWfsphX3VVr9ngf
	dqwg==
X-Gm-Message-State: AOUpUlEJ92ZPhCbAaP4gvHAfYGkE4jei0onHNAkxHFKp5raBUuA4dp0Q
	VQ/GiESTj7HrHOL/6C1c3KnRRSh/SO0=
X-Google-Smtp-Source: AA+uWPxtNpbUgElhRQyfompCAVnNHFOXzAWMOmWs6fC6WDYqzTJr+QgjYrzNp4qnEUL6WkNUmSjRYQ==
X-Received: by 2002:adf:8004:: with SMTP id
	4-v6mr11265374wrk.130.1534170517589; 
	Mon, 13 Aug 2018 07:28:37 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x7-v6sm13488254wrr.95.2018.08.13.07.28.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 07:28:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2018 15:28:29 +0100
Message-Id: <20180813142835.5309-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/7] glibc: Add make-native depends
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
X-List-Received-Date: Mon, 13 Aug 2018 14:28:37 -0000

glibc needs make >= 4 yet some of our build workers have older versions of
make. Add a make-native dependency to work around this until all our supported
distros have a recent version of make.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc-initial.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.28.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-initial.inc b/meta/recipes-core/glibc/glibc-initial.inc
index 28f006fc7f4..d3cfdcc4ccb 100644
--- a/meta/recipes-core/glibc/glibc-initial.inc
+++ b/meta/recipes-core/glibc/glibc-initial.inc
@@ -1,4 +1,4 @@
-DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial libgcc-initial"
+DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial libgcc-initial make-native"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 
 PACKAGES = ""
diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.28.bb
index 906e6c2b622..95e333dd5cb 100644
--- a/meta/recipes-core/glibc/glibc_2.28.bb
+++ b/meta/recipes-core/glibc/glibc_2.28.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=cfc0ed77a9f62fa62eded042ebe31d72 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
       file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
-DEPENDS += "gperf-native bison-native"
+DEPENDS += "gperf-native bison-native make-native"
 
 SRCREV ?= "3c03baca37fdcb52c3881e653ca392bba7a99c2b"
 
-- 
2.17.1


