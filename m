Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.11331.1603988019037215986
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 09:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r8sj/BBJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id v19so3598463edx.9
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 09:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PrVKh8XWaoM1X7PInZSy3QMqlZaOogRiRI2sStbT7v8=;
        b=r8sj/BBJunwIHtFw+G79IhZXq9ajIBATQkCa5tgIIdztNuNsbRZwLBMAgvzJXoucRf
         mGIB85Dnkbe/ev/TPHjtZqO0Kt2C14/QObLVpdxC39HmA3ELDOfCA3hgyw64KA82t3CR
         jNKPGPD4925k80XyFZZs4I4k22JBDwW5TQKmIkNhFBlOk0CHEWqqDFL1mDmhuLrwVILl
         grZZSUdRmAu/MmWspyy/OHNALD3XQCvZDeqzm3G6n6t25fhr9kmwqV1O6PK14dLo/74D
         iJivd/NrMXJf7B2wyZZi76aX14CG2fbQkg4q2eqyN7XpNmaAUwcsvNbRFQGdW9oGR3Eh
         RR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PrVKh8XWaoM1X7PInZSy3QMqlZaOogRiRI2sStbT7v8=;
        b=nVqcT7fAykfEELqsj28TiHv7Ift/a4Bl8jMhfGg/y0c27lsvjk4w3mvYFS+Uzk3Io8
         HqsWXtqJek6oUe0I4pdeuEj3w9NbKEPXr+3wy8f5EXMY1MRb5S8TJPEbpjUqp+mCD9lS
         FaKKEjRp4dBdVzfVrHGoOiOUlnyI1qEVq2MIEixKaqMaCz2qM6EV9pVG7tIw16S9oztF
         q0Kr6qZcJRQdw6lk8lYlWWi6W1Ti9vze+DYkRk7e1GWhf65LZZRBHMPWbiLtwFucrbfk
         5Tu8MqVGkXNNzf9SDdrCAtc+rAWMLUnoWy6qkF/7gdK7ftuHO6b8+3Vrllg8dbEm0/my
         uiNw==
X-Gm-Message-State: AOAM532IYOSeIe4uk4HrWorIJPBi1SI+5RRE2an0uW+X8zi8UJY+kZcq
	hMllOvrOfOCw67r2b3S4DNkEwVtYfdaiVEHkMtE=
X-Google-Smtp-Source: ABdhPJyNqINuwUegSZmr4VLbTZ/lsFENs3/9SdjtmB8rUlH6RH9DQps+ecX98n2VsRi68mBioXeAsPdnfdlOhFgG5jE=
X-Received: by 2002:a50:99c3:: with SMTP id n3mr4763706edb.213.1603988017447;
 Thu, 29 Oct 2020 09:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
 <20201029142806.1830504-2-quaresma.jose@gmail.com> <7ff661d33eefed532bff3a1509f23fa26cc289a9.camel@linuxfoundation.org>
In-Reply-To: <7ff661d33eefed532bff3a1509f23fa26cc289a9.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Thu, 29 Oct 2020 16:13:37 +0000
Message-ID: <CANPvuRmmJ_kcFWErPue-Ub-N_F_8YM=MAO7n1s2DoYhuU9fwVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 01/22] gstreamer1.0: Fix reproducibility issue around libcap
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It looks for setcap in /usr/sbin and /sbin but needs libcap as wheel.
when we have libcaps on DEPENDS as with version 1.16 and the host
system has setcap binary, it introduces a dependency on the host
system.
The patch fixes this situation.

But libcap is only needed if we need to use the setcap
So remove libcap from DEPENDS will fail to use
'ptp-helper-permissions=3Dcapabilities' even if setcap is found on the
host.

In my opinion this a better description can be used in this
PACKAGECONFIG, something like this:

-PACKAGECONFIG[setcap] =3D ",,libcap libcap-native"
+PACKAGECONFIG[capabilities] =3D
"-Dptp-helper-permissions=3Dcapabilities,,libcap libcap-native"

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
quinta, 29/10/2020 =C3=A0(s) 15:32:
>
> On Thu, 2020-10-29 at 14:27 +0000, Jose Quaresma wrote:
> > Currently gstreamer configuration depends libcap and on whether
> > setcap is found on the host system.
> >
> > Removing libcap from DEPENDS and only use it when the 'setcap' is enabl=
ed.
> >
> >     * capfix.patch
> >       Removed as the same goals can be achieved only with the PACKAGECO=
NFIG 'setcap'
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  .../gstreamer/gstreamer1.0/capfix.patch       | 37 -------------------
> >  .../gstreamer/gstreamer1.0_1.16.2.bb          |  5 +--
> >  2 files changed, 2 insertions(+), 40 deletions(-)
> >  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/capf=
ix.patch
> >
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patc=
h b/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
> > deleted file mode 100644
> > index 7ca3d5ad4a..0000000000
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
> > +++ /dev/null
> > @@ -1,37 +0,0 @@
> > -Currently gstreamer configuration depends on whether setcap is found o=
n the host
> > -system. Turn this into a configure option to make builds deterinistic.
> > -
> > -RP 2020/2/19
> > -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > -Upstream-Status: Pending
> > -
> > -Index: gstreamer-1.16.1/libs/gst/helpers/meson.build
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- gstreamer-1.16.1.orig/libs/gst/helpers/meson.build
> > -+++ gstreamer-1.16.1/libs/gst/helpers/meson.build
> > -@@ -73,7 +73,12 @@ if have_ptp
> > -     endif
> > -   endif
> > -
> > --  setcap =3D find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap=
', required : false)
> > -+  setcap_feature =3D get_option('setcap')
> > -+  if setcap_feature.disabled()
> > -+    setcap =3D find_program('dontexist', required : false)
> > -+  else
> > -+    setcap =3D find_program('setcap', '/usr/sbin/setcap', '/sbin/setc=
ap', required : false)
> > -+  endif
> > -
>
> I did have a question about this. I think the problem this patch was
> fixing was that <PATH>/setcap was being coded into the headers and
> hence the output regardless of whether setcap was enabled or disabled.
> Since its looking directly at /usr/sbin/ and /sbin/, this made it
> depend on the host system it was built on.
>
> Are you saying that is no longer encoded in the output?
>
> Cheers,
>
> Richard
>


--=20
best regards,
Jos=C3=A9 Quaresma
