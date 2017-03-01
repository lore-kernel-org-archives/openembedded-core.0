Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E8D0771B04
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 16:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21G2oDN011988; Wed, 1 Mar 2017 16:02:50 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0l5NHXXt2ODA; Wed,  1 Mar 2017 16:02:50 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21G2kQh011973
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Mar 2017 16:02:47 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cj6iE-0004ng-LM; Wed, 01 Mar 2017 16:02:46 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Mar 2017 16:02:32 +0000
Message-Id: <1488384162-18397-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488384162-18397-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1488384162-18397-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 02/12] testsdk: Handle minimal eSDK and avoid download costs
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
X-List-Received-Date: Wed, 01 Mar 2017 16:02:56 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testsdk.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 75b4027..802e57f 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -149,6 +149,17 @@ def testsdkext_main(d):
         bb.plain("Extensible SDK testing environment: %s" % s)
 
         sdk_env = sdk_envs[s]
+
+        # Use our own SSTATE_DIR and DL_DIR so that updates to the eSDK come from our sstate cache
+        # and we don't spend hours downloading kernels for the kernel module test
+        with open(os.path.join(sdk_dir, 'conf', 'local.conf'), 'a+') as f:
+            f.write('SSTATE_MIRRORS = "file://.* file://%s/PATH"\n' % test_data.get('SSTATE_DIR'))
+            f.write('SOURCE_MIRROR_URL = "file://%s"\n' % test_data.get('DL_DIR'))
+            f.write('INHERIT += "own-mirrors"')
+
+        # We need to do this in case we have a minimal SDK
+        subprocess.check_output(". %s > /dev/null; devtool sdk-install meta-extsdk-toolchain" % sdk_env, cwd=sdk_dir, shell=True)
+
         tc = OESDKExtTestContext(td=test_data, logger=logger, sdk_dir=sdk_dir,
             sdk_env=sdk_env, target_pkg_manifest=target_pkg_manifest,
             host_pkg_manifest=host_pkg_manifest)
-- 
2.7.4


