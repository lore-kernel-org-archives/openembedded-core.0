Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A1AD340BC
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 16:50:41 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16239.1769532635018632260
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 08:50:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GHydhCGv;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78fb5764382so59394407b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 08:50:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769532634; cv=none;
        d=google.com; s=arc-20240605;
        b=IXBCZqaa5L51j4p8IYiiIeob7J/yo6YwFs35Loo1CJ4Q54ro+0clgs5fqNIHj4lRX4
         nbMFfg2GlAJPTLQEvQbLnrIXkya+ovM+mlxtfUmk8rjt2mUiGD272RR3T0ayjtyTzbDE
         YhLqLBNBeLWOlDwFbBQs0QNEbyeF+NLXpyppzUxdsKCb/kMyng1SrcaljfDTuz94VrvT
         l/J3VmiPTZxDMMtCTEifrc2ivWn1r0P385kW/ul0X/5DJ9CxiO4pZLk2MA0VGAwj4MQI
         TXSEcY9rhHXKC7+bTAkgBCAWtlS5sS7tKvBcnrnFzICG1npVrxL6LvgFp3PK81TlKiiU
         YnbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3HZod/F5XE4W0tnpEPOkxpS02INyPWPyONLtPq7ldLg=;
        fh=d80lTTJKXWISVyw/lQ7X/x6Iolp0X7Jh2rNs1G+/Xok=;
        b=URYveZ/ecpjRgIiVjnRskdfs9giS0xGYikWKc/6/s+tkzObjSZMmFow1KNbKDBja0k
         Ao3jEpNr+SnShCrjsGi0T9gP8mSzaLGz0maQTeZttVzbMDW6gdAT7q5l/P2ZYLSGCgHU
         u5p1dIiliPzmEL2xfKAnePkhmbL4ezwNNn2oalzdkGFyr4JhCcU6vZ21rp65pHmcEls9
         /IV3Ypx5TXXu8qlh9l57m2uVIQ4ubGEI+GERBolpy+LCj7jHPGIjozcNmChNmBqeLiz8
         BiE1kHPN0Ucil23tjgRnBwhGGyJeI9w1sv4Xp0OY42Cq10ETMM6T5aPC3KBJtS6eGJSR
         LZ1g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769532634; x=1770137434; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3HZod/F5XE4W0tnpEPOkxpS02INyPWPyONLtPq7ldLg=;
        b=GHydhCGvKHicCBo5l3Wk9/6YPO6ZVgQrqqspFTAMfld0+I96CWjad5qFxB2wZwoEe/
         A1+TY/i7tOAjP9LaWpuJP7rELbZQs+g14OQLaF5Icjv8G4tQP54i0Ex6o8lyBkTwh2o1
         R/GAKLPCb+C/HpKWf3bl4FOzkL0BpEVGwJZrVRAQxW/I8ZXV3IAle8UxmkNt48TodZ0W
         Pow2e7UiUhZgWwaMtExupH8ajgFbieowLlJLRnKw2ZxNa2tGO69C8phoKxaTK7IUJr78
         6vAd3/Ev7RCWvtqRrcJ8KKn50chWMU43OHYmKHTMMr+CP3jrOJv+eEED3gF1I8eGWvAo
         J8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769532634; x=1770137434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HZod/F5XE4W0tnpEPOkxpS02INyPWPyONLtPq7ldLg=;
        b=WZF7sOP9h25xU3/uAjGsWMi4MncBedF8MOzbdI+Ayo5d20gEzw2cbTs77Vn3NG3g3j
         1YFa5GEq2XVu2T0Px/JyA8jIpOqIpT2nQC9ZaNOSvYYwgVqT1i2qm1dvyeiryA0O8H2+
         jIhxQfUB0Dwj/fsDEf9lIZoVKpEdG3C74sMW10hn6O0sGRg+LTudFPh+2QlNAJBKrEiW
         wtpbk9jMvxZXuct6fboioBPYCgQxhjywViXUo3ALgDdoWMWUt75K3uqdsRY08rjIGMdB
         IFTcVz59DG5CtttkfUm0yvnLx6l+bzszeNUBth7yGIraVWEpefIMDWlRuwo6351yIM+N
         ozhg==
X-Forwarded-Encrypted: i=1; AJvYcCWtO6HkFVv8Ws9jVl5Yv/b7I7XvVVi4sX/D1hnzPUB4+EcwDd83xUI0isyQI129vyxDfeDoFwXPFdlDAWkG0tqJIQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxEARie9/MHj2qQ+6ZW6CxliLyYn+Sa96imNqw+brqc3xvqnDcn
	3jvnn6ISpLnoNALmDbqL4NsZ+2rhJXOUiNkDli6WM29p0Rbs6bRheqXnI4DLyOSbWnmyqWYPGf0
	qSAY31kWl5eGNbaQjOrEJ+3pnUiRJvfE=
X-Gm-Gg: AZuq6aJQJARiDkdwPPeUOIvzpBBZ9ugT18DBPNZw4wKozldb9nvOXvDSam7LqKPuD2w
	/8qr0+5JCaCCYoZlMlp2L6cJnphp848PgspqvWQ7k9EZvbQRntEkoCSq/F5QM6UPXXEeWSuTfjU
	tnFggkYfQHr6JrjmaXOou1sEd/85CN7evJ1piYjuDSHkKYQHasaphI1voh3GCPweKmT5qfrBaHT
	9IFiFEAwFuZFCXM0rfoVSzUyWZH63XZxkaAU2fbfM3dgal8rDGVjs3Qc37BcQtP/7SByvoOFZhT
	/QaxR902nMGt1KXiV4acIN0pSFENG1xeHr239gtAFXMt7QfpHxM17w3fN+kN6afg57ajcD5Dtqs
	SSJnyQKOU4A96zBu4SRs5oVQZ5SzKD6mSzQCRlmr7r2/oOGPCn+MPZFxN
X-Received: by 2002:a05:690c:9e:b0:78f:a616:7b99 with SMTP id
 00721157ae682-7947abebf49mr18243957b3.49.1769532633963; Tue, 27 Jan 2026
 08:50:33 -0800 (PST)
MIME-Version: 1.0
References: <20260122194959.13457-2-rs@ti.com> <8684a6b5-809b-41e4-a3b0-c99b424a1b2a@windriver.com>
 <0387b4a0-1457-4de6-9571-022b997199e4@cybernetics.com> <DFYTFOYS891P.2A5CKLOKP5KGI@ti.com>
 <117668c8-bc3b-46ea-9d2e-b205e3f2f827@windriver.com> <CAMKF1srfwp+o0FC5r+Y+NfmWV3hFCJr7ifO5rH1C0+Gos-HejQ@mail.gmail.com>
 <DFZIJWAQTT0R.2QPUKVEBUL8K7@ti.com>
In-Reply-To: <DFZIJWAQTT0R.2QPUKVEBUL8K7@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Jan 2026 08:50:07 -0800
X-Gm-Features: AZwV_QiZSUPl4qGkHv2FhMC8CalmM08BjgRra8CefQafMLIZ8usGW6FteoH00gg
Message-ID: <CAMKF1spQbv-WCy9XEBxiK-Hzn1v=XZnGW8jWdOkk2axsx7r13A@mail.gmail.com>
Subject: Re: [oe-core][PATCH] bitbake.conf: remove DEBUG_PREFIX_MAP from TARGET_LDFLAGS
To: Randolph Sapp <rs@ti.com>
Cc: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000010e1fe0649616c43"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 16:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230058

--00000000000010e1fe0649616c43
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 8:31=E2=80=AFAM Randolph Sapp <rs@ti.com> wrote:

> On Tue Jan 27, 2026 at 12:12 AM CST, Khem Raj via lists.openembedded.org
> wrote:
> > I am seeing some additional diagnostics see
> >
> >
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5119153/raw_inl=
ine
> >
> > I wonder if this is related.
>
> Man, the mail clients are having fun with this thread.
>
> Yeah, I'm able to reproduce that issue locally now. Not sure why it's thi=
s
> package subset that's acting up, but it is directly related to the LDFLAG=
S
> change unfortunately.
>

I think this is exposing the underlying issue in packages perhaps because
they are
not respecting CFLAGS and when it's gone from LDFLAGS the mapping related
flags go missing. I have a local patch to fix memstat e.g in master-next,
all failures
perhaps need to be looked into one by one and passed cflags from OE env
which
might have been missed thus far.


>
> If that bug is actually still in effect then this requires some change to
> golang
> to avoid baking cgo_ldflags into the binaries. Right now we can get away
> with a
> go class specific LDFLAGS override if we want to, but that GCC bug may
> begin to
> affect go binary reproducibility in the future.
>
> - Randolph
>
> > On Mon, Jan 26, 2026 at 6:50=E2=80=AFPM Changqing Li via lists.openembe=
dded.org
> <
> > changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> >>
> >> On 1/27/26 04:50, Randolph Sapp via lists.openembedded.org wrote:
> >>
> >> CAUTION: This email comes from a non Wind River email account!
> >> Do not click links or open attachments unless you recognize the sender
> and know the content is safe.
> >>
> >> On Mon Jan 26, 2026 at 9:04 AM CST, Tony Battersby wrote:
> >>
> >> On 1/26/26 03:39, Changqing Li wrote:
> >>
> >> On 1/23/26 03:50, Randolph Sapp via lists.openembedded.org wrote:
> >>
> >> CAUTION: This email comes from a non Wind River email account!
> >> Do not click links or open attachments unless you recognize the sender
> and know the content is safe.
> >>
> >> From: Randolph Sapp <rs@ti.com> <rs@ti.com>
> >>
> >> Now that the previous bug affecting binary reproducibility has been
> >> addressed [1], we can revert this patch. This will resolve issues with
> >> cgo applications becoming unreprodcible.
> >>
> >> Currently go considers link arguments to be sacred, meaning any change
> >> should produce a different binary output. They ensure this by baking
> >> link arguments into the intermediary output, changing the content ID o=
f
> >> that step. As such, the marco prefixes inadvertently end up adding bui=
ld
> >> paths to the output binary instead of removing them if they are passed
> >> as link arguments to cgo applications.
> >>
> >> These paths are later stripped out again, but at this point the conten=
t
> >> ID of the dependency has changed and thus the build ID of the end
> >> application will be affected by the cascade of hash changes. See the
> >> upstream bug for more information [2].
> >>
> >> This reverts commit fddaecc88979967d0e00e2fafdbaaabec030da9f.
> >>
> >> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101473
> >> [2] https://github.com/golang/go/issues/77218
> >>
> >> Signed-off-by: Randolph Sapp <rs@ti.com> <rs@ti.com>
> >> ---
> >>
> >> This resolves the previously reported emptty issues:
> https://lists.openembedded.org/g/openembedded-core/message/228549
> >>
> >>  meta/conf/bitbake.conf | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> >> index 88f4d0df69..da873c3f4e 100644
> >> --- a/meta/conf/bitbake.conf
> >> +++ b/meta/conf/bitbake.conf
> >> @@ -634,7 +634,7 @@ TARGET_LINK_HASH_STYLE ?=3D
> "${@['-Wl,--hash-style=3Dgnu',''][d.getVar('LINKER_HASH_ ASNEEDED ?=3D " =
<$%7B@
> ['-Wl,--hash-style=3Dgnu',''][d.getVar('LINKER_HASH_ASNEEDED?=3D>-Wl,--as=
-needed"
> >>
> >>  export LDFLAGS =3D "${TARGET_LDFLAGS}"
> >> -TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}
> ${DEBUG_PREFIX_MAP}"
> >> +TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNEEDED}"
> >>
> >> Hi,
> >>
> >> After check the related gcc bug and yocto bug,  gcc bug comments 21
> >> ([1])  and yocto bug comments 13 ([2]),
> >>
> >> my understanding is that,  when lto is enabled,  even with gcc fix
> >> [3],  we still need DEBUG_PREFIX_MAP in LDFLAGS
> >>
> >> to make bin reproducible. Also seems Tony's commit [4] is after gcc
> >> fix [3].
> >>
> >> [1]  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D101473#c21
> >>
> >> [2]  https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14481#c13
> >>
> >> [3]  https://gcc.gnu.org/g:7cc2df084b7977653a9b59cbc34a9ad500ae619c
> >>
> >> [4]
> https://git.openembedded.org/openembedded-core/commit/?id=3Dfddaecc889799=
67d0e00e2fafdbaaabec030da9f
> >>
> >>
> >> @Tony, @Randolph, Could please correct me if my understanding is not
> >> right, Thanks.
> >>
> >>
> >>
> >> Yes, LDFLAGS needs DEBUG_PREFIX_MAP to make LTO builds reproducible,
> >> unless something else has changed since 2021 to make it unnecessary. I
> >> have not kept up with the issue.
> >>
> >> Tony
> >>
> >> I think there has been some change because I tested this locally with
> the normal
> >> reproducible builds selftest and no new packages were added to the
> failing list.
> >> This included oe-core and some layers from meta-openembedded as well.
> >>
> >> Got it,  if DEBUG_PREFIX_MAP is not needed any more,  I think remove
> DEBUG_PREFIX_MAP
> >> from LDFLAGS
> >>
> >> is a good way to fix the issue.
> >>
> >> The example code given in the report is fairly rudimentary, we should
> have hit
> >> the bug if it was still in effect across a majority of packages if my
> >> understanding is correct.
> >>
> >> I'm also curious to see what golang want's to do about this though.
> Baking build
> >> options into a binary seems a little silly, but I'm sure there was som=
e
> unusual
> >> behavior that led them to that point.
> >>
> >> +1
> >>
> >> //Changqing
> >>
> >> As indicated on another thread, we could also just remove this string
> from Go
> >> packages LDFLAGS if that puts everyone at ease.
> >>
> >> - Randolph
> >>
> >>
> >>
> >>
> >>
> >>
>
>

--00000000000010e1fe0649616c43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 27,=
 2026 at 8:31=E2=80=AFAM Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com">rs@=
ti.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Tue Jan 27, 2026 at 12:12 AM CST, Khem Raj via <a href=3D"http://l=
ists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembed=
ded.org</a> wrote:<br>
&gt; I am seeing some additional diagnostics see<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5=
119153/raw_inline" rel=3D"noreferrer" target=3D"_blank">https://autobuilder=
.yoctoproject.org/valkyrie/api/v2/logs/5119153/raw_inline</a><br>
&gt;<br>
&gt; I wonder if this is related.<br>
<br>
Man, the mail clients are having fun with this thread.<br>
<br>
Yeah, I&#39;m able to reproduce that issue locally now. Not sure why it&#39=
;s this<br>
package subset that&#39;s acting up, but it is directly related to the LDFL=
AGS<br>
change unfortunately.<br></blockquote><div><br></div><div>I think this is e=
xposing the underlying issue in packages perhaps because they are</div><div=
>not respecting CFLAGS and when it&#39;s gone from LDFLAGS the mapping rela=
ted</div><div>flags go missing. I have a local patch to fix memstat e.g in =
master-next, all failures</div><div>perhaps need to be looked into one by o=
ne and passed cflags from OE env which</div><div>might have been missed thu=
s far.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
If that bug is actually still in effect then this requires some change to g=
olang<br>
to avoid baking cgo_ldflags into the binaries. Right now we can get away wi=
th a<br>
go class specific LDFLAGS override if we want to, but that GCC bug may begi=
n to<br>
affect go binary reproducibility in the future.<br>
<br>
- Randolph<br>
<br>
&gt; On Mon, Jan 26, 2026 at 6:50=E2=80=AFPM Changqing Li via <a href=3D"ht=
tp://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.ope=
nembedded.org</a> &lt;<br>
&gt; <a href=3D"http://changqing.li" rel=3D"noreferrer" target=3D"_blank">c=
hangqing.li</a>=3D<a href=3D"mailto:windriver.com@lists.openembedded.org" t=
arget=3D"_blank">windriver.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 1/27/26 04:50, Randolph Sapp via <a href=3D"http://lists.openem=
bedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a>=
 wrote:<br>
&gt;&gt;<br>
&gt;&gt; CAUTION: This email comes from a non Wind River email account!<br>
&gt;&gt; Do not click links or open attachments unless you recognize the se=
nder and know the content is safe.<br>
&gt;&gt;<br>
&gt;&gt; On Mon Jan 26, 2026 at 9:04 AM CST, Tony Battersby wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 1/26/26 03:39, Changqing Li wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 1/23/26 03:50, Randolph Sapp via <a href=3D"http://lists.openem=
bedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a>=
 wrote:<br>
&gt;&gt;<br>
&gt;&gt; CAUTION: This email comes from a non Wind River email account!<br>
&gt;&gt; Do not click links or open attachments unless you recognize the se=
nder and know the content is safe.<br>
&gt;&gt;<br>
&gt;&gt; From: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" target=3D"_bl=
ank">rs@ti.com</a>&gt; &lt;<a href=3D"mailto:rs@ti.com" target=3D"_blank">r=
s@ti.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Now that the previous bug affecting binary reproducibility has bee=
n<br>
&gt;&gt; addressed [1], we can revert this patch. This will resolve issues =
with<br>
&gt;&gt; cgo applications becoming unreprodcible.<br>
&gt;&gt;<br>
&gt;&gt; Currently go considers link arguments to be sacred, meaning any ch=
ange<br>
&gt;&gt; should produce a different binary output. They ensure this by baki=
ng<br>
&gt;&gt; link arguments into the intermediary output, changing the content =
ID of<br>
&gt;&gt; that step. As such, the marco prefixes inadvertently end up adding=
 build<br>
&gt;&gt; paths to the output binary instead of removing them if they are pa=
ssed<br>
&gt;&gt; as link arguments to cgo applications.<br>
&gt;&gt;<br>
&gt;&gt; These paths are later stripped out again, but at this point the co=
ntent<br>
&gt;&gt; ID of the dependency has changed and thus the build ID of the end<=
br>
&gt;&gt; application will be affected by the cascade of hash changes. See t=
he<br>
&gt;&gt; upstream bug for more information [2].<br>
&gt;&gt;<br>
&gt;&gt; This reverts commit fddaecc88979967d0e00e2fafdbaaabec030da9f.<br>
&gt;&gt;<br>
&gt;&gt; [1] <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D1014=
73" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/show_=
bug.cgi?id=3D101473</a><br>
&gt;&gt; [2] <a href=3D"https://github.com/golang/go/issues/77218" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/golang/go/issues/77218</a><=
br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" targ=
et=3D"_blank">rs@ti.com</a>&gt; &lt;<a href=3D"mailto:rs@ti.com" target=3D"=
_blank">rs@ti.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;<br>
&gt;&gt; This resolves the previously reported emptty issues:<a href=3D"htt=
ps://lists.openembedded.org/g/openembedded-core/message/228549" rel=3D"nore=
ferrer" target=3D"_blank">https://lists.openembedded.org/g/openembedded-cor=
e/message/228549</a><br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 meta/conf/bitbake.conf | 2 +-<br>
&gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt;&gt; index 88f4d0df69..da873c3f4e 100644<br>
&gt;&gt; --- a/meta/conf/bitbake.conf<br>
&gt;&gt; +++ b/meta/conf/bitbake.conf<br>
&gt;&gt; @@ -634,7 +634,7 @@ TARGET_LINK_HASH_STYLE ?=3D &quot;${@[&#39;-Wl=
,--hash-style=3Dgnu&#39;,&#39;&#39;][d.getVar(&#39;LINKER_HASH_ ASNEEDED ?=
=3D &quot; &lt;$%7B@[&#39;-Wl,--hash-style=3Dgnu&#39;,&#39;&#39;][d.getVar(=
&#39;LINKER_HASH_ASNEEDED?=3D&gt;-Wl,--as-needed&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 export LDFLAGS =3D &quot;${TARGET_LDFLAGS}&quot;<br>
&gt;&gt; -TARGET_LDFLAGS =3D &quot;-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNE=
EDED} ${DEBUG_PREFIX_MAP}&quot;<br>
&gt;&gt; +TARGET_LDFLAGS =3D &quot;-Wl,-O1 ${TARGET_LINK_HASH_STYLE} ${ASNE=
EDED}&quot;<br>
&gt;&gt;<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; After check the related gcc bug and yocto bug,=C2=A0 gcc bug comme=
nts 21<br>
&gt;&gt; ([1])=C2=A0 and yocto bug comments 13 ([2]),<br>
&gt;&gt;<br>
&gt;&gt; my understanding is that,=C2=A0 when lto is enabled,=C2=A0 even wi=
th gcc fix<br>
&gt;&gt; [3],=C2=A0 we still need DEBUG_PREFIX_MAP in LDFLAGS<br>
&gt;&gt;<br>
&gt;&gt; to make bin reproducible. Also seems Tony&#39;s commit [4] is afte=
r gcc<br>
&gt;&gt; fix [3].<br>
&gt;&gt;<br>
&gt;&gt; [1]=C2=A0 <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=
=3D101473#c21" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bug=
zilla/show_bug.cgi?id=3D101473#c21</a><br>
&gt;&gt;<br>
&gt;&gt; [2]=C2=A0 <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cg=
i?id=3D14481#c13" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoc=
toproject.org/show_bug.cgi?id=3D14481#c13</a><br>
&gt;&gt;<br>
&gt;&gt; [3]=C2=A0 <a href=3D"https://gcc.gnu.org/g:7cc2df084b7977653a9b59c=
bc34a9ad500ae619c" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org=
/g:7cc2df084b7977653a9b59cbc34a9ad500ae619c</a><br>
&gt;&gt;<br>
&gt;&gt; [4] <a href=3D"https://git.openembedded.org/openembedded-core/comm=
it/?id=3Dfddaecc88979967d0e00e2fafdbaaabec030da9f" rel=3D"noreferrer" targe=
t=3D"_blank">https://git.openembedded.org/openembedded-core/commit/?id=3Dfd=
daecc88979967d0e00e2fafdbaaabec030da9f</a><br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; @Tony, @Randolph, Could please correct me if my understanding is n=
ot<br>
&gt;&gt; right, Thanks.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Yes, LDFLAGS needs DEBUG_PREFIX_MAP to make LTO builds reproducibl=
e,<br>
&gt;&gt; unless something else has changed since 2021 to make it unnecessar=
y. I<br>
&gt;&gt; have not kept up with the issue.<br>
&gt;&gt;<br>
&gt;&gt; Tony<br>
&gt;&gt;<br>
&gt;&gt; I think there has been some change because I tested this locally w=
ith the normal<br>
&gt;&gt; reproducible builds selftest and no new packages were added to the=
 failing list.<br>
&gt;&gt; This included oe-core and some layers from meta-openembedded as we=
ll.<br>
&gt;&gt;<br>
&gt;&gt; Got it,=C2=A0 if DEBUG_PREFIX_MAP is not needed any more,=C2=A0 I =
think remove DEBUG_PREFIX_MAP<br>
&gt;&gt; from LDFLAGS<br>
&gt;&gt;<br>
&gt;&gt; is a good way to fix the issue.<br>
&gt;&gt;<br>
&gt;&gt; The example code given in the report is fairly rudimentary, we sho=
uld have hit<br>
&gt;&gt; the bug if it was still in effect across a majority of packages if=
 my<br>
&gt;&gt; understanding is correct.<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m also curious to see what golang want&#39;s to do about thi=
s though. Baking build<br>
&gt;&gt; options into a binary seems a little silly, but I&#39;m sure there=
 was some unusual<br>
&gt;&gt; behavior that led them to that point.<br>
&gt;&gt;<br>
&gt;&gt; +1<br>
&gt;&gt;<br>
&gt;&gt; //Changqing<br>
&gt;&gt;<br>
&gt;&gt; As indicated on another thread, we could also just remove this str=
ing from Go<br>
&gt;&gt; packages LDFLAGS if that puts everyone at ease.<br>
&gt;&gt;<br>
&gt;&gt; - Randolph<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
&gt;&gt;<br>
<br>
</blockquote></div></div>

--00000000000010e1fe0649616c43--

