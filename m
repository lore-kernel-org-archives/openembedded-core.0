Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 776E66057B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 18:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1CHvvN7005422; Fri, 12 Feb 2016 18:00:04 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id B6nlM7y09-GV; Fri, 12 Feb 2016 18:00:04 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1CI00WH005472
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 12 Feb 2016 18:00:01 GMT
Message-ID: <1455300000.16142.331.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Feb 2016 18:00:00 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>,
	"saul.wold" <saul.wold@intel.com>
Subject: [PATCH] scripts/runqemu-internal: Work around qemux86 PAT bugs in linux 4.4.1
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
X-List-Received-Date: Fri, 12 Feb 2016 18:00:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Since the upgrade of qemux86 to 4.4.1 we're seeing PAT issues when
starting the X server. We need to fix the problem but the failing
sanity tests mask out other issues and we need a workaround.

Merge this for now until we can figure out the full issue. This is
better than changing the kernel defconfig or reverting to old
kernel versions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index ebed2bd..ad854d1 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -434,7 +434,7 @@ if [ "$MACHINE" = "qemux86" ]; then
     fi
     # Currently oprofile's event based interrupt mode doesn't work(Bug #828) in
     # qemux86 and qemux86-64. We can use timer interrupt mode for now.
-    KERNCMDLINE="$KERNCMDLINE oprofile.timer=1"
+    KERNCMDLINE="$KERNCMDLINE oprofile.timer=1 nopat"
 fi
 
 if [ "$MACHINE" = "qemux86-64" ]; then



