Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 464A560EFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 17:57:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7EHvrxB029844
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 10:57:54 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 14 Aug 2014 10:57:53 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Aug 2014 13:03:35 -0500
Message-ID: <cover.1408038028.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] PREFERRED_PROVIDER and multilibs
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
X-List-Received-Date: Thu, 14 Aug 2014 17:57:58 -0000
Content-Type: text/plain

A value of the form PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "..."
doesn't work for multilibs in some cases, because of the order in which
things are configured. Move the multilib-aware code for PREFERRED_PROVIDER
and PREFERRED_VERSION into multilib_global in a new ConfigParsed handler
so it can execute at the right time.

I do have a pending mystery, though:

For versions:
+        if '-cross-' in pkg and '${' in pkg:
For providers:
+        if 'cross-canadian' in pkg:

I don't know why these are different, or whether it's intentional.

The following changes since commit 4321c553d5ae816e566234e981a0815bba046d39:

  SIGGEN_EXCLUDERECIPES_ABISAFE: add initscripts (2014-08-11 17:44:09 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib seebs/preferred_ml
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/preferred_ml

Peter Seebach (1):
  multilib_global.bbclass: PREFERRED_PROVIDERS for multilibs

 meta/classes/base.bbclass            |  108 -------------------------------
 meta/classes/multilib_global.bbclass |  117 +++++++++++++++++++++++++++++++++-
 2 files changed, 114 insertions(+), 111 deletions(-)


