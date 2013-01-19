Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TwiPB-0001Oh-T5 for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 01:05:19 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0JNnVRK004747
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 23:49:31 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04712-02 for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 23:49:28 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0JNnNOI004741
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 23:49:24 GMT
Message-ID: <1358639364.14265.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 19 Jan 2013 23:49:24 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] perl: Add dyanloader build hack
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Jan 2013 00:05:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Patch perl to allow builds to work where a native perl running against target modules
attempts to load a dynamic binary module. We assume that a native version of the
module exists as it would for the target and perform an appropriate path
substitution.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/dynaloaderhack.patch b/meta/recipes-devtools/perl/perl-5.14.2/dynaloaderhack.patch
new file mode 100644
index 0000000..c3e17f8
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.14.2/dynaloaderhack.patch
@@ -0,0 +1,23 @@
+Hack the dynamic module loader so that we use native modules since we can't load
+the target ones.
+
+Upsteam-Status: Inappropriate
+
+RP
+2013/01/13
+
+Index: perl-5.14.2/ext/DynaLoader/DynaLoader_pm.PL
+===================================================================
+--- perl-5.14.2.orig/ext/DynaLoader/DynaLoader_pm.PL	2011-09-19 13:18:22.000000000 +0000
++++ perl-5.14.2/ext/DynaLoader/DynaLoader_pm.PL	2013-01-19 16:09:51.020584945 +0000
+@@ -310,6 +310,10 @@
+     foreach (@INC) {
+ 	<<$^O-eq-VMS>>chop($_ = VMS::Filespec::unixpath($_));<</$^O-eq-VMS>>
+ 	    my $dir = "$_/auto/$modpname";
++
++	if (defined $ENV{PERL_LIB} and defined $ENV{PERLHOSTLIB}) {
++	    $dir =~ s/$ENV{PERL_LIB}/$ENV{PERLHOSTLIB}/g;
++	}
+ 	
+ 	next unless -d $dir; # skip over uninteresting directories
+ 	
diff --git a/meta/recipes-devtools/perl/perl-native_5.14.2.bb b/meta/recipes-devtools/perl/perl-native_5.14.2.bb
index 60fcc18..9a066e2 100644
--- a/meta/recipes-devtools/perl/perl-native_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.14.2.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
            file://native-perlinc.patch \
            file://MM_Unix.pm.patch \
            file://debian/errno_ver.diff \
+           file://dynaloaderhack.patch \
            file://perl-build-in-t-dir.patch"
 
 SRC_URI[md5sum] = "3306fbaf976dcebdcd49b2ac0be00eb9"
diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index f924ebd..ddc9568 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -67,6 +67,7 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
 	file://fix_bad_rpath.patch \
 	file://perl-build-in-t-dir.patch \
 	file://perl-archlib-exp.patch \
+	file://dynaloaderhack.patch \
 	\
         file://config.sh \
         file://config.sh-32 \




