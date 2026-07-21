Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB89C44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 15:32:06 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25715.1784647919698453038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 08:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EFlbbcoB;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-668005ba03cso7457316d50.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 08:31:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784647919; cv=none;
        d=google.com; s=arc-20260327;
        b=SKvaIIu7oOpiBpjWgWkEmKnd1YeDz/hKYkxOGjT8HtljMivMFoCfDxd1PRlhXv0doy
         ZtAG9J+EkDVm/gqGpMTZWjo+S90x/DnMSvDfJ8YPpYE2GQFEloXJ/Ul3RBPpf8aqjZ2p
         EWO1+scZHSXQL3l/zv2qI0W2gVKtmL9aaR2zBBCHwSZwFASBWsd5/yqN6G5dtAbBPqLQ
         +n674K38+F/1kU6hQYAIpiWDuUswQtIJ5IxXm2ocJh5M67nBocd6/ex62d8f2WMMIJWM
         p6aW1O+d/NAsrSjEr+1JyQ01FZVsRepmhhwT0sYBvXXheodCBzNuR/BLMH04oKlmKN46
         17eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Catw2xTmu4DQEuEHYe3v7PFz/7Wxo9kAJCv5IE3JcVU=;
        fh=ev3YHTlA+Rnn0+ia9p7eyeLVcBzKuVI57zldhlHf5Vk=;
        b=B99O82yqGz/43R7c60NDY7ge54lll6+T4hD0O8n5MwN+Autbbz/ex1PLH/yfbb7czS
         iWsrArS3pT2tob5F5cKvgPF2tXoxTWKEz0ZptfibMHvowJEkt4X086BXw3f0RU8iQo6c
         pdUcc7ck80yC7PcxgUEgN+EV6fHZQj/gyRFtGtOKincMXLqk4hUD7BqYBCVfe9MYyowe
         mpYQO+E354A5dd6E89Zr81uT297LaQb3nULlpG08gDOo1Z3Ll/Zf+jyCftekn4sjAI9j
         lFAi/r2MYlP9+1eja6ZYAaJMX9Xk5lQnk6KJI8JEHz48ma7l2dPR2wLw1xYj7Jb+4TNX
         TOAw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784647919; x=1785252719; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Catw2xTmu4DQEuEHYe3v7PFz/7Wxo9kAJCv5IE3JcVU=;
        b=EFlbbcoBgfmIlSH9J/JpXN/AKDXzZZjX0iyJ83cVERBDV4iSCssq7XoOojhBg7jwmG
         yIhWkCLZyFg1B2k2lZYUCK1jARnI/YzXHOMxXEmJ+gJlPr5BxJknoTvyW7OdV+pOrFHa
         FESa8C0SjDQQVE++nc+c7/OoYFxnKo38W51aj0/nPPIhN+pjWvy2OCBsCNBA4dCHvKzk
         Fz22JA4MokF85lQCTqDczrYCB+c5LiLkpJ053XyLiGlm2qd/lBPNJJiTWFlOc/GEiv63
         Y4/+sD4oGHZO2d2AzeGKkFv2Mjj9eZWvzA3MjGcWIZAoxqCXJmVyJ5LPGO4RaFdwaSE/
         HqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784647919; x=1785252719;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Catw2xTmu4DQEuEHYe3v7PFz/7Wxo9kAJCv5IE3JcVU=;
        b=aWo7IS6J4ng92aHDfv3xFkI2+JXox3/QUeIlWIohtC2m0jRh7owlKqHyGN53OGh2af
         EF4+YqshV39I7VTW8xXN6mF1L2/OZ38h0l2q2yrVi3sFeJKrRXiBqWFyI2fhm3K5DSQg
         sTl3Rb/iqox6wdgVXmEmm02bsj5Yw8hv38MR9pqwER51T3BU95ae2uDjZKy6gIfrLqpo
         d2AVTjkO8xUTAXzZjYyCKdNaERsvhSkBg0jB8XFr9Du84VwyHWGcEaL4UE8sJNMl7SoW
         jK7TE+3yzMTkigCZVhkg8eyA+FjF430XnR5c0a36FdQygIuTD5DJh3GME4mXdT4LSEX5
         Nh7Q==
X-Gm-Message-State: AOJu0YwcubprWKhz/XXl7B7iXgpAM8a35p0PehGfMZXGv6XHV1tjYuNp
	EmmHnEIgqwFZcPw5oobFMMmmh9xIj8ukFhpiJG+rJRElSZE72XiSkG40PH7Fu6zXdjrZTYCs0oP
	3VBWYfoP8gzmbyuf8unUxHIv56vFvJLo=
X-Gm-Gg: AR+sD12wlYzSRG67jfzh2A+CGH4LT5yWRLQpueseqyQ9OmwUVj/6QoBR0+Qq+u0IrIN
	CHh5Co4E23i2PojWJ0sSyDz40WXLS20UwLtlIDsAkI7/2y8V4wKTZgm85Ct3DuPnW770E/oIs50
	FyLY5v9bH6tItsiU1zxyOmokkWLpazQwcOt0svuv6GrygvqUIGyzeXCJfkojfzsR1TVFf0RSAlv
	6pvw+TfhAOjKU5l0DcsR8itAvmcfcP/06kqYsBmN/KIIuE3+u9vfrOugNvnyN36FCDnw22t0EWV
	hp9KNTodGw==
X-Received: by 2002:a05:690e:429c:20b0:664:ae67:b672 with SMTP id
 956f58d0204a3-6683bd7a996mr4279113d50.78.1784647918540; Tue, 21 Jul 2026
 08:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260721152543.3468210-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260721152543.3468210-1-dmitry.baryshkov@oss.qualcomm.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 21 Jul 2026 09:31:46 -0600
X-Gm-Features: AUfX_mxW3UWSbwEjmFZaqsKXxTJTdEB3gHmET3eGKbsf4NxuMBiGRqERTszj2ng
Message-ID: <CAJdd5GZt7OiASVewQWq6SHbCnJ-NENzL8UpzGFJHxRBkaJOjBQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] license: fix list_licenses() crash on CLOSED
 and empty licenses
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003be0f3065720b90b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 15:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241553

--0000000000003be0f3065720b90b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 9:26=E2=80=AFAM Dmitry Baryshkov via lists.openembe=
dded.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> oe.license.list_licenses() passes the result of parse_legacy_license()
> straight into walk_license(), which unconditionally iterates
> node.children. For LICENSE =3D "CLOSED" (and for an empty license string)
> parse_legacy_license() returns None, so walk_license(None) dereferences
> None.children and aborts do_package_qa with:
>
>   AttributeError: 'NoneType' object has no attribute 'children'
>
> This breaks packaging for every CLOSED-licensed recipe reaching the
> obsolete-license QA check.
>
> Guard the walk against a None node, mirroring the existing "if node:"
> check in the neighbouring apply_pkg_license_exclusion().
>

LGTM, thanks.

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>


>
> Fixes: e9d424738d6f ("classes/conf/lib: Parse LICENSE as SPDX Expression"=
)
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta/lib/oe/license.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
> index a1dce143dd20..adcfc827cfc0 100644
> --- a/meta/lib/oe/license.py
> +++ b/meta/lib/oe/license.py
> @@ -235,7 +235,9 @@ def list_licenses(licensestr, d):
>          for child in node.children:
>              walk_license(child)
>
> -    walk_license(parse_legacy_license(d, licensestr))
> +    node =3D parse_legacy_license(d, licensestr)
> +    if node:
> +        walk_license(node)
>      return set(licenses)
>
>  def return_spdx(d, license):
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#241552):
> https://lists.openembedded.org/g/openembedded-core/message/241552
> Mute This Topic: https://lists.openembedded.org/mt/120378577/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> JPEWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003be0f3065720b90b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 21,=
 2026 at 9:26=E2=80=AFAM Dmitry Baryshkov via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;dmitry.baryshkov=3D<a href=3D"m=
ailto:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.opene=
mbedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">oe.license.list_licenses() passes the result of parse_legacy_lic=
ense()<br>
straight into walk_license(), which unconditionally iterates<br>
node.children. For LICENSE =3D &quot;CLOSED&quot; (and for an empty license=
 string)<br>
parse_legacy_license() returns None, so walk_license(None) dereferences<br>
None.children and aborts do_package_qa with:<br>
<br>
=C2=A0 AttributeError: &#39;NoneType&#39; object has no attribute &#39;chil=
dren&#39;<br>
<br>
This breaks packaging for every CLOSED-licensed recipe reaching the<br>
obsolete-license QA check.<br>
<br>
Guard the walk against a None node, mirroring the existing &quot;if node:&q=
uot;<br>
check in the neighbouring apply_pkg_license_exclusion().<br></blockquote><d=
iv><br></div><div>LGTM, thanks.</div><div><br></div><div>Reviewed-by: Joshu=
a Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com">JPEWhacker@gmail.com</a>=
&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Fixes: e9d424738d6f (&quot;classes/conf/lib: Parse LICENSE as SPDX Expressi=
on&quot;)<br>
Assisted-by: Claude:claude-opus-4-8<br>
Signed-off-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@oss.=
qualcomm.com" target=3D"_blank">dmitry.baryshkov@oss.qualcomm.com</a>&gt;<b=
r>
---<br>
=C2=A0meta/lib/oe/license.py | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py<br>
index a1dce143dd20..adcfc827cfc0 100644<br>
--- a/meta/lib/oe/license.py<br>
+++ b/meta/lib/oe/license.py<br>
@@ -235,7 +235,9 @@ def list_licenses(licensestr, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for child in node.children:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0walk_license(child)<br>
<br>
-=C2=A0 =C2=A0 walk_license(parse_legacy_license(d, licensestr))<br>
+=C2=A0 =C2=A0 node =3D parse_legacy_license(d, licensestr)<br>
+=C2=A0 =C2=A0 if node:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 walk_license(node)<br>
=C2=A0 =C2=A0 =C2=A0return set(licenses)<br>
<br>
=C2=A0def return_spdx(d, license):<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#241552): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/241552" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/241552</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120378577/361=
6693" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120378577/3616693</a><br>
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

--0000000000003be0f3065720b90b--

