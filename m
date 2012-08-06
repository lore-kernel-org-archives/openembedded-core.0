Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SyOxN-0002UG-Mm for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 17:10:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q76ExBtO028828;
	Mon, 6 Aug 2012 15:59:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27900-07; Mon,  6 Aug 2012 15:59:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q76Ex0j1028820
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 6 Aug 2012 15:59:02 +0100
Message-ID: <1344265143.9756.169.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Javier Martinez Canillas <javier@dowhile0.org>
Date: Mon, 06 Aug 2012 15:59:03 +0100
In-Reply-To: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
References: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: (No subject)
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
X-List-Received-Date: Mon, 06 Aug 2012 15:10:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-08-05 at 21:48 +0200, Javier Martinez Canillas wrote:
> The OpenEmbedded User Manual list the variables that should be used to
> control the directories into which files are installed.
> 
> It says that is a poor practice to specify hardcoded paths instead of
> using these variables, yet there are many recipes that don't use it.
> 
> This is second version of a big patch-set that does a cleanup and replace
> the hardcoded paths used on these recipes with the build system variables.
> 
> I tried to be as careful as possible to do the proper replacement but
> since I could introduce regressions I split the changes in 30 different
> patches so it could be git bisectable in case of messing a recipe.
> 
> Also, the patches increment the recipes PR since the a distro config can
> set the variables to a different value.
> 
> Changes since v1:
> 
> - Bump recipes PR as suggested by Otavio Salvador and Khem Raj
> - Squash ${base_bindir} and ${sysconfdir} changes for xinetd and lsb
>   recipes so the PR number gets incremented only once. 
> 
> The patch-set consist of the following patches:
> 
> [PATCH v2 01/28] xinetd: use ${sbindir} and ${sysconfdir} instead of
> [PATCH v2 02/28] alsa-state: use ${sbindir} instead of /usr/sbin for
> [PATCH v2 03/28] lsbsetup: use ${bindir} instead of /usr/bin for
> [PATCH v2 04/28] sudo: use ${bindir} and ${sysconfdir} instead of
> [PATCH v2 05/28] lsbtest: use ${bindir} instead of /usr/bin for
> [PATCH v2 06/28] cronie: use variables instead of hardcoded paths
> [PATCH v2 07/28] useradd-example: use ${datadir} instead of
> [PATCH v2 08/28] ubootchart: use variables instead of hardcoded
> [PATCH v2 09/28] xkeyboard-config: use ${datadir} instead of
> [PATCH v2 10/28] systemtap: use ${datadir} instead of /usr/share for
> [PATCH v2 11/28] lsb: use ${base_bindir} and ${sysconfdir} instead
> [PATCH v2 12/28] mingetty: use ${base_sbindir} instead of /sbin for
> [PATCH v2 13/28] external-sourcery: use ${prefix} and ${libdir}
> [PATCH v2 14/28] rpm: use ${localstatedir} and ${libdir} instead of
> [PATCH v2 15/28] at: use ${base_sbindir} instead of /sbin for
> [PATCH v2 16/28] kernel.bbclass: use ${base_libdir} and
> [PATCH v2 17/28] linux-firware: use ${base_libdir} instead of /lib
> [PATCH v2 18/28] openssh: use ${localstatedir} instead of /var for
> [PATCH v2 19/28] libpam: use ${localstatedir} and ${sysconfdir}
> [PATCH v2 20/28] x11-common: use ${sysconfdir} instead of /etc for
> [PATCH v2 21/28] builder: use ${sysconfdir} instead of /etc for
> [PATCH v2 22/28] xserver-nodm-init: use ${sysconfdir} instead of
> [PATCH v2 23/28] lsbinitscripts: use ${sysconfdir} instead of /etc
> [PATCH v2 24/28] usbinit: use ${sysconfdir} instead of /etc for
> [PATCH v2 25/28] qemu-config: use ${sysconfdir} instead of /etc for
> [PATCH v2 26/28] rsync: use ${sysconfdir} instead of /etc for
> [PATCH v2 27/28] chkconfig: use ${sysconfdir} instead of /etc for
> [PATCH v2 28/28] man: use ${sysconfdir} instead of /etc for

Thanks for these, I merged most of them apart from external-sourcery
which Chris commented on, the at recipe which I found a better fix for
which removed the lines in question and the rpm change which I want to
check something out related to it first.

Cheers,

Richard



