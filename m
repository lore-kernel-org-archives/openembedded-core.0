Return-Path: <philip.balister@gmail.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 57B33710C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 14:33:24 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id i8so2266201qcq.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 07:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=Hq926llUQGZpW3MTEYqzDW1pyZAfsZvPZNAXdrktPaw=;
	b=Y2mLoOm77MHuOF6D/iXwpDnfGpTGSa1/4Ao4sYev/z5Z9Gw+jFJNOuH9ww83576qGh
	nRA2Tngdro2K8CHWhA8kU2rAh2K2XLL4mKk3Pubxbu03YnUMOnoNcZ36gsy918NoqowF
	IhGF0Jl+OqwFWhuo993vF6PeMo/Zhtt2zJHHkMve+AU4pwUYOBdYwm6PwAQ8TBufUfO+
	D5OfkTywGiz1lKfBkh2PMZ/PtmQWiPKB1cWHqSu3MpYSCv825clRXca9qP+9QKS++eZz
	1hrFFby9pfZDXXv1vkYRVlbgbk4e+RbtjmP8bXU/uCVQc+NBPo+7tIiw0aJv5RsV3zqv
	Z4Qg==
X-Received: by 10.229.97.67 with SMTP id k3mr56256609qcn.1.1410964405457;
	Wed, 17 Sep 2014 07:33:25 -0700 (PDT)
Received: from localhost.localdomain
	(pool-71-171-45-156.ronkva.east.verizon.net. [71.171.45.156])
	by mx.google.com with ESMTPSA id l4sm4072883qad.41.2014.09.17.07.33.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Sep 2014 07:33:23 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Sep 2014 10:33:19 -0400
Message-Id: <1410964399-31077-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] cmake.bbclass : Add support for cmake projects that use .S files.
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
X-List-Received-Date: Wed, 17 Sep 2014 14:33:33 -0000

UHD and GNU radio use the cmake build system. The toolchain file made
from cmake.bbclass does not set the variable needs by cmake projects
that use .S files. UHD added some .S files and these changes are required
to build recent UHD.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta/classes/cmake.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index ab2adec..bfa5995 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -34,10 +34,13 @@ set( CMAKE_SYSTEM_NAME `echo ${TARGET_OS} | sed -e 's/^./\u&/' -e 's/^\(Linux\).
 set( CMAKE_SYSTEM_PROCESSOR ${TARGET_ARCH} )
 set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
 set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
+set( CMAKE_ASM_COMPILER ${OECMAKE_C_COMPILER} )
 set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )
 set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
+set( CMAKE_ASM_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "ASM FLAGS" )
 set( CMAKE_C_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}" CACHE STRING "CFLAGS for release" )
 set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_CXX_FLAGS_RELEASE}" CACHE STRING "CXXFLAGS for release" )
+set( CMAKE_ASM_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}" CACHE STRING "ASM FLAGS for release" )
 set( CMAKE_C_LINK_FLAGS "${OECMAKE_C_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
 set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
 
-- 
1.8.3.1


