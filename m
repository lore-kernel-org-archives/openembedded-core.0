Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q0Fta-00022F-4R
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2011 17:17:54 +0100
Received: by ywg8 with SMTP id 8so1172937ywg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2011 09:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=iOxMPu5siwkz6GWLuWySCZxmcfef1ily+vFnrBCxlKQ=;
	b=Sx5bBwENotuDEBz7EZn6t+219p/mE0kT3ucEI6mr09kUsPO5Jg246qk6SqxDh07k8b
	CCrKgvc4WitqZJWgw40mxPu9S9W4wth1ZIsGyzMCZ/N2uu47e9nqmn7ZYx3W+AA2Rzkn
	olLaZ4HcQ5aU9uBXhGqmxBQEgsTxxVPWAIj+w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=BrvUtCeuyS6AVdADuT+W6p03ZuFYu8lgajlKn9nGpb8oqWL3Besl8MLOZGap2b9hnu
	tMjZsaOash7aVS9bRFtANTJaKz91YIWjtaz7gZOiMQPzNilwZW2TyuoMMUqefC4MzOHQ
	/rIh+dvm27wVGS2IQS58LoIVX3bzICHFeSoIs=
Received: by 10.151.102.11 with SMTP id e11mr25877ybm.265.1300378569199;
	Thu, 17 Mar 2011 09:16:09 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id q29sm67146yba.2.2011.03.17.09.16.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2011 09:16:08 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2011 09:15:58 -0700
Message-Id: <d6a11643309421007089e9db94049691acb49ef1.1300378309.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <cover.1300378309.git.chris_larson@mentor.com>
References: <cover.1300378309.git.chris_larson@mentor.com>
In-Reply-To: <cover.1300378309.git.chris_larson@mentor.com>
References: <cover.1300378309.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 4/4] Shift a few env bits into scripts/bitbake
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Mar 2011 16:17:54 -0000

From: Chris Larson <chris_larson@mentor.com>

This attempts to separate the bits we *require* to run bitbake with oe-core
via the wrapper script, and which are independent of the build environment
(PSEUDO_DISABLED, PSEUDO_BUILD, BBFETCH2) from those which are more particular
to poky-init-build-env's way of setting things up (e.g. adding MACHINE to
BB_ENV_EXTRAWHITE, relying on OEROOT, etc).  This should make it easier to use
scripts/bitbake with non-standard workflows.

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 scripts/bitbake           |    4 ++++
 scripts/poky-env-internal |    4 +---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/bitbake b/scripts/bitbake
index 437d84e..39d5957 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -1,4 +1,8 @@
 #!/bin/sh
+
+export BBFETCH2=True
+export BB_ENV_EXTRAWHITE="PSEUDO_BUILD PSEUDO_DISABLED $BB_ENV_EXTRAWHITE"
+
 NO_BUILD_OPTS="--version -h --help -p --parse-only -s --show-versions -e --environment -g --graphviz"
 needpseudo="1"
 for opt in $@; do
diff --git a/scripts/poky-env-internal b/scripts/poky-env-internal
index 5549454..03b078f 100755
--- a/scripts/poky-env-internal
+++ b/scripts/poky-env-internal
@@ -55,6 +55,4 @@ unset BITBAKEDIR
 export BUILDDIR
 export PATH
 
-export BB_ENV_EXTRAWHITE="MACHINE DISTRO POKYMODE POKYLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS GIT_PROXY_COMMAND PSEUDO_DISABLED PSEUDO_BUILD"
-
-export BBFETCH2=True
+export BB_ENV_EXTRAWHITE="MACHINE DISTRO POKYMODE POKYLIBC http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS GIT_PROXY_COMMAND"
-- 
1.7.2.3



