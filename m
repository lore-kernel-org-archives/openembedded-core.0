Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D7FC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 12:50:33 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.92101.1722603030404638551
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 05:50:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lQu3q8uz;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: rybczynska@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70ef732ff95so4170059b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 05:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722603030; x=1723207830; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qR3EJCf9eruVF0Rf8ji6n0jSyRqYtA6Vb5ZllOlTWAo=;
        b=lQu3q8uzfP6FC2TCs44kcygaXCChIwLH6CgFEaS4PdEwF4dof3mYdUPb7DxlE9n93I
         CULjPDR5dCS9xPTTjUCM8HkGzsfOGPxLikEE6qYRdgPCR/KF7pDuz433K2CGtKViu2vX
         nloMtvjE4QLNNCrUeJScDmr6h6XJWcNjASG9pnPGKWOQJrq/2VJh63LuxawB2m9rIYTj
         9gHKwVQvNxwLS4KANtcyAByfQdR/qEC00yCAbd7FMWD3+xYZhPDurAmz1R0fjcKxHhw/
         crAVz5hTyON37pZSJKqwiZeosKb5GaXp8NjJWmGtkfh5zoqDPbJ+oLiEDRUpit1cNq05
         K18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722603030; x=1723207830;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qR3EJCf9eruVF0Rf8ji6n0jSyRqYtA6Vb5ZllOlTWAo=;
        b=Q6MeZRZgNOfa51VZ6c4PJc65QSmkrSxS285OOli+PfqF1wGxGmOde96kyCotAJqXc1
         FKAaV15g3uYHkqJg8zDLEjdCKpOJ7rMzjZX7F4OByUqkcwceikWYTY6Hy0YXlkOCuhuO
         eOiKLg3RV9wNbZSteredCJcGQPJu39DXrXtCZ+ZZXa92qu0/FWP+I1lEqsDzWXp4Z8Sx
         srTr0eKFcIohdR143YjMOo8hZQTayPnieblKAdCZ+v/xG2NrEDZwUklKOm+MTo75qOKE
         UkGGlK+M/FQ9Ny7Bqpcqgfnk6Uuj8P0vdobfxzO2WajiQuz8N+cgaB8tudohsvNEqKWz
         ulAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQENaaXp1XGAj3N9mtTrUV7g4zU6qnwUpM+NA5i8d+1K888ZfE7j4haEAqmgaTL3tswVom6o0a4RZ5J31i+SSxnw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwX9Au94wnLX4m8VUl3yMQZGcWMR11WQ34dmKPN+NtZuo3HfPT3
	ThTQdn+YTJjUOt1K3Fw70DswWERukbMTvLHYwQWq8O+X/jpMrpUQRjiFZtFGrA26teDP2Ea29FW
	klI6AKKIaA0FH8FGiVGp1P3yFI9E=
X-Google-Smtp-Source: AGHT+IHEMCl2eYp+kmnObx1CsfFAwh65EiBTj/bi3RLIgDvIVAo5R5m9695fpUDptE0T1WkpTMxk9gQ2RHnPwbNxdHE=
X-Received: by 2002:a05:6a20:728d:b0:1c2:905c:dc2 with SMTP id
 adf61e73a8af0-1c699559d32mr3798873637.15.1722603029534; Fri, 02 Aug 2024
 05:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
 <6cf212c600dc109e86e16cf3cf73adc9864deebf.camel@linuxfoundation.org>
 <399979010dfd02323f49cbd25b95f606@syslinbit.com> <297305874abd246270ce7084d22beee7486b3e70.camel@linuxfoundation.org>
 <CAApg2=T-6ajkTYjG4c0XHK8qPWkB=1bccU_tgSHUY8yK645PhQ@mail.gmail.com> <9141dd53105bb878e3dc98252110bc9c9d2f0684.camel@linuxfoundation.org>
In-Reply-To: <9141dd53105bb878e3dc98252110bc9c9d2f0684.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 2 Aug 2024 14:50:17 +0200
Message-ID: <CAApg2=RRLDsj7jnQh=JJTZOzF2KsMvhqy9UKvxs5igX_TYAmwg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 1/5] cve-check: annotate CVEs during analysis
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: mrybczynska@syslinbit.com, openembedded-core@lists.openembedded.org, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>, 
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Content-Type: multipart/alternative; boundary="000000000000aa2139061eb2c547"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 12:50:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202906

--000000000000aa2139061eb2c547
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 4:25=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2024-07-26 at 15:02 +0200, Marta Rybczynska wrote:
> > On Thu, Jul 25, 2024 at 5:27=E2=80=AFPM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > > On Thu, 2024-07-25 at 16:48 +0200, mrybczynska@syslinbit.com wrote:
> > > > On 25.07.2024 16:29, Richard Purdie wrote:
> > > > > Hi Marta,
> > > > >
> > > > >
> > > > > With the v3 series applied we did just see this on the autobuilde=
r
> > > > > unfortunately so I'm not sure that problem is addressed:
> > > > >
> > > > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/7004/st=
eps/14/logs/stdio
> > > > >
> > > >
> > > > Hello Richard,
> > > > Thanks, this is unfortunate. Is it possible to have a copy of the
> > > > corrupted database somewhere?
> > >
> > > I think it is transient as we never clean it up and not all tasks fai=
l.
> > > That seems to imply it is a race of some kind.
> >
> > I have a few ideas of what it might be, but I do not have a reproducer
> right now. With the
> > vex changes, the duration of the cve_check operation changed slightly.
> On the other hand,
> > the database download is slower these days (I have had standalone runs
> that lasted for 5+ hours).
> > Also, I noticed that there were cancellations of some of the build, so
> the cancellation of the download
> > may be in play too.
> >
> > A question: autobuilder configuration does share DL_DIR among multiple
> builds?
>
> DL_DIR is shared between all the workers over NFS.
>
> > My possibility list right now:
> > - the "download" job timeout too short
> > - download failure/timeout
> > - job cancellation during the download
>
> While a download is in progress, the exclusive lock should be held. If
> the database were damaged, I'd then expect all subsequent cve_check
> tasks to fail the same way.
>
> In the failures, 2 or 3 tasks fail, the rest all continue to work. So
> ti doesn't really fit.
>

I would suspect there's a fetch job running in addition somewhere and it
manages to do the download. From that point, subsequent checks will work.
But where does that corruption come from - no idea.

I've noticed that tests *could* cause a database update and that the
temporary
download path will be the same for all instances (CVE_DB_TEMP_FILE). This
could cause corruption if the lock doesn't work as we expect it to.

Now, between kirkstone and master there should be no corruption, as this is
not the same database - files have different names as changed in
048ff0ad927f4d37cc5547ebeba9e0c221687ea6.


>
> > What do you think?
>
> I'm wondering if we should make the do_fetch of the database recipe
> copy the database to somewhere in TMPDIR when it finishes, then have
> the main cve_check class use the copy there. This would move NFS issues
> out the equation?
>
> That would be more in keeping with how other recipes work, just using
> DL_DIR as an accelerator.
>
>
We could do tweaks to make sure tests do not download the database
(CVE_DB_UPDATE_INTERVAL =3D "-1"). We could even do a run or two with
that set for the whole build for all configurations, to make sure the
corruption
does not happen at runtime.

We also have a standalone script to download the database (no change in
the format from the master branch), so we can use it and then point builds
to the copy, while disabling updates.

The source is here:
https://gitlab.com/syslinbit/public/yocto-vex-check/-/blob/main/cve-update-=
nvd2-native.py?ref_type=3Dheads

We can also change the location of the database and always keep it in TMPDI=
R
or such. This could mean a long wait for the download.

Which solution would you prefer to test?

Kind regards,
Marta

--000000000000aa2139061eb2c547
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 1, 2024 at 4:25=E2=80=AFP=
M Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">=
richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Fri, 2024-07-26 at 15:02 +0200, Marta =
Rybczynska wrote:<br>
&gt; On Thu, Jul 25, 2024 at 5:27=E2=80=AFPM Richard Purdie &lt;<a href=3D"=
mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie=
@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; On Thu, 2024-07-25 at 16:48 +0200, <a href=3D"mailto:mrybczynska@=
syslinbit.com" target=3D"_blank">mrybczynska@syslinbit.com</a> wrote:<br>
&gt; &gt; &gt; On 25.07.2024 16:29, Richard Purdie wrote:<br>
&gt; &gt; &gt; &gt; Hi Marta,<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; With the v3 series applied we did just see this on the =
autobuilder<br>
&gt; &gt; &gt; &gt; unfortunately so I&#39;m not sure that problem is addre=
ssed:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon=
/#/builders/87/builds/7004/steps/14/logs/stdio" rel=3D"noreferrer" target=
=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#/builders/87/buil=
ds/7004/steps/14/logs/stdio</a><br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Hello Richard,<br>
&gt; &gt; &gt; Thanks, this is unfortunate. Is it possible to have a copy o=
f the<br>
&gt; &gt; &gt; corrupted database somewhere?<br>
&gt; &gt; <br>
&gt; &gt; I think it is transient as we never clean it up and not all tasks=
 fail.<br>
&gt; &gt; That seems to imply it is a race of some kind.<br>
&gt; <br>
&gt; I have a few ideas of what it might be, but I do not have a reproducer=
 right now. With the<br>
&gt; vex changes, the duration of the cve_check operation changed slightly.=
 On the other hand,<br>
&gt; the database download is slower these days (I have had standalone runs=
 that lasted for 5+ hours).<br>
&gt; Also, I noticed that there were cancellations of some of the build, so=
 the cancellation of the download<br>
&gt; may be in play too.<br>
&gt; <br>
&gt; A question: autobuilder configuration does share DL_DIR among multiple=
 builds?<br>
<br>
DL_DIR is shared between all the workers over NFS.<br>
<br>
&gt; My possibility list right now:<br>
&gt; - the &quot;download&quot; job timeout too short<br>
&gt; - download failure/timeout<br>
&gt; - job cancellation during the download<br>
<br>
While a download is in progress, the exclusive lock should be held. If<br>
the database were damaged, I&#39;d then expect all subsequent cve_check<br>
tasks to fail the same way.<br>
<br>
In the failures, 2 or 3 tasks fail, the rest all continue to work. So<br>
ti doesn&#39;t really fit.<br></blockquote><div><br></div><div>I would susp=
ect there&#39;s a fetch job running in addition somewhere and it</div><div>=
manages to do the download. From that point, subsequent checks will work.</=
div><div>But where does that corruption come from - no idea.</div><div><br>=
</div><div>I&#39;ve noticed that tests *could* cause a database update and =
that the temporary</div><div>download path will be the same for all instanc=
es (CVE_DB_TEMP_FILE). This</div><div>could cause corruption if the lock do=
esn&#39;t work as we expect it to.</div><div><br></div><div>Now, between ki=
rkstone and master there should be no corruption, as this is</div><div>not =
the same database - files have different names <span style=3D"color:rgb(0,0=
,0)">as changed in=C2=A0</span></div><div><span style=3D"color:rgb(0,0,0);f=
ont-family:arial,sans-serif"><span style=3D"background-color:rgb(255,255,25=
5)">048ff0ad927f4d37cc5547ebeba9e0c221687ea6.</span><span style=3D"backgrou=
nd-color:rgb(255,255,255)"><br></span></span></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; What do you think?<br>
<br>
I&#39;m wondering if we should make the do_fetch of the database recipe<br>
copy the database to somewhere in TMPDIR when it finishes, then have<br>
the main cve_check class use the copy there. This would move NFS issues<br>
out the equation?<br>
<br>
That would be more in keeping with how other recipes work, just using<br>
DL_DIR as an accelerator. <br>
<br></blockquote><div><br></div><div>We could do tweaks to make sure tests =
do not download the database</div><div>(CVE_DB_UPDATE_INTERVAL =3D &quot;-1=
&quot;). We could even do a run or two with</div><div>that set for the whol=
e build for all configurations, to make sure the corruption</div><div>does =
not happen at runtime.</div><div><br></div><div>We also have a standalone s=
cript to download the database (no change in</div><div>the format from the =
master branch), so we can use it and then point builds</div><div>to the cop=
y, while disabling updates.</div><div><br></div><div>The source is here: <a=
 href=3D"https://gitlab.com/syslinbit/public/yocto-vex-check/-/blob/main/cv=
e-update-nvd2-native.py?ref_type=3Dheads">https://gitlab.com/syslinbit/publ=
ic/yocto-vex-check/-/blob/main/cve-update-nvd2-native.py?ref_type=3Dheads</=
a></div><div><br></div><div>We can also change the location of the database=
 and always keep it in TMPDIR</div><div>or such. This could mean a long wai=
t for the download.</div><div><br></div><div>Which solution would you prefe=
r to test?</div><div><br></div><div>Kind regards,</div><div>Marta<br> </div=
></div></div>

--000000000000aa2139061eb2c547--

