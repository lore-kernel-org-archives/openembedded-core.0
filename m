Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE05C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 19:26:55 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.7100.1744313210642111704
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 12:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=R7q15OO2;
 spf=pass (domain: snapchat.com, ip: 209.85.208.43, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso1588183a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 12:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1744313208; x=1744918008; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2wRmrqo7mFtqtO33p879oseQxg+MpWAjf1o5piNRBg=;
        b=R7q15OO2IMFL0OnW9dhhai1xmbsEloJr8IlwWwRvPlAXGwlaZLMqu25IpkCesV8f9g
         C17upBHmdzlYll62fEJELtAvGqSBiNgQYDMPW/KtRk/u8Y+v7XDbiYHy1Z9shgdbxwJl
         /g+ZgpR30mh1CaJS9RVBiBgw4YStKvJICp34k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744313208; x=1744918008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2wRmrqo7mFtqtO33p879oseQxg+MpWAjf1o5piNRBg=;
        b=n5sjs3iwpsdQ5Fi2JuvIRpFyjPIqYqviFA1qRjrtQdoVtPd8u7W03IXHm79oFy5Imm
         B9CkAV4lKjMNqtOm4sNzJIOPhYkIcfldwO3ik8qDnBdFvnKIF/3NJEnnGz7UFNT0s96m
         H20rP2fv5Y7JAZYdJx9epyfTdVnlIIh22T7BMXlBDbycMSej9Tb+a62VdoQHSQHW+wMy
         KlYNzGzfoI3E8UUseJrN3dU9vHmkgsv/16jnzms/UvqyBSiL/7/3sTsRrdvGFRQMw4+f
         y5ckz0HhM/Q8xEU7zMRg8kMrQYLCNVRQ2HcM/EiHIJvGwmIMYt0/LXE6powRaGLhj2+5
         VElA==
X-Gm-Message-State: AOJu0Yxhp5GB8u7zSLJmWTGzYZVmUtHnHLorXsKKrCovf8Fk/jwj+cA4
	cWi59HH6cAa63actpuF0AcJJuduPzPdZVVwaWDTqQhbA2wxBZWvLBSSbbmPGhKOiH29j9E6NGXz
	HVK4=
X-Gm-Gg: ASbGncuDLazAFHKIyXStrbNJ9GKborfdXslDnedoAewaWl5gQWp+9112ZXCXv8MKYYg
	GTSiGCPObUwXEeDDcbNb170P5YA34EkN8vFeaCbHRchjAKsdoZrnpD9jpdK0tbyQR4RmBuomY5K
	jTTuqVrSFTW55VgEBU47ZAkWgpVERuVVsRoQ+UPl+gTgyLS8mPPnwpJ4Xl3QC4m4WYbbKjNPLPR
	vObrYpZZXeii10DG8yvh23L9x3hmAU7zjMhiKebFaMaeNL3rpQ0dVJx/MgnMuKBf/dLrvemRQHA
	e12Z7ZPgRmJUyn4iiyomYsVhpjqtNx3WW0Hrqxu7zkLlcChZ0+6ewQ==
X-Google-Smtp-Source: AGHT+IE/pg74SEecPDoKzqa+tOUUtjDnjRn6G8wovSNuSWx6aXFmQyHZxGJjjoXonCxDAdqz+20iWw==
X-Received: by 2002:a17:907:3e11:b0:ac7:ec6f:a7c with SMTP id a640c23a62f3a-acabd1ddb9amr364383966b.13.1744313208309;
        Thu, 10 Apr 2025 12:26:48 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3508sm318235366b.8.2025.04.10.12.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 12:26:48 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH 2/2] source-highlight: re-add recipe
Date: Thu, 10 Apr 2025 21:26:32 +0200
Message-ID: <20250410192632.2818966-2-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410192632.2818966-1-ecordonnier@snap.com>
References: <20250410192632.2818966-1-ecordonnier@snap.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 19:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214702

From: Etienne Cordonnier <ecordonnier@snap.com>

source-highlight version 3.1.8 was removed in https://web.git.yoctoproject.org/poky/commit/?id=6560db9ddfd39a2715ede96430228306b00f53dd in June 2019 because the was no user left,
however there is now a gdb PACKAGECONFIG option which uses it. Since the last release was in 2019, let's rather use the latest git version.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../source-highlight/source-highlight_git.bb  | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/source-highlight/source-highlight_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 2b47d3103c0..831494312b6 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -777,6 +777,7 @@ RECIPE_MAINTAINER:pn-shutdown-desktop = "Unassigned <unassigned@yoctoproject.org
 RECIPE_MAINTAINER:pn-signing-keys = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-slang = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-socat = "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER:pn-source-highlight = "Etienne Cordonnier <ecordonnier@snap.com>"
 RECIPE_MAINTAINER:pn-speex = "Michael Opdenacker <michael@opdenacker.org>"
 RECIPE_MAINTAINER:pn-speexdsp = "Michael Opdenacker <michael@opdenacker.org>"
 RECIPE_MAINTAINER:pn-spirv-headers = "Jose Quaresma <quaresma.jose@gmail.com>"
diff --git a/meta/recipes-support/source-highlight/source-highlight_git.bb b/meta/recipes-support/source-highlight/source-highlight_git.bb
new file mode 100644
index 00000000000..ad5085250cb
--- /dev/null
+++ b/meta/recipes-support/source-highlight/source-highlight_git.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Syntax highlight utility"
+DESCRIPTION = "Source-highlight converts source code to formatted text with syntax highlighting."
+HOMEPAGE = "https://www.gnu.org/software/src-highlite/"
+LICENSE = "GPL-3.0-only"
+SECTION = "libs"
+LIC_FILES_CHKSUM = "file://COPYING;;md5=ff95bfe019feaf92f524b73dd79e76eb"
+
+SRCREV = "894cacd0799ca60afa359a63782729dec76cbb79"
+PV = "3.1.9+git"
+SRC_URI = "git://git.savannah.gnu.org/git/src-highlite.git;protocol=https;branch=master"
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+DEPENDS:append = " bison-native boost"
+
+DEPENDS:append:class-target = " ${PN}-native"
+
+EXTRA_OECONF="--with-boost-regex=boost_regex"
+
+BBCLASSEXTEND = "native nativesdk"
+
+PACKAGES += "${PN}-tools ${PN}-data"
+
+RDEPENDS:${PN} = "boost-regex ${PN}-data"
+RDEPENDS:${PN}-tools = "${PN} ${PN}-data bash"
+
+FILES:${PN}       = "${libdir}/*${SOLIBS}"
+FILES:${PN}-data  = "${datadir}/source-highlight"
+FILES:${PN}-tools = "${bindir} ${sysconfdir}/bash_completion.d"
+
+# source-highlight is using its own binary from the build tree to make documentation
+# let's substitute the native binary instead
+do_configure:prepend:class-target () {
+     sed -i -e 's,^SRCHILITEEXE = $(top_builddir).*,SRCHILITEEXE = source-highlight,' ${S}/doc/Makefile.am
+}
-- 
2.43.0


