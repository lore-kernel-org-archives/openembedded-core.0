Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FE1C61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 15:00:28 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24035.1787670022632468352
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 08:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=o4te5e9o;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-836c718715fso46997497b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 08:00:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787670022; cv=none;
        d=google.com; s=arc-20260327;
        b=ejfclloRCpQ5763E3pbCabVwqWcuDn+ufMY2jYQ2/yJFfdG0R+Xb/5U8kxHHeJ05sj
         ln1jpp7t6ldrcn/8keFKePaZ0gOENTugMebef8stFhkVXCBMrhh2ZbEqZ89r2zplemks
         mmXeXPOhNLgMBZjatnrYkgOWY8rePvbENI7pB6AWhaUVqkZH/nxI7+tssNd0a+6Mr0wV
         azWUeAEPzAguDDIS3DgRHDmJpWiWenhZ0xroga29cLvar01F6i796IiFiS79QmR23BqE
         0gXVciNpWyCl/I+bC0wmr+DlcY63Dh+ZmmenrUCGJdxp+rRPxoYXCft5IOzVNsqeW9lf
         5QEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Y6LTNq0PsFDfRBEXl34i1Nfq6SJj+/2iqf3Ivteltpw=;
        fh=AiM24HqLxTf1iHQq112QdTxl2RrDKvLKpV+3zcOsbJ8=;
        b=fFZ5ITLhsdK/x3IE+fjQ8kEmgoDBvFutRguA6b6luYnpwSi8/RXlqlwjMO0pgVwRlX
         8wHmywwfa/US4VH0zamKhcER+saLwbD5oXKnZNytkwx/BaMwDsZk7D/kXNWAr7xQnh9N
         JvPnpJfKtXrnaP/krFPJPjaYzv80KFklMzlt8H/n/HTGZPKvFge3zc9+d0285XMN1LeT
         agPtlwg5IoXsz5o3ituqofhn/4kw/9BtZPpELJBOpMmG/rXoJ9Ezzb4WTdEdz1Q5Z479
         H89ogj18tK77Rq8v2IzCVv8QlPePCD9DswMtT03iyIHKgqIQpwggcJTt4AT/NfmIwenr
         DWoQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787670022; x=1788274822; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y6LTNq0PsFDfRBEXl34i1Nfq6SJj+/2iqf3Ivteltpw=;
        b=o4te5e9oMqXrsynJ7hWxYzysPvM2nIKkCjnEpaT7T+OOZU9JS0M6lefSfp9Lc93waD
         fa/+mqUMA4zKndAiiqI2TktyPXAQP/LBcvZYQbAvzVq1CIQiPH84nJX5MDSATlMsP8Vi
         +7u/k3F6EY04e0S8VXXQ2XHofzM9XfPZX6LoQ1OZFy4SVk/Cp8k3CFs7uvToMOnoBaaI
         kS2fbpQ+KuAXUrUvBImJWyrQV5dY9EBsf9kpGHlFPbxMRhvbhhWPANFWxLO2lMXW+lUx
         4+HaAt/DIPa50H9n7G54bhkHUBXAxAm4MFe/rjGBaf5F1E/BJMEFRKH6rtqYpKICCFU3
         Mdvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787670022; x=1788274822;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y6LTNq0PsFDfRBEXl34i1Nfq6SJj+/2iqf3Ivteltpw=;
        b=nTEvr8ez3lZfl9ZsB7Q5DFpZaXB84Fn1qzB4dgkXskSOR6oYf1EZpMj7hxhU59MG0v
         DTkSXRPM59kb2JoekRMWXsgSLgcvr5ANEa7F4+4SambpkrYqI3VQaStYZvpAF+b0X/+g
         uouYTK/+CrH9DS5BucpwxNZ1tJwSZ5cu0Cw/wihHiGPOuoUYjWYLrGDEVno1ZcFEPL86
         +/VMHch+1UMcyHQBjvqC1es7n/COnXAVsSfbWdiu/pzWtiqOuFkPZZN97Rzj/a8ctJRF
         7o1r7+JAvSUICtgMVs2mBqUVlvRqo7k+8vAsdr5uMSqIEagW1jEKYe5Mlzf6GDBkgdzN
         y9dg==
X-Gm-Message-State: AFuF++nu4VB+kNc8cVeUY//xkY3gRMWiOHJPcucyVTANfNSHgLbhD09b
	i6oRqDXQ9sxTCQIO0Y0sO2UX9WWdSR1YxoKfRq1iQyQqprJFfWlCGK0iSvTZqfT0mHHTsVrz82w
	fSF2jsERYshTWhE/gyNG5QtrGDUG1mbpJAAVe
X-Gm-Gg: AR+sD12nkYTSUyrCnfhvtY30v1KITYrhTrtZT6eNXzQ/fS17ZrMnt1NpLGs2c4n+dtU
	yKXYq24S/20sxtgXTYwtd7wF46hJmG4LIgFnjGdlpoVGaKQtZe9mkezxuTOyw2FKCej0ygaqP57
	+r6YWFzGT1W/IXjKAu/ut1nccvb6sKaA9B+hx4971Zd1mr+ukKeUDfaEsukJ6/7jcTbHnjOcd1c
	+rEGXSMNcITV470WhzxjPaABolGuaZbsLYPskNeuVWYss4kyoqb7U04MyjHRK7qjLyUUNoWGYaU
	hLdMr8QX8ClYEAQ33F1zrYB4v26wouyiGNjHGeNRajouUnPNbtOP+g4TBmw=
X-Received: by 2002:a05:690c:e297:20b0:826:5659:28aa with SMTP id
 00721157ae682-85478b735bbmr25375527b3.32.1787670021109; Tue, 25 Aug 2026
 08:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260824201017.3914783-2-iwanicki92@gmail.com>
 <CAJdd5GZsDEKtHL3pNjuqg6xEOWLFMDbGUibbobjus3XJR-8BLg@mail.gmail.com> <2283556.1787636925763155083@lists.openembedded.org>
In-Reply-To: <2283556.1787636925763155083@lists.openembedded.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 25 Aug 2026 09:00:09 -0600
X-Gm-Features: AcwNN1Wp_9Qu4SpVz11Fgc8Z2-_XNgfsZ-bN0F9OZUnI1TeWeoWyHS96hPXthDE
Message-ID: <CAJdd5GY9nKqH0jPfUiYc2kDN3sF=Cg=9G+Q6VcPC1pdDRScQVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] sbom30.py/spdx30_tasks.py: fix SPDX_* prefix lookup
To: iwanicki92@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000957d0e0659e05cb2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 15:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244245

--000000000000957d0e0659e05cb2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 11:48=E2=80=AFPM iwanicki92 via lists.openembedded.=
org
<iwanicki92=3Dgmail.com@lists.openembedded.org> wrote:

> I'm not sure where the documentation you found suggests this
>
>
> The Yocto Project documentation:
> https://docs.yoctoproject.org/ref-manual/variables.html#term-SPDX_IMAGE_S=
UPPLIER
> contains almost the same example:
>
> MY_COMPANY_name =3D "Acme Corp"
> MY_COMPANY_type =3D "organization"
> SPDX_IMAGE_SUPPLIER =3D "MY_COMPANY"
> SPDX_SDK_SUPPLIER =3D "MY_COMPANY"
>

This is incorrect and needs to be removed


>
> the support for this is already implemented by undocumented `_ref` suffix=
,
> so maybe documentation should be changed instead.
> Though `_ref` suffix if I'm reading code correctly allows for infinite
> chaining e.g:
>
> SPDX_IMAGE_SUPPLIER_ref =3D "MY_COMPANY1"
> MY_COMPANY1_ref =3D "MY_COMPANY2"
> MY_COMPANY2_name =3D "Acme Corp
>


That's not how _ref works. _ref allows you to "reference" another SPDX
"Agent" that was created elsewhere (instead of creating a new one each
time). So you can do:

SPDX_IMAGE_SUPPLIER_name =3D "AAAA"
SPDX_IMAGE_SUPPLIER_type =3D "organization"

SPDX_SDK_SUPPLIER_ref =3D "SPDX_IMAGE_SUPPLIER"

And then the generated SPDX will only contain a single "AAAA" company
object that is referenced in both cases, instead of creating 2 duplicate
objects. However, at least one of the variables must actually create the
organization for that to work (e.g. SPDX_IMAGE_SUPPLIER in this case)


>
>
> but the values for any base variable are suffixes always appended to that
> base variable
>
> SPDX_IMAGE_SUPPLIER =3D "MY_COMPANY"
> SPDX_IMAGE_SUPPLIER_MY_COMPANY_name =3D "CCCC"
> SPDX_IMAGE_SUPPLIER_MY_COMPANY_type =3D "organization"
>
>
> This one I don't think is mentioned anywhere, and also doesn't work. Mayb=
e
> you meant SPDX_AUTHORS which has this syntax:
>

Yes, I did, sorry for being confusing. Some variables allow multiple things
to be assigned (like SPDX_AUTHORS) and some only allow a single one (like
SPDX_IMAGE_SUPPLIER). The ones the support multiple require the suffixes to
be specified in the variable name, e.g.

  SPDX_AUTHORS =3D "A B C"

And then the code will create authors using SPDX_AUTHORS_A, SPDX_AUTHORS_B,
and SPDX_AUTHORS_C, but these 3 variables are all treated the same as all
other SPDX Agent variables (e.g. the same as SPDX_IMAGE_SUPPLIER)



>
> SPDX_AUTHORS ??=3D "openembedded"
> SPDX_AUTHORS[doc] =3D "A space separated list of the document authors. Ea=
ch
> item \
>     is used to name a base variable like SPDX_AUTHORS_<AUTHOR> that \
>     describes the author."
> SPDX_AUTHORS_openembedded_name =3D "OpenEmbedded"
> SPDX_AUTHORS_openembedded_type =3D "organization"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#244192):
> https://lists.openembedded.org/g/openembedded-core/message/244192
> Mute This Topic: https://lists.openembedded.org/mt/120910416/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> JPEWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000957d0e0659e05cb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 24,=
 2026 at 11:48=E2=80=AFPM iwanicki92 via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;iwanicki92=3D<a href=3D"mailto:gmail=
.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><blockquote>
<div>I&#39;m not sure where the documentation you found suggests this</div>
</blockquote>
<div>=C2=A0</div>
<div>The Yocto Project documentation: <a href=3D"https://docs.yoctoproject.=
org/ref-manual/variables.html#term-SPDX_IMAGE_SUPPLIER" target=3D"_blank">h=
ttps://docs.yoctoproject.org/ref-manual/variables.html#term-SPDX_IMAGE_SUPP=
LIER</a> contains almost the same example:</div>
<div>=C2=A0</div>
<div>MY_COMPANY_name =3D &quot;Acme Corp&quot;<br>MY_COMPANY_type =3D &quot=
;organization&quot;<br>SPDX_IMAGE_SUPPLIER =3D &quot;MY_COMPANY&quot;<br>SP=
DX_SDK_SUPPLIER =3D &quot;MY_COMPANY&quot;</div></blockquote><div><br></div=
><div>This is incorrect and needs to be removed</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<div>=C2=A0</div>
<div>the support for this is already implemented by undocumented `_ref` suf=
fix, so maybe documentation should be changed instead.<br>Though `_ref` suf=
fix if I&#39;m reading code correctly allows for infinite chaining e.g:</di=
v>
<div>=C2=A0</div>
<div>SPDX_IMAGE_SUPPLIER_ref =3D &quot;MY_COMPANY1&quot;</div>
<div>MY_COMPANY1_ref =3D &quot;MY_COMPANY2&quot;</div>
<div>MY_COMPANY2_name =3D &quot;Acme Corp</div></blockquote><div><br></div>=
<div><br></div><div>That&#39;s not how _ref works. _ref allows you to &quot=
;reference&quot; another SPDX &quot;Agent&quot; that was created elsewhere =
(instead of creating a new one each time). So you can do:</div><div><br></d=
iv><div></div><div>SPDX_IMAGE_SUPPLIER_name =3D &quot;AAAA&quot;</div><div>=
SPDX_IMAGE_SUPPLIER_type =3D &quot;organization&quot;</div><div><br></div><=
div></div><div>SPDX_SDK_SUPPLIER_ref =3D &quot;SPDX_IMAGE_SUPPLIER&quot;</d=
iv><div><br></div><div>And then the generated SPDX will only contain a sing=
le &quot;AAAA&quot; company object that is referenced in both cases, instea=
d of creating 2 duplicate objects. However, at least one of the variables m=
ust actually create the organization for that to work (e.g. SPDX_IMAGE_SUPP=
LIER in this case)</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<div>=C2=A0</div>
<blockquote>
<div>but the values for any base variable are suffixes always appended to t=
hat base variable<br><br></div>
<div>SPDX_IMAGE_SUPPLIER =3D &quot;MY_COMPANY&quot;<br>SPDX_IMAGE_SUPPLIER_=
MY_COMPANY_name =3D &quot;CCCC&quot;<br>SPDX_IMAGE_SUPPLIER_MY_COMPANY_type=
 =3D &quot;organization&quot;</div>
</blockquote>
<div>=C2=A0</div>
<div>This one I don&#39;t think is mentioned anywhere, and also doesn&#39;t=
 work. Maybe you meant SPDX_AUTHORS which has this syntax:</div></blockquot=
e><div><br></div><div>Yes, I did, sorry for being confusing. Some variables=
 allow multiple things to be assigned (like SPDX_AUTHORS) and some only all=
ow a single one (like SPDX_IMAGE_SUPPLIER). The ones the support multiple r=
equire the suffixes to be specified in the variable name, e.g.</div><div><b=
r></div><div>=C2=A0 SPDX_AUTHORS =3D &quot;A B C&quot;</div><div><br></div>=
<div>And then the code will create authors using SPDX_AUTHORS_A, SPDX_AUTHO=
RS_B, and SPDX_AUTHORS_C, but these 3 variables are all treated the same as=
 all other SPDX Agent variables (e.g. the same as SPDX_IMAGE_SUPPLIER)</div=
><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<div>=C2=A0</div>
<div>SPDX_AUTHORS ??=3D &quot;openembedded&quot;<br>SPDX_AUTHORS[doc] =3D &=
quot;A space separated list of the document authors. Each item \<br>=C2=A0 =
=C2=A0 is used to name a base variable like SPDX_AUTHORS_&lt;AUTHOR&gt; tha=
t \<br>=C2=A0 =C2=A0 describes the author.&quot;<br>SPDX_AUTHORS_openembedd=
ed_name =3D &quot;OpenEmbedded&quot;<br>SPDX_AUTHORS_openembedded_type =3D =
&quot;organization&quot;</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#244192): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/244192" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/244192</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120910416/361=
6693" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120910416/3616693</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank">JPEWhacker@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000957d0e0659e05cb2--

