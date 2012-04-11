Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SHtXa-0006RZ-VV
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 11:08:39 +0200
Received: by pbcum15 with SMTP id um15so876031pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 01:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=vcI5N+N48olAfxFA0SfGbgaLBBrsYmDDoTVHMPFt7Xg=;
	b=J8cGYp/3nOkdqOWbLqS7d3M8gK4pmyaqjbINCuq37Z822DvPQjsEaKXwyrQo+I5cw0
	Mtsjh4YaKKBb87WEksAkMp0oh/xrQO+MR/rBbsgAbT7WMVxAUk0Rx+3GX3bCGzhuod6m
	qCqkOwmx+yD3xKSnkU5+wx5yuOg/bYV3dVaCG3/SHz/CkyWtykGs1Z3Avmn2OcvbmAMB
	8iRpWYxPJojM3nMgSQws2EiCfmMWd4Cz+2GR6a6Y1P7onPnkkxml0gQS7GnM45c5zgey
	yRBJ3y1k3p1JxzEdGtE6bFoznh/Oaj3ghzI+iHhhSAzyPDLkHcmOoCySqQrD+NTXm0Cw
	mRpA==
MIME-Version: 1.0
Received: by 10.68.216.225 with SMTP id ot1mr26712162pbc.46.1334134759479;
	Wed, 11 Apr 2012 01:59:19 -0700 (PDT)
Received: by 10.142.180.4 with HTTP; Wed, 11 Apr 2012 01:59:19 -0700 (PDT)
In-Reply-To: <1333402513-26781-1-git-send-email-andrea.adami@gmail.com>
References: <1333402513-26781-1-git-send-email-andrea.adami@gmail.com>
Date: Wed, 11 Apr 2012 10:59:19 +0200
Message-ID: <CAAQYJAtN+NYBvDCmxKnPkx3zo+ZZNCzJ+fSox-PJMGuB2h6Qrg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] udev: generalize the check in touchscreen rule
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2012 09:08:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 2, 2012 at 11:35 PM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> * The actual rule only works for devices reporting ts pressure
> * and ignores the other touchscreens (happens e.g. on ipaq h1940).
> * a0,1,*18 =A0 a =3D absolute axes (ABS_X 0x00 ABS_Y 0x01 ABS_PRESSURE 0x=
18)
> * (see include/linux/input.h)
> *
> * Guidelines for touchscreen seem suggesting only ABS_X and ABS_Y are man=
datory
> * (http://kernel.org/doc/Documentation/input/event-codes.txt)
> *
> * Bump PR
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
> =A0meta/recipes-core/udev/udev/local.rules | =A0 =A03 +--
> =A0meta/recipes-core/udev/udev_164.bb =A0 =A0 =A0| =A0 =A02 +-
> =A02 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/udev/udev/local.rules b/meta/recipes-core/=
udev/udev/local.rules
> index 625e49a..49e8d28 100644
> --- a/meta/recipes-core/udev/udev/local.rules
> +++ b/meta/recipes-core/udev/udev/local.rules
> @@ -31,5 +31,4 @@ KERNEL=3D=3D"rtc0", SYMLINK+=3D"rtc"
> =A0ACTION=3D=3D"add", DEVPATH=3D=3D"/devices/*", ENV{MODALIAS}=3D=3D"?*",=
 RUN+=3D"/sbin/modprobe $env{MODALIAS}"
>
> =A0# Create a symlink to any touchscreen input device
> -SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*", ATTRS{modalias}=3D=3D=
"input:*-e0*,3,*a0,1,*18,*", SYMLINK+=3D"input/touchscreen0"
> -
> +SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*", ATTRS{modalias}=3D=3D=
"input:*-e0*,3,*a0,1,*", SYMLINK+=3D"input/touchscreen0"
> diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/=
udev_164.bb
> index c5813ec..0462ff2 100644
> --- a/meta/recipes-core/udev/udev_164.bb
> +++ b/meta/recipes-core/udev/udev_164.bb
> @@ -1,6 +1,6 @@
> =A0include udev.inc
>
> -PR =3D "r13"
> +PR =3D "r14"
>
> =A0SRC_URI +=3D "file://udev-166-v4l1-1.patch"
>
> --
> 1.7.3.4
>

Bump

I'm not linux-input specialist but this fix looks rather harmless.

Regards

Andrea


