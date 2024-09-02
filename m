Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B927CD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 13:44:50 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.400.1725284687175009276
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 06:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iL1XWW52;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2053a0bd0a6so20979485ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 06:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725284686; x=1725889486; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D2OedtX6OQeSJ77ucVSRLf6Q9jK0Oio0+Io1d8im6dE=;
        b=iL1XWW52+3GfNx3Ns1pXjd7or49ymiEAIpNRh8gyaB1iNGVjjh+EyNK9eU+ByzZ3lF
         rc9y9vmhglnTJWqIcefmfxbE0RtkY/G5WUooLOmPkLJ3WUwET5hrU20MNsTnfcQb7KSq
         qGZkLwVIHrhFWJhdtn3irKSnY6cvefHLLFE1H6di0+qvstAMBPO+5jxy5rrufe+h52Mh
         8RgUu8FsfWM/DUtZO0q+zQTy1Po7xe4SCQImhFp0TcABvZERM+fQIR/NOLeE4Ejeb1hy
         Ubswt05UWcxLVWR3bePP2ADDkAgl8ZletbHjFxKSKFvRbnep6d0Ul4ZgqOgeYvJ/IfdJ
         +FPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725284686; x=1725889486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D2OedtX6OQeSJ77ucVSRLf6Q9jK0Oio0+Io1d8im6dE=;
        b=kJcWG+PJb66DuOjk71dgndiR5+2fj69gHQaYOyxwHVPYTLPMQUeNmxiQDznVkCj6/w
         mV4iw50Sam8XlRNqSPirG7+RVsdkMSLcR24/wQAzjOK9ldqkBdzDWsNeI5wTZqUGvHh2
         4EkeJojExg7g8GHxlDt4nRO2MwLUBcpgdaw4ztm+6LhMT0kNjQLWvPv7JtEtSR1X9iiA
         8G3UDgDnXVIIkzSw4+xkb8gSlHXV9iNPQzBvgDCw9qAcYqEUpwFciZsqbgK3Fk/dnbgT
         DD6LvGXLImIogwovmH9XGBOPPbTTUBbHNsxm45cWioja5cOE0jhu/H1wuYGr4XCHGobj
         w9ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUEXkgWA5rGdHufOUp+Q9RPnGWZfqKkJBT0wXVt6KWjcYWU5DINUxadQiihavQs+WEtuNgICsFFBSyTFDycwj6j4w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyC2795I5YTllaJ6t7vb66a7H7EhNkIx8bAXp7VXwotcY/t8Po3
	fUkretKVPtW/rTABZoiPBIGFA8rSFdzkgkYfZFl0Bz9VQWy3+RsW7ZwRAyK0y3uMFqZnOqQ4Jp6
	/fdqfuu9gfS631nCSbQzl/swpX7k=
X-Google-Smtp-Source: AGHT+IGRepYBrNwb5j6OPhC3kfoUDZ3lYZltINHUuy9HCxRrjFvoC+ZGg0xeoUOo2VYJv7cHy/DrsnCTTSVGzMzitG8=
X-Received: by 2002:a17:902:ea11:b0:205:51c9:49e3 with SMTP id
 d9443c01a7336-20551c94fe2mr54336285ad.15.1725284686207; Mon, 02 Sep 2024
 06:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240901111850.70472100436@builder.sakoman.com> <80a6ff0178502645da085e436b354471e1530739.camel@linuxfoundation.org>
In-Reply-To: <80a6ff0178502645da085e436b354471e1530739.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 2 Sep 2024 15:44:34 +0200
Message-ID: <CAApg2=RJg+JuEJRMT=aDTU1reyDOnEoae+zZ-OodLvXp-LjpeA@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 01 Sep
 2024 01:00:01 AM HST
To: richard.purdie@linuxfoundation.org
Cc: steve@sakoman.com, openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000dba185062123240d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 13:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204104

--000000000000dba185062123240d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

NVD's certificate has expired. At this moment some servers have the new
one, some the old one. Expect strange issues.

Mata

On Mon, Sep 2, 2024 at 3:25=E2=80=AFPM Richard Purdie via lists.yoctoprojec=
t.org
<richard.purdie=3Dlinuxfoundation.org@lists.yoctoproject.org> wrote:

> On Sun, 2024-09-01 at 01:18 -1000, Steve Sakoman via
> lists.yoctoproject.org wrote:
> > Full list:  Found 0 unpatched CVEs
>
> Much as I wish that were true... :/
>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1245):
> https://lists.yoctoproject.org/g/yocto-security/message/1245
> Mute This Topic: https://lists.yoctoproject.org/mt/108208321/5827677
> Group Owner: yocto-security+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto-security/unsub [
> rybczynska@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000dba185062123240d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>NVD&#39;s certificate has expired. At this moment som=
e servers have the new one, some the old one. Expect strange issues.</div><=
div><br></div><div>Mata<br></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, Sep 2, 2024 at 3:25=E2=80=AFPM Richard P=
urdie via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org<=
/a> &lt;richard.purdie=3D<a href=3D"mailto:linuxfoundation.org@lists.yoctop=
roject.org">linuxfoundation.org@lists.yoctoproject.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 2024-09-01 at=
 01:18 -1000, Steve Sakoman via <a href=3D"http://lists.yoctoproject.org" r=
el=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a> wrote:<br>
&gt; Full list:=C2=A0 Found 0 unpatched CVEs<br>
<br>
Much as I wish that were true... :/<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#1245): <a href=3D"https://lists.yoctoproject.org/g/yoct=
o-security/message/1245" rel=3D"noreferrer" target=3D"_blank">https://lists=
.yoctoproject.org/g/yocto-security/message/1245</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/108208321/582=
7677" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/108208321/5827677</a><br>
Group Owner: <a href=3D"mailto:yocto-security%2Bowner@lists.yoctoproject.or=
g" target=3D"_blank">yocto-security+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/yocto-security/uns=
ub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/y=
octo-security/unsub</a> [<a href=3D"mailto:rybczynska@gmail.com" target=3D"=
_blank">rybczynska@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000dba185062123240d--

