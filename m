Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 575A3CD128A
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 07:30:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.32590.1711956612138612836
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 00:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4821fe4ffe=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4316O0mn019365
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Apr 2024 07:30:11 GMT
Received: from outbound.mail.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x69q6smt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 07:30:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+GeDo7ywgvH0eDIPy8nFDXj655N9f3lzuGEoTHaOPoBTzIAbyd4YuYfQouxxGi/YR4Tx0543Tqb4CchKmbltUUcFEU0GajYTfV5fEdKXVDpIV+5VmDiw+D3mwbUfGKY+r7VjF8vZxovthLsudSFAFa11pEBJNUh8AvN10ehErsrTsj2R+pjoq3XgfrKUk/ccnICTv1ZkgOp+49h0xZJtgCChY+DkgZu/2yFV18VQ8oz+IMb2CxJB71qal/MU5TnfRPYWjZNrFTVa40UHV1srN6lezEolQ2l/HCNLbp5uoInrMU8nIYfbsaw/YaSxdhhQ2ErtmJKGj21bjf3v9boUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2kU4mzR9ryVDDt+GslCEBwXk3BxShYhdylf3FDooQQ=;
 b=Lk27+gouTgdNnj0bRozLPTrmrEZcHo5aO9aTCCSrfvQjqq71t7iztqo/9WGCPepk0jcBf9uR770mdxuOrzZDw1nmqc4OXRy7DV0JGQqO/pYJV2/GRPDaOk469x1cdyLOTxKH3jpBZmZZB+/RWhiw6JrMWDUJQuKAvfldaXxjyge4JeUrvf639aAvlbolWcMoq+hJhAtwsq1Riqs8MiKZWJQsawTqizS3i6ZM+2lgfTG8IcvGF0R0CvCWHYJ5gibf5gAO56Y/6RXVn8TcU0pHTDqIzMICa7luZ0xQm2goACpqU+pYTs630XRA6BIcZhHaIiOxPj79lwBaFdvZdyazmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM4PR11MB7397.namprd11.prod.outlook.com (2603:10b6:8:103::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.22; Mon, 1 Apr
 2024 07:30:09 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5%4]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 07:30:09 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] iputils: splitting the ping6 as a package
Date: Mon,  1 Apr 2024 16:10:02 +0800
Message-Id: <20240401081002.3667193-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR0101CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::31) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM4PR11MB7397:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t0stQ3Jg4HvsJVCScJiN57Y/1UdIoEo/HtYBSJQU0BW8Yr60R62XGF4mNp3PIuhhLVLTx/ZS1TUy5H+ol1iIYkW9opi47VWh1GmAsmckCGHOvbrCL7+A90cDdF3KLDi9yvX2zGeMbuc343RTBO8J3jPWGgBrx4/6ek7/D652loCJ4rdKwIe8H+L+z0bnITRku7yIgl4sh9Z29GcpJxNhrhxJJQS7wT10thsn8P5iIpD9hV6oxdnm4dTVndLmbxkUDD2iUG9UudIFFAK8zP6bhKrDIESj2wawWNsvklSljCHR4m9NBL05E96TS4VUUPCBRn4CPaSyJKzGD6EtKD3pcxjLSCDMwNSfbQz6uMG2VeKnWOhL0FkUR7MOlGz8ioiQUxt8FgCUumq2fiFYgQU46AJvm5Wt/xM29k1LicKqxLBP1QPgE6O/irjw/36uuk2n0y2I+5wcgMVcWZR89kTeNj3lOgIpUfkbNAX+/lXT0VV1Dbi0mb6IFZg76l1mpQK6Ye1eZZy82Bt3zwt6hwumWJrZDD0kb+VxK/VYN3djsHaTvj9b0IV9vIg1KtWVMGKDbAiJvaoU4Ph3XKnGopsTMeu+FYxhDydCyJkRSMJIaWichtpMU2OWNAI6esdy6HDIYJfLkWTQ3mx1jJSwX0Vn8nUXF6jpxB85zC65LjWiwb0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?atRlcHyJZp0H6sBaLRRZDoV8glMHeFdNPJDbUngna5vfIlu/MxU0N2vszd9A?=
 =?us-ascii?Q?YNjaF2anQzogiVl7bGjC0QgR5MUIyOOp4ruV6/p0ElijwbZ3ml8/qkKxUUuJ?=
 =?us-ascii?Q?ItrUSDw0wtpuF4Pj40UDnERl/hwgbJeNNKWsKcrjEuYzZqsqmuCDlPHTv/eU?=
 =?us-ascii?Q?+KZ9r3VHQ++Mc/gK3jZqAJQB0cRKiO6c1KPj2K6NTRKj9EJ+HXTaQ7/AJ4Y/?=
 =?us-ascii?Q?/0YQlcxsZtkE1jvpqwlbX5sR+xPQBxzbKa1egf5Gqx//jmAF5qCLkhs8Rv6R?=
 =?us-ascii?Q?lE8Hjal7lhb+emrU2KfSvcCrUNlhlTtYRkz7ZrBL8/+i0zg33ycyAR5k2vTU?=
 =?us-ascii?Q?D3CWfp4bzPY+XjExD1ZzlbJI1auFGIqy5Sg9ImX0Mkxv5TuAJ6nQ+UBkgM6e?=
 =?us-ascii?Q?8SiZ9MwgPPNMWPEHxWAXX2KdhXOxLz8oiPpZ18cpZjzqCslyWPFG1IS9qj6k?=
 =?us-ascii?Q?ToeK+SlRtIp0IscKnkxUrwB4rAWBzLVkXQLtDTyBI6CyzNGpjQ0TQJUXZrFD?=
 =?us-ascii?Q?lVW10yMuPrMFBZk+d26kiLBTgOiHxc7voZxFUYTJizNKr2pXZ7DI7LAytFjh?=
 =?us-ascii?Q?hGvo/VHmo6espMcmCJygeCMIBU7loVEq1enAqVUVeLU+IrYwjtH1WqaNa/MD?=
 =?us-ascii?Q?hYfdAJmUMw9ecqwuF0dz91U+HyzzZHOGZ5f3MyehS7lVEzyUM4onj9t0zs8/?=
 =?us-ascii?Q?l8IfpuN69EW9NPQl0lsjvgX5xfhYvU5+IJ0cTc5LGD36H2hl8dfFtF9beZlR?=
 =?us-ascii?Q?hHAOOHFs641hV0Hn2EU1o5fMf6XbGwCKFSEhd5VDq4ChGqxEtTjF1QbR0UxK?=
 =?us-ascii?Q?hmx+bD0/PYrqUN/495JHzXCW6u13FSgTd3fHHJNDzczPFFHw7WcFQXh/Dbc8?=
 =?us-ascii?Q?r5ifqxEGEJvPZ8+yahTiqjEe7BtgE9U3NwbO/KjKMJSi1rTqFHOCWV6RSMMS?=
 =?us-ascii?Q?SzQTragSNdG3EqZqOMsk/7uF+zXNygOKtMZsHukYX04n1LAoKJPMd6i03bu6?=
 =?us-ascii?Q?gjQayiqCbbaYC3XCapUt1MntnMK7NheJNXwhpmCkAUPGzR6bgWX5tRmZxAdt?=
 =?us-ascii?Q?zFyqVMdMyTRUy8kt0fRlX9uqjQfzh8p0gmkal9qtMmVG81EHtcWpCWRkRa0r?=
 =?us-ascii?Q?UWiD/o2lydf98PQEaOnIZaA5EqZgdwDYQvV42eZXSv/qR1VYTiFhCokqTMKu?=
 =?us-ascii?Q?zb4syzmmELCuo/Kyp+4sg5GBX3WlnqZUr4sRhhlPP2wun9rF7Pllgh6oydS6?=
 =?us-ascii?Q?8vu6rHtN+ips4UvlsD+bUFDgwQZzn5emalfRVCoK8zeaQYLDN08X102j2GXp?=
 =?us-ascii?Q?PhvZkWvL+YmNnEQTm2bgy3ndVeGRwuE82Ap5+w8fIFWo6KZKKUTD7LdrEtRd?=
 =?us-ascii?Q?yMcIfz+S9pQhHl+0x0orMiyMONZizZzSPrfkt5EMpkGUyi/nJSJR3uaybZ+y?=
 =?us-ascii?Q?jo0R0SE1ji6A0AIBSniXScF+nHgh9r84gRRxovHs68xGT4hBDKyGvNQhPUea?=
 =?us-ascii?Q?4INQaAMd/Vs+cye3gDFNGeoecsKVvZfDANSalza0ap5XC2U5Tg6Ii6jzeq46?=
 =?us-ascii?Q?8fkKgCj8T6Sg8Hx533kTg2ezN0w7RKKRkINmL+GJ/RUfRU0Xq5juKjEAZZtw?=
 =?us-ascii?Q?aw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dda180c-b7f8-4f1e-504d-08dc521d8f76
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 07:30:09.5721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ne5c1TZL5DRErPXUwn8bhNWMtGMOxF+y0XWF97LngTAe+ZpMP1zz9UaBYeY8G+hARBgh69yUS+2Ubzsd/m4Y0c7XCBryIV+PQMWT/nayLvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7397
X-Proofpoint-ORIG-GUID: sdLyK4GHRVMuvLRXGzTx9SwOykiUZMzx
X-Proofpoint-GUID: sdLyK4GHRVMuvLRXGzTx9SwOykiUZMzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_04,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404010052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 07:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197675

From: Xiangyu Chen <xiangyu.chen@windriver.com>

The iputils merged the ping4 and ping6 command into the ping since the
commit ebad35fe[1], currently, iputils ping support being called using
"ping -6" or "ping6" symlinks.

In oe-core, there are two packages provide ipv6 ping, inetutils and iputils,
the inetutils-ping6 doesn't support "-I" option to bind the interface, that
cause some of scripts(e.g. LTP test[2]) which was based on iputils-ping6 fails.

If someone or a package needs iputils-ping6, they can enable it in local.conf
or add it into rdepends directly.

Ref:
[1] https://github.com/iputils/iputils/commit/e3de851b809c7b72ccc654a72b6af61d
[2] https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/ \
    containers/netns/netns_comm.sh#L25

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/recipes-extended/iputils/iputils_20240117.bb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/iputils/iputils_20240117.bb b/meta/recipes-extended/iputils/iputils_20240117.bb
index 5a5e15528e..72a7aeb777 100644
--- a/meta/recipes-extended/iputils/iputils_20240117.bb
+++ b/meta/recipes-extended/iputils/iputils_20240117.bb
@@ -35,7 +35,11 @@ ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE:${PN}-ping = "ping"
 ALTERNATIVE_LINK_NAME[ping] = "${base_bindir}/ping"
 
-SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff"
+ALTERNATIVE:${PN}-ping6 = "ping6"
+ALTERNATIVE_LINK_NAME[ping6] = "${base_bindir}/ping6"
+
+SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff \
+             ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '${PN}-ping6', '', d)}"
 PACKAGES += "${SPLITPKGS}"
 
 ALLOW_EMPTY:${PN} = "1"
@@ -43,6 +47,13 @@ RDEPENDS:${PN} += "${SPLITPKGS}"
 
 FILES:${PN} = ""
 FILES:${PN}-ping = "${base_bindir}/ping.${BPN}"
+FILES:${PN}-ping6 = "${base_bindir}/ping6.${BPN}"
 FILES:${PN}-arping = "${base_bindir}/arping"
 FILES:${PN}-tracepath = "${base_bindir}/tracepath"
 FILES:${PN}-clockdiff = "${base_bindir}/clockdiff"
+
+do_install:append() {
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'true', 'false', d)}; then
+		ln -sf ping ${D}/${bindir}/ping6
+	fi
+}
-- 
2.35.5


