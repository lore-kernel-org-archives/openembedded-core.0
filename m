Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q6iMa-0005HH-Ax for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 13:54:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34BqOlX015597
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 12:52:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15522-02 for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2011 12:52:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34BqJA9015591
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 12:52:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <d7081610d5eebeb572620f7813d80a7caf578b48.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
	<d7081610d5eebeb572620f7813d80a7caf578b48.1301631488.git.raj.khem@gmail.com>
Date: Mon, 04 Apr 2011 12:52:17 +0100
Message-ID: <1301917937.24596.340.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 14/46] glib-2.0: Inherit gettext should provide right libintl so remove from DEPENDS
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
X-List-Received-Date: Mon, 04 Apr 2011 11:54:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-31 at 21:28 -0700, Khem Raj wrote:
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.26.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.26.1.bb
> index 6a1fb6c..256abc1 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.26.1.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.26.1.bb
> @@ -1,13 +1,15 @@
>  require glib.inc
>  
>  PE = "1"
> -PR = "r0"
> +PR = "r1"
>  
>  SRC_URI = "${GNOME_MIRROR}/glib/2.26/glib-${PV}.tar.bz2 \
>             file://configure-libtool.patch \
>             file://60_wait-longer-for-threads-to-die.patch \
>             file://g_once_init_enter.patch \
>            "
> +# Only apply this patch for target recipe on uclibc
> +SRC_URI_append_libc-uclibc = " ${@['', 'file://no-iconv.patch']['${PN}' == '${BPN}']}"
>  
>  SRC_URI[md5sum] = "17535accceef55bcb17a74d73f9c2aef"
>  SRC_URI[sha256sum] = "7a74ff12b6b9dee1f2d0e520b56b68b621920c4f4250bdf23468e515625c28d5"
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb
> index 4014a1b..8320ee9 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb
> @@ -1,11 +1,12 @@
>  require glib.inc
>  
> -PR = "r3"
> +PR = "r4"
>  
>  SRC_URI = "${GNOME_MIRROR}/glib/2.27/glib-${PV}.tar.bz2 \
>             file://configure-libtool.patch \
>             file://60_wait-longer-for-threads-to-die.patch \
>             file://g_once_init_enter.patch \
> +           file://no-iconv.patch \
>            "
>  
>  SRC_URI[md5sum] = "b7025b581bf78fcd656117bfc113f21f"

Why is this being done conditionally in one version and not the other?

Cheers,

Richard



