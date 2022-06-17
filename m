Return-Path: <nick.potenski@garmin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6123C43334
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 19:25:53 +0000 (UTC)
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com
 [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.web08.1676.1655493950649775959
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jun 2022 12:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=iqRwYw5H;
 spf=permerror,
 err=parse error for token &{10 18 _spf7.garmin.com}: limit exceeded (domain:
 garmin.com, ip: 205.220.165.212, mailfrom: nick.potenski@garmin.com)
Received: from pps.filterd (m0220294.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25HDfM3c000606;
	Fri, 17 Jun 2022 14:25:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps1;
 bh=ZCI37NEDcBCXz07tP9CUsjIK66kFVdoszEFPV0Ehu9c=;
 b=iqRwYw5HvNBCeF6wmtHvwDv12UqQRSsxKIVtEE6hr4E1jMFFz4IMJ90Ka3BZbScNCDRB
 IBQ7loI0IKuKPnWNKcMdeqOBAU6DXgGoRXVvkFD6F4XcqeT3ir/44s56XwTXluj0E6PN
 pkLCbbTWI3XX5LoGmIqHtSb9mywbrY+ln9Zk2gXOIi/svnpUyE7pam4B201mzY/wzk50
 xPUQ4szKfSsjDssuDOWD0uyjREJLyzyrPFdXaiW2ZgNxInVF0uIsL91v61+KCMU5s5oB
 w/JgCSj63KkINtJ00atepB1iTUmBTbUTxPvw1YH/HUIajtbGVBl7golgJEmFiOcCXCND Rg==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 3grqbb0x8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jun 2022 14:25:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQvfhV9CbefrdZC9jUel4yWMtCrI7TXhXExNttKkGsX/SieVAw3pTtJIvFhDuhDqKu3GKshm+sedrHAVSo5KW1qWS5ckrS35p4fFq1Av8jEvEd4iebLFZZZKYzlkop8a7dQuBAUP5H77juMhlF2QUizMKceMjmvdWEZ9YMOO7JntiJzR56NPqVIDenPmGmT4vJrT+/cJlOXYWA8UlwT23IceBzsI3x1/2XTcwKgJCy+oyBw5qjImjsP5LFr+w9ywM+Yhktonx6EvB1tbzfXezEX6b8k4MlPs24rNRSiquvcbbl1I/BH3JM4C1XtSlZmeu8mer1HAh0c3tv5e5T3C5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCI37NEDcBCXz07tP9CUsjIK66kFVdoszEFPV0Ehu9c=;
 b=LB7jzO3E/T3+4K5phzSylLFAV2dK5y8uhufXE2aBJsi8CEmxYIYVTCR97Inu8g6NHG8znPpMSqTa/hjjWYfodTcKqJod9pzVh/q2w6L6W06pSZ+w1+gSMwGBGnbQEkWz9C8VTwcMhBr5jmPqWOgnsJQTJVaZWjz39qdyJKe3vlsMWoFtMTxWv7b9QHI0nuVGwQPvNRsmPI6/M9PC7PzX3CAFvLh6zsKFlGldCoEcmXNto5hFhYd5O55R1FPogbTdb6gaUtzEzcyOBoUEIIZKxt1fWTTAmbMe7YapceTOjCOvA50g0ZwXrgO3jQSYC277nGnJ/EWqwl6r83O3qTAefQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCI37NEDcBCXz07tP9CUsjIK66kFVdoszEFPV0Ehu9c=;
 b=msuFiapCM70O46J1Cx+/djyWrK7cpJdyySRhlpqGUDbn3QawOhOn/iM64hANgBgvTcww8ANclBhz+mSt0Wqc8TK9RccL1FPxUjzzzXF7jufRFmcsWasx3xZ3wwSJ/bo/NIZrcfhsvQueQh4USi5b8si/0J5O1EkiJxzD5DsejW6Pc0rT5WTztuFNtzIdHlFto5yKVDWZoamPWcfy0AgNSqFIeWjqQMiGp+/uflXqs5pM9pxHP7nLRo9hZCTwjG4tHRVlijKw832XxG5FfGjtD0m33K+aIHIM5coKOkEG74Ll93GjsFTn15oLSWXMgrqCBaYEG4S+5QxHoYyDPoJeDA==
Received: from BN9PR03CA0683.namprd03.prod.outlook.com (2603:10b6:408:10e::28)
 by BN7PR04MB4354.namprd04.prod.outlook.com (2603:10b6:406:f9::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Fri, 17 Jun
 2022 19:25:47 +0000
Received: from BN7NAM10FT038.eop-nam10.prod.protection.outlook.com
 (2603:10b6:408:10e:cafe::14) by BN9PR03CA0683.outlook.office365.com
 (2603:10b6:408:10e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14 via Frontend
 Transport; Fri, 17 Jun 2022 19:25:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 BN7NAM10FT038.mail.protection.outlook.com (10.13.157.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14 via Frontend Transport; Fri, 17 Jun 2022 19:25:46 +0000
Received: from OLAWPA-EXMB8.ad.garmin.com (10.5.144.18) by
 olawpa-edge5.garmin.com (10.60.4.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.2106.2; Fri, 17 Jun 2022 14:25:31 -0500
Received: from OLAWPA-EXMB8.ad.garmin.com (10.5.144.18) by
 OLAWPA-EXMB8.ad.garmin.com (10.5.144.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P521) id
 15.1.2375.28; Fri, 17 Jun 2022 14:25:36 -0500
Received: from OLAWPA-EXMB8.ad.garmin.com ([fe80::acc8:480a:b46f:6ce3]) by
 OLAWPA-EXMB8.ad.garmin.com ([fe80::acc8:480a:b46f:6ce3%23]) with mapi id
 15.01.2375.028; Fri, 17 Jun 2022 14:25:36 -0500
From: "Potenski, Nick" <nick.potenski@garmin.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Steve Sakoman <sakoman@gmail.com>
Subject: RE: [OE-core][PATCH] systemd: systemd-systemctl: Support instance
 conf files during enable
Thread-Topic: [OE-core][PATCH] systemd: systemd-systemctl: Support instance
 conf files during enable
Thread-Index: AQHYgO65GkRdbTulG0muXuEei2drGK1T/egQ
Date: Fri, 17 Jun 2022 19:25:36 +0000
Message-ID: <48159693aa75429fab9b867be4a9b8bc@garmin.com>
References: <16F8E2337D77DDF7.10132@lists.openembedded.org>
In-Reply-To: <16F8E2337D77DDF7.10132@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.5.209.13]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6284d721-8291-4ee8-1c66-08da50972def
X-MS-TrafficTypeDiagnostic: BN7PR04MB4354:EE_
X-Microsoft-Antispam-PRVS: 
	<BN7PR04MB4354DD94ABF345C5673DEBE79BAF9@BN7PR04MB4354.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TG55usNtbUHTKjQPDFyo7JfAlIMBftT4EI6/whBLuYovWHwEmpVJhFl/FrWbvXQ3eXtv2L9OXyYjpQB0Jv1ieZxHlBERmyDlmTNEUwHYuMbSboY8Mt/GHTnd0YLLv23GvuP/0jREnv3oEovmmZ47xEFFDuHyIbN0yCsNfRPP/WwNCgpWcQE6YD1+PSIxEZn1xQ8XCSRO1baRlmQuhvdNJGet/9VuSBQhqur6UUcV3rkvvTp6vgLOmf+oioTbHdyiNZtnjbxSbgOgBOa/xzSKsh2WQjuifSAHZ8gW2dij4WqTDEv4h/r2QnU3pLyPed5Qc5K9TAIHYjD2xN/DBUL8M5RptgZQhFlGSDHjxmP8xLz3zEBnojBFXyVeQBTqa87aKcCrCwV6aTQbVWa/PXsOSSZHWF0UWXjQa4qjEBs1eF1yGqkDXGbgjmy/OPOzxp5aeVHIpW+wMtv9UfLEFONRmaab1onu00p4riFlzc/VUorX2XXQz62NYpEENFMuLsVtdwGF0Os1OVsbAzXZXJdhRjXle42BTfCUo/VFZoflnywoLmgyE9e58vZkYtRTolDO58ynh+N/JSAa4dkIaAF0IHOtgqIjPUL1D5gvQxJjujak8YzGzN/m4pSY/56bNYkBS2PIp38pA6UNyficExJ2WnDzmbRQs0KEg/PP3/+PS9iZrZXUCo6o8Cj97qoVpxOC
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230016)(40470700004)(36840700001)(46966006)(86362001)(498600001)(8676002)(336012)(5660300002)(36756003)(4326008)(82310400005)(2616005)(2906002)(40460700003)(70586007)(47076005)(7696005)(70206006)(53546011)(8936002)(36860700001)(356005)(7636003)(108616005)(24736004)(426003)(6916009)(26005)(316002)(83380400001)(186003);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 19:25:46.5400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6284d721-8291-4ee8-1c66-08da50972def
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN7NAM10FT038.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR04MB4354
X-Proofpoint-ORIG-GUID: gRE7ntUgIbxbki91jfq1WmJ2gTnES-Pz
X-Proofpoint-GUID: gRE7ntUgIbxbki91jfq1WmJ2gTnES-Pz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_14,2022-06-17_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1011 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206170084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jun 2022 19:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167029

UGxlYXNlIGJhY2twb3J0IHRoaXMgdG8gZHVuZmVsbCBhbmQga2lya3N0b25lLg0KDQpCZXN0IHJl
Z2FyZHMsDQpOaWNrDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgTmljayBQb3RlbnNraSB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KU2VudDogV2VkbmVzZGF5LCBKdW5lIDE1LCAyMDIyIDI6MzIgUE0N
ClRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpDYzogUG90ZW5z
a2ksIE5pY2sgPG5pY2sucG90ZW5za2lAZ2FybWluLmNvbT4NClN1YmplY3Q6IFtPRS1jb3JlXVtQ
QVRDSF0gc3lzdGVtZDogc3lzdGVtZC1zeXN0ZW1jdGw6IFN1cHBvcnQgaW5zdGFuY2UgY29uZiBm
aWxlcyBkdXJpbmcgZW5hYmxlDQoNCkNBVVRJT04gLSBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNs
aWNrIGFueSBsaW5rcyBvciBvcGVuIGFueSBhdHRhY2htZW50cyB1bmxlc3MgeW91IHRydXN0IHRo
ZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCg0KDQpBZGQgYWJpbGl0eSB0
byBwYXJzZSBpbnN0YW5jZS1zcGVjaWZpYyBjb25mIGZpbGVzIHdoZW4gZW5hYmxpbmcgYW4gaW5z
dGFuY2Ugb2YgYSB0ZW1wbGF0ZWQgdW5pdCBkdXJpbmcgcG9zdGluc3RhbGwuDQoNClNpZ25lZC1v
ZmYtYnk6IE5pY2sgUG90ZW5za2kgPG5pY2sucG90ZW5za2lAZ2FybWluLmNvbT4NCi0tLQ0KIC4u
Li9zeXN0ZW1kL3N5c3RlbWQtc3lzdGVtY3RsL3N5c3RlbWN0bCAgICAgICAgICAgIHwgMTQgKysr
KysrKysrKystLS0NCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkNCg0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1z
eXN0ZW1jdGwvc3lzdGVtY3RsIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLXN5
c3RlbWN0bC9zeXN0ZW1jdGwNCmluZGV4IDk5MGRlMWFiMzkuLjZhYTJlMjA0NjUgMTAwNzU1DQot
LS0gYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQtc3lzdGVtY3RsL3N5c3RlbWN0
bA0KKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLXN5c3RlbWN0bC9zeXN0
ZW1jdGwNCkBAIC0xMSw2ICsxMSw3IEBAIGltcG9ydCByZQ0KIGltcG9ydCBzeXMNCg0KIGZyb20g
Y29sbGVjdGlvbnMgaW1wb3J0IG5hbWVkdHVwbGUNCitmcm9tIGl0ZXJ0b29scyBpbXBvcnQgY2hh
aW4NCiBmcm9tIHBhdGhsaWIgaW1wb3J0IFBhdGgNCg0KIHZlcnNpb24gPSAxLjANCkBAIC0yNSwx
MiArMjYsMTYgQEAgbG9jYXRpb25zID0gbGlzdCgpDQoNCiBjbGFzcyBTeXN0ZW1kRmlsZSgpOg0K
ICAgICAiIiJDbGFzcyByZXByZXNlbnRpbmcgYSBzaW5nbGUgc3lzdGVtZCBjb25maWd1cmF0aW9u
IGZpbGUiIiINCi0gICAgZGVmIF9faW5pdF9fKHNlbGYsIHJvb3QsIHBhdGgpOg0KKyAgICBkZWYg
X19pbml0X18oc2VsZiwgcm9vdCwgcGF0aCwgaW5zdGFuY2VfdW5pdF9uYW1lKToNCiAgICAgICAg
IHNlbGYuc2VjdGlvbnMgPSBkaWN0KCkNCiAgICAgICAgIHNlbGYuX3BhcnNlKHJvb3QsIHBhdGgp
DQogICAgICAgICBkaXJuYW1lID0gb3MucGF0aC5iYXNlbmFtZShwYXRoLm5hbWUpICsgIi5kIg0K
ICAgICAgICAgZm9yIGxvY2F0aW9uIGluIGxvY2F0aW9uczoNCi0gICAgICAgICAgICBmb3IgcGF0
aDIgaW4gc29ydGVkKChyb290IC8gbG9jYXRpb24gLyAic3lzdGVtIiAvIGRpcm5hbWUpLmdsb2Io
IiouY29uZiIpKToNCisgICAgICAgICAgICBmaWxlcyA9IChyb290IC8gbG9jYXRpb24gLyAic3lz
dGVtIiAvIGRpcm5hbWUpLmdsb2IoIiouY29uZiIpDQorICAgICAgICAgICAgaWYgaW5zdGFuY2Vf
dW5pdF9uYW1lOg0KKyAgICAgICAgICAgICAgICBpbnN0X2Rpcm5hbWUgPSBpbnN0YW5jZV91bml0
X25hbWUgKyAiLmQiDQorICAgICAgICAgICAgICAgIGZpbGVzID0gY2hhaW4oZmlsZXMsIChyb290
IC8gbG9jYXRpb24gLyAic3lzdGVtIiAvIGluc3RfZGlybmFtZSkuZ2xvYigiKi5jb25mIikpDQor
ICAgICAgICAgICAgZm9yIHBhdGgyIGluIHNvcnRlZChmaWxlcyk6DQogICAgICAgICAgICAgICAg
IHNlbGYuX3BhcnNlKHJvb3QsIHBhdGgyKQ0KDQogICAgIGRlZiBfcGFyc2Uoc2VsZiwgcm9vdCwg
cGF0aCk6DQpAQCAtMTkzLDggKzE5OCwxMSBAQCBjbGFzcyBTeXN0ZW1kVW5pdCgpOg0KICAgICAg
ICAgIyBpZiB3ZSdyZSBlbmFibGluZyBhbiBpbnN0YW5jZSwgZmlyc3QgZXh0cmFjdCB0aGUgYWN0
dWFsIGluc3RhbmNlDQogICAgICAgICAjIHRoZW4gZmlndXJlIG91dCB3aGF0IHRoZSB0ZW1wbGF0
ZSB1bml0IGlzDQogICAgICAgICB0ZW1wbGF0ZSA9IHJlLm1hdGNoKHIiW15AXStAKD9QPGluc3Rh
bmNlPlteXC5dKilcLiIsIHNlbGYudW5pdCkNCisgICAgICAgIGluc3RhbmNlX3VuaXRfbmFtZSA9
IE5vbmUNCiAgICAgICAgIGlmIHRlbXBsYXRlOg0KICAgICAgICAgICAgIGluc3RhbmNlID0gdGVt
cGxhdGUuZ3JvdXAoJ2luc3RhbmNlJykNCisgICAgICAgICAgICBpZiBpbnN0YW5jZSAhPSAiIjoN
CisgICAgICAgICAgICAgICAgaW5zdGFuY2VfdW5pdF9uYW1lID0gc2VsZi51bml0DQogICAgICAg
ICAgICAgdW5pdCA9IHJlLnN1YihyIkBbXlwuXSpcLiIsICJALiIsIHNlbGYudW5pdCwgMSkNCiAg
ICAgICAgIGVsc2U6DQogICAgICAgICAgICAgaW5zdGFuY2UgPSBOb25lDQpAQCAtMjA2LDcgKzIx
NCw3IEBAIGNsYXNzIFN5c3RlbWRVbml0KCk6DQogICAgICAgICAgICAgIyBpZ25vcmUgYWxpYXNl
cw0KICAgICAgICAgICAgIHJldHVybg0KDQotICAgICAgICBjb25maWcgPSBTeXN0ZW1kRmlsZShz
ZWxmLnJvb3QsIHBhdGgpDQorICAgICAgICBjb25maWcgPSBTeXN0ZW1kRmlsZShzZWxmLnJvb3Qs
IHBhdGgsIGluc3RhbmNlX3VuaXRfbmFtZSkNCiAgICAgICAgIGlmIGluc3RhbmNlID09ICIiOg0K
ICAgICAgICAgICAgIHRyeToNCiAgICAgICAgICAgICAgICAgZGVmYXVsdF9pbnN0YW5jZSA9IGNv
bmZpZy5nZXQoJ0luc3RhbGwnLCAnRGVmYXVsdEluc3RhbmNlJylbMF0NCi0tDQoyLjM2LjENCg0K

