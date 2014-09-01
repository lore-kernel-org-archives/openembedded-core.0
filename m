Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 161F871223
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Sep 2014 16:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s81GWUWh006362; Mon, 1 Sep 2014 17:32:30 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FptM7F1NIHIW; Mon,  1 Sep 2014 17:32:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s81GWO2J006359
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 1 Sep 2014 17:32:26 +0100
Message-ID: <1409589146.29296.238.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 01 Sep 2014 17:32:26 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: ronan <ronan.lemartret@open.eurogiciel.org>,
	Ed Bartosh <eduard.bartosh@intel.com>
Subject: [PATCH v2] package_rpm: Add custom extension support for spec generation.
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
X-List-Received-Date: Mon, 01 Sep 2014 16:32:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Add hooks to allow customisation of the rpm spec files. Since python functions
aren't visible in the data store, one variable is used to trigger the call to
a separately named function. A dummy function is not provided since this then
triggers various class ordering complexities which are best avoided.

Ultimately this will be replaced by a refactor of the code to generate the 
spec file using a python class.

This allows the tizen layer to add hooks for the security manifests for
example.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index eecfcb2..ac69b68 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -306,6 +306,7 @@ python write_specfile () {
     spec_files_bottom = []
 
     perfiledeps = (d.getVar("MERGEPERFILEDEPS", True) or "0") == "0"
+    extra_pkgdata = (d.getVar("RPM_EXTRA_PKGDATA", True) or "0") == "0"
 
     for pkg in packages.split():
         localdata = bb.data.createCopy(d)
@@ -389,6 +390,8 @@ python write_specfile () {
             else:
                 bb.note("Creating RPM package for %s" % splitname)
                 spec_files_top.append('%files')
+                if extra_pkgdata:
+                    package_rpm_extra_pkgdata(splitname, spec_files_top, localdata)
                 spec_files_top.append('%defattr(-,-,-,-)')
                 if file_list:
                     bb.note("Creating RPM package for %s" % splitname)
@@ -495,6 +498,8 @@ python write_specfile () {
             bb.note("Not creating empty RPM package for %s" % splitname)
         else:
             spec_files_bottom.append('%%files -n %s' % splitname)
+            if extra_pkgdata:
+                package_rpm_extra_pkgdata(splitname, spec_files_bottom, localdata)
             spec_files_bottom.append('%defattr(-,-,-,-)')
             if file_list:
                 bb.note("Creating RPM package for %s" % splitname)



