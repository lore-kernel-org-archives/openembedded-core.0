Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12538C36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 09:52:10 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.22083.1744365119541987074
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 02:52:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kGaIAFCx;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso13249575e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 02:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1744365117; x=1744969917; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wI4TrmiLg6KdlERrkTvxgXkP7BmizWjfaWoXIZlcgJ4=;
        b=kGaIAFCxzpOB7gQaNAnZ4FJ82wiZtyX9xuX4IOk5Vi8Y21XtEy2mUNmIAWSBqxG+ZI
         Irj+u/xYiwxQeSByOccWTCaeFXiKTQ7A54l+mAPli3r2zKZGax2SlPs/o8CoOu2W/d1i
         BdZ/EilP+6ILeDOOAPrbmrpkvyTJ6BtUm90KQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744365117; x=1744969917;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wI4TrmiLg6KdlERrkTvxgXkP7BmizWjfaWoXIZlcgJ4=;
        b=K9xA+8zfS9tdlMeWUgY3Fo0LcWgom8ykPqqDdi4/2GN9KewDQFLtOsahLG4AW1v8XT
         J62I4QsdTiXKrJYAixLQpMkHLHPuTYt+JbJirPZHYFWBOh/ffB09OIoSYh/4quy+VgWY
         H0HxaZ9esjJ9w08KrHnb5FL1gOP6JbS+5P2iOeDUHMtJtPzbNx8EQGIzqmUHL51H7Aio
         T6NSFya0FWAopSO9QiCLEjObwy4305qxZ82xL5g/jnQB9JKQmwQRSJ78FkzjbL9omJqk
         Jg/U76q5TqBD950manjrevWpOkKW9Lceq0TJnJianb7dTQCPALHZyFZH+8ni6YDGZVUV
         /eCQ==
X-Gm-Message-State: AOJu0YxozH/QKv0KXG4YhUOYM1ezBFXgWN35F9RFDihHyZ8OqeXdk+r5
	HmXm7YfnvX3aFxrgDfYn3Vp9FQN4+gq+ziePr+B+UFj8z9KK6jgbg2SlwaRkHhE3PiXRZJFwjue
	nwahrFmv4kKxZYffEbzpKEYiCuPQwa+x//HOMJw==
X-Gm-Gg: ASbGncvcsYl1W7sninKKnk2WxGx4NqMofsIhxiBZTeSR+LzEqXUqD11Q2+MxQSRWEYi
	epE2pMLtepw6vTL+Y1R5mk7G1kw/Or1Phd/DYbh1FWeDEiacNwnmrWLLrwJr9hgXuw7T7sfaBLT
	Rkh3lr6OME4+LK6V6HRFXRWy+mtwE2YZ33q4GCapl6crr5rDcPD75UAeaOiQYEyLLn2w==
X-Google-Smtp-Source: AGHT+IH6HvDLrrnPhDFUlVRnTYLS9vmf8kouE//c/V3vJV29r6y46SqrXCpFTzoBrMRthWgqPmcUfrmAlVv8DTguWtU=
X-Received: by 2002:a05:600c:1e07:b0:43d:26e3:f2f6 with SMTP id
 5b1f17b1804b1-43f3a925587mr14707655e9.5.1744365116505; Fri, 11 Apr 2025
 02:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250411093440.20727-1-vanusuri@mvista.com>
In-Reply-To: <20250411093440.20727-1-vanusuri@mvista.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 11 Apr 2025 11:51:29 +0200
X-Gm-Features: ATxdqUHoFJxZNgxIQnAGgkDAkWsa4V2iQ9QyycOOQ0vgmuyD0SOp7t3FzPosv5w
Message-ID: <CAMSfU+5+s0T5PbTiftgd3EeVUjWJzDNoqnfM3T=k=8FaZMF8vg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] openssh: upgrade 9.9p2 -> 10.0p1
To: vanusuri@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000020d17106327da7fc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 09:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214724

--00000000000020d17106327da7fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 11 avr. 2025 =C3=A0 11:35, Vijay Anusuri via lists.openembedded.org
<vanusuri=3Dmvista.com@lists.openembedded.org> a =C3=A9crit :

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Includes fix for CVE-2025-32728
>
> Release Notes: https://www.openssh.com/txt/release-10.0


There was a mishap in the release process:
https://www.openwall.com/lists/oss-security/2025/04/09/6

This version will present itself as 10.0p2 (see version.h in sources)

I don't know if we need to handle this particularly in the recipe but can
you mention this is the commit message to avoid an eventual confusion?

Thanks!


> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../openssh/{openssh_9.9p2.bb =3D> openssh_10.0p1.bb}             | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-connectivity/openssh/{openssh_9.9p2.bb =3D>
> openssh_10.0p1.bb} (99%)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.9p2.bb
> b/meta/recipes-connectivity/openssh/openssh_10.0p1.bb
> similarity index 99%
> rename from meta/recipes-connectivity/openssh/openssh_9.9p2.bb
> rename to meta/recipes-connectivity/openssh/openssh_10.0p1.bb
> index 5191725796..21e1e50759 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.9p2.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_10.0p1.bb
> @@ -26,7 +26,7 @@ SRC_URI =3D "
> https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
>
> file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
>
> file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "91aadb603e08cc285eddf965e1199d02585fa94d994d6cae5b41e1721e215673"
> +SRC_URI[sha256sum] =3D
> "021a2e709a0edf4250b1256bd5a9e500411a90dddabea830ed59cef90eb9d85c"
>
>  CVE_STATUS[CVE-2007-2768] =3D "not-applicable-config: This CVE is specif=
ic
> to OpenSSH with the pam opie which we don't build/use here."
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214721):
> https://lists.openembedded.org/g/openembedded-core/message/214721
> Mute This Topic: https://lists.openembedded.org/mt/112207287/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--00000000000020d17106327da7fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 11=
 avr. 2025 =C3=A0=C2=A011:35, Vijay Anusuri via <a href=3D"http://lists.ope=
nembedded.org">lists.openembedded.org</a> &lt;vanusuri=3D<a href=3D"mailto:=
mvista.com@lists.openembedded.org">mvista.com@lists.openembedded.org</a>&gt=
; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
Includes fix for CVE-2025-32728<br>
<br>
Release Notes: <a href=3D"https://www.openssh.com/txt/release-10.0" rel=3D"=
noreferrer" target=3D"_blank">https://www.openssh.com/txt/release-10.0</a><=
/blockquote><div><br></div><div>There was a mishap in the release process: =
<a href=3D"https://www.openwall.com/lists/oss-security/2025/04/09/6">https:=
//www.openwall.com/lists/oss-security/2025/04/09/6</a></div><div><br></div>=
<div>This version will present itself as 10.0p2 (see version.h in sources)<=
/div><div><br></div><div>I don&#39;t know if we need to handle this particu=
larly in the recipe but can you mention this is the commit message to avoid=
 an eventual confusion?</div><div><br></div><div>Thanks!</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../openssh/{<a href=3D"http://openssh_9.9p2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">openssh_9.9p2.bb</a> =3D&gt; <a href=3D"http://openssh_10.=
0p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_10.0p1.bb</a>}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-connectivity/openssh/{<a href=3D"http://openssh_9=
.9p2.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.9p2.bb</a> =3D&gt; =
<a href=3D"http://openssh_10.0p1.bb" rel=3D"noreferrer" target=3D"_blank">o=
penssh_10.0p1.bb</a>} (99%)<br>
<br>
diff --git a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.=
9p2.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.9p2.bb</a> b/meta/re=
cipes-connectivity/openssh/<a href=3D"http://openssh_10.0p1.bb" rel=3D"nore=
ferrer" target=3D"_blank">openssh_10.0p1.bb</a><br>
similarity index 99%<br>
rename from meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.9=
p2.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.9p2.bb</a><br>
rename to meta/recipes-connectivity/openssh/<a href=3D"http://openssh_10.0p=
1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_10.0p1.bb</a><br>
index 5191725796..21e1e50759 100644<br>
--- a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.9p2.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssh_9.9p2.bb</a><br>
+++ b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_10.0p1.bb=
" rel=3D"noreferrer" target=3D"_blank">openssh_10.0p1.bb</a><br>
@@ -26,7 +26,7 @@ SRC_URI =3D &quot;<a href=3D"https://ftp.openbsd.org/pub/=
OpenBSD/OpenSSH/portable/openssh-$%7BPV%7D.ta" rel=3D"noreferrer" target=3D=
"_blank">https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}=
.ta</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-regress-banner.sh-log=
-input-and-output-files-on-erro.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-regress-test-exec-use=
-the-absolute-path-in-the-SSH-e.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;91aadb603e08cc285eddf965e1199d02585fa94d994d6=
cae5b41e1721e215673&quot;<br>
+SRC_URI[sha256sum] =3D &quot;021a2e709a0edf4250b1256bd5a9e500411a90dddabea=
830ed59cef90eb9d85c&quot;<br>
<br>
=C2=A0CVE_STATUS[CVE-2007-2768] =3D &quot;not-applicable-config: This CVE i=
s specific to OpenSSH with the pam opie which we don&#39;t build/use here.&=
quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#214721): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/214721" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/214721</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112207287/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112207287/4316185</a><br>
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

--00000000000020d17106327da7fc--

