Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <javier@dowhile0.org>) id 1Sy70j-0004kU-0d
	for openembedded-core@lists.openembedded.org;
	Sun, 05 Aug 2012 22:01:13 +0200
Received: by wgbdr1 with SMTP id dr1so1834570wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2012 12:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=5RbM9KRozLVCjZvdXctqFMIP8ul3JwpWTaeZw547UYE=;
	b=RXoy1hcszI/IudgNVTzOjE8rLDI3/Le7X6mImVQW5DY6awAsrUc4niMt0LFxdH/asw
	u2owS/PNUge1YJodi9RFZwynST3Bs+UooFJBrb/8ZLRV6Yy/mpgJVq4oRK9R6cIs8sFA
	+L/oFYkvghknCIswRA0/GGJ7Hy9+zV3HlVMYCdBXgxqVq+Dpc0U8EZZEX2wi182iUI1N
	DeCFaNVyVz2vdAnQ9e4wX8+qvYWvqiFmzWH3XiYsmU0pm/vtSn+zDegwb5h14rDZV+iA
	+vYPdeMg/rZGUNWl8xXsG1Ox1k8W9JoRB/cegq9DlTLkcs33ygRfEo/pFk01TiZ811aC
	Vg8w==
Received: by 10.216.132.76 with SMTP id n54mr4207700wei.135.1344196169266;
	Sun, 05 Aug 2012 12:49:29 -0700 (PDT)
Received: from localhost.localdomain (198.230.79.188.dynamic.jazztel.es.
	[188.79.230.198])
	by mx.google.com with ESMTPS id w7sm11500981wiz.0.2012.08.05.12.49.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Aug 2012 12:49:28 -0700 (PDT)
From: Javier Martinez Canillas <javier@dowhile0.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun,  5 Aug 2012 21:48:28 +0200
Message-Id: <1344196136-7643-1-git-send-email-javier@dowhile0.org>
X-Mailer: git-send-email 1.7.7.6
X-Gm-Message-State: ALoCoQkScwYfuISKVgfjnTEadDuqMY6U14KQAN9s0zC4Cf9O/GOseXU2sLgYqy5KmBQS52FDr5gX
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
X-List-Received-Date: Sun, 05 Aug 2012 20:01:13 -0000

The OpenEmbedded User Manual list the variables that should be used to
control the directories into which files are installed.

It says that is a poor practice to specify hardcoded paths instead of
using these variables, yet there are many recipes that don't use it.

This is second version of a big patch-set that does a cleanup and replace
the hardcoded paths used on these recipes with the build system variables.

I tried to be as careful as possible to do the proper replacement but
since I could introduce regressions I split the changes in 30 different
patches so it could be git bisectable in case of messing a recipe.

Also, the patches increment the recipes PR since the a distro config can
set the variables to a different value.

Changes since v1:

- Bump recipes PR as suggested by Otavio Salvador and Khem Raj
- Squash ${base_bindir} and ${sysconfdir} changes for xinetd and lsb
  recipes so the PR number gets incremented only once. 

The patch-set consist of the following patches:

[PATCH v2 01/28] xinetd: use ${sbindir} and ${sysconfdir} instead of
[PATCH v2 02/28] alsa-state: use ${sbindir} instead of /usr/sbin for
[PATCH v2 03/28] lsbsetup: use ${bindir} instead of /usr/bin for
[PATCH v2 04/28] sudo: use ${bindir} and ${sysconfdir} instead of
[PATCH v2 05/28] lsbtest: use ${bindir} instead of /usr/bin for
[PATCH v2 06/28] cronie: use variables instead of hardcoded paths
[PATCH v2 07/28] useradd-example: use ${datadir} instead of
[PATCH v2 08/28] ubootchart: use variables instead of hardcoded
[PATCH v2 09/28] xkeyboard-config: use ${datadir} instead of
[PATCH v2 10/28] systemtap: use ${datadir} instead of /usr/share for
[PATCH v2 11/28] lsb: use ${base_bindir} and ${sysconfdir} instead
[PATCH v2 12/28] mingetty: use ${base_sbindir} instead of /sbin for
[PATCH v2 13/28] external-sourcery: use ${prefix} and ${libdir}
[PATCH v2 14/28] rpm: use ${localstatedir} and ${libdir} instead of
[PATCH v2 15/28] at: use ${base_sbindir} instead of /sbin for
[PATCH v2 16/28] kernel.bbclass: use ${base_libdir} and
[PATCH v2 17/28] linux-firware: use ${base_libdir} instead of /lib
[PATCH v2 18/28] openssh: use ${localstatedir} instead of /var for
[PATCH v2 19/28] libpam: use ${localstatedir} and ${sysconfdir}
[PATCH v2 20/28] x11-common: use ${sysconfdir} instead of /etc for
[PATCH v2 21/28] builder: use ${sysconfdir} instead of /etc for
[PATCH v2 22/28] xserver-nodm-init: use ${sysconfdir} instead of
[PATCH v2 23/28] lsbinitscripts: use ${sysconfdir} instead of /etc
[PATCH v2 24/28] usbinit: use ${sysconfdir} instead of /etc for
[PATCH v2 25/28] qemu-config: use ${sysconfdir} instead of /etc for
[PATCH v2 26/28] rsync: use ${sysconfdir} instead of /etc for
[PATCH v2 27/28] chkconfig: use ${sysconfdir} instead of /etc for
[PATCH v2 28/28] man: use ${sysconfdir} instead of /etc for

Best regards,
Javier


