Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy3LW-0007cu-Oh
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 18:06:26 +0200
Received: by wibhq4 with SMTP id hq4so885338wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 08:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=1N++BFVkHavxJqv9SwE1O4IpHlQLLWKZqveVmIDxnPc=;
	b=NPvP47QtU9buj+gVOYaR4R1Bd5Z7DQ6gU22QK07X4iG2aenv9cRbzY3hVtibdQruLq
	OH6hjLqoVvZiA9nXcagXgLAw4LTugqxOZyGxs+yvtdOpjBhfAkhc8Kvv1xyPnFB8YCiu
	9ZCz9TwqyDX8HGuJJGpHcItf4oOGU3YaM3NYQvMjEG+8vHThDubOWME2Pp/B7X9KzB6D
	Hp44q9vZXEXFk3ShlgMEIMAkUise16TuwcRYp4ppHCsbAPOg6G+LnHukparM8e8b3x2T
	Ozqb+F7Tfod0FdFSfAY93dGv9m0EMETtPjctWkVcjTD9oCeZPZ0OaN2OBFZTjdhhMiL6
	PLXQ==
Received: by 10.180.76.135 with SMTP id k7mr11500425wiw.7.1344182083274;
	Sun, 05 Aug 2012 08:54:43 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id t7sm15214066wix.6.2012.08.05.08.54.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 08:54:42 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 17:53:47 +0200
Message-Id: <1344182057-15981-1-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
X-Gm-Message-State: ALoCoQmbcobUO2F+3o0Kpn6LhM++5I4Rwxf/7ooTD4EcyvDsiVCrSR3xJhtywbgwfa7mvUsVeC+p
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/30] cleanup: use variables instead of hardcoded paths
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
X-List-Received-Date: Sun, 05 Aug 2012 16:06:26 -0000

The OpenEmbedded User Manual list the variables that should be used to
control the directories into which files are installed.

It says that is a poor practice to specify hardcoded paths instead of
using these variables, yet there are many recipes that don't use it.

This is a big patch-set that does a cleanup and replace the hardcoded
paths used on these recipes with the build system installation variables.

I tried to be as careful as possible to do the proper replacement but
since I could introduce regressions I split the changes in 30 different
patches so it could be git bisectable in case of messing a recipe.

Also, I didn't increment the PR on the recipes since the modifications
don't introduce a semantic change on them.

The patch-set consist of the following patches:

[PATCH 01/30] xinetd: use ${sbindir} instead of /usr/sbin for
[PATCH 02/30] alsa-state: use ${sbindir} instead of /usr/sbin for
[PATCH 03/30] lsbsetup: use ${bindir} instead of /usr/bin for
[PATCH 04/30] sudo: use ${bindir} and ${sysconfdir} instead of
[PATCH 05/30] lsbtest: use ${bindir} instead of /usr/bin for
[PATCH 06/30] cronie: use variables instead of hardcoded paths
[PATCH 07/30] useradd-example: use ${datadir} instead of /usr/share
[PATCH 08/30] ubootchart: use variables instead of hardcoded paths
[PATCH 09/30] xkeyboard-config: use ${datadir} instead of /usr/share
[PATCH 10/30] systemtap: use ${datadir} instead of /usr/share for
[PATCH 11/30] lsb: use ${base_bindir} instead of /bin for packaging
[PATCH 12/30] mingetty: use ${base_sbindir} instead of /sbin for
[PATCH 13/30] external-sourcery: use ${prefix} and ${libdir} instead
[PATCH 14/30] rpm: use ${localstatedir} and ${libdir} instead of
[PATCH 15/30] at: use ${base_sbindir} instead of /sbin for packaging
[PATCH 16/30] kernel.bbclass: use ${base_libdir} and ${sysconfdir}
[PATCH 17/30] linux-firware: use ${base_libdir} instead of /lib for
[PATCH 18/30] openssh: use ${localstatedir} instead of /var for
[PATCH 19/30] libpam: use ${localstatedir} and ${sysconfdir} instead
[PATCH 20/30] x11-common: use ${sysconfdir} instead of /etc for
[PATCH 21/30] lsb: use ${sysconfdir} instead of /etc for packaging
[PATCH 22/30] builder: use ${sysconfdir} instead of /etc for
[PATCH 23/30] xserver-nodm-init: use ${sysconfdir} instead of /etc
[PATCH 24/30] lsbinitscripts: use ${sysconfdir} instead of /etc for
[PATCH 25/30] xinetd: use ${sysconfdir} instead of /etc for
[PATCH 26/30] usbinit: use ${sysconfdir} instead of /etc for
[PATCH 27/30] qemu-config: use ${sysconfdir} instead of /etc for
[PATCH 28/30] rsync: use ${sysconfdir} instead of /etc for packaging
[PATCH 29/30] chkconfig: use ${sysconfdir} instead of /etc for
[PATCH 30/30] man: use ${sysconfdir} instead of /etc for packaging

Best regards,
Javier


