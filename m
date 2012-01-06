Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1RjJhV-0002el-GH
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jan 2012 00:59:58 +0100
Received: by vcbf1 with SMTP id f1so1669079vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 15:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=IBVFJVrG15pwhEizuw3mmW40po8TfSOrRb5N7d0g65M=;
	b=gqSNCHjy9ap+BokhWaBPe2TJaNJovq7SU2MwmbKQtP8tUb9oZerR/xUfWsFEZfp+JD
	M7uhNYd5tUgq6XsWXh4dZorKUQWvm144zYStEcB3nba4LaSC08pA3eDfMBdXNTxWzyJ+
	yqaHhVqoPgerC8SR0Dx9THg31L+z6nVcTK9T4=
MIME-Version: 1.0
Received: by 10.220.38.5 with SMTP id z5mr4778506vcd.63.1325893952777; Fri, 06
	Jan 2012 15:52:32 -0800 (PST)
Received: by 10.52.95.211 with HTTP; Fri, 6 Jan 2012 15:52:32 -0800 (PST)
Date: Fri, 6 Jan 2012 15:52:32 -0800
Message-ID: <CAGDS+nk4Dj_-VLNafu+-j4s9yYs=6LVwGO0re9NyyuK4Y159Sw@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH RFC] dhcp: package /var/lib/dhcp with dhcp-client rather than dhcp-server
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
X-List-Received-Date: Fri, 06 Jan 2012 23:59:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

Otherwise dhclient encounters errors of this type:

dhclient: can't create
/var/lib/dhcp/dhclient-c0c60402-0bc5-4bd7-bc3b-49a27fa37d72-eth1.lease:
No such file or directory

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc
b/meta/recipes-connectivity/dhcp/dhcp.inc
index f9d80e7..be256ce 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -59,14 +59,14 @@ PACKAGES += "dhcp-server dhcp-server-config
dhcp-client dhcp-relay dhcp-omshell"

 FILES_${PN} = ""

-FILES_dhcp-server = "${sbindir}/dhcpd
${sysconfdir}/init.d/dhcp-server ${localstatedir}/lib/dhcp/"
+FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server"
 RRECOMMENDS_dhcp-server = "dhcp-server-config"

 FILES_dhcp-server-config = "${sysconfdir}/default/dhcp-server
${sysconfdir}/dhcp/dhcpd.conf"

 FILES_dhcp-relay = "${sbindir}/dhcrelay
${sysconfdir}/init.d/dhcp-relay ${sysconfdir}/default/dhcp-relay"

-FILES_dhcp-client = "${base_sbindir}/dhclient
${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf"
+FILES_dhcp-client = "${base_sbindir}/dhclient
${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf
${localstatedir}/lib/dhcp/"
 RDEPENDS_dhcp-client = "bash"

 FILES_dhcp-omshell = "${bindir}/omshell"
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
b/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
index 2471d61..a3a560b 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
@@ -1,6 +1,6 @@
 require dhcp.inc

-PR = "r4"
+PR = "r5"

 SRC_URI += "file://fixincludes.patch \
             file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \


