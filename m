Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37DFC25B40
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 07:56:56 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web11.49751.1697788615978304262
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 00:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UjsJHvqI;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-45845db2d63so173712137.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 00:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697788615; x=1698393415; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9UI6xfCuXRG9vPvxR8OIETLWTM9hTr2sMpeZHw1zgQk=;
        b=UjsJHvqI0QCVONqH7Gckl//WpnS5lmQAe2Er2jUGxqmjNzKmMY2gxYY9HDghyp1Yg0
         rxnuQj9mHSIMuM1GQ7GfJcj2KZY83VlDqgQK9PPMOA9rUIbNcnchctUWg2iZT9m07zoi
         43GCeoilCJrb9NuqhZUzm4fvXqOboTMSdFqSH/djpLrQMV6cihv2t3SaPR0uJ+wfszDJ
         wYvNcTEyAw6QD4P+cvcJIeFSCG/zd6k/eBD0gBbilECkknM3+q7/fZ+1sCAY0zCKnzsj
         I5isUyjuSNaFHKjbeOUz+aNXcEFl5vGF8UhA2hVBcbphf9nxIqG0yLYtqfSY9b5FJu+t
         2nlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697788615; x=1698393415;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9UI6xfCuXRG9vPvxR8OIETLWTM9hTr2sMpeZHw1zgQk=;
        b=pFuRPFLZi4loPb9riC4V24puS2h0VtLpSC3LrrICNtN9dhYLKKUoim/AJ6vbO7F4uG
         kuG2T+o1rILoYKWlAOjCQEmBUC12pKdt9Gmn7gv9MclkNFFqtBXgdYzd3A4jT2uoprCw
         CH2Huoje+jf7/zYrIrylRY5apDGDIyf95s/A8QbV9NWgFVp95lL8frZY8eIKJAPA3FZX
         FuEnD4VY3CvT9svVnInIiwHmc+01qMF/EKJBSyyekYR9JE+k4DuAp7knaM6RVP276r1s
         lB1PS0Lc0QIpqHLWN+sOu1WbDViVuQJ/im2KtwubCMIXh5H/8EGUWBNDVDaD+Fklix/x
         grlA==
X-Gm-Message-State: AOJu0YzYX8/lRoRS2hQhWppecyALatW61ob4fR6J1tS8pJBb2XEQ5QaJ
	JnhCYQMuNIihS/3hbup1xW+zR5pySNgy5oCfQoQ=
X-Google-Smtp-Source: AGHT+IGg3Kbgn9OOxUQbHw00DwROQ8H3rcKDEC6eEd6vtLywLtluTH4Tjf0YFGQcRnriUbVCNqAsZOaSKwJAweGaxh0=
X-Received: by 2002:a67:a205:0:b0:457:dac4:2af8 with SMTP id
 l5-20020a67a205000000b00457dac42af8mr1346532vse.2.1697788614830; Fri, 20 Oct
 2023 00:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20231016070106.2772303-1-mikko.rapeli@linaro.org>
 <CAApg2=SGxxCJ1yuXoMD6=ySRsL-Z2=rENw6xxn-dpQZ-Ta+4rA@mail.gmail.com>
 <ZTDzOs9PFGJUmIRG@nuoska> <CANPvuRn1q0a63ZWyYer8LP0htmo7cBwyX6LTv_=ipZFcJq3j9Q@mail.gmail.com>
 <178F819D833CF586.20272@lists.openembedded.org> <ZTElA8Z1bwg4uRwm@nuoska>
In-Reply-To: <ZTElA8Z1bwg4uRwm@nuoska>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 20 Oct 2023 08:56:43 +0100
Message-ID: <CANPvuRk8DGf9Labu0bD+2=vPZcb_E3StzBZ9TcS_TusiXM7ZBA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check.bbclass: support embedded SW
 components with different version number
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Marta Rybczynska <rybczynska@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004a738a06082137c9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 07:56:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189502

--0000000000004a738a06082137c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mikko Rapeli <mikko.rapeli@linaro.org> escreveu no dia quinta, 19/10/2023
=C3=A0(s) 13:45:

> Hi,
>
> Could something like this work?
>
> --- a/meta/lib/oe/cve_check.py
> +++ b/meta/lib/oe/cve_check.py
> @@ -140,15 +140,14 @@ def get_patched_cves(d):
>      return patched_cves
>
>
> -def get_cpe_ids(cve_product, version):
> +def get_cpe_ids(cve_product, cve_version):
>      """
>      Get list of CPE identifiers for the given product and version
>      """
>
> -    version =3D version.split("+git")[0]
> -
>      cpe_ids =3D []
>      for product in cve_product.split():
> +        version =3D (d.getVar("CVE_VERSION_%s" % product) or
> cve_version).split("+git")[0]
>

Looks like your patch fixes the remaining issue
but don't know if it will be better to get the CVE_VERSION_ after
splitting  the vendor from the product

Jose


>          # CVE_PRODUCT in recipes may include vendor information for CPE
> identifiers. If not,
>          # use wildcard for vendor.
>          if ":" in product:
>
> Cheers,
>
> -Mikko
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000004a738a06082137c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Mikko Rapeli &lt;<a href=3D"mailto:mi=
kko.rapeli@linaro.org">mikko.rapeli@linaro.org</a>&gt; escreveu no dia quin=
ta, 19/10/2023 =C3=A0(s) 13:45:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Hi,<br>
<br>
Could something like this work?<br>
<br>
--- a/meta/lib/oe/cve_check.py<br>
+++ b/meta/lib/oe/cve_check.py<br>
@@ -140,15 +140,14 @@ def get_patched_cves(d):<br>
=C2=A0 =C2=A0 =C2=A0return patched_cves<br>
<br>
<br>
-def get_cpe_ids(cve_product, version):<br>
+def get_cpe_ids(cve_product, cve_version):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0Get list of CPE identifiers for the given product and v=
ersion<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
<br>
-=C2=A0 =C2=A0 version =3D version.split(&quot;+git&quot;)[0]<br>
-<br>
=C2=A0 =C2=A0 =C2=A0cpe_ids =3D []<br>
=C2=A0 =C2=A0 =C2=A0for product in cve_product.split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 version =3D (d.getVar(&quot;CVE_VERSION_%s&quo=
t; % product) or cve_version).split(&quot;+git&quot;)[0]<br></blockquote><d=
iv><br></div><div>Looks like your patch fixes the remaining issue=C2=A0</di=
v><div>but don&#39;t know=C2=A0if it will be better to get the CVE_VERSION_=
 after splitting=C2=A0 the vendor from the product</div><div><br>Jose</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# CVE_PRODUCT in recipes may include vend=
or information for CPE identifiers. If not,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# use wildcard for vendor.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &quot;:&quot; in product:<br>
<br>
Cheers,<br>
<br>
-Mikko<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000004a738a06082137c9--

