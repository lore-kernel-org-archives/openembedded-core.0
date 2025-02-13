Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3821C021A4
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 21:38:24 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.5944.1739482698552694377
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 13:38:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=i4S1Qcgg;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso1608343f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 13:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739482697; x=1740087497; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hUP7bT5xMDtMRT/zKdIGtD6j64l0sfvGWkCVp88hRMY=;
        b=i4S1QcggiP369AfzJIJfI6vQcikQt5ZCHqDrXTSnIwQWUAT5xzkQKJquUML2FLboSr
         2go/UeZxV3PjwlYTZErFMLNb9LVdfHAfgo0qHDikJyVBKlx3iCl4gJfdtkjWNsnJYtKW
         5xv6J7m5g9/yEM2IqcxFi8B+LQGKDpjjnB6yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739482697; x=1740087497;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUP7bT5xMDtMRT/zKdIGtD6j64l0sfvGWkCVp88hRMY=;
        b=SPGnpLZ6OzTkq4ItTkOTumjaD1TKOmx1kZPnmgP7u3bcZp2UV4UBq2sddZu0KcqPzW
         dBUmXtVUGh6c9ONlKPYdrpj0pbIfw2A5WGeRSXyki8g6Bqixl3DxUnu104PIy1DLxKmQ
         hrvLhudugEWUbmWzC9dHAtlSXh1Qpv6QsEK/ksFXxRaDGD/wVXP1zODfXkx195rAmCzp
         UOS4KfgWw8zo/TL6T43Gy1ZTZ7BFa4nT/3fYtcaH/RuOtZrTXf6ormvfkiuZhn/CXqfA
         NAvwHe2efYNBmo61USaTaORDR/LV3RcDaaSeLRwY8q3ZA9uQm9Tr0hDXBQQ3z9ZBu4ON
         1cJg==
X-Forwarded-Encrypted: i=1; AJvYcCUEId3WnfIcvXLnZTTps1lueaiOlcmOOCzC8CHJyKtDhmEuwP4aHx3bNkcNfoXev0PL5nZm22yx3IohJMcLaPCabw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyjx5FhecqZnFQ6m6HvFqmNn0fBLc0VyLWEGF8aPkdert33bVig
	i1QvixDD2KGz4z4bPzYWc/N8qwKQPk9pgHT4d3gcpJfAjo/IA8JhGq+lx9vC23KCTpKU9TW/Qiu
	8bMNCxpbMFxSEYFcTzYPC7Of7pOjIN/UrUTWGYw==
X-Gm-Gg: ASbGncsMkM/NiCvO7xjbzYg5rAsn2eUeoiO2YmE+DzgTGxgOp79XS6ensoDhPrdjV2K
	SSw1CMa2Co5XXfGUpXCpBO0wCj+sNLf9ii2hcpQRF04q7xWUKVpMLOEXv1Me0AAKkXmj0Z5s4
X-Google-Smtp-Source: AGHT+IHTfIu+5IOLNvns3yYgG7noacEjXfF6VeJB7sLW4dUrJOECvTqGHeo3FbZlnbHZhZM5XAFMBpp9acy84xn9pSY=
X-Received: by 2002:a5d:6f19:0:b0:386:374b:e8bc with SMTP id
 ffacd0b85a97d-38f24d10851mr5167444f8f.15.1739482696754; Thu, 13 Feb 2025
 13:38:16 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb9Fr9MFy5uub2_pTRWmVbt96OWBJ5ty+eAB9Qn+LYa_Wg@mail.gmail.com>
 <CANNYZj-PbWQDa5hAc5X6sqHVMvJ0QE01XXwytya8rprwvSsqag@mail.gmail.com>
 <d22a4cec5e317e62f1f44d8d9a810cf4745ccb48.camel@linuxfoundation.org> <Z65ER5YO6Ci2MAK0@ravine.members.linode.com>
In-Reply-To: <Z65ER5YO6Ci2MAK0@ravine.members.linode.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 13 Feb 2025 22:37:49 +0100
X-Gm-Features: AWEUYZmUVxHnMzHryN-TC7OhC3_VExi-MpLKl4psWs5s4FiqE3AU_l4LTwHjcEQ
Message-ID: <CAMSfU+5JA443jn_AQtGVNrV1mRZfVG5_x+0=Pi+ikFYNxUBh9Q@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status 11 Feb. 2025 (WW07)
To: jsbronder@cold-front.org
Cc: richard.purdie@linuxfoundation.org, alex.kanavin@gmail.com, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000003bbee3062e0ce071"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 21:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211370

--0000000000003bbee3062e0ce071
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 13 f=C3=A9vr. 2025 =C3=A0 20:13, Justin Bronder via lists.openembed=
ded.org
<jsbronder=3Dcold-front.org@lists.openembedded.org> a =C3=A9crit :

> On 11/02/25 23:36 +0000, Richard Purdie via lists.openembedded.org wrote:
> > You used to be able to disable pull requests for six month periods, it
> > looks like you can no longer do that and it was a pain having to try
> > and remember anyway.
>
> Isn't this just 'Settings -> Moderation Options -> Interaction Limits'?
> It looks like you can restrict it to repository collaborators (which is a
> list under the repo owner's control) to 6 months.
>

It is! Thanks!
When creating a PR, users get a message "An owner of this repository has
limited the ability to open a pull request to users that are collaborators
on this repository."
Opening an Issue results in an "Unable to create issue." error (not nice).
and it is done on a repo basis.

I agree, this could be a sensible solution.

It's also exposed on the REST API,
> https://docs.github.com/en/rest/interactions/repos?apiVersion=3D2022-11-2=
8#set-interaction-restrictions-for-a-repository,
> which if you're willing to pull down the official github cli tool, gh,
> could go into a cron job fairly easily:
>
> gh api -X PUT \
>     /repos/openembedded/openembedded-core/interaction-limits \
>     -f 'limit=3Dcollaborators_only' \
>     -f 'expiry=3Dsix_months'
>
> I obviously couldn't test in the OpenEmbedded Org, but this worked both o=
n
> my personal repos and in a private (paid) organization.
>
--=20
> Justin Bronder
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211364):
> https://lists.openembedded.org/g/openembedded-core/message/211364
> Mute This Topic: https://lists.openembedded.org/mt/111124663/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--0000000000003bbee3062e0ce071
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 13=
 f=C3=A9vr. 2025 =C3=A0=C2=A020:13, Justin Bronder via <a href=3D"http://li=
sts.openembedded.org">lists.openembedded.org</a> &lt;jsbronder=3D<a href=3D=
"mailto:cold-front.org@lists.openembedded.org">cold-front.org@lists.openemb=
edded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On 11/02/25 23:36 +0000, Richard Purdie via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a> wrote:<br>
&gt; You used to be able to disable pull requests for six month periods, it=
<br>
&gt; looks like you can no longer do that and it was a pain having to try<b=
r>
&gt; and remember anyway.<br>
<br>
Isn&#39;t this just &#39;Settings -&gt; Moderation Options -&gt; Interactio=
n Limits&#39;?=C2=A0 It looks like you can restrict it to repository collab=
orators (which is a list under the repo owner&#39;s control) to 6 months.<b=
r></blockquote><div><br></div><div>It is! Thanks!</div><div>When creating a=
 PR, users get a message &quot;An owner of this repository has limited the =
ability to open a pull request to users that are collaborators on this repo=
sitory.&quot;</div><div>Opening an Issue results in an &quot;<span class=3D=
"gmail-Toast-content">Unable to create issue.&quot; </span>error (not nice)=
.</div><div>and it is done on a repo basis.</div><div><br></div><div><div>I=
 agree, this could be a sensible solution.</div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
It&#39;s also exposed on the REST API, <a href=3D"https://docs.github.com/e=
n/rest/interactions/repos?apiVersion=3D2022-11-28#set-interaction-restricti=
ons-for-a-repository" rel=3D"noreferrer" target=3D"_blank">https://docs.git=
hub.com/en/rest/interactions/repos?apiVersion=3D2022-11-28#set-interaction-=
restrictions-for-a-repository</a>, which if you&#39;re willing to pull down=
 the official github cli tool, gh, could go into a cron job fairly easily:<=
br>
<br>
gh api -X PUT \<br>
=C2=A0 =C2=A0 /repos/openembedded/openembedded-core/interaction-limits \<br=
>
=C2=A0 =C2=A0 -f &#39;limit=3Dcollaborators_only&#39; \<br>
=C2=A0 =C2=A0 -f &#39;expiry=3Dsix_months&#39;<br>
<br>
I obviously couldn&#39;t test in the OpenEmbedded Org, but this worked both=
 on my personal repos and in a private (paid) organization. <br></blockquot=
e><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
Justin Bronder<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#211364): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/211364" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/211364</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111124663/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111124663/4316185</a><br>
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
t face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></div><=
/div></div>

--0000000000003bbee3062e0ce071--

