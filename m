Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D01DC7070E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 17:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7THdViu013225; Fri, 29 Aug 2014 18:39:55 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rFbSODDkJMXF; Fri, 29 Aug 2014 18:39:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7THdqHI013249
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 29 Aug 2014 18:39:53 +0100
Message-ID: <1409333994.29296.196.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Aug 2014 18:39:54 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: ronan <ronan.lemartret@open.eurogiciel.org>,
	Ed Bartosh <eduard.bartosh@intel.com>
Subject: [PATCH] package_rpm: Add %manifest support for spec generation.
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
X-List-Received-Date: Fri, 29 Aug 2014 17:40:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From: Ronan Le Martret <ronan@fridu.net>

The manifest file allow custom smack security for a package.
    https://wiki.tizen.org/wiki/Security/Application_installation_and_Manifest

Signed-off-by: Ronan Le Martret <ronan@fridu.net>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index eecfcb2..0f565ac 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -389,6 +389,8 @@ python write_specfile () {
             else:
                 bb.note("Creating RPM package for %s" % splitname)
                 spec_files_top.append('%files')
+                if localdata.getVar('MANIFESTFILES', True):
+                    spec_files_top.append('%%manifest %s' %  localdata.getVar('MANIFESTFILES', True))
                 spec_files_top.append('%defattr(-,-,-,-)')
                 if file_list:
                     bb.note("Creating RPM package for %s" % splitname)
@@ -495,6 +497,8 @@ python write_specfile () {
             bb.note("Not creating empty RPM package for %s" % splitname)
         else:
             spec_files_bottom.append('%%files -n %s' % splitname)
+            if localdata.getVar('MANIFESTFILES', True):
+                spec_files_bottom.append('%%manifest %s' %  localdata.getVar('MANIFESTFILES', True))
             spec_files_bottom.append('%defattr(-,-,-,-)')
             if file_list:
                 bb.note("Creating RPM package for %s" % splitname)



