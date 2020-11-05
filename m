Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web12.2968.1604612406519915180
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 13:40:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nio365.onmicrosoft.com header.s=selector2-nio365-onmicrosoft-com header.b=OO1LDDfQ;
 spf=pass (domain: ni.com, ip: 148.163.158.57, mailfrom: prvs=45781c860f=gratian.crisan@ni.com)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0A5LWtXX014421
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Nov 2020 15:40:04 -0600
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0b-00010702.pphosted.com with ESMTP id 34h5r5e3fh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2020 15:40:04 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcqvpxQTuWRBhwhDoeXI4x+vBlonhKpqBcdm5xv918YvwkwRVNBiExnhHOWy7rPkQkzFNpZ45oR0+C+R/+8P7hUvuwzSsqJjNJbtR8OQS0WNU8KYI+LpsGMLy+ir7rpZSdppDGAlGnHPUuJ2SELiTtsJ/JDOsQsxOdSGH8fT8XB42CsDP71j1Gvya1xdRiaJHQSGOaEjY4b8n0ksKpsQYbGr2mUAjQQME7Ir8q+t1Lmoho0VmjCjF+SofB3gYQh4I6FJiqkuue91mM6YAmgXMjmqtLjtEMrob7n9ly3m3452abqhx6CQtnbS6tR1IRGjWRnXIPcaQ7QgGYUMq8aOOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0bd0ens5ydMx8ePNksgTRAV+8wkQuAuSNZSfBua20w=;
 b=GdLjp8ek3YCqLuWKIbbKi+t0IXa7dS6T4+BA8Aj9C5ihK9vDFwBNjPScNVUScjPrlPLR/XRIkxy9VToOvHBGGc6BPQU31hIcSPboP70jG3mL2JQJETR8MxlRBVO3B1XnSy7uiQwLRe0NdeQmjsC6Lv1qVP8KJ9lu3+NqjD4HZFbenMmT3MhN1ICHS5UPpi80QyUMvWxl0Lam40mpLvBERJ/3wNKZmQ4duZ2VZdjCnDtg8y9CrTtlfLeEzHWIcgunOqmk1slEKhmhQivZpJk0brhotSsjNQtVP/wQoVOhmhcsZCIggg8KIwsvyFg5YS33unL5qVuD8vsSpS6L8MGuqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0bd0ens5ydMx8ePNksgTRAV+8wkQuAuSNZSfBua20w=;
 b=OO1LDDfQZXbtcN9twkKHpF8V+jLN/H2yIOUzyTVkJprlcivclLH1l3SASKeiq+gcproPyFKARizNXn6F1RvI8VVZu+D3/rOv1AXTOD+dpGDtq96Mta937ZqEROJdH6lYr3MwZQ9h1qCBsBc6H9X+DhbGrzXMFjJDM3YD3Gi0mXg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=ni.com;
Received: from SN6PR04MB4496.namprd04.prod.outlook.com (2603:10b6:805:a3::23)
 by SN6PR04MB4894.namprd04.prod.outlook.com (2603:10b6:805:95::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 5 Nov
 2020 21:40:01 +0000
Received: from SN6PR04MB4496.namprd04.prod.outlook.com
 ([fe80::cc42:669f:a4f2:c1]) by SN6PR04MB4496.namprd04.prod.outlook.com
 ([fe80::cc42:669f:a4f2:c1%5]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 21:40:01 +0000
User-agent: mu4e 1.3.2; emacs 27.1
From: "Gratian Crisan" <gratian.crisan@ni.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] kernel-module-split.bbclass: identify kernel modconf files as configuration files
Date: Thu, 05 Nov 2020 15:39:56 -0600
Message-ID: <875z6jxz2r.fsf@ni.com>
X-Originating-IP: [130.164.62.38]
X-ClientProxiedBy: DM5PR19CA0035.namprd19.prod.outlook.com
 (2603:10b6:3:9a::21) To SN6PR04MB4496.namprd04.prod.outlook.com
 (2603:10b6:805:a3::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from quark (130.164.62.38) by DM5PR19CA0035.namprd19.prod.outlook.com (2603:10b6:3:9a::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Thu, 5 Nov 2020 21:40:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc69092d-541e-45ab-8f86-08d881d35917
X-MS-TrafficTypeDiagnostic: SN6PR04MB4894:
X-Microsoft-Antispam-PRVS: 
	<SN6PR04MB4894F136512656F7F7DA0EB1FEEE0@SN6PR04MB4894.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BuX6CvskYMQfFeeop9AUZlBjvfl2HMPbXtMxu7emQbFRs66FIHZ1nwCU32cs+B3myc9W1dShoRmq+23zSRjnGahHAp0yhZNfeC6TQdHrQIMD/9R26w9BGirnnh3jPLWZGKoIGDqm09JKsUlb/SpGzcqSsC5QVVUHyrBp3kahLwd5Qj7uP1E8S/PsAiINjoaVpIBCFA7D3mWD45BBsXV+kLCFU+kTiKQZBCcrPefJISyj0Q9e/Bee+yunAkfNjxFKBzYBqHEdelvdSuqKQLZKWc4kCCmfzzYDMrrmnZKiFG35YcX8FiRHoxxjeSUtYq2D0I3TrUvqhedWObJ2YD44uQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB4496.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(366004)(346002)(376002)(39860400002)(66476007)(2906002)(16526019)(6496006)(66556008)(5660300002)(6666004)(6916009)(52116002)(956004)(66946007)(6486002)(478600001)(44832011)(2616005)(8676002)(8936002)(316002)(186003)(26005)(36756003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	QiKMkBDQ20lMQTadOBkBTVgu3IYCRfNH5pyqL7Y/Ka64/zKff+kLiggD9buZQ3FfPCi6zSvy9Z0KYb8Zm1bbdnEoaBovM/eO5tc/TWMSUDboBmsCy/cfPSBwK83F1mxDGOwSy0Mpw32Mo2GYKa8nzkvuoVtsGzVQE9/cZgqA1Obh830S8PsbnpeUWGnujDNMqGiC7fpd8/uOx0tErHfqEVbP1Aje17j/MNCNeP9XCwYn7NyB34b1SxqSulClLPlZdFZGLr+8U+ViPUQeCkfqQkGz/hth9ec2dAebzAZ85gA4ZeSXC1At/TzwVVXVh6VAUzbHyCaPKg/rAsjMJ7W2jJUVUMVswicByGaePO7E08kJA8hp4yUYQEj/8plt6AdilZ4JZ/aLQOIcohKtVEnrBztfwoc9/N1NKosCYKaZsO9G5K9jGbjvKYAfmkOU0NSPGFGzHguajxWJFjr299l9w0L8yuLPgES1ssTXL2H5DZtv7YAKvcZmHpmwtxNRb/tDfxW1Qhks2mj+xjbiJ94GfWZmPEdggTUSx6lNrgg6MY8O9f0ehPNSjlBFaUYPzD0GOpLT7PCNLmr6WZGVN+XGqprNHDA486ANVyXlG+VLni7Sae4k3tDEvIwEfBffKtHvqBuUp8OXr9ZfF9F958TxLQ==
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc69092d-541e-45ab-8f86-08d881d35917
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4496.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 21:40:00.9706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+ht9wg1VfCxx/wOIm3yeI+J56kw02F5dBldwWJ9OuXNyI03D+IsVX4NdtLOx7td6a3wVexQDe04VtX5OJ+vkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4894
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-05_15:2020-11-05,2020-11-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 spamscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=1
 clxscore=1011 mlxscore=0 adultscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011050139
Content-Type: text/plain

Currently the modconf fragments representing the configuration for
kernel modules are written out to appropriate .conf files and added to
the FILES variable. However they are not identified as 'configuration
files' and installing a new version of a kernel module results in a
conflict and a failed installed because the respective .conf file is
already in place from a previous install.

Add the generated .conf files to the CONFFILES variable denoting their
true nature.

Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
---
 meta/classes/kernel-module-split.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index 221022b7bc..c8ede26996 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -120,6 +120,7 @@ python split_kernel_module_packages () {
         files = d.getVar('FILES_%s' % pkg)
         files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename)
         d.setVar('FILES_%s' % pkg, files)
+        d.setVar('CONFFILES_%s' % pkg, files)
 
         if "description" in vals:
             old_desc = d.getVar('DESCRIPTION_' + pkg) or ""
-- 
2.28.0

