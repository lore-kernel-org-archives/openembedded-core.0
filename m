Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFACBC44514
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 09:31:16 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9988.1784280674355124616
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 02:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Uv5d/hG7;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493f75f7172so56972605e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 02:31:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784280673; cv=none;
        d=google.com; s=arc-20260327;
        b=Ha0O42FxOU27NiMcteBzT9W1k8VLBnDSXE26nFd82Tmm1VDhRURaWGixZkz2XyiwXB
         tECLn6AIaHRLMHisLSzKyQ09eqDofXHyfsqOaXJlD8LMjUG1wnFtFghokBqKWsh1goq7
         +nZMKZggroOdBMwCP0ve5kRWWLBg1/dXQOLFWwqrMCBpA/PkGvKEXYVH9N9P8jrm0Ubc
         eXbfAVMcAmcDZh5fQtu9QBnpX/R75JW8Lh06N6Qglyc2lt35IkjXZKlw/t02OHIVtSJt
         21lhLJRU6iRvWN55wWS6FYsYtvKJnQZUJajFbmc2RTGmWlbnvyNVQZlFaoTTtgaEMMn4
         HZ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pYGtB1Asj5RVJHErty+HSZHQi+nxbwoygCgh8AK7xvs=;
        fh=6Z4xUuTqkcxNv6cvnn0HdSGcZYvnhz2BRm++iEwx924=;
        b=FBVxeqnJpSX9DkejP80jazydPIDTcMixyOR0EvCrbY14RjKLO8TlkzWeNZR2idrz4K
         m1a0SbfNVDnhNAbhaviuUQ6Z48cEJpGqnKWsQmuEQjY7xegBIdl1OFrz8ubJpaRxSuJH
         UWMm/xoJ6Bh+EF6PI8NVhvGOUjAJOZFM8A2OJ2nXU2ODux790S4NTHtdnKKqSDqBuiWt
         zMSoMlN2x1AAvPZxxA3vPljzGMyxyiCrNJRxmQSqLo+RO/nvclkP74wC0haMehZTmOdB
         tN0c+DRiJYJy8mzH0JqNw6NzwirFl36xtlLlsPWh07McTzXIadt5GqJ1svt8mPnq0zMQ
         1OxQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784280673; x=1784885473; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pYGtB1Asj5RVJHErty+HSZHQi+nxbwoygCgh8AK7xvs=;
        b=Uv5d/hG7uKFBQ7TZ0LozOiaLYRxfSlKpNLMirQM6bQMDVxhuc+/TbnhKaVXdOtdFMG
         Cd/+dAXWYiHOphbsmSO5WAXQIW13osB3Biw0PV3n1Yr9CxySW5zlaP/5bta0fD20oxqk
         3gWYLH96Ydtm3sCQiWQGBWMXYg03oxZFJikfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784280673; x=1784885473;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pYGtB1Asj5RVJHErty+HSZHQi+nxbwoygCgh8AK7xvs=;
        b=NkgOqnhPfksB6Hrw8oL6sD3Y/HbQiRC+Rm8kW6heD8YcvVetC+eci+IQJR8qh7LZ+5
         WKtVJpoNCpMOyGsYyfvRhv8U9GTBMBqlCBMrgBCWe+auPvm1EbJ7ypgXHq2Ter/bTCB5
         ocHi1TkdVyNQw5ceZlfsknEm0GJpKkv0MoxgrrE/On9soxJ/fy6Me5pL4ZrD8XP89hkc
         JnontOzyMO0lSaiV+/2tyGbFkjGHHdGgOcWhULTJ8oYNvuGVxc+0zYph72sPJSWXFjrw
         p7kgIh/9bjg4zPTBRIH1t+d5ACwN1w43oJoNynRQvYIMNHwAEFS5IcK+7aMEhyHRysr8
         Aa0w==
X-Gm-Message-State: AOJu0YxMyu8j74DYAoQUsjMPhyMIY33YPJ+tAjbp8Ao8+Js6NJbWsshQ
	YZN6BShQQzI9iJQ0U2bEhAZrMH3TTieSGNR1PwRkIcPTHpUMVygTnFyxNu9tRaF0oR+uhwuBBGY
	FiVkxOrkiD6RD29OFlD9NFgTzGxLaSfPIJv6lRM40Og==
X-Gm-Gg: AfdE7cnNia0Dx6pDk5IpR9ngp+GUmwj8msekpjHfggR2wBac9SiOaEz6WdvZKsCoPOx
	TmGX+qN7jczNmPM9Ezog93Yl9BP9UdgILuZpw6PD+Q822ZXxzO3tTOVAMzSzxh5OP8TcTRaVmg4
	Vjg1iKUY6bDpcuZAM2Iiy8iiEuLLSXEvKGvgiG0gCtWnHiPu42EcFoiXItH4wwi4N3Z9xj4sYfJ
	VWgnv5K+VrYumjZP3CQYeu60YGtGH0IyWbo8LRJf0TlhUCTogeEODJkvI6LShdpuCh+d9FtM31V
	mZ/Ljg==
X-Received: by 2002:a05:600c:4693:b0:495:3f26:97fb with SMTP id
 5b1f17b1804b1-4954a3e20edmr20066525e9.3.1784280672360; Fri, 17 Jul 2026
 02:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260707143421.34255-3-jaipaul.cheernam@est.tech>
 <20260708185458.91632-1-jaipaul.cheernam@est.tech> <758471.1784279566343850234@lists.openembedded.org>
In-Reply-To: <758471.1784279566343850234@lists.openembedded.org>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 17 Jul 2026 11:30:46 +0200
X-Gm-Features: AUfX_mx0yHI6gNf35cOK36owfw3mVQh4jDeyiD7vw75dcc-xVk70rI1iRXMPuBs
Message-ID: <CAMSfU+5rCCZsOOf7S8FzUgknkUeENaB9uHY=eKX=bPL=kO6KLQ@mail.gmail.com>
Subject: Re: [OE-core] [wrynose][PATCH v2] gzip: fix CVE-2026-41992
To: jaipaul.cheernam@est.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a7ff650656cb37a9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 09:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241158

--000000000000a7ff650656cb37a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 17 juil. 2026 =C3=A0 11:12, Jaipaul Cheernam via lists.openembedded=
.org
<jaipaul.cheernam=3Dest.tech@lists.openembedded.org> a =C3=A9crit :

> Hi Yoann,
>
> Master commit has been merged and wrynose commit marked as Awaiting
> upstream, Please check and let me know if I need to send another patch.
>

Noted, thanks for the ping.
I've put both scarhgap/wrynose patches in the review lists.

Regards,


> Regards,
> Jaipaul
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#241156):
> https://lists.openembedded.org/g/openembedded-core/message/241156
> Mute This Topic: https://lists.openembedded.org/mt/120178637/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000a7ff650656cb37a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0ven. 17 juil. 2026 =C3=A0=C2=A011=
:12, Jaipaul Cheernam via <a href=3D"http://lists.openembedded.org">lists.o=
penembedded.org</a> &lt;jaipaul.cheernam=3D<a href=3D"mailto:est.tech@lists=
.openembedded.org">est.tech@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=
=A0:</div><div class=3D"gmail_quote gmail_quote_container"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div>Hi Yoann,=C2=A0</div>
<div>=C2=A0</div>
<div>Master commit has been merged and wrynose commit marked as Awaiting up=
stream, Please check and let me know if I need to send another patch.</div>=
</blockquote><div><br></div><div>Noted, thanks for the ping.</div><div>I&#3=
9;ve put both scarhgap/wrynose patches in the review lists.</div><div><br><=
/div><div>Regards,=C2=A0</div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div></div>
<div>=C2=A0</div>
<div>Regards,</div>
<div>Jaipaul</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#241156): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/241156" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/241156</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120178637/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120178637/4316185</a><br>
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

--000000000000a7ff650656cb37a9--

