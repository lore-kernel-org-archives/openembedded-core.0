Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 914FBCAC5B0
	for <webhook@archiver.kernel.org>; Sat,  4 Oct 2025 11:45:36 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.7463.1759578332089919789
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Oct 2025 04:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KbohGNjD;
 spf=pass (domain: mvista.com, ip: 209.85.218.46, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3c2c748bc8so455677666b.2
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Oct 2025 04:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1759578330; x=1760183130; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=668gRVh99ILghz+TBvfPVQ7eeECN2WEtDuCnMhWNKV8=;
        b=KbohGNjDsJJ2ghnBQvCZNmPRWaYzcBNEQVpIKAbtUzKC1s2r8cW8enGZIrnXZnVED8
         QluFYl1V3bhrwJYNGEoOpxMLXZF58s00fJ5DWL36qOyPdPfi7oQBM+l8LSImGREYf25f
         jQM5QqbAyjtvc/JPgSDzvvCsTviQpZkHEhW48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759578330; x=1760183130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=668gRVh99ILghz+TBvfPVQ7eeECN2WEtDuCnMhWNKV8=;
        b=CCUqYkcnt/bKftdfZLlgPF4zlijaQJjdkSWfomedVU8KJMwjadQ5jRz+S1uNeIwVrI
         leMrKUPv7vhSV4F8LDJ8YqBYhNerYE9NN5J5FB+1hpGlB+rGXbFQj+sSPohYV4/IKoxI
         vzkwogCctLLhflNOACKLUuC8i9wlhtu0fTBpX8xwS3A0tAdh8HeChEOQ/YLdpW+EI5Qh
         M0UBtzCUzPnqTX0ppXgsF2gwW8igp4V+u76WiWKUsVUUQEu9tGANVaUjzDPux7yYQZnq
         RnTGa7gjq8AbDqqB+UtLNzgE0DgCldSzWc4TXREM3tdey+b+kS18rlKf3jqMnIzGwxfJ
         ztYw==
X-Gm-Message-State: AOJu0Yx4R8J4S6MEWw5DQIG+kslutpQTejzE1jYoSThDcPD2R3YYMAhH
	kGgOWqssYoPHTVtr+zAztQsNcJUYlReqCXx+kIvG0FCc3h6Tp8GLvofmdZmLqsvKG9ojABnZtYf
	5Po8Mp/Ela+uw0FcR5BbufzDZW1EtZOuf7Cj/eaxdEw==
X-Gm-Gg: ASbGncvXnErHhzB8D/6AzjgifsRyGS4V8mS7mcrUIZcjozso04OnV1MolkC8BbLps7P
	QHkaER4cq2dZAijGnlvdqzBRzW6/fA47+t0nRzFUQni8K4K2CeGDEEUZe9lvtwsBaPlYRnjurVI
	0xNJlqnUCIuz5A2sLmVmHw2Cb4ZCsc4Rb6k2xLVpKgsBPmNL4wQ/ivGAOX4A+w0PAHh5OM60fcj
	f7jxbLHx+HwECumqpoP4ZvVRzN5jkCRWI+yo98ikonmPyJkQBmxmBAQekgAya4J97lUiX083Ow=
X-Google-Smtp-Source: AGHT+IEi7VMEp2TR4EqAV8dkZhiEvx2U8hFbIALm8UzwA3etJFlrMJykZojMmoChDDelCe11HXj4QfbWIvlEqZDd1Hs=
X-Received: by 2002:a17:907:944a:b0:b3c:a161:684c with SMTP id
 a640c23a62f3a-b49c1d648e2mr797310166b.2.1759578330308; Sat, 04 Oct 2025
 04:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250930153901.246829-1-vanusuri@mvista.com> <27936.1759509736171972567@lists.openembedded.org>
In-Reply-To: <27936.1759509736171972567@lists.openembedded.org>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Sat, 4 Oct 2025 17:15:18 +0530
X-Gm-Features: AS18NWB1XDJ-CXiLZ90lKEnzMioOvxyX0ALkyyBg2mZu_CzlvNfFYZ-1E2drViU
Message-ID: <CANQUz18Dx=UrDGspKWcLerrOrH_TfSORgkdJuRyohsQhPzWBcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] ghostscript: upgrade 10.05.1 -> 10.06.0
To: reatmon@ti.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000553795064053c1aa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Oct 2025 11:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224428

--000000000000553795064053c1aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ryan,

Could you please provide the steps to reproduce this 32-bit build failure
or details on your specific configuration?

Thanks,
Vijay


On Fri, Oct 3, 2025 at 10:12=E2=80=AFPM Ryan Eatmon via lists.openembedded.=
org
<reatmon=3Dti.com@lists.openembedded.org> wrote:

> This was accepted onto master, and we are seeing different a different
> 32bit build failure:
> ./brotli/c/dec/decode.c: In function 'PreloadSymbol':
> ./brotli/c/dec/huffman.h:83:47: error: ISO C90 forbids mixed declarations
> and code [-Werror=3Ddeclaration-after-statement]
>    83 | #define BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD(H) uint32_t
> __fastload_##H =3D (*H)
>       |                                               ^~~~~~~~
> ./brotli/c/dec/decode.c:440:3: note: in expansion of macro
> 'BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD'
>   440 |   BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD(table);
>       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224400):
> https://lists.openembedded.org/g/openembedded-core/message/224400
> Mute This Topic: https://lists.openembedded.org/mt/115516062/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000553795064053c1aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Ryan,</div><div><br></div><div>Could you please pr=
ovide the steps to reproduce this 32-bit build failure or details on your s=
pecific configuration?</div><div><br></div><div>Thanks,</div><div>Vijay</di=
v><br></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Oct 3, 2025 at 10:12=E2=80=AFPM Ryan =
Eatmon via <a href=3D"http://lists.openembedded.org">lists.openembedded.org=
</a> &lt;reatmon=3D<a href=3D"mailto:ti.com@lists.openembedded.org">ti.com@=
lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div>
<div>This was accepted onto master, and we are seeing different a different=
 32bit build failure:</div>
<div>./brotli/c/dec/decode.c: In function &#39;PreloadSymbol&#39;:<br>./bro=
tli/c/dec/huffman.h:83:47: error: ISO C90 forbids mixed declarations and co=
de [-Werror=3Ddeclaration-after-statement]<br>=C2=A0 =C2=A083 | #define BRO=
TLI_HC_MARK_TABLE_FOR_FAST_LOAD(H) uint32_t __fastload_##H =3D (*H)<br>=C2=
=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~<br>./brotli/c/dec/decode.c:440:3: =
note: in expansion of macro &#39;BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD&#39;<br=
>=C2=A0 440 | =C2=A0 BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD(table);<br>=C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</div>
<div>=C2=A0</div>
</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#224400): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/224400" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/224400</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115516062/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115516062/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" targe=
t=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000553795064053c1aa--

