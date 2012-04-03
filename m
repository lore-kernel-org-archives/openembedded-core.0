Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SF9q4-0001ly-19
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 21:56:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q33JlDG3019274
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Apr 2012 12:47:13 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.110) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Tue, 3 Apr 2012 12:47:13 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Apr 2012 14:47:01 -0500
Message-ID: <558f20b409b75d18d426a471c3aa5bd296df9aa7.1333481624.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1333481624.git.mark.hatle@windriver.com>
References: <cover.1333481624.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.110]
Subject: [PATCH 1/7] conf/machine/include/README: Add readme to explain cpu tunings
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
X-List-Received-Date: Tue, 03 Apr 2012 19:56:24 -0000
Content-Type: text/plain

Add a new README that covers the basic items used with various cpu
tunings.  The goal is to better help people understand the various
settings and where things should or should not be defined.

Corresponding architecture README files will also be generated to
explain the particulars of architectural tunings.

Also remove the default TUNE_PKGARCH setting in bitbake.conf.  This
was done to ensure an error occurs if an invalid tuning is defined.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/bitbake.conf           |    1 -
 meta/conf/machine/include/README |   77 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+), 1 deletions(-)
 create mode 100644 meta/conf/machine/include/README

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 824ef04..b4669d3 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -96,7 +96,6 @@ TUNE_CCARGS ??= ""
 TUNE_LDARGS ??= ""
 TUNE_ASARGS ??= ""
 TUNE_FEATURES ??= "${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
-TUNE_PKGARCH ??= "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
 LIBCEXTENSION ??= ""
 ABIEXTENSION ??= ""
 
diff --git a/meta/conf/machine/include/README b/meta/conf/machine/include/README
new file mode 100644
index 0000000..6a3a63d
--- /dev/null
+++ b/meta/conf/machine/include/README
@@ -0,0 +1,77 @@
+2012/03/30 - Mark Hatle <mark.hatle@windriver.com>
+ - Initial Revision
+
+The individual CPU, and ABI tunings are contained in this directory.  A 
+number of local and global variables are used to control the way the 
+tunings are setup and how they work together to specify an optimized 
+configuration.
+
+The following is brief summary of the generic components that are used 
+in these tunings.
+
+AVAILTUNES - This is a list of all of the tuning definitions currently 
+available in the system.  Not all tunes in this list may be compatible 
+with the machine configuration, or each other in a multilib 
+configuration.  Each tuning file can add to this list using "+=", but 
+should never replace the list using "=".
+
+DEFAULTTUNE - This specifies the tune to use for a particular build.  
+Each tune should specify a reasonable default, which can be overriden by 
+a machine or multilib configuration.  The specified tune must be listed 
+in the AVAILTUNES.
+
+TUNEVALID[feature] - The <feature> is defined with a human readable 
+explanation for what it does.  All architectural, cpu, abi, etc tuning 
+features must be defined using TUNEVALID.
+
+TUNE_FEATURES - This is automatically defined as TUNE_FEATURES_tune-<tune>.
+See TUNE_FEATURES_tune-<tune> for more information.
+
+TUNE_FEATURES_tune-<tune> - Specify the features used to describe a 
+specific tune.  This is a list of features that a tune support, each 
+feature must be in the TUNEVALID list.  Note: the tune and a given 
+feature name may be the same, but they have different purposes.  Only 
+features may be used to change behavior, while tunes are used to 
+describe an overall set of features.
+
+ABIEXTENSION - An ABI extension may be specified by a specific feature 
+or other tuning setting, such as TARGET_FPU.  Any ABI extensions either 
+need to be defined in the architectures base arch file, i.e.  
+ABIEXTENSION = "eabi" in the arm case, or appended to in specific tune 
+files with a ".=".  Spaces are not allowed in this variable.
+
+TUNE_CCARGS - Setup the cflags based on the TUNE_FEATURES settings.  
+These should be additive when defined using "+=".  All items in this 
+list should be dynamic! i.e. 
+${@bb.utils.contains("TUNE_FEATURES", "feature", "cflag", "!cflag", d)}
+
+TUNE_ARCH - The GNU canonical arch for a specific architecture.  i.e. 
+arm, armeb, mips, mips64, etc.  This value is by bitbake to setup 
+configure. TUNE_ARCH definitions are specific to a given architecture.  
+They may be a single static definitions, or may be dynamically adjusted.  
+See each architectures README for details for that CPU family.
+
+TUNE_PKGARCH - The package architecture used by the packaging systems to 
+define the architecture, abi and tuning of a particular package.  
+Similarly to TUNE_ARCH, the definition of TUNE_PKGARCH is specific to 
+each architecture. See each architectures README for details for that 
+CPU family.
+
+PACKAGE_EXTRA_ARCHS - Lists all runtime compatible package 
+architectures.  By default this is equal to 
+PACKAGE_EXTRA_ARCHS_tune-<tune>.  If an architecture deviates from the 
+default it will be listed in the architecture README.
+
+PACKAGE_EXTRA_ARCHS_tune-<tune> - List all of the package architectures 
+that are compatible with this specific tune.  The package arch of this 
+tune must be in the list.
+
+TARGET_FPU - The FPU setting for a given tune, hard (generate floating 
+point instructions), soft (generate internal gcc calls), "other" 
+architecture specific floating point.  This is synchronized with the 
+compiler and other toolchain items.  This should be dynamically 
+configured in the same way that TUNE_CCARGS is.
+
+BASE_LIB_tune-<tune> - The "/lib" location for a specific ABI.  This is 
+used in a multilib configuration to place the libraries in the correct, 
+non-conflicting locations.
-- 
1.7.1



