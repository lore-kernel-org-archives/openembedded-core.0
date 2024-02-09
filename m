Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18219C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 11:12:36 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.9120.1707477154481378708
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 03:12:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TrRhSazv;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41061f068cdso5101605e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 03:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707477153; x=1708081953; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RxreaRhAEUtxyK1ZKjn2D+7LDXLgFTsDJBoA6uavTm8=;
        b=TrRhSazvEOpDYtaiYpaZw8qT+UbYkdyfmF8rE+PYA3h3pH/ekxknjSVliz8aVinXJe
         SM9HTWlJe8xSUS4NutAZPttOmNkybRBSN/3DCG1fvhem+xL8/gjTPfyeG4TW/IqFLbpS
         DGwB+UXWXh8hsPnvE2Z6OQ7jzmpLuaiWHXD1SZSohIAgo5wYobAd5HMdJEuAWoM20YH/
         i8tiWVNDtKIMbIANVUXFn/brlmSWsLO9ysYPV3hIPsOqhSI37OLL6rzXYnY70iS6RCqR
         DA2cqiMaYPMORz6hb7kmk3+XD1NjAbGtw8iSwsU7LeQvGi+RNJbi+glOyoFdAUHcQ4t/
         mM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707477153; x=1708081953;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RxreaRhAEUtxyK1ZKjn2D+7LDXLgFTsDJBoA6uavTm8=;
        b=N1NHFeSDZta4KzzgWB7JNcEB2s9O1a/XsaOb6NIaG0HZUBEGOK8WxcKT5SWfqgyZvL
         TjqWGplujDlsgyauCLtLUVF0r/K/YmWqIUjFsGe1hQHKglFxE7JIEnUkdQ4IGX56Vj3H
         J3I7PNsS9WGz/hfOCGa69CzILuzRVbQNIlippYJ7r3MF9ZPBkMF09GfGVyLVNL+5la/h
         8VRLsJZomEti7R4HBVBL0Sih3e0dR5qtt4E819aSln/K4IsF1/tQse5pkzks6I1W0u24
         4DwVk8ouMYiG9kpaZ4dH0tLMYawihltT+JK6gIJ6ATDAvAY6xmHQvZyDUr9KhVV8ywxM
         WUCw==
X-Gm-Message-State: AOJu0Yx9QOGm4ro07NIqtFzljcUF9nFFkRs5iGzUzoKsbmJdjgz5Bcm4
	5zZrkrZEkXUL1EW+EL9E4nIK0TsskXDFx7x6glyafSY5qKuKMv28LkKVFpdecadU0OvlsN0Hzmn
	S+KzD9hI5v7m93rQrQEZLEtcMNXk=
X-Google-Smtp-Source: AGHT+IGJe0h4/DWkNOa3YNOCCGqzlShlbOXlz6lDONNWS5uJh12LWNGFrQli/PrKL+HQbNDBFvjkh3H4tqX1iBC95bg=
X-Received: by 2002:a05:600c:5387:b0:40f:c1fc:e5b6 with SMTP id
 hg7-20020a05600c538700b0040fc1fce5b6mr979423wmb.38.1707477152696; Fri, 09 Feb
 2024 03:12:32 -0800 (PST)
MIME-Version: 1.0
References: <13917.1707390777082340913@lists.openembedded.org> <3891.1707476985725014543@lists.openembedded.org>
In-Reply-To: <3891.1707476985725014543@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 9 Feb 2024 12:12:16 +0100
Message-ID: <CA+chaQddzpzuTUv39y+WHrmun4K4ZSRpdmf9POJJYjqU331xeQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH v2] shadow: backport patch to fix CVE-2023-29383
To: Pawan Badganchi <badganchipv@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000260c110610f10120"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 11:12:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195197

--000000000000260c110610f10120
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

according to https://bugs.archlinux.org/task/69933
SYSLOG_SU_ENAB not supported when pam is enabled

Maybe you need to adjust:
oe-core/meta/recipes-extended/shadow/files/login.defs_shadow-sysroot:SYSLOG=
_SU_ENAB
            yes
?

On Fri, Feb 9, 2024 at 12:09=E2=80=AFPM Pawan Badganchi <badganchipv@gmail.=
com>
wrote:

> Hi,
> The issue does not seems to fix, getting below warning. Could you please
> check.
>
> We are using this shadow library in our application.
> When we compile our application we get below warning in
> log.do_prepare_recipe_sysroot
>
> "configuration error - unknown item 'SYSLOG_SU_ENAB' (notify
> administrator)"
> "configuration error - unknown item 'SYSLOG_SG_ENAB' (notify
> administrator)"
>
> above warning is observed though below CVE is already available in our
> code kirkstone branch.
>
> CVE-2023-29383 <https://github.com/advisories/GHSA-p9w4-8hh8-crcx>.patch
> 0001-Overhaul-valid_field.patch.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195196):
> https://lists.openembedded.org/g/openembedded-core/message/195196
> Mute This Topic: https://lists.openembedded.org/mt/98361235/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000260c110610f10120
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">according to <a href=3D"https://bugs.archlinux.org/task/69=
933">https://bugs.archlinux.org/task/69933</a><br>SYSLOG_SU_ENAB not suppor=
ted when pam is enabled<br><div><br></div><div>Maybe you need to adjust:</d=
iv><div>oe-core/meta/recipes-extended/shadow/files/login.defs_shadow-sysroo=
t:SYSLOG_SU_ENAB =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yes<br></div><di=
v>?</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Fri, Feb 9, 2024 at 12:09=E2=80=AFPM Pawan Badganchi &lt;<a hre=
f=3D"mailto:badganchipv@gmail.com">badganchipv@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>The issue do=
es not seems to fix, getting below warning. Could you please check.<br><br>
<p dir=3D"auto" style=3D"margin-bottom:16px;color:rgb(31,35,40);font-family=
:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Noto Sans&quot=
;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI E=
moji&quot;">We are using this shadow library in our application.<br>When we=
 compile our application we get below warning in log.do_prepare_recipe_sysr=
oot</p>
<p dir=3D"auto" style=3D"margin-bottom:16px;color:rgb(31,35,40);font-family=
:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Noto Sans&quot=
;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI E=
moji&quot;">&quot;configuration error - unknown item &#39;SYSLOG_SU_ENAB&#3=
9; (notify administrator)&quot;<br>&quot;configuration error - unknown item=
 &#39;SYSLOG_SG_ENAB&#39; (notify administrator)&quot;</p>
<p dir=3D"auto" style=3D"margin-bottom:16px;color:rgb(31,35,40);font-family=
:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Noto Sans&quot=
;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI E=
moji&quot;">above warning is observed though below CVE is already available=
 in our code kirkstone branch.</p>
<p dir=3D"auto" style=3D"color:rgb(31,35,40);font-family:-apple-system,Blin=
kMacSystemFont,&quot;Segoe UI&quot;,&quot;Noto Sans&quot;,Helvetica,Arial,s=
ans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;margin-b=
ottom:0px"><a style=3D"text-decoration-line:underline" title=3D"CVE-2023-29=
383" href=3D"https://github.com/advisories/GHSA-p9w4-8hh8-crcx" target=3D"_=
blank">CVE-2023-29383</a>.patch<br>0001-Overhaul-valid_field.patch.</p>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#195196): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/195196" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/195196</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98361235/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98361235/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000260c110610f10120--

