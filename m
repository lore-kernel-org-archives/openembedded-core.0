Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E26B16E901
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:52:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1OFqqUW018748
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Feb 2014 07:52:52 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 24 Feb 2014 07:52:51 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Feb 2014 23:56:04 +0800
Message-ID: <cover.1393256563.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/5 V2] refactor the archiver*.bbclass
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
X-List-Received-Date: Mon, 24 Feb 2014 15:52:58 -0000
Content-Type: text/plain

=== V2:
* Fix the warning between different machines which is reported by Martin
* Fix the error when the archiver.bbclass is not inherited but
  ARCHIVER_MODE[type] = "srpm" is set, reported by Ross.
* Fix the archiving for gcc staff which uses the shared source according
  to the recently changes of prefuncs and postfuncs in bitbake, so it only
  works well with bitbake's up to date master branch, if we want to backport it,
  we also need backport the pre/postfuncs related patches.

=== V1:
* The archive*.bbclass didn't work, and there were a few problems, for
  example:
  1) There were a few duplicated code
  2) There was no src_dir.org (or orig), but the diff command still use
     it, and it is not easy to fix this issue if we don't change a lot
     of the code.
  3) It didn't archive the source for the native or gcc
  4) The work flow is not very well
  5) The "subprocess.call('fakeroot cp xxxx'" should be removed
  6) And others ...

* So that we have to refactor it, the benefits are:
  1) Fix the problems and make it work well.
  2) Reduce more than 400 lines in total.
  3) Make it easy to use.

// Robert

The following changes since commit 0e5cfef90ff762b33da6dc301dfc9cb3947c8a02:

  runqemu: enforce right CPU type for qemux86/x86-64 (2014-02-13 17:48:47 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/archiver
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/archiver

Robert Yang (5):
  classes/archive*.bbclass: remove archive-*-source.bbclass
  archiver.bbclass: refactor it
  package_rpm.bbclass: archive the source to srpm package
  archiver.bbclass: move a few code to copyleft_compliance.bbclass
  local.conf.sample.extended: update for the archiver

 meta/classes/archive-configured-source.bbclass |  65 ---
 meta/classes/archive-original-source.bbclass   |  65 ---
 meta/classes/archive-patched-source.bbclass    |  65 ---
 meta/classes/archiver.bbclass                  | 735 ++++++++-----------------
 meta/classes/copyleft_compliance.bbclass       |  55 +-
 meta/classes/package_rpm.bbclass               |  31 +-
 meta/conf/local.conf.sample.extended           |  72 +--
 7 files changed, 327 insertions(+), 761 deletions(-)
 delete mode 100644 meta/classes/archive-configured-source.bbclass
 delete mode 100644 meta/classes/archive-original-source.bbclass
 delete mode 100644 meta/classes/archive-patched-source.bbclass

-- 
1.8.3.1


