Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>)
	id 1RXADp-0001RS-Eg; Sun, 04 Dec 2011 12:27:05 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 2AF4D1100182;
	Sun,  4 Dec 2011 12:20:22 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 00B4B110017F;
	Sun,  4 Dec 2011 12:20:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g225006150.adsl.alicedsl.de
	[92.225.6.150]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Sun,  4 Dec 2011 12:20:20 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id BF9CD3C49D; Sun,  4 Dec 2011 12:20:19 +0100 (CET)
Date: Sun, 4 Dec 2011 12:20:19 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111204112019.GB4871@rhein.zuhause.netz>
References: <4ED0CC76.4040606@emagii.com> <1322579029.7964.0.camel@ted>
	<4ED54C2B.2060505@emagii.com> <4ED66835.3050400@intel.com>
	<4ED793E2.5070205@emagii.com> <4EDA80A2.5070303@emagii.com>
MIME-Version: 1.0
In-Reply-To: <4EDA80A2.5070303@emagii.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
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
X-List-Received-Date: Sun, 04 Dec 2011 11:27:05 -0000
X-Groupsio-MsgNum: 13603
Content-Type: multipart/mixed; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline

--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 03, 2011 at 09:03:46PM +0100, Ulf Samuelsson wrote:
> Have made some further tests with the same machine, but now running
> Ubuntu 11.04 x64
> 
> bitbake console-image
> 
>     PARALLEL_TASKS        BB_NUMBER_TASKS        BUILD TIME
>     2                                  2
> 1:24:16
>     4                                  4
> 0:48:22
>     6                                  6
> 0:45:00
>     24                                24
> C++ compiler fails with --sysroot problem
>         after ~2200 out of 2400 tasks.
> 
> 
> 
> BR
> Ulf

Hi Ulf,

can you try the attached patch if it solves the problem?

Bye Henning

--jRHKVT23PllUwdXP
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-gcc-cross-attempt-fix-default-include-path-of-c.patch"

From b96f4d6b73ff993910b635b9dca962fac8eeeb49 Mon Sep 17 00:00:00 2001
From: Henning Heinold <heinold@inf.fu-berlin.de>
Date: Sun, 4 Dec 2011 12:17:15 +0100
Subject: [PATCH] gcc-cross: attempt fix default include path of c++

---
 meta/recipes-devtools/gcc/gcc-configure-cross.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-configure-cross.inc b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
index d2d9081..f42a6ee 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
@@ -9,7 +9,7 @@ EXTRA_OECONF += " --enable-poison-system-directories \
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-EXTRA_OECONF_PATHS = "--with-local-prefix=${STAGING_DIR_TARGET}${target_exec_prefix} \
+EXTRA_OECONF_PATHS = "--with-local-prefix=${STAGING_DIR_TARGET} \
 		      --with-gxx-include-dir=${target_includedir}/c++ \
                       --with-sysroot=${STAGING_DIR_TARGET} \
                       --with-build-sysroot=${STAGING_DIR_TARGET}"
-- 
1.7.7.3


--jRHKVT23PllUwdXP--
