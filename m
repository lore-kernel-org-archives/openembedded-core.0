Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.3656.1595630076059153273
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2020 15:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 06OMYYZA002642
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2020 15:34:35 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Fri, 24 Jul 2020
 15:34:15 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [v1 resend][oe-core][PATCH 1/1] gconf: use python3
Date: Fri, 24 Jul 2020 15:34:15 -0700
Message-ID: <20200724223415.3818-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Modify gsettings-schema-convert to use python3.  Also
add RDEPEND on python3-xml.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/recipes-gnome/gnome/gconf/python3.patch | 60 ++++++++++++++++++++++++++++
 meta/recipes-gnome/gnome/gconf_3.2.6.bb      |  3 ++
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-gnome/gnome/gconf/python3.patch

diff --git a/meta/recipes-gnome/gnome/gconf/python3.patch b/meta/recipes-gnome/gnome/gconf/python3.patch
new file mode 100644
index 0000000..7c022a2
--- /dev/null
+++ b/meta/recipes-gnome/gnome/gconf/python3.patch
@@ -0,0 +1,60 @@
+gconf: use python3
+
+Convert gsettings-schema-convert to use python3.
+
+Upstream-Status: Inappropriate [gconf is deprecated]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+--- a/gsettings/gsettings-schema-convert
++++ b/gsettings/gsettings-schema-convert
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # vim: set ts=4 sw=4 et: coding=UTF-8
+ #
+ # Copyright (c) 2010, Novell, Inc.
+@@ -603,7 +603,7 @@ class SimpleSchemaParser:
+             for line in lines:
+                 current_line_nb += 1
+                 self.parse_line(line)
+-        except GSettingsSchemaConvertException, e:
++        except GSettingsSchemaConvertException as e:
+             raise GSettingsSchemaConvertException('%s:%s: %s' % (os.path.basename(self.file), current_line_nb, e))
+ 
+         return self.root
+@@ -1095,7 +1095,7 @@ def main(args):
+             try:
+                 parser = GConfSchemaParser(argfile, options.gettext_domain, options.schema_id, options.keep_underscores)
+                 schema_root = parser.parse()
+-            except SyntaxError, e:
++            except SyntaxError as e:
+                 raise GSettingsSchemaConvertException('\'%s\' does not look like a valid gconf schema file: %s' % (argfile, e))
+         else:
+             # autodetect if file is XML or not
+@@ -1104,7 +1104,7 @@ def main(args):
+                 schema_root = parser.parse()
+                 if not options.simple and not options.xml:
+                     options.simple = True
+-            except SyntaxError, e:
++            except SyntaxError as e:
+                 parser = SimpleSchemaParser(argfile)
+                 schema_root = parser.parse()
+                 if not options.simple and not options.xml:
+@@ -1127,13 +1127,13 @@ def main(args):
+                 fout = open(options.output, 'w')
+                 fout.write(output)
+                 fout.close()
+-            except GSettingsSchemaConvertException, e:
++            except GSettingsSchemaConvertException as e:
+                 fout.close()
+                 if os.path.exists(options.output):
+                     os.unlink(options.output)
+                 raise e
+ 
+-    except GSettingsSchemaConvertException, e:
++    except GSettingsSchemaConvertException as e:
+         print >> sys.stderr, '%s' % e
+         return 1
+ 
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index b8466d4..ff36555 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -15,6 +15,7 @@ SRC_URI = "${GNOME_MIRROR}/GConf/${@gnome_verdir("${PV}")}/GConf-${PV}.tar.xz;na
            file://remove_plus_from_invalid_characters_list.patch \
            file://unable-connect-dbus.patch \
            file://create_config_directory.patch \
+           file://python3.patch \
 "
 
 SRC_URI[archive.md5sum] = "2b16996d0e4b112856ee5c59130e822c"
@@ -52,6 +53,8 @@ FILES_${PN} += "${libdir}/GConf/* \
                 ${datadir}/dbus-1/services/*.service \
                 ${datadir}/dbus-1/system-services/*.service \
                "
+RDEPENDS_${PN} = "python3-xml"
+
 FILES_${PN}-dev += "${datadir}/sgml/gconf/gconf-1.0.dtd"
 
 BBCLASSEXTEND = "native"
-- 
2.7.4

