Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1USJiV-0003lN-Qi
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 06:11:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3H3rvHV001366
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Apr 2013 20:53:57 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 16 Apr 2013 20:53:56 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 16 Apr 2013 20:53:44 -0700
Message-ID: <66cbcdd476a3737704b8d338c4f6bf39194100f8.1366143106.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366143106.git.bruce.ashfield@windriver.com>
References: <cover.1366143106.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-yocto/3.8: Makefile: add -grecord-gcc-switches if using -mfentry
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
X-List-Received-Date: Wed, 17 Apr 2013 04:11:32 -0000
Content-Type: text/plain

    Commit a2546fae [ftrace: Add -mfentry to Makefile on function tracer]
    adds support for using -mfentry when possible, whenever the ftrace
    CONFIG_FUNCTION_TRACER option is enabled.

    This unfortunately causes bogus dwarf debuginfo to be generated:

      gcc Bug 54793 - the location of a formal_parameter is not started from a
                      function entry with -mfentry

      http://gcc.gnu.org/bugzilla/show_bug.cgi?id=54793

    This can be fixed by applying the gcc patch above, which will be
    present in gcc-4.8, but in the meantime, the problem is currently
    being worked around in different ways by various tools.  One of those
    tools that we support in Yocto, Systemtap, requires the DW_AT_producer
    string contain -mfentry, which means that it's assuming
    record-gcc-switches is also used:

      SystemTap Bug 15123 - workaround for bad debuginfo for -mfentry
      http://sourceware.org/bugzilla/show_bug.cgi?id=15123

    The lack of -grecord-gcc-switches and therefore a missing -mfentry
    string in Yocto leads to the following Yocto bug:

      Bug 4099 - Crosstap script check fails
      https://bugzilla.yoctoproject.org/show_bug.cgi?id=4099

    Which is what this patch intends to fix.

    It only affects architectures that HAVE_FENTRY when
    CONFIG_FUNCTION_TRACER is turned on and in any case is just adding to
    the debuginfo, so there doesn't seem to be much risk to adding it.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb   |    4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.8.bb      |   12 ++++++------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
index 04642a4..980229c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
@@ -8,8 +8,8 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "0f7d294a9d07713059af345188f9cd4f549b4e77"
-SRCREV_machine_qemuppc ?= "82cdb00523b3f86219706d9f12dc80ff8d1c747a"
+SRCREV_machine ?= "fd5af245e21d80e8700d41c1ecf3fc4b2c3d2e40"
+SRCREV_machine_qemuppc ?= "fa8b702a32cc19e77805d91224d0409f09808c88"
 SRCREV_meta ?= "27b63fdbd25ad1a37bacc05f49a205c150d21779"
 
 PR = "${INC_PR}.1"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
index 1fe4139..6ef143e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
@@ -12,7 +12,7 @@ LINUX_VERSION ?= "3.8.4"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc"
+SRCREV_machine ?= "d9a45e3325030f7bd6f37947a7a0b12da7f602c3"
 SRCREV_meta ?= "27b63fdbd25ad1a37bacc05f49a205c150d21779"
 
 PR = "${INC_PR}.1"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
index 91cc52d..4bf6bf4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -3,12 +3,12 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "ec3299eaa89a7302009e3d46c9570f633ff32e9a"
-SRCREV_machine_qemumips  ?= "0d60789d710808e38690f27216c3ab13753e1055"
-SRCREV_machine_qemuppc ?= "223428bbc1a355200bd9a8046fd272c1b9b13e67"
-SRCREV_machine_qemux86 ?= "11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc"
-SRCREV_machine_qemux86-64 ?= "11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc"
-SRCREV_machine ?= "11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc"
+SRCREV_machine_qemuarm ?= "1473dd2b4505109d45bd7099f63826a66b71103d"
+SRCREV_machine_qemumips  ?= "1695c38d04855cc225bcc1968289770f0fa0ea64"
+SRCREV_machine_qemuppc ?= "8b39c0424704a40c740b1ac61449fdf190a8460a"
+SRCREV_machine_qemux86 ?= "d9a45e3325030f7bd6f37947a7a0b12da7f602c3"
+SRCREV_machine_qemux86-64 ?= "d9a45e3325030f7bd6f37947a7a0b12da7f602c3"
+SRCREV_machine ?= "d9a45e3325030f7bd6f37947a7a0b12da7f602c3"
 SRCREV_meta ?= "27b63fdbd25ad1a37bacc05f49a205c150d21779"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
1.7.10.4



