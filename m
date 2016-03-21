Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BFEAE6FF84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 16:15:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 21 Mar 2016 09:15:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,372,1455004800"; d="scan'208";a="938475636"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 21 Mar 2016 09:15:09 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@intel.com>
Date: Mon, 21 Mar 2016 18:15:06 +0200
Message-Id: <1458576907-28315-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [RFC PATCH] rpm signing: replace python-pexpect with our own implementation
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
X-List-Received-Date: Mon, 21 Mar 2016 16:15:15 -0000

This patch is inspired by Ross's desire to get rid of the external dependency
to python-pexpect. This dependency is currently undocumented and only for
signing RPM packages. We need to use something like pexpect because rpm uses
tty directly to read the passphrase and normal redirection does not work for
us.

I'm sending this patch as RFC. It seems to work fine, for me at least. However,
my implementation is relatively simple and there might be some quirks and
corner cases that I'm missing. It might be better just to use the real
python-pexpect.

Comments and suggestions are welcome.

[YOCTO #9304]

Markus Lehtonen (1):
  oe/gpg_sign: use our own immplementation of pexpect

 meta/lib/oe/gpg_sign.py | 104 +++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 90 insertions(+), 14 deletions(-)

-- 
2.6.2


