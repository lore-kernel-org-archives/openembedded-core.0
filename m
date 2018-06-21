Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A0D3477DAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 16:18:18 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n5-v6so7192012wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 09:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ZMJ4Y7Q8wcSibbnWtFg/X/jLCBfKx4nrv2nfpp9udxY=;
	b=o9DTgoUsvPIQ30jTwJY5yAGq7whkXJYzueO97GHHSvBamyEm9bK6WVuIHa5Y9fWUC8
	7vslaBjO7QsxDN6P/+2BZhx7Ng/jWrRoMvvvi8axk48jlnApk0cFUlRqPAXr16aFKXEW
	0W0uQFPp3V21R09ZJUFzTuFd64SzIMUyQvbjBNMtjpTZUOJAnpWz4DKja+J4IvvEM+kY
	rNQnnvxbwfp+p7GtSxXhCeIQNCMXQhG6TsvOJ545MCTxkSLupmBQ9UkN/yqWKaz7qABP
	RXlRo2Sxk5UWqcDdhqorvp+cKL6o0C0p+PHTS6TiuaKTbQIjWXmlPfVK++MonkThScCU
	eVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ZMJ4Y7Q8wcSibbnWtFg/X/jLCBfKx4nrv2nfpp9udxY=;
	b=Px1foCh3mAbU2PM6/Lxe7LIjhKpfD3UsYolDXHT6xFq0n0H6RK3MaCtJoamTHL10CH
	qVpyyaL/0R+LdtzADE/o2+cpM0x4HCELD0s1PyxAgUuAarJrQAi35eXwHSKC7+8BRdLo
	iljUG0Ua+y54YpDxNa7Tfiz48jo1uDK/moY0euiJhihsQO3xxrEQ4OMYrjiMUkN7a0kv
	fzUxWCW6OcHjArqAgpMs7t2LLITED5tJppWjiZMcGIaCELBYKmfj9MYrUFisCACuxgFF
	vA/oIoJNYMJYchRqkN61TW9d8JzsMc7ru1ic5RDnB1/X0ALRmdHv34IN1nhPQn2y7I+6
	dyGg==
X-Gm-Message-State: APt69E0fYMYUpro9f6ROj2wsc+k+aloKhxNmCgw4HuLDG3kVY/vQB2CY
	46b0naBRxnqZBYBeAh1hxFfiP8QI
X-Google-Smtp-Source: ADUXVKJQvIzcN0pQ9RST5HwwDw8IuqRgqLvW+ujJ31SsDjGzdcwMgBbW+T3RTWPblaAijjEd4ohrMw==
X-Received: by 2002:a1c:ec47:: with SMTP id
	k68-v6mr5865178wmh.109.1529597898910; 
	Thu, 21 Jun 2018 09:18:18 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n12-v6sm4268295wrp.69.2018.06.21.09.18.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jun 2018 09:18:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jun 2018 17:18:15 +0100
Message-Id: <20180621161815.19449-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] oeqa: add Git mirror test
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
X-List-Received-Date: Thu, 21 Jun 2018 16:18:19 -0000

Add an automated test to exercise that fetching a git: recipe...
1) works over git without mirrors
2) fails without git connectivity or mirrors
3) works without git connectivity but with a mirror

(2) is done by setting GIT_PROXY_COMMAND to 'false' which should break any git
network operations.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/cases/fetch.py | 49 +++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/fetch.py

diff --git a/meta/lib/oeqa/selftest/cases/fetch.py b/meta/lib/oeqa/selftest/cases/fetch.py
new file mode 100644
index 00000000000..4acc8cdcc8e
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/fetch.py
@@ -0,0 +1,49 @@
+import oe.path
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake
+from oeqa.core.decorator.oeid import OETestID
+
+class Fetch(OESelftestTestCase):
+    @OETestID(1058)
+    def test_git_mirrors(self):
+        """
+        Verify that the git fetcher will fall back to the HTTP mirrors. The
+        recipe needs to be one that we have on the Yocto Project source mirror
+        and is hosted in git.
+        """
+
+        # TODO: mktempd instead of hardcoding
+        dldir = os.path.join(self.builddir, "download-git-mirrors")
+        self.track_for_cleanup(dldir)
+
+        # No mirrors, should use git to fetch successfully
+        features = """
+DL_DIR = "%s"
+MIRRORS_forcevariable = ""
+PREMIRRORS_forcevariable = ""
+""" % dldir
+        self.write_config(features)
+        oe.path.remove(dldir, recurse=True)
+        bitbake("dbus-wait -c fetch -f")
+
+        # No mirrors and broken git, should fail
+        features = """
+DL_DIR = "%s"
+GIT_PROXY_COMMAND = "false"
+MIRRORS_forcevariable = ""
+PREMIRRORS_forcevariable = ""
+""" % dldir
+        self.write_config(features)
+        oe.path.remove(dldir, recurse=True)
+        with self.assertRaises(AssertionError):
+            bitbake("dbus-wait -c fetch -f")
+
+        # Broken git but a specific mirror
+        features = """
+DL_DIR = "%s"
+GIT_PROXY_COMMAND = "false"
+MIRRORS_forcevariable = "git://.*/.* http://downloads.yoctoproject.org/mirror/sources/"
+""" % dldir
+        self.write_config(features)
+        oe.path.remove(dldir, recurse=True)
+        bitbake("dbus-wait -c fetch -f")
-- 
2.11.0


