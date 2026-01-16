Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCBED47CD1
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 10:31:55 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3107.1768559506332462984
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 02:31:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TABVfGh4;
 spf=pass (domain: smile.fr, ip: 209.85.208.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64bea6c5819so3168698a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 02:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768559504; x=1769164304; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B2eVkJKhlFIwOd2Br4nwUUfMVTo86WcwL+mCF2vtx48=;
        b=TABVfGh4zMDqZFxJC4O4w2+prL67Q63NCQ51oDQBeE/3TFtTCCTNoi33uPFqjGEnOY
         OzFzNtZP+p8bndWwbh2H48VN+Hp7K5LsW5miS18zay9R03fayiXkOWqcJRBW0A7Xfdwv
         rmdC6qwtUd5Kv/OyA5dhMScm+5E+qkgsT2VSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768559504; x=1769164304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2eVkJKhlFIwOd2Br4nwUUfMVTo86WcwL+mCF2vtx48=;
        b=wTLlJ+WXJuinPf7lu5O/TU1o4jan1BsC/98PARIDqOPatzxcNFMZvRL9qA7+ZesYdK
         c9I2thdXEo3ZmQDOCnHaBRkIHFdv4jSJ6b+9mw3Ilz1LX0qGFSfCuYszwqSWeG4pSiQ/
         M2psXQCj5DMltkwI0ty2+TcBKiqW9Dg57vmny+2aBw1h3Wra1u1KXFkm0SQhY+AhjvJa
         ZGCAHPJfBexnIOxK30BZAkT77TXNhrXD8KnWz0cqfqPRJNNFDOkO00nmi3YkuL3am8S8
         dXtb2P+JBRFc7WvVlmibMoxGjLVBCySgakxbrxgBCbE86H3U3G8M590w2qaUG0sTgaqP
         4MpQ==
X-Gm-Message-State: AOJu0YyGM+IHKca8FpDkdDoRwTVSY8oyLdprU11ZLY7qH72JSIrAISP3
	M1cuiy419hiO2Ct3RaXlEmiB03eVbmfUyViRdTjSX1BTZv8jRnT+Xm+9M0o/V+cPMrY0bjVE9d5
	gT3WovF3IBjV5wEWjUHEd71tr8BstfmHVXfoZlvuXWQ==
X-Gm-Gg: AY/fxX4eV9sY+AJ5VF3T15nPZ9/Ckc3xPLCXzxCb6I/Z/bG41GF11Q5aR9UVoEeIrxq
	uUMdRdC2b1WJZ3mOipdWSLXoE41K9Xd/VsmEL9etM84HSTZUo4Ah+2PLyxp8M4wdEMDAkT3Pt+w
	azsnYKBNegrEaZWA0ZswgUk1h8aj2mvhtNJtR4XpkoxbRDtec+nMT4aRT2pkkYSgqqf/Fc2rTji
	56bpGutRFvP/s9oTYC9qD7/KNJWL5jngCZKGyy+QJ+9L43U6XbG76fr1iJ5zi1iC/5xzoMnL/Tt
	kDOWBhAxMSLPC8xJjlGrXBPosTMcxw==
X-Received: by 2002:a05:6402:f06:b0:64b:608e:cea1 with SMTP id
 4fb4d7f45d1cf-654524cf270mr1298166a12.1.1768559504049; Fri, 16 Jan 2026
 02:31:44 -0800 (PST)
MIME-Version: 1.0
References: <20260113070840.115911-1-hetpat@cisco.com>
In-Reply-To: <20260113070840.115911-1-hetpat@cisco.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 16 Jan 2026 11:31:18 +0100
X-Gm-Features: AZwV_QhML21suih3uXlt66jP0SVE0DlxnVYjhtgsrFZGuIvfPYND0_M-cJBRqAI
Message-ID: <CAMSfU+5u5Th9njzGNjCbx5kuiaspf_27FcocZnpq3OxDyyse2g@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap] [PATCH] Fix CVE CVSS scoring to use maximum
 score from all sources
To: hetpat@cisco.com
Cc: openembedded-core@lists.openembedded.org, xe-linux-external@cisco.com
Content-Type: multipart/alternative; boundary="00000000000000d75b06487ed971"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 10:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229541

--00000000000000d75b06487ed971
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 13 janv. 2026 =C3=A0 08:08, Het Patel via lists.openembedded.org <h=
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

Hello,

Does this patch interact with the open bug 15931 =E2=80=93 CVE Reporting wr=
ong
CVSSv3 score (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15931) ?

Also, does this need to be fixed on master and/or whinlatter?
If yes, you should first send this patch (adapted most likely) to master.
Then, once merged, send a backport request to the stable branches.

Thanks!


>
> Signed-off-by: Het Patel <hetpat@cisco.com>
> ---
>  .../meta/cve-update-nvd2-native.bb            | 55 +++++++++++++------
>  1 file changed, 39 insertions(+), 16 deletions(-)
>
> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> index 945bd1d927..28d5810d5d 100644
> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> @@ -352,32 +352,55 @@ def update_db(conn, elt):
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
> View/Reply Online (#229229):
> https://lists.openembedded.org/g/openembedded-core/message/229229
> Mute This Topic: https://lists.openembedded.org/mt/117239924/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--00000000000000d75b06487ed971
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 13=
 janv. 2026 =C3=A0=C2=A008:08, Het Patel via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;hetpat=3D<a href=3D"mailto:cisco=
.com@lists.openembedded.org">cisco.com@lists.openembedded.org</a>&gt; a =C3=
=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">F=
rom: Het Patel &lt;<a href=3D"mailto:hetpat@cisco.com" target=3D"_blank">he=
tpat@cisco.com</a>&gt;<br>
<br>
The CVE check system was incorrectly reporting lower CVSS scores when<br>
multiple scoring sources were available in the NVD database. This<br>
occurred because the code only extracted the first element from the<br>
CVSSv2, CVSSv3, and CVSSv4 metrics arrays, which could be a Secondary<br>
source with a lower score instead of the Primary source with the<br>
actual severity score.<br>
<br>
This fix takes maximum CVSS score.<br></blockquote><div><br></div><div>Hell=
o,</div><div><br></div><div>Does this patch interact with the open bug 1593=
1 =E2=80=93 CVE Reporting wrong CVSSv3 score (<a href=3D"https://bugzilla.y=
octoproject.org/show_bug.cgi?id=3D15931">https://bugzilla.yoctoproject.org/=
show_bug.cgi?id=3D15931</a>) ?</div><div><br></div><div>Also, does this nee=
d to be fixed on master and/or whinlatter?</div><div>If yes, you should fir=
st send this patch (adapted most likely) to master. Then, once merged, send=
 a backport request to the stable branches.</div><div><br></div><div>Thanks=
!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
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
index 945bd1d927..28d5810d5d 100644<br>
--- a/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" r=
el=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
+++ b/meta/recipes-core/meta/<a href=3D"http://cve-update-nvd2-native.bb" r=
el=3D"noreferrer" target=3D"_blank">cve-update-nvd2-native.bb</a><br>
@@ -352,32 +352,55 @@ def update_db(conn, elt):<br>
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
View/Reply Online (#229229): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229229" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229229</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117239924/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117239924/4316185</a><br>
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

--00000000000000d75b06487ed971--

