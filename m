Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 207F06C4A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 16:11:58 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id j10so2475555wru.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 08:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hXNCtf5kzyM5BVadbG19L48Aq3W6hbm37pzkDTM/yko=;
	b=I5L4viVMkJPRGg5J0SYgNRZsCsu5x3irC4RmLLFpco90tpsuh69NcjVhX6IByxNDkF
	hmivxryOZ2IYR6X4Z4QdP3OBrYmLcqEEjyrbQCSXPh41hu+T7pt8LW6gM6IHEhxj8vAY
	JCrwsyAclpFP5UrSroLqA5rjYB3CprPR5aK0ODB5CHNc6rCGGA+5sa+2CQUlxne4K7rT
	ujNr/dKPnDNPydFPT3ikFQgA++PuuBOpwKfs+AjTTNf24xR0pf+zTbMnNmXVNq6GHm22
	ILnZToS+z99BdK1mqbweVW22t/mIJfpNj0Hd7NeteqWcqn6Q1NTEgRuYWjZ7ODn8y4Yd
	t6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hXNCtf5kzyM5BVadbG19L48Aq3W6hbm37pzkDTM/yko=;
	b=ccHiPKCnLA0uO92GViiLIOlFNDNpQnPQNMFoHQ5IgotDu6FGRu5oGOXHTXuFaH3J8c
	8ueZhDuOv8MDrwsUtYsBxg6eZlgJ1LuH7NPe4CE8TY8xynEmH75QtZm6lUi1PBGgigsb
	awUWRS+9LTadMSfkc/hEADpmf063z8OW/B3l27dJc7PhPxbDSoga31mqXUpyWtrHVyf7
	kziBxTpSiKediPewNAYr8BW4ejvoW4quAr47AHYYFJgHRcZe/oYnY3Nv2VG1xYzLLUP4
	uTdVazFu5OqMdgCpJ0xLl8NjNZSsgmx7BOpwsLKwBF9O5eFaREYzcPVjdpbZ1quH+QK4
	hQwA==
X-Gm-Message-State: AA+aEWYurdcM4zZxdFVvJKrC1gAkT2Db0nVLTDu4hVyGJX1bfmB+XT0z
	uEbwrs+P/4DG+VPHmCkDDwnNNaHi
X-Google-Smtp-Source: AFSGD/VExKEirZhsupJpSGlPABrC03bv6xCRLml3YhGzjvqEM+t3+dL+bmN/eYqUefADnCv91RB8nw==
X-Received: by 2002:adf:d112:: with SMTP id a18mr2056335wri.17.1543507919282; 
	Thu, 29 Nov 2018 08:11:59 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	p125-v6sm628698wmp.2.2018.11.29.08.11.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Nov 2018 08:11:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 17:11:50 +0100
Message-Id: <20181129161150.41678-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] libc-package: fix postinst error when ENABLE_BINARY_LOCALE_GENERATION = "0"
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
X-List-Received-Date: Thu, 29 Nov 2018 16:11:59 -0000

[YOCTO #13028]

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/libc-package.bbclass | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 4c694ab5e2b..6b1e84ef7e3 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -49,13 +49,7 @@ python __anonymous () {
 
 OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
 
-locale_base_postinst() {
-#!/bin/sh
-
-if [ "x$D" != "x" ]; then
-	exit 1
-fi
-
+locale_base_postinst_ontarget() {
 localedef --inputfile=${datadir}/i18n/locales/%s --charmap=%s %s
 }
 
@@ -215,7 +209,7 @@ python package_do_split_gconvs () {
     def output_locale_source(name, pkgname, locale, encoding):
         d.setVar('RDEPENDS_%s' % pkgname, '%slocaledef %s-localedata-%s %s-charmap-%s' % \
         (mlprefix, mlprefix+bpn, legitimize_package_name(locale), mlprefix+bpn, legitimize_package_name(encoding)))
-        d.setVar('pkg_postinst_%s' % pkgname, d.getVar('locale_base_postinst') \
+        d.setVar('pkg_postinst_ontarget_%s' % pkgname, d.getVar('locale_base_postinst_ontarget') \
         % (locale, encoding, locale))
         d.setVar('pkg_postrm_%s' % pkgname, d.getVar('locale_base_postrm') % \
         (locale, encoding, locale))
-- 
2.17.1


