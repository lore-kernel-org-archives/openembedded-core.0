Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B88D0783D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 21:21:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7FLLerp026532
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 15 Aug 2017 14:21:40 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 15 Aug 2017 14:21:39 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Aug 2017 16:19:52 -0500
Message-ID: <1502831992-47827-7-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1502831992-47827-1-git-send-email-mark.hatle@windriver.com>
References: <1502831992-47827-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Cc: peter.kjellerstedt@axis.com
Subject: [PATCH 6/6] rpm: Disable perl dependency generation
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
X-List-Received-Date: Tue, 15 Aug 2017 21:21:42 -0000
Content-Type: text/plain

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
---
 .../rpm/files/0001-perl-disable-auto-reqs.patch    | 30 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_git.bb               |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch b/meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch
new file mode 100644
index 0000000..0e1a579
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch
@@ -0,0 +1,30 @@
+perl: disable auto requires
+
+When generating automatic requirements, it's possible for perl scripts to
+declare 'optional' dependencies.  These seem to often be incorrect and will
+cause installation failures in OE.  Instead of fixing the perl scripts, it
+was decided it is better to simply disable the automatic dependency
+generation.  This matches the behavior from the previous RPM5 implementation.
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
index 513b569..d3d042f 100644
--- a/meta/recipes-devtools/rpm/rpm_git.bb
+++ b/meta/recipes-devtools/rpm/rpm_git.bb
@@ -42,6 +42,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm \
            file://0002-Run-binary-package-creation-via-thread-pools.patch \
            file://0003-rpmstrpool.c-make-operations-over-string-pools-threa.patch \
            file://0004-build-pack.c-remove-static-local-variables-from-buil.patch \
+           file://0001-perl-disable-auto-reqs.patch \
            "
 
 PV = "4.13.90+git${SRCPV}"
-- 
1.8.3.1


