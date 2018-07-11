Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6419077A8F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 14:57:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jul 2018 07:57:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,338,1526367600"; d="scan'208";a="63922116"
Received: from bucksteg-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.38.111])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Jul 2018 07:57:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jul 2018 16:56:51 +0200
Message-Id: <42c948694c528f287e4edbb3f3a062a41540aafd.1531320900.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1531320900.git.paul.eggleton@linux.intel.com>
References: <cover.1531320900.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] classes/buildhistory: properly process escaped chars from pkgdata
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
X-List-Received-Date: Wed, 11 Jul 2018 14:57:10 -0000

All values written out to pkgdata are escaped (see write_if_exists() in
package.bbclass). In practice there tend not to be characters that need
escaping except in the scriptlets (pkg_preinst, pkg_postinst, pkg_prerm
and pkg_postrm) where currently we still see the escape codes in the
corresponding files within buildhistory (e.g. \n and \t) and thus also
in the output of buildhistory-diff, hindering proper diffing of changes.
To fix this, when we read values from pkgdata and write them out to
buildhistory, we need to interpret the escape codes by doing the exact
reverse of what we do in package.bbclass.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 2e5213e66ec..40b292b139f 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -245,7 +245,7 @@ python buildhistory_emit_pkghistory() {
                 key = item[0]
                 if key.endswith('_' + pkg):
                     key = key[:-len(pkg)-1]
-                pkgdata[key] = item[1]
+                pkgdata[key] = item[1].encode('latin-1').decode('unicode_escape')
 
         pkge = pkgdata.get('PKGE', '0')
         pkgv = pkgdata['PKGV']
-- 
2.17.1


