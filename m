Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E06CCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 17:43:59 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.11111.1761759837471020673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 10:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uoriSGpF;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4298a028de6so899126f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 10:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1761759836; x=1762364636; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2kor0CoVBHCWCckd5mdUFqoPGvHAFyZTJ170qfPwqCM=;
        b=uoriSGpFEAml+DnFIwfa9v0l+QgKwCV3z1xEiEp/mwpkBjcBxjfN9uqn15FGlz1a7y
         YrQ2HWPShDcq7A9PVX3x20t6OYcDwfDYFKNbSoeJD8FoRTdUearLaL89y/nR6cxVhsOd
         jamRFcKjzFv/1Notg0vsPJ3me7hMsk12HINdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761759836; x=1762364636;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2kor0CoVBHCWCckd5mdUFqoPGvHAFyZTJ170qfPwqCM=;
        b=SsyHh2R4wZggLrJjhwyhx53vj//0uWvqIFXn6j6ynNsbDtX52ly0G/B21ePsYJC9vs
         SwZRC35fSTGJZkD3mumlqvhS/P3NTR3+F3ml8tNdcYL3r6UH30GUmYigG5GmuldSdcqi
         jr0men6MvGv3WonnDAHgcvd1WSCw8eNf67fGiCWYCZRLzbhelAecq4AdI60ONMRSrdGD
         /rzHbqzOhdMwRxr31Nw4MDA/8kvQpXuhIZHMtczvbhpz8DDcpBQE0Nh82BwntPqZxCBY
         R1lavhP83Q2/GUO5nC6QD7r6BaDnx40ObKxq0Sox4yIwdAUQWc7z+vScs9rg6wPpxSgv
         1WrA==
X-Gm-Message-State: AOJu0YxDWIHCoqF0qSM7ic7B2eXAmGZf3/Fq8/QC9AjiVFew+3H3EmYK
	g0qcldrZ7hHaMMrY3ZUabbwZv5gOcUoOggkQ+ba3klBjV3AH4Gojrf3h8qAKJxppKCCLrU8uUBo
	+dWCv2sC4Fqe3ng8gzt1fV9URFnF0LO5gHvhfp+A0AQ==
X-Gm-Gg: ASbGncuGVqrzvvWy3QIQQIhmWHZupGs+cCPRLpeaeCvJpH/5sGJ59u7qKmQCab+K2zT
	la9HCLdSwT7CJcx8Aoa5hszaM3NhVI8pRnFCuywumkIKBoTeDtNqz48kcD9sa/Gsv63YV7OBS1c
	593GGTSZeMFYN+33dCVHB9MlBm5f3uOMzuK1UuP0j5bao7DJe93T2SCrAB6g+Q2IR5vRJQe3eUj
	OCmY4xsWb18A+2QeSz8JCca8UuH+QPvL0FV7pkNqiq9M8SV/4Ap7dTVC12Miw64ihPHCZzF
X-Google-Smtp-Source: AGHT+IGOL7rPB4Ymn9FA62fx//ZMMg/2JmaEKXohMocc1avDue2aGC6XSBHg6Y/Tdp5RomeEib5ixDqSUrzwnz/qcm0=
X-Received: by 2002:a05:6000:4713:b0:403:8633:b7e3 with SMTP id
 ffacd0b85a97d-429b4c543dcmr473123f8f.30.1761759835830; Wed, 29 Oct 2025
 10:43:55 -0700 (PDT)
MIME-Version: 1.0
References: <20251029120835.4075555-1-alex.kanavin@gmail.com> <20251029120835.4075555-4-alex.kanavin@gmail.com>
In-Reply-To: <20251029120835.4075555-4-alex.kanavin@gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 29 Oct 2025 17:43:39 +0000
X-Gm-Features: AWmQ_blx2WMdHklNd2p-mNFg1RMmMqfjjL0_a6Qq59bjMvVAtHuPSflD03lo3hc
Message-ID: <CAMSfU+5bU=aZJiFR9JTsYj+gs2JagpxbTJqjrMSAsQQXQXu2ig@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/6] fragments: add a 'root-login-without-password'
 fragment
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="00000000000031cc2906424fadaf"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 17:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225462

--00000000000031cc2906424fadaf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,


Le mer. 29 oct. 2025 =C3=A0 12:09, Alexander Kanavin via lists.openembedded=
.org
<alex.kanavin=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> From: Alexander Kanavin <alex@linutronix.de>
>
> Please see this for background/some discussion:
> https://lists.openembedded.org/g/openembedded-architecture/topic/11591354=
5
>
> Care should be taken to not enable this by default, and especially not fo=
r
> production images. Poky and oe-core default templates did it, and it was
> not a good starting point. Hopefully the fragment name, and the descripti=
on
> that users will see when enabling the fragment will provide enough warnin=
g.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../fragments/yocto/root-login-without-password.conf   | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644
> meta/conf/fragments/yocto/root-login-without-password.conf
>
> diff --git a/meta/conf/fragments/yocto/root-login-without-password.conf
> b/meta/conf/fragments/yocto/root-login-without-password.conf
> new file mode 100644
> index 00000000000..e3857fc44b4
> --- /dev/null
> +++ b/meta/conf/fragments/yocto/root-login-without-password.conf
> @@ -0,0 +1,10 @@
> +BB_CONF_FRAGMENT_SUMMARY =3D "Log in as root without password on serial
> console and over ssh (use with caution)."
> +BB_CONF_FRAGMENT_DESCRIPTION =3D "By default images are built such that
> root login is disabled \
> +(which is the preferred, secure default). However, for testing and
> development purposes it can \
> +be beneficial to be able to log in as root, both on serial console and
> over ssh connections, \
> +which is what this fragment enables. Use with great cauion, and ideally
> only in tightly \

Small typo au "caution" here


+controlled local builds and CI testing environments, and never in
> artefacts that are deployed \
> +into products. \
> +"
> +
> +EXTRA_IMAGE_FEATURES +=3D "allow-empty-password empty-root-password
> allow-root-login"
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225452):
> https://lists.openembedded.org/g/openembedded-core/message/225452
> Mute This Topic: https://lists.openembedded.org/mt/116010925/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000031cc2906424fadaf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br>Hello,<br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr"><br></div><div dir=3D"=
ltr" class=3D"gmail_attr"><br></div><div dir=3D"ltr" class=3D"gmail_attr">L=
e mer. 29 oct. 2025 =C3=A0 12:09, Alexander Kanavin via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;alex.kanavin=3D<a hre=
f=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.=
org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutron=
ix.de" target=3D"_blank" rel=3D"noreferrer">alex@linutronix.de</a>&gt;<br>
<br>
Please see this for background/some discussion:<br>
<a href=3D"https://lists.openembedded.org/g/openembedded-architecture/topic=
/115913545" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-architecture/topic/115913545</a><br>
<br>
Care should be taken to not enable this by default, and especially not for<=
br>
production images. Poky and oe-core default templates did it, and it was<br=
>
not a good starting point. Hopefully the fragment name, and the description=
<br>
that users will see when enabling the fragment will provide enough warning.=
<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank" rel=3D"noreferrer">alex@linutronix.de</a>&gt;<br>
---<br>
=C2=A0.../fragments/yocto/root-login-without-password.conf=C2=A0 =C2=A0| 10=
 ++++++++++<br>
=C2=A01 file changed, 10 insertions(+)<br>
=C2=A0create mode 100644 meta/conf/fragments/yocto/root-login-without-passw=
ord.conf<br>
<br>
diff --git a/meta/conf/fragments/yocto/root-login-without-password.conf b/m=
eta/conf/fragments/yocto/root-login-without-password.conf<br>
new file mode 100644<br>
index 00000000000..e3857fc44b4<br>
--- /dev/null<br>
+++ b/meta/conf/fragments/yocto/root-login-without-password.conf<br>
@@ -0,0 +1,10 @@<br>
+BB_CONF_FRAGMENT_SUMMARY =3D &quot;Log in as root without password on seri=
al console and over ssh (use with caution).&quot;<br>
+BB_CONF_FRAGMENT_DESCRIPTION =3D &quot;By default images are built such th=
at root login is disabled \<br>
+(which is the preferred, secure default). However, for testing and develop=
ment purposes it can \<br>
+be beneficial to be able to log in as root, both on serial console and ove=
r ssh connections, \<br>
+which is what this fragment enables. Use with great cauion, and ideally on=
ly in tightly \</blockquote></div></div><div dir=3D"auto">Small typo au &qu=
ot;caution&quot; here</div><div dir=3D"auto"><br></div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+controlled local builds and CI testing environments, and never in artefact=
s that are deployed \<br>
+into products. \<br>
+&quot;<br>
+<br>
+EXTRA_IMAGE_FEATURES +=3D &quot;allow-empty-password empty-root-password a=
llow-root-login&quot;<br>
-- <br>
2.39.5<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#225452): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/225452" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/225452</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116010925/431=
6185" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/116010925/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@sm=
ile.fr" target=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--00000000000031cc2906424fadaf--

