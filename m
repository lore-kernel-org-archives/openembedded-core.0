Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A50656FE46
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 15:46:47 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5DFkYDA019590; Fri, 13 Jun 2014 16:46:34 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7wjLjqo7YQ6L; Fri, 13 Jun 2014 16:46:33 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5DFkUE3019587
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 13 Jun 2014 16:46:32 +0100
Message-ID: <1402674385.29913.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Jun 2014 16:46:25 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "Hart, Darren" <darren.hart@intel.com>
Subject: [PATCH] kernel-module-split: Add support for KERNEL_MODULE_AUTOLOAD and KERNEL_MODULE_PROBECONF
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
X-List-Received-Date: Fri, 13 Jun 2014 15:46:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The current module_autoload_* and module_conf_* variables are error
both ugly and error prone. They aren't registered in the task checksums
so changes to them aren't reflected in the build. This turns out to
be near impossible to fix with the current variable format in any
sensible way :(.

This patch replace module_autoload with the list of variables in
KERNEL_MODULE_AUTOLOAD which is a much simpler and usable API. An
error is printed if an old style variable is encountered. It should
be simple to convert to this.

module_conf_* are harder to deal with since there is data associated
with it, it isn't simply a flag. We need a list of variables that are set
in order to be able to correctly handle the task checksum so we add
KERNEL_MODULE_PROBECONF for this purpose and error if the user hasn't
added a module to it when they should have.

[YOCTO #5786]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index d43f743..e38a6f6 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -130,8 +130,11 @@ python split_kernel_module_packages () {
 
         # If autoloading is requested, output /etc/modules-load.d/<name>.conf and append
         # appropriate modprobe commands to the postinst
+        autoloadlist = (d.getVar("KERNEL_MODULE_AUTOLOAD", True) or "").split()
         autoload = d.getVar('module_autoload_%s' % basename, True)
         if autoload:
+            bb.error("KERNEL_MODULE_AUTOLOAD has replaced module_autoload_%s, please replace it!" % basename)
+        if basename in autoloadlist:
             name = '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
             f = open(name, 'w')
             for m in autoload.split():
@@ -144,12 +147,15 @@ python split_kernel_module_packages () {
             d.setVar('pkg_postinst_%s' % pkg, postinst)
 
         # Write out any modconf fragment
+        modconflist = (d.getVar("KERNEL_MODULE_PROBECONF", True) or "").split()
         modconf = d.getVar('module_conf_%s' % basename, True)
-        if modconf:
+        if modconf and basename in modconflist:
             name = '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
             f = open(name, 'w')
             f.write("%s\n" % modconf)
             f.close()
+        elif modconf:
+            bb.error("Please ensure module %s is listed in KERNEL_MODULE_PROBECONF since module_conf_%s is set" % (basename, basename))
 
         files = d.getVar('FILES_%s' % pkg, True)
         files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename)
@@ -185,3 +191,5 @@ python split_kernel_module_packages () {
         if len(os.listdir(dir)) == 0:
             os.rmdir(dir)
 }
+
+do_package[vardeps] += '${@" ".join(map(lambda s: "module_conf_" + s, (d.getVar("KERNEL_MODULE_PROBECONF", True) or "").split()))}'



