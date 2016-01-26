Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 13C146FFD4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 18:20:46 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id s5so66344954qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 10:20:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=shZ+//iq5hIW+CknvAldhosgHG20ezcduYoWTyFWIAw=;
	b=Zt+uL1rnxUqJd5wjZ8sHV0EXPEO0vo/ERa1COfFtbMAMwYZ1Xdnmon0et2qt8iqFVt
	FFBos2bbOPMBtzOfONhIMaoe/sO76p9ZAClL6o7v74ZEpQVkfUR9RaYtZ39Fwn7ASEAK
	kP47+1xNAnUAhB3T8akhmKapwGV8LSjKjujgSvCMvn5B/dhx5KQxXkTx65V62fDJslFD
	/cRP41AAkuN/4uzkzznXw3V+XyqAMhnAQ5+eUHXOpR8qa/Tggtfskikgb44KOk1R9EHI
	+VbB2Jja/Iu7JO4j4xFXZ0ElleipbIo9B5cSOegxws3JGUlhfGDYRRA2wwfA2wNfULdM
	ghDw==
X-Gm-Message-State: AG10YOTonqtojQDJLgmK2WesUip9bOS/BCCeqc/gbaDKjcn//aA4+qnpk+ZwmsCy/d5pJA==
X-Received: by 10.55.73.68 with SMTP id w65mr29477106qka.68.1453832447330;
	Tue, 26 Jan 2016 10:20:47 -0800 (PST)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id r7sm965490qhb.41.2016.01.26.10.20.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jan 2016 10:20:46 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jan 2016 13:20:38 -0500
Message-Id: <1453832438-20802-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [PATCH] attr: fix build issue with NLS disabled on non-uclibc targets
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
X-List-Received-Date: Tue, 26 Jan 2016 18:20:54 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta/recipes-support/attr/ea-acl.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index 370e16f..ab98380 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -23,8 +23,8 @@ FILES_lib${BPN} = "${base_libdir}/lib*${SOLIBS}"
 
 BBCLASSEXTEND = "native"
 # Only append ldflags for target recipe and if USE_NLS is enabled
-LDFLAGS_append_libc-uclibc_class-target = "${@['', ' -lintl '][(d.getVar('USE_NLS', True) == 'yes')]}"
-EXTRA_OECONF_append_libc-uclibc_class-target = "${@['', ' --disable-gettext '][(d.getVar('USE_NLS', True) == 'no')]}"
+LDFLAGS_append_class-target = "${@['', ' -lintl '][(d.getVar('USE_NLS', True) == 'yes')]}"
+EXTRA_OECONF_append_class-target = "${@['', ' --disable-gettext '][(d.getVar('USE_NLS', True) == 'no')]}"
 
 fix_symlink () {
 	if [ "${BB_CURRENTTASK}" != "populate_sysroot" -a "${BB_CURRENTTASK}" != "populate_sysroot_setscene" ]
-- 
1.9.1


