Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B28C3ABBF
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 13:01:15 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.75150.1746536467530848637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 06:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kqg1xsib;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227d6b530d8so52104825ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 06:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746536467; x=1747141267; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sfBf89JI9ukHyYaTjZzm+8h7J7m8IfVhuMQWSQ3kacQ=;
        b=Kqg1xsibVbe4BIvaeaZjcMFrtMyibyLA0OfSxrr3KfPuh1fjODf6hfXq5FXw2Cf2xA
         lVsd2Zk61PM2h9ouLn1BO+7ZmK6Jyc1wk2x0+I4LhDpiOqhRESJIlcXyF2TrK2Ae1EjO
         rMwhiWXpbPyr4xg9/y9ZMgYn9spuXa1orrXhtwXPYBpLk2vgNt5yysqIUffbc/kXg8jF
         4VP9/VFty1QmhSdeZe6DRK21BFwulXTP+VKd0fqBxS+hGXAGsGy1Ilse512jHSINvA5T
         q9R3+ielBHoYiBbjrvjWCqtgMUUkVEvSnwmFsnaadyFRBUUNHmtMbhkl+zO4PErEysR3
         GOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746536467; x=1747141267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sfBf89JI9ukHyYaTjZzm+8h7J7m8IfVhuMQWSQ3kacQ=;
        b=dP6sTILNFAmVsFHtKUYZqKnDk0mr2rTDTwm2Lsouw9xJGuOOW2OoWClJQSpTMylL7V
         Ad6KRgMAHxnrVRXq2j+EQAhhsrdv1LKBybVvuRZOdTZ4HVPuGIIQCNX9St8xtR42Sf4E
         a/grjX5a/FyKGN8SXV+SsOQUPVNsYiW6gBF0Z7KFSMRsqif705U7/mCi2w2LLHqfxg2u
         Z2aAKQAZRTiywOPW/srrSJK8f1wPF6Jcb9oWG8EUUpoZsQsPOQdE8s3LJZU6gsbfX+Qc
         LMjzo0DzJIsBmOHx6YjgBfvaBgIafGYOP4dCYf706nsdtAvGTHv+r0AMmSRECig3LS7G
         qZaQ==
X-Gm-Message-State: AOJu0YzhwWssH5I+NXclqp9eJ6Nhsn2ZBgWdhu8UK6lnEqtJFPnmcKTf
	eaF5OX1NUAehcoMY5PUl3OxSx0MYbXIvpQHAuLKvWgItkDkjwj9Wbv5rBY8okAdAdpBX/vXzAu4
	kYQ8bjD33bqIsQSKwO5q0t5nIvz3HLune
X-Gm-Gg: ASbGncs35JBjTqeDPx2X9pz3FqLM55Dpn1i6wBDYiy3x/8hMJc6TzUcZ0ae3bMNlw87
	ZOzem0ivl7f2KzsjEDyAydnD8zFuCuhNR/ELbscNJcVOmkWEeLbeHtefyMzSMu8vvj4PmHQQu/V
	UgW3QLfN+PRwBL5rz9OCb4OiY=
X-Google-Smtp-Source: AGHT+IH/SvvE5rNX4ocskByUJgOW6K0BvWzpqm6dk42cv6UHWhZ8FBLQRo4VsrufcpmCI13xlMUbJacrhP0pEGcfELk=
X-Received: by 2002:a17:90b:1dc7:b0:308:5273:4df8 with SMTP id
 98e67ed59e1d1-30a4e5a57e5mr29623859a91.10.1746536466384; Tue, 06 May 2025
 06:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <LO0P265MB29537DEB8276706CFBB05913AA8E2@LO0P265MB2953.GBRP265.PROD.OUTLOOK.COM>
In-Reply-To: <LO0P265MB29537DEB8276706CFBB05913AA8E2@LO0P265MB2953.GBRP265.PROD.OUTLOOK.COM>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 6 May 2025 09:00:55 -0400
X-Gm-Features: ATxdqUGzBED2dEST6VlpRBxLmjuf4VYB7CLInRmeMW-CVhSPaNzx2NIIAEejOg8
Message-ID: <CADkTA4NZ1YPgVYfA8ttaLxrh-nUCB4+BUubKx7cWZSe4QfjKXQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto: sort patches by filename
To: benjamin.shirley-quirk@carallon.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000aa8beb0634773559"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 13:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216044

--000000000000aa8beb0634773559
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 8:56=E2=80=AFAM Benjamin Shirley-Quirk via
lists.openembedded.org <benjamin.shirley-quirk=3D
carallon.com@lists.openembedded.org> wrote:

> Currently patches are applied in the order in which they appear in SRC_UR=
I.
> As a result, patches split across multiple recipes are applied according =
to
> recipe parse order, not patch order, which can cause them to fail.
>
> This commit allows kernel patches split across multiple recipes to be
> applied
> in a deterministic and controllable order: sorted alphabetically by
> filename.
>

They really do need to be applied in SRC_URI order. So no, this patch
cannot be merged.

Bruce



>
> Signed-off-by: Benjamin Shirley-Quirk <benjamin.shirley-quirk@carallon.co=
m
> >
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass
> b/meta/classes-recipe/kernel-yocto.bbclass
> index cef6b9ec3f..766098db28 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -46,7 +46,8 @@ def find_patches(d,subdir):
>              # properly
>              if not patchdir:
>                  patch_list.append(local)
> -
> +    # sort patch_list so that they will be applied in filename-order
> +    patch_list.sort(key=3Dos.path.basename)
>      return patch_list
>
>  # returns all the elements from the src uri that are .scc files
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216043):
> https://lists.openembedded.org/g/openembedded-core/message/216043
> Mute This Topic: https://lists.openembedded.org/mt/112648149/1050810
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

--000000000000aa8beb0634773559
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 6, 2025 at 8:56=
=E2=80=AFAM Benjamin Shirley-Quirk via <a href=3D"http://lists.openembedded=
.org">lists.openembedded.org</a> &lt;benjamin.shirley-quirk=3D<a href=3D"ma=
ilto:carallon.com@lists.openembedded.org">carallon.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div class=3D"msg-145653120574223293">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Currently patches are applied in the order in which they appear in SRC_URI.=
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
As a result, patches split across multiple recipes are applied according to=
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
recipe parse order, not patch order, which can cause them to fail.</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
This commit allows kernel patches split across multiple recipes to be appli=
ed</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
in a deterministic and controllable order: sorted alphabetically by</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
filename.</div></div></div></blockquote><div><br></div><div><div class=3D"g=
mail_default" style=3D"font-size:small">They really do need to be applied i=
n SRC_URI order. So no, this patch cannot be merged.</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-1456531205742232=
93"><div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Signed-off-by: Benjamin Shirley-Quirk &lt;<a href=3D"mailto:benjamin.shirle=
y-quirk@carallon.com" target=3D"_blank">benjamin.shirley-quirk@carallon.com=
</a>&gt;</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
---</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0meta/classes-recipe/kernel-yocto.bbclass | 3 ++-</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe=
/kernel-yocto.bbclass</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
index cef6b9ec3f..766098db28 100644</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
--- a/meta/classes-recipe/kernel-yocto.bbclass</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
+++ b/meta/classes-recipe/kernel-yocto.bbclass</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
@@ -46,7 +46,8 @@ def find_patches(d,subdir):</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# properly</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not patchdir:</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patch_list.ap=
pend(local)</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
-</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0# sort patch_list so that they will be applied in filename-o=
rder</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
+ =C2=A0 =C2=A0patch_list.sort(key=3Dos.path.basename)</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0 =C2=A0 =C2=A0return patch_list</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
=C2=A0# returns all the elements from the src uri that are .scc files</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#216043): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/216043" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/216043</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112648149/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112648149/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div></blockquote></div><div><br clear=3D"all"></div><div><br></div><span =
class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gm=
ail_signature">- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br><br></div></div>

--000000000000aa8beb0634773559--

