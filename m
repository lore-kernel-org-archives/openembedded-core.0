Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AC90973285
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 15:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7JFTi5L002019; Fri, 19 Aug 2016 16:29:44 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id t1j6mWYqlra2; Fri, 19 Aug 2016 16:29:44 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7JFTc7o002016
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 19 Aug 2016 16:29:39 +0100
Message-ID: <1471620578.16712.45.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Aug 2016 16:29:38 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "Zhang, Jianxun" <jianxun.zhang@intel.com>,
	"saul.wold" <saul.wold@intel.com>
Subject: [PATCH] parselogs: Ignore uvesafb timeouts
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
X-List-Received-Date: Fri, 19 Aug 2016 15:29:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We're periodically seeing uvesafb timeouts on the autobuilder. Whitelist these
errors as there is little it seems we can do about them and we therefore
choose to ignore them rather than fail the builds.

[YOCTO #8245]

There is a better solution proposed in the bug with a -1 timeout however
this avoids failed builds until such times as that is implemented.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime/parselogs.py
index 1cfe804..777af57 100644
--- a/meta/lib/oeqa/runtime/parselogs.py
+++ b/meta/lib/oeqa/runtime/parselogs.py
@@ -63,6 +63,9 @@ qemux86_common = [
     "fail to add MMCONFIG information, can't access extended PCI configuration space under this bridge.",
     "can't claim BAR ",
     'amd_nb: Cannot enumerate AMD northbridges',
+    'uvesafb: 5000 ms task timeout error',
+    'detected fb_set_par error, error code: -22',
+    'uvesafb: mode switch failed'\
 ] + common_errors
 
 ignore_errors = { 



