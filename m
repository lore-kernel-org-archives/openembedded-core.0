Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B3CC433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 17:21:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.224.1642008060931481760
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:21:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SWFd7JGN;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=801136dcde=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20CFdWBq000668
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 17:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ibKX+dvcoh+zuRDU9Np7d+yo1e+JGefSe2lCRNH2soY=;
 b=SWFd7JGNNCG3IXlrErgqKVKS1DDehi4CiomEAHllyDBRS57dzemYGCr7lhhYucxHtJ83
 +xb9VjZ3cG8q+6oUiimrzOxyxHtMf6BhFAUPpwFudAE8J4KLSOb2j9/seRmMRLyQAdh4
 3og8Yzgd59HyHpEIKRfmWh/o01J5a9jabuuCEh39YE864wiF3HGnJt9E4bnkvduMFYBi
 ox3qOkdE02pdHzqp2POTrvQJUqBZk1mnPWURHgr49BokqgMRIYbx3vKD6q6KDYQ2D/oB
 0Hbyz0cmEBpVsW5qLj0pkfQfuTvFoSIe0njDSOgWx1iTcDRCScVsZHZLRINb7p9AhC71 vA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhtf00bnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 17:20:59 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20CHKxCj030954
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 17:20:59 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhtf00bnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jan 2022 17:20:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkEwRxrftcDIK0O9ChMa/7iOgdtSFLhpowiZ9zyT6P76P/Fd8xXRMSQXkuzE3+NZ2V2MZXl0ucnCYOhA//l7UEl1Dem7J8hYCz/GbZ2jX2C4OMuJ6hx0+iezafkO8ygAo6wj4U5vKgG4Ui2nO9dHSCGrbrMxml1T2It23R2GsgCRC+d/V2mD8n/crWQGJ+rtBUyiE/spsnKMd/gLfxzD1OqIiQFlC6jWspH2Kp21jg2ZSuBK2YHTdkAaW7mAuSoTFNDqGrj6ZzYZ+Vmpa4nuaeR7QNAiJZSBlCFen1b9M7iRObGCHqI7zFg2sVqqIgPtn44ulRpsRxGfh0zhAue0WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibKX+dvcoh+zuRDU9Np7d+yo1e+JGefSe2lCRNH2soY=;
 b=L2R8rtuIPqc9ESOuHFKeiHvHKasbHzCIzNurywEHkLPHseWobKgaAwng3JbCXzi5Q57F2JO4a3IjYXv+OA6EG36l9y9wVGXO0d4obrOXxyB4zuymk/4Ia+TJgA6Myz5o+eOA/evE44jdtRfky4p0sV0bZbBePJGGLITUlQSMPZqLX2RGmc3BKa4T8e8ikXPwFoeOMImjUJZCFOVY2aXp1tk+17eBIxjaJ3JkahZVTi7x0iQQLJrBfYQUkbd12tT+SVmUUCq/vQpXHCq/FjCjpzzOjx4kPSweHETSB/SLywpnSRyGu8YOs9yfuqNPGePV/hxVac2bt1T8dBx7vIdTbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB5139.namprd11.prod.outlook.com (2603:10b6:303:95::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.10; Wed, 12 Jan
 2022 17:20:57 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4888.011; Wed, 12 Jan 2022
 17:20:57 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com,
        JPEWhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 0/3] Add support for creating spdx data for kernel
Date: Wed, 12 Jan 2022 09:20:38 -0800
Message-Id: <20220112172041.143485-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::35) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44167fed-d948-479f-2f26-08d9d5efe558
X-MS-TrafficTypeDiagnostic: CO1PR11MB5139:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB5139BABC6427520A1B4AEC4CEE529@CO1PR11MB5139.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Omouu4AgEm/hVce6y/7W3wVLxfLdgay/PIqZzCWxRqmFitf1ISOKuTc6yC2FFrHzP/+KJSaMROV16ExMBDluzMw72+XitiDZr2HPIpzTbRXdyTLH8jt9xRGZIcMQDleS00zEN3QQ+dm9F7Ncdu4pZ7IN4QvYA2/wYqnuhDWRQlbVoE4IJ5AwyRP9N/WUwGG37zJOBJg5Cq0UVvcdgtmyrxzWhz+NMJS2LN5bm/p+wG8Q8GB7xFYG9M78+XOpYO3Iet7fe9kfH2pMKBzNcvtY2NRE8B9jfA4shbhqji5AuoReaa0XPQUMiziJEPWyZpVlk6D5tSofgV1Qn9ltdYLyGsswGM09bpPCfsKVnAsuH6cB29D73FkLzAPrchym+jlP1Me5xPxxUzrnW3+hrNWyMABmU2659RJ+6UNkdL9dFXfz/6Gp2yFEw26Q454Cv344gJ4lZkcy6s5TiSaILORkvfwIF+a+bvf7XIdKGrFeP8wZYLG62aeQExIy9Ae+7ysVjjA36Xly9EvtvgI//0NluxUBqANarewBUpbL4LVQbejYCS34oXPoj7Pc9vYfb35fHtDr7mT15yATbqgQpo2aNWGBPWj3d2tZ8iAudBzVA/UJRqvw7pGIkQuKS33nVP0FmruYv7znMrl5CVu8xqiBRRXfptVl+PS5JFq2AS4awg8VQJFKoCWnW9DUacg0awGh4REyeREM7zQFh3jPkfUxbQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(2616005)(107886003)(1076003)(38350700002)(186003)(38100700002)(6486002)(6506007)(52116002)(508600001)(66476007)(316002)(2906002)(6512007)(8936002)(4326008)(8676002)(6666004)(4744005)(66556008)(86362001)(5660300002)(26005)(83380400001)(44832011)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QXvRmbm5qpefuwMIYcUZcQhAvmtgjzE/2bVsFHXnxGpj9Fm8Zd6aLXxwTGC7?=
 =?us-ascii?Q?nw8Ck/wungCVrldRV5yR4HjGYBZUfLBu1XJjwSMU92tAisMpIIwQXmzDqxae?=
 =?us-ascii?Q?M4jyTuR1qTTKJOAXewuaspITLQ0B7qOhiVBwYkFzu8nGzM8FefZrft8piUM6?=
 =?us-ascii?Q?wnEA+mxQSlWvqn7ZwSXn1DBduqRGlmOjbvrzqAPNflNYtzh7q/RTkUgRZcPI?=
 =?us-ascii?Q?ySpJqLyBiV7T9ITiWt/L9qT3XZGjM4qkfjLCnQs4Cr98uRDbJFd8aE0ya8OR?=
 =?us-ascii?Q?W8oMNmxCBmXH/BkQnkMQf2PFbvTIqygH6vFYu8lCouxDWpkFwryKf4dJYYI8?=
 =?us-ascii?Q?TsZSeOaFXNt9mn19jme38zuOIZCnjPcksCesxsVRWm7M4gBdmICuwhKVF83D?=
 =?us-ascii?Q?vdK9yHl3vC1SK4v6Q5yVEOEC/NDq4indppVNq6jiw/oC2R3H3zTrj4csNKLF?=
 =?us-ascii?Q?rXo2tS2GJzXDB5pRP1mHiH64r2N+bURCu8dyxLO8we9OJDyBRam401vQJ5q+?=
 =?us-ascii?Q?r+TthswRqyuyatWG2Yn8v5K8wYz2uQ07rMGbOvjGQcQZs0wWyx0/rHLwN1Nm?=
 =?us-ascii?Q?BmWH2t2rf5jqGVxEe5BH2pTXb1ygV/RadXl5evNhzLdxzSukeRrLeNrgQsAJ?=
 =?us-ascii?Q?gpEdg8YoVcxGPXEPj/RJoo10PdxvPhKUH8mGJKwNFm3lQYZyyXYmqJgY8M3O?=
 =?us-ascii?Q?M8e3zBvrFNMua9G5HrBBhPW/XKOCpE1lgg1oIdR6nZvl/zoVR/pJH5zcU0O8?=
 =?us-ascii?Q?DCZZP2tGCNVWQh7zAhX0jt/2OWz358TxbgDC8HNbz+WbE9dlblzoH2SKbNjt?=
 =?us-ascii?Q?1TePBDzRKvbitkhuk6DCvzJuVclFx8JXDAedH/DQkiLzok4FUuE1fBVphqlA?=
 =?us-ascii?Q?BKef0XAMmTGchJ8AOHzFS3lztZCt4iDnb1QfYyUPPtIQ3Qc9MDIqZgfE/ISK?=
 =?us-ascii?Q?kOwnE+hNWrZ7Nui+UOkpM1WOmZ2Du2UfkExrMVqe0cg6UmWl7aF0noH1IhiM?=
 =?us-ascii?Q?Q5d4ZJ//HXSzXLvwUMoK8Qzsd/3jkU6fekfjNsQ4w/qUH8Tn52dJ5vRel+oL?=
 =?us-ascii?Q?f/UM2PhRiaYbQriAvr1FdREviD4EDObb2SonhBicaWxwnhIELTq2i9/77gE1?=
 =?us-ascii?Q?nPtCqurkDzHFQLrdyeOafn6LrzbCdVv+hMJXvRst/HrWR98W0AdnCf056pK1?=
 =?us-ascii?Q?1gTSKlLwlo8rZENBdqVuqQA2Avw3POD9KfMDM/hpplO7iu9z2Jem0uoymoad?=
 =?us-ascii?Q?956VJf5zAalf6k81ENV1MI1mbvc19s5GbpyW3hupLCU4YG6zOICKR70oavLr?=
 =?us-ascii?Q?nxoa12KTIPzNldG9jm6Tyc5qxT5Tp2i2CM8JkyGXLhqLWUdsjLl8XeMfOUb6?=
 =?us-ascii?Q?FSdukh8+WnTvf6rlAwqcgoL10TOcXQmMi7KSQn7bdGA5v5Jo0qdRnzY17ph5?=
 =?us-ascii?Q?LFpGNZNLhUuUkEK9Q1lgJHcUYp/jOI+ANnOAi9H8ry9YnGkvZGgg6IXfuPGh?=
 =?us-ascii?Q?8lMptAnPt5OBduyN3vRcmKr+uFpRxFgGFA+Tet2/af4OaRrzlLM/Q2tT0B4j?=
 =?us-ascii?Q?HyQROZDkxEsHxcPSHJnWFmn2cdhTnYROn8eDMsikiorz9EZmy80X6mNlv1K0?=
 =?us-ascii?Q?sCbWRdzYKVivi0pb2sbVbhs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 44167fed-d948-479f-2f26-08d9d5efe558
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 17:20:57.4109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cCIyyoS1aRWltVct6PvtoAucoINgFwyDtmdjGKpGkb8e5kVeiz/1oqg9kR5y5umqYN50qQ5D008p6W3B+udKLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5139
X-Proofpoint-ORIG-GUID: ea_T_cfiWyuM39qj7xaSgrWtFQ1af6er
X-Proofpoint-GUID: fVlPfuhs5-obT2Juwi4EFpLic9QedQeH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 clxscore=1015 mlxlogscore=822 adultscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 17:21:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160492

This change set is ready for merging, I have tested with edgerouter,
qemuppc and x86, in order to check different kernel types and strip
options.

This version creates a copy to be stripped and deployed in
kernel.bbclass, if needed. The unstripped version is installed so
the package.bbclass debuginfo / extended packagedata can be generated
correctly. This is the data that's used by create-spdx.


Sau!


Saul Wold (3):
  create-spdx: Add kernel work-shared source
  package: Add support for kernel stripping
  kernel.bbclass: use common strip()

 meta/classes/create-spdx.bbclass |  6 ++++-
 meta/classes/kernel.bbclass      | 44 ++++++++++++++------------------
 meta/classes/package.bbclass     | 17 ++++--------
 meta/lib/oe/package.py           |  9 ++++++-
 4 files changed, 37 insertions(+), 39 deletions(-)

-- 
2.31.1


