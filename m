Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1QlAbd-0001GI-Bo
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 04:09:17 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Jul 2011 19:05:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,258,1309762800"; d="scan'208";a="31446854"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by orsmga001.jf.intel.com with ESMTP; 24 Jul 2011 19:05:06 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2011 10:13:17 +0800
Message-Id: <652d45839982a56f3e70b8533a3ef655f33e4eef.1311558123.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <cover.1311558123.git.lei.mei@intel.com>
References: <cover.1311558123.git.lei.mei@intel.com>
In-Reply-To: <cover.1311558123.git.lei.mei@intel.com>
References: <cover.1311558123.git.lei.mei@intel.com>
Subject: [PATCH 1/1] perl-dynloader.patch: Fix multilib issue for perl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jul 2011 02:09:17 -0000

The perl-dynloader.patch can't support lib64 lib32, libx32, etc.
Relax the regular expression to fix this issue.

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../perl/perl-5.12.3/perl-dynloader.patch          |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-5.12.3/perl-dynloader.patch b/meta/recipes-devtools/perl/perl-5.12.3/perl-dynloader.patch
index d5ea00f..1840605 100644
--- a/meta/recipes-devtools/perl/perl-5.12.3/perl-dynloader.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.3/perl-dynloader.patch
@@ -19,7 +19,7 @@ Update by Nitin A Kamble <nitin.a.kamble@intel.com> 2011/04/21
 +    {
 +        my $hostlib = $ENV{PERLHOSTLIB};
 +        print STDERR "*** Module name IN: $modlibname\n";
-+        ($p1, $p2, $p3, $p4, $p5) = $modlibname =~ m/(^(.*lib\/)?)((perl\/[0-9\.]*\/)?)(.*)$/;
++        ($p1, $p2, $p3, $p4, $p5) = $modlibname =~ m/(^(.*lib\w*\/)?)((perl\/[0-9\.]*\/)?)(.*)$/;
 +        print STDERR "*** p1: $p1  p3: $p3  p5: $p5\n";
 +        if ( $p1 ne "" ) {
 +            $modlibname = $hostlib.$p5;
-- 
1.6.3.3



