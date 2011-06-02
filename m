Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QS8Om-0007x0-FM for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 15:57:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p52Ds8ew013437
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 14:54:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12816-05 for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2011 14:54:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p52Ds4TM013431
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 14:54:04 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307006136.2529.166.camel@phil-desktop>
References: <1307006136.2529.166.camel@phil-desktop>
Date: Thu, 02 Jun 2011 14:53:44 +0100
Message-ID: <1307022824.27470.545.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] dbus: avoid dependency on x11 for -native build
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
X-List-Received-Date: Thu, 02 Jun 2011 13:57:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-02 at 10:15 +0100, Phil Blundell wrote:
> The native variant already configures --without-x so the X11 libs are
> redundant.  Adjust the DEPENDS to match.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/recipes-core/dbus/dbus.inc |    7 +++++--
>  1 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> index fb2f6d4..5f9a8a3 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -5,8 +5,11 @@ SECTION = "base"
>  LICENSE = "AFL-2 | GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
>                      file://dbus/dbus.h;firstline=6;endline=20;md5=6eea2e0c7750dd8e620dcb1437312fa5"
> -DEPENDS = "expat virtual/libintl virtual/libx11 libsm"
> -DEPENDS_virtclass-nativesdk = "expat virtual/libintl virtual/libx11"
> +x11deps = "virtual/libx11 libsm"
> +basedeps = "expat virtual/libintl"
> +DEPENDS = "${basedeps} ${x11deps}"
> +DEPENDS_virtclass-native = "${basedeps}"
> +DEPENDS_virtclass-nativesdk = "${basedeps} virtual/libx11"
>  
>  SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
>             file://tmpdir.patch; \

Merged to master, thanks.

Richard



