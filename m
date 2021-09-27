Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4318C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 17:22:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2289.1632763352900641820
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 10:22:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=rVg7QXXI;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=4904b47dfe=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18RCSdeT002779
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 10:22:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=gSQGLlbT1QrfFmt40FzeU/Jq9Cj5EgQqyZTf7/Wu0QM=;
 b=rVg7QXXIUUrRS2LISxTxqpGWQPEkXW9LwlAgUCnsnSMr6xRJ+crN3+j+oJqF9KoQ5cuH
 Ir7B5wUwp/BxFxXNYht3YYdh3GNjGViDlNWTveDQb8kM4Q09D7+eR+lloz4fdeCilrez
 rmaIE46uVwxMWgPomBH1KzZ3UQ9tKu4YmEJj7BBg1cE95a53kxx4i7qo3ShfV53jX+5P
 POi3PGiN+MxkiSZsRw2F9L2i0ZLGYiCQNWTXrsYGQtiHqDHKnI1Ed0ZYhlKI1HHYVvHH
 rVQSjDp+jjKfPddIFJTwi1QUJ9uw4Espcrf26g/nd8RXdF8L6qhhbNIHDOmgegUf+YuI +w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bavv60qsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 10:22:31 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18RHMV8H015101
	for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 10:22:31 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bavv60qs7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Sep 2021 10:22:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+91JTM0Kv6nuvkzL3lvnPnmnRW7xfCL85zyLn0qsWpcYrPt8qp58Xk4kauEwUyKVw9okSlGgYlJHCuGV4gYpKglwBfsniNoKaVRnb7Jpn1FXYkhKOxU9gDLXkCa2wAT0ANY331E1yZT+y+MOCJeiqmw7w9AgrnPyFnYWYMLCpSfTns8GLA94/W+bSwoLMXD2PtZpkrqTNPJNMnOK8S3zF3HqNOvv9bOoaBTSPpn40QIZylzxP/VapEtWB0eAT3FWbKG79rbC4nFeCVj+ryIAZeX2vj5R1YuBqO3y1C2j7j9T7ouT/kSCM7wvE0NjCRbpP8NHpu2JhUKRb+c5GP1OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gSQGLlbT1QrfFmt40FzeU/Jq9Cj5EgQqyZTf7/Wu0QM=;
 b=Zhm1kMdyA8dxnA4A4LjbxJcEnkeWs+5zUtXe7g/AOUsfcT9XMSlEfpNX0qz+DC2f35CE3IjPP+vAj7zjqtkSE+2UWOfUFXzbvPnbuPyfia7eFYJ+2KaM1oo+jj3VIWVAtZSaU8YLLoOj3AdayLo+aJuB/ymzHxIknwfI4FjNdSd77s1R7A75fKJhpt4LsJ/FxjSsNSCxdCOGoWizxol8ekEmuzNe0SNVx80/S/hQg9Q12tNOM1Ect/j7EeJSr2u0+NMjW8WQhF71cC4YEdj7QuVko3RsJD4rZRUWbIO6eMx3xSoYPDZoF7RdLE2FUU52bWfi4UUhnXdnVQCVIQuUrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB0079.namprd11.prod.outlook.com (2603:10b6:301:6b::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.20; Mon, 27 Sep
 2021 17:22:30 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::20bb:b9a1:85a1:44c7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::20bb:b9a1:85a1:44c7%5]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 17:22:29 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, jpewhacker@gmail.com,
        ross@burtonini.com
Subject: [PATCH 1/2] spdx.py: Add SPDXAnnotation Object
Date: Mon, 27 Sep 2021 10:22:16 -0700
Message-Id: <20210927172217.3640059-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MWHPR1201CA0016.namprd12.prod.outlook.com
 (2603:10b6:301:4a::26) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by
 MWHPR1201CA0016.namprd12.prod.outlook.com (2603:10b6:301:4a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Mon, 27 Sep 2021 17:22:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c61d19e8-c18e-4fc4-8cee-08d981db6257
X-MS-TrafficTypeDiagnostic: MWHPR11MB0079:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB0079647EEEDEEFFB7D797803EEA79@MWHPR11MB0079.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1AE72My9ItDe6zjB8DAjKpFDfgSdgmgYXxQfpJlBIJLdsBq+1o0sR1B+ltSzdDBas3YzoFcCSv3TM5toeqPvTO3PpioNYmwmU5QSMgmiPbfOGYDbbekMbbHaL/dueSac8SdCxNh/9D6cpu5I9/TdBR1AVa2kOgO7Lu0XuJFSySCFiTmaWu+35IpJBmOQjOvO0OLcjmKyxGtrpXs/3/gtdfvndE0wtqyoqxzGHWLSR5cNet4EekwdscAEd2Zy4Qqa5waaEfOTe4ngnp78gqTzejMFB2Rl9OVgFF4fVnW1+ITaGu5Kd2tCb2a1ZEBk9yxVyE83Jy8/XA5FP0zRZW7GEEuxqMwjCSYyMEfkn7AKvITKd3DANXy2b3vR+DYWHpsQmo9fNDac3Uva5D/0AXczczCB5aEft9Fykg3XcXpzISf8t0JwSTaydfkSrYWaEPwiK3zYfVUe+bC6rFcHD4EvxPXUKJvg6/dygMSU9JdaEriKCJUJdeHHLTCOE1RtgIg8TDJwXW6r2eJPPeFkIsxoQxItZZiIKRAVGjnPNEtYoJkauzcocOb6PCxjWy/hJYr4euY28QhmaEejoc9Xb91sYFQg3Qf5OPy1YS8WiROQ/bEBtpOIidFUHqmhmA5YPFgtfP2y331YC3VfCtGR0STwNAhVVs3PMEFy2A6+HZsWxPI8jbBOlLIy3RxcHYGEoV1YYJA+0R+8sjpDUrH65bB+sw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(86362001)(66476007)(26005)(66556008)(8936002)(66946007)(1076003)(52116002)(6512007)(5660300002)(44832011)(6666004)(316002)(38100700002)(38350700002)(36756003)(186003)(83380400001)(6506007)(2616005)(956004)(8676002)(2906002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8KUULVRhqmaqK4nfrqYXDbuMLZcfQCKmPD2wmg9JxrvZR3lf91cAGB+4Ibsr?=
 =?us-ascii?Q?MXAlJhYwUpUBBHLSlJFEQ+u0XB60djC74vT5vpY2jg0bKF7XLPNGZG115Qxy?=
 =?us-ascii?Q?ESMQT8m2rktR/la/4kcEWYlpsBl/eWeBZ7rw6b7GlfoxFsP9I31RNHzwN0Dd?=
 =?us-ascii?Q?HlktAk1zG1JuRe91h5Z6JstqV2FcrnVmNzZ3ZHbA36JgseiTPRkWk2adZxS0?=
 =?us-ascii?Q?bd91s2TA5LuL1HRz6XsbC2qlo+lJqn8/t2uogRPfFx1T7jeG699wZWizxwbD?=
 =?us-ascii?Q?bCfQzvtE3ryZMBuAq5Dj2j04Z+D3fXaCQ9atblPnseZ4EzLKUrKNO4jOVFLK?=
 =?us-ascii?Q?CFloxO1Fq+dZa5wMeM9xuvS9eKa5AtLTut2gzNleCXjx/nAadE87mR8UrvIq?=
 =?us-ascii?Q?oWIKIwF2MyWGf6FwC4fC8Tn4TDaqLjiOmaFNx8+U1/yyQTcspHI36wDFJi1n?=
 =?us-ascii?Q?lhOS+Dw7WSAFGWTQRO1XxP2ljx1GcdR3Ub7JMhA1h85Xo4rhm2nE8B6UtUi+?=
 =?us-ascii?Q?uwLwD3gXEb8QgWj6ShI8QKHEsqny532bUv/VWktfgek+/q4dLLOQ7C7U/7SG?=
 =?us-ascii?Q?ZAWYmNcQ5b5Bf2P5KZvAcwgIgbhbBnatU1B9Wvfk04yUhehznR8uS6+/YZVA?=
 =?us-ascii?Q?D07k6VI7X/C1o6D/pKu2I0uAaPcjGoU5nn4havb9wTvfwp0/oZaWMA/5IsRZ?=
 =?us-ascii?Q?AGhV3xEi/7rlLgRV+khpoUKV/hgYD7w8K9CxfMkaFReewpOSeivAaIl1rQa7?=
 =?us-ascii?Q?dG8noxZxsZJO8WYymBqxFaH94gVjlEPJE4yGtaE2AXnPs35DysW+3G8nRRCZ?=
 =?us-ascii?Q?axdFoboZ9GBlSc9PjCjHHZgk91W6uLI/7p9NizZXCs9/kO0AFxWYBvNTgA+P?=
 =?us-ascii?Q?M60CIXuH5Ra0ZMSvqgMIdOdQ7568QkTX8TGVzr0x1MIr6LaM7dhQ5oaYmmGg?=
 =?us-ascii?Q?7DuO5ilzIFCLLmFw1B6ZILaPazDEyCm7lfj4XfED8Hl3qVGYYg89aSAai4hG?=
 =?us-ascii?Q?ZJY6AwaB8fCQuSy4sBUbzv6e8RtsamhhhaMq8dFoH6ZY84cYAqdqEOQLwJB0?=
 =?us-ascii?Q?qAMNHbuIHX2GRr98A5hIV1wK11YI07jVGYBDpPwFgMWuBjupJ/NJ0j0aHxTg?=
 =?us-ascii?Q?AxNZbypdlusfppxMHy1YWfDaYg7tTU2TD+eoxX+C572ruDqh+AIMrUxQJ2Zy?=
 =?us-ascii?Q?wLaPXU/FcWqLZzukoK4g7/MYjJcbLu4/LnSnEEDWI8Y/uA26A0yWi5KCCDcM?=
 =?us-ascii?Q?CNp8xEY0i9UC9DzmWbNTzF84WSG6hK/tj3TwjPcNr1aX3Z1MFTKgVS7gHgi2?=
 =?us-ascii?Q?/MVkKrcpsDSehTv5p7NDuPn1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c61d19e8-c18e-4fc4-8cee-08d981db6257
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 17:22:29.9342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 k9A7Q/n0rLko7kw0bdcJU1X5OKtzjEEKWhuiBC6NtY/Jq/HQl6IRBhRTKbEJ+1xiT05NAvn7FHHdZTNtE7Oq+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0079
X-Proofpoint-ORIG-GUID: sl9eoFUJpjoFlhVUESFzSpMOtQrAliLy
X-Proofpoint-GUID: KyEcT7cBK8KmbGBBoXoNh5Dblv9gIwvJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-27_07,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=747 clxscore=1015 suspectscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109270118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 17:22:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156393

This is added to allow the create-spdx code to create annotations
that store values properly according to the SPDX Specification.

Initialy they will be used to track if a recipe is a native type.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/lib/oe/spdx.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py
index 9814fbfd66..a99e54ff40 100644
--- a/meta/lib/oe/spdx.py
+++ b/meta/lib/oe/spdx.py
@@ -123,6 +123,12 @@ class SPDXObject(metaclass=MetaSPDXObject):
         raise KeyError("%r is not a valid SPDX property" % name)
 
 
+class SPDXAnnotation(SPDXObject):
+    annotationDate = _String()
+    annotationType = _String()
+    annotator = _String()
+    comment = _String()
+
 class SPDXChecksum(SPDXObject):
     algorithm = _String()
     checksumValue = _String()
@@ -164,6 +170,7 @@ class SPDXPackage(SPDXObject):
     packageVerificationCode = _Object(SPDXPackageVerificationCode)
     hasFiles = _StringList()
     packageFileName = _String()
+    annotations = _ObjectList(SPDXAnnotation)
 
 
 class SPDXFile(SPDXObject):
-- 
2.25.1


