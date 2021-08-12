Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.24986.1628787543221806741
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Aug 2021 09:59:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=XOUf08da;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: abeltran@linux.microsoft.com)
Received: from abeltran-ubuntu18-dev.memva0x40hnu5lyn52qddymqwe.xx.internal.cloudapp.net (unknown [20.94.235.175])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5FAD420BE693;
	Thu, 12 Aug 2021 09:59:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5FAD420BE693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1628787542;
	bh=rQPAYEXpTEOto9D7Mnk3Q0nee4zot/X7bxu/Yctqv6c=;
	h=From:To:Cc:Subject:Date:From;
	b=XOUf08daDf5355jn2emEbdBk9kOVXS7umBx9aipKIoHAWggw9p+4AqyxdlRaTDNGz
	 bPwG9SjzCWJlLMwI+qhBAVhsb5Mb6OMCVouYI9yViOYWI3AsFbDpwJmQcZp9owa/b2
	 Jx8iO1lMpcsdC5O8pgVwaWsc/w2fdVVOKtstw1js=
From: "Andres Beltran" <abeltran@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Andres Beltran <abeltran@linux.microsoft.com>
Subject: [PATCH] buildhistory: Add output file listing package information
Date: Thu, 12 Aug 2021 16:58:56 +0000
Message-Id: <20210812165856.6469-1-abeltran@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1

Currently, buildhistory does not produce a single file combining relevant
information of installed packages. Produce an output file
"installed-package-info.txt" listing a package's runtime name, buildtime name,
its recipe, version, and size to avoid having to look up each package externally.
Leave the existing package list files as-is for backwards compatibility.

In order to support this efficiently, extend oe-pkgdata-util to accept multiple keys
for its read-value argument.

Signed-off-by: Andres Beltran <abeltran@linux.microsoft.com>
---
 meta/classes/buildhistory.bbclass |  5 +++++
 scripts/oe-pkgdata-util           | 37 +++++++++++++++++++------------
 2 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 8a1359acbe..134b56ab71 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -491,6 +491,11 @@ buildhistory_get_installed() {
 	cat $1/installed-package-sizes.tmp | awk '{print $2 "\tKiB\t" $1}' | sort -n -r > $1/installed-package-sizes.txt
 	rm $1/installed-package-sizes.tmp
 
+	# Produce package info: runtime_name, buildtime_name, recipe, version, size
+	oe-pkgdata-util -p ${PKGDATA_DIR} read-value "PACKAGE,PN,PV,PKGSIZE" -n -f $pkgcache > $1/installed-package-info.tmp
+	cat $1/installed-package-info.tmp | sort -n -r -k 5 > $1/installed-package-info.txt
+	rm $1/installed-package-info.tmp
+
 	# We're now done with the cache, delete it
 	rm $pkgcache
 
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 75dd23efa3..c30baaa580 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -171,7 +171,7 @@ def read_value(args):
                     val = line.split(': ', 1)[1].rstrip()
         return val
 
-    logger.debug("read-value('%s', '%s' '%s')" % (args.pkgdata_dir, args.valuename, packages))
+    logger.debug("read-value('%s', '%s' '%s')" % (args.pkgdata_dir, args.valuenames, packages))
     for package in packages:
         pkg_split = package.split('_')
         pkg_name = pkg_split[0]
@@ -180,20 +180,29 @@ def read_value(args):
         logger.debug(revlink)
         if os.path.exists(revlink):
             mappedpkg = os.path.basename(os.readlink(revlink))
-            qvar = args.valuename
-            value = readvar(revlink, qvar, mappedpkg)
-            if qvar == "PKGSIZE":
-                # PKGSIZE is now in bytes, but we we want it in KB
-                pkgsize = (int(value) + 1024 // 2) // 1024
-                value = "%d" % pkgsize
-            if args.unescape:
-                import codecs
-                # escape_decode() unescapes backslash encodings in byte streams
-                value = codecs.escape_decode(bytes(value, "utf-8"))[0].decode("utf-8")
+            qvars = args.valuenames
+            val_names = qvars.split(',')
+            values = []
+            for qvar in val_names:
+                if qvar == "PACKAGE":
+                    value = mappedpkg
+                else:
+                    value = readvar(revlink, qvar, mappedpkg)
+                if qvar == "PKGSIZE":
+                    # PKGSIZE is now in bytes, but we we want it in KB
+                    pkgsize = (int(value) + 1024 // 2) // 1024
+                    value = "%d" % pkgsize
+                if args.unescape:
+                    import codecs
+                    # escape_decode() unescapes backslash encodings in byte streams
+                    value = codecs.escape_decode(bytes(value, "utf-8"))[0].decode("utf-8")
+                values.append(value)
+
+            values_str = ' '.join(values)
             if args.prefix_name:
-                print('%s %s' % (pkg_name, value))
+                print('%s %s' % (pkg_name, values_str))
             else:
-                print(value)
+                print(values_str)
         else:
             logger.debug("revlink %s does not exist", revlink)
 
@@ -570,7 +579,7 @@ def main():
     parser_read_value = subparsers.add_parser('read-value',
                                           help='Read any pkgdata value for one or more packages',
                                           description='Reads the named value from the pkgdata files for the specified packages')
-    parser_read_value.add_argument('valuename', help='Name of the value to look up')
+    parser_read_value.add_argument('valuenames', help='Name of the value/s to look up (separated by commas, no spaces)')
     parser_read_value.add_argument('pkg', nargs='*', help='Runtime package name to look up')
     parser_read_value.add_argument('-f', '--file', help='Read package names from the specified file (one per line, first field only)')
     parser_read_value.add_argument('-n', '--prefix-name', help='Prefix output with package name', action='store_true')
-- 
2.17.1

