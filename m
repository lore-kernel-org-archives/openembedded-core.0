Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 546E07085C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 17:25:23 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6SHPM6q008071; Mon, 28 Jul 2014 12:25:22 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072812252210-324194 ;
	Mon, 28 Jul 2014 12:25:22 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <1404424826-12023-2-git-send-email-rich.tollerton@ni.com>
References: <1404424826-12023-1-git-send-email-rich.tollerton@ni.com>
	<1404424826-12023-2-git-send-email-rich.tollerton@ni.com>
User-Agent: Notmuch/0.18.1 (http://notmuchmail.org) Emacs/24.3.1
	(x86_64-unknown-linux-gnu)
Date: Mon, 28 Jul 2014 12:25:22 -0500
Message-ID: <87ppgppf99.fsf@weregild.amer.corp.natinst.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/28/2014 12:25:22 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/28/2014 12:25:22 PM,
	Serialize complete at 07/28/2014 12:25:22 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-28_03:2014-07-28, 2014-07-28,
	1970-01-01 signatures=0
Cc: ken.sharp@ni.com
Subject: Re: [PATCH 1/2] gcc-cross-canadian: Adjust $prefix to fix sysroot autodetect
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
X-List-Received-Date: Mon, 28 Jul 2014 17:25:27 -0000
Content-Type: text/plain

Bump?

Richard Tollerton <rich.tollerton@ni.com> writes:

> Currently, using gcc-cross-canadian often requires --sysroot to be
> specified at compile time, because the default sysroot is hardcoded to
> e.g. /opt/poky/1.6.1/sysroots/core2-64-poky-linux. If you didn't install
> the toolchain in precisely that location, the default sysroot won't work.
>
> But that isn't actually necessary -- gcc is actually capable of
> discovering the sysroot location itself. If the default
> sysroot (--with-sysroot=) is underneath the prefix (--prefix=), then gcc
> rewrites the sysroot at runtime based on the actual location of gcc in
> the filesystem. (cf gcc/gcc.c:process_command() in the
> defined(TARGET_SYSTEM_ROOT_RELOCATABLE), and
> libiberty/make-relative-prefix.c, in the gcc sources.)
>
> We can effect this by moving prefix up a few directories.
> Currently it's effectively set to ${SDKPATH}/sysroots/${SDK_SYS}/usr,
> via nativesdk.bbclass. So instead, set it to ${SDKPATH}/sysroots.
> This breaks nothing, because autotools.bbclass already sets
> exec_prefix, bindir, etc. so that this change should not actually affect
> where files get installed.
>
> Natinst-ReviewBoard-ID: 52189
> Acked-by: Gratian Crisan <gratian.crisan@ni.com>
> Acked-by: David Curtiss <david.curtiss@ni.com>
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> ---
>  meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> index 63adae8..1a826ec 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -37,6 +37,9 @@ export RANLIB_FOR_TARGET = "${TARGET_PREFIX}ranlib"
>  export STRIP_FOR_TARGET = "${TARGET_PREFIX}strip"
>  export WINDRES_FOR_TARGET = "${TARGET_PREFIX}windres"
>  
> +# Ensure that the target sysroot is under the prefix
> +prefix = "${SDKPATH}/sysroots"
> +
>  #
>  # We need to override this and make sure the compiler can find staging
>  #
> -- 
> 2.0.1
>

-- 
Richard Tollerton <rich.tollerton@ni.com>

