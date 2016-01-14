Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D90AD731EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 21:04:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0EL4hW5016460
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:04:43 -0800 (PST)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 14 Jan 2016 13:04:42 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jan 2016 15:04:40 -0600
Message-ID: <cover.1452805356.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 2.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Fix target cflags for gcc cross builds
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
X-List-Received-Date: Thu, 14 Jan 2016 21:04:43 -0000
Content-Type: text/plain

In some cases, CFLAGS_FOR_TARGET may need to have tune-specific compiler
flags, particularly if you're trying to build a multilib compiler which
won't automatically pick the right ABI, bit size, etc. by default if
invoked without them. After some experimentation and thought, I concluded
that cross gcc should use these in CFLAGS_FOR_TARGET, but crosssdk shouldn't.
This appears to work, at least for the reasonably obvious cases.

We did this back in November, and I thought I submitted it then, but
apparently the email never made it out. Rebased against current master.

The following changes since commit 541315d6c56df6448f64c262f99d43d5c1e9400b:

  update_font_cache: only scan system font directories (2016-01-11 23:23:18 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/gcc_target_args
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/gcc_target_args

Peter Seebach (1):
  Use TUNE_CCARGS for target compilation

 meta/classes/crosssdk.bbclass                      | 4 ++++
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 2 +-
 meta/recipes-devtools/gcc/gcc-cross.inc            | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.3.1


