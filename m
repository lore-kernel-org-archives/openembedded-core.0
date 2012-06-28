Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dennis.yxun@gmail.com>) id 1SkBKn-0001YA-OL
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 11:48:22 +0200
Received: by pbbrq2 with SMTP id rq2so2706769pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 02:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=tMGFGS41d+u6cxgd11g/zbtHKT19AhpkRLqtFDBGDbY=;
	b=q7wggonyLZi6VB2SMDRHtVyplNe2xBac5fZEmwmhnt95RMIH9dxZYHMTa7VymigO5g
	RXaoyTjjq8APaMk3OohDzp7J6XtkT7lxl4spjCKqztj8o6Gd1KLJQW2YGuhM6AiqPhNP
	Y4WDWzEE1m6n3hVMFTpjEFVrskne1n32lb4oSQX+QG3U0R2DpdstbNr/k1rYR12eGzG1
	KLid1NJRRpgZ+XgMChGZN28vcJeBpt4anNK7uyqNPjvf6FzN35maVxGWQjTnhhySjV5i
	zwPuHBrTvezF9tCrG4d478jf+PG4xMXv+XEUISMNmszTfC7l+pYB4peKXW2oYpr88NDi
	O22g==
MIME-Version: 1.0
Received: by 10.68.218.101 with SMTP id pf5mr5082948pbc.152.1340876246361;
	Thu, 28 Jun 2012 02:37:26 -0700 (PDT)
Received: by 10.68.230.69 with HTTP; Thu, 28 Jun 2012 02:37:26 -0700 (PDT)
In-Reply-To: <e7eb300513b285a6e90a46989ed283e1cf28bfc0.1340845612.git.raj.khem@gmail.com>
References: <cover.1340845612.git.raj.khem@gmail.com>
	<ac748647d97bee19bca3a4f312c82619b148c96e.1340845612.git.raj.khem@gmail.com>
	<e7eb300513b285a6e90a46989ed283e1cf28bfc0.1340845612.git.raj.khem@gmail.com>
Date: Thu, 28 Jun 2012 17:37:26 +0800
Message-ID: <CAF1ZMEccy-nQowP8odxJGRGHBvXCuDDfGYCNDzkWdGoeHFcjog@mail.gmail.com>
From: "Dennis.Yxun" <dennis.yxun@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] eglibc: support mipsel little endian, filter out -march=mips32
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
X-List-Received-Date: Thu, 28 Jun 2012 09:48:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

HI Raj:
   So this will eventually goes into OE-core, right?
   As I see Bruce has no response for the "override scheme"
so mips -> for big endian mips o32 (could be mipseb better?, less confusion=
)
and mipsel -> for little endian mips o32, they in same level, not of
one's subset

Dennis

On Thu, Jun 28, 2012 at 9:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
> From: Dennis Lan <dennis.yxun@gmail.com>
>
> Quote for eglibc source:
> =C2=A0for mips eglibc now builds syscall tables for all abi's
> =C2=A0so we make sure that we choose right march option which is
> =C2=A0compatible with o32,n32 and n64 abi's
> =C2=A0e.g. -march=3Dmips32 is not compatible with n32 and n64 therefore
> =C2=A0we filter it out in such case -march=3Dfrom-abi which will be
> =C2=A0mips1 when using o32 and mips3 when using n32/n64
>
> Signed-off-by: Dennis Lan <dennis.yxun@gmail.com>
> ---
> =C2=A0meta/recipes-core/eglibc/eglibc_2.15.bb | =C2=A0 =C2=A01 +
> =C2=A01 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/=
eglibc/eglibc_2.15.bb
> index e57a112..b2922b4 100644
> --- a/meta/recipes-core/eglibc/eglibc_2.15.bb
> +++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
> @@ -101,6 +101,7 @@ do_patch_append() {
> =C2=A0# mips1 when using o32 and mips3 when using n32/n64
>
> =C2=A0TUNE_CCARGS_mips :=3D "${@oe_filter_out('-march=3Dmips32', '${TUNE_=
CCARGS}', d)}"
> +TUNE_CCARGS_mipsel :=3D "${@oe_filter_out('-march=3Dmips32', '${TUNE_CCA=
RGS}', d)}"
>
> =C2=A0# We need to ensure that all of the i386 and x86_64 headers are ide=
ntical
> =C2=A0# to support the multilib case. =C2=A0We do this by copying headers=
 from x86_64
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


