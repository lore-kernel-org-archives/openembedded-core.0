Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TdbiF-0000Mh-Qj for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 08:05:39 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAS6pKLo010849;
	Wed, 28 Nov 2012 06:51:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09001-07; Wed, 28 Nov 2012 06:51:15 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAS6pBn9010843
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 28 Nov 2012 06:51:13 GMT
Message-ID: <1354085471.21863.124.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed, 28 Nov 2012 06:51:11 +0000
In-Reply-To: <1353910511-12931-1-git-send-email-sgw@linux.intel.com>
References: <1353910511-12931-1-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gst-meta-base: Make ximagesing optional on x11 DISTRO_FEATURE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 07:05:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-11-25 at 22:15 -0800, Saul Wold wrote:
> If x11 is disabled from DISTRO_FEATURE we don't build the ximagesink
> package, but it still becomes a dependency in the final image which
> causes a failure
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../gstreamer/gst-meta-base_0.10.bb                |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
> index 2fb39d5..0889437 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
> @@ -16,7 +16,10 @@ PACKAGES = "\
>  
>  ALLOW_EMPTY = "1"
>  
> +X11_RDEPENDS = "${@base_contains('DISTRO_FEATURES', 'x11', 'gst-plugin-base-ximagesink', '', d)}"
> +
>  RDEPENDS_gst-meta-base = "\
> +    ${X11_RDEPENDS} \
>      gstreamer \
>      gst-plugins-base-playbin \
>      gst-plugins-base-decodebin \

This doesn't make sense, surely there would be some removal of a
dependency as well as an addition?

Looking at the recipe, the ximagesink dependency is already dependent on
DISTRO_FEATURES and is in the gst-meta-x11-base package, not
gst-meta-base?

Cheers,

Richard



