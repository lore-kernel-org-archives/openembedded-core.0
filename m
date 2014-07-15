Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 91967701AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 16:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id CDE34314D0DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 18:39:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 9_J8m_xgaENz
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 18:39:14 +0200 (CEST)
Received: from [172.22.22.61] (55d457d3.access.ecotel.net [85.212.87.211])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 71BBC314D0DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 18:39:14 +0200 (CEST)
Message-ID: <53C55932.2050206@opendreambox.org>
Date: Tue, 15 Jul 2014 18:39:14 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <8672BB614B4CCA40A6B3BDD6FD82050BA8B27988@COSNADEXC13.usr.ingenico.loc>
	<1405436079-13220-1-git-send-email-Matthieu.Crapet@ingenico.com>
In-Reply-To: <1405436079-13220-1-git-send-email-Matthieu.Crapet@ingenico.com>
Subject: Re: [PATCH v3] libav: set LICENSE and LICENSE_FLAGS according to PACKAGECONFIG options
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
X-List-Received-Date: Tue, 15 Jul 2014 16:39:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Matthieu,

On 15.07.2014 16:54, Matthieu Crapet wrote:
> + fix: drop unwanted --enable-libtheora & --enable-libvorbis in EXTRA_OECONF
> 
> Reported-by: Andreas Oberritter <obi@opendreambox.org>
> Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
> ---
>  meta/recipes-multimedia/libav/libav.inc | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
> index 1d617a2..cd5ac5f 100644
> --- a/meta/recipes-multimedia/libav/libav.inc
> +++ b/meta/recipes-multimedia/libav/libav.inc
> @@ -7,8 +7,7 @@ DESCRIPTION = "Libav is a friendly and community-driven effort to provide its us
>  HOMEPAGE = "http://libav.org/"
>  SECTION = "libs"
>  
> -LICENSE = "GPLv2+"
> -LICENSE_FLAGS = "commercial"
> +LICENSE = "GPLv2+ & LGPLv2.1+"

I think this is wrong (if it means dual licensed). To quote from the
LICENSE file:

"Most files in Libav are under the GNU Lesser General Public License
version 2.1 or later (LGPL v2.1+). Read the file COPYING.LGPLv2.1 for
details. Some other files have MIT/X11/BSD-style licenses. In
combination the LGPL v2.1+ applies to Libav.

Some optional parts of Libav are licensed under the GNU General Public
License version 2 or later (GPL v2+). See the file COPYING.GPLv2 for
details. None of these parts are used by default, you have to explicitly
pass --enable-gpl to configure to activate them. In this case, Libav's
license changes to GPL v2+."

So with --enable-gpl hardcoded in EXTRA_OECONF, GPLv2+ was the right choice.

>  
>  # Provides ffmpeg compat, see http://libav.org/about.html
>  PROVIDES = "ffmpeg"
> @@ -44,14 +43,20 @@ PACKAGECONFIG[vpx] = "--enable-libvpx,--disable-libvpx,libvpx"
>  PACKAGECONFIG[x11] = "--enable-x11grab,--disable-x11grab,virtual/libx11 libxfixes libxext xproto virtual/libsdl"
>  PACKAGECONFIG[x264] = "--enable-libx264,--disable-libx264,x264"
>  
> -# Check codecs that require --enable-nonfree
> -USE_NONFREE = "${@bb.utils.contains_any('PACKAGECONFIG', [ 'faac', 'openssl' ], 'yes', '', d)}"
> +# Check codecs that trigger nonfree license
> +python () {
> +	pkgconfig = (d.getVar('PACKAGECONFIG', True) or "").split()
> +	nonfree = [ 'faac', 'openssl' ]
> +	if set(pkgconfig) & set(nonfree):
> +		d.setVar('LICENSE', 'Proprietary')
> +		d.setVar('LICENSE_FLAGS', 'commercial')
> +}

Do you think it would be feasible to add code which decides whether to
set --enable-gpl or not? Because --enable-gpl forbids linking libav for
programs with incompatible licenses.

While your approach is to set the license according to enabled codecs,
my approach is to choose the license and then enable all possible
codecs, because for me the license is more important than some codecs. I
think libav would abort configuration anyway if it encountered
incompatible flags.

Regards,
Andreas

