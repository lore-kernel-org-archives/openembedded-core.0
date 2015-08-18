Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7298D60043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 13:55:45 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so96129603wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 06:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=a8JFEJzLk5L+khtI2yudWm8HN+OKMv6reaqeApekISw=;
	b=HXHbzqm0q8xOn/Eod+KVKl+1Eq8uC7XGEIloNHY7Vo3zvYFyT57ERmMInFkWNWndN2
	BcPxQrqpoUinACRdSynq/DLqVErwL06eJj8vEw7G6S6rh89L8q6WT7fqR2XGubnx72lb
	l5HrsO6xegmP/9y6EAzsAe5mOJemG7QboqLV+KK/hy3MmEExaOBlc5sMlOKsapqllLR7
	HKZZuJoJ9kK8NA1cumotEUnleNZunidP93fcs/OsrF7uIhOGzU+Vn8yL8nsf7rWIyMDd
	tis/5DR9Ni+cdH+l6gwmYmeQETIYwHhqrnpK/uTTzrfV8qzyQeX53LGcRaZ+rHuPjK2V
	JCZQ==
X-Received: by 10.180.188.201 with SMTP id gc9mr45030086wic.39.1439906145892; 
	Tue, 18 Aug 2015 06:55:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ev2sm21515907wib.21.2015.08.18.06.55.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Aug 2015 06:55:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Aug 2015 15:55:47 +0200
Message-Id: <1439906147-14749-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] glibc-package: use ${PN} in INSANE_SKIP
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
X-List-Received-Date: Tue, 18 Aug 2015 13:55:48 -0000

* INSANE_SKIP_${PN}_append_aarch64 is causing following warning in some
  setups:
  WARNING: Variable key INSANE_SKIP_${PN} () replaces original key INSANE_SKIP_glibc ().
* in worst case this will be applied also for glibc-initial package
  which is using the same glibc-package.inc, but glibc-initial doesn't
  create any packages so we should be fine
* someone building for aarch64 should confirm verify that this
  INSANE_SKIP is still needed and cannot be fixed properly it was
  introduced in:
    commit aeb6f53dd607ceb0d2265a05c27f751109c73752
    Author: Mark Hatle <mark.hatle@windriver.com>
    Date:   Thu Dec 18 16:51:13 2014 +0800

    glibc-package: aarch64 enable symlink for ABI compliance

    aarch64 requires the ld.so to be present in /lib, even if the rest
    of the libraries are installed into an alternative directory.

    See: https://sourceware.org/glibc/wiki/ABIList

    Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index def0e0c..c72a49e 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -35,7 +35,7 @@ RPROVIDES_${PN}-pcprofile = "eglibc-pcprofile"
 RPROVIDES_${PN}-dbg = "eglibc-dbg"
 libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/libmvec-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
 libc_baselibs_append_aarch64 = " /lib/ld-linux-aarch64*.so.1"
-INSANE_SKIP_glibc_append_aarch64 = " libdir"
+INSANE_SKIP_${PN}_append_aarch64 = " libdir"
 
 FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '', d)}"
 FILES_ldd = "${bindir}/ldd"
-- 
2.5.0


