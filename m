Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web09.6635.1629511749557566638
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 19:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Fp9ecVTi;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: jupiter.hce@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id k65so22050196yba.13
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 19:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=2+xuaSDrqfUXxcKD3VaOcaVplhcRPp0GxKrR4LbBZyg=;
        b=Fp9ecVTiwcrFvUAtytYkZpWLaZoVVJOpCIRjxshWdltGjxvpdzNPcty6JcQgplpuBK
         t45qqEwZmVj6TuTOfSvhfnSDvYZMDtrNRaJM54q+aD6Daz30luIrreaaCEPli3VDJcoW
         SRnnKSutWaS0hBZUI04Es052heshLKfoeWs2nKaMejowmimaxpqsiycWCbF+aIM93Lj6
         NHuSzkR0mRGyWgi7x/aRnoYje+ab/kzm2d+snH/b97oPJ35Pb6xInRZAYnVANYyOG+eo
         dsLXv+CEoVPbbwxTaYRN8sgy0hYRJY+BNXXWzrteL3PwRxPPHkVbPlOpMYfz+2cjuL4h
         6ZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=2+xuaSDrqfUXxcKD3VaOcaVplhcRPp0GxKrR4LbBZyg=;
        b=Apfhkuy55TXq/Lyg5TVTJZxioBbLiFCl2Ofc9bkWbotg65dYTcOpCKYJEfYb/8FIBG
         hffm3PaZtDlmT0tvLBt0+xsH00vEkn/8M4aSt5U0oc1Zk02nDUsqLgmfdsRDN+4/oHmX
         FPzT9EzBP4BuNEIH9XWmVqrSvkrAIK+m8zN/ttkTmQ1e1jvRhV6mYFCRYA9Mi7XXu2VC
         mWmvzsETcCPLrvY0JKTmtZ06LrHMqnSqSNpOQLCkUxdYaDOpqDyBetMVcsmIwwLJyziF
         eO6Tslv8Ri99qkGWbX9rSCNbJIzxIw1tcQ8aEfj1Q0+iPthtL2VO+IBDIoGdkYnIBIlD
         1UMQ==
X-Gm-Message-State: AOAM530RDGegCcLwKhHUGk3Xs0hN7ztltGKXPiBpMFPTQBs1kZdotRLh
	lSX2wTLwtqHQA9y8EHQPHQvkFl1/PT6wm+7akks=
X-Google-Smtp-Source: ABdhPJzhaZ3ydjBqlprpdNd4I8pJ7it07D6w0yI3JxdaKCaWKZRi3RGese7x5ZJS9vUS+bUiFVN/NP3bRqKQub5epHU=
X-Received: by 2002:a25:41c6:: with SMTP id o189mr27494579yba.65.1629511748657;
 Fri, 20 Aug 2021 19:09:08 -0700 (PDT)
MIME-Version: 1.0
From: "JH" <jupiter.hce@gmail.com>
Date: Sat, 21 Aug 2021 12:08:32 +1000
Message-ID: <CAA=hcWQAWZyiSTQ3r8DiTK2DFuJZZ7hDasAuggfR9shqwz2ioQ@mail.gmail.com>
Subject: oFono Version 1.31 ofonod crash
To: ofono <ofono@ofono.org>
Cc: oe-core <openembedded-core@lists.openembedded.org>, 
	Denis Kenzior <denkenz@gmail.com>, Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

I build ofono v1.31 from git://git.yoctoproject.org/poky branch hardknott,

$ cat meta/recipes-connectivity/ofono/ofono_1.31.bb

SUMMARY = "open source telephony"
DESCRIPTION = "oFono is a stack for mobile telephony devices on Linux.
oFono supports speaking to telephony devices through specific drivers,
or with generic AT commands."
HOMEPAGE = "http://www.ofono.org"
BUGTRACKER = "https://01.org/jira/browse/OF"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \

file://src/ofono.h;beginline=1;endline=20;md5=3ce17d5978ef3445def265b98899c2ee"
DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"

SRC_URI = "\
    ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
    file://ofono \
    file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
"
SRC_URI[md5sum] = "1c26340e3c6ed132cc812595081bb3dc"
SRC_URI[sha256sum] =
"a15c5d28096c10eb30e47a68b6dc2e7c4a5a99d7f4cfedf0b69624f33d859e9b"

inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data

INITSCRIPT_NAME = "ofono"
INITSCRIPT_PARAMS = "defaults 22"
SYSTEMD_SERVICE_${PN} = "ofono.service"

PACKAGECONFIG ??= "\
    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
"
PACKAGECONFIG[systemd] =
"--with-systemdunitdir=${systemd_unitdir}/system/,--with-systemdunitdir="
PACKAGECONFIG[bluez] = "--enable-bluetooth, --disable-bluetooth, bluez5"

EXTRA_OECONF += "--enable-test --enable-external-ell"

do_install_append() {
  install -d ${D}${sysconfdir}/init.d/
  install -m 0755 ${WORKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
}

PACKAGES =+ "${PN}-tests"

FILES_${PN} += "${systemd_unitdir}"
FILES_${PN}-tests = "${libdir}/${BPN}/test"

RDEPENDS_${PN} += "dbus"
RDEPENDS_${PN}-tests = "\
    python3-core \
    python3-dbus \
    ${@bb.utils.contains('GI_DATA_ENABLED', 'True',
'python3-pygobject', '', d)} \
"

RRECOMMENDS_${PN} += "kernel-module-tun mobile-broadband-provider-info"

The build was fine, but running the v1.31 ofono.service crashed at
udevng.c missing OFONO_DRIVER property, the ofono.service was repeated
to be restarted every 6 seconds:

.....

ofonod[9005]: ../ofono-1.31/plugins/udevng.c:add_serial_device()
Device is missing required OFONO_DRIVER property
ofonod[9005]: ../ofono-1.31/plugins/udevng.c:add_serial_device()
Device is missing required OFONO_DRIVER property
......

I am not quite sure if it is ofono 1.31 problem or oe-core
ofono_1.31.bb problem, could anyone have a look at and advise? Let me
know if you need more debug information.

Thank you.

Kind regards,

- jupiter


On 8/20/21, Jupiter <jupiter.hce@gmail.com> wrote:
> Hi,
>
> I upgraded from Zeus to Hardknotte, I was able to run dbus to get
> interface properties, but I failed on Hardknotte ofono 1.31. Has
> anyone got oFono 1.31 dbus work?
>
> Thank you.
>
> Kind regards,
>
> - jupiter
>
