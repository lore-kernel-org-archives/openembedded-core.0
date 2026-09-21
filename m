Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E48C982E6
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 16:26:53 +0000 (UTC)
Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.389.1790008006526412400
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 09:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=eUTyOhNZ;
 spf=pass (domain: mvista.com, ip: 74.125.228.76, mailfrom: vanusuri@mvista.com)
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99391ffb2so5261698a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 09:26:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790008005; cv=none;
        d=google.com; s=arc-20260327;
        b=VmIz8cM81995cWwJJCznNZ7k4NkHYzeRICx7M/l0HQ0oAtS4wlt1Sqn22kDHsaad6a
         VmAQxuzsNCs6AxhjjILZ49gW6trSmMRAhzfS8S4hHW9YbW6ap9p0MsBD4NfJWdMUyz9d
         LjrdTMRQJ5UOZhxlfznXhpbUR/QuKcsy3XOZe+a/TmW7Ic2wz7Qw/Z2sK4WehgV24Yiq
         pCO8tEPTL+3jSrMmTow6iarf7fodIjqO0W7LI9glhyStRwV2/r/SwFJY7viIX1jeApV8
         yPgMKy20HkrWY/E0JmjiJGYs80fi78TPbWDqttYRCY2t7N2nO5X+eFzEFYMly9CTowl4
         Wapg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UxftFdiOIUFr90nIGZeIeBtd6H+w+hy7ddfykZloYGM=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=SaBorV2eBxsh205A/SRm3+woWbVvCJOnthchsU31b/z7gOFiIINhjqO59vm3YcX5eA
         Yc21QiINr/4riAW6XCnM5WGyMZlYgKzqXdLYu/OWKo+8L32jy7o0109RmYxJjyolaxlG
         1W4j0jHJfrBOR590+ohsQUp8YfQmhRQOXXkFm1fK6wsy9zCdxqYsTL5xXk2ijMJwChVB
         k6JDzXWYfiaDmREwKVhDwDAH4soIC/ZyPnoC6vO+7NJFUnSs27fb5EVFSmZ65rxF6VyJ
         qV1qxjVuZN26nMFdjT+5A/EsQFp2qks3neobRuEG3OtO2ghCPDi0YXxTY3KbMXEG77UX
         +8lA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1790008005; x=1790612805; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UxftFdiOIUFr90nIGZeIeBtd6H+w+hy7ddfykZloYGM=;
        b=eUTyOhNZ2yT7dmcU8mNZzTVpohJult7afFiPoX7rcuL9hVHmsLsbsjWLPL9q0Aqk2r
         MLRa6Br7iYH2zvUl872V6pdcGfdK1TCEu/eUWG8IUir8PlYb1wucKxUi3sH/3+8iMdZc
         rxu8QuBEXSkz9QZtQBkyhPAm/6X/AyVW55dwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008005; x=1790612805;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UxftFdiOIUFr90nIGZeIeBtd6H+w+hy7ddfykZloYGM=;
        b=RvvYKVDdYfOMrWRE/88mTq5GYcXdZhlsm63xngjvChWFg3V1BeGDaOMyh1ygYTFQjr
         X3qaDgi3/Wve31HaIJ27V/BLGsXJ0bSI5tNXHVVbW0k5dfQ9YWQB/60rk///VZ2fPPVy
         qZdzPbe567G8m6o2KjrdNnJoJyPD+XCxjh+Yzfpcu8U7Mis3kcqm6FNaqLbd4cmmEgeM
         TZu2i1O5wvbOc/11Fe0RVrS8+SfcZOpH5Vu5OQJiws2hQw4VFissYwYBvxGDStnR+Ev6
         4/ijzaSGXteNmEBWOeFEL6el2Sroc2WpVEe0Whe3eOqDMYUheXF780qcI1nkI6N44UnR
         9YMA==
X-Gm-Message-State: AFuF++kOf0zhJCZpjYTtaODQPNu5YK9B6cvL2FImrL6wV4W6T1GIZ3Ct
	ENrzmLzCwSTZqitFOhYETJVGell4SavltUZVlxD8IVQSqRV4wUBsp3kaExzc6dGeKLcT73sxnhN
	JDabI7Jnbt0bTrEzs5ATg1nB+wm8U0ao/dH3K7KP4ow==
X-Gm-Gg: AYBFou1JFu3J81be/6f7quHtXI97jidLTyk9dXZypDcy+Qn3uKuAWq9/shVnjl583Gz
	qobDMLnlIFx+BGpvfqSKK7TDZnslP4siF/5QDb1oBHDhDPA6OjK967+QlDCykvEj/7HQ+wtTfY8
	r+BaPuBeMku2+3dlndy/NzwGQjcoSBL4LsWEyKX8cYHIs3jUU+8PODp+tqcqvmZc2WtYaCxHGqk
	QQBkED6qoJigNKQoYvS3ZRHgyVIbvMcUW45Oar+iFaNzZfpjRS21vzVFtymemiDjtiQEtaw9PP+
	XqF53M6EXHWJSDadbUmNuYJG//PErjHojPGMlGYdr+Id+m9yMqoD0hH5JxPGe7lsuISluo98igY
	10wgkZ3ndR70A
X-Received: by 2002:a17:907:3cc4:b0:c26:19de:9ad1 with SMTP id
 a640c23a62f3a-c2a15e53c92mr1033946866b.41.1790008004264; Mon, 21 Sep 2026
 09:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260901092741.34198-1-vanusuri@mvista.com> <20260901092741.34198-2-vanusuri@mvista.com>
 <DLL3Z9HE1TTX.36E2F147N6AS9@smile.fr>
In-Reply-To: <DLL3Z9HE1TTX.36E2F147N6AS9@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 21 Sep 2026 21:56:31 +0530
X-Gm-Features: AcwNN1VrBI4TiN-G1-GPxlTzwS4rKr8Se2Oa2MPTaiIWeifHCIko2GobK-PC4Ok
Message-ID: <CANQUz18EMCq2YXUagfO1nWmaAp4_11NCmoRJUODp1FOMRVkf5A@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][patch 2/3] python3-cryptography: Fix CVE-2026-69248
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003d5717065c00b777"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 16:26:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246343

--0000000000003d5717065c00b777
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

I downloaded the python-cryptography-42.0.4-slfo.1.1_6.1.src.rpm from the
link below:

https://download.opensuse.org/distribution/leap-micro/6.1/product/repo/open=
SUSE-Leap-Micro-6.1-x86_64-Source/src/python-cryptography-42.0.4-slfo.1.1_6=
.1.src.rpm

Thanks & Regards,
Vijay



On Mon, Sep 21, 2026 at 9:14=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
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
> >
> > diff --git
> a/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69248.patch
> b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69248.patch
> > new file mode 100644
> > index 0000000000..5ccccd8034
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69248.patch
> > @@ -0,0 +1,297 @@
> > +From 4d035a4225965edeffd312079a510ef25fcfdcb2 Mon Sep 17 00:00:00 2001
> > +From: William Woodruff <william@yossarian.net>
> > +Date: Thu, 21 May 2026 20:44:05 -0400
> > +Subject: [PATCH] x509: distinguish NC kinds when evaluating wildcard
> DNS SANs
> > + (#14888)
> > +
> > +* x509: distinguish NC kinds when evaluating wildcard DNS SANs
> > +
> > +* Bump x509-limbo
> > +
> > +Upstream-Status: Backport [import from suse
> python-cryptography-42.0.4-slfo.1.1_6.1.src.rpm
>
> Hello,
>
> "suse python-cryptography-42.0.4-slfo.1.1_6.1.src.rpm": Where can I
> download this? My usual Search engines/LLMs are not helpful here (and I
> don't want to resort to boot a Suse container, yet)
>
> Regards,
> --
> Yoann Congal
> Smile ECS
>
>

--0000000000003d5717065c00b777
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><p><span>Hi Yoann,</span></p><p><span>I download=
ed the </span><code dir=3D"ltr"><span>python-cryptography-42.0.4-slfo.1.1_6=
.1.src.rpm</span></code><span> from the link below:</span></p><p><span></sp=
an></p><a href=3D"https://download.opensuse.org/distribution/leap-micro/6.1=
/product/repo/openSUSE-Leap-Micro-6.1-x86_64-Source/src/python-cryptography=
-42.0.4-slfo.1.1_6.1.src.rpm">https://download.opensuse.org/distribution/le=
ap-micro/6.1/product/repo/openSUSE-Leap-Micro-6.1-x86_64-Source/src/python-=
cryptography-42.0.4-slfo.1.1_6.1.src.rpm</a><br><br></div>Thanks &amp;=C2=
=A0Regards,<br></div>Vijay<p><br></p></div><br><div class=3D"gmail_quote gm=
ail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 21, =
2026 at 9:14=E2=80=AFPM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smi=
le.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Tue Sep 1, 2026 at 11:27 AM CEST, Vijay Anus=
uri via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=
=3D"_blank">lists.openembedded.org</a> wrote:<br>
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
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3-cryptography/CVE-202=
6-69248.patch b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-=
69248.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..5ccccd8034<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69248=
.patch<br>
&gt; @@ -0,0 +1,297 @@<br>
&gt; +From 4d035a4225965edeffd312079a510ef25fcfdcb2 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: William Woodruff &lt;<a href=3D"mailto:william@yossarian.net" t=
arget=3D"_blank">william@yossarian.net</a>&gt;<br>
&gt; +Date: Thu, 21 May 2026 20:44:05 -0400<br>
&gt; +Subject: [PATCH] x509: distinguish NC kinds when evaluating wildcard =
DNS SANs<br>
&gt; + (#14888)<br>
&gt; +<br>
&gt; +* x509: distinguish NC kinds when evaluating wildcard DNS SANs<br>
&gt; +<br>
&gt; +* Bump x509-limbo<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [import from suse python-cryptography-42.0.=
4-slfo.1.1_6.1.src.rpm<br>
<br>
Hello,<br>
<br>
&quot;suse python-cryptography-42.0.4-slfo.1.1_6.1.src.rpm&quot;: Where can=
 I<br>
download this? My usual Search engines/LLMs are not helpful here (and I<br>
don&#39;t want to resort to boot a Suse container, yet)<br>
<br>
Regards,<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--0000000000003d5717065c00b777--

