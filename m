Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 864E97325A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 10:33:59 +0000 (UTC)
Received: from comp-006-thk (unknown [31.182.60.238])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 51B1D2D637D;
	Mon,  8 Feb 2016 11:33:59 +0100 (CET)
Message-ID: <1454927639.3938.5.camel@open-rnd.pl>
From: Maciek Borzecki <maciej.borzecki@open-rnd.pl>
Reply-To: maciej.borzecki@open-rnd.pl
To: Tanu Kaskinen <tanuk@iki.fi>, openembedded-core@lists.openembedded.org, 
	Enrico Jorns <ejo@pengutronix.de>, Roy Li <rongqing.li@windriver.com>, Khem
	Raj <raj.khem@gmail.com>, Christopher Larson <chris_larson@mentor.com>, 
	Ross Burton <ross.burton@intel.com>
Date: Mon, 08 Feb 2016 11:33:59 +0100
In-Reply-To: <1454926849.4283.6.camel@iki.fi>
References: <1454926183-22439-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1454926183-22439-2-git-send-email-maciej.borzecki@open-rnd.pl>
	<1454926849.4283.6.camel@iki.fi>
Organization: Open-RnD sp. z o.o.
X-Mailer: Evolution 3.18.4 (3.18.4-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH 1/6] systemd: move bash completion into separate package
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
X-List-Received-Date: Mon, 08 Feb 2016 10:34:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On pon, 2016-02-08 at 12:20 +0200, Tanu Kaskinen wrote:
> On Mon, 2016-02-08 at 11:09 +0100, Maciej Borzecki wrote:
> > Add systemd-bash package that ships bash completion files
> > 
> > Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> > ---
> >  meta/recipes-core/systemd/systemd_228.bb | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta/recipes-core/systemd/systemd_228.bb b/meta/recipes-
> > core/systemd/systemd_228.bb
> > index
> > a110f0cdeaac7e46b5691a89aea237974e4114b3..8e3cb6047588b286df728ff28423e469d0b0745d
> > 100644
> > --- a/meta/recipes-core/systemd/systemd_228.bb
> > +++ b/meta/recipes-core/systemd/systemd_228.bb
> > @@ -238,7 +238,7 @@ python populate_packages_prepend (){
> >  PACKAGES_DYNAMIC += "^lib(udev|systemd).*"
> >  
> >  PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-
> > kernel-install \
> > -             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh ${PN}-xorg-xinitrc"
> > +             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-bash ${PN}-zsh ${PN}-xorg-
> > xinitrc"
> >  
> >  SYSTEMD_PACKAGES = "${PN}-binfmt"
> >  SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
> > @@ -271,6 +271,11 @@ FILES_${PN}-rpm-macros = "${exec_prefix}/lib/rpm \
> >  
> >  FILES_${PN}-xorg-xinitrc = "${sysconfdir}/X11/xinit/xinitrc.d/*"
> >  
> > +FILES_${PN}-bash = " \
> > +                    ${datadir}/bash-completion \
> > +                    ${sysconfdir}/bash_completion.d/ \
> > +                    "
> 
> Note that we have the bash-completion class. It can be used to take
> care of packaging the bash completion files. It doesn't take files from
> sysconfdir, though. Does systemd really install bash completion files
> under sysconfdir, or is that just unnecessary cruft originating from
> older systemd versions?
> 

Thanks for the tip. Now that I've looked at it inherit bash-completion looks like the most
sensible way. I guess it also makes sense to have an equivalent zsh completion class.

-- 
Maciej Borzęcki
Senior Software Developer at Open-RnD Sp. z o.o., Poland
www.open-rnd.pl
mobile: +48 889 117 365, fax: +48 42 657 9079

Niniejsza wiadomość wraz z załącznikami może zawierać chronione prawem
lub poufne informacje i została wysłana wyłącznie do wiadomości i
użytku osób, do których została zaadresowana. Jeśli wiadomość została
otrzymana przypadkowo zabrania się jej kopiowania lub rozsyłania do
osób trzecich. W takim przypadku uprasza się o natychmiastowe
zniszczenie wiadomości oraz poinformowanie nadawcy o zaistniałej
sytuacji za pomocą wiadomości zwrotnej. Dziękujemy.

This message, including any attachments hereto, may contain privileged
or confidential information and is sent solely for the attention and
use of the intended addressee(s). If you are not an intended addressee,
you may neither use this message nor copy or deliver it to anyone. In
such case, you should immediately destroy this message and kindly notify
the sender by reply email. Thank you.




