Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EBFC5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 16:26:22 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16596.1787761577571204965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 09:26:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=bXJlYzVk;
 spf=pass (domain: mvista.com, ip: 209.85.218.45, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c169ae1cb26so13833966b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 09:26:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787761576; cv=none;
        d=google.com; s=arc-20260327;
        b=DNpeM4d6etAfKMut6J5EEpnhWjG/4hCo0fquJoK7UtIH/z1GREwTdPNbiRmScyVY5K
         iPr7DY0g69S/wHHXTQg7dQtIt1zjR4HDUw+MjcJXWGBML7/Q9SMid577rdziW6c7oL4A
         ublEE/oj+z3c34rLW0oo8lUYAQEyemD9RmxY3mYc9Pg3L7aXpU/U4uxyAiss5RG11VdH
         /o7EdZoL/QU02jIlrTkX0ObqcbAQSRwREZvw8Is99gsBF7Lds1/nzfC/5sTmgDJ6bP0w
         b9aSefzolDDUycdL0JcqE6BE9syW01PsbnlRoOfAREe4WlbakdmGMC0aYKriEatq3Ztt
         Lp/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vy1oO4FKOzhESqMxgR8WsKyP9S7euUqq4JM3zukm+A0=;
        fh=bDTlH9moX0+2IlKgTQzwucIPO61AFGxJ7i/RtJtsCXY=;
        b=FscHdn3FRglnuhjuqLSWHVJlB11SSO/vf2ntPDHextZKelvDNENO8YxFHgS49aSHBg
         7blIZKCa0Ki8NW3w6edIjMhOaYDfCSwrN/RuWsclhliBwwUlim9NFCyZvqDIkhjxrf/r
         zmycpdvfy+4uxcwHJ4rHj4vzna8vRhqb0HVqcjMBv6u1EnlD+6aPXDO6yFDM+UoKjeO7
         wFe1w15y667lOZQr5RjTdPi08VyyJmSqOoKbZmD/k+CknKAbkkLsT9BtHpZgKV91oEo9
         PFG/NLIWzWkg+Hdf7PgDNfU78iAs0QNqbv3/dWOyF3Mjg5gIu2SbA5KzwGokZc6B8jG4
         qoJw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787761576; x=1788366376; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vy1oO4FKOzhESqMxgR8WsKyP9S7euUqq4JM3zukm+A0=;
        b=bXJlYzVk3GP8F5IV9zclni3sT1FCjS9hM1C0RLwuGOFmko1arn+cfsAClcys2x/Rdr
         2NUU2771BO7THDcD3YGeJ5zM3sDcOPy8JooKLkDz7rHzryM2ZH4VtZrrTtIA9srncZmZ
         NvzzxK+Isi5ooaG50UgW2ohdPVhMt0uHlv5aU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761576; x=1788366376;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vy1oO4FKOzhESqMxgR8WsKyP9S7euUqq4JM3zukm+A0=;
        b=BIueywpg+xIFm1L6M5IAN3Y22Mfmbtirvx/RxlDNhczE/Fh6fBi0YMQejBOAX22BkR
         hxRogiMa5QtEW32lGcHQyn8ob78GBB0n1ivYte1Nhg+Tvpy8OioYH/rf+tgTNSEyJaGy
         RLrp3JaId5wR50aW8/AivXY0ofpIwNRkh5ZfA259aqYbrxWq3r8bxQ2pmWVb9+2IXvYz
         yup2AfiH6MBy/O0s57bRviEvSSumznDHDQGrtIgXR52lcLC1cJJB5XW79PqyOGBM7rEf
         kxlQ2cCrk+Dsr7CcIMcBPZVLDSBuaYw7wCWHXTGey0mPwZ30/hMDAxRk0fLFhHQG2c8l
         gPNA==
X-Gm-Message-State: AFuF++nQaUXFyyNnslL4skBfqqCh3kIKanPiWEasJrxZiucn3tbLwYLf
	It9ikizANhnoaQhOOHqqKUcGWZ/UBQXNY0Na/UwIiRPjNmAWq7CSVeV1IdYnc/4q+V8wl8z6D1i
	8EPTwpj7nTn9At8ud9sW/I1L57UmOcAOyAMlSVBc3J6aQOMUqaCjgj1w=
X-Gm-Gg: AR+sD11Dz2G7BZJ+qMK4/Kj7EZsxz/Mle64SiiQcLNxBUskwn6NCJNDLHA9OAc7ahgH
	hlIFA+pB5Jz7frh2MUGaYz/4oGngjnf/tgA4tO0lalbuIKZ/N5+VMn/zy23QBKKatcrIufyJN3x
	FH5r8aCoBAG1mGfEk3IBASmxppRvofDXcN/JYJeD2LFQeIs5WfzZcXAVckMmmI3zmly7E0IXRC4
	BJgqNAHHZFT1T+sqkf/LHPaXMmj4VrEvJ3Eoea5rCKyPpp85C58VkFZpaexMnUXeN3WQf9Bwy5d
	U9LbZywJKv4JSmTeueAqEN46l4OlUkPL+L7t3jlhYk13ZTXTwgcpxDfXp+t8vjpIytz6v4NMDiX
	LYis=
X-Received: by 2002:a17:907:ea8b:b0:c12:3cbf:9f6d with SMTP id
 a640c23a62f3a-c2535dd6bd4mr45284566b.1.1787761574730; Wed, 26 Aug 2026
 09:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260814101941.873295-1-vanusuri@mvista.com> <20260814101941.873295-3-vanusuri@mvista.com>
In-Reply-To: <20260814101941.873295-3-vanusuri@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Wed, 26 Aug 2026 21:56:02 +0530
X-Gm-Features: AcwNN1XPT-yTQmIBN56weDqQVmqV9U5ox4fdfP5YcHpCCpXsZ5E1HL8nbBvmIQg
Message-ID: <CANQUz19Omf0=PS3QMYQBHwuvwZu2QXGTcBnXKh9aHq1c=vPCSg@mail.gmail.com>
Subject: Re: [OE-core][wrynose][patch 3/3] p11-kit: upgrade 0.26.4 -> 0.26.5
To: openembedded-core@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Cc: Jaipaul Cheernam <jaipaul.cheernam@est.tech>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000009af3450659f5ad65"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 16:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244406

--0000000000009af3450659f5ad65
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

I couldn't find this patch in the wrynose-nut branch, while the other two
patches in the series are available.

Could you please check if this patch was missed during the merge?


Thanks & Regards,
Vijay


On Fri, Aug 14, 2026 at 3:50=E2=80=AFPM Vijay Anusuri <vanusuri@mvista.com>=
 wrote:

> From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
>
> ChangeLog: https://github.com/p11-glue/p11-kit/releases/tag/0.26.5
>
> 0.26.5 (stable)
> * rpc: guard against overflow when decoding nested attributes
> (CVE-2026-18938) [PR#777]
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 21a2c91ccca5257ede8994d30460b0dcda617c3a)
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../p11-kit/{p11-kit_0.26.4.bb =3D> p11-kit_0.26.5.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/p11-kit/{p11-kit_0.26.4.bb =3D>
> p11-kit_0.26.5.bb} (98%)
>
> diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
> b/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
> similarity index 98%
> rename from meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
> rename to meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
> index 9219e9eefc..8229cf96c9 100644
> --- a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
> +++ b/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
> @@ -14,7 +14,7 @@ SRC_URI =3D "gitsm://
> github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=3Dhttps;tag=3D
>             "
>  SRCREV =3D "8e6e4e6d64d9fe91c62b0052c105b2b72d4c24ef"
>  SRC_URI =3D "gitsm://
> github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=3Dhttps;tag=3D${PV}
> <http://github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=3Dhttps;tag=
=3D$%7BPV%7D>
> "
> -SRCREV =3D "a14788849d1ef44422d679534a13821eab5bb5f4"
> +SRCREV =3D "120050e353e8f43d7c40bbcc047f667f903f4de5"
>
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse,libxslt-native"
> --
> 2.43.0
>
>

--0000000000009af3450659f5ad65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"gmail-PDq2pG_selectionAnchorContainer">Hi Yoan=
n,<span aria-hidden=3D"true" class=3D"gmail-PDq2pG_selectionAnchor"></span>=
</p>
<p>I couldn&#39;t find this patch in the wrynose-nut branch, while the othe=
r two patches in the series are available.</p>
<p>Could you please check if this patch was missed during the merge?</p>
<p><br></p><p>Thanks &amp; Regards,<br>
Vijay</p><br></div><br><div class=3D"gmail_quote gmail_quote_container"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 14, 2026 at 3:50=E2=80=AFPM =
Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com">vanusuri@mvista.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>From: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
<br>
ChangeLog: <a href=3D"https://github.com/p11-glue/p11-kit/releases/tag/0.26=
.5" rel=3D"noreferrer" target=3D"_blank">https://github.com/p11-glue/p11-ki=
t/releases/tag/0.26.5</a><br>
<br>
0.26.5 (stable)<br>
* rpc: guard against overflow when decoding nested attributes (CVE-2026-189=
38) [PR#777]<br>
<br>
Signed-off-by: Jaipaul Cheernam &lt;jaipaul.cheernam@est.tech&gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
(cherry picked from commit 21a2c91ccca5257ede8994d30460b0dcda617c3a)<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../p11-kit/{<a href=3D"http://p11-kit_0.26.4.bb" rel=3D"noreferrer" =
target=3D"_blank">p11-kit_0.26.4.bb</a> =3D&gt; <a href=3D"http://p11-kit_0=
.26.5.bb" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.26.5.bb</a>}=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-support/p11-kit/{<a href=3D"http://p11-kit_0.26.4=
.bb" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.26.4.bb</a> =3D&gt; <a =
href=3D"http://p11-kit_0.26.5.bb" rel=3D"noreferrer" target=3D"_blank">p11-=
kit_0.26.5.bb</a>} (98%)<br>
<br>
diff --git a/meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.26.4.=
bb" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.26.4.bb</a> b/meta/recip=
es-support/p11-kit/<a href=3D"http://p11-kit_0.26.5.bb" rel=3D"noreferrer" =
target=3D"_blank">p11-kit_0.26.5.bb</a><br>
similarity index 98%<br>
rename from meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.26.4.b=
b" rel=3D"noreferrer" target=3D"_blank">p11-kit_0.26.4.bb</a><br>
rename to meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.26.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">p11-kit_0.26.5.bb</a><br>
index 9219e9eefc..8229cf96c9 100644<br>
--- a/meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.26.4.bb" rel=
=3D"noreferrer" target=3D"_blank">p11-kit_0.26.4.bb</a><br>
+++ b/meta/recipes-support/p11-kit/<a href=3D"http://p11-kit_0.26.5.bb" rel=
=3D"noreferrer" target=3D"_blank">p11-kit_0.26.5.bb</a><br>
@@ -14,7 +14,7 @@ SRC_URI =3D &quot;gitsm://<a href=3D"http://github.com/p1=
1-glue/p11-kit;branch=3Dmaster;protocol=3Dhttps;tag=3D" rel=3D"noreferrer" =
target=3D"_blank">github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=3Dht=
tps;tag=3D</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRCREV =3D &quot;8e6e4e6d64d9fe91c62b0052c105b2b72d4c24ef&quot;<br>
=C2=A0SRC_URI =3D &quot;gitsm://<a href=3D"http://github.com/p11-glue/p11-k=
it;branch=3Dmaster;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/p11-glue/p11-kit;branch=3Dmaster;protocol=3Dhttps=
;tag=3D${PV}</a>&quot;<br>
-SRCREV =3D &quot;a14788849d1ef44422d679534a13821eab5bb5f4&quot;<br>
+SRCREV =3D &quot;120050e353e8f43d7c40bbcc047f667f903f4de5&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[manpages] =3D &quot;-Dman=3Dtrue,-Dman=3Dfalse,libxslt-=
native&quot;<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div>

--0000000000009af3450659f5ad65--

