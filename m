Return-Path: <bmouring@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 278D173E3B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 18:14:16 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u0MIEHOI030275; Fri, 22 Jan 2016 12:14:17 -0600
Received: from zardoz.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with SMTP id 2016012212141614-205937 ;
	Fri, 22 Jan 2016 12:14:16 -0600 
Received: by zardoz.amer.corp.natinst.com (sSMTP sendmail emulation);
	Fri, 22 Jan 2016 12:14:15 -0600
From: bmouring@ni.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jan 2016 12:13:52 -0600
Message-Id: <1453486432-24073-1-git-send-email-brad.mouring@ni.com>
X-Mailer: git-send-email 2.6.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/22/2016 12:14:17 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/22/2016 12:14:17 PM,
	Serialize complete at 01/22/2016 12:14:17 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-22_07:, , signatures=0
Cc: Brad Mouring <brad.mouring@ni.com>
Subject: [PATCH] avahi: Add patch to fix Win10 mDNS issues
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
X-List-Received-Date: Fri, 22 Jan 2016 18:14:17 -0000

Windows 10 will respond to mDNS messages when it  really shouldn't,
resulting in a lot of logging. Pulling the change from avahi upstream.
This will be fixed in avahi 0.6.32

External References:
https://bugs.launchpad.net/ubuntu/+source/avahi/+bug/1342400
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=794145
https://bugzilla.redhat.com/show_bug.cgi?id=1240711
https://social.technet.microsoft.com/Forums/en-US/b334e797-ef80-4525-b74a-b4830420a14e/windows-10-spams-network-with-invalid-mdns-response-packets?forum=win10itpronetworking

Signed-off-by: Brad Mouring <brad.mouring@ni.com>
---
 meta/recipes-connectivity/avahi/avahi_0.6.31.bb    |   4 +
 ...arnings-about-invalid-packets-Fixes-lathi.patch | 151 +++++++++++++++++++++
 2 files changed, 155 insertions(+)
 create mode 100644 meta/recipes-connectivity/avahi/files/0001-Don-t-log-warnings-about-invalid-packets-Fixes-lathi.patch

diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.31.bb b/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
index 5d796a2..fc666df 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
@@ -17,6 +17,10 @@ PR = "${INC_PR}.1"
 SRC_URI[md5sum] = "2f22745b8f7368ad5a0a3fddac343f2d"
 SRC_URI[sha256sum] = "8372719b24e2dd75de6f59bb1315e600db4fd092805bd1201ed0cb651a2dab48"
 
+SRC_URI_append = " \
+    file://0001-Don-t-log-warnings-about-invalid-packets-Fixes-lathi.patch \
+    "
+
 DEPENDS += "intltool-native"
 
 PACKAGES =+ "libavahi-gobject"
diff --git a/meta/recipes-connectivity/avahi/files/0001-Don-t-log-warnings-about-invalid-packets-Fixes-lathi.patch b/meta/recipes-connectivity/avahi/files/0001-Don-t-log-warnings-about-invalid-packets-Fixes-lathi.patch
new file mode 100644
index 0000000..34f3fad
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/0001-Don-t-log-warnings-about-invalid-packets-Fixes-lathi.patch
@@ -0,0 +1,151 @@
+From de7cde877e4daa5d9d4fb5b1a349299eaa94969d Mon Sep 17 00:00:00 2001
+From: Trent Lloyd <trent@lloyd.id.au>
+Date: Sat, 10 Oct 2015 06:20:46 +0800
+Subject: [PATCH] Don't log warnings about invalid packets (Fixes
+ lathiat/avahi#10)
+
+Various invalid packets would generate a warning, in particular
+Windows 10 generates response packets with no answer records and
+generally seemingly empty.  Unsure why at this stage.
+
+This results in spamming syslog quite a lot on busy networks,
+similar issues like this have occured over time due to changes
+in various operating systems and specs (e.g. Avahi #284, #282)
+
+Rather than just disable this single message or case, I have
+pre-emptively turned the majority of these bad packet messages
+into debug messages.  They can still be output on production
+builds if reuqired using the --debug option (no rebuild required).
+
+External References:
+https://bugs.launchpad.net/ubuntu/+source/avahi/+bug/1342400
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=794145
+https://bugzilla.redhat.com/show_bug.cgi?id=1240711
+---
+ avahi-core/server.c | 28 ++++++++++++++--------------
+ 1 file changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/avahi-core/server.c b/avahi-core/server.c
+index e87f035..a2cb19a 100644
+--- a/avahi-core/server.c
++++ b/avahi-core/server.c
+@@ -587,7 +587,7 @@ static void handle_query_packet(AvahiServer *s, AvahiDnsPacket *p, AvahiInterfac
+         int unicast_response = 0;
+ 
+         if (!(key = avahi_dns_packet_consume_key(p, &unicast_response))) {
+-            avahi_log_warn(__FILE__": Packet too short or invalid while reading question key. (Maybe a UTF-8 problem?)");
++            avahi_log_debug(__FILE__": Packet too short or invalid while reading question key. (Maybe a UTF-8 problem?)");
+             goto fail;
+         }
+ 
+@@ -615,7 +615,7 @@ static void handle_query_packet(AvahiServer *s, AvahiDnsPacket *p, AvahiInterfac
+             int unique = 0;
+ 
+             if (!(record = avahi_dns_packet_consume_record(p, &unique))) {
+-                avahi_log_warn(__FILE__": Packet too short or invalid while reading known answer record. (Maybe a UTF-8 problem?)");
++                avahi_log_debug(__FILE__": Packet too short or invalid while reading known answer record. (Maybe a UTF-8 problem?)");
+                 goto fail;
+             }
+ 
+@@ -632,7 +632,7 @@ static void handle_query_packet(AvahiServer *s, AvahiDnsPacket *p, AvahiInterfac
+             int unique = 0;
+ 
+             if (!(record = avahi_dns_packet_consume_record(p, &unique))) {
+-                avahi_log_warn(__FILE__": Packet too short or invalid while reading probe record. (Maybe a UTF-8 problem?)");
++                avahi_log_debug(__FILE__": Packet too short or invalid while reading probe record. (Maybe a UTF-8 problem?)");
+                 goto fail;
+             }
+ 
+@@ -669,7 +669,7 @@ static void handle_response_packet(AvahiServer *s, AvahiDnsPacket *p, AvahiInter
+         int cache_flush = 0;
+ 
+         if (!(record = avahi_dns_packet_consume_record(p, &cache_flush))) {
+-            avahi_log_warn(__FILE__": Packet too short or invalid while reading response record. (Maybe a UTF-8 problem?)");
++            avahi_log_debug(__FILE__": Packet too short or invalid while reading response record. (Maybe a UTF-8 problem?)");
+             break;
+         }
+ 
+@@ -901,13 +901,13 @@ static void dispatch_packet(AvahiServer *s, AvahiDnsPacket *p, const AvahiAddres
+ 
+     if (!(i = avahi_interface_monitor_get_interface(s->monitor, iface, src_address->proto)) ||
+         !i->announcing) {
+-        avahi_log_warn("Received packet from invalid interface.");
++        avahi_log_debug("Received packet from invalid interface.");
+         return;
+     }
+ 
+     if (port <= 0) {
+         /* This fixes RHBZ #475394 */
+-        avahi_log_warn("Received packet from invalid source port %u.", (unsigned) port);
++        avahi_log_debug("Received packet from invalid source port %u.", (unsigned) port);
+         return;
+     }
+ 
+@@ -924,7 +924,7 @@ static void dispatch_packet(AvahiServer *s, AvahiDnsPacket *p, const AvahiAddres
+         from_local_iface = originates_from_local_iface(s, iface, src_address, port);
+ 
+     if (avahi_dns_packet_check_valid_multicast(p) < 0) {
+-        avahi_log_warn("Received invalid packet.");
++        avahi_log_debug("Received invalid packet.");
+         return;
+     }
+ 
+@@ -940,7 +940,7 @@ static void dispatch_packet(AvahiServer *s, AvahiDnsPacket *p, const AvahiAddres
+ 
+             if ((avahi_dns_packet_get_field(p, AVAHI_DNS_FIELD_ANCOUNT) != 0 ||
+                  avahi_dns_packet_get_field(p, AVAHI_DNS_FIELD_NSCOUNT) != 0)) {
+-                avahi_log_warn("Invalid legacy unicast query packet.");
++                avahi_log_debug("Invalid legacy unicast query packet.");
+                 return;
+             }
+ 
+@@ -956,19 +956,19 @@ static void dispatch_packet(AvahiServer *s, AvahiDnsPacket *p, const AvahiAddres
+         char t[AVAHI_ADDRESS_STR_MAX];
+ 
+         if (port != AVAHI_MDNS_PORT) {
+-            avahi_log_warn("Received response from host %s with invalid source port %u on interface '%s.%i'", avahi_address_snprint(t, sizeof(t), src_address), port, i->hardware->name, i->protocol);
++            avahi_log_debug("Received response from host %s with invalid source port %u on interface '%s.%i'", avahi_address_snprint(t, sizeof(t), src_address), port, i->hardware->name, i->protocol);
+             return;
+         }
+ 
+         if (ttl != 255 && s->config.check_response_ttl) {
+-            avahi_log_warn("Received response from host %s with invalid TTL %u on interface '%s.%i'.", avahi_address_snprint(t, sizeof(t), src_address), ttl, i->hardware->name, i->protocol);
++            avahi_log_debug("Received response from host %s with invalid TTL %u on interface '%s.%i'.", avahi_address_snprint(t, sizeof(t), src_address), ttl, i->hardware->name, i->protocol);
+             return;
+         }
+ 
+         if (!is_mdns_mcast_address(dst_address) &&
+             !avahi_interface_address_on_link(i, src_address)) {
+ 
+-            avahi_log_warn("Received non-local response from host %s on interface '%s.%i'.", avahi_address_snprint(t, sizeof(t), src_address), i->hardware->name, i->protocol);
++            avahi_log_debug("Received non-local response from host %s on interface '%s.%i'.", avahi_address_snprint(t, sizeof(t), src_address), i->hardware->name, i->protocol);
+             return;
+         }
+ 
+@@ -976,7 +976,7 @@ static void dispatch_packet(AvahiServer *s, AvahiDnsPacket *p, const AvahiAddres
+             avahi_dns_packet_get_field(p, AVAHI_DNS_FIELD_ANCOUNT) == 0 ||
+             avahi_dns_packet_get_field(p, AVAHI_DNS_FIELD_NSCOUNT) != 0) {
+ 
+-            avahi_log_warn("Invalid response packet from host %s.", avahi_address_snprint(t, sizeof(t), src_address));
++            avahi_log_debug("Invalid response packet from host %s.", avahi_address_snprint(t, sizeof(t), src_address));
+             return;
+         }
+ 
+@@ -992,12 +992,12 @@ static void dispatch_legacy_unicast_packet(AvahiServer *s, AvahiDnsPacket *p) {
+     assert(p);
+ 
+     if (avahi_dns_packet_check_valid(p) < 0 || avahi_dns_packet_is_query(p)) {
+-        avahi_log_warn("Received invalid packet.");
++        avahi_log_debug("Received invalid packet.");
+         return;
+     }
+ 
+     if (!(slot = find_slot(s, avahi_dns_packet_get_field(p, AVAHI_DNS_FIELD_ID)))) {
+-        avahi_log_warn("Received legacy unicast response with unknown id");
++        avahi_log_debug("Received legacy unicast response with unknown id");
+         return;
+     }
+ 
+-- 
+2.6.4
+
-- 
2.6.4


