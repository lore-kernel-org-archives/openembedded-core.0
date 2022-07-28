Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B6EC04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 21:15:19 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.862.1659042916908109693
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 14:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G8Ihlh4O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id
 x23-20020a05600c179700b003a30e3e7989so1671061wmo.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 14:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=50Y1Oax1kZols9GhkDPbqDGHVVPv/MGQtgBgqH2Q0Sc=;
        b=G8Ihlh4OpO66SL1kGv6KNSf/SUq9hKU9wJUjGUjG+tP0s8deFndzCbqiOj8GlA+AaW
         wNb1h+v02OJ8t3fsN/QszQ0AKX/m/JCzXb/YXELFyoA6QDRvx8Z6pay+xsBCesy0twvD
         JKvBCy3Ap+c/Rr0St5CVpPSz30CaSd0cXmiAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=50Y1Oax1kZols9GhkDPbqDGHVVPv/MGQtgBgqH2Q0Sc=;
        b=Ws0ihd960GjImE7bK++VZThrYkvvPfTa9rUhUn2kJXtGrWFmm6/bHyyoZGtdhVagvo
         mWgUJRMz0rSPOGOmn3JQCXJH9v+sm7G7e9jllgXirqO5NvWT7D41LTEOtwoP9boFvqGG
         /yFmijBW7FhaDtr92xKBoxQC6GGRC6kxqxnKMjTDOgVOqlVKU5g0pPCB5jZTLiT4mIgW
         UnNK3rH9FDpjYeiwArpz4aJhhug6uNUU7WUQTEQ4k6LsLohf2nEX0Wxgtj+0/ayBeZAX
         7TQuZU6va9cvAEh6FvIZZFbzMybK+0mzKuty9xHJShdDGy7l2noD9q/TQsFBSi/vyEub
         EOOA==
X-Gm-Message-State: AJIora9GWk7oJ8u3OMK0fcYFf2A+K2hl8hTjIlbmne5X8vwKVJCg48ab
	DbU48XmOLpJRvmcd9hqgyEjMpw==
X-Google-Smtp-Source: 
 AGRyM1uayP21Lmjc8rCzjryNzPWiiMT7AeL9L9IxwztQJAe34AV8MCx3B7rvFHE6UXPs+A3tzx4ypA==
X-Received: by 2002:a05:600c:3b9a:b0:3a3:21c2:e289 with SMTP id
 n26-20020a05600c3b9a00b003a321c2e289mr402221wms.77.1659042915131;
        Thu, 28 Jul 2022 14:15:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8ec8:b67:91aa:e08?
 ([2001:8b0:aba:5f3c:8ec8:b67:91aa:e08])
        by smtp.gmail.com with ESMTPSA id
 n40-20020a05600c3ba800b003a2ed2a40e4sm6935042wms.17.2022.07.28.14.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 14:14:59 -0700 (PDT)
Message-ID: 
 <0cc4cf664450fda920f3c9176b56ce1955b83226.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] create-spdx: Runs the do_create_spdx task
 after the do_package_write_*
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Ricardo Salveti
	 <ricardo@foundries.io>, daiane.angolini@foundries.io, Jose Quaresma
	 <jose.quaresma@foundries.io>
Date: Thu, 28 Jul 2022 22:14:46 +0100
In-Reply-To: 
 <CANPvuRknJ5w3161hpoCAXVycDcPLEG9yPmg_AmysC_4mj+AZQw@mail.gmail.com>
References: <20220728085407.293067-1-jose.quaresma@foundries.io>
	 <b5964850b01ae9766ee70404edcf189e78c4921f.camel@linuxfoundation.org>
	 <1705FBBA058AF979.1380@lists.openembedded.org>
	 <CANPvuRknJ5w3161hpoCAXVycDcPLEG9yPmg_AmysC_4mj+AZQw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 21:15:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168619

On Thu, 2022-07-28 at 15:32 +0100, Jose Quaresma wrote:
>=20
>=20
> Jose Quaresma via lists.openembedded.org
> <quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu no dia
> quinta, 28/07/2022 =C3=A0(s) 12:46:
> >=20
> >=20
> > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> > quinta, 28/07/2022 =C3=A0(s) 12:01:
> > > On Thu, 2022-07-28 at 09:54 +0100, Jose Quaresma wrote:
> > > > Otherwise spdx can have references for data that is not packed.
> > > > in the package delivered.
> > > >=20
> > > > During do_package_write_ipk task in do_package_ipk some files
> > > > is cleaned up from packages-split directory in the funcion
> > > > cleanupcontrol.
> > > >=20
> > > > This also fixes the following race condictions when the
> > > > do_create_spdx
> > > > task runs the add_package_files function and these files is
> > > > been deleted
> > > > at same time in the task do_package_write_ipk:
> > > >=20
> > > > ERROR: alsa-topology-conf-1.2.5.1-r0 do_create_spdx: Error
> > > > executing a python function in exec_func_python()
> > > > autogenerated:
> > > >=20
> > > > The stack trace of python calls that resulted in this
> > > > exception/failure was:
> > > > File: 'exec_func_python() autogenerated', lineno: 2, function:
> > > > <module>
> > > > =C2=A0 =C2=A0 =C2=A0 0001:
> > > > =C2=A0 *** 0002:do_create_spdx(d)
> > > > =C2=A0 =C2=A0 =C2=A0 0003:
> > > > File: '/srv/oe/build/conf/../../layers/openembedded-
> > > > core/meta/classes/create-spdx.bbclass', lineno: 567, function:
> > > > do_create_spdx
> > > > =C2=A0 =C2=A0 =C2=A0 0563:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
> > > > package_doc.add_relationship(package_doc, "DESCRIBES",
> > > > spdx_package)
> > > > =C2=A0 =C2=A0 =C2=A0 0564:
> > > > =C2=A0 =C2=A0 =C2=A0 0565:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 package_archive =3D deploy_dir_spdx /
> > > > "packages" / (package_doc.name + ".tar.zst")
> > > > =C2=A0 =C2=A0 =C2=A0 0566:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 with optional_tarfile(package_archive,
> > > > archive_packaged) as archive:
> > > > =C2=A0 *** 0567:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 package_files =3D add_package_files(
> > > > =C2=A0 =C2=A0 =C2=A0 0568:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d,
> > > > =C2=A0 =C2=A0 =C2=A0 0569:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 package_doc,
> > > > =C2=A0 =C2=A0 =C2=A0 0570:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spdx_package,
> > > > =C2=A0 =C2=A0 =C2=A0 0571:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkgdest / package,
> > > > File: '/srv/oe/build/conf/../../layers/openembedded-
> > > > core/meta/classes/create-spdx.bbclass', lineno: 234, function:
> > > > add_package_files
> > > > =C2=A0 =C2=A0 =C2=A0 0230:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.mtime =3D
> > > > source_date_epoch
> > > > =C2=A0 =C2=A0 =C2=A0 0231:
> > > > =C2=A0 =C2=A0 =C2=A0 0232:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archive.addfile(info, f)
> > > > =C2=A0 =C2=A0 =C2=A0 0233:
> > > > =C2=A0 *** 0234:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sha1 =3D bb.utils.sha1_file(filepath)
> > > > =C2=A0 =C2=A0 =C2=A0 0235:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 sha1s.append(sha1)
> > > > =C2=A0 =C2=A0 =C2=A0 0236:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0
> > > > spdx_file.checksums.append(oe.spdx.SPDXChecksum(
> > > > =C2=A0 =C2=A0 =C2=A0 0237:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 algorithm=3D"SHA1",
> > > > =C2=A0 =C2=A0 =C2=A0 0238:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 checksumValue=3Dsha1,
> > > > File: '/srv/oe/bitbake/lib/bb/utils.py', lineno: 559, function:
> > > > sha1_file
> > > > =C2=A0 =C2=A0 =C2=A0 0555:=C2=A0 =C2=A0 """
> > > > =C2=A0 =C2=A0 =C2=A0 0556:=C2=A0 =C2=A0 Return the hex string repre=
sentation of the SHA1
> > > > checksum of the filename
> > > > =C2=A0 =C2=A0 =C2=A0 0557:=C2=A0 =C2=A0 """
> > > > =C2=A0 =C2=A0 =C2=A0 0558:=C2=A0 =C2=A0 import hashlib
> > > > =C2=A0 *** 0559:=C2=A0 =C2=A0 return _hasher(hashlib.sha1(), filena=
me)
> > > > =C2=A0 =C2=A0 =C2=A0 0560:
> > > > =C2=A0 =C2=A0 =C2=A0 0561:def sha384_file(filename):
> > > > =C2=A0 =C2=A0 =C2=A0 0562:=C2=A0 =C2=A0 """
> > > > =C2=A0 =C2=A0 =C2=A0 0563:=C2=A0 =C2=A0 Return the hex string repre=
sentation of the
> > > > SHA384 checksum of the filename
> > > > File: '/srv/oe/bitbake/lib/bb/utils.py', lineno: 528, function:
> > > > _hasher
> > > > =C2=A0 =C2=A0 =C2=A0 0524:
> > > > =C2=A0 =C2=A0 =C2=A0 0525:def _hasher(method, filename):
> > > > =C2=A0 =C2=A0 =C2=A0 0526:=C2=A0 =C2=A0 import mmap
> > > > =C2=A0 =C2=A0 =C2=A0 0527:
> > > > =C2=A0 *** 0528:=C2=A0 =C2=A0 with open(filename, "rb") as f:
> > > > =C2=A0 =C2=A0 =C2=A0 0529:=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:
> > > > =C2=A0 =C2=A0 =C2=A0 0530:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 with mmap.mmap(f.fileno(), 0,
> > > > access=3Dmmap.ACCESS_READ) as mm:
> > > > =C2=A0 =C2=A0 =C2=A0 0531:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 for chunk in iter(lambda:
> > > > mm.read(8192), b''):
> > > > =C2=A0 =C2=A0 =C2=A0 0532:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 method.update(chunk)
> > > > Exception: FileNotFoundError: [Errno 2] No such file or
> > > > directory: '/srv/oe/build/tmp-lmp/work/all-lmp-linux/alsa-
> > > > topology-conf/1.2.5.1-r0/packages-split/alsa-topology-
> > > > conf/CONTROL/control'
> > >=20
> > > We have other places where we've had to teach the code to ignore
> > > the
> > > control files and we'll probably have to do that here (grep for
> > > CONTROL).
> > >=20
> >=20
> >=20
> > The snip=C2=A0that delete this files is in=C2=A0cleanupcontrol
> > https://git.yoctoproject.org/poky/tree/meta/classes/package_ipk.bbclass=
#n51
> >=20
> > So these=C2=A0files are not shipped=C2=A0in the ipk package produced.
> >=20
>=20
>=20
> What I mean is those files are not part of the content deployed and
> it is a requirement=C2=A0of the packing
> standard used so tracking it the sbom doesn't make much sense imo.

Right, it would be fine to make the spdx class skip them if they were
present.

> ar -xv deploy/ipk/all/alsa-topology-conf_1.2.5.1-r0_all.ipk
> x - debian-binary
> x - control.tar.gz
> x - data.tar.xz
>=20
> For and deb and ipk we have in deb_write_pkg and ipk_write_pkg:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0=20
> =C2=A0 =C2=A0 finally:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0cleanupcontrol(root)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.unlockfile(lf)
>=20
> For rpm we have in do_package_rpm:
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 # rpm 4 creates various empty directories in =
_topdir, let's
> clean them up
> =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0cleanupcmd =3D "rm -rf %s/BUILDROOT %s/S=
OURCES %s/SPECS
> %s/SRPMS" % (workdir, workdir, workdir, workdir)
> =C2=A0
> So all of them delete this package control content at the end but as
> do_create_spdx
> runs at the same time it can see and track this content as well.

Yes, it is a race. We've generally tweaked the code using these
directories to ignore these files rather than change the dependencies
though.

Ideally we'd change dpkg/opkg to place the files somewhere else during
package build but we've not worked out how to do that as yet.

Cheers,

Richard



