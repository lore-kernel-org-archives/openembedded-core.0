Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12853C05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 17:30:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4452.1675877411540273910
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Feb 2023 09:30:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ce4IFXRU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1403efaf90=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 318Dxq8M027367
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Feb 2023 17:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=EcelYU22UZI26+5uoR7BZX271dj8VjApcqoajDLjfas=;
 b=ce4IFXRUj7A97Qfnkto/CVEtJSmRyCkRH2OHfe1zE9v6oGEiRjRo07FTsue40zBpaIQV
 EEA+rpL4g6ZLzdccFcJbG7tiaTY75WSkNL5t0qsCdmHEJYRHL7LChIkD7N1ErQgE8Gbz
 go4Lh/KV+lMgg9voTEeDEFEHwWAwRSvj/NHhHICj6EiK57KvjT589f5BwDbW2seDcmV7
 O6lMN7EWF6i5TTZSwwwlyrolsLxURWnWKdp1zZGz+q31ze3X+hNNuRInr7yKFW9KpFOM
 F7K+q51XD4oya5WmaeZUE4+EJoa4DJIRGmq045hi7+5Y6eq74ui2ghcjZZNiRFSe3a3I kw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhebacc0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 17:30:10 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 8 Feb 2023 09:30:07 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Wed, 8 Feb 2023 09:30:06 -0800
From: Narpat Mali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <archana.polampalli@windriver.com>, <hari.gpillai@windriver.com>,
        "Narpat
 Mali" <narpat.mali@windriver.com>
Subject: [oe][meta-networking][PATCH 1/1] net-snmp: CVE-2022-44792 & CVE-2022-44793 Fix NULL Pointer Exception
Date: Wed, 8 Feb 2023 17:28:47 +0000
Message-ID: <20230208172847.3248669-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: jxJZ16in_WzDvUhRWYScVfS39kCoVBXb
X-Proofpoint-GUID: jxJZ16in_WzDvUhRWYScVfS39kCoVBXb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_08,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 adultscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302080152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 17:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176909

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-44792
https://nvd.nist.gov/vuln/detail/CVE-2022-44793

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../CVE-2022-44792-CVE-2022-44793.patch       | 121 ++++++++++++++++++
 .../net-snmp/net-snmp_5.9.3.bb                |   1 +
 2 files changed, 122 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch
new file mode 100644
index 000000000..b18d4dc29
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2022-44792-CVE-2022-44793.patch
@@ -0,0 +1,121 @@
+From d13302656d9ff0807c5defe18623adc947f43a2b Mon Sep 17 00:00:00 2001
+From: Narpat Mali <narpat.mali@windriver.com>
+Date: Wed, 8 Feb 2023 13:15:39 +0000
+Subject: [PATCH] agent: Disallow SET requests with any NULL varbind Merge pull
+ request #490 from fenner/set-null
+
+fixes: #474 and #475
+
+CVE: CVE-2022-44792, CVE-2022-44793
+
+Upstream-Status: Backport [https://github.com/net-snmp/net-snmp/commit/be804106fd0771a7d05236cff36e199af077af57]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ agent/snmp_agent.c                            | 32 +++++++++++++++++++
+ apps/snmpset.c                                |  1 +
+ .../default/T0142snmpv2csetnull_simple        | 31 ++++++++++++++++++
+ 3 files changed, 64 insertions(+)
+ create mode 100644 testing/fulltests/default/T0142snmpv2csetnull_simple
+
+diff --git a/agent/snmp_agent.c b/agent/snmp_agent.c
+index 867d0c1..3f678fe 100644
+--- a/agent/snmp_agent.c
++++ b/agent/snmp_agent.c
+@@ -3719,12 +3719,44 @@ netsnmp_handle_request(netsnmp_agent_session *asp, int status)
+     return 1;
+ }
+ 
++static int
++check_set_pdu_for_null_varbind(netsnmp_agent_session *asp)
++{
++    int i;
++    netsnmp_variable_list *v = NULL;
++
++    for (i = 1, v = asp->pdu->variables; v != NULL; i++, v = v->next_variable) {
++	if (v->type == ASN_NULL) {
++	    /*
++	     * Protect SET implementations that do not protect themselves
++	     * against wrong type.
++	     */
++	    DEBUGMSGTL(("snmp_agent", "disallowing SET with NULL var for varbind %d\n", i));
++	    asp->index = i;
++	    return SNMP_ERR_WRONGTYPE;
++	}
++    }
++    return SNMP_ERR_NOERROR;
++}
++
+ int
+ handle_pdu(netsnmp_agent_session *asp)
+ {
+     int             status, inclusives = 0;
+     netsnmp_variable_list *v = NULL;
+ 
++#ifndef NETSNMP_NO_WRITE_SUPPORT
++    /*
++     * Check for ASN_NULL in SET request
++     */
++    if (asp->pdu->command == SNMP_MSG_SET) {
++	status = check_set_pdu_for_null_varbind(asp);
++	if (status != SNMP_ERR_NOERROR) {
++	    return status;
++	}
++    }
++#endif /* NETSNMP_NO_WRITE_SUPPORT */
++
+     /*
+      * for illegal requests, mark all nodes as ASN_NULL 
+      */
+diff --git a/apps/snmpset.c b/apps/snmpset.c
+index 48e14bd..d542713 100644
+--- a/apps/snmpset.c
++++ b/apps/snmpset.c
+@@ -182,6 +182,7 @@ main(int argc, char *argv[])
+             case 'x':
+             case 'd':
+             case 'b':
++            case 'n': /* undocumented */
+ #ifdef NETSNMP_WITH_OPAQUE_SPECIAL_TYPES
+             case 'I':
+             case 'U':
+diff --git a/testing/fulltests/default/T0142snmpv2csetnull_simple b/testing/fulltests/default/T0142snmpv2csetnull_simple
+new file mode 100644
+index 0000000..0f1b8f3
+--- /dev/null
++++ b/testing/fulltests/default/T0142snmpv2csetnull_simple
+@@ -0,0 +1,31 @@
++#!/bin/sh
++
++. ../support/simple_eval_tools.sh
++
++HEADER SNMPv2c set of system.sysContact.0 with NULL varbind
++
++SKIPIF NETSNMP_DISABLE_SET_SUPPORT
++SKIPIF NETSNMP_NO_WRITE_SUPPORT
++SKIPIF NETSNMP_DISABLE_SNMPV2C
++SKIPIFNOT USING_MIBII_SYSTEM_MIB_MODULE
++
++#
++# Begin test
++#
++
++# standard V2C configuration: testcomunnity
++snmp_write_access='all'
++. ./Sv2cconfig
++STARTAGENT
++
++CAPTURE "snmpget -On $SNMP_FLAGS -c testcommunity -v 2c $SNMP_TRANSPORT_SPEC:$SNMP_TEST_DEST$SNMP_SNMPD_PORT .1.3.6.1.2.1.1.4.0"
++
++CHECK ".1.3.6.1.2.1.1.4.0 = STRING:"
++
++CAPTURE "snmpset -On $SNMP_FLAGS -c testcommunity -v 2c $SNMP_TRANSPORT_SPEC:$SNMP_TEST_DEST$SNMP_SNMPD_PORT .1.3.6.1.2.1.1.4.0 n x"
++
++CHECK "Reason: wrongType"
++
++STOPAGENT
++
++FINISHED
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
index 78d711fbf..f40fb8bbd 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.3.bb
@@ -27,6 +27,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://reproducibility-have-printcap.patch \
            file://0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch \
            file://0001-Add-noreturn-attribute-to-netsnmp_pci_error.patch \
+           file://CVE-2022-44792-CVE-2022-44793.patch \
            "
 SRC_URI[sha256sum] = "2097f29b7e1bf3f1300b4bae52fa2308d0bb8d5d3998dbe02f9462a413a2ef0a"
 
-- 
2.34.1


