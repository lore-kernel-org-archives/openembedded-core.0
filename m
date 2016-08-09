Return-Path: <ulfalizer@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 884B8771EB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 01:48:45 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id 109so6263399uat.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 18:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=ZdEqK38b5EI9dKkytkrV/7g9PUymQqXJDObA0+93UP8=;
	b=bdmG252x4VbG9HYvNArov71WNtgIAelPPfvntY0aeUu2SoEdSoFx6yJwdsAQQwEGWb
	knsbqFkzS32hMH38ftEko6+e0QUj11R79tM7ph+rJe8DuGv8x09wyPSEWWoauPrVL3+7
	QpZW/Buxn4gPY4W5+41I6rJcuNZYm8DWLJa35JBf9XzPcH+BFo9hYFiy5Ap8r9ynhT2g
	LwTExqaVsTD3qy4KJXXrEVcw7FTBf4eqCQv9zDm/vhiec13p5uvboCLIZf6HnsyDygQ5
	OoMRYSBDHuSorFK6lO1yxki5koJ16EKuZLkCYbJjJ75fl0Y0sz0slV44EYJSfR/rLYiO
	WLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ZdEqK38b5EI9dKkytkrV/7g9PUymQqXJDObA0+93UP8=;
	b=CV1EQYaRWXF9SpHzj2ZkgxLuGezJNvccBiZtNUMUrArAE2jPRr9w2SKqYWBAJ9Fw9D
	Zr5f7M4EUtY+B7hckbDjaDI9AKHcKNOu8LXbon/Dzx9+kumlLP8BeNdIgcYJ+XvDKgAe
	5UlF91Waammr/xj+NVotLCS8vvkt8OSpYTYiTHQ20ycOjGc9Vbadp4l/WbjnEhqTogmU
	Mx6H4BNO1I48I1ZcAm7RpjD5E5e1FSrm3Vnr6LYpIOqYrIisf/Me0VZNJiEbauIyr88i
	L4bQvH2Cu+WVJ2ntrlgTIjOVNlgVzjfGtfbDGrW/EsM5myiwYqFfZDrE69nCwMZOWx/K
	N5Eg==
X-Gm-Message-State: AEkoouuO+8Kz1ajn4n4MLypRE7cLJf/qZpNnY9Btv1wUqRGZaakF2haHA5jLIMliaScbX/SV+q9lvPDd7H/c6A==
X-Received: by 10.31.53.75 with SMTP id c72mr49713952vka.62.1470707325585;
	Mon, 08 Aug 2016 18:48:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.124.70 with HTTP; Mon, 8 Aug 2016 18:48:45 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Tue, 9 Aug 2016 03:48:45 +0200
Message-ID: <CAFkk2KRmMbNhL=V82H-vuYmvRBDMxKOE7c-J=u2=YGHBPmYYSg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: [PATCH] useradd.bblass: Simplify target overrides
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
X-List-Received-Date: Tue, 09 Aug 2016 01:48:46 -0000
Content-Type: text/plain; charset=UTF-8

The current style might be a leftover from when _class-target did not
exist.

Also change the assignment to SSTATECLEANFUNCS to an append, which makes
more sense. useradd.bbclass is the only user of SSTATECLEANFUNCS as of
writing, so it won't make any functional difference.
---
 meta/classes/useradd.bbclass | 31 ++++++++-----------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 8d51fb5..25526ef 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -3,11 +3,7 @@ inherit useradd_base
 # base-passwd-cross provides the default passwd and group files in the
 # target sysroot, and shadow -native and -sysroot provide the utilities
 # and support files needed to add and modify user and group accounts
-DEPENDS_append = "${USERADDDEPENDS}"
-USERADDDEPENDS = " base-files shadow-native shadow-sysroot shadow"
-USERADDDEPENDS_class-cross = ""
-USERADDDEPENDS_class-native = ""
-USERADDDEPENDS_class-nativesdk = ""
+DEPENDS_append_class-target = " base-files shadow-native shadow-sysroot shadow"

 # This preinstall function can be run in four different contexts:
 #
@@ -157,28 +153,17 @@ if test "x${STAGING_DIR_TARGET}" != "x"; then
 fi
 }

-SSTATECLEANFUNCS = "userdel_sysroot_sstate"
-SSTATECLEANFUNCS_class-cross = ""
-SSTATECLEANFUNCS_class-native = ""
-SSTATECLEANFUNCS_class-nativesdk = ""
+SSTATECLEANFUNCS_append_class-target = " userdel_sysroot_sstate"

 do_install[prefuncs] += "${SYSROOTFUNC}"
-SYSROOTFUNC = "useradd_sysroot"
-SYSROOTFUNC_class-cross = ""
-SYSROOTFUNC_class-native = ""
-SYSROOTFUNC_class-nativesdk = ""
-SSTATEPREINSTFUNCS += "${SYSROOTPOSTFUNC}"
-SYSROOTPOSTFUNC = "useradd_sysroot_sstate"
-SYSROOTPOSTFUNC_class-cross = ""
-SYSROOTPOSTFUNC_class-native = ""
-SYSROOTPOSTFUNC_class-nativesdk = ""
-
-USERADDSETSCENEDEPS =
"${MLPREFIX}base-passwd:do_populate_sysroot_setscene
pseudo-native:do_populate_sysroot_setscene
shadow-native:do_populate_sysroot_setscene
${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
-USERADDSETSCENEDEPS_class-cross = ""
-USERADDSETSCENEDEPS_class-native = ""
-USERADDSETSCENEDEPS_class-nativesdk = ""
+SYSROOTFUNC_class-target = "useradd_sysroot"
+SYSROOTFUNC = ""
+
+SSTATEPREINSTFUNCS_append_class-target = " useradd_sysroot_sstate"
+
 do_package_setscene[depends] += "${USERADDSETSCENEDEPS}"
 do_populate_sysroot_setscene[depends] += "${USERADDSETSCENEDEPS}"
+USERADDSETSCENEDEPS_class-target =
"${MLPREFIX}base-passwd:do_populate_sysroot_setscene
pseudo-native:do_populate_sysroot_setscene
shadow-native:do_populate_sysroot_setscene
${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"

 # Recipe parse-time sanity checks
 def update_useradd_after_parse(d):
-- 
2.5.0

