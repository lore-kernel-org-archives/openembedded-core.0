Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72735CD4F26
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 11:47:00 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40723.1781869619254253234
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 04:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eggKfAPH;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-491b390f9e9so17869455e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 04:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781869617; cv=none;
        d=google.com; s=arc-20240605;
        b=Yyu3etCTLTfcrvsqNTcym+W4YhoNSv1a19yzdnKnMPP0/HimqpAhnfEepg5/HgKqL2
         kVpCJm/lrVyTWeCQ0jbwq6DzWJW7yXwsg6AjhF4X1TB4OVB6y752nW6O6QCil2BkQZ0W
         EhTy7PDT0tZCVu3+v5gWvII+pnUv7tg0q+X+VUgl4nWagd/BWvPAW++Bb48byfdHxfFl
         swoYkxyBdgTEA4gJmzBtCPZWINXWrRCdDabFio8lZrKlt5KQK759hSOxb07AUp84imqd
         1jPXze7VCx05w6adyt8meecnvJU+32U+MNQusc9ntEIcwedN+M/OJtCELvvp7PVKKUF4
         IpGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R49bL32HKxIMbtfhhoB2QzHBjXLhDyO0dkxTzqCP3bw=;
        fh=7x4t8OARA91lI5Man9nJASx7ps3qoHGzU24nsmANEX8=;
        b=bBL1psG1ya+2ae4YX8yeP1W1lqo17NABhUyvU9xow5FJc6hUNNMbom3gAVp3mBKzDe
         76nisR39yrg7CWXldSdOGV1kM7M0NjJheXL2fiLIgBqi9fwTMnLZ5m76+6WjtbGaAChs
         nPdv12lgURYlpreJ5TO67wPLAnh7K0wLLWoHijbZLX4dbgHVVAELs4fQjmK6P5UX86JB
         /iTtpw0gCrG4PEQCmvwy/Ag4RJRg0cEqD+9ndC+zKu/2f3HKqQxsefKgB79Gd6qEMUxt
         Jq/AEGPztiQU6snw9UtAmxZfW0IzuHkxHVG2x1TW/DcNDbs4AWpvkLS3EuxXLKhSksae
         YZNg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781869617; x=1782474417; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R49bL32HKxIMbtfhhoB2QzHBjXLhDyO0dkxTzqCP3bw=;
        b=eggKfAPHvD4q9TbAs6YPHQH7BVqfef4IlGy+eTtM797lw9LvU4gQ0IKhHWKh2YT0V8
         qlW1j2w/EEK9YGd1P106kNF2Kxtugh/JtEzK+sk/mTbAeywkOq8hTuG1Qr+k0I+eySLz
         8hCF8OoEplbW6Yyn3qHXyC+I29ypLHak2L7P8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781869617; x=1782474417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R49bL32HKxIMbtfhhoB2QzHBjXLhDyO0dkxTzqCP3bw=;
        b=Ur0q2WxpiLPNovA0tfbR/1JtxmFbE5ooK2qXeK0oPvUVPjMSMIvksq6yrc8+nIK2Mf
         xeIwlXbsG+8IB5/MbnsvzShxUp+uCTKn+zT87Bg97F84zC+O/aB0zjaqnuq2KdQfJXCk
         J5DuZ6GSTtyzPRqXaMge80lBas/0NV11KVYbk1Z8vgvqPLlWARoYjZhJ/OU6XgvRMqDf
         7b8DPRfstCWcVt3wY0E/6KaJUX2LBO1NeU+LrJSRw23nl1VUo8GfFPzLq4eR8BQHL86d
         mP5CcjMc+ebjbgDd+YWkUPv+Gxnr6ATCzmn7ruc7VKx1xATjzxxSRavQ6lmfXhNmwzjP
         AueQ==
X-Gm-Message-State: AOJu0Yw/Jhj3jjboAKGiZKpdmGBPI6W5f79ex7evpHmaIebFFfgqjQv9
	D1CK2B7BGRgTq5qKj0fwbAWUY8X635Jd2ZKi+cpfKsGjx/PdsTNOZTkYiuoBI5VXr60cVYlEzXZ
	LCrBnwFEtS4EagHaPfBB42LlZYSFCx665a75uIWwS5g==
X-Gm-Gg: AfdE7ckv26Ey8SUqQo0gplm+o/8zvVQ+hfjLQhxdnQwBTSuXeGdfAoXeLTRFGvq3Bnh
	jc1SSKRK2BOgyQMe294ckL5gQEi6WgHprQnEaqvSOiUIVFYw3TGvUwZcLUCJXSfzdeDI8ffaKV+
	UFTFI+jfi1qHl7DvPOtlWW+lToCP0MOCaidK2eKAALhOuTJCKddqK8dd7P8j3Roe4y+nBb44RyG
	R3V5Ann68ijhqzFqVWtIBNhuByZpdbfezpQ6nD0oEYlj93Jdkgbpkbfxyb/sbknPQ4thPnipVZm
	TKPR4u4mxrTc3jz/+Hb6fbD46WaY3ZFWT2WdJ0w4
X-Received: by 2002:a05:600c:8010:b0:490:e170:b80b with SMTP id
 5b1f17b1804b1-49240e7a4bfmr50865805e9.32.1781869616391; Fri, 19 Jun 2026
 04:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260616165623.3049563-1-peter.marko@siemens.com>
 <197246.1781691245370176580@lists.openembedded.org> <AS8PR10MB507301A14BCF0FE4BE7DC044FDE42@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
 <211612.1781866151739911624@lists.openembedded.org>
In-Reply-To: <211612.1781866151739911624@lists.openembedded.org>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 19 Jun 2026 13:46:29 +0200
X-Gm-Features: AVVi8Cdj2d7-WfmmbG5i_Hk8c2m8Xqc6gkiLBExYTikNIYxbChxuvUhWWMdcDAk
Message-ID: <CAMSfU+6Qub2T2+2jafz7d28iMXwRBmiB_6V2AzTc8xw_bXDeqw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] openssl: upgrade 3.5.6 -> 3.5.7
To: ashishkumar.mishra@bmwtechworks.in
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008586ac065499d95d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 11:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239167

--0000000000008586ac065499d95d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 19 juin 2026 =C3=A0 12:49, AshishKumar Mishra via lists.openembedde=
d.org
<ashishkumar.mishra=3Dbmwtechworks.in@lists.openembedded.org> a =C3=A9crit =
:

> Hi Team,
>
> Since openssl is a critical package , request you to please take this in
> master branch
> This will fix few high score CVE
>

Hello,

This is already on master :
https://git.openembedded.org/openembedded-core/commit/?id=3D9365ac47f994a7d=
6be92b8c011c51ecf48e8ef87

Also, this is part of the latest wyrnose PR, it will merge shortly.

For scarthgap, it will be part of the next review cycle (planned next week)

Regards,


>
>

> Thanks ,
> Ashish
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239159):
> https://lists.openembedded.org/g/openembedded-core/message/239159
> Mute This Topic: https://lists.openembedded.org/mt/119836905/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000008586ac065499d95d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 19=
 juin 2026 =C3=A0=C2=A012:49, AshishKumar Mishra via <a href=3D"http://list=
s.openembedded.org">lists.openembedded.org</a> &lt;ashishkumar.mishra=3D<a =
href=3D"mailto:bmwtechworks.in@lists.openembedded.org">bmwtechworks.in@list=
s.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div>Hi Team,=C2=A0<br><br>Since openssl i=
s a critical package , request you to please take this in master branch=C2=
=A0<br>This will fix few high score CVE</div></blockquote><div><br></div><d=
iv>Hello,</div><div><br></div><div>This is already on master :=C2=A0<a href=
=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D9365ac47f99=
4a7d6be92b8c011c51ecf48e8ef87">https://git.openembedded.org/openembedded-co=
re/commit/?id=3D9365ac47f994a7d6be92b8c011c51ecf48e8ef87</a></div><div><br>=
</div><div>Also, this is part of the latest wyrnose=C2=A0PR, it will merge =
shortly.</div><div><br></div><div>For scarthgap, it will be part of the nex=
t review cycle (planned next week)</div><div><br></div><div>Regards,</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>=C2=
=A0</div></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<div>=C2=A0</div>
<div>Thanks ,<br>Ashish</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#239159): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/239159" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/239159</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119836905/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119836905/4316185</a><br>
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

--0000000000008586ac065499d95d--

