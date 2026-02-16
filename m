Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2DBEF5860
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 09:33:00 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16357.1771234370815149085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 01:32:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KQDUa7AR;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: ernstp@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8842e5a2a1so359900766b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 01:32:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771234369; cv=none;
        d=google.com; s=arc-20240605;
        b=k6qPLFw0N/MlIulBrSMZ4Vvc9d9C7b4kSFatmm3Y0tFZElD51lbk1AdM1F9wNCt+Uf
         Zl4aPumEjrPY7RbI9T0socZ1qXEiqN5zwcUF14S2+SsVsvbouHmy1b1IVG7Nf6JA+fa7
         qNd7Ojb/+G8b4IalZy+KCl1p8WSl2E8JGt+rSvY3sn0WsPBO1LDssbzTQfMhbG7E3itN
         2lTBafj2YpxCdaOrIRwl1qbBq3kqFUzanX8TtlwzixliCrRbk2ngyCYRS9ecDlsbh5e2
         OQXNJHCIUGBRTOG/Uuaqy9NWM24gdkjKH/YxBZi/oXhaCMT+VCxFixxK8Ij0pOKTcvtY
         ZSuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZHpuF1Ld+k9thDmmfpwjOl3nZHCvtth/Biw390XaLvE=;
        fh=Ab5QchtAs08eZNSFiBl6MfJNprT6k/vVQ8w3IX57Q1U=;
        b=PoajONG53djnMdR39xzi6Mg6RdecNEunQfLQbpVN18hNqko4+wueQOrvS30nqhK9+P
         BTgn9c4j7zIa/Af4Fz93JYHj+RFMawBrw0c+5EgKDqgND88leBLTNEqvmGlUqBLFjelS
         5FiJRm1ggsxQ/fMucO3B/3jfcZpBtCb/clmrHRZc3y3igTnJFQ43RSHne9V3j9UnBwCF
         TXBIeB/D2ZCDAgJzTRrT0XfY3ye6auT1r6GlUszDcNCySC5mqSIrRpEvBxCmg5OpfGb6
         5UzpZppScfgfE1OnQNmniTimmdr83ex+t2jgkzMqM+GN/BAEzkWnOMCboTqjdGmGyYPj
         ojSw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771234369; x=1771839169; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHpuF1Ld+k9thDmmfpwjOl3nZHCvtth/Biw390XaLvE=;
        b=KQDUa7ARiyC3yjbF5Q0kOkByTpuCDzlEYk3eqjq3rlipeO1tatq02np3f0gCaHXema
         Ph3iCge/H0gCg2xVE3zo3eJarDFhCL3ZGkDwerq8gvZYjzLCbHx7W9gBkK0WNQ9+lXxp
         PFWJNADORA13sojxzat031RrrRGyc0lm3I5TdeKfiwOA3EJKnLRuqVpAqIgU/JMOQAaZ
         CkyfqTvstGf7WK3+XU5dkXTx/HRtSlqxXcRGWWTZSohjla+GPqsuoU2qZJBtSgmjpX0D
         jiokOb3MHyodl0zT2y1pvfQptpLtEEQ5Nz4wCJB4dKzs3v8zeZiPAPeU6hZXFjOzCM+c
         3v+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771234369; x=1771839169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHpuF1Ld+k9thDmmfpwjOl3nZHCvtth/Biw390XaLvE=;
        b=o+l75D637QLgeQet5GKH+x92pEnUfCn6787TZsgz7WIIicM3qx+udjd1WyLwejl6m+
         5VbzNWiTQsYnCk4db7YT0RfsVY6Gz5u1wYy5pGg6xqmixtGunaOKhqvUkQ5IWXVuz/wP
         5VI+gE3mekIkJiE7vdSHCEJsbENwqdqqZ0r5wVY1QIUeLIwNKTHKKbpTtM9om/5LjY9V
         wQS40hcxORTgaTq8qMgSlD1y37gSXIvqZpL1sXkMzJHWNtPXKmspp1RhBfZacw91zXlb
         BtL1kutuJQTCQBmkSAosmFL/ZmNV2ZeTE/9xr4/v4Gi3BGV0uK89O3VhggBtW/5t3RLB
         8OQQ==
X-Gm-Message-State: AOJu0YxDDhxU8I04kAqnum9QjuDNStloUdErGsWwqa4NjwZt3tZ1qURt
	YlMmvSeZhs7Z0CsveiXw20eQokDX0NPXm49HkS5VfpvFPliePWH3aGbhy1W5rsiqWy8rZgEqH4f
	BAkDiMD4lT54hxpYLCxqacTq+qme7Vu4=
X-Gm-Gg: AZuq6aIafjB+PF5m2tEsaCUbfWAOVEYgY/4wT/0xpt80K6qPRrqaN5Ju4QqBuogX1ul
	lYfCWbtCYBWbEfd1QDlOkoh6ymCwx/UCVu9z5Jy6P35gTzwM6ug3WN8YNK7c5V72oYvnJBRgT0r
	suLb8Gcq3RPEvQ/JMMwXKIvbNf5SkewvFBLUgeUy4d8o+XAzuh64Wj0oB5YufN0S2HhFtqCJGlU
	IptVfXqkglNFjcZtWhJExeTVgTURRqgLHQZxYEJxXpOxYXUXwTkZb9RimQpgFBTRqRPhUFqQ/Wq
	jyjMEmMvIike2STdexkau/WOyFkomROHxBdf36ZJSGFrfg+0VwAo8dE4KQW6IFHl0jzBm3ZXczO
	JVuNLa3ckf6qxRlW/WE9liCxVRbOdFQDxcQEiyCc5pAI2eApyLmQX3cIviNRphanjwy9U6PPhtB
	x5YvVHiZD7b8GIFUgxMJ1pozee7QzqXgwahZwxX94BK+uUWGyGl5JpQ/amx4TUxc84c/OBhg==
X-Received: by 2002:a17:907:3f20:b0:b87:fc5:40ba with SMTP id
 a640c23a62f3a-b8fb42265c9mr483371466b.20.1771234368689; Mon, 16 Feb 2026
 01:32:48 -0800 (PST)
MIME-Version: 1.0
References: <20251029130310.2882818-1-ross.burton@arm.com>
In-Reply-To: <20251029130310.2882818-1-ross.burton@arm.com>
From: Ernst Persson <ernstp@gmail.com>
Date: Mon, 16 Feb 2026 10:32:36 +0100
X-Gm-Features: AaiRm518UfBCr4sWjmGiQJZTG_o2mAF6nWlPL1g_3yeb_2YFbT8GZe1B-z9evxc
Message-ID: <CAD=4a=WCwONJsM3yXHWMsC9PPqUAQhm3ABsDTRoqO_YoVo910Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes/base: prefer gnu-prefixed HOSTTOOLS
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005c1aeb064aeda380"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 09:33:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231190

--0000000000005c1aeb064aeda380
Content-Type: text/plain; charset="UTF-8"

Backport to other branches?

Den ons 29 okt. 2025 kl 14:03 skrev Ross Burton via lists.openembedded.org
<ross.burton=arm.com@lists.openembedded.org>:

> Ubuntu 25.10 has changed the default coreutils implementation from GNU
> coreutils to uutils/coreutils. Unfortunately this causes build problems:
>
>   couldn't allocate absolute path for 'null'.
>   tail: cannot open 'standard input' for reading: No such file or directory
>   install: failed to chown '...': Invalid argument (os error 22)
>
> Clear build failures happen in 'install' and 'tail', but there may be
> further breakage.
>
> Luckily, Ubuntu also installs GNU coreutils with a binary prefix of
> 'gnu', so whilst these issues are root-caused and fixed in either pseudo
> or uutils we can prefer the gnu-prefixed binaries where they are present.
>
> [ YOCTO #16028 ]
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes-global/base.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-global/base.bbclass
> b/meta/classes-global/base.bbclass
> index 6de17d1bb5d..cf303c237a5 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -127,7 +127,11 @@ def setup_hosttools_dir(dest, toolsvar, d,
> fatal=True):
>              # clean up dead symlink
>              if os.path.islink(desttool):
>                  os.unlink(desttool)
> -            srctool = bb.utils.which(path, tool, executable=True)
> +
> +            # Prefer gnu-prefixed binaries, if available
> +            srctool = (bb.utils.which(path, "gnu" + tool,
> executable=True) or
> +                       bb.utils.which(path, tool, executable=True))
> +
>              # gcc/g++ may link to ccache on some hosts, e.g.,
>              # /usr/local/bin/ccache/gcc -> /usr/bin/ccache, then
> which(gcc)
>              # would return /usr/local/bin/ccache/gcc, but what we need is
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225455):
> https://lists.openembedded.org/g/openembedded-core/message/225455
> Mute This Topic: https://lists.openembedded.org/mt/116011582/4947266
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ernstp@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000005c1aeb064aeda380
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Backport to other branches?</div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">Den ons 29 okt. 2025 kl 14:03 skrev Ross Burton via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;ross.burton=3D<a href=
=3D"mailto:arm.com@lists.openembedded.org">arm.com@lists.openembedded.org</=
a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Ubuntu 2=
5.10 has changed the default coreutils implementation from GNU<br>
coreutils to uutils/coreutils. Unfortunately this causes build problems:<br=
>
<br>
=C2=A0 couldn&#39;t allocate absolute path for &#39;null&#39;.<br>
=C2=A0 tail: cannot open &#39;standard input&#39; for reading: No such file=
 or directory<br>
=C2=A0 install: failed to chown &#39;...&#39;: Invalid argument (os error 2=
2)<br>
<br>
Clear build failures happen in &#39;install&#39; and &#39;tail&#39;, but th=
ere may be<br>
further breakage.<br>
<br>
Luckily, Ubuntu also installs GNU coreutils with a binary prefix of<br>
&#39;gnu&#39;, so whilst these issues are root-caused and fixed in either p=
seudo<br>
or uutils we can prefer the gnu-prefixed binaries where they are present.<b=
r>
<br>
[ YOCTO #16028 ]<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-global/base.bbclass | 6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bb=
class<br>
index 6de17d1bb5d..cf303c237a5 100644<br>
--- a/meta/classes-global/base.bbclass<br>
+++ b/meta/classes-global/base.bbclass<br>
@@ -127,7 +127,11 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=3DTru=
e):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# clean up dead symlink<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.islink(desttool)=
:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.unlink(des=
ttool)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srctool =3D bb.utils.which(path,=
 tool, executable=3DTrue)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Prefer gnu-prefixed binaries, =
if available<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 srctool =3D (bb.utils.which(path=
, &quot;gnu&quot; + tool, executable=3DTrue) or<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bb.utils.which(path, tool, executable=3DTrue))<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# gcc/g++ may link to ccach=
e on some hosts, e.g.,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# /usr/local/bin/ccache/gcc=
 -&gt; /usr/bin/ccache, then which(gcc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# would return /usr/local/b=
in/ccache/gcc, but what we need is<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#225455): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/225455" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/225455</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116011582/494=
7266" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116011582/4947266</a><br>
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

--0000000000005c1aeb064aeda380--

