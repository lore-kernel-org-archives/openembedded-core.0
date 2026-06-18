Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4DCCD98ED
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 21:34:16 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30095.1781818447210579292
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 14:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ludq6LNx;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bf20f6be6bso10031895ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 14:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781818446; cv=none;
        d=google.com; s=arc-20240605;
        b=DJPwiGWJi+8ns9h0Up+9k+J3W/8zjItsxj3Wdo3CHL8jIiDzl8t0zDhyZhYar4Lh68
         GXC6zHzbVP77Fz2i7GaCjm4LHs6rqC5b3MHKWegC2b8WAZh0Knlkii+Zy2FuvHJMPb0g
         3agqiMEVxeOMhCLs9j7AYzsdNZF7p5W2LRhsE6n2QfQiqr4ZCkQYkXV6+269g1mt2W7Y
         raf/qJNWcuDs7lq6fN3ZM3DS1CZnGBQ5tvOBpvprPlx5Xy0BPW5M+rvz7YNUfqLvvVId
         osR5AzvFGscHIoMS4Qilycgxnd0LzjzIHZX/KUP4RYqgzI2Q2DarUU71SaPk4k2HXdVK
         Dm9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6UgCtseky2KYzT9tDhFcGIla3uDlhk8skZ9j33vhmIM=;
        fh=cPBSa2bPcOK65+sz6qCMWy/OU7OhGJNaXGJCXkhGLPo=;
        b=hmppopBaYOZv9N7aGc2Bx6cXjcJbsU4PUPJnTyVXdmZjVmL53oApp0w6862xiN+Jbr
         BicLY1/sgjG3VOjJXGwGzk712/5zYtVjjp+UUFMcLrSVJum9aNMq+EOjcM4VNdYPkLw/
         Cw+xm9f9De/TKd/zLYJnXzdw+TH2S1oMSNWE7lLLG4rlCirPrsY2J5WbpmddNb6FNgsY
         7W7D0BvR9at8KTCXs8TUpZKDcCmiogD55RUjq9rj3kcHFV9XLGoC4W648ry1ztztT03I
         3LDqJmR1ut6vgL1YqJqgJ7gUSZAWERZ1gR3DMu9WhiHNtpYqzuxbOkL63HsPMxber89U
         AO/A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781818446; x=1782423246; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6UgCtseky2KYzT9tDhFcGIla3uDlhk8skZ9j33vhmIM=;
        b=Ludq6LNxYMXU5nLIag3rstmJUHfyE1khoLDlY967dI5rPQs5lHyfALtAMbLfpW4zId
         85GEurE0nNe4dUMubwdmQ0C53hKT5VHcSxM6+FFs6DVisgbE4cky+abDpl313sY9sD1R
         tqNE3uvuXGD3J4143s7O1rtMn/cJdaY+fziZe87ySphC3aBE7oTC8iyvHv2V1fXoCBFx
         nHb+5rOM44+Mjq+K1x0Edgx5jmdEcOYuylZSeZLP7THNDW6netEaWJpLKeXc8ah1E/74
         tJJ07oT0ZvLnKCWNxV+CJBtSR1mp/Qew3YggBBPXZj8cDFQfZgICeCAxvBPlmumbJIXH
         dF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781818446; x=1782423246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UgCtseky2KYzT9tDhFcGIla3uDlhk8skZ9j33vhmIM=;
        b=tIr7ELWeEolBxWIlyxhBr9/Hd1uiCKi0qtZn0irbazUrdh+YckcMKzWjzXykQzQRYw
         cQkXlj2g7WCIHErjE7h14Uk8LT2nZywh3kn9mqP/XTBKf6tr5faO188ajQ2kPMV5AMR9
         DcBcOA/zZVlLMbipBioBMC6cvAh+MzxZOwIznF9ly4dYpNcNvrkNwOC4VICQrJ4tSjw8
         vLIATpbaWXeJ2tHFmLZWbIpB2G9GHuRGGYVs37sEqLdCTH8v/UviBNgKOJZDK9UCy5aR
         F3R7GlFmwC99q0Vn1hxm/wOV2O/E+gNT98sBmS2Jq7p38+8WOY1Gc1B1kbBtif/Kgdsa
         idNw==
X-Gm-Message-State: AOJu0YwOstcCBa/Zi7nVVFbJaGHqL32KwK0aSCAnxSno4p4z2Fp6ggr8
	LkPbDbUOOCL8q1BbB14Sv57Kkt7q6r2SDbKC3nbJOkWPTOE7Y3FU9T325KaWCTdzjX5FabZZ3h8
	UAoWuFId7DBNxap2ZjuSYdOecWW8FlTQ=
X-Gm-Gg: AfdE7ckVW6dAqVeTMiEGbrD5AZRPLsAwAJQYf76n9sioRYCCL1p5iqZhTaoAmVZGUfu
	OwVXkLk7XAgFBXSsShZ3JA1I8DMOFWxBmCOTzVmlFshP7/Mska9ZjXy0VxebMDPBjf5Nm4RgH9B
	+GdannHMq9zaA/P2p8aUECfqdA3CPdaoKDI4KqFnty0SwfOiPTNVbvU6b3uNfpRmpyAzLnQ7GUf
	zY9OejOFbOqPenf5QlzPR0GGYq+WfRfHL/Fm7/z05T5+gHqGwN5SIJiplP0eR6gAorAXa4xkrGx
	kDqwl5KJ/OVS1XHdRLasVPf4M+MtWgr7CzRU3VU3+bf3VkiL0iZ+7FNxrOLqWU872bDN6PiL9u7
	u3mQi6OJBdwQMZRS6g8aUBl6O9A==
X-Received: by 2002:a17:902:f792:b0:2c2:75c4:4b0f with SMTP id
 d9443c01a7336-2c718cc204emr10991755ad.2.1781818446425; Thu, 18 Jun 2026
 14:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260618213119.2495463-1-john.ripple@keysight.com>
In-Reply-To: <20260618213119.2495463-1-john.ripple@keysight.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 18 Jun 2026 17:33:53 -0400
X-Gm-Features: AVVi8CcSu9X9Nx1T-mP8k8o2cIwR6hX9vWUkxpZfaoAxsrZh66-owFRW-I-Ofks
Message-ID: <CADkTA4MYBKZuuJ5iNHvq+SErx=mB3fz1UZq3VC1rofMemoUivw@mail.gmail.com>
Subject: Re: [OE-core] [meta][PATCH] go-vendor.bbclass: Unpack into BP for destsuffix
To: john.ripple@keysight.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008db11406548defa1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 21:34:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239110

--0000000000008db11406548defa1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 5:31=E2=80=AFPM John Ripple via lists.openembedded.=
org
<john.ripple=3Dkeysight.com@lists.openembedded.org> wrote:

> The go-vendor class has a hardcoded destsuffix variable used to unpack
> sources fetched with the go_src_uri function. Change this unpack
> location to take the base package name into account (BP) as is the new
> standard.
>

I have no particular issues with the change, but the commit log doesn't
tell us why this is needed. Was something breaking ? is there any risk
to the assumptions that other classes/recipes/layers may have made
about the location of the unpacked files ?

Bruce



>
> Signed-off-by: John Ripple <john.ripple@keysight.com>
> ---
>  meta/classes/go-vendor.bbclass | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/go-vendor.bbclass
> b/meta/classes/go-vendor.bbclass
> index 6ec6178add..f854d14bdf 100644
> --- a/meta/classes/go-vendor.bbclass
> +++ b/meta/classes/go-vendor.bbclass
> @@ -19,7 +19,7 @@ inherit go-mod
>  def go_src_uri(repo, version, path=3DNone, subdir=3DNone, \
>                  vcs=3D'git', replaces=3DNone, pathmajor=3DNone):
>
> -    destsuffix =3D "git/src/import/vendor.fetch"
> +    destsuffix =3D "${BP}/src/import/vendor.fetch"
>      module_path =3D repo if not path else path
>
>      src_uri =3D "{}://{};name=3D{}".format(vcs, repo,
> module_path.replace('/', '.'))
> @@ -58,7 +58,8 @@ python do_go_vendor() {
>      if not src_uri:
>          bb.fatal("SRC_URI is empty")
>
> -    default_destsuffix =3D "git/src/import/vendor.fetch"
> +    base_package =3D d.getVar('BP')
> +    default_destsuffix =3D "{}/src/import/vendor.fetch".format(base_pack=
age)
>      fetcher =3D bb.fetch2.Fetch(src_uri, d)
>      go_import =3D d.getVar('GO_IMPORT')
>      source_dir =3D d.getVar('S')
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239109):
> https://lists.openembedded.org/g/openembedded-core/message/239109
> Mute This Topic: https://lists.openembedded.org/mt/119874754/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000008db11406548defa1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 18, 2026 at 5:31=
=E2=80=AFPM John Ripple via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;john.ripple=3D<a href=3D"mailto:keysight.com@list=
s.openembedded.org">keysight.com@lists.openembedded.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">The go-vendor class =
has a hardcoded destsuffix variable used to unpack<br>
sources fetched with the go_src_uri function. Change this unpack<br>
location to take the base package name into account (BP) as is the new<br>
standard.<br></blockquote><div><br></div><div><div class=3D"gmail_default" =
style=3D"font-size:small">I have no particular issues with the change, but =
the commit log doesn&#39;t</div><div class=3D"gmail_default" style=3D"font-=
size:small">tell us why this is needed. Was something breaking ? is there a=
ny risk</div><div class=3D"gmail_default" style=3D"font-size:small">to the =
assumptions that other classes/recipes/layers may have made</div><div class=
=3D"gmail_default" style=3D"font-size:small">about the location of the unpa=
cked files ?</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><=
br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
Signed-off-by: John Ripple &lt;<a href=3D"mailto:john.ripple@keysight.com" =
target=3D"_blank">john.ripple@keysight.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/go-vendor.bbclass | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-vendor.bbclas=
s<br>
index 6ec6178add..f854d14bdf 100644<br>
--- a/meta/classes/go-vendor.bbclass<br>
+++ b/meta/classes/go-vendor.bbclass<br>
@@ -19,7 +19,7 @@ inherit go-mod<br>
=C2=A0def go_src_uri(repo, version, path=3DNone, subdir=3DNone, \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vcs=3D&#39;gi=
t&#39;, replaces=3DNone, pathmajor=3DNone):<br>
<br>
-=C2=A0 =C2=A0 destsuffix =3D &quot;git/src/import/vendor.fetch&quot;<br>
+=C2=A0 =C2=A0 destsuffix =3D &quot;${BP}/src/import/vendor.fetch&quot;<br>
=C2=A0 =C2=A0 =C2=A0module_path =3D repo if not path else path<br>
<br>
=C2=A0 =C2=A0 =C2=A0src_uri =3D &quot;{}://{};name=3D{}&quot;.format(vcs, r=
epo, module_path.replace(&#39;/&#39;, &#39;.&#39;))<br>
@@ -58,7 +58,8 @@ python do_go_vendor() {<br>
=C2=A0 =C2=A0 =C2=A0if not src_uri:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.fatal(&quot;SRC_URI is empty&quot;)<br=
>
<br>
-=C2=A0 =C2=A0 default_destsuffix =3D &quot;git/src/import/vendor.fetch&quo=
t;<br>
+=C2=A0 =C2=A0 base_package =3D d.getVar(&#39;BP&#39;)<br>
+=C2=A0 =C2=A0 default_destsuffix =3D &quot;{}/src/import/vendor.fetch&quot=
;.format(base_package)<br>
=C2=A0 =C2=A0 =C2=A0fetcher =3D bb.fetch2.Fetch(src_uri, d)<br>
=C2=A0 =C2=A0 =C2=A0go_import =3D d.getVar(&#39;GO_IMPORT&#39;)<br>
=C2=A0 =C2=A0 =C2=A0source_dir =3D d.getVar(&#39;S&#39;)<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#239109): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/239109" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/239109</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119874754/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119874754/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000008db11406548defa1--

