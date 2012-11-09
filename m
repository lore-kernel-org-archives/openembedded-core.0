Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TWllW-0006pC-SW
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Nov 2012 11:24:47 +0100
Received: from mail-ee0-f69.google.com ([74.125.83.69])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 09 Nov 2012 02:10:56 -0800
Received: by mail-ee0-f69.google.com with SMTP id l10so3215899eei.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2012 02:10:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=UykS9cSGXc5u2yljclks0KW0mypuzeo+VGPSu9XInMI=;
	b=VupHFfUchaikfnTtz2rt6e869zpbz9olr9He0bMXDS1wck15QrLozuE5X/o1jGIIxV
	JxVFLdFtUy6PqkTCDMq0DiC1/qoIW8JT5YjIUd3RnkaWY8sgyYwWtFo2DhnSQEE0ocdm
	fIOpjmVC7bgy3SVH7fZd/ch6+0AINpL+OgzTVFgI8xv/SVmmnWKNpdTbmdsbk7E12GW/
	WUpoq2elNiAtuL/ZYnX38BujZMhSLT4FKWVO4SK6Ejvk1FYHDo1szInQHp+cvD/kM6pI
	Y+29RdfMi8Aqdy63EOYujt7t52eZAlI/8mN9zwaLvSA9pUJmBnu41gbyT0gXV6DcKSeN
	hE3Q==
Received: by 10.216.193.220 with SMTP id k70mr4812104wen.35.1352455854835;
	Fri, 09 Nov 2012 02:10:54 -0800 (PST)
Received: by 10.216.193.220 with SMTP id k70mr4812095wen.35.1352455854501;
	Fri, 09 Nov 2012 02:10:54 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hf10sm1514085wib.0.2012.11.09.02.10.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Nov 2012 02:10:53 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Nov 2012 10:09:28 +0000
Message-Id: <8f832804399ec12aa916174e6de9a8a222bfc182.1352455397.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1352455397.git.ross.burton@intel.com>
References: <cover.1352455397.git.ross.burton@intel.com>
In-Reply-To: <cover.1352455397.git.ross.burton@intel.com>
References: <cover.1352455397.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmr54fR5ytt2Ua92EdMjWeTCm9zMNYNVGnzZxT/bRUxOf9j0d+J7HfCyON+G1yCPcebe16pkJwnwNeA3Fg9FdIPV8O4XjY9w+EWbK43PCSurokWCtgKzXwmv6i3sQrRyMsDzcbfmsy/d6dSrdIVA/ZzpLP36PHTYDdwsRZuvngqrUZReTWuNIihEociBL5pBVOTKCTu
Subject: [PATCH 1/2] autotools: set _FOR_BUILD variables here
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Nov 2012 10:24:47 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/autotools.bbclass |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index b97d74b..ca981ec 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -34,6 +34,21 @@ EXTRA_AUTORECONF = "--exclude=autopoint"
 
 export lt_cv_sys_lib_dlsearch_path_spec = "${libdir} ${base_libdir}"
 
+# When building tools for use at build-time it's recommended for the build
+# system to use these variables when cross-compiling.
+# (http://sources.redhat.com/autobook/autobook/autobook_270.html)
+export CPP_FOR_BUILD = "${BUILD_CPP}"
+export CPPFLAGS_FOR_BUILD = "${BUILD_CPPFLAGS}"
+
+export CC_FOR_BUILD = "${BUILD_CC}"
+export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS}"
+
+export CXX_FOR_BUILD = "${BUILD_CXX}"
+export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
+
+export LD_FOR_BUILD = "${BUILD_LD}"
+export LDFLAGS_FOR_BUILD = "${BUILD_LDFLAGS}"
+
 def autotools_set_crosscompiling(d):
     if not bb.data.inherits_class('native', d):
         return " cross_compiling=yes"
-- 
1.7.10



