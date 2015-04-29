Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 27DF973D5C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 16:43:14 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so33190994pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 09:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=n81DbNf83p3agzzo+kWaXDtYb5YLewuoDdXNUhHsFpk=;
	b=OrgS0FNK20IfvI7bVxrwqFzLLZ6zXnFVAnP+rwmZVXuJFq4QM1IvB81sGfG6jd/wnB
	Ff+e4kGQOeUa8HWRGNLh6ZmHWaqWTBGeR/L2ckOI8JmpLJEsDT8y25tl83/kiec4HyQA
	3jSwkwWTJ3J4Q2E6/R8FsbQ/BNGHEVX0fYp++fn/HlDz2jAECfJN0ZQ5TFwZnz+J29Fi
	PuZB0hhWBcwJRTzzYac2xTrWtBT3ErsWfTopMPbW7l8mhZnf3HyeSOxamNrEyqAEy8WZ
	5XqAccmcnlccm2y3nRN+5+gj8Ve+MCvhtct5IaWDriRRTt/fLtZBLgoCXMFZXJAsVmrQ
	hzag==
MIME-Version: 1.0
X-Received: by 10.66.233.132 with SMTP id tw4mr43257641pac.80.1430325795927;
	Wed, 29 Apr 2015 09:43:15 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Wed, 29 Apr 2015 09:43:15 -0700 (PDT)
Date: Wed, 29 Apr 2015 13:43:15 -0300
X-Google-Sender-Auth: UXFJll-yUG1qsIzKDtJNoY7HXBM
Message-ID: <CAP9ODKpxjkoGTiNZeyteDgP7WtYE=JU3cJSwi7iPMga9O+u60g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: libtool seems to be not properly handling sstate
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
X-List-Received-Date: Wed, 29 Apr 2015 16:43:17 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

We are building Fido for several boards[1] and have faced a build error.

1. http://ci.ossystems.com.br/job/fsl-community-bsp-fido/23/console

This is building with sstate but clean tmp. Log below:

framebuffer fsl-image-machine-test@imx6sl-warp (1/23) | NOTE:
Executing ACLOCAL="aclocal
--system-acdir=.../build-framebuffer/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/dbus/1.8.10-r0/build/aclocal-copy/"
autoreconf --verbose --install --force --exclude=autopoint -I
.../build-framebuffer/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/dbus/1.8.10-r0/dbus-1.8.10/m4/
framebuffer fsl-image-machine-test@imx6sl-warp (1/23) | autoreconf:
Entering directory `.'
framebuffer fsl-image-machine-test@imx6sl-warp (1/23) | autoreconf:
configure.ac: not using Gettext
framebuffer fsl-image-machine-test@imx6sl-warp (1/23) | autoreconf:
running: aclocal
--system-acdir=.../build-framebuffer/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/dbus/1.8.10-r0/build/aclocal-copy/
-I .../build-framebuffer/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/dbus/1.8.10-r0/dbus-1.8.10/m4/
-I .../build-framebuffer/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/dbus/1.8.10-r0/dbus-1.8.10/m4/
--force -I m4 ${ACLOCAL_FLAGS}
framebuffer fsl-image-machine-test@imx6sl-warp (1/23) | autoreconf:
configure.ac: tracing
framebuffer fsl-image-machine-test@imx6sl-warp (1/23) | autoreconf:
running: libtoolize --copy --force
framebuffer fsl-image-machine-test@imx6sl-warp (1/23) | libtoolize:
error: $pkgauxdir is not a directory:
'.../build-framebuffer/tmp/sysroots/nitrogen6x/usr/share/libtool/build-aux'
framebuffer fsl-image-machine-test@imx6sl-warp (1/23) | autoreconf:
libtoolize failed with exit status: 1
framebuffer fsl-image-machine-test@imx6sl-warp (1/23) | ERROR:
autoreconf execution failed.
framebuffer fsl-image-machine-test@imx6sl-warp (1/23) | WARNING: exit
code 1 from a shell command.

framebuffer fsl-image-machine-test@imx6sl-warp (1/23) | ERROR:
Function failed: do_configure (log file is located at
.../build-framebuffer/tmp/work/cortexa9hf-vfp-neon-poky-linux-gnueabi/dbus/1.8.10-r0/temp/log.do_configure.11871)

nitrogen6x is another machine which is of same arch as this one and
the tmp is not yet populated.

Do someone have a clue what is going on?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

