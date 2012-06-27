Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dennis.yxun@gmail.com>) id 1Sk0St-0002Tb-OP
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 00:11:59 +0200
Received: by pbbrq2 with SMTP id rq2so2089681pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 15:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=9Pis4Jd5GEz9zm/yxfuSrq6MIbPWT4PpcfpoWgnqNFY=;
	b=Fs9Zt1znzYzQpjedWXiQ5c9zFIdx3CtZiX+13AYuA9QMIA7bS69q/dICiLFLY49koQ
	iUejeF/kShHYedwzwsxxE1owfawY8kdoUBycFu2XJkCpgELv2HECSMOiAP9rkdVmr5vl
	GFSdjXH4PkynRGK0N1cMQlNytKHhLJfXEJso5Y7WBLPXgrGARMKPkKcyikV4l5S4ls65
	zcs5dpMIrcPkTA1WQIDszj+nMXI6aKq4xfLaSCM1jpjIFoXAWl1bEUobG5Q3V0qBEODL
	fm3BJNBleZ3UsELl1goEggdKL4UdjH9VzxLup+VepA2R3LZrxLl/VSEhp/e1oqrTyO53
	3Ccg==
Received: by 10.68.233.225 with SMTP id tz1mr70006103pbc.4.1340834464854;
	Wed, 27 Jun 2012 15:01:04 -0700 (PDT)
Received: from localhost.localdomain ([58.34.254.235])
	by mx.google.com with ESMTPS id tk1sm16347706pbc.8.2012.06.27.15.01.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jun 2012 15:01:04 -0700 (PDT)
From: Dennis Lan <dennis.yxun@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2012 05:53:24 +0800
Message-Id: <1340834004-3614-1-git-send-email-dennis.yxun@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <dennis.yxun@gmail.com>
References: <dennis.yxun@gmail.com>
Subject: [PATCH] openjade-native: Use Getopt::Std in place of getopts.pl.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jun 2012 22:12:00 -0000

Using Gentoo Linux as the build host, it fails without this patch
https://bugs.gentoo.org/show_bug.cgi?id=420083

which following error:

/usr/bin/perl -w ./../msggen.pl -l jstyleModule InterpreterMessages.msg
/usr/bin/perl -w ./../msggen.pl -l jstyleModule DssslAppMessages.msg
Undefined subroutine &main::Getopts called at ./../msggen.pl line 22.
make[2]: *** [InterpreterMessages.h] Error 2
make[2]: *** Waiting for unfinished jobs....
Undefined subroutine &main::Getopts called at ./../msggen.pl line 22.
make[2]: *** [DssslAppMessages.h] Error 2
---
 .../openjade/openjade-1.3.2/msggen.pl.patch        |   32 ++++++++++++++++++++
 .../openjade/openjade-native_1.3.2.bb              |    1 +
 2 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch

diff --git a/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch b/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch
new file mode 100644
index 0000000..1afe68b
--- /dev/null
+++ b/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch
@@ -0,0 +1,32 @@
+Use Getopt::Std in place of getopts.pl.
+https://bugs.gentoo.org/show_bug.cgi?id=420083
+
+--- a/msggen.pl
++++ b/msggen.pl
+@@ -4,6 +4,7 @@
+ # See the file COPYING for copying permission.
+ 
+ use POSIX;
++use Getopt::Std;
+ 
+ # Package and version.
+ $package = 'openjade';
+@@ -18,8 +19,7 @@
+ undef $opt_l;
+ undef $opt_p;
+ undef $opt_t;
+-do 'getopts.pl';
+-&Getopts('l:p:t:');
++getopts('l:p:t:');
+ $module = $opt_l;
+ $pot_file = $opt_p;
+ 
+@@ -72,7 +72,7 @@
+     else {
+ 	$field[0] =~ /^[IWQXE][0-9]$/ || &error("invalid first field");;
+ 	$type[$num] = substr($field[0], 0, 1);
+-	$argc = int(substr($field[0], 1, 1));
++	$argc = substr($field[0], 1, 1);
+     }
+     $nargs[$num] = $argc;
+     $field[1] =~ /^[a-zA-Z_][a-zA-Z0-9_]+$/ || &error("invalid tag");
diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
index 5b29c1f..efd1e11 100644
--- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
+++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
@@ -14,6 +14,7 @@ RDEPENDS_${PN} = "sgml-common-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
            file://makefile.patch \
+           file://msggen.pl.patch \
            file://reautoconf.patch \
 	   file://user-declared-default-constructor.patch"
 
-- 
1.7.8.6



