Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3115C433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 19:08:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.9827.1640113714247353883
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 11:08:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=dz1sPYfZ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=79896d8bce=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BLIg09Z012784
	for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 11:08:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=2A0gHhIvxaNiv14kG/+7AMxulLfNUAdh5A1O+CKTTa0=;
 b=dz1sPYfZysMPESd+6z150t0s3fp43ZVsbTR4nh1FqQgHNHpAJAcBjhhv+bIhJYPlhoKH
 zImrNMA4dC00vbQLLPx/hqumdgjEsv/qQdidOZ1K+SoUgdkiZusWJMufWSilIOkDeEjz
 CpPdok0eribUlHoOQ7LsDRRcPtbwffSgHUz3UVnRhDmj//PJHfutIRYo7uTT620S47CR
 Yj5Iu6u+IjxWQGTjGtZzpczwPIua05MeQWm+vBJ7wS4v6GL2PQHOc6RuJhnsoQnbBgc4
 YEpm7tnvurTp0QOzvmghgCDoyIuR0P/cRyl4OFJas3FDSGhU6DvX09OWt29LsEvucrt8 EQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d2rdah7ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 11:08:33 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BLJ8XT0007646
	for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 11:08:33 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d2rdah7ap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Dec 2021 11:08:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSfc+3WFBZxNx+UFXSw+i9C6sN6kJ9XN1D52uf31yTpo8JNZuHyCaUPS5Rn6SGYzu6SPX8KLFpGTwZhjEHv8YosB9pQ1ISGkI+y7Otxf3vVamQBDKxhRrZ5aJyDC7H8IdMnMURd/DX963UNOh+SEDn26A6bGMJNivFPCplaam+s5FHj0LQZYPXtOHPq0B/Q4I4cQEC5AnN/UfrugVxsg0ESPlzemRv4sWHYfb7h9j9tyjjPlnYAn13EL8IJHR8SfZp0LEpocZK2qc0mS5B0iWhP8xLDIZn4wu3jK6laI10ykgorIX0PdePpichvf8JKsmPySSnYQQ1H4pO3TOQVY2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2A0gHhIvxaNiv14kG/+7AMxulLfNUAdh5A1O+CKTTa0=;
 b=AcpYd+1DIwSFD2UYT3mcbz5hcfDLjMKU88Cq4K3EL0T1Apz2uXs7HuzJYdYl9sv7960jRelqsibkQpFh2L2zRe++ToP3Xio4UUC2Cjiwf5uuOL3jG8MR8BWXpudCWwrCfBUPzj4oYEgdObmFxdA8MtlBYTdkrOXwC/2o/sTH+WAgoF7DYJkQCbS6zKTRnWLRTxigKBht8uAtb3NViwyb6x8/kZZchN8ZZucKeX0lsMP+jCd6VNWFckscRbRilPcGPSx3dEijMWdn8v/5bIuyQXgPng4VMxUpJ1PdgaupkCEnFOTD9G+2B4VyHImq6fv+Uthxb1JT/n9EDp8cI+OB8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW5PR11MB5930.namprd11.prod.outlook.com (2603:10b6:303:1a1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Tue, 21 Dec
 2021 19:08:31 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::119a:b2e5:c766:f43a]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::119a:b2e5:c766:f43a%5]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 19:08:31 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 0/2] Enable package.bbclass to process kernel packages
Date: Tue, 21 Dec 2021 11:08:07 -0800
Message-Id: <20211221190809.89882-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::11) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc1b4c7b-b045-4123-5e3e-08d9c4b54762
X-MS-TrafficTypeDiagnostic: MW5PR11MB5930:EE_
X-Microsoft-Antispam-PRVS: 
	<MW5PR11MB5930A83326B340E7C0364EE9EE7C9@MW5PR11MB5930.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FoZEQ18ESHrd7v3090G5QZ1pPicEcGlR0UJs32vKMF+at30R9/M08lY7UelmWS9pARN/dviflPLgHvE8KDLSpszcOZD7mejKw0OxvWtveKZ+ud3uMH7EnaeIO7PhHcRxM0GNF75jXREP3+qLzOxPN1svvY6jNJMjQ9oKTeHQ2ZeS5Qd8ytol6SF6DrLN5aZp1l9iuiB00s7QWJ/zw3HqVOEC/nAI+F0fMHMqR3KdlQxAq8yGW+h/LSVBgwrJ3nU6kNqk/czJTNCd7ve2CFJM7ApjWwkyrbpFBYYzYmse97DIuIQyFrMGoThzeObHmxcn8sihRi2eJ0wZ+GOTz0ek9y0NWs8h+aluBHrMrfmyU+lXZPrAvV763LGUgo7vfbqmHO1OGYchjfH/jtZRSAh5r+zHSSeAoYXSkQBSBkLGtCJNGLkx+QDmuueNc6/mft1hxkg9SD6AFSf9UiuPPoAgl++K8WiJKMImg8PI7o/SgIk6KY+CtD0bEyh2vahLZe1yZP4kNGWp/P3KviERMojHcz2hxvE4ShVtQZWFYl4y6xHguMRhxhXhBWBuUEHdmNWuICRtBbA3W7mJ5vgOVsCkBvqRIYJ72ghyLzlWnr10BBc9sn1vUTPL/BKiQJGb0c3uWiEKskXpqD3yppMV9QTAr1f2SFyPoQf7fiopMjebfdyjn2j+Z+My5+CzdC4NGgQ8Awn9czeJ1rhzxEbYD/azvQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(508600001)(86362001)(2906002)(6512007)(1076003)(316002)(4744005)(52116002)(83380400001)(6506007)(66946007)(8936002)(36756003)(8676002)(38350700002)(2616005)(66476007)(107886003)(44832011)(4326008)(38100700002)(6666004)(26005)(6486002)(5660300002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ch0IM1IWINbUdBoMdyR1DK0sDrB1NNGzdlQPu1zAq4DZcsyhzFfJJTnZMt4o?=
 =?us-ascii?Q?rCdKlSyL6CbDAhGshWyhH3jdCXm5ZiDfuEassbjDGXVXAAu9y9JmKzdv4KJh?=
 =?us-ascii?Q?ITIyVD16A0KIXkioiImOs/nI8AKvdmGg5tKEdVm94+CPq5Qi+HS2+0JCZr+c?=
 =?us-ascii?Q?5BsMM5qRRxeQKu5RoX5a9ZM2BOPNGxC8DkMmPcLo8Aej0IKp+rEFKlIu+rEr?=
 =?us-ascii?Q?GsldomtKHkAuG8XtMooks8aX2HimyhqGut0m5cbz3ghWnweADY5RfCTkEHq4?=
 =?us-ascii?Q?A8+WFUmuhNqjkKxcWYWG3QIg8gtFOEt8nhv1j0DGWCUWsR0JHIxddEsx+AEf?=
 =?us-ascii?Q?MrCOUFsmZ0KPgWXQmMFURYcGnKLB9NH86v6iZ7albgyK1ZypATYUYHySJvCP?=
 =?us-ascii?Q?F/HAqNHAXgYDGkWtjvOxPVOyJGDFgR9BP7CMBZ2CCeV/gez5D5YwPNhPaEsz?=
 =?us-ascii?Q?iOD9ljD+MSJMIX7mZdI/V7cImUHq5M7NkLyyL4Pxla/h0pEyNesihMB6B8g4?=
 =?us-ascii?Q?ntDwWJM5QdP7ExNbmb1jp2voQ5VaZWhgDWov0TS/rxYAFGadQ5r33GNpo6uR?=
 =?us-ascii?Q?b9wH0VcLwT5e/l6jRV7rYRzKZU8JZvGLyJ88ZamG6EXmS51noqJXekJee3Qg?=
 =?us-ascii?Q?A2Y2QV4ILaC738qvbqQMmvGrDFNdcWwCF6gVkv2ia0O4QGZgSaA9xhunYlFp?=
 =?us-ascii?Q?Mc8t19uBoabcuAHXHjQrCw/yvLpALSlpAl53yKbYoRPtZLmx0aNkIjhnybil?=
 =?us-ascii?Q?JHQWdFJq80qWodOj36idUYX7U0vod81Ue5p5XlVONRClymo2wi2iQnwwW6Q2?=
 =?us-ascii?Q?A19vslL0gSd9C5wZW1RQXyfqZ93bLFbzaS43NLNOttaQURxi2GY//1xk0BEt?=
 =?us-ascii?Q?WhVVLhxY2pkcTf4NCbC4mQfiQzvL81ma9Ktbxp7uGgVcGzOB4m4rduu5UaY1?=
 =?us-ascii?Q?Po5c1CpdH5Y8LCJOxCTayW8bZburG98GmfpNEz+1Y7DUYAv84yUnaKyqc3FF?=
 =?us-ascii?Q?Rdy3/dxKs9RGznNG4KSOFqZXIbmTG21fDqGP3w7Iv4bu/vW6S3iH4qSrUvqJ?=
 =?us-ascii?Q?OpcCNy9KztfFUifvYI7+J1GHWkQpXt6vzrcg+zejAMpdGx6cqPInXS733pjp?=
 =?us-ascii?Q?HjcMV9ixG0suUSHYIsMLd+F6lqMQnvZnu6v1XNXurqYdIA8pWGrTivh1CUW0?=
 =?us-ascii?Q?oCibAttzeUgw7hQJY4LY1lLXr1gK2dSfXmWpbanHh5/UKybHp7/YkwROapwF?=
 =?us-ascii?Q?BiJVddU22DVdJ8xizXlug3ESxPQoaWvfZE+yAYWtYB5N4tpp12bczPwCKDte?=
 =?us-ascii?Q?6MZAOun8Vtd6FN/I0qgSRT2QHd1sf0kjBY8BbvyueQyF46uBSHJfeuo37Rva?=
 =?us-ascii?Q?yx9Ja6b3RTYpEXZVU54B5DzN7OvL2c5lqOV8N4nZBK/+J8cl3eJYX5v6nT8T?=
 =?us-ascii?Q?f6WohzuCeYdLAhmpFa8Q+1qm7xjBzy4e+Z6Ea5Froc9oixs3dOw9r+i0KleM?=
 =?us-ascii?Q?HCAa1HMbJawqs/3Ldi0qWdZlvbfhL+Lam0ZegLUCUCuBb3VeHfaliy4DIdBB?=
 =?us-ascii?Q?E0KY3cGKwUbeCrCWKPCxsCnwkS3d+DvbssUqwX71DtGyc5wHKw5HVHMDoYyY?=
 =?us-ascii?Q?NB9wzzkdN1SHplkuDfN8pHc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bc1b4c7b-b045-4123-5e3e-08d9c4b54762
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 19:08:31.7619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 y0YIOheJfM2yvjQZrVUHZ6VK0/DggtQE0YBGn93NdZkP+DaPcFOVq3vxbBMpdhSJ5bN2axDP2stoalOT/8JNCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5930
X-Proofpoint-GUID: miJJk_f2QZEhPoZypIcmMG91RZwKvuJG
X-Proofpoint-ORIG-GUID: aoLaXOiRCWQGsJICkl4Ye2fvvWSKCgES
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-21_05,2021-12-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=522
 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112210094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Dec 2021 19:08:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159929

These changes allow the package bbclass to process the kernel and 
kernel modules so that they that extended packaging info can be used
by the create-spdx bbclass.

Tested with qemux86-64


Saul Wold (2):
  kernel: add -dbg package
  package.bbclass: don't skip kernel and kernel modules

 meta/classes/kernel.bbclass  | 2 +-
 meta/classes/package.bbclass | 8 ++------
 2 files changed, 3 insertions(+), 7 deletions(-)

-- 
2.31.1


