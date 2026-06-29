Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30099C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 18:18:58 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3591.1782757128201628360
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 11:18:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HbwBaQVE;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-80c8c9ae040so21261097b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 11:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782757127; cv=none;
        d=google.com; s=arc-20260327;
        b=En3uGNvWzgF2kr7arqwdqJOq7u31mrlbfj0vf+l97cDDp1QbnVAp57OM72p3VThEYT
         +murkjhj6v/mekRO905Cabp181Kg5gRFJP4+0+PjX2tQDmLOmG8j3vFlC0UCGqno9gX2
         0FhDHCGKBXwlYahP7EJp3tBosfUpJdCxRmfl1itm6fELIRPWazJQzp3fP14nnJk+GhL/
         mVXHMc4khE6tC2mVMphtM/2uodFhr+Y9xJcb7Fdn+3JTJ72zSHFZqTkMJ3Sd0XAUr9fJ
         OdgkzveBOoqCU6Q80yw61ifmwzGf4kkw2A1xSvZ9CRDeP+R7fB6/jOWzukf+riaDcIzv
         IpPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NnXEMWMeHcfJZj0MaNhzM6uICvxC4dBq5HeESdbhCWw=;
        fh=v4HrjAi87NrT32cmuSmvgjPf8SLEBZw9gUrgmdobrKU=;
        b=EhEWM9QHtcTcmg0jVyq2YwPXYo7rwmXCWzR+VgPhGFTVJUXMfKqfDvW2BKQSTNPuG9
         19hjcKTG2PczndExHIM4qt4mCBDwMc4Npn2wxXucjgarElT58/i3Cg9NPxbUQQP+cNke
         GnQol/xLj0jw6TEB0rUsCzyGXci9rl/HXhQ4iko0+tR6HOD6tGyu2zkDLIO0CZVOcCKF
         j53aNuirKE87qx62Hm43agHJWbmWVowaI0hqhJjWuWfCr/dwz9bRG24LwN83JAlJttZA
         0Y5CM6vuOE15vhQ+jJq0dPtSXow2HGSk5gytGMEL2k2up751dGWyGXIuPON4+MzcMqjZ
         yBMQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782757127; x=1783361927; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NnXEMWMeHcfJZj0MaNhzM6uICvxC4dBq5HeESdbhCWw=;
        b=HbwBaQVEgRSiel/7h7fM9yJMEKG0YhDFGT1fUWip0Ve8y6ihU/9ht322Y5KrB1+ANf
         p7vJK0emzvqqu4H+1LE+ioQqEnUvSIvMh8fdwRu3Yn3c3AMVa4+3D4GVRgG9lFDQpkRh
         FepAEOOGldu+xsNP1Q/NlNNTXA6l1mdyTY/HmAPB0p/cISD1sotJiQyhDlP2lhSLJaw+
         wW+meGkrVNmlUjQRUIBPKChdn6gN+ucQoIi5OTTV7yxNiaYXFQyHWfe99gdsdgKglywV
         /5VmbY8WL2EArEKRbm+C7Ew/IxASdwhM8dCMNPe0MDbuPFqNT5r0Mkte0E3YNBZgJWHZ
         WAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782757127; x=1783361927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnXEMWMeHcfJZj0MaNhzM6uICvxC4dBq5HeESdbhCWw=;
        b=eoKc8dOK/6Iax8eHi3o1uwRkchX64mT+VYC/6E/sTvvPG+B40aUT+ojzJKwsk6roY3
         eO0rcjUArAenefPt1gxs3y+hXOgd6yXrrJwmSikbVWswbUEk33I4mRzdLzyzqBPYlv3r
         h4c7JNDjuHdPMqlbw0sSJk6HxqsYGYg66YPl/Tj5Xj+NT81sNKuFvTzgxjuU/7x6jWbg
         O3afObZ7/yFNAYmu2HBpvNKN6/EcMb5SeGNr/bSJKIaUGddCtiJMgZmolCvwmiXL5n7H
         CHZZ/RzBPYivKDGsZ1TCUaf28zkU3kaoWpBML0Mjp7MrbJKa051OxCKmo18Hi8Xxoc+7
         jyEA==
X-Gm-Message-State: AOJu0Yw/wzUzHdakjRTb1Qsg1mUHGKNxxoebrz1TmO0a7an7BX79c4ao
	hcJzu9K64nH0OuZnjkdIc2OIPMPjWBqH+PAPOWBSmf2MPYvRMamk/kqe8o5OO9RxlqrLmOataRJ
	9ni9jiShBPR27/T6+YAyGSlVu5tQTv4QNwQ==
X-Gm-Gg: AfdE7cl3hZlA15iIuVATSJtpqz86JcPVbRUu4rjPMhL0ZX8UTu9+FHeyt6SyVvenT72
	IVgteNawo+cRqklpL2N0f06OZxIJFjAmzny8NhNZOgjrY2CTm7Ddw1UKl+XS6CfhZjnv8fXmwsM
	5nnl0kACLqP8qv5fkpQ7nLJcjKG9NcpIALiGJFXiktc5K4R6xSPRs3OJgFxrEisEXpEIVasCcMH
	3MJDrdGxcYaAKExDV0ev99NlRgoSrne2A7qQLOMuNd5z/0jKDK7PtaWAEnpNxWSM0b9iIFabqUk
	nn1zjGnMsko=
X-Received: by 2002:a05:690c:4d87:b0:799:198d:8c78 with SMTP id
 00721157ae682-810d9a06a10mr6140857b3.46.1782757127097; Mon, 29 Jun 2026
 11:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260627154904.338233-1-jan.vermaete@gmail.com>
In-Reply-To: <20260627154904.338233-1-jan.vermaete@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 29 Jun 2026 12:18:36 -0600
X-Gm-Features: AVVi8Cf8V_HeKGEkK4yq6MrL7N_yzReMv26nc99iKlbXfpGWOn--vHRH5gKx4nI
Message-ID: <CAJdd5GZJUmZDyKng2u2qSz+YWkchPZtLMivq-z12C9s9UrD2AQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pull-spdx-license.py: add the SPDX licenses exceptions
To: jan.vermaete@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004810aa0655687dbb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 18:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239819

--0000000000004810aa0655687dbb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 27, 2026 at 9:49=E2=80=AFAM Jan Vermaete via lists.openembedded=
.org
<jan.vermaete=3Dgmail.com@lists.openembedded.org> wrote:

> Fetch and extract the SPDX exception licenses as the normal licenses are
> handled.
>

Thanks, but we can't actually use the license exceptions this way. The
problem is that exceptions are only valid after an spdx `WITH` statement
(e.g. "GPL-3.0 AND OpenSSL-exception" is not valid), which our license
expressions do not support. Also, it's better to keep the licenses and
exceptions in separate files so that it's easier to distinguish them when
parsing.

Regardless, I have been working on converting all our license expressions
to valid SPDX expressions, but it got sidetracked by some SBoM work. Part
of that was somewhat similar patch to fetch the exceptions. If you would
like to take a look, the branch is contrib/jpew/spdx-licenses. I hope to
get back to working on that as soon as the SBoM stuff is sorted out.


>
> [YOCTO #16294]
>
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  scripts/pull-spdx-licenses.py | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/scripts/pull-spdx-licenses.py b/scripts/pull-spdx-licenses.p=
y
> index 597a62133f..de1f5b7bad 100755
> --- a/scripts/pull-spdx-licenses.py
> +++ b/scripts/pull-spdx-licenses.py
> @@ -55,20 +55,22 @@ def main():
>              data =3D json.load(response)
>              version =3D data["tag_name"]
>
> -    print(f"Pulling SPDX license list version {version}")
> -    req =3D urllib.request.Request(
> -        f"
> https://raw.githubusercontent.com/spdx/license-list-data/{version}/json/l=
icenses.json
> "
> -    )
> -    with urllib.request.urlopen(req) as response:
> -        spdx_licenses =3D json.load(response)
> +    spdx_licenses =3D {}
> +    for jsonfile in ["licenses.json", "exceptions.json"]:
> +        req =3D urllib.request.Request(
> +            f"
> https://raw.githubusercontent.com/spdx/license-list-data/{version}/json/{=
jsonfile}
> "
> +        )
> +        with urllib.request.urlopen(req) as response:
> +            spdx_licenses.update(json.load(response))
> +            print(len(spdx_licenses))
>
>      with (TOP_DIR / "meta" / "files" / "spdx-licenses.json").open("w") a=
s
> f:
>          json.dump(spdx_licenses, f, sort_keys=3DTrue, indent=3D2)
>
> -    total_count =3D len(spdx_licenses["licenses"])
> +    total_count =3D len(spdx_licenses["licenses"] +
> spdx_licenses["exceptions"])
>      updated =3D 0
> -    for idx, lic in enumerate(spdx_licenses["licenses"]):
> -        lic_id =3D lic["licenseId"]
> +    for idx, lic in enumerate(spdx_licenses["licenses"] +
> spdx_licenses["exceptions"]):
> +        lic_id =3D lic.get("licenseId") or lic.get("licenseExceptionId")
>
>          print(f"[{idx + 1} of {total_count}] ", end=3D"")
>
> @@ -88,7 +90,7 @@ def main():
>              continue
>
>          with dest_license_file.open("w") as f:
> -            f.write(lic_data["licenseText"])
> +            f.write(lic_data.get("licenseText") or
> lic_data.get("licenseExceptionText"))
>          updated +=3D 1
>          print("done")
>
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239697):
> https://lists.openembedded.org/g/openembedded-core/message/239697
> Mute This Topic: https://lists.openembedded.org/mt/120005594/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> JPEWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004810aa0655687dbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 27,=
 2026 at 9:49=E2=80=AFAM Jan Vermaete via <a href=3D"http://lists.openembed=
ded.org">lists.openembedded.org</a> &lt;jan.vermaete=3D<a href=3D"mailto:gm=
ail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fetch and e=
xtract the SPDX exception licenses as the normal licenses are handled.<br><=
/blockquote><div><br></div><div>Thanks, but we can&#39;t actually use the l=
icense exceptions this way. The problem is that exceptions are only valid a=
fter an spdx `WITH` statement (e.g. &quot;GPL-3.0 AND OpenSSL-exception&quo=
t; is not valid), which our license expressions do not support. Also, it&#3=
9;s better to keep the licenses and exceptions in separate files so that it=
&#39;s easier to distinguish them when parsing.</div><div><br></div><div>Re=
gardless, I have been working on converting all our license expressions to =
valid SPDX expressions, but it got sidetracked by some SBoM work. Part of t=
hat was somewhat similar patch to fetch the exceptions. If you would like t=
o take a look, the branch is contrib/jpew/spdx-licenses. I hope to get back=
 to working on that as soon as the SBoM stuff is sorted out.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
[YOCTO #16294]<br>
<br>
Signed-off-by: Jan Vermaete &lt;<a href=3D"mailto:jan.vermaete@gmail.com" t=
arget=3D"_blank">jan.vermaete@gmail.com</a>&gt;<br>
---<br>
=C2=A0scripts/pull-spdx-licenses.py | 22 ++++++++++++----------<br>
=C2=A01 file changed, 12 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/scripts/pull-spdx-licenses.py b/scripts/pull-spdx-licenses.py<=
br>
index 597a62133f..de1f5b7bad 100755<br>
--- a/scripts/pull-spdx-licenses.py<br>
+++ b/scripts/pull-spdx-licenses.py<br>
@@ -55,20 +55,22 @@ def main():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data =3D json.load(response=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version =3D data[&quot;tag_=
name&quot;]<br>
<br>
-=C2=A0 =C2=A0 print(f&quot;Pulling SPDX license list version {version}&quo=
t;)<br>
-=C2=A0 =C2=A0 req =3D urllib.request.Request(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f&quot;<a href=3D"https://raw.githubuserconten=
t.com/spdx/license-list-data/%7Bversion%7D/json/licenses.json" rel=3D"noref=
errer" target=3D"_blank">https://raw.githubusercontent.com/spdx/license-lis=
t-data/{version}/json/licenses.json</a>&quot;<br>
-=C2=A0 =C2=A0 )<br>
-=C2=A0 =C2=A0 with urllib.request.urlopen(req) as response:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 spdx_licenses =3D json.load(response)<br>
+=C2=A0 =C2=A0 spdx_licenses =3D {}<br>
+=C2=A0 =C2=A0 for jsonfile in [&quot;licenses.json&quot;, &quot;exceptions=
.json&quot;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 req =3D urllib.request.Request(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&quot;<a href=3D"https://raw.gi=
thubusercontent.com/spdx/license-list-data/%7Bversion%7D/json/%7Bjsonfile%7=
D" rel=3D"noreferrer" target=3D"_blank">https://raw.githubusercontent.com/s=
pdx/license-list-data/{version}/json/{jsonfile}</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with urllib.request.urlopen(req) as response:<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spdx_licenses.update(json.load(r=
esponse))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 print(len(spdx_licenses))<br>
<br>
=C2=A0 =C2=A0 =C2=A0with (TOP_DIR / &quot;meta&quot; / &quot;files&quot; / =
&quot;spdx-licenses.json&quot;).open(&quot;w&quot;) as f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0json.dump(spdx_licenses, f, sort_keys=3DT=
rue, indent=3D2)<br>
<br>
-=C2=A0 =C2=A0 total_count =3D len(spdx_licenses[&quot;licenses&quot;])<br>
+=C2=A0 =C2=A0 total_count =3D len(spdx_licenses[&quot;licenses&quot;] + sp=
dx_licenses[&quot;exceptions&quot;])<br>
=C2=A0 =C2=A0 =C2=A0updated =3D 0<br>
-=C2=A0 =C2=A0 for idx, lic in enumerate(spdx_licenses[&quot;licenses&quot;=
]):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 lic_id =3D lic[&quot;licenseId&quot;]<br>
+=C2=A0 =C2=A0 for idx, lic in enumerate(spdx_licenses[&quot;licenses&quot;=
] + spdx_licenses[&quot;exceptions&quot;]):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 lic_id =3D lic.get(&quot;licenseId&quot;) or l=
ic.get(&quot;licenseExceptionId&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(f&quot;[{idx + 1} of {total_count}]=
 &quot;, end=3D&quot;&quot;)<br>
<br>
@@ -88,7 +90,7 @@ def main():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with dest_license_file.open(&quot;w&quot;=
) as f:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(lic_data[&quot;licenseTe=
xt&quot;])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(lic_data.get(&quot;licen=
seText&quot;) or lic_data.get(&quot;licenseExceptionText&quot;))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0updated +=3D 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(&quot;done&quot;)<br>
<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#239697): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/239697" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/239697</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120005594/361=
6693" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120005594/3616693</a><br>
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

--0000000000004810aa0655687dbb--

