Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12DA1C52D7C
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 10:45:05 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.81391.1723200298212769201
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Aug 2024 03:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=blNHhzqV;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7b0c9bbddb4so1321185a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 03:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723200297; x=1723805097; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ukwRfwN1vWuSBUXG9cCwdwXtoBLnduZxDB7Zu3tbY5c=;
        b=blNHhzqVWJwZDwdAH17h8IXGi29ObslDvs7R9szmCMYStIxaCqUYuY6nIxknoZtkT2
         P2xTGjcK5h6Z3nPOYpm3AmcR6B3EYPEoFwGnF4XXIzSMNcLhSm4LLkc1HJ6NseAR2E2d
         qyNSSGMSfDtxdlo70759cU+3q5aOprgo4MedEMaiUbsdGXCEcoTf80Q0KvKdzw725j/F
         KyNDiJfzrfySZen4J0Ija4wt7Io9HgUFiAUn0QqZ6VdRMmxIXdlPkjeKBgErkDXPzdpQ
         BnBQoQwZURjOeLfQdiIkPJy5eXfHgg0GTMH4xsX6C2l1OPGMeqpaO8iN66iqxilDU7J9
         YGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723200297; x=1723805097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ukwRfwN1vWuSBUXG9cCwdwXtoBLnduZxDB7Zu3tbY5c=;
        b=ge0qD7vIeSHLTd2uKDZMJHQR/4d4IybxiXEjtCtsM08XG3akEGDd4AjY48zCFN07Tw
         Ocwq1kUhMOvsSIDdzzWqQXtjjcrJ/26uWsKwRT51cDahDRP6vK1+DwovVvi6f00V5+gt
         VgYuwAyhhqNEUIql+rSj7dM+soNx/xJY+VM7Gw5O6DJHIAupcJNaBCTmYbDFpDrmoKlJ
         ZKBqTrcNJGavRgG14EXWcJ5cci6LF+1xtukvoM0dk1IoL1bDmjwLzPTndC+zRrxFJJ30
         DhYUQsRNOKXPgjp0YpoHtZdqesZob15a7DBzhuWHLQVOipOW77Xc7mQHa64eiQZsRImG
         LDRw==
X-Gm-Message-State: AOJu0YzgCQFY6J0safbNZLKtySWSiWn5JpMTrp70MjLQDodxQIlgsiIn
	hbcjHxaKpRfwL9hBc3Z36hJDPvX9DZ8AH/e5w8uuh3SpBZzec5vyAx52Kq/PNdOIBDA0GDWY0DZ
	JCgsjHjybCwO32lRRFNkNvYrDBGQ=
X-Google-Smtp-Source: AGHT+IHmjUaFdWVThwu/fjh2b/XqilmP7Nx7dmoJJvLKeb9KPLHN+wo8H2mujZfW9A5yt4AwQHI0GO6vZvcggkjcrYY=
X-Received: by 2002:a05:6a20:c6c1:b0:1c3:a9b8:a9bf with SMTP id
 adf61e73a8af0-1c8a00edfaemr1168424637.51.1723200297372; Fri, 09 Aug 2024
 03:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240809062339.15465-1-marta.rybczynska@syslinbit.com> <AS1PR10MB5697F5AC1D5981DC3523D59BFDBA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697F5AC1D5981DC3523D59BFDBA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 9 Aug 2024 12:44:45 +0200
Message-ID: <CAApg2=RkZYdrycdS0_JMYJOHhb=7OpjZXH7wjQj0oBZYrQiBkQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH 1/2] cve-check: encode affected
 product/vendor in CVE_STATUS
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Content-Type: multipart/alternative; boundary="0000000000009a176d061f3dd556"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 10:45:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203163

--0000000000009a176d061f3dd556
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 9:07=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.co=
m> wrote:

>
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Marta Rybczynska via
> > lists.openembedded.org
> > Sent: Friday, August 9, 2024 8:24
> > To: openembedded-core@lists.openembedded.org
> > Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
> > Subject: [OE-core] [RFC][PATCH 1/2] cve-check: encode affected
> > product/vendor in CVE_STATUS
> >
> > CVE_STATUS contains assesment of a given CVE, but until now it didn't
> have
> > include the affected vendor/product. In the case of a global system
> include,
> > that CVE_STATUS was visible in all recipes.
> >
> > This patch allows encoding of affected product/vendor to each CVE_STATU=
S
> > assessment, also for groups. We can then filter them later and use only
> > CVEs that correspond to the recipe.
> >
> > This is going to be used in
> meta/conf/distro/include/cve-extra-exclusions.inc
> > and similar places.
> >
> > Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
> > ---
> >  meta/classes/cve-check.bbclass | 24 ++++++++++++------------
> >  meta/lib/oe/cve_check.py       | 22 +++++++++++++---------
> >  meta/lib/oe/spdx30_tasks.py    | 11 ++++++-----
> >  3 files changed, 31 insertions(+), 26 deletions(-)
> >
> > diff --git a/meta/classes/cve-check.bbclass
> b/meta/classes/cve-check.bbclass
> > index c946de29a4..bc35a1c53c 100644
> > --- a/meta/classes/cve-check.bbclass
> > +++ b/meta/classes/cve-check.bbclass
> > @@ -324,8 +324,8 @@ def check_cves(d, patched_cves):
> >      # Convert CVE_STATUS into ignored CVEs and check validity
> >      cve_ignore =3D []
> >      for cve in (d.getVarFlags("CVE_STATUS") or {}):
> > -        decoded_status, _, _ =3D decode_cve_status(d, cve)
> > -        if decoded_status =3D=3D "Ignored":
> > +        decoded_status =3D decode_cve_status(d, cve)
> > +        if 'mapping' in decoded_status and decoded_status['mapping'] =
=3D=3D
> > "Ignored":
> >              cve_ignore.append(cve)
> >
> >      import sqlite3
> > @@ -507,11 +507,11 @@ def cve_write_data_text(d, patched, unpatched,
> > ignored, cve_data):
> >          write_string +=3D "PACKAGE VERSION: %s%s\n" %
> (d.getVar("EXTENDPE"),
> > d.getVar("PV"))
> >          write_string +=3D "CVE: %s\n" % cve
> >          write_string +=3D "CVE STATUS: %s\n" % status
> > -        _, detail, description =3D decode_cve_status(d, cve)
> > -        if detail:
> > -            write_string +=3D "CVE DETAIL: %s\n" % detail
> > -        if description:
> > -            write_string +=3D "CVE DESCRIPTION: %s\n" % description
> > +        status_details =3D decode_cve_status(d, cve)
> > +        if 'detail' in status_details:
> > +            write_string +=3D "CVE DETAIL: %s\n" %
> status_details['detail']
> > +        if 'description' in status_details:
> > +            write_string +=3D "CVE DESCRIPTION: %s\n" %
> > status_details['description']
> >          write_string +=3D "CVE SUMMARY: %s\n" % cve_data[cve]["summary=
"]
> >          write_string +=3D "CVSS v2 BASE SCORE: %s\n" %
> cve_data[cve]["scorev2"]
> >          write_string +=3D "CVSS v3 BASE SCORE: %s\n" %
> cve_data[cve]["scorev3"]
> > @@ -637,11 +637,11 @@ def cve_write_data_json(d, patched, unpatched,
> > ignored, cve_data, cve_status):
> >              "status" : status,
> >              "link": issue_link
> >          }
> > -        _, detail, description =3D decode_cve_status(d, cve)
> > -        if detail:
> > -            cve_item["detail"] =3D detail
> > -        if description:
> > -            cve_item["description"] =3D description
> > +        status_details =3D decode_cve_status(d, cve)
> > +        if 'detail' in status_details:
> > +            cve_item["detail"] =3D status_details['detail']
> > +        if 'description' in status_details:
> > +            cve_item["description"] =3D status_details['description']
> >          cve_list.append(cve_item)
> >
> >      package_data["issue"] =3D cve_list
> > diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
> > index ed5c714cb8..f71fdc672c 100644
> > --- a/meta/lib/oe/cve_check.py
> > +++ b/meta/lib/oe/cve_check.py
> > @@ -132,8 +132,8 @@ def get_patched_cves(d):
> >
> >      # Search for additional patched CVEs
> >      for cve in (d.getVarFlags("CVE_STATUS") or {}):
> > -        decoded_status, _, _ =3D decode_cve_status(d, cve)
> > -        if decoded_status =3D=3D "Patched":
> > +        decoded_status =3D decode_cve_status(d, cve)
> > +        if 'mapping' in decoded_status and decoded_status['mapping'] =
=3D=3D
> > "Patched":
> >              bb.debug(2, "CVE %s is additionally patched" % cve)
> >              patched_cves.add(cve)
> >
> > @@ -227,19 +227,23 @@ def convert_cve_version(version):
> >
> >  def decode_cve_status(d, cve):
> >      """
> > -    Convert CVE_STATUS into status, detail and description.
> > +    Convert CVE_STATUS into status, vendor, product, detail and
> description.
> >      """
> >      status =3D d.getVarFlag("CVE_STATUS", cve)
> >      if not status:
> > -        return ("", "", "")
> > +        return {}
> >
> > -    status_split =3D status.split(':', 1)
> > -    detail =3D status_split[0]
> > -    description =3D status_split[1].strip() if (len(status_split) > 1)
> else ""
> > +    status_split =3D status.split(':', 3)
>
> This effectively forbids usage of ":" in CVE_STATUS.
> Since "grep -RI 'CVE_STATUS.*:.*:'" already yiealds 8 results for oe-core
> + meta-oe, this is not a good idea.
> I'd propose to keep the original split and check the first word of the
> second part; something like:
>
> if status_split[1].strip().startswith('cpe:'):
>     extracted_cpe, status_split[1] =3D status_split[1].strip().split(' ',=
 1)
>     # fourth part is important here to not keep possible trailing ":" in
> product
>     extracted_cpe_split =3D extracted_cpe.split(':', 4)
>     status_out['vendor'] =3D "*" if len(extracted_cpe_split) =3D=3D 2 or
> len(extracted_cpe_split[2] =3D=3D 0) else extracted_cpe_split[1]
>     status_out['product'] =3D extracted_cpe_split[2] if
> len(extracted_cpe_split) >=3D 3 and len(extracted_cpe_split[2] > 0) else
> extracted_cpe_split[1]
> else:
>     status_out['vendor'] =3D "*"
>     status_out['product'] =3D "*"
>
>
A valid point indeed. The "cpe:" prefix is a good idea. However, I think
that splitting on ' ' isn't a very good idea either.
What about assuming that: if you give the "cpe:" part, then you always give
both vendor and product. What will be valable
ignored:cpe:*:*:some description
ignored:cpe:*:*:some description::
ignored:cpe:vendor:product:some description::

but not
ignored:cpe:product:some description::

Kind regards,
Marta

--0000000000009a176d061f3dd556
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 9, 2024 at 9:07=E2=80=AFA=
M Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@siemens.com">Peter.Marko@s=
iemens.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Marta Rybczynska via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; Sent: Friday, August 9, 2024 8:24<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Marta Rybczynska &lt;<a href=3D"mailto:marta.rybczynska@syslinbit.=
com" target=3D"_blank">marta.rybczynska@syslinbit.com</a>&gt;<br>
&gt; Subject: [OE-core] [RFC][PATCH 1/2] cve-check: encode affected<br>
&gt; product/vendor in CVE_STATUS<br>
&gt; <br>
&gt; CVE_STATUS contains assesment of a given CVE, but until now it didn&#3=
9;t have<br>
&gt; include the affected vendor/product. In the case of a global system in=
clude,<br>
&gt; that CVE_STATUS was visible in all recipes.<br>
&gt; <br>
&gt; This patch allows encoding of affected product/vendor to each CVE_STAT=
US<br>
&gt; assessment, also for groups. We can then filter them later and use onl=
y<br>
&gt; CVEs that correspond to the recipe.<br>
&gt; <br>
&gt; This is going to be used in meta/conf/distro/include/cve-extra-exclusi=
ons.inc<br>
&gt; and similar places.<br>
&gt; <br>
&gt; Signed-off-by: Marta Rybczynska &lt;<a href=3D"mailto:marta.rybczynska=
@syslinbit.com" target=3D"_blank">marta.rybczynska@syslinbit.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 meta/classes/cve-check.bbclass | 24 ++++++++++++------------<br>
&gt;=C2=A0 meta/lib/oe/cve_check.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 22 ++++++++=
+++++---------<br>
&gt;=C2=A0 meta/lib/oe/spdx30_tasks.py=C2=A0 =C2=A0 | 11 ++++++-----<br>
&gt;=C2=A0 3 files changed, 31 insertions(+), 26 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.b=
bclass<br>
&gt; index c946de29a4..bc35a1c53c 100644<br>
&gt; --- a/meta/classes/cve-check.bbclass<br>
&gt; +++ b/meta/classes/cve-check.bbclass<br>
&gt; @@ -324,8 +324,8 @@ def check_cves(d, patched_cves):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Convert CVE_STATUS into ignored CVEs and check v=
alidity<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cve_ignore =3D []<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for cve in (d.getVarFlags(&quot;CVE_STATUS&quot;) =
or {}):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 decoded_status, _, _ =3D decode_cve_statu=
s(d, cve)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if decoded_status =3D=3D &quot;Ignored&qu=
ot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 decoded_status =3D decode_cve_status(d, c=
ve)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;mapping&#39; in decoded_status an=
d decoded_status[&#39;mapping&#39;] =3D=3D<br>
&gt; &quot;Ignored&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_ignore.append(cve)=
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 import sqlite3<br>
&gt; @@ -507,11 +507,11 @@ def cve_write_data_text(d, patched, unpatched,<b=
r>
&gt; ignored, cve_data):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_string +=3D &quot;PACKAGE VERS=
ION: %s%s\n&quot; % (d.getVar(&quot;EXTENDPE&quot;),<br>
&gt; d.getVar(&quot;PV&quot;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_string +=3D &quot;CVE: %s\n&qu=
ot; % cve<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_string +=3D &quot;CVE STATUS: =
%s\n&quot; % status<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 _, detail, description =3D decode_cve_sta=
tus(d, cve)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if detail:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_string +=3D &quot;CVE=
 DETAIL: %s\n&quot; % detail<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if description:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_string +=3D &quot;CVE=
 DESCRIPTION: %s\n&quot; % description<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 status_details =3D decode_cve_status(d, c=
ve)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;detail&#39; in status_details:<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_string +=3D &quot;CVE=
 DETAIL: %s\n&quot; % status_details[&#39;detail&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;description&#39; in status_detail=
s:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_string +=3D &quot;CVE=
 DESCRIPTION: %s\n&quot; %<br>
&gt; status_details[&#39;description&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_string +=3D &quot;CVE SUMMARY:=
 %s\n&quot; % cve_data[cve][&quot;summary&quot;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_string +=3D &quot;CVSS v2 BASE=
 SCORE: %s\n&quot; % cve_data[cve][&quot;scorev2&quot;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_string +=3D &quot;CVSS v3 BASE=
 SCORE: %s\n&quot; % cve_data[cve][&quot;scorev3&quot;]<br>
&gt; @@ -637,11 +637,11 @@ def cve_write_data_json(d, patched, unpatched,<b=
r>
&gt; ignored, cve_data, cve_status):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;status&quot; : s=
tatus,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;link&quot;: issu=
e_link<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 _, detail, description =3D decode_cve_sta=
tus(d, cve)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if detail:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_item[&quot;detail&quot;=
] =3D detail<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if description:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_item[&quot;description&=
quot;] =3D description<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 status_details =3D decode_cve_status(d, c=
ve)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;detail&#39; in status_details:<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_item[&quot;detail&quot;=
] =3D status_details[&#39;detail&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;description&#39; in status_detail=
s:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_item[&quot;description&=
quot;] =3D status_details[&#39;description&#39;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_list.append(cve_item)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 package_data[&quot;issue&quot;] =3D cve_list<br>
&gt; diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py<br>
&gt; index ed5c714cb8..f71fdc672c 100644<br>
&gt; --- a/meta/lib/oe/cve_check.py<br>
&gt; +++ b/meta/lib/oe/cve_check.py<br>
&gt; @@ -132,8 +132,8 @@ def get_patched_cves(d):<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Search for additional patched CVEs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for cve in (d.getVarFlags(&quot;CVE_STATUS&quot;) =
or {}):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 decoded_status, _, _ =3D decode_cve_statu=
s(d, cve)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if decoded_status =3D=3D &quot;Patched&qu=
ot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 decoded_status =3D decode_cve_status(d, c=
ve)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;mapping&#39; in decoded_status an=
d decoded_status[&#39;mapping&#39;] =3D=3D<br>
&gt; &quot;Patched&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(2, &quot;CVE =
%s is additionally patched&quot; % cve)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patched_cves.add(cve)<=
br>
&gt; <br>
&gt; @@ -227,19 +227,23 @@ def convert_cve_version(version):<br>
&gt; <br>
&gt;=C2=A0 def decode_cve_status(d, cve):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; -=C2=A0 =C2=A0 Convert CVE_STATUS into status, detail and description.=
<br>
&gt; +=C2=A0 =C2=A0 Convert CVE_STATUS into status, vendor, product, detail=
 and description.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 status =3D d.getVarFlag(&quot;CVE_STATUS&quot;, cv=
e)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if not status:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (&quot;&quot;, &quot;&quot;, &quot=
;&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return {}<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 status_split =3D status.split(&#39;:&#39;, 1)<br>
&gt; -=C2=A0 =C2=A0 detail =3D status_split[0]<br>
&gt; -=C2=A0 =C2=A0 description =3D status_split[1].strip() if (len(status_=
split) &gt; 1) else &quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 status_split =3D status.split(&#39;:&#39;, 3)<br>
<br>
This effectively forbids usage of &quot;:&quot; in CVE_STATUS.<br>
Since &quot;grep -RI &#39;CVE_STATUS.*:.*:&#39;&quot; already yiealds 8 res=
ults for oe-core + meta-oe, this is not a good idea.<br>
I&#39;d propose to keep the original split and check the first word of the =
second part; something like:<br>
<br>
if status_split[1].strip().startswith(&#39;cpe:&#39;):<br>
=C2=A0 =C2=A0 extracted_cpe, status_split[1] =3D status_split[1].strip().sp=
lit(&#39; &#39;, 1)<br>
=C2=A0 =C2=A0 # fourth part is important here to not keep possible trailing=
 &quot;:&quot; in product<br>
=C2=A0 =C2=A0 extracted_cpe_split =3D extracted_cpe.split(&#39;:&#39;, 4)<b=
r>
=C2=A0 =C2=A0 status_out[&#39;vendor&#39;] =3D &quot;*&quot; if len(extract=
ed_cpe_split) =3D=3D 2 or len(extracted_cpe_split[2] =3D=3D 0) else extract=
ed_cpe_split[1]<br>
=C2=A0 =C2=A0 status_out[&#39;product&#39;] =3D extracted_cpe_split[2] if l=
en(extracted_cpe_split) &gt;=3D 3 and len(extracted_cpe_split[2] &gt; 0) el=
se extracted_cpe_split[1]<br>
else:<br>
=C2=A0 =C2=A0 status_out[&#39;vendor&#39;] =3D &quot;*&quot;<br>
=C2=A0 =C2=A0 status_out[&#39;product&#39;] =3D &quot;*&quot;<br>
<br></blockquote><div><br></div><div>A valid point indeed. The &quot;cpe:&q=
uot; prefix is a good idea. However, I think that splitting on &#39; &#39; =
isn&#39;t a very good idea either.</div><div>What about assuming that: if y=
ou give the &quot;cpe:&quot; part, then you always give both vendor and pro=
duct. What will be valable</div><div>ignored:cpe:*:*:some description</div>=
<div>ignored:cpe:*:*:some description::</div><div>ignored:cpe:vendor:produc=
t:some description::</div><div><br></div><div>but not</div><div>ignored:cpe=
:product:some description::<br></div><div><br></div><div>Kind regards,</div=
><div>Marta <br></div></div></div>

--0000000000009a176d061f3dd556--

