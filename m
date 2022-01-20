Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 528C6C433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 07:09:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.8687.1642662562275199542
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 23:09:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hUPxFp0u;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8019647b9b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20K7787N004909
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 07:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=c3c6yreR/qknshvij6opM8bBOjQUlv+2zTFuUN1X+ok=;
 b=hUPxFp0umiHEgpqAWrzHWIwjFhQx7kmUB4BUVefyCNft7ly//197ENyOqH65ClJr9XQZ
 NH+ST75/usqH964gist+Wx6y4nH+/v18v3VA0L0nyvkOGzB+tKP/eveP8fcMUlg/M88Z
 arC53CxgCSaFBzHc97r8V5X+2J7dzcIXgjnd8gFj+tlPT4oLfqGlK8kGWLeZFJWtmSBx
 xmX5T8V78RvqK77umz9GFi4bfdTQ+nc1F14L6y5ch7vX1JVcgoU8+F3o9mtR6Y+P6+bb
 Kh6Pq7gs3ExvmA3Q2cty5YYYnwCBjUe0dPoxc/a2nEX/Ug2VNywBefBSSDF3LivbKl1e Uw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dpsfk89qc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 07:09:21 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20K79KH5008968
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 07:09:20 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dpsfk89qa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jan 2022 07:09:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yd4Y221qrz7p3oKgfkbF8eZXnzHndMJIBpA3QFfjWkcev56WzSM0opxyv+y1TNhzQOOjfT25oSMPevh8jqKBGOfzRUTyOWglJ5b0cMxZao+iXCptrVHkdxZN8Tihab39qhVC0rpNyzJP/H1pcB7zS/qYQdiF1/8zrztQGmUEn7nV91t93eNoy9y8tx/ShzD3UUlDNZlIhVAMQMp88ft6HYOYLXhorEvkA0UNCJg9RQpt9hsXVJGl07qcxxVjmCaqwq4dYTDandIGpBWpcFFGKpq6UUVWnulzpPSC4+DNOYwYoXqxP+DGDuM3JcfXItqk0MJWUKZEmwYgVIsI1938yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3c6yreR/qknshvij6opM8bBOjQUlv+2zTFuUN1X+ok=;
 b=gps4akAnmrjhYNXp1ncoo1SRdi9ypQOzNzf9+cuyh3pKiNfk+ILSWKboT778PS3pN830bmh1nKdldf31SuRAEOX5dSEbSbrbhtiTQz7gfdzAaIMZkTIkVGz6QO6fxhIkRnkLTrMrUHfQRy0NiehqhLppKrV0BpvsPKwdPhpw1CXyjPXxdA2jts84KS8rQ7saQz47+zXGC2aFUJqBT6UrzmlRcVXbxhufPxsPvdb44ngLiarNUpibdP1DPWWGsY8tYzLTtxBV7h5Rt5sRTUvYBgp38n95MwCJCGub/rSBLUqq061xwvrL0fg+rYnm8aG5tQDlzZQ8/QoRLwd6MrcdFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by CH0PR11MB5428.namprd11.prod.outlook.com (2603:10b6:610:d3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 20 Jan
 2022 07:09:18 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5cb5:e426:2e48:17ed]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5cb5:e426:2e48:17ed%5]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 07:09:18 +0000
From: Robert Yang <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: jupiter.hce@gmail.com
Subject: [PATCH 0/1] bitbake.conf: Add BB_TASK_NETWORK to enable task network
 globally
Date: Wed, 19 Jan 2022 23:09:07 -0800
Message-Id: <cover.1642662353.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::14) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b168c4ad-47d5-4445-8986-08d9dbe3c6a9
X-MS-TrafficTypeDiagnostic: CH0PR11MB5428:EE_
X-Microsoft-Antispam-PRVS: 
	<CH0PR11MB542852338CA1AEC302087579FF5A9@CH0PR11MB5428.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QB5rIG1aeGrXMrRYr1VVfqEoFM+tV6nJ+mGfYlefoExLQRtRLYu90qzsnFgh3v32QU/6UcWMk2brer1+w8IlcZr+DyjNRchDO2urn1AA5puD4GFwsnksDPkTOfia+5YH28BOgh3/2cCAoQkgvN14cGlSN1gXG6oAcJpi2MAA5Ja/U3af/8mghQLKD3i1QuKCoAXCP6ez8ArDUbZjPpkdC56YegLjz7aKHne1HBsWgDUm2BfYtHqTDpoJpSC5Jb0F7skomnZWI97SPeBehJ9NWgh1b7w/Nm6A5XZCd6ksu3AfstfRz+8r15I9pT4faxrWAYJI8HhanDXTMsPWTnhV01/+oBIjXGZo+Z/0X7s2/vkywhlZfazuYXZHPaLGwkdvZqLfiuV/OV4iQhFKq9ILY9dfplKrxLAh+J61MJLGY9Z5EUiO0QvvXkwhu7IQKUTJx/2/R+D2fX/dTjMArku0X/wb0weNLcL5aDXIz6DKF2A5ClHv0CTIox1Q0ceaLTndFTfDNJ1Ot9Od6rQSz/qldL3HAsYiy4LBZXENTJpRep4YJ2AGH9A4RuoO5VUEF8bcjWk2pkBGZ3QL4Fr0e0LdyH6aJJ/3SJFSAanPn0UU8yLPOzswuRKC77b2F1b4d3RqZkpSfj80gvx7DnIlRn2z8ubf8qAy7nN0/UOxaKYkfi1BZEekW5DrpOppT+a1VlCtNq33oCUf2tHPxsjM0LgeN4o+0Voo1nhQlqyI+0d3m7Varc2D9V5HAIRSKPJdpnNnEDMGbZqaYnpTNiyOJLApCQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(966005)(5660300002)(316002)(6506007)(83380400001)(38100700002)(6916009)(36756003)(26005)(2616005)(186003)(52116002)(86362001)(6486002)(4326008)(38350700002)(66476007)(66946007)(6666004)(4744005)(8936002)(508600001)(66556008)(6512007)(2906002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?54oanPAHU4SQYvxFZi/BKdfjBsflD2Qk8vAsTSqOhwwsv5V2SCQfRnFZhHQk?=
 =?us-ascii?Q?p8UEKZ+thcbNnyTDaf9at9Vqsna1YtKcxiNgLV+5nezVcdoZt4ReSh0IBOs2?=
 =?us-ascii?Q?y42ASvjZhVil6giqBvNcSP4wueSBqU/jYg6y7/ZczMLQGqBmXWffG+pUkY7X?=
 =?us-ascii?Q?8eZzWCKTie/Nuj1rb81iPwDCBXlFYlvxBEua3B3S6+FFb+BLf+7wCczfOaKa?=
 =?us-ascii?Q?fyqPb/Y1Tv6Q71uU6mbRuDNrxBtnO7fYK1SeDH/DTTN/UszhWdq8ZMqnSxXt?=
 =?us-ascii?Q?kR4709dK9IYTzH3PHwB7aemQP+LNk3xpXeVqcz1RDqBRwuC1y0naj86Jbj24?=
 =?us-ascii?Q?ky8W239SrmFp+yeeevZa5fKLWlw9cF6Mzbl4VQaw1bYICZSfRcCksby3FXFE?=
 =?us-ascii?Q?5YRoK2pudnIc2fg+6QZ8wlOhOzQlnzNc/prkqtccuvC1VnXsb7w9VfunfJkX?=
 =?us-ascii?Q?yCI++8nh0o+Bh3UtVLxurPlwejZNCLKd3VzOCqm3JgzRfBy2edicmDTYl19r?=
 =?us-ascii?Q?2ySDuEYHH5MgX/rWS0KfE4b5ZZTMHCK5uJoRMuThTtN3Eef4HY1iI/PBGcDR?=
 =?us-ascii?Q?jFzMQnlzRynaec19vaHmzReil6ejUHtLKMJ5TyZXOPDroPr8XzHxjrBbc8xF?=
 =?us-ascii?Q?PmPip9LkH5VsFsTP92YNcuJJ5l0hiDoQlhoaUdFJW7G+509aYFsIsmlX0efr?=
 =?us-ascii?Q?PFcbwF2hhSdlTTLIDCnQWhBCX5xBMyhEtRV5KbZX+OEEmGURdWoK4p8SPTWt?=
 =?us-ascii?Q?osfxWNjymcQRpiod6dJsgjOQkE5eo/mgIpKt6mXyuY5NWS3AUlDpJofKCn3n?=
 =?us-ascii?Q?X4t3tWQ7CRlbXPC4MPM8f8VuLPgx+/bGJn86w6lIwQZZq0b1BmcGPeUDaH5N?=
 =?us-ascii?Q?fqyzwcP4sEL83iYHsJBd+/aGMfGy5jlxPCn+YlOlI3amzI5slj+mzuTRX4tI?=
 =?us-ascii?Q?et5fLM0XUysQ+VJqzR1gDuqbpobJdJ04rjG+xkFFXa8AArB91HpqOpzAxAfl?=
 =?us-ascii?Q?ZOltqYItyPGxF7IrqCtR2tFoX0xXzzwLfPZsqCPrGND21gpiHKOhZKg0H6Qp?=
 =?us-ascii?Q?AzCBg9vAlZOl3H6PU6sUoGAWJimJIMOkqPK0idXiS5zNoy8ZsJFrIQqFjRsl?=
 =?us-ascii?Q?OQAxd9vdCjseyywCw3FIIAWu+dZrFM7f+sSBhB4g+yAVQBGuXh5HVIFNBOu/?=
 =?us-ascii?Q?3gCdTi6RfKyffkESg89x60i96MWk7s6xeGqx2hFudWMnw7727pTgNMxbrzGF?=
 =?us-ascii?Q?qhYZUhhnKGXHA6OmsrQG9cDZJ0tpHoCyiPePqLcHhrLO6yfaVX12Uo+cZeQu?=
 =?us-ascii?Q?RocTEKzVwrSrYkUnu9LXqKC1osERkDiRO/AV1k0fq5CwN+KFsumnJfi42I9L?=
 =?us-ascii?Q?C80rRV1mJkybhXit8d4M9QlLDk0mFniAroidFkOT7DJSTbX6nv/DudD0haYf?=
 =?us-ascii?Q?NIQNH+IxefkcWrJmR2DC1sy/rGAtp7aAESI36So+dZgLy+cECgBwC0xF5IlL?=
 =?us-ascii?Q?MMf8K/cmo/YDbxRg6vyPnhZytGKgF1AmIYGy7Hp/TGoIQJZx++lgIc4QnrMH?=
 =?us-ascii?Q?mBisGxgA75K1i6l5ihmQOcF5LMvtS20UYnaxY4TfiFBuhozj5r5NxTKIH295?=
 =?us-ascii?Q?42z6HnSTTCVy7uBQ4k04Nub5c49I857c1P3YNz7RFDjbTH0yBtPu8+C0Atkb?=
 =?us-ascii?Q?vpGHkPu+IqkOPeYckMz5YEVLis0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b168c4ad-47d5-4445-8986-08d9dbe3c6a9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 07:09:18.7944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 W+VjKbVpr3qfBvY+F5tTne13BfOre0gRE41IYsOc/4+duRlVwNXBFZBoZ2Ac7jeanOWaWgYiqx8h/Doul96LZxbwDZRa2CPxEUDgQxWMvbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5428
X-Proofpoint-GUID: _sv2qCUJ_ZmxJzcapudIoamGGR8cQQLS
X-Proofpoint-ORIG-GUID: clWJX3Ak47VFXSUvi1mNOLAHASwRnQmU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-20_02,2022-01-19_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=939
 spamscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201200036
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 07:09:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160751

The following changes since commit ecb61b36938754cf925bf58aad3edf7346deced0:

  build-appliance-image: Update to master head revision (2022-01-19 23:04:05 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/network
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/network

Robert Yang (1):
  bitbake.conf: Add BB_TASK_NETWORK to enable task network globally

 meta/classes/icecc.bbclass |  2 ++
 meta/conf/bitbake.conf     |  3 +++
 meta/lib/oe/utils.py       | 15 +++++++++++++++
 3 files changed, 20 insertions(+)

-- 
2.31.1


