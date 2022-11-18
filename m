Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC8DC43217
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 17:52:40 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.64.1668793956362074936
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 09:52:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RoLX9xG4;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id u6-20020a17090a5e4600b0021881a8d264so3390622pji.4
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 09:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lEzRHXRebGsw5rAnDkQ9+6EJGG7HbrCk77OKrN3Jnhs=;
        b=RoLX9xG4RPyEI/xrC48KQzn9nHLzc3OdxRWfd9KP5xwEjoYi5fHHPA3jnl2Ki9pgE7
         AkfcOSqQ6J520m1zO2XA3ban0YcC35+xmgxiTxKoCfRwI6scQYGRwcaE+IcKt9iEghf5
         PnlPvGjvMms5+6FK4jitbrh0cxZZLUooaxvh2W2ZZwiNPxQaxEg70wQNnuHxxftTIzng
         WGqn3BTqoxxEtfIIGPdVVZvdv8mNwFEXk9tkJHfP1RBitEdyMfEEN8WLpkkd0RKwP0MZ
         5skE9kJ88wQuy9JjZ8rImkWmrHbbXUmDa1U6mz/sUowie9yECa+ZOd47rG4qD4AbG3rl
         7gZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lEzRHXRebGsw5rAnDkQ9+6EJGG7HbrCk77OKrN3Jnhs=;
        b=Cex1VfnEDyw7y6xYgLuWABK/uvbcdRlTdzzqOGTo+FaqIZnQqnTMojIGmPICdoaqUl
         eqhXqA975S6DU/LOAvPN+Mli4yRppOmb5t4fCM5E+HwT77ixRFoYQjvhC2j78c8DhlZL
         L/nyk8S3g+ZtXf6CkP0blK7utbHy87pJ+ry4Yct+9s0OzsPQ6rPjpcI731vHXLljIiOB
         vTbaGUo8PdxsjkJP2m4rs/7KXfzn0VyPWTT6xkEKZNyJGiCpyALOCC1VxSQd1k/E2wnY
         Q8+3rxxwpE74M052qBStD7x9/U8xuIw8fnDzAD3a4NjjpI02GbxhnprvgGEHmKBq0eFq
         J7Sw==
X-Gm-Message-State: ANoB5pkg5HJyH89IQQkrQNE0KuqxsZMxDhfkciHoGoGJrU52buTNoWJo
	2Fc4y0foBPw4jK7EJ/Xlhxocmzp+7PYaiw==
X-Google-Smtp-Source: AA0mqf5lySXf2GT2UdYSqUB36wJesHV06ZVGPl/UDPyKZQRalZVuCs6uPqK2t/IBNZFgB/Ow0kZP/g==
X-Received: by 2002:a17:902:8b89:b0:186:9c43:5969 with SMTP id ay9-20020a1709028b8900b001869c435969mr648686plb.32.1668793955331;
        Fri, 18 Nov 2022 09:52:35 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:6693:e191:c3fe:39ff])
        by smtp.gmail.com with ESMTPSA id k28-20020aa79d1c000000b0056c702a370dsm3443173pfp.117.2022.11.18.09.52.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 09:52:34 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] libtest-warnings-perl: move from meta-perl
Date: Fri, 18 Nov 2022 09:52:06 -0800
Message-Id: <a4f847dcc056026082099ae4977bf6a8e8bd89bc.1668793524.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1668793524.git.tim.orling@konsulko.com>
References: <cover.1668793524.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 17:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173486

liburi-perl in oe-core now RDEPENDS on libtest-warnings-perl for ptest

* Update HOMEPAGE; fix syntax
* Add SUMMARY
* Add BUGTRACKER
* Use CPAN_MIRROR for SRC_URI
* Use actual LICENCE file for LIC_FILES_CHKSUM
* Add RDEPENDS
* Add RDEPENDS on perl-modules for ptest
  - Too many hidden dependencies that fail silently, but pass
    with full perl-modules
* Add self as maintainer
* Add to ptest-packagelists (fast)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../perl/libtest-warnings-perl_0.031.bb       | 39 +++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/libtest-warnings-perl_0.031.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 42e705bda95..75931516323 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -391,6 +391,7 @@ RECIPE_MAINTAINER:pn-libssp-nonshared = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libtasn1 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libtest-fatal-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libtest-needs-perl = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-libtest-warnings-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libtheora = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libtimedate-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libtirpc = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 983f1dd72a5..cf1b57e1867 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -35,6 +35,7 @@ PTESTS_FAST = "\
     libtimedate-perl-ptest \
     libtest-fatal-perl-ptest \
     libtest-needs-perl-ptest \
+    libtest-warnings-perl-ptest \
     libtry-tiny-perl-ptest \
     liburi-perl-ptest \
     libusb1-ptest \
diff --git a/meta/recipes-devtools/perl/libtest-warnings-perl_0.031.bb b/meta/recipes-devtools/perl/libtest-warnings-perl_0.031.bb
new file mode 100644
index 00000000000..e03deaf15fa
--- /dev/null
+++ b/meta/recipes-devtools/perl/libtest-warnings-perl_0.031.bb
@@ -0,0 +1,39 @@
+# Copyright (C) 2020 Jens Rehsack <sno@netbsd.org>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Test::Warnings - Test for warnings and the lack of them"
+DESCRIPTION = "If you've ever tried to use Test::NoWarnings to confirm there are no \
+warnings generated by your tests, combined with the convenience of \
+\\"done_testing\\" to not have to declare a test count, you'll have discovered \
+that these two features do not play well together, as the test count will \
+be calculated *before* the warnings test is run, resulting in a TAP error. \
+(See "examples/test_nowarnings.pl" in this distribution for a \
+demonstration.)"
+HOMEPAGE = "https://github.com/karenetheridge/Test-Warnings"
+BUGTRACKER = "https://rt.cpan.org/Public/Dist/Display.html?Name=Test-Warnings"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+
+LIC_FILES_CHKSUM = "file://LICENCE;md5=6f2b02f39e7d359efd9525fbc56c84a1"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Test-Warnings-${PV}.tar.gz"
+
+SRC_URI[sha256sum] = "1e542909fef305e45563e9878ea1c3b0c7cef1b28bb7ae07eba2e1efabec477b"
+
+S = "${WORKDIR}/Test-Warnings-${PV}"
+
+inherit cpan ptest-perl
+
+RDEPENDS:${PN} += "\
+    perl-module-test-builder \
+"
+
+# Many hidden dependencies and mysterious failures occur without full perl-modules
+RDEPENDS:${PN}-ptest += "perl-modules"
+
+do_install_ptest_perl:append () {
+    cp -r ${B}/t/lib ${D}${PTEST_PATH}/t/
+    chown -R root:root ${D}${PTEST_PATH}/t/lib
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


