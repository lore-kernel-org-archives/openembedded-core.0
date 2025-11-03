Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD5ACCF9FE
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 14:22:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21915.1762179712186524760
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 06:21:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1305B1D14
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Nov 2025 06:21:43 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5DF9F3F694
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Nov 2025 06:21:50 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kea: fix CVE-2025-11232
Date: Mon,  3 Nov 2025 14:21:46 +0000
Message-ID: <20251103142146.1738030-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 14:22:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225655

Backport a patch from upstream to resolve CVE-2025-11232:

  Invalid characters cause assert

  To trigger the issue, three configuration parameters must have
  specific settings: "hostname-char-set" must be left at the default
  setting, which is "[^A-Za-z0-9.-]"; "hostname-char-replacement" must
  be empty (the default); and "ddns-qualifying-suffix" must NOT be empty
  (the default is empty). DDNS updates do not need to be enabled for
  this issue to manifest. A client that sends certain option content
  would then cause kea-dhcp4 to exit unexpectedly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../kea/files/CVE-2025-11232.patch            | 474 ++++++++++++++++++
 meta/recipes-connectivity/kea/kea_3.0.1.bb    |   1 +
 2 files changed, 475 insertions(+)
 create mode 100644 meta/recipes-connectivity/kea/files/CVE-2025-11232.pa=
tch

diff --git a/meta/recipes-connectivity/kea/files/CVE-2025-11232.patch b/m=
eta/recipes-connectivity/kea/files/CVE-2025-11232.patch
new file mode 100644
index 00000000000..659627deba1
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/CVE-2025-11232.patch
@@ -0,0 +1,474 @@
+From 92b65b2345e07d826b56ffd65cf47538f1c7a271 Mon Sep 17 00:00:00 2001
+From: Thomas Markwalder <tmark@isc.org>
+Date: Tue, 7 Oct 2025 14:41:16 -0400
+Subject: [PATCH] [#4155] Backport #4142 to v3_0
+
+Invalid characters cause assert
+
+To trigger the issue, three configuration parameters must have
+specific settings: "hostname-char-set" must be left at the default
+setting, which is "[^A-Za-z0-9.-]"; "hostname-char-replacement" must
+be empty (the default); and "ddns-qualifying-suffix" must NOT be empty
+(the default is empty). DDNS updates do not need to be enabled for
+this issue to manifest. A client that sends certain option content
+would then cause kea-dhcp4 to exit unexpectedly.
+
+CVE: CVE-2025-11232
+Upstream-Status: Backport [https://github.com/isc-projects/kea/commit/92=
b65b2345e07d826b56ffd65cf47538f1c7a271]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+new file:   changelog_unreleased/CVE-2025-11232-catch-empty-sanitized-ho=
stname
+modified:   src/bin/dhcp4/dhcp4_messages.cc
+modified:   src/bin/dhcp4/dhcp4_messages.h
+modified:   src/bin/dhcp4/dhcp4_messages.mes
+modified:   src/bin/dhcp4/dhcp4_srv.cc
+modified:   src/bin/dhcp4/tests/fqdn_unittest.cc
+modified:   src/bin/dhcp6/dhcp6_messages.cc
+modified:   src/bin/dhcp6/dhcp6_messages.h
+modified:   src/bin/dhcp6/dhcp6_messages.mes
+modified:   src/bin/dhcp6/dhcp6_srv.cc
+modified:   src/bin/dhcp6/tests/fqdn_unittest.cc
+modified:   src/lib/dhcpsrv/d2_client_mgr.cc
+modified:   src/lib/dhcpsrv/d2_client_mgr.h
+modified:   src/lib/dhcpsrv/tests/d2_client_unittest.cc
+---
+ ...-2025-11232-catch-empty-sanitized-hostname |  6 +++
+ src/bin/dhcp4/dhcp4_messages.cc               |  4 ++
+ src/bin/dhcp4/dhcp4_messages.h                |  2 +
+ src/bin/dhcp4/dhcp4_messages.mes              | 14 +++++
+ src/bin/dhcp4/dhcp4_srv.cc                    | 21 ++++++--
+ src/bin/dhcp4/tests/fqdn_unittest.cc          | 54 ++++++++++++++++++-
+ src/bin/dhcp6/dhcp6_messages.cc               |  2 +
+ src/bin/dhcp6/dhcp6_messages.h                |  1 +
+ src/bin/dhcp6/dhcp6_messages.mes              |  7 +++
+ src/bin/dhcp6/dhcp6_srv.cc                    |  9 +++-
+ src/bin/dhcp6/tests/fqdn_unittest.cc          | 23 ++++++++
+ src/lib/dhcpsrv/d2_client_mgr.cc              |  9 +++-
+ src/lib/dhcpsrv/d2_client_mgr.h               | 19 ++++++-
+ src/lib/dhcpsrv/tests/d2_client_unittest.cc   | 42 +++++++++++++++
+ 14 files changed, 205 insertions(+), 8 deletions(-)
+ create mode 100644 changelog_unreleased/CVE-2025-11232-catch-empty-sani=
tized-hostname
+
+diff --git a/src/bin/dhcp4/dhcp4_messages.cc b/src/bin/dhcp4/dhcp4_messa=
ges.cc
+index e06ce6a121..5c6a334bad 100644
+--- a/src/bin/dhcp4/dhcp4_messages.cc
++++ b/src/bin/dhcp4/dhcp4_messages.cc
+@@ -26,9 +26,11 @@ extern const isc::log::MessageID DHCP4_CLASS_UNCONFIG=
URED =3D "DHCP4_CLASS_UNCONFI
+ extern const isc::log::MessageID DHCP4_CLIENTID_IGNORED_FOR_LEASES =3D =
"DHCP4_CLIENTID_IGNORED_FOR_LEASES";
+ extern const isc::log::MessageID DHCP4_CLIENT_FQDN_DATA =3D "DHCP4_CLIE=
NT_FQDN_DATA";
+ extern const isc::log::MessageID DHCP4_CLIENT_FQDN_PROCESS =3D "DHCP4_C=
LIENT_FQDN_PROCESS";
++extern const isc::log::MessageID DHCP4_CLIENT_FQDN_SCRUBBED_EMPTY =3D "=
DHCP4_CLIENT_FQDN_SCRUBBED_EMPTY";
+ extern const isc::log::MessageID DHCP4_CLIENT_HOSTNAME_DATA =3D "DHCP4_=
CLIENT_HOSTNAME_DATA";
+ extern const isc::log::MessageID DHCP4_CLIENT_HOSTNAME_MALFORMED =3D "D=
HCP4_CLIENT_HOSTNAME_MALFORMED";
+ extern const isc::log::MessageID DHCP4_CLIENT_HOSTNAME_PROCESS =3D "DHC=
P4_CLIENT_HOSTNAME_PROCESS";
++extern const isc::log::MessageID DHCP4_CLIENT_HOSTNAME_SCRUBBED_EMPTY =3D=
 "DHCP4_CLIENT_HOSTNAME_SCRUBBED_EMPTY";
+ extern const isc::log::MessageID DHCP4_CLIENT_NAME_PROC_FAIL =3D "DHCP4=
_CLIENT_NAME_PROC_FAIL";
+ extern const isc::log::MessageID DHCP4_CONFIG_COMPLETE =3D "DHCP4_CONFI=
G_COMPLETE";
+ extern const isc::log::MessageID DHCP4_CONFIG_LOAD_FAIL =3D "DHCP4_CONF=
IG_LOAD_FAIL";
+@@ -206,9 +208,11 @@ const char* values[] =3D {
+     "DHCP4_CLIENTID_IGNORED_FOR_LEASES", "%1: not using client identifi=
er for lease allocation for subnet %2",
+     "DHCP4_CLIENT_FQDN_DATA", "%1: Client sent FQDN option: %2",
+     "DHCP4_CLIENT_FQDN_PROCESS", "%1: processing Client FQDN option",
++    "DHCP4_CLIENT_FQDN_SCRUBBED_EMPTY", "%1: sanitizing client's FQDN o=
ption '%2' yielded an empty string",
+     "DHCP4_CLIENT_HOSTNAME_DATA", "%1: client sent Hostname option: %2"=
,
+     "DHCP4_CLIENT_HOSTNAME_MALFORMED", "%1: client hostname option malf=
ormed: %2",
+     "DHCP4_CLIENT_HOSTNAME_PROCESS", "%1: processing client's Hostname =
option",
++    "DHCP4_CLIENT_HOSTNAME_SCRUBBED_EMPTY", "%1: sanitizing client's Ho=
stname option '%2' yielded an empty string",
+     "DHCP4_CLIENT_NAME_PROC_FAIL", "%1: failed to process the fqdn or h=
ostname sent by a client: %2",
+     "DHCP4_CONFIG_COMPLETE", "DHCPv4 server has completed configuration=
: %1",
+     "DHCP4_CONFIG_LOAD_FAIL", "configuration error using file: %1, reas=
on: %2",
+diff --git a/src/bin/dhcp4/dhcp4_messages.h b/src/bin/dhcp4/dhcp4_messag=
es.h
+index 9a4d0cda21..6e45c63053 100644
+--- a/src/bin/dhcp4/dhcp4_messages.h
++++ b/src/bin/dhcp4/dhcp4_messages.h
+@@ -27,9 +27,11 @@ extern const isc::log::MessageID DHCP4_CLASS_UNCONFIG=
URED;
+ extern const isc::log::MessageID DHCP4_CLIENTID_IGNORED_FOR_LEASES;
+ extern const isc::log::MessageID DHCP4_CLIENT_FQDN_DATA;
+ extern const isc::log::MessageID DHCP4_CLIENT_FQDN_PROCESS;
++extern const isc::log::MessageID DHCP4_CLIENT_FQDN_SCRUBBED_EMPTY;
+ extern const isc::log::MessageID DHCP4_CLIENT_HOSTNAME_DATA;
+ extern const isc::log::MessageID DHCP4_CLIENT_HOSTNAME_MALFORMED;
+ extern const isc::log::MessageID DHCP4_CLIENT_HOSTNAME_PROCESS;
++extern const isc::log::MessageID DHCP4_CLIENT_HOSTNAME_SCRUBBED_EMPTY;
+ extern const isc::log::MessageID DHCP4_CLIENT_NAME_PROC_FAIL;
+ extern const isc::log::MessageID DHCP4_CONFIG_COMPLETE;
+ extern const isc::log::MessageID DHCP4_CONFIG_LOAD_FAIL;
+diff --git a/src/bin/dhcp4/dhcp4_messages.mes b/src/bin/dhcp4/dhcp4_mess=
ages.mes
+index 1deb2e6074..b359d09616 100644
+--- a/src/bin/dhcp4/dhcp4_messages.mes
++++ b/src/bin/dhcp4/dhcp4_messages.mes
+@@ -164,6 +164,20 @@ This debug message is issued when the server starts=
 processing the Hostname
+ option sent in the client's query. The argument includes the client and
+ transaction identification information.
+=20
++% DHCP4_CLIENT_HOSTNAME_SCRUBBED_EMPTY %1: sanitizing client's Hostname=
 option '%2' yielded an empty string
++Logged at debug log level 50.
++This debug message is issued when the result of sanitizing the
++hostname option(12) sent by the client is an empty string. When this oc=
curs
++the server will ignore the hostname option. The arguments include the
++client and the hostname option it sent.
++
++% DHCP4_CLIENT_FQDN_SCRUBBED_EMPTY %1: sanitizing client's FQDN option =
'%2' yielded an empty string
++Logged at debug log level 50.
++This debug message is issued when the result of sanitizing the
++FQDN option(81) sent by the client is an empty string. When this occurs
++the server will ignore the FQDN option. The arguments include the
++client and the FQDN option it sent.
++
+ % DHCP4_CLIENT_NAME_PROC_FAIL %1: failed to process the fqdn or hostnam=
e sent by a client: %2
+ Logged at debug log level 55.
+ This debug message is issued when the DHCP server was unable to process=
 the
+diff --git a/src/bin/dhcp4/dhcp4_srv.cc b/src/bin/dhcp4/dhcp4_srv.cc
+index 0701ed41e9..a6be662889 100644
+--- a/src/bin/dhcp4/dhcp4_srv.cc
++++ b/src/bin/dhcp4/dhcp4_srv.cc
+@@ -2714,8 +2714,15 @@ Dhcpv4Srv::processClientFqdnOption(Dhcpv4Exchange=
& ex) {
+     } else {
+         // Adjust the domain name based on domain name value and type s=
ent by the
+         // client and current configuration.
+-        d2_mgr.adjustDomainName<Option4ClientFqdn>(*fqdn, *fqdn_resp,
+-                                                   *(ex.getContext()->g=
etDdnsParams()));
++        try {
++            d2_mgr.adjustDomainName<Option4ClientFqdn>(*fqdn, *fqdn_res=
p,
++                                                       *(ex.getContext(=
)->getDdnsParams()));
++        } catch (const FQDNScrubbedEmpty& scrubbed) {
++            LOG_DEBUG(ddns4_logger, DBG_DHCP4_DETAIL, DHCP4_CLIENT_FQDN=
_SCRUBBED_EMPTY)
++                    .arg(ex.getQuery()->getLabel())
++                    .arg(scrubbed.what());
++            return;
++        }
+     }
+=20
+     // Add FQDN option to the response message. Note that, there may be=
 some
+@@ -2857,7 +2864,15 @@ Dhcpv4Srv::processHostnameOption(Dhcpv4Exchange& =
ex) {
+             ex.getContext()->getDdnsParams()->getHostnameSanitizer();
+=20
+         if (sanitizer) {
+-            hostname =3D sanitizer->scrub(hostname);
++            auto tmp =3D sanitizer->scrub(hostname);
++            if (tmp.empty()) {
++                LOG_DEBUG(ddns4_logger, DBG_DHCP4_DETAIL, DHCP4_CLIENT_=
HOSTNAME_SCRUBBED_EMPTY)
++                    .arg(ex.getQuery()->getLabel())
++                    .arg(hostname);
++                return;
++            }
++
++            hostname =3D tmp;
+         }
+=20
+         // Convert hostname to lower case.
+diff --git a/src/bin/dhcp4/tests/fqdn_unittest.cc b/src/bin/dhcp4/tests/=
fqdn_unittest.cc
+index a5d3e4c21a..18e4c6d4b9 100644
+--- a/src/bin/dhcp4/tests/fqdn_unittest.cc
++++ b/src/bin/dhcp4/tests/fqdn_unittest.cc
+@@ -2253,7 +2253,7 @@ TEST_F(NameDhcpv4SrvTest, sanitizeHostDefault) {
+         },
+         {
+             "qualified host name with nuls",
+-            std::string("four-ok-host\000.other.org",23),
++            std::string("four-ok-host\000.other.org", 23),
+             "four-ok-host.other.org"
+         }
+     };
+@@ -3203,4 +3203,56 @@ TEST_F(NameDhcpv4SrvTest, poolDdnsParametersTest)=
 {
+     }
+ }
+=20
++// Verifies that when the FQDN option is scrubbed empty it is logged
++// and ignored.
++TEST_F(NameDhcpv4SrvTest, hostnameScrubbedEmpty) {
++    Dhcp4Client client(srv_, Dhcp4Client::SELECTING);
++
++    // Configure DHCP server.
++    configure(CONFIGS[2], *client.getServer());
++
++    // Set the hostname option.
++    ASSERT_NO_THROW(client.includeHostname("___"));
++
++    // Send the DHCPDISCOVER and make sure that the server responded.
++    ASSERT_NO_THROW(client.doDiscover());
++    auto resp =3D client.getContext().response_;
++    ASSERT_TRUE(resp);
++    ASSERT_EQ(DHCPOFFER, static_cast<int>(resp->getType()));
++
++    // Should have logged that it was scrubbed empty.
++    std::string log =3D "DHCP4_CLIENT_HOSTNAME_SCRUBBED_EMPTY";
++    EXPECT_EQ(1, countFile(log));
++
++    // Hostname should not be in the response.
++    ASSERT_FALSE(resp->getOption(DHO_HOST_NAME));
++}
++
++// Verifies that when the FQDN option is scrubbed empty it is logged
++// and ignored.
++TEST_F(NameDhcpv4SrvTest, fqdnScrubbedEmpty) {
++    Dhcp4Client client(srv_, Dhcp4Client::SELECTING);
++
++    // Configure DHCP server.
++    configure(CONFIGS[2], *client.getServer());
++
++    // Include the Client FQDN option.
++    ASSERT_NO_THROW(client.includeFQDN(Option4ClientFqdn::FLAG_S | Opti=
on4ClientFqdn::FLAG_E,
++                                       "___", Option4ClientFqdn::PARTIA=
L));
++
++    // Send the DHCPDISCOVER and make sure that the server responded.
++    ASSERT_NO_THROW(client.doDiscover());
++    auto resp =3D client.getContext().response_;
++    ASSERT_TRUE(resp);
++    ASSERT_EQ(DHCPOFFER, static_cast<int>(resp->getType()));
++
++    // Should have logged that it was scrubbed empty.
++    std::string log =3D "DHCP4_CLIENT_FQDN_SCRUBBED_EMPTY";
++    EXPECT_EQ(1, countFile(log));
++
++    // Hostname should not be in the response.
++    ASSERT_FALSE(resp->getOption(DHO_FQDN));
++}
++
++
+ } // end of anonymous namespace
+diff --git a/src/bin/dhcp6/dhcp6_messages.cc b/src/bin/dhcp6/dhcp6_messa=
ges.cc
+index 229ba74450..9619481aba 100644
+--- a/src/bin/dhcp6/dhcp6_messages.cc
++++ b/src/bin/dhcp6/dhcp6_messages.cc
+@@ -27,6 +27,7 @@ extern const isc::log::MessageID DHCP6_CLASSES_ASSIGNE=
D =3D "DHCP6_CLASSES_ASSIGNE
+ extern const isc::log::MessageID DHCP6_CLASSES_ASSIGNED_AFTER_SUBNET_SE=
LECTION =3D "DHCP6_CLASSES_ASSIGNED_AFTER_SUBNET_SELECTION";
+ extern const isc::log::MessageID DHCP6_CLASS_ASSIGNED =3D "DHCP6_CLASS_=
ASSIGNED";
+ extern const isc::log::MessageID DHCP6_CLASS_UNCONFIGURED =3D "DHCP6_CL=
ASS_UNCONFIGURED";
++extern const isc::log::MessageID DHCP6_CLIENT_FQDN_SCRUBBED_EMPTY =3D "=
DHCP6_CLIENT_FQDN_SCRUBBED_EMPTY";
+ extern const isc::log::MessageID DHCP6_CONFIG_COMPLETE =3D "DHCP6_CONFI=
G_COMPLETE";
+ extern const isc::log::MessageID DHCP6_CONFIG_LOAD_FAIL =3D "DHCP6_CONF=
IG_LOAD_FAIL";
+ extern const isc::log::MessageID DHCP6_CONFIG_PACKET_QUEUE =3D "DHCP6_C=
ONFIG_PACKET_QUEUE";
+@@ -203,6 +204,7 @@ const char* values[] =3D {
+     "DHCP6_CLASSES_ASSIGNED_AFTER_SUBNET_SELECTION", "%1: client packet=
 has been assigned to the following classes: %2",
+     "DHCP6_CLASS_ASSIGNED", "%1: client packet has been assigned to the=
 following class: %2",
+     "DHCP6_CLASS_UNCONFIGURED", "%1: client packet belongs to an unconf=
igured class: %2",
++    "DHCP6_CLIENT_FQDN_SCRUBBED_EMPTY", "%1: sanitizing client's FQDN o=
ption '%2' yielded an empty string",
+     "DHCP6_CONFIG_COMPLETE", "DHCPv6 server has completed configuration=
: %1",
+     "DHCP6_CONFIG_LOAD_FAIL", "configuration error using file: %1, reas=
on: %2",
+     "DHCP6_CONFIG_PACKET_QUEUE", "DHCPv6 packet queue info after config=
uration: %1",
+diff --git a/src/bin/dhcp6/dhcp6_messages.h b/src/bin/dhcp6/dhcp6_messag=
es.h
+index 186f7d557a..7af56e716a 100644
+--- a/src/bin/dhcp6/dhcp6_messages.h
++++ b/src/bin/dhcp6/dhcp6_messages.h
+@@ -28,6 +28,7 @@ extern const isc::log::MessageID DHCP6_CLASSES_ASSIGNE=
D;
+ extern const isc::log::MessageID DHCP6_CLASSES_ASSIGNED_AFTER_SUBNET_SE=
LECTION;
+ extern const isc::log::MessageID DHCP6_CLASS_ASSIGNED;
+ extern const isc::log::MessageID DHCP6_CLASS_UNCONFIGURED;
++extern const isc::log::MessageID DHCP6_CLIENT_FQDN_SCRUBBED_EMPTY;
+ extern const isc::log::MessageID DHCP6_CONFIG_COMPLETE;
+ extern const isc::log::MessageID DHCP6_CONFIG_LOAD_FAIL;
+ extern const isc::log::MessageID DHCP6_CONFIG_PACKET_QUEUE;
+diff --git a/src/bin/dhcp6/dhcp6_messages.mes b/src/bin/dhcp6/dhcp6_mess=
ages.mes
+index fff50ed367..79fc984ff5 100644
+--- a/src/bin/dhcp6/dhcp6_messages.mes
++++ b/src/bin/dhcp6/dhcp6_messages.mes
+@@ -1167,3 +1167,10 @@ such modification. The clients will remember prev=
ious server-id, and will
+ use it to extend their leases. As a result, they will have to go throug=
h
+ a rebinding phase to re-acquire their leases and associate them with a
+ new server id.
++
++% DHCP6_CLIENT_FQDN_SCRUBBED_EMPTY %1: sanitizing client's FQDN option =
'%2' yielded an empty string
++Logged at debug log level 50.
++This debug message is issued when the result of sanitizing the
++FQDN option(39) sent by the client is an empty string. When this occurs
++the server will ignore the FQDN option. The arguments include the
++client and the FQDN option it sent.
+diff --git a/src/bin/dhcp6/dhcp6_srv.cc b/src/bin/dhcp6/dhcp6_srv.cc
+index 417960b126..f999c3178f 100644
+--- a/src/bin/dhcp6/dhcp6_srv.cc
++++ b/src/bin/dhcp6/dhcp6_srv.cc
+@@ -2332,7 +2332,14 @@ Dhcpv6Srv::processClientFqdn(const Pkt6Ptr& quest=
ion, const Pkt6Ptr& answer,
+     } else {
+         // Adjust the domain name based on domain name value and type s=
ent by
+         // the client and current configuration.
+-        d2_mgr.adjustDomainName<Option6ClientFqdn>(*fqdn, *fqdn_resp, *=
ddns_params);
++        try {
++            d2_mgr.adjustDomainName<Option6ClientFqdn>(*fqdn, *fqdn_res=
p, *ddns_params);
++        } catch(const FQDNScrubbedEmpty& scrubbed) {
++            LOG_DEBUG(ddns6_logger, DBG_DHCP6_DETAIL, DHCP6_CLIENT_FQDN=
_SCRUBBED_EMPTY)
++                .arg(question->getLabel())
++                .arg(scrubbed.what());
++            return;
++        }
+     }
+=20
+     // Once we have the FQDN setup to use it for the lease hostname.  T=
his
+diff --git a/src/bin/dhcp6/tests/fqdn_unittest.cc b/src/bin/dhcp6/tests/=
fqdn_unittest.cc
+index ca51856e67..7891c1f5e6 100644
+--- a/src/bin/dhcp6/tests/fqdn_unittest.cc
++++ b/src/bin/dhcp6/tests/fqdn_unittest.cc
+@@ -2425,4 +2425,27 @@ TEST_F(FqdnDhcpv6SrvTest, poolDdnsParametersTest)=
 {
+     }
+ }
+=20
++// Verify an FQDN with all invalid chars is ignored.
++TEST_F(FqdnDhcpv6SrvTest, fqdnScrubbedEmpty) {
++    // Create the query.
++    Pkt6Ptr question =3D generateMessage(DHCPV6_SOLICIT, Option6ClientF=
qdn::FLAG_S,
++                                       "___" , Option6ClientFqdn::FULL,=
 true);
++    ASSERT_TRUE(getClientFqdnOption(question));
++    subnet_->setHostnameCharReplacement("");
++
++    // Create the response with an "assigned" lease.
++    // Set the selected subnet so ddns params get returned correctly.
++    AllocEngine::ClientContext6 ctx;
++    ctx.subnet_ =3D subnet_;
++    Pkt6Ptr answer =3D generateMessageWithIds(DHCPV6_ADVERTISE);
++    addIA(1234, IOAddress("2001:db8:1::1"), answer, ctx);
++
++    // Process the client's FQDN.
++    ASSERT_NO_THROW(srv_->processClientFqdn(question, answer, ctx));
++
++    // Should not have an FQDN option in the answer.
++    EXPECT_FALSE(answer->getOption(D6O_CLIENT_FQDN));
++    countFile("DHCP6_CLIENT_FQDN_SCRUBBED_EMPTY");
++}
++
+ } // end of anonymous namespace
+diff --git a/src/lib/dhcpsrv/d2_client_mgr.cc b/src/lib/dhcpsrv/d2_clien=
t_mgr.cc
+index 84ee11d9fb..54c815176e 100644
+--- a/src/lib/dhcpsrv/d2_client_mgr.cc
++++ b/src/lib/dhcpsrv/d2_client_mgr.cc
+@@ -186,10 +186,15 @@ std::string
+ D2ClientMgr::qualifyName(const std::string& partial_name,
+                          const DdnsParams& ddns_params,
+                          const bool trailing_dot) const {
++    if (partial_name.empty()) {
++        isc_throw(BadValue, "D2ClientMgr::qualifyName"
++                            " - partial_name cannot be an empty string"=
);
++    }
++
+     std::ostringstream gen_name;
+     gen_name << partial_name;
+     std::string suffix =3D ddns_params.getQualifyingSuffix();
+-    if (!suffix.empty() && partial_name.back() !=3D '.') {
++    if (!suffix.empty() && (partial_name.back() !=3D '.')) {
+         bool suffix_present =3D true;
+         std::string str =3D gen_name.str();
+         auto suffix_rit =3D suffix.rbegin();
+@@ -241,7 +246,7 @@ D2ClientMgr::qualifyName(const std::string& partial_=
name,
+         // If the trailing dot should not be appended but it is present=
,
+         // remove it.
+         if ((len > 0) && (str[len - 1] =3D=3D '.')) {
+-            gen_name.str(str.substr(0,len-1));
++            gen_name.str(str.substr(0, len-1));
+         }
+=20
+     }
+diff --git a/src/lib/dhcpsrv/d2_client_mgr.h b/src/lib/dhcpsrv/d2_client=
_mgr.h
+index 7344f19a40..238fd0a415 100644
+--- a/src/lib/dhcpsrv/d2_client_mgr.h
++++ b/src/lib/dhcpsrv/d2_client_mgr.h
+@@ -30,6 +30,14 @@
+ namespace isc {
+ namespace dhcp {
+=20
++/// @brief Exception thrown when host name sanitizing reduces
++/// the domain name to an empty string.
++class FQDNScrubbedEmpty : public Exception {
++public:
++    FQDNScrubbedEmpty(const char* file, size_t line, const char* what) =
:
++        isc::Exception(file, line, what) { }
++};
++
+ /// @brief Defines the type for D2 IO error handler.
+ /// This callback is invoked when a send to kea-dhcp-ddns completes wit=
h a
+ /// failed status.  This provides the application layer (Kea) with a me=
ans to
+@@ -197,6 +205,7 @@ class D2ClientMgr : public dhcp_ddns::NameChangeSend=
er::RequestSendHandler,
+     /// suffix itself is empty (i.e. "").
+     ///
+     /// @return std::string containing the qualified name.
++    /// @throw BadValue if partial_name is empty.
+     std::string qualifyName(const std::string& partial_name,
+                             const DdnsParams& ddns_params,
+                             const bool trailing_dot) const;
+@@ -264,6 +273,9 @@ class D2ClientMgr : public dhcp_ddns::NameChangeSend=
er::RequestSendHandler,
+     /// @param ddns_params DDNS behavioral configuration parameters
+     /// @tparam T  FQDN Option class containing the FQDN data such as
+     /// dhcp::Option4ClientFqdn or dhcp::Option6ClientFqdn
++    ///
++    /// @throw FQDNScrubbedEmpty if hostname sanitizing reduces the inp=
ut domain
++    /// name to an empty string.
+     template <class T>
+     void adjustDomainName(const T& fqdn, T& fqdn_resp,
+                           const DdnsParams& ddns_params);
+@@ -515,7 +527,12 @@ D2ClientMgr::adjustDomainName(const T& fqdn, T& fqd=
n_resp, const DdnsParams& ddn
+                 ss << sanitizer->scrub(label);
+             }
+=20
+-            client_name =3D ss.str();
++            std::string clean_name =3D ss.str();
++            if (clean_name.empty() || clean_name =3D=3D ".") {
++                isc_throw(FQDNScrubbedEmpty, client_name);
++            }
++
++            client_name =3D clean_name;
+         }
+=20
+         // If the supplied name is partial, qualify it by adding the su=
ffix.
+diff --git a/src/lib/dhcpsrv/tests/d2_client_unittest.cc b/src/lib/dhcps=
rv/tests/d2_client_unittest.cc
+index 68ad2189d6..00375d0066 100644
+--- a/src/lib/dhcpsrv/tests/d2_client_unittest.cc
++++ b/src/lib/dhcpsrv/tests/d2_client_unittest.cc
+@@ -9,6 +9,7 @@
+ #include <dhcp/option6_client_fqdn.h>
+ #include <dhcpsrv/d2_client_mgr.h>
+ #include <testutils/test_to_element.h>
++#include <testutils/gtest_utils.h>
+ #include <exceptions/exceptions.h>
+ #include <util/str.h>
+=20
+@@ -627,6 +628,10 @@ TEST_F(D2ClientMgrParamsTest, qualifyName) {
+     qualified_name =3D mgr.qualifyName(partial_name, *ddns_params_, do_=
not_dot);
+     EXPECT_EQ("somehost.suffix.com", qualified_name);
+=20
++    // Verify that an empty name throws.
++    partial_name =3D "";
++    ASSERT_THROW(mgr.qualifyName(partial_name, *ddns_params_, do_not_do=
t), BadValue);
++
+     // Verify that an empty suffix and false flag, does not change the =
name
+     subnet_->setDdnsQualifyingSuffix("");
+     partial_name =3D "somehost";
+@@ -1257,4 +1262,41 @@ TEST_F(D2ClientMgrParamsTest, sanitizeFqdnV6) {
+     }
+ }
+=20
++/// @brief Tests adjustDomainName template method with Option4ClientFqd=
n
++/// when sanitizing scrubs input name empty.
++TEST_F(D2ClientMgrParamsTest, adjustDomainNameV4ScrubbedEmpty) {
++    D2ClientMgr mgr;
++
++    // Create enabled configuration
++    subnet_->setDdnsSendUpdates(false);
++    subnet_->setDdnsQualifyingSuffix("suffix.com");
++    subnet_->setHostnameCharSet("[^A-Za-z0-9.-]");
++    subnet_->setHostnameCharReplacement("");
++
++    Option4ClientFqdn request(0, Option4ClientFqdn::RCODE_CLIENT(),
++                              "___", Option4ClientFqdn::FULL);
++
++    Option4ClientFqdn response(request);
++    ASSERT_THROW_MSG(mgr.adjustDomainName<Option4ClientFqdn>(request, r=
esponse, *ddns_params_),
++                     FQDNScrubbedEmpty, "___.");
++}
++
++/// @brief Tests adjustDomainName template method with Option4ClientFqd=
n
++/// when sanitizing scrubs input name empty.
++TEST_F(D2ClientMgrParamsTest, adjustDomainNameV6ScrubbedEmpty) {
++    D2ClientMgr mgr;
++
++    // Create enabled configuration
++    subnet_->setDdnsSendUpdates(false);
++    subnet_->setDdnsQualifyingSuffix("suffix.com");
++    subnet_->setHostnameCharSet("[^A-Za-z0-9.-]");
++    subnet_->setHostnameCharReplacement("");
++
++    Option6ClientFqdn request(0, "___", Option6ClientFqdn::FULL);
++
++    Option6ClientFqdn response(request);
++    ASSERT_THROW_MSG(mgr.adjustDomainName<Option6ClientFqdn>(request, r=
esponse, *ddns_params_),
++                     FQDNScrubbedEmpty, "___.");
++}
++
+ } // end of anonymous namespace
diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-co=
nnectivity/kea/kea_3.0.1.bb
index 4a6623f94a0..8729b1162ea 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
@@ -21,6 +21,7 @@ SRC_URI =3D "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar=
.xz \
            file://0001-meson-use-a-runtime-safe-interpreter-string.patch=
 \
            file://0001-mk_cfgrpt.sh-strip-prefixes.patch \
            file://0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cas=
t-o.patch \
+           file://CVE-2025-11232.patch \
            "
 SRC_URI[sha256sum] =3D "ec84fec4bb7f6b9d15a82e755a571e9348eb4d6fbc62bb3f=
6f1296cd7a24c566"
=20
--=20
2.43.0


