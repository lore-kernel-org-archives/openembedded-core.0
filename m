Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web08.342.1606846332590679527
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 10:12:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=baJdfoxy;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=axis.com; l=1974; q=dns/txt; s=axis-central1;
  t=1606846334; x=1638382334;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=XpRgMw26Pycip8ZVV71rXokB8QguyY5YaLsZIMyMZ8A=;
  b=baJdfoxyEbsXLrrYXOulJzSX514XIxwM9/Ki/0JdQtBzcz/uQm8TevAQ
   h5qhRy9Y8j+ae7VrxWc4GPeHecmVgnkxMNXt/aiI2cEi2o1bkJKTFUhXz
   wOhu/VOkW6bFB/+8JoHvqGhTe5GeFjSx9+lxfaawEm2hJjlirX7XNZeZP
   J+REW4G1BsfVsxQKR0ZoNp2+3WR3kbv7hRd5rpWXxwBP3ycRgiS9ZnHKT
   fENcHGjHoSNFkP4lSZV2Rv519UzVz1mueYXWpYNdFoMYI+R/qhhLZC/f8
   unMX9t7sHrYkDv+HETolVnFL2WTc7HBnqZKnSVDpyaSmHsXtiMXIRvg4S
   w==;
IronPort-SDR: 3lcTIvgAYLGal8HqQHDJIYscVlCI4hnqbJ9DUVVBVSDWNn6W/l0eDciwp+eUYz3Y8desEh8IyQ
 l0GNq8zQ9dxCax8sK/vR0Y+EuhZDCcOaHuB+fvyEmdBML5NbbwMGhECH+W5fNWKEjzKWKswu8O
 ggylfZq0G6jtUway6ILa+aCszvR0njr+H87YCagtINvpss8pRBhSmIW4J+AcAASYLfJ3llaUDE
 Cy4URylkL1tPqfJUBBhZwkvkBI8gv5F6Qt9MLJrSDG886+0nlABTefw2qjIL//4HSKFdkVQ5k/
 KqU=
X-IronPort-AV: E=Sophos;i="5.78,385,1599516000"; 
   d="scan'208";a="15621785"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv3 4/5] bitbake.conf: Canonicalize paths in PSEUDO_IGNORE_PATHS
Date: Tue, 1 Dec 2020 19:11:50 +0100
Message-ID: <0950f9eb62590e6ea7cd2be8d4882d97aaa34caf.1606846217.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <cover.1606846217.git.pkj@axis.com>
References: <cover.1606846217.git.pkj@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Use oe.path.canonicalize() to canonicalize the paths in
PSEUDO_IGNORE_PATHS before passing them to pseudo. This is needed since
pseudo will compare them to paths that are canonicalized.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9742fe4fe2..a353dc5d6b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -691,9 +691,9 @@ export PSEUDO_DISABLED = "1"
 #export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
 #export PSEUDO_BINDIR = "${STAGING_DIR_NATIVE}${bindir_native}"
 #export PSEUDO_LIBDIR = "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib
-FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_PATHS} PSEUDO_DISABLED=1"
+FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=1"
 FAKEROOTCMD = "${PSEUDO_SYSROOT}${bindir_native}/pseudo"
-FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${PSEUDO_IGNORE_PATHS} PSEUDO_DISABLED=0"
+FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=0"
 FAKEROOTNOENV = "PSEUDO_UNLOAD=1"
 FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
 PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
