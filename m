Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E86FC982FE
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 06:25:47 +0000 (UTC)
Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4116.1790058344680878333
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 23:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dnUuHeHL;
 spf=pass (domain: mvista.com, ip: 74.125.228.171, mailfrom: vanusuri@mvista.com)
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c254f9f7db0so456532466b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 23:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790058343; cv=none;
        d=google.com; s=arc-20260327;
        b=syX5k+vgkrHfCER48/3VmRhACX7uAQkppoIGK1Jq0YpHjti/iyc1QuQG2IKIZzmZSl
         GceAqsLxhOq8hosUbaujSPLr6QpZrfqcMk05LRHXK6LGCRurVfI87tCKqzW0dB+oqVfF
         Oq5seqdTY2qaDhS/7AFhQT0/tdAM6ZzxWYwfiNIN7bVxAT6ZMgcmcVByxFxhG63HlHY2
         SdoEOfRx/lnDnhTvJiJChjvNio45o5veB/aaUfJNbW/wPBTj6OKayZolid2E8TFvJARD
         FRLxVPaWpDBdla6vXhMQsLJz/CBMAt2SaQGQnm/6cXqvzrzibDxwHabOt/NfmZ/rzfrc
         SgKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/etitTmfxy/fjAhwubFt/l19NJCT7sRMkjysfzhhDJk=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=mT9fq65lUKh3QNSxDVIyi4B8gPFy0s9J2t4vtQ1KTUCiSxsGBd0hv1ArQI1l28HHlh
         U9f1VPdAaPISYY3buh0j22UhIVmgt11dCqKuCN7YVBuhE6W5O5M+SG6h6/TrvWwoSy+f
         JV0juomPae1RmAM75nmDJcM2YbzLUndeNVaY+I8rHLkZRUBVCINQhXVPusud5DiJ4VH7
         Ep/A6jM92b4WkmZXpPyoLTHvkouGaP6tTuRs0jglrWK13GMzbMtX2PAWxqZmGvM8DCFh
         EIHcr3FLVCXyieotWsvU1QCgklxtsHOtlDLIQEhYW8IMj5PXZfZxBx4O7rMGv36ogtzI
         UUZA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1790058343; x=1790663143; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/etitTmfxy/fjAhwubFt/l19NJCT7sRMkjysfzhhDJk=;
        b=dnUuHeHLA5A5sQL/0AGgSUp/xPzi6RM2b+RgtP3VGCiYlkxLMAW6bT9yJU7IuN8pDv
         fF0nJNbCGTW5YVLAcJuTbLrBQ8+TDkz+8ob6AGMNxDzKFAokR7Ci8/1z13XLQNhXkDpf
         86H1oQ6nh7hOQvwOAnFvJ9zY5BFkVBvl2zsv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790058343; x=1790663143;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/etitTmfxy/fjAhwubFt/l19NJCT7sRMkjysfzhhDJk=;
        b=DNGnEAzHffGSNMh7GHCrPyebAklXdW6TXX3CvOVphLSYrIS7NLa0y+my/Ra5H+SbJ3
         BoUyDI7SzC5hAwABLqwDq6ux6wMuyOFnRhj4Pfd0gGZq0P6GApg5w/VoT66HiAVEfvEc
         dmQsG9JoEct9uwUbKQiRPx/9d/DOWyDhd0g7ceZxgaTQIsPD+yd3W+l24ozymcEuKlzO
         lpLUwdw2liP+WetP0QHrmR+PmfNjOiJaKqvqOdho6zBihI6bhpTBX9gZBfgoei97fXIZ
         NnbWelys3yPVv9Wh8oeynAZhK9/5FWjS9ykkM2LFKOEVl7s2OoHEmBynQVMtOW0YYEvd
         2Ytg==
X-Gm-Message-State: AFuF++k7iYTyoS7dGLm+u8/SQDif3ZMY77GcVHlBIvrHzbGnxFUQfuws
	wr8noPX2HDo+VhSRWZa1+WAZ2IWb/Jbsl10AhMUBWG7wVMV6XzMi/QThzsaR9TZ26w/5k6XJiY1
	S2Y8sRbR2CBDrXNPsSc9gRl21c3IVFtMHIf6jezL8Wg==
X-Gm-Gg: AYBFou2D9/UYWibm0oJ6mHWq/H2/W2y9YjSd8KtNTKz1fN5YaedtYkbbtSzkD0M7QTu
	gjHN9TELMoNL9ZNnd194VotpmNoptVQM97/FJ6ql8jYkQFmxErshwYarCXjkiXNiWKPnlyrPXZ/
	TIqBPtRhgQYcUwReo5NX0uj/W2Uzh+wLRja4lt9fMCXHXEXcnN7hoBhmR1D4jGmAy0kTcmVXQ6z
	1Zpkb/x8/3hpVhZPT52vXtO/CfZBjBk9182aPjbFLjITBpHXqGu7HIVElJhAmzR1zy7fm5aDyNE
	21HMNUAJd9ZleXk7XD9bPG5eiIITM0GHPCjf1mMFEsVRcWnH2FbWCZTqyDMy6vXmY562ml9xvJy
	F3KsiA3bgXLB4A3g1e3dhSQ==
X-Received: by 2002:a17:907:3e91:b0:c26:2205:3df8 with SMTP id
 a640c23a62f3a-c2a15699ae8mr1233384366b.9.1790058342878; Mon, 21 Sep 2026
 23:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260901092741.34198-1-vanusuri@mvista.com> <20260901092741.34198-3-vanusuri@mvista.com>
 <DLL5XRWWZM4D.2RM59FLBTVIJD@smile.fr>
In-Reply-To: <DLL5XRWWZM4D.2RM59FLBTVIJD@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 22 Sep 2026 11:55:28 +0530
X-Gm-Features: AcwNN1UEH6NULN26gbWPBJVuZaN1vjx0_QUfjS-RMNk8vE5K1BF28XSynAH9fjM
Message-ID: <CANQUz18KUNXym4Vq4OK5=Ur_M5VdHxoVQSH+fhSgySa0qN8QQA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][patch 3/3] python3-cryptography: Fix CVE-2026-69249
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a7a656065c0c6f87"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 06:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246378

--000000000000a7a656065c0c6f87
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

On Mon, Sep 21, 2026 at 10:46=E2=80=AFPM Yoann Congal <yoann.congal@smile.f=
r> wrote:

> On Tue Sep 1, 2026 at 11:27 AM CEST, Vijay Anusuri via
> lists.openembedded.org wrote:
> > Pick patch according to [2]
> >
> > [1] https://nvd.nist.gov/vuln/detail/cve-2026-69249
> > [2] https://security-tracker.debian.org/tracker/CVE-2026-69249
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  .../python3-cryptography/CVE-2026-69249.patch | 349 ++++++++++++++++++
> >  .../python/python3-cryptography_42.0.5.bb     |   1 +
> >  2 files changed, 350 insertions(+)
> >  create mode 100644
> meta/recipes-devtools/python/python3-cryptography/CVE-2026-69249.patch
> >
> > diff --git
> a/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69249.patch
> b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69249.patch
> > new file mode 100644
> > index 0000000000..a920b4a7cc
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69249.patch
> > @@ -0,0 +1,349 @@
> > +From 4a12cf49675a184e47f912b00b04f3a629283582 Mon Sep 17 00:00:00 2001
> > +From: William Woodruff <william@yossarian.net>
> > +Date: Sat, 6 Jun 2026 23:30:03 -0400
> > +Subject: [PATCH] Add a signature validation budget during path
> construction
> > + (#14960)
> > +
> > +* Add a signature validation budget during path construction
> > +
> > +This extends our existing NC budget check to include a budget
> > +for signature validations. If a path construction exceeds the
> > +budget by performing more than the allowed number of signature
> > +validation steps, the entire construction fails.
> > +
> > +For now, our budget is 128 signature validations. This is
> > +consistent with (higher than) Go and rustls-webpki, which
> > +both set a limit of 100. Like Go, we attempt to make the "best"
> > +use of our signature budget by ordering by likelihood, using
> > +AKI/SKI match as the strongest signal of fitness.
> > +
> > +* Bump limbo
> > +
> > +* Temporary commit
> > +
> > +* Revert "Temporary commit"
> > +
> > +This reverts commit bcdb6808562a8b8f484f85d21cb201cfdb2bbbd7.
> > +
> > +* Fudge a coverage test into place
> > +
> > +* Coverage for the coverage god
> > +
> > +Upstream-Status: Backport [import from suse
> python-cryptography-42.0.4-slfo.1.1_6.1.src.rpm
> > +Upstream commit
> https://github.com/pyca/cryptography/commit/4a12cf49675a184e47f912b00b04f=
3a629283582
> ]
> > +CVE: CVE-2026-69249
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + .../cryptography-x509-verification/src/lib.rs | 209 +++++++++++++++++=
-
> > + .../src/policy/mod.rs                         |   8 +-
> > + 2 files changed, 208 insertions(+), 9 deletions(-)
>
> When I compare CVE-2026-69249-signature-validation-budget.patch in
> python-cryptography-42.0.4-slfo.1.1_6.1.src.rpm and this patch, I get a
> lot of diffs that don't look trivial to me (In particular, some hunks
> about the budget handling disapear...)
>

the budget-handling changes that are missing from our version of the patch
are already present in our codebase. Therefore, those hunks were not
included in the backport. so those changes were not applied again.

>
> Can you explain how/why did you change the upstream patch to match our
> code?
>
> Please send a v2 of this series with:
> * URLs to download the Suze archive
> * backport changes for this patch (2/3 also had changes but those were
>   easy to understand)
> ?
>

I will send the updated v2 series shortly.

>
> Thanks!
> --
> Yoann Congal
> Smile ECS
>
>
Thanks & Regards,
Vijay

--000000000000a7a656065c0c6f87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi=C2=A0Yoann,</div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 21, 2=
026 at 10:46=E2=80=AFPM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smi=
le.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Tue Sep 1, 2026 at 11:27 AM CEST, Vijay Anus=
uri via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=
=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Pick patch according to [2]<br>
&gt;<br>
&gt; [1] <a href=3D"https://nvd.nist.gov/vuln/detail/cve-2026-69249" rel=3D=
"noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/detail/cve-2026-69=
249</a><br>
&gt; [2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-69=
249" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.o=
rg/tracker/CVE-2026-69249</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../python3-cryptography/CVE-2026-69249.patch | 349 ++++++++++++=
++++++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-cryptography_42.0.5.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-cryptography_42.0.5.bb</a>=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 2 files changed, 350 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/python3-cryptogr=
aphy/CVE-2026-69249.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3-cryptography/CVE-202=
6-69249.patch b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-=
69249.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a920b4a7cc<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69249=
.patch<br>
&gt; @@ -0,0 +1,349 @@<br>
&gt; +From 4a12cf49675a184e47f912b00b04f3a629283582 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: William Woodruff &lt;<a href=3D"mailto:william@yossarian.net" t=
arget=3D"_blank">william@yossarian.net</a>&gt;<br>
&gt; +Date: Sat, 6 Jun 2026 23:30:03 -0400<br>
&gt; +Subject: [PATCH] Add a signature validation budget during path constr=
uction<br>
&gt; + (#14960)<br>
&gt; +<br>
&gt; +* Add a signature validation budget during path construction<br>
&gt; +<br>
&gt; +This extends our existing NC budget check to include a budget<br>
&gt; +for signature validations. If a path construction exceeds the<br>
&gt; +budget by performing more than the allowed number of signature<br>
&gt; +validation steps, the entire construction fails.<br>
&gt; +<br>
&gt; +For now, our budget is 128 signature validations. This is<br>
&gt; +consistent with (higher than) Go and rustls-webpki, which<br>
&gt; +both set a limit of 100. Like Go, we attempt to make the &quot;best&q=
uot;<br>
&gt; +use of our signature budget by ordering by likelihood, using<br>
&gt; +AKI/SKI match as the strongest signal of fitness.<br>
&gt; +<br>
&gt; +* Bump limbo<br>
&gt; +<br>
&gt; +* Temporary commit<br>
&gt; +<br>
&gt; +* Revert &quot;Temporary commit&quot;<br>
&gt; +<br>
&gt; +This reverts commit bcdb6808562a8b8f484f85d21cb201cfdb2bbbd7.<br>
&gt; +<br>
&gt; +* Fudge a coverage test into place<br>
&gt; +<br>
&gt; +* Coverage for the coverage god<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [import from suse python-cryptography-42.0.=
4-slfo.1.1_6.1.src.rpm<br>
&gt; +Upstream commit <a href=3D"https://github.com/pyca/cryptography/commi=
t/4a12cf49675a184e47f912b00b04f3a629283582" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/pyca/cryptography/commit/4a12cf49675a184e47f912b00=
b04f3a629283582</a>]<br>
&gt; +CVE: CVE-2026-69249<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + .../cryptography-x509-verification/src/lib.rs | 209 ++++++++++++++++=
+-<br>
&gt; + .../src/policy/mod.rs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
&gt; + 2 files changed, 208 insertions(+), 9 deletions(-)<br>
<br>
When I compare CVE-2026-69249-signature-validation-budget.patch in<br>
python-cryptography-42.0.4-slfo.1.1_6.1.src.rpm and this patch, I get a<br>
lot of diffs that don&#39;t look trivial to me (In particular, some hunks<b=
r>
about the budget handling disapear...)<br></blockquote><div><br></div><div>=
the budget-handling changes that are missing from our version of the patch =
are already present in our codebase. Therefore, those hunks were not includ=
ed in the backport.=C2=A0so those changes were not applied again.=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Can you explain how/why did you change the upstream patch to match our<br>
code?<br>
<br>
Please send a v2 of this series with:<br>
* URLs to download the Suze archive<br>
* backport changes for this patch (2/3 also had changes but those were<br>
=C2=A0 easy to understand)<br>
?<br></blockquote><div><br></div><div>I will send the updated v2 series sho=
rtly.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks!<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br></blockquote><div><br></div><div>Thanks &amp; Regards,<br></div><div>Vi=
jay=C2=A0</div></div></div>

--000000000000a7a656065c0c6f87--

