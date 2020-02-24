Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
	by mail.openembedded.org (Postfix) with ESMTP id C7CEE61617
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 19:05:56 +0000 (UTC)
Received: from otwaon0812w-grc-09-64-228-70-69.dsl.bell.ca
	([64.228.70.69]:47952 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>) id 1j6J3C-006UDX-Uk
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Feb 2020 14:05:57 -0500
Date: Mon, 24 Feb 2020 14:05:53 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.21.2002241402001.5567@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id:
	rpjday+crashcourse.ca/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: why would systemd-systemctl-native need underlying sysvinit?
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
X-List-Received-Date: Mon, 24 Feb 2020 19:05:56 -0000
Content-Type: text/plain; charset=US-ASCII


  in midst of migrating old YP layer to newer one and running across
all sorts of oddities. in this case, in current master branch of
oe-core, we have:

recipes-bsp/keymaps/keymaps_1.0.bb:PACKAGE_WRITE_DEPS_append = "
${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','systemd-systemctl-native','',d)}"

recipes-core/psplash/psplash_git.bb:PACKAGE_WRITE_DEPS_append = "
${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd-systemctl-native','',d)}"

recipes-core/dbus/dbus_1.12.16.bb:PACKAGE_WRITE_DEPS +=
"${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','systemd-systemctl-native','',d)}"

recipes-core/initscripts/initscripts_1.0.bb:PACKAGE_WRITE_DEPS_append = "
${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd-systemctl-native','',d)}"

recipes-kernel/modutils-initscripts/modutils-initscripts.bb:PACKAGE_WRITE_DEPS_append = "
${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd-systemctl-native','',d)}"

  i'm curious as to why, in some cases, systemd-systemctl-native
requires *both* systemd and sysvinit to be contained in
DISTRO_FEATURES, but not in other cases. the migration section to YP
2.3 talks only about systemd.

  thoughts?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

