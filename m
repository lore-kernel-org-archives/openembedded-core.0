Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7971CC61DC4
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 16:50:04 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17092.1787762999062372050
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 09:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jyDnzjWc;
 spf=pass (domain: mvista.com, ip: 209.85.218.50, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2530cabcf4so76282666b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 09:49:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787762997; cv=none;
        d=google.com; s=arc-20260327;
        b=WwHEp30En+DgP85f4e6FvFtGghE1xVVAZ2p6Z7JwCXxtgVjrT1LadnxyIORq1T4JFq
         HdxO5NEZfFaiEcDigSIa3SiKVRLe3Mwc7iQKQsD20GaYVj6pEcGVcgwQWyA4h1BZW9ae
         qVr6NueKSPhLf/ZuiIJx9T95icEo8WtNr8kC3crxL7B9uWgCE801xyijrkRDkuVbX29i
         bqtcCUIgueqaC1lOonjGEDv4pDuJ2AVL2efUQmGreOCRhUrDEWaij2Y3/qILk/rT+T8p
         j2t18m8gC/n8Gcu9ocf+w89O+xAoTjoc/q+glp1b9mG0fPB74RnydrW5AlUvs/dAlHKG
         DvXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WFKhOrhD/a0MhbHbuqAXl2qPsB5r9WcA2EpIigE62WU=;
        fh=GHvkvuDq1dzEkTgh1+82oK11fSs11JFWdMos3uPvYu4=;
        b=AbA8bWmDzUbJ8nOryFxMwKqV3org1jJL/RibFxig64YiAZkDGe7d2DTMlqH01FacId
         /WN0soklYUabNCfVwEDlr+bVX4nbm5ptKsXIPfF/d9YxlZ2Tm4bY3uAl9Y/GIG909IzR
         WjO4ofCniEXZtl/YHlRmD0zwmSniQ710xismwOZt55nM/Fwg2nYU4h3pVZ40ofRPOi8p
         ky2B4/RxotTSDgzLwAS6iaw5IaA20ZuRHElrq7/agbFbEdr/VBIQrAdNVfszVSvmIbXY
         T4+T2QLuq99eau/znYar6VPIsp352nvMU8Lo1ojh5joRLBsRBXDKCjBk+yeHE2S1ODzy
         2iKQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787762997; x=1788367797; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFKhOrhD/a0MhbHbuqAXl2qPsB5r9WcA2EpIigE62WU=;
        b=jyDnzjWcRAfM3gquhcYmtFJXqnc9H6rI4N5m8lzeJTl6u+Ve8gvKxxh4GWBcDzliKb
         yYxVnXt+Du8fT/GKKEPI9RUkz7s6/Z3qUYPBObOE3+5vTlswm+Reo3RX1k5sDiLSuEFz
         /KSLgcBfSB7JjrZSm469ml4UkRFWTpJlHCR5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762997; x=1788367797;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WFKhOrhD/a0MhbHbuqAXl2qPsB5r9WcA2EpIigE62WU=;
        b=IXO5F1uCQa3QmF8DH9nJU+Ta//b+cadvf1gUPDduHw57lTT0jX4/Tl6kVJbnWHskFf
         gTOFfK9/6FkKK0XktX7oXGdQ0jHKa15nKBNGZycY803yR2B0+bZyUhpH0ju3zqeosGj3
         aN9zm/151mGAXvYys95zOWmhqPsLWiCBC7Ya5YqzOrVs1/gyMahY2Hrpi2Hc3dg9Gkhn
         KsETlswu3O+550r6WeD9I908Wqg+M8iARijM34wF+mOfyj8qZJmvhcJgaBDS3maA0qHL
         hZ4lAldRsRkr+Y/L12LhXbLX3szKItiesrcI7JkzmNFjx4Ljn2XMZ3zOCFulqH8FCNXD
         soHQ==
X-Gm-Message-State: AFuF++nKfhHfdLeHgeIe4ZQF2slzBWaXxQt4da6weo57TAR9CABDdTld
	XxJAvi46Wf4hPN5/gwcEcboIipJyu+szMDBHUpUrlssfa4ip8SH9YAVdodza90aaD+TEhr/T/0d
	zXEgSOfRSe1FSufsH/qeqi2/Zo+4QA8+tcfAlGDaWkQ==
X-Gm-Gg: AR+sD12lCgzuWjRSiOBUEK3QQG5oi+kuKJ15CAIytgDE9g1+4mc+6f81tH1/q96ysXd
	kE2DQY7Q0EoRofl51WnGPWGR5Y5A2MffBcDJneZ0VJUJGeDCQguyQwG/A2lDcIG/n7ebIZr6H6w
	KwncYb/H+rdMTzzlvEND02nWRgUYOUS6wVLKUp5cKsSbKlshyaRAVvLtGsQjKAd2NF7iEMlVT8z
	811IgWsFLO8vNteh337y0bMZ4+133CrsnT0aeBfBok1WtlhM3fkM64MBEKhQGpadqbw8KxuXEXx
	YDlIsjv8mXBBKSxEGSYGbrsn+DtJN7Z630qmy1Fe/FXk+Cst7gzorSdJrPGUzAi06rUPgxkwDMX
	uWFYlt/KsHeLKVQ==
X-Received: by 2002:a17:907:944e:b0:c24:f8e0:f092 with SMTP id
 a640c23a62f3a-c250bac7f88mr900128366b.1.1787762997081; Wed, 26 Aug 2026
 09:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260814101941.873295-1-vanusuri@mvista.com> <20260814101941.873295-3-vanusuri@mvista.com>
 <CANQUz19Omf0=PS3QMYQBHwuvwZu2QXGTcBnXKh9aHq1c=vPCSg@mail.gmail.com> <DKZ111A76XZ1.1W1MDCFR6JXMH@smile.fr>
In-Reply-To: <DKZ111A76XZ1.1W1MDCFR6JXMH@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Wed, 26 Aug 2026 22:19:44 +0530
X-Gm-Features: AcwNN1X-Xdi9t2Np8487dVkQGTBS6zR2obis2CcjU8I-4N-4oQzaVgm9YsucGqU
Message-ID: <CANQUz1_YB8Bnt8+aQJg5G55kVDCNxsp9vLN+VMs_xTSQCbm8mw@mail.gmail.com>
Subject: Re: [OE-core][wrynose][patch 3/3] p11-kit: upgrade 0.26.4 -> 0.26.5
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, 
	Jaipaul Cheernam <jaipaul.cheernam@est.tech>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000006257460659f60296"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 16:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244408

--0000000000006257460659f60296
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for the clarification.

Understood. I'll wait for the next review series. Thanks for taking care of
it, and I appreciate your time and effort.

Thanks & Regards,

Vijay


On Wed, Aug 26, 2026 at 10:17=E2=80=AFPM Yoann Congal <yoann.congal@smile.f=
r> wrote:

> On Wed Aug 26, 2026 at 6:26 PM CEST, Vijay Anusuri wrote:
> > Hi Yoann,
> >
> > I couldn't find this patch in the wrynose-nut branch, while the other t=
wo
> > patches in the series are available.
> >
> > Could you please check if this patch was missed during the merge?
>
> Hello,
>
> What you saw is part of the series from Peter Marko that does not have
> the 0.26.4 -> .5 upgrade.
>
> I'll review my current -nut branch first to send a review series. Then
> I'll add your "[wrynose][patch 3/3] p11-kit: upgrade 0.26.4 -> 0.26.5"
> in the next series.
>
> The queue is ~160 patches long right now, I can't take all of this in
> one go.
>
> Thanks for your attention and patience.
>
> Regards,
>
> >
> >
> > Thanks & Regards,
> > Vijay
> >
> >
> > On Fri, Aug 14, 2026 at 3:50=E2=80=AFPM Vijay Anusuri <vanusuri@mvista.=
com>
> wrote:
> >
> >> From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> >>
> >> ChangeLog: https://github.com/p11-glue/p11-kit/releases/tag/0.26.5
> >>
> >> 0.26.5 (stable)
> >> * rpc: guard against overflow when decoding nested attributes
> >> (CVE-2026-18938) [PR#777]
> >>
> >> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> (cherry picked from commit 21a2c91ccca5257ede8994d30460b0dcda617c3a)
> >> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >> ---
> >>  .../p11-kit/{p11-kit_0.26.4.bb =3D> p11-kit_0.26.5.bb}            | 2=
 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>  rename meta/recipes-support/p11-kit/{p11-kit_0.26.4.bb =3D>
> >> p11-kit_0.26.5.bb} (98%)
> >>
> >> diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
> >> b/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
> >> similarity index 98%
> >> rename from meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
> >> rename to meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
> >> index 9219e9eefc..8229cf96c9 100644
> >> --- a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
> >> +++ b/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
> >> @@ -14,7 +14,7 @@ SRC_URI =3D "gitsm://
> >> github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=3Dhttps;tag=3D
> >>             "
> >>  SRCREV =3D "8e6e4e6d64d9fe91c62b0052c105b2b72d4c24ef"
> >>  SRC_URI =3D "gitsm://
> >> github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=3Dhttps;tag=3D${P=
V}
> <http://github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=3Dhttps;tag=
=3D$%7BPV%7D>
> >> <
> http://github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=3Dhttps;tag=
=3D$%7BPV%7D
> >
> >> "
> >> -SRCREV =3D "a14788849d1ef44422d679534a13821eab5bb5f4"
> >> +SRCREV =3D "120050e353e8f43d7c40bbcc047f667f903f4de5"
> >>
> >>  PACKAGECONFIG ??=3D ""
> >>  PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,libxslt-nativ=
e"
> >> --
> >> 2.43.0
> >>
> >>
>
>
> --
> Yoann Congal
> Smile ECS
>
>

--0000000000006257460659f60296
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Yoann,<br><br><p class=3D"gmail-isSelectedEnd"><sp=
an>Thanks for the clarification.</span></p><p><span>Understood. I&#39;ll wa=
it for the next review series. Thanks for taking care of it, and I apprecia=
te your time and effort.<br><br></span></p><p><span>Thanks &amp;=C2=A0Regar=
ds,<br></span></p><p><span>Vijay</span></p><br></div><br><div class=3D"gmai=
l_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed=
, Aug 26, 2026 at 10:17=E2=80=AFPM Yoann Congal &lt;<a href=3D"mailto:yoann=
.congal@smile.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Wed Aug 26, 2026 at 6:26 PM CEST,=
 Vijay Anusuri wrote:<br>
&gt; Hi Yoann,<br>
&gt;<br>
&gt; I couldn&#39;t find this patch in the wrynose-nut branch, while the ot=
her two<br>
&gt; patches in the series are available.<br>
&gt;<br>
&gt; Could you please check if this patch was missed during the merge?<br>
<br>
Hello,<br>
<br>
What you saw is part of the series from Peter Marko that does not have<br>
the 0.26.4 -&gt; .5 upgrade.<br>
<br>
I&#39;ll review my current -nut branch first to send a review series. Then<=
br>
I&#39;ll add your &quot;[wrynose][patch 3/3] p11-kit: upgrade 0.26.4 -&gt; =
0.26.5&quot;<br>
in the next series.<br>
<br>
The queue is ~160 patches long right now, I can&#39;t take all of this in<b=
r>
one go.<br>
<br>
Thanks for your attention and patience.<br>
<br>
Regards,<br>
<br>
&gt;<br>
&gt;<br>
&gt; Thanks &amp; Regards,<br>
&gt; Vijay<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Aug 14, 2026 at 3:50=E2=80=AFPM Vijay Anusuri &lt;<a href=3D"m=
ailto:vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt;&gt; From: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
&gt;&gt;<br>
&gt;&gt; ChangeLog: <a href=3D"https://github.com/p11-glue/p11-kit/releases=
/tag/0.26.5" rel=3D"noreferrer" target=3D"_blank">https://github.com/p11-gl=
ue/p11-kit/releases/tag/0.26.5</a><br>
&gt;&gt;<br>
&gt;&gt; 0.26.5 (stable)<br>
&gt;&gt; * rpc: guard against overflow when decoding nested attributes<br>
&gt;&gt; (CVE-2026-18938) [PR#777]<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<=
br>
&gt;&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie=
@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org<=
/a>&gt;<br>
&gt;&gt; (cherry picked from commit 21a2c91ccca5257ede8994d30460b0dcda617c3=
a)<br>
&gt;&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista=
.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../p11-kit/{<a href=3D"http://p11-kit_0.26.4.bb" rel=3D"nor=
eferrer" target=3D"_blank">p11-kit_0.26.4.bb</a> =3D&gt; <a href=3D"http://=
p11-kit_0.26.5.bb" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.26.5.bb</=
a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;=C2=A0 rename meta/recipes-support/p11-kit/{<a href=3D"http://p11-k=
it_0.26.4.bb" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.26.4.bb</a> =
=3D&gt;<br>
&gt;&gt; <a href=3D"http://p11-kit_0.26.5.bb" rel=3D"noreferrer" target=3D"=
_blank">p11-kit_0.26.5.bb</a>} (98%)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-support/p11-kit/<a href=3D"http://p11-ki=
t_0.26.4.bb" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.26.4.bb</a><br>
&gt;&gt; b/meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.26.5.bb=
" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.26.5.bb</a><br>
&gt;&gt; similarity index 98%<br>
&gt;&gt; rename from meta/recipes-support/p11-kit/<a href=3D"http://p11-kit=
_0.26.4.bb" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.26.4.bb</a><br>
&gt;&gt; rename to meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0=
.26.5.bb" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.26.5.bb</a><br>
&gt;&gt; index 9219e9eefc..8229cf96c9 100644<br>
&gt;&gt; --- a/meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.26.=
4.bb" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.26.4.bb</a><br>
&gt;&gt; +++ b/meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.26.=
5.bb" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.26.5.bb</a><br>
&gt;&gt; @@ -14,7 +14,7 @@ SRC_URI =3D &quot;gitsm://<br>
&gt;&gt; <a href=3D"http://github.com/p11-glue/p11-kit;branch=3Dmaster;prot=
ocol=3Dhttps;tag=3D" rel=3D"noreferrer" target=3D"_blank">github.com/p11-gl=
ue/p11-kit;branch=3Dmaster;protocol=3Dhttps;tag=3D</a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt;=C2=A0 SRCREV =3D &quot;8e6e4e6d64d9fe91c62b0052c105b2b72d4c24ef&qu=
ot;<br>
&gt;&gt;=C2=A0 SRC_URI =3D &quot;gitsm://<br>
&gt;&gt; <a href=3D"http://github.com/p11-glue/p11-kit;branch=3Dmaster;prot=
ocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferrer" target=3D"_blank">github.c=
om/p11-glue/p11-kit;branch=3Dmaster;protocol=3Dhttps;tag=3D${PV}</a><br>
&gt;&gt; &lt;<a href=3D"http://github.com/p11-glue/p11-kit;branch=3Dmaster;=
protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferrer" target=3D"_blank">http=
://github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=3Dhttps;tag=3D$%7BP=
V%7D</a>&gt;<br>
&gt;&gt; &quot;<br>
&gt;&gt; -SRCREV =3D &quot;a14788849d1ef44422d679534a13821eab5bb5f4&quot;<b=
r>
&gt;&gt; +SRCREV =3D &quot;120050e353e8f43d7c40bbcc047f667f903f4de5&quot;<b=
r>
&gt;&gt;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG ??=3D &quot;&quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[manpages] =3D &quot;-Dman=3Dtrue,-Dman=3Dfalse=
,libxslt-native&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.43.0<br>
&gt;&gt;<br>
&gt;&gt;<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--0000000000006257460659f60296--

