Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 99E517D005
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2019 22:20:44 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id k189so2194699qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2019 15:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ZmVOKojgsIFocwxRu4zBwz65lI3s1+v+NpljEpPHgxs=;
	b=AKr4KLG+bnxoPPF5VfyjLgrP7N6ej9VW0OgJQ805GUYpMRVc/U6HfJzTO7NQd2asON
	HglpYt2M5lUmpKS59NAh2aeEaAk4qkNoZ76Xy+dd8isAK7cbhJTax9SAhb4nChFlnkxZ
	hK+JUyOLOmAcSMy1DLDKi2mjKLw4tq4VkxZeQhFQeaLYMrwRhlAhRLnJFa9tD3ls/ahN
	dnKEWOdjtloyLPfKJDpBspMSIIH0NFyF/fgDAq5ntJsp1rTknFsLXoQyxNbYRmv1Xtqb
	F5wcrgoJUtDbqOqy/JClHqjzQ8I2O9xwLbInTFT39apJukbVFA66hxyyA7dTcnqlcL36
	83yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ZmVOKojgsIFocwxRu4zBwz65lI3s1+v+NpljEpPHgxs=;
	b=fNyBxm4gAxaPJra/I29ZdaGaWUyNK48Y+/Buf3bVIA/mSlRI546MuVWH/lVbGRNuSi
	/zNa53owCKvaibUTKkY/DLywZa3JBBJkEjBekE5R3ky3m08pgn0XgERAexy08GhHLmBU
	ZhD8ck43qsHan9plWoHIbUE0Zen1i9m+Qz3r8O1MIp1nhtLHkS9gaeI8CZkxyma7NKE8
	G03vpU2D5chqB8ht1fuymljGirzXhQ2Fmyp1+HTnmlFTywjPghTHzU/IA3caiCGc99nn
	NrL9qHpDBFG9HEJz+7hxV4eC+RFWkcb3ulIWXirOVNGwaJy1JQprtXW7hwXIqfVWz6hf
	tnSQ==
X-Gm-Message-State: APjAAAWmyDB2Igck0hhhV1dcou0uKh0ccFDU7Z7dwQbOAjZLo1ZSV6zy
	disiinhBOPcoUW1q2EUVUKW/PCe1aWgqJymofLOBaA==
X-Google-Smtp-Source: APXvYqx9ZUtYuLpcqB4cBrTVtQVzeAHqKcbujpvz5TlwxysUEswfFlZGGjsDl7NQ+6M4XCRBeN2T645Vlht8wzb/uAw=
X-Received: by 2002:a37:451:: with SMTP id 78mr9862542qke.315.1553293245365;
	Fri, 22 Mar 2019 15:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
	<20190322200306.GB14099@localhost>
In-Reply-To: <20190322200306.GB14099@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Mar 2019 15:20:19 -0700
Message-ID: <CAMKF1sqJe3G3rC4U8S-gZHDCrjuBgBPpXh-hohWJH2PL_+i-ww@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: musl thoughts
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
X-List-Received-Date: Fri, 22 Mar 2019 22:20:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2019 at 1:03 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Fri, Mar 22, 2019 at 02:11:35AM +0100, Andreas M=C3=BCller wrote:
> >...
> > 3. Change our musl slightly: Many patches we currently have are
> > trivial. Missing headers or #defines for missing functions... So if we
> > add few headers
> >   * Empty chunks for e.g <net/ethernet.h>
> >...
> > Some other ideas?
>
> Not upstreamable hacks aren't a long-term sustainable way,
> no matter where you do the patching.
>
> net/ethernet.h header problems are requiring 2 patches in NM.
>
> It would be good to get whatever is the actual root cause fixed properly,
> and that fix upstreamed.
>
> E.g. I wonder whether this was supposed to be fixed by
> 0001-if_ether-move-muslc-ethhdr-protection-to-uapi-file.patch
>
> Or is this patch in linux-libc-headers even the cause of the problem?
>
> linux-libc-headers applying 6 patches just for musl is not a good sign
> in any case.
> Is that much patching also done by other distributions that use musl?
> Why are these patches Upstream-Status: Pending/Submitted for a  long
> time without having been applied upstream?
>
> Long-term it would be less work if everything would get fixed properly
> with fixes reviewed and applied by upstream.
>

agreed, meanwhile we have to also ensure that musl users keep going and mak=
e it
possible, if OE devs are fixing musl related issues in upstream
packages then it is also
good reputation for the project. The real thing is to find time and
propose the patches upstream
more than often they get accepted.

> > Andreas
> >...
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

