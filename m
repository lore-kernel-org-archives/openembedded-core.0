Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BACC88E75
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 05:51:17 +0000 (UTC)
Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5004.1789710671353534731
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 22:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BivBiVJt;
 spf=pass (domain: mvista.com, ip: 74.125.228.99, mailfrom: vanusuri@mvista.com)
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a605c198fdso506522a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:51:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789710669; cv=none;
        d=google.com; s=arc-20260327;
        b=b+A6MemnP+9oMKKNK8yIIBakOtbuzm9Ote/XjQx6g3eLf7Bu27Tjy3e2Xz4Zli+ePT
         JZ5mWdm6FirgI3tLO2nnTXhQmIpaLexmpnDnTAUH8KPh+pTFBs+DrZpkB6JHYP+4yOM/
         FEGd6Mh+SdqLP87PatuzQZylG88wWW0o+BB5sRoNFZrTiRH9bo8xFX7LCj39JZscCWxX
         6ryI3oLs7UCACs76d8vKVZerudkTEAKqA+6AlYvqfh2hHNOjPiNa4EeekxU4CDu/Z71N
         Rv4dpUjaR3cko1+X4w2iH5/MVHjTy0ZuLtoqASgRvNB27XQ/sA+0A9N4l90bAVYMEbpX
         o2Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=th8IP/umrMURM0Y7x4h/ioTkjRHpHf/8a1eW0sJc10U=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=KbBs4eZVTmxLjSu+ttQNlYF7dXG1zA0c6PgOVz8+nWBxVv2dGItYzjtONRkNWP8aVP
         YVYwspPiUoAp8wMWD6Z2OqNQ0IvLrrDUgOcrGT96fKlp0QEMFK5/xCoV/J8y8cx81oBC
         cOMk7uCrV/4coC2KU10CBFjZudQuVpaGwY9PTdj0AKf+uBCS8lFZCQBqT4m+9S/sunI/
         sIOD1hhN8Xr+S++EN3sSmEMEtPL9fXGa3qcXFneIyryRsI91JPCDKq5menrpl3MsYx4v
         O/BPRgQ6MHedUwq4wRhYvxgG1wiTpp57kKgjYRKtoReNdxgGXHaKfNMRtzP2qnWDYUIs
         Z32Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1789710669; x=1790315469; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=th8IP/umrMURM0Y7x4h/ioTkjRHpHf/8a1eW0sJc10U=;
        b=BivBiVJtAcAQH0582J/7hHWOzgeoQA+4UojmW9hhKubqZxE/RSq4MkSQXo9mEuQZkj
         h/WG0aQ3EQ1tWIc2rO/78S6NjZaiyDYtWyMeKrrscvhp3RbPffvElRFR0vu55IKJjVke
         I3gAfnwLttKJFzAEcD6brt5FAudFsAMMmBWXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789710669; x=1790315469;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=th8IP/umrMURM0Y7x4h/ioTkjRHpHf/8a1eW0sJc10U=;
        b=s6ww04BGRs5f4jjJpg2LNv11Mn2Ja4r06zXoVxZvn8/rcCDgDsDAGz6VXPQLt58lDB
         riRHtZau3m+DsOzYV3kyOrb1EX80NVkL7TU3YfMGb/IZsbY2IVtfGkCD8euDDLGanTF9
         frTpPHJiIoaCnfuxPLubWxMha4tfo7c0YHYF8g2rPiUnqsdkR4HWmOWcWvwg89t5uZ5S
         UBNxdmzLIjZJn4ltLuTH/+EsqAATb2w8iROvP6DLk0Y0JYdJBF5xaK5QJ3yFK40RliVR
         GtDfBSIt/P/zyJBTbqR3aJEV4oe06DpkOHbq8PuZG2Gk8VRnpjNiH+5W4Wr+gMWgA3T3
         f+Jg==
X-Gm-Message-State: AFuF++kZigUPlyfj06dc4oJm6ppE2+IztcXuoJRDX5BBobV4vjzN8q2W
	zzUesW+amsQRWB2NceVRsx13l1S+HrCDzkYYRcT9nIpFe/kmAKCy7gf4Lo8Df5pACDgrTIfOWIE
	10ztx8nG09L6NavgF1ThcPpCLidPwo+PVnjgvyaa79w==
X-Gm-Gg: AYBFou3SJSKkjLzPp3kgeBfwWCIwho8us9KigqwHBIhVxX60YOW7I+ztdInZ306Qmip
	QxM019AM8ygpv+StH7jWozSBqla9NlExmzSBdORAW2q2LEQx8mfSvZ07adj86phflrgxqg5Dhrv
	oeUn0FJhPUBSVPg3RR/dXiXuYl9uyZhqnQJXP+skzZ1LxMXn8X9cB4asTqztVM9cG8Ti0Y+ydSl
	CjAoDnX7bdHIrcaFX9vL1YLv0MYpkR4422MI26mNCju1GTD916bfOEe2KeMp7WVVvBXjXXn3n+l
	e02xEnBV4ESvjZIq3v1TDLqO5mUc0YTwbzWDFrfhBLE1qv6yC0GnlAEuq2q2sVhFTjqoIfszuR/
	lycyOCdYXGwVL
X-Received: by 2002:a05:6402:4391:b0:6aa:a7f:d584 with SMTP id
 4fb4d7f45d1cf-6aa53cf465cmr265759a12.42.1789710669570; Thu, 17 Sep 2026
 22:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260901092741.34198-1-vanusuri@mvista.com> <20260901092741.34198-2-vanusuri@mvista.com>
 <DLBPBCWV64LT.1TOCJCVQDN8GZ@smile.fr>
In-Reply-To: <DLBPBCWV64LT.1TOCJCVQDN8GZ@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Fri, 18 Sep 2026 11:20:56 +0530
X-Gm-Features: AcwNN1X0AMP_4AuiOt5SO4_len3NwgngQKrXegoypnxnLkAkp7w2MW45Tns7fyQ
Message-ID: <CANQUz1_bPGT=MricfKEufDsFhKEyzpqrfkZJ+1MU_fyt6Dr5YA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][patch 2/3] python3-cryptography: Fix CVE-2026-69248
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b5f500065bbb7ce7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 05:51:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246190

--000000000000b5f500065bbb7ce7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

I have sent the required backport patches for wrynose.

Could you please consider these patches and merge them into scarthgap as
well?

Thanks & Regards,

Vijay



On Thu, Sep 10, 2026 at 7:50=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:

> On Tue Sep 1, 2026 at 11:27 AM CEST, Vijay Anusuri via
> lists.openembedded.org wrote:
> > Pick patch according to [2]
> >
> > [1] https://nvd.nist.gov/vuln/detail/cve-2026-69248
> > [2] https://security-tracker.debian.org/tracker/CVE-2026-69248
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  .../python3-cryptography/CVE-2026-69248.patch | 297 ++++++++++++++++++
> >  .../python/python3-cryptography_42.0.5.bb     |   1 +
> >  2 files changed, 298 insertions(+)
> >  create mode 100644
> meta/recipes-devtools/python/python3-cryptography/CVE-2026-69248.patch
>
> Hello,
>
> As far as I can tell, this CVE also need fixing on wrynose. Can you
> send the need wrynose backports from this series so I can merge this on
> scarthgap?
>
> Thanks!
> --
> Yoann Congal
> Smile ECS
>
>

--000000000000b5f500065bbb7ce7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi=C2=A0Yoann,</div><p class=3D"gmail-isSelectedEnd">=
<span>I have sent the required backport patches for wrynose.</span></p><p c=
lass=3D"gmail-isSelectedEnd"><span>Could you please consider these patches =
and merge them into scarthgap as well?<br><br></span></p><p class=3D"gmail-=
isSelectedEnd"><span>Thanks &amp; Regards,<br></span></p><p class=3D"gmail-=
isSelectedEnd"><span>Vijay</span></p><p><span><br></span></p></div><br><div=
 class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Thu, Sep 10, 2026 at 7:50=E2=80=AFPM Yoann Congal &lt;<a href=3D=
"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue Sep 1, 2026 at 1=
1:27 AM CEST, Vijay Anusuri via <a href=3D"http://lists.openembedded.org" r=
el=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Pick patch according to [2]<br>
&gt;<br>
&gt; [1] <a href=3D"https://nvd.nist.gov/vuln/detail/cve-2026-69248" rel=3D=
"noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/cve-2026-69=
248</a><br>
&gt; [2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-69=
248" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.o=
rg/tracker/CVE-2026-69248</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../python3-cryptography/CVE-2026-69248.patch | 297 ++++++++++++=
++++++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-cryptography_42.0.5.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-cryptography_42.0.5.bb</a>=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 2 files changed, 298 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/python3-cryptogr=
aphy/CVE-2026-69248.patch<br>
<br>
Hello,<br>
<br>
As far as I can tell, this CVE also need fixing on wrynose. Can you<br>
send the need wrynose backports from this series so I can merge this on<br>
scarthgap?<br>
<br>
Thanks!<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--000000000000b5f500065bbb7ce7--

