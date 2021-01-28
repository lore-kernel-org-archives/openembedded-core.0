Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web11.24621.1611842327652781277
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 05:58:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZWrBNM4z;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: dorindabassey@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id u8so534397ior.13
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 05:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YYdkFgLH0uJxO/sUqgIU5p/bL/I0Ae7Diu95yxa9RLg=;
        b=ZWrBNM4zivfqPS9E5zxoBIYV2SEpTIHKm8ulstpDPNlCsW+Suku7fmH5IFSwi0A9Is
         nHTLqj67YCdXI30IRv0QG7qXZIYolP18VtbkeuKNbi05zVNmkeqM6mJldo1sDY6DbUON
         NVGzMjXp0BRJYveywkwj6KFNmz7fIOjLstMYc3Vdaw3kVJx8uxAbXh1MFqpqtBvlOYkG
         SJtr5FiJPFcNolAV7+GwMmGKrCr44KQeT0bhZRXvGOp7YmCnjwPv7akDWPIxRKUfJrU1
         EzllvWHl1ROIalEAm2NM/0WxP8in8bOe3veOWrjjpjcaViD1grtIbTh6zZuDWErw+12F
         SZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YYdkFgLH0uJxO/sUqgIU5p/bL/I0Ae7Diu95yxa9RLg=;
        b=nOM/eO5gjPFnDWLe4VAPAPffmvIONj9ZS9+GPUd+aIC7Ydv7h+cUkHHI/d2ElaTz5K
         5YPTQsEiTc1SiZxlrRSNtHJQy4yq/FnE7Rt/hC3lNkzhrk4pkM05g5G0PLnQhj3UPbkC
         YsUfFtBiLDRn55TAIlbZX9Au4OfxVvgG0VS/0CEp8qMmcrQFvU5L1Re8JJ53NFFbtg3g
         aun5FOvGtWhFlIwuF6NTO7RtnbXc7DcUcxn14wAK6gCs9tXBJ4KyobEOVbIb8zjw3QFn
         E7XRxkAZ+hlnMnXRSxB4yrA2JNvA5GkSOf863sPw9WWxjMA8NDNbshB85TyJplqkUwPW
         eQ5g==
X-Gm-Message-State: AOAM530DPFOcvef22xkNTQZpnz3BmrUZZD3FyHtmDaiCfpqTlgRlgEz3
	FxLm4k3OWYKKtMU7OyH4shoVDhup5+qwP+d5ET0=
X-Google-Smtp-Source: ABdhPJxYfoQA6odJ69YCv89us24HV0YAPkE7e4gyIpoVijTtdW2b8monM7aWw5C6/9B+RHkncjn4gi25qNe+gP6jAzc=
X-Received: by 2002:a6b:9346:: with SMTP id v67mr11356404iod.108.1611842327165;
 Thu, 28 Jan 2021 05:58:47 -0800 (PST)
MIME-Version: 1.0
References: <20210127225257.29286-1-dorindabassey@gmail.com> <CAJkqNs3ne7aba3jvW8NaeYd7Rn6H9Yn6eXDmN7OseNq=w9G-Og@mail.gmail.com>
In-Reply-To: <CAJkqNs3ne7aba3jvW8NaeYd7Rn6H9Yn6eXDmN7OseNq=w9G-Og@mail.gmail.com>
From: "Dorinda" <dorindabassey@gmail.com>
Date: Thu, 28 Jan 2021 08:58:35 -0500
Message-ID: <CAJSnhzsh9WH3_U19bEdd=-F_HhDt2Ha2VBznEAdEWAoY73dn=A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity.bbclass: check if PSEUDO_IGNORE_PATHS and ${S} overlap
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000583eec05b9f649f0"

--000000000000583eec05b9f649f0
Content-Type: text/plain; charset="UTF-8"

Hmm, thanks for spotting this, I think that was an oversight on my part.
IMHO i think this patch should apply to cases where {WORKDIR} = {S}. so
i'll make some changes to the patch soon.

Thanks,
Dorinda.

On Wed, Jan 27, 2021 at 6:44 PM Tomasz Dziendzielski <
tomasz.dziendzielski@gmail.com> wrote:

> >+    # Check if PSEUDO_IGNORE_PATHS and ${S} overlap
> >+    pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS',
> expand=True).split(",")
> >+    sourcefile = d.getVar('S')
> >+    for i in pseudoignorepaths:
> >+        if i and sourcefile:
> >+            if sourcefile.startswith(i) or i.startswith(sourcefile):
> >+                status.addresult("a path included in PSEUDO_IGNORE_PATHS
> " + str(i) + " and ${S} (source files) path " + str(sourcefile) + " are
> overlapping each other, please set ${S} in your recipe to point to a
> different directory. \n")
>
> Isn't ${S} added to PSEUDO_IGNORE_PATHS almost every time in
> meta/classes/base.bbclass?
>     if os.path.normpath(d.getVar("WORKDIR")) !=
> os.path.normpath(d.getVar("S")):
>         d.appendVar("PSEUDO_IGNORE_PATHS", ",${S}")
>
> Best regards,
> Tomasz Dziendzielski
>

--000000000000583eec05b9f649f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hmm, thanks for spotting this, I think that was an ov=
ersight on my part. IMHO i think this patch should apply to cases where {WO=
RKDIR} =3D {S}. so i&#39;ll make some changes to the patch soon.</div><div>=
<br></div><div>Thanks,</div><div>Dorinda.<br> </div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 27, 2021 at=
 6:44 PM Tomasz Dziendzielski &lt;<a href=3D"mailto:tomasz.dziendzielski@gm=
ail.com">tomasz.dziendzielski@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><div dir=3D"lt=
r"><div>
&gt;+=C2=A0 =C2=A0 # Check if PSEUDO_IGNORE_PATHS and ${S} overlap<br>
&gt;+=C2=A0 =C2=A0 pseudoignorepaths =3D d.getVar(&#39;PSEUDO_IGNORE_PATHS&=
#39;, expand=3DTrue).split(&quot;,&quot;)<br>
&gt;+=C2=A0 =C2=A0 sourcefile =3D d.getVar(&#39;S&#39;)<br>
&gt;+=C2=A0 =C2=A0 for i in pseudoignorepaths:<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if i and sourcefile:<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if sourcefile.startswith(i) =
or i.startswith(sourcefile):<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status.addresu=
lt(&quot;a path included in=20
PSEUDO_IGNORE_PATHS &quot; + str(i) + &quot; and ${S} (source files) path &=
quot; +=20
str(sourcefile) + &quot; are overlapping each other, please set ${S} in you=
r=20
recipe to point to a different directory. \n&quot;)</div><div><br></div><di=
v>Isn&#39;t ${S} added to PSEUDO_IGNORE_PATHS almost every time  in meta/cl=
asses/base.bbclass?<br></div>=C2=A0 =C2=A0 if os.path.normpath(d.getVar(&qu=
ot;WORKDIR&quot;)) !=3D os.path.normpath(d.getVar(&quot;S&quot;)):<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&quot;PSEUDO_IGNORE_PATHS&quot;, &quot=
;,${S}&quot;)<br></div><br></div><div>Best regards,</div><div>Tomasz Dziend=
zielski<br></div></div>
</blockquote></div>

--000000000000583eec05b9f649f0--
