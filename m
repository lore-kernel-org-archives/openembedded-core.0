Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 917BAD35688
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 06:49:30 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7580.1769582964039613660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 22:49:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fR/F5YOH;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4359108fd24so3860423f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 22:49:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769582962; cv=none;
        d=google.com; s=arc-20240605;
        b=D+rmO3OS6iSdAb9OVatLx2GgKGMZ/vwVyWHJtlwdvN5R612FyLo6ft7b7l8pw0oRZA
         GSrV1WadEEVM2xstrecBTAxnG5UE2JyQLEYOqArQevAF0J6yxLKU4SyhUEo35kgYqFJc
         ES4Nm5mBpbPF+I9FIpz2fPJZ/Q0EVuKgiLmtE95MctCNUpSpNsX9r8p3G0e/5HbUccJU
         3JlZW/mdxdCU4bir07GgtFCLmdyjO1wWLEhO4QkzbzRf6OrN4ZN58sCtw9lYT1Q1XKiT
         Ob5N+c/OgKgkxfF3zSdFAX3IzwKjtU1w414Id+TM/yN1YrVkuOC4gpUcuZnnkeHGETYX
         B33A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7Il5wrEaSCKopkZX7SxYW9ZyPG/MQGyAWSZdn1Eh+RQ=;
        fh=9gGAjBmzXxm+6YnJ4YJau3pXgzx9iwFOqKMmYwz06G8=;
        b=M3QH2KQjOj0jLtvNHywY7o0C1/gYFUyCMqtmkS6DXbYsUVExEb7Q2cf//qSqmc6nUk
         M1xShTZnncrNd3pMPRswutYNbGUgvGlr7/6YsFUrvUAPTYTv2ENc5iCPJHpuaoEbKkla
         cqLjmAc1/+UtP6d2nlQkDjBZEVnf1i3BnTzc07ejZ1IKyRG5Jop9P5wR1vJsotZsj3SA
         lHEVTRaUn6mn+d85DuSlt5hKdoP5yvwxt25WQ15z61RK3zPnUmncYvoJ0+vw1spWIaZd
         1QB/A6D7l2nou46+PLlLneatKIWxhe8h8rIRTbcEcG3ryGtED7+GvCuxXZ0jkUGcypbr
         OiJw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769582962; x=1770187762; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7Il5wrEaSCKopkZX7SxYW9ZyPG/MQGyAWSZdn1Eh+RQ=;
        b=fR/F5YOHxEF/Yy+0NsffL5REIczDpR5dTozSRprmohIdpP7dl1yZQOdy6rtdqMvdcz
         xUH74C28UDZQ6W6fVEW9kFH2Cc7/jF2/jbV2Q3gjXYR0RMGGMqsqtU+yqBKtKvniM2W7
         Lpj7ZUBiqUTMwd9yHTiOSrM4zRv8uWHZZIQNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769582962; x=1770187762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Il5wrEaSCKopkZX7SxYW9ZyPG/MQGyAWSZdn1Eh+RQ=;
        b=G66CYVhuCTUevz50TSVt4Ezau3bVMdzptfTD1r7JpB+KMe1+zEeSdErHx3wRHtkaJH
         9vg0vwUyjvjsoS3i5QYdv0CxtlWTylnZyXVn66PmODYw1hpJ/97vhXoT6o/Q9skjBe5D
         9307Tp8Lc9LeJdeA4c33Ourd+ijHlouYeO2C5Ecjl5lseamuvu4Fi/JPWioUCpyZL/YW
         neZNMFXOS6WGgHDCVZqhIG9uUux0F4uK4ltBAhTxYE3LZzoYgAIOLyTZaVN0WiSUn9LC
         V+nOJoUpOdpPPlxe9279/JU+CKsX9cr7rmlGs86h4wkLnESZY5qTlA6wr9/DoyrmgFeY
         dKbQ==
X-Gm-Message-State: AOJu0YzUYfIgclAtMxQeTyNmhRuB3zpeAfOWbEmJ3Om8iahFqmTzzTtP
	ADoQWT8DZ0UnOVseRxO5nLB5DwamvnAxWM17QzwCLdI/TV9JlbjJHnR2l8QnkfafpQ7ZDDVSKOL
	0cKG08Iu6O9OvERFSFNsFDfGxYvhZI1sdgZ1U1RLF+g==
X-Gm-Gg: AZuq6aLrjWez7BL40VO+541egqLGFM5F4yA+yN46RtiuVlBeQNU/pHMWiSqdYOBN/LW
	M9VJpP4UwQTKlT2gE1skzMo8de3JUfCttqJUw2PS5D/9+uPd2aDJ8btUVvauGGlcOaesJKi5UDx
	fu3xN+GToO8t7IMKGZMWyiQ5XFlLp/xUcl+g+4xBn6TMQL07qTrboYn7p3Ua7/I2KeUCKXNVO7O
	Yde7TDe/rWstHHjKmMAtNcQ+zLXx2AbLLg/ua9CxyMxw62uUD4UfE+J6VdwiJEcQnCfRVQw4TV5
	bNwg+WDC9YKEJokAtRSxMFok7Bt0hw==
X-Received: by 2002:a05:6000:18a4:b0:435:9bf7:c6b9 with SMTP id
 ffacd0b85a97d-435dd030782mr5326055f8f.24.1769582962143; Tue, 27 Jan 2026
 22:49:22 -0800 (PST)
MIME-Version: 1.0
References: <188D1595910BDEB4.3547823@lists.openembedded.org> <DS0PR11MB740520FCABFFFCD88073D7D4DC91A@DS0PR11MB7405.namprd11.prod.outlook.com>
In-Reply-To: <DS0PR11MB740520FCABFFFCD88073D7D4DC91A@DS0PR11MB7405.namprd11.prod.outlook.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 28 Jan 2026 07:48:55 +0100
X-Gm-Features: AZwV_QiLjxsE7wc0mXQShrCQ6DQvStw5oTfYxUneDyAHoLYbDduyrMaDAWAOwiw
Message-ID: <CAMSfU+6-49xfmMC+f4S=nTOeDgEVnx7zk9cgqZF+w3Bwh5csRw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] cve-update-nvd2-native: Use maximum CVSS
 score from all sources
To: hetpat@cisco.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"xe-linux-external(mailer list)" <xe-linux-external@cisco.com>
Content-Type: multipart/alternative; boundary="000000000000dc038d06496d23f6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 06:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230080

--000000000000dc038d06496d23f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 28 janv. 2026 =C3=A0 07:03, Het Patel via lists.openembedded.org <h=
etpat=3D
cisco.com@lists.openembedded.org> a =C3=A9crit :

> Gentle reminder.
>

Hello,

Your patch was not forgotten: It is in master-next:
https://git.openembedded.org/openembedded-core/log/?h=3Dmaster-next
That means that it has passed testing and now needs to be reviewed by the
review team.
Please note that there are higher priority subjects right now, as stated in
the weekly report: https://wiki.yoctoproject.org/wiki/Weekly_Status.

You can ping again if your patch has not been reviewed or merged in two
weeks.

Regards,


> ------------------------------
> *From:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> on behalf of Het Patel via
> lists.openembedded.org <hetpat=3Dcisco.com@lists.openembedded.org>
> *Sent:* Thursday, January 22, 2026 8:29 PM
> *To:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>
> *Cc:* xe-linux-external(mailer list) <xe-linux-external@cisco.com>
> *Subject:* [OE-core] [PATCH v3] cve-update-nvd2-native: Use maximum CVSS
> score from all sources
>
> From: Het Patel <hetpat@cisco.com>
>
> The CVE check system was incorrectly reporting lower CVSS scores when
> multiple scoring sources were available in the NVD database. This
> occurred because the code only extracted the first element from the
> metrics arrays, which could be a "Secondary" source with a lower score
> rather than the "Primary" source or the highest available vendor score.
>
> According to the CVSS v4.0 User Guide, "In situations where multiple
> CVSS-B scores are applicable but only one is provided, the highest
> CVSS-B score must be utilized." This follows the "reasonable worst-case"
> principle established by the CVSS SIG.
>
> This fix iterates through all available sources (v2, v3.0, v3.1, and
> v4.0) and selects the maximum CVSS score to ensure the highest severity
> is reported.
>
> Fixes [YOCTO #15931]
>
> References:
> - https://www.first.org/cvss/v4.0/user-guide
> - https://www.first.org/cvss/v3.1/user-guide
> - https://www.first.org/cvss/v2/minutes/cvss-meeting-minutes-06202006.pdf
>
> Signed-off-by: Het Patel <hetpat@cisco.com>
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
> View/Reply Online (#230078):
> https://lists.openembedded.org/g/openembedded-core/message/230078
> Mute This Topic: https://lists.openembedded.org/mt/117400902/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000dc038d06496d23f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0mer. 28 janv. 2026 =C3=A0=C2=A007=
:03, Het Patel via <a href=3D"http://lists.openembedded.org">lists.openembe=
dded.org</a> &lt;hetpat=3D<a href=3D"mailto:cisco.com@lists.openembedded.or=
g">cisco.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:</div><div c=
lass=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div class=3D"msg6275160068375734658">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Gentle reminder.</div></div></div></blockquote><div><br></div><div>Hello,</=
div><div><br></div><div>Your patch was not forgotten: It is in master-next:=
=C2=A0<a href=3D"https://git.openembedded.org/openembedded-core/log/?h=3Dma=
ster-next">https://git.openembedded.org/openembedded-core/log/?h=3Dmaster-n=
ext</a></div><div>That=C2=A0means that it has passed testing and now needs =
to be reviewed by the review team.</div><div>Please note that there are hig=
her priority subjects right now, as stated in the weekly report: <a href=3D=
"https://wiki.yoctoproject.org/wiki/Weekly_Status">https://wiki.yoctoprojec=
t.org/wiki/Weekly_Status</a>.</div><div><br></div><div>You can ping again i=
f your patch has not been reviewed or merged in two weeks.</div><div><br></=
div><div>Regards,</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div class=3D"msg6275160068375734658"><div dir=3D"ltr">
<div id=3D"m_6275160068375734658appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_6275160068375734658divRplyFwdMsg" dir=3D"ltr"><font face=3D"Ca=
libri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b> =
<a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blan=
k">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"mailto:opene=
mbedded-core@lists.openembedded.org" target=3D"_blank">openembedded-core@li=
sts.openembedded.org</a>&gt; on behalf of Het Patel via <a href=3D"http://l=
ists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;het=
pat=3D<a href=3D"mailto:cisco.com@lists.openembedded.org" target=3D"_blank"=
>cisco.com@lists.openembedded.org</a>&gt;<br>
<b>Sent:</b> Thursday, January 22, 2026 8:29 PM<br>
<b>To:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"m=
ailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembed=
ded-core@lists.openembedded.org</a>&gt;<br>
<b>Cc:</b> xe-linux-external(mailer list) &lt;<a href=3D"mailto:xe-linux-ex=
ternal@cisco.com" target=3D"_blank">xe-linux-external@cisco.com</a>&gt;<br>
<b>Subject:</b> [OE-core] [PATCH v3] cve-update-nvd2-native: Use maximum CV=
SS score from all sources</font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>From: Het Patel &lt;<a href=3D"mailto:hetpat@cisco.com" target=3D"_bla=
nk">hetpat@cisco.com</a>&gt;<br>
<br>
The CVE check system was incorrectly reporting lower CVSS scores when<br>
multiple scoring sources were available in the NVD database. This<br>
occurred because the code only extracted the first element from the<br>
metrics arrays, which could be a &quot;Secondary&quot; source with a lower =
score<br>
rather than the &quot;Primary&quot; source or the highest available vendor =
score.<br>
<br>
According to the CVSS v4.0 User Guide, &quot;In situations where multiple<b=
r>
CVSS-B scores are applicable but only one is provided, the highest<br>
CVSS-B score must be utilized.&quot; This follows the &quot;reasonable wors=
t-case&quot;<br>
principle established by the CVSS SIG.<br>
<br>
This fix iterates through all available sources (v2, v3.0, v3.1, and<br>
v4.0) and selects the maximum CVSS score to ensure the highest severity<br>
is reported.<br>
<br>
Fixes [YOCTO #15931]<br>
<br>
References:<br>
- <a href=3D"https://www.first.org/cvss/v4.0/user-guide" target=3D"_blank">=
https://www.first.org/cvss/v4.0/user-guide</a><br>
- <a href=3D"https://www.first.org/cvss/v3.1/user-guide" target=3D"_blank">=
https://www.first.org/cvss/v3.1/user-guide</a><br>
- <a href=3D"https://www.first.org/cvss/v2/minutes/cvss-meeting-minutes-062=
02006.pdf" target=3D"_blank">
https://www.first.org/cvss/v2/minutes/cvss-meeting-minutes-06202006.pdf</a>=
<br>
<br>
Signed-off-by: Het Patel &lt;<a href=3D"mailto:hetpat@cisco.com" target=3D"=
_blank">hetpat@cisco.com</a>&gt;<br>
---<br>
=C2=A0.../meta/<a href=3D"http://cve-update-nvd2-native.bb" target=3D"_blan=
k">cve-update-nvd2-native.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 55 +++++++++++++------<br>
=C2=A01 file changed, 39 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-nativ=
e.bb" target=3D"_blank">cve-update-nvd2-native.bb</a> b/meta/recipes-core/m=
eta/<a href=3D"http://cve-update-nvd2-native.bb" target=3D"_blank">cve-upda=
te-nvd2-native.bb</a><br>
index 8c8148dd92..41c34ba0d0 100644<br>
--- a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" t=
arget=3D"_blank">cve-update-nvd2-native.bb</a><br>
+++ b/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" t=
arget=3D"_blank">cve-update-nvd2-native.bb</a><br>
@@ -350,32 +350,55 @@ def update_db(conn, elt):<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if desc[&#39;lang&#39;] =
=3D=3D &#39;en&#39;:<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cv=
eDesc =3D desc[&#39;value&#39;]<br>
=C2=A0=C2=A0=C2=A0=C2=A0 date =3D elt[&#39;cve&#39;][&#39;lastModified&#39;=
]<br>
+<br>
+=C2=A0=C2=A0=C2=A0 # Extract maximum CVSS scores from all sources (Primary=
 and Secondary)<br>
+=C2=A0=C2=A0=C2=A0 cvssv2 =3D 0.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0 try:<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 accessVector =3D elt[&#39;cve&#=
39;][&#39;metrics&#39;][&#39;cvssMetricV2&#39;][0][&#39;cvssData&#39;][&#39=
;accessVector&#39;]<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vectorString =3D elt[&#39;cve&#=
39;][&#39;metrics&#39;][&#39;cvssMetricV2&#39;][0][&#39;cvssData&#39;][&#39=
;vectorString&#39;]<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cvssv2 =3D elt[&#39;cve&#39;][&=
#39;metrics&#39;][&#39;cvssMetricV2&#39;][0][&#39;cvssData&#39;][&#39;baseS=
core&#39;]<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Iterate through all cvssMetri=
cV2 entries and find the maximum score<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for metric in elt[&#39;cve&#39;=
][&#39;metrics&#39;][&#39;cvssMetricV2&#39;]:<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 score =
=3D metric[&#39;cvssData&#39;][&#39;baseScore&#39;]<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if scor=
e &gt; cvssv2:<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 cvssv2 =3D score<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 accessVector =3D metric[&#39;cvssData&#39;][&#39;accessV=
ector&#39;]<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 vectorString =3D metric[&#39;cvssData&#39;][&#39;vectorS=
tring&#39;]<br>
=C2=A0=C2=A0=C2=A0=C2=A0 except KeyError:<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cvssv2 =3D 0.0<br>
-=C2=A0=C2=A0=C2=A0 cvssv3 =3D None<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pass<br>
+<br>
+=C2=A0=C2=A0=C2=A0 cvssv3 =3D 0.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0 try:<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 accessVector =3D accessVector o=
r elt[&#39;cve&#39;][&#39;metrics&#39;][&#39;cvssMetricV30&#39;][0][&#39;cv=
ssData&#39;][&#39;attackVector&#39;]<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vectorString =3D vectorString o=
r elt[&#39;cve&#39;][&#39;metrics&#39;][&#39;cvssMetricV30&#39;][0][&#39;cv=
ssData&#39;][&#39;vectorString&#39;]<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cvssv3 =3D elt[&#39;cve&#39;][&=
#39;metrics&#39;][&#39;cvssMetricV30&#39;][0][&#39;cvssData&#39;][&#39;base=
Score&#39;]<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Iterate through all cvssMetri=
cV30 entries and find the maximum score<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for metric in elt[&#39;cve&#39;=
][&#39;metrics&#39;][&#39;cvssMetricV30&#39;]:<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 score =
=3D metric[&#39;cvssData&#39;][&#39;baseScore&#39;]<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if scor=
e &gt; cvssv3:<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 cvssv3 =3D score<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 accessVector =3D accessVector or metric[&#39;cvssData&#3=
9;][&#39;attackVector&#39;]<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 vectorString =3D vectorString or metric[&#39;cvssData&#3=
9;][&#39;vectorString&#39;]<br>
=C2=A0=C2=A0=C2=A0=C2=A0 except KeyError:<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pass<br>
+<br>
=C2=A0=C2=A0=C2=A0=C2=A0 try:<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 accessVector =3D accessVector o=
r elt[&#39;cve&#39;][&#39;metrics&#39;][&#39;cvssMetricV31&#39;][0][&#39;cv=
ssData&#39;][&#39;attackVector&#39;]<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vectorString =3D vectorString o=
r elt[&#39;cve&#39;][&#39;metrics&#39;][&#39;cvssMetricV31&#39;][0][&#39;cv=
ssData&#39;][&#39;vectorString&#39;]<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cvssv3 =3D cvssv3 or elt[&#39;c=
ve&#39;][&#39;metrics&#39;][&#39;cvssMetricV31&#39;][0][&#39;cvssData&#39;]=
[&#39;baseScore&#39;]<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Iterate through all cvssMetri=
cV31 entries and find the maximum score<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for metric in elt[&#39;cve&#39;=
][&#39;metrics&#39;][&#39;cvssMetricV31&#39;]:<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 score =
=3D metric[&#39;cvssData&#39;][&#39;baseScore&#39;]<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if scor=
e &gt; cvssv3:<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 cvssv3 =3D score<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 accessVector =3D accessVector or metric[&#39;cvssData&#3=
9;][&#39;attackVector&#39;]<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 vectorString =3D vectorString or metric[&#39;cvssData&#3=
9;][&#39;vectorString&#39;]<br>
=C2=A0=C2=A0=C2=A0=C2=A0 except KeyError:<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pass<br>
-=C2=A0=C2=A0=C2=A0 cvssv3 =3D cvssv3 or 0.0<br>
+<br>
+=C2=A0=C2=A0=C2=A0 cvssv4 =3D 0.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0 try:<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 accessVector =3D accessVector o=
r elt[&#39;cve&#39;][&#39;metrics&#39;][&#39;cvssMetricV40&#39;][0][&#39;cv=
ssData&#39;][&#39;attackVector&#39;]<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vectorString =3D vectorString o=
r elt[&#39;cve&#39;][&#39;metrics&#39;][&#39;cvssMetricV40&#39;][0][&#39;cv=
ssData&#39;][&#39;vectorString&#39;]<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cvssv4 =3D elt[&#39;cve&#39;][&=
#39;metrics&#39;][&#39;cvssMetricV40&#39;][0][&#39;cvssData&#39;][&#39;base=
Score&#39;]<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Iterate through all cvssMetri=
cV40 entries and find the maximum score<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for metric in elt[&#39;cve&#39;=
][&#39;metrics&#39;][&#39;cvssMetricV40&#39;]:<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 score =
=3D metric[&#39;cvssData&#39;][&#39;baseScore&#39;]<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if scor=
e &gt; cvssv4:<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 cvssv4 =3D score<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 accessVector =3D accessVector or metric[&#39;cvssData&#3=
9;][&#39;attackVector&#39;]<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 vectorString =3D vectorString or metric[&#39;cvssData&#3=
9;][&#39;vectorString&#39;]<br>
=C2=A0=C2=A0=C2=A0=C2=A0 except KeyError:<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cvssv4 =3D 0.0<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pass<br>
+<br>
=C2=A0=C2=A0=C2=A0=C2=A0 accessVector =3D accessVector or &quot;UNKNOWN&quo=
t;<br>
=C2=A0=C2=A0=C2=A0=C2=A0 vectorString =3D vectorString or &quot;UNKNOWN&quo=
t;<br>
=C2=A0<br>
</div>
</span></font></div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#230078): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/230078" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/230078</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117400902/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117400902/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div></blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gm=
ail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signatu=
re"><div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><di=
v><font face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000dc038d06496d23f6--

