Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7E40360290
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 18:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u08IMHnA016760; Fri, 8 Jan 2016 18:22:17 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id F-3JqkXy2eNm; Fri,  8 Jan 2016 18:22:17 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u08IMBqb016755
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 8 Jan 2016 18:22:12 GMT
Message-ID: <1452277331.7598.135.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 08 Jan 2016 18:22:11 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: [PATCH] sstatesig: Handle special case of gcc-source shared-workdir for printdiff
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
X-List-Received-Date: Fri, 08 Jan 2016 18:22:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Often, bitbake -S printdiff would show that there was a checksum not found
which would turn out to be from gcc-source. This is due to it being a
shared-workdir recipe.

For now, hardcode the special case into the sstatesig code to stop people
(including me) puzzling over this.

If/as/when we add any other shared workdir recipes, we'll need to rethink
this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 6d1be3e..d65586b 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -236,6 +236,10 @@ def find_siginfo(pn, taskname, taskhashlist, d):
     localdata.setVar('PR', '*')
     localdata.setVar('EXTENDPE', '')
     stamp = localdata.getVar('STAMP', True)
+    if pn.startswith("gcc-source"):
+        # gcc-source shared workdir is a special case :(
+        stamp = localdata.expand("${STAMPS_DIR}/work-shared/gcc-${PV}-${PR}")
+
     filespec = '%s.%s.sigdata.*' % (stamp, taskname)
     foundall = False
     import glob



