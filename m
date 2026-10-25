Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29234.1792958995994526621
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 13:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=XwRmliUQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20261025200953d50b7646f20002073e-hjoezz@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20261025200953d50b7646f20002073e
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Oct 2026 21:09:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Jajqka2yXp1YQXighM46vYH5grUCyy8w4ps3dveglAg=;
 b=XwRmliUQVwuyzGYGlt3UdVLXB2kWjseccNiiaiC3jkh1EggEjYS+7i4mHkXFXAdWdANsGK
 aRi6JRBEuZANaIcnNkd84Tie2gr+so68Z3hS2brNJg/+0HayjhuBkwyDLhDilJXb75s3Z1hD
 VicQu4MZt4K7GGsxvRCJ3teB0CsQdtRajSs1U94ncz9SUrM6BYJq3gBNDdeUZo4QJFoXVdGf
 rebRiKs8veTiztj5Ix/Zn/zlE50XrVMS4NIg2JoUyVuU3Tdwh0UA8PJTAFkvjleOlNFflD/Z
 oGNv7Ti3GJir2JGkYWDcvxZVViAEKH+MJMWK4dcU5O9MGGWjaoCpdpFA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/2] oe-selftest: devtool: do not add ide-sdk test kits to the user's CMake kits
Date: Sun, 25 Oct 2026 21:09:49 +0100
Message-ID: <20261025200949.1757990-2-adrian.freihofer@siemens.com>
In-Reply-To: <20261025200949.1757990-1-adrian.freihofer@siemens.com>
References: <20261025200949.1757990-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 20:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248626
Content-Type: text/plain; charset="utf-8"

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The shared sysroot test of devtool ide-sdk adds a cmake-kit with the path
of the temporary test build directory to ~/.local/share/CMakeTools. Every
test run adds another stale kit, which is never removed again. Use a
temporary XDG_DATA_HOME for the test, and verify that the kit is added
there.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b848623a6e..e95de98e80 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -4564,9 +4564,14 @@ class DevtoolIdeSdkSharedTests(DevtoolIdeSdkTests):
         # Handle the workspace (which is not needed by this test case)
         self._check_workspace()
 
+        # Do not add a cmake-kit to the kits of the user
+        xdg_data_home = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(xdg_data_home)
+        ide_env = dict(os.environ, XDG_DATA_HOME=xdg_data_home)
+
         result_init = runCmd(
             'devtool ide-sdk -m shared oe-selftest-image cmake-example meson-example --ide=code',
-            output_log=self._cmd_logger)
+            output_log=self._cmd_logger, env=ide_env)
         bb_vars = get_bb_vars(
             ['REAL_MULTIMACH_TARGET_SYS', 'DEPLOY_DIR_IMAGE', 'COREBASE'], "meta-ide-support")
         environment_script = 'environment-setup-%s' % bb_vars['REAL_MULTIMACH_TARGET_SYS']
@@ -4578,6 +4583,11 @@ class DevtoolIdeSdkSharedTests(DevtoolIdeSdkTests):
         # Verify the cross environment script is available
         self.assertExists(environment_script_path)
 
+        # Verify the cmake-kit is added to the location where CMake Tools looks for it
+        with open(os.path.join(xdg_data_home, 'CMakeTools', 'cmake-tools-kits.json')) as f:
+            kits = json.load(f)
+        self.assertEqual([kit['environmentSetupScript'] for kit in kits], [environment_script_path])
+
         def runCmdEnv(cmd, cwd, output_log=self._cmd_logger):
             cmd = '/bin/sh -c ". %s > /dev/null && %s"' % (
                 environment_script_path, cmd)
-- 
2.56.0

