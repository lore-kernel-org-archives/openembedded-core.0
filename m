Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UGD0X-0004qx-LL
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 19:36:12 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 05939D22E8; Thu, 14 Mar 2013 19:19:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id A4734D22CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2013 19:18:55 +0100 (CET)
Message-ID: <5142148A.7010009@linaro.org>
Date: Thu, 14 Mar 2013 19:18:50 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1363282893-19390-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<51421128.6090201@windriver.com>
In-Reply-To: <51421128.6090201@windriver.com>
X-Enigmail-Version: 1.4.6
Subject: Re: [PATCH] Add architecture files for AArch64 architecture.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Mar 2013 18:36:18 -0000
X-List-Received-Date: Thu, 14 Mar 2013 18:36:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 14.03.2013 19:04, Mark Hatle pisze:
> I'm not completely familiar with aarch64.  So a couple of questions. 
> The first is is it supposed to allow a multilib configuration?  I.e.
> being able to run both 32-bit "arm/thumb" code & aarch64 code on the
> same machine?  If so, a "BASE_LIB_tune-aarch64" should be defined with
> the right value.

AArch64 is able to run ARMv7a code but it not something we worry too 
much now as there is no hardware yet so we mostly use OE for porting
software. There will be no multilib related work done by Linaro in near
time (if at all).

> Second are there expected to be tuned variants for the aarch64, i.e.
> processor/core tunings that need to get embedded into the package arch. 
> if so the definition of the TUNE_ARCH and TUNE_PKGARCH should probably
> be based on the tune_feature...  (This may simply not be necessary
> though as this is a new architecture that will expand and grow...)

Probably big endian version will arrive sooner or later. Other than that
no extra tuning will be needed (no hardware yet).
 
> My suggestion then, to help with future growth is:
> 
> DEFAULTTUNE ?= "aarch64"
> 
> ARMPKGARCH ?= "aarch64"
> 
> TUNEVALID[aarch64] = "Enable instructions for aarch64"
> TUNECONFLICTS[aarch64] = ""
> MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "aarch64",
> ":aarch64", "" ,d)}"
> 
> # Little Endian base configs
> AVAILTUNES += "aarch64"
> TUNE_FEATURES_tune-aarch64 ?= "aarch64"
> BASE_LIB_tune-aarch64 = "lib64" <-- guess on my part

No, we do not use /lib64/ for AArch64.

> TUNE_ARCH_tune-aarch64 = "aarch64"
> TUNE_PKGARCH_tune-aarch64 = "aarch64"
> PACKAGE_EXTRA_ARCHS_tune-aarch64 += "aarch64"

Thanks, changed and attached new version.

From b303dd32eecd2fca3708eef468910f19bb903b3f Mon Sep 17 00:00:00 2001
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Date: Thu, 14 Mar 2013 18:41:08 +0100
Subject: [PATCH] Add architecture files for AArch64 architecture.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/conf/machine/include/aarch64/README           |  9 +++++++++
 meta/conf/machine/include/aarch64/arch-aarch64.inc | 14 ++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta/conf/machine/include/aarch64/README
 create mode 100644 meta/conf/machine/include/aarch64/arch-aarch64.inc

diff --git a/meta/conf/machine/include/aarch64/README b/meta/conf/machine/include/aarch64/README
new file mode 100644
index 0000000..59c8710
--- /dev/null
+++ b/meta/conf/machine/include/aarch64/README
@@ -0,0 +1,9 @@
+2013-03-14 - Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+ - Initial Revision
+
+Currently only little endian is defined for AArch64.
+
+AArch64 is 64-bit ARM architecture.
+
+Also known as ARMv8 (instruction set) or ARM64 (name in Linux kernel and
+architecture name in Debian and derived).
diff --git a/meta/conf/machine/include/aarch64/arch-aarch64.inc b/meta/conf/machine/include/aarch64/arch-aarch64.inc
new file mode 100644
index 0000000..121d339
--- /dev/null
+++ b/meta/conf/machine/include/aarch64/arch-aarch64.inc
@@ -0,0 +1,14 @@
+DEFAULTTUNE ?= "aarch64"
+
+ARMPKGARCH ?= "aarch64"
+
+TUNEVALID[aarch64] = "Enable instructions for aarch64"
+TUNECONFLICTS[aarch64] = ""
+MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "aarch64", ":aarch64", "" ,d)}"
+
+# Little Endian base configs
+AVAILTUNES += "aarch64"
+TUNE_FEATURES_tune-aarch64 ?= "aarch64"
+TUNE_ARCH_tune-aarch64 = "aarch64"
+TUNE_PKGARCH_tune-aarch64 = "aarch64"
+PACKAGE_EXTRA_ARCHS_tune-aarch64 += "aarch64"
-- 
1.8.1.2




