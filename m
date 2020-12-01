Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.12615.1606839775596475195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 08:22:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U4jM+8fI;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id lt17so5338523ejb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 08:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HhU+n9fkkQ4NKmuZave2F5ELrdm3nSVvkxcvtLyRmXA=;
        b=U4jM+8fIQ6zzwo+gVSXhQuHc9yPiVLezZDWEc9aUre4Aeg9OsQ4nsBLEjzxKMrC5FF
         g0I+LPn6b8q/y2FXuxJbN6rcKwsvpFXnQgfRAv9Utf4aYpzpUnh+prCAsDDftx29wV2D
         NgiftiW9XMxBzpaSrevAU46bUIa6gUWv8auoOw4LSN+gUvJd7Z11G13ORfwsUOz+UFVJ
         hPUt3EXffeuZ7njresqCeRZlPWZ0gefsZ2I8HmFSYN3XVdpECPegcfFWRHXprQIRO42s
         hZfhBL4+zn6l7kBL8WhkvfmCzkvAjL1pLfDFI9TX0+RpKykVfqJ9Q+4G4Q3iXAvrRbwM
         DpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HhU+n9fkkQ4NKmuZave2F5ELrdm3nSVvkxcvtLyRmXA=;
        b=mgy9ojLuYstYry7u9JZylgpO3d/BPR+/u6v3FNXgKbBJMEITLnsw2t/SCktVmlf6D8
         iSs5OJN5PSoOS8r6ZZXzUIjO1jkcdaH0AwcBxh/1aNb2mAHIFAp5pFrYhxg53aPz+gzH
         dcUtsm+fTRZ6r5m82ZBZrKFqa0v7uEhcTW1l2SRn/JZ8kgOApycuZ8UCEdgH0hseW2L8
         SH8lz9FgfAVIoWqbZXwMK1wP3qsxf5It4QsEdQ+vcxnAQtNZIrAnVAYNY4tiIOIi24xa
         Vc4EP72wU3DUvRjcTdW3w+wlMiGzvYidmCY8HHKwQjGg49locOYKrr4b12bBK5WlmLRD
         jzvw==
X-Gm-Message-State: AOAM531x8qXA7vnDYCbke4lMojBgMTfIZdWYL5vhi0VBVyBLwEn2L8/B
	3pTfDpW/mRyVaQ7AihXNVqbJ6Rhdus+7Iz2q6kA=
X-Google-Smtp-Source: ABdhPJwexOVyX9YbyPSbVPzP46T7AH+Qu/oWtF1ZArDZKJr+4S8wTzQKA+yQMGZbJYPWLOB7j85vgprDL/yVUg4Ij4k=
X-Received: by 2002:a17:907:2179:: with SMTP id rl25mr3681577ejb.470.1606839774080;
 Tue, 01 Dec 2020 08:22:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606352479.git.paul.eggleton@linux.microsoft.com>
 <3140175.5fSG56mABF@linc> <CA+chaQdMdRJJTQfTADj5TjJWm4y4kOj7X5_FChaG_zX5TsBmSw@mail.gmail.com>
 <5243521.Sb9uPGUboI@linc>
In-Reply-To: <5243521.Sb9uPGUboI@linc>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 1 Dec 2020 17:22:43 +0100
Message-ID: <CA+chaQc4dmqWxU5o1AbPpN9Pj37ZAGpgy0bMisgpzyj_m66C+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] classes/kernel*: allow disabling symlink creation
To: Paul Eggleton <bluelightning@bluelightning.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f1f0ad05b569893e"

--000000000000f1f0ad05b569893e
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

I see, I was just worried that this case will block me pushing the last bit
of [YOCTO #12937] which changes symlinks to hardlinks:
https://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/artifacts

Which makes the use case you're fixing worse (as even less systems will
correctly handle hardlinks), so I support the idea to disable having the
links. My current work around is to just remove the unnecessary files when
rsyncing to file-server.

But the main issue which I'm seeing with my current implementation (and
with webos_deploy this is based on) is that we need the version-less
artifacts to be available, because e.g. image recipe searching kernel
artifact when there is DATETIME or SRCPV in the kernel artifact-name won't
be able to find it, because the image might be built at different DATETIME
and doesn't know anything about kernel SRCREV/SRCPV. To resolve this, the
build is using the version-less artifacts (always the latest one).

I guess your implementation might fail in such DATETIME cases as well.

With separate variable to disable the links we can somehow work around this
or at least warn user that without the version-less filenames, the
VERSION_SUFFIX variable needs to be stable (as no PV/SRCPV/DATATIME in it).

Cheers,

On Tue, Dec 1, 2020 at 5:13 PM Paul Eggleton <
bluelightning@bluelightning.org> wrote:

> Hi Martin
>
> (replying all this time)
>
> On Tuesday, 1 December 2020 15:40:36 NZDT you wrote:
> > Can we use a separate variable controlling this behavior other than
> > *_LINK_NAME variables being set to empty?
> >
> > Then we could easily extend it to stop creating the links also for image
> > artifacts as well.
>
> Well, I didn't call it out explicitly but I was just mirroring the image
> artifacts behaviour - we set those to "" as well and there are checks
> there
> already to make that disable the symlink in that case.
>
> Paul
>
>
>

--000000000000f1f0ad05b569893e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Paul,<div><br></div><div>I see, I was just worried that=
 this case will block me pushing the last bit of=C2=A0[YOCTO #12937] which =
changes symlinks to hardlinks:</div><div><a href=3D"https://git.openembedde=
d.org/openembedded-core-contrib/log/?h=3Djansa/artifacts" target=3D"_blank"=
>https://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/arti=
facts</a><br></div><div><br></div><div>Which makes the use case you&#39;re =
fixing worse (as even less systems will correctly handle hardlinks), so I s=
upport the idea to disable having the links. My current work around is to j=
ust remove the unnecessary files when rsyncing to file-server.</div><div><b=
r></div><div>But the main issue which I&#39;m seeing with my current implem=
entation (and with webos_deploy this is based on) is that we need the versi=
on-less artifacts to be available, because e.g. image recipe searching kern=
el artifact when there is DATETIME or SRCPV in the kernel artifact-name won=
&#39;t be able to find it, because the image might be built at different DA=
TETIME and doesn&#39;t know anything about kernel SRCREV/SRCPV. To resolve =
this, the build is using the version-less artifacts (always the latest one)=
.</div><div><br></div><div>I guess your implementation might fail in such D=
ATETIME cases as well.</div><div><br></div><div>With separate variable to d=
isable the links we can somehow work around this or at least warn user that=
 without the version-less filenames, the VERSION_SUFFIX variable needs to b=
e stable (as no PV/SRCPV/DATATIME in it).</div><div><br></div><div>Cheers,<=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, Dec 1, 2020 at 5:13 PM Paul Eggleton &lt;<a href=3D"mailto:blu=
elightning@bluelightning.org">bluelightning@bluelightning.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Martin<br>
<br>
(replying all this time)<br>
<br>
On Tuesday, 1 December 2020 15:40:36 NZDT you wrote:<br>
&gt; Can we use a separate variable controlling this behavior other than<br=
>
&gt; *_LINK_NAME variables being set to empty?<br>
&gt;<br>
&gt; Then we could easily extend it to stop creating the links also for ima=
ge<br>
&gt; artifacts as well.<br>
<br>
Well, I didn&#39;t call it out explicitly but I was just mirroring the imag=
e <br>
artifacts behaviour - we set those to &quot;&quot; as well and there are ch=
ecks there <br>
already to make that disable the symlink in that case.<br>
<br>
Paul<br>
<br>
<br>
</blockquote></div>

--000000000000f1f0ad05b569893e--
