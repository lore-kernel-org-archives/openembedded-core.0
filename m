Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 33F537DE60
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 13:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KznRG8kB9okSWRhxWHtNv+3NyvLGgHFt1UcJzTmeQzE=;
	b=Vumwktthi/kukGYR7XFwCwQ+n0
	mtcz23/tFMtqY/cu0K6AqcB18DeFO+/J19351OVS7P+0T5Tv2iALi2PQCdRyPWKpgr9ouO+FTPyLF
	xs+7A8oyzemeA+NwAO/kEVg3WyXZoDWXIcS+rQEDl3gA6NzL0gEM1WTii5SV8x+AAkYTL/0MaV76K
	+ObC4tj1eF/kMuYZVr/tJ9NTGfNirmA2uRJtWmQCBmuDttSgylPh7gTKskdEFB3R8osNbDNbirSdh
	Pri/aejWskSyRRwr4co69aumIgoKDShXrZdgm8UTpxJFY97UDFCaL2dKsnaCWkLI5PO8/71O6z1pn
	VZajecrg==;
Received: from lakka.kapsi.fi ([2001:67c:1be8::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1hOMae-00023r-T8; Wed, 08 May 2019 16:26:32 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1hOMae-0008Do-QT; Wed, 08 May 2019 16:26:32 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 16:26:09 +0300
Message-Id: <1557321969-28686-2-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1557321969-28686-1-git-send-email-mikko.rapeli@bmw.de>
References: <1557321969-28686-1-git-send-email-mikko.rapeli@bmw.de>
X-SA-Exim-Connect-IP: 2001:67c:1be8::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH 2/2] openssh: usable sshd depends on rngd from rng-tools
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
X-List-Received-Date: Wed, 08 May 2019 13:26:32 -0000

Since openssl 1.1.1 and openssh which uses it, sshd
startup is delayed. The delays range from few seconds
to minutes and even to hours. The delays are visible
in host keys generation and when sshd process is started
in response to incoming TCP connection but is failing
to provide SSH version string and clients or tests time out.

In all cases traces show that sshd is waiting for getentropy()
system call to return from Linux kernel, which returns only
after kernel side random number pool is initialized. The pool
is initialized via various entropy source which may be
missing on embedded development boards or via rngd from
rng-tools package from userspace. HW random number generation
and kernel support help but rngd is till needed to feed that data
back to the Linux kernel.

Example from an NXP imx8 board shows that kernel random number pool
initialization can take over 400 seconds without rngd,
and with rngd it is initialized at around 4 seconds after boot.
The completion of initialization is visible in kernel dmesg with line
"random: crng init done".

More details are available from:

 * https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=912087
 * https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=897572
 * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=43838a23a05fbd13e47d750d3dfd77001536dd33
 * http://www.man7.org/linux/man-pages/man2/getrandom.2.html

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-connectivity/openssh/openssh_7.9p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.9p1.bb b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
index b971b2b..567790c 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
@@ -148,6 +148,7 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
 
 RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
 RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
+RDEPENDS_${PN}-sshd += "rng-tools"
 RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed"
 
 RPROVIDES_${PN}-ssh = "ssh"
-- 
1.9.1


