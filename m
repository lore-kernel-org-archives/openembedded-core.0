Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.12827.1599656227255376873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 05:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BTnQdLk0;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: broeckaert.goran@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id a22so3346440ljp.13
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 05:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=sL38ml4a9tqC6B742390/0G/Ay+qeHFePmQEQiokMg0=;
        b=BTnQdLk0I8cBQFlUjiNnO+IBP78C1l4F84WOKx01ZzXuL8oZIe2bof73KKS+Q5LqCo
         +un14DsNlRZ66E17xFzWdvGfjcuVBe8fCuZ2Ygn8OXiGuSv1E+fXtSyr/ab6pWUoC9Bd
         d8TK69DgWhEJy7yuwBzaqBXqKEIb6FA8X92AP8YQ7wTfTiWtuWxiBmbq4pe2aevKmFbv
         AC8OrfTQsdMbjNtFsZ8VBHFEMHSxnnCSlLV0JxM1l/aQ2DYDgY8UVEYlqSzJcBORDXHO
         DiKjT96ApGL6aSggn9jtbFQedHa35NJwxMV8Ir330AYJBGf9k/rM/oovmgu/+vDEVvS5
         KSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=sL38ml4a9tqC6B742390/0G/Ay+qeHFePmQEQiokMg0=;
        b=SuGqgsRYUMLuF9PGCMU6ORv2+gHXmRVbC4qWqJP636vE2lx8OoWPhe64ID02Vx54jb
         fpT5g2FhI2CqM6EWc7Q3NU/mUe+naCZwPFdWBsXvEyBLqN/7XebQeEQZCpCKp0Mg/+JT
         TXQWSApwuBYFSi3IQ+D4i15XTCojgu1uQUsDjZu8D02g/GIwH/kBtKbEfVs5dk/5N5Or
         BAYdGpzhXE/02kXE6qjxhEj94eqarUnwMG1wy5n8SNXTKHl8nBj6z7E96Y+8PPT56T0+
         cUYHIYg4cG4rb1bfiuDOmZQfsYBpCbSXjc99lE31+E2+cjbH+beDmIa5K6MG6QIYIEmS
         Wslw==
X-Gm-Message-State: AOAM532+8iEgd+LJ+wc0jj/TYTFqp52UbWAOSPD6LYnsl+YwGsRZM+Rq
	xRzJS98zOAtcqcUBne/OV8W7PGtd1/xA2Pe3D1Cf0H7hXNNsNA==
X-Google-Smtp-Source: ABdhPJx2BraHMCOjNuipYNI9hjqZaF8D0Afr3j8LQIl5omyB2HHeCPsk14ODxbBn6AaCrOn2GIb4RpEP7iXCBAYP7oc=
X-Received: by 2002:a2e:9d19:: with SMTP id t25mr1784165lji.222.1599656224648;
 Wed, 09 Sep 2020 05:57:04 -0700 (PDT)
MIME-Version: 1.0
From: broeckaert.goran@gmail.com
Date: Wed, 9 Sep 2020 14:56:53 +0200
Message-ID: <CANq43+EQnPYiWxqFBK6Zb6j99ot_ZUNVkE69EHYfcLv2DefvHA@mail.gmail.com>
Subject: Application depending on gRPC not linking properly
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000008933d05aee0fddd"

--00000000000008933d05aee0fddd
Content-Type: text/plain; charset="UTF-8"

Hello,

I have a simple application which depends on grpc. I'm using Yocto Zeus for
my project and I've written the following recipe:

DESCRIPTION = "Test Application"
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = ""

SRC_URI = "\
git://git/dev/test-application.git;protocol=ssh;branch=yocto;name=testapp \
"

inherit cmake qmake5_paths

DEPENDS = "\
qtbase \
qtbase-native \
grpc \
grpc-native \
"

PV = "1.0+git${SRVPV}"

SRCREV_testapp = "c1dd51dd6c812a99f6af3e5b1c367a3155e5e96f"

S = "${WORKDIR}/git"

EXTRA_OECMAKE = "\
-DCMAKE_PREFIX_PATH=${WORKDIR}/recipe-sysroot/usr/ \
-DOE_QMAKE_PATH_EXTERNAL_HOST_BINS=${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \
-DCMAKE_CROSSCOMPILING=ON \
"

The linker tries to link with the -native version of gRPC instead of the
target one. Can be seen in the following line from the output:

recipe-sysroot-native/usr/lib/libgrpc++.so.1.24.1: error adding symbols:
file in wrong format

When checking the recipe-sysroot, the grpc libraries are properly
installed. There has been an issue opened on the grpc github, but it got
closed without specifying a solution:
https://github.com/grpc/grpc/issues/17708

Thanks for the help,

Kind regards,
Goran Broeckaert

--00000000000008933d05aee0fddd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I have a simple application whic=
h depends on grpc. I&#39;m using Yocto Zeus for my project and I&#39;ve wri=
tten the following recipe:</div><div><br></div><div>DESCRIPTION =3D &quot;T=
est Application&quot;</div><div>LICENSE =3D &quot;CLOSED&quot;</div><div>LI=
C_FILES_CHKSUM =3D &quot;&quot;</div><div><br></div><div>SRC_URI =3D &quot;=
\</div><div>git://git/dev/test-application.git;protocol=3Dssh;branch=3Dyoct=
o;name=3Dtestapp \</div><div>&quot;</div><div><br></div><div>inherit cmake =
qmake5_paths</div><div><br></div><div>DEPENDS =3D &quot;\</div><div>qtbase =
\</div><div>qtbase-native \</div><div>grpc \</div><div>grpc-native \</div><=
div>&quot;</div><div><br></div><div>PV =3D &quot;1.0+git${SRVPV}&quot;</div=
><div><br></div><div>SRCREV_testapp =3D=C2=A0&quot;c1dd51dd6c812a99f6af3e5b=
1c367a3155e5e96f&quot;</div><div><br></div><div>S =3D &quot;${WORKDIR}/git&=
quot;</div><div><br></div><div>EXTRA_OECMAKE =3D &quot;\</div><div>-DCMAKE_=
PREFIX_PATH=3D${WORKDIR}/recipe-sysroot/usr/ \</div><div>-DOE_QMAKE_PATH_EX=
TERNAL_HOST_BINS=3D${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \</div><div>-DCMAKE_=
CROSSCOMPILING=3DON \<br></div><div>&quot;</div><div><br></div><div>The lin=
ker tries to link with the -native version of gRPC instead of the target on=
e. Can be seen in the following line from the output:</div><div><br></div><=
div>recipe-sysroot-native/usr/lib/libgrpc++.so.1.24.1: error adding symbols=
: file in wrong format<br></div><div><br></div><div>When checking the recip=
e-sysroot, the grpc libraries are properly installed. There has been an iss=
ue opened on the grpc github, but it got closed without specifying a soluti=
on:=C2=A0<a href=3D"https://github.com/grpc/grpc/issues/17708">https://gith=
ub.com/grpc/grpc/issues/17708</a></div><div><br></div><div>Thanks for the h=
elp,</div><div><br></div><div>Kind regards,</div><div>Goran Broeckaert</div=
></div>

--00000000000008933d05aee0fddd--
