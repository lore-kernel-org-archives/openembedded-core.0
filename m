Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA58A605D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 06:59:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5P6x9Ml001193
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Jun 2015 23:59:10 -0700 (PDT)
Received: from [128.224.162.138] (128.224.162.138) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 24 Jun 2015 23:59:09 -0700
Message-ID: <558BA6BB.10301@windriver.com>
Date: Thu, 25 Jun 2015 14:59:07 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1433294684-10258-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LZxzFL=DHq9NxVvcs=VNmPnCe=Z2V6ksAaBmLQ0+FAHxQ@mail.gmail.com>
	<558A0AF1.8060204@windriver.com>
	<CAJTo0LZx+nUqwQKwGcO7G7xHHQkYF0Gp8p2bsGageFKLcM74Lw@mail.gmail.com>
In-Reply-To: <CAJTo0LZx+nUqwQKwGcO7G7xHHQkYF0Gp8p2bsGageFKLcM74Lw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][v4] mmc-utils: fix the building failure when DEBUG_BUILD is 1
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
X-List-Received-Date: Thu, 25 Jun 2015 06:59:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年06月24日 22:16, Burton, Ross wrote:
>
> On 24 June 2015 at 02:42, Rongqing Li <rongqing.li@windriver.com
> <mailto:rongqing.li@windriver.com>> wrote:
>
>     #warning _FORTIFY_SOURCE requires compiling with optimization (-O)
>     [-Werror=cpp]
>     |  #  warning _FORTIFY_SOURCE requires compiling with optimization (-O)
>
>
> So security_flags and debug build are mutually exclusive, and no amount
> of fixing recipes one by one will fix that.  This is a compiler warning
> (presumably the result being that fortify isn't enabled in debug builds)
> that the mmc-utils build is treating as an error, so a more reasonable
> fix would be to remove -Werror from the build which is a reasonable
> thing to do - only the developer of software should use -Werror as it
> causes untold amounts of pain on everyone else if something changes
> (say, gcc adds a new warning).
>
> Ross

How about the below patch

 From 6de0180f5332880195e315fdaf4899406dc54d99 Mon Sep 17 00:00:00 2001
From: Roy Li <rongqing.li@windriver.com>
Date: Thu, 25 Jun 2015 14:44:05 +0800
Subject: [PATCH] mmc-utils: fix the building failure when DEBUG_BUILD is 1

AM_CFLAGS in Makefile includes -D_FORTIFY_SOURCE=2 which will lead
to building failure when DEBUG_BUILD is 1.
Cancel the definition of _FORTIFY_SOURCE by passing -U_FORTIFY_SOURCE
via TARGET_CPPFLAGS; this does not effect the security cflags usage,
since the cflags is equal to:
CFLAGS="${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION} ${SECURITY_CFLAGS}"

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
  meta/recipes-devtools/mmc/mmc-utils_git.bb | 1 +
  1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb 
b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index bdb4fed..976bdf8 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -12,6 +12,7 @@ SRC_URI = 
"git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branc
             file://0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch"

  S = "${WORKDIR}/git"
+TARGET_CPPFLAGS += "-U_FORTIFY_SOURCE"

  do_install() {
      install -d ${D}${bindir}
-- 
1.9.1


