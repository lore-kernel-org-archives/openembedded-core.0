Return-Path: <quic_dgangire@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BDF1C52D7C
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 11:59:32 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.14416.1724414369100519699
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Aug 2024 04:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=AVc6Z4Uf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.168.131, mailfrom: quic_dgangire@quicinc.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47N1nsWI007462
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 11:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6c01zwpxFF12Qx1T7nhI4H
	hHht5lJ81F7Pu6UH5JXYU=; b=AVc6Z4UfgD+YOb8lcPvUHoRxADob+N54KgJspO
	RaFgkIkRKMWFbKMUirXb47AFE/X1F256reBoUtaeN5n/6/BIOqWyz/t6ydtjzbgL
	5ZoYG11KIlQzr7fgGftJnmYfsv8qRrw04EjEwRzHewK1PU12/xYFO4ZzHj+azghk
	kB/tH71b1TY+Bj+Znar1tSe7DRzCxDYKql3CYNf7g4O10wiaLkReqQf1ze2K4jdT
	1p58yw7ifhSzTyjqALkD/8qPj27iCWZlK9Q1ZB+hkksLQD9q9ViRn4tITvxLlrN9
	FOqNk56m2lK1jBN3+jcAG8LRqmfcjFNg3w+h3jB8qM9gropA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 415gsd6cqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 11:59:28 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47NBxRTu008333
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 11:59:27 GMT
Received: from hu-dgangire-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 23 Aug 2024 04:59:25 -0700
From: <quic_dgangire@quicinc.com>
To: <openembedded-core@lists.openembedded.org>
CC: <quic_mohamull@quicinc.com>, <quic_hbandi@quicinc.com>,
        <quic_anubhavg@quicinc.com>
Subject: [PATCH] obexd: Add system bus support for obexd
Date: Fri, 23 Aug 2024 17:29:12 +0530
Message-ID: <20240823115912.703747-1-quic_dgangire@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iM1D_d2tIlSQKkzpddGKPfmjY-kjR-Xk
X-Proofpoint-ORIG-GUID: iM1D_d2tIlSQKkzpddGKPfmjY-kjR-Xk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_08,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 impostorscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408230087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 11:59:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203684

From: Damodar Reddy GangiReddy <quic_dgangire@quicinc.com>

Currently obexd uses session bus.
Distros  where session bus is not supported and still obex profiles
are required in that case use system bus instead of session bus
which can be configured with new optional feature

Additional optional feature has been added to achieve this
with name --enable-use-systembus-for-obexd

steps to configure system bus
./configure --enable-use-systembus-for-obexd

Upstream-Status: Denied
Upstream denied as it is distro specific

Signed-off-by: Damodar Reddy GangiReddy <quic_dgangire@quicinc.com>
Change-Id: I1db23ed506631ea6ae8f69034e5211751313e046
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 ...exd-Add-system-bus-support-for-obexd.patch | 244 ++++++++++++++++++
 2 files changed, 245 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd-Add-system-bus-support-for-obexd.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index d8b9f81771..9ad307b0d0 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -63,6 +63,7 @@ PACKAGECONFIG[mesh] = "--enable-mesh --enable-external-ell,--disable-mesh, json-
 PACKAGECONFIG[btpclient] = "--enable-btpclient --enable-external-ell,--disable-btpclient, ell"
 PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
 PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages,python3-docutils-native"
+PACKAGECONFIG[obexdbus] = "--enable-use-systembus-for-obexd,--disable-use-systembus-for-obexd"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://init \
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-Add-system-bus-support-for-obexd.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-Add-system-bus-support-for-obexd.patch
new file mode 100644
index 0000000000..025386cd07
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-Add-system-bus-support-for-obexd.patch
@@ -0,0 +1,244 @@
+From e22394839b98db580f6937c92ffbea499f47aa89 Mon Sep 17 00:00:00 2001
+From: Damodar Reddy GangiReddy <quic_dgangire@quicinc.com>
+Date: Fri, 23 Aug 2024 12:23:47 +0530
+Subject: [PATCH BlueZ v1] obexd: Add system bus support for obexd
+
+Currently obexd uses session bus.
+Distros  where session bus is not supported and still obex profiles
+are required in that case use system bus instead of session bus
+which can be configured with new optional feature
+
+Additional optional feature has been added to achieve this
+with name --enable-use-systembus-for-obexd
+
+steps to configure system bus
+./configure --enable-use-systembus-for-obexd
+
+Upstream-Status: Denied
+Upstream denied as it is distro specific
+
+Signed-off-by: Damodar Reddy GangiReddy <quic_dgangire@quicinc.com>
+
+---
+ Makefile.obexd          | 14 ++++++++++++++
+ configure.ac            |  9 +++++++++
+ obexd/client/ftp.c      |  3 ++-
+ obexd/client/map.c      |  3 ++-
+ obexd/client/opp.c      |  3 ++-
+ obexd/client/pbap.c     |  3 ++-
+ obexd/client/session.c  |  3 ++-
+ obexd/client/sync.c     |  3 ++-
+ obexd/plugins/pcsuite.c |  3 ++-
+ obexd/src/manager.c     |  3 ++-
+ src/bluetooth.conf      | 12 ++++++++++++
+ tools/obexctl.c         |  3 ++-
+ 12 files changed, 53 insertions(+), 9 deletions(-)
+
+diff --git a/Makefile.obexd b/Makefile.obexd
+index b7e9f2d33..87432cc37 100644
+--- a/Makefile.obexd
++++ b/Makefile.obexd
+@@ -2,6 +2,19 @@
+ if OBEX
+ 
+ if SYSTEMD
++
++if USE_SYSTEMBUS_FOR_OBEXD
++
++systemdsystemunit_DATA += obexd/src/obex.service
++dbussystembus_DATA += obexd/src/org.bluez.obex.service
++
++obexd-add-service-symlink:
++	$(LN_S) -f obex.service $(DESTDIR)$(SYSTEMD_SYSTEMUNITDIR)/dbus-org.bluez.obex.service
++
++obexd-remove-service-symlink:
++	rm -f $(DESTDIR)$(SYSTEMD_SYSTEMUNITDIR)/dbus-org.bluez.obex.service
++else
++
+ systemduserunitdir = $(SYSTEMD_USERUNITDIR)
+ systemduserunit_DATA = obexd/src/obex.service
+ 
+@@ -13,6 +26,7 @@ obexd-add-service-symlink:
+ 
+ obexd-remove-service-symlink:
+ 	rm -f $(DESTDIR)$(SYSTEMD_USERUNITDIR)/dbus-org.bluez.obex.service
++endif
+ else
+ obexd-add-service-symlink:
+ obexd-remove-service-symlink:
+diff --git a/configure.ac b/configure.ac
+index d31eb1656..cc9a55f4c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -283,6 +283,15 @@ if (test "${enable_obex}" != "no"); then
+ fi
+ AM_CONDITIONAL(OBEX, test "${enable_obex}" != "no")
+ 
++AC_ARG_ENABLE(use-systembus-for-obexd, AS_HELP_STRING([--enable-use-systembus-for-obexd],
++		[enable systembus for obexd]), [enable_use_systembus_for_obexd=${enableval}])
++AM_CONDITIONAL(USE_SYSTEMBUS_FOR_OBEXD, test "${enable_use_systembus_for_obexd}" = "yes")
++if (test "${enable_use_systembus_for_obexd}" = "yes"); then
++	AC_DEFINE(USE_SYSTEMBUS_FOR_OBEXD, 1, [Define to 1 if you want to use system bus for obexd.])
++else
++	AC_DEFINE(USE_SYSTEMBUS_FOR_OBEXD, 0, [Define to 0 if you want to use session bus for obexd.])
++fi
++
+ AC_ARG_ENABLE(btpclient, AS_HELP_STRING([--enable-btpclient],
+ 		[enable BTP client]), [enable_btpclient=${enableval}])
+ AM_CONDITIONAL(BTPCLIENT, test "${enable_btpclient}" = "yes")
+diff --git a/obexd/client/ftp.c b/obexd/client/ftp.c
+index 160e0636a..e3cef32f6 100644
+--- a/obexd/client/ftp.c
++++ b/obexd/client/ftp.c
+@@ -463,7 +463,8 @@ int ftp_init(void)
+ 
+ 	DBG("");
+ 
+-	conn = dbus_bus_get(DBUS_BUS_SESSION, NULL);
++	conn = dbus_bus_get(USE_SYSTEMBUS_FOR_OBEXD ?
++			DBUS_BUS_SYSTEM : DBUS_BUS_SESSION, NULL);
+ 	if (!conn)
+ 		return -EIO;
+ 
+diff --git a/obexd/client/map.c b/obexd/client/map.c
+index 513dcaf14..815806f52 100644
+--- a/obexd/client/map.c
++++ b/obexd/client/map.c
+@@ -2063,7 +2063,8 @@ int map_init(void)
+ 
+ 	DBG("");
+ 
+-	conn = dbus_bus_get(DBUS_BUS_SESSION, NULL);
++	conn = dbus_bus_get(USE_SYSTEMBUS_FOR_OBEXD ?
++			DBUS_BUS_SYSTEM : DBUS_BUS_SESSION, NULL);
+ 	if (!conn)
+ 		return -EIO;
+ 
+diff --git a/obexd/client/opp.c b/obexd/client/opp.c
+index 90d0c0c8e..4889a3a0f 100644
+--- a/obexd/client/opp.c
++++ b/obexd/client/opp.c
+@@ -178,7 +178,8 @@ int opp_init(void)
+ 
+ 	DBG("");
+ 
+-	conn = dbus_bus_get(DBUS_BUS_SESSION, NULL);
++	conn = dbus_bus_get(USE_SYSTEMBUS_FOR_OBEXD ?
++			DBUS_BUS_SYSTEM : DBUS_BUS_SESSION, NULL);
+ 	if (!conn)
+ 		return -EIO;
+ 
+diff --git a/obexd/client/pbap.c b/obexd/client/pbap.c
+index 2d2aa9508..1658c853a 100644
+--- a/obexd/client/pbap.c
++++ b/obexd/client/pbap.c
+@@ -1303,7 +1303,8 @@ int pbap_init(void)
+ 
+ 	DBG("");
+ 
+-	conn = dbus_bus_get(DBUS_BUS_SESSION, NULL);
++	conn = dbus_bus_get(USE_SYSTEMBUS_FOR_OBEXD ?
++			DBUS_BUS_SYSTEM : DBUS_BUS_SESSION, NULL);
+ 	if (!conn)
+ 		return -EIO;
+ 
+diff --git a/obexd/client/session.c b/obexd/client/session.c
+index 7d8ebb04e..4e447e8eb 100644
+--- a/obexd/client/session.c
++++ b/obexd/client/session.c
+@@ -583,7 +583,8 @@ struct obc_session *obc_session_create(const char *source,
+ 	if (driver == NULL)
+ 		return NULL;
+ 
+-	conn = dbus_bus_get(DBUS_BUS_SESSION, NULL);
++	conn = dbus_bus_get(USE_SYSTEMBUS_FOR_OBEXD ?
++			DBUS_BUS_SYSTEM : DBUS_BUS_SESSION, NULL);
+ 	if (conn == NULL)
+ 		return NULL;
+ 
+diff --git a/obexd/client/sync.c b/obexd/client/sync.c
+index 92faf4434..bd339adfa 100644
+--- a/obexd/client/sync.c
++++ b/obexd/client/sync.c
+@@ -224,7 +224,8 @@ int sync_init(void)
+ 
+ 	DBG("");
+ 
+-	conn = dbus_bus_get(DBUS_BUS_SESSION, NULL);
++	conn = dbus_bus_get(USE_SYSTEMBUS_FOR_OBEXD ?
++			DBUS_BUS_SYSTEM : DBUS_BUS_SESSION, NULL);
+ 	if (!conn)
+ 		return -EIO;
+ 
+diff --git a/obexd/plugins/pcsuite.c b/obexd/plugins/pcsuite.c
+index 07c444ff2..5daed2abb 100644
+--- a/obexd/plugins/pcsuite.c
++++ b/obexd/plugins/pcsuite.c
+@@ -322,7 +322,8 @@ static gboolean send_backup_dbus_message(const char *oper,
+ 
+ 	file_size = size ? *size : 0;
+ 
+-	conn = g_dbus_setup_bus(DBUS_BUS_SESSION, NULL, NULL);
++	conn = g_dbus_setup_bus(USE_SYSTEMBUS_FOR_OBEXD ?
++			DBUS_BUS_SYSTEM : DBUS_BUS_SESSION, NULL, NULL);
+ 
+ 	if (conn == NULL)
+ 		return FALSE;
+diff --git a/obexd/src/manager.c b/obexd/src/manager.c
+index 3c0c2a7cc..dd83f056d 100644
+--- a/obexd/src/manager.c
++++ b/obexd/src/manager.c
+@@ -488,7 +488,8 @@ gboolean manager_init(void)
+ 
+ 	dbus_error_init(&err);
+ 
+-	connection = g_dbus_setup_bus(DBUS_BUS_SESSION, OBEXD_SERVICE, &err);
++	connection = g_dbus_setup_bus(USE_SYSTEMBUS_FOR_OBEXD ?
++		DBUS_BUS_SYSTEM : DBUS_BUS_SESSION, OBEXD_SERVICE, &err);
+ 	if (connection == NULL) {
+ 		if (dbus_error_is_set(&err) == TRUE) {
+ 			fprintf(stderr, "%s\n", err.message);
+diff --git a/src/bluetooth.conf b/src/bluetooth.conf
+index b6c614908..f8879c8bb 100644
+--- a/src/bluetooth.conf
++++ b/src/bluetooth.conf
+@@ -21,10 +21,22 @@
+     <allow send_interface="org.freedesktop.DBus.ObjectManager"/>
+     <allow send_interface="org.freedesktop.DBus.Properties"/>
+     <allow send_interface="org.mpris.MediaPlayer2.Player"/>
++    <allow own="org.bluez.obex"/>
++    <allow send_destination="org.bluez.obex"/>
++    <allow send_interface="org.bluez.obex.Agent1"/>
++    <allow send_interface="org.bluez.obex.Client1"/>
++    <allow send_interface="org.bluez.obex.Session1"/>
++    <allow send_interface="org.bluez.obex.Transfer1"/>
++    <allow send_interface="org.bluez.obex.ObjectPush1"/>
++    <allow send_interface="org.bluez.obex.PhonebookAccess1"/>
++    <allow send_interface="org.bluez.obex.Synchronization1"/>
++    <allow send_interface="org.bluez.obex.MessageAccess1"/>
++    <allow send_interface="org.bluez.obex.Message1"/>
+   </policy>
+ 
+   <policy context="default">
+     <allow send_destination="org.bluez"/>
++    <allow send_destination="org.bluez.obex"/>
+   </policy>
+ 
+ </busconfig>
+diff --git a/tools/obexctl.c b/tools/obexctl.c
+index 56a76915c..07dc1ae6b 100644
+--- a/tools/obexctl.c
++++ b/tools/obexctl.c
+@@ -2154,7 +2154,8 @@ int main(int argc, char *argv[])
+ 	bt_shell_set_menu(&main_menu);
+ 	bt_shell_set_prompt(PROMPT_OFF);
+ 
+-	dbus_conn = g_dbus_setup_bus(DBUS_BUS_SESSION, NULL, NULL);
++	dbus_conn = g_dbus_setup_bus(USE_SYSTEMBUS_FOR_OBEXD ?
++				DBUS_BUS_SYSTEM : DBUS_BUS_SESSION, NULL, NULL);
+ 
+ 	client = g_dbus_client_new(dbus_conn, "org.bluez.obex",
+ 							"/org/bluez/obex");
+-- 
+2.34.1
+
-- 
2.34.1


