Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 085877319F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 20:57:20 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i5so19695860wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 13:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1eB2t226+kFl4ueoi1XEht1y1TbWWs0U8kGV2v/6wUE=;
	b=DVT7l94SB/CTOFpeIrU7rNgMJxo8DvgVHb+ebkhr8RkVaRhU37tz5INbbKh3BdhkIb
	Oe5sd805uHbBIIgu+FcGQXCnb6lpTR1ThSfIWYEuLFp3QX3eHUKdIz4E97z8Wk+N6847
	kxytTrEaSS08sX5JvN6b5NWg9yxAy49a+pX+jdnh5OABCH8PcdCK1tzIK8+taAWnSapQ
	bTD62Kroj63NhZ23zd84mRFF3Lga/sQWM9G0Lh7FN2lM0oElxNwUEl+eAeOzxoQtdyw0
	UWmn7rkgp+Wk+pi2X/5mpZhod7g61rcBqwDf6Kg5rHQU7JtqK68kq0YmRutWQxJgehzs
	RULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1eB2t226+kFl4ueoi1XEht1y1TbWWs0U8kGV2v/6wUE=;
	b=Iy86PSAh1dkIVQIcflAVWUA3Kh1lxM/ZdUnQJINKdkccANt+cedQD+IuokfnlXzyLD
	UwaluQJhC4A/I2zMhkau7PMTiJbA8KeHuRtw//jlKKkblnrgVXkq6Ra+YYqBJ2xW2HYj
	KZ62cc3wBVIRPb/CulGhpuzsi71qDIDMParPVt6sxhSX4cZ9j7SbIC1n2gWT2fZitJdb
	fxTlgnJ59i8F4Xqx6EH431IwnpriMy8540s1IA7m48h90LYhn9Muh4F3qy4uG7Gx/h4i
	mBoVAaT5aGcwshknRWXeX06EoM3wp8pE2DiW0nBuQ+9SEGX1+iH5yEY5JivMY9H5gwJ/
	LcxQ==
X-Gm-Message-State: AEkoouslNhxQQ6ggfeuUW8g9XA1BtpyNcmkL8it7ll1RBz514Z1lAMVIR5b2PbRVjIHnwg==
X-Received: by 10.28.95.67 with SMTP id t64mr22911565wmb.99.1471985840637;
	Tue, 23 Aug 2016 13:57:20 -0700 (PDT)
Received: from huvuddator.home (ip5f5bfeda.dynamic.kabel-deutschland.de.
	[95.91.254.218]) by smtp.gmail.com with ESMTPSA id
	vv2sm5845325wjc.29.2016.08.23.13.57.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Aug 2016 13:57:20 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2016 22:57:05 +0200
Message-Id: <1471985825-7723-2-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1471985825-7723-1-git-send-email-ulfalizer@gmail.com>
References: <1471985825-7723-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH v3 1/1] useradd.bblass: Simplify target overrides
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
X-List-Received-Date: Tue, 23 Aug 2016 20:57:21 -0000

The current style might be a leftover from when _class-target did not
exist.

Also change the assignment to SSTATECLEANFUNCS to an append, which makes
more sense. useradd.bbclass is the only user of SSTATECLEANFUNCS as of
writing, so it won't make any functional difference.
---
 meta/classes/useradd.bbclass | 32 +++++++++-----------------------
 1 file changed, 9 insertions(+), 23 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 8d51fb5..e24b1c5 100644
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
@@ -157,28 +153,18 @@ if test "x${STAGING_DIR_TARGET}" != "x"; then
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
-USERADDSETSCENEDEPS = "${MLPREFIX}base-passwd:do_populate_sysroot_setscene pseudo-native:do_populate_sysroot_setscene shadow-native:do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
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
+USERADDSETSCENEDEPS_class-target = "${MLPREFIX}base-passwd:do_populate_sysroot_setscene pseudo-native:do_populate_sysroot_setscene shadow-native:do_populate_sysroot_setscene ${MLPREFIX}shadow-sysroot:do_populate_sysroot_setscene"
+USERADDSETSCENEDEPS = ""
 
 # Recipe parse-time sanity checks
 def update_useradd_after_parse(d):
-- 
2.5.0


