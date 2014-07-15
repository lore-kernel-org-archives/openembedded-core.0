Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id E21547022A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 16:18:50 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id l18so5756756wgh.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 09:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=S1oe72eb2kgtkoTsqiSi6l1hnki0yNUieNRQ8P5xnkc=;
	b=hXyFvt1e2InWQNhhvg4MRg2r6dzq5OhXkpExpyJRmYDvoSA6Vcehz8CaSJiWevomu+
	LYN1QqRkpPM8DIZNEL+C2BuGEZ7riMnGRq8Ve2SRGy++4OYZDW30M/xnB+LqAbkcujG1
	+gxgclJEf9zXQwxN86O6UWbXWaaboJVPetzc8NSuFOS1I+Q3eMH+jsUE293c1lLAaUtS
	QGomnxg36sneYR1o01nisjRFwbXB/A4Hiywlb9u43N+vInXq8gZIf1+XnxVANDro1EOs
	7FGEv9LMF76JlnxHY6Y7yipb0dDY9bifbjWizvpN/T3dt/Lvd8UrestfduzwWbBiyijo
	teAg==
X-Gm-Message-State: ALoCoQlln7R/m19+rpJWBDPRgC12eqzRFW+4u7kefYa4pJynPILV2XHMV+PUjUZ5fDbDvfEKqslm
X-Received: by 10.180.102.100 with SMTP id fn4mr7003303wib.22.1405441131408;
	Tue, 15 Jul 2014 09:18:51 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	au7sm33554040wjc.41.2014.07.15.09.18.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 09:18:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 17:18:37 +0100
Message-Id: <406153008dc78f4e3198c012f2db98fcac09b5c1.1405440532.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1405440532.git.ross.burton@intel.com>
References: <cover.1405440532.git.ross.burton@intel.com>
In-Reply-To: <cover.1405440532.git.ross.burton@intel.com>
References: <cover.1405440532.git.ross.burton@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 7/7] autoconf: remove automake patch enforcing --foreign
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
X-List-Received-Date: Tue, 15 Jul 2014 16:18:51 -0000

Since 2004 we've been carrying a patch[1] make autoreconf pass --foreign to
automake.  Presumably at the time this was due to many upstreams using
hand-coded bootstrap scripts that passed --foreign manually, but we were using
autoreconf.  These days many projects have added foreign to AM_INIT_AUTOMAKE and
use autoreconf directly, so this patch isn't as critical as it used to be.

Signed-off-by: Ross Burton <ross.burton@intel.com>

[1] oe-classic 2ab2a92eadaf2f80410d8746099f8a9b1b81ff91
---
 .../autoconf/autoconf/autoreconf-foreign.patch            |   13 -------------
 meta/recipes-devtools/autoconf/autoconf_2.69.bb           |    1 -
 2 files changed, 14 deletions(-)
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/autoreconf-foreign.patch

diff --git a/meta/recipes-devtools/autoconf/autoconf/autoreconf-foreign.patch b/meta/recipes-devtools/autoconf/autoconf/autoreconf-foreign.patch
deleted file mode 100644
index 88f7501..0000000
--- a/meta/recipes-devtools/autoconf/autoconf/autoreconf-foreign.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Upstream-Status: Pending
-
---- autoconf-2.59/bin/autoreconf.in~autoreconf-foreign	2004-05-09 20:55:06.000000000 -0400
-+++ autoconf-2.59/bin/autoreconf.in	2004-05-09 20:55:55.000000000 -0400
-@@ -184,6 +184,8 @@
- 
-   $aclocal_supports_force = `$aclocal --help` =~ /--force/;
- 
-+  $automake   .= ' --foreign';
-+
-   # Dispatch autoreconf's option to the tools.
-   # --include;
-   $autoconf   .= join (' --include=', '', @include);
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.69.bb b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
index 5c652d4..6614a7b 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.69.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 SRC_URI += "file://autoreconf-include.patch \
 	    file://check-automake-cross-warning.patch \
 	    file://autoreconf-exclude.patch \
-	    file://autoreconf-foreign.patch \
 	    file://autoreconf-gnuconfigize.patch \
             file://config_site.patch \
             file://remove-usr-local-lib-from-m4.patch \
-- 
1.7.10.4


