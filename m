Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AF67560557
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Dec 2014 23:54:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sB8Ns1Sp000739
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Dec 2014 15:54:01 -0800 (PST)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 8 Dec 2014 15:54:00 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Dec 2014 17:53:58 -0600
Message-ID: <cover.1418082021.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] package.bbclass: Do fixups even when FILES_foo is set
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
X-List-Received-Date: Mon, 08 Dec 2014 23:54:04 -0000
Content-Type: text/plain

There's some fixups for things like adding extra_depends to RDEPENDS
which ended up in the "if not oldfiles" clause of a test against
a setting for FILES_foo, but which I think should probably be done
either way. The one that specifically affected us is that in some
code for using a prebuilt toolchain, we set FILES_packagename from
a manifest, which resulted in FILES_glibc-gconv-localename being
set, which meant that RDEPENDS wasn't getting "glibc-gconv" appended
for any of the glibc-gconv-localename packages, because the processing
of extra_depends was conditional.

Two of these variables (summary and description) looked like things
where the assumption might have been that you'd define SUMMARY_foo
and DESCRIPTION_foo if you were defining FILES_foo, so I've also
made those settings conditional on there not being an existing setting.

I ran builds of core-image-sato with and without this change, and looked
at build history. 26 packages changed, but 23 were changes to PKGSIZE
and nothing else.

The other three changes:

gst-plugins-good-gconfelements-dev has changes to RRECCOMMENDS, adding
gst-plugins-good-dev, and gst-plugins-good-gconfelements has changes to
RDEPENDS, adding gst-plugins-good. Both of these look reasonable to me.

perl-module-cpan has a change to RDEPENDS, adding perl. I think that's
also reasonable.

So I don't think this breaks anything.

The following changes since commit 219e793907406eabf632e784e3a11ab9acb77cfb:

  qemu/libc-package: Fix qemu option handling (2014-12-05 17:59:42 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib seebs/package_files
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/package_files

Peter Seebach (1):
  package.bbclass: do variable fixups even when FILES was set

 meta/classes/package.bbclass |   18 ++++++++++--------
 1 files changed, 10 insertions(+), 8 deletions(-)


