Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E76C28B2E
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 05:32:17 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.2128.1741671135688899332
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 22:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GcXISR2+;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22398e09e39so92230655ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 22:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741671135; x=1742275935; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ubNb46c2GKNtpvgiWMFRE8QeJiS4Noraz2eUPK7A9NM=;
        b=GcXISR2+UsstQwXZrOMPXXkvhHUZBLQs73coR6GRODaUcrS11C6Fc/2yvIjK5ZM/WT
         HOZBwTWWuTlWWNNqc3VLdR4+1QxFEEu/DSfr90TKVbFGt3qqkxTQiAtHBj5336FGKkze
         BNTp79da2GvNqOLdxGcMl9rZ2Kom3tkW6gGEZpneopmRjMXvMS+9DaRa5CTqfUP3cYZW
         5hZ9Xn11Z7zaeopSO6kbkGYs6a52RoldpZz8gdHXfvX7dTEviq3iHGnJsb/YtNL/AR7D
         0xdtN+lpg8z6SSpARfgtdH0XkVHGo/ErvDhcU1THe0tiU3V3oc65wLpo0F7w5LEdaoOu
         ti0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741671135; x=1742275935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ubNb46c2GKNtpvgiWMFRE8QeJiS4Noraz2eUPK7A9NM=;
        b=Tj7/+toOBwMg1ioTDnOrSCmhPnDktRVa4F8+KfmOa5rEwGnvQuNvAnjmS1fHFTjWQR
         38uBKTKKgbYZvyt+n+OmzDn3ttWJ8QtAh9wTkZhwPcNmLgRCJJvOWuZmu3U6dA18Z3zJ
         eSflWaoig+cBBSAojSB11zdFrDcTT6fdDB0fLDMFSPsEmNZeorb58JaRofZX5RfelU8i
         D43ztV5a8Xeuapa5eFMDZUpbE2OE9i4ShbeulkHwoZGuuYeCFBxPV5GPDvSLrYFX9R0D
         vSuwhB2WzOpEARqtfi4H+ycpYqn5wcVWVm+vfMXpUakLjIZ+MWS+2tz5kAgqvewAijdQ
         qALA==
X-Gm-Message-State: AOJu0Yzow4yZmnNU4eBkKFVIwbiYR5RW7ZiLc1WK5whYZKD72QyiOQ2m
	GYYYOfAq8xOnx6ME87ytVL0Y5V84KHBW63VP/slOMQztmghV1JF8E8Ho50KMql3saftEbRU6yHU
	x/87juH9VvtNi0kkz5v7fzx0cCXA=
X-Gm-Gg: ASbGncs1fUecdaNgmWPy1mALzry3b1p9mTip2E86M6/Go3BpcZGy6A/Zyc2oOxGwKEG
	94KPmY1los2QjzdbIdRjdEeh1t08NWgDgWirle4lTf8f2P7LemEeQQOr1lf85/7RqQ24GKgC75s
	86ehSn03T9bCZ3ipHraqcWI3GCOW6I
X-Google-Smtp-Source: AGHT+IED+mF6ud/Es5LycRX4Ic1x06ff420RsF55WbFuKYva/grKTSbDNcV0xGmqPMGXrYenjevohhs9ieP/Lyxd/QQ=
X-Received: by 2002:a17:902:e5d2:b0:224:e33:8896 with SMTP id
 d9443c01a7336-22428886514mr249495545ad.11.1741671134885; Mon, 10 Mar 2025
 22:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250311045911.3023271-1-hongxu.jia@windriver.com>
In-Reply-To: <20250311045911.3023271-1-hongxu.jia@windriver.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 11 Mar 2025 06:32:03 +0100
X-Gm-Features: AQ5f1Jp5pjGuPjkvG0ombH7YX945nm1tUqXRfZ9dGJXpayLBE2cC6341ROMR5ZA
Message-ID: <CAApg2=Sh+nbwEdX0B19GqFwzfYP=6LHqPRdrvmhvxfnbSyE35g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] gnupg: 2.5.4 -> 2.5.5
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="0000000000004f841e06300a692b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 05:32:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212542

--0000000000004f841e06300a692b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the update patch. First two items from the changelog looks like
CVE material (haven't been released as CVEs as of today).
I vote for a backport to stable branches (with Steve in copy).

Kind regards,
Marta

On Tue, Mar 11, 2025 at 5:59=E2=80=AFAM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:

> Noteworthy changes in version 2.5.5 (2025-03-07)
> ------------------------------------------------
>
>   * gpg: Fix a verification DoS due to a malicious subkey in the
>     keyring.  [T7527]
>
>   * dirmngr: Fix possible hangs due to blocking connection requests.
>     [T6606, T7434]
>
>   * w32: On socket nonce mismatch close the socket.  [T7434]
>
>   * w32: Print more detailed diagnostics for IPC errors.
>
>   * GPGME is not any more distributed with the Windows installer.
>     Please install gpg4win to get gpgme version.
>
>   See-also: gnupg-announce/2025q1/000491.html
>   Release-info: https://dev.gnupg.org/T7530
>
> https://dev.gnupg.org/source/gnupg/browse/master/NEWS
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-support/gnupg/{gnupg_2.5.4.bb =3D> gnupg_2.5.5.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/gnupg/{gnupg_2.5.4.bb =3D> gnupg_2.5.5.bb}
> (97%)
>
> diff --git a/meta/recipes-support/gnupg/gnupg_2.5.4.bb
> b/meta/recipes-support/gnupg/gnupg_2.5.5.bb
> similarity index 97%
> rename from meta/recipes-support/gnupg/gnupg_2.5.4.bb
> rename to meta/recipes-support/gnupg/gnupg_2.5.5.bb
> index e6a7e3fb407..a9ab486f6bf 100644
> --- a/meta/recipes-support/gnupg/gnupg_2.5.4.bb
> +++ b/meta/recipes-support/gnupg/gnupg_2.5.5.bb
> @@ -23,7 +23,7 @@ SRC_URI:append:class-native =3D "
> file://0001-configure.ac-use-a-custom-value-for-
>                                  file://relocate.patch"
>  SRC_URI:append:class-nativesdk =3D " file://relocate.patch"
>
> -SRC_URI[sha256sum] =3D
> "f8cb2ac6c9f17f81e3541c62158764910fad5c3a0765e00b398c41a32bc4e0ea"
> +SRC_URI[sha256sum] =3D
> "7afa71d72ff9aaff75a6810b87b486bc492fd752e4f77b07c41759ce4ef36b31"
>
>  EXTRA_OECONF =3D "--disable-ldap \
>                 --disable-ccid-driver \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212540):
> https://lists.openembedded.org/g/openembedded-core/message/212540
> Mute This Topic: https://lists.openembedded.org/mt/111634573/5827677
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rybczynska@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004f841e06300a692b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for the update patch. First two items from the=
 changelog looks like CVE material (haven&#39;t been released as CVEs as of=
 today).</div><div>I vote for a backport to stable branches (with Steve in =
copy).</div><div><br></div><div>Kind regards,</div><div>Marta<br></div><br>=
<div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"=
gmail_attr">On Tue, Mar 11, 2025 at 5:59=E2=80=AFAM hongxu via <a href=3D"h=
ttp://lists.openembedded.org">lists.openembedded.org</a> &lt;hongxu.jia=3D<=
a href=3D"mailto:eng.windriver.com@lists.openembedded.org">eng.windriver.co=
m@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Noteworthy changes in version 2.5.5 (2025-03-07)<br=
>
------------------------------------------------<br>
<br>
=C2=A0 * gpg: Fix a verification DoS due to a malicious subkey in the<br>
=C2=A0 =C2=A0 keyring.=C2=A0 [T7527]<br>
<br>
=C2=A0 * dirmngr: Fix possible hangs due to blocking connection requests.<b=
r>
=C2=A0 =C2=A0 [T6606, T7434]<br>
<br>
=C2=A0 * w32: On socket nonce mismatch close the socket.=C2=A0 [T7434]<br>
<br>
=C2=A0 * w32: Print more detailed diagnostics for IPC errors.<br>
<br>
=C2=A0 * GPGME is not any more distributed with the Windows installer.<br>
=C2=A0 =C2=A0 Please install gpg4win to get gpgme version.<br>
<br>
=C2=A0 See-also: gnupg-announce/2025q1/000491.html<br>
=C2=A0 Release-info: <a href=3D"https://dev.gnupg.org/T7530" rel=3D"norefer=
rer" target=3D"_blank">https://dev.gnupg.org/T7530</a><br>
<br>
<a href=3D"https://dev.gnupg.org/source/gnupg/browse/master/NEWS" rel=3D"no=
referrer" target=3D"_blank">https://dev.gnupg.org/source/gnupg/browse/maste=
r/NEWS</a><br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/gnupg/{<a href=3D"http://gnupg_2.5.4.bb" rel=3D"=
noreferrer" target=3D"_blank">gnupg_2.5.4.bb</a> =3D&gt; <a href=3D"http://=
gnupg_2.5.5.bb" rel=3D"noreferrer" target=3D"_blank">gnupg_2.5.5.bb</a>} | =
2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-support/gnupg/{<a href=3D"http://gnupg_2.5.4.bb" =
rel=3D"noreferrer" target=3D"_blank">gnupg_2.5.4.bb</a> =3D&gt; <a href=3D"=
http://gnupg_2.5.5.bb" rel=3D"noreferrer" target=3D"_blank">gnupg_2.5.5.bb<=
/a>} (97%)<br>
<br>
diff --git a/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.5.4.bb" r=
el=3D"noreferrer" target=3D"_blank">gnupg_2.5.4.bb</a> b/meta/recipes-suppo=
rt/gnupg/<a href=3D"http://gnupg_2.5.5.bb" rel=3D"noreferrer" target=3D"_bl=
ank">gnupg_2.5.5.bb</a><br>
similarity index 97%<br>
rename from meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.5.4.bb" re=
l=3D"noreferrer" target=3D"_blank">gnupg_2.5.4.bb</a><br>
rename to meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.5.5.bb" rel=
=3D"noreferrer" target=3D"_blank">gnupg_2.5.5.bb</a><br>
index e6a7e3fb407..a9ab486f6bf 100644<br>
--- a/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.5.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">gnupg_2.5.4.bb</a><br>
+++ b/meta/recipes-support/gnupg/<a href=3D"http://gnupg_2.5.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">gnupg_2.5.5.bb</a><br>
@@ -23,7 +23,7 @@ SRC_URI:append:class-native =3D &quot; file://0001-config=
ure.ac-use-a-custom-value-for-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://relocate.patch&quot;<br=
>
=C2=A0SRC_URI:append:class-nativesdk =3D &quot; file://relocate.patch&quot;=
<br>
<br>
-SRC_URI[sha256sum] =3D &quot;f8cb2ac6c9f17f81e3541c62158764910fad5c3a0765e=
00b398c41a32bc4e0ea&quot;<br>
+SRC_URI[sha256sum] =3D &quot;7afa71d72ff9aaff75a6810b87b486bc492fd752e4f77=
b07c41759ce4ef36b31&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--disable-ldap \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-ccid-driv=
er \<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#212540): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/212540" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/212540</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111634573/582=
7677" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111634573/5827677</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:rybczynska@gmail.com" targ=
et=3D"_blank">rybczynska@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000004f841e06300a692b--

