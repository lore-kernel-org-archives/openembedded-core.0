Return-Path: <amarnath.valluri@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 647B070100
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 13:20:53 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 14 Oct 2016 06:20:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,493,1473145200"; d="scan'208";a="19562764"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 14 Oct 2016 06:20:54 -0700
Received: from avalluri-GigaByte.fi.intel.com (avalluri-gigabyte.fi.intel.com
	[10.237.72.170]) (using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 9437D6A4006
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 06:20:22 -0700 (PDT)
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Oct 2016 16:21:09 +0300
Message-Id: <1476451269-11260-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] glmark2: Enabling c++ 11 features
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
X-List-Received-Date: Fri, 14 Oct 2016 13:20:56 -0000

The failure was:
| ../src/image-reader.cpp: In member function 'bool PNGReader::init(const
string&)':
| ../src/image-reader.cpp:123:16: error: 'unique_ptr' in namespace 'std' does
not name a template type

This change enables c++11 features, as code useing them.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 396ae70..4cb233b 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -28,6 +28,9 @@ PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11-gl
                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'wayland-gl wayland-gles2', '', d)} \
                   drm-gl drm-gles2"
 
+# Enable C++11 features
+CXXFLAGS += "--std=c++11"
+
 PACKAGECONFIG[x11-gl] = ",,virtual/libgl virtual/libx11"
 PACKAGECONFIG[x11-gles2] = ",,virtual/libgles2 virtual/libx11"
 PACKAGECONFIG[drm-gl] = ",,virtual/libgl libdrm"
-- 
2.7.4

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki 
Business Identity Code: 0357606 - 4 
Domiciled in Helsinki 

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


