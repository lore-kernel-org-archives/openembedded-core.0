Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 60E6D7700B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 09:52:37 +0000 (UTC)
Received: by iofh134 with SMTP id h134so79142028iof.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Oct 2015 02:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4h1PaLCkh2DYpMgeuTUHWnE0H7ZlE2agBbhAUyj8HJ8=;
	b=keKC4I1JUFn73yonRgmPQVqthyLmI3P3uJQovYgk9EnYer887YufNylIv4LjgRAqOM
	3RWZpBEZJDwsbrNuBD/GEcvwVp8rYeiTqiEDgyM1SZSgAyuDxvSItyAjySvMQlvQbRhX
	/9sHYojjASVrRYyES83XvgbqrWCoeBWHlazWEdqMMileyv1p83FYmoDcBHGCNoS9O8dR
	wk0sr6BB1oG0UoPmuIe17bOJPwMnpUuP09IIAosXluBPxwSWO+wkQOuEazZsgKaU7dG3
	BhrESHirARWFJ5odW0nBlV9GVOXP//WKHNXq0ef0LqqIX7Shg0qJ903/Z1Um1H4tZA0u
	uUIA==
X-Gm-Message-State: ALoCoQnqeZXY0Dg3fT8LXtTNDeG4izLlrtUxfX3r6njNYE/BKY86Z5no9r2gUlXjjq8GPvZ2OCzS
X-Received: by 10.107.15.69 with SMTP id x66mr9870784ioi.156.1443693158164;
	Thu, 01 Oct 2015 02:52:38 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8EAD6.dip0.t-ipconnect.de.
	[93.232.234.214])
	by smtp.gmail.com with ESMTPSA id 95sm2348721iop.31.2015.10.01.02.52.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Oct 2015 02:52:37 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Oct 2015 11:53:02 +0200
Message-Id: <1443693182-25212-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-java] [PATCH] openjdk-8: fix TUNE_CCARGS on intel-core2-32/i686
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
X-List-Received-Date: Thu, 01 Oct 2015 09:52:40 -0000

A machine-independent recipe must not have machine-specific changes,
as in TUNE_CCARGS_append_intel-core2-32. In the best case, that only
causes unnecessary rebuilds when switching machines with the same CPU
which otherwise could share sstate. In the worst case, it confuses PR
server and build history such that building fails with "version going
backwards".

There are not tune-specific overrides, so a Python snippet is used to
apply the additional parameters on all machines with the same
TUNE_ARCH as intel-core2-32 (like for example edison).

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 recipes-core/openjdk/openjdk-8_60b27-2.5.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-8_60b27-2.5.4.bb b/recipes-core/openjdk/openjdk-8_60b27-2.5.4.bb
index 6a95dd2..329933e 100644
--- a/recipes-core/openjdk/openjdk-8_60b27-2.5.4.bb
+++ b/recipes-core/openjdk/openjdk-8_60b27-2.5.4.bb
@@ -58,7 +58,8 @@ export CACAO_CONFIGURE_ARGS = " \
 
 JAVA_HOME[unexport] = "1"
 
-TUNE_CCARGS_append_intel-core2-32 = " -mstackrealign -fno-omit-frame-pointer "
+# For intel-core2-32 and Edison.
+TUNE_CCARGS_append = "${@' -mstackrealign -fno-omit-frame-pointer' if '${TUNE_ARCH}' == 'i686' else ''}"
 
 # disable shark until it is fully working again
 # WITH_ADDITIONAL_VMS ?= "--with-additional-vms=shark,cacao,jamvm"
-- 
2.1.4


