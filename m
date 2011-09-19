Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1R5c47-0001NU-0P
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 13:31:11 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1R5bhn-0006gx-KX>; Mon, 19 Sep 2011 13:08:07 +0200
Received: from hydra.imp.fu-berlin.de ([160.45.117.149]
	helo=mail.imp.fu-berlin.de) by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1R5bhn-0002uZ-IB>; Mon, 19 Sep 2011 13:08:07 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by mail.imp.fu-berlin.de with esmtps (Exim 4.72) id 1R5bhF-00031B-OM
	(envelope-from <heinold@mi.fu-berlin.de>)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2011 13:07:45 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1R5bhA-0008TK-Kg
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2011 13:07:28 +0200
Date: Mon, 19 Sep 2011 13:07:28 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110919110728.GA31160@mi.fu-berlin.de>
References: <cover.1316429640.git.paul.eggleton@linux.intel.com>
	<8d56fe29bb6f9502c56eae71640da4cc31f7e1a4.1316429640.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <8d56fe29bb6f9502c56eae71640da4cc31f7e1a4.1316429640.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Heinold <heinold@mi.fu-berlin.de>
X-Remote-IP: 160.45.42.84
X-Spam_Score: -3.4
X-exim-Spam_Score_Int: -33
X-exim-Spam_Bar: ---
X-Spam_Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -0.5 RP_MATCHES_RCVD Envelope sender domain matches handover relay
	domain * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Originating-IP: 160.45.117.149
Subject: Re: [PATCH 3/3] freetype: disable bzip2 compressed font support
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
X-List-Received-Date: Mon, 19 Sep 2011 11:31:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 19, 2011 at 11:58:36AM +0100, Paul Eggleton wrote:
> If we do not disable this then it is enabled sometimes and disabled at
> others depending on whether bzip2 has been built at the time, and worst
> case it will cause a race condition if bzip2 is building at the same
> time.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/recipes-graphics/freetype/freetype_2.4.6.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-graphics/freetype/freetype_2.4.6.bb b/meta/recipes-graphics/freetype/freetype_2.4.6.bb
> index 8150dd4..94a389a 100644
> --- a/meta/recipes-graphics/freetype/freetype_2.4.6.bb
> +++ b/meta/recipes-graphics/freetype/freetype_2.4.6.bb
> @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=28d5381b1bef2649c59f20c20bae4f39
>  
>  SECTION = "libs"
>  
> -PR = "r0"
> +PR = "r1"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
>             file://no-hardcode.patch"
> @@ -28,7 +28,7 @@ inherit autotools pkgconfig binconfig
>  LIBTOOL = "${S}/builds/unix/${HOST_SYS}-libtool"
>  EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
>  EXTRA_OEMAKE_virtclass-native = ""
> -EXTRA_OECONF = "--without-zlib"
> +EXTRA_OECONF = "--without-zlib --without-bzip2"
>  
>  do_configure() {
>  	cd builds/unix

Hi,

wouldn't it been better to let freetype depend on bz2 and libz. It may save some space in particular situations for some
people.

Bye Henning


