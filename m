Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B9FCCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 15:12:10 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.48.1760973129022720642
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 08:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ei9VgtvI;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-781014f4e12so55651897b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 08:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760973128; x=1761577928; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgFmWJ3hU/GwfGaQaAqq026Pfel47oWpOR4lskfSGVw=;
        b=ei9VgtvIIja5CtqKBPFqSaiaiT2kDVU8R1sAsKLBxKCdMWhsJ+KRx6pjUXI6HCVyww
         dlA5PehIcEhnWpVMVtehBJ4/uj9rnRHsuglhxeDxnk9QtjNdCvagPZ5s9bYOq7FSDIWo
         QsFE23GGFoR6Qqy7rDvtj8vCoq83NZji4+EVfQY/t1+QMGmEX18Jl9iNFqrvbI0L+Yz4
         /BYUGSy/vaoly8j1SL9XFx159F27ETaDDrfg+6VJgS2JPuq6Z0yooa3k73Bk3XY9cAKH
         jvysVBTQOtSstddpJyxfpVKvhht81ww5vrXM8RFx//BlOJi/Vo4hDqBoowiXCPIcMXdG
         snJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760973128; x=1761577928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VgFmWJ3hU/GwfGaQaAqq026Pfel47oWpOR4lskfSGVw=;
        b=ascMvwRd9JIcOtc5rjwDwrJ2kA7kJ3Nxb136Ub6s4Z0cyTDEkcZOcv95T0qL8xNlk7
         7YG05cobnq1PHhojNHeqVMWIuktGDgFIEjwgZ8nokgSAID4hnhwP4RT0kKq9br3sk2uf
         RgiCHKlvo/TxHq2I8pZdCFZ3EbzpY0i7nf7kfyydIkOjFvMAMEIKyT8n/8rU2ljRIRJn
         JS+67J3aMBjqwJJYIyD1xNU0gQhaxV+c7Is6I+4w0iwiRiLaCdXTrjChuCO3mdZvWIni
         gC8gh88wSCUC5gcg57HLdmu3vQcHQzUGrOwjz4mt0o7WyDVZ7mczxrZ4MxcqRnh5UpFB
         HGZQ==
X-Gm-Message-State: AOJu0Yx0MrrHfnc+FLrMJezE/1eAbE4zbbo1tov3aCm3sIvcx2U2xSdD
	biToZMiEBWjgNFUia2+r8cPfRKWr5hADyf+KRboZtYphJkZiyPuzbg804OwwXi08d+17ltXXFTf
	Ud3p54jOlKOgfs9WspWJuclftCbdnVikfjfQp
X-Gm-Gg: ASbGncuRZ78uEKCg/8tnp36lA5ffJbkxL5Mxx2ZhQLTVJ0sqrlmFS2hlRPR+ZdV9x+H
	V4SZX6TKuDt1o1JwLbqg1iyHT+x3TMNfTYM40xLFOVqE1MxwrdjAmshal9lgdeOq80ITQabj1t5
	yXXZoatPIgbB91WNwf4HHaHcluPZw9FzvZFO4n/S07L8YsLiF8TjcABgeboZjI2NQzOZQjjwJz7
	fsz4q3evoIyHFUwh0p+U9yWeQWu0rhhNvmm8FeM72c8uNzQYRhez9GnCyUChxtSLt3gaFTPXRsb
	dS+zjNTyNzDa8AfCpp+3rnA3W7Bn+9+jaqxGaDiq7G7huEN6nfZdJ9NyBwf/3NLzywrk2GJyNqL
	jI3fV9mZTJegJhw==
X-Google-Smtp-Source: AGHT+IFkCoquAZsPUHezRkTm/tNUCbZh2odOIH2mip59dTmJpUmmJtp5H8n7xiYr/0tEUxK2T15RKMqwHbjDomt5L8Y=
X-Received: by 2002:a05:690e:1443:b0:63e:1ef8:ca3 with SMTP id
 956f58d0204a3-63e1ef81ademr9066891d50.50.1760973127971; Mon, 20 Oct 2025
 08:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251015095914.2120664-1-Deepesh.Varatharajan@windriver.com>
 <20251015095914.2120664-2-Deepesh.Varatharajan@windriver.com>
 <4F641BFF-8B16-46C4-836C-51705A5659D0@arm.com> <B7F26DCA-922C-4758-8447-2B89240B182F@arm.com>
In-Reply-To: <B7F26DCA-922C-4758-8447-2B89240B182F@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Oct 2025 08:11:41 -0700
X-Gm-Features: AS18NWAZBTPT_t6otDEprlfFwdCtD06o2nxySe5vrPgitTaXAVCjxMClpjMhtLI
Message-ID: <CAMKF1sr+djRO=5FBBEfBG-RAbwSt8WrRZfkOkDc0qsNK2NLmGg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V5 2/3] rust: Use llvm instead of rust-llvm
To: ross.burton@arm.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>, 
	"deepesh.varatharajan@windriver.com" <deepesh.varatharajan@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 15:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225124

On Mon, Oct 20, 2025 at 7:40=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> On 20 Oct 2025, at 12:23, Ross Burton via lists.openembedded.org <ross.bu=
rton=3Darm.com@lists.openembedded.org> wrote:
> >
> > Hi,
> >
> >> On 15 Oct 2025, at 10:59, Varatharajan, Deepesh via lists.openembedded=
.org <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
> >> Updated the Rust build to depend on llvm instead.
> >
> > Because I was curious, I looked at the build stats before and after thi=
s series being merged. Here are the diffs for cputime and walltime when I b=
uilt llvm-native/rust-llvm-native and rust-native:
> >
> >  PKG                           TASK                   ABSDIFF  RELDIFF =
 CPUTIME1 -> CPUTIME2
> > - rust-llvm-native              do_compile           -12241.8s  -100.0%=
  12241.8s -> 0.0s
> > - rust-llvm-native              do_unpack               -31.4s  -100.0%=
     31.4s -> 0.0s
> > - rust-llvm-native              do_configure             -9.4s  -100.0%=
      9.4s -> 0.0s
> > - rust-llvm-native              do_populate_sysroot      -6.2s  -100.0%=
      6.2s -> 0.0s
> > + llvm-project-source-21.1.3    do_patch                  5.8s    +inf%=
      0.0s -> 5.8s
> >  rust-native                   do_populate_sysroot       9.5s  +323.0% =
     2.9s -> 12.5s
> > + llvm-native                   do_configure             12.9s    +inf%=
      0.0s -> 12.9s
> > + llvm-native                   do_populate_sysroot      18.6s    +inf%=
      0.0s -> 18.6s
> > + llvm-project-source-21.1.3    do_unpack                20.0s    +inf%=
      0.0s -> 20.0s
> > + llvm-tblgen-native            do_configure             29.0s    +inf%=
      0.0s -> 29.0s
> > + llvm-tblgen-native            do_compile              593.1s    +inf%=
      0.0s -> 593.1s
> >  rust-native                   do_install             1724.2s   +26.1% =
  6611.3s -> 8335.5s
> > + llvm-native                   do_compile            12051.6s    +inf%=
      0.0s -> 12051.6s
> >
> >  PKG                           TASK          ABSDIFF  RELDIFF  WALLTIME=
1 -> WALLTIME2
> > - rust-llvm-native              do_compile    -401.1s  -100.0%     401.=
1s -> 0.0s
> > - rust-llvm-native              do_unpack      -23.0s  -100.0%      23.=
0s -> 0.0s
> >  rust-native                   do_unpack      -21.3s   -42.5%      50.3=
s -> 28.9s
> > - rust-llvm-native              do_configure    -9.0s  -100.0%       9.=
0s -> 0.0s
> > + llvm-project-source-21.1.3    do_unpack        7.0s    +inf%       0.=
0s -> 7.0s
> > + llvm-native                   do_configure    12.3s    +inf%       0.=
0s -> 12.3s
> > + llvm-tblgen-native            do_configure    28.5s    +inf%       0.=
0s -> 28.5s
> > + llvm-tblgen-native            do_compile      30.1s    +inf%       0.=
0s -> 30.1s
> >  rust-native                   do_install      33.4s    +6.0%     553.4=
s -> 586.8s
> > + llvm-native                   do_compile     378.0s    +inf%       0.=
0s -> 378.0s
> >
> > For llvm vs rust-llvm, I=E2=80=99ve a local tweak to not build some of =
the GPU backends (as they take a long time) so it=E2=80=99s actually compar=
ing like-for-like, and it=E2=80=99s good to see that the compile time is cl=
ose.  It=E2=80=99s slightly faster in llvm even though it=E2=80=99s buildin=
g more backends, so I=E2=80=99m glad my build tweaking was useful.
> >
> > However, rust-native takes 26% more cpu time (just 6% more wall time, d=
ue to parallelisation).  I=E2=80=99m wondering if this is fallout from usin=
g -Os instead of -O2, or something else about how we=E2=80=99re building ru=
st-llvm vs llvm.  Insights welcome, but I=E2=80=99ll likely fire a test bui=
ld without -Os to see how that impacts the numbers later.
>
> Followup, comparing current master to master but with LLVM built as RelWi=
thDebInfo instead of MinSizeRel:
>
>   PKG                   TASK                  ABSDIFF   RELDIFF  CPUTIME1=
 -> CPUTIME2
>   rust-native           do_install           -1690.4s    -20.3%   8335.5s=
 -> 6645.1s
>   llvm-native           do_compile            6081.7s    +50.5%  12051.6s=
 -> 18133.3s
>
> Cumulative cputime:
>   4117.4s    +19.5%    5:52:36.1 (21156.1s) -> 7:01:13.5 (25273.5s)
>
>
>   PKG                   TASK                 ABSDIFF   RELDIFF  WALLTIME1=
 -> WALLTIME2
>   rust-native           do_install             24.0s     +4.1%     586.8s=
 -> 610.8s
>   llvm-native           do_compile            238.9s    +63.2%     378.0s=
 -> 616.8s
>
> Cumulative walltime:
>   251.3s    +22.8%    18:24.7 (1104.7s) -> 22:36.0 (1356.0s)
>
> So rust builds a bit faster, but LLVM is a lot slower to build, with a ne=
t result that the build is actually slower overall.  I=E2=80=99m happy with=
 the choice to use MinSizeRel in LLVM.

A large set of users of OE would not build compiler as often as some
system build engineers who build distros for them will do, so I wonder
how fast is resulting compiler in compiling applications, because in
such
settings it will be used in often and save a lot of time for users
such that spending extra time in compiling it in OE can be justified.
Of couse I am not recommending that
OE adopts that option as default.

>
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225121): https://lists.openembedded.org/g/openembedde=
d-core/message/225121
> Mute This Topic: https://lists.openembedded.org/mt/115768136/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

