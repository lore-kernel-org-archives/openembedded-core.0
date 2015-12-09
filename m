Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id D09AD605B3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 16:48:27 +0000 (UTC)
Received: by igcph11 with SMTP id ph11so123005052igc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Dec 2015 08:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=xEdDgxQtg3N0WyWV0PlkxO1lWt9lArxIVPUN2dI8zU0=;
	b=gyRb7l7MEWxTMYDYFO7hSeIYHLEwqkfJmjtPf6IGYAzQ93UO61jHg/HnIOzpM5ApIL
	9iCRRKCTaJgoTvBoXf0j9YDH/vjszNhVoVoK+BcI8GLzRgh3cyk8RRzssG8vB8Q1syTr
	wqUO448gUPD32JCMXwEMtdw2uIDQN9ynzUw++PwjIGbK9IG73/HIb1wRjEkPI+uoH7B2
	ndudn+vpzJMFeWvq2RUrcGBnZ7ENVKvmzIEsqnpri47RCoQeLBkeUZ4ZtNYdA9I8BrGs
	5h6XrIGkcr+A/OPeyARuR1sqMxIZckxT6Q5WAwwzbnoTwUhr4Pt3qJzJ+j7jiD+DzLAy
	PxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xEdDgxQtg3N0WyWV0PlkxO1lWt9lArxIVPUN2dI8zU0=;
	b=OKiSVmFqe9dJ3MWTrelnRpuyyU4J8/U686E10JjME/BkTTzdw6EW3ypqgX4tHSerkn
	t9YaNQmw/cgB345OFfrW9Paflj3V/8PTX4+hxiMu4Ga/Z3/xyz+nCX4yjkzR7JKq8GfM
	4l0tLuKqu3NRYH4LVvf+7s93rdj8jM/Bu1IU0YMHpoC9NLqaelUbew5s1axYgon8nA21
	EkZVpYDUbNWOeRfaRRQ8ACwrBNEjoZ9Mc3myrNTFuAPdfZW4Mpu9YEe2/x3cxCT+MGNB
	2myUwWKtmpJwZZ0ShSdBpCkV828Fd3bZHQ5/bx4A6E3cuIpX27y+xC12rTDcqsvtL3mi
	UMtg==
X-Gm-Message-State: ALoCoQlu8dmAhy1FRvjnv3P/LZaDjUuzDAmNscmpaP82IcxvEoczqS8187Qfgs4jMpXAfUjOb8fkzGkeQJ99QjMiuCMkXiX6nQ==
X-Received: by 10.50.28.19 with SMTP id x19mr17049960igg.92.1449679707639;
	Wed, 09 Dec 2015 08:48:27 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A560AC.dip0.t-ipconnect.de.
	[87.165.96.172])
	by smtp.gmail.com with ESMTPSA id e3sm10452445igx.0.2015.12.09.08.48.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Dec 2015 08:48:26 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Dec 2015 18:48:28 +0100
Message-Id: <1449683308-20004-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] package_manager.py: add debugging support for rpm scriptlet execution
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
X-List-Received-Date: Wed, 09 Dec 2015 16:48:31 -0000

By default, smart is invoked with --log-level=warning, which hides all
output from pre/post install scriptlets. That makes it hard to debug
scriptlet failure or why they get postponed to first-boot via
/etc/rpm-postinst.

The new ROOTFS_RPM_DEBUG variabled is expected to be set to an integer in
local.conf an incrementally adds more output:
  0 = default, only warnings
  1 = --log-level=info (includes information about executing scriptlets and their output)
  2 = --log-level=debug
  3 = --log-level=debug plus dumps of scriplet content and command invocation

The default behavior is not changed yet, but it seems that level 1 would
be a better default.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/lib/oe/package_manager.py | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index fd9caa3..32afeaf 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -685,8 +685,16 @@ class RpmPM(PackageManager):
         self.install_dir_path = os.path.join(self.target_rootfs, self.install_dir_name)
         self.rpm_cmd = bb.utils.which(os.getenv('PATH'), "rpm")
         self.smart_cmd = bb.utils.which(os.getenv('PATH'), "smart")
-        self.smart_opt = "--log-level=warning --data-dir=" + os.path.join(target_rootfs,
-                                                      'var/lib/smart')
+        # 0 = default, only warnings
+        # 1 = --log-level=info (includes information about executing scriptlets and their output)
+        # 2 = --log-level=debug
+        # 3 = --log-level=debug plus dumps of scriplet content and command invocation
+        self.debug_level = int(d.getVar('ROOTFS_RPM_DEBUG', True) or "0")
+        self.smart_opt = "--log-level=%s --data-dir=%s" % \
+                         ("warning" if self.debug_level == 0 else
+                          "info" if self.debug_level == 1 else
+                          "debug",
+                          os.path.join(target_rootfs, 'var/lib/smart'))
         self.scriptlet_wrapper = self.d.expand('${WORKDIR}/scriptlet_wrapper')
         self.solution_manifest = self.d.expand('${T}/saved/%s_solution' %
                                                self.task_name)
@@ -1051,6 +1059,17 @@ class RpmPM(PackageManager):
             scriptletcmd = "$2 $1/$3 $4\n"
             scriptpath = "$1/$3"
 
+        # When self.debug_level >= 3, also dump the content of the
+        # executed scriptlets and how they get invoked.  We have to
+        # replace "exit 1" and "ERR" because printing those as-is
+        # would trigger a log analysis failure.
+        if self.debug_level >= 3:
+            dump_invocation = 'echo "Executing ${name} ${kind} with: ' + scriptletcmd + '"\n'
+            dump_script = 'cat ' + scriptpath + '| sed -e "s/exit 1/exxxit 1/g" -e "s/ERR/IRR/g"; echo\n'
+        else:
+            dump_invocation = 'echo "Executing ${name} ${kind}"\n'
+            dump_script = ''
+
         SCRIPTLET_FORMAT = "#!/bin/bash\n" \
             "\n" \
             "export PATH=%s\n" \
@@ -1061,19 +1080,25 @@ class RpmPM(PackageManager):
             "export INTERCEPT_DIR=%s\n" \
             "export NATIVE_ROOT=%s\n" \
             "\n" \
+            "name=`head -1 " + scriptpath + " | cut -d\' \' -f 2`\n" \
+            "kind=`head -1 " + scriptpath + " | cut -d\' \' -f 4`\n" \
+            + dump_invocation \
+            + dump_script \
             + scriptletcmd + \
-            "if [ $? -ne 0 ]; then\n" \
+            "ret=$?\n" \
+            "echo Result of ${name} ${kind}: ${ret}\n" \
+            "if [ ${ret} -ne 0 ]; then\n" \
             "  if [ $4 -eq 1 ]; then\n" \
             "    mkdir -p $1/etc/rpm-postinsts\n" \
             "    num=100\n" \
             "    while [ -e $1/etc/rpm-postinsts/${num}-* ]; do num=$((num + 1)); done\n" \
-            "    name=`head -1 " + scriptpath + " | cut -d\' \' -f 2`\n" \
             '    echo "#!$2" > $1/etc/rpm-postinsts/${num}-${name}\n' \
             '    echo "# Arg: $4" >> $1/etc/rpm-postinsts/${num}-${name}\n' \
             "    cat " + scriptpath + " >> $1/etc/rpm-postinsts/${num}-${name}\n" \
             "    chmod +x $1/etc/rpm-postinsts/${num}-${name}\n" \
+            '    echo "Info: deferring ${name} ${kind} install scriptlet to first boot"\n' \
             "  else\n" \
-            '    echo "Error: pre/post remove scriptlet failed"\n' \
+            '    echo "Error: ${name} ${kind} remove scriptlet failed"\n' \
             "  fi\n" \
             "fi\n"
 
-- 
2.1.4


