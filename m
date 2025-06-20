Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57782C7115C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 14:13:55 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.1252.1750428828322648282
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 07:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1gw8vaM1;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a5257748e1so1294734f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 07:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1750428827; x=1751033627; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SCyRpNRWksBvs81azYwIuX6nb8Z8i1zTJvSgarnsQ84=;
        b=1gw8vaM1yE/BlTpleIn+RfMOVAr2akVJtn61Qa1JjU9Z99DDKZfD2awSQQ+Q0rxR30
         6XkjZJMwcOI1bq2eLlBJaQKDLkbOBgnnPWieePbMjSnjEdZqQQlxW6bD5XGfrr5ELE5+
         LeO3ovc//wTHIUQ481V0tRBS3G47COTQiVPzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750428827; x=1751033627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SCyRpNRWksBvs81azYwIuX6nb8Z8i1zTJvSgarnsQ84=;
        b=iFJSeto68793gwprneQloOy0G/R0weZYeFtWPPxM5oWeiKoy7bzADS7gXr3radf1cZ
         SStdm3mSHlo09IWbvLi2PBjNqVBw9R+WOGAZoZ+dPTSJrksHnUo2eMCUquscqckOk5hb
         7pTw9RHA3+cY2dLQ96kvR3YoGB5DH73UBkagujGOQmfaY+FsIF/3vmdd+ZQoHYlkMNGP
         8L1g2KrdZhnQ/wfQMU3J7Sl4lGU/rQA8qdW6tFhaL0unfBg3Kupdhj/91CO37Z44W2Sh
         zg+DosbrNYvM695fEhzk8sqyq2TBWk7CB989cCIl2d9/WRpJsBJgeIFVVWkwtd0CjujU
         Q35g==
X-Gm-Message-State: AOJu0YzqqZpQjedgOc5VvxIDKhLiNncWl0A+Xjbn2EsdTkwMvtZPfsHh
	xb8RAh+BqOoMm9SY6J8iVFgFP8zsO18paQRZvrY1OWHfXqhHRCb2eGnEdcBFGBrmTRj51UxFg8a
	LuR4/fsdljmEKe6INZcH4071GvjdlzB5IKQJACS8EMlIRrbP4HCQJUJanGA==
X-Gm-Gg: ASbGncs3Pe8QEikB28/igQsRnFKp04KUg2cBAofLWSF09B8MC9qIHyYxutqZjUX4f28
	VQ4v3omaAOlRuoP8/oQolRssz4QczCIZ94wR+lDtabDZS6erwHr8QBpxBYC5d0QfSR+NVy5UBAW
	ZgldZRwHgiKX8c1xcbVu9k+820RmBnZtHw3l0YlLi82Gj+c8fv64c+BHxQyFk3zT+cLI5AyAZSj
	/879g==
X-Google-Smtp-Source: AGHT+IHZOzLjsH6to+zCEIa9U+oNGJHb0D8lODvvpZqU+Anp+4gPLvz3y7I92wH7cSjflUyktb+tLYbAjo7Fq6l8B7k=
X-Received: by 2002:a5d:64ee:0:b0:3a3:7ba5:960e with SMTP id
 ffacd0b85a97d-3a6d132267emr2960390f8f.59.1750428826493; Fri, 20 Jun 2025
 07:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <8805c7ed-5ac7-b4a7-6c09-7194ab3cff75@crashcourse.ca>
In-Reply-To: <8805c7ed-5ac7-b4a7-6c09-7194ab3cff75@crashcourse.ca>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 20 Jun 2025 16:13:20 +0200
X-Gm-Features: Ac12FXxaASyfNi-Al60vAt03NVFedDBnlZdX7sleVkDoXX-vzE-IugJcTD8NDJg
Message-ID: <CAMSfU+6RVpws_n8nw=CNDXJ3bG4R0_Dgojbqct0M1J1ZHC+jrQ@mail.gmail.com>
Subject: Re: [OE-core] Is there an oe-core "janitors" task list for newbies?
To: rpjday@crashcourse.ca
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000687ffe06380178c4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 14:13:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219125

--000000000000687ffe06380178c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 20 juin 2025 =C3=A0 15:57, Robert P. J. Day via lists.openembedded.=
org
<rpjday=3Dcrashcourse.ca@lists.openembedded.org> a =C3=A9crit :

>
> I forget if there was a place that kept track of tasks that were
> appropriate for beginners that would let them get their names into the
> contributors' Git log by starting simple.
>

Hello,

The bug triage team tries to maintain a "newcomer" bugs list.

You can see the list:
* on the dashboard:
https://dashboard.yoctoproject.org/bugtriage/#newcomer-container
* with the proper search in bugzilla :
https://bugzilla.yoctoproject.org/buglist.cgi?list_id=3D660269&query_format=
=3Dadvanced&resolution=3D---&status_whiteboard=3DNEWCOMER&status_whiteboard=
_type=3Dallwordssubstr
(ie. the "NEWCOMER" whiteboard)



> I ask since I am reminded of something I noticed years ago -- there's
> a ton of OE packagegroup definitions where the explicit packagegroup
> name could be replaced by the simpler "${PN}". As an example:
>
>
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-extended=
/packagegroups/packagegroup-core-full-cmdline.bb
>
> where it seems almost all strings "packagegroup-core-full-cmdline"
> could be replaced by just "${PN}". If there's someone who wants to
> handle that and get into the Git history, it seems that would be a
> pretty easy way to start.
>
> rday
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219124):
> https://lists.openembedded.org/g/openembedded-core/message/219124
> Mute This Topic: https://lists.openembedded.org/mt/113742703/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000687ffe06380178c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 20=
 juin 2025 =C3=A0=C2=A015:57, Robert P. J. Day via <a href=3D"http://lists.=
openembedded.org">lists.openembedded.org</a> &lt;rpjday=3D<a href=3D"mailto=
:crashcourse.ca@lists.openembedded.org">crashcourse.ca@lists.openembedded.o=
rg</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><br>
I forget if there was a place that kept track of tasks that were<br>
appropriate for beginners that would let them get their names into the<br>
contributors&#39; Git log by starting simple.<br></blockquote><div><br></di=
v><div>Hello,</div><div><br></div><div>The bug triage team tries to maintai=
n a &quot;newcomer&quot; bugs list.</div><div><br></div><div>You can see th=
e list:</div><div>* on the dashboard:=C2=A0<a href=3D"https://dashboard.yoc=
toproject.org/bugtriage/#newcomer-container">https://dashboard.yoctoproject=
.org/bugtriage/#newcomer-container</a></div><div>* with the proper search i=
n bugzilla : <a href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?list_=
id=3D660269&amp;query_format=3Dadvanced&amp;resolution=3D---&amp;status_whi=
teboard=3DNEWCOMER&amp;status_whiteboard_type=3Dallwordssubstr">https://bug=
zilla.yoctoproject.org/buglist.cgi?list_id=3D660269&amp;query_format=3Dadva=
nced&amp;resolution=3D---&amp;status_whiteboard=3DNEWCOMER&amp;status_white=
board_type=3Dallwordssubstr</a>=C2=A0 (ie. the &quot;NEWCOMER&quot; whitebo=
ard)=C2=A0</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
I ask since I am reminded of something I noticed years ago -- there&#39;s<b=
r>
a ton of OE packagegroup definitions where the explicit packagegroup<br>
name could be replaced by the simpler &quot;${PN}&quot;. As an example:<br>
<br>
<a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/recipes=
-extended/packagegroups/packagegroup-core-full-cmdline.bb" rel=3D"noreferre=
r" target=3D"_blank">https://git.openembedded.org/openembedded-core/tree/me=
ta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb</a><br>
<br>
where it seems almost all strings &quot;packagegroup-core-full-cmdline&quot=
;<br>
could be replaced by just &quot;${PN}&quot;. If there&#39;s someone who wan=
ts to<br>
handle that and get into the Git history, it seems that would be a<br>
pretty easy way to start.<br>
<br>
rday<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#219124): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/219124" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/219124</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113742703/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113742703/4316185</a><br>
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

--000000000000687ffe06380178c4--

