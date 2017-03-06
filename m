Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C625371B27
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 03:17:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Mar 2017 19:17:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,251,1484035200"; d="scan'208";a="1118837956"
Received: from rebeccas-z640.png.intel.com ([172.30.66.15])
	by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2017 19:17:49 -0800
From: Rebecca Chang Swee Fun <rebecca.swee.fun.chang@intel.com>
To: openembedded-core@lists.openembedded.org,
	Rebecca Chang Swee Fun <rebecca.swee.fun.chang@intel.com>
Date: Mon,  6 Mar 2017 11:20:45 +0800
Message-Id: <1488770446-37731-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [jethro][PATCH] Forklift OpenSSL 1.0.k to Jethro
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
X-List-Received-Date: Mon, 06 Mar 2017 03:17:50 -0000

From: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>

Hi all,

This is an version upgrade for OpenSSL from 1.0.2h to 1.0.2k.
The upgrade was forklifted from OE-Core master branch to
Jethro branch and remove upstream dependencies to new bbclasses.

The details of CVEs are mentioned in the patch commit message.

The main purpose of this forklifting effort is to make sure
OpenSSL shipped in BSPs is updated. Due to OpenSSL version
fork in Jethro, it is difficult to do purely "git cherry-pick"
and resolving conflicts everywhere.
This is main reason I opted for forklifting approach.

This is the first time I did an upgrade for OpenSSL. Please
help to review and provide feedbacks if this approach is not
feasible. I'm looking forward to learn from everyone of you.

Thank you very much.

Regards,
Rebecca

Chang, Rebecca Swee Fun (1):
  openssl: upgrade 1.0.2h -> 1.0.2k

 meta/recipes-connectivity/openssl/openssl.inc      |  104 +-
 .../openssl/openssl/0002-CVE-2017-3731.patch       |   53 +
 .../openssl/openssl/CVE-2016-2177.patch            |  286 --
 .../openssl/openssl/CVE-2016-2178.patch            |   51 -
 .../openssl/openssl/CVE-2016-2179.patch            |  255 --
 .../openssl/openssl/CVE-2016-2180.patch            |   44 -
 .../openssl/openssl/CVE-2016-2181_p1.patch         |   91 -
 .../openssl/openssl/CVE-2016-2181_p2.patch         |  239 -
 .../openssl/openssl/CVE-2016-2181_p3.patch         |   30 -
 .../openssl/openssl/CVE-2016-2182.patch            |   70 -
 .../openssl/openssl/CVE-2016-6302.patch            |   53 -
 .../openssl/openssl/CVE-2016-6303.patch            |   36 -
 .../openssl/openssl/CVE-2016-6304.patch            |   75 -
 .../openssl/openssl/CVE-2016-6306.patch            |   71 -
 .../openssl/openssl/CVE-2016-8610.patch            |  124 -
 .../Use-SHA256-not-MD5-as-default-digest.patch     |   69 +
 .../openssl/crypto_use_bigint_in_x86-64_perl.patch |   33 -
 .../openssl/openssl/debian/ca.patch                |    2 +-
 .../openssl/openssl/debian/version-script.patch    | 4663 ++++++++++++++++++++
 .../openssl/debian1.0.2/version-script.patch       |   31 +-
 .../openssl/openssl/fix-cipher-des-ede3-cfb1.patch |    2 +-
 .../openssl/openssl/openssl-c_rehash.sh            |  222 +
 .../openssl/openssl-util-perlpath.pl-cwd.patch     |   34 +
 .../openssl/openssl/openssl_fix_for_x32.patch      |    4 +-
 .../openssl/openssl/parallel.patch                 |   17 +-
 .../recipes-connectivity/openssl/openssl_1.0.2h.bb |   82 -
 .../recipes-connectivity/openssl/openssl_1.0.2k.bb |   64 +
 27 files changed, 5200 insertions(+), 1605 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0002-CVE-2017-3731.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2177.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2178.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2179.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2180.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p1.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p2.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2181_p3.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-2182.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6302.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6303.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6304.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6306.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-8610.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/Use-SHA256-not-MD5-as-default-digest.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/crypto_use_bigint_in_x86-64_perl.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/debian/version-script.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-util-perlpath.pl-cwd.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
 create mode 100644 meta/recipes-connectivity/openssl/openssl_1.0.2k.bb

-- 
2.7.4


