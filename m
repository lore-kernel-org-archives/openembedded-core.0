Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B336CC369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 12:31:46 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.7268.1745411498701481641
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 05:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NLaYWejD;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-306b78ae2d1so5098373a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 05:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745411498; x=1746016298; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ALLHXEV0XopFJV3foQIH6wMlqhsWTh1Gk9r+Xxd6Mpg=;
        b=NLaYWejD1vTR7pv+v35pCarc3/ww7eUdY7SDgcNCc7R4Pdu3tGfqc+8DX5Hjjt+gy1
         S1ewmXsWC8nxWWP5uZzgW4p2zZghnS5Gm6lCDHJUq4qTQKi/c0ZxzGiVRx5IeWibzq+D
         MxOg3Fi39uPsICcaDbPjuwXMP8W4e3WfkfGa9yIZRqJg548LURETVWTq2kqFwxJF4Xny
         ffaDTEpWgSaBo9xZOM4mMHIgIfxNriadzoFOTgvuO/oweQwiLDu00ukooSKssR5g+kNn
         Aqukuldks3Liknl95KepFgLN2gCu7a/IV5VkrpKSn+2J66nxsRM7feYuocectlKm1ZJo
         e82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745411498; x=1746016298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALLHXEV0XopFJV3foQIH6wMlqhsWTh1Gk9r+Xxd6Mpg=;
        b=QWHwYavB3i8ZQm4Iz3ryzPpDalZegLw0aM9aadCfZ3Q/iafTRQaQCUVy5MlATK96e3
         44TFImCkbkzuaBrgSKYnij2bpXXwEpvZR5K9US1smHDQmC5QbNz7caCszTXtT2ZqCVD3
         ONERC6YC7keKiefMsQZqwxi371qf58m2RSDRMZNyUkNAwm715FK+jK5l/NDjluXhrefW
         ukcJyuzdNLw4gXwWcXPNTEIgQyu3YR6Fy7jHyrUl7awIsd+F+GsJH4R9YBeTPBY8u4wM
         D42/j7R7x5OOJbhsFnMY0DYyO9HW/tcjcGguOpgMBCq3Qg6Tw40g69xp9BUvl++ozsaB
         mW5g==
X-Gm-Message-State: AOJu0YzhEQai9nLle975B5fzjLjRAg3dNcRvZpsT9qkTWUCbyWXhc112
	sN1vI02FcHguwtwYULzADnmRMARoQzQe2xNrE+jGx9H1RMN79rcjEgGDAWq5qxCBVKLkimA4es6
	k2Mn42OIFwyDBLVzWxb5VeyanavgW4/gs
X-Gm-Gg: ASbGncuRbRkX6ljVMCzNOAzl4h6s2Q/Gk6e2CKS38ki8x0mBXJDuMD4raYIOWCFABtW
	3puWMhkpJgR0/AeJqSg266QH1SLs1YSwBQHFNKOJOtngRsNPR64TUM7c3WS7aIvOdxzZTDZezM+
	a2OL1waLB7NbJ5W4ZFuvqyPWM=
X-Google-Smtp-Source: AGHT+IE64VH+hKW3xbbN4BzlUTn5HyrCHzMx5RMQTNwKR7oc8vCB04j60OXZySQCLLc8nGpLn3VI0GaiSZWCLlquckM=
X-Received: by 2002:a17:90b:1d50:b0:2ee:f677:aa14 with SMTP id
 98e67ed59e1d1-3087bb533damr27400544a91.13.1745411497857; Wed, 23 Apr 2025
 05:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250423080246.128723-1-mikko.rapeli@linaro.org>
In-Reply-To: <20250423080246.128723-1-mikko.rapeli@linaro.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 23 Apr 2025 08:31:25 -0400
X-Gm-Features: ATxdqUHF3o3rVTZwZD6jejhlQH3-2T1SoxbPUrkoCNqDDGGFeL4_iqvOlLmp3Xw
Message-ID: <CADkTA4PjYn55Udo7KxJwQi_SK08r+a_6EwMyo=e1-Y1vDKtxYA@mail.gmail.com>
Subject: Re: [poky] [PATCH 1/3] kern-tools-native: update to support modular
 kernel builds
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org, poky@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000511c4706337148a0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 12:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215285

--000000000000511c4706337148a0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Do not apply this patch.

I have queued updates for this support, and again, they have not been sent
on purpose.

nack.

Bruce

On Wed, Apr 23, 2025 at 4:03=E2=80=AFAM Mikko Rapeli via lists.yoctoproject=
.org
<mikko.rapeli=3Dlinaro.org@lists.yoctoproject.org> wrote:

> After this update scc tool can compile options as modules
> conditionally without duplicating config fragments when
> the options contain a comment like:
>
> CONFIG_LEDS_GPIO=3Dy # OVERRIDE:$MODULE_OR_Y
>
> Then "scc -DMODULE_OR_Y=3Dm" converts these into
>
> CONFIG_LEDS_GPIO=3Dm
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index 6dd19f1f09..20b1bcaf37 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "\
>
>  DEPENDS +=3D "git-replacement-native"
>
> -SRCREV =3D "c8c1f17867d0cc7d04be225ba4901f2373428be2"
> +SRCREV =3D "fe67c98d2e9b74af44d0c4b660fa18e3a95e7edd"
>  PV =3D "0.3+git"
>
>  inherit native
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#13598):
> https://lists.yoctoproject.org/g/poky/message/13598
> Mute This Topic: https://lists.yoctoproject.org/mt/112396089/1050810
> Group Owner: poky+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/poky/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000511c4706337148a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Do =
not apply this patch.</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I h=
ave queued updates for this support, and again, they have not been sent on =
purpose.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">nack.</div><div =
class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"g=
mail_default" style=3D"font-size:small">Bruce</div></div><br><div class=3D"=
gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Wed, Apr 23, 2025 at 4:03=E2=80=AFAM Mikko Rapeli via <a href=3D"http://li=
sts.yoctoproject.org">lists.yoctoproject.org</a> &lt;mikko.rapeli=3D<a href=
=3D"mailto:linaro.org@lists.yoctoproject.org">linaro.org@lists.yoctoproject=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">After this update scc tool can compile options as modules<br>
conditionally without duplicating config fragments when<br>
the options contain a comment like:<br>
<br>
CONFIG_LEDS_GPIO=3Dy # OVERRIDE:$MODULE_OR_Y<br>
<br>
Then &quot;scc -DMODULE_OR_Y=3Dm&quot; converts these into<br>
<br>
CONFIG_LEDS_GPIO=3Dm<br>
<br>
Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org" =
target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-native_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a> | 2=
 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-na=
tive_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb<=
/a> b/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-native_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a><br>
index 6dd19f1f09..20b1bcaf37 100644<br>
--- a/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-native_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a><br>
+++ b/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-native_gi=
t.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a><br>
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D &quot;\<br>
<br>
=C2=A0DEPENDS +=3D &quot;git-replacement-native&quot;<br>
<br>
-SRCREV =3D &quot;c8c1f17867d0cc7d04be225ba4901f2373428be2&quot;<br>
+SRCREV =3D &quot;fe67c98d2e9b74af44d0c4b660fa18e3a95e7edd&quot;<br>
=C2=A0PV =3D &quot;0.3+git&quot;<br>
<br>
=C2=A0inherit native<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#13598): <a href=3D"https://lists.yoctoproject.org/g/pok=
y/message/13598" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctopr=
oject.org/g/poky/message/13598</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/112396089/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/112396089/1050810</a><br>
Group Owner: <a href=3D"mailto:poky%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">poky+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/poky/unsub" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/poky/unsub<=
/a> [<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.as=
hfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>

--000000000000511c4706337148a0--

