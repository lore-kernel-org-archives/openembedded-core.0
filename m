Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D16CC433EF
	for <webhook@archiver.kernel.org>; Sat,  5 Feb 2022 20:12:15 +0000 (UTC)
Received: from forward107o.mail.yandex.net (forward107o.mail.yandex.net
 [37.140.190.210])
 by mx.groups.io with SMTP id smtpd.web10.868.1644091932639739168
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Feb 2022 12:12:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@zhukoff.net
 header.s=mail header.b=HvExMfT/;
 spf=pass (domain: zhukoff.net, ip: 37.140.190.210,
 mailfrom: pavel@zhukoff.net)
Received: from forward101q.mail.yandex.net (forward101q.mail.yandex.net
 [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb98])
	by forward107o.mail.yandex.net (Yandex) with ESMTP id B92986AF84AE;
	Sat,  5 Feb 2022 23:12:08 +0300 (MSK)
Received: from vla1-0c91d72e5963.qloud-c.yandex.net
 (vla1-0c91d72e5963.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3a21:0:640:c91:d72e])
	by forward101q.mail.yandex.net (Yandex) with ESMTP id A9B9D13E80002;
	Sat,  5 Feb 2022 23:12:08 +0300 (MSK)
Received: from vla5-3832771863b8.qloud-c.yandex.net
 (vla5-3832771863b8.qloud-c.yandex.net [2a02:6b8:c18:3417:0:640:3832:7718])
	by vla1-0c91d72e5963.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 PT5vyYv0bM-C8c8qUCt;
	Sat, 05 Feb 2022 23:12:08 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; s=mail;
 t=1644091928;
	bh=Y5m+/ewQzJoZhAM0b0F84pXWMq0H/ZEV7qWGa8BPpZs=;
	h=Date:Subject:To:From:Message-Id:Cc;
	b=HvExMfT/uUDweRo56surriX7JCCNi2NIGXd7KwJDHzl6yMQbroyw4vSeDfc/PAvNz
	 nyt+Q0HgMKFcW1xJtFsZt+1nZbiHOueqh3K/OWhKYsJhA06kRJ6dxjoTk/UBbQ3uoJ
	 jUxD1LvkjAKkaZ+ycXZYKBxoD2cK42Za7gCH68js=
Authentication-Results: vla1-0c91d72e5963.qloud-c.yandex.net;
 dkim=pass header.i=@zhukoff.net
Received: by vla5-3832771863b8.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id Sp8exbqGXy-C6HG8H6f;
	Sat, 05 Feb 2022 23:12:07 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
X-Yandex-Fwd: 2
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: pavel@zhukoff.net,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Subject: [PATCH] systemd: enable KeepConfiguration= when running on network
 filesystem
Date: Sat,  5 Feb 2022 21:11:12 +0100
Message-Id: <20220205201111.14420-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Feb 2022 20:12:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161390

This fix boot from NFS for systemd enabled systems. Previously
systemd-networkd dropped network configuration on exit from initrd even
if there're NFS mount.

Bug-Url: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14708

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 ...eepConfiguration-when-running-on-net.patch | 253 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.3.bb    |   1 +
 2 files changed, 254 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0029-network-enable=
-KeepConfiguration-when-running-on-net.patch

diff --git a/meta/recipes-core/systemd/systemd/0029-network-enable-KeepCo=
nfiguration-when-running-on-net.patch b/meta/recipes-core/systemd/systemd=
/0029-network-enable-KeepConfiguration-when-running-on-net.patch
new file mode 100644
index 0000000000..4943a0fe5c
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0029-network-enable-KeepConfigura=
tion-when-running-on-net.patch
@@ -0,0 +1,253 @@
+From 6f4e84126aaa4e26cb6865b054ea5ddebd3906e5 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Thu, 3 Feb 2022 12:14:19 +0900
+Subject: [PATCH] network: enable KeepConfiguration=3D when running on ne=
twork
+ filesystem
+Cc: pavel@zhukoff.net
+
+Upstream-Status: Pending
+Upstream-Url: https://github.com/systemd/systemd/pull/22383/commits
+
+network-generator: rename DHCP_TYPE_DHCP -> DHCP_TYPE_DHCP4
+
+To emphasize this is DHCPv4. No behavior is changed.
+
+stat-util: introduce path_is_network_fs()
+
+network: enable KeepConfiguration=3D when running on network filesystem
+
+Also, set KeepConfiguration=3Ddhcp-on-stop by default when running in
+initrd.
+
+Fixes #21967.
+---
+ man/systemd.network.xml                   |  6 +++--
+ src/basic/stat-util.c                     |  9 +++++++
+ src/basic/stat-util.h                     |  1 +
+ src/network/generator/network-generator.c |  4 ++--
+ src/network/generator/network-generator.h |  2 +-
+ src/network/networkd-manager.c            | 29 +++++++++++++++++++++++
+ src/network/networkd-manager.h            |  2 ++
+ src/network/networkd-network.c            | 12 ++++++----
+ src/network/test-networkd-conf.c          |  5 ++++
+ 9 files changed, 60 insertions(+), 10 deletions(-)
+
+diff --git a/man/systemd.network.xml b/man/systemd.network.xml
+index af431e4f2c..f90cff4cd6 100644
+--- a/man/systemd.network.xml
++++ b/man/systemd.network.xml
+@@ -944,8 +944,10 @@ Table=3D1234</programlisting></para>
+           lease expires. This is contrary to the DHCP specification, bu=
t may be the best choice if,
+           e.g., the root filesystem relies on this connection. The sett=
ing <literal>dhcp</literal>
+           implies <literal>dhcp-on-stop</literal>, and <literal>yes</li=
teral> implies
+-          <literal>dhcp</literal> and <literal>static</literal>. Defaul=
ts to <literal>no</literal>.
+-          </para>
++          <literal>dhcp</literal> and <literal>static</literal>. Defaul=
ts to
++          <literal>dhcp-on-stop</literal> when <command>systemd-network=
d</command> is running in
++          initrd, <literal>yes</literal> when the root filesystem is a =
network filesystem, and
++          <literal>no</literal> otherwise.</para>
+         </listitem>
+       </varlistentry>
+     </variablelist>
+diff --git a/src/basic/stat-util.c b/src/basic/stat-util.c
+index efac7b002e..c2269844f8 100644
+--- a/src/basic/stat-util.c
++++ b/src/basic/stat-util.c
+@@ -249,6 +249,15 @@ int path_is_temporary_fs(const char *path) {
+         return is_temporary_fs(&s);
+ }
+=20
++int path_is_network_fs(const char *path) {
++        struct statfs s;
++
++        if (statfs(path, &s) < 0)
++                return -errno;
++
++        return is_network_fs(&s);
++}
++
+ int stat_verify_regular(const struct stat *st) {
+         assert(st);
+=20
+diff --git a/src/basic/stat-util.h b/src/basic/stat-util.h
+index a566114f7c..f7d2f12aa9 100644
+--- a/src/basic/stat-util.h
++++ b/src/basic/stat-util.h
+@@ -53,6 +53,7 @@ int fd_is_temporary_fs(int fd);
+ int fd_is_network_fs(int fd);
+=20
+ int path_is_temporary_fs(const char *path);
++int path_is_network_fs(const char *path);
+=20
+ /* Because statfs.t_type can be int on some architectures, we have to c=
ast
+  * the const magic to the type, otherwise the compiler warns about
+diff --git a/src/network/generator/network-generator.c b/src/network/gen=
erator/network-generator.c
+index c081ec673c..063ad08d80 100644
+--- a/src/network/generator/network-generator.c
++++ b/src/network/generator/network-generator.c
+@@ -47,7 +47,7 @@ static const char * const dracut_dhcp_type_table[_DHCP=
_TYPE_MAX] =3D {
+         [DHCP_TYPE_OFF]     =3D "off",
+         [DHCP_TYPE_ON]      =3D "on",
+         [DHCP_TYPE_ANY]     =3D "any",
+-        [DHCP_TYPE_DHCP]    =3D "dhcp",
++        [DHCP_TYPE_DHCP4]   =3D "dhcp",
+         [DHCP_TYPE_DHCP6]   =3D "dhcp6",
+         [DHCP_TYPE_AUTO6]   =3D "auto6",
+         [DHCP_TYPE_EITHER6] =3D "either6",
+@@ -62,7 +62,7 @@ static const char * const networkd_dhcp_type_table[_DH=
CP_TYPE_MAX] =3D {
+         [DHCP_TYPE_OFF]     =3D "no",
+         [DHCP_TYPE_ON]      =3D "yes",
+         [DHCP_TYPE_ANY]     =3D "yes",
+-        [DHCP_TYPE_DHCP]    =3D "ipv4",
++        [DHCP_TYPE_DHCP4]   =3D "ipv4",
+         [DHCP_TYPE_DHCP6]   =3D "ipv6",
+         [DHCP_TYPE_AUTO6]   =3D "no",   /* TODO: enable other setting? =
*/
+         [DHCP_TYPE_EITHER6] =3D "ipv6", /* TODO: enable other setting? =
*/
+diff --git a/src/network/generator/network-generator.h b/src/network/gen=
erator/network-generator.h
+index dd0a58738b..0e0da2a57a 100644
+--- a/src/network/generator/network-generator.h
++++ b/src/network/generator/network-generator.h
+@@ -13,7 +13,7 @@ typedef enum DHCPType {
+         DHCP_TYPE_OFF,
+         DHCP_TYPE_ON,
+         DHCP_TYPE_ANY,
+-        DHCP_TYPE_DHCP,
++        DHCP_TYPE_DHCP4,
+         DHCP_TYPE_DHCP6,
+         DHCP_TYPE_AUTO6,
+         DHCP_TYPE_EITHER6,
+diff --git a/src/network/networkd-manager.c b/src/network/networkd-manag=
er.c
+index 7e89366ae8..3261f289e9 100644
+--- a/src/network/networkd-manager.c
++++ b/src/network/networkd-manager.c
+@@ -398,6 +398,30 @@ static int signal_restart_callback(sd_event_source =
*s, const struct signalfd_sig
+         return sd_event_exit(sd_event_source_get_event(s), 0);
+ }
+=20
++static int manager_set_keep_configuration(Manager *m) {
++        int r;
++
++        assert(m);
++
++        if (in_initrd()) {
++                log_debug("Running in initrd, keep DHCPv4 addresses on =
stopping networkd by default.");
++                m->keep_configuration =3D KEEP_CONFIGURATION_DHCP_ON_ST=
OP;
++                return 0;
++        }
++
++        r =3D path_is_network_fs("/");
++        if (r < 0)
++                return log_error_errno(r, "Failed to detect if root is =
network filesystem: %m");
++        if (r =3D=3D 0) {
++                m->keep_configuration =3D _KEEP_CONFIGURATION_INVALID;
++                return 0;
++        }
++
++        log_debug("Running on network filesystem, enabling KeepConfigur=
ation=3D by default.");
++        m->keep_configuration =3D KEEP_CONFIGURATION_YES;
++        return 0;
++}
++
+ int manager_setup(Manager *m) {
+         int r;
+=20
+@@ -453,6 +477,10 @@ int manager_setup(Manager *m) {
+         if (r < 0)
+                 return r;
+=20
++        r =3D manager_set_keep_configuration(m);
++        if (r < 0)
++                return r;
++
+         m->state_file =3D strdup("/run/systemd/netif/state");
+         if (!m->state_file)
+                 return -ENOMEM;
+@@ -468,6 +496,7 @@ int manager_new(Manager **ret, bool test_mode) {
+                 return -ENOMEM;
+=20
+         *m =3D (Manager) {
++                .keep_configuration =3D _KEEP_CONFIGURATION_INVALID,
+                 .test_mode =3D test_mode,
+                 .speed_meter_interval_usec =3D SPEED_METER_DEFAULT_TIME=
_INTERVAL,
+                 .online_state =3D _LINK_ONLINE_STATE_INVALID,
+diff --git a/src/network/networkd-manager.h b/src/network/networkd-manag=
er.h
+index 36313589a3..86de529124 100644
+--- a/src/network/networkd-manager.h
++++ b/src/network/networkd-manager.h
+@@ -28,6 +28,8 @@ struct Manager {
+         Hashmap *polkit_registry;
+         int ethtool_fd;
+=20
++        KeepConfiguration keep_configuration;
++
+         bool test_mode;
+         bool enumerating;
+         bool dirty;
+diff --git a/src/network/networkd-network.c b/src/network/networkd-netwo=
rk.c
+index 3142be471f..edcd68d616 100644
+--- a/src/network/networkd-network.c
++++ b/src/network/networkd-network.c
+@@ -124,6 +124,7 @@ int network_verify(Network *network) {
+         int r;
+=20
+         assert(network);
++        assert(network->manager);
+         assert(network->filename);
+=20
+         if (net_match_is_empty(&network->match) && !network->conditions=
)
+@@ -248,10 +249,11 @@ int network_verify(Network *network) {
+         }
+=20
+         if (network->dhcp_critical >=3D 0) {
+-                if (network->keep_configuration >=3D 0)
+-                        log_warning("%s: Both KeepConfiguration=3D and =
deprecated CriticalConnection=3D are set. "
+-                                    "Ignoring CriticalConnection=3D.", =
network->filename);
+-                else if (network->dhcp_critical)
++                if (network->keep_configuration >=3D 0) {
++                        if (network->manager->keep_configuration < 0)
++                                log_warning("%s: Both KeepConfiguration=
=3D and deprecated CriticalConnection=3D are set. "
++                                            "Ignoring CriticalConnectio=
n=3D.", network->filename);
++                } else if (network->dhcp_critical)
+                         /* CriticalConnection=3Dyes also preserve forei=
gn static configurations. */
+                         network->keep_configuration =3D KEEP_CONFIGURAT=
ION_YES;
+                 else
+@@ -386,7 +388,7 @@ int network_load_one(Manager *manager, OrderedHashma=
p **networks, const char *fi
+                 .allmulticast =3D -1,
+                 .promiscuous =3D -1,
+=20
+-                .keep_configuration =3D _KEEP_CONFIGURATION_INVALID,
++                .keep_configuration =3D manager->keep_configuration,
+=20
+                 .dhcp_duid.type =3D _DUID_TYPE_INVALID,
+                 .dhcp_critical =3D -1,
+diff --git a/src/network/test-networkd-conf.c b/src/network/test-network=
d-conf.c
+index 4b00a98086..5f1328e39c 100644
+--- a/src/network/test-networkd-conf.c
++++ b/src/network/test-networkd-conf.c
+@@ -6,6 +6,7 @@
+ #include "net-condition.h"
+ #include "networkd-address.h"
+ #include "networkd-conf.h"
++#include "networkd-manager.h"
+ #include "networkd-network.h"
+ #include "strv.h"
+=20
+@@ -166,11 +167,15 @@ static void test_config_parse_ether_addr(void) {
+ }
+=20
+ static void test_config_parse_address_one(const char *rvalue, int famil=
y, unsigned n_addresses, const union in_addr_union *u, unsigned char pref=
ixlen) {
++        _cleanup_(manager_freep) Manager *manager =3D NULL;
+         _cleanup_(network_unrefp) Network *network =3D NULL;
+=20
++        assert_se(manager_new(&manager, /* test_mode =3D */ true) >=3D =
0);
+         assert_se(network =3D new0(Network, 1));
+         network->n_ref =3D 1;
++        network->manager =3D manager;
+         assert_se(network->filename =3D strdup("hogehoge.network"));
++
+         assert_se(config_parse_match_ifnames("network", "filename", 1, =
"section", 1, "Name", 0, "*", &network->match.ifname, network) =3D=3D 0);
+         assert_se(config_parse_address("network", "filename", 1, "secti=
on", 1, "Address", 0, rvalue, network, network) =3D=3D 0);
+         assert_se(ordered_hashmap_size(network->addresses_by_section) =3D=
=3D 1);
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd_250.3.bb b/meta/recipes-co=
re/systemd/systemd_250.3.bb
index de16a4d78d..f15710dd6f 100644
--- a/meta/recipes-core/systemd/systemd_250.3.bb
+++ b/meta/recipes-core/systemd/systemd_250.3.bb
@@ -25,6 +25,7 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-sla=
sh.patch \
            file://0001-test-parse-argument-Include-signal.h.patch \
+           file://0029-network-enable-KeepConfiguration-when-running-on-=
net.patch \
            "
=20
 # patches needed by musl
--=20
2.34.1


