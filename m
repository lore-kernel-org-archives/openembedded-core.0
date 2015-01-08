Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 28E85609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 08:43:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [78.10.193.111])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id F065A2D7F0F;
	Thu,  8 Jan 2015 09:43:48 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org, Chen Qi <Qi.Chen@windriver.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Ross Burton <ross.burton@intel.com>, "Peter A. Bigot" <pab@pabigot.com>
Date: Thu,  8 Jan 2015 09:43:41 +0100
Message-Id: <1420706622-31273-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.3
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH] systemd-networkd: cherry picking route handling patch
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
X-List-Received-Date: Thu, 08 Jan 2015 08:43:53 -0000

There is a problem in systemd-networkd version used in OE-core (216 as
of now) that prevents a successful communication in a configuration
that uses a static or IPv4 LL address alongside a dynamically obtained
one. The setup is rather not uncommon as is makes sense to always have
a static well known address that a technician or a support engineer
can access while in the field.

The current code in systed-networkd uses a clever trick to add a
static route to the gateway, to workaround a misconfigured DHCP server
that would assign an address from network pool that the gateway is not
a part of. The trick was missing a source IP address specification in
the static route, thus normally the first assigned IP address would be
used for outgoing IP packets. In this particular case the address
would the static one, hence the packet would most probably be dropped
by the router. Also, it is quite common in smaller networks that the
DHCP server, gateway router and even a DNS server are colocated. In
these setups the current code will effectively render any
communication to or past the router impossible.


Maciej Borzecki (1):
  systemd: cherry-pick patch fixing networkd gateway route handling

 ...d-preferred-source-to-dhcp4-gateway-route.patch | 109 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_216.bb           |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-networkd-add-preferred-source-to-dhcp4-gateway-route.patch

-- 
1.9.3


