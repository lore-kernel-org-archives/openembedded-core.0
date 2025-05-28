Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F4AC54ED1
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 01:05:04 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.5497.1748394296826134205
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 18:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=SmK7oJXZ;
 spf=pass (domain: limonsoftware.com, ip: 209.85.128.171, mailfrom: anibal@limonsoftware.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70825de932bso4597777b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 18:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1748394296; x=1748999096; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7ghyp1hyTTmJ0GQPz0HFRMRVzF0I6lXV2vpswDRqS4U=;
        b=SmK7oJXZaiR7SxmmGP/qui3B9905VoXzqBIA1xx0zbwOG4z0ZLsZAPcGlw/DXZNYnB
         VnGhidf+CANDbSl9t5YCsh5dAZg8vKlcT0JLIlYzzbD9jEWQnWYISzJdOUseTEL6GOG1
         0psI+6tRqAX6Ys6rSLHkBP5ahR/1EhCB02vzxCFD935qM9WUrTIwKgvWe6CbiQB1P9IW
         Mrr2Ta96oqebC1Gv0M/7w5QSOEuPt89LRMsaUjPNoSUSGjCnKkz1fCJGLLiAyvQcSB6h
         iWIttzulvnxxCZqtmsDB85Pj9NdortpvzTBbQNpcB4HjZETSSJfJFBUrGVguSBZxd1v0
         PcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748394296; x=1748999096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ghyp1hyTTmJ0GQPz0HFRMRVzF0I6lXV2vpswDRqS4U=;
        b=JJiYy5C2HNDDbUXCnwZshqUF29Q0jGDnSXj7TkuyiAsFir5aH+AtoHh0lseaPBNJbW
         At2FqS4E/7BFh/xm93GsfWPXxMh5CWIpLUUEU3PNoPE6/57TfWvFf0csSblQzudC7/m7
         Apf+AmHx30LoU6kXe2qBlxoBmPN+jF+mIpbhaBCpjE9SJ5ndYkUi4C4tL316GawqfhtA
         mg6OB3QzKgz5sHr9iy/5cTnW0fpdTIh4Yx6gbvwXBu77PnngCFRaJ/Li8GD9eSNEMePz
         VkfIuyIMIKGv2NyiQzr4XSxSIFGuvQh94o/mIzsGj9SOEbI4pVU5HcR7CAfKGpDEx4tX
         hiew==
X-Forwarded-Encrypted: i=1; AJvYcCUQ9oV3HDo3nMx+9LmLgAqDmVWQU1qs4Wn2DKtPGhHSWpdrqAB+PGp09ZwXWup+P74KL2eM8lEkNlJIRr0CKdtPag==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx9trDnVRn/JUOY9YtmCx4U92z+UnRGZUz1E8DI9RmBpaRfbth2
	4CTeUZvKp0asoOWBN93kpi67LnuZ0smrLgJnH7acw9fgsmVbaoN1R/IJ5hoxOwKIxN95pYEkyjU
	EGBjKfn/pjbvg/80rYlepMkxKJHHgiYSqat9dwetSEA==
X-Gm-Gg: ASbGncsVYE6NNIAXbenz/Gouhv/tTp68jQ9w04Zn30X9epZj7ZuWVULVdXeuFDNehNE
	1dkmy3QCh8U9NJ+Al7fOS/ZSJV2MwuveeImKX+IrKtFjqC5rXMuSd7JXOfaiNVMgesE7tT5IOpZ
	OYQlMQqEdbSJHTbedrSzvmweFyj+xmVe91ccg=
X-Google-Smtp-Source: AGHT+IHjcTE8UNq9COdhAtar/rwZhV6rsh8B2Y4zrvAOmQ5q80QnkNmj3C7tqg0sBltS5Y0BLFdUFdo54/cRk9BlzYY=
X-Received: by 2002:a05:690c:f8f:b0:70c:c20a:89a5 with SMTP id
 00721157ae682-70e8350df33mr39643457b3.19.1748394295847; Tue, 27 May 2025
 18:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240323195304.2909926-1-anibal@limonsoftware.com>
 <20240323195304.2909926-2-anibal@limonsoftware.com> <20240325101809ec807440@mail.local>
 <17C008DA5E69D9E5.27941@lists.openembedded.org> <183C6D415DE5406F.22941@lists.openembedded.org>
 <CAOU5ZMu4ysbugdvOJ4Q1YqVK4nD8frX_wAeo-mSJXRCG3tTQFA@mail.gmail.com>
 <fa7b5f9f72d23b279f8d933a7ccf4d40c629e381.camel@linuxfoundation.org>
 <CAOU5ZMtUY=pP_U+nhdyNDkKS-cGctG1ymEAXqQ6iMe4bFdEBCw@mail.gmail.com>
 <be0202a16d696f29ac3c583ad764813a98e96b68.camel@linuxfoundation.org> <18436D8E0CEF2CEC.13855@lists.openembedded.org>
In-Reply-To: <18436D8E0CEF2CEC.13855@lists.openembedded.org>
From: Anibal Limon <anibal@limonsoftware.com>
Date: Tue, 27 May 2025 19:04:45 -0600
X-Gm-Features: AX0GCFsCrLP-zRCBjuN5ssiHSGDR8Cl1qmIN95KrRL1T_39-lJ8M6TY2_0g0THc
Message-ID: <CAOU5ZMuigVYBc5VTTaCUiGO8q0qQCuxpVXVQeXWn8jf0=F6g6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] wic: plugins source bootimage/isoimage
 rename to allow be imported
To: anibal@limonsoftware.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	bruce.ashfield@gmail.com
Content-Type: multipart/alternative; boundary="000000000000ee82b5063627c471"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 01:05:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217327

--000000000000ee82b5063627c471
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Update, I cannot reproduce meta-intel and meta-arm, I will look at
autobuilder full config to see if I found something I missed.

On Tue, May 27, 2025 at 9:58=E2=80=AFAM Anibal Limon via lists.openembedded=
.org
<anibal=3Dlimonsoftware.com@lists.openembedded.org> wrote:

> I will fix the failures and add the proper migration doc to the patch.
>
> Thanks!,
> Anibal
>
> On Tue, May 27, 2025 at 2:04=E2=80=AFAM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> Hi Anibal,
>>
>> On Mon, 2025-05-26 at 10:30 -0600, Anibal Limon wrote:
>> > Yeah, I understand, let me know any further breakage I can fix.
>>
>> I have patches for oe-core and meta-yocto to fix the issues there.
>> meta-virtualization fails, I believe you have fixes for that. meta-arm
>> and meta-intel also showed issues:
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/1599
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/41/builds/1561
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/1574
>>
>> I think the missing pieces to get this merged are:
>>
>> * A note for the migration guide explaining what changed and how to fix
>> it
>>
>> * A tweak to wic to warn about "-" characters in the plugin name. This
>> might be able to translate "-" to "_" with a warning to allow some kind
>> of slightly easier migration? At the very least we should give users a
>> better error with a hint about how to fix it.
>>
>> Cheers,
>>
>> Richard
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217313):
> https://lists.openembedded.org/g/openembedded-core/message/217313
> Mute This Topic: https://lists.openembedded.org/mt/105108998/8181911
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> anibal@limonsoftware.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ee82b5063627c471
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Update, I cannot reproduce meta-intel and meta-arm, I will=
 look at autobuilder full config to see if I found something I missed.</div=
><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, May 27, 2025 at 9:58=E2=80=AFAM Anibal Limon via <=
a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;ani=
bal=3D<a href=3D"mailto:limonsoftware.com@lists.openembedded.org">limonsoft=
ware.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>I will fix the failu=
res and add the proper migration doc to the patch.</div><div><br></div><div=
>Thanks!,</div><div>Anibal</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Tue, May 27, 2025 at 2:04=E2=80=AFAM Ric=
hard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" targe=
t=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hi Anibal,<br>
<br>
On Mon, 2025-05-26 at 10:30 -0600, Anibal Limon wrote:<br>
&gt; Yeah, I=C2=A0understand, let me know any further breakage I can fix.<b=
r>
<br>
I have patches for oe-core and meta-yocto to fix the issues there.<br>
meta-virtualization fails, I believe you have fixes for that. meta-arm<br>
and meta-intel also showed issues:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/buil=
ds/1599" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/75/builds/1599</a><br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/41/buil=
ds/1561" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/41/builds/1561</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/buil=
ds/1574" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/89/builds/1574</a><br>
<br>
I think the missing pieces to get this merged are:<br>
<br>
* A note for the migration guide explaining what changed and how to fix<br>
it<br>
<br>
* A tweak to wic to warn about &quot;-&quot; characters in the plugin name.=
 This<br>
might be able to translate &quot;-&quot; to &quot;_&quot; with a warning to=
 allow some kind<br>
of slightly easier migration? At the very least we should give users a<br>
better error with a hint about how to fix it.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#217313): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/217313" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/217313</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105108998/818=
1911" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105108998/8181911</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:anibal@limonsoftware.com" =
target=3D"_blank">anibal@limonsoftware.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000ee82b5063627c471--

