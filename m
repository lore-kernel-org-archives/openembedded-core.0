Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E626D72A49
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 14:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t37ErFYU017740; Tue, 7 Apr 2015 15:53:18 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0f2AKlzUpx09; Tue,  7 Apr 2015 15:53:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t37Er41o017711
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 7 Apr 2015 15:53:16 +0100
Message-ID: <1428418384.14020.468.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 07 Apr 2015 15:53:04 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [RFC PATCH] libunwind: Build with gold to avoid build failures
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
X-List-Received-Date: Tue, 07 Apr 2015 14:53:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The library fails to build with binutils 2.25 and standard ld. This
issue is fixed in gcc 5 with no plans to backport to gcc 4. Easiest
workaround for now is to use gold as the linker for the library
since gold does not have the issue. The bug is x86 only.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
index 2a65631..74afba1 100644
--- a/meta/recipes-support/libunwind/libunwind.inc
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -23,6 +23,9 @@ LIBATOMICS_armv5 = "-latomic_ops"
 LIBATOMICS_armv4 = "-latomic_ops"
 LIBATOMICS ?= ""
 
+LDFLAGS_append_x86 = " -fuse-ld=gold"
+LDFLAGS_append_x86-64 = " -fuse-ld=gold"
+
 DEPENDS += "${DEPLIBATOMICS}"
 DEPLIBATOMICS_armv5 = "libatomics-ops"
 DEPLIBATOMICS_armv4 = "libatomics-ops"



