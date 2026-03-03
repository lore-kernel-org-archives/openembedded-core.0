Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A0FEDA6A6
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 16:52:20 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23368.1772556731281851207
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 08:52:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dCT97qWw;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ae613edd6dso3897845ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 08:52:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772556731; cv=none;
        d=google.com; s=arc-20240605;
        b=CJgZ/JZuJQ1TfSssdVShs8cFiE6eyk9j5JOtXo5TJnGUZkxnODce3/6KfASUk15nRh
         1SzrSzVxH0DrLHE/8WsGLyDU4BhfyieWKP69CPqE3bmjHLRcnTheKALx7naSGjWpTqkI
         uQlHQBRn6KhNjt3T01KK9oNUgmiJXIaOFQklrRzz3D8kr2W24M2Kx0OPB7X6Oq6rx2fP
         6UfVqRLd+x0FbOBI6M2DoSxGp826weK2RVzUvYgYi2qKjVZN75hwcivldIz6HuKO5w/X
         of7V8QFb5HrslfdGriIhZ2ag2FXXThK7WQn3c4WSdbrL7acJLnlbuk8RXvCs4Y6KJec/
         OQuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CyZ2zD2/lbmQ7Kq50w/wjL2cDKh8yOfPHPQTOeTQgkE=;
        fh=nBoPp0sSc05hcM2ri6N5B9ShhmNvHUpj5oFMBDSpCtY=;
        b=eElpVY1Tk/Y4fanniCeGdXn0cfivjOWZbXvb6xqDuyAoUZU9dZ3A/8bdbkucA6TfR5
         cO/1ibSdIy6njNqovRUMma9p7kXOIRwWGpM99WCKz3bYBB2233TPHaklGpadt9K/0kk/
         JoQYTPMF80W3FXAvGhhi9fLyQE7l7dgrf+Xaf3wn15myRpyOE0BKzSLCP2crjQcXk5g0
         BQwIaQHRWIK+OkQCmJJ2SjpIniF6vrfuKV0TcFfT42QA79pRNbebmDavyVJ/fpKHSLqZ
         kdlUhxQ8ek9WJSazd4rac9F7xjF1+rs0XgDVLmP/rSVm+yRybpJrAa/71isj8SGkVjbo
         PhQA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772556731; x=1773161531; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CyZ2zD2/lbmQ7Kq50w/wjL2cDKh8yOfPHPQTOeTQgkE=;
        b=dCT97qWwOPm4bhZjRO2Vzl8YBdwk5lMSjfnqefE1NPyUfGHmQ87ZFI9ZW6r39lmjV8
         aLhWmKeCqZoeMBtsedoG68S8mGyWRcBOhClS5l+wY2sx1jR113sbi1faWzn1oKTLHQ3r
         JY+1OAPdiHlwzmUJBO3XY9jqrFL7fAN/Y6d6PnUw+fw5/4L3AYvVcz/CPWCk05Cj+0R6
         HwnCll9sASohqbRHmjoyr8pDgKazubU/h4WxfdTXxlq6fQsgTRNnaQpj2HkJIPlGurgp
         XEaLOe3+qzYCT8RPzAJ28vo02vj3lkgO26GyOEZ0ruYqg0D+w36y8kyUr6SyEiEu+hCA
         Ek7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772556731; x=1773161531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CyZ2zD2/lbmQ7Kq50w/wjL2cDKh8yOfPHPQTOeTQgkE=;
        b=fIXBvYwHXgtsagaVFddn+1Hu9FmUG5B6OQSyB8zPdphcTwru15OVAYpub7sYLfcHFo
         0Z0zN1bzcW2pYpS1FMLIFclD+W05CpkCKBV5Hjhbp5hkyK3jB1vIq02XTIICDYZbZ4iW
         JEYTaIXtVMJFS/I6XF6tQ+ZKNeeEHCBu+8jbZI7wPQieEofYHOjoNRQScW1PuztBHaa2
         Caa3Sym9HbgFmQvT9Uhf6XkokMPdof0jrEq2ehJisl/oV4vvw4AHcupNHviIR/n4fyW7
         WlH3yfDgSEG9hCGl3t5gW1zErEVWjlhVxDAruK2g2qjvloOEZTqmgdnCkdthTb7xX6gG
         8oTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrCZRAu3nU/G0Hd2qY+9uH2/a4aoiMNDlZ1OcSJ/0pqKdIFT2f+YATyrh1rKf1pu70QKDOFcO35NjXCiWTljLwzA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxkw0ZzpHQIrIAwWY8CV2iisGUy1Vb5WClB/5oR5CSvKrCsXF8Y
	+kxsVQ8PFzLihl4yrcsl2VxSPSoYSBatX0Y80QMvRtyEWQz7HCbvXsWJbW+Revcy6TQMemV3MMe
	3bmnnoI3WKWNo/8wYUEpmbGwoebVFqNw=
X-Gm-Gg: ATEYQzwYxDYt9QmIQR86w7w198qnPjX3DOPugR0Z5SylXoIGyaRGf2K+jkqtS+uNUbb
	4mNYWAkdBrKJrBSvdO72uJf5fRkHUkShyLGHh1YrmC3jvZ4L9zWk/hhZm44smXOOfbANfmkv+4H
	NP7wQlGffYrKPK85sgTRrU8HCTYndLWnCTK6D0jZWcHQn2CPTiOEZVwl0igIlT5czV8KQcp2mkh
	qAfPIfBT3QrF8fmhfNQI5sclU2pKzUn+GNoIe20RIat0Tvh+5HUZdZL+0ihTuPsiuBKu7qU+J2M
	qTImGeEpixqeCU0zO+0tbJiA8PCoAEvsn9gCpR4G
X-Received: by 2002:a17:902:f543:b0:2a9:4698:2577 with SMTP id
 d9443c01a7336-2ae2e3e3cc8mr163040685ad.2.1772556730527; Tue, 03 Mar 2026
 08:52:10 -0800 (PST)
MIME-Version: 1.0
References: <20260302045537.2153587-1-bruce.ashfield@gmail.com>
 <DGT0JZJJG1TR.2WO974AGZDT6G@bootlin.com> <189958586931912C.918325@lists.openembedded.org>
In-Reply-To: <189958586931912C.918325@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Mar 2026 11:52:02 -0500
X-Gm-Features: AaiRm52eaCDET2B4vcgzW0oUvurLrgQHGm73hfLOpe3JZ2fqHWA1ZIk10oo4QGE
Message-ID: <CADkTA4Nb6WaprrDTgst8kKZd_o4dkARSY3CQUrqiEb168BJZPQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/10] linux-yocto: consolidated / combined pull request
To: bruce.ashfield@gmail.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000447347064c21864d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 16:52:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232330

--000000000000447347064c21864d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 8:37=E2=80=AFAM Bruce Ashfield via lists.openembedde=
d.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:

>
>
> On Tue, Mar 3, 2026 at 3:44=E2=80=AFAM Mathieu Dubois-Briand <
> mathieu.dubois-briand@bootlin.com> wrote:
>
>> On Mon Mar 2, 2026 at 5:55 AM CET, Bruce Ashfield via
>> lists.openembedded.org wrote:
>> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
>> >
>> > Richard,
>> >
>> > Here's the next set of -stable update for 6.18.
>> >
>> > 7.0 will be the dev kernel shortly, just waiting for -rc2 on it
>> > before pushing the changes.
>> >
>> > Also note that this is again a combined oe-core, yocto-bsp pull
>> > request. I've keep the numbering 0-N to hopefully lore/b4 won't
>> > miss things.
>> >
>> > If this doesn't work (the formatting), I'll just go to different
>> > sends for the different repos.
>> >
>> > Bruce
>> >
>> > openembedded-core (7):
>> >   linux-yocto/6.18: update to v6.18.9
>> >   linux-yocto/6.18: update CVE exclusions (6.18.9)
>> >   linux-yocto/6.18: update to v6.18.11
>> >   linux-yocto/6.18: update CVE exclusions (6.18.11)
>> >   linux-yocto/6.16: genericarm64: feature splits and enablement
>> >   linux-yocto/6.18: update to v6.18.13
>> >   linux-yocto/6.18: update CVE exclusions (6.18.13)
>> >
>> > meta-yocto (3):
>> >   yocto-bsp: update to v6.18.9
>> >   yocto-bsp: update to v6.18.11
>> >   yocto-bsp: update to v6.18.13
>> >
>> >  openembedded-core:
>> >  meta/recipes-kernel/linux/cve-exclusion_6.18.inc   | 306
>> ++++++++++++++++++++-
>> >  meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   |   6 +-
>> >  meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb |   6 +-
>> >  meta/recipes-kernel/linux/linux-yocto_6.18.bb      |  24 +-
>> >  4 files changed, 313 insertions(+), 29 deletions(-)
>> >
>> >  meta-yocto:
>> >  meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Hi Bruce,
>>
>> Thanks for your patches. Looks fine on the autobuilder, except for a
>> single warning on arm64:
>>
>> WARNING: linux-yocto-6.18.13+git-r0 do_kernel_configcheck: [kernel
>> config]: This BSP contains fragments with warnings:
>>
>> [INFO]: the following symbols were not found in the active configuration=
:
>>      - CONFIG_PINCTRL_SM8350_LPASS_LPI
>>
>
> I'll have a look!
>
>
Patch sent.

Bruce



> Bruce
>
>
>
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/3303
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/3277
>>
>> Thanks,
>> Mathieu
>>
>> --
>> Mathieu Dubois-Briand, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232315):
> https://lists.openembedded.org/g/openembedded-core/message/232315
> Mute This Topic: https://lists.openembedded.org/mt/118089091/1050810
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

--000000000000447347064c21864d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 3, 2026 at 8:37=
=E2=80=AFAM Bruce Ashfield via <a href=3D"http://lists.openembedded.org">li=
sts.openembedded.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@l=
ists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 3, 2026 =
at 3:44=E2=80=AFAM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubo=
is-briand@bootlin.com" target=3D"_blank">mathieu.dubois-briand@bootlin.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Mon Mar 2, 2026 at 5:55 AM CET, Bruce Ashfield via <a href=3D"http://list=
s.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded=
.org</a> wrote:<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Richard,<br>
&gt;<br>
&gt; Here&#39;s the next set of -stable update for 6.18.<br>
&gt;<br>
&gt; 7.0 will be the dev kernel shortly, just waiting for -rc2 on it<br>
&gt; before pushing the changes.<br>
&gt;<br>
&gt; Also note that this is again a combined oe-core, yocto-bsp pull<br>
&gt; request. I&#39;ve keep the numbering 0-N to hopefully lore/b4 won&#39;=
t<br>
&gt; miss things.<br>
&gt;<br>
&gt; If this doesn&#39;t work (the formatting), I&#39;ll just go to differe=
nt<br>
&gt; sends for the different repos.<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt; openembedded-core (7):<br>
&gt;=C2=A0 =C2=A0linux-yocto/6.18: update to v6.18.9<br>
&gt;=C2=A0 =C2=A0linux-yocto/6.18: update CVE exclusions (6.18.9)<br>
&gt;=C2=A0 =C2=A0linux-yocto/6.18: update to v6.18.11<br>
&gt;=C2=A0 =C2=A0linux-yocto/6.18: update CVE exclusions (6.18.11)<br>
&gt;=C2=A0 =C2=A0linux-yocto/6.16: genericarm64: feature splits and enablem=
ent<br>
&gt;=C2=A0 =C2=A0linux-yocto/6.18: update to v6.18.13<br>
&gt;=C2=A0 =C2=A0linux-yocto/6.18: update CVE exclusions (6.18.13)<br>
&gt;<br>
&gt; meta-yocto (3):<br>
&gt;=C2=A0 =C2=A0yocto-bsp: update to v6.18.9<br>
&gt;=C2=A0 =C2=A0yocto-bsp: update to v6.18.11<br>
&gt;=C2=A0 =C2=A0yocto-bsp: update to v6.18.13<br>
&gt;<br>
&gt;=C2=A0 openembedded-core:<br>
&gt;=C2=A0 meta/recipes-kernel/linux/cve-exclusion_6.18.inc=C2=A0 =C2=A0| 3=
06 ++++++++++++++++++++-<br>
&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.18.=
bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.18.bb</a>=C2=A0 =
=C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.1=
8.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.18.bb</a> |=
=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.18.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.18.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 24 +-<br>
&gt;=C2=A0 4 files changed, 313 insertions(+), 29 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 meta-yocto:<br>
&gt;=C2=A0 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | =
2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
Hi Bruce,<br>
<br>
Thanks for your patches. Looks fine on the autobuilder, except for a<br>
single warning on arm64:<br>
<br>
WARNING: linux-yocto-6.18.13+git-r0 do_kernel_configcheck: [kernel config]:=
 This BSP contains fragments with warnings:<br>
<br>
[INFO]: the following symbols were not found in the active configuration:<b=
r>
=C2=A0 =C2=A0 =C2=A0- CONFIG_PINCTRL_SM8350_LPASS_LPI<br></blockquote><div>=
<br></div><div><div style=3D"font-size:small">I&#39;ll have a look!</div><d=
iv style=3D"font-size:small"><br></div></div></div></div></blockquote><div>=
<br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Patch=
 sent.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div class=3D"gmail_quote"><div><div style=3D"font-size:small">=
</div><div style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/buil=
ds/3303" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/22/builds/3303</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/buil=
ds/3277" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/60/builds/3277</a><br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#232315): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/232315" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/232315</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118089091/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118089091/1050810</a><br>
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

--000000000000447347064c21864d--

