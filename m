Return-Path: <kevron.m.rees@intel.com>
X-Greylist: delayed 453 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 14 Nov 2015 01:31:51 UTC
Received: from p3nlsmtpcp01-04.prod.phx3.secureserver.net
	(p3nlsmtpcp01-04.prod.phx3.secureserver.net [184.168.200.145])
	by mail.openembedded.org (Postfix) with ESMTP id 0175077342
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Nov 2015 01:31:51 +0000 (UTC)
Received: from p3plcpnl0626.prod.phx3.secureserver.net ([50.62.176.153])
	by : HOSTING RELAY : with SMTP
	id xPZiZhUxvkuQwxPZiZVRRL; Fri, 13 Nov 2015 18:24:18 -0700
Received: from 50-39-187-133.bvtn.or.frontiernet.net ([50.39.187.133]:57568
	helo=localhost.localdomain)
	by p3plcpnl0626.prod.phx3.secureserver.net with esmtpsa
	(TLSv1.2:AES128-SHA256:128) (Exim 4.85)
	(envelope-from <kevron.m.rees@intel.com>)
	id 1ZxPZi-0007k8-9P; Fri, 13 Nov 2015 18:24:18 -0700
From: Kevron Rees <kevron.m.rees@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 17:24:10 -0800
Message-Id: <1447464250-12204-1-git-send-email-kevron.m.rees@intel.com>
X-Mailer: git-send-email 2.1.4
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - p3plcpnl0626.prod.phx3.secureserver.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - intel.com
X-Get-Message-Sender-Via: p3plcpnl0626.prod.phx3.secureserver.net: authenticated_id:
	kev@tripzero.io
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CMAE-Envelope: MS4wfKU2oDBFAAZajl853nwN71VTARLyAAQTqHKVgm/Z0vbg2HnNvE1FzBQHCtv6L7lEwSbIPhCLjdQ8vlP/JeI/+3SLAfesmWFffuszg6TA9EYEmrngha7UI7aE/jc2/g5aQWntlHyCe1wN/ZUod5ocUUobst+/pm+I9jglZZLCPyL4ogXDSAAFMVYfQKi1zhfkhfxRDYozorBLbosTj3zuhb3X5n5Us6j+XVLXjZ7MVz2Y
Cc: tripzero.kev@gmail.com
Subject: [PATCH] cmake.bbclass: remove ${prefix} assignment
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
X-List-Received-Date: Sat, 14 Nov 2015 01:31:55 -0000

CMAKE_INSTALL_PREFIX has a different semantic meaning than ${prefix}[1].  cmake treats
CMAKE_INSTALL_PREFIX the same as the DESTDIR environment variable.  Setting
CMAKE_INSTALL_PREFIX to ${prefix} is inappropriate.

This will likely break a lot of cmake recipes that have do_post_install hacks to get
around this bug.

[1] - https://cmake.org/cmake/help/v3.0/variable/CMAKE_INSTALL_PREFIX.html

Signed-off-by: Kevron Rees <kevron.m.rees@intel.com>
---
 meta/classes/cmake.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index ae3cc02..b7d5950 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -108,7 +108,7 @@ cmake_do_configure() {
 	cmake \
 	  ${OECMAKE_SITEFILE} \
 	  ${OECMAKE_SOURCEPATH} \
-	  -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
+	  -DCMAKE_INSTALL_PREFIX:PATH="" \
 	  -DCMAKE_INSTALL_BINDIR:PATH=${bindir} \
 	  -DCMAKE_INSTALL_SBINDIR:PATH=${sbindir} \
 	  -DCMAKE_INSTALL_LIBEXECDIR:PATH=${libexecdir} \
-- 
2.1.4


