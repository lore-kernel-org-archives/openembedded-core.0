Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Li.Wang@windriver.com>) id 1Tj0aZ-0006iv-E8
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 05:40:05 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBD4PT6p021856
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 20:25:29 -0800 (PST)
Received: from pek-lpgbuild4.wrs.com (128.224.153.32) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 12 Dec 2012 20:25:28 -0800
From: Li Wang <li.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Dec 2012 12:25:26 +0800
Message-ID: <1355372726-12845-1-git-send-email-li.wang@windriver.com>
X-Mailer: git-send-email 1.7.11
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	qBD4PT6p021856
Subject: [PATCH] cups: CVE-2012-5519
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
X-List-Received-Date: Thu, 13 Dec 2012 04:40:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

lpadmin to (limited) root privilege escalation
http://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2012-5519
http://www.cups.org/strfiles/4223/str4223v2-1.4.4-debian.patch

[YOCTO #3579]
[ CQID: WIND00392016 ]
Upstream-Status: Backport

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 .../cups/cups-1.4.6/cups-CVE-2012-5519.patch       | 2965 ++++++++++++++=
++++++
 meta/recipes-extended/cups/cups_1.4.6.bb           |    3 +-
 2 files changed, 2967 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/cups/cups-1.4.6/cups-CVE-2012-5=
519.patch

diff --git a/meta/recipes-extended/cups/cups-1.4.6/cups-CVE-2012-5519.pat=
ch b/meta/recipes-extended/cups/cups-1.4.6/cups-CVE-2012-5519.patch
new file mode 100644
index 0000000..6b2887a
--- /dev/null
+++ b/meta/recipes-extended/cups/cups-1.4.6/cups-CVE-2012-5519.patch
@@ -0,0 +1,2965 @@
+#! /bin/sh /usr/share/dpatch/dpatch-run
+## DP: Description: Move file, directory, user, and group configuration =
to a
+## DP:  separate file. Also warn about directives that have moved and se=
t
+## DP:  default cups-files.conf.
+## DP:
+## DP: Author: Michael Sweet <msweet@apple.com>
+## DP: Origin: http://svn.cups.org/public/cups/branches/branch-1.6@10710
+## DP: Origin: http://svn.cups.org/public/cups/branches/branch-1.6@10713
+## DP:
+## DP: Author: Marc Deslauriers <marc.deslauriers@canonical.com>
+## DP: Author: Tim Waugh <twaugh@redhat.com>
+## DP:
+## DP: Bug-Upstream: https://www.cups.org/str.php?L4223
+## DP: Bug-Debian: http://bugs.debian.org/692791
+## DP: Bug-CVE: http://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2012=
-5519
+
+@DPATCH@
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/conf/Makefile cups/conf/Makefile
+--- cups~/conf/Makefile	2012-12-08 00:29:09.000000000 +0100
++++ cups/conf/Makefile	2012-12-08 00:29:10.000000000 +0100
+@@ -19,7 +19,7 @@
+ # Config files...
+ #
+=20
+-KEEP	=3D	cupsd.conf snmp.conf
++KEEP	=3D	cups-files.conf cupsd.conf snmp.conf
+ REPLACE	=3D	mime.convs mime.types
+=20
+=20
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/conf/cups-files.conf.in cups/conf/cups-files.conf.in
+--- cups~/conf/cups-files.conf.in	1970-01-01 01:00:00.000000000 +0100
++++ cups/conf/cups-files.conf.in	2012-12-08 00:29:10.000000000 +0100
+@@ -0,0 +1,98 @@
++#
++# "$Id$"
++#
++# Sample file/directory/user/group configuration file for the CUPS sche=
duler.
++# See "man cups-files.conf" for a complete description of this file.
++#
++
++# List of events that are considered fatal errors for the scheduler...
++#FatalErrors @CUPS_FATAL_ERRORS@
++
++# Default user and group for filters/backends/helper programs; this can=
not be
++# any user or group that resolves to ID 0 for security reasons...
++#User @CUPS_USER@
++#Group @CUPS_GROUP@
++
++# Administrator user group, used to match @SYSTEM in cupsd.conf policy =
rules...
++SystemGroup @CUPS_SYSTEM_GROUPS@
++@CUPS_SYSTEM_AUTHKEY@
++
++# User that is substituted for unauthenticated (remote) root accesses...
++#RemoteRoot remroot
++
++# Do we allow file: device URIs other than to /dev/null?
++#FileDevice No
++
++# Permissions for configuration and log files...
++#ConfigFilePerm @CUPS_CONFIG_FILE_PERM@
++#LogFilePerm @CUPS_LOG_FILE_PERM@
++
++# Location of the file logging all access to the scheduler; may be the =
name
++# "syslog". If not an absolute path, the value of ServerRoot is used as=
 the
++# root directory.  Also see the "AccessLogLevel" directive in cupsd.con=
f.
++AccessLog @CUPS_LOGDIR@/access_log
++
++# Location of cache files used by the scheduler...
++#CacheDir @CUPS_CACHEDIR@
++
++# Location of data files used by the scheduler...
++#DataDir @CUPS_DATADIR@
++
++# Location of the static web content served by the scheduler...
++#DocumentRoot @CUPS_DOCROOT@
++
++# Location of the file logging all messages produced by the scheduler a=
nd any
++# helper programs; may be the name "syslog". If not an absolute path, t=
he value
++# of ServerRoot is used as the root directory.  Also see the "LogLevel"
++# directive in cupsd.conf.
++ErrorLog @CUPS_LOGDIR@/error_log
++
++# Location of fonts used by older print filters...
++#FontPath @CUPS_FONTPATH@
++
++# Location of LPD configuration
++#LPDConfigFile @CUPS_DEFAULT_LPD_CONFIG_FILE@
++
++# Location of the file logging all pages printed by the scheduler and a=
ny
++# helper programs; may be the name "syslog". If not an absolute path, t=
he value
++# of ServerRoot is used as the root directory.  Also see the "PageLogFo=
rmat"
++# directive in cupsd.conf.
++PageLog @CUPS_LOGDIR@/page_log
++
++# Location of the file listing all of the local printers...
++#Printcap @CUPS_DEFAULT_PRINTCAP@
++
++# Format of the Printcap file...
++#PrintcapFormat bsd
++#PrintcapFormat plist
++#PrintcapFormat solaris
++
++# Location of all spool files...
++#RequestRoot @CUPS_REQUESTS@
++
++# Location of helper programs...
++#ServerBin @CUPS_SERVERBIN@
++
++# SSL/TLS certificate for the scheduler...
++#ServerCertificate @CUPS_SERVERCERT@
++
++# SSL/TLS private key for the scheduler...
++#ServerKey @CUPS_SERVERKEY@
++
++# Location of other configuration files...
++#ServerRoot @CUPS_SERVERROOT@
++
++# Location of Samba configuration file...
++#SMBConfigFile @CUPS_DEFAULT_SMB_CONFIG_FILE@
++
++# Location of scheduler state files...
++#StateDir @CUPS_STATEDIR@
++
++# Location of scheduler/helper temporary files. This directory is empti=
ed on
++# scheduler startup and cannot be one of the standard (public) temporar=
y
++# directory locations for security reasons...
++#TempDir @CUPS_REQUESTS@/tmp
++
++#
++# End of "$Id$".
++#
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/conf/cupsd.conf.in cups/conf/cupsd.conf.in
+--- cups~/conf/cupsd.conf.in	2012-12-08 00:29:09.000000000 +0100
++++ cups/conf/cupsd.conf.in	2012-12-08 00:29:10.000000000 +0100
+@@ -13,10 +13,6 @@
+ # LogLevel debug2 gets usable now
+ MaxLogSize 0
+=20
+-# Administrator user group...
+-SystemGroup @CUPS_SYSTEM_GROUPS@
+-@CUPS_SYSTEM_AUTHKEY@
+-
+ # Only listen for connections from the local machine.
+ Listen localhost:@DEFAULT_IPP_PORT@
+ @CUPS_LISTEN_DOMAINSOCKET@
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/config-scripts/cups-defaults.m4 cups/config-scripts/cups-defaults.=
m4
+--- cups~/config-scripts/cups-defaults.m4	2012-12-07 13:00:47.000000000 =
+0100
++++ cups/config-scripts/cups-defaults.m4	2012-12-08 00:29:10.000000000 +=
0100
+@@ -353,6 +353,7 @@
+ fi
+=20
+ AC_DEFINE_UNQUOTED(CUPS_DEFAULT_LPD_CONFIG_FILE, "$CUPS_DEFAULT_LPD_CON=
FIG_FILE")
++AC_SUBST(CUPS_DEFAULT_LPD_CONFIG_FILE)
+=20
+ dnl Default SMB config file...
+ AC_ARG_WITH(smbconfigfile, [  --with-smbconfigfile    set default SMBCo=
nfigFile URI],
+@@ -374,6 +375,7 @@
+ fi
+=20
+ AC_DEFINE_UNQUOTED(CUPS_DEFAULT_SMB_CONFIG_FILE, "$CUPS_DEFAULT_SMB_CON=
FIG_FILE")
++AC_SUBST(CUPS_DEFAULT_SMB_CONFIG_FILE)
+=20
+ dnl Default MaxCopies value...
+ AC_ARG_WITH(max-copies, [  --with-max-copies       set default max copi=
es value, default=3D9999 ],
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/config-scripts/cups-ssl.m4 cups/config-scripts/cups-ssl.m4
+--- cups~/config-scripts/cups-ssl.m4	2012-12-07 13:00:47.000000000 +0100
++++ cups/config-scripts/cups-ssl.m4	2012-12-08 00:29:10.000000000 +0100
+@@ -27,6 +27,8 @@
+ SSLFLAGS=3D""
+ SSLLIBS=3D""
+ have_ssl=3D0
++CUPS_SERVERCERT=3D""
++CUPS_SERVERKEY=3D""
+=20
+ if test x$enable_ssl !=3D xno; then
+     dnl Look for CDSA...
+@@ -36,6 +38,7 @@
+ 	    	have_ssl=3D1
+ 		AC_DEFINE(HAVE_SSL)
+ 		AC_DEFINE(HAVE_CDSASSL)
++		CUPS_SERVERCERT=3D"/Library/Keychains/System.keychain"
+=20
+ 		dnl Check for the various security headers...
+ 		AC_CHECK_HEADER(Security/SecPolicy.h,
+@@ -85,6 +88,9 @@
+ 	fi
+=20
+ 	if test $have_ssl =3D 1; then
++	    CUPS_SERVERCERT=3D"ssl/server.crt"
++	    CUPS_SERVERKEY=3D"ssl/server.key"
++
+             if $PKGCONFIG --exists gcrypt; then
+ 	        SSLLIBS=3D"$SSLLIBS `$PKGCONFIG --libs gcrypt`"
+ 	        SSLFLAGS=3D"$SSLFLAGS `$PKGCONFIG --cflags gcrypt`"
+@@ -122,6 +128,9 @@
+ 		    $libcrypto)
+=20
+ 		if test "x${SSLLIBS}" !=3D "x"; then
++		    CUPS_SERVERCERT=3D"ssl/server.crt"
++		    CUPS_SERVERKEY=3D"ssl/server.key"
++
+ 		    break
+ 		fi
+ 	    done
+@@ -135,6 +144,8 @@
+     AC_MSG_RESULT([    Using SSLFLAGS=3D"$SSLFLAGS"])
+ fi
+=20
++AC_SUBST(CUPS_SERVERCERT)
++AC_SUBST(CUPS_SERVERKEY)
+ AC_SUBST(SSLFLAGS)
+ AC_SUBST(SSLLIBS)
+=20
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/configure.in cups/configure.in
+--- cups~/configure.in	2012-12-07 13:00:47.000000000 +0100
++++ cups/configure.in	2012-12-08 00:29:10.000000000 +0100
+@@ -63,14 +63,14 @@
+ AC_SUBST(UNINSTALL_LANGUAGES)
+=20
+ AC_OUTPUT(Makedefs packaging/cups.list init/cups.sh init/cups-lpd cups-=
config
+-	  conf/cupsd.conf conf/mime.convs conf/pam.std conf/snmp.conf
++	  conf/cups-files.conf conf/cupsd.conf conf/mime.convs conf/pam.std co=
nf/snmp.conf
+ 	  data/testprint
+ 	  desktop/cups.desktop
+ 	  doc/index.html doc/help/ref-cupsd-conf.html doc/help/standard.html
+ 	  init/org.cups.cups-lpd.plist init/cups.xml
+ 	  man/client.conf.man man/cups-deviced.man man/cups-driverd.man
+ 	  man/cups-lpd.man man/cupsaddsmb.man man/cupsd.man
+-	  man/cupsd.conf.man man/lpoptions.man
++	  man/cups-files.conf.man man/cupsd.conf.man man/lpoptions.man
+ 	  templates/header.tmpl
+ 	  $LANGFILES)
+=20
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/doc/help/ref-cups-files-conf.html.in cups/doc/help/ref-cups-files-=
conf.html.in
+--- cups~/doc/help/ref-cups-files-conf.html.in	1970-01-01 01:00:00.00000=
0000 +0100
++++ cups/doc/help/ref-cups-files-conf.html.in	2012-12-08 00:29:10.000000=
000 +0100
+@@ -0,0 +1,531 @@
++<HTML>
++<!-- SECTION: References -->
++<HEAD>
++	<TITLE>cups-files.conf</TITLE>
++	<LINK REL=3D"STYLESHEET" TYPE=3D"text/css" HREF=3D"../cups-printable.c=
ss">
++</HEAD>
++<BODY>
++
++<H1 CLASS=3D"title">cups-files.conf</H1>
++
++<P>The <VAR>/etc/cups/cups-files.conf</VAR> file contains configuration=
 <I>directives</I> that control the files, directories. users. and groups=
 that are used by the CUPS scheduler, <CODE>cupsd(8)</CODE>. Each directi=
ve is listed on a line by itself followed by its value. Comments are intr=
oduced using the number sign ("#") character at the beginning of a line.<=
/P>
++
++<H2 CLASS=3D"title"><A NAME=3D"AccessLog">AccessLog</A></H2>
++
++<H3>Examples</H3>
++
++<PRE CLASS=3D"command">
++AccessLog /var/log/cups/access_log
++AccessLog /var/log/cups/access_log-%s
++AccessLog syslog
++</PRE>
++
++<H3>Description</H3>
++
++<P>The <CODE>AccessLog</CODE> directive sets the name of the
++access log file. If the filename is not absolute then it is
++assumed to be relative to the <A
++HREF=3D"#ServerRoot"><CODE>ServerRoot</CODE></A> directory. The
++access log file is stored in "common log format" and can be used
++by any web access reporting tool to generate a report on CUPS
++server activity.</P>
++
++<P>The server name can be included in the filename by using
++<CODE>%s</CODE> in the name.</P>
++
++<P>The special name "syslog" can be used to send the access
++information to the system log instead of a plain file.</P>
++
++<P>The default access log file is
++<VAR>@CUPS_LOGDIR@/access_log</VAR>.</P>
++
++
++<H2 CLASS=3D"title"><SPAN CLASS=3D"info">CUPS 1.1.15</SPAN><A NAME=3D"C=
onfigFilePerm">ConfigFilePerm</A></H2>
++
++<H3>Examples</H3>
++
++<PRE CLASS=3D"command">
++ConfigFilePerm 0644
++ConfigFilePerm 0640
++</PRE>
++
++<H3>Description</H3>
++
++<P>The <CODE>ConfigFilePerm</CODE> directive specifies the permissions =
to use when the scheduler writes configuration and cache files, typically=
 in response to IPP or HTTP requests. The default is @CUPS_CONFIG_FILE_PE=
RM@.</P>
++
++<BLOCKQUOTE><B>Note:</B>
++
++<P>The permissions for the <VAR>printers.conf</VAR> file are always mas=
ked to only allow access from the scheduler user (typically root). This i=
s done because printer device URIs sometimes contain sensitive authentica=
tion information that should not be generally known on the system. There =
is no way to disable this security feature.</P>
++
++</BLOCKQUOTE>
++
++
++<H2 CLASS=3D"title"><A NAME=3D"DataDir">DataDir</A></H2>
++
++<H3>Examples</H3>
++
++<PRE CLASS=3D"command">
++DataDir /usr/share/cups
++</PRE>
++
++<H3>Description</H3>
++
++<P>The <CODE>DataDir</CODE> directive sets the directory to use
++for data files.</P>
++
++
++<H2 CLASS=3D"title"><SPAN CLASS=3D"info">CUPS 1.2/OS X 10.5</SPAN><A NA=
ME=3D"DefaultAuthType">DefaultAuthType</A></H2>
++
++<H3>Examples</H3>
++
++<PRE CLASS=3D"command">
++DefaultAuthType Basic
++DefaultAuthType BasicDigest
++DefaultAuthType Digest
++DefaultAuthType Negotiate
++</PRE>
++
++<H3>Description</H3>
++
++<P>The <CODE>DefaultAuthType</CODE> directive specifies the type
++of authentication to use for IPP operations that require a
++username. The default is <CODE>Basic</CODE>.</P>
++
++
++<H2 CLASS=3D"title"><A NAME=3D"DocumentRoot">DocumentRoot</A></H2>
++
++<H3>Examples</H3>
++
++<PRE CLASS=3D"command">
++DocumentRoot /usr/share/doc/cups
++DocumentRoot /foo/bar/doc/cups
++</PRE>
++
++<H3>Description</H3>
++
++<P>The <CODE>DocumentRoot</CODE> directive specifies the location
++of web content for the HTTP server in CUPS. If an absolute path
++is not specified then it is assumed to be relative to the <A
++HREF=3D"#ServerRoot"><CODE>ServerRoot</CODE></A> directory. The
++default directory is <VAR>@CUPS_DOCROOT@</VAR>.</P>
++
++<P>Documents are first looked up in a sub-directory for the
++primary language requested by the client (e.g.
++<VAR>@CUPS_DOCROOT@/fr/...</VAR>) and then directly under
++the <CODE>DocumentRoot</CODE> directory (e.g.
++<VAR>@CUPS_DOCROOT@/...</VAR>), so it is possible to
++localize the web content by providing subdirectories for each
++language needed.</P>
++
++
++<H2 CLASS=3D"title"><A NAME=3D"ErrorLog">ErrorLog</A></H2>
++
++<H3>Examples</H3>
++
++<PRE CLASS=3D"command">
++ErrorLog /var/log/cups/error_log
++ErrorLog /var/log/cups/error_log-%s
++ErrorLog syslog
++</PRE>
++
++<H3>Description</H3>
++
++<P>The <CODE>ErrorLog</CODE> directive sets the name of the error
++log file. If the filename is not absolute then it is assumed to
++be relative to the <A
++HREF=3D"#ServerRoot"><CODE>ServerRoot</CODE></A> directory. The
++default error log file is <VAR>@CUPS_LOGDIR@/error_log</VAR>.</P>
++
++<P>The server name can be included in the filename by using
++<CODE>%s</CODE> in the name.</P>
++
++<P>The special name "syslog" can be used to send the error
++information to the system log instead of a plain file.</P>
++
++
++<H2 CLASS=3D"title"><SPAN CLASS=3D"info">CUPS 1.4/OS X 10.6</SPAN><A NA=
ME=3D"FatalErrors">FatalErrors</A></H2>
++
++<H3>Examples</H3>
++
++<PRE CLASS=3D"command">
++FatalErrors none
++FatalErrors all
++FatalErrors browse
++FatalErrors config
++FatalErrors listen
++FatalErrors log
++FatalErrors permissions
++FatalErrors all -permissions
++FatalErrors config permissions log
++</PRE>
++
++<H3>Description</H3>
++
++<P>The <CODE>FatalErrors</CODE> directive determines whether certain ki=
nds of
++errors are fatal. The following kinds of errors are currently recognize=
d:</P>
++
++<UL>
++
++	<LI><CODE>none</CODE> - No errors are fatal</LI>
++
++	<LI><CODE>all</CODE> - All of the errors below are fatal</LI>
++
++	<LI><CODE>browse</CODE> - Browsing initialization errors are fatal,
++	for example failed binding to the CUPS browse port or failed connectio=
ns
++	to LDAP servers</LI>
++
++	<LI><CODE>config</CODE> - Configuration file syntax errors are
++	fatal</LI>
++
++	<LI><CODE>listen</CODE> - Listen or Port errors are fatal, except for
++	IPv6 failures on the loopback or "any" addresses</LI>
++
++	<LI><CODE>log</CODE> - Log file creation or write errors are fatal</LI=
>
++
++	<LI><CODE>permissions</CODE> - Bad startup file permissions are
++	fatal, for example shared SSL certificate and key files with world-
++	read permissions</LI>
++
++</UL>
++
++<P>Multiple errors can be listed, and the form "-kind" can be used with
++<CODE>all</CODE> to remove specific kinds of errors. The default settin=
g is
++<CODE>@CUPS_FATAL_ERRORS@</CODE>.</P>
++
++
++<H2 CLASS=3D"title"><SPAN CLASS=3D"info">CUPS 1.1.18</SPAN><A NAME=3D"F=
ileDevice">FileDevice</A></H2>
++
++<H3>Examples</H3>
++
++<PRE CLASS=3D"command">
++FileDevice Yes
++FileDevice No
++</PRE>
++
++<H3>Description</H3>
++
++<P>The <CODE>FileDevice</CODE> directive determines whether the
++scheduler allows new printers to be added using device URIs of
++the form <CODE>file:/filename</CODE>. File devices are most often
++used to test new printer drivers and do not support raw file
++printing.</P>
++
++<P>The default setting is <CODE>No</CODE>.</P>
++
++<BLOCKQUOTE><B>Note:</B>
++
++<P>File devices are managed by the scheduler. Since the
++scheduler normally runs as the root user, file devices
++can be used to overwrite system files and potentially
++gain unauthorized access to the system. If you must
++create printers using file devices, we recommend that
++you set the <CODE>FileDevice</CODE> directive to
++<CODE>Yes</CODE> for only as long as you need to add the
++printers to the system, and then reset the directive to
++<CODE>No</CODE>.</P>
++
++</BLOCKQUOTE>
++
++
++<H2 CLASS=3D"title"><SPAN CLASS=3D"info">CUPS 1.1.3</SPAN><A NAME=3D"Fo=
ntPath">FontPath</A></H2>
++
++<H3>Examples</H3>
++
++<PRE CLASS=3D"command">
++FontPath /foo/bar/fonts
++FontPath /usr/share/cups/fonts:/foo/bar/fonts
++</PRE>
++
++<H3>Description</H3>
++
++<P>The <CODE>FontPath</CODE> directive specifies the font path to
++use when searching for fonts. The default font path is
++<CODE>/usr/share/cups/fonts</CODE>.</P>
++
++
++<H2 CLASS=3D"title"><A NAME=3D"Group">Group</A></H2>
++
++<H3>Examples</H3>
++
++<PRE CLASS=3D"command">
++Group lp
++Group nobody
++</PRE>
++
++<H3>Description</H3>
++
++<P>The <CODE>Group</CODE> directive specifies the UNIX group that
++filter and CGI programs run as. The default group is
++system-specific but is usually <CODE>lp</CODE> or
++<CODE>nobody</CODE>.</P>
++
++
++<H2 CLASS=3D"title"><SPAN CLASS=3D"info">CUPS 1.1.15</SPAN><A NAME=3D"L=
ogFilePerm">LogFilePerm</A></H2>
++
++<H3>Examples</H3>
++
++<PRE CLASS=3D"command">
++LogFilePerm 0644
++LogFilePerm 0600
++</PRE>
++
++<H3>Description</H3>
++
++<P>The <CODE>LogFilePerm</CODE> directive specifies the
++permissions to use when writing log files. The default
++is @CUPS_LOG_FILE_PERM@.</P>
++
++
++<H2 CLASS=3D"title"><A NAME=3D"PageLog">PageLog</A></H2>
++
++<H3>Examples</H3>
++
++<PRE CLASS=3D"command">
++PageLog /var/log/cups/page_log
++PageLog /var/log/cups/page_log-%s
++PageLog syslog
++</PRE>
++
++<H3>Description</H3>
++
++<P>The <CODE>PageLog</CODE> directive sets the name of the page
++log file. If the filename is not absolute then it is assumed to
++be relative to the <A
++HREF=3D"#ServerRoot"><CODE>ServerRoot</CODE></A> directory. The
++default page log file is <VAR>@CUPS_LOGDIR@/page_log</VAR>.</P>
++
++<P>The server name can be included in the filename by using
++<CODE>%s</CODE> in the name.</P>
++
++<P>The special name "syslog" can be used to send the page
++information to the system log instead of a plain file.</P>
++
++
++<H2 CLASS=3D"title"><A NAME=3D"Printcap">Printcap</A></H2>
++
++<H3>Examples</H3>
++
++<PRE CLASS=3D"command">
++Printcap
++Printcap /etc/printcap
++Printcap /etc/printers.conf
++Printcap /Library/Preferences/org.cups.printers.plist
++</PRE>
++
++<H3>Description</H3>
++
++<P>The <CODE>Printcap</CODE> directive controls whether or not a
++printcap file is automatically generated and updated with a list
++of available printers. If specified with no value, then no
++printcap file will be generated. The default is to generate a
++file named <VAR>@CUPS_DEFAULT_PRINTCAP@</VAR>.</P>
++
++<P>When a filename is specified (e.g. <VAR>@CUPS_DEFAULT_PRINTCAP@</VAR=
>),
++the printcap file is written whenever a printer is added or
++removed. The printcap file can then be used by applications that
++are hardcoded to look at the printcap file for the available
++printers.</P>
++
++
++<H2 CLASS=3D"title"><A NAME=3D"PrintcapFormat">PrintcapFormat</A></H2>
++
++<H3>Examples</H3>
++
++<PRE CLASS=3D"command">
++PrintcapFormat BSD
++PrintcapFormat Solaris
++PrintcapFormat plist
++</PRE>
++
++<H3>Description</H3>
++
++<P>The <CODE>PrintcapFormat</CODE> directive controls the output format=
 of the
++printcap file. The default is to generate the plist format on OS X, the
++Solaris format on Solaris, and the BSD format on other operating system=
s.</P>
++
++
++<H2 CLASS=3D"title"><SPAN CLASS=3D"info">CUPS 1.1.3</SPAN><A NAME=3D"Re=
moteRoot">RemoteRoot</A></H2>
++
++<H3>Examples</H3>
++
++<PRE CLASS=3D"command">
++RemoteRoot remroot
++RemoteRoot root
++</PRE>
++
++<H3>Description</H3>
++
++<P>The <CODE>RemoteRoot</CODE> directive sets the username for
++unauthenticated root requests from remote hosts. The default
++username is <VAR>remroot</VAR>. Setting <CODE>RemoteRoot</CODE>
++to <VAR>root</VAR> effectively disables this security
++mechanism.</P>
++
++
++<H2 CLASS=3D"title"><A NAME=3D"RequestRoot">RequestRoot</A></H2>
++
++<H3>Examples</H3>
++
++<PRE CLASS=3D"command">
++RequestRoot /var/spool/cups
++RequestRoot /foo/bar/spool/cups
++</PRE>
++
++<H3>Description</H3>
++
++<P>The <CODE>RequestRoot</CODE> directive sets the directory for
++incoming IPP requests and HTML forms. If an absolute path is not
++provided then it is assumed to be relative to the <A
++HREF=3D"#ServerRoot"><CODE>ServerRoot</CODE></A> directory. The
++default request directory is <VAR>@CUPS_REQUESTS@</VAR>.</P>
++
++
++<H2 CLASS=3D"title"><A NAME=3D"ServerBin">ServerBin</A></H2>
++
++<H3>Examples</H3>
++
++<PRE CLASS=3D"command">
++ServerBin /usr/lib/cups
++ServerBin /foo/bar/lib/cups
++</PRE>
++
++<H3>Description</H3>
++
++<P>The <CODE>ServerBin</CODE> directive sets the directory for
++server-run executables. If an absolute path is not provided then
++it is assumed to be relative to the <A
++HREF=3D"#ServerRoot"><CODE>ServerRoot</CODE></A> directory. The
++default executable directory is <VAR>/usr/lib/cups</VAR>,
++<VAR>/usr/lib32/cups</VAR>, or <VAR>/usr/libexec/cups</VAR>
++depending on the operating system.</P>
++
++
++<H2 CLASS=3D"title"><A NAME=3D"ServerCertificate">ServerCertificate</A>=
</H2>
++
++<H3>Examples</H3>
++
++<PRE CLASS=3D"command">
++ServerCertificate /etc/cups/ssl/server.crt
++</PRE>
++
++<H3>Description</H3>
++
++<P>The <CODE>ServerCertificate</CODE> directive specifies the
++location of the SSL certificate file used by the server when
++negotiating encrypted connections. The certificate must not be
++encrypted (password protected) since the scheduler normally runs
++in the background and will be unable to ask for a password.</P>
++
++<P>The default certificate file is
++<VAR>/etc/cups/ssl/server.crt</VAR>.</P>
++
++
++<H2 CLASS=3D"title"><A NAME=3D"ServerKey">ServerKey</A></H2>
++
++<H3>Examples</H3>
++
++<PRE CLASS=3D"command">
++ServerKey /etc/cups/ssl/server.key
++</PRE>
++
++<H3>Description</H3>
++
++<P>The <CODE>ServerKey</CODE> directive specifies the location of
++the SSL private key file used by the server when negotiating
++encrypted connections.</P>
++
++<P>The default key file is
++<VAR>/etc/cups/ssl/server.crt</VAR>.</P>
++
++
++<H2 CLASS=3D"title"><A NAME=3D"ServerRoot">ServerRoot</A></H2>
++
++<H3>Examples</H3>
++
++<PRE CLASS=3D"command">
++ServerRoot /etc/cups
++ServerRoot /foo/bar/cups
++</PRE>
++
++<H3>Description</H3>
++
++<P>The <CODE>ServerRoot</CODE> directive specifies the absolute
++path to the server configuration and state files. It is also used
++to resolve relative paths in the <VAR>cupsd.conf</VAR> file. The
++default server directory is <VAR>/etc/cups</VAR>.</P>
++
++
++<H2 CLASS=3D"title"><A NAME=3D"SystemGroup">SystemGroup</A></H2>
++
++<H3>Examples</H3>
++
++<PRE CLASS=3D"command">
++SystemGroup lpadmin
++SystemGroup sys
++SystemGroup system
++SystemGroup root
++SystemGroup root lpadmin
++</PRE>
++
++<H3>Description</H3>
++
++<P>The <CODE>SystemGroup</CODE> directive specifies the system
++administration group for <CODE>System</CODE> authentication.
++Multiple groups can be listed, separated with spaces. The default
++group list is <CODE>@CUPS_SYSTEM_GROUPS@</CODE>.</P>
++
++
++<H2 CLASS=3D"title"><A NAME=3D"TempDir">TempDir</A></H2>
++
++<H3>Examples</H3>
++
++<PRE CLASS=3D"command">
++TempDir /var/tmp
++TempDir /foo/bar/tmp
++</PRE>
++
++<H3>Description</H3>
++
++<P>The <CODE>TempDir</CODE> directive specifies an absolute path
++for the directory to use for temporary files. The default
++directory is <VAR>@CUPS_REQUESTS@/tmp</VAR>.</P>
++
++<P>Temporary directories must be world-writable and should have
++the "sticky" permission bit enabled so that other users cannot
++delete filter temporary files. The following commands will create
++an appropriate temporary directory called
++<VAR>/foo/bar/tmp</VAR>:</P>
++
++<PRE CLASS=3D"command">
++<KBD>mkdir /foo/bar/tmp</KBD>
++<KBD>chmod a+rwxt /foo/bar/tmp</KBD>
++</PRE>
++
++
++<H2 CLASS=3D"title"><A NAME=3D"User">User</A></H2>
++
++<H3>Examples</H3>
++
++<PRE CLASS=3D"command">
++User lp
++User guest
++</PRE>
++
++<H3>Description</H3>
++
++<P>The <CODE>User</CODE> directive specifies the UNIX user that
++filter and CGI programs run as. The default user is
++<CODE>@CUPS_USER@</CODE>.</P>
++
++<BLOCKQUOTE><B>Note:</B>
++
++<P>You may not use user <CODE>root</CODE>, as that would expose
++the system to unacceptable security risks. The scheduler will
++automatically choose user <CODE>nobody</CODE> if you specify a
++user whose ID is 0.</P>
++
++</BLOCKQUOTE>
++
++
++</BODY>
++</HTML>
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/doc/help/ref-cupsd-conf.html.in cups/doc/help/ref-cupsd-conf.html.=
in
+--- cups~/doc/help/ref-cupsd-conf.html.in	2012-12-07 13:00:48.000000000 =
+0100
++++ cups/doc/help/ref-cupsd-conf.html.in	2012-12-08 00:29:10.000000000 +=
0100
+@@ -191,82 +191,6 @@
+ HREF=3D"#Limit"><CODE>Limit</CODE></A> section.</P>
+=20
+=20
+-<H2 CLASS=3D"title"><SPAN CLASS=3D"info">Deprecated</SPAN><A NAME=3D"Au=
thClass">AuthClass</A></H2>
+-
+-<H3>Examples</H3>
+-
+-<PRE CLASS=3D"command">
+-&lt;Location /path&gt;
+-  ...
+-  AuthClass Anonymous
+-  AuthClass User
+-  AuthClass System
+-  AuthClass Group
+-&lt;/Location&gt;
+-</PRE>
+-
+-<H3>Description</H3>
+-
+-<P>The <CODE>AuthClass</CODE> directive defines what level of
+-authentication is required:</P>
+-
+-<UL>
+-
+-	<LI><CODE>Anonymous</CODE> - No authentication should be
+-	performed (default)</LI>
+-
+-	<LI><CODE>User</CODE> - A valid username and password is
+-	required</LI>
+-
+-	<LI><CODE>System</CODE> - A valid username and password
+-	is required, and the username must belong to the "sys"
+-	group; this can be changed using the <A
+-	HREF=3D"#SystemGroup"><CODE>SystemGroup</CODE></A>
+-	directive</LI>
+-
+-	<LI><CODE>Group</CODE> - A valid username and password is
+-	required, and the username must belong to the group named
+-	by the <A
+-	HREF=3D"#AuthGroupName"><CODE>AuthGroupName</CODE></A>
+-	directive</LI>
+-
+-</UL>
+-
+-<P>The <CODE>AuthClass</CODE> directive must appear inside a <A
+-HREF=3D"#Location"><CODE>Location</CODE></A> or <A
+-HREF=3D"#Limit"><CODE>Limit</CODE></A> section.</P>
+-
+-<P><B>This directive is deprecated and will be removed from a
+-future release of CUPS.</B> Consider using the more flexible <A
+-HREF=3D"#Require"><CODE>Require</CODE></A> directive instead.</P>
+-
+-
+-<H2 CLASS=3D"title"><SPAN CLASS=3D"info">Deprecated</SPAN><A NAME=3D"Au=
thGroupName">AuthGroupName</A></H2>
+-
+-<H3>Examples</H3>
+-
+-<PRE CLASS=3D"command">
+-&lt;Location /path&gt;
+-  ...
+-  AuthGroupName mygroup
+-  AuthGroupName lp
+-&lt;/Location&gt;
+-</PRE>
+-
+-<H3>Description</H3>
+-
+-<P>The <CODE>AuthGroupName</CODE> directive sets the group to use
+-for <CODE>Group</CODE> authentication.</P>
+-
+-<P>The <CODE>AuthGroupName</CODE> directive must appear inside a
+-<A HREF=3D"#Location"><CODE>Location</CODE></A> or <A
+-HREF=3D"#Limit"><CODE>Limit</CODE></A> section.</P>
+-
+-<P><B>This directive is deprecated and will be removed from a
+-future release of CUPS.</B> Consider using the more flexible <A
+-HREF=3D"#Require"><CODE>Require</CODE></A> directive instead.</P>
+-
+-
+ <H2 CLASS=3D"title"><A NAME=3D"AuthType">AuthType</A></H2>
+=20
+ <H3>Examples</H3>
+@@ -2494,65 +2418,6 @@
+ files as soon as each job is completed, canceled, or aborted.</P>
+=20
+=20
+-<H2 CLASS=3D"title"><A NAME=3D"Printcap">Printcap</A></H2>
+-
+-<H3>Examples</H3>
+-
+-<PRE CLASS=3D"command">
+-Printcap
+-Printcap /etc/printcap
+-Printcap /etc/printers.conf
+-Printcap /Library/Preferences/org.cups.printers.plist
+-</PRE>
+-
+-<H3>Description</H3>
+-
+-<P>The <CODE>Printcap</CODE> directive controls whether or not a
+-printcap file is automatically generated and updated with a list
+-of available printers. If specified with no value, then no
+-printcap file will be generated. The default is to generate a
+-file named <VAR>@CUPS_DEFAUL_PRINTCAP@</VAR>.</P>
+-
+-<P>When a filename is specified (e.g. <VAR>@CUPS_DEFAULT_PRINTCAP@</VAR=
>),
+-the printcap file is written whenever a printer is added or
+-removed. The printcap file can then be used by applications that
+-are hardcoded to look at the printcap file for the available
+-printers.</P>
+-
+-
+-<H2 CLASS=3D"title"><A NAME=3D"PrintcapFormat">PrintcapFormat</A></H2>
+-
+-<H3>Examples</H3>
+-
+-<PRE CLASS=3D"command">
+-PrintcapFormat BSD
+-PrintcapFormat Solaris
+-PrintcapFormat plist
+-</PRE>
+-
+-<H3>Description</H3>
+-
+-<P>The <CODE>PrintcapFormat</CODE> directive controls the output format=
 of the
+-printcap file. The default is to generate the plist format on Mac OS X,=
 the
+-Solaris format on Solaris, and the BSD format on other operating system=
s.</P>
+-
+-
+-<H2 CLASS=3D"title"><SPAN CLASS=3D"info">CUPS 1.1.13</SPAN><A NAME=3D"P=
rintcapGUI">PrintcapGUI</A></H2>
+-
+-<H3>Examples</H3>
+-
+-<PRE CLASS=3D"command">
+-PrintGUI /usr/bin/glpoptions
+-</PRE>
+-
+-<H3>Description</H3>
+-
+-<P>The <CODE>PrintcapGUI</CODE> directive sets the program to
+-associate with the IRIX printer GUI interface script which is
+-used by IRIX applications to display printer-specific options.
+-There is no default program.</P>
+-
+-
+ <H2 CLASS=3D"title"><SPAN CLASS=3D"info">CUPS 1.1.21</SPAN><A NAME=3D"R=
eloadTimeout">ReloadTimeout</A></H2>
+=20
+ <H3>Examples</H3>
+@@ -2569,42 +2434,6 @@
+ before doing a restart. The default is 30 seconds.</P>
+=20
+=20
+-<H2 CLASS=3D"title"><SPAN CLASS=3D"info">CUPS 1.1.3</SPAN><A NAME=3D"Re=
moteRoot">RemoteRoot</A></H2>
+-
+-<H3>Examples</H3>
+-
+-<PRE CLASS=3D"command">
+-RemoteRoot remroot
+-RemoteRoot root
+-</PRE>
+-
+-<H3>Description</H3>
+-
+-<P>The <CODE>RemoteRoot</CODE> directive sets the username for
+-unauthenticated root requests from remote hosts. The default
+-username is <VAR>remroot</VAR>. Setting <CODE>RemoteRoot</CODE>
+-to <VAR>root</VAR> effectively disables this security
+-mechanism.</P>
+-
+-
+-<H2 CLASS=3D"title"><A NAME=3D"RequestRoot">RequestRoot</A></H2>
+-
+-<H3>Examples</H3>
+-
+-<PRE CLASS=3D"command">
+-RequestRoot /var/spool/cups
+-RequestRoot /foo/bar/spool/cups
+-</PRE>
+-
+-<H3>Description</H3>
+-
+-<P>The <CODE>RequestRoot</CODE> directive sets the directory for
+-incoming IPP requests and HTML forms. If an absolute path is not
+-provided then it is assumed to be relative to the <A
+-HREF=3D"#ServerRoot"><CODE>ServerRoot</CODE></A> directory. The
+-default request directory is <VAR>@CUPS_REQUESTS@</VAR>.</P>
+-
+-
+ <H2 CLASS=3D"title"><SPAN CLASS=3D"info">CUPS 1.1.7</SPAN><A NAME=3D"Re=
quire">Require</A></H2>
+=20
+ <H3>Examples</H3>
+@@ -2759,64 +2588,6 @@
+ </BLOCKQUOTE>
+=20
+=20
+-<H2 CLASS=3D"title"><A NAME=3D"ServerBin">ServerBin</A></H2>
+-
+-<H3>Examples</H3>
+-
+-<PRE CLASS=3D"command">
+-ServerBin /usr/lib/cups
+-ServerBin /foo/bar/lib/cups
+-</PRE>
+-
+-<H3>Description</H3>
+-
+-<P>The <CODE>ServerBin</CODE> directive sets the directory for
+-server-run executables. If an absolute path is not provided then
+-it is assumed to be relative to the <A
+-HREF=3D"#ServerRoot"><CODE>ServerRoot</CODE></A> directory. The
+-default executable directory is <VAR>/usr/lib/cups</VAR>,
+-<VAR>/usr/lib32/cups</VAR>, or <VAR>/usr/libexec/cups</VAR>
+-depending on the operating system.</P>
+-
+-
+-<H2 CLASS=3D"title"><A NAME=3D"ServerCertificate">ServerCertificate</A>=
</H2>
+-
+-<H3>Examples</H3>
+-
+-<PRE CLASS=3D"command">
+-ServerCertificate /etc/cups/ssl/server.crt
+-</PRE>
+-
+-<H3>Description</H3>
+-
+-<P>The <CODE>ServerCertificate</CODE> directive specifies the
+-location of the SSL certificate file used by the server when
+-negotiating encrypted connections. The certificate must not be
+-encrypted (password protected) since the scheduler normally runs
+-in the background and will be unable to ask for a password.</P>
+-
+-<P>The default certificate file is
+-<VAR>/etc/cups/ssl/server.crt</VAR>.</P>
+-
+-
+-<H2 CLASS=3D"title"><A NAME=3D"ServerKey">ServerKey</A></H2>
+-
+-<H3>Examples</H3>
+-
+-<PRE CLASS=3D"command">
+-ServerKey /etc/cups/ssl/server.key
+-</PRE>
+-
+-<H3>Description</H3>
+-
+-<P>The <CODE>ServerKey</CODE> directive specifies the location of
+-the SSL private key file used by the server when negotiating
+-encrypted connections.</P>
+-
+-<P>The default key file is
+-<VAR>/etc/cups/ssl/server.crt</VAR>.</P>
+-
+-
+ <H2 CLASS=3D"title"><A NAME=3D"ServerName">ServerName</A></H2>
+=20
+ <H3>Examples</H3>
+@@ -2833,23 +2604,6 @@
+ hostname.</P>
+=20
+=20
+-<H2 CLASS=3D"title"><A NAME=3D"ServerRoot">ServerRoot</A></H2>
+-
+-<H3>Examples</H3>
+-
+-<PRE CLASS=3D"command">
+-ServerRoot /etc/cups
+-ServerRoot /foo/bar/cups
+-</PRE>
+-
+-<H3>Description</H3>
+-
+-<P>The <CODE>ServerRoot</CODE> directive specifies the absolute
+-path to the server configuration and state files. It is also used
+-to resolve relative paths in the <VAR>cupsd.conf</VAR> file. The
+-default server directory is <VAR>/etc/cups</VAR>.</P>
+-
+-
+ <H2 CLASS=3D"title"><SPAN CLASS=3D"info">CUPS 1.1.21</SPAN><A NAME=3D"S=
erverTokens">ServerTokens</A></H2>
+=20
+ <H3>Examples</H3>
+@@ -2985,53 +2739,6 @@
+ can be specified to listen on multiple ports.</P>
+=20
+=20
+-<H2 CLASS=3D"title"><A NAME=3D"SystemGroup">SystemGroup</A></H2>
+-
+-<H3>Examples</H3>
+-
+-<PRE CLASS=3D"command">
+-SystemGroup lpadmin
+-SystemGroup sys
+-SystemGroup system
+-SystemGroup root
+-SystemGroup root lpadmin
+-</PRE>
+-
+-<H3>Description</H3>
+-
+-<P>The <CODE>SystemGroup</CODE> directive specifies the system
+-administration group for <CODE>System</CODE> authentication.
+-Multiple groups can be listed, separated with spaces. The default
+-group list is <CODE>@CUPS_SYSTEM_GROUPS@</CODE>.</P>
+-
+-
+-<H2 CLASS=3D"title"><A NAME=3D"TempDir">TempDir</A></H2>
+-
+-<H3>Examples</H3>
+-
+-<PRE CLASS=3D"command">
+-TempDir /var/tmp
+-TempDir /foo/bar/tmp
+-</PRE>
+-
+-<H3>Description</H3>
+-
+-<P>The <CODE>TempDir</CODE> directive specifies an absolute path
+-for the directory to use for temporary files. The default
+-directory is <VAR>@CUPS_REQUESTS@/tmp</VAR>.</P>
+-
+-<P>Temporary directories must be world-writable and should have
+-the "sticky" permission bit enabled so that other users cannot
+-delete filter temporary files. The following commands will create
+-an appropriate temporary directory called
+-<VAR>/foo/bar/tmp</VAR>:</P>
+-
+-<PRE CLASS=3D"command">
+-<KBD>mkdir /foo/bar/tmp</KBD>
+-<KBD>chmod a+rwxt /foo/bar/tmp</KBD>
+-</PRE>
+-
+-
+ <H2 CLASS=3D"title"><A NAME=3D"Timeout">Timeout</A></H2>
+=20
+ <H3>Examples</H3>
+@@ -3048,52 +2755,5 @@
+ default timeout is 300 seconds.</P>
+=20
+=20
+-<H2 CLASS=3D"title"><SPAN CLASS=3D"info">CUPS 1.2/Mac OS X 10.5</SPAN><=
A NAME=3D"UseNetworkDefault">UseNetworkDefault</A></H2>
+-
+-<H3>Examples</H3>
+-
+-<PRE CLASS=3D"command">
+-UseNetworkDefault yes
+-UseNetworkDefault no
+-</PRE>
+-
+-<H3>Description</H3>
+-
+-<P>The <CODE>UseNetworkDefault</CODE> directive controls whether
+-the client will use a network/remote printer as a default
+-printer. If enabled, the default printer of a server is used as
+-the default printer on a client. When multiple servers are
+-advertising a default printer, the client's default printer is
+-set to the first discovered printer, or to the implicit class for
+-the same printer available from multiple servers.</P>
+-
+-<P>The default is <CODE>@CUPS_USE_NETWORK_DEFAULT@</CODE>.</P>
+-
+-
+-<H2 CLASS=3D"title"><A NAME=3D"User">User</A></H2>
+-
+-<H3>Examples</H3>
+-
+-<PRE CLASS=3D"command">
+-User lp
+-User guest
+-</PRE>
+-
+-<H3>Description</H3>
+-
+-<P>The <CODE>User</CODE> directive specifies the UNIX user that
+-filter and CGI programs run as. The default user is
+-<CODE>@CUPS_USER@</CODE>.</P>
+-
+-<BLOCKQUOTE><B>Note:</B>
+-
+-<P>You may not use user <CODE>root</CODE>, as that would expose
+-the system to unacceptable security risks. The scheduler will
+-automatically choose user <CODE>nobody</CODE> if you specify a
+-user whose ID is 0.</P>
+-
+-</BLOCKQUOTE>
+-
+-
+ </BODY>
+ </HTML>
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/locale/cups_da.po cups/locale/cups_da.po
+--- cups~/locale/cups_da.po	2012-12-07 13:00:48.000000000 +0100
++++ cups/locale/cups_da.po	2012-12-08 01:01:31.675672771 +0100
+@@ -2881,10 +2881,10 @@
+ #, c-format
+ msgid ""
+ "File device URIs have been disabled! To enable, see the FileDevice dir=
ective "
+-"in \"%s/cupsd.conf\"."
++"in \"%s/cups-files.conf\"."
+ msgstr ""
+ "Arkivets enheds-URI'er er blevet sl=C3=A5et fra! Du sl=C3=A5r det til =
ved at se i "
+-"FileDevice-direktivet i \"%s/cupsd.conf\"."
++"FileDevice-direktivet i \"%s/cups-files.conf\"."
+=20
+ msgid "Folio"
+ msgstr "8,5 x 13\""
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/locale/cups_de.po cups/locale/cups_de.po
+--- cups~/locale/cups_de.po	2012-12-07 13:00:48.000000000 +0100
++++ cups/locale/cups_de.po	2012-12-08 00:56:57.515682472 +0100
+@@ -2909,10 +2909,10 @@
+ #, c-format
+ msgid ""
+ "File device URIs have been disabled! To enable, see the FileDevice dir=
ective "
+-"in \"%s/cupsd.conf\"."
++"in \"%s/cups-files.conf\"."
+ msgstr ""
+ "Dateiger=C3=A4te-URIs wurden deaktiviert! Infos zum Aktivieren finden =
Sie im "
+-"FileDevice-Verzeichnis unter =E2=80=9E%s/cupsd.conf=E2=80=9C."
++"FileDevice-Verzeichnis unter =E2=80=9E%s/cups-files.conf=E2=80=9C."
+=20
+ msgid "Folio"
+ msgstr "Folio"
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/locale/cups_es.po cups/locale/cups_es.po
+--- cups~/locale/cups_es.po	2012-12-07 13:00:48.000000000 +0100
++++ cups/locale/cups_es.po	2012-12-08 00:57:31.903681255 +0100
+@@ -2941,10 +2941,10 @@
+ #, c-format
+ msgid ""
+ "File device URIs have been disabled! To enable, see the FileDevice dir=
ective "
+-"in \"%s/cupsd.conf\"."
++"in \"%s/cups-files.conf\"."
+ msgstr ""
+ "Los URIs del dispositivo de archivo han sido deshabilitados. Para "
+-"habilitarlos, vea la directiva FileDevice en \"%s/cupsd.conf\"."
++"habilitarlos, vea la directiva FileDevice en \"%s/cups-files.conf\"."
+=20
+ msgid "Folio"
+ msgstr "Folio"
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/locale/cups_eu.po cups/locale/cups_eu.po
+--- cups~/locale/cups_eu.po	2012-12-07 13:00:48.000000000 +0100
++++ cups/locale/cups_eu.po	2012-12-08 00:58:35.175679014 +0100
+@@ -3793,10 +3793,10 @@
+ #, c-format
+ msgid ""
+ "File device URIs have been disabled! To enable, see the FileDevice dir=
ective "
+-"in \"%s/cupsd.conf\"."
++"in \"%s/cups-files.conf\"."
+ msgstr ""
+ "Fitxategiaren gailuaren URIak desgaitu egin dira. Gaitzeko, ikus FileD=
evice "
+-"direktiba \"%s/cupsd.conf\" fitxategian."
++"direktiba \"%s/cups-files.conf\" fitxategian."
+=20
+ #: ppdc/sample.c:92
+ msgid "Folio"
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/locale/cups_fi.po cups/locale/cups_fi.po
+--- cups~/locale/cups_fi.po	2012-12-07 13:00:48.000000000 +0100
++++ cups/locale/cups_fi.po	2012-12-08 01:02:01.039671731 +0100
+@@ -2886,10 +2886,10 @@
+ #, c-format
+ msgid ""
+ "File device URIs have been disabled! To enable, see the FileDevice dir=
ective "
+-"in \"%s/cupsd.conf\"."
++"in \"%s/cups-files.conf\"."
+ msgstr ""
+ "Tiedostolaitteiden osoitteet on poistettu k=C3=A4yt=C3=B6st=C3=A4! Voi=
t ottaa ne k=C3=A4ytt=C3=B6=C3=B6n =E2=80=9D%"
+-"s/cupsd.conf=E2=80=9D-tiedoston FileDevice-s=C3=A4=C3=A4nn=C3=B6ll=C3=A4=
."
++"s/cups-files.conf=E2=80=9D-tiedoston FileDevice-s=C3=A4=C3=A4nn=C3=B6l=
l=C3=A4."
+=20
+ msgid "Folio"
+ msgstr "Folio"
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/locale/cups_fr.po cups/locale/cups_fr.po
+--- cups~/locale/cups_fr.po	2012-12-07 13:00:48.000000000 +0100
++++ cups/locale/cups_fr.po	2012-12-08 01:03:03.287669533 +0100
+@@ -2925,10 +2925,10 @@
+ #, c-format
+ msgid ""
+ "File device URIs have been disabled! To enable, see the FileDevice dir=
ective "
+-"in \"%s/cupsd.conf\"."
++"in \"%s/cups-files.conf\"."
+ msgstr ""
+ "Les URI des p=C3=A9riph=C3=A9riques de fichier ont =C3=A9t=C3=A9 d=C3=A9=
sactiv=C3=A9s. Pour l=E2=80=99activer, "
+-"reportez-vous =C3=A0 la directive FileDevice dans =C2=AB=C2=A0%s/cupsd=
.conf=C2=A0=C2=BB."
++"reportez-vous =C3=A0 la directive FileDevice dans =C2=AB=C2=A0%s/cups-=
files.conf=C2=A0=C2=BB."
+=20
+ msgid "Folio"
+ msgstr "Folio"
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/locale/cups_id.po cups/locale/cups_id.po
+--- cups~/locale/cups_id.po	2012-12-07 13:00:48.000000000 +0100
++++ cups/locale/cups_id.po	2012-12-08 01:03:26.919668695 +0100
+@@ -3712,10 +3712,10 @@
+ #, c-format
+ msgid ""
+ "File device URIs have been disabled! To enable, see the FileDevice dir=
ective "
+-"in \"%s/cupsd.conf\"."
++"in \"%s/cups-files.conf\"."
+ msgstr ""
+ "Berkas URI perangkat telah dinonaktifkan! Untuk mengaktifkannya, lihat=
lah "
+-"petunjuk FileDevice dalam \"%s/cupsd.conf\"."
++"petunjuk FileDevice dalam \"%s/cups-files.conf\"."
+=20
+ #: ppdc/sample.c:92
+ msgid "Folio"
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/locale/cups_it.po cups/locale/cups_it.po
+--- cups~/locale/cups_it.po	2012-12-07 13:00:48.000000000 +0100
++++ cups/locale/cups_it.po	2012-12-08 01:04:46.011665881 +0100
+@@ -2819,8 +2819,8 @@
+ msgstr "Cartella documento: 9/16 x 3 7/16\""
+=20
+ #, c-format
+-msgid "File device URIs have been disabled! To enable, see the FileDevi=
ce directive in \"%s/cupsd.conf\"."
+-msgstr "Gli URI del dispositivo documento sono stati disabilitati! Per =
abilitarli, consulta l'istruzione del FileDevice in \"%s/cupsd.conf\"."
++msgid "File device URIs have been disabled! To enable, see the FileDevi=
ce directive in \"%s/cups-files.conf\"."
++msgstr "Gli URI del dispositivo documento sono stati disabilitati! Per =
abilitarli, consulta l'istruzione del FileDevice in \"%s/cups-files.conf\=
"."
+=20
+ msgid "Folio"
+ msgstr "Foglio"
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/locale/cups_ja.po cups/locale/cups_ja.po
+--- cups~/locale/cups_ja.po	2012-12-07 13:00:48.000000000 +0100
++++ cups/locale/cups_ja.po	2012-12-08 01:05:34.883664166 +0100
+@@ -2867,8 +2867,8 @@
+ msgstr "=E3=83=95=E3=82=A1=E3=82=A4=E3=83=AB=E3=83=95=E3=82=A9=E3=83=AB=
=E3=83=80=E3=83=BC - 9/16 x 3 7/16\""
+=20
+ #, c-format
+-msgid "File device URIs have been disabled! To enable, see the FileDevi=
ce directive in \"%s/cupsd.conf\"."
+-msgstr "=E3=83=95=E3=82=A1=E3=82=A4=E3=83=AB=E3=83=87=E3=83=90=E3=82=A4=
=E3=82=B9 URI =E3=81=AF=E7=84=A1=E5=8A=B9=E3=81=AB=E3=81=AA=E3=81=A3=E3=81=
=A6=E3=81=84=E3=81=BE=E3=81=99! =E6=9C=89=E5=8A=B9=E3=81=AB=E3=81=99=E3=82=
=8B=E3=81=AB=E3=81=AF=E3=80=81\"%s/cupsd.conf\" =E3=81=AE FileDevice =E3=83=
=87=E3=82=A3=E3=83=AC=E3=82=AF=E3=83=86=E3=82=A3=E3=83=96=E3=82=92=E5=8F=82=
=E7=85=A7=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82"
++msgid "File device URIs have been disabled! To enable, see the FileDevi=
ce directive in \"%s/cups-files.conf\"."
++msgstr "=E3=83=95=E3=82=A1=E3=82=A4=E3=83=AB=E3=83=87=E3=83=90=E3=82=A4=
=E3=82=B9 URI =E3=81=AF=E7=84=A1=E5=8A=B9=E3=81=AB=E3=81=AA=E3=81=A3=E3=81=
=A6=E3=81=84=E3=81=BE=E3=81=99! =E6=9C=89=E5=8A=B9=E3=81=AB=E3=81=99=E3=82=
=8B=E3=81=AB=E3=81=AF=E3=80=81\"%s/cups-files.conf\" =E3=81=AE FileDevice=
 =E3=83=87=E3=82=A3=E3=83=AC=E3=82=AF=E3=83=86=E3=82=A3=E3=83=96=E3=82=92=
=E5=8F=82=E7=85=A7=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=
=80=82"
+=20
+ msgid "Folio"
+ msgstr "=E3=83=95=E3=82=A9=E3=83=AA=E3=82=AA"
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/locale/cups_ko.po cups/locale/cups_ko.po
+--- cups~/locale/cups_ko.po	2012-12-07 13:00:48.000000000 +0100
++++ cups/locale/cups_ko.po	2012-12-08 01:06:35.647662090 +0100
+@@ -2866,9 +2866,9 @@
+ #, c-format
+ msgid ""
+ "File device URIs have been disabled! To enable, see the FileDevice dir=
ective "
+-"in \"%s/cupsd.conf\"."
++"in \"%s/cups-files.conf\"."
+ msgstr ""
+-"=ED=8C=8C=EC=9D=BC =EC=9E=A5=EB=B9=84 URI=EA=B0=80 =EB=B9=84=ED=99=9C=EC=
=84=B1=ED=99=94=EB=90=98=EC=97=88=EC=8A=B5=EB=8B=88=EB=8B=A4! =ED=99=9C=EC=
=84=B1=ED=99=94=ED=95=98=EB=A0=A4=EB=A9=B4, \"%s/cupsd.conf\"=EC=97=90 =EC=
=9E=88=EB=8A=94 "
++"=ED=8C=8C=EC=9D=BC =EC=9E=A5=EB=B9=84 URI=EA=B0=80 =EB=B9=84=ED=99=9C=EC=
=84=B1=ED=99=94=EB=90=98=EC=97=88=EC=8A=B5=EB=8B=88=EB=8B=A4! =ED=99=9C=EC=
=84=B1=ED=99=94=ED=95=98=EB=A0=A4=EB=A9=B4, \"%s/cups-files.conf\"=EC=97=90=
 =EC=9E=88=EB=8A=94 "
+ "FileDevice =EC=A7=80=EC=8B=9C=EB=AC=B8=EC=9D=84 =EB=B3=B4=EC=8B=AD=EC=8B=
=9C=EC=98=A4."
+=20
+ msgid "Folio"
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/locale/cups_nl.po cups/locale/cups_nl.po
+--- cups~/locale/cups_nl.po	2012-12-07 13:00:48.000000000 +0100
++++ cups/locale/cups_nl.po	2012-12-08 01:07:07.987660903 +0100
+@@ -2910,10 +2910,10 @@
+ #, c-format
+ msgid ""
+ "File device URIs have been disabled! To enable, see the FileDevice dir=
ective "
+-"in \"%s/cupsd.conf\"."
++"in \"%s/cups-files.conf\"."
+ msgstr ""
+ "File device-URI&aops;s zijn uitgeschakeld! Raadpleeg als u de URI&aops=
;s "
+-"weer wilt inschakelen de richtlijn voor FileDevice in \"%s/cupsd.conf\=
"."
++"weer wilt inschakelen de richtlijn voor FileDevice in \"%s/cups-files.=
conf\"."
+=20
+ msgid "Folio"
+ msgstr "Folio"
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/locale/cups_no.po cups/locale/cups_no.po
+--- cups~/locale/cups_no.po	2012-12-07 13:00:48.000000000 +0100
++++ cups/locale/cups_no.po	2012-12-08 01:07:18.003660528 +0100
+@@ -2871,10 +2871,10 @@
+ #, c-format
+ msgid ""
+ "File device URIs have been disabled! To enable, see the FileDevice dir=
ective "
+-"in \"%s/cupsd.conf\"."
++"in \"%s/cups-files.conf\"."
+ msgstr ""
+ "Enhets-URIer for filer er deaktivert! Hvis du vil aktivere funksjonen,=
 leser "
+-"du FileDevice-direktivet i =C2=AB%s/cupsd.conf=C2=BB."
++"du FileDevice-direktivet i =C2=AB%s/cups-files.conf=C2=BB."
+=20
+ msgid "Folio"
+ msgstr "Folio"
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/locale/cups_pl.po cups/locale/cups_pl.po
+--- cups~/locale/cups_pl.po	2012-12-07 13:00:48.000000000 +0100
++++ cups/locale/cups_pl.po	2012-12-08 01:07:24.747660332 +0100
+@@ -2895,10 +2895,10 @@
+ #, c-format
+ msgid ""
+ "File device URIs have been disabled! To enable, see the FileDevice dir=
ective "
+-"in \"%s/cupsd.conf\"."
++"in \"%s/cups-files.conf\"."
+ msgstr ""
+ "URI pliku urz=C4=85dzenia zosta=C5=82o wy=C5=82=C4=85czone! Aby w=C5=82=
=C4=85czy=C4=87, zobacz dyrektyw=C4=99 "
+-"FileDevice w \"%s/cupsd.conf\"."
++"FileDevice w \"%s/cups-files.conf\"."
+=20
+ msgid "Folio"
+ msgstr "Folio"
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/locale/cups_pt.po cups/locale/cups_pt.po
+--- cups~/locale/cups_pt.po	2012-12-07 13:00:48.000000000 +0100
++++ cups/locale/cups_pt.po	2012-12-08 01:07:37.875659840 +0100
+@@ -2897,10 +2897,10 @@
+ #, c-format
+ msgid ""
+ "File device URIs have been disabled! To enable, see the FileDevice dir=
ective "
+-"in \"%s/cupsd.conf\"."
++"in \"%s/cups-files.conf\"."
+ msgstr ""
+ "URIs do perif=C3=A9rico do ficheiro foram desactivados! Para activar, =
consulte a "
+-"directiva FileDevice em \"%s/cupsd.conf\"."
++"directiva FileDevice em \"%s/cups-files.conf\"."
+=20
+ msgid "Folio"
+ msgstr "F=C3=B3lio"
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/locale/cups_pt_BR.po cups/locale/cups_pt_BR.po
+--- cups~/locale/cups_pt_BR.po	2012-12-07 13:00:48.000000000 +0100
++++ cups/locale/cups_pt_BR.po	2012-12-08 01:07:31.707660026 +0100
+@@ -2904,10 +2904,10 @@
+ #, c-format
+ msgid ""
+ "File device URIs have been disabled! To enable, see the FileDevice dir=
ective "
+-"in \"%s/cupsd.conf\"."
++"in \"%s/cups-files.conf\"."
+ msgstr ""
+ "URIs de dispositivo de arquivo foram desativados! Para ativ=C3=A1-los,=
 consulte a "
+-"diretiva FileDevice em \"%s/cupsd.conf\"."
++"diretiva FileDevice em \"%s/cups-files.conf\"."
+=20
+ msgid "Folio"
+ msgstr "F=C3=B3lio"
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/locale/cups_ru.po cups/locale/cups_ru.po
+--- cups~/locale/cups_ru.po	2012-12-07 13:00:48.000000000 +0100
++++ cups/locale/cups_ru.po	2012-12-08 01:07:51.439659296 +0100
+@@ -2884,10 +2884,10 @@
+ #, c-format
+ msgid ""
+ "File device URIs have been disabled! To enable, see the FileDevice dir=
ective "
+-"in \"%s/cupsd.conf\"."
++"in \"%s/cups-files.conf\"."
+ msgstr ""
+ "URI-=D0=B0=D0=B4=D1=80=D0=B5=D1=81=D0=B0 =D1=84=D0=B0=D0=B9=D0=BB=D0=BE=
=D0=B2=D0=BE=D0=B3=D0=BE =D1=83=D1=81=D1=82=D1=80=D0=BE=D0=B9=D1=81=D1=82=
=D0=B2=D0=B0 =D0=BE=D1=82=D0=BA=D0=BB=D1=8E=D1=87=D0=B5=D0=BD=D1=8B! =D0=A7=
=D1=82=D0=BE=D0=B1=D1=8B =D0=B2=D0=BA=D0=BB=D1=8E=D1=87=D0=B8=D1=82=D1=8C=
 =D0=B8=D1=85, =D0=B8=D1=81=D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D1=83=D0=B9=D1=82=
=D0=B5 "
+-"=D0=B4=D0=B8=D1=80=D0=B5=D0=BA=D1=82=D0=B8=D0=B2=D1=83 FileDevice =D0=B2=
 =C2=AB%s/cupsd.conf=C2=BB."
++"=D0=B4=D0=B8=D1=80=D0=B5=D0=BA=D1=82=D0=B8=D0=B2=D1=83 FileDevice =D0=B2=
 =C2=AB%s/cups-files.conf=C2=BB."
+=20
+ msgid "Folio"
+ msgstr "=D0=A4=D0=BE=D0=BB=D0=B8=D0=BE"
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/locale/cups_sv.po cups/locale/cups_sv.po
+--- cups~/locale/cups_sv.po	2012-12-07 13:00:48.000000000 +0100
++++ cups/locale/cups_sv.po	2012-12-08 01:07:58.247659102 +0100
+@@ -2875,10 +2875,10 @@
+ #, c-format
+ msgid ""
+ "File device URIs have been disabled! To enable, see the FileDevice dir=
ective "
+-"in \"%s/cupsd.conf\"."
++"in \"%s/cups-files.conf\"."
+ msgstr ""
+ "Filenhets URI:er har blivit avaktiverade! F=C3=B6r att aktivera, se di=
rektivet "
+-"FileDevice i \"%s/cupsd.conf\"."
++"FileDevice i \"%s/cups-files.conf\"."
+=20
+ msgid "Folio"
+ msgstr "Folio"
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/locale/cups_zh.po cups/locale/cups_zh.po
+--- cups~/locale/cups_zh.po	2012-12-07 13:00:48.000000000 +0100
++++ cups/locale/cups_zh.po	2012-12-08 01:08:56.791657022 +0100
+@@ -2844,9 +2844,9 @@
+ #, c-format
+ msgid ""
+ "File device URIs have been disabled! To enable, see the FileDevice dir=
ective "
+-"in \"%s/cupsd.conf\"."
++"in \"%s/cups-files.conf\"."
+ msgstr ""
+-"=E6=96=87=E4=BB=B6=E8=AE=BE=E5=A4=87 URI =E5=B7=B2=E8=A2=AB=E5=81=9C=E7=
=94=A8=EF=BC=81=E8=A6=81=E5=90=AF=E7=94=A8=EF=BC=8C=E8=AF=B7=E5=8F=82=E9=98=
=85=E2=80=9C%s/cupsd.conf=E2=80=9D=E4=B8=AD=E7=9A=84 FileDevice =E6=8C=87=
=E4=BB=A4=E3=80=82"
++"=E6=96=87=E4=BB=B6=E8=AE=BE=E5=A4=87 URI =E5=B7=B2=E8=A2=AB=E5=81=9C=E7=
=94=A8=EF=BC=81=E8=A6=81=E5=90=AF=E7=94=A8=EF=BC=8C=E8=AF=B7=E5=8F=82=E9=98=
=85=E2=80=9C%s/cups-files.conf=E2=80=9D=E4=B8=AD=E7=9A=84 FileDevice =E6=8C=
=87=E4=BB=A4=E3=80=82"
+=20
+ msgid "Folio"
+ msgstr "=E5=AF=B9=E5=BC=80=E6=9C=AC"
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/locale/cups_zh_TW.po cups/locale/cups_zh_TW.po
+--- cups~/locale/cups_zh_TW.po	2012-12-07 13:00:48.000000000 +0100
++++ cups/locale/cups_zh_TW.po	2012-12-08 01:09:07.407656652 +0100
+@@ -2845,9 +2845,9 @@
+ #, c-format
+ msgid ""
+ "File device URIs have been disabled! To enable, see the FileDevice dir=
ective "
+-"in \"%s/cupsd.conf\"."
++"in \"%s/cups-files.conf\"."
+ msgstr ""
+-"=E5=B7=B2=E5=81=9C=E7=94=A8=E6=AA=94=E6=A1=88=E8=A8=AD=E5=82=99 URI=EF=
=BC=81=E8=8B=A5=E8=A6=81=E5=95=9F=E7=94=A8=EF=BC=8C=E8=AB=8B=E5=8F=83=E9=96=
=B1=E2=80=9C%s/cupsd.conf=E2=80=9D=E4=B8=AD=E7=9A=84 FileDevice =E6=8C=87=
=E7=A4=BA=E3=80=82"
++"=E5=B7=B2=E5=81=9C=E7=94=A8=E6=AA=94=E6=A1=88=E8=A8=AD=E5=82=99 URI=EF=
=BC=81=E8=8B=A5=E8=A6=81=E5=95=9F=E7=94=A8=EF=BC=8C=E8=AB=8B=E5=8F=83=E9=96=
=B1=E2=80=9C%s/cups-files.conf=E2=80=9D=E4=B8=AD=E7=9A=84 FileDevice =E6=8C=
=87=E7=A4=BA=E3=80=82"
+=20
+ msgid "Folio"
+ msgstr "=E5=B0=8D=E9=96=8B=E7=B4=99"
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/man/Makefile cups/man/Makefile
+--- cups~/man/Makefile	2012-12-08 00:29:09.000000000 +0100
++++ cups/man/Makefile	2012-12-08 00:29:10.000000000 +0100
+@@ -39,6 +39,7 @@
+ 		ppdpo.$(MAN1EXT)
+ MAN5	=3D	classes.conf.$(MAN5EXT) \
+ 		client.conf.$(MAN5EXT) \
++		cups-files.conf.$(MAN5EXT) \
+ 		cups-snmp.conf.$(MAN5EXT) \
+ 		cupsd.conf.$(MAN5EXT) \
+ 		mailto.conf.$(MAN5EXT) \
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/man/cups-files.conf.man.in cups/man/cups-files.conf.man.in
+--- cups~/man/cups-files.conf.man.in	1970-01-01 01:00:00.000000000 +0100
++++ cups/man/cups-files.conf.man.in	2012-12-08 00:29:10.000000000 +0100
+@@ -0,0 +1,146 @@
++.\"
++.\" "$Id$"
++.\"
++.\"   cupsd.conf man page for CUPS.
++.\"
++.\"   Copyright 2007-2012 by Apple Inc.
++.\"   Copyright 1997-2006 by Easy Software Products.
++.\"
++.\"   These coded instructions, statements, and computer programs are t=
he
++.\"   property of Apple Inc. and are protected by Federal copyright
++.\"   law.  Distribution and use rights are outlined in the file "LICEN=
SE.txt"
++.\"   which should have been included with this file.  If this file is
++.\"   file is missing or damaged, see the license at "http://www.cups.o=
rg/".
++.\"
++.TH cups-files.conf 5 "CUPS" "19 November 2012" "Apple Inc."
++.SH NAME
++cups-files.conf \- file and directory configuration file for cups
++.SH DESCRIPTION
++The \fIcups-file.conf\fR file configures the files and directories used=
 by the
++CUPS scheduler, \fIcupsd(8)\fR.  It is normally located in the
++\fI@CUPS_SERVERROOT@\fR directory.
++.LP
++Each line in the file can be a configuration directive, a blank line,
++or a comment. Comment lines start with the # character.
++.SH DIRECTIVES
++The following directives are understood by \fIcupsd(8)\fR. Consult the
++on-line help for detailed descriptions:
++.TP 5
++AccessLog filename
++.TP 5
++AccessLog syslog
++.br
++Defines the access log filename.
++.TP 5
++ConfigFilePerm mode
++.br
++Specifies the permissions for all configuration files that the schedule=
r
++writes.
++.TP 5
++DataDir path
++.br
++Specified the directory where data files can be found.
++.TP 5
++DocumentRoot directory
++.br
++Specifies the root directory for the internal web server documents.
++.TP 5
++ErrorLog filename
++.TP 5
++ErrorLog syslog
++.br
++Specifies the error log filename.
++.TP 5
++FatalErrors none
++.TP 5
++FatalErrors all -kind [... -kind]
++.TP 5
++FatalErrors kind [... kind]
++.br
++Specifies which errors are fatal, causing the scheduler to exit. "Kind"=
 is
++"browse", "config", "listen", "log", or "permissions".
++.TP 5
++FileDevice Yes
++.TP 5
++FileDevice No
++.br
++Specifies whether the file pseudo-device can be used for new
++printer queues.
++.TP 5
++FontPath directory[:directory:...]
++.br
++Specifies the search path for fonts.
++.TP 5
++Group group-name-or-number
++.br
++Specifies the group name or ID that will be used when executing
++external programs.
++.TP 5
++LogFilePerm mode
++.br
++Specifies the permissions for all log files that the scheduler writes.
++.TP 5
++PageLog filename
++.TP 5
++PageLog syslog
++.br
++Specifies the page log filename.
++.TP 5
++Printcap
++.TP 5
++Printcap filename
++.br
++Specifies the filename for a printcap file that is updated
++automatically with a list of available printers (needed for
++legacy applications); specifying Printcap with no filename
++disables printcap generation.
++.TP 5
++RemoteRoot user-name
++.br
++Specifies the username that is associated with unauthenticated root
++accesses.
++.TP 5
++RequestRoot directory
++.br
++Specifies the directory to store print jobs and other HTTP request
++data.
++.TP 5
++ServerBin directory
++.br
++Specifies the directory where backends, CGIs, daemons, and filters may
++be found.
++.TP 5
++ServerCertificate filename
++.br
++Specifies the encryption certificate to use.
++.TP 5
++ServerKey filename
++.br
++Specifies the encryption key to use.
++.TP 5
++ServerRoot directory
++.br
++Specifies the directory where the server configuration files can be fou=
nd.
++.TP 5
++SystemGroup group-name [group-name ...]
++.br
++Specifies the group(s) to use for System class authentication.
++.TP 5
++TempDir directory
++.br
++Specifies the directory where temporary files are stored.
++.TP 5
++User user-name
++.br
++Specifies the user name or ID that is used when running external progra=
ms.
++.SH SEE ALSO
++\fIclasses.conf(5)\fR, \fIcupsd(8)\fR, \fIcupsd.conf(5)\fR, \fImime.con=
vs(5)\fR,
++\fImime.types(5)\fR, \fIprinters.conf(5)\fR,
++\fIsubscriptions.conf(5)\fR,
++.br
++http://localhost:631/help
++.SH COPYRIGHT
++Copyright 2007-2012 by Apple Inc.
++.\"
++.\" End of "$Id$".
++.\"
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/man/cupsd.conf.man.in cups/man/cupsd.conf.man.in
+--- cups~/man/cupsd.conf.man.in	2012-12-07 13:00:48.000000000 +0100
++++ cups/man/cupsd.conf.man.in	2012-12-08 00:29:10.000000000 +0100
+@@ -12,13 +12,16 @@
+ .\"   which should have been included with this file.  If this file is
+ .\"   file is missing or damaged, see the license at "http://www.cups.o=
rg/".
+ .\"
+-.TH cupsd.conf 5 "CUPS" "28 January 2010" "Apple Inc."
++.TH cupsd.conf 5 "CUPS" "19 November 2012" "Apple Inc."
+ .SH NAME
+ cupsd.conf \- server configuration file for cups
+ .SH DESCRIPTION
+ The \fIcupsd.conf\fR file configures the CUPS scheduler, \fIcupsd(8)\fR=
.  It
+-is normally located in the \fI@CUPS_SERVERROOT@\fR directory.
+-.LP
++is normally located in the \fI@CUPS_SERVERROOT@\fR directory. \fBNote:\=
fR
++File, directory, and user configuration directives that used to be allo=
wed in
++the \fIcupsd.conf\fR file are now stored in the \fIcups-files.conf(5)\f=
R instead
++in order to prevent certain types of privilege escalation attacks.
++LP
+ Each line in the file can be a configuration directive, a blank line,
+ or a comment. Comment lines start with the # character. The
+ configuration directives are intentionally similar to those used by the
+@@ -27,12 +30,6 @@
+ The following directives are understood by \fIcupsd(8)\fR. Consult the
+ on-line help for detailed descriptions:
+ .TP 5
+-AccessLog filename
+-.TP 5
+-AccessLog syslog
+-.br
+-Defines the access log filename.
+-.TP 5
+ AccessLogLevel config
+ .TP 5
+ AccessLogLevel actions
+@@ -61,20 +58,6 @@
+ .br
+ Allows access from the named hosts or addresses.
+ .TP 5
+-AuthClass User
+-.TP 5
+-AuthClass Group
+-.TP 5
+-AuthClass System
+-.br
+-Specifies the authentication class (User, Group, System) -
+-\fBthis directive is deprecated\fR.
+-.TP 5
+-AuthGroupName group-name
+-.br
+-Specifies the authentication group - \fBthis directive is
+-deprecated\fR.
+-.TP 5
+ AuthType None
+ .TP 5
+ AuthType Basic
+@@ -220,7 +203,7 @@
+ .TP 5
+ Browsing No
+ .br
+-Specifies whether or not remote printer browsing should be enabled.
++Specifies whether or not shared printers should be advertised.
+ .TP 5
+ Classification banner
+ .br
+@@ -233,15 +216,6 @@
+ Specifies whether to allow users to override the classification
+ of individual print jobs.
+ .TP 5
+-ConfigFilePerm mode
+-.br
+-Specifies the permissions for all configuration files that the schedule=
r
+-writes.
+-.TP 5
+-DataDir path
+-.br
+-Specified the directory where data files can be found.
+-.TP 5
+ DefaultAuthType Basic
+ .TP 5
+ DefaultAuthType BasicDigest
+@@ -309,10 +283,6 @@
+ causes the update to happen as soon as possible, typically within a few
+ milliseconds.
+ .TP 5
+-DocumentRoot directory
+-.br
+-Specifies the root directory for the internal web server documents.
+-.TP 5
+ Encryption IfRequested
+ .TP 5
+ Encryption Never
+@@ -322,28 +292,6 @@
+ Specifies the level of encryption that is required for a particular
+ location.
+ .TP 5
+-ErrorLog filename
+-.TP 5
+-ErrorLog syslog
+-.br
+-Specifies the error log filename.
+-.TP 5
+-FatalErrors none
+-.TP 5
+-FatalErrors all -kind [... -kind]
+-.TP 5
+-FatalErrors kind [... kind]
+-.br
+-Specifies which errors are fatal, causing the scheduler to exit. "Kind"=
 is
+-"browse", "config", "listen", "log", or "permissions".
+-.TP 5
+-FileDevice Yes
+-.TP 5
+-FileDevice No
+-.br
+-Specifies whether the file pseudo-device can be used for new
+-printer queues.
+-.TP 5
+ FilterLimit limit
+ .br
+ Specifies the maximum cost of filters that are run concurrently.
+@@ -449,10 +397,6 @@
+ Specifies the number of debugging messages that are logged when an erro=
r
+ occurs in a print job.
+ .TP 5
+-LogFilePerm mode
+-.br
+-Specifies the permissions for all log files that the scheduler writes.
+-.TP 5
+ LogLevel alert
+ .TP 5
+ LogLevel crit
+@@ -526,12 +470,6 @@
+ .br
+ Specifies the order of HTTP access control (allow,deny or deny,allow)
+ .TP 5
+-PageLog filename
+-.TP 5
+-PageLog syslog
+-.br
+-Specifies the page log filename.
+-.TP 5
+ PageLogFormat format string
+ .br
+ Specifies the format of page log lines.
+@@ -561,15 +499,6 @@
+ Specifies whether or not to preserve the job history after they are
+ printed.
+ .TP 5
+-Printcap
+-.TP 5
+-Printcap filename
+-.br
+-Specifies the filename for a printcap file that is updated
+-automatically with a list of available printers (needed for
+-legacy applications); specifying Printcap with no filename
+-disables printcap generation.
+-.TP 5
+ PrintcapFormat bsd
+ .TP 5
+ PrintcapFormat plist
+@@ -578,29 +507,11 @@
+ .br
+ Specifies the format of the printcap file.
+ .TP 5
+-PrintcapGUI
+-.TP 5
+-PrintcapGUI gui-program-filename
+-.br
+-Specifies whether to generate option panel definition files on
+-some operating systems. When provided with no program filename,
+-disables option panel definition files.
+-.TP 5
+ ReloadTimeout seconds
+ .br
+ Specifies the amount of time to wait for job completion before
+ restarting the scheduler.
+ .TP 5
+-RemoteRoot user-name
+-.br
+-Specifies the username that is associated with unauthenticated root
+-accesses.
+-.TP 5
+-RequestRoot directory
+-.br
+-Specifies the directory to store print jobs and other HTTP request
+-data.
+-.TP 5
+ Require group group-name-list
+ .TP 5
+ Require user user-name-list
+@@ -630,27 +541,10 @@
+ Specifies an alternate name that the server is known by. The special na=
me "*"
+ allows any name to be used.
+ .TP 5
+-ServerBin directory
+-.br
+-Specifies the directory where backends, CGIs, daemons, and filters may
+-be found.
+-.TP 5
+-ServerCertificate filename
+-.br
+-Specifies the encryption certificate to use.
+-.TP 5
+-ServerKey filename
+-.br
+-Specifies the encryption key to use.
+-.TP 5
+ ServerName hostname-or-ip-address
+ .br
+ Specifies the fully-qualified hostname of the server.
+ .TP 5
+-ServerRoot directory
+-.br
+-Specifies the directory where the server configuration files can be fou=
nd.
+-.TP 5
+ ServerTokens Full
+ .TP 5
+ ServerTokens Major
+@@ -686,14 +580,6 @@
+ .br
+ Listens on the specified port for encrypted connections.
+ .TP 5
+-SystemGroup group-name [group-name ...]
+-.br
+-Specifies the group(s) to use for System class authentication.
+-.TP 5
+-TempDir directory
+-.br
+-Specifies the directory where temporary files are stored.
+-.TP 5
+ Timeout seconds
+ .br
+ Specifies the HTTP request timeout in seconds.
+@@ -702,7 +588,7 @@
+ .br
+ Specifies the user name or ID that is used when running external progra=
ms.
+ .SH SEE ALSO
+-\fIclasses.conf(5)\fR, \fIcupsd(8)\fR, \fImime.convs(5)\fR,
++\fIclasses.conf(5)\fR, \fIcups-files.conf(8)\fR, \fIcupsd(8)\fR, \fImim=
e.convs(5)\fR,
+ \fImime.types(5)\fR, \fIprinters.conf(5)\fR,
+ \fIsubscriptions.conf(5)\fR,
+ .br
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/scheduler/client.c cups/scheduler/client.c
+--- cups~/scheduler/client.c	2012-12-08 00:29:09.000000000 +0100
++++ cups/scheduler/client.c	2012-12-08 00:29:10.000000000 +0100
+@@ -35,7 +35,7 @@
+  *   get_cdsa_certificate() - Get a SSL/TLS certificate from the System
+  *                            keychain.
+  *   get_file()             - Get a filename and state info.
+- *   install_conf_file()    - Install a configuration file.
++ *   install_cupsd_conf()   - Install a configuration file.
+  *   is_cgi()               - Is the resource a CGI script/program?
+  *   is_path_absolute()     - Is a path absolute and free of relative e=
lements
+  *                            (i.e. "..").
+@@ -102,7 +102,7 @@
+ #endif /* HAVE_CDSASSL */
+ static char		*get_file(cupsd_client_t *con, struct stat *filestats,
+ 			          char *filename, int len);
+-static http_status_t	install_conf_file(cupsd_client_t *con);
++static http_status_t	install_cupsd_conf(cupsd_client_t *con);
+ static int		is_cgi(cupsd_client_t *con, const char *filename,
+ 		               struct stat *filestats, mime_type_t *type);
+ static int		is_path_absolute(const char *path);
+@@ -1691,17 +1691,14 @@
+ 	    * Validate the resource name...
+ 	    */
+=20
+-            if (strncmp(con->uri, "/admin/conf/", 12) ||
+-	        strchr(con->uri + 12, '/') ||
+-		strlen(con->uri) =3D=3D 12)
++            if (strcmp(con->uri, "/admin/conf/cupsd.conf"))
+ 	    {
+ 	     /*
+-	      * PUT can only be done to configuration files under
+-	      * /admin/conf...
++	      * PUT can only be done to the cupsd.conf file...
+ 	      */
+=20
+ 	      cupsdLogMessage(CUPSD_LOG_ERROR,
+-			      "Request for subdirectory \"%s\"!", con->uri);
++                              "Disallowed PUT request for \"%s\"!", con=
->uri);
+=20
+ 	      if (!cupsdSendError(con, HTTP_FORBIDDEN, CUPSD_AUTH_NONE))
+ 	      {
+@@ -2019,7 +2016,7 @@
+ 	  * Install the configuration file...
+ 	  */
+=20
+-          status =3D install_conf_file(con);
++          status =3D install_cupsd_conf(con);
+=20
+          /*
+ 	  * Return the status to the client...
+@@ -3685,11 +3682,11 @@
+=20
+=20
+ /*
+- * 'install_conf_file()' - Install a configuration file.
++ * 'install_cupsd_conf()' - Install a configuration file.
+  */
+=20
+ static http_status_t			/* O - Status */
+-install_conf_file(cupsd_client_t *con)	/* I - Connection */
++install_cupsd_conf(cupsd_client_t *con)	/* I - Connection */
+ {
+   cups_file_t	*in,			/* Input file */
+ 		*out;			/* Output file */
+@@ -3705,9 +3702,9 @@
+   * First construct the filenames...
+   */
+=20
+-  snprintf(conffile, sizeof(conffile), "%s%s", ServerRoot, con->uri + 1=
1);
+-  snprintf(newfile, sizeof(newfile), "%s%s.N", ServerRoot, con->uri + 1=
1);
+-  snprintf(oldfile, sizeof(oldfile), "%s%s.O", ServerRoot, con->uri + 1=
1);
++  snprintf(conffile, sizeof(conffile), "%s/cupsd.conf", ServerRoot);
++  snprintf(newfile, sizeof(newfile), "%s/cupsd.conf.N", ServerRoot);
++  snprintf(oldfile, sizeof(oldfile), "%s/cupsd.conf.O", ServerRoot);
+=20
+   cupsdLogMessage(CUPSD_LOG_INFO, "Installing config file \"%s\"...", c=
onffile);
+=20
+@@ -3829,14 +3826,10 @@
+   }
+=20
+  /*
+-  * If the cupsd.conf file was updated, set the NeedReload flag...
++  * Set the NeedReload flag...
+   */
+=20
+-  if (!strcmp(con->uri, "/admin/conf/cupsd.conf"))
+-    NeedReload =3D RELOAD_CUPSD;
+-  else
+-    NeedReload =3D RELOAD_ALL;
+-
++  NeedReload =3D RELOAD_CUPSD;
+   ReloadTime =3D time(NULL);
+=20
+  /*
+--- a/scheduler/conf.c
++++ b/scheduler/conf.c
+@@ -26,7 +26,9 @@
+  *   parse_fatal_errors()     - Parse FatalErrors values in a string.
+  *   parse_groups()           - Parse system group names in a string.
+  *   parse_protocols()        - Parse browse protocols in a string.
+- *   read_configuration()     - Read a configuration file.
++ *   parse_variable()         - Parse a variable line.
++ *   read_cupsd_conf()        - Read the cupsd.conf configuration file.
++ *   read_cups_files_conf()   - Read the cups-files.conf configuration =
file.
+  *   read_location()          - Read a <Location path> definition.
+  *   read_policy()            - Read a <Policy name> definition.
+  */
+@@ -79,9 +81,8 @@
+  * Local globals...
+  */
+=20
+-static const cupsd_var_t	variables[] =3D
++static const cupsd_var_t	cupsd_vars[] =3D
+ {
+-  { "AccessLog",		&AccessLog,		CUPSD_VARTYPE_STRING },
+ #ifdef __APPLE__
+   { "AppleQuotas",		&AppleQuotas,		CUPSD_VARTYPE_BOOLEAN },
+ #endif  /* __APPLE__ */
+@@ -103,24 +104,17 @@
+   { "BrowseTimeout",		&BrowseTimeout,		CUPSD_VARTYPE_INTEGER },
+   { "BrowseWebIF",		&BrowseWebIF,		CUPSD_VARTYPE_BOOLEAN },
+   { "Browsing",			&Browsing,		CUPSD_VARTYPE_BOOLEAN },
+-  { "CacheDir",			&CacheDir,		CUPSD_VARTYPE_STRING },
+   { "Classification",		&Classification,	CUPSD_VARTYPE_STRING },
+   { "ClassifyOverride",		&ClassifyOverride,	CUPSD_VARTYPE_BOOLEAN },
+-  { "ConfigFilePerm",		&ConfigFilePerm,	CUPSD_VARTYPE_INTEGER },
+-  { "DataDir",			&DataDir,		CUPSD_VARTYPE_STRING },
+   { "DefaultLanguage",		&DefaultLanguage,	CUPSD_VARTYPE_STRING },
+   { "DefaultLeaseDuration",	&DefaultLeaseDuration,	CUPSD_VARTYPE_INTEGE=
R },
+   { "DefaultPaperSize",		&DefaultPaperSize,	CUPSD_VARTYPE_STRING },
+   { "DefaultPolicy",		&DefaultPolicy,		CUPSD_VARTYPE_STRING },
+   { "DefaultShared",		&DefaultShared,		CUPSD_VARTYPE_BOOLEAN },
+   { "DirtyCleanInterval",	&DirtyCleanInterval,	CUPSD_VARTYPE_INTEGER },
+-  { "DocumentRoot",		&DocumentRoot,		CUPSD_VARTYPE_STRING },
+-  { "ErrorLog",			&ErrorLog,		CUPSD_VARTYPE_STRING },
+   { "ErrorPolicy",		&ErrorPolicy,		CUPSD_VARTYPE_STRING },
+-  { "FileDevice",		&FileDevice,		CUPSD_VARTYPE_BOOLEAN },
+   { "FilterLimit",		&FilterLimit,		CUPSD_VARTYPE_INTEGER },
+   { "FilterNice",		&FilterNice,		CUPSD_VARTYPE_INTEGER },
+-  { "FontPath",			&FontPath,		CUPSD_VARTYPE_STRING },
+   { "HideImplicitMembers",	&HideImplicitMembers,	CUPSD_VARTYPE_BOOLEAN =
},
+   { "ImplicitClasses",		&ImplicitClasses,	CUPSD_VARTYPE_BOOLEAN },
+   { "ImplicitAnyClasses",	&ImplicitAnyClasses,	CUPSD_VARTYPE_BOOLEAN },
+@@ -135,8 +129,6 @@
+   { "LimitRequestBody",		&MaxRequestSize,	CUPSD_VARTYPE_INTEGER },
+   { "ListenBackLog",		&ListenBackLog,		CUPSD_VARTYPE_INTEGER },
+   { "LogDebugHistory",		&LogDebugHistory,	CUPSD_VARTYPE_INTEGER },
+-  { "LogFilePerm",		&LogFilePerm,		CUPSD_VARTYPE_INTEGER },
+-  { "LPDConfigFile",		&LPDConfigFile,		CUPSD_VARTYPE_STRING },
+   { "MaxActiveJobs",		&MaxActiveJobs,		CUPSD_VARTYPE_INTEGER },
+   { "MaxClients",		&MaxClients,		CUPSD_VARTYPE_INTEGER },
+   { "MaxClientsPerHost",	&MaxClientsPerHost,	CUPSD_VARTYPE_INTEGER },
+@@ -154,18 +146,34 @@
+   { "MaxSubscriptionsPerPrinter",&MaxSubscriptionsPerPrinter,	CUPSD_VAR=
TYPE_INTEGER },
+   { "MaxSubscriptionsPerUser",	&MaxSubscriptionsPerUser,	CUPSD_VARTYPE_=
INTEGER },
+   { "MultipleOperationTimeout",	&MultipleOperationTimeout,	CUPSD_VARTYP=
E_INTEGER },
+-  { "PageLog",			&PageLog,		CUPSD_VARTYPE_STRING },
+   { "PageLogFormat",		&PageLogFormat,		CUPSD_VARTYPE_STRING },
+   { "PreserveJobFiles",		&JobFiles,		CUPSD_VARTYPE_BOOLEAN },
+   { "PreserveJobHistory",	&JobHistory,		CUPSD_VARTYPE_BOOLEAN },
+-  { "Printcap",			&Printcap,		CUPSD_VARTYPE_STRING },
+-  { "PrintcapGUI",		&PrintcapGUI,		CUPSD_VARTYPE_STRING },
+   { "ReloadTimeout",		&ReloadTimeout,		CUPSD_VARTYPE_INTEGER },
+-  { "RemoteRoot",		&RemoteRoot,		CUPSD_VARTYPE_STRING },
+-  { "RequestRoot",		&RequestRoot,		CUPSD_VARTYPE_STRING },
+   { "RIPCache",			&RIPCache,		CUPSD_VARTYPE_STRING },
+   { "RootCertDuration",		&RootCertDuration,	CUPSD_VARTYPE_INTEGER },
+   { "ServerAdmin",		&ServerAdmin,		CUPSD_VARTYPE_STRING },
++  { "ServerName",		&ServerName,		CUPSD_VARTYPE_STRING },
++  { "Timeout",			&Timeout,		CUPSD_VARTYPE_INTEGER },
++  { "UseNetworkDefault",	&UseNetworkDefault,	CUPSD_VARTYPE_BOOLEAN }
++};
++static const cupsd_var_t	cupsfiles_vars[] =3D
++{
++  { "AccessLog",		&AccessLog,		CUPSD_VARTYPE_STRING },
++  { "CacheDir",			&CacheDir,		CUPSD_VARTYPE_STRING },
++  { "ConfigFilePerm",		&ConfigFilePerm,	CUPSD_VARTYPE_INTEGER },
++  { "DataDir",			&DataDir,		CUPSD_VARTYPE_STRING },
++  { "DocumentRoot",		&DocumentRoot,		CUPSD_VARTYPE_STRING },
++  { "ErrorLog",			&ErrorLog,		CUPSD_VARTYPE_STRING },
++  { "FileDevice",		&FileDevice,		CUPSD_VARTYPE_BOOLEAN },
++  { "FontPath",			&FontPath,		CUPSD_VARTYPE_STRING },
++  { "LogFilePerm",		&LogFilePerm,		CUPSD_VARTYPE_INTEGER },
++  { "LPDConfigFile",		&LPDConfigFile,		CUPSD_VARTYPE_STRING },
++  { "PageLog",			&PageLog,		CUPSD_VARTYPE_STRING },
++  { "Printcap",			&Printcap,		CUPSD_VARTYPE_STRING },
++  { "PrintcapGUI",		&PrintcapGUI,		CUPSD_VARTYPE_STRING },
++  { "RemoteRoot",		&RemoteRoot,		CUPSD_VARTYPE_STRING },
++  { "RequestRoot",		&RequestRoot,		CUPSD_VARTYPE_STRING },
+   { "ServerBin",		&ServerBin,		CUPSD_VARTYPE_PATHNAME },
+ #ifdef HAVE_SSL
+   { "ServerCertificate",	&ServerCertificate,	CUPSD_VARTYPE_PATHNAME },
+@@ -173,7 +181,6 @@
+   { "ServerKey",		&ServerKey,		CUPSD_VARTYPE_PATHNAME },
+ #  endif /* HAVE_LIBSSL || HAVE_GNUTLS */
+ #endif /* HAVE_SSL */
+-  { "ServerName",		&ServerName,		CUPSD_VARTYPE_STRING },
+   { "ServerRoot",		&ServerRoot,		CUPSD_VARTYPE_PATHNAME },
+   { "SMBConfigFile",		&SMBConfigFile,		CUPSD_VARTYPE_STRING },
+   { "StateDir",			&StateDir,		CUPSD_VARTYPE_STRING },
+@@ -181,11 +188,7 @@
+   { "SystemGroupAuthKey",	&SystemGroupAuthKey,	CUPSD_VARTYPE_STRING },
+ #endif /* HAVE_AUTHORIZATION_H */
+   { "TempDir",			&TempDir,		CUPSD_VARTYPE_PATHNAME },
+-  { "Timeout",			&Timeout,		CUPSD_VARTYPE_INTEGER },
+-  { "UseNetworkDefault",	&UseNetworkDefault,	CUPSD_VARTYPE_BOOLEAN }
+ };
+-#define NUM_VARS	(sizeof(variables) / sizeof(variables[0]))
+-
+=20
+ static const unsigned	ones[4] =3D
+ 			{
+@@ -209,7 +212,12 @@
+ static int		parse_fatal_errors(const char *s);
+ static int		parse_groups(const char *s);
+ static int		parse_protocols(const char *s);
+-static int		read_configuration(cups_file_t *fp);
++static int		parse_variable(const char *filename, int linenum,
++				const char *line, const char *value,
++				size_t num_vars,
++				const cupsd_var_t *vars);
++static int		read_cupsd_conf(cups_file_t *fp);
++static int		read_cups_files_conf(cups_file_t *fp);
+ static int		read_location(cups_file_t *fp, char *name, int linenum);
+ static int		read_policy(cups_file_t *fp, char *name, int linenum);
+=20
+@@ -695,18 +703,59 @@
+ #endif  /* __APPLE__ */
+=20
+  /*
+-  * Read the configuration file...
++  * Read the cups-files.conf file...
++  */
++
++  if ((fp =3D cupsFileOpen(CupsFilesFile, "r")) !=3D NULL)
++  {
++    status =3D read_cups_files_conf(fp);
++
++    cupsFileClose(fp);
++
++    if (!status)
++    {
++      if (TestConfigFile)
++        printf("%s contains errors\n", CupsFilesFile);
++      else
++        cupsdLogMessage(CUPSD_LOG_CRIT, "Unable to read %s", CupsFilesF=
ile);
++      return (0);
++    }
++  }
++  else if (errno =3D=3D ENOENT)
++    cupsdLogMessage(CUPSD_LOG_INFO, "No %s, using defaults.", CupsFiles=
File);
++  else
++  {
++    cupsdLogMessage(CUPSD_LOG_CRIT, "Unable to open %s: %s", CupsFilesF=
ile,
++                    strerror(errno));
++    return (0);
++  }
++
++  if (!ErrorLog)
++    cupsdSetString(&ErrorLog, CUPS_LOGDIR "/error_log");
++
++ /*
++  * Read the cupsd.conf file...
+   */
+=20
+   if ((fp =3D cupsFileOpen(ConfigurationFile, "r")) =3D=3D NULL)
++  {
++    cupsdLogMessage(CUPSD_LOG_CRIT, "Unable to open %s: %s", Configurat=
ionFile,
++                    strerror(errno));
+     return (0);
++  }
+=20
+-  status =3D read_configuration(fp);
++  status =3D read_cupsd_conf(fp);
+=20
+   cupsFileClose(fp);
+=20
+   if (!status)
++  {
++    if (TestConfigFile)
++      printf("%s contains errors\n", ConfigurationFile);
++    else
++      cupsdLogMessage(CUPSD_LOG_CRIT, "Unable to read %s", Configuratio=
nFile);
+     return (0);
++  }
+=20
+   RunUser =3D getuid();
+=20
+@@ -826,6 +875,13 @@
+   BrowseACL =3D cupsdFindLocation("CUPS_INTERNAL_BROWSE_ACL");
+=20
+  /*
++  * Make sure ConfigFilePerm and LogFilePerm have sane values...
++  */
++
++  ConfigFilePerm &=3D 0664;
++  LogFilePerm    &=3D 0664;
++
++ /*
+   * Open the system log for cupsd if necessary...
+   */
+=20
+@@ -2398,13 +2454,174 @@
+=20
+=20
+ /*
+- * 'read_configuration()' - Read a configuration file.
++ * 'parse_variable()' - Parse a variable line.
+  */
+=20
+ static int				/* O - 1 on success, 0 on failure */
+-read_configuration(cups_file_t *fp)	/* I - File to read from */
++parse_variable(
++    const char        *filename,	/* I - Name of configuration file */
++    int               linenum,		/* I - Line in configuration file */
++    const char        *line,		/* I - Line from configuration file */
++    const char        *value,		/* I - Value from configuration file */
++    size_t            num_vars,		/* I - Number of variables */
++    const cupsd_var_t *vars)		/* I - Variables */
++{
++  size_t		i;		/* Looping var */
++  const cupsd_var_t	*var;		/* Variables */
++  char			temp[1024];	/* Temporary string */
++
++
++  for (i =3D num_vars, var =3D vars; i > 0; i --, var ++)
++    if (!strcasecmp(line, var->name))
++      break;
++
++  if (i =3D=3D 0)
++  {
++   /*
++    * Unknown directive!  Output an error message and continue...
++    */
++
++    if (!value)
++      cupsdLogMessage(CUPSD_LOG_ERROR, "Missing value for %s on line %d=
 of %s.",
++		      line, linenum, filename);
++    else
++      cupsdLogMessage(CUPSD_LOG_ERROR, "Unknown directive %s on line %d=
 of %s.",
++		      line, linenum, filename);
++
++    return (0);
++  }
++
++  switch (var->type)
++  {
++    case CUPSD_VARTYPE_INTEGER :
++	if (!value)
++	{
++	  cupsdLogMessage(CUPSD_LOG_ERROR,
++			  "Missing integer value for %s on line %d of %s.",
++			  line, linenum, filename);
++          return (0);
++	}
++	else if (!isdigit(*value & 255))
++	{
++	  cupsdLogMessage(CUPSD_LOG_ERROR,
++			  "Bad integer value for %s on line %d of %s.",
++			  line, linenum, filename);
++          return (0);
++	}
++	else
++	{
++	  int	n;		/* Number */
++	  char	*units;		/* Units */
++
++	  n =3D strtol(value, &units, 0);
++
++	  if (units && *units)
++	  {
++	    if (tolower(units[0] & 255) =3D=3D 'g')
++	      n *=3D 1024 * 1024 * 1024;
++	    else if (tolower(units[0] & 255) =3D=3D 'm')
++	      n *=3D 1024 * 1024;
++	    else if (tolower(units[0] & 255) =3D=3D 'k')
++	      n *=3D 1024;
++	    else if (tolower(units[0] & 255) =3D=3D 't')
++	      n *=3D 262144;
++	    else
++	    {
++	      cupsdLogMessage(CUPSD_LOG_ERROR,
++			      "Unknown integer value for %s on line %d of %s.",
++			      line, linenum, filename);
++	      return (0);
++	    }
++	  }
++
++	  if (n < 0)
++	  {
++	    cupsdLogMessage(CUPSD_LOG_ERROR,
++			    "Bad negative integer value for %s on line %d of "
++			    "%s.", line, linenum, filename);
++	    return (0);
++	  }
++	  else
++	  {
++	    *((int *)var->ptr) =3D n;
++	  }
++	}
++	break;
++
++    case CUPSD_VARTYPE_BOOLEAN :
++	if (!value)
++	{
++	  cupsdLogMessage(CUPSD_LOG_ERROR,
++			  "Missing boolean value for %s on line %d of %s.",
++			  line, linenum, filename);
++	  return (0);
++	}
++	else if (!strcasecmp(value, "true") ||
++		 !strcasecmp(value, "on") ||
++		 !strcasecmp(value, "enabled") ||
++		 !strcasecmp(value, "yes") ||
++		 atoi(value) !=3D 0)
++	{
++	  *((int *)var->ptr) =3D TRUE;
++	}
++	else if (!strcasecmp(value, "false") ||
++		 !strcasecmp(value, "off") ||
++		 !strcasecmp(value, "disabled") ||
++		 !strcasecmp(value, "no") ||
++		 !strcasecmp(value, "0"))
++	{
++	  *((int *)var->ptr) =3D FALSE;
++	}
++	else
++	{
++	  cupsdLogMessage(CUPSD_LOG_ERROR,
++			  "Unknown boolean value %s on line %d of %s.",
++			  value, linenum, filename);
++	  return (0);
++	}
++	break;
++
++    case CUPSD_VARTYPE_PATHNAME :
++	if (!value)
++	{
++	  cupsdLogMessage(CUPSD_LOG_ERROR,
++			  "Missing pathname value for %s on line %d of %s.",
++			  line, linenum, filename);
++	  return (0);
++	}
++
++	if (value[0] =3D=3D '/')
++	  strlcpy(temp, value, sizeof(temp));
++	else
++	  snprintf(temp, sizeof(temp), "%s/%s", ServerRoot, value);
++
++	if (access(temp, 0))
++	{
++	  cupsdLogMessage(CUPSD_LOG_ERROR,
++			  "File or directory for \"%s %s\" on line %d of %s "
++			  "does not exist.", line, value, linenum, filename);
++	  return (0);
++	}
++
++	cupsdSetString((char **)var->ptr, temp);
++	break;
++
++    case CUPSD_VARTYPE_STRING :
++	cupsdSetString((char **)var->ptr, value);
++	break;
++  }
++
++  return (1);
++}
++
++
++/*
++ * 'read_cupsd_conf()' - Read the cupsd.conf configuration file.
++ */
++
++static int				/* O - 1 on success, 0 on failure */
++read_cupsd_conf(cups_file_t *fp)	/* I - File to read from */
+ {
+-  int			i;		/* Looping var */
+   int			linenum;	/* Current line number */
+   char			line[HTTP_MAX_BUFFER],
+ 					/* Line from file */
+@@ -2416,7 +2633,6 @@
+ 			*value,		/* Pointer to value */
+ 			*valueptr;	/* Pointer into value */
+   int			valuelen;	/* Length of value */
+-  cupsd_var_t const	*var;		/* Current variable */
+   http_addrlist_t	*addrlist,	/* Address list */
+ 			*addr;		/* Current address */
+   unsigned		ip[4],		/* Address value */
+@@ -2426,7 +2642,6 @@
+   cupsd_location_t	*location;	/* Browse location */
+   cups_file_t		*incfile;	/* Include file */
+   char			incname[1024];	/* Include filename */
+-  struct group		*group;		/* Group */
+=20
+=20
+  /*
+@@ -2458,7 +2673,7 @@
+ 	                incname, strerror(errno));
+       else
+       {
+-        read_configuration(incfile);
++        read_cupsd_conf(incfile);
+ 	cupsFileClose(incfile);
+       }
+     }
+@@ -2482,8 +2697,6 @@
+       if (linenum =3D=3D 0)
+ 	return (0);
+     }
+-    else if (!strcasecmp(line, "FatalErrors"))
+-      FatalErrors =3D parse_fatal_errors(value);
+     else if (!strcasecmp(line, "FaxRetryInterval") && value)
+     {
+       JobRetryInterval =3D atoi(value);
+@@ -3160,81 +3373,6 @@
+       }
+     }
+ #endif /* HAVE_SSL */
+-    else if (!strcasecmp(line, "User") && value)
+-    {
+-     /*
+-      * User ID to run as...
+-      */
+-
+-      if (isdigit(value[0] & 255))
+-      {
+-        int uid =3D atoi(value);
+-
+-	if (!uid)
+-	  cupsdLogMessage(CUPSD_LOG_ERROR,
+-	                  "Will not use User 0 as specified on line %d "
+-			  "for security reasons.  You must use a non-"
+-			  "privileged account instead.",
+-	                  linenum);
+-        else
+-	  User =3D atoi(value);
+-      }
+-      else
+-      {
+-        struct passwd *p;	/* Password information */
+-
+-        endpwent();
+-	p =3D getpwnam(value);
+-
+-	if (p)
+-	{
+-	  if (!p->pw_uid)
+-	    cupsdLogMessage(CUPSD_LOG_ERROR,
+-	                    "Will not use User %s (UID=3D0) as specified on li=
ne "
+-			    "%d for security reasons.  You must use a non-"
+-			    "privileged account instead.",
+-	                    value, linenum);
+-	  else
+-	    User =3D p->pw_uid;
+-	}
+-	else
+-	  cupsdLogMessage(CUPSD_LOG_ERROR,
+-	                  "Unknown User \"%s\" on line %d, ignoring!",
+-	                  value, linenum);
+-      }
+-    }
+-    else if (!strcasecmp(line, "Group") && value)
+-    {
+-     /*
+-      * Group ID to run as...
+-      */
+-
+-      if (isdigit(value[0]))
+-        Group =3D atoi(value);
+-      else
+-      {
+-        endgrent();
+-	group =3D getgrnam(value);
+-
+-	if (group !=3D NULL)
+-	  Group =3D group->gr_gid;
+-	else
+-	  cupsdLogMessage(CUPSD_LOG_ERROR,
+-	                  "Unknown Group \"%s\" on line %d, ignoring!",
+-	                  value, linenum);
+-      }
+-    }
+-    else if (!strcasecmp(line, "SystemGroup") && value)
+-    {
+-     /*
+-      * SystemGroup (admin) group(s)...
+-      */
+-
+-      if (!parse_groups(value))
+-	cupsdLogMessage(CUPSD_LOG_ERROR,
+-	                "Unknown SystemGroup \"%s\" on line %d, ignoring!",
+-	                value, linenum);
+-    }
+     else if (!strcasecmp(line, "HostNameLookups") && value)
+     {
+      /*
+@@ -3313,22 +3451,6 @@
+         cupsdLogMessage(CUPSD_LOG_WARN, "Unknown LogTimeFormat %s on li=
ne %d.",
+ 	                value, linenum);
+     }
+-    else if (!strcasecmp(line, "PrintcapFormat") && value)
+-    {
+-     /*
+-      * Format of printcap file?
+-      */
+-
+-      if (!strcasecmp(value, "bsd"))
+-        PrintcapFormat =3D PRINTCAP_BSD;
+-      else if (!strcasecmp(value, "plist"))
+-        PrintcapFormat =3D PRINTCAP_PLIST;
+-      else if (!strcasecmp(value, "solaris"))
+-        PrintcapFormat =3D PRINTCAP_SOLARIS;
+-      else
+-	cupsdLogMessage(CUPSD_LOG_WARN, "Unknown PrintcapFormat %s on line %d.=
",
+-	                value, linenum);
+-    }
+     else if (!strcasecmp(line, "ServerTokens") && value)
+     {
+      /*
+@@ -3432,123 +3554,197 @@
+ 			"line %d.", value, linenum);
+     }
+ #endif /* HAVE_SSL */
++    else if (!strcasecmp(line, "AccessLog") ||
++             !strcasecmp(line, "CacheDir") ||
++             !strcasecmp(line, "ConfigFilePerm") ||
++             !strcasecmp(line, "DataDir") ||
++             !strcasecmp(line, "DocumentRoot") ||
++             !strcasecmp(line, "ErrorLog") ||
++             !strcasecmp(line, "FatalErrors") ||
++             !strcasecmp(line, "FileDevice") ||
++             !strcasecmp(line, "FontPath") ||
++             !strcasecmp(line, "Group") ||
++             !strcasecmp(line, "LogFilePerm") ||
++             !strcasecmp(line, "LPDConfigFile") ||
++             !strcasecmp(line, "PageLog") ||
++             !strcasecmp(line, "Printcap") ||
++             !strcasecmp(line, "PrintcapFormat") ||
++             !strcasecmp(line, "RemoteRoot") ||
++             !strcasecmp(line, "RequestRoot") ||
++             !strcasecmp(line, "ServerBin") ||
++             !strcasecmp(line, "ServerCertificate") ||
++             !strcasecmp(line, "ServerKey") ||
++             !strcasecmp(line, "ServerRoot") ||
++             !strcasecmp(line, "SMBConfigFile") ||
++             !strcasecmp(line, "StateDir") ||
++             !strcasecmp(line, "SystemGroup") ||
++             !strcasecmp(line, "SystemGroupAuthKey") ||
++             !strcasecmp(line, "TempDir") ||
++	     !strcasecmp(line, "User"))
++    {
++      cupsdLogMessage(CUPSD_LOG_WARN,
++		      "Please move \"%s%s%s\" on line %d of %s to the %s file; "
++		      "this will become an error in a future release.",
++		      line, value ? " " : "", value ? value : "", linenum,
++		      ConfigurationFile, CupsFilesFile);
++    }
+     else
++      parse_variable(ConfigurationFile, linenum, line, value,
++                     sizeof(cupsd_vars) / sizeof(cupsd_vars[0]), cupsd_=
vars);
++  }
++
++  return (1);
++}
++
++/*
++ * 'read_cups_files_conf()' - Read the cups-files.conf configuration fi=
le.
++ */
++
++static int				/* O - 1 on success, 0 on failure */
++read_cups_files_conf(cups_file_t *fp)	/* I - File to read from */
++{
++  int		linenum;		/* Current line number */
++  char		line[HTTP_MAX_BUFFER],	/* Line from file */
++		*value;			/* Value from line */
++  struct group	*group;			/* Group */
++
++
++ /*
++  * Loop through each line in the file...
++  */
++
++  linenum =3D 0;
++
++  while (cupsFileGetConf(fp, line, sizeof(line), &value, &linenum))
++  {
++    if (!strcasecmp(line, "FatalErrors"))
++      FatalErrors =3D parse_fatal_errors(value);
++    else if (!strcasecmp(line, "Group") && value)
+     {
+      /*
+-      * Find a simple variable in the list...
++      * Group ID to run as...
+       */
+=20
+-      for (i =3D NUM_VARS, var =3D variables; i > 0; i --, var ++)
+-        if (!strcasecmp(line, var->name))
+-	  break;
+-
+-      if (i =3D=3D 0)
++      if (isdigit(value[0]))
++        Group =3D atoi(value);
++      else
+       {
+-       /*
+-        * Unknown directive!  Output an error message and continue...
+-	*/
++        endgrent();
++	group =3D getgrnam(value);
+=20
+-        if (!value)
+-	  cupsdLogMessage(CUPSD_LOG_ERROR, "Missing value for %s on line %d.",
+-	                  line, linenum);
++	if (group !=3D NULL)
++	  Group =3D group->gr_gid;
+ 	else
+-	  cupsdLogMessage(CUPSD_LOG_ERROR, "Unknown directive %s on line %d.",
+-	                  line, linenum);
+-        continue;
++	{
++	  cupsdLogMessage(CUPSD_LOG_ERROR,
++	                  "Unknown Group \"%s\" on line %d of %s.", value,
++	                  linenum, CupsFilesFile);
++	  if (FatalErrors & CUPSD_FATAL_CONFIG)
++	    return (0);
++	}
+       }
++    }
++    else if (!strcasecmp(line, "PrintcapFormat") && value)
++    {
++     /*
++      * Format of printcap file?
++      */
+=20
+-      switch (var->type)
++      if (!strcasecmp(value, "bsd"))
++        PrintcapFormat =3D PRINTCAP_BSD;
++      else if (!strcasecmp(value, "plist"))
++        PrintcapFormat =3D PRINTCAP_PLIST;
++      else if (!strcasecmp(value, "solaris"))
++        PrintcapFormat =3D PRINTCAP_SOLARIS;
++      else
+       {
+-        case CUPSD_VARTYPE_INTEGER :
+-	    if (!value)
+-	      cupsdLogMessage(CUPSD_LOG_ERROR,
+-	                      "Missing integer value for %s on line %d!",
+-			      line, linenum);
+-	    else
+-	    {
+-	      int	n;		/* Number */
+-	      char	*units;		/* Units */
+-
+-
+-              n =3D strtol(value, &units, 0);
+-
+-	      if (units && *units)
+-	      {
+-        	if (tolower(units[0] & 255) =3D=3D 'g')
+-		  n *=3D 1024 * 1024 * 1024;
+-        	else if (tolower(units[0] & 255) =3D=3D 'm')
+-		  n *=3D 1024 * 1024;
+-		else if (tolower(units[0] & 255) =3D=3D 'k')
+-		  n *=3D 1024;
+-		else if (tolower(units[0] & 255) =3D=3D 't')
+-		  n *=3D 262144;
+-	      }
+-
+-              if (n < 0)
+-		cupsdLogMessage(CUPSD_LOG_ERROR,
+-	                	"Bad negative integer value for %s on line %d!",
+-				line, linenum);
+-	      else
+-		*((int *)var->ptr) =3D n;
+-	    }
+-	    break;
++	cupsdLogMessage(CUPSD_LOG_ERROR,
++	                "Unknown PrintcapFormat \"%s\" on line %d of %s.",
++	                value, linenum, CupsFilesFile);
++        if (FatalErrors & CUPSD_FATAL_CONFIG)
++          return (0);
++      }
++    }
++    else if (!strcasecmp(line, "SystemGroup") && value)
++    {
++     /*
++      * SystemGroup (admin) group(s)...
++      */
+=20
+-	case CUPSD_VARTYPE_BOOLEAN :
+-	    if (!value)
+-	      cupsdLogMessage(CUPSD_LOG_ERROR,
+-	                      "Missing boolean value for %s on line %d!",
+-			      line, linenum);
+-            else if (!strcasecmp(value, "true") ||
+-	             !strcasecmp(value, "on") ||
+-		     !strcasecmp(value, "enabled") ||
+-		     !strcasecmp(value, "yes") ||
+-		     atoi(value) !=3D 0)
+-              *((int *)var->ptr) =3D TRUE;
+-	    else if (!strcasecmp(value, "false") ||
+-	             !strcasecmp(value, "off") ||
+-		     !strcasecmp(value, "disabled") ||
+-		     !strcasecmp(value, "no") ||
+-		     !strcasecmp(value, "0"))
+-              *((int *)var->ptr) =3D FALSE;
+-	    else
+-              cupsdLogMessage(CUPSD_LOG_ERROR,
+-	                      "Unknown boolean value %s on line %d.",
+-	                      value, linenum);
+-	    break;
++      if (!parse_groups(value))
++      {
++	cupsdLogMessage(CUPSD_LOG_ERROR,
++	                "Unknown SystemGroup \"%s\" on line %d of %s.", value,
++	                linenum, CupsFilesFile);
++        if (FatalErrors & CUPSD_FATAL_CONFIG)
++          return (0);
++      }
++    }
++    else if (!strcasecmp(line, "User") && value)
++    {
++     /*
++      * User ID to run as...
++      */
+=20
+-	case CUPSD_VARTYPE_PATHNAME :
+-            if (!value)
+-	    {
+-	      cupsdLogMessage(CUPSD_LOG_ERROR,
+-	                      "Missing pathname value for %s on line %d!",
+-			      line, linenum);
+-              break;
+-	    }
++      if (isdigit(value[0] & 255))
++      {
++        int uid =3D atoi(value);
+=20
+-	    if (value[0] =3D=3D '/')
+-	      strlcpy(temp, value, sizeof(temp));
+-	    else
+-	      snprintf(temp, sizeof(temp), "%s/%s", ServerRoot, value);
++	if (!uid)
++	{
++	  cupsdLogMessage(CUPSD_LOG_ERROR,
++	                  "Will not use User 0 as specified on line %d of %s "
++			  "for security reasons.  You must use a non-"
++			  "privileged account instead.",
++	                  linenum, CupsFilesFile);
++          if (FatalErrors & CUPSD_FATAL_CONFIG)
++            return (0);
++        }
++        else
++	  User =3D atoi(value);
++      }
++      else
++      {
++        struct passwd *p;	/* Password information */
+=20
+-            if (access(temp, 0))
+-	    {
+-	      cupsdLogMessage(CUPSD_LOG_ERROR,
+-	                      "File or directory for \"%s %s\" on line %d "
+-			      "does not exist!", line, value, linenum);
+-              break;
+-	    }
++        endpwent();
++	p =3D getpwnam(value);
+=20
+-	case CUPSD_VARTYPE_STRING :
+-	    cupsdSetString((char **)var->ptr, value);
+-	    break;
++	if (p)
++	{
++	  if (!p->pw_uid)
++	  {
++	    cupsdLogMessage(CUPSD_LOG_ERROR,
++	                    "Will not use User %s (UID=3D0) as specified on li=
ne "
++			    "%d of %s for security reasons.  You must use a "
++			    "non-privileged account instead.",
++	                    value, linenum, CupsFilesFile);
++	    if (FatalErrors & CUPSD_FATAL_CONFIG)
++	      return (0);
++	  }
++	  else
++	    User =3D p->pw_uid;
++	}
++	else
++	{
++	  cupsdLogMessage(CUPSD_LOG_ERROR,
++	                  "Unknown User \"%s\" on line %d of %s.",
++	                  value, linenum, CupsFilesFile);
++          if (FatalErrors & CUPSD_FATAL_CONFIG)
++            return (0);
++        }
+       }
+     }
++    else if (!parse_variable(CupsFilesFile, linenum, line, value,
++			     sizeof(cupsfiles_vars) / sizeof(cupsfiles_vars[0]),
++			     cupsfiles_vars) &&
++	     (FatalErrors & CUPSD_FATAL_CONFIG))
++      return (0);
+   }
+=20
+   return (1);
+ }
+=20
+-
+ /*
+  * 'read_location()' - Read a <Location path> definition.
+  */
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/scheduler/conf.h cups/scheduler/conf.h
+--- cups~/scheduler/conf.h	2012-12-08 00:29:09.000000000 +0100
++++ cups/scheduler/conf.h	2012-12-08 00:29:10.000000000 +0100
+@@ -96,7 +96,9 @@
+  */
+=20
+ VAR char		*ConfigurationFile	VALUE(NULL),
+-					/* Configuration file to use */
++					/* cupsd.conf file to use */
++			*CupsFilesFile		VALUE(NULL),
++					/* cups-files.conf file to use */
+ 			*ServerName		VALUE(NULL),
+ 					/* FQDN for server */
+ 			*ServerAdmin		VALUE(NULL),
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/scheduler/ipp.c cups/scheduler/ipp.c
+--- cups~/scheduler/ipp.c	2012-12-08 00:29:09.000000000 +0100
++++ cups/scheduler/ipp.c	2012-12-08 00:54:10.627688371 +0100
+@@ -2597,7 +2597,7 @@
+ 	send_ipp_status(con, IPP_NOT_POSSIBLE,
+ 	                _("File device URIs have been disabled! "
+ 	                  "To enable, see the FileDevice directive in "
+-			  "\"%s/cupsd.conf\"."),
++			  "\"%s/cups-files.conf\"."),
+ 			ServerRoot);
+ 	return;
+       }
+diff -urNad '--exclude=3DCVS' '--exclude=3D.svn' '--exclude=3D.git' '--e=
xclude=3D.arch' '--exclude=3D.hg' '--exclude=3D_darcs' '--exclude=3D.bzr'=
 cups~/scheduler/main.c cups/scheduler/main.c
+--- cups~/scheduler/main.c	2012-12-08 00:29:09.000000000 +0100
++++ cups/scheduler/main.c	2012-12-08 00:29:10.000000000 +0100
+@@ -251,6 +251,35 @@
+ 		cupsdSetStringf(&ConfigurationFile, "%s/%s", current, argv[i]);
+ 		free(current);
+               }
++
++	      if (!CupsFilesFile)
++	      {
++	        char	*filename,	/* Copy of cupsd.conf filename */
++			*slash;		/* Final slash in cupsd.conf filename */
++		size_t	len;		/* Size of buffer */
++
++		len =3D strlen(ConfigurationFile) + 15;
++		if ((filename =3D malloc(len)) =3D=3D NULL)
++		{
++		  _cupsLangPrintf(stderr,
++		                  _("cupsd: Unable to get path to "
++		                    "cups-files.conf file."));
++                  return (1);
++		}
++
++		strlcpy(filename, ConfigurationFile, len);
++		if ((slash =3D strrchr(filename, '/')) =3D=3D NULL)
++		{
++		  _cupsLangPrintf(stderr,
++		                  _("cupsd: Unable to get path to "
++		                    "cups-files.conf file."));
++                  return (1);
++		}
++
++		strlcpy(slash, "/cups-files.conf", len - (slash - filename));
++		cupsdSetString(&CupsFilesFile, filename);
++		free(filename);
++	      }
+ 	      break;
+=20
+           case 'f' : /* Run in foreground... */
+@@ -289,6 +318,29 @@
+ 	      UseProfiles =3D 0;
+ 	      break;
+=20
++          case 's' : /* Set cups-files.conf location */
++              i ++;
++	      if (i >=3D argc)
++	      {
++	        _cupsLangPuts(stderr, _("cupsd: Expected cups-files.conf "
++	                                "filename after \"-s\" option."));
++	        usage(1);
++	      }
++
++              if (argv[i][0] !=3D '/')
++	      {
++	       /*
++	        * Relative filename not allowed...
++		*/
++
++	        _cupsLangPuts(stderr, _("cupsd: Relative cups-files.conf "
++	                                "filename not allowed."));
++	        usage(1);
++              }
++
++	      cupsdSetString(&CupsFilesFile, argv[i]);
++	      break;
++
+ #ifdef __APPLE__
+           case 'S' : /* Disable system management functions */
+               fputs("cupsd: -S (disable system management) for internal=
 "
+@@ -315,8 +367,40 @@
+       usage(1);
+     }
+=20
+-  if (!ConfigurationFile)
+-    cupsdSetString(&ConfigurationFile, CUPS_SERVERROOT "/cupsd.conf");
++    if (!ConfigurationFile)
++    {
++      cupsdSetString(&ConfigurationFile, CUPS_SERVERROOT "/cupsd.conf")=
;
++      cupsdSetString(&CupsFilesFile, CUPS_SERVERROOT "/cups-files.conf"=
);
++    }
++ =20
++    if (!CupsFilesFile)
++    {
++      char	*filename,		/* Copy of cupsd.conf filename */
++  		*slash;			/* Final slash in cupsd.conf filename */
++      size_t	len;			/* Size of buffer */
++ =20
++      len =3D strlen(ConfigurationFile) + 15;
++      if ((filename =3D malloc(len)) =3D=3D NULL)
++      {
++        _cupsLangPrintf(stderr,
++  		      _("cupsd: Unable to get path to "
++  			"cups-files.conf file."));
++        return (1);
++      }
++ =20
++      strlcpy(filename, ConfigurationFile, len);
++      if ((slash =3D strrchr(filename, '/')) =3D=3D NULL)
++      {
++        _cupsLangPrintf(stderr,
++  		      _("cupsd: Unable to get path to "
++  			"cups-files.conf file."));
++        return (1);
++      }
++ =20
++      strlcpy(slash, "/cups-files.conf", len - (slash - filename));
++      cupsdSetString(&CupsFilesFile, filename);
++      free(filename);
++    }
+=20
+  /*
+   * If the user hasn't specified "-f", run in the background...
+--- a/test/run-stp-tests.sh
++++ b/test/run-stp-tests.sh
+@@ -326,25 +326,10 @@
+=20
+ cat >/tmp/cups-$user/cupsd.conf <<EOF
+ Browsing Off
+-FileDevice yes
+-Printcap
+ Listen 127.0.0.1:$port
+-User $user
+-ServerRoot /tmp/cups-$user
+-StateDir /tmp/cups-$user
+-ServerBin /tmp/cups-$user/bin
+-CacheDir /tmp/cups-$user/share
+-DataDir /tmp/cups-$user/share
+-FontPath /tmp/cups-$user/share/fonts
+ PassEnv LOCALEDIR
+-DocumentRoot $root/doc
+-RequestRoot /tmp/cups-$user/spool
+-TempDir /tmp/cups-$user/spool/temp
+ MaxSubscriptions 3
+ MaxLogSize 0
+-AccessLog /tmp/cups-$user/log/access_log
+-ErrorLog /tmp/cups-$user/log/error_log
+-PageLog /tmp/cups-$user/log/page_log
+ AccessLogLevel actions
+ LogLevel debug2
+ LogTimeFormat usecs
+@@ -359,6 +344,25 @@
+ </Policy>
+ EOF
+=20
++cat >/tmp/cups-$user/cups-files.conf <<EOF
++FileDevice yes
++Printcap
++User $user
++ServerRoot /tmp/cups-$user
++StateDir /tmp/cups-$user
++ServerBin /tmp/cups-$user/bin
++CacheDir /tmp/cups-$user/share
++DataDir /tmp/cups-$user/share
++FontPath /tmp/cups-$user/share/fonts
++DocumentRoot $root/doc
++RequestRoot /tmp/cups-$user/spool
++TempDir /tmp/cups-$user/spool/temp
++PidFile /tmp/cups-$user/cupsd.pid
++AccessLog /tmp/cups-$user/log/access_log
++ErrorLog /tmp/cups-$user/log/error_log
++PageLog /tmp/cups-$user/log/page_log
++EOF
++
+ #
+ # Setup lots of test queues - half with PPD files, half without...
+ #
diff --git a/meta/recipes-extended/cups/cups_1.4.6.bb b/meta/recipes-exte=
nded/cups/cups_1.4.6.bb
index aadaa07..53dc149 100644
--- a/meta/recipes-extended/cups/cups_1.4.6.bb
+++ b/meta/recipes-extended/cups/cups_1.4.6.bb
@@ -1,6 +1,6 @@
 require cups14.inc
=20
-PR =3D "r6"
+PR =3D "r7"
 DEPENDS +=3D "libusb \
        ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
=20
@@ -9,6 +9,7 @@ SRC_URI +=3D " \
             file://use_echo_only_in_init.patch \
             file://0001-don-t-try-to-run-generated-binaries.patch \
             file://cups_serverbin.patch \
+            file://cups-CVE-2012-5519.patch \
 	"
=20
 SRC_URI[md5sum] =3D "de8fb5a29c36554925c0c6a6e2c0dae1"
--=20
1.7.11



