Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0C1806E630
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 09:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489655393; x=1521191393;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=OhI5vTKty1XtEMvn9/0u+ResHGRuzNmBW8ayo50w8eE=;
	b=H6nMSsU7T08oZWRTWbNfCXxe+7ImhpKnBFAZWsJ0DwedkiRXl+0+1fL7
	RS5T/iJJtz0gFzceoPxha3CjvgIWgA==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Mar 2017 02:09:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="236881429"
Received: from klim10-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.172.61])
	by fmsmga004.fm.intel.com with ESMTP; 16 Mar 2017 02:09:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 22:09:43 +1300
Message-Id: <a9369f4e5031aa270498b5dde4c49a857b0ee58f.1489655348.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1489655348.git.paul.eggleton@linux.intel.com>
References: <cover.1489655348.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] packagegroup-core-lsb: avoid rebuilding when changing layer config
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
X-List-Received-Date: Thu, 16 Mar 2017 09:09:52 -0000

It's regrettable that code in here is referring to BBFILE_COLLECTIONS,
but it is, and the result is that this packagegroup will rebuild simply
by adding or removing a layer which may be completely unrelated to
whether you've got meta-qt4 or not. Add BBFILE_COLLECTIONS to
vardepsexclude for the function to avoid this. (This was flagged up when
testing the new yocto-compat-layer script - it understandably but
undesirably reports it as a change caused by a layer).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 3aedf6b..a156bcb 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -225,6 +225,8 @@ def get_libqt4(d):
                 'libraries. Its intended use is for passing LSB tests as Qt4 is ' \
                 'a requirement for LSB.')
     return ''
+# We don't want this to rebuild every time you change your layer config
+get_libqt4[vardepsexclude] += "BBFILE_COLLECTIONS"
 
 SUMMARY_packagegroup-core-lsb-desktop = "LSB Desktop"
 DESCRIPTION_packagegroup-core-lsb-desktop = "Packages required to support libraries \
-- 
2.9.3


