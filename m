X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Date: Wed, 27 Apr 2022 14:22:55 +0100
From: "Mike Crowe" <mac@mcrowe.com>
Subject: Re: [OE-core] [PATCH] sanity: skip make 4.2.1 warning for debian
Message-ID: <YmlDr4HMSXRpnAx4@mcrowe.com>
References: <20220426194618.218353-1-nicolas.dechesne@linaro.org>
 <CAJ86T=XZLytHs3yQxezF59+UbJnKPUsqJwqY0Cs8HTAqWoYRuQ@mail.gmail.com>
 <CAMKF1srtoJ018V4x3nX2CQ+77DfLgnN2-KizL1Zfje2e-wUEFQ@mail.gmail.com>
 <CAJ86T=WOttBz2W-xWD=dEP36FredBqzjEC3d+sF_ciUX_aCS1w@mail.gmail.com>
 <c57ed8a714da34b9649a49e823a304e99dc6b7a8.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <c57ed8a714da34b9649a49e823a304e99dc6b7a8.camel@linuxfoundation.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-id: <openembedded-core.lists.openembedded.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Andre McCurdy <armccurdy@gmail.com>, Khem Raj <raj.khem@gmail.com>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, OE Core mailing list <openembedded-core@lists.openembedded.org>, chris_larson <chris_larson@mentor.com>

On Wednesday 27 April 2022 at 11:40:49 +0100, Richard Purdie wrote:
> As far as I know, we don't use LSB_DISTRO_ADJUST in core at all. I suspec=
t it
> should really probably be added to the lsb.py function in most cases. Is =
there
> any documentation or other info about when it should be applied and when =
it
> should not?

We used to use LSB_DISTRO_ADJUST to stop Debian minor release upgrades
causing sstate paths to change up until about five years ago when we
upgraded to an oe-core version that only considered the major version to be
important.

> I did have a look at
> https://git.yoctoproject.org/poky/commit/meta/classes/base.bbclass?id=3D0=
96306ecd1bb80fe5e732584caca0172305628a2
> where it was introduced 10 years ago but there isn't much more info.=A0

I believe that we use the mapping in SSTATE_MIRRORS to do the equivalent of
what is described in that commit message:

  SSTATE_MIRRORS ?=3D "\
  file://debian ${OUR_SSTATE_DIR}/debian-10 \n \
  file://debian-11 ${OUR_SSTATE_DIR}/debian-10 \n \
  file://debian-10 ${OUR_SSTATE_DIR}/debian-10 \n \
  \
  file://debian-9 ${OUR_SSTATE_DIR}/debian-9 \n \
  file://.* ${OUR_SSTATE_DIR}/PATH \n \
  "

(Our autobuilders are running Debian 10 at the moment, so anyone running
Debian 11 can make use of sstate files they wrote to debian-10, but anyone
running Debian 9 cannot.)

I have no idea whether this works for the Red Hat world though.

HTH.

Mike.
