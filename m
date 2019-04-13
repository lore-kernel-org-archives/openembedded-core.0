Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8C24A7D3B1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 06:17:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44h4LS38DhzPV;
	Sat, 13 Apr 2019 08:17:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1555136256;
	bh=agL1OPtNA+ac0xyKllUSP1CCTquKRXngHbCK32zFUEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R3jMRv8hjNz/bi/hmh9n21St+RfleO0rHx2bYnBBHEXNeqV+3C46AzAHCrrYVMfLQ
	mg6eBki+bTR+aJd74DY80TPqM83ymAtYBk3b0wMVt/3y2eelgc+GOYgPtgT2h/enLD
	7xgZ98xi0V7aczuE/SZaR3z8gjovtT135WNYKGoGYWc8zu7wpucyEI2EOo48TT/rIq
	WxRlmKjI4VDO6EWoyxtYfGb5WJQzgnr0xzadOQ7XlrcFlTxfmlK9Oq1PhzihEbo2/B
	Io7QBNlg4GdzOou0P0C2ViwUKsGDlNKhzzrmTOnQgpRSVsehwu16WUokKrznOhJCAU
	WsG1arugEL9bCiMp9NfGEERIoixrVw/cGa3dNFPkJoSeSSrKU0mkMOFodlue+FXz+x
	rbugHzoKXLZmtiKdR0vn1zj7sxFDmwo0KSFVO6WU7pGI73NCdbYAJrghsnf+k0MEWF
	hXnD8+RgiihjfW48mQWeI4oQ7bQAQIVrpcc9oKIQy71EP/ebBR0bK+zs1jCB09WklC
	1rA2u44XbdTsfz1r8gRzulmAERaHVPEA901klM9BKXiPawPdoaBCEdevENMPJKkBIp
	+JL3GvQWNWBwa3x+cHLIoimw4Xt+ZbSJrdKp7T5vR2BaxS6lpIE8DCNzTXW0rKJlVh
	rXNvIVDDS25w2tnkpJdXznVo=
Date: Sat, 13 Apr 2019 09:17:34 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20190413061734.GA10988@localhost>
References: <20190412210912.21432-1-bunk@stusta.de>
	<CAJ86T=V5RzrFCdyQ2fyJHHkH352vMF+DQ6dXHsxwSC9kRLMBZg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=V5RzrFCdyQ2fyJHHkH352vMF+DQ6dXHsxwSC9kRLMBZg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Set XZ_COMPRESSION_LEVEL to -9
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
X-List-Received-Date: Sat, 13 Apr 2019 06:17:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Apr 12, 2019 at 02:44:05PM -0700, Andre McCurdy wrote:
> On Fri, Apr 12, 2019 at 2:09 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > It is consistent with other compressors also using their
> > best compression.
> >
> > xz is currently the option that offers best compression,
> > using settings even lower than the default is surprising
> > and makes it harder to choose the best available compression.
> >
> > For anyone who cares about compression time using a different
> > option like gzip or bzip2 is the logical choice.
> 
> The concern with xz's highest compression level is memory usage rather
> than CPU time. Quoting from the manpage:
> 
>   Preset   DictSize   CompCPU    CompMem   DecMem
>     -0     256 KiB     0      3 MiB    1 MiB
>     -1       1 MiB     1      9 MiB    2 MiB
>     -2       2 MiB     2     17 MiB    3 MiB
>     -3       4 MiB     3     32 MiB    5 MiB
>     -4       4 MiB     4     48 MiB    5 MiB
>     -5       8 MiB     5     94 MiB    9 MiB
>     -6       8 MiB     6     94 MiB    9 MiB
>     -7      16 MiB     6    186 MiB   17 MiB
>     -8      32 MiB     6    370 MiB   33 MiB
>     -9      64 MiB     6    674 MiB   65 MiB
> 
> Given that these are per-thread the memory requirements may start to
> get a little unreasonable with xz -9. We do limit usage to 50% of
> physical memory via XZ_DEFAULTS though so maybe it's not a big
> concern?

Due to the limit, and also due to the fact that build machines with
very low RAM/core are likely to have bigger problems earlier:

The compile task of a recipe spawns the same number of gcc processes,
and there can be several compile tasks running.

gcc memory usage when compiling C++ code like webkit can be worse than 
these per-thread numbers.

> Either way, perhaps now would be a good time to remove
> XZ_COMPRESSION_LEVEL from image_types.bbclass and instead just include
> the compression level option in XZ_DEFAULTS so that it gets used
> consistently everywhere.

OPKGBUILDCMD uses XZ_DEFAULTS, and the decompression memory requirement 
on the target for -9 might be a problem if someone uses package feeds
on low-memory targets.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


