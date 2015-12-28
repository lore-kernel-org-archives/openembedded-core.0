Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07E0D6FF84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:15:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBS7F63Y024221
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:15:07 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:15:06 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:34 -0800
Message-ID: <2f04a9285cfabdb053dafacd17320f847ac6343f.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 26/40] toolchain-shar-relocate: don't assume last state of env_setup_script is good
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
X-List-Received-Date: Mon, 28 Dec 2015 07:15:06 -0000
Content-Type: text/plain

From: Jean-Francois Dagenais <jeff.dagenais@gmail.com>

In the case where many environment-setup-* files exist, the incorrect
filename might be lastly set in env_setup_script, which leads to
incorrect behaviour for the initialization of native_sysroot.

The scenario I had was that our custom meta-toolchain-*.bb, which
inherits populate_sdk, defined another environment-setup-* file to dump
variable information for qt-creator. The file is named like so in order
for the sdk shell script to pick it up and fix the SDK paths in the
file. Since it (coincidentally) alphabetically comes after ...-core2, it
was last set in env_setup_script and the grep OECORE_NATIVE_SYSROOT
would simply be blank. The apparent symptom was "...relocate_sdk.py:
Argument list too long" since the find command would not be searching in
the right path.

(From OE-Core master rev: a36469c97c9cb335de1e95dea5141038f337df95)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/files/toolchain-shar-relocate.sh |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index 4ef2927..d58e4ed 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -1,3 +1,5 @@
+#reset the env_setup_script value to the proper value
+env_setup_script=$target_sdk_dir/environment-setup-@REAL_MULTIMACH_TARGET_SYS@
 # fix dynamic loader paths in all ELF SDK binaries
 native_sysroot=$($SUDO_EXEC cat $env_setup_script |grep 'OECORE_NATIVE_SYSROOT='|cut -d'=' -f2|tr -d '"')
 dl_path=$($SUDO_EXEC find $native_sysroot/lib -name "ld-linux*")
-- 
1.7.9.5


