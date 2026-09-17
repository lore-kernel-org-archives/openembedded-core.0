Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8A9C982CF
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 14:01:13 +0000 (UTC)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40245.1789653669896196218
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 07:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=InGwglP7;
 spf=pass (domain: mvista.com, ip: 74.125.228.140, mailfrom: vanusuri@mvista.com)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d50b7cf9so141439066b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 07:01:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789653668; cv=none;
        d=google.com; s=arc-20260327;
        b=Xr6GNmJa7cwFZBhqPqpHiJiZdJhT0IzEqMBu8zDUKFmGcCvt0gIv5M3j1NAA1kratM
         Lr44Wz4NZQz3TxHHPri7m08GjpQEiO26JJ0iAyW1y80eP18XVhpltQNqAr+TXp0gcG+m
         cECzx/qJS62T5wqA8qY17wA/yncvHGAwq4ktVDeycyb9PeDsmc4LsZcE8deja9jAn+vN
         PU3ZQYOrfPcNZXrxnN+ZZZskR3kh5PYpZhJN9Nl4In3QOaySBh9J/JbrLRo8WHn2tHdN
         FPWRhbucbYI38HYDfy0nu56C9YEAReAgfSzsjJ6XbZSYrW2dVkWylktFfvtK8ZWUGiRJ
         urmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NofiYVvVayR7CAvceog4dAmwtJoAdjkgPT9OUqdCEgM=;
        fh=y5pao96iLGJBYcMJo+J0gqjBNoQsnD8dPb9cfM8qocE=;
        b=QP8sCV59TIQD0uQEJ95p5inVS1hx2rpqcUzFZ4Xo4vzD5aFhUI9DyCe7cjfzP5sF2L
         3zpNO0qyNgCBm5ztF8+J5J7FkGxLcH25xXc7pMJXHH3I4D+MU9oSPgag58hGeIaNnvSA
         ml5YBj20PwuE/vX9xdHK6Vrl4GoEYGvlFlbxDQPYNKkrnwSoGcVWMmvffnzdYvJVCPpK
         rt/1c1F9xQpREn0dVnZopGarg8fyyyEA67sXHBOA/F0eLfFZOSKO5CvdsmnPsLdRyUN/
         QKkXYghYuSq7Yu0E/srKotfteeLIxofF4CXbIIEhxUO2BSIzCE4rM0fI2Rt1ErwK6ewW
         /IQw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1789653668; x=1790258468; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NofiYVvVayR7CAvceog4dAmwtJoAdjkgPT9OUqdCEgM=;
        b=InGwglP7WuCRGO6A1DtGxP6umLwVowkO0IqqgvOERajXKGwy01tNUE4rFzHY6mR3r6
         hOlYvw9fSLXC/B73E8Q7kEBsg35kN2+JPPs3SHWKimtDvWcVZLCZlamvzRsBndsjsGfX
         y7y1p9aR9k7KgpxZXg0IHUAR2KcUre3HT/w4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789653668; x=1790258468;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NofiYVvVayR7CAvceog4dAmwtJoAdjkgPT9OUqdCEgM=;
        b=SLzjURb9PtwhClv4j8YouFq9l6Oibl7QVB1GdLbSpov9elvSHz+RiJFErAYWhWA1cU
         XbnUIndMrelBcr1l76KXTCB9XTkarg6e6chn0N6ygV5FzJilDHW+ay/EC4Lbu04gyjHU
         m+zjmhJN6u0b0Fav1khs/fqg7TSfrULw8iEDrWSk+IfgymlNVeHz6LsrrBxQCiYo4SW+
         OUcW729Mg8/TFdBpc8tvTpBZ9Pp336ziJKB0FEnDk/dPWvvaEY2y7sc8ylx6phI+HbNH
         a78E3JbtYjv//blCi4yungzDfoVdFh7loc0hiH65eGoVFB4ensUhGTa9oEGvlyXsm+Jl
         lrCg==
X-Forwarded-Encrypted: i=1; AKwUvByPrj9RbW06lt6czDBsrcJKZgrlFNCuIA4MVkewAK869haQtKlka2uYCdYbk2g5GoITYzjQ19eIwyGtPXsefaZc4w==@lists.openembedded.org
X-Gm-Message-State: AFuF++mQlgJ7JrVlAj/ghsW4IKZ8n6hIyeleum/9SfewBClrDv2uZbS7
	YuL0FW7TR5bKc2Z9BwxdScXychhCNMWY6bZXwB49STmuyVtNQgkCKejKjxyI4FbhBgdGxlTOuBT
	/RHyOaXol8YCxuTguxYCCuweUslu5qa3afaB2FlsWog==
X-Gm-Gg: AYBFou3kECMY5Qo8nFF8nHSTD5HJ9VC84USHi+Lx2+VijUmnkSihSIS4UD9e+BkMjYH
	eZDAgCLk/3kKlyPSgU6hu5qF2KAHB7iyxV5DrDg/Ua2l/4pZ2qZrsxxUgk9vtpBqSy8ef5qBGgx
	Pfz7wh7eu4kp42Ynv6nwCCrmUDglPQcsMuX+JgtgJQKHXqXa6G4GblRBRcXhAsohbKvr0wEGHx6
	hHDopye5oDhJOAUrkLBGtyuq4BYhCLKC13MMKM0vuCeCAHQkc0U7lDpTjg0CoZ5+4TeiC3v5xs8
	h7bLtJ3woPYOBq8bcI/0PnXZCKshVC6R8MQ2tJbcMgIODvfg/RjKAtg=
X-Received: by 2002:a17:907:c20e:b0:c28:e01d:1d08 with SMTP id
 a640c23a62f3a-c29e5360dccmr493929366b.49.1789653667787; Thu, 17 Sep 2026
 07:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260917105551.76512-1-vanusuri@mvista.com> <DLHK8G1OWTE8.394FSK4TR0VS5@smile.fr>
 <DLHLDE6HLTRH.2AFGSZ80URG52@smile.fr> <9faaa5bbc70d619058d8abecda9cd235d210d422.camel@pbarker.dev>
In-Reply-To: <9faaa5bbc70d619058d8abecda9cd235d210d422.camel@pbarker.dev>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Thu, 17 Sep 2026 19:30:53 +0530
X-Gm-Features: AcwNN1XW7hUGFnzq4kQ0Wnh8wDyJj_ruMxAF4A0PyS_t-uC2rHsXlHTmUhaVLe4
Message-ID: <CANQUz1_hMwrLp4tuVS4+cEXXaj71-L0Nijw6n+pjzGpAKh=prw@mail.gmail.com>
Subject: Re: [OE-core][wrynose][patch] rsync: Security fixes from v3.4.1-sec-patches3
To: Paul Barker <paul@pbarker.dev>
Cc: Yoann Congal <yoann.congal@smile.fr>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000023c9e7065bae3716"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 14:01:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246066

--00000000000023c9e7065bae3716
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann, Paul,

Thanks for the feedback.

I have opened a discussion [1] with the rsync upstream project to clarify
the status and maintenance model of the v3.4.1-sec-patches3 and
v3.2.7-sec-patches3 branches, including whether they will remain available
and whether future security patch branches will be published.

Regarding the 3.4.4 upgrade, I noticed that upgrading from 3.4.1 to 3.4.4
would still leave us with around 33 CVEs to address. The rsync 3.5.0
release [2] addresses these 33 CVEs.

I will continue to investigate the available options

[1] https://github.com/RsyncProject/rsync/discussions/1095
[2] https://download.samba.org/pub/rsync/NEWS#3.5.0

Thanks & Regards,

Vijay


On Thu, Sep 17, 2026 at 6:21=E2=80=AFPM Paul Barker <paul@pbarker.dev> wrot=
e:

> On Thu, 2026-09-17 at 14:31 +0200, Yoann Congal wrote:
> > On Thu Sep 17, 2026 at 1:38 PM CEST, Yoann Congal wrote:
> > > On Thu Sep 17, 2026 at 12:55 PM CEST, Vijay Anusuri via
> lists.openembedded.org wrote:
> > > > Backport the security fixes from the upstream v3.4.1-sec-patches3
> > > > branch to address the known rsync security vulnerabilities.
> > > >
> > > > The v3.4.1-sec-patches3 branch contains 239 commits. The GitHub
> > > > workflow commits (037, 038, and 160), which only modify
> > > > .github/workflows files, and the testsuite-only commits (238 and
> > > > 239) are excluded because they are not applicable to the Yocto
> > > > build.
> > > >
> > > > The remaining 237 security fixes are combined into a single patch
> > > > series and applied on top of the rsync 3.4.1 source.
> > > >
> > > > SUSE has also backported these security fixes to
> rsync-3.4.1-160000.6.1
> > > > to address the corresponding CVEs.
> > > >
> > > > References:
> > > >
> > > > https://rsync.samba.org/security.html
> > > > https://github.com/RsyncProject/rsync/tree/v3.4.1-sec-patches3
> > > > https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2026-53802
> > > >
> > > > This fix handles CVE-2025-10158 CVE-2026-29518 CVE-2026-43617
> CVE-2026-43618 CVE-2026-43619 CVE-2026-43620 CVE-2026-45232 CVE-2026-4450=
7
> CVE-2026-44508 CVE-2026-44509 CVE-2026-44510 CVE-2026-53783 CVE-2026-5378=
4
> CVE-2026-53785 CVE-2026-53786 CVE-2026-53788 CVE-2026-53789 CVE-2026-5379=
0
> CVE-2026-53791 CVE-2026-53792 CVE-2026-53793 CVE-2026-53794 CVE-2026-5379=
5
> CVE-2026-53796 CVE-2026-53797 CVE-2026-53798 CVE-2026-53799 CVE-2026-5380=
0
> CVE-2026-53801 CVE-2026-53802 CVE-2026-53803 CVE-2026-70452 CVE-2026-7045=
3
> CVE-2026-70454 CVE-2026-70455 CVE-2026-70456 CVE-2026-70457 CVE-2026-7045=
8
> CVE-2026-70459 CVE-2026-70460 CVE-2026-70461 CVE-2026-70462 CVE-2026-7046=
3
> CVE-2026-70464
> > > >
> > > > Dropped CVE-2025-10158.patch
> > > > Refreshed the patch
> 0001-Add-missing-prototypes-to-function-declarations.patch
> > > >
> > > > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > > > ---
> > > >  ...-prototypes-to-function-declarations.patch |    81 +-
> > > >  .../rsync/files/CVE-2025-10158.patch          |    36 -
> > > >  .../files/rsync-3.4.1-sec-patches3.patch      | 34052
> ++++++++++++++++
> > > >  meta/recipes-devtools/rsync/rsync_3.4.1.bb    |     2 +-
> > > >  4 files changed, 34071 insertions(+), 100 deletions(-)
> > > >  delete mode 100644
> meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
> > > >  create mode 100644
> meta/recipes-devtools/rsync/files/rsync-3.4.1-sec-patches3.patch
> > >
> > > Hello,
> > >
> > > I don't think I want to carry a 34000 lines patch.
> > >
> > > Does the rsync project released a v3.4.1-sec-patches3 archive?
> > >
> > > If not, can we try to switch the recipe to git and point SRCREV to th=
e
> > > "rsync-3.4.1-sec-patches" branch?
> > > Since the recipe is not git-based now, we'll need to switch to git
> > > first, then upgrade.
> >
> > Paul asked a good question about this idea though: How official is this
> > branch?
> > Can you ask upstream the status of it? Will it stay published? Will we
> > see v3.4.1-sec-patches4,5... branches someday?
>
> Hi Yoann, Vijay,
>
> Some thoughts here...
>
> The upgrade to v3.4.3 was rejected [1] due to a few minor feature
> additions. In this case it may be lower risk to take an upgrade rather
> than backporting a 34 kLOC patch. I think we should avoid v3.5.0 due to
> the number of regressions reported [2]. v3.4.4 is an option. We can then
> see how many CVEs remain open and decide what to do about them.
>
> The onus here is on contributors, not on Yoann as stable maintainer. To
> go ahead we would need some investigation, testing and a proposal to the
> TSC to approve the update as an exception to our usual stable policy.
>
> [1]: https://lore.kernel.org/all/DL0HY2YT9WGM.3ACOQJL408XKI@smile.fr/
> [2]:
> https://github.com/RsyncProject/rsync/issues?q=3Dis%3Aissue%20%223.5.0%22
>
> Best regards,
>
> --
> Paul Barker
>
>

--00000000000023c9e7065bae3716
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-isSelectedEnd"><span>Hi Yoann, Paul,</sp=
an></p><p class=3D"gmail-isSelectedEnd"><span>Thanks for the feedback.</spa=
n></p><p class=3D"gmail-isSelectedEnd"><span>I have opened a discussion [1]=
 with the rsync upstream project to clarify the status and maintenance mode=
l of the </span><code dir=3D"ltr"><span>v3.4.1-sec-patches3</span></code><s=
pan> and </span><code dir=3D"ltr"><span>v3.2.7-sec-patches3</span></code><s=
pan> branches, including whether they will remain available and whether fut=
ure security patch branches will be published.<br></span><br></p><p class=
=3D"gmail-isSelectedEnd"><span>Regarding the 3.4.4 upgrade, I noticed that =
upgrading from 3.4.1 to 3.4.4 would still leave us with around 33 CVEs to a=
ddress. The rsync 3.5.0 release [2] addresses these 33 CVEs.</span></p><p><=
span>I will continue to investigate the available options<br><br>[1]=C2=A0<=
/span><a href=3D"https://github.com/RsyncProject/rsync/discussions/1095">ht=
tps://github.com/RsyncProject/rsync/discussions/1095</a><br>[2] <a href=3D"=
https://download.samba.org/pub/rsync/NEWS#3.5.0">https://download.samba.org=
/pub/rsync/NEWS#3.5.0</a><br><br></p><p>Thanks &amp;=C2=A0Regards,<br></p><=
p>Vijay</p><br></div><br><div class=3D"gmail_quote gmail_quote_container"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 17, 2026 at 6:21=E2=80=AFP=
M Paul Barker &lt;<a href=3D"mailto:paul@pbarker.dev">paul@pbarker.dev</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Th=
u, 2026-09-17 at 14:31 +0200, Yoann Congal wrote:<br>
&gt; On Thu Sep 17, 2026 at 1:38 PM CEST, Yoann Congal wrote:<br>
&gt; &gt; On Thu Sep 17, 2026 at 12:55 PM CEST, Vijay Anusuri via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; Backport the security fixes from the upstream v3.4.1-sec-pat=
ches3<br>
&gt; &gt; &gt; branch to address the known rsync security vulnerabilities.<=
br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; The v3.4.1-sec-patches3 branch contains 239 commits. The Git=
Hub<br>
&gt; &gt; &gt; workflow commits (037, 038, and 160), which only modify<br>
&gt; &gt; &gt; .github/workflows files, and the testsuite-only commits (238=
 and<br>
&gt; &gt; &gt; 239) are excluded because they are not applicable to the Yoc=
to<br>
&gt; &gt; &gt; build.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; The remaining 237 security fixes are combined into a single =
patch<br>
&gt; &gt; &gt; series and applied on top of the rsync 3.4.1 source.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; SUSE has also backported these security fixes to rsync-3.4.1=
-160000.6.1<br>
&gt; &gt; &gt; to address the corresponding CVEs.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; References:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <a href=3D"https://rsync.samba.org/security.html" rel=3D"nor=
eferrer" target=3D"_blank">https://rsync.samba.org/security.html</a><br>
&gt; &gt; &gt; <a href=3D"https://github.com/RsyncProject/rsync/tree/v3.4.1=
-sec-patches3" rel=3D"noreferrer" target=3D"_blank">https://github.com/Rsyn=
cProject/rsync/tree/v3.4.1-sec-patches3</a><br>
&gt; &gt; &gt; <a href=3D"https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2=
026-53802" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.suse.com/s=
how_bug.cgi?id=3DCVE-2026-53802</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; This fix handles CVE-2025-10158 CVE-2026-29518 CVE-2026-4361=
7 CVE-2026-43618 CVE-2026-43619 CVE-2026-43620 CVE-2026-45232 CVE-2026-4450=
7 CVE-2026-44508 CVE-2026-44509 CVE-2026-44510 CVE-2026-53783 CVE-2026-5378=
4 CVE-2026-53785 CVE-2026-53786 CVE-2026-53788 CVE-2026-53789 CVE-2026-5379=
0 CVE-2026-53791 CVE-2026-53792 CVE-2026-53793 CVE-2026-53794 CVE-2026-5379=
5 CVE-2026-53796 CVE-2026-53797 CVE-2026-53798 CVE-2026-53799 CVE-2026-5380=
0 CVE-2026-53801 CVE-2026-53802 CVE-2026-53803 CVE-2026-70452 CVE-2026-7045=
3 CVE-2026-70454 CVE-2026-70455 CVE-2026-70456 CVE-2026-70457 CVE-2026-7045=
8 CVE-2026-70459 CVE-2026-70460 CVE-2026-70461 CVE-2026-70462 CVE-2026-7046=
3 CVE-2026-70464<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Dropped CVE-2025-10158.patch<br>
&gt; &gt; &gt; Refreshed the patch 0001-Add-missing-prototypes-to-function-=
declarations.patch<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@=
mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 ...-prototypes-to-function-declarations.patch |=C2=A0 =
=C2=A0 81 +-<br>
&gt; &gt; &gt;=C2=A0 .../rsync/files/CVE-2025-10158.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 36 -<br>
&gt; &gt; &gt;=C2=A0 .../files/rsync-3.4.1-sec-patches3.patch=C2=A0 =C2=A0 =
=C2=A0 | 34052 ++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 meta/recipes-devtools/rsync/<a href=3D"http://rsync_3.=
4.1.bb" rel=3D"noreferrer" target=3D"_blank">rsync_3.4.1.bb</a>=C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 =C2=A02 +-<br>
&gt; &gt; &gt;=C2=A0 4 files changed, 34071 insertions(+), 100 deletions(-)=
<br>
&gt; &gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/rsync/files/C=
VE-2025-10158.patch<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/rsync/files/r=
sync-3.4.1-sec-patches3.patch<br>
&gt; &gt; <br>
&gt; &gt; Hello,<br>
&gt; &gt; <br>
&gt; &gt; I don&#39;t think I want to carry a 34000 lines patch.<br>
&gt; &gt; <br>
&gt; &gt; Does the rsync project released a v3.4.1-sec-patches3 archive?<br=
>
&gt; &gt; <br>
&gt; &gt; If not, can we try to switch the recipe to git and point SRCREV t=
o the<br>
&gt; &gt; &quot;rsync-3.4.1-sec-patches&quot; branch?<br>
&gt; &gt; Since the recipe is not git-based now, we&#39;ll need to switch t=
o git<br>
&gt; &gt; first, then upgrade.<br>
&gt; <br>
&gt; Paul asked a good question about this idea though: How official is thi=
s<br>
&gt; branch?<br>
&gt; Can you ask upstream the status of it? Will it stay published? Will we=
<br>
&gt; see v3.4.1-sec-patches4,5... branches someday?<br>
<br>
Hi Yoann, Vijay,<br>
<br>
Some thoughts here...<br>
<br>
The upgrade to v3.4.3 was rejected [1] due to a few minor feature<br>
additions. In this case it may be lower risk to take an upgrade rather<br>
than backporting a 34 kLOC patch. I think we should avoid v3.5.0 due to<br>
the number of regressions reported [2]. v3.4.4 is an option. We can then<br=
>
see how many CVEs remain open and decide what to do about them.<br>
<br>
The onus here is on contributors, not on Yoann as stable maintainer. To<br>
go ahead we would need some investigation, testing and a proposal to the<br=
>
TSC to approve the update as an exception to our usual stable policy.<br>
<br>
[1]: <a href=3D"https://lore.kernel.org/all/DL0HY2YT9WGM.3ACOQJL408XKI@smil=
e.fr/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/all/DL0=
HY2YT9WGM.3ACOQJL408XKI@smile.fr/</a><br>
[2]: <a href=3D"https://github.com/RsyncProject/rsync/issues?q=3Dis%3Aissue=
%20%223.5.0%22" rel=3D"noreferrer" target=3D"_blank">https://github.com/Rsy=
ncProject/rsync/issues?q=3Dis%3Aissue%20%223.5.0%22</a><br>
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
</blockquote></div>

--00000000000023c9e7065bae3716--

