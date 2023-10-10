Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68250CD80C0
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 12:32:18 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.90121.1696941128453855177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 05:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GuV1aN40;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-35742cbb670so852205ab.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 05:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696941127; x=1697545927; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=flul4Q0Z74dfT+je7BSzWnNQWWscIcOGSlf5q+w1nFU=;
        b=GuV1aN40qm9yoz47aCSL0rCwwfTLKzV4E41idOaK8LPjaYefxvErXlXRDbigjvLNOV
         ZZ2h+SbNRSGGGO9OeEvpB+dyGBAdX8nHav1jirVUgj+hAoIfgVWWnsUTL+90Y4RUV6mL
         A7VFHp8mS4G8uDyaNexYBnd+/C6SbEHTxxYYsvRC2MMxeIabCT05seFSfpby0js3YKr+
         hEuLKZ3o2a8y9wzHqG03kRj90eMsd8aSO6dKvzT/cVCIpH/1jIHR7UqOCsSBypQNvkBs
         Ts+PfHiQGEeWj2qSNF9NurODcVxtmXcToVTxAJhGRpl5mdccOmEPOtW+rGVt6q+gB1Bo
         sDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696941127; x=1697545927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flul4Q0Z74dfT+je7BSzWnNQWWscIcOGSlf5q+w1nFU=;
        b=Mo2mLkT4JQhw7gKMRLMg4TySlUWGWIjRHaBSR2/CRwe/6+Pm+S++C+IPJXW0pcLTp1
         SIXqU9yabNNvOnK/YPCXlfB6jKNfwUzyZVGUsmlEsMVqoTXjPu0vQNcsKQCR186sb8C7
         N+k7ufVG+IY3slzq0a30/Zr2D6n3OyHGW2vnCCIgWq9OmYrwiM8GcHEcgUurSSsGdDJc
         iW2ghZG4XN1v1VNgKRbTUCNq/1D/5fs1ayCsHqHkGJrt77Xjqlme4YVlJ/mgAVrKakHr
         v8P6dnru1orOIuwJ5yY1yOtPyENknMf5RzxrBX3eFFJ2UZf+pq+ptJLCx4uzi1TvWbmf
         TvbQ==
X-Gm-Message-State: AOJu0YyMzUsGdrglwHzie1traqUW1kBKmOLDmfbbG8+G7F7KhvwUkPTP
	JxobLqQKaoHUYf0ogF4kbjxKkRN9io/NVuVaKsc=
X-Google-Smtp-Source: AGHT+IGl1iV1RRYMzTOkBVWD36BrARD3gXjR8jZQTp036VdT18W2jfT6X0/ZmKjKw0o2sI7hUlAdsIxVcEgkaGKe9bo=
X-Received: by 2002:a5e:8e49:0:b0:79f:a36e:bd1f with SMTP id
 r9-20020a5e8e49000000b0079fa36ebd1fmr19053959ioo.5.1696941127545; Tue, 10 Oct
 2023 05:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1688958788.git.bruce.ashfield@gmail.com>
 <1c4a47b33bed622c5b7c137a830e359302293887.1688958789.git.bruce.ashfield@gmail.com>
 <ca1963d9-39aa-d00f-6ac9-9ee919db7d32@prevas.dk>
In-Reply-To: <ca1963d9-39aa-d00f-6ac9-9ee919db7d32@prevas.dk>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Oct 2023 08:31:56 -0400
Message-ID: <CADkTA4N1A1DGi1Kde+Muaq_pHB=XXRPiHui74PD24pVwf1-SAw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/15] perf: fix buildpaths QA warning in 6.4+
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001cba6806075be5ee"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 12:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188882

--0000000000001cba6806075be5ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 7:44=E2=80=AFAM Rasmus Villemoes <rasmus.villemoes@=
prevas.dk>
wrote:

> On 10/07/2023 05.20, Bruce Ashfield via lists.openembedded.org wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > kernel version 6.4 introduces a new file that need to have
> > absolute paths removed, so we can avoid the buildpaths QA
> > warning and have relocatable packages.
> >
> > We add pmu-flex.h to the processing, and the issue is resolved.
>
> Hi Bruce
>
> We've seen those buildpaths qa warning when building perf for a long
> time, and they happen whether we build against a 5.15, 6.2 or 6.5
> kernel. More specifically, what we see is
>
> WARNING: perf-1.0-r9 do_package_qa: QA Issue: File /usr/bin/.debug/perf
> in package perf-dbg contains reference to TMPDIR [buildpaths]
> WARNING: perf-1.0-r9 do_package_qa: QA Issue: File /usr/bin/trace in
> package perf contains reference to TMPDIR
> File /usr/bin/perf in package perf contains reference to TMPDIR
> [buildpaths]
>
> Looking at the .o.cmd files, there is indeed nowhere a
> -fmacro-prefix-map or -fdebug-prefix-map, and apart from the bison/yacc
> stuff, I also don't see where the perf recipe attempts to pass such flags=
.
>
> It seems we can fix it with
>
> $ git diff
> diff --git a/meta/recipes-kernel/perf/perf.bb
> b/meta/recipes-kernel/perf/perf.bb
> index 420286e..59c0c10 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -81,7 +81,7 @@ EXTRA_OEMAKE =3D '\
>      LDSHARED=3D"${CC} -shared" \
>      AR=3D"${AR}" \
>      LD=3D"${LD}" \
> -    EXTRA_CFLAGS=3D"-ldw -I${S}" \
> +    EXTRA_CFLAGS=3D"-ldw -I${S} ${DEBUG_PREFIX_MAP}" \
>      YFLAGS=3D'-y
> --file-prefix-map=3D${WORKDIR}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${=
PR}' \
>      EXTRA_LDFLAGS=3D"${PERF_EXTRA_LDFLAGS}" \
>      perfexecdir=3D${libexecdir} \
>
> but I'm quite curious what the difference between our setups is, since
> apparently the only problem oe-core has/had was that new file introduced
> in v6.4.
>

You can see any patches that we have against perf in the kernel-cache
repository (https://git.yoctoproject.org/yocto-kernel-cache/). That being
said, we unfortunately cannot really patch perf, since the recipe is
supported against more than our reference kernels.

The debug prefix didn't initially work on some kernels (and hence perf),
so we went with the more manual approach.

It is very possible that with a newer window of supported kernels that
we could change how we deal with TMPDIR.

Other than that, there's no special setup (in particular no setup that
I have) as it is the autobuilder infrastructure that typically finds and
reports these issues.



>
> FWIW, what we build are vanilla -stable kernels, i.e. "6.2" means
> v6.2.16 as tagged by Greg. The only modification of the perf recipe we
> do is removing "scripting" from PACKAGECONFIG.
>
>
FWIW, you could save some effort and simply build v6.<x>/base on
linux-yocto and you'd have exactly the same source.

Bruce



> Rasmus
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000001cba6806075be5ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Oct 10, 2023 at 7:44=E2=80=AFAM Rasmus Vill=
emoes &lt;<a href=3D"mailto:rasmus.villemoes@prevas.dk">rasmus.villemoes@pr=
evas.dk</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On 10/07/2023 05.20, Bruce Ashfield via <a href=3D"http://lists.open=
embedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</=
a> wrote:<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; <br>
&gt; kernel version 6.4 introduces a new file that need to have<br>
&gt; absolute paths removed, so we can avoid the buildpaths QA<br>
&gt; warning and have relocatable packages.<br>
&gt; <br>
&gt; We add pmu-flex.h to the processing, and the issue is resolved.<br>
<br>
Hi Bruce<br>
<br>
We&#39;ve seen those buildpaths qa warning when building perf for a long<br=
>
time, and they happen whether we build against a 5.15, 6.2 or 6.5<br>
kernel. More specifically, what we see is<br>
<br>
WARNING: perf-1.0-r9 do_package_qa: QA Issue: File /usr/bin/.debug/perf<br>
in package perf-dbg contains reference to TMPDIR [buildpaths]<br>
WARNING: perf-1.0-r9 do_package_qa: QA Issue: File /usr/bin/trace in<br>
package perf contains reference to TMPDIR<br>
File /usr/bin/perf in package perf contains reference to TMPDIR [buildpaths=
]<br>
<br>
Looking at the .o.cmd files, there is indeed nowhere a<br>
-fmacro-prefix-map or -fdebug-prefix-map, and apart from the bison/yacc<br>
stuff, I also don&#39;t see where the perf recipe attempts to pass such fla=
gs.<br>
<br>
It seems we can fix it with<br>
<br>
$ git diff<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nor=
eferrer" target=3D"_blank">perf.bb</a><br>
b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">perf.bb</a><br>
index 420286e..59c0c10 100644<br>
--- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
@@ -81,7 +81,7 @@ EXTRA_OEMAKE =3D &#39;\<br>
=C2=A0 =C2=A0 =C2=A0LDSHARED=3D&quot;${CC} -shared&quot; \<br>
=C2=A0 =C2=A0 =C2=A0AR=3D&quot;${AR}&quot; \<br>
=C2=A0 =C2=A0 =C2=A0LD=3D&quot;${LD}&quot; \<br>
-=C2=A0 =C2=A0 EXTRA_CFLAGS=3D&quot;-ldw -I${S}&quot; \<br>
+=C2=A0 =C2=A0 EXTRA_CFLAGS=3D&quot;-ldw -I${S} ${DEBUG_PREFIX_MAP}&quot; \=
<br>
=C2=A0 =C2=A0 =C2=A0YFLAGS=3D&#39;-y<br>
--file-prefix-map=3D${WORKDIR}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR=
}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0EXTRA_LDFLAGS=3D&quot;${PERF_EXTRA_LDFLAGS}&quot; \<br>
=C2=A0 =C2=A0 =C2=A0perfexecdir=3D${libexecdir} \<br>
<br>
but I&#39;m quite curious what the difference between our setups is, since<=
br>
apparently the only problem oe-core has/had was that new file introduced<br=
>
in v6.4.<br></blockquote><div><br></div><div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">You can see any patches that we have against perf =
in the kernel-cache</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">repository (<a href=3D"https://git.yoctoproject.org/yocto-kernel-cache=
/">https://git.yoctoproject.org/yocto-kernel-cache/</a>). That being</div><=
div class=3D"gmail_default" style=3D"font-size:small">said, we unfortunatel=
y cannot really patch perf, since the recipe is</div><div class=3D"gmail_de=
fault" style=3D"font-size:small">supported against more than our reference =
kernels.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">The debug prefix=
 didn&#39;t initially work on some kernels (and hence perf),</div><div clas=
s=3D"gmail_default" style=3D"font-size:small">so we went with the more manu=
al approach.</div><br></div><div><div class=3D"gmail_default" style=3D"font=
-size:small">It is very possible that with a newer window of supported kern=
els that</div><div class=3D"gmail_default" style=3D"font-size:small">we cou=
ld change how we deal with TMPDIR.=C2=A0</div></div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Other than that, there&#39;s no special setup (in par=
ticular no setup that</div><div class=3D"gmail_default" style=3D"font-size:=
small">I have) as it is the autobuilder infrastructure that typically finds=
 and</div><div class=3D"gmail_default" style=3D"font-size:small">reports th=
ese issues.</div><br><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
FWIW, what we build are vanilla -stable kernels, i.e. &quot;6.2&quot; means=
<br>
v6.2.16 as tagged by Greg. The only modification of the perf recipe we<br>
do is removing &quot;scripting&quot; from PACKAGECONFIG.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">FWIW, you could save some effort and simply build v6.&lt;x=
&gt;/base on</div><div class=3D"gmail_default" style=3D"font-size:small">li=
nux-yocto and you&#39;d have exactly the same source.</div><div class=3D"gm=
ail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
Rasmus<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--0000000000001cba6806075be5ee--

