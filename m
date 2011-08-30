Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QyKbF-0005dH-7a for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 11:27:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7U9MKYP017673;
	Tue, 30 Aug 2011 10:22:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15482-05; Tue, 30 Aug 2011 10:22:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7U9M8cU017667
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 30 Aug 2011 10:22:12 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1314694703-22310-1-git-send-email-koen@dominion.thruhere.net>
References: <1314694703-22310-1-git-send-email-koen@dominion.thruhere.net>
Date: Tue, 30 Aug 2011 10:21:58 +0100
Message-ID: <1314696118.5939.301.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC] package ipk bbclass: store build branch and revision in ipkg metadata
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
X-List-Received-Date: Tue, 30 Aug 2011 09:27:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-30 at 10:58 +0200, Koen Kooi wrote:
> The ipkg metadata will look like this now:
> 
>     koen@dominion:/OE/angstrom-dev/deploy/glibc$ dpkg-deb -I ipk/am3517-evm/matrix-gui_1.3-r19.0.6_am3517-evm.ipk
>      new debian package, version 2.0.
>      size 24112 bytes: control archive= 540 bytes.
>          629 bytes,    13 lines      control
>      Package: matrix-gui
>      Version: 1.3-r19.0.6
>      Description: Matrix GUI for Qt X11
>      Section: multimedia
>      Priority: optional
>      Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
>      License: BSD
>      Architecture: am3517-evm
>      OE: matrix-gui
>      Homepage: https://gforge.ti.com/gf/project/matrix_gui/
>      Build: org.openembedded.dev/f35ab2d
>      Depends: matrix-gui-common, libpng12-0, libfreetype6, libz1, libgthread-2.0-0, libqtwebkit4, libphonon4, libqtdbus4, libqtxml4, libqtgui4, libqtnetwork4, libqtcore4, libglib-2.0-0, libc6, libstdc++6, libgcc1
>      Source: svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd=''
>     koen@dominion:/OE/angstrom-dev/deploy/glibc$
> 
>     Signed-off-by: Koen Kooi <koen@openembedded.org>
>     Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>     Acked-by: Chase Maupin <chase.maupin@ti.com>
> 
> [Ported from .dev/6ae45bbf2b5ca9e4fd7e8b04e461f0bf120dd44d]
> ---
>  meta/classes/package_ipk.bbclass |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> index e83aff8..63d7f18 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -303,6 +303,7 @@ python do_package_ipk () {
>  		fields.append(["Architecture: %s\n", ['PACKAGE_ARCH']])
>  		fields.append(["OE: %s\n", ['PN']])
>  		fields.append(["Homepage: %s\n", ['HOMEPAGE']])
> +		fields.append(["Build: %s/%s\n", ['METADATA_BRANCH', 'METADATA_REVISION']])
>  
>  		def pullData(l, d):
>  			l2 = []

How does this cope with our multiple branches and revisions for
different layers? I worry about this being confusing :/

Cheers,

Richard






