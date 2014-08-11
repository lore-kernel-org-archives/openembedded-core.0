Return-Path: <joaohf@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7A3AC70B2A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 02:44:49 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 131so5585623ykp.28
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 19:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=AQmZNc3rIbk7GJ0FEnuPTxoJd0i1uXCfBFsvOqEqBns=;
	b=K5wc85y/obbFeP4PDAdSms1hCUK5F1ejZG8UCcv24RFfm0FDwBWTwRXYLZH4LIRg5T
	88mfhiNJ/BCgWOojPRaBlaShUvyJsWEevQ4/FymD5WKkaj1HcOPndUDXCjCq7p1SckpP
	Jm7ApRwL+7XWoSnpOCVwmoCJe0yZsnM8oeDGE7zi7QxF/aO28dD+YyqcTJxbSs8NLEM3
	qYRq6eJpoCwWlr6Kkk5u1SnQMoQWUgpaVla7qIIhmFsDa9+QIVDxfs7g3HSBeKaRVew5
	xAnRVOSu744wuykPCZ9zF61qNX2HgA4yNPeirfFPXtTTXagvFm3uYRiXRKNwAv9kFmsx
	MWpA==
X-Received: by 10.236.23.163 with SMTP id v23mr27390784yhv.52.1407725091143;
	Sun, 10 Aug 2014 19:44:51 -0700 (PDT)
Received: from localhost.localdomain ([201.53.208.133])
	by mx.google.com with ESMTPSA id
	v64sm21037728yhc.55.2014.08.10.19.44.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Aug 2014 19:44:50 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Aug 2014 23:44:06 -0300
Message-Id: <1407725046-16711-2-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1407725046-16711-1-git-send-email-joaohf@gmail.com>
References: <1407725046-16711-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Subject: [daisy][PATCH] libxml-parser-perl: remove rpath
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
X-List-Received-Date: Mon, 11 Aug 2014 02:44:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When building for two MACHINES using the same TMPDIR, the last one
will claims about libxml-parser-perl contains bad RPATH.

This remove $expat_libpath from $libs.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 .../perl/libxml-parser-perl-2.41/makefile_pl_rpath.patch   | 14 ++++++++++++++
 meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb      |  4 +++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/perl/libxml-parser-perl-2.41/makefile_pl_rpath.patch

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl-2.41/makefile_pl_rpath.patch b/meta/recipes-devtools/perl/libxml-parser-perl-2.41/makefile_pl_rpath.patch
new file mode 100644
index 0000000..9cae967
--- /dev/null
+++ b/meta/recipes-devtools/perl/libxml-parser-perl-2.41/makefile_pl_rpath.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Index: XML-Parser-2.41/Expat/Makefile.PL
+===================================================================
+--- XML-Parser-2.41.orig/Expat/Makefile.PL	2011-05-25 00:33:32.000000000 -0300
++++ XML-Parser-2.41/Expat/Makefile.PL	2014-07-20 18:28:39.074911980 -0300
+@@ -7,7 +7,6 @@
+ 
+ push(@extras, INC => "-I$expat_incpath") if $expat_incpath;
+ 
+-$libs = "-L$expat_libpath $libs" if $expat_libpath;
+ 
+ push(@extras, CAPI => 'TRUE')
+     if (($PERL_VERSION >= 5.005) and ($OSNAME eq 'MSWin32')
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
index 43a8a84..19b47e5 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb
@@ -7,7 +7,9 @@ DEPENDS += "expat expat-native"
 
 PR = "r3"
 
-SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz"
+SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz \
+        file://makefile_pl_rpath.patch"
+
 SRC_URI[md5sum] = "c320d2ffa459e6cdc6f9f59c1185855e"
 SRC_URI[sha256sum] = "b48197cd2265a26c5f016489f11a7b450d8833cb8b3d6a46ee15975740894de9"
 
-- 
1.9.1


