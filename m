Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44F0C46467
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.3426.1649405748387227300
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 01:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Wn6PAlAN;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=10974aa226=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2387qROX023801
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Apr 2022 08:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=/jiMuH6Xqz+O93CmkqP3CZnqNtuc6Z54PCCVqJLdIb8=;
 b=Wn6PAlANd7QuNXA2euxG+zrHScISQL0cPGqCPZffm/ZnAAJfNIsxKzv/udzRJ8ouCzjg
 W1NIpavCwIzX8RKGSZJ/vvzRIJVoODSgSvpHD5QlSXAHuAmKsJ/kge0/YPwbvRVLey+R
 rmKm3/iqcGUasruATftTy23AY0Or18q3rsN5+HXhPz2Ce1dx/ZkcuOsqJ3U1GEGBRmXh
 8K4DrW/qJHyxy7nsAuXoVzAlRA9MfzdXb/L2i8PkVmjrGpCr0XyWL1CW9MPmNvgHY0xE
 Q/giABQaPWbqTYk6JH4Ot1Ir4BjAey1VxH2NDRmqbuhjcMk+fdNGdFnoPZY1hVqph0Y/ gw==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f6bq252dt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 08:15:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUBihl3bsboNQLXto4q7NZ4ojT9Xro/MoGhVO/KZElIUqHnIWuRmX64XWitTDd+J3yX3HTXamCpmcGSpNgmhdlLAQSKmwc7k0BGM8G393jgUh4er4sQlBrPxR2TtlhNDgHke+gvljiusVPj38Bejeor0PE+/94BMne3Z7bROAcOdb/+DX3vjKEwin2A5xkwTNqmMhr1t2yVcr/u8Utlv5ykLt3KJeXNfLF8bceKdBxYszhydBpHY+ZCumdhTdxP7DhgT/kpxyIxT4wOqDFzpdjm5txT+Aa7ns/e7qblm6LZ9yxM2k76EIDWrQm9Zni4huRVmDGKSCx3MXYTYEYST0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jiMuH6Xqz+O93CmkqP3CZnqNtuc6Z54PCCVqJLdIb8=;
 b=A/CLBjGf4xwfWdO/60xmUdhcnVf2XpuWl5DjuqR/CMbE8ChuPOVvEArBnWSSBTJHxTp83snK2VpWPaWdl/WOfn5dKhzwFl+pG6F45280gntLavRiqUvmhIV+vBAw8QTJ3ajig1X37wdDlzi7feekREFYf3aUqol7pnTh2QAtZejqdOa1tYuQ4YPvRIXVyA4+PD5/nTi0aLTI0AMlYoRLCJlkDajEUDl/bMr8i9tukR87sWqeWyf0aqvH9GG4bWmMRwYSdQNo/3G85aszLFRIhsvsPsVV1MbwR/NBfqR8h3qG+6Nk1zX6y63gcSuT0aW4D4RUN80Sc4gG/nlJkyW2xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4523.namprd11.prod.outlook.com (2603:10b6:303:5b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.26; Fri, 8 Apr
 2022 08:15:45 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1962:6577:b409:494c]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1962:6577:b409:494c%7]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 08:15:45 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bluez5: install /var/lib/bluetooth directory
Date: Fri,  8 Apr 2022 16:15:33 +0800
Message-Id: <20220408081533.1705128-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0140.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::19) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d07e043-dd22-40a3-5142-08da1937fb05
X-MS-TrafficTypeDiagnostic: MW3PR11MB4523:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4523149D090F6766B5BDA3E8F9E99@MW3PR11MB4523.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s/+r+KlsPznrDYccYv5SHUrUa6RQ29oBs7DKg1fIfrRoLLX84uXyydEthloOvHivsIENmokkcgmTELmPH8F7gYnUdmQESdPnl0liOjiOybk15hsBrvlMjz7VghV9/FZsp21wLkmKRqnn9koMe/waVpKWZIo6vbnxAURwBzJRNJsO8FC48ov6TYdoBJs1az41/zd/iPtS/2XlszKvUz5AO5tf+fz/vtSXDBljryYtLaDwHuOsr5EJlHmS28UZlN2n6PM9wCKK1Fyz8Rfsbjyjh9IpRNtkL/WSApsC5G5D/LLaxRhIE/u2SCWpCu4c9wsnxSkREGyh5AL/Nc2Cg4UvTQJDPph/zgam+A8d9SkpPni7ZcDE6WznMLHUix2iaKlzAhWLnQieGWpO5W7FCnDj64e9iFq2w2BZhEhyHU78NvbrpDdeK3hXev2WLntcO71a8HWUWUz9U4AeIWxWptxOjRMHW9GgmS+1bu4nHwxlZiiCnhn3w9MRV7lVT27mYjMA/QhKQCwTV4bXRSQuCc6qfIO9I3SB3IZHlV/FYlXKlWaCJBcXZJYIzBphLcmQXDiyrHhMCw76QSri4U/c2FGSsN9mT0SOAcPP8ZNYc8GIgv4EVyuWr7K002OsEmapLqkrJJfRjegp+P1SCLYMxVKRaZSVTjbEG40uBXFTfQRqHilMCux7tpPArCNA38U2ONmCBRBbVcF23XDIEtG9ueEqwQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(8936002)(5660300002)(86362001)(6512007)(36756003)(8676002)(38100700002)(6916009)(38350700002)(66946007)(66476007)(66556008)(26005)(508600001)(2616005)(186003)(1076003)(6486002)(52116002)(2906002)(6666004)(83380400001)(6506007)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EwKDp/gRwUcp7yNa8/Yxu5tYhBaxPRWm2MlstE8CQhhz6+78V23OMvhVe2ri?=
 =?us-ascii?Q?IY93MrS6gP5rB9FYAw6+89CrjtJfboQq80f0ytlMxNmI33pD3dOrWtVC4vSU?=
 =?us-ascii?Q?kPBuMf2trtbcIS3JlpjxYt9h2dPQNnZ1zgmFSQ8TjmprEvAjLoZFbBCzb6wT?=
 =?us-ascii?Q?+x96AZZatFqAfA9JgxFuq09sxc48pl8qmOqMxUAwVUWti8arRT7lc0yEoNLO?=
 =?us-ascii?Q?B+vjMD+304lay+OzI955x//GAe3rQd+VMuE877qV1sSqYOWy6mH/gIK+adRU?=
 =?us-ascii?Q?1p0Qmwu0pEut9KrzOMTS0LtSo9mwhSbyf5pOkoxgrAyRpuTSkSV53vwxej48?=
 =?us-ascii?Q?IWWa3V2jiAnlg3FpQ0ddlSmhAeujlJ+Nt+V31QxBrNw1J2tzPKuqododHJJV?=
 =?us-ascii?Q?0/5qrtC/AVt0Bxt3SL65p9KnMqQ8Nar/e1Fzgdcf+PXMw9EvuQTq/2z3JHz4?=
 =?us-ascii?Q?qQD3Dx6a2Gtsnf/tlGZJ/ugzbD0SdMttG7lYKs0qegdxhZNwbEAysmO4yOJw?=
 =?us-ascii?Q?TOrX3J6RARXQcQdxB/sRXfzVqdQPRmzm35xw3YEp263SJoSrEmuG45NC7x03?=
 =?us-ascii?Q?IPzcmq4kybzlzOQb5h1wUEJwPm5zt2vkfFmpUE+laojAsboPrgSaXvVIUfTr?=
 =?us-ascii?Q?3NUpfDUt+MTIoOyI7XGRIKK90MtjjWrTk4+6wr42oq2BxJig0YPmndjPlKXd?=
 =?us-ascii?Q?thYeP26X+BNEDUjAla4SVprJP4oOA/RI1ghRJZ5UO4OgNc9iAlcHQyKxbX1u?=
 =?us-ascii?Q?kBsQ3DIXSSLCtkACJ047WsuoC6qwyvhQ1miw97hosJnQKDi0A/ZsJv/2EMAj?=
 =?us-ascii?Q?xoQljjoJdeW758UV2MvPv1YfnOGv+ZCSdWTFrTq5Gvvn8g/PQo1tRf988Epc?=
 =?us-ascii?Q?blPM5dwRveGo91LGlCXs/RZMP7EQrW9uEA1467Yc8J7rxnQ3ixOy2JB/w4KN?=
 =?us-ascii?Q?c1cir6H6jHH/luQJOU5J9CJ2x2+XJAATFnwnRu+UD+WxHIGYSpATC6DeMB0A?=
 =?us-ascii?Q?lGtDLt1uT8Zn6k2EPaspEVwJ/wj7Z6fSRA0fCF6w3mJJd3obYi2AGDS0aaoE?=
 =?us-ascii?Q?Az7PBVDAZqfbIOcqz50w8srDBhrBVhUJ/GEmk5dqoIkVc7iDcC4BIbXuhKaP?=
 =?us-ascii?Q?oYpJWUPa6zGSir0ZP3QhjEsK+MKPrbuv/j61awR/YkOoubBo5kchMRC4Y28j?=
 =?us-ascii?Q?iUiQcJ8aeiAWHtNrfBhqEO2IiP4BsJG8rIsnB4fabcNyAnNW06hfteFO4Q0j?=
 =?us-ascii?Q?rN/Ii0vScOSc19iSjA0KiuTSGlj+qmJAjh/+Mu3kDt/7UxDgK+48ECu+fHDJ?=
 =?us-ascii?Q?R3TxaURy/scByMeymiMwDU6InX7ZJTXT9i1kSQ1E9tfNuntgNHsnKuAW40Hf?=
 =?us-ascii?Q?hE9LflbikbQEOoOwmHmFQd6Nc9d6lJxc5SO4P07mlQQcwmnlv792cQKhSBZ+?=
 =?us-ascii?Q?elfbURZ0PU4z9obc7tEuG1iIFVXUflrE+KmE/XCV9Gn/8yYzmMzfzOl1pDI2?=
 =?us-ascii?Q?Q5qU/tVZVr9Y6nLgFkzzLuzXSpkScw7SpuhSKCQUQQo9PxgZo+z/JJqWfiCm?=
 =?us-ascii?Q?Wp4lIhuny+vR/3pSPXQ1pTj440earN88bZ4zbysQuuy2lKvKJYxnx7T+yjQY?=
 =?us-ascii?Q?4yKqT/9VMOOko0Bca6M1omw6VJSGLJZtCF5wxFKuk81lJIJTs7YlzV4fa35Q?=
 =?us-ascii?Q?Br2KNyTpYOgEQdUzJmfktFU/+gbvNZB4zbmubPVZ86sVDX0lQuNSLfF69vL6?=
 =?us-ascii?Q?tjIE2OR9XQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7d07e043-dd22-40a3-5142-08da1937fb05
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 08:15:45.4015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OBfUZR0VtVQ834f5PxWcXnneKydWrtTl8UJXh+rKAYNqPLDh3XxGTn4lvM4zfPYyIk4XWg709gXWManUIlFttw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4523
X-Proofpoint-GUID: d5H6MMzvU2BN9U4NMk7xcoj8u5gX3jmR
X-Proofpoint-ORIG-GUID: d5H6MMzvU2BN9U4NMk7xcoj8u5gX3jmR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_02,2022-04-07_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0 mlxlogscore=883
 priorityscore=1501 malwarescore=0 clxscore=1011 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204080045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164155

There is a bluetooth service startup failure:
bluetooth.service: Failed at step NAMESPACE spawning /usr/libexec/bluetooth/bluetoothd: No such file or directory
bluetooth.service: Failed to set up mount namespacing: /run/systemd/unit-root/var/lib/bluetooth: No such file or directory

This is because the directory /var/lib/bluetooth has been listed in
ReadWritePaths= in the service unit file but does not exist. We need to
create it before service startup.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 79d4645ca8..ee2cdbcc59 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -102,6 +102,8 @@ do_install:append() {
 	# Patch python tools to use Python 3; they should be source compatible, but
 	# still refer to Python 2 in the shebang
 	sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/bluez/test/*
+
+	install -d ${D}${localstatedir}/lib/bluetooth
 }
 
 PACKAGES =+ "${PN}-testtools ${PN}-obex ${PN}-noinst-tools"
-- 
2.25.1


