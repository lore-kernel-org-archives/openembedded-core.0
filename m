Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <c57ed8a714da34b9649a49e823a304e99dc6b7a8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sanity: skip make 4.2.1 warning for debian
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 27 Apr 2022 11:40:49 +0100
In-Reply-To: <CAJ86T=WOttBz2W-xWD=dEP36FredBqzjEC3d+sF_ciUX_aCS1w@mail.gmail.com>
References: <20220426194618.218353-1-nicolas.dechesne@linaro.org>
	 <CAJ86T=XZLytHs3yQxezF59+UbJnKPUsqJwqY0Cs8HTAqWoYRuQ@mail.gmail.com>
	 <CAMKF1srtoJ018V4x3nX2CQ+77DfLgnN2-KizL1Zfje2e-wUEFQ@mail.gmail.com>
	 <CAJ86T=WOttBz2W-xWD=dEP36FredBqzjEC3d+sF_ciUX_aCS1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Andre McCurdy <armccurdy@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, OE Core mailing list <openembedded-core@lists.openembedded.org>, chris_larson <chris_larson@mentor.com>

On Tue, 2022-04-26 at 14:39 -0700, Andre McCurdy wrote:
> On Tue, Apr 26, 2022 at 1:56 PM Khem Raj <raj.khem@gmail.com> wrote:
> > 
> > On Tue, Apr 26, 2022 at 1:51 PM Andre McCurdy <armccurdy@gmail.com> wrote:
> > > 
> > > On Tue, Apr 26, 2022 at 12:46 PM Nicolas Dechesne
> > > <nicolas.dechesne@linaro.org> wrote:
> > > > 
> > > > This is a follow up patch of:
> > > > ad5829aa1f8a (sanity: Show a warning that make 4.2.1 is buggy on non-ubuntu systems)
> > > > 
> > > > Debian10 has the exact same version/sources for make as Ubuntu
> > > > (focal), e.g. https://packages.debian.org/source/buster/make-dfsg and
> > > > https://packages.ubuntu.com/source/focal/make-dfsg.
> > > > 
> > > > As per the corresponding changelog, the patch mentioned in
> > > > ad5829aa1f8a, is included in both Debian and Ubuntu in make
> > > > 4.2.1-1.1. So it's safe to use make 4.2.1 in Debian10.
> > > > 
> > > > Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> > > > ---
> > > >  meta/classes/sanity.bbclass | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> > > > index c385d92e8b..c72a7b3ed3 100644
> > > > --- a/meta/classes/sanity.bbclass
> > > > +++ b/meta/classes/sanity.bbclass
> > > > @@ -470,7 +470,7 @@ def check_make_version(sanity_data):
> > > > 
> > > >      if bb.utils.vercmp_string_op(version, "4.2.1", "=="):
> > > >          distro = oe.lsb.distro_identifier()
> > > 
> > > Not directly related to your change, but shouldn't this be
> > > lsb_distro_identifier() instead of oe.lsb.distro_identifier()?
> > 
> > lsb_distro_identifier would work when it is inheriting base.bbclass
> > otherwise the utility function is needed.
> 
> Question isn't really whether it will work or not (if it doesn't work,
> we should make it work) but rather whether any user-defined
> LSB_DISTRO_ADJUST should be applied before checking if the host distro
> is based on Debian/Ubuntu or not.

It would help to be a little more specific with the background. Having looked at
the code, we have two lsb functions, one in base.bbclass and one in
oe/lib/lsb.py. The one in base.bbclass is a wrapper which uses
LSB_DISTRO_ADJUST.

As far as I know, we don't use LSB_DISTRO_ADJUST in core at all. I suspect it
should really probably be added to the lsb.py function in most cases. Is there
any documentation or other info about when it should be applied and when it
should not?

I did have a look at
https://git.yoctoproject.org/poky/commit/meta/classes/base.bbclass?id=096306ecd1bb80fe5e732584caca0172305628a2
where it was introduced 10 years ago but there isn't much more info. 
Chris: Do we still need/use this?

As ever, patches are welcome both to improve this and perhaps to better document
it too but if I remember rightly your policy is not to send them :/.

Cheers,

Richard







