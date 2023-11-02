Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A9EC4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 07:05:36 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.25549.1698908726802645852
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 00:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gc9KxahN;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-32f9268bf8cso319074f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 00:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698908725; x=1699513525; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZP0blDri8J0PuKUpbYQWO9koTU9Iot9GFyBQVvO6h3o=;
        b=gc9KxahNg488qLDEFLlWwTRN86PJ+Fp6pNWrmhuGEyDLBna8NbNh5gP1PplpZpSkfx
         q5j4bKBTnJf/N17yyMK+CfMNJNecuNsskwPuUUQJJ+qAX0DJD/GUfs8QcIARePt31kiz
         bDCLLO/cl5sRYhFklLWtPLXlY8QVEYJMAo4kaegRxDLyGHTi3QhTKMjcMRnR17pHJ1zS
         2alSH0Lv79tqoqPVV3pXej45jxMZGWVQFzfgkaXWQw+pt9pIEydZlVgAHafr6Hs7BfgD
         1XwDvqqJr0ZcWPg5srh1qQGOSsBozKGvXUQAcj6LXoDXIyyalzziw/Bt4Jb5jNv+BEEw
         BzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698908725; x=1699513525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZP0blDri8J0PuKUpbYQWO9koTU9Iot9GFyBQVvO6h3o=;
        b=Zz15Jd0l0KAPtlcH6mWXr5jRs4TQmR4QQlWAOpDXgEo8DgWPjEnw3Xri2jkHDVdlHF
         PFxiBi1GTkIHv7IbAo7OduGSvz7f447Vu9n4LLdzYpRk7jaU0IB0In1/slopZCu5aSTy
         PFVX03Rp9vebBEWtE5K4rO6j0KQHRrVSajK6Boc6YjaQpfdZJEeriUV9brKnNoNAOVdF
         RvOQp6sb03b0vx6FDQnLoW5aqjWr2WL+4tJB4iIjePl4mZwlIRNzQIrqqNgrNBBH2ku5
         ElWX2QvL2gKgwnEpoEBUKV0kjen7qgnIL7KFNxdC8kVZsuXY/IdnY6eOjujMguLMGMRe
         47iw==
X-Gm-Message-State: AOJu0YxzS+KNcE1OUbvrIDSQt0OtdMFvb9IomHKPx2yMfmNtZT1lmT1n
	NCVFR9dI7h5n92TQIhuAA7u8cEuEg183H+sg/wAf/J+wlIo=
X-Google-Smtp-Source: AGHT+IHGgf+4843JJ0Gm2QViNmjvXGGuYdknc+c9JRF8O//82AdrodctyAWgWpqHmkj4YWInrPLnjD4z02IbshxIXMg=
X-Received: by 2002:adf:d1cb:0:b0:32f:8966:c39c with SMTP id
 b11-20020adfd1cb000000b0032f8966c39cmr8473498wrd.71.1698908724776; Thu, 02
 Nov 2023 00:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1698789786.git.steve@sakoman.com> <4dcd5e0a0bb43c23850e3a711fc7e2230575d245.1698789786.git.steve@sakoman.com>
 <CA+chaQeAGGEAYu8tnrsgyEN39+TNtYi6HJoGc4bfyDGjBiTpnQ@mail.gmail.com>
 <CAOSpxdYupYx4Uq736FgTggURgU3P_eHe-PGnd9MG0oohc-Paqw@mail.gmail.com> <BYAPR11MB3397809D4D1751D29D25586C81A6A@BYAPR11MB3397.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB3397809D4D1751D29D25586C81A6A@BYAPR11MB3397.namprd11.prod.outlook.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 2 Nov 2023 08:05:11 +0100
Message-ID: <CA+chaQfGm6Fem6wo99DY7YQi-G9AqQ8Suvhwe43A449fTysG9g@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 3/3] libwebp: Fix CVE-2023-4863
To: "Sambu, Soumya" <Soumya.Sambu@windriver.com>
Cc: "steve@sakoman.com" <steve@sakoman.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000bd32906092603e3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 07:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190058

--0000000000000bd32906092603e3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 2, 2023 at 7:57=E2=80=AFAM Sambu, Soumya <Soumya.Sambu@windrive=
r.com>
wrote:

> Hi Martin, Steve,
>
> Debian has mentioned
> https://chromium.googlesource.com/webm/libwebp.git/+/95ea5226c87044952224=
0ccff26f0b006037c520%5E%21/#F0 as
> followup commit for CVE-2023-4863 [Reference:
> https://security-tracker.debian.org/tracker/CVE-2023-4863].
>
> This commit was suggested in Bugzilla SUSE as well -
> https://bugzilla.suse.com/show_bug.cgi?id=3D1215231#c13
>

Aha, thanks for this information, can you please make sure that all
supported branches receive this additional commit (preferably in less
confusing set of .patch files, e.g. apply both from CVE-2023-4863.patch and
remove CVE-2023-5129.patch)?


>
> Regards,
> Soumya
> ------------------------------
> *From:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> on behalf of Steve Sakoman via
> lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> *Sent:* Wednesday, November 1, 2023 7:21 PM
> *To:* Martin Jansa <martin.jansa@gmail.com>
> *Cc:* openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core][kirkstone 3/3] libwebp: Fix CVE-2023-4863
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d
> know the content is safe.
>
> Thanks for reviewing Martin!
>
> I'll drop this patch until there is further clarification on the need for
> it.
>
> Steve
>
> On Tue, Oct 31, 2023 at 1:39=E2=80=AFPM Martin Jansa <martin.jansa@gmail.=
com>
> wrote:
> >
> > I'm surprised this one does apply in kirkstone as there is this securit=
y
> issue already fixed as 2023-5129 (see dunfell commit
> https://git.openembedded.org/openembedded-core/commit/?h=3Ddunfell&id=3D7=
dce529515baa843ba3e5c89b2ad605b9845c59b
> and a bit more details in
> https://lists.openembedded.org/g/openembedded-core/message/189262 )
> >
> > Is
> https://github.com/webmproject/libwebp/commit/95ea5226c870449522240ccff26=
f0b006037c520
> really related to CVE-2023-4863 ?
> >
> > On Tue, Oct 31, 2023 at 11:05=E2=80=AFPM Steve Sakoman <steve@sakoman.c=
om>
> wrote:
> >>
> >> From: Soumya Sambu <soumya.sambu@windriver.com>
> >>
> >> Heap buffer overflow in WebP in Google Chrome prior to
> >> 116.0.5845.187 allowed a remote attacker to perform an
> >> out of bounds memory write via a crafted HTML page.
> >>
> >> References:
> >> https://nvd.nist.gov/vuln/detail/CVE-2023-4863
> >> https://security-tracker.debian.org/tracker/CVE-2023-4863
> >> https://bugzilla.redhat.com/show_bug.cgi?id=3D2238431#c12
> >>
> >> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> >> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> >> ---
> >>  .../webp/files/CVE-2023-4863.patch            | 53 ++++++++++++++++++=
+
> >>  meta/recipes-multimedia/webp/libwebp_1.2.4.bb |  1 +
> >>  2 files changed, 54 insertions(+)
> >>  create mode 100644
> meta/recipes-multimedia/webp/files/CVE-2023-4863.patch
> >>
> >> diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch
> b/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch
> >> new file mode 100644
> >> index 0000000000..2b1817822c
> >> --- /dev/null
> >> +++ b/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch
> >> @@ -0,0 +1,53 @@
> >> +From 95ea5226c870449522240ccff26f0b006037c520 Mon Sep 17 00:00:00 200=
1
> >> +From: Vincent Rabaud <vrabaud@google.com>
> >> +Date: Mon, 11 Sep 2023 16:06:08 +0200
> >> +Subject: [PATCH] Fix invalid incremental decoding check.
> >> +
> >> +The first condition is only necessary if we have not read enough
> >> +(enough being defined by src_last, not src_end which is the end
> >> +of the image).
> >> +The second condition now fits the comment below: "if not
> >> +incremental, and we are past the end of buffer".
> >> +
> >> +BUG=3Doss-fuzz:62136
> >> +
> >> +Change-Id: I0700f67c62db8e1c02c2e429a069a71e606a5e4f
> >> +
> >> +CVE: CVE-2023-4863
> >> +
> >> +Upstream-Status: Backport [
> https://github.com/webmproject/libwebp/commit/95ea5226c870449522240ccff26=
f0b006037c520
> ]
> >> +
> >> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> >> +---
> >> + src/dec/vp8l_dec.c | 15 +++++++++++++--
> >> + 1 file changed, 13 insertions(+), 2 deletions(-)
> >> +
> >> +diff --git a/src/dec/vp8l_dec.c b/src/dec/vp8l_dec.c
> >> +index 186b0b2..59a9e64 100644
> >> +--- a/src/dec/vp8l_dec.c
> >> ++++ b/src/dec/vp8l_dec.c
> >> +@@ -1241,9 +1241,20 @@ static int DecodeImageData(VP8LDecoder* const
> dec, uint32_t* const data,
> >> +   }
> >> +
> >> +   br->eos_ =3D VP8LIsEndOfStream(br);
> >> +-  if (dec->incremental_ && br->eos_ && src < src_end) {
> >> ++  // In incremental decoding:
> >> ++  // br->eos_ && src < src_last: if 'br' reached the end of the
> buffer and
> >> ++  // 'src_last' has not been reached yet, there is not enough data.
> 'dec' has to
> >> ++  // be reset until there is more data.
> >> ++  // !br->eos_ && src < src_last: this cannot happen as either the
> buffer is
> >> ++  // fully read, either enough has been read to reach 'src_last'.
> >> ++  // src >=3D src_last: 'src_last' is reached, all is fine. 'src' ca=
n
> actually go
> >> ++  // beyond 'src_last' in case the image is cropped and an LZ77 goes
> further.
> >> ++  // The buffer might have been enough or there is some left.
> 'br->eos_' does
> >> ++  // not matter.
> >> ++  assert(!dec->incremental_ || (br->eos_ && src < src_last) || src >=
=3D
> src_last);
> >> ++  if (dec->incremental_ && br->eos_ && src < src_last) {
> >> +     RestoreState(dec);
> >> +-  } else if (!br->eos_) {
> >> ++  } else if ((dec->incremental_ && src >=3D src_last) || !br->eos_) =
{
> >> +     // Process the remaining rows corresponding to last row-block.
> >> +     if (process_func !=3D NULL) {
> >> +       process_func(dec, row > last_row ? last_row : row);
> >> +--
> >> +2.40.0
> >> diff --git a/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
> b/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
> >> index 4defdd5e42..0728ca60f5 100644
> >> --- a/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
> >> +++ b/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
> >> @@ -16,6 +16,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6e8dee932=
c26f2dab503abf70c96d8bb
> \
> >>  SRC_URI =3D "http://downloads.webmproject.org/releases/webp/${BP}.tar=
.gz
> \
> >>             file://CVE-2023-1999.patch \
> >>             file://CVE-2023-5129.patch \
> >> +           file://CVE-2023-4863.patch \
> >>             "
> >>  SRC_URI[sha256sum] =3D
> "7bf5a8a28cc69bcfa8cb214f2c3095703c6b73ac5fba4d5480c205331d9494df"
> >>
> >> --
> >> 2.34.1
> >>
> >>
> >>
> >>
>

--0000000000000bd32906092603e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Nov 2, 2023 at 7:57=E2=80=AFAM Sa=
mbu, Soumya &lt;<a href=3D"mailto:Soumya.Sambu@windriver.com">Soumya.Sambu@=
windriver.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div class=3D"msg167054636337170177=
">




<div dir=3D"ltr">
<div><span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServic=
e,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">Hi Martin, =
Steve,<br>
<br>
Debian has mentioned <a href=3D"https://chromium.googlesource.com/webm/libw=
ebp.git/+/95ea5226c870449522240ccff26f0b006037c520%5E%21/#F0" id=3D"m_16705=
4636337170177LPlnk745157" target=3D"_blank">
https://chromium.googlesource.com/webm/libwebp.git/+/95ea5226c870449522240c=
cff26f0b006037c520%5E%21/#F0</a>=C2=A0as followup commit for CVE-2023-4863 =
[Reference:
<a href=3D"https://security-tracker.debian.org/tracker/CVE-2023-4863" id=3D=
"m_167054636337170177LPlnk418416" target=3D"_blank">
https://security-tracker.debian.org/tracker/CVE-2023-4863</a>].<br>
<br>
</span></div>
<div><span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServic=
e,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">This commit=
 was suggested in Bugzilla SUSE as well -
<a href=3D"https://bugzilla.suse.com/show_bug.cgi?id=3D1215231#c13" id=3D"m=
_167054636337170177LPlnk998146" target=3D"_blank">
https://bugzilla.suse.com/show_bug.cgi?id=3D1215231#c13</a></span></div></d=
iv></div></blockquote><div><br></div><div>Aha, thanks for this information,=
 can you please make sure that all supported branches receive this addition=
al commit (preferably in less confusing set of .patch files, e.g. apply bot=
h from CVE-2023-4863.patch and remove CVE-2023-5129.patch)?</div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg167=
054636337170177"><div dir=3D"ltr"><div><span style=3D"font-family:Aptos,Apt=
os_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif;font-size:=
12pt;color:rgb(0,0,0)"><br>
<br>
Regards,
<div>Soumya</div>
</span></div>
<div id=3D"m_167054636337170177appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_167054636337170177divRplyFwdMsg" dir=3D"ltr"><font face=3D"Cal=
ibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b> <=
a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_blank=
">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"mailto:openem=
bedded-core@lists.openembedded.org" target=3D"_blank">openembedded-core@lis=
ts.openembedded.org</a>&gt; on behalf of Steve Sakoman via <a href=3D"http:=
//lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a>
 &lt;steve=3D<a href=3D"mailto:sakoman.com@lists.openembedded.org" target=
=3D"_blank">sakoman.com@lists.openembedded.org</a>&gt;<br>
<b>Sent:</b> Wednesday, November 1, 2023 7:21 PM<br>
<b>To:</b> Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" targe=
t=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"m=
ailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembed=
ded-core@lists.openembedded.org</a>&gt;<br>
<b>Subject:</b> Re: [OE-core][kirkstone 3/3] libwebp: Fix CVE-2023-4863</fo=
nt>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>CAUTION: This email comes from a non Wind River email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
Thanks for reviewing Martin!<br>
<br>
I&#39;ll drop this patch until there is further clarification on the need f=
or it.<br>
<br>
Steve<br>
<br>
On Tue, Oct 31, 2023 at 1:39=E2=80=AFPM Martin Jansa &lt;<a href=3D"mailto:=
martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; I&#39;m surprised this one does apply in kirkstone as there is this se=
curity issue already fixed as 2023-5129 (see dunfell commit
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?h=3Ddunfe=
ll&amp;id=3D7dce529515baa843ba3e5c89b2ad605b9845c59b" target=3D"_blank">
https://git.openembedded.org/openembedded-core/commit/?h=3Ddunfell&amp;id=
=3D7dce529515baa843ba3e5c89b2ad605b9845c59b</a> and a bit more details in
<a href=3D"https://lists.openembedded.org/g/openembedded-core/message/18926=
2" target=3D"_blank">https://lists.openembedded.org/g/openembedded-core/mes=
sage/189262</a> )<br>
&gt;<br>
&gt; Is <a href=3D"https://github.com/webmproject/libwebp/commit/95ea5226c8=
70449522240ccff26f0b006037c520" target=3D"_blank">
https://github.com/webmproject/libwebp/commit/95ea5226c870449522240ccff26f0=
b006037c520</a> really related to CVE-2023-4863 ?<br>
&gt;<br>
&gt; On Tue, Oct 31, 2023 at 11:05=E2=80=AFPM Steve Sakoman &lt;<a href=3D"=
mailto:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt; wrote=
:<br>
&gt;&gt;<br>
&gt;&gt; From: Soumya Sambu &lt;<a href=3D"mailto:soumya.sambu@windriver.co=
m" target=3D"_blank">soumya.sambu@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Heap buffer overflow in WebP in Google Chrome prior to<br>
&gt;&gt; 116.0.5845.187 allowed a remote attacker to perform an<br>
&gt;&gt; out of bounds memory write via a crafted HTML page.<br>
&gt;&gt;<br>
&gt;&gt; References:<br>
&gt;&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-4863" target=
=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2023-4863</a><br>
&gt;&gt; <a href=3D"https://security-tracker.debian.org/tracker/CVE-2023-48=
63" target=3D"_blank">https://security-tracker.debian.org/tracker/CVE-2023-=
4863</a><br>
&gt;&gt; <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D2238431#c=
12" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?id=3D2238431=
#c12</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Soumya Sambu &lt;<a href=3D"mailto:soumya.sambu@win=
driver.com" target=3D"_blank">soumya.sambu@windriver.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.c=
om" target=3D"_blank">steve@sakoman.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../webp/files/CVE-2023-4863.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 53 +++++++++++++++++++<br>
&gt;&gt;=C2=A0 meta/recipes-multimedia/webp/<a href=3D"http://libwebp_1.2.4=
.bb" target=3D"_blank">libwebp_1.2.4.bb</a> |=C2=A0 1 +<br>
&gt;&gt;=C2=A0 2 files changed, 54 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/webp/files/CVE-20=
23-4863.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-4863.patc=
h b/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..2b1817822c<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch<br>
&gt;&gt; @@ -0,0 +1,53 @@<br>
&gt;&gt; +From 95ea5226c870449522240ccff26f0b006037c520 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; +From: Vincent Rabaud &lt;<a href=3D"mailto:vrabaud@google.com" ta=
rget=3D"_blank">vrabaud@google.com</a>&gt;<br>
&gt;&gt; +Date: Mon, 11 Sep 2023 16:06:08 +0200<br>
&gt;&gt; +Subject: [PATCH] Fix invalid incremental decoding check.<br>
&gt;&gt; +<br>
&gt;&gt; +The first condition is only necessary if we have not read enough<=
br>
&gt;&gt; +(enough being defined by src_last, not src_end which is the end<b=
r>
&gt;&gt; +of the image).<br>
&gt;&gt; +The second condition now fits the comment below: &quot;if not<br>
&gt;&gt; +incremental, and we are past the end of buffer&quot;.<br>
&gt;&gt; +<br>
&gt;&gt; +BUG=3Doss-fuzz:62136<br>
&gt;&gt; +<br>
&gt;&gt; +Change-Id: I0700f67c62db8e1c02c2e429a069a71e606a5e4f<br>
&gt;&gt; +<br>
&gt;&gt; +CVE: CVE-2023-4863<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/webmproj=
ect/libwebp/commit/95ea5226c870449522240ccff26f0b006037c520" target=3D"_bla=
nk">https://github.com/webmproject/libwebp/commit/95ea5226c870449522240ccff=
26f0b006037c520</a>]<br>
&gt;&gt; +<br>
&gt;&gt; +Signed-off-by: Soumya Sambu &lt;<a href=3D"mailto:soumya.sambu@wi=
ndriver.com" target=3D"_blank">soumya.sambu@windriver.com</a>&gt;<br>
&gt;&gt; +---<br>
&gt;&gt; + src/dec/vp8l_dec.c | 15 +++++++++++++--<br>
&gt;&gt; + 1 file changed, 13 insertions(+), 2 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/src/dec/vp8l_dec.c b/src/dec/vp8l_dec.c<br>
&gt;&gt; +index 186b0b2..59a9e64 100644<br>
&gt;&gt; +--- a/src/dec/vp8l_dec.c<br>
&gt;&gt; ++++ b/src/dec/vp8l_dec.c<br>
&gt;&gt; +@@ -1241,9 +1241,20 @@ static int DecodeImageData(VP8LDecoder* co=
nst dec, uint32_t* const data,<br>
&gt;&gt; +=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0 br-&gt;eos_ =3D VP8LIsEndOfStream(br);<br>
&gt;&gt; +-=C2=A0 if (dec-&gt;incremental_ &amp;&amp; br-&gt;eos_ &amp;&amp=
; src &lt; src_end) {<br>
&gt;&gt; ++=C2=A0 // In incremental decoding:<br>
&gt;&gt; ++=C2=A0 // br-&gt;eos_ &amp;&amp; src &lt; src_last: if &#39;br&#=
39; reached the end of the buffer and<br>
&gt;&gt; ++=C2=A0 // &#39;src_last&#39; has not been reached yet, there is =
not enough data. &#39;dec&#39; has to<br>
&gt;&gt; ++=C2=A0 // be reset until there is more data.<br>
&gt;&gt; ++=C2=A0 // !br-&gt;eos_ &amp;&amp; src &lt; src_last: this cannot=
 happen as either the buffer is<br>
&gt;&gt; ++=C2=A0 // fully read, either enough has been read to reach &#39;=
src_last&#39;.<br>
&gt;&gt; ++=C2=A0 // src &gt;=3D src_last: &#39;src_last&#39; is reached, a=
ll is fine. &#39;src&#39; can actually go<br>
&gt;&gt; ++=C2=A0 // beyond &#39;src_last&#39; in case the image is cropped=
 and an LZ77 goes further.<br>
&gt;&gt; ++=C2=A0 // The buffer might have been enough or there is some lef=
t. &#39;br-&gt;eos_&#39; does<br>
&gt;&gt; ++=C2=A0 // not matter.<br>
&gt;&gt; ++=C2=A0 assert(!dec-&gt;incremental_ || (br-&gt;eos_ &amp;&amp; s=
rc &lt; src_last) || src &gt;=3D src_last);<br>
&gt;&gt; ++=C2=A0 if (dec-&gt;incremental_ &amp;&amp; br-&gt;eos_ &amp;&amp=
; src &lt; src_last) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 RestoreState(dec);<br>
&gt;&gt; +-=C2=A0 } else if (!br-&gt;eos_) {<br>
&gt;&gt; ++=C2=A0 } else if ((dec-&gt;incremental_ &amp;&amp; src &gt;=3D s=
rc_last) || !br-&gt;eos_) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 // Process the remaining rows correspond=
ing to last row-block.<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 if (process_func !=3D NULL) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 process_func(dec, row &gt; l=
ast_row ? last_row : row);<br>
&gt;&gt; +--<br>
&gt;&gt; +2.40.0<br>
&gt;&gt; diff --git a/meta/recipes-multimedia/webp/<a href=3D"http://libweb=
p_1.2.4.bb" target=3D"_blank">libwebp_1.2.4.bb</a> b/meta/recipes-multimedi=
a/webp/<a href=3D"http://libwebp_1.2.4.bb" target=3D"_blank">libwebp_1.2.4.=
bb</a><br>
&gt;&gt; index 4defdd5e42..0728ca60f5 100644<br>
&gt;&gt; --- a/meta/recipes-multimedia/webp/<a href=3D"http://libwebp_1.2.4=
.bb" target=3D"_blank">libwebp_1.2.4.bb</a><br>
&gt;&gt; +++ b/meta/recipes-multimedia/webp/<a href=3D"http://libwebp_1.2.4=
.bb" target=3D"_blank">libwebp_1.2.4.bb</a><br>
&gt;&gt; @@ -16,6 +16,7 @@ LIC_FILES_CHKSUM =3D &quot;<a></a>file://COPYING=
;md5=3D6e8dee932c26f2dab503abf70c96d8bb \<br>
&gt;&gt;=C2=A0 SRC_URI =3D &quot;<a></a><a href=3D"http://downloads.webmpro=
ject.org/releases/webp/$%7BBP%7D.tar.gz" target=3D"_blank">http://downloads=
.webmproject.org/releases/webp/${BP}.tar.gz</a> \<br>
&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 <a>file://CVE-2023-1999.patch</a> \<br>
&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 <a>file://CVE-2023-5129.patch</a> \<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>f=
ile://CVE-2023-4863.patch</a> \<br>
&gt;&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 &quot;<br>
&gt;&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;7bf5a8a28cc69bcfa8cb214f2c30957=
03c6b73ac5fba4d5480c205331d9494df&quot;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.34.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
</div>
</span></font></div>
</div>

</div></blockquote></div></div>

--0000000000000bd32906092603e3--

