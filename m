Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 205577C85D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 09:46:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4K9kOP3001968
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 May 2019 02:46:24 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 20 May 2019 02:46:24 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 May 2019 05:46:20 -0400
Message-ID: <20190520094621.94652-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 0/1] Configure wired network interface with dhcp
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
X-List-Received-Date: Mon, 20 May 2019 09:46:25 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Configure wired network interface with dhcp when use systemd as default init
manager.

Test steps:
1 $ . oe-init-build-env
2 set MACHINE and systemd as default int manager in local.conf
  DISTRO_FEATURES_append = " systemd"
  DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
  VIRTUAL-RUNTIME_login_manager = "shadow-base"
  VIRTUAL-RUNTIME_init_manager = "systemd"
  VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
  MACHINE ?= "genericx86-64"

3 bitbake core-image-minial
4 show ip status:
$ ip ad
  1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1000
      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
      inet 127.0.0.1/8 scope host lo
         valid_lft forever preferred_lft forever
      inet6 ::1/128 scope host 
         valid_lft forever preferred_lft forever
  2: enp0s25: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast qlen 1000
      link/ether f4:4d:30:66:fb:fd brd ff:ff:ff:ff:ff:ff
      inet 128.224.162.241/23 brd 128.224.163.255 scope global dynamic enp0s25
         valid_lft 13520sec preferred_lft 13520sec
      inet6 fe80::f64d:30ff:fe66:fbfd/64 scope link 
         valid_lft forever preferred_lft forever
  3: sit0@NONE: <NOARP> mtu 1480 qdisc noop qlen 1000
      link/sit 0.0.0.0 brd 0.0.0.0

5 when connman is installed, 2 dynamic ips are allocated for enp0s25 and both work:
$ ip ad
  1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1000
      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
      inet 127.0.0.1/8 scope host lo
         valid_lft forever preferred_lft forever
      inet6 ::1/128 scope host 
         valid_lft forever preferred_lft forever
  2: enp0s25: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast qlen 1000
      link/ether f4:4d:30:66:fb:fd brd ff:ff:ff:ff:ff:ff
      inet 128.224.162.241/23 brd 128.224.163.255 scope global dynamic enp0s25
         valid_lft 13908sec preferred_lft 13908sec
      inet 128.224.163.143/23 brd 128.224.163.255 scope global secondary enp0s25
         valid_lft forever preferred_lft forever
      inet6 fe80::f64d:30ff:fe66:fbfd/64 scope link 
         valid_lft forever preferred_lft forever
  3: sit0@NONE: <NOARP> mtu 1480 qdisc noop qlen 1000
      link/sit 0.0.0.0 brd 0.0.0.0


Kai Kang (1):
  systemd-conf: configure wired network with dhcp

 meta/recipes-core/systemd/systemd-conf/dhcp.network | 5 +++++
 meta/recipes-core/systemd/systemd-conf_242.bb       | 3 +++
 2 files changed, 8 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd-conf/dhcp.network

--
2.20.0


