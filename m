Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B18C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 08:57:52 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.5885.1659085062384997927
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 01:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LG7vIr69;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id p10so6362054lfd.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 01:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=H8UzSENf++0p2CMwpB9T1oerbpMBWuKndI5YgjZZ+Pk=;
        b=LG7vIr69lzAl8Ae1YosmDLauMmFJdR8wbNUSLc0ohVuvYUa683kU8ZlB9cAnT78c7r
         MhZjENlDm3+UGKdMyL+ZZggGF4nuM//wCo49tjw+zPYMd4yNg94RsfO6KaboCTc2JeLp
         FZU/ntxMjgyXSueyLSIaziPGnT9cOYy3zvhFPGFL/UF1hQLJHOEHHlMtH0BMnJpVl4h5
         9qEmtSwERXjv46JZKPYa+V6ndxW0Od1H84+vlx9MDKvBbLorLnMcV9lCi7AQWBG5/kAf
         x2dCM+FHnfihI4wGOefxEUoKcnojb3IMFaMxpHY+BHkUhM1OEv5MiasmRGDeXNxoMQCu
         KDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=H8UzSENf++0p2CMwpB9T1oerbpMBWuKndI5YgjZZ+Pk=;
        b=JSkKEouiDHdz17JiRR9++SEk2Z/8fOzJO68N81/d2yWNfZ0EdkCAb3qAYH7ME5GIqg
         g5mppVCeJbbpzZ0ehSUyZonfUzFg2ZGV4cIzCW/clIK49H7dVPIAhmeSzsHSDQ6IGxeE
         94tNn5V3dSXLDgPuq8tYihjpKwuGJGbVz5BRAOfE7kN2jXppwJOUq0hGCWNpVVT56YRF
         uOkHttt3u6mChfAwy11dtTBfCrIs/a+kfPTHhvlN5K6OORJKReK6P+DBeCi4YH7YCUhh
         SWTTt80HRd9+GbxkaU6xIi77BJ4J02MqWo6sYbjOlDH4Ndt+df3lrrgcet8S+dF4OFka
         nDyQ==
X-Gm-Message-State: ACgBeo3c49ODVHqOFZNRNPfDFCctajgPO3TkolB9M4nxgxEfo5Iqq6Im
	VMwLjdu+P2bZVNuOG7WO/J5cAIKsUgX6R+zkVHs=
X-Google-Smtp-Source: 
 AA6agR6vMdkLE4Oxye7Ip3HcoxX0sobImEZY1BSzpjvd7rSzzzCfCnbM23XzQIM7547Jc7fRqSb4GoUqwGtWYiQK/wM=
X-Received: by 2002:ac2:4142:0:b0:48a:e52a:d6f1 with SMTP id
 c2-20020ac24142000000b0048ae52ad6f1mr162352lfi.152.1659085059941; Fri, 29 Jul
 2022 01:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220728085407.293067-1-jose.quaresma@foundries.io>
 <b5964850b01ae9766ee70404edcf189e78c4921f.camel@linuxfoundation.org>
 <1705FBBA058AF979.1380@lists.openembedded.org>
 <CANPvuRknJ5w3161hpoCAXVycDcPLEG9yPmg_AmysC_4mj+AZQw@mail.gmail.com>
 <0cc4cf664450fda920f3c9176b56ce1955b83226.camel@linuxfoundation.org>
In-Reply-To: 
 <0cc4cf664450fda920f3c9176b56ce1955b83226.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 29 Jul 2022 09:57:11 +0100
Message-ID: 
 <CANPvuRn4mDR3dbB1fOjEFuq9EbKpYLVkFtXf8HbHzhzGF0nOqQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] create-spdx: Runs the do_create_spdx task after
 the do_package_write_*
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Ricardo Salveti <ricardo@foundries.io>, daiane.angolini@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000a6689405e4edd72f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 08:57:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168623

--000000000000a6689405e4edd72f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia quinta,
28/07/2022 =C3=A0(s) 22:15:

> On Thu, 2022-07-28 at 15:32 +0100, Jose Quaresma wrote:
> >
> >
> > Jose Quaresma via lists.openembedded.org
> > <quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu no dia
> > quinta, 28/07/2022 =C3=A0(s) 12:46:
> > >
> > >
> > > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> > > quinta, 28/07/2022 =C3=A0(s) 12:01:
> > > > On Thu, 2022-07-28 at 09:54 +0100, Jose Quaresma wrote:
> > > > > Otherwise spdx can have references for data that is not packed.
> > > > > in the package delivered.
> > > > >
> > > > > During do_package_write_ipk task in do_package_ipk some files
> > > > > is cleaned up from packages-split directory in the funcion
> > > > > cleanupcontrol.
> > > > >
> > > > > This also fixes the following race condictions when the
> > > > > do_create_spdx
> > > > > task runs the add_package_files function and these files is
> > > > > been deleted
> > > > > at same time in the task do_package_write_ipk:
> > > > >
> > > > > ERROR: alsa-topology-conf-1.2.5.1-r0 do_create_spdx: Error
> > > > > executing a python function in exec_func_python()
> > > > > autogenerated:
> > > > >
> > > > > The stack trace of python calls that resulted in this
> > > > > exception/failure was:
> > > > > File: 'exec_func_python() autogenerated', lineno: 2, function:
> > > > > <module>
> > > > >       0001:
> > > > >   *** 0002:do_create_spdx(d)
> > > > >       0003:
> > > > > File: '/srv/oe/build/conf/../../layers/openembedded-
> > > > > core/meta/classes/create-spdx.bbclass', lineno: 567, function:
> > > > > do_create_spdx
> > > > >       0563:
> > > > > package_doc.add_relationship(package_doc, "DESCRIBES",
> > > > > spdx_package)
> > > > >       0564:
> > > > >       0565:            package_archive =3D deploy_dir_spdx /
> > > > > "packages" / (package_doc.name + ".tar.zst")
> > > > >       0566:            with optional_tarfile(package_archive,
> > > > > archive_packaged) as archive:
> > > > >   *** 0567:                package_files =3D add_package_files(
> > > > >       0568:                    d,
> > > > >       0569:                    package_doc,
> > > > >       0570:                    spdx_package,
> > > > >       0571:                    pkgdest / package,
> > > > > File: '/srv/oe/build/conf/../../layers/openembedded-
> > > > > core/meta/classes/create-spdx.bbclass', lineno: 234, function:
> > > > > add_package_files
> > > > >       0230:                            info.mtime =3D
> > > > > source_date_epoch
> > > > >       0231:
> > > > >       0232:                        archive.addfile(info, f)
> > > > >       0233:
> > > > >   *** 0234:                sha1 =3D bb.utils.sha1_file(filepath)
> > > > >       0235:                sha1s.append(sha1)
> > > > >       0236:
> > > > > spdx_file.checksums.append(oe.spdx.SPDXChecksum(
> > > > >       0237:                        algorithm=3D"SHA1",
> > > > >       0238:                        checksumValue=3Dsha1,
> > > > > File: '/srv/oe/bitbake/lib/bb/utils.py', lineno: 559, function:
> > > > > sha1_file
> > > > >       0555:    """
> > > > >       0556:    Return the hex string representation of the SHA1
> > > > > checksum of the filename
> > > > >       0557:    """
> > > > >       0558:    import hashlib
> > > > >   *** 0559:    return _hasher(hashlib.sha1(), filename)
> > > > >       0560:
> > > > >       0561:def sha384_file(filename):
> > > > >       0562:    """
> > > > >       0563:    Return the hex string representation of the
> > > > > SHA384 checksum of the filename
> > > > > File: '/srv/oe/bitbake/lib/bb/utils.py', lineno: 528, function:
> > > > > _hasher
> > > > >       0524:
> > > > >       0525:def _hasher(method, filename):
> > > > >       0526:    import mmap
> > > > >       0527:
> > > > >   *** 0528:    with open(filename, "rb") as f:
> > > > >       0529:        try:
> > > > >       0530:            with mmap.mmap(f.fileno(), 0,
> > > > > access=3Dmmap.ACCESS_READ) as mm:
> > > > >       0531:                for chunk in iter(lambda:
> > > > > mm.read(8192), b''):
> > > > >       0532:                    method.update(chunk)
> > > > > Exception: FileNotFoundError: [Errno 2] No such file or
> > > > > directory: '/srv/oe/build/tmp-lmp/work/all-lmp-linux/alsa-
> > > > > topology-conf/1.2.5.1-r0/packages-split/alsa-topology-
> > > > > conf/CONTROL/control'
> > > >
> > > > We have other places where we've had to teach the code to ignore
> > > > the
> > > > control files and we'll probably have to do that here (grep for
> > > > CONTROL).
> > > >
> > >
> > >
> > > The snip that delete this files is in cleanupcontrol
> > >
> https://git.yoctoproject.org/poky/tree/meta/classes/package_ipk.bbclass#n=
51
> > >
> > > So these files are not shipped in the ipk package produced.
> > >
> >
> >
> > What I mean is those files are not part of the content deployed and
> > it is a requirement of the packing
> > standard used so tracking it the sbom doesn't make much sense imo.
>
> Right, it would be fine to make the spdx class skip them if they were
> present.
>
> > ar -xv deploy/ipk/all/alsa-topology-conf_1.2.5.1-r0_all.ipk
> > x - debian-binary
> > x - control.tar.gz
> > x - data.tar.xz
> >
> > For and deb and ipk we have in deb_write_pkg and ipk_write_pkg:
> >
> >     finally:
> >         cleanupcontrol(root)
> >         bb.utils.unlockfile(lf)
> >
> > For rpm we have in do_package_rpm:
> >
> >         # rpm 4 creates various empty directories in _topdir, let's
> > clean them up
> >         cleanupcmd =3D "rm -rf %s/BUILDROOT %s/SOURCES %s/SPECS
> > %s/SRPMS" % (workdir, workdir, workdir, workdir)
> >
> > So all of them delete this package control content at the end but as
> > do_create_spdx
> > runs at the same time it can see and track this content as well.
>
> Yes, it is a race. We've generally tweaked the code using these
> directories to ignore these files rather than change the dependencies
> though.
>
> Ideally we'd change dpkg/opkg to place the files somewhere else during
> package build but we've not worked out how to do that as yet.
>

Many thanks for the review and your time.
I will do that in this way, change dpkg/opkg to place the files somewhere
else.

Jose


> Cheers,
>
> Richard
>
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000a6689405e4edd72f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia quinta, 28/07/2022 =C3=A0(s) 22:15:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Thu, 2022-07-28 at 15:32 +0100, =
Jose Quaresma wrote:<br>
&gt; <br>
&gt; <br>
&gt; Jose Quaresma via <a href=3D"http://lists.openembedded.org" rel=3D"nor=
eferrer" target=3D"_blank">lists.openembedded.org</a><br>
&gt; &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; escreveu no di=
a<br>
&gt; quinta, 28/07/2022 =C3=A0(s) 12:46:<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; escrev=
eu no dia<br>
&gt; &gt; quinta, 28/07/2022 =C3=A0(s) 12:01:<br>
&gt; &gt; &gt; On Thu, 2022-07-28 at 09:54 +0100, Jose Quaresma wrote:<br>
&gt; &gt; &gt; &gt; Otherwise spdx can have references for data that is not=
 packed.<br>
&gt; &gt; &gt; &gt; in the package delivered.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; During do_package_write_ipk task in do_package_ipk some=
 files<br>
&gt; &gt; &gt; &gt; is cleaned up from packages-split directory in the func=
ion<br>
&gt; &gt; &gt; &gt; cleanupcontrol.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; This also fixes the following race condictions when the=
<br>
&gt; &gt; &gt; &gt; do_create_spdx<br>
&gt; &gt; &gt; &gt; task runs the add_package_files function and these file=
s is<br>
&gt; &gt; &gt; &gt; been deleted<br>
&gt; &gt; &gt; &gt; at same time in the task do_package_write_ipk:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; ERROR: alsa-topology-conf-1.2.5.1-r0 do_create_spdx: Er=
ror<br>
&gt; &gt; &gt; &gt; executing a python function in exec_func_python()<br>
&gt; &gt; &gt; &gt; autogenerated:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; The stack trace of python calls that resulted in this<b=
r>
&gt; &gt; &gt; &gt; exception/failure was:<br>
&gt; &gt; &gt; &gt; File: &#39;exec_func_python() autogenerated&#39;, linen=
o: 2, function:<br>
&gt; &gt; &gt; &gt; &lt;module&gt;<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0001:<br>
&gt; &gt; &gt; &gt; =C2=A0 *** 0002:do_create_spdx(d)<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0003:<br>
&gt; &gt; &gt; &gt; File: &#39;/srv/oe/build/conf/../../layers/openembedded=
-<br>
&gt; &gt; &gt; &gt; core/meta/classes/create-spdx.bbclass&#39;, lineno: 567=
, function:<br>
&gt; &gt; &gt; &gt; do_create_spdx<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0563:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<br>
&gt; &gt; &gt; &gt; package_doc.add_relationship(package_doc, &quot;DESCRIB=
ES&quot;,<br>
&gt; &gt; &gt; &gt; spdx_package)<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0564:<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0565:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 package_archive =3D deploy_dir_spdx /<br>
&gt; &gt; &gt; &gt; &quot;packages&quot; / (<a href=3D"http://package_doc.n=
ame" rel=3D"noreferrer" target=3D"_blank">package_doc.name</a> + &quot;.tar=
.zst&quot;)<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0566:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 with optional_tarfile(package_archive,<br>
&gt; &gt; &gt; &gt; archive_packaged) as archive:<br>
&gt; &gt; &gt; &gt; =C2=A0 *** 0567:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 package_files =3D add_package_files(<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0568:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d,<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0569:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 package_doc,<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0570:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spdx_package,<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0571:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgdest / package,<br>
&gt; &gt; &gt; &gt; File: &#39;/srv/oe/build/conf/../../layers/openembedded=
-<br>
&gt; &gt; &gt; &gt; core/meta/classes/create-spdx.bbclass&#39;, lineno: 234=
, function:<br>
&gt; &gt; &gt; &gt; add_package_files<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0230:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.=
mtime =3D<br>
&gt; &gt; &gt; &gt; source_date_epoch<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0231:<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0232:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archive.addfile(inf=
o, f)<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0233:<br>
&gt; &gt; &gt; &gt; =C2=A0 *** 0234:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 sha1 =3D bb.utils.sha1_file(filepath)<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0235:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sha1s.append(sha1)<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0236:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt; &gt; &gt; spdx_file.checksums.append(oe.spdx.SPDXChecksum(<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0237:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 algorithm=3D&quot;S=
HA1&quot;,<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0238:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 checksumValue=3Dsha=
1,<br>
&gt; &gt; &gt; &gt; File: &#39;/srv/oe/bitbake/lib/bb/utils.py&#39;, lineno=
: 559, function:<br>
&gt; &gt; &gt; &gt; sha1_file<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0555:=C2=A0 =C2=A0 &quot;&quot;&qu=
ot;<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0556:=C2=A0 =C2=A0 Return the hex =
string representation of the SHA1<br>
&gt; &gt; &gt; &gt; checksum of the filename<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0557:=C2=A0 =C2=A0 &quot;&quot;&qu=
ot;<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0558:=C2=A0 =C2=A0 import hashlib<=
br>
&gt; &gt; &gt; &gt; =C2=A0 *** 0559:=C2=A0 =C2=A0 return _hasher(hashlib.sh=
a1(), filename)<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0560:<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0561:def sha384_file(filename):<br=
>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0562:=C2=A0 =C2=A0 &quot;&quot;&qu=
ot;<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0563:=C2=A0 =C2=A0 Return the hex =
string representation of the<br>
&gt; &gt; &gt; &gt; SHA384 checksum of the filename<br>
&gt; &gt; &gt; &gt; File: &#39;/srv/oe/bitbake/lib/bb/utils.py&#39;, lineno=
: 528, function:<br>
&gt; &gt; &gt; &gt; _hasher<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0524:<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0525:def _hasher(method, filename)=
:<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0526:=C2=A0 =C2=A0 import mmap<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0527:<br>
&gt; &gt; &gt; &gt; =C2=A0 *** 0528:=C2=A0 =C2=A0 with open(filename, &quot=
;rb&quot;) as f:<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0529:=C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
ry:<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0530:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 with mmap.mmap(f.fileno(), 0,<br>
&gt; &gt; &gt; &gt; access=3Dmmap.ACCESS_READ) as mm:<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0531:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for chunk in iter(lambda:<br>
&gt; &gt; &gt; &gt; mm.read(8192), b&#39;&#39;):<br>
&gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 0532:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 method.update(chunk)<br>
&gt; &gt; &gt; &gt; Exception: FileNotFoundError: [Errno 2] No such file or=
<br>
&gt; &gt; &gt; &gt; directory: &#39;/srv/oe/build/tmp-lmp/work/all-lmp-linu=
x/alsa-<br>
&gt; &gt; &gt; &gt; topology-conf/1.2.5.1-r0/packages-split/alsa-topology-<=
br>
&gt; &gt; &gt; &gt; conf/CONTROL/control&#39;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; We have other places where we&#39;ve had to teach the code t=
o ignore<br>
&gt; &gt; &gt; the<br>
&gt; &gt; &gt; control files and we&#39;ll probably have to do that here (g=
rep for<br>
&gt; &gt; &gt; CONTROL).<br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; The snip=C2=A0that delete this files is in=C2=A0cleanupcontrol<br=
>
&gt; &gt; <a href=3D"https://git.yoctoproject.org/poky/tree/meta/classes/pa=
ckage_ipk.bbclass#n51" rel=3D"noreferrer" target=3D"_blank">https://git.yoc=
toproject.org/poky/tree/meta/classes/package_ipk.bbclass#n51</a><br>
&gt; &gt; <br>
&gt; &gt; So these=C2=A0files are not shipped=C2=A0in the ipk package produ=
ced.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; What I mean is those files are not part of the content deployed and<br=
>
&gt; it is a requirement=C2=A0of the packing<br>
&gt; standard used so tracking it the sbom doesn&#39;t make much sense imo.=
<br>
<br>
Right, it would be fine to make the spdx class skip them if they were<br>
present.<br>
<br>
&gt; ar -xv deploy/ipk/all/alsa-topology-conf_1.2.5.1-r0_all.ipk<br>
&gt; x - debian-binary<br>
&gt; x - control.tar.gz<br>
&gt; x - data.tar.xz<br>
&gt; <br>
&gt; For and deb and ipk we have in deb_write_pkg and ipk_write_pkg:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; =C2=A0 =C2=A0 finally:<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0cleanupcontrol(root)<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.unlockfile(lf)<br>
&gt; <br>
&gt; For rpm we have in do_package_rpm:<br>
&gt; <br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 # rpm 4 creates various empty directories =
in _topdir, let&#39;s<br>
&gt; clean them up<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0cleanupcmd =3D &quot;rm -rf %s/BUILDR=
OOT %s/SOURCES %s/SPECS<br>
&gt; %s/SRPMS&quot; % (workdir, workdir, workdir, workdir)<br>
&gt; =C2=A0<br>
&gt; So all of them delete this package control content at the end but as<b=
r>
&gt; do_create_spdx<br>
&gt; runs at the same time it can see and track this content as well.<br>
<br>
Yes, it is a race. We&#39;ve generally tweaked the code using these<br>
directories to ignore these files rather than change the dependencies<br>
though.<br>
<br>
Ideally we&#39;d change dpkg/opkg to place the files somewhere else during<=
br>
package build but we&#39;ve not worked out how to do that as yet.<br></bloc=
kquote><div><br>Many thanks for the review and your time.<br>I will do that=
 in this way, change dpkg/opkg to place the files somewhere else.</div><div=
><br></div><div>Jose<br><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000a6689405e4edd72f--

