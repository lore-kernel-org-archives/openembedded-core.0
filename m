Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SAKuc-0002bz-Sk for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 13:45:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LCaHOp001639
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 12:36:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01164-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 12:36:12 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LCa8ba001633
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 12:36:09 GMT
Message-ID: <1332333371.9740.150.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2012 12:36:11 +0000
In-Reply-To: <89c2f191e064e431f50af0b36ede86a32c76a86a.1332318835.git.liezhi.yang@windriver.com>
References: <cover.1332318835.git.liezhi.yang@windriver.com>
	<89c2f191e064e431f50af0b36ede86a32c76a86a.1332318835.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] gstreamer 0.10.x: remove do_configure_prepend
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
X-List-Received-Date: Wed, 21 Mar 2012 12:45:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-21 at 16:38 +0800, Robert Yang wrote:
> Remove the do_configure_prepend which is used for removing
> ${S}/m4/lib-link.m4 to compile under libtool 2.2.2, but our libtool has
> been upgraded to 2.4.2, and:
> 
> for the 3 recipes:
>     gst-plugins-bad_0.10.22.bb
>     gst-plugins-base_0.10.35.bb
>     gst-plugins-good_0.10.30.bb
> 
> They don't have m4/lib-link.m4 any more.
> 
> For the gst-plugins-ugly_0.10.18.bb, though it has m4/lib-link.m4, our
> libtool version is now 2.4.2, so we can remove the do_configure_prepend
> from all of them.
> 
> [YOCTO #2148]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../gstreamer/gst-plugins-bad_0.10.22.bb           |    7 +------
>  .../gstreamer/gst-plugins-base_0.10.35.bb          |    7 +------
>  .../gstreamer/gst-plugins-good_0.10.30.bb          |    7 +------
>  .../gstreamer/gst-plugins-ugly_0.10.18.bb          |    7 +------
>  4 files changed, 4 insertions(+), 24 deletions(-)

Not so easy I'm afraid. We need to ensure our libtool is being used.
Even if the version matches, our libtool is patched to ensure the
sysroot and rpaths work correctly. I'm therefore a little nervous about
removing these at this point.

If we go through autoconf and automake and make sure our .m4 files are
used in preference to the recipe source supplied ones, I'll consider
patches like this but not until we've verified that.

Cheers,

Richard



