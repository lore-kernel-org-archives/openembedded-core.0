Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SHukF-0005rT-O1 for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 12:25:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3BAGQMd006342
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 11:16:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05234-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 11:16:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3BAGH9P006329
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 11:16:19 +0100
Message-ID: <1334139378.10826.140.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Apr 2012 11:16:18 +0100
In-Reply-To: <CAAQYJAtN+NYBvDCmxKnPkx3zo+ZZNCzJ+fSox-PJMGuB2h6Qrg@mail.gmail.com>
References: <1333402513-26781-1-git-send-email-andrea.adami@gmail.com>
	<CAAQYJAtN+NYBvDCmxKnPkx3zo+ZZNCzJ+fSox-PJMGuB2h6Qrg@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Wed, 11 Apr 2012 10:25:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-04-11 at 10:59 +0200, Andrea Adami wrote:
> On Mon, Apr 2, 2012 at 11:35 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> > * The actual rule only works for devices reporting ts pressure
> > * and ignores the other touchscreens (happens e.g. on ipaq h1940).
> > * a0,1,*18   a = absolute axes (ABS_X 0x00 ABS_Y 0x01 ABS_PRESSURE 0x18)
> > * (see include/linux/input.h)
> > *
> > * Guidelines for touchscreen seem suggesting only ABS_X and ABS_Y are mandatory
> > * (http://kernel.org/doc/Documentation/input/event-codes.txt)
> > *
> > * Bump PR
> >
> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > ---
> >  meta/recipes-core/udev/udev/local.rules |    3 +--
> >  meta/recipes-core/udev/udev_164.bb      |    2 +-
> >  2 files changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-core/udev/udev/local.rules b/meta/recipes-core/udev/udev/local.rules
> > index 625e49a..49e8d28 100644
> > --- a/meta/recipes-core/udev/udev/local.rules
> > +++ b/meta/recipes-core/udev/udev/local.rules
> > @@ -31,5 +31,4 @@ KERNEL=="rtc0", SYMLINK+="rtc"
> >  ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe $env{MODALIAS}"
> >
> >  # Create a symlink to any touchscreen input device
> > -SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="input:*-e0*,3,*a0,1,*18,*", SYMLINK+="input/touchscreen0"
> > -
> > +SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="input:*-e0*,3,*a0,1,*", SYMLINK+="input/touchscreen0"
> > diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
> > index c5813ec..0462ff2 100644
> > --- a/meta/recipes-core/udev/udev_164.bb
> > +++ b/meta/recipes-core/udev/udev_164.bb
> > @@ -1,6 +1,6 @@
> >  include udev.inc
> >
> > -PR = "r13"
> > +PR = "r14"
> >
> >  SRC_URI += "file://udev-166-v4l1-1.patch"
> >
> > --
> > 1.7.3.4
> >
> 
> Bump
> 
> I'm not linux-input specialist but this fix looks rather harmless.

I'm not 100% convinced about that. There needs to be some mechanism to
signal to the system when there is pressure applied to the screen and
when pressure was released. I think there are two ways you can do this,
BTN_TOUCH and ABS_PRESSURE. Regardless of what the input events codes
say, I'm really more interested in what tslib accepts.

This code has been like this for a long time and I'm surprised that if
there were issues it wasn't patched long before now. I'm therefore left
wondering if the touchscreen driver you're using is doing the right
things.

Cheers,

Richard





