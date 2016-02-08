Return-Path: <tanuk@iki.fi>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 19EE3731E9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 10:20:52 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 6583D20BC9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 05:20:52 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute1.internal (MEProxy); Mon, 08 Feb 2016 05:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=zDCv88stCa4p+Hz
	x/dAkHQlCRLY=; b=B0jjjXf6DmCuuqg+QdgiktQPrXyiLMdFxdG9uRnppPmm9NJ
	iUY0/MKbN9odYJt0uD7QpZYsDbesfF238ah4u6623z1GZVCQordY4GfNzkIssSmf
	33BGPPbfXsY3LMeULjCYH63W5lQ3GxzXVaBbu5Ukjmm4U8ZIOONAUDOifpMs=
X-Sasl-enc: KP7Xl1U0dZ8eMKB6G4vJNA5r3dniz84rcIJOSx9Rp+vz 1454926851
Received: from laptop (a88-114-110-232.elisa-laajakaista.fi [88.114.110.232])
	by mail.messagingengine.com (Postfix) with ESMTPA id 19DAB680145;
	Mon,  8 Feb 2016 05:20:50 -0500 (EST)
Message-ID: <1454926849.4283.6.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>, 
	openembedded-core@lists.openembedded.org, Enrico Jorns
	<ejo@pengutronix.de>,  Roy Li <rongqing.li@windriver.com>, Khem Raj
	<raj.khem@gmail.com>, Christopher Larson <chris_larson@mentor.com>, Ross
	Burton <ross.burton@intel.com>
Date: Mon, 08 Feb 2016 12:20:49 +0200
In-Reply-To: <1454926183-22439-2-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1454926183-22439-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1454926183-22439-2-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: Evolution 3.18.3-1 
Mime-Version: 1.0
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
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
X-List-Received-Date: Mon, 08 Feb 2016 10:20:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-02-08 at 11:09 +0100, Maciej Borzecki wrote:
> Add systemd-bash package that ships bash completion files
> 
> Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> ---
>  meta/recipes-core/systemd/systemd_228.bb | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd_228.bb b/meta/recipes-core/systemd/systemd_228.bb
> index a110f0cdeaac7e46b5691a89aea237974e4114b3..8e3cb6047588b286df728ff28423e469d0b0745d 100644
> --- a/meta/recipes-core/systemd/systemd_228.bb
> +++ b/meta/recipes-core/systemd/systemd_228.bb
> @@ -238,7 +238,7 @@ python populate_packages_prepend (){
>  PACKAGES_DYNAMIC += "^lib(udev|systemd).*"
>  
>  PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install \
> -             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh ${PN}-xorg-xinitrc"
> +             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-bash ${PN}-zsh ${PN}-xorg-xinitrc"
>  
>  SYSTEMD_PACKAGES = "${PN}-binfmt"
>  SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
> @@ -271,6 +271,11 @@ FILES_${PN}-rpm-macros = "${exec_prefix}/lib/rpm \
>  
>  FILES_${PN}-xorg-xinitrc = "${sysconfdir}/X11/xinit/xinitrc.d/*"
>  
> +FILES_${PN}-bash = " \
> +                    ${datadir}/bash-completion \
> +                    ${sysconfdir}/bash_completion.d/ \
> +                    "

Note that we have the bash-completion class. It can be used to take
care of packaging the bash completion files. It doesn't take files from
sysconfdir, though. Does systemd really install bash completion files
under sysconfdir, or is that just unnecessary cruft originating from
older systemd versions?

-- 
Tanu

