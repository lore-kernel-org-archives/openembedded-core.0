Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 27AB6712AA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:58:54 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id x13so3107965wgg.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=krdwJ5uX5AcQHq5sEnLMShJ5xo77W54V9Ex0oSZ8z+k=;
	b=NPa9O2ReWZWxpAcEJry7zJnOmFR/k5/JqJqOn/3ixvoXE0fd30AVQJ4BLNWyhi8fvY
	Eo20WSJTfDaKHenNuGogC8lXg/g2C/yrfXui4eKjl9tQotEDhhRh+PO9aKoQWsCKP2Gr
	Vc3LF0Sj9+4yjOWxZboZ+G94m9XriYE3JG7wwApnajD5Nbl5iFbPqAxGly6Eaxs+5bJ0
	QS/8Vge/JXcdbqs7J/paZ7b4f5I2zsUQg/raeyHMUKrVksr0Ya7OfzyoeOJSs1DqfGse
	EwGDOFWnXZP+gliO/5aaBPLRLvEElt+nrOQEKXGG5edtKEaMCO7v8RIerSg2Ws5yUzrn
	4bjw==
X-Gm-Message-State: ALoCoQlm07c87vjqGa5MMixCg3YmXud3jomCvK9w9z+5M4VdRKEp3VYVmAFma/o4PHcPmaXeP+M2
X-Received: by 10.194.222.138 with SMTP id qm10mr33513852wjc.25.1410177535355; 
	Mon, 08 Sep 2014 04:58:55 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.58.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:58:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:20 +0100
Message-Id: <824171290d536caef33715edf9f00487671776ae.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 02/27] sstate: Add extra intercept functions SSTATEPOSTCREATEFUNCS
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
X-List-Received-Date: Mon, 08 Sep 2014 11:58:57 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

In some cases we do either need to add extra sstate manipulation
functions, or change the existing modification functions. This patch
parametrizes it to SSTATEPOSTCREATEFUNCS after sstate_create_package

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sstate.bbclass |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ead829e..67e0c1d 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -33,6 +33,7 @@ BB_HASHFILENAME = "${SSTATE_EXTRAPATH} ${SSTATE_PKGSPEC} ${SSTATE_SWSPEC}"
 SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
 
 SSTATECREATEFUNCS = "sstate_hardcode_path"
+SSTATEPOSTCREATEFUNCS = ""
 SSTATEPREINSTFUNCS = ""
 SSTATEPOSTUNPACKFUNCS = "sstate_hardcode_path_unpack"
 SSTATEPOSTINSTFUNCS = ""
@@ -512,7 +513,8 @@ def sstate_package(ss, d):
     d.setVar('SSTATE_BUILDDIR', sstatebuild)
     d.setVar('SSTATE_PKG', sstatepkg)
 
-    for f in (d.getVar('SSTATECREATEFUNCS', True) or '').split() + ['sstate_create_package']:
+    for f in (d.getVar('SSTATECREATEFUNCS', True) or '').split() + ['sstate_create_package'] + \
+             (d.getVar('SSTATEPOSTCREATEFUNCS', True) or '').split():
         bb.build.exec_func(f, d)
   
     bb.siggen.dump_this_task(sstatepkg + ".siginfo", d)
-- 
1.7.10.4


