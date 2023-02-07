Return-Path: <dragos.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A682C636D4
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 16:35:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.88029.1675787710088949673
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 08:35:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=iFLhuLDi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=140236a962=dragos.panait@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 317C9d75013508
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Feb 2023 16:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=zweNCznrAqfVgTMxDt5dWWagj0WNxI61PNxTbezKG5E=;
 b=iFLhuLDi57ynVS/eVaoE1rBKbwjuqMG/gwilADZQ/uCRoQ1FFKtF3eAwiJiy/62l8tJE
 IO4ZnWeHFUD7DP5JYYtsALxdgv+C23umVDr/aL4sRFSiUYN9yZ7D+lJAT0Ka+9vOC8E+
 +LAi32NGu/CZHU5kdLyLmlpEFsJowUgoZsiQWM6o7DnlZRyMzuR+dcbVf4ORE/R6kE0z
 qfOFGBZaSkKKPjiOVyRtZxU0FUrAcbrbbN23Yj3GGEWRIugaIoCul10+SBIELrOlpEAN
 h49z6G4av47sPZ1ToWB6GtfXCDvpS3EY0cHjT2zmOmvN/GgQ7mXV55yBdfNNvJZce6s7 gA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhck334b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 16:35:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULwNLL67vr2LTcomHTBWlbx2Gj0Ej4yJ0H4idcBoWGr5HUPy9HwfS8uMBnqgI1FLxedY/RxFLqT81/tkCLHUWau8U/hcdPJS8/AyQKR02M/YXjw9eG78qoHMVbEFNHuxF4XunUHo5zDdaF/+AAhCxIolHszsyj5rekIzhqlNkiKPdP3QDgMIodVm6HXXulDqjUCGmUswFSqx2Bf3FZGwO+gWX0CzQgy7IpqJgfenesrMs/wk2HhWc5YKj5BsWNpFbUefvowBHDEpHmde8fXZe8Ny/Fc1sFou21WsgZPRIcWe71LgfyuCww79KK9kkcOfh8QnrLOObW/XvGFONOqKGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zweNCznrAqfVgTMxDt5dWWagj0WNxI61PNxTbezKG5E=;
 b=nTQPH4zS/kX3jNj1GkEP68tETdB/D1vOX7guiQemiCWBY3AZeiJgsbLlPgiIup2JtZBLcD25QGbvKFpK56UGVJ7QodEaQgNwFht6Gx4SgjxkD8VZfPfSxYc4Jf9CLzzDSLttcC8Kv/T4Bi0A0nWTzihf/O0mUK1zvopAYD/1ZfX32XN3ggjK9s4GN8Ny22L7mHxDMv096sjKiXI6/vcWy/i4qXHLC2LM0/KkyNtEgbakvOvlzUTxdpZ49oHaOMoMbgjmbK/jTY2NIpDoOcIc1223MNATkhoi5/zc8HF4JAjMmaNOMB92SbhGtTE/KV7muisL+s4GtEbgCLypR8V9mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 by BL1PR11MB5397.namprd11.prod.outlook.com (2603:10b6:208:308::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Tue, 7 Feb
 2023 16:35:06 +0000
Received: from PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::b26d:bb28:dab0:cdb7]) by PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::b26d:bb28:dab0:cdb7%5]) with mapi id 15.20.6064.036; Tue, 7 Feb 2023
 16:35:05 +0000
From: Dragos-Marian Panait <dragos.panait@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH] plocate: add recipe
Date: Tue,  7 Feb 2023 18:34:51 +0200
Message-Id: <20230207163451.3886205-1-dragos.panait@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0051.eurprd09.prod.outlook.com
 (2603:10a6:802:28::19) To PH0PR11MB4952.namprd11.prod.outlook.com
 (2603:10b6:510:40::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4952:EE_|BL1PR11MB5397:EE_
X-MS-Office365-Filtering-Correlation-Id: e0af13ff-5671-41f6-7214-08db092944c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OqEG7UjyIqKQTX7ZgVwpg33y+aV2omV6KYNGntjNS82F/C3GA5iVYrJiJOzDBFucLWrK0EJjcdlR/EU/CZZTE54hVYKcPhBdcWBJuNHLcm5IChy5YsIuS3lPs7VzTQsVRF/HpqeRKpUCHBFvTCoMUXa8xxLFP7ApIeYOQnwkXPcsC5qXlDWzTGURIb9dfViZEbruGBuTJAPw6ydpglWX8Ztq5sxHsj4ERas/wh6grSQNSxFisQwX3nfZ1Crlvr3uAXRcY9IsLioKALXHCytqVFEyiZdYu7GTA4zOmaSUgIwdEirZmXOwFw5RXS3UY59OttsJHANwMa4fzQwD1ARJAomc8MlWJ71CV9qhzIzo1KAGFNlXluUkHOmfUgbQYq7Ec9mSI12GfiIhQ3sWKrjY8ItIZ7pdpNcEDvF0Th7kyYiGMGMTXX1b310UGBoPg6U4WF1CZAAvePapkl/xY2nVVwBvW/d0d1IKVIRJZ7MUSz/Gklomd4FfdozP5PqVuqhTB54pdrP0bgtFcSoJRUGoR6JcKkniQhVWnuv+l3M7kXD3KT3Mg+Bh0FGx+frF7wJZcpsz5rDJz6wf83oBaw2dtKq5LtnQtJwXbGuiAx9azMyCAF2R3+fiaMq5nSZuypvH6LfnWYiQP5MdtjA8Wufx4eyOPMoMjTKRSC0zObyNCdNSxPnFbGp/vyF1lBqpIK4zRHa98p07+EBr1o2ZqySS7j/GpSwevxI2lspi7BHiOgo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4952.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(396003)(346002)(376002)(39850400004)(451199018)(66946007)(66556008)(6916009)(66476007)(8676002)(316002)(2616005)(478600001)(52116002)(6486002)(186003)(6512007)(6666004)(26005)(6506007)(1076003)(5660300002)(41300700001)(8936002)(2906002)(36756003)(38100700002)(86362001)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HwjNdoJnzHrli9IHqSzRCf3pLHzlvP1ko8yL2LqYZIRzLymna2WndnBRhgOM?=
 =?us-ascii?Q?8+EdYDzw6Kky8jPofD/p/ac+NcGcU/B01jx6IMaAEi+vfChMNPm+rvT2E/Z4?=
 =?us-ascii?Q?KliBq3i8cXqxOnXxTNMK17sLKdQyj1gQNNGDK9f7JI2ytMAp+lGw1u2hyDad?=
 =?us-ascii?Q?fMvJZweidTsMPwZN7wtPmm0BIsXO+yD4Khl82UZmmooHuCNb7DOjuxkaTKrv?=
 =?us-ascii?Q?TqgdM6TVs6XHhrL+RSdbdmNXdJR3zvF2dGYVXS+11Lo96FPDDsRBPSWDDa7s?=
 =?us-ascii?Q?+uHchYXNLpmepFV3/6bmOf8kA3I31oIwLgCuqZy9fzoZJ7mezCxMbs68wA1b?=
 =?us-ascii?Q?Wf266zR/nT6F28YHMmLM8vAYr+5pNBkTO8rpD2ZQy2rePypX4Ydkp63t2Uul?=
 =?us-ascii?Q?ZN6o6CyqrlLmbCRFnoNE0OBRQSyb3Q79Z2fEwWGxZ+ywQlge/KRjkKDf0M+T?=
 =?us-ascii?Q?GDqSnQaL5+BqBweQblBsnhjEp5zfWGhsvY3Q8XcCr0d9zr2jWx+l4ZLsm00H?=
 =?us-ascii?Q?zArX5QI6/g8hgcJk+59KvN5DXL5kgVTynwVxpn+kBix8T6kTaQYp2iBw1gxd?=
 =?us-ascii?Q?UL+EJaK0cam28j/rvYRs/me9jBC7D65lWWYRSeaGQFCQJn4XHK2w+eLyYb+g?=
 =?us-ascii?Q?0kZmw7g+XAm42jr2/1gNpaFwiJZhZMwFNizZjVbWrg8LwxSMErrqf3ymBxDc?=
 =?us-ascii?Q?tuJl56mzy4M7CY/MEAM5Z43oNFT5lWY6TOjOnxN9wpSdJfYuQfZEUJzxkFnS?=
 =?us-ascii?Q?irifGenkWRgjHzjmGdRYUP2v2KHlL1CPKLrAEhFPExnMDZfSKAyquNhVVAVI?=
 =?us-ascii?Q?gI7lTc+r5jFaJn9yfhGu6kzdwFrZmCTppWHcucjsn6EaZ8H+qdfgRVfv8etI?=
 =?us-ascii?Q?NtkVdF4/ld3egVmLvKMbZnkw2l9K9pSx/nCxao9EiovUHE+JCLuGcO2SArQH?=
 =?us-ascii?Q?cyJ3CL6Nc9+wpxNO5CUM+Hfo8vg1Mpdcf+DL6M4AoQLCeSxZOnVIFt2FRxs+?=
 =?us-ascii?Q?zkK1IAkr4KK21kHc1cd1gPd7Sl4JBbqi/kBxwZ1PVNa+AO+0887uKrudTFS5?=
 =?us-ascii?Q?2maHIugW1eeuKDqBVtmjOO4qvKqC316gaJjyBHtiNolF9rnQmZ50zNSZ3/ub?=
 =?us-ascii?Q?aW8cRXF4gSQA/fXFiimjr1ShxmDiMSAg6Om8xTAjcgVhggDhNIDnMdpujDj+?=
 =?us-ascii?Q?l4kzZngm4OoFsXlzbFwGNP026/9VkSwvKtUICdhnVx55Vc6O40+TQLGZq0i/?=
 =?us-ascii?Q?glGT5bl85BcqfthSDXvMGUDydIHRPQZOvFCJZ2Z5hKAQF76KWiE9gMyFdHbY?=
 =?us-ascii?Q?olH3R24tZEzC/oo237f9zBGmc28uzlleIVvYs/WkX4p69+pcMKaTj1SRulCR?=
 =?us-ascii?Q?dGLfBfxJiMZ08EwWoIJXdBjxuNsCbafGw4SGNMjIW3Q3O26Lt0+nGOLQwAy6?=
 =?us-ascii?Q?ZtB/O2YQ7NFgQMPiwOHyr5ICYLMlTuMa2RZv2S5hYo+cACvp0MHMh240zPeR?=
 =?us-ascii?Q?wJqZKzx8IRJ3HmABVUA5OHbEMcoBXwZxXpU9RCZA/2rclulQ+td9RdURHwnI?=
 =?us-ascii?Q?9IC5jU0hhrOFHirqjReC8m+b7FkrclbqGnqnSk9eQ4MAZBbqeszKRncMbT7Q?=
 =?us-ascii?Q?EA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0af13ff-5671-41f6-7214-08db092944c7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 16:35:05.8725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzqv+JCQt7scnS5c1rrjz05n2RivHI5uE0sdMgejTeVxuaB44Q59Ffi54/CfhhJPFVAA5WFj89DnUMgt+flvlHYCXWcMBLK6QuH1RkSH0dc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5397
X-Proofpoint-ORIG-GUID: ImCLEPv4npVkBFjmnol9ZRuqQ-gUk4g_
X-Proofpoint-GUID: ImCLEPv4npVkBFjmnol9ZRuqQ-gUk4g_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_08,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 adultscore=0 mlxlogscore=821 impostorscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 16:35:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176820

From: Catalin Enache <catalin.enache@windriver.com>

plocate, a much faster locate

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
Signed-off-by: Dragos-Marian Panait <dragos.panait@windriver.com>
---
 meta-oe/recipes-extended/plocate/plocate.inc       | 9 +++++++++
 meta-oe/recipes-extended/plocate/plocate_1.1.17.bb | 9 +++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-extended/plocate/plocate.inc
 create mode 100644 meta-oe/recipes-extended/plocate/plocate_1.1.17.bb

diff --git a/meta-oe/recipes-extended/plocate/plocate.inc b/meta-oe/recipes-extended/plocate/plocate.inc
new file mode 100644
index 0000000000..166fc2d561
--- /dev/null
+++ b/meta-oe/recipes-extended/plocate/plocate.inc
@@ -0,0 +1,9 @@
+SUMMARY = "plocate, a much faster locate"
+HOMEPAGE = "https://plocate.sesse.net/"
+DESCRIPTION = "plocate is a locate(1) based on posting lists, completely replacing mlocate with a much faster (and smaller) index. It is suitable as a default locate on your system."
+SECTION = "base"
+LICENSE = "GPL-2.0-only"
+
+inherit meson pkgconfig
+
+DEPENDS = "zstd liburing"
diff --git a/meta-oe/recipes-extended/plocate/plocate_1.1.17.bb b/meta-oe/recipes-extended/plocate/plocate_1.1.17.bb
new file mode 100644
index 0000000000..ef36754bac
--- /dev/null
+++ b/meta-oe/recipes-extended/plocate/plocate_1.1.17.bb
@@ -0,0 +1,9 @@
+require plocate.inc
+# GPL-2.0-only
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://git.sesse.net/plocate;protocol=https;branch=master"
+
+SRCREV = "7e5defd4e7e075cb9226e7d2d9a80f943c482d11"
+S = "${WORKDIR}/git"
-- 
2.34.1


