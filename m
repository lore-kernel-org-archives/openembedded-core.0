Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.339.1585868674579463359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2020 16:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rKCFON7N;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id 65so6331621wrl.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2020 16:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T6Ex8fn/vsxrpZke4JQHhe5emHxle+J3ICDeOrZ7w/A=;
        b=rKCFON7NcdN0ZMzkj3VbkyNMrTjP/WTp9KE7dbHJAxhmS3fdu2zx0DGNzk1aNagvyJ
         mSChBVtpXKI1Jqr8QFRyd/o7ZZz1AH/no+KmLJc7wrQ7/Mr22E+RB20faMsFNrwMVn6P
         A7hC4ULKr7KIqO4KmFHgPlb3qRr3i/in1OW3xDMmhvZB/Z1URAWIMioKjVfM/VnYpZrv
         +inPWR9K3zlNoFEiSt7esPg+gzYnCJGVl/ROuNvDeAyrDNw5QLdWE6gGVzxY4qDqSvn4
         VSzIBY6J9iX1v/jRJ3QtiENdbwDKEi3UpU23Si6mVOR7u2w4wr3fiCjEAkIvSKCWDiPH
         d1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T6Ex8fn/vsxrpZke4JQHhe5emHxle+J3ICDeOrZ7w/A=;
        b=uNYQxiU8+HVD/ZMJxv2LTX9WcS/qieCeWdpUVXL96Fu+Thu1QdOGJdNMcSJYG4X32v
         bgulxK3G6EYyXeRIuv9rs8w6EN0DE4U5Q0SHgCOTbPZ8wGYZLUrte69hyGadbxTH4sJg
         L4LR/Chn/K8QQGD2DkAca0EHVo1pLsn+nK9FL1K55TIZK1pL8BQPSwvgiGyp2vD2QN1J
         gDbH+VIvSV7g6WmlxCwq84iCpNPVlbPHVpYqEgXQ9Jyhf6szbRXH2bw2R6JSpJijzGKy
         YXYn/PUaxPUHJYAW5ygyB7/Y9I6MyiAVjJho31elRwnr2hUSc13n1fKnG0g4et/Dge8X
         H6qw==
X-Gm-Message-State: AGi0Pua9veopYDSlaGkp1rDEgU2740pk7ECp+YIWsFbE16bLAoG4lvDp
	DR16SvXT93Xx+oIGHd6xny9udVWZSaPFWE+9X8U=
X-Google-Smtp-Source: APiQypL/zcfQbp+6d5F2DX95EPyf+0/TO0CVpkIlh42a1sKHB8vS/s+GZMMH1kIqLoPuNakOZzflzsKHEgOyeBaJdAg=
X-Received: by 2002:adf:80af:: with SMTP id 44mr5853474wrl.241.1585868673027;
 Thu, 02 Apr 2020 16:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200402180832.12814-1-JPEWhacker@gmail.com> <7c6f84dd795b37bbabc594cc90683405933e3063.camel@linuxfoundation.org>
In-Reply-To: <7c6f84dd795b37bbabc594cc90683405933e3063.camel@linuxfoundation.org>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Thu, 2 Apr 2020 18:04:21 -0500
Message-ID: <CAJdd5GaCsfa6_kNA6SvH7LcA4mDpomVz=XQGvFOUm6g6biQJYA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/reproducible_build: Skip SDE for non-finalizing virtual recipes
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ea977d05a256d283"

--000000000000ea977d05a256d283
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 2, 2020, 3:15 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2020-04-02 at 13:08 -0500, Joshua Watt wrote:
> > Don't capture the source date epoch for recipes that are not being
> > finalized. This prevents a virtual recipe (e.g. multilib) from
> > attempting to read the source date epoch file from the non-virtual
> > recipes workdir.
> >
> > [YOCTO #13851]
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/classes/reproducible_build.bbclass | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
>
> Thanks, its a start. Unfortunately it pokes or assumes far too much
> knowledge of bitbake internals so we'll have to come up with something
> neater.
>

Ya I was in a hurry, but I was imagining some sort of
bb.utils.is_finalizing(d) to wrap the logic


> I'll give this some further thought.
>
> Cheers,
>
> Richard
>
> > diff --git a/meta/classes/reproducible_build.bbclass
> > b/meta/classes/reproducible_build.bbclass
> > index 8da40f656a..48ec9108a5 100644
> > --- a/meta/classes/reproducible_build.bbclass
> > +++ b/meta/classes/reproducible_build.bbclass
> > @@ -172,6 +172,20 @@ python create_source_date_epoch_stamp() {
> >  }
> >
> >  def get_source_date_epoch_value(d):
> > +    onlyfinalize = d.getVar('__ONLYFINALISE')
> > +    virtual = "%s:%s" % (d.getVar("BBEXTENDCURR") or "",
> > d.getVar("BBEXTENDVARIANT") or "")
> > +
> > +    if onlyfinalize == "default":
> > +        onlyfinalize = ":"
> > +
> > +    # Only capture the source date epoch if the current virtual
> > recipe is the
> > +    # one being finalized. This prevents looking for the SDE file in
> > another
> > +    # recipes ${WORKDIR}, where it may or may not exist
> > +    if onlyfinalize:
> > +        if onlyfinalize != virtual:
> > +            bb.debug(2, "Skipping SOURCE_DATE_EPOCH: virtual '%s' !=
> > finalize '%s'" % (virtual, onlyfinalize))
> > +            return 0
> > +
> >      cached = d.getVar('__CACHED_SOURCE_DATE_EPOCH')
> >      if cached:
> >          return cached
> > 
>
>

--000000000000ea977d05a256d283
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Apr 2, 2020, 3:15 PM Richard Purdie &lt;<a hre=
f=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundat=
ion.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, 2020=
-04-02 at 13:08 -0500, Joshua Watt wrote:<br>
&gt; Don&#39;t capture the source date epoch for recipes that are not bein=
g<br>
&gt; finalized. This prevents a virtual recipe (e.g. multilib) from<br>
&gt; attempting to read the source date epoch file from the non-virtual<br=
>
&gt; recipes workdir.<br>
&gt; <br>
&gt; [YOCTO #13851]<br>
&gt; <br>
&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">JPEWhacker@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/reproducible_build.bbclass | 14 ++++++++++++++<br>
&gt;=C2=A0 1 file changed, 14 insertions(+)<br>
<br>
Thanks, its a start. Unfortunately it pokes or assumes far too much<br>
knowledge of bitbake internals so we&#39;ll have to come up with something=
<br>
neater.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Ya I was in a hurry, but I was imagining some sort of bb.utils.i=
s_finalizing(d) to wrap the logic</div><div dir=3D"auto"><br></div><div dir=
=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
I&#39;ll give this some further thought.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
&gt; diff --git a/meta/classes/reproducible_build.bbclass<br>
&gt; b/meta/classes/reproducible_build.bbclass<br>
&gt; index 8da40f656a..48ec9108a5 100644<br>
&gt; --- a/meta/classes/reproducible_build.bbclass<br>
&gt; +++ b/meta/classes/reproducible_build.bbclass<br>
&gt; @@ -172,6 +172,20 @@ python create_source_date_epoch_stamp() {<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 def get_source_date_epoch_value(d):<br>
&gt; +=C2=A0 =C2=A0 onlyfinalize =3D d.getVar(&#39;__ONLYFINALISE&#39;)<br=
>
&gt; +=C2=A0 =C2=A0 virtual =3D &quot;%s:%s&quot; % (d.getVar(&quot;BBEXTE=
NDCURR&quot;) or &quot;&quot;,<br>
&gt; d.getVar(&quot;BBEXTENDVARIANT&quot;) or &quot;&quot;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if onlyfinalize =3D=3D &quot;default&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 onlyfinalize =3D &quot;:&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 # Only capture the source date epoch if the current vi=
rtual<br>
&gt; recipe is the<br>
&gt; +=C2=A0 =C2=A0 # one being finalized. This prevents looking for the S=
DE file in<br>
&gt; another<br>
&gt; +=C2=A0 =C2=A0 # recipes ${WORKDIR}, where it may or may not exist<br=
>
&gt; +=C2=A0 =C2=A0 if onlyfinalize:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if onlyfinalize !=3D virtual:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(2, &quot;Skipping=
 SOURCE_DATE_EPOCH: virtual &#39;%s&#39; !=3D<br>
&gt; finalize &#39;%s&#39;&quot; % (virtual, onlyfinalize))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cached =3D d.getVar(&#39;__CACHED_SOURCE_DATE_EPO=
CH&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if cached:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return cached<br>
&gt; <br>
<br>
</blockquote></div></div></div>

--000000000000ea977d05a256d283--
