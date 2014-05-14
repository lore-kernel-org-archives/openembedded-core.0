Return-Path: <oram.embedded@gmail.com>
X-Greylist: delayed 363 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 14 May 2014 00:39:36 UTC
Received: from mail-yk0-f177.google.com (unknown [209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id ABC1660196
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 00:39:36 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id 19so987126ykq.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 17:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=fnuv3cZBSl28k4rcPJ2dYJjq1o0oYAzz6Lr9Qr0wew8=;
	b=g6kz+YrbtusB4aVJC6B865tmtN/7IX7+O9mu5G+4HR6mw3D3iU4lk4J9kl/fDjoZHZ
	pfsdv1CRIS7Y6dAOBmUb7U08I8FYCCUrp6G2TUBTLIaYbd5CpCyt1gj2NyMwDlHSu7zx
	5TagIjM+9nEH/Ug4qb7rt4ssTS/z62YqxS8BQo3eIpo+QTiNmyf/Qrs4Z24S202B4x6b
	jYbHBMc2B1UJvVvTOQRCVky1pnypPY8eKy9ANsU+0x5oRBBzkaCyo3LaQdzTDHlogzhT
	6euE4CUXr/1jB9ca+sZWcNTOMZ4ZPSQLm7Nzy9QEW5z2cGh1WUqSTStG34K1zeVPV6dX
	wVQA==
MIME-Version: 1.0
X-Received: by 10.236.157.167 with SMTP id o27mr239623yhk.127.1400027613814;
	Tue, 13 May 2014 17:33:33 -0700 (PDT)
Sender: oram.embedded@gmail.com
Received: by 10.170.229.84 with HTTP; Tue, 13 May 2014 17:33:33 -0700 (PDT)
Date: Wed, 14 May 2014 12:33:33 +1200
X-Google-Sender-Auth: _3ttd8DX7jT_msjRkVG9ZyI2czE
Message-ID: <CAGw0TDOG3uPt36sRbA5gqKcyTRkLi6sqdOgs6xkhZ5KFbp_omw@mail.gmail.com>
From: Charles Oram <charles@oram.co.nz>
To: openembedded-core@lists.openembedded.org
Subject: libmtp "Makefile.am: No such file or directory" build error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 May 2014 00:39:38 -0000
Content-Type: multipart/alternative; boundary=20cf303f676c98e50004f95154bf

--20cf303f676c98e50004f95154bf
Content-Type: text/plain; charset=UTF-8

Hi,
I am building an image using Yocto Project (dora branch) for the Cubox-i
and I am getting an error when trying to build libmtp.

Here is part of the log file (log.do_unpack) with the error:

DEBUG: Executing shell function skip_udev_rules_generation
sed: can't read Makefile.am: No such file or directory
WARNING: exit code 2 from a shell command.
ERROR: Function failed: skip_udev_rules_generation (log file is located at
/home/charles/fsl-community-bsp/build/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/libmtp/1.1.5-r0/temp/log.do_unpack.14617)

libmtp_1.1.5.bb has the following in it:

skip_udev_rules_generation () {
    sed -i -e '/^noinst_DATA=/,/util\/mtp-hotplug -H/d' Makefile.am
    cp ${WORKDIR}/69-libmtp.rules ${S}/
}

but it looks to me like it should be:

skip_udev_rules_generation () {
    sed -i -e '/^noinst_DATA=/,/util\/mtp-hotplug -H/d' ${S}/Makefile.am
    cp ${WORKDIR}/69-libmtp.rules ${S}/
}

i.e. with ${S}/ path to Makefile.am.

With this change it builds (not sure yet wither it runs as I have other
build errors to fix).
I'm still learning about Yocto and OpenEmbedded - does this fix look right?

regards,
Charles

--20cf303f676c98e50004f95154bf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br></div>I am building an image using Yocto Proje=
ct (dora branch) for the Cubox-i and I am getting an error when trying to b=
uild libmtp.<br><div><div><br>Here is part of the log file (log.do_unpack) =
with the error:<br>
<br>DEBUG: Executing shell function skip_udev_rules_generation<br>sed: can&=
#39;t read Makefile.am: No such file or directory<br>WARNING: exit code 2 f=
rom a shell command.<br>ERROR: Function failed: skip_udev_rules_generation =
(log file is located at /home/charles/fsl-community-bsp/build/tmp/work/cort=
exa9hf-vfp-neon-poky-linux-gnueabi/libmtp/1.1.5-r0/temp/log.do_unpack.14617=
)<br>
<br></div><div><a href=3D"http://libmtp_1.1.5.bb">libmtp_1.1.5.bb</a> has t=
he following in it:<br><br>skip_udev_rules_generation () {<br>=C2=A0=C2=A0=
=C2=A0 sed -i -e &#39;/^noinst_DATA=3D/,/util\/mtp-hotplug -H/d&#39; Makefi=
le.am<br>=C2=A0=C2=A0=C2=A0 cp ${WORKDIR}/69-libmtp.rules ${S}/<br>
}<br><br></div><div>but it looks to me like it should be:<br><br>skip_udev_=
rules_generation () {<br>=C2=A0=C2=A0=C2=A0 sed -i -e &#39;/^noinst_DATA=3D=
/,/util\/mtp-hotplug -H/d&#39; ${S}/Makefile.am<br>=C2=A0=C2=A0=C2=A0 cp ${=
WORKDIR}/69-libmtp.rules ${S}/<br>
}<br><br></div><div>i.e. with ${S}/ path to Makefile.am.<br><br></div><div>=
With this change it builds (not sure yet wither it runs as I have other bui=
ld errors to fix).<br></div><div>I&#39;m still learning about Yocto and Ope=
nEmbedded - does this fix look right?<br>
<br></div><div>regards,<br>Charles<br></div></div></div>

--20cf303f676c98e50004f95154bf--
