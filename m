Return-Path: <tanuk@iki.fi>
X-Greylist: delayed 425 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 03 Aug 2018 10:46:10 UTC
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 8D0EE71C42
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 10:46:10 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 6B6EA21E49;
	Fri,  3 Aug 2018 06:39:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Fri, 03 Aug 2018 06:39:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jlK0uq
	h/l7w4sxg8ZXBTu+qGzTy1DfmODJlBtDaGNNc=; b=kGkebPiYK5siaH2fUo12NL
	9de+xD0Hv3XQmqsdJ0Bq9beX9eyUT7DqP9HcUnnN8J8AnxXjwznshUhBoAPLYEh3
	UttCKeZ9cb1jTKkQAJ/lZdBVCEDsAABEXwgkE7EYhm44OwrPhabOPZtiSY86OWGl
	RP4MEufGYQXhnUdiBy9v/lVhrutqS8B1CJx3FQqaqySNiXJ0lW7CF609HIDmw1SW
	l/RML9q2ED5gvuiCa8nd7wKa2YheA35uFB+mBqE+UUkFW4dBiHEw7zeBYysHyQPI
	IXvWPbW35cKkrB8PPPC/MG6tyz5HZdI4/gvjfX8Qgb2ZetgoxpY3w2anjlmd1TfA
	==
X-ME-Proxy: <xmx:yjBkWzbwl4gvQ9E7P13ChV6vkl5qqlWQphkSmTHhk9oy525NU5bkhQ>
	<xmx:yjBkWw3o2o16oYgPbXEdQUOuCWjQy_ejRpb4yIJawaTug9wIM51gSg>
	<xmx:yjBkW4krfHTfsUtG9NmrdaFs7uRtuY0OgXqN4EwP_ByFhA14mrHfMQ>
	<xmx:yjBkW0-1vCLZd1ycCklBRcdvYvmrAnMNf9kYiG3RI1OEDlJKLNNevg>
	<xmx:yjBkW3EUg5qvU_efcgl16czq1JR5PHUJ8LLTh1mKOiEmzabSwmgSdg>
	<xmx:yjBkW9yj-aRILMV8HcyR-wL42WRTig0Ai7pCtidqPLvEJ4iywYbavg>
X-ME-Sender: <xms:yjBkW3b82yDNtGoND5vseoHKUU32VvtFOnguz5FYJwJ-KVWxVV9_gQ>
Received: from laptop (88-113-211-72.elisa-laajakaista.fi [88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id A392EE450E;
	Fri,  3 Aug 2018 06:39:05 -0400 (EDT)
Message-ID: <cf87613f225edd16345d2575996e3c923b3b3b5d.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 03 Aug 2018 13:39:02 +0300
In-Reply-To: <20180802212200.1522-1-JPEWhacker@gmail.com>
References: <20180802212200.1522-1-JPEWhacker@gmail.com>
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH] alsa-lib: Allow empty alsa-lib package for SDK
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
X-List-Received-Date: Fri, 03 Aug 2018 10:46:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-08-02 at 16:22 -0500, Joshua Watt wrote:
> Without ALLOW_EMPTY, the empty alsa-lib package (which gets culled)
> makes it fairly difficult to create an image that has libasound, then
> create an SDK from that image that has the proper development files.
> 
> If there is no alsa-lib package, the only way to get libasound on a
> target image is to do:
> 
>  IMAGE_INSTALL += "libasound"
> 
> This however causes a problem because all of the development files that
> would be desired in the SDK are located in alsa-lib-dev, which won't be
> included (because alsa-lib wasn't included). Without ALLOW_EMPTY_${PN},
> it is not possible to do:
> 
>  IMAGE_INSTALL += "alsa-lib"
> 
> because the package is empty and gets culled. Adding the ALLOW_EMPTY and
> then making alsa-lib RDEPEND on libasound solves this problem and allows
> alsa-lib to be installed on the target and have the correct development
> files in the SDK
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
> index 6364e9eafaa..581655c5349 100644
> --- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
> @@ -24,6 +24,13 @@ FILES_libasound = "${libdir}/libasound.so.*"
>  FILES_alsa-server = "${bindir}/*"
>  FILES_alsa-conf = "${datadir}/alsa/"
>  
> +# Create an alsa-lib package even though it is empty and make it RDEPEND on
> +# libasound for target builds. This makes it possible to sanely create a image
> +# that has libasound and then generate an SDK from that image that has
> +# alsa-lib-dev
> +ALLOW_EMPTY_${PN} = "1"
> +RDEPENDS_${PN}_class-target = "libasound"
> +
>  RDEPENDS_libasound = "alsa-conf"
>  
>  # alsa-lib gets automatically added to alsa-lib-dev dependencies, but the

Looks fine to me, although renaming alsa-lib-dev to libasound-dev would
seem like a sensible option too.

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

