Return-Path: <tomas@novotny.cz>
X-Greylist: delayed 409 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 18 Nov 2016 18:19:41 UTC
Received: from hosting.pavoucek.net (hosting.pavoucek.net [46.28.107.168])
	by mail.openembedded.org (Postfix) with ESMTP id 02C4A71A1E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 18:19:41 +0000 (UTC)
Received: from tomas.local.tbs-biometrics.cz (unknown [176.74.132.138])
	(Authenticated sender: tomas@novotny.cz)
	by hosting.pavoucek.net (Postfix) with ESMTPSA id B221D101F48
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 19:12:52 +0100 (CET)
Date: Fri, 18 Nov 2016 19:12:52 +0100
From: Tomas Novotny <tomas@novotny.cz>
To: openembedded-core@lists.openembedded.org
Message-ID: <20161118191252.43d474b6@tomas.local.tbs-biometrics.cz>
X-Mailer: Claws Mail 3.11.0 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Loss of a wayland socket by a systemd user session
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
X-List-Received-Date: Fri, 18 Nov 2016 18:19:42 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi all,

I'm using weston and its 'weston-start' script shipped with oe-core (morty).
It works perfectly until root is logged in. The problematic path is:

1) 'weston-start' is started during boot. XDG_RUNTIME_DIR for root doesn't
exist so it is created and 'wayland-0' socket is created in that directory.
So far so good.

2) When root is logged in, systemd user session is started via 'systemd
--user'. This replaces original XDG_RUNTIME_DIR (new tmpfs is mounted over
it) and the 'wayland-0' socket is lost. Logout doesn't help, the original
XDG_RUNTIME_DIR is deleted. You can imagine that weston doesn't work properly
without that socket.

Is there any proper way to fix it?

Thanks,

Tomas


