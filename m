Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QLz4n-0005sx-GV for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 16:47:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4GEiLSf020410;
	Mon, 16 May 2011 15:44:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20015-08; Mon, 16 May 2011 15:44:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4GEiCX5020404
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 16 May 2011 15:44:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <212bfaaefe0979c155069b6d3a0d42205a398a67.1305422996.git.sgw@linux.intel.com>
References: <cover.1305422996.git.sgw@linux.intel.com>
	<212bfaaefe0979c155069b6d3a0d42205a398a67.1305422996.git.sgw@linux.intel.com>
Date: Mon, 16 May 2011 15:44:11 +0100
Message-ID: <1305557051.3424.88.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 11/15] gcc-common.inc: Consider hardfp knob for configuring toolchain
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
X-List-Received-Date: Mon, 16 May 2011 14:47:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Khem,

I've a concern about ending up with several different variables all
doing the same thing. Why do we need both TARGET_FPU and ARM_FP_ABI?
Couldn't we just have values or "hard, sort or empty" for TARGET_FPU?

Cheers,

Richard

On Sat, 2011-05-14 at 18:32 -0700, Saul Wold wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> pass --with-float=hard|soft depending upon ARM_FP_ABI settings
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-common.inc |   13 ++++++++++---
>  1 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
> index a3fa234..8b7c3ad 100644
> --- a/meta/recipes-devtools/gcc/gcc-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> @@ -8,10 +8,17 @@ NATIVEDEPS = ""
>  inherit autotools gettext
>  
>  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/gcc-${PV}"
> -
>  def get_gcc_fpu_setting(bb, d):
> -    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
> -        return "--with-float=soft"
> +    if bb.data.getVar('TARGET_FPU', d, True) in [ 'soft', 'hard'] and bb.data.getVar('TARGET_OS', d, True).find('linux') >= 0 :
> +        # ARM_FP_ABI could be either 'hardfp' or 'softfp'
> +        arm_fpabi = bb.data.getVar('ARM_FP_ABI', d, True) or ""
> +        if arm_fpabi != "":
> +            if arm_fpabi  == "hardfp":
> +                # reset it to whatever gcc --with-float configure expects which is either 'softfp' or 'hard'
> +                arm_fpabi = "hard"
> +            return "--with-float=" + arm_fpabi
> +        else:
> +            return "--with-float=" + bb.data.getVar('TARGET_FPU', d, True)
>      return ""
>  
>  def get_gcc_mips_plt_setting(bb, d):




