Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184A3CAC59F
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 09:11:01 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.9364.1758186650571115688
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 02:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fwb1NMgd;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: ernstp@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62ec5f750f7so1201397a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 02:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758186649; x=1758791449; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2gaOdHrUMSRomBgf/pC9FzUkvNbNBT73BwryE2ni0ug=;
        b=Fwb1NMgd/i5hKtDHFS7YLd42dKBcy9kC1jYtnrsxIkh8DljKIgnXT5obQh3QJgAObD
         Pr4cGTw8AG/GXGMQoWowtqfDMitQL+H1kP2P4Zs5/IbvNXo9v15QoekOwPLfdYafh4Q2
         +en3mpYfJxJyaqjJkOOBow1VuQkY3eRxiQx+5EdXqEYlAc1y9oI+yD3HgFN5DQJO4f/E
         gdwElkvdHNkOKFLh/fgL9cEUsInICaeLBNG4/xdiDrNU2keqldYtUu0qwNI6YOuO4vWV
         PY2Rpq+WT5z8JrDzh1RuTL/dIph9P1InHSb+Vz0upcvs5f0w26FPDCR+cgsjEQwt5QGD
         0OvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758186649; x=1758791449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2gaOdHrUMSRomBgf/pC9FzUkvNbNBT73BwryE2ni0ug=;
        b=T0Va7Tw5ED10R79Xy3c1DlmY/uNnUFu5uul81dK2n2HiKH4iSC0C5eZ52bv4NI5q2c
         4EWeVKYGnopWaXIlJq/aihVFCWjTa80c/5be2rYQVRnlcOwWyGDFgaf1W3FZYsAjh37i
         rZuDzG0qEIrcS7VEuYSAvvJwbile7iWaRXNTB6B+xa9lK31GebwQg2QxxIafMDXBQBIB
         McAweRG6Rk8SVXz2fiGDKO8wYVHr/Skq5rEQBDqoWT1pX8HakwaoesF8ZCL8vPmzrDy2
         BkCl6uzUTeV7OLRprbS3912b7jdg4hMUSzyqEc2CqkX6enxEXwgl0yavbysR2tO3hvQE
         qW1g==
X-Gm-Message-State: AOJu0YyrFkwW26w8YYMWpP+Rwki2alduMw9uNEnLR/U1aK5JmCnq0LuI
	aiUAAImRCjd3Mn73VZZpRxqYmOaWGj3LMHKg3HM7zo4sdoaLLA0AehByDTqLj/YIQetfioqa1iK
	dEcUDbqP9rXixeSfNIcRpSQXt9/gqiSc=
X-Gm-Gg: ASbGncs2Cy0bPGBkalAqbjE+N2hk2JLWh7Br4JnYLkDxBIRD72EdHShNWm1jskGXhtx
	5Qtwji3t51w5rXo64sMTWIrA4D50Xvx+Po60uWyLQpvFRhy5U3j9aqnlCv9Nq6CebioYMV0PRCE
	4cG0vTqZdCxbQG1/w9ML+ocZEpJsWAa0Q3xR8ZWEf9CvF+WwZHujNsfV1g/+yEYq3kkDFYugFMh
	gNUTBwiCdX7hc2bLFFypcSkWTc=
X-Google-Smtp-Source: AGHT+IGmsHvIiveGQlaO++BH/UHFB0XvVybyUvJOz6PBdn3+MO4CX8UKhQYAmS1PzbiNadPLmvxU6IwD5BIA5OT/YnE=
X-Received: by 2002:a05:6402:1e93:b0:62f:7bf4:c66d with SMTP id
 4fb4d7f45d1cf-62f84213960mr5228077a12.3.1758186648613; Thu, 18 Sep 2025
 02:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250917131250.2490358-1-martin.jansa@gmail.com>
In-Reply-To: <20250917131250.2490358-1-martin.jansa@gmail.com>
From: Ernst Persson <ernstp@gmail.com>
Date: Thu, 18 Sep 2025 11:10:36 +0200
X-Gm-Features: AS18NWDqfYYDK_75BozgDQ2kZV0zRvs9vk1gMQcF0EV7icKSaGf_oHN7P23rbsc
Message-ID: <CAD=4a=UYeUgm743mqWQbZ7N4=B0FO0M5G_PCehy6OVCJ+Vh-PA@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCHv2] sanity.conf: Update minimum
 bitbake version to 2.8.13
To: martin.jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com
Content-Type: multipart/alternative; boundary="000000000000a3b863063f0fbaf9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 09:11:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223632

--000000000000a3b863063f0fbaf9
Content-Type: text/plain; charset="UTF-8"

Why the V2? I think the original "2.8.1" was correct for Scarthgap.

Den ons 17 sep. 2025 kl 15:12 skrev Martin Jansa via lists.openembedded.org
<martin.jansa=gmail.com@lists.openembedded.org>:

> From: Martin Jansa <martin.jansa@gmail.com>
>
> Needed for multiprocessing module in bb used in the next commit.
>
> It was added to bitbake in 62be9113d98fccb347c6aa0a10d5c4ee2857f8b6
> which was backported to 2.8 branch and tagged as 2.8.13
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta/conf/sanity.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
> index d2f56a3fb0..45ff2fc09b 100644
> --- a/meta/conf/sanity.conf
> +++ b/meta/conf/sanity.conf
> @@ -3,7 +3,7 @@
>  # See sanity.bbclass
>  #
>  # Expert users can confirm their sanity with "touch conf/sanity.conf"
> -BB_MIN_VERSION = "2.7.3"
> +BB_MIN_VERSION = "2.8.13"
>
>  SANITY_ABIFILE = "${TMPDIR}/abi_version"
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223602):
> https://lists.openembedded.org/g/openembedded-core/message/223602
> Mute This Topic: https://lists.openembedded.org/mt/115290739/4947266
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ernstp@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000a3b863063f0fbaf9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Why the V2? I think the original &quot;2.8.1&quot; was =
correct for Scarthgap.</div></div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">Den ons 17 sep. 2025 kl 1=
5:12 skrev Martin Jansa via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists.=
openembedded.org">gmail.com@lists.openembedded.org</a>&gt;:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">From: Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;<br>
<br>
Needed for multiprocessing module in bb used in the next commit.<br>
<br>
It was added to bitbake in 62be9113d98fccb347c6aa0a10d5c4ee2857f8b6<br>
which was backported to 2.8 branch and tagged as 2.8.13<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/sanity.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf<br>
index d2f56a3fb0..45ff2fc09b 100644<br>
--- a/meta/conf/sanity.conf<br>
+++ b/meta/conf/sanity.conf<br>
@@ -3,7 +3,7 @@<br>
=C2=A0# See sanity.bbclass<br>
=C2=A0#<br>
=C2=A0# Expert users can confirm their sanity with &quot;touch conf/sanity.=
conf&quot;<br>
-BB_MIN_VERSION =3D &quot;2.7.3&quot;<br>
+BB_MIN_VERSION =3D &quot;2.8.13&quot;<br>
<br>
=C2=A0SANITY_ABIFILE =3D &quot;${TMPDIR}/abi_version&quot;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#223602): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/223602" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/223602</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115290739/494=
7266" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115290739/4947266</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ernstp@gmail.com" target=
=3D"_blank">ernstp@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000a3b863063f0fbaf9--

