Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B343FC982E1
	for <webhook@archiver.kernel.org>; Sun, 20 Sep 2026 01:27:54 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22610.1789867666948256981
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2026 18:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=n1plrdrK;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66c9995ca60so1640072d50.1
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 18:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789867666; cv=none;
        d=google.com; s=arc-20260327;
        b=PAxqJoLbtPp6FCLJJSWIS4XG2Hb8kHVNykU/y8L+3YkSuAl2jBCgIub52+1UHAbzg2
         ChisiedClpj8rwQA7yJCGAl41fpv13vtZSdaQXFWHjG8sSwXgua6B+YwfbZyFJLo2jyL
         5wLASJjRvRPIKmuTG7Dkw8qrTE7Z7RD166IVUxtTCDqsbh6ayj93hv8xYYenDmlkYPap
         tDF04mBdIOuRwrea/05dWZssd3uRclpI2ySRothppwikHvn/I7Zqu/FjpXAlq7QAs49I
         liDhlFzSV/MnzBATRU8N2th0Wn+8HtlaCrVXM7MJcZiQRp9q44BiZYmfxvpZTTPO4HA2
         Upxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x6vwqM+Fqtf9LsWe7Q4m6RvQQT5IcMN2Jx9be1Coi04=;
        fh=2tRbkh9USu5x3C+6pK/CbohOrqrZJdfRQMueNE2H0s4=;
        b=cLS45s38j7JuzaJQhPon2d2/EPCHWU86FiL7viydufY1kLULiP+Zfg3EOqg+iHloz4
         OyEbouOcHzX8cH27DlmdkdM3plw3cQlD9uNzabmVG1ZWSdWJ66tril6ls9XVVeMX6Dw8
         j7Kgz7HHBcpW3/ESzo67v1yP7VlG2Vg1DG1w5S49pAeZxoP2daCrEUgwsJOHdDdLjnes
         4MMlmqZQazjaEXXv/6foWS6G3+jxmHz7eYZ3nv0G/jbZIRDluRg7CrQ5JR8eF00ABh/M
         YN7hYxCZUiYdIF/9YpWwKLTX4roVBvqSh/c6S1NiwCl6C5ziBbKinVY4svSsYJXlQJK7
         Hz9w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789867666; x=1790472466; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6vwqM+Fqtf9LsWe7Q4m6RvQQT5IcMN2Jx9be1Coi04=;
        b=n1plrdrKpy49SWVAtgTof6t59octdzX7rwm//3fbwP4cTJOnZEdc32PBCNY6mv3jnL
         mZyun2yysLOk7dS6Y25Puk2nYkld5baBoDJvQ3ixtTai4TWgsZ3uVLtdkbn96mH2LqMR
         P/CsOBeVVyp9+OD1pzCx1nuF4w+sYSUGMPmNNv2cMyh4Gd/IQJb6v7rSSkxTBVvIrTha
         1Om/7tCtpLU5fbXuQRRx80dMXOAafQDUIb4+gp3VJk7OmtyJTUs6au9UmcFtILY9cCUc
         ft6t2BdSHvj0jHLqwHqTSgGhWRstmzbF5bPJSaKAqdTNGXHVUF3NV7X3rrL1i147OCrV
         Spbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789867666; x=1790472466;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x6vwqM+Fqtf9LsWe7Q4m6RvQQT5IcMN2Jx9be1Coi04=;
        b=1zgd28HyBchRvErWsz5OvhdIhjz2L/zQmyfBLeNukZI08IuWn+aPv5vpZRNmgujzdV
         tq4lipIpxEe11HpP0Et7xHGdglomGUlll4P66BO5pKA3+gunV7M2PA1JmnldE5csz67t
         cunLyf3CVi7uAFm63MCSYCRZxLex172arsWj4nDNUHnm6OcSjnU54zrC20JOKinocSZt
         L5QV26YmbGI72EH4rn+Vx/m1FAOhk1Bw3v8+x0qUewxkT+n0kany3Cv14Y1UzltLSk/d
         2XimsLLKRZE56EgsXd0G81AoUZX7lDf/tynIV4XQAuxPxPEs+JzC27m9QQndntHXtFtc
         GzDg==
X-Gm-Message-State: AFuF++lweOf9joxhHW3MRlUI0uta24wb5OpPeUQVc6lCwTiEz8nGD7cT
	j5aZOWqR68S0COTq3Sq+dRlslIwOnMsrh5oqVCkaNV3mQPGu/D+/adgYpxuyoIK9pXYxxOcWBS7
	cbOgS3M6iq1ufrGSL61fLgESxwrBQahyFfCnL
X-Gm-Gg: AYBFou0vr6j1LmXBDFOZmBQiM6q5kLUthoARkKDbLT6k1BARnTd9ZVpSN++Uu4unK8J
	9O15alVm5kgIHjk8/nU/kc0EN3KUvaj4SGXngveMDZXtwq186QMiQWbZku9X3arSBZfvFuoiZXQ
	m0ROyimLgMv8lMAt2/mnYuUU+Y/KUjBRIIjai//liyAy8tJFrVLTPScHbqyXkPL2nJLnk9EdL+i
	HCJRZFZC7xiRxmeF5usOCVjnJPuxX3BjOclJkR/mZO/SI1CV9Dm3Wp0Yia1ggyAJ4Ej90Fi4d3k
	cUi4lJKLv0fRbcJA4cpcN+e4vG1M79huYpWNEfq9M3FHI9+x/ApysaKZ87/hWugO57Z+FGY8l1T
	zfIHZGC0EKmFYQyiLT0sRx+SqosG9JhE9r1cKF9Au/GuktgkYmonR3T2FIiZhJxFf/UJ6OCYMAx
	T7ri0S2u0w845iSOeP12F90Z8CEVh0vNf/Dj5Fm6YaZFHK4V9oDcUXowgvXdj8KtmfTClpBpd5N
	6imlTm/C9fnrBwDz8Vr5zp3GSlUFGpRHJ1AzF2vhLQrlGYdv5EdsqGaprM=
X-Received: by 2002:a05:690e:d85:b0:672:a678:dc29 with SMTP id
 956f58d0204a3-672a678ddaemr313744d50.9.1789867665991; Sat, 19 Sep 2026
 18:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260915190244.2983746-1-tgamblin@baylibre.com>
 <20260915190244.2983746-3-tgamblin@baylibre.com> <CAMKF1sq4ZA86JDZBE_PQ4rYcdbAfABwZNNP=0KJvZ894S59HnA@mail.gmail.com>
In-Reply-To: <CAMKF1sq4ZA86JDZBE_PQ4rYcdbAfABwZNNP=0KJvZ894S59HnA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Sep 2026 18:27:19 -0700
X-Gm-Features: AcwNN1X8eMdEZOB-uMzKqJ4VG6KS-XbSoARRojP0o4JTILNlK8Dvpp_aqzM6wp8
Message-ID: <CAMKF1spRNMB+JfhvgEpZnRa40J-vb+mNzcVm8NJEimFETTNa1w@mail.gmail.com>
Subject: Re: [OE-core][RFC PATCH 02/14] tune-riscv.inc: add 'riscv64gcv' tune
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org, mark.hatle@kernel.crashing.org
Content-Type: multipart/alternative; boundary="0000000000006d2d60065be00a13"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Sep 2026 01:27:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246249

--0000000000006d2d60065be00a13
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No compatibility aliases for riscv64/riscv32. Out-of-tree fallout is
silent-and-weird rather than a clean error:
- meta-riscv/conf/machine/baremetal-riscv64.conf: DEFAULTTUNE =3D "riscv64"=
 =E2=86=92
empty TUNE_FEATURES
- meta-sifive/conf/machine/include/riscv/tune-sifive.inc:
TUNE_FEATURES:tune-sifive-5-series =3D "${TUNE_FEATURES:tune-riscv64}
sifive-5-series" =E2=86=92 collapses to just sifive-5-series and there migh=
t be
more layers.

Either keep riscv64/riscv32 in AVAILTUNES as aliases for a release
(TUNE_FEATURES:tune-riscv64 :=3D "${TUNE_FEATURES:tune-riscv64gc}") or land
coordinated BSP patches plus a release note.

On Sat, Sep 19, 2026 at 6:26=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

>
>
> On Tue, Sep 15, 2026 at 12:03=E2=80=AFPM Trevor Gamblin <tgamblin@baylibr=
e.com>
> wrote:
>
>> Add a new RISC-V tune option which adds the 'v' (vector) extension,
>> compared to the default.
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>>  meta/conf/machine/include/riscv/tune-riscv.inc | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc
>> b/meta/conf/machine/include/riscv/tune-riscv.inc
>> index f55c122fe3..3eb057680a 100644
>> --- a/meta/conf/machine/include/riscv/tune-riscv.inc
>> +++ b/meta/conf/machine/include/riscv/tune-riscv.inc
>> @@ -2,12 +2,15 @@ require conf/machine/include/riscv/arch-riscv.inc
>>
>>  DEFAULTTUNE ?=3D "riscv64gc"
>>
>> -AVAILTUNES +=3D "riscv64gc riscv32gc riscv64nc riscv64nf riscv32nf"
>> +AVAILTUNES +=3D "riscv64gcv riscv64gc riscv32gc riscv64nc riscv64nf
>> riscv32nf"
>>
>>  # Default
>>  TUNE_FEATURES:tune-riscv64gc :=3D "${@oe.tune.riscv_isa_to_tune("rv64gc=
")}"
>>  PACKAGE_EXTRA_ARCHS:tune-riscv64gc =3D "${TUNE_RISCV_PKGARCH}"
>>
>> +TUNE_FEATURES:tune-riscv64gcv :=3D
>> "${@oe.tune.riscv_isa_to_tune("rv64gcv")}"
>> +PACKAGE_EXTRA_ARCHS:tune-riscv64gcv =3D "${TUNE_RISCV_PKGARCH}"
>> +
>>  TUNE_FEATURES:tune-riscv32 :=3D "${@oe.tune.riscv_isa_to_tune("rv32gc")=
}"
>>  PACKAGE_EXTRA_ARCHS:tune-riscv32gc =3D "${TUNE_RISCV_PKGARCH}"
>>
>>
> So riscv32gc has no TUNE_FEATURES and riscv32 has no PACKAGE_EXTRA_ARCHS.
> Nothing later in the series fixes it AFAICT. And
> meta/conf/machine/qemuriscv32.conf:5 still says DEFAULTTUNE ?=3D "riscv32=
",
> so qemuriscv32 ends up with an empty PACKAGE_EXTRA_ARCHS after this patch=
.
>
>
>> --
>> 2.55.0
>>
>>

--0000000000006d2d60065be00a13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">No compatibility aliases for riscv64/riscv32. Out-of-tree =
fallout is silent-and-weird rather than a clean error:<br>- meta-riscv/conf=
/machine/baremetal-riscv64.conf: DEFAULTTUNE =3D &quot;riscv64&quot; =E2=86=
=92 empty TUNE_FEATURES<br>- meta-sifive/conf/machine/include/riscv/tune-si=
five.inc: TUNE_FEATURES:tune-sifive-5-series =3D &quot;${TUNE_FEATURES:tune=
-riscv64} sifive-5-series&quot; =E2=86=92 collapses to just sifive-5-series=
 and there might be more layers.=C2=A0<br><br>Either keep riscv64/riscv32 i=
n AVAILTUNES as aliases for a release (TUNE_FEATURES:tune-riscv64 :=3D &quo=
t;${TUNE_FEATURES:tune-riscv64gc}&quot;) or land coordinated BSP patches pl=
us a release note.</div><br><div class=3D"gmail_quote gmail_quote_container=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 19, 2026 at 6:26=E2=80=
=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 15, 2026 at 12:03=E2=80=
=AFPM Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@baylibre.com" target=3D=
"_blank">tgamblin@baylibre.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Add a new RISC-V tune option which adds the &=
#39;v&#39; (vector) extension,<br>
compared to the default.<br>
<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@baylibre.com" =
target=3D"_blank">tgamblin@baylibre.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/include/riscv/tune-riscv.inc | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/mac=
hine/include/riscv/tune-riscv.inc<br>
index f55c122fe3..3eb057680a 100644<br>
--- a/meta/conf/machine/include/riscv/tune-riscv.inc<br>
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc<br>
@@ -2,12 +2,15 @@ require conf/machine/include/riscv/arch-riscv.inc<br>
<br>
=C2=A0DEFAULTTUNE ?=3D &quot;riscv64gc&quot;<br>
<br>
-AVAILTUNES +=3D &quot;riscv64gc riscv32gc riscv64nc riscv64nf riscv32nf&qu=
ot;<br>
+AVAILTUNES +=3D &quot;riscv64gcv riscv64gc riscv32gc riscv64nc riscv64nf r=
iscv32nf&quot;<br>
<br>
=C2=A0# Default<br>
=C2=A0TUNE_FEATURES:tune-riscv64gc :=3D &quot;${@oe.tune.riscv_isa_to_tune(=
&quot;rv64gc&quot;)}&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS:tune-riscv64gc =3D &quot;${TUNE_RISCV_PKGARCH}&qu=
ot;<br>
<br>
+TUNE_FEATURES:tune-riscv64gcv :=3D &quot;${@oe.tune.riscv_isa_to_tune(&quo=
t;rv64gcv&quot;)}&quot;<br>
+PACKAGE_EXTRA_ARCHS:tune-riscv64gcv =3D &quot;${TUNE_RISCV_PKGARCH}&quot;<=
br>
+<br>
=C2=A0TUNE_FEATURES:tune-riscv32 :=3D &quot;${@oe.tune.riscv_isa_to_tune(&q=
uot;rv32gc&quot;)}&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS:tune-riscv32gc =3D &quot;${TUNE_RISCV_PKGARCH}&qu=
ot;<br>
<br></blockquote><div><br></div><div>So riscv32gc has no TUNE_FEATURES and =
riscv32 has no PACKAGE_EXTRA_ARCHS. Nothing later in the series fixes it AF=
AICT. And meta/conf/machine/qemuriscv32.conf:5 still says DEFAULTTUNE ?=3D =
&quot;riscv32&quot;, so qemuriscv32 ends up with an empty PACKAGE_EXTRA_ARC=
HS after this patch.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
-- <br>
2.55.0<br>
<br>
</blockquote></div></div>
</blockquote></div>

--0000000000006d2d60065be00a13--

