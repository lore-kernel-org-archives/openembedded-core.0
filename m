Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EEB6C5478C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 21:53:18 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.7158.1708725188932092411
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 13:53:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=eiYVnVhG;
 spf=pass (domain: smile.fr, ip: 209.85.208.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56566dfeb3bso1341393a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 13:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708725187; x=1709329987; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2p+J/YQMrjg8vI4ba/5R6gZWrtJheZ79Ue/aEtTJXY8=;
        b=eiYVnVhGr/o1pqNCJPvnaRj8Fam8GAIjfWTpykbVaOAfccSOcOex6lB8rTwq1gHozv
         JYbkQT7AP0l7ZdKVOC0+fJJW18tA6uZtbsI+bOtnZk8pUrDci4fTWklJam3Q2Tg0G3XQ
         IJ6cS4JUARc28GYXdTwBXEldujuqv2wi6axoDa6oIEMReqEa9YYEyxt+LIYjbDAIl+Yw
         uyKoGwG7MEO7y2+ofX6584narYF3dmW8Dq1hrk4X+2EaTFCsOd7nARWV0ZD6xQmUcEMV
         bpv7zeTI3ndmVxPstLAuCoYOSk7TE6mctuyvcLyNleWiFzQAnAt5ikPOIMXR0fmUkahG
         fFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708725187; x=1709329987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2p+J/YQMrjg8vI4ba/5R6gZWrtJheZ79Ue/aEtTJXY8=;
        b=jCNLfnsMyiNU4xUBxrM4tUenrJrJGYXCiQPxd1NunsIWelBVLhUOwbsL5H2xj8uk2Q
         qOXqcWCsTsqhZejUD1xKcZmxdUlBP6hOZz3RnArKAPPvazjOFjFJG3knHAOfuglQaxAK
         B8jslG/46+KaBlG1mWF6bYcwpznyDhHo0BDpFy4/pW+ZyrxXQnGxwMyH3Wzkvg9ipEBp
         UesEE9KFYC21h6kjGdwfHe6AlRHaNPS4Y2MjfFCOvUm+pqY5EBWFWTswxgNQ2bTER74T
         cnPq933YAAHvXN7IqGXaKcvTxRa2dk9hRZWv/jl0yrWddQHZ9elEcJBI93T3FCSKOInf
         uAYw==
X-Gm-Message-State: AOJu0Yx5cz8YxI2ggzo4HTQY6SGpwSTTttEVlCfwOYEHoEMUDoR1itHJ
	Ct+0y9SBW8YBVGN7MtGjZnLt/bbUW/vbhDO6mJ0pD2h7eet4t68UpT7/C3GGH+XN26Zn8Req4Tf
	XEBvM3TUxusXVCZq2Ixg2BfgADdjrqYRLgA3Uqw==
X-Google-Smtp-Source: AGHT+IEFBwEqNHtne66WcWqfXDMGag0AcjVsBDWrzReMgRxh5XbomKtbAw8fhQVwOPBZHC/1ddgQvCT2bNzNLJguWoo=
X-Received: by 2002:a17:906:150b:b0:a3f:20b9:2b68 with SMTP id
 b11-20020a170906150b00b00a3f20b92b68mr608965ejd.10.1708725186835; Fri, 23 Feb
 2024 13:53:06 -0800 (PST)
MIME-Version: 1.0
References: <20240223210848.21731-1-simone.p.weiss@posteo.com>
In-Reply-To: <20240223210848.21731-1-simone.p.weiss@posteo.com>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Fri, 23 Feb 2024 22:52:41 +0100
Message-ID: <CAMSfU+4zeAm-BKwqw_vE2RTTmCBoCEAuYyoxm4_KXH7j_mDQqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check: Log if CVE_STATUS set but not
 reported for component
To: =?UTF-8?B?U2ltb25lIFdlacOf?= <simone.p.weiss@posteo.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c7c677061213957d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 21:53:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196116

--000000000000c7c677061213957d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 23 f=C3=A9vr. 2024 =C3=A0 22:09, Simone Wei=C3=9F <simone.p.weiss@p=
osteo.com> a
=C3=A9crit :

> From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
>
> Log if the CVE_STATUS is set for a CVE, but the cve is not reported for a
> component. This should hopefully help to clean up not needed CVE_STATUS
> settings.
>

Thank you for taking the time to do this :-)


> Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> ---
>  meta/classes/cve-check.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/cve-check.bbclass
> b/meta/classes/cve-check.bbclass
> index 5191d04303..b82a9e89ec 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -418,6 +418,9 @@ def check_cves(d, patched_cves):
>              cves_status.append([product, False])
>
>      conn.close()
> +    diff_ignore =3D list(set(cve_ignore) - set(cves_ignored))
> +    if diff_ignore:
> +        bb.warn("Found CVE (%s) with CVE_STATUS set that is not found in
> database for this component" % " ".join(diff_ignore))
>

A non-optional warning might be a bit harsh (Especially one that can come
up after an independent NVD database update).

How about a new element in the output of cve_check (the
build/tmp/log/cve/*.{txt,json} files)?
That way, someone looking for this info may find it, everyone else can
(safely) ignore this.

Another way I see would be to make the warning optional by using QA_WARN&co
but I'm not 100% sure it can be done...

Regards,

     if not cves_in_recipe:
>          bb.note("No CVE records for products in recipe %s" % (pn))
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196113):
> https://lists.openembedded.org/g/openembedded-core/message/196113
> Mute This Topic: https://lists.openembedded.org/mt/104536878/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000c7c677061213957d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0ven. 23 f=C3=A9vr. 2024 =C3=A0=C2=
=A022:09, Simone Wei=C3=9F &lt;<a href=3D"mailto:simone.p.weiss@posteo.com"=
>simone.p.weiss@posteo.com</a>&gt; a =C3=A9crit=C2=A0:</div><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Simone =
Wei=C3=9F &lt;<a href=3D"mailto:simone.p.weiss@posteo.com" target=3D"_blank=
">simone.p.weiss@posteo.com</a>&gt;<br>
<br>
Log if the CVE_STATUS is set for a CVE, but the cve is not reported for a<b=
r>
component. This should hopefully help to clean up not needed CVE_STATUS<br>
settings. <br></blockquote><div><br></div><div>Thank you for taking the tim=
e to do this :-)<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
Signed-off-by: Simone Wei=C3=9F &lt;<a href=3D"mailto:simone.p.weiss@posteo=
.com" target=3D"_blank">simone.p.weiss@posteo.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/cve-check.bbclass | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s<br>
index 5191d04303..b82a9e89ec 100644<br>
--- a/meta/classes/cve-check.bbclass<br>
+++ b/meta/classes/cve-check.bbclass<br>
@@ -418,6 +418,9 @@ def check_cves(d, patched_cves):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cves_status.append([product=
, False])<br>
<br>
=C2=A0 =C2=A0 =C2=A0conn.close()<br>
+=C2=A0 =C2=A0 diff_ignore =3D list(set(cve_ignore) - set(cves_ignored))<br=
>
+=C2=A0 =C2=A0 if diff_ignore:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Found CVE (%s) with CVE_STATUS s=
et that is not found in database for this component&quot; % &quot; &quot;.j=
oin(diff_ignore))<br></blockquote><div><br></div><div>A non-optional warnin=
g might be a bit harsh (Especially one that can come up after an independen=
t NVD database update).</div><div><br></div><div>How about a new element in=
 the output of cve_check (the build/tmp/log/cve/*.{txt,json} files)?</div><=
div>That way, someone looking for this info may find it, everyone else can =
(safely) ignore this.<br></div><div><br></div><div>Another way I see would =
be to make the warning optional by using QA_WARN&amp;co but I&#39;m not 100=
% sure it can be done...</div><div><br></div><div>Regards,</div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0if not cves_in_recipe:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quot;No CVE records for products=
 in recipe %s&quot; % (pn))<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#196113): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/196113" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/196113</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104536878/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104536878/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><font face=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"R=
aleway, regular">Smile ECS - Tech expert<br></font></div></div></div></div>

--000000000000c7c677061213957d--

