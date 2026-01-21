Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C07C44502
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 09:41:50 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8240.1768988501724533448
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 01:41:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=To5Q9DiN;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801c314c84so41830725e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 01:41:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768988500; cv=none;
        d=google.com; s=arc-20240605;
        b=Udv/nLFVXfCLlmMO/8ctBStFTRuBBGmXZsXbsp91vgK1aAUepAHxTau10QnyEZ8Xx4
         DWa1jBadeqRURWtAWFQugdtVAApjMa8gWS8vx7eZ5P+f7ArZdEqdOPgNA5kuye/obEqX
         3a4sb3NR65PfzKzbGuHIZjUA/tQnVEse7FL2RnBhhou4ve5ViqlmwcosZXKTaIglnFwN
         MELVpb9ju+B45yyqN5xQmB4gahFwSI1zC/NIUqcEI5iis5LDtfPfrujhke2mFtll1KMT
         ucLTUBTyaiHkpAD3p+e1/QgkZJhIXwokATcVjZO8Ap/tXVCguBbuOt0+UBgWF3sPlPr0
         l7kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UaQ+uwwROKpCxgWMReNH8iAVn4tJtIiFHYHaQcBLzOY=;
        fh=f7d77iW+cOLDAQ5JM76E7JJnVlpm7rs6yPeNh/Xlh9U=;
        b=CHetlqcQC4b2XQsvrO07/+XtxrkvrVnYikZ7+uaShcj3mDfe/IKU3YXwUxHYgRY+to
         3xuVIGWUucWvNTc0y7h9vCRYDoTQ5X/Ji1lpPcal8no8ht5mqOLjVC/Sm0rJt3pVxMyR
         Uoo4f+vni9pW0HVyeKYP/jELGvOgLdIO4D+TrC/wLpWxDFOGgGG2go8e7eApkK7NkgD/
         3TwJ2zamkQHnwph97BKua4eB6Wp2aoHeaJr0Id/7lXs6OFXV5BWqKy/QaDHoHDOGktMR
         xXyjEEcaT3Ts6QG8gLgh0F0skYxpKXenSV/gWUMZHDzOah6A/OsUvQyM0SOLMRd+k3Iz
         7y6w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768988500; x=1769593300; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UaQ+uwwROKpCxgWMReNH8iAVn4tJtIiFHYHaQcBLzOY=;
        b=To5Q9DiNMGfqIhqRx9Wj9kZ8dfDB/uBrEr7qjU70/KhIOwTy/4807JJDo6zfsicvd+
         CwCdDOo8Kjxtdhuo2/s2kHXb0lolV7tESEWyNCMZeGgTsauRKeeBKGKFKBaN94IXbxG8
         ZIluHPybKvUVtebSEv5kYy3NZqwD1BnurKsAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768988500; x=1769593300;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaQ+uwwROKpCxgWMReNH8iAVn4tJtIiFHYHaQcBLzOY=;
        b=HcNrzrrDvOJ/tsZecUg4cAEv9qOwfyCQK3qYcWVfCGz/9YGhqGz2J+en/+zNyvEY6R
         6CUaXiIkDpIdxSMjfdYEI8z1FSy49AlRszC7DNXdKAuS0Z+3ZHiRNmjTdVQyGVcdE+ps
         73IxGaTzuHHTn++VcPw1ygjuPKZnLRu0Cu0KXHK6Gino1V4H3NLBKcLsqLj6yIok1Pft
         NlxIgTg0PQoShx/XWyD6AUm7vU5dY/0ITxs78mzZvkSmcUh3TlKNcyfZ2juOnJT5luoM
         sqJNDM0XVdq9ZXN62ARZ/g3/u5k0UAKWoMLAqoeN/fLmc8kkfqIcpawlVJth9MxEWJmM
         LqKQ==
X-Gm-Message-State: AOJu0YydEGeTWtsvcJrlGGgsYU1hQS+yxUSxGxmkrT+HD9zsTb0Skd74
	ch8la8P8fELos0r41HYhjxt3o/Ds2C3KAe01Z4MeSzbUU2NjAu0exfCRa14GPzSw2ydjZsVNoS1
	wyr1KbvJxwDBfR7tBFUj8GUZ4jT2fNw7osN6Um0L0PQ==
X-Gm-Gg: AZuq6aK55WBVsjfz0BYYLcFZC5HWnxhUBDSL15lAfgzFbFEnlatsXKpPmwz7nLo6sUu
	o24sLtQtqzCGnIFq69BugD1ibrNwV+9+4vw4Unejw8lL3N9bDNMGpJy0XxbgSYLYx8bmlBm+zrY
	68V73BzLND7HBEp4Om2vqlDnJtqcSy05vfneM0tZB/SV+ohga+8qQXwmnyFsNfQSjdpWZMS7J/o
	ixpPr58C3uGrOCrDC8uEc0Jt2DsKtuM51/Z2aAy53sPD351CdjMErN3YYOcVIpAkJghXlmANA==
X-Received: by 2002:a05:600c:1991:b0:47e:e4ff:e2ac with SMTP id
 5b1f17b1804b1-4801e356cebmr226979495e9.33.1768988499913; Wed, 21 Jan 2026
 01:41:39 -0800 (PST)
MIME-Version: 1.0
References: <20260121092250.3847197-1-hetpat@cisco.com>
In-Reply-To: <20260121092250.3847197-1-hetpat@cisco.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 21 Jan 2026 10:41:13 +0100
X-Gm-Features: AZwV_Qh_hP3a553mBoGNdFwc-BQYK2rljd3vaxESvJyTFVeMMmrHTRuSJy1t7Us
Message-ID: <CAMSfU+5=MkRv-t2Kn5wQR2GhC+TzCPzYt2WOabvQayzuxODLNw@mail.gmail.com>
Subject: Re: [OE-core] [master] [PATCH] cve-update-nvd2-native: Use maximum
 CVSS score from all sources
To: hetpat@cisco.com
Cc: openembedded-core@lists.openembedded.org, xe-linux-external@cisco.com
Content-Type: multipart/alternative; boundary="000000000000263e2a0648e2bb14"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 09:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229802

--000000000000263e2a0648e2bb14
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le mer. 21 janv. 2026 =C3=A0 10:22, Het Patel via lists.openembedded.org <h=
etpat=3D
cisco.com@lists.openembedded.org> a =C3=A9crit :

> From: Het Patel <hetpat@cisco.com>
>
> The CVE check system was incorrectly reporting lower CVSS scores when
> multiple scoring sources were available in the NVD database. This
> occurred because the code only extracted the first element from the
> CVSSv2, CVSSv3, and CVSSv4 metrics arrays, which could be a Secondary
> source with a lower score instead of the Primary source with the
> actual severity score.
>
> This fix takes maximum CVSS score.
>
> Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15931


The proper way to reference a bug is "Fixes [YOCTO #bug-id]" (see
https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#imp=
lement-and-commit-changes
)

You don't need to specify [master] in the subject as it is the default.

When you send a new patch following reviews, please increment its version
: [PATCH] -> [PATCH v2] -> [PATCH v3] -> ...
For example, now, you could send a "[PATCH v2] cve-update-nvd2-native: Use
maximum CVSS score from all sources"

Thanks!

Signed-off-by: Het Patel <hetpat@cisco.com>
> ---
>  .../meta/cve-update-nvd2-native.bb            | 55 +++++++++++++------
>  1 file changed, 39 insertions(+), 16 deletions(-)
>
> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> index 8c8148dd92..41c34ba0d0 100644
> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> @@ -350,32 +350,55 @@ def update_db(conn, elt):
>          if desc['lang'] =3D=3D 'en':
>              cveDesc =3D desc['value']
>      date =3D elt['cve']['lastModified']
> +
> +    # Extract maximum CVSS scores from all sources (Primary and Secondar=
y)
> +    cvssv2 =3D 0.0
>      try:
> -        accessVector =3D
> elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['accessVector']
> -        vectorString =3D
> elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['vectorString']
> -        cvssv2 =3D
> elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['baseScore']
> +        # Iterate through all cvssMetricV2 entries and find the maximum
> score
> +        for metric in elt['cve']['metrics']['cvssMetricV2']:
> +            score =3D metric['cvssData']['baseScore']
> +            if score > cvssv2:
> +                cvssv2 =3D score
> +                accessVector =3D metric['cvssData']['accessVector']
> +                vectorString =3D metric['cvssData']['vectorString']
>      except KeyError:
> -        cvssv2 =3D 0.0
> -    cvssv3 =3D None
> +        pass
> +
> +    cvssv3 =3D 0.0
>      try:
> -        accessVector =3D accessVector or
> elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['attackVector']
> -        vectorString =3D vectorString or
> elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['vectorString']
> -        cvssv3 =3D
> elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['baseScore']
> +        # Iterate through all cvssMetricV30 entries and find the maximum
> score
> +        for metric in elt['cve']['metrics']['cvssMetricV30']:
> +            score =3D metric['cvssData']['baseScore']
> +            if score > cvssv3:
> +                cvssv3 =3D score
> +                accessVector =3D accessVector or
> metric['cvssData']['attackVector']
> +                vectorString =3D vectorString or
> metric['cvssData']['vectorString']
>      except KeyError:
>          pass
> +
>      try:
> -        accessVector =3D accessVector or
> elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['attackVector']
> -        vectorString =3D vectorString or
> elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['vectorString']
> -        cvssv3 =3D cvssv3 or
> elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['baseScore']
> +        # Iterate through all cvssMetricV31 entries and find the maximum
> score
> +        for metric in elt['cve']['metrics']['cvssMetricV31']:
> +            score =3D metric['cvssData']['baseScore']
> +            if score > cvssv3:
> +                cvssv3 =3D score
> +                accessVector =3D accessVector or
> metric['cvssData']['attackVector']
> +                vectorString =3D vectorString or
> metric['cvssData']['vectorString']
>      except KeyError:
>          pass
> -    cvssv3 =3D cvssv3 or 0.0
> +
> +    cvssv4 =3D 0.0
>      try:
> -        accessVector =3D accessVector or
> elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['attackVector']
> -        vectorString =3D vectorString or
> elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['vectorString']
> -        cvssv4 =3D
> elt['cve']['metrics']['cvssMetricV40'][0]['cvssData']['baseScore']
> +        # Iterate through all cvssMetricV40 entries and find the maximum
> score
> +        for metric in elt['cve']['metrics']['cvssMetricV40']:
> +            score =3D metric['cvssData']['baseScore']
> +            if score > cvssv4:
> +                cvssv4 =3D score
> +                accessVector =3D accessVector or
> metric['cvssData']['attackVector']
> +                vectorString =3D vectorString or
> metric['cvssData']['vectorString']
>      except KeyError:
> -        cvssv4 =3D 0.0
> +        pass
> +
>      accessVector =3D accessVector or "UNKNOWN"
>      vectorString =3D vectorString or "UNKNOWN"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229800):
> https://lists.openembedded.org/g/openembedded-core/message/229800
> Mute This Topic: https://lists.openembedded.org/mt/117378826/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000263e2a0648e2bb14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello,</div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 21 janv. 2026 =C3=
=A0=C2=A010:22, Het Patel via <a href=3D"http://lists.openembedded.org" tar=
get=3D"_blank">lists.openembedded.org</a> &lt;hetpat=3D<a href=3D"mailto:ci=
sco.com@lists.openembedded.org" target=3D"_blank">cisco.com@lists.openembed=
ded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">From: Het Patel &lt;<a href=3D"mailto:hetpat@cisco.com"=
 target=3D"_blank">hetpat@cisco.com</a>&gt;<br>
<br>
The CVE check system was incorrectly reporting lower CVSS scores when<br>
multiple scoring sources were available in the NVD database. This<br>
occurred because the code only extracted the first element from the<br>
CVSSv2, CVSSv3, and CVSSv4 metrics arrays, which could be a Secondary<br>
source with a lower score instead of the Primary source with the<br>
actual severity score.<br>
<br>
This fix takes maximum CVSS score.<br>
<br>
Fixes: <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15931=
" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/sh=
ow_bug.cgi?id=3D15931</a></blockquote><div><br></div><div>The proper way to=
 reference a bug is &quot;Fixes [YOCTO #bug-id]&quot; (see <a href=3D"https=
://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#implemen=
t-and-commit-changes" target=3D"_blank">https://docs.yoctoproject.org/dev/c=
ontributor-guide/submit-changes.html#implement-and-commit-changes</a>)</div=
><div><br></div><div>You don&#39;t need to specify [master] in the subject =
as it is the default.</div><div><br></div><div>When you send a new patch fo=
llowing reviews, please increment its version :=C2=A0[PATCH] -&gt;=C2=A0[PA=
TCH v2] -&gt;=C2=A0[PATCH v3] -&gt; ...<br></div><div>For example, now, you=
 could send a &quot;[PATCH v2] cve-update-nvd2-native: Use maximum CVSS sco=
re from all sources&quot;</div><div><br></div><div>Thanks!</div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Het Patel &lt;<a href=3D"mailto:hetpat@cisco.com" target=3D"=
_blank">hetpat@cisco.com</a>&gt;<br>
---<br>
=C2=A0.../meta/<a href=3D"http://cve-update-nvd2-native.bb" rel=3D"noreferr=
er" target=3D"_blank">cve-update-nvd2-native.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 55 +++++++++++++------<br>
=C2=A01 file changed, 39 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-nativ=
e.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a> b/=
meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" rel=3D"=
noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
index 8c8148dd92..41c34ba0d0 100644<br>
--- a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" r=
el=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
+++ b/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" r=
el=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
@@ -350,32 +350,55 @@ def update_db(conn, elt):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if desc[&#39;lang&#39;] =3D=3D &#39;en&#3=
9;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cveDesc =3D desc[&#39;value=
&#39;]<br>
=C2=A0 =C2=A0 =C2=A0date =3D elt[&#39;cve&#39;][&#39;lastModified&#39;]<br>
+<br>
+=C2=A0 =C2=A0 # Extract maximum CVSS scores from all sources (Primary and =
Secondary)<br>
+=C2=A0 =C2=A0 cvssv2 =3D 0.0<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D elt[&#39;cve&#39;][&#39;metri=
cs&#39;][&#39;cvssMetricV2&#39;][0][&#39;cvssData&#39;][&#39;accessVector&#=
39;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vectorString =3D elt[&#39;cve&#39;][&#39;metri=
cs&#39;][&#39;cvssMetricV2&#39;][0][&#39;cvssData&#39;][&#39;vectorString&#=
39;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv2 =3D elt[&#39;cve&#39;][&#39;metrics&#39=
;][&#39;cvssMetricV2&#39;][0][&#39;cvssData&#39;][&#39;baseScore&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Iterate through all cvssMetricV2 entries and=
 find the maximum score<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for metric in elt[&#39;cve&#39;][&#39;metrics&=
#39;][&#39;cvssMetricV2&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 score =3D metric[&#39;cvssData&#=
39;][&#39;baseScore&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if score &gt; cvssv2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv2 =3D score<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D m=
etric[&#39;cvssData&#39;][&#39;accessVector&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vectorString =3D m=
etric[&#39;cvssData&#39;][&#39;vectorString&#39;]<br>
=C2=A0 =C2=A0 =C2=A0except KeyError:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv2 =3D 0.0<br>
-=C2=A0 =C2=A0 cvssv3 =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+<br>
+=C2=A0 =C2=A0 cvssv3 =3D 0.0<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D accessVector or elt[&#39;cve&=
#39;][&#39;metrics&#39;][&#39;cvssMetricV30&#39;][0][&#39;cvssData&#39;][&#=
39;attackVector&#39;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vectorString =3D vectorString or elt[&#39;cve&=
#39;][&#39;metrics&#39;][&#39;cvssMetricV30&#39;][0][&#39;cvssData&#39;][&#=
39;vectorString&#39;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv3 =3D elt[&#39;cve&#39;][&#39;metrics&#39=
;][&#39;cvssMetricV30&#39;][0][&#39;cvssData&#39;][&#39;baseScore&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Iterate through all cvssMetricV30 entries an=
d find the maximum score<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for metric in elt[&#39;cve&#39;][&#39;metrics&=
#39;][&#39;cvssMetricV30&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 score =3D metric[&#39;cvssData&#=
39;][&#39;baseScore&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if score &gt; cvssv3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv3 =3D score<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D a=
ccessVector or metric[&#39;cvssData&#39;][&#39;attackVector&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vectorString =3D v=
ectorString or metric[&#39;cvssData&#39;][&#39;vectorString&#39;]<br>
=C2=A0 =C2=A0 =C2=A0except KeyError:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass<br>
+<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D accessVector or elt[&#39;cve&=
#39;][&#39;metrics&#39;][&#39;cvssMetricV31&#39;][0][&#39;cvssData&#39;][&#=
39;attackVector&#39;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vectorString =3D vectorString or elt[&#39;cve&=
#39;][&#39;metrics&#39;][&#39;cvssMetricV31&#39;][0][&#39;cvssData&#39;][&#=
39;vectorString&#39;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv3 =3D cvssv3 or elt[&#39;cve&#39;][&#39;m=
etrics&#39;][&#39;cvssMetricV31&#39;][0][&#39;cvssData&#39;][&#39;baseScore=
&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Iterate through all cvssMetricV31 entries an=
d find the maximum score<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for metric in elt[&#39;cve&#39;][&#39;metrics&=
#39;][&#39;cvssMetricV31&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 score =3D metric[&#39;cvssData&#=
39;][&#39;baseScore&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if score &gt; cvssv3:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv3 =3D score<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D a=
ccessVector or metric[&#39;cvssData&#39;][&#39;attackVector&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vectorString =3D v=
ectorString or metric[&#39;cvssData&#39;][&#39;vectorString&#39;]<br>
=C2=A0 =C2=A0 =C2=A0except KeyError:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass<br>
-=C2=A0 =C2=A0 cvssv3 =3D cvssv3 or 0.0<br>
+<br>
+=C2=A0 =C2=A0 cvssv4 =3D 0.0<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D accessVector or elt[&#39;cve&=
#39;][&#39;metrics&#39;][&#39;cvssMetricV40&#39;][0][&#39;cvssData&#39;][&#=
39;attackVector&#39;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 vectorString =3D vectorString or elt[&#39;cve&=
#39;][&#39;metrics&#39;][&#39;cvssMetricV40&#39;][0][&#39;cvssData&#39;][&#=
39;vectorString&#39;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv4 =3D elt[&#39;cve&#39;][&#39;metrics&#39=
;][&#39;cvssMetricV40&#39;][0][&#39;cvssData&#39;][&#39;baseScore&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Iterate through all cvssMetricV40 entries an=
d find the maximum score<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for metric in elt[&#39;cve&#39;][&#39;metrics&=
#39;][&#39;cvssMetricV40&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 score =3D metric[&#39;cvssData&#=
39;][&#39;baseScore&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if score &gt; cvssv4:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv4 =3D score<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D a=
ccessVector or metric[&#39;cvssData&#39;][&#39;attackVector&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vectorString =3D v=
ectorString or metric[&#39;cvssData&#39;][&#39;vectorString&#39;]<br>
=C2=A0 =C2=A0 =C2=A0except KeyError:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv4 =3D 0.0<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
+<br>
=C2=A0 =C2=A0 =C2=A0accessVector =3D accessVector or &quot;UNKNOWN&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0vectorString =3D vectorString or &quot;UNKNOWN&quot;<br=
>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229800): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229800" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229800</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117378826/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117378826/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>
</div>

--000000000000263e2a0648e2bb14--

