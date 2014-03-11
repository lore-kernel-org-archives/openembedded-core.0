Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DE8E96F817
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 17:03:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2BH3ksC010743
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Mar 2014 10:03:47 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 11 Mar 2014 10:03:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 12 Mar 2014 01:08:18 +0800
Message-ID: <cover.1394555880.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/6 V3] refactor the archiver*.bbclass
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
X-List-Received-Date: Tue, 11 Mar 2014 17:03:53 -0000
Content-Type: text/plain

=== V3:
* Do the unpack, patch and configure in another WORKDIR as RP and Ross
  suggested, so that it would not affact the default build dependencies,
  thanks for Ross' prototype.
* Don't archive the logs (temp/log.do*), mainly because of:
  - We can easily get the log via reset the T rather than use the
    archiver.
  - If we need archive the logs, we must let the task to run as the last
    one, but it's hard to do this.

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


The following changes since commit 23f7decb84922a3467c5b10b013e66596926b5cf:

  .templateconf: New file for customized template defaults (2014-03-11 08:11:07 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/archiver_v3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/archiver_v3

Robert Yang (6):
  classes/archive*.bbclass: remove archive-*-source.bbclass
  archiver.bbclass: refactor it
  package_rpm.bbclass: archive the source to srpm package
  archiver.bbclass: move a few code to copyleft_compliance.bbclass
  local.conf.sample.extended: update for the archiver
  patch.bbclass: do_patch: unset TMPDIR from environment

 meta/classes/archive-configured-source.bbclass |  65 --
 meta/classes/archive-original-source.bbclass   |  65 --
 meta/classes/archive-patched-source.bbclass    |  65 --
 meta/classes/archiver.bbclass                  | 791 +++++++++----------------
 meta/classes/copyleft_compliance.bbclass       |  55 +-
 meta/classes/package_rpm.bbclass               |  33 +-
 meta/classes/patch.bbclass                     |   1 +
 meta/conf/local.conf.sample.extended           |  63 +-
 8 files changed, 367 insertions(+), 771 deletions(-)
 delete mode 100644 meta/classes/archive-configured-source.bbclass
 delete mode 100644 meta/classes/archive-original-source.bbclass
 delete mode 100644 meta/classes/archive-patched-source.bbclass

-- 
1.8.3.1


