Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06CB2CCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 04:01:25 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.4205.1761624082081898323
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 21:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WQRYm+7J;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-78af743c232so5018519b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 21:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761624081; x=1762228881; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xBiyxWjIKWaufx9ZeZl4ufGQrNy2Tm5wjSsYJ2kwBUA=;
        b=WQRYm+7JU2NqcxYe3//TFhS2bWrGv7SRliK2yLhIQ8SZJK+iJ+xKT5DrcTvGPRX1ZC
         bMi6oemQZNIYlOzNr+CW6iiyDr8/MH+pPSfpbyCC8E6L0J18dmSsMkeXSTG95iRC3svF
         W9IZMi619E61yvrO9KoP+aHlSLHx37/yG5izi0BKY1Ukw/eX+mg1eF0dF0O1QH/8yY+X
         FGjDHrV4ZHwn2LbDAlPSPeDFIr8TQ98a2VEPI0HSGS3B1AQ86k7z7pXdt7Sn6ppRXvgf
         BKhksHfWExZQduzdOcedvvx3Y2MJa9aFzHLsTAK6zHx/y8DO2+JrFmHs8pfMDUkuSKSp
         DltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761624081; x=1762228881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xBiyxWjIKWaufx9ZeZl4ufGQrNy2Tm5wjSsYJ2kwBUA=;
        b=uLnM3G08veSUCPZU9bXQ+4I7LpY2fwoZ7k1DDyP32hpYkPQ9nWtZWlO0moCUCSePdh
         3JaMCc0ax7tdZKlQAnCmi48GPNzE5mhTg19ZgOj3wUq5euZU9gyO6FySO2MO4Jg8Am2x
         +CovbcGIhDXylybo5MZ4K+979achv80OOZMvkxB3E5APOCnoSjd/OTH0cRxq3lb/sCo7
         wqaIUbhtqQWz6fV0zVgYZLUKaw47V8TQBjZGfSzViNTMXQ8GCnQurh/FGokl9CN6Ycnp
         UKKYNwIjhaS95a+P5L7+mnKxcKo+P6IABl+bmQiMQFbfAIsmBQ6NVrMyDqWOIW/VfpDq
         jlyg==
X-Gm-Message-State: AOJu0YxxQDPIpY6Oe8ajy797csF/qNMh1XbRuJ8Ktm61uzaBdY5H/G/6
	6rSajIlf6rc2zTmdfNoP5pu7bjU8GcoDMUgY3eJEJC6eS4o4ztvxrDl+ZzuL9TAGSUM1ZaOjtdl
	LMSF+VjzzX593yfUGM5O/x2fIH0LIbBw=
X-Gm-Gg: ASbGnctoj2cadNqz+qanUcaQ12ZAiKvAIomzAzAyWM4VNH02H2VWG74b1ojq1IkcrX4
	R13tuUEI4nHq8lrcXhenzawiICyWiTkxnkp84PxgY2bhHe/0ODthIh8Sqgyxrx4UB9Fq7KsZkla
	sV7tyXApP+t0HnDnEWtZ5yOXTCF2SWxk+vrSUK3JhxwQ45tK3CbZlCcMn8U8VT3EBNUjkkMLPIn
	3K7FL/tn2itNdXiFcjg1IOxBl8vKhmTxEG5guw74VjZoqHMfWa0376Ob8U2Xw==
X-Google-Smtp-Source: AGHT+IEC0zsIJynkKl9qMdEIpeAnjyezL2+d9hhU8Kt8Xxq1MyS6a/6Rb6kRcSZGOhuw6s6L3GhX0iAeI+EM7Q6jrrM=
X-Received: by 2002:a05:6a20:94ca:b0:342:968e:87a5 with SMTP id
 adf61e73a8af0-344d18c2aa1mr2233887637.7.1761624081095; Mon, 27 Oct 2025
 21:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20251028021830.3937223-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20251028021830.3937223-1-jiaying.song.cn@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 28 Oct 2025 00:01:09 -0400
X-Gm-Features: AWmQ_bkVGTld3fVXH3yGdcUj7aFSl7OJtLD2Ul5MrSViWSYHySFU5CbSodwq_KA
Message-ID: <CADkTA4NRaZh4kewu9q5h8SWQLPPUVA-i_=2PVV_AMpJoSLhVFg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-devsrc: fix incorrect python shebang replacement
To: Jiaying.Song.CN@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000094e0fc0642301129"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 04:01:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225373

--00000000000094e0fc0642301129
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 10:18=E2=80=AFPM Song, Jiaying (CN) via
lists.openembedded.org <Jiaying.Song.CN=3Dwindriver.com@lists.openembedded.=
org>
wrote:

> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> Update the replacement strategy to use a stricter pattern that matches
> all versioned python paths and correctly replaces them with
> '/usr/bin/env python3'.
>
> The previous sed rule would incorrectly change the Python shebang in
> /lib/modules/6.16.11-yocto-standard/build/scripts/macro_checker.py from
> '#!/usr/bin/python3' to '#!/usr/bin/env python33'.
>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 04dd683dde..aaed0cd127 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -400,7 +400,7 @@ do_install() {
>      for ss in $(find $kerneldir/build/scripts -type f -name '*'); do
>          sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "$ss"
>          sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "$ss"
> -        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "$ss"
> +        sed -i 's,/usr/bin/python[0-9.]*,/usr/bin/env python3,' "$ss"
>

An anchored expression would be better. We are only interested
in changing "python" to "python3", not python3 to python3 or python33 to
python3, etc.

Bruce



>      done
>
>      chown -R root:root ${D}
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225372):
> https://lists.openembedded.org/g/openembedded-core/message/225372
> Mute This Topic: https://lists.openembedded.org/mt/115987922/1050810
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

--00000000000094e0fc0642301129
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 27, 2025 at 10:18=
=E2=80=AFPM Song, Jiaying (CN) via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;<a href=3D"http://Jiaying.Song.CN">Jiaying=
.Song.CN</a>=3D<a href=3D"mailto:windriver.com@lists.openembedded.org">wind=
river.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: Jiaying Song &lt;<a href=3D"mailto:j=
iaying.song.cn@windriver.com" target=3D"_blank">jiaying.song.cn@windriver.c=
om</a>&gt;<br>
<br>
Update the replacement strategy to use a stricter pattern that matches<br>
all versioned python paths and correctly replaces them with<br>
&#39;/usr/bin/env python3&#39;.<br>
<br>
The previous sed rule would incorrectly change the Python shebang in<br>
/lib/modules/6.16.11-yocto-standard/build/scripts/macro_checker.py from<br>
&#39;#!/usr/bin/python3&#39; to &#39;#!/usr/bin/env python33&#39;.<br>
<br>
Signed-off-by: Jiaying Song &lt;<a href=3D"mailto:jiaying.song.cn@windriver=
.com" target=3D"_blank">jiaying.song.cn@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" =
rel=3D"noreferrer" target=3D"_blank">kernel-devsrc.bb</a> b/meta/recipes-ke=
rnel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"noreferrer" target=3D=
"_blank">kernel-devsrc.bb</a><br>
index 04dd683dde..aaed0cd127 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
@@ -400,7 +400,7 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0for ss in $(find $kerneldir/build/scripts -type f -name=
 &#39;*&#39;); do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s,/usr/bin/python2,/usr/bin/e=
nv python3,&#39; &quot;$ss&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s,/usr/bin/env python2,/usr/b=
in/env python3,&#39; &quot;$ss&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s,/usr/bin/python,/usr/bin/env pyt=
hon3,&#39; &quot;$ss&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s,/usr/bin/python[0-9.]*,/usr/bin/=
env python3,&#39; &quot;$ss&quot;<br></blockquote><div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">An anchored expression wo=
uld be better. We are only interested</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">in changing &quot;python&quot; to &quot;python3&quot=
;, not python3 to python3 or python33 to python3, etc.</div><div class=3D"g=
mail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0done<br>
<br>
=C2=A0 =C2=A0 =C2=A0chown -R root:root ${D}<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#225372): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/225372" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/225372</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115987922/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115987922/1050810</a><br>
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

--00000000000094e0fc0642301129--

