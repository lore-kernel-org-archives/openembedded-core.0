Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EA54F65C78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 14:57:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 14 Jul 2015 07:57:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,472,1432623600"; d="scan'208";a="728662428"
Received: from cbernard-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.31.54])
	by orsmga001.jf.intel.com with ESMTP; 14 Jul 2015 07:57:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 15:56:52 +0100
Message-Id: <cover.1436884357.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/4] Fixes for shell message changes (OE-Core side)
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
X-List-Received-Date: Tue, 14 Jul 2015 14:57:09 -0000

Unfortunately the shell message changes caused a few minor regressions;
this is a perfect example of a situation where what seems like a simple
and logical change can have unintended consequences that you'll miss if
you're not careful. More testing all round would probably be advisable
in future. Having said that, it has had the effect of highlighting
something that we need to be mindful of in future - don't call bbfatal()
where you expect the rest of the error log to be printed - use die() or
bbfatal_log() for that, or alternatively make your message meaningful
enough that you don't need the log.

NOTE: the fix for die() and bbfatal_log() requires the BitBake change
that implements bbfatal_log internally which has just sent to the
bitbake-devel list. Having said that, logging.bbclass now works as it
used to for older BitBake versions that didn't have the message support
at all.


The following changes since commit 6be698b7270f73f40d38713ecf13f12aec0ced61:

  dpkg: Fix for Fedora22 and new versions of tar (2015-07-13 13:46:45 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/oecore-shell-logging-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/oecore-shell-logging-fixes

Paul Eggleton (4):
  classes/useradd: don't read bbnote/bbwarn/bbfatal values
  classes/base: fix die() to print the full log
  Use die() or bbfatal_log() where the log should definitely be printed
  classes/logging: allow shell message functions to work in devshell

 meta/classes/autotools.bbclass              |  4 +--
 meta/classes/base.bbclass                   |  2 +-
 meta/classes/kernel-yocto.bbclass           | 16 +++++-----
 meta/classes/logging.bbclass                | 48 +++++++++++++++++++++++++----
 meta/classes/scons.bbclass                  |  4 +--
 meta/classes/useradd.bbclass                |  6 ++--
 meta/recipes-extended/groff/groff_1.22.3.bb |  2 +-
 7 files changed, 59 insertions(+), 23 deletions(-)

-- 
2.1.0


