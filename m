Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 678B46FEF5
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 17:45:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5GHjABS007739
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 16 Jun 2016 10:45:13 -0700
Received: from yow-masselst-d1.wrs.com (128.224.56.91) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 16 Jun 2016 10:45:09 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <jussi.kukkonen@intel.com>
Date: Thu, 16 Jun 2016 13:45:08 -0400
Message-ID: <1466099108-25355-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <e12014df714d835b217acfbfbcfc1b5d1b4408db.1465891164.git.jussi.kukkonen@intel.com>
References: <e12014df714d835b217acfbfbcfc1b5d1b4408db.1465891164.git.jussi.kukkonen@intel.com>
MIME-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3 10/30] vte: Upgrade to 0.44.1
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
X-List-Received-Date: Thu, 16 Jun 2016 17:45:15 -0000
Content-Type: text/plain

On 14 June 2016 at 11:14, Jussi Kukkonen <jussi.kukkonen@intel.com
> <mailto:jussi.kukkonen@intel.com>> wrote:
> 
>     * License change LGPL 2.0 -> LGPL 2.1+
>     * vte-termcap is no more
>     * API break: current version seems to be parallel installable
>        with old one, but I did not opt for that.
>     * Add patch to avoid stack protection by default
>     * Add SECURITY_NO_PIE_CFLAGS exception until linking failure with
>        libc_nonshared.a is resolved (undefined reference to
>        __init_array_start)
> 
> 
> Just found out Khem has worked around a similar problem with
> libtool-cross already: I've modified this patch so
> that SECURITY_NO_PIE_CFLAGS is no longer used, but instead libtool-cross
> is used:
> 
> +# libtool adds "-nostdlib" when g++ is used. This breaks PIE builds.
> +# Use libtool-cross (which has a hack to prevent that) instead.
> +EXTRA_OEMAKE_class-target =
> "LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
> 
>   - Jussi

Just a heads up this this breaks xfce4-terminal. There is currently no
xfce4-terminal release which will function with vte api 2.91, only
ongoing work on their master branch as far as I can tell. I have no
idea how far reaching the effects of this change will be on
xfce. Before I spend any time on this is this something which folks
are aware of and is there a plan in place? Is there a possibility to
keep the older vte around?

Thanks,
Mark


> 
> 
>     Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com
>     <mailto:jussi.kukkonen@intel.com>>
>     ---
>       meta/conf/distro/include/security_flags.inc        |   2 +
>       .../vte/vte-0.28.2/cve-2012-2738.patch             | 136
>     ---------------------
>       .../vte/vte-0.28.2/obsolete_automake_macros.patch  |  14 ---
>       meta/recipes-support/vte/vte.inc                   |  15 ---
>       ...-Don-t-enable-stack-protection-by-default.patch |  29 +++++
>       meta/recipes-support/vte/vte_0.28.2.bb <http://vte_0.28.2.bb>
> 
>       |  16 ---
> 
>       meta/recipes-support/vte/vte_0.44.1.bb <http://vte_0.44.1.bb>
> 
>       |  24 ++++
> 
>       7 files changed, 55 insertions(+), 181 deletions(-)
>       delete mode 100644
>     meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch
>       delete mode 100644
>     meta/recipes-support/vte/vte-0.28.2/obsolete_automake_macros.patch
>       delete mode 100644 meta/recipes-support/vte/vte.inc
>       create mode 100644
>    
> meta/recipes-support/vte/vte/0001-Don-t-enable-stack-protection-by-default.
> patch delete mode 100644 meta/recipes-support/vte/vte_0.28.2.bb
>     <http://vte_0.28.2.bb>
>       create mode 100644 meta/recipes-support/vte/vte_0.44.1.bb
>     <http://vte_0.44.1.bb>
> 
>     diff --git a/meta/conf/distro/include/security_flags.inc
>     b/meta/conf/distro/include/security_flags.inc
>     index ea1d4e5..0df65e0 100644
>     --- a/meta/conf/distro/include/security_flags.inc
>     +++ b/meta/conf/distro/include/security_flags.inc
>     @@ -95,6 +95,8 @@ SECURITY_CFLAGS_pn-zlib = "${SECURITY_NO_PIE_CFLAGS}"
>       SECURITY_CFLAGS_pn-ltp = "${SECURITY_NO_PIE_CFLAGS}"
>       SECURITY_CFLAGS_pn-pulseaudio = "${SECURITY_NO_PIE_CFLAGS}"
> 
>     +SECURITY_CFLAGS_pn-vte = "${SECURITY_NO_PIE_CFLAGS}"
>     +
>       # Recipes which fail to compile when elevating -Wformat-security
>     to an error
>       SECURITY_STRINGFORMAT_pn-busybox = ""
>       SECURITY_STRINGFORMAT_pn-console-tools = ""
>     diff --git a/meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch
>     b/meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch
>     deleted file mode 100644
>     index 9b99803..0000000
>     --- a/meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch
>     +++ /dev/null
>     @@ -1,136 +0,0 @@
>     -Upstream-Status: Backport
>     -CVE: CVE-2012-2738
>     -Signed-off-by: Ross Burton <ross.burton@intel.com
>     <mailto:ross.burton@intel.com>>
>     -
>     -From e524b0b3bd8fad844ffa73927c199545b892cdbd Mon Sep 17 00:00:00 2001
>     -From: Christian Persch <chpe@gnome.org 

