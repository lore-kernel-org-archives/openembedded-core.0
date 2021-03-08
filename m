Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web09.374.1615226919752979957
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 10:08:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.168.0.2])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 128I8bIu009574
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Mar 2021 12:08:38 -0600
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] Enable the ability to force a password change on boot
Date: Mon,  8 Mar 2021 12:08:35 -0600
Message-Id: <20210308180836.144245-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1

As noted in the commit message, the shadow(5) indicates that the third
parameter of the /etc/shadow file, when set to 0, can be used to force
a password change on login.  Note, a login program that supports this
behavior is required.

It was added to extrausers.bbclass as it has the same dependencies as
the other components of extrausers and should often be used in with
adding/creating new accounts.

This was verified by adding the following to the conf/local.conf:

INHERIT += "extrausers"

EXTRA_FORCE_PASSWORD_CHANGE_append = " root"

$ bitbake core-image-minimal
$ runqemu

Login as root, and it should prompt for a password change.

This was further verified by setting a default root password, as well
as adding a new user to the system.  In both cases it worked as expected.

Finally adding an invalid user to the list, and an appropriate error is
generated.


Mark Hatle (1):
  extrausers: Add ability to force password change on first login

 meta/classes/extrausers.bbclass | 29 +++++++++++++++++++++++++++--
 meta/conf/documentation.conf    |  1 +
 2 files changed, 28 insertions(+), 2 deletions(-)

-- 
2.17.1

