Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9857A65F67
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 05:07:49 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id v10so1379325pde.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 May 2014 22:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SA9LD9ITezy+k1h83EarP+38GhJaJLgKzJjmqXXn0m0=;
	b=KaJauB8XFRWa1gVqTRcwnaqbbHV0v05H1ZZhllPXmUlwsXt4hQeGtPM6TshcRsZio/
	rMrlPVRmqr5XA/0dw6LIXS3+O8TSWSNpsoHs+PDIi4ecr43M3m7Ec2xQgY0fUfMpMsli
	dDEUvKpVLH9ByhkUkX9BU10U6mp+W/xFEw5vMXPL7jlZraMk6u9DUe9CbhEqeg4kt0J9
	xKNJlDiUKSOjH6IVRmQ8WnBg/SAitKs9R7TIQuEOj3fWtRRRioqfG7AvZdXRoZzv+oVv
	JIxLrz+9c+T7NET436msEwwz4pSNIZMHTA67z1Hyru5AcozS7nTEQxXkisLCGnBOVVmk
	gDVA==
X-Received: by 10.66.149.102 with SMTP id tz6mr2223363pab.76.1399352870456;
	Mon, 05 May 2014 22:07:50 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	pb7sm88200505pac.10.2014.05.05.22.07.48 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Mon, 05 May 2014 22:07:49 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 May 2014 22:09:13 -0700
Message-Id: <1399352953-1425-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] perl: fix missing Module::Metadata
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
X-List-Received-Date: Tue, 06 May 2014 05:07:51 -0000

From: Tim Orling <TicoTimo@gmail.com>

Module::Build depends on Module::Metadata (since perl 5.13.9).
Module::Metainfo is only a wrapper for Module::Metadata.

See discussion in http://patches.openembedded.org/patch/66233/

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta/recipes-devtools/perl/perl-5.14.3/config.sh    | 2 +-
 meta/recipes-devtools/perl/perl-rdepends_5.14.3.inc | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl-5.14.3/config.sh b/meta/recipes-devtools/perl/perl-5.14.3/config.sh
index dc507cf..68dcfa9 100644
--- a/meta/recipes-devtools/perl/perl-5.14.3/config.sh
+++ b/meta/recipes-devtools/perl/perl-5.14.3/config.sh
@@ -856,7 +856,7 @@ FileCache Filter/Simple Getopt/Long HTTP/Tiny I18N/Collate I18N/LangTags \
 IO/Compress IO/Zlib IPC/Cmd IPC/Open2 IPC/Open3 JSON/PP Locale/Codes \
 Locale/Maketext Locale/Maketext/Simple Log/Message Log/Message/Simple \
 Math/BigInt Math/BigRat Math/Complex Memoize Module/Build Module/CoreList \
-Module/Load Module/Load/Conditional Module/Loaded Module/Pluggable NEXT Net/Ping \
+Module/Load Module/Load/Conditional Module/Loaded Module/Metadata Module/Pluggable NEXT Net/Ping \
 Object/Accessor Package/Constants Params/Check Parse/CPAN/Meta Perl/OSType \
 PerlIO/via/QuotedPrint Pod/Escapes Pod/Html Pod/LaTeX Pod/Parser Pod/Perldoc \
 Pod/Plainer Pod/Simple Safe SelfLoader Shell Switch Term/ANSIColor Term/Cap \
diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.14.3.inc b/meta/recipes-devtools/perl/perl-rdepends_5.14.3.inc
index 62712ed..8b2a040 100644
--- a/meta/recipes-devtools/perl/perl-rdepends_5.14.3.inc
+++ b/meta/recipes-devtools/perl/perl-rdepends_5.14.3.inc
@@ -237,6 +237,7 @@ RDEPENDS_${PN}-module-build += "${PN}-module-getopt-long"
 RDEPENDS_${PN}-module-build += "${PN}-module-inc-latest"
 RDEPENDS_${PN}-module-build += "${PN}-module-io-file"
 RDEPENDS_${PN}-module-build += "${PN}-module-build"
+RDEPENDS_${PN}-module-build += "${PN}-module-metadata"
 RDEPENDS_${PN}-module-build += "${PN}-module-pod-man"
 RDEPENDS_${PN}-module-build += "${PN}-module-strict"
 RDEPENDS_${PN}-module-build += "${PN}-module-tap-harness"
-- 
1.8.3.2


