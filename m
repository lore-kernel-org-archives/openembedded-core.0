Return-Path: <tanuk@iki.fi>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id DCFA760017
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 11:22:03 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id D8AB12070B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 07:22:03 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute1.internal (MEProxy); Thu, 08 Sep 2016 07:22:03 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=nSK5fVJJ8RhxUuU
	1esIx+Yygr2M=; b=M4vlz2xwJmTTmD1Rr8rug5t0spexGdbfqAY0/yoiUiCxeLv
	+epWt4Vn6hss7tb+Uf3QCAsgy5uPr9O1PSfyf6+lvPwHJr8F58OFO44CUZnD4qif
	9lAaUrOqwhZjvtNDU2SedDb2aJR287TKqgxVbXa8Ld1D4qMYQzrvJ3e1SB8E=
X-Sasl-enc: GzB+Df0jG2Rc/GQ855SwdScZjPzynHPVswSGK5Qxx9tY 1473333723
Received: from laptop (a88-113-211-72.elisa-laajakaista.fi [88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5AF36CCE8B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 07:22:03 -0400 (EDT)
Message-ID: <1473333722.3099.33.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Thu, 08 Sep 2016 14:22:02 +0300
In-Reply-To: <57D10664.3050007@windriver.com>
References: <cover.1473240119.git.Qi.Chen@windriver.com>
	<72f9c03cf7bb25482acc9c40b775a4f294e772b6.1473240119.git.Qi.Chen@windriver.com>
	<CAEGpDuYdSBJd3TyysNe4aCniRV3izLrs68jW4-D58sQJ+84+AA@mail.gmail.com>
	<57D10664.3050007@windriver.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH 3/3] pulseaudio: fix to manage user services corretly
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
X-List-Received-Date: Thu, 08 Sep 2016 11:22:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-09-08 at 14:34 +0800, ChenQi wrote:
> On 09/07/2016 06:29 PM, Pau Espin Pedrol wrote:
> > 
> > 
> > 
> > Pau Espin Pedrol
> > 
> > 2016-09-07 11:22 GMT+02:00 Chen Qi <Qi.Chen@windriver.com 
> > <mailto:Qi.Chen@windriver.com>>:
> > 
> >     Make use of the new SYSTEMD_USER_SERVICE variable added in
> >     systemd.bbclass
> >     to manage user services in pulseaudio-server package.
> > 
> >     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
> >     <mailto:Qi.Chen@windriver.com>>
> >     ---
> >      meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 4 ++--
> >      1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> >     diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> >     b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> >     index 6ed79ef..f3754d7 100644
> >     --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> >     +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> >     @@ -124,8 +124,8 @@ FILES_${PN}-conf = "${sysconfdir}"
> >      FILES_${PN}-bin +=
> >     "${sysconfdir}/default/volatiles/volatiles.04_pulse"
> >      FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-*
> >     ${sysconfdir} ${bindir}/pactl */udev/rules.d/*.rules
> >     */*/udev/rules.d/*.rules ${systemd_user_unitdir}/*"
> > 
> >     -#SYSTEMD_PACKAGES = "${PN}-server"
> >     -SYSTEMD_SERVICE_${PN}-server = "pulseaudio.service"
> >     +SYSTEMD_PACKAGES = "${PN}-server"
> >     +SYSTEMD_USER_SERVICE_${PN}-server = "pulseaudio.service
> >     pulseaudio.socket"
> > 
> > I think specifying "pulseaudio.socket" for 
> > SYSTEMD_USER_SERVICE_${PN}-server should be enough, systemd.bbclass is 
> > going to add the .service file afair.
> 
> Add both:
> chenqi@pek-hostel-deb01:~/poky/build-systemd [1] $ ls 
> tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/systemd/user
> default.target.wants  sockets.target.wants
> 
> Add pulseaudio.socket:
> chenqi@pek-hostel-deb01:~/poky/build-systemd [1] $ ls 
> tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/systemd/user
> sockets.target.wants
> 
> They have different results.
> I don't know a lot about pulseaudio. Can you confirm that 
> pulseaudio.socket is enough?

If I understood correctly, Pau's argument was that there would be no
difference, which doesn't seem to be the case. However, if
pulseaudio.service isn't included in default.target.wants, that
shouldn't be a big problem, because socket activation will anyway start
the service when needed. On the other hand, I don't
think SYSTEMD_USER_SERVICE is intended to be used for controlling which
units to enable - it looks more like a variable that should contain all
units contained in the package. If my understanding is correct, you
should list both units in the variable.

The distributions that I've seen to use systemd to manage pulseaudio
only enable pulseaudio.socket, so that socket activation is used rather
than starting pulseaudio automatically as part of the user session. I
don't know if OE supports that - it looks like there's only a toggle to
enable all units or none. Other distributions also patch client.conf to
disable pulseaudio's own autospawning mechanism, since it's redundant
when using socket activation. Leaving autospawning enabled shouldn't
break anything in normal use, but it can cause some confusing behaviour
if the user tries to manually disable automatic pulseaudio starting by
disabling the systemd units.

-- 
Tanu

