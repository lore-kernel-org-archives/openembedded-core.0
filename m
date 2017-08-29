Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 92A6378315
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 21:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id B08EB2E2F6;
	Tue, 29 Aug 2017 23:21:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id g76MKy2rfArW; Tue, 29 Aug 2017 23:21:45 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 430BF2E0D6;
	Tue, 29 Aug 2017 23:21:44 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 95EB31E099;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8AF4B1E095;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 7F2742144;
	Tue, 29 Aug 2017 23:21:43 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v7TLLgKe030290;
	Tue, 29 Aug 2017 23:21:42 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v7TLLg4t030288;
	Tue, 29 Aug 2017 23:21:42 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 23:21:19 +0200
Message-Id: <2ac2d704e2c5ac4f0f590a2ceaf0f47ff4a3d140.1504041417.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1504041416.git.pkj@axis.com>
References: <cover.1504041416.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [pyro][PATCH 23/25] rpm: Disable perl dependency generation
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
X-List-Received-Date: Tue, 29 Aug 2017 21:21:48 -0000

From: Mark Hatle <mark.hatle@windriver.com>

When rpmdeps files a perl script, it attempts to determine what it provides
and what it requires.  Often the requires are incorrect, within the context
of Wind River Linux.  This results in an error that DNF is unable to install
a package due to one or more unresolved dependencies.

In RPM5 we had disabled this behavior, the alternative is to require that all
perl scripts be 'complete', in that they only require things they absolutely
need and that OE provides.  If we ever enforce that, this commit can be
reverted.  Until they fall back to prior behavior (which also matches ipkg
and deb style packages.)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../rpm/files/0001-perl-disable-auto-reqs.patch    | 32 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_git.bb               |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch b/meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch
new file mode 100644
index 0000000000..a6c58699d3
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch
@@ -0,0 +1,32 @@
+perl: disable auto requires
+
+When generating automatic requirements, it's possible for perl scripts to
+declare 'optional' dependencies.  These seem to often be incorrect and will
+cause installation failures in OE.  Instead of fixing the perl scripts, it
+was decided it is better to simply disable the automatic dependency
+generation.  This matches the behavior from the previous RPM5 implementation.
+
+Upstream-Status: Inappropriate [OE specific configuration]
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: git/fileattrs/perl.attr
+===================================================================
+--- git.orig/fileattrs/perl.attr
++++ git/fileattrs/perl.attr
+@@ -1,3 +1,3 @@
+-%__perl_requires	%{_rpmconfigdir}/perl.req
++#__perl_requires	%{_rpmconfigdir}/perl.req
+ %__perl_magic		^.*[Pp]erl .*$
+ %__perl_flags		exeonly
+Index: git/fileattrs/perllib.attr
+===================================================================
+--- git.orig/fileattrs/perllib.attr
++++ git/fileattrs/perllib.attr
+@@ -1,5 +1,5 @@
+ %__perllib_provides	%{_rpmconfigdir}/perl.prov
+-%__perllib_requires	%{_rpmconfigdir}/perl.req
++#__perllib_requires	%{_rpmconfigdir}/perl.req
+ %__perllib_magic	^Perl[[:digit:]] module source.*
+ %__perllib_path		\\.pm$
+ %__perllib_flags	magic_and_path
diff --git a/meta/recipes-devtools/rpm/rpm_git.bb b/meta/recipes-devtools/rpm/rpm_git.bb
index 971aac7867..b0f57809cc 100644
--- a/meta/recipes-devtools/rpm/rpm_git.bb
+++ b/meta/recipes-devtools/rpm/rpm_git.bb
@@ -38,6 +38,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm \
            file://0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch \
            file://0012-Use-conditional-to-access-_docdir-in-macros.in.patch \
            file://0013-Add-a-new-option-alldeps-to-rpmdeps.patch \
+           file://0001-perl-disable-auto-reqs.patch \
            "
 
 PV = "4.13.90+git${SRCPV}"
-- 
2.12.0


