Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1EE3178CA4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 18:15:18 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id x5-v6so1454881pgp.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 11:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=B/V+JmxkbciLw6J8u5K7eBR+6d7eCWvKyHqMyE3bDWc=;
	b=KApL5/RfUkpR4DLu1qsf66/L+GnkiYvIqAgyiC6stlfyMpeLsVojPrlQb0JzetvTvG
	5ORiLTyDyxIGCLTxvGOg0c59Ci/uFbQGBGvKCceUDKAYYwaUqg8IM7RYq5l9WvIp5m/r
	tosRKEToyfOEy6QkW7ndlJfhr7faJzwBhx9ilHfGVtHhhIxCk2w+AkKMTHhAFbt5/iXK
	B8OF1Z7pxTW5uQjZy8Xsrc8TRiJ5odcpua8/WNf7C7X7EdmNokWj/M8yVSDqmfDqXTt9
	cusTXHpgHEs920RLjDceTu5ZFWoFPpRAuDRJLv55lEhGNefU5tE+YxXO1GEIFQPrZl+i
	YbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=B/V+JmxkbciLw6J8u5K7eBR+6d7eCWvKyHqMyE3bDWc=;
	b=YBRbJKjJOp9oTjr8lGliktvAIaJqVLLbUcrTHQt+q387CHF6TkOiUxf0l4+AziwXDx
	CzrJnAKVInXhvPTOg5lLRsnhh9HRAFYd8+KI4SVjZMyzSu0sX8Y0Wj041TRJONb3kCGV
	sHUnbOLEjudFFDEbAdXPOurUBWsbQObz5BgAz4clcvB/Cg1ltkZg65gDmN0798hYKroP
	u5rl+czKmndEzRpn1CBbZiv879dFuXydwXnoLkIO02H8dPHb52UD458B7jjQO+UxWpcH
	7pjLIh+gDqfiV2yMwmlQFFhgCFru33GqZfZfxLO+2bxHdpyBWPMjlHQ0NWGUbTwCyzAx
	IBaA==
X-Gm-Message-State: AOUpUlGiFeH0dhOBkB1BZgYCJQmrfFAO1OsDw8iFAigRndpKhclkLuxi
	XnWSglnd5lLwS1SFmHZ90PawTbUU
X-Google-Smtp-Source: AA+uWPwNqzBGaiNa8uJDcYfN9prbs8fR/bQIdk9GoJ4Z9aqqVroxC9MTi92biY1c0vWsjJ7IFlqJqA==
X-Received: by 2002:a62:83ca:: with SMTP id
	h193-v6mr4037577pfe.79.1533752118908; 
	Wed, 08 Aug 2018 11:15:18 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	b21-v6sm13777990pfe.148.2018.08.08.11.15.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 11:15:18 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 11:15:12 -0700
Message-Id: <1533752112-4120-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] openssl_1.0: drop unnecessary call to perlpath.pl from do_configure()
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
X-List-Received-Date: Wed, 08 Aug 2018 18:15:18 -0000

The perlpath.pl script is used to patch the #! lines in all perl
scripts in the utils directory. However, as these scripts are run via
e.g. "perl foo.pl", they don't actually rely on the #! path to be
correct (which can be confirmed by the observation that the path is
currently being set to ${STAGING_BINDIR_NATIVE}/perl, which doesn't
exist).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---

v2: resend via the correct mail server.

 .../openssl/openssl-1.0.2o/find.pl                 | 54 ----------------------
 .../openssl-util-perlpath.pl-cwd.patch             | 34 --------------
 .../recipes-connectivity/openssl/openssl_1.0.2o.bb |  5 --
 3 files changed, 93 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2o/find.pl
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl-util-perlpath.pl-cwd.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/find.pl b/meta/recipes-connectivity/openssl/openssl-1.0.2o/find.pl
deleted file mode 100644
index 8e1b42c..0000000
--- a/meta/recipes-connectivity/openssl/openssl-1.0.2o/find.pl
+++ /dev/null
@@ -1,54 +0,0 @@
-warn "Legacy library @{[(caller(0))[6]]} will be removed from the Perl core distribution in the next major release. Please install it from the CPAN distribution Perl4::CoreLibs. It is being used at @{[(caller)[1]]}, line @{[(caller)[2]]}.\n";
-
-# This library is deprecated and unmaintained. It is included for
-# compatibility with Perl 4 scripts which may use it, but it will be
-# removed in a future version of Perl. Please use the File::Find module
-# instead.
-
-# Usage:
-#	require "find.pl";
-#
-#	&find('/foo','/bar');
-#
-#	sub wanted { ... }
-#		where wanted does whatever you want.  $dir contains the
-#		current directory name, and $_ the current filename within
-#		that directory.  $name contains "$dir/$_".  You are cd'ed
-#		to $dir when the function is called.  The function may
-#		set $prune to prune the tree.
-#
-# For example,
-#
-#   find / -name .nfs\* -mtime +7 -exec rm -f {} \; -o -fstype nfs -prune
-#
-# corresponds to this
-#
-#	sub wanted {
-#	    /^\.nfs.*$/ &&
-#	    (($dev,$ino,$mode,$nlink,$uid,$gid) = lstat($_)) &&
-#	    int(-M _) > 7 &&
-#	    unlink($_)
-#	    ||
-#	    ($nlink || (($dev,$ino,$mode,$nlink,$uid,$gid) = lstat($_))) &&
-#	    $dev < 0 &&
-#	    ($prune = 1);
-#	}
-#
-# Set the variable $dont_use_nlink if you're using AFS, since AFS cheats.
-
-use File::Find ();
-
-*name		= *File::Find::name;
-*prune		= *File::Find::prune;
-*dir		= *File::Find::dir;
-*topdir		= *File::Find::topdir;
-*topdev		= *File::Find::topdev;
-*topino		= *File::Find::topino;
-*topmode	= *File::Find::topmode;
-*topnlink	= *File::Find::topnlink;
-
-sub find {
-    &File::Find::find(\&wanted, @_);
-}
-
-1;
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl-util-perlpath.pl-cwd.patch b/meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl-util-perlpath.pl-cwd.patch
deleted file mode 100644
index 065b9b1..0000000
--- a/meta/recipes-connectivity/openssl/openssl-1.0.2o/openssl-util-perlpath.pl-cwd.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e427748f3bb5d37e78dc8d70a558c373aa8ababb Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 19 Sep 2016 22:06:28 -0700
-Subject: [PATCH] util/perlpath.pl: make it work when cwd is not in @INC
-
-Fixed when building on Debian-testing:
-| Can't locate find.pl in @INC (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.22.2 /usr/local/share/perl/5.22.2 /usr/lib/x86_64-linux-gnu/perl5/5.22 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl/5.22 /usr/share/perl/5.22 /usr/local/lib/site_perl /usr/lib/x86_64-linux-gnu/perl-base) at perlpath.pl line 7.
-
-The find.pl is added by oe-core, so once openssl/find.pl is removed,
-then this patch can be dropped.
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- util/perlpath.pl | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/util/perlpath.pl b/util/perlpath.pl
-index a1f236b..5599892 100755
---- a/util/perlpath.pl
-+++ b/util/perlpath.pl
-@@ -4,6 +4,8 @@
- # line in all scripts that rely on perl.
- #
- 
-+BEGIN { unshift @INC, "."; }
-+
- require "find.pl";
- 
- $#ARGV == 0 || print STDERR "usage: perlpath newpath  (eg /usr/bin)\n";
--- 
-2.9.0
-
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index 78c8552..8ba03b6 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -14,7 +14,6 @@ DEPENDS_append_class-target = " openssl-native"
 PROVIDES += "openssl10"
 
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
-           file://find.pl;subdir=openssl-${PV}/util/ \
            file://run-ptest \
            file://openssl-c_rehash.sh \
            file://configure-targets.patch \
@@ -39,7 +38,6 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://ptest_makefile_deps.patch \
            file://configure-musl-target.patch \
            file://parallel.patch \
-           file://openssl-util-perlpath.pl-cwd.patch \
            file://Use-SHA256-not-MD5-as-default-digest.patch \
            file://0001-Fix-build-with-clang-using-external-assembler.patch \
            file://0001-openssl-force-soft-link-to-avoid-rare-race.patch \
@@ -102,9 +100,6 @@ do_configure () {
 		bbfatal "The perl module 'bignum' was not found but this is required to build openssl.  Please install this module (often packaged as perl-bignum) and re-run bitbake."
 	fi
 
-	cd util
-	perl perlpath.pl ${STAGING_BINDIR_NATIVE}
-	cd ..
 	ln -sf apps/openssl.pod crypto/crypto.pod ssl/ssl.pod doc/
 
 	os=${HOST_OS}
-- 
1.9.1


