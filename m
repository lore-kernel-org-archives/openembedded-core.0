Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE79AC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 04:08:52 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web08.8005.1644984528436733417
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 20:08:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RndYM3OA;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id a19so1080987qvm.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 20:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ew4bWD45aXtmvIdPNZXfLMyNn8VWYh1Co4HGwccysP0=;
        b=RndYM3OA8icAZ+ckFl6VSrAB3l0VyoLqw5E8M7ckpck9R50KKEdvdEiCPavHYvYip+
         14JDnOqcI6ZALn4mXhLUwwzrn+zi39YynTR/FUxyYLWlha87xkw20lz0xu0uC/QbFZ2H
         Y5qIUQGA71iund2PPUzucyWOueZzAMFgw6cZ9+X+hHUl6Vw60Qssx9YbzHdYfMFWCSR+
         etwRaygaBRNnM3aiMIrskjEe/VFM0XVQbK3z95ZzD/wMf9218zJkLgNAuqTKhqdDp5JE
         Ki38OzVXKTaK2oGP+K5I0rj7+WE2aCpsvnQunA7lm2fbB3V1zVp0Ju+WfHY98CG62CkZ
         JcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ew4bWD45aXtmvIdPNZXfLMyNn8VWYh1Co4HGwccysP0=;
        b=il53MerOv9WUKSjf/ZTKhLiESINKAFVsQLMra5i1nPl0f4S3z70t+pEQpPpiCom+dU
         is/QmcOrnV8xVRGwyzwewKGoJpY6K+HUKMY82Fke9VMNEn2UUEHwwXz9x9j3TDqa0PPr
         RtJd7hCt8/dbTCp9VGQtAJUrhYbZWR+pLOUOj4xon0C6u7RfvKxDehXxDE6I6fPRjCGq
         SVFbsOM2xXshqCDuJaP6hHiT/osP2xijpd2igKHVtw3JQY1aubG9vGEpKxTu6+SotIQU
         NBbWMzWxe6Th03amN9UYtfLNZREYQyLHF6/owHfjcfo41d2d/XLhIq/hAGAUR4TO7Dro
         9nvw==
X-Gm-Message-State: AOAM532mbf4ATIOZqbrMfit7uoS/JHu5scVQ4HIYMnXNOy4wRddhxXsf
	gYITxsdP9ZIulA5HFVDhV+kVQdZo9iNMF8NfS91+dzbVgzs=
X-Google-Smtp-Source: 
 ABdhPJykLYPgI2raWKvQxWaudskVKYqewoO1bdLo6GcaBQ67FNEIEQjUvxO0pZ3qGNNARrRKORtm2bkB7LxIxdV15h0=
X-Received: by 2002:a05:6214:14e9:b0:42d:f1a4:5487 with SMTP id
 k9-20020a05621414e900b0042df1a45487mr738716qvw.110.1644984527327; Tue, 15 Feb
 2022 20:08:47 -0800 (PST)
MIME-Version: 1.0
References: <20220208225310.1685131-1-raj.khem@gmail.com>
 <333ededd-79c4-8a21-b6a5-8012b5f793e3@windriver.com>
 <CAMKF1sp5rtBg0tf4mN-9VBUxVYXbqrA1i8nQe-L_8MHNRapj1g@mail.gmail.com>
 <MW3PR11MB4633B716168A3E59ECA2F06994359@MW3PR11MB4633.namprd11.prod.outlook.com>
In-Reply-To: 
 <MW3PR11MB4633B716168A3E59ECA2F06994359@MW3PR11MB4633.namprd11.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Feb 2022 20:08:36 -0800
Message-ID: 
 <CAMKF1srKp84XMQLTs6jbfhxMhgBK2suLxjHQNbdPBH+gT9qW1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/3] glibc: Upgrade to 2.35 (RFC)
To: "Jia, Hongxu" <Hongxu.Jia@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006995fc05d81ace19"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 04:08:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161767

--0000000000006995fc05d81ace19
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 6:28 PM Jia, Hongxu <Hongxu.Jia@windriver.com>
wrote:

> Hi khem,
>
> Upstream glibc reject it because the latest docker has supported it[1],
> and upstream glibc does not backward compatibility with old docker[2]
>
> In order to build Yocto with uninative in old docker, we need this local
> patch
>

How old is the docker and I assume
It=E2=80=99s some distribution needing it ?

>
> [1]
> https://github.com/moby/moby/commit/9f6b562dd12ef7b1f9e2f8e6f2ab6477790a6=
594
>
> <https://github.com/moby/moby/commit/9f6b562dd12ef7b1f9e2f8e6f2ab6477790a=
6594>
> seccomp: add support for "clone3" syscall in default policy =C2=B7
> moby/moby@9f6b562
> <https://github.com/moby/moby/commit/9f6b562dd12ef7b1f9e2f8e6f2ab6477790a=
6594>
> If no seccomp policy is requested, then the built-in default policy in
> dockerd applies. This has no rule for &quot;clone3&quot; defined, nor any
> default errno defined. So when runc receives the con...
> github.com
> *=EE=9C=91*
>
> [2]https://sourceware.org/pipermail/libc-alpha/2021-August/130590.html
>
> //Hongxu
> ------------------------------
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* Wednesday, February 16, 2022 12:17 AM
> *To:* Jia, Hongxu <Hongxu.Jia@windriver.com>
> *Cc:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>; Richard Purdie <
> richard.purdie@linuxfoundation.org>
> *Subject:* Re: [OE-core] [PATCH v3 1/3] glibc: Upgrade to 2.35 (RFC)
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
>
> On Tue, Feb 15, 2022 at 12:25 AM Jia, Hongxu <Hongxu.Jia@windriver.com>
> wrote:
> >
> > On 2/9/22 06:53, Khem Raj wrote:
> >
> > diff --git
> a/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivil=
eged-process-BZ-.patch
> b/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivil=
eged-process-BZ-.patch
> > deleted file mode 100644
> > index 3283dd7ad8a..00000000000
> > ---
> a/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivil=
eged-process-BZ-.patch
> > +++ /dev/null
> > @@ -1,79 +0,0 @@
> > -From a8bc44936202692edcd82a48c07d7cf27d6ed8ee Mon Sep 17 00:00:00 2001
> > -From: Hongxu Jia <hongxu.jia@windriver.com>
> > -Date: Sun, 29 Aug 2021 20:49:16 +0800
> > -Subject: [PATCH] fix create thread failed in unprivileged process [BZ
> #28287]
> > -
> > -Since commit [d8ea0d0168 Add an internal wrapper for clone, clone2 and
> clone3]
> > -applied, start a unprivileged container (docker run without
> --privileged),
> > -it creates a thread failed in container.
> > -
> > -In commit d8ea0d0168, it calls __clone3 if HAVE_CLONE3_WAPPER is
> defined.  If
> > -__clone3 returns -1 with ENOSYS, fall back to clone or clone2.
> > -
> > -As known from [1], cloneXXX fails with EPERM if CLONE_NEWCGROUP,
> > -CLONE_NEWIPC, CLONE_NEWNET, CLONE_NEWNS, CLONE_NEWPID, or CLONE_NEWUTS
> > -was specified by an unprivileged process (process without CAP_SYS_ADMI=
N)
> > -
> > -[1] https://man7.org/linux/man-pages/man2/clone3.2.html
> > -
> > -So if __clone3 returns -1 with EPERM, fall back to clone or clone2 cou=
ld
> > -fix the issue. Here are the test steps:
> > -
> >
> > Hi RP,
> >
> >
> > I found this local patch was removed from glibc, we have to get it back
> and regenerate uninative to avoid the thread creation failure in
> unprivileged container
> >
>
> I intentionally dropped it since upstream glibc will not accept this
> patch since its not glibc problem but
> rather container runtime problem. Can you investigate that path before
> we reapply it. Maintaining a rejected patch is last thing we want to
> do.
>
> >
> > //Hongxu
>

--0000000000006995fc05d81ace19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Feb 15, 2022 at 6:28 PM Jia, Hongxu &lt;<a href=3D"=
mailto:Hongxu.Jia@windriver.com">Hongxu.Jia@windriver.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-=
color:rgb(204,204,204)">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Hi khem,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
Upstream glibc reject it because the latest docker has supported it[1], and=
 upstream glibc does not backward compatibility with old docker[2]</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
In order to build Yocto with uninative in old docker, we need this local pa=
tch</div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">H=
ow old is the docker and I assume</div><div dir=3D"auto">It=E2=80=99s some =
distribution needing it ?=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;padding-left:1ex;border-left-color:rgb(204,204,204)"><div dir=3D"ltr"><div=
 style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt;col=
or:rgb(0,0,0)" dir=3D"auto"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
[1]=C2=A0<a href=3D"https://github.com/moby/moby/commit/9f6b562dd12ef7b1f9e=
2f8e6f2ab6477790a6594" id=3D"m_7849487073109687248LPlnkOWALinkPreview" targ=
et=3D"_blank" style=3D"font-family:Calibri,Arial,Helvetica,sans-serif">http=
s://github.com/moby/moby/commit/9f6b562dd12ef7b1f9e2f8e6f2ab6477790a6594</a=
></div>
<div>
<div id=3D"m_7849487073109687248LPBorder_GTaHR0cHM6Ly9naXRodWIuY29tL21vYnkv=
bW9ieS9jb21taXQvOWY2YjU2MmRkMTJlZjdiMWY5ZTJmOGU2ZjJhYjY0Nzc3OTBhNjU5NA.." s=
tyle=3D"width:100%;margin-top:16px;margin-bottom:16px;max-width:800px;min-w=
idth:424px">
<table id=3D"m_7849487073109687248LPContainer910426" role=3D"presentation" =
style=3D"padding:12px 36px 12px 12px;width:100%;border:1px solid rgb(200,20=
0,200);border-top-left-radius:2px;border-top-right-radius:2px;border-bottom=
-right-radius:2px;border-bottom-left-radius:2px">
<tbody>
<tr valign=3D"top" style=3D"border-spacing:0px">
<td>
<div id=3D"m_7849487073109687248LPImageContainer910426" style=3D"margin-rig=
ht:12px;height:120px;overflow:hidden;width:240px">
<a id=3D"m_7849487073109687248LPImageAnchor910426" href=3D"https://github.c=
om/moby/moby/commit/9f6b562dd12ef7b1f9e2f8e6f2ab6477790a6594" target=3D"_bl=
ank"><img id=3D"m_7849487073109687248LPThumbnailImageId910426" alt=3D"" hei=
ght=3D"120" style=3D"display: block;" width=3D"240"></a></div>
</td>
<td style=3D"width:100%">
<div id=3D"m_7849487073109687248LPTitle910426" style=3D"font-size:21px;font=
-weight:300;margin-right:8px;font-family:wf_segoe-ui_light,&quot;Segoe UI L=
ight&quot;,&quot;Segoe WP Light&quot;,&quot;Segoe UI&quot;,&quot;Segoe WP&q=
uot;,Tahoma,Arial,sans-serif;margin-bottom:12px">
<a id=3D"m_7849487073109687248LPUrlAnchor910426" href=3D"https://github.com=
/moby/moby/commit/9f6b562dd12ef7b1f9e2f8e6f2ab6477790a6594" style=3D"text-d=
ecoration:none;font-family:wf_segoe-ui_light,&quot;Segoe UI Light&quot;,&qu=
ot;Segoe WP Light&quot;,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Ar=
ial,sans-serif;color:var(--themePrimary)" target=3D"_blank">seccomp: add su=
pport for &quot;clone3&quot; syscall in default policy =C2=B7 moby/moby@9f6=
b562</a></div>
<div id=3D"m_7849487073109687248LPDescription910426" style=3D"font-size:14p=
x;max-height:100px;font-family:wf_segoe-ui_normal,&quot;Segoe UI&quot;,&quo=
t;Segoe WP&quot;,Tahoma,Arial,sans-serif;margin-bottom:12px;margin-right:8p=
x;overflow:hidden;color:rgb(102,102,102)">
If no seccomp policy is requested, then the built-in default policy in dock=
erd applies. This has no rule for &amp;quot;clone3&amp;quot; defined, nor a=
ny default errno defined. So when runc receives the con...</div>
<div id=3D"m_7849487073109687248LPMetadata910426" style=3D"font-size:14px;f=
ont-weight:400;font-family:wf_segoe-ui_normal,&quot;Segoe UI&quot;,&quot;Se=
goe WP&quot;,Tahoma,Arial,sans-serif;color:rgb(166,166,166)">
<a href=3D"http://github.com" target=3D"_blank" style=3D"font-family:wf_seg=
oe-ui_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-se=
rif">github.com</a></div>
</td>
</tr>
</tbody>
</table>
<div id=3D"m_7849487073109687248LPCloseButtonContainer910426" title=3D"Remo=
ve link preview" role=3D"button">
<i aria-hidden=3D"true" id=3D"m_7849487073109687248LPCloseButton910426">=EE=
=9C=91</i></div>
</div>
</div>
<br>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
[2]<a href=3D"https://sourceware.org/pipermail/libc-alpha/2021-August/13059=
0.html" id=3D"m_7849487073109687248LPlnk217615" target=3D"_blank" style=3D"=
font-family:Calibri,Arial,Helvetica,sans-serif">https://sourceware.org/pipe=
rmail/libc-alpha/2021-August/130590.html</a><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12pt=
;color:rgb(0,0,0)">
//Hongxu</div>
<div id=3D"m_7849487073109687248appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_7849487073109687248divRplyFwdMsg" dir=3D"ltr"><font face=3D"Ca=
libri, sans-serif" style=3D"font-size:11pt;font-family:Calibri,sans-serif;c=
olor:rgb(0,0,0)"><b style=3D"font-family:Calibri,sans-serif">From:</b> Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" style=3D"f=
ont-family:Calibri,sans-serif">raj.khem@gmail.com</a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Sent:</b> Wednesday, February 1=
6, 2022 12:17 AM<br>
<b style=3D"font-family:Calibri,sans-serif">To:</b> Jia, Hongxu &lt;<a href=
=3D"mailto:Hongxu.Jia@windriver.com" target=3D"_blank" style=3D"font-family=
:Calibri,sans-serif">Hongxu.Jia@windriver.com</a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Cc:</b> <a href=3D"mailto:opene=
mbedded-core@lists.openembedded.org" target=3D"_blank" style=3D"font-family=
:Calibri,sans-serif">openembedded-core@lists.openembedded.org</a> &lt;<a hr=
ef=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blank" st=
yle=3D"font-family:Calibri,sans-serif">openembedded-core@lists.openembedded=
.org</a>&gt;; Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoun=
dation.org" target=3D"_blank" style=3D"font-family:Calibri,sans-serif">rich=
ard.purdie@linuxfoundation.org</a>&gt;<br>
<b style=3D"font-family:Calibri,sans-serif">Subject:</b> Re: [OE-core] [PAT=
CH v3 1/3] glibc: Upgrade to 2.35 (RFC)</font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2" style=3D"color:rgb(0,0,0)"><span style=3D"font-size:1=
1pt">
<div>[Please note: This e-mail is from an EXTERNAL e-mail address]</div></s=
pan></font></div></div><div dir=3D"ltr"><div><font size=3D"2" style=3D"colo=
r:rgb(0,0,0)"><span style=3D"font-size:11pt"><div><br>
<br>
On Tue, Feb 15, 2022 at 12:25 AM Jia, Hongxu &lt;<a href=3D"mailto:Hongxu.J=
ia@windriver.com" target=3D"_blank">Hongxu.Jia@windriver.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; On 2/9/22 06:53, Khem Raj wrote:<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/glibc/glibc/0001-fix-create-thread-fail=
ed-in-unprivileged-process-BZ-.patch b/meta/recipes-core/glibc/glibc/0001-f=
ix-create-thread-failed-in-unprivileged-process-BZ-.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 3283dd7ad8a..00000000000<br>
&gt; --- a/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-u=
nprivileged-process-BZ-.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,79 +0,0 @@<br>
&gt; -From a8bc44936202692edcd82a48c07d7cf27d6ed8ee Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" targ=
et=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt; -Date: Sun, 29 Aug 2021 20:49:16 +0800<br>
&gt; -Subject: [PATCH] fix create thread failed in unprivileged process [BZ=
 #28287]<br>
&gt; -<br>
&gt; -Since commit [d8ea0d0168 Add an internal wrapper for clone, clone2 an=
d clone3]<br>
&gt; -applied, start a unprivileged container (docker run without --privile=
ged),<br>
&gt; -it creates a thread failed in container.<br>
&gt; -<br>
&gt; -In commit d8ea0d0168, it calls __clone3 if HAVE_CLONE3_WAPPER is defi=
ned.=C2=A0 If<br>
&gt; -__clone3 returns -1 with ENOSYS, fall back to clone or clone2.<br>
&gt; -<br>
&gt; -As known from [1], cloneXXX fails with EPERM if CLONE_NEWCGROUP,<br>
&gt; -CLONE_NEWIPC, CLONE_NEWNET, CLONE_NEWNS, CLONE_NEWPID, or CLONE_NEWUT=
S<br>
&gt; -was specified by an unprivileged process (process without CAP_SYS_ADM=
IN)<br>
&gt; -<br>
&gt; -[1] <a href=3D"https://man7.org/linux/man-pages/man2/clone3.2.html" t=
arget=3D"_blank">https://man7.org/linux/man-pages/man2/clone3.2.html</a><br=
>
&gt; -<br>
&gt; -So if __clone3 returns -1 with EPERM, fall back to clone or clone2 co=
uld<br>
&gt; -fix the issue. Here are the test steps:<br>
&gt; -<br>
&gt;<br>
&gt; Hi RP,<br>
&gt;<br>
&gt;<br>
&gt; I found this local patch was removed from glibc, we have to get it bac=
k and regenerate uninative to avoid the thread creation failure in=C2=A0 un=
privileged container<br>
&gt;<br>
<br>
I intentionally dropped it since upstream glibc will not accept this<br>
patch since its not glibc problem but<br>
rather container runtime problem. Can you investigate that path before<br>
we reapply it. Maintaining a rejected patch is last thing we want to<br>
do.<br>
<br>
&gt;<br>
&gt; //Hongxu<br>
</div>
</span></font></div>
</div>

</blockquote></div></div>

--0000000000006995fc05d81ace19--

