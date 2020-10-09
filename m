Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.7650.1602225367745238726
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 23:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=CqNxP4ne;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=969; q=dns/txt; s=axis-central1;
  t=1602225368; x=1633761368;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=QXO4EajxMzKGOkU8NFjW/bp41hyoZrrD68P9z0fcpg0=;
  b=CqNxP4neDri6IiwTEpydJhenAfURkErX8D2fAYgXU44Yzxsp0eDaX37e
   yc6LoLOq5zZiIS0gXvYiefBxruYs4ie9/Bj7om5Tqwu0IV/CoTdNsdW5Q
   d09QEinZCZ/jDimFxtugJ/Fv+4UjPf1h86RnDGSaESS3xLKR7M6wV7FeP
   yBb2CbGIUoZPffoR/elVlIwkioW9vusHVpiXej3KmZcIdOqZWufq5eaCM
   I3JJkkxHSsl3y80MgsV8nsTw8VHGged6FZjjNVuYmMF/PHEwF3v9xGV4U
   5Gc+WQsPQkJVCG2OGDBcoGxLb1Fdao+dEFs/Dg+C6mf0FtcbI+f8mIqeg
   A==;
IronPort-SDR: REfW/TVJLZ2d7pBUaHAj9IJgev/FRij0/6JDG0kLA6E1l+vMPH0DuPzEJAOjYee0WG3ArS9FBm
 tFPfptZG5/qoT/DHBzoy2+YMdaiwNPZwnup4g2OJiAxFRHrpBBIZxUf9jXSWW7wQ61pkCpSRtT
 725fWcZg7p1g5RPz2NGWzUPdXj1kTr6onRMvcBxWy3WuHPhL9ilAlMtMruPkBuLOuYodgsq0ce
 +L/q459VbPlIsGol/5Q6qNcpyyKESHNkbuZwv6jrLTDdyJB5TYKP19tI2GYl8T4pjwR4G8x7ZE
 WbA=
X-IronPort-AV: E=Sophos;i="5.77,354,1596492000"; 
   d="scan'208";a="13815859"
References: <CAFimOt5fQ=0JKpteCCAbDg14u-itABV7MEULuQEm3dUTFj89Lg@mail.gmail.com>
User-agent: mu4e 1.4.8; emacs 28.0.50
From: "Ola x Nilsson" <ola.x.nilsson@axis.com>
To: "douglas.royds@taitradio.com" <douglas.royds@taitradio.com>
CC: Douglas via lists.openembedded.org
	<douglas.royds=taitradio.com@lists.openembedded.org>,
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] externalsrc: No single-task lock if S != B
In-Reply-To: <CAFimOt5fQ=0JKpteCCAbDg14u-itABV7MEULuQEm3dUTFj89Lg@mail.gmail.com>
Date: Fri, 9 Oct 2020 08:36:02 +0200
Message-ID: <jwqv9fjlxd9.fsf@axis.com>
MIME-Version: 1.0
Return-Path: ola.x.nilsson@axis.com
Content-Type: text/plain



On Fri, Oct 09 2020, Douglas via lists.openembedded.org wrote:

> Allow different recipes to build things from the one external source tree in
> parallel, but only if the build is happening outside the source tree.
>
> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---
> meta/classes/externalsrc.bbclass | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/externalsrc.bbclass
> b/meta/classes/externalsrc.bbclass
> index d200129987..73bbb2be3c 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -85,7 +85,7 @@ python () {
> if task.endswith("_setscene"):
> # sstate is never going to work for external source trees, disable it
> bb.build.deltask(task, d)
> - else:
> + elif externalsrc == externalsrcbuild:

If any of the paths contain a symlink they can point to the same dir
without being textually equal.  You need to normalize them first.

/Ola

