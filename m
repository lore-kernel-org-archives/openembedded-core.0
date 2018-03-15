Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 17F74788F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 14:06:28 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2FE6PuD018577
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 15 Mar 2018 14:06:29 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ewT7w-0002RJ-Jm; Thu, 15 Mar 2018 06:41:04 -0700
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 06:41:02 -0700
Message-Id: <1521121262-9269-13-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521121262-9269-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1521121262-9269-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: [pyro][PATCH 13/13] world-broken.inc: blacklist portmap on musl
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
X-List-Received-Date: Thu, 15 Mar 2018 14:06:29 -0000

portmap was dropped in rocko and later and doesn't work with libtirpc
so don't build it for musl

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/world-broken.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/world-broken.inc b/meta/conf/distro/include/world-broken.inc
index 0166963..8f56103 100644
--- a/meta/conf/distro/include/world-broken.inc
+++ b/meta/conf/distro/include/world-broken.inc
@@ -28,6 +28,10 @@ EXCLUDE_FROM_WORLD_pn-lttng-tools_libc-musl = "1"
 EXCLUDE_FROM_WORLD_pn-systemtap_libc-musl = "1"
 EXCLUDE_FROM_WORLD_pn-systemtap-uprobes_libc-musl = "1"
 
+# portmap.c:488:32: error: 'struct sockaddr_in6' has no member named 'sin_port'; did you mean 'sin6_port'?
+# We removed portmap in rocko onwards and it doesn't work with libtirpc
+EXCLUDE_FROM_WORLD_pn-portmap_libc-musl = "1"
+
 # error: a parameter list without types is only allowed in a function definition
 #            void (*_function)(sigval_t);
 EXCLUDE_FROM_WORLD_pn-qemu_libc-musl = "1"
-- 
2.7.4


