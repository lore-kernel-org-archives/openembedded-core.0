Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCD8C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 07:32:23 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6994.1788334333910747046
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 00:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OkxttNDA;
 spf=pass (domain: mvista.com, ip: 209.85.218.49, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c25b661d37dso102184666b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 00:32:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788334332; cv=none;
        d=google.com; s=arc-20260327;
        b=fqMR+vt2ar1ZZyuiY06+Ry2jU4xEc2O93ogjDpWk5VVW6hLn2p2q+KUHhtfJL+rDt8
         V5M0E8olLKQ/QbXAFdbCQz7HX5hh2HIuYBRSI8jNl2DP7UFYcruUIvLighur6SWkyWev
         994zKSTpiI0Qgnxgj64r3LoD1LNWgsn77zcB48swISIxbIfgnG5NMfRAA5fcq/1B5eYY
         /wF3aKt5kG2NJJ0s6NsgNh5hQ/aO8Hl2iU+QctsDm+KsF3hqh7lZwWZtlL/DUp+sAIl2
         aXcI7QTxlsEIK5Aob1375qUuh90Z7H7bNMnRsKva/e2WKHPJImku+MQCexu8vlIUKMXx
         MhbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tVAOhqTClzOY2qgDnHqiDUCBreQBCoNu4RgVpAu5RmU=;
        fh=GHvkvuDq1dzEkTgh1+82oK11fSs11JFWdMos3uPvYu4=;
        b=TSZUkQtuoR0W/22PbKYFkdwjAGKGXkAyBI7LMvvi97L/znRepfsmEwc7bfsBdCprsF
         knYA1NBmfmX3bc0EHQdDUQMTJ8N8yenGh6/R1QNoqM/FgqvkGnXQXtcmlfl3IoDsxto2
         pjhYZEBio2OlKjOAAkKv/LoMemmnl3jiyKhdt9wXd0rQNZjQHdeg9X6LVmvBg1bFIr4K
         vE1E6OKIqFD/2Ol43mV5ZwXuRuxyV3pCifzc2qkIhxiKqRaqfMPVKy98L4x4EkjMHEYF
         +91gGHYyCrHS7Ssh8ly699CooIKXzzmFyi9eLvRCZW8nphsZ+A+wiHFVBeEKcZSrvAZv
         rjeA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788334332; x=1788939132; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tVAOhqTClzOY2qgDnHqiDUCBreQBCoNu4RgVpAu5RmU=;
        b=OkxttNDAuRIeRoFDCUvEhnEE5Q1Xeqmj/dGpaqIQD0ne6PWNdqI/4qzpTqvwnLk77/
         W8TuXzzLj9WrD5Seh7qkrlGkzf7g1vxzUkYED7n1sxAJFcib80hwKWCI/MXD5rMbvzna
         cUGI1le9hHv5GzmaZ4BBg4IVYMJ+dLY9IpAGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334332; x=1788939132;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tVAOhqTClzOY2qgDnHqiDUCBreQBCoNu4RgVpAu5RmU=;
        b=UcG1eFYm0QemUh/WmZDvUi28U6GWw48RL70x37sdEjy25+87LbxxiWfq+cIDILm9M/
         5wLzejopp78rio1WLtIXl6K37wp+DMif5B4EJGp12uKcqsoo7Dshz5m1L4p5v+2PE35L
         hZNX5xHLhD9+zBU4u02MVz6/cNj/5+7Z3lvdHUCHWWav4RHAKMsjDO0XMIbdmI6mrz7A
         ebWyCODAZIAXtJ10f6vmSFPD57KXrFtjWwRs+IYAnMf7uNXNgZ4nlWDI6wc37GEyu072
         aU8/29fp+l4ILzlc09S8+J+tFz6MXOLN6Xd/EfDsINogFGL422sOw4r3LQi5D+2rvzVF
         0gnA==
X-Gm-Message-State: AFuF++n/I+3wDjZs0e5yISsJVXpJTeApJfhc5iO9GeWPtrFVpuWkMOBk
	ZubvSxkgu8P3o/bbxYLq1siiLevZpbEYN08drrTypKVTwgXZVKMdTz7Q8Vk9AS2n9GmbpNe1Tla
	V1EMeXkO5m4iaRQZKzsdY9tmFDN/gwcU7vOFYxmPtxg==
X-Gm-Gg: AYBFou2ZOXy8grM1SZb1Mw0MPWYqkbo0sd9FZfXYpVE4KqIOiAdSyWyi0nIKHUhnt6V
	CaaZMFiLb0we+xAfkASJSM6L+wHy6lZD7zi0pJMp6Moz1jLpFs/JLYJuohsLLoO3lhznYLny8iI
	yG5jjMbAdmvvyMlkRAA9K0STu21/KDyZ8YEG6WZ/d+fCeXyCpdSiXSR0QGKiaunSZSyJfWa1Jvq
	kXDZFvvY2Asn5P/BC0fRZ6kQ3KLPPMolqvbN/HADTbx/QVYjPCgCgLAQYbQcMgqmIxOI06O6SV5
	dsPI2Vc53fxNDYB1vxNDc8Bb1RM1zQW37fY5tREY6D/fnFaCmJ8GRG6Ljr2aa4N6MnnnmcP+SVC
	0g89m6mlTgZ1/tQ==
X-Received: by 2002:a17:906:4795:b0:c20:f6d9:d8c7 with SMTP id
 a640c23a62f3a-c25d55ebe06mr114377566b.24.1788334331831; Wed, 02 Sep 2026
 00:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260814101941.873295-1-vanusuri@mvista.com> <20260814101941.873295-3-vanusuri@mvista.com>
 <DL4LVZ66P1HD.10FI9J12FE2L0@smile.fr>
In-Reply-To: <DL4LVZ66P1HD.10FI9J12FE2L0@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Wed, 2 Sep 2026 13:01:59 +0530
X-Gm-Features: AcwNN1VqTIoOm8_BDcxoKnGGzpAv5perX1P-80Z9j382uXC5I6vmV6Hbtl5rNBQ
Message-ID: <CANQUz1_GWaKEy-e96Lzy6KeV8yJZBi5Jon7SE4GQnHy+FSUV-A@mail.gmail.com>
Subject: Re: [OE-core][wrynose][patch 3/3] p11-kit: upgrade 0.26.4 -> 0.26.5
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, 
	Jaipaul Cheernam <jaipaul.cheernam@est.tech>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000096bbe7065a7b08bb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 07:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244898

--00000000000096bbe7065a7b08bb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure. I'll fix SRCREV assignments & send V2.

Thanks & Regards,
Vijay



On Wed, Sep 2, 2026 at 11:41=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr=
> wrote:

> On Fri Aug 14, 2026 at 12:19 PM CEST, Vijay Anusuri via
> lists.openembedded.org wrote:
> > From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> >
> > ChangeLog: https://github.com/p11-glue/p11-kit/releases/tag/0.26.5
> >
> > 0.26.5 (stable)
> > * rpc: guard against overflow when decoding nested attributes
> (CVE-2026-18938) [PR#777]
> >
> > Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 21a2c91ccca5257ede8994d30460b0dcda617c3a)
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  .../p11-kit/{p11-kit_0.26.4.bb =3D> p11-kit_0.26.5.bb}            | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-support/p11-kit/{p11-kit_0.26.4.bb =3D>
> p11-kit_0.26.5.bb} (98%)
> >
> > diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
> b/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
> > similarity index 98%
> > rename from meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
> > rename to meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
> > index 9219e9eefc..8229cf96c9 100644
> > --- a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
> > +++ b/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
> > @@ -14,7 +14,7 @@ SRC_URI =3D "gitsm://
> github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=3Dhttps;tag=3D
> >             "
> >  SRCREV =3D "8e6e4e6d64d9fe91c62b0052c105b2b72d4c24ef"
> >  SRC_URI =3D "gitsm://
> github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=3Dhttps;tag=3D${PV}
> <http://github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=3Dhttps;tag=
=3D$%7BPV%7D>
> "
> > -SRCREV =3D "a14788849d1ef44422d679534a13821eab5bb5f4"
> > +SRCREV =3D "120050e353e8f43d7c40bbcc047f667f903f4de5"
>
> Hello,
>
> It did not happened in this patch but some thing is wrong here: we have
> 2 SRCREV assignments.
>
> Can you send a v2 with that fixed and rebase it on top of latest
> wrynose?
> Be aware that "p11-kit: upgrade 0.26.2 -> 0.26.4" should merge soon
> (currently in wrynose-next).
>
> Regards,
> --
> Yoann Congal
> Smile ECS
>
>

--00000000000096bbe7065a7b08bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Sure. I&#39;ll fix SRCREV assignments &amp; send=
 V2.=C2=A0<br><br></div>Thanks &amp;=C2=A0Regards,<br></div>Vijay<div><br><=
br></div></div><br><div class=3D"gmail_quote gmail_quote_container"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, Sep 2, 2026 at 11:41=E2=80=AFAM Yoan=
n Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Fri Aug 14, 2026 at 12:19 PM CEST, Vijay Anusuri via <a href=3D"http://l=
ists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembed=
ded.org</a> wrote:<br>
&gt; From: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
&gt;<br>
&gt; ChangeLog: <a href=3D"https://github.com/p11-glue/p11-kit/releases/tag=
/0.26.5" rel=3D"noreferrer" target=3D"_blank">https://github.com/p11-glue/p=
11-kit/releases/tag/0.26.5</a><br>
&gt;<br>
&gt; 0.26.5 (stable)<br>
&gt; * rpc: guard against overflow when decoding nested attributes (CVE-202=
6-18938) [PR#777]<br>
&gt;<br>
&gt; Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt; (cherry picked from commit 21a2c91ccca5257ede8994d30460b0dcda617c3a)<b=
r>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../p11-kit/{<a href=3D"http://p11-kit_0.26.4.bb" rel=3D"norefer=
rer" target=3D"_blank">p11-kit_0.26.4.bb</a> =3D&gt; <a href=3D"http://p11-=
kit_0.26.5.bb" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.26.5.bb</a>}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 rename meta/recipes-support/p11-kit/{<a href=3D"http://p11-kit_0=
.26.4.bb" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.26.4.bb</a> =3D&gt=
; <a href=3D"http://p11-kit_0.26.5.bb" rel=3D"noreferrer" target=3D"_blank"=
>p11-kit_0.26.5.bb</a>} (98%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.=
26.4.bb" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.26.4.bb</a> b/meta/=
recipes-support/p11-kit/<a href=3D"http://p11-kit_0.26.5.bb" rel=3D"norefer=
rer" target=3D"_blank">p11-kit_0.26.5.bb</a><br>
&gt; similarity index 98%<br>
&gt; rename from meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.2=
6.4.bb" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.26.4.bb</a><br>
&gt; rename to meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.26.=
5.bb" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.26.5.bb</a><br>
&gt; index 9219e9eefc..8229cf96c9 100644<br>
&gt; --- a/meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.26.4.bb=
" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.26.4.bb</a><br>
&gt; +++ b/meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.26.5.bb=
" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.26.5.bb</a><br>
&gt; @@ -14,7 +14,7 @@ SRC_URI =3D &quot;gitsm://<a href=3D"http://github.c=
om/p11-glue/p11-kit;branch=3Dmaster;protocol=3Dhttps;tag=3D" rel=3D"norefer=
rer" target=3D"_blank">github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=
=3Dhttps;tag=3D</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRCREV =3D &quot;8e6e4e6d64d9fe91c62b0052c105b2b72d4c24ef&quot;<=
br>
&gt;=C2=A0 SRC_URI =3D &quot;gitsm://<a href=3D"http://github.com/p11-glue/=
p11-kit;branch=3Dmaster;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferrer=
" target=3D"_blank">github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=3D=
https;tag=3D${PV}</a>&quot;<br>
&gt; -SRCREV =3D &quot;a14788849d1ef44422d679534a13821eab5bb5f4&quot;<br>
&gt; +SRCREV =3D &quot;120050e353e8f43d7c40bbcc047f667f903f4de5&quot;<br>
<br>
Hello,<br>
<br>
It did not happened in this patch but some thing is wrong here: we have<br>
2 SRCREV assignments.<br>
<br>
Can you send a v2 with that fixed and rebase it on top of latest<br>
wrynose?<br>
Be aware that &quot;p11-kit: upgrade 0.26.2 -&gt; 0.26.4&quot; should merge=
 soon<br>
(currently in wrynose-next).<br>
<br>
Regards,<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--00000000000096bbe7065a7b08bb--

