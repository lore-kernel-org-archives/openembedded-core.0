Return-Path: <xiangyu.chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE8CC433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 07:44:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.3710.1665387864093779068
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 00:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=aPnZ8bkW;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=72829ff8ce=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id
 29A6J3JH005360
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 07:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=EJVvdKdxSemZnVxkofPOf1M6XtJiZmIQBa9zRX45GRU=;
 b=aPnZ8bkWv/nQ6bav7LMbgn5MfOw1ofaZNVt+4JxV7t1kno2yCEjVbaBXkSMPwyyq2Q0k
 zIJ9mmj4LsGuM/te4v/5l3CnQcB6GrINiNEpb/uSnhNBNBntlUUPRSGfsKDb9H4KjC0u
 8P+qRbvQQruOf09XpKOxd/a+l8nLkFp2t2Xusdw+Nd0bucvq8wedRR7CeTq9L4fLstCY
 Fy6sK3Ib7YDEo9XC0pJCUPeg0VhZ63JPKjCnUO2/GdpIiwCEv+wqwzQjy7welJIaawrk
 zjN0A9w+VA++PCfh1bG2KqczOgCMoVCT9rWo0eRWmDOMRSgTmeykuAlA61cYz8IGUnF3 qA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k2ybs1b3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 07:44:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxbl0TqfRD0dV6bR2hNgP3ToQxfqf1sxqA/jJ7KwA+YMhYTMP3YH1aWawO0aU564aYC53Bbl0uN7Or7tvhPR2fn0eJt6tUH7hG7EUhMNPCXbBq4UhDTdOUHok/lzqL7bIPFBvq3RyL8lyvcOevO+hMKpvjsqP1n+85eOi6h3zFRNy2ZAa1kX1XxK16wH2Az77NansMt1pPxblE6p+AgoMtPjR7Mpv7IjB58I4c3led/Bn9VenghqADX7zvszntcyT/rdm7yGhLi6ebaDUH85UxceZPt7Ksm3wh+rra/mo9piaHGtKJTZgZqnUQWgrqCAFCMjt6sUcnDCQBPV7/+vKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJVvdKdxSemZnVxkofPOf1M6XtJiZmIQBa9zRX45GRU=;
 b=Fs+jLLiCHHbUJ8izgynL+dWVFZoK2nwbsMmzMo5ipvHwvlqFEYdMY/fCtGrWzaTBNNTcCsqd5SdVwoITZPNYJzqq27/HviS3GCgbAHzERmACxw57gvscTSJOnD+mQ37CWA6l7eDEA+SUOP+F9kcDTQts0gjAYzMiwZeadw+yjFG4f35vEk427DonuwQfi/Z/ytaRJ4ZodGw1jAr8u5jOQ3sAFWvHDNm9UKvZkSq11qN7V/8XFFOmSSJjPTW1JIQcREuiuR+PTTEdD0gJmYkWlofu6RdIIzWp+YVFn3tSGxz1f29pzI9c1UYxBKpTUxlx7dkGhk/+/fY35n2dE4YOqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by BL1PR11MB5448.namprd11.prod.outlook.com (2603:10b6:208:319::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 10 Oct
 2022 07:44:16 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::99b5:140d:8487:5f3]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::99b5:140d:8487:5f3%7]) with mapi id 15.20.5676.032; Mon, 10 Oct 2022
 07:44:16 +0000
From: Xiangyu Chen <xiangyu.chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][kirkstone][PATCH] Backport patches from upstream to support
 float128 on qemu-ppc64
Date: Mon, 10 Oct 2022 15:43:54 +0800
Message-Id: <20221010074354.224878-1-xiangyu.chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCPR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:405:1::32) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|BL1PR11MB5448:EE_
X-MS-Office365-Filtering-Correlation-Id: 845418ec-5ec3-4aa0-948c-08daaa933b6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QzzN3M3OD3q9fs2NCi0rRWj1hnmz9k+gG/RggX2XRx1BgyiJBOUfxVu+r9Ky+g4VjF2W0RkEnWj06Aig/o3VX2IkW13RvyqY5AKsMmjtqplbYW9U22KP6tFyaAyTgzc9nELOpl3pRp+e0BBTlnrvCvFZr91hxONTuDbDrbsSvTRaTB+pEG0pDS4yeaTTvIkOAAHVnjeb3zFMByZ4azEaqA/U4vPH5y37by6CnzUh4SLXfRzvVgV6vyDOSsreN848axYaTWIbM4L4vpTDH9FKPd6HuMC7p9DKfCyToF+JuSbVMLEgxeKn+A81Qj0ClbY2lV0aXNp9/G9XCje8kKyT6eHzs4xNLJvR3CveBAyNs/bft3aReLNKdgvF0ZaSgcfYLwViXzgAK++mGpAhzqBpBgFJb4Hf2QxKwlEOouCjJ4bSrE96nI/gNqe/YioYjuRq3G6fcWb+HCf/RORN5Jv7zpeP707Yg9JGWB3jnZr2YQoaLh01T5XE5AUv9pPzHFE/0vlOhwx/6pzz8tggmo+xxrT3mI9tf0kJnvQQ1AQAK0Qy8vUltKLEJ0VKXhCTnbCWzWqCGYaGBc/N4qKBhJvaGKcE/tnxhxJG4FryiINHPA18k7ti3RkGcoKVwBa/8IVxpxiCTsTJL5ZisZFgjpx+jsx7OKWLzRfRKMsd5K6pZA1Fjv95c+Tc34AchBpJ6OByQ9CsSX8ulDFT5WGf1LwU0VUSeSUW3NMqDDsU6k02DmPxddOZJfFHfqHGryFAvJTA/YB1jXz+DUEjuLFUrFLAat4zHnpW61pQx8yIfH8CDqsvTg6i6sMHtKY7lfSBsYXGXz8WGnEga4Yg+oj/7osWuQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39850400004)(396003)(366004)(136003)(346002)(451199015)(19627235002)(38100700002)(86362001)(2616005)(30864003)(316002)(1076003)(186003)(5660300002)(6512007)(2906002)(66574015)(26005)(8936002)(6916009)(66556008)(66946007)(66476007)(8676002)(83380400001)(44832011)(6666004)(478600001)(6506007)(6486002)(36756003)(52116002)(966005)(38350700002)(41300700001)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MlBhRVJHeUwvTWljWmRMcUwycHAvRHc2YkZKNFhjYUFHNTIybGR3R2ppQWhi?=
 =?utf-8?B?TENTL1NlTmwvVklIY0k4Z3o5L2hYenZGM0JFcVVaUFhDZ3RsSFV4NGdPazQ3?=
 =?utf-8?B?UUg0Zm84Yld3R1VPZzNkOVNjY0ZZc3ovQU5XTnl6TnhnUFljR2RUWk5NYVN2?=
 =?utf-8?B?RWt0YVBpZkVSblVJYSsvdmpFMllneGE0a3lZakxYdW9sV2dUcjJNWno3Tyto?=
 =?utf-8?B?RDJxMFhRd3B3dTlxVUNIMEltMFJiaWRKdFN0R1MxRXNza0xhM29XSUQxT0V0?=
 =?utf-8?B?dmlUYXl2TmdKMlVUVzRySUc1REtFQnRUakdlNWpEQnM0V1BMUXo1Q1FmdVpH?=
 =?utf-8?B?L1VlNnVhRDJqZy9HNXo3K2ZVaEpOOHZnbGxEMVpoY2w1dFJTWFlaL3JYWUZt?=
 =?utf-8?B?TzRydU54SG5uTXdubU41cFlhMml4OVJBT2h1bzRYQURwTU4zVElLdUViUGpS?=
 =?utf-8?B?Zyt3eVNEclJQV2VwcVVxT1JQR3c3dWhBMjU4VnZ5SkgxK2p5L3FzYTdyNFZO?=
 =?utf-8?B?VncyQkh5VFBsanI3MDhLeXZEeGtpbWZrV1lhbTlNTm1PNVRLUW1GcVdlYlBL?=
 =?utf-8?B?dXIzYXBvMk5XME5sWGxETjJxMGZ3Y2cyYUVjQ3dvS09XdWM1bHBvQ3ZEOGVY?=
 =?utf-8?B?OWI0ZERUdG9GMStlTjJRWHRHaXhFQUZBaDlNTDFCbk1yU1BsQWtRZSt2bTRE?=
 =?utf-8?B?elRXMHVMZk5pYklCUnlXNXpkdWtDaUxoTVJCTXhwb1VaNklFay9KQ2Z5UVJu?=
 =?utf-8?B?YWhWUmk1UTRaUUk4Um51cnpIckJ6OS8rYStjbGNTVW5mRUNFQ3ZmbWFsNVZl?=
 =?utf-8?B?VFdOVWxxOXlyZ2ZEb0Z2VWdNN21FS2Q3VVJxNE16d3UrSVZ6b2hmRStzY29O?=
 =?utf-8?B?N1lMT0NOV011eVdUSkdST1p6aEx1RzhkU0QxSUlHMFVRS0FXY2pab2w2QTN2?=
 =?utf-8?B?SFFjRkM5MFh1WkVVNG56S3JFV0c5d05IOE9taS85bjFkQTlxeEtMUlVHT2Z4?=
 =?utf-8?B?N0NLUWQ3Z21URG9ScTA5WWFDZ2xkQStLTUkxSjVuVHV2dEFJTEUzdElhQVU1?=
 =?utf-8?B?cEFwMnUzTXNnVlpsZVdaNTZ6Q1hKazJCZzFncWZvbDNBTHB0azdMRkMzcVkz?=
 =?utf-8?B?SXBiTjJKVk81ZTAzaWt1N1gxb0pRcnN3cFJ6SnFxS1U2NXlJZUluc2pEbnhR?=
 =?utf-8?B?Nm1mVERtd092SVd1NlpHcG0vTk8rT1pCV3BLSDhWbjN3MU9MV0Y2TTUyWTVD?=
 =?utf-8?B?OUlGeU5uR2ZHWGxjcjBHNG13YVBRMXlOYUhCNFZTdHNqbVhONncvR2YrUUtU?=
 =?utf-8?B?K1dXQ2VOTGhOYm43YkE3THFQRWR6YW9EaTBON2ttOWI0eFJoelZ4L2FwSEdL?=
 =?utf-8?B?bFhWdDlXUCszaW9nYzRKenROeFRJcXA3UjFCaFpOMTg1MkE2ZmcrWGw0MjNm?=
 =?utf-8?B?aGZRR0pKWGtMUkRrU1VDYzBlUE5PS0dIblpVOTBmSUk4bGdGUUJ1Sld6MFBJ?=
 =?utf-8?B?c2RjbGYrbjRLTkRZR3NWNVFnNDlNOU5ERFVRZGhpN1B3dWk2dFppL2V0S2d4?=
 =?utf-8?B?UkpiWUVaWGoyV2JNTlRnd2E5RklFRm8zNGxsOXhlVi9jTXl4blZRTU9hb25Y?=
 =?utf-8?B?ckRhQTZnOVp1MUdnNDdDcWVwOStJUGFhT2xqN2JwMHJDak1ENW9iYUZMdDd2?=
 =?utf-8?B?SG5VWG4wTkVHWTYrdVBldmtoTWpzWnFYeFNrQ0VkaGljaGN1YUlyMC90eWho?=
 =?utf-8?B?NXhnckZLVXUwM0NBRU44VEFSSlVHUVJ1NGdsL0FNVUtqZW1JL0o4Rm8rQmNZ?=
 =?utf-8?B?bHk0cnpKSUVkdG9PTXArL2c2SGJ0cHBaS2dmZ09XYXp2M1BMaFQ1MW90YWtw?=
 =?utf-8?B?bmhFdGdiL2VFWDRPdlBEMEU4aHBhMzJSNHBEV0NxT051MTJxNVAvYWt4NW9D?=
 =?utf-8?B?RFhkUzQ0MEFWKzFNaElSckU2UXNIS0s5cjBTMzFaUS81Mlh3LzF4NGNNM0ho?=
 =?utf-8?B?RXRMU0p3bGVBMlA4SE84WG1rT1ZVTXdSUjJ6S1NHWlFFMmhubEJQVER0dlBB?=
 =?utf-8?B?MEs1Z3RhZFVzamg0blFLWGFVcWtVZ0ZKb3ptSDVwQk5uN1F3eG1qeDh3Q3FH?=
 =?utf-8?B?M0UvRG41cThCY2FqYzBWZzkxUUE3ZUlJK3lNaUREaW5VVmdVVU5EQ0V3SHdm?=
 =?utf-8?B?Nnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 845418ec-5ec3-4aa0-948c-08daaa933b6b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 07:44:16.5959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zWY9Mbj2zXwgq35rOHGekOzIJACVA1VmVQG5nFL74PxCTwE5J49vnER6o58y/pG427/avt6oqWR7lf9UQX5ikICTDoIcQWbZmuf7eY+W53M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5448
X-Proofpoint-ORIG-GUID: MGK79eCeyuoCtELl1ectlKmf322cy9Mz
X-Proofpoint-GUID: MGK79eCeyuoCtELl1ectlKmf322cy9Mz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-07_04,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210100046
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 29A6J3JH005360
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 07:44:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171556

Background:
Due to current qemu 6.2 doesn't support float128, this cause some POSIX A=
PIs(e.g. double difftime()..)=20
return a wrong value, this issue can be reproduced by open_posix_testsuit=
 difftime case[1].

The qemu upstream has already supported ppc64 float128, but need to updat=
e to qemu 7.0 or later.
We backport the commits[2] from upstream to support that in qemu-ppc64 6.=
2.0.

[1] difftime test case:
https://github.com/linux-test-project/ltp/tree/master/testcases/open_posi=
x_testsuite/conformance/interfaces/difftime

[2] commits link:
LINK: https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D149a48f6e6ccedfa0=
1307d45884aa480f5bf77c5
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dba11446c40903b9d9=
7fb75a078d43fee6444d3b6
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dbead3c9b0ff8efd65=
2afb27923d8ab4458b3bbd9
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D10cc964030fca4595=
91d9353571f3b1b4e1b5aec
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3De706d4455b8d54252=
b11fc504c56df060151cb89
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D941298ecd7e3103d3=
789d2dd87dd0f119e81c69e
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D4edf55698fc2ea309=
03657c63ed95db0d5548943
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dc07f82416cb7973c6=
4d1e21c09957182b4b033dc
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3De4052bb773cc829a2=
7786d68caa22f28cff19d39
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dffdaff8e9c698061f=
57a6b1827570562c5a1c909
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D201fc774e0e1cc76e=
c23b595968004a7b14fb6e8
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dc5df1898a147c232f=
0502cda5dac8df6074070fc
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D38d4914c5065e14f0=
969161274793ded448f067f
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dcaf6f9b568479bea6=
f6d97798be670f21641a006
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D25ee608d79c1890c0=
f4e8c495ec8629d5712de45
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D19f0862dd8fa6510b=
2f5b3aff4859363602cd0cf
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D5f1470b091007f240=
35d6d33149df49a6dd61682
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D17868d81e0074905b=
2c1e414af6618570e8059eb
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D9193eaa901c54dbff=
4a91ea0b12a99e0135dbca1
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3De4318ab2e423c4caf=
9a88a4e99b5e234096b81a9
      https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D3bb1aed246d7b59ce=
ee625a82628f7369d492a8f

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  21 ++
 ...end-float_exception_flags-to-16-bits.patch |  75 +++++
 ...ftfloat-Add-flag-specific-to-Inf-Inf.patch |  59 ++++
 ...softfloat-Add-flag-specific-to-Inf-0.patch | 126 +++++++++
 ...dd-flags-specific-to-Inf-Inf-and-0-0.patch |  73 +++++
 ...-Add-flag-specific-to-signaling-nans.patch | 121 ++++++++
 ...e-float_invalid_op_addsub-for-new-fl.patch | 114 ++++++++
 ...e-float_invalid_op_mul-for-new-flags.patch |  86 ++++++
 ...e-float_invalid_op_div-for-new-flags.patch |  99 +++++++
 ...arget-ppc-Update-fmadd-for-new-flags.patch | 102 +++++++
 .../0010-target-ppc-Split-out-do_fmadd.patch  |  71 +++++
 ...s-max-min-cj-dp-to-use-VSX-registers.patch |  93 +++++++
 ...-Move-xs-max-min-cj-dp-to-decodetree.patch | 121 ++++++++
 ...get-ppc-fix-xscvqpdp-register-access.patch |  41 +++
 ...rget-ppc-move-xscvqpdp-to-decodetree.patch | 130 +++++++++
 ...tore_fpscr-doesn-t-update-bits-0-to-.patch |  70 +++++
 ...get-ppc-Introduce-TRANS-FLAGS-macros.patch | 133 +++++++++
 ...get-ppc-Implement-Vector-Expand-Mask.patch | 105 +++++++
 ...et-ppc-Implement-Vector-Extract-Mask.patch | 141 ++++++++++
 ...ppc-Implement-Vector-Mask-Move-insns.patch | 187 +++++++++++++
 ...xs-n-madd-am-ds-p-xs-n-msub-am-ds-p-.patch | 258 ++++++++++++++++++
 ...mplement-xs-n-maddqp-o-xs-n-msubqp-o.patch | 174 ++++++++++++
 22 files changed, 2400 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-softfloat-Extend=
-float_exception_flags-to-16-bits.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-softfloat-Add-fl=
ag-specific-to-Inf-Inf.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0003-softfloat-Add-fl=
ag-specific-to-Inf-0.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0004-softfloat-Add-fl=
ags-specific-to-Inf-Inf-and-0-0.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0005-softfloat-Add-fl=
ag-specific-to-signaling-nans.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0006-target-ppc-Updat=
e-float_invalid_op_addsub-for-new-fl.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0007-target-ppc-Updat=
e-float_invalid_op_mul-for-new-flags.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0008-target-ppc-Updat=
e-float_invalid_op_div-for-new-flags.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0009-target-ppc-Updat=
e-fmadd-for-new-flags.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0010-target-ppc-Split=
-out-do_fmadd.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0011-target-ppc-Fix-x=
s-max-min-cj-dp-to-use-VSX-registers.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0012-target-ppc-Move-=
xs-max-min-cj-dp-to-decodetree.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0013-target-ppc-fix-x=
scvqpdp-register-access.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0014-target-ppc-move-=
xscvqpdp-to-decodetree.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0015-target-ppc-ppc_s=
tore_fpscr-doesn-t-update-bits-0-to-.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0016-target-ppc-Intro=
duce-TRANS-FLAGS-macros.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0017-target-ppc-Imple=
ment-Vector-Expand-Mask.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0018-target-ppc-Imple=
ment-Vector-Extract-Mask.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0019-target-ppc-Imple=
ment-Vector-Mask-Move-insns.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0020-target-ppc-move-=
xs-n-madd-am-ds-p-xs-n-msub-am-ds-p-.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0021-target-ppc-imple=
ment-xs-n-maddqp-o-xs-n-msubqp-o.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index a493ac8add..8387eda6f1 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -43,6 +43,27 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.ta=
r.xz \
            file://CVE-2022-0358.patch \
            file://CVE-2022-0216_1.patch \
            file://CVE-2022-0216_2.patch \
+           file://0001-softfloat-Extend-float_exception_flags-to-16-bits=
.patch \
+           file://0002-softfloat-Add-flag-specific-to-Inf-Inf.patch \
+           file://0003-softfloat-Add-flag-specific-to-Inf-0.patch \
+           file://0004-softfloat-Add-flags-specific-to-Inf-Inf-and-0-0.p=
atch \
+           file://0005-softfloat-Add-flag-specific-to-signaling-nans.pat=
ch \
+           file://0006-target-ppc-Update-float_invalid_op_addsub-for-new=
-fl.patch \
+           file://0007-target-ppc-Update-float_invalid_op_mul-for-new-fl=
ags.patch \
+           file://0008-target-ppc-Update-float_invalid_op_div-for-new-fl=
ags.patch \
+           file://0009-target-ppc-Update-fmadd-for-new-flags.patch \
+           file://0010-target-ppc-Split-out-do_fmadd.patch \
+           file://0011-target-ppc-Fix-xs-max-min-cj-dp-to-use-VSX-regist=
ers.patch \
+           file://0012-target-ppc-Move-xs-max-min-cj-dp-to-decodetree.pa=
tch \
+           file://0013-target-ppc-fix-xscvqpdp-register-access.patch \
+           file://0014-target-ppc-move-xscvqpdp-to-decodetree.patch \
+           file://0015-target-ppc-ppc_store_fpscr-doesn-t-update-bits-0-=
to-.patch \
+           file://0016-target-ppc-Introduce-TRANS-FLAGS-macros.patch \
+           file://0017-target-ppc-Implement-Vector-Expand-Mask.patch \
+           file://0018-target-ppc-Implement-Vector-Extract-Mask.patch \
+           file://0019-target-ppc-Implement-Vector-Mask-Move-insns.patch=
 \
+           file://0020-target-ppc-move-xs-n-madd-am-ds-p-xs-n-msub-am-ds=
-p-.patch \
+           file://0021-target-ppc-implement-xs-n-maddqp-o-xs-n-msubqp-o.=
patch \
            "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/0001-softfloat-Extend-float_=
exception_flags-to-16-bits.patch b/meta/recipes-devtools/qemu/qemu/0001-s=
oftfloat-Extend-float_exception_flags-to-16-bits.patch
new file mode 100644
index 0000000000..e9c47f6901
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-softfloat-Extend-float_excepti=
on_flags-to-16-bits.patch
@@ -0,0 +1,75 @@
+From 0bec1ded33a857f59cf5f3ceca2f72694256e710 Mon Sep 17 00:00:00 2001
+From: Richard Henderson <richard.henderson@linaro.org>
+Date: Fri, 17 Dec 2021 17:57:14 +0100
+Subject: [PATCH 01/21] softfloat: Extend float_exception_flags to 16 bit=
s
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+We will shortly have more than 8 bits of exceptions.
+Repack the existing flags into low bits and reformat to hex.
+
+Upstream-Status: Backport
+[https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D149a48f6e6ccedfa01307=
d45884aa480f5bf77c5]
+
+Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
+Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
+Message-Id: <20211119160502.17432-2-richard.henderson@linaro.org>
+Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ include/fpu/softfloat-types.h | 16 ++++++++--------
+ include/fpu/softfloat.h       |  2 +-
+ 2 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types=
.h
+index 5bcbd041f7..65a43aff59 100644
+--- a/include/fpu/softfloat-types.h
++++ b/include/fpu/softfloat-types.h
+@@ -145,13 +145,13 @@ typedef enum __attribute__((__packed__)) {
+  */
+=20
+ enum {
+-    float_flag_invalid   =3D  1,
+-    float_flag_divbyzero =3D  4,
+-    float_flag_overflow  =3D  8,
+-    float_flag_underflow =3D 16,
+-    float_flag_inexact   =3D 32,
+-    float_flag_input_denormal =3D 64,
+-    float_flag_output_denormal =3D 128
++    float_flag_invalid         =3D 0x0001,
++    float_flag_divbyzero       =3D 0x0002,
++    float_flag_overflow        =3D 0x0004,
++    float_flag_underflow       =3D 0x0008,
++    float_flag_inexact         =3D 0x0010,
++    float_flag_input_denormal  =3D 0x0020,
++    float_flag_output_denormal =3D 0x0040,
+ };
+=20
+ /*
+@@ -171,8 +171,8 @@ typedef enum __attribute__((__packed__)) {
+  */
+=20
+ typedef struct float_status {
++    uint16_t float_exception_flags;
+     FloatRoundMode float_rounding_mode;
+-    uint8_t     float_exception_flags;
+     FloatX80RoundPrec floatx80_rounding_precision;
+     bool tininess_before_rounding;
+     /* should denormalised results go to zero and set the inexact flag?=
 */
+diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
+index a249991e61..0d3b407807 100644
+--- a/include/fpu/softfloat.h
++++ b/include/fpu/softfloat.h
+@@ -100,7 +100,7 @@ typedef enum {
+ | Routine to raise any or all of the software IEC/IEEE floating-point
+ | exception flags.
+ *----------------------------------------------------------------------=
------*/
+-static inline void float_raise(uint8_t flags, float_status *status)
++static inline void float_raise(uint16_t flags, float_status *status)
+ {
+     status->float_exception_flags |=3D flags;
+ }
+--=20
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0002-softfloat-Add-flag-spec=
ific-to-Inf-Inf.patch b/meta/recipes-devtools/qemu/qemu/0002-softfloat-Ad=
d-flag-specific-to-Inf-Inf.patch
new file mode 100644
index 0000000000..2713ff370d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0002-softfloat-Add-flag-specific-to=
-Inf-Inf.patch
@@ -0,0 +1,59 @@
+From 9b0737858b2b68c3a4d1e0611f2732679c997c6d Mon Sep 17 00:00:00 2001
+From: Richard Henderson <richard.henderson@linaro.org>
+Date: Fri, 17 Dec 2021 17:57:14 +0100
+Subject: [PATCH 02/21] softfloat: Add flag specific to Inf - Inf
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+PowerPC has this flag, and it's easier to compute it here
+than after the fact.
+
+Upstream-Status: Backport
+[https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dba11446c40903b9d97fb7=
5a078d43fee6444d3b6]
+
+Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
+Message-Id: <20211119160502.17432-3-richard.henderson@linaro.org>
+Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ fpu/softfloat-parts.c.inc     | 3 ++-
+ include/fpu/softfloat-types.h | 1 +
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
+index 41d4b17e41..eb2b475ca4 100644
+--- a/fpu/softfloat-parts.c.inc
++++ b/fpu/softfloat-parts.c.inc
+@@ -354,7 +354,7 @@ static FloatPartsN *partsN(addsub)(FloatPartsN *a, F=
loatPartsN *b,
+                 return a;
+             }
+             /* Inf - Inf */
+-            float_raise(float_flag_invalid, s);
++            float_raise(float_flag_invalid | float_flag_invalid_isi, s)=
;
+             parts_default_nan(a, s);
+             return a;
+         }
+@@ -494,6 +494,7 @@ static FloatPartsN *partsN(muladd)(FloatPartsN *a, F=
loatPartsN *b,
+=20
+         if (ab_mask & float_cmask_inf) {
+             if (c->cls =3D=3D float_class_inf && a->sign !=3D c->sign) =
{
++                float_raise(float_flag_invalid | float_flag_invalid_isi=
, s);
+                 goto d_nan;
+             }
+             goto return_inf;
+diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types=
.h
+index 65a43aff59..eaa12e1e00 100644
+--- a/include/fpu/softfloat-types.h
++++ b/include/fpu/softfloat-types.h
+@@ -152,6 +152,7 @@ enum {
+     float_flag_inexact         =3D 0x0010,
+     float_flag_input_denormal  =3D 0x0020,
+     float_flag_output_denormal =3D 0x0040,
++    float_flag_invalid_isi     =3D 0x0080,  /* inf - inf */
+ };
+=20
+ /*
+--=20
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0003-softfloat-Add-flag-spec=
ific-to-Inf-0.patch b/meta/recipes-devtools/qemu/qemu/0003-softfloat-Add-=
flag-specific-to-Inf-0.patch
new file mode 100644
index 0000000000..1b21e3cfeb
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0003-softfloat-Add-flag-specific-to=
-Inf-0.patch
@@ -0,0 +1,126 @@
+From 613f373f0b652ab2fb2572633e7a23807096790b Mon Sep 17 00:00:00 2001
+From: Richard Henderson <richard.henderson@linaro.org>
+Date: Fri, 17 Dec 2021 17:57:14 +0100
+Subject: [PATCH 03/21] softfloat: Add flag specific to Inf * 0
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+PowerPC has this flag, and it's easier to compute it here
+than after the fact.
+
+Upstream-Status: Backport
+[https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dbead3c9b0ff8efd652afb=
27923d8ab4458b3bbd9]
+
+Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
+Message-Id: <20211119160502.17432-4-richard.henderson@linaro.org>
+Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ fpu/softfloat-parts.c.inc      |  4 ++--
+ fpu/softfloat-specialize.c.inc | 12 ++++++------
+ include/fpu/softfloat-types.h  |  1 +
+ 3 files changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
+index eb2b475ca4..3ed793347b 100644
+--- a/fpu/softfloat-parts.c.inc
++++ b/fpu/softfloat-parts.c.inc
+@@ -423,7 +423,7 @@ static FloatPartsN *partsN(mul)(FloatPartsN *a, Floa=
tPartsN *b,
+=20
+     /* Inf * Zero =3D=3D NaN */
+     if (unlikely(ab_mask =3D=3D float_cmask_infzero)) {
+-        float_raise(float_flag_invalid, s);
++        float_raise(float_flag_invalid | float_flag_invalid_imz, s);
+         parts_default_nan(a, s);
+         return a;
+     }
+@@ -489,6 +489,7 @@ static FloatPartsN *partsN(muladd)(FloatPartsN *a, F=
loatPartsN *b,
+=20
+     if (unlikely(ab_mask !=3D float_cmask_normal)) {
+         if (unlikely(ab_mask =3D=3D float_cmask_infzero)) {
++            float_raise(float_flag_invalid | float_flag_invalid_imz, s)=
;
+             goto d_nan;
+         }
+=20
+@@ -567,7 +568,6 @@ static FloatPartsN *partsN(muladd)(FloatPartsN *a, F=
loatPartsN *b,
+     goto finish_sign;
+=20
+  d_nan:
+-    float_raise(float_flag_invalid, s);
+     parts_default_nan(a, s);
+     return a;
+ }
+diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c=
.inc
+index f2ad0f335e..943e3301d2 100644
+--- a/fpu/softfloat-specialize.c.inc
++++ b/fpu/softfloat-specialize.c.inc
+@@ -506,7 +506,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClas=
s b_cls, FloatClass c_cls,
+      * the default NaN
+      */
+     if (infzero && is_qnan(c_cls)) {
+-        float_raise(float_flag_invalid, status);
++        float_raise(float_flag_invalid | float_flag_invalid_imz, status=
);
+         return 3;
+     }
+=20
+@@ -533,7 +533,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClas=
s b_cls, FloatClass c_cls,
+          * case sets InvalidOp and returns the default NaN
+          */
+         if (infzero) {
+-            float_raise(float_flag_invalid, status);
++            float_raise(float_flag_invalid | float_flag_invalid_imz, st=
atus);
+             return 3;
+         }
+         /* Prefer sNaN over qNaN, in the a, b, c order. */
+@@ -556,7 +556,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClas=
s b_cls, FloatClass c_cls,
+          * case sets InvalidOp and returns the input value 'c'
+          */
+         if (infzero) {
+-            float_raise(float_flag_invalid, status);
++            float_raise(float_flag_invalid | float_flag_invalid_imz, st=
atus);
+             return 2;
+         }
+         /* Prefer sNaN over qNaN, in the c, a, b order. */
+@@ -580,7 +580,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClas=
s b_cls, FloatClass c_cls,
+      * a default NaN
+      */
+     if (infzero) {
+-        float_raise(float_flag_invalid, status);
++        float_raise(float_flag_invalid | float_flag_invalid_imz, status=
);
+         return 2;
+     }
+=20
+@@ -597,7 +597,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClas=
s b_cls, FloatClass c_cls,
+ #elif defined(TARGET_RISCV)
+     /* For RISC-V, InvalidOp is set when multiplicands are Inf and zero=
 */
+     if (infzero) {
+-        float_raise(float_flag_invalid, status);
++        float_raise(float_flag_invalid | float_flag_invalid_imz, status=
);
+     }
+     return 3; /* default NaN */
+ #elif defined(TARGET_XTENSA)
+@@ -606,7 +606,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClas=
s b_cls, FloatClass c_cls,
+      * an input NaN if we have one (ie c).
+      */
+     if (infzero) {
+-        float_raise(float_flag_invalid, status);
++        float_raise(float_flag_invalid | float_flag_invalid_imz, status=
);
+         return 2;
+     }
+     if (status->use_first_nan) {
+diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types=
.h
+index eaa12e1e00..56b4cf7835 100644
+--- a/include/fpu/softfloat-types.h
++++ b/include/fpu/softfloat-types.h
+@@ -153,6 +153,7 @@ enum {
+     float_flag_input_denormal  =3D 0x0020,
+     float_flag_output_denormal =3D 0x0040,
+     float_flag_invalid_isi     =3D 0x0080,  /* inf - inf */
++    float_flag_invalid_imz     =3D 0x0100,  /* inf * 0 */
+ };
+=20
+ /*
+--=20
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0004-softfloat-Add-flags-spe=
cific-to-Inf-Inf-and-0-0.patch b/meta/recipes-devtools/qemu/qemu/0004-sof=
tfloat-Add-flags-specific-to-Inf-Inf-and-0-0.patch
new file mode 100644
index 0000000000..c5377fbe70
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0004-softfloat-Add-flags-specific-t=
o-Inf-Inf-and-0-0.patch
@@ -0,0 +1,73 @@
+From 52f1760d2d65e1a61028cb9d8610c8a38aa44cfc Mon Sep 17 00:00:00 2001
+From: Richard Henderson <richard.henderson@linaro.org>
+Date: Fri, 17 Dec 2021 17:57:14 +0100
+Subject: [PATCH 04/21] softfloat: Add flags specific to Inf / Inf and 0 =
/ 0
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+PowerPC has these flags, and it's easier to compute them here
+than after the fact.
+
+Upstream-Status: Backport
+[https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D10cc964030fca459591d9=
353571f3b1b4e1b5aec]
+
+Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
+Message-Id: <20211119160502.17432-5-richard.henderson@linaro.org>
+Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ fpu/softfloat-parts.c.inc     | 16 +++++++++++-----
+ include/fpu/softfloat-types.h |  2 ++
+ 2 files changed, 13 insertions(+), 5 deletions(-)
+
+diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
+index 3ed793347b..b8563cd2df 100644
+--- a/fpu/softfloat-parts.c.inc
++++ b/fpu/softfloat-parts.c.inc
+@@ -590,11 +590,13 @@ static FloatPartsN *partsN(div)(FloatPartsN *a, Fl=
oatPartsN *b,
+     }
+=20
+     /* 0/0 or Inf/Inf =3D> NaN */
+-    if (unlikely(ab_mask =3D=3D float_cmask_zero) ||
+-        unlikely(ab_mask =3D=3D float_cmask_inf)) {
+-        float_raise(float_flag_invalid, s);
+-        parts_default_nan(a, s);
+-        return a;
++    if (unlikely(ab_mask =3D=3D float_cmask_zero)) {
++        float_raise(float_flag_invalid | float_flag_invalid_zdz, s);
++        goto d_nan;
++    }
++    if (unlikely(ab_mask =3D=3D float_cmask_inf)) {
++        float_raise(float_flag_invalid | float_flag_invalid_idi, s);
++        goto d_nan;
+     }
+=20
+     /* All the NaN cases */
+@@ -625,6 +627,10 @@ static FloatPartsN *partsN(div)(FloatPartsN *a, Flo=
atPartsN *b,
+     float_raise(float_flag_divbyzero, s);
+     a->cls =3D float_class_inf;
+     return a;
++
++ d_nan:
++    parts_default_nan(a, s);
++    return a;
+ }
+=20
+ /*
+diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types=
.h
+index 56b4cf7835..5a9671e564 100644
+--- a/include/fpu/softfloat-types.h
++++ b/include/fpu/softfloat-types.h
+@@ -154,6 +154,8 @@ enum {
+     float_flag_output_denormal =3D 0x0040,
+     float_flag_invalid_isi     =3D 0x0080,  /* inf - inf */
+     float_flag_invalid_imz     =3D 0x0100,  /* inf * 0 */
++    float_flag_invalid_idi     =3D 0x0200,  /* inf / inf */
++    float_flag_invalid_zdz     =3D 0x0400,  /* 0 / 0 */
+ };
+=20
+ /*
+--=20
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0005-softfloat-Add-flag-spec=
ific-to-signaling-nans.patch b/meta/recipes-devtools/qemu/qemu/0005-softf=
loat-Add-flag-specific-to-signaling-nans.patch
new file mode 100644
index 0000000000..e4ecb496ae
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0005-softfloat-Add-flag-specific-to=
-signaling-nans.patch
@@ -0,0 +1,121 @@
+From 6bc0b2cffab0ee280ae9730262f162f25c16f6c2 Mon Sep 17 00:00:00 2001
+From: Richard Henderson <richard.henderson@linaro.org>
+Date: Fri, 17 Dec 2021 17:57:14 +0100
+Subject: [PATCH 05/21] softfloat: Add flag specific to signaling nans
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+PowerPC has this flag, and it's easier to compute it here
+than after the fact.
+
+Upstream-Status: Backport
+[https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3De706d4455b8d54252b11f=
c504c56df060151cb89]
+
+Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
+Message-Id: <20211119160502.17432-8-richard.henderson@linaro.org>
+Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ fpu/softfloat-parts.c.inc     | 18 ++++++++++++------
+ fpu/softfloat.c               |  4 +++-
+ include/fpu/softfloat-types.h |  1 +
+ 3 files changed, 16 insertions(+), 7 deletions(-)
+
+diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
+index b8563cd2df..9518f3dc61 100644
+--- a/fpu/softfloat-parts.c.inc
++++ b/fpu/softfloat-parts.c.inc
+@@ -19,7 +19,7 @@ static void partsN(return_nan)(FloatPartsN *a, float_s=
tatus *s)
+ {
+     switch (a->cls) {
+     case float_class_snan:
+-        float_raise(float_flag_invalid, s);
++        float_raise(float_flag_invalid | float_flag_invalid_snan, s);
+         if (s->default_nan_mode) {
+             parts_default_nan(a, s);
+         } else {
+@@ -40,7 +40,7 @@ static FloatPartsN *partsN(pick_nan)(FloatPartsN *a, F=
loatPartsN *b,
+                                      float_status *s)
+ {
+     if (is_snan(a->cls) || is_snan(b->cls)) {
+-        float_raise(float_flag_invalid, s);
++        float_raise(float_flag_invalid | float_flag_invalid_snan, s);
+     }
+=20
+     if (s->default_nan_mode) {
+@@ -68,7 +68,7 @@ static FloatPartsN *partsN(pick_nan_muladd)(FloatParts=
N *a, FloatPartsN *b,
+     int which;
+=20
+     if (unlikely(abc_mask & float_cmask_snan)) {
+-        float_raise(float_flag_invalid, s);
++        float_raise(float_flag_invalid | float_flag_invalid_snan, s);
+     }
+=20
+     which =3D pickNaNMulAdd(a->cls, b->cls, c->cls,
+@@ -1049,8 +1049,10 @@ static int64_t partsN(float_to_sint)(FloatPartsN =
*p, FloatRoundMode rmode,
+=20
+     switch (p->cls) {
+     case float_class_snan:
++        flags |=3D float_flag_invalid_snan;
++        /* fall through */
+     case float_class_qnan:
+-        flags =3D float_flag_invalid;
++        flags |=3D float_flag_invalid;
+         r =3D max;
+         break;
+=20
+@@ -1114,8 +1116,10 @@ static uint64_t partsN(float_to_uint)(FloatPartsN=
 *p, FloatRoundMode rmode,
+=20
+     switch (p->cls) {
+     case float_class_snan:
++        flags |=3D float_flag_invalid_snan;
++        /* fall through */
+     case float_class_qnan:
+-        flags =3D float_flag_invalid;
++        flags |=3D float_flag_invalid;
+         r =3D max;
+         break;
+=20
+@@ -1341,7 +1345,9 @@ static FloatRelation partsN(compare)(FloatPartsN *=
a, FloatPartsN *b,
+     }
+=20
+     if (unlikely(ab_mask & float_cmask_anynan)) {
+-        if (!is_quiet || (ab_mask & float_cmask_snan)) {
++        if (ab_mask & float_cmask_snan) {
++            float_raise(float_flag_invalid | float_flag_invalid_snan, s=
);
++        } else if (!is_quiet) {
+             float_raise(float_flag_invalid, s);
+         }
+         return float_relation_unordered;
+diff --git a/fpu/softfloat.c b/fpu/softfloat.c
+index 9a28720d82..834ed3a054 100644
+--- a/fpu/softfloat.c
++++ b/fpu/softfloat.c
+@@ -2543,8 +2543,10 @@ floatx80 floatx80_mod(floatx80 a, floatx80 b, flo=
at_status *status)
+ static void parts_float_to_ahp(FloatParts64 *a, float_status *s)
+ {
+     switch (a->cls) {
+-    case float_class_qnan:
+     case float_class_snan:
++        float_raise(float_flag_invalid_snan, s);
++        /* fall through */
++    case float_class_qnan:
+         /*
+          * There is no NaN in the destination format.  Raise Invalid
+          * and return a zero with the sign of the input NaN.
+diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types=
.h
+index 5a9671e564..e557b9126b 100644
+--- a/include/fpu/softfloat-types.h
++++ b/include/fpu/softfloat-types.h
+@@ -156,6 +156,7 @@ enum {
+     float_flag_invalid_imz     =3D 0x0100,  /* inf * 0 */
+     float_flag_invalid_idi     =3D 0x0200,  /* inf / inf */
+     float_flag_invalid_zdz     =3D 0x0400,  /* 0 / 0 */
++    float_flag_invalid_snan    =3D 0x2000,  /* any operand was snan */
+ };
+=20
+ /*
+--=20
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0006-target-ppc-Update-float=
_invalid_op_addsub-for-new-fl.patch b/meta/recipes-devtools/qemu/qemu/000=
6-target-ppc-Update-float_invalid_op_addsub-for-new-fl.patch
new file mode 100644
index 0000000000..5f38c7265f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0006-target-ppc-Update-float_invali=
d_op_addsub-for-new-fl.patch
@@ -0,0 +1,114 @@
+From ba4a60dd5df31b9fff8b7b8006bf9f15140cc6c5 Mon Sep 17 00:00:00 2001
+From: Richard Henderson <richard.henderson@linaro.org>
+Date: Fri, 17 Dec 2021 17:57:14 +0100
+Subject: [PATCH 06/21] target/ppc: Update float_invalid_op_addsub for ne=
w
+ flags
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Now that vxisi and vxsnan are computed directly by
+softfloat, we don't need to recompute it via classes.
+
+Upstream-Status: Backport
+[https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D941298ecd7e3103d3789d=
2dd87dd0f119e81c69e]
+
+Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
+Message-Id: <20211119160502.17432-9-richard.henderson@linaro.org>
+Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ target/ppc/fpu_helper.c | 38 ++++++++++++++------------------------
+ 1 file changed, 14 insertions(+), 24 deletions(-)
+
+diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
+index c4896cecc8..f0deada84b 100644
+--- a/target/ppc/fpu_helper.c
++++ b/target/ppc/fpu_helper.c
+@@ -450,13 +450,12 @@ void helper_reset_fpstatus(CPUPPCState *env)
+     set_float_exception_flags(0, &env->fp_status);
+ }
+=20
+-static void float_invalid_op_addsub(CPUPPCState *env, bool set_fpcc,
+-                                    uintptr_t retaddr, int classes)
++static void float_invalid_op_addsub(CPUPPCState *env, int flags,
++                                    bool set_fpcc, uintptr_t retaddr)
+ {
+-    if ((classes & ~is_neg) =3D=3D is_inf) {
+-        /* Magnitude subtraction of infinities */
++    if (flags & float_flag_invalid_isi) {
+         float_invalid_op_vxisi(env, set_fpcc, retaddr);
+-    } else if (classes & is_snan) {
++    } else if (flags & float_flag_invalid_snan) {
+         float_invalid_op_vxsnan(env, retaddr);
+     }
+ }
+@@ -465,12 +464,10 @@ static void float_invalid_op_addsub(CPUPPCState *e=
nv, bool set_fpcc,
+ float64 helper_fadd(CPUPPCState *env, float64 arg1, float64 arg2)
+ {
+     float64 ret =3D float64_add(arg1, arg2, &env->fp_status);
+-    int status =3D get_float_exception_flags(&env->fp_status);
++    int flags =3D get_float_exception_flags(&env->fp_status);
+=20
+-    if (unlikely(status & float_flag_invalid)) {
+-        float_invalid_op_addsub(env, 1, GETPC(),
+-                                float64_classify(arg1) |
+-                                float64_classify(arg2));
++    if (unlikely(flags & float_flag_invalid)) {
++        float_invalid_op_addsub(env, flags, 1, GETPC());
+     }
+=20
+     return ret;
+@@ -480,12 +477,10 @@ float64 helper_fadd(CPUPPCState *env, float64 arg1=
, float64 arg2)
+ float64 helper_fsub(CPUPPCState *env, float64 arg1, float64 arg2)
+ {
+     float64 ret =3D float64_sub(arg1, arg2, &env->fp_status);
+-    int status =3D get_float_exception_flags(&env->fp_status);
++    int flags =3D get_float_exception_flags(&env->fp_status);
+=20
+-    if (unlikely(status & float_flag_invalid)) {
+-        float_invalid_op_addsub(env, 1, GETPC(),
+-                                float64_classify(arg1) |
+-                                float64_classify(arg2));
++    if (unlikely(flags & float_flag_invalid)) {
++        float_invalid_op_addsub(env, flags, 1, GETPC());
+     }
+=20
+     return ret;
+@@ -1616,9 +1611,8 @@ void helper_##name(CPUPPCState *env, ppc_vsr_t *xt=
,                          \
+         env->fp_status.float_exception_flags |=3D tstat.float_exception=
_flags; \
+                                                                        =
      \
+         if (unlikely(tstat.float_exception_flags & float_flag_invalid))=
 {    \
+-            float_invalid_op_addsub(env, sfprf, GETPC(),               =
      \
+-                                    tp##_classify(xa->fld) |           =
      \
+-                                    tp##_classify(xb->fld));           =
      \
++            float_invalid_op_addsub(env, tstat.float_exception_flags,  =
      \
++                                    sfprf, GETPC());                   =
      \
+         }                                                              =
      \
+                                                                        =
      \
+         if (r2sp) {                                                    =
      \
+@@ -1660,9 +1654,7 @@ void helper_xsaddqp(CPUPPCState *env, uint32_t opc=
ode,
+     env->fp_status.float_exception_flags |=3D tstat.float_exception_fla=
gs;
+=20
+     if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {
+-        float_invalid_op_addsub(env, 1, GETPC(),
+-                                float128_classify(xa->f128) |
+-                                float128_classify(xb->f128));
++        float_invalid_op_addsub(env, tstat.float_exception_flags, 1, GE=
TPC());
+     }
+=20
+     helper_compute_fprf_float128(env, t.f128);
+@@ -3278,9 +3270,7 @@ void helper_xssubqp(CPUPPCState *env, uint32_t opc=
ode,
+     env->fp_status.float_exception_flags |=3D tstat.float_exception_fla=
gs;
+=20
+     if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {
+-        float_invalid_op_addsub(env, 1, GETPC(),
+-                                float128_classify(xa->f128) |
+-                                float128_classify(xb->f128));
++        float_invalid_op_addsub(env, tstat.float_exception_flags, 1, GE=
TPC());
+     }
+=20
+     helper_compute_fprf_float128(env, t.f128);
+--=20
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0007-target-ppc-Update-float=
_invalid_op_mul-for-new-flags.patch b/meta/recipes-devtools/qemu/qemu/000=
7-target-ppc-Update-float_invalid_op_mul-for-new-flags.patch
new file mode 100644
index 0000000000..1cc4e9e35c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0007-target-ppc-Update-float_invali=
d_op_mul-for-new-flags.patch
@@ -0,0 +1,86 @@
+From ee8ba2dbb046f48457566b64ad95bf0440d2513e Mon Sep 17 00:00:00 2001
+From: Richard Henderson <richard.henderson@linaro.org>
+Date: Fri, 17 Dec 2021 17:57:14 +0100
+Subject: [PATCH 07/21] target/ppc: Update float_invalid_op_mul for new f=
lags
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Now that vximz and vxsnan are computed directly by
+softfloat, we don't need to recompute it via classes.
+
+Upstream-Status: Backport
+[https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D4edf55698fc2ea3090365=
7c63ed95db0d5548943]
+
+Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
+Message-Id: <20211119160502.17432-10-richard.henderson@linaro.org>
+Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ target/ppc/fpu_helper.c | 26 ++++++++++----------------
+ 1 file changed, 10 insertions(+), 16 deletions(-)
+
+diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
+index f0deada84b..23264e6528 100644
+--- a/target/ppc/fpu_helper.c
++++ b/target/ppc/fpu_helper.c
+@@ -486,13 +486,12 @@ float64 helper_fsub(CPUPPCState *env, float64 arg1=
, float64 arg2)
+     return ret;
+ }
+=20
+-static void float_invalid_op_mul(CPUPPCState *env, bool set_fprc,
+-                                 uintptr_t retaddr, int classes)
++static void float_invalid_op_mul(CPUPPCState *env, int flags,
++                                 bool set_fprc, uintptr_t retaddr)
+ {
+-    if ((classes & (is_zero | is_inf)) =3D=3D (is_zero | is_inf)) {
+-        /* Multiplication of zero by infinity */
++    if (flags & float_flag_invalid_imz) {
+         float_invalid_op_vximz(env, set_fprc, retaddr);
+-    } else if (classes & is_snan) {
++    } else if (flags & float_flag_invalid_snan) {
+         float_invalid_op_vxsnan(env, retaddr);
+     }
+ }
+@@ -501,12 +500,10 @@ static void float_invalid_op_mul(CPUPPCState *env,=
 bool set_fprc,
+ float64 helper_fmul(CPUPPCState *env, float64 arg1, float64 arg2)
+ {
+     float64 ret =3D float64_mul(arg1, arg2, &env->fp_status);
+-    int status =3D get_float_exception_flags(&env->fp_status);
++    int flags =3D get_float_exception_flags(&env->fp_status);
+=20
+-    if (unlikely(status & float_flag_invalid)) {
+-        float_invalid_op_mul(env, 1, GETPC(),
+-                             float64_classify(arg1) |
+-                             float64_classify(arg2));
++    if (unlikely(flags & float_flag_invalid)) {
++        float_invalid_op_mul(env, flags, 1, GETPC());
+     }
+=20
+     return ret;
+@@ -1687,9 +1684,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, =
                           \
+         env->fp_status.float_exception_flags |=3D tstat.float_exception=
_flags; \
+                                                                        =
      \
+         if (unlikely(tstat.float_exception_flags & float_flag_invalid))=
 {    \
+-            float_invalid_op_mul(env, sfprf, GETPC(),                  =
      \
+-                                 tp##_classify(xa->fld) |              =
      \
+-                                 tp##_classify(xb->fld));              =
      \
++            float_invalid_op_mul(env, tstat.float_exception_flags,     =
      \
++                                 sfprf, GETPC());                      =
      \
+         }                                                              =
      \
+                                                                        =
      \
+         if (r2sp) {                                                    =
      \
+@@ -1727,9 +1723,7 @@ void helper_xsmulqp(CPUPPCState *env, uint32_t opc=
ode,
+     env->fp_status.float_exception_flags |=3D tstat.float_exception_fla=
gs;
+=20
+     if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {
+-        float_invalid_op_mul(env, 1, GETPC(),
+-                             float128_classify(xa->f128) |
+-                             float128_classify(xb->f128));
++        float_invalid_op_mul(env, tstat.float_exception_flags, 1, GETPC=
());
+     }
+     helper_compute_fprf_float128(env, t.f128);
+=20
+--=20
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0008-target-ppc-Update-float=
_invalid_op_div-for-new-flags.patch b/meta/recipes-devtools/qemu/qemu/000=
8-target-ppc-Update-float_invalid_op_div-for-new-flags.patch
new file mode 100644
index 0000000000..cb657eefd5
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0008-target-ppc-Update-float_invali=
d_op_div-for-new-flags.patch
@@ -0,0 +1,99 @@
+From a13c0819ef14120a0e30077fcc6a7470409fa732 Mon Sep 17 00:00:00 2001
+From: Richard Henderson <richard.henderson@linaro.org>
+Date: Fri, 17 Dec 2021 17:57:14 +0100
+Subject: [PATCH 08/21] target/ppc: Update float_invalid_op_div for new f=
lags
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Now that vxidi, vxzdz, and vxsnan are computed directly by
+softfloat, we don't need to recompute it via classes.
+
+Upstream-Status: Backport
+[https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dc07f82416cb7973c64d1e=
21c09957182b4b033dc]
+
+Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
+Message-Id: <20211119160502.17432-11-richard.henderson@linaro.org>
+Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ target/ppc/fpu_helper.c | 38 ++++++++++++++------------------------
+ 1 file changed, 14 insertions(+), 24 deletions(-)
+
+diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
+index 23264e6528..2ab34236a3 100644
+--- a/target/ppc/fpu_helper.c
++++ b/target/ppc/fpu_helper.c
+@@ -509,17 +509,14 @@ float64 helper_fmul(CPUPPCState *env, float64 arg1=
, float64 arg2)
+     return ret;
+ }
+=20
+-static void float_invalid_op_div(CPUPPCState *env, bool set_fprc,
+-                                 uintptr_t retaddr, int classes)
++static void float_invalid_op_div(CPUPPCState *env, int flags,
++                                 bool set_fprc, uintptr_t retaddr)
+ {
+-    classes &=3D ~is_neg;
+-    if (classes =3D=3D is_inf) {
+-        /* Division of infinity by infinity */
++    if (flags & float_flag_invalid_idi) {
+         float_invalid_op_vxidi(env, set_fprc, retaddr);
+-    } else if (classes =3D=3D is_zero) {
+-        /* Division of zero by zero */
++    } else if (flags & float_flag_invalid_zdz) {
+         float_invalid_op_vxzdz(env, set_fprc, retaddr);
+-    } else if (classes & is_snan) {
++    } else if (flags & float_flag_invalid_snan) {
+         float_invalid_op_vxsnan(env, retaddr);
+     }
+ }
+@@ -528,17 +525,13 @@ static void float_invalid_op_div(CPUPPCState *env,=
 bool set_fprc,
+ float64 helper_fdiv(CPUPPCState *env, float64 arg1, float64 arg2)
+ {
+     float64 ret =3D float64_div(arg1, arg2, &env->fp_status);
+-    int status =3D get_float_exception_flags(&env->fp_status);
++    int flags =3D get_float_exception_flags(&env->fp_status);
+=20
+-    if (unlikely(status)) {
+-        if (status & float_flag_invalid) {
+-            float_invalid_op_div(env, 1, GETPC(),
+-                                 float64_classify(arg1) |
+-                                 float64_classify(arg2));
+-        }
+-        if (status & float_flag_divbyzero) {
+-            float_zero_divide_excp(env, GETPC());
+-        }
++    if (unlikely(flags & float_flag_invalid)) {
++        float_invalid_op_div(env, flags, 1, GETPC());
++    }
++    if (unlikely(flags & float_flag_divbyzero)) {
++        float_zero_divide_excp(env, GETPC());
+     }
+=20
+     return ret;
+@@ -1755,9 +1748,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, =
                            \
+         env->fp_status.float_exception_flags |=3D tstat.float_exception=
_flags;  \
+                                                                        =
       \
+         if (unlikely(tstat.float_exception_flags & float_flag_invalid))=
 {     \
+-            float_invalid_op_div(env, sfprf, GETPC(),                  =
       \
+-                                 tp##_classify(xa->fld) |              =
       \
+-                                 tp##_classify(xb->fld));              =
       \
++            float_invalid_op_div(env, tstat.float_exception_flags,     =
       \
++                                 sfprf, GETPC());                      =
       \
+         }                                                              =
       \
+         if (unlikely(tstat.float_exception_flags & float_flag_divbyzero=
)) {   \
+             float_zero_divide_excp(env, GETPC());                      =
       \
+@@ -1798,9 +1790,7 @@ void helper_xsdivqp(CPUPPCState *env, uint32_t opc=
ode,
+     env->fp_status.float_exception_flags |=3D tstat.float_exception_fla=
gs;
+=20
+     if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {
+-        float_invalid_op_div(env, 1, GETPC(),
+-                             float128_classify(xa->f128) |
+-                             float128_classify(xb->f128));
++        float_invalid_op_div(env, tstat.float_exception_flags, 1, GETPC=
());
+     }
+     if (unlikely(tstat.float_exception_flags & float_flag_divbyzero)) {
+         float_zero_divide_excp(env, GETPC());
+--=20
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0009-target-ppc-Update-fmadd=
-for-new-flags.patch b/meta/recipes-devtools/qemu/qemu/0009-target-ppc-Up=
date-fmadd-for-new-flags.patch
new file mode 100644
index 0000000000..2e723582b7
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0009-target-ppc-Update-fmadd-for-ne=
w-flags.patch
@@ -0,0 +1,102 @@
+From ce768160ee1ee9673d60e800389c41b3c707411a Mon Sep 17 00:00:00 2001
+From: Richard Henderson <richard.henderson@linaro.org>
+Date: Fri, 17 Dec 2021 17:57:15 +0100
+Subject: [PATCH 09/21] target/ppc: Update fmadd for new flags
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Now that vximz, vxisi, and vxsnan are computed directly by
+softfloat, we don't need to recompute it.  This replaces the
+separate float{32,64}_maddsub_update_excp functions with a
+single float_invalid_op_madd function.
+
+Fix VSX_MADD by passing sfprf to float_invalid_op_madd,
+whereas the previous *_maddsub_update_excp assumed it true.
+
+Upstream-Status: Backport
+[https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3De4052bb773cc829a27786=
d68caa22f28cff19d39]
+
+Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
+Message-Id: <20211119160502.17432-19-richard.henderson@linaro.org>
+Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ target/ppc/fpu_helper.c | 46 ++++++++++-------------------------------
+ 1 file changed, 11 insertions(+), 35 deletions(-)
+
+diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
+index 2ab34236a3..3b1cb25666 100644
+--- a/target/ppc/fpu_helper.c
++++ b/target/ppc/fpu_helper.c
+@@ -639,38 +639,15 @@ uint64_t helper_frim(CPUPPCState *env, uint64_t ar=
g)
+     return do_fri(env, arg, float_round_down);
+ }
+=20
+-#define FPU_MADDSUB_UPDATE(NAME, TP)                                   =
 \
+-static void NAME(CPUPPCState *env, TP arg1, TP arg2, TP arg3,          =
 \
+-                 unsigned int madd_flags, uintptr_t retaddr)           =
 \
+-{                                                                      =
 \
+-    if (TP##_is_signaling_nan(arg1, &env->fp_status) ||                =
 \
+-        TP##_is_signaling_nan(arg2, &env->fp_status) ||                =
 \
+-        TP##_is_signaling_nan(arg3, &env->fp_status)) {                =
 \
+-        /* sNaN operation */                                           =
 \
+-        float_invalid_op_vxsnan(env, retaddr);                         =
 \
+-    }                                                                  =
 \
+-    if ((TP##_is_infinity(arg1) && TP##_is_zero(arg2)) ||              =
 \
+-        (TP##_is_zero(arg1) && TP##_is_infinity(arg2))) {              =
 \
+-        /* Multiplication of zero by infinity */                       =
 \
+-        float_invalid_op_vximz(env, 1, retaddr);                       =
 \
+-    }                                                                  =
 \
+-    if ((TP##_is_infinity(arg1) || TP##_is_infinity(arg2)) &&          =
 \
+-        TP##_is_infinity(arg3)) {                                      =
 \
+-        uint8_t aSign, bSign, cSign;                                   =
 \
+-                                                                       =
 \
+-        aSign =3D TP##_is_neg(arg1);                                   =
   \
+-        bSign =3D TP##_is_neg(arg2);                                   =
   \
+-        cSign =3D TP##_is_neg(arg3);                                   =
   \
+-        if (madd_flags & float_muladd_negate_c) {                      =
 \
+-            cSign ^=3D 1;                                              =
   \
+-        }                                                              =
 \
+-        if (aSign ^ bSign ^ cSign) {                                   =
 \
+-            float_invalid_op_vxisi(env, 1, retaddr);                   =
 \
+-        }                                                              =
 \
+-    }                                                                  =
 \
++static void float_invalid_op_madd(CPUPPCState *env, int flags,
++                                  bool set_fpcc, uintptr_t retaddr)
++{
++    if (flags & float_flag_invalid_imz) {
++        float_invalid_op_vximz(env, set_fpcc, retaddr);
++    } else {
++        float_invalid_op_addsub(env, flags, set_fpcc, retaddr);
++    }
+ }
+-FPU_MADDSUB_UPDATE(float32_maddsub_update_excp, float32)
+-FPU_MADDSUB_UPDATE(float64_maddsub_update_excp, float64)
+=20
+ #define FPU_FMADD(op, madd_flags)                                      =
 \
+ uint64_t helper_##op(CPUPPCState *env, uint64_t arg1,                  =
 \
+@@ -682,8 +659,7 @@ uint64_t helper_##op(CPUPPCState *env, uint64_t arg1=
,                   \
+     flags =3D get_float_exception_flags(&env->fp_status);              =
   \
+     if (flags) {                                                       =
 \
+         if (flags & float_flag_invalid) {                              =
 \
+-            float64_maddsub_update_excp(env, arg1, arg2, arg3,         =
 \
+-                                        madd_flags, GETPC());          =
 \
++            float_invalid_op_madd(env, flags, 1, GETPC());             =
 \
+         }                                                              =
 \
+         do_float_check_status(env, GETPC());                           =
 \
+     }                                                                  =
 \
+@@ -2087,8 +2063,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, =
                            \
+         env->fp_status.float_exception_flags |=3D tstat.float_exception=
_flags;  \
+                                                                        =
       \
+         if (unlikely(tstat.float_exception_flags & float_flag_invalid))=
 {     \
+-            tp##_maddsub_update_excp(env, xa->fld, b->fld,             =
       \
+-                                     c->fld, maddflgs, GETPC());       =
       \
++            float_invalid_op_madd(env, tstat.float_exception_flags,    =
       \
++                                  sfprf, GETPC());                     =
       \
+         }                                                              =
       \
+                                                                        =
       \
+         if (r2sp) {                                                    =
       \
+--=20
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0010-target-ppc-Split-out-do=
_fmadd.patch b/meta/recipes-devtools/qemu/qemu/0010-target-ppc-Split-out-=
do_fmadd.patch
new file mode 100644
index 0000000000..4d19773200
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0010-target-ppc-Split-out-do_fmadd.=
patch
@@ -0,0 +1,71 @@
+From f024b8937d8b614994b94e86d2240fafcc7d2d73 Mon Sep 17 00:00:00 2001
+From: Richard Henderson <richard.henderson@linaro.org>
+Date: Fri, 17 Dec 2021 17:57:15 +0100
+Subject: [PATCH 10/21] target/ppc: Split out do_fmadd
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Create a common function for all of the madd helpers.
+Let the compiler tail call or inline as it chooses.
+
+Upstream-Status: Backport
+[https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dffdaff8e9c698061f57a6=
b1827570562c5a1c909]
+
+Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
+Message-Id: <20211119160502.17432-20-richard.henderson@linaro.org>
+Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ target/ppc/fpu_helper.c | 33 ++++++++++++++++++---------------
+ 1 file changed, 18 insertions(+), 15 deletions(-)
+
+diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
+index 3b1cb25666..9a1e7e6244 100644
+--- a/target/ppc/fpu_helper.c
++++ b/target/ppc/fpu_helper.c
+@@ -649,23 +649,26 @@ static void float_invalid_op_madd(CPUPPCState *env=
, int flags,
+     }
+ }
+=20
+-#define FPU_FMADD(op, madd_flags)                                      =
 \
+-uint64_t helper_##op(CPUPPCState *env, uint64_t arg1,                  =
 \
+-                     uint64_t arg2, uint64_t arg3)                     =
 \
+-{                                                                      =
 \
+-    uint32_t flags;                                                    =
 \
+-    float64 ret =3D float64_muladd(arg1, arg2, arg3, madd_flags,       =
   \
+-                                 &env->fp_status);                     =
 \
+-    flags =3D get_float_exception_flags(&env->fp_status);              =
   \
+-    if (flags) {                                                       =
 \
+-        if (flags & float_flag_invalid) {                              =
 \
+-            float_invalid_op_madd(env, flags, 1, GETPC());             =
 \
+-        }                                                              =
 \
+-        do_float_check_status(env, GETPC());                           =
 \
+-    }                                                                  =
 \
+-    return ret;                                                        =
 \
++static float64 do_fmadd(CPUPPCState *env, float64 a, float64 b,
++                         float64 c, int madd_flags, uintptr_t retaddr)
++{
++    float64 ret =3D float64_muladd(a, b, c, madd_flags, &env->fp_status=
);
++    int flags =3D get_float_exception_flags(&env->fp_status);
++
++    if (flags) {
++        if (flags & float_flag_invalid) {
++            float_invalid_op_madd(env, flags, 1, retaddr);
++        }
++        do_float_check_status(env, retaddr);
++    }
++    return ret;
+ }
+=20
++#define FPU_FMADD(op, madd_flags)                                    \
++    uint64_t helper_##op(CPUPPCState *env, uint64_t arg1,            \
++                         uint64_t arg2, uint64_t arg3)               \
++    { return do_fmadd(env, arg1, arg2, arg3, madd_flags, GETPC()); }
++
+ #define MADD_FLGS 0
+ #define MSUB_FLGS float_muladd_negate_c
+ #define NMADD_FLGS float_muladd_negate_result
+--=20
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0011-target-ppc-Fix-xs-max-m=
in-cj-dp-to-use-VSX-registers.patch b/meta/recipes-devtools/qemu/qemu/001=
1-target-ppc-Fix-xs-max-min-cj-dp-to-use-VSX-registers.patch
new file mode 100644
index 0000000000..0daae55b99
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0011-target-ppc-Fix-xs-max-min-cj-d=
p-to-use-VSX-registers.patch
@@ -0,0 +1,93 @@
+From a1821ad612994b95cb6597efd15e0a888676386c Mon Sep 17 00:00:00 2001
+From: Victor Colombo <victor.colombo@eldorado.org.br>
+Date: Fri, 17 Dec 2021 17:57:18 +0100
+Subject: [PATCH 11/21] target/ppc: Fix xs{max, min}[cj]dp to use VSX reg=
isters
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+PPC instruction xsmaxcdp, xsmincdp, xsmaxjdp, and xsminjdp are using
+vector registers when they should be using VSX ones. This happens
+because the instructions are using GEN_VSX_HELPER_R3, which adds 32
+to the register numbers, effectively making them vector registers.
+
+This patch fixes it by changing these instructions to use
+GEN_VSX_HELPER_X3.
+
+Upstream-Status: Backport
+[https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D201fc774e0e1cc76ec23b=
595968004a7b14fb6e8]
+
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Signed-off-by: Victor Colombo <victor.colombo@eldorado.org.br>
+Message-Id: <20211213120958.24443-2-victor.colombo@eldorado.org.br>
+Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ target/ppc/fpu_helper.c             | 4 ++--
+ target/ppc/helper.h                 | 8 ++++----
+ target/ppc/translate/vsx-impl.c.inc | 8 ++++----
+ 3 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
+index 9a1e7e6244..ecdcd36a11 100644
+--- a/target/ppc/fpu_helper.c
++++ b/target/ppc/fpu_helper.c
+@@ -2375,7 +2375,7 @@ VSX_MAX_MIN(xvmindp, minnum, 2, float64, VsrD(i))
+ VSX_MAX_MIN(xvminsp, minnum, 4, float32, VsrW(i))
+=20
+ #define VSX_MAX_MINC(name, max)                                        =
       \
+-void helper_##name(CPUPPCState *env, uint32_t opcode,                  =
       \
++void helper_##name(CPUPPCState *env,                                   =
       \
+                    ppc_vsr_t *xt, ppc_vsr_t *xa, ppc_vsr_t *xb)        =
       \
+ {                                                                      =
       \
+     ppc_vsr_t t =3D *xt;                                               =
         \
+@@ -2410,7 +2410,7 @@ VSX_MAX_MINC(xsmaxcdp, 1);
+ VSX_MAX_MINC(xsmincdp, 0);
+=20
+ #define VSX_MAX_MINJ(name, max)                                        =
       \
+-void helper_##name(CPUPPCState *env, uint32_t opcode,                  =
       \
++void helper_##name(CPUPPCState *env,                                   =
       \
+                    ppc_vsr_t *xt, ppc_vsr_t *xa, ppc_vsr_t *xb)        =
       \
+ {                                                                      =
       \
+     ppc_vsr_t t =3D *xt;                                               =
         \
+diff --git a/target/ppc/helper.h b/target/ppc/helper.h
+index 627811cefc..12a3d5f269 100644
+--- a/target/ppc/helper.h
++++ b/target/ppc/helper.h
+@@ -392,10 +392,10 @@ DEF_HELPER_4(xscmpoqp, void, env, i32, vsr, vsr)
+ DEF_HELPER_4(xscmpuqp, void, env, i32, vsr, vsr)
+ DEF_HELPER_4(xsmaxdp, void, env, vsr, vsr, vsr)
+ DEF_HELPER_4(xsmindp, void, env, vsr, vsr, vsr)
+-DEF_HELPER_5(xsmaxcdp, void, env, i32, vsr, vsr, vsr)
+-DEF_HELPER_5(xsmincdp, void, env, i32, vsr, vsr, vsr)
+-DEF_HELPER_5(xsmaxjdp, void, env, i32, vsr, vsr, vsr)
+-DEF_HELPER_5(xsminjdp, void, env, i32, vsr, vsr, vsr)
++DEF_HELPER_4(xsmaxcdp, void, env, vsr, vsr, vsr)
++DEF_HELPER_4(xsmincdp, void, env, vsr, vsr, vsr)
++DEF_HELPER_4(xsmaxjdp, void, env, vsr, vsr, vsr)
++DEF_HELPER_4(xsminjdp, void, env, vsr, vsr, vsr)
+ DEF_HELPER_3(xscvdphp, void, env, vsr, vsr)
+ DEF_HELPER_4(xscvdpqp, void, env, i32, vsr, vsr)
+ DEF_HELPER_3(xscvdpsp, void, env, vsr, vsr)
+diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/=
vsx-impl.c.inc
+index c0e38060b4..02df75339e 100644
+--- a/target/ppc/translate/vsx-impl.c.inc
++++ b/target/ppc/translate/vsx-impl.c.inc
+@@ -1098,10 +1098,10 @@ GEN_VSX_HELPER_R2_AB(xscmpoqp, 0x04, 0x04, 0, PP=
C2_VSX)
+ GEN_VSX_HELPER_R2_AB(xscmpuqp, 0x04, 0x14, 0, PPC2_VSX)
+ GEN_VSX_HELPER_X3(xsmaxdp, 0x00, 0x14, 0, PPC2_VSX)
+ GEN_VSX_HELPER_X3(xsmindp, 0x00, 0x15, 0, PPC2_VSX)
+-GEN_VSX_HELPER_R3(xsmaxcdp, 0x00, 0x10, 0, PPC2_ISA300)
+-GEN_VSX_HELPER_R3(xsmincdp, 0x00, 0x11, 0, PPC2_ISA300)
+-GEN_VSX_HELPER_R3(xsmaxjdp, 0x00, 0x12, 0, PPC2_ISA300)
+-GEN_VSX_HELPER_R3(xsminjdp, 0x00, 0x12, 0, PPC2_ISA300)
++GEN_VSX_HELPER_X3(xsmaxcdp, 0x00, 0x10, 0, PPC2_ISA300)
++GEN_VSX_HELPER_X3(xsmincdp, 0x00, 0x11, 0, PPC2_ISA300)
++GEN_VSX_HELPER_X3(xsmaxjdp, 0x00, 0x12, 0, PPC2_ISA300)
++GEN_VSX_HELPER_X3(xsminjdp, 0x00, 0x12, 0, PPC2_ISA300)
+ GEN_VSX_HELPER_X2(xscvdphp, 0x16, 0x15, 0x11, PPC2_ISA300)
+ GEN_VSX_HELPER_X2(xscvdpsp, 0x12, 0x10, 0, PPC2_VSX)
+ GEN_VSX_HELPER_R2(xscvdpqp, 0x04, 0x1A, 0x16, PPC2_ISA300)
+--=20
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0012-target-ppc-Move-xs-max-=
min-cj-dp-to-decodetree.patch b/meta/recipes-devtools/qemu/qemu/0012-targ=
et-ppc-Move-xs-max-min-cj-dp-to-decodetree.patch
new file mode 100644
index 0000000000..e9b99c9b4e
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0012-target-ppc-Move-xs-max-min-cj-=
dp-to-decodetree.patch
@@ -0,0 +1,121 @@
+From 1cbb2622de34ee034f1dd7196567673c52c84805 Mon Sep 17 00:00:00 2001
+From: Victor Colombo <victor.colombo@eldorado.org.br>
+Date: Fri, 17 Dec 2021 17:57:18 +0100
+Subject: [PATCH 12/21] target/ppc: Move xs{max,min}[cj]dp to decodetree
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport
+[https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dc5df1898a147c232f0502=
cda5dac8df6074070fc]
+
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Signed-off-by: Victor Colombo <victor.colombo@eldorado.org.br>
+Message-Id: <20211213120958.24443-3-victor.colombo@eldorado.org.br>
+Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ target/ppc/insn32.decode            | 17 +++++++++++++---
+ target/ppc/translate/vsx-impl.c.inc | 30 +++++++++++++++++++++++++----
+ target/ppc/translate/vsx-ops.c.inc  |  4 ----
+ 3 files changed, 40 insertions(+), 11 deletions(-)
+
+diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
+index e135b8aba4..759b2a9aa5 100644
+--- a/target/ppc/insn32.decode
++++ b/target/ppc/insn32.decode
+@@ -123,10 +123,14 @@
+ &X_vrt_frbp     vrt frbp
+ @X_vrt_frbp     ...... vrt:5 ..... ....0 .......... .           &X_vrt_=
frbp frbp=3D%x_frbp
+=20
++%xx_xt          0:1 21:5
++%xx_xb          1:1 11:5
++%xx_xa          2:1 16:5
+ &XX2            xt xb uim:uint8_t
+-%xx2_xt         0:1 21:5
+-%xx2_xb         1:1 11:5
+-@XX2            ...... ..... ... uim:2 ..... ......... ..       &XX2 xt=
=3D%xx2_xt xb=3D%xx2_xb
++@XX2            ...... ..... ... uim:2 ..... ......... ..       &XX2 xt=
=3D%xx_xt xb=3D%xx_xb
++
++&XX3            xt xa xb
++@XX3            ...... ..... ..... ..... ........ ...           &XX3 xt=
=3D%xx_xt xa=3D%xx_xa xb=3D%xx_xb
+=20
+ &Z22_bf_fra     bf fra dm
+ @Z22_bf_fra     ...... bf:3 .. fra:5 dm:6 ......... .           &Z22_bf=
_fra
+@@ -427,3 +431,10 @@ XXSPLTW         111100 ..... ---.. ..... 010100100 =
. .  @XX2
+ ## VSX Vector Load Special Value Instruction
+=20
+ LXVKQ           111100 ..... 11111 ..... 0101101000 .   @X_uim5
++
++## VSX Comparison Instructions
++
++XSMAXCDP        111100 ..... ..... ..... 10000000 ...   @XX3
++XSMINCDP        111100 ..... ..... ..... 10001000 ...   @XX3
++XSMAXJDP        111100 ..... ..... ..... 10010000 ...   @XX3
++XSMINJDP        111100 ..... ..... ..... 10011000 ...   @XX3
+diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/=
vsx-impl.c.inc
+index 02df75339e..e2447750dd 100644
+--- a/target/ppc/translate/vsx-impl.c.inc
++++ b/target/ppc/translate/vsx-impl.c.inc
+@@ -1098,10 +1098,6 @@ GEN_VSX_HELPER_R2_AB(xscmpoqp, 0x04, 0x04, 0, PPC=
2_VSX)
+ GEN_VSX_HELPER_R2_AB(xscmpuqp, 0x04, 0x14, 0, PPC2_VSX)
+ GEN_VSX_HELPER_X3(xsmaxdp, 0x00, 0x14, 0, PPC2_VSX)
+ GEN_VSX_HELPER_X3(xsmindp, 0x00, 0x15, 0, PPC2_VSX)
+-GEN_VSX_HELPER_X3(xsmaxcdp, 0x00, 0x10, 0, PPC2_ISA300)
+-GEN_VSX_HELPER_X3(xsmincdp, 0x00, 0x11, 0, PPC2_ISA300)
+-GEN_VSX_HELPER_X3(xsmaxjdp, 0x00, 0x12, 0, PPC2_ISA300)
+-GEN_VSX_HELPER_X3(xsminjdp, 0x00, 0x12, 0, PPC2_ISA300)
+ GEN_VSX_HELPER_X2(xscvdphp, 0x16, 0x15, 0x11, PPC2_ISA300)
+ GEN_VSX_HELPER_X2(xscvdpsp, 0x12, 0x10, 0, PPC2_VSX)
+ GEN_VSX_HELPER_R2(xscvdpqp, 0x04, 0x1A, 0x16, PPC2_ISA300)
+@@ -2185,6 +2181,32 @@ TRANS(XXBLENDVH, do_xxblendv, MO_16)
+ TRANS(XXBLENDVW, do_xxblendv, MO_32)
+ TRANS(XXBLENDVD, do_xxblendv, MO_64)
+=20
++static bool do_xsmaxmincjdp(DisasContext *ctx, arg_XX3 *a,
++                            void (*helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr=
, TCGv_ptr))
++{
++    TCGv_ptr xt, xa, xb;
++
++    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
++    REQUIRE_VSX(ctx);
++
++    xt =3D gen_vsr_ptr(a->xt);
++    xa =3D gen_vsr_ptr(a->xa);
++    xb =3D gen_vsr_ptr(a->xb);
++
++    helper(cpu_env, xt, xa, xb);
++
++    tcg_temp_free_ptr(xt);
++    tcg_temp_free_ptr(xa);
++    tcg_temp_free_ptr(xb);
++
++    return true;
++}
++
++TRANS(XSMAXCDP, do_xsmaxmincjdp, gen_helper_xsmaxcdp)
++TRANS(XSMINCDP, do_xsmaxmincjdp, gen_helper_xsmincdp)
++TRANS(XSMAXJDP, do_xsmaxmincjdp, gen_helper_xsmaxjdp)
++TRANS(XSMINJDP, do_xsmaxmincjdp, gen_helper_xsminjdp)
++
+ #undef GEN_XX2FORM
+ #undef GEN_XX3FORM
+ #undef GEN_XX2IFORM
+diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/v=
sx-ops.c.inc
+index 152d1e5c3b..f980bc1bae 100644
+--- a/target/ppc/translate/vsx-ops.c.inc
++++ b/target/ppc/translate/vsx-ops.c.inc
+@@ -207,10 +207,6 @@ GEN_VSX_XFORM_300(xscmpoqp, 0x04, 0x04, 0x00600001)=
,
+ GEN_VSX_XFORM_300(xscmpuqp, 0x04, 0x14, 0x00600001),
+ GEN_XX3FORM(xsmaxdp, 0x00, 0x14, PPC2_VSX),
+ GEN_XX3FORM(xsmindp, 0x00, 0x15, PPC2_VSX),
+-GEN_XX3FORM(xsmaxcdp, 0x00, 0x10, PPC2_ISA300),
+-GEN_XX3FORM(xsmincdp, 0x00, 0x11, PPC2_ISA300),
+-GEN_XX3FORM(xsmaxjdp, 0x00, 0x12, PPC2_ISA300),
+-GEN_XX3FORM(xsminjdp, 0x00, 0x13, PPC2_ISA300),
+ GEN_XX2FORM_EO(xscvdphp, 0x16, 0x15, 0x11, PPC2_ISA300),
+ GEN_XX2FORM(xscvdpsp, 0x12, 0x10, PPC2_VSX),
+ GEN_XX2FORM(xscvdpspn, 0x16, 0x10, PPC2_VSX207),
+--=20
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0013-target-ppc-fix-xscvqpdp=
-register-access.patch b/meta/recipes-devtools/qemu/qemu/0013-target-ppc-=
fix-xscvqpdp-register-access.patch
new file mode 100644
index 0000000000..100dcd25bc
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0013-target-ppc-fix-xscvqpdp-regist=
er-access.patch
@@ -0,0 +1,41 @@
+From 98ff271a4d1a1d60ae53b1f742df7c188b163375 Mon Sep 17 00:00:00 2001
+From: Matheus Ferst <matheus.ferst@eldorado.org.br>
+Date: Fri, 17 Dec 2021 17:57:18 +0100
+Subject: [PATCH 13/21] target/ppc: fix xscvqpdp register access
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This instruction has VRT and VRB fields instead of T/TX and B/BX.
+
+Upstream-Status: Backport
+[https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D38d4914c5065e14f09691=
61274793ded448f067f]
+
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
+Message-Id: <20211213120958.24443-4-victor.colombo@eldorado.org.br>
+Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ target/ppc/translate/vsx-impl.c.inc | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/=
vsx-impl.c.inc
+index e2447750dd..ab5cb21f13 100644
+--- a/target/ppc/translate/vsx-impl.c.inc
++++ b/target/ppc/translate/vsx-impl.c.inc
+@@ -913,8 +913,9 @@ static void gen_xscvqpdp(DisasContext *ctx)
+         return;
+     }
+     opc =3D tcg_const_i32(ctx->opcode);
+-    xt =3D gen_vsr_ptr(xT(ctx->opcode));
+-    xb =3D gen_vsr_ptr(xB(ctx->opcode));
++
++    xt =3D gen_vsr_ptr(rD(ctx->opcode) + 32);
++    xb =3D gen_vsr_ptr(rB(ctx->opcode) + 32);
+     gen_helper_xscvqpdp(cpu_env, opc, xt, xb);
+     tcg_temp_free_i32(opc);
+     tcg_temp_free_ptr(xt);
+--=20
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0014-target-ppc-move-xscvqpd=
p-to-decodetree.patch b/meta/recipes-devtools/qemu/qemu/0014-target-ppc-m=
ove-xscvqpdp-to-decodetree.patch
new file mode 100644
index 0000000000..345a49c90c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0014-target-ppc-move-xscvqpdp-to-de=
codetree.patch
@@ -0,0 +1,130 @@
+From c76ea6322bd70c36c9b396cf356167b36928e811 Mon Sep 17 00:00:00 2001
+From: Matheus Ferst <matheus.ferst@eldorado.org.br>
+Date: Fri, 17 Dec 2021 17:57:18 +0100
+Subject: [PATCH 14/21] target/ppc: move xscvqpdp to decodetree
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport
+[https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dcaf6f9b568479bea6f6d9=
7798be670f21641a006]
+
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
+Message-Id: <20211213120958.24443-5-victor.colombo@eldorado.org.br>
+Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ target/ppc/fpu_helper.c             | 10 +++-------
+ target/ppc/helper.h                 |  2 +-
+ target/ppc/insn32.decode            |  4 ++++
+ target/ppc/translate/vsx-impl.c.inc | 24 +++++++++++++-----------
+ target/ppc/translate/vsx-ops.c.inc  |  1 -
+ 5 files changed, 21 insertions(+), 20 deletions(-)
+
+diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
+index ecdcd36a11..5cc7fb1dcb 100644
+--- a/target/ppc/fpu_helper.c
++++ b/target/ppc/fpu_helper.c
+@@ -2631,18 +2631,14 @@ VSX_CVT_FP_TO_FP_HP(xscvhpdp, 1, float16, float6=
4, VsrH(3), VsrD(0), 1)
+ VSX_CVT_FP_TO_FP_HP(xvcvsphp, 4, float32, float16, VsrW(i), VsrH(2 * i =
 + 1), 0)
+ VSX_CVT_FP_TO_FP_HP(xvcvhpsp, 4, float16, float32, VsrH(2 * i + 1), Vsr=
W(i), 0)
+=20
+-/*
+- * xscvqpdp isn't using VSX_CVT_FP_TO_FP() because xscvqpdpo will be
+- * added to this later.
+- */
+-void helper_xscvqpdp(CPUPPCState *env, uint32_t opcode,
+-                     ppc_vsr_t *xt, ppc_vsr_t *xb)
++void helper_XSCVQPDP(CPUPPCState *env, uint32_t ro, ppc_vsr_t *xt,
++                     ppc_vsr_t *xb)
+ {
+     ppc_vsr_t t =3D { };
+     float_status tstat;
+=20
+     tstat =3D env->fp_status;
+-    if (unlikely(Rc(opcode) !=3D 0)) {
++    if (ro !=3D 0) {
+         tstat.float_rounding_mode =3D float_round_to_odd;
+     }
+=20
+diff --git a/target/ppc/helper.h b/target/ppc/helper.h
+index 12a3d5f269..ef5bdd38a7 100644
+--- a/target/ppc/helper.h
++++ b/target/ppc/helper.h
+@@ -400,7 +400,7 @@ DEF_HELPER_3(xscvdphp, void, env, vsr, vsr)
+ DEF_HELPER_4(xscvdpqp, void, env, i32, vsr, vsr)
+ DEF_HELPER_3(xscvdpsp, void, env, vsr, vsr)
+ DEF_HELPER_2(xscvdpspn, i64, env, i64)
+-DEF_HELPER_4(xscvqpdp, void, env, i32, vsr, vsr)
++DEF_HELPER_4(XSCVQPDP, void, env, i32, vsr, vsr)
+ DEF_HELPER_4(xscvqpsdz, void, env, i32, vsr, vsr)
+ DEF_HELPER_4(xscvqpswz, void, env, i32, vsr, vsr)
+ DEF_HELPER_4(xscvqpudz, void, env, i32, vsr, vsr)
+diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
+index 759b2a9aa5..fd6bb13fa0 100644
+--- a/target/ppc/insn32.decode
++++ b/target/ppc/insn32.decode
+@@ -438,3 +438,7 @@ XSMAXCDP        111100 ..... ..... ..... 10000000 ..=
.   @XX3
+ XSMINCDP        111100 ..... ..... ..... 10001000 ...   @XX3
+ XSMAXJDP        111100 ..... ..... ..... 10010000 ...   @XX3
+ XSMINJDP        111100 ..... ..... ..... 10011000 ...   @XX3
++
++## VSX Binary Floating-Point Convert Instructions
++
++XSCVQPDP        111111 ..... 10100 ..... 1101000100 .   @X_tb_rc
+diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/=
vsx-impl.c.inc
+index ab5cb21f13..c08185e857 100644
+--- a/target/ppc/translate/vsx-impl.c.inc
++++ b/target/ppc/translate/vsx-impl.c.inc
+@@ -904,22 +904,24 @@ VSX_CMP(xvcmpgesp, 0x0C, 0x0A, 0, PPC2_VSX)
+ VSX_CMP(xvcmpgtsp, 0x0C, 0x09, 0, PPC2_VSX)
+ VSX_CMP(xvcmpnesp, 0x0C, 0x0B, 0, PPC2_VSX)
+=20
+-static void gen_xscvqpdp(DisasContext *ctx)
++static bool trans_XSCVQPDP(DisasContext *ctx, arg_X_tb_rc *a)
+ {
+-    TCGv_i32 opc;
++    TCGv_i32 ro;
+     TCGv_ptr xt, xb;
+-    if (unlikely(!ctx->vsx_enabled)) {
+-        gen_exception(ctx, POWERPC_EXCP_VSXU);
+-        return;
+-    }
+-    opc =3D tcg_const_i32(ctx->opcode);
+=20
+-    xt =3D gen_vsr_ptr(rD(ctx->opcode) + 32);
+-    xb =3D gen_vsr_ptr(rB(ctx->opcode) + 32);
+-    gen_helper_xscvqpdp(cpu_env, opc, xt, xb);
+-    tcg_temp_free_i32(opc);
++    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
++    REQUIRE_VSX(ctx);
++
++    ro =3D tcg_const_i32(a->rc);
++
++    xt =3D gen_avr_ptr(a->rt);
++    xb =3D gen_avr_ptr(a->rb);
++    gen_helper_XSCVQPDP(cpu_env, ro, xt, xb);
++    tcg_temp_free_i32(ro);
+     tcg_temp_free_ptr(xt);
+     tcg_temp_free_ptr(xb);
++
++    return true;
+ }
+=20
+ #define GEN_VSX_HELPER_2(name, op1, op2, inval, type)                  =
       \
+diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/v=
sx-ops.c.inc
+index f980bc1bae..c974324c4c 100644
+--- a/target/ppc/translate/vsx-ops.c.inc
++++ b/target/ppc/translate/vsx-ops.c.inc
+@@ -133,7 +133,6 @@ GEN_VSX_XFORM_300_EO(xsnabsqp, 0x04, 0x19, 0x08, 0x0=
0000001),
+ GEN_VSX_XFORM_300_EO(xsnegqp, 0x04, 0x19, 0x10, 0x00000001),
+ GEN_VSX_XFORM_300(xscpsgnqp, 0x04, 0x03, 0x00000001),
+ GEN_VSX_XFORM_300_EO(xscvdpqp, 0x04, 0x1A, 0x16, 0x00000001),
+-GEN_VSX_XFORM_300_EO(xscvqpdp, 0x04, 0x1A, 0x14, 0x0),
+ GEN_VSX_XFORM_300_EO(xscvqpsdz, 0x04, 0x1A, 0x19, 0x00000001),
+ GEN_VSX_XFORM_300_EO(xscvqpswz, 0x04, 0x1A, 0x09, 0x00000001),
+ GEN_VSX_XFORM_300_EO(xscvqpudz, 0x04, 0x1A, 0x11, 0x00000001),
+--=20
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0015-target-ppc-ppc_store_fp=
scr-doesn-t-update-bits-0-to-.patch b/meta/recipes-devtools/qemu/qemu/001=
5-target-ppc-ppc_store_fpscr-doesn-t-update-bits-0-to-.patch
new file mode 100644
index 0000000000..5c5f972961
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0015-target-ppc-ppc_store_fpscr-doe=
sn-t-update-bits-0-to-.patch
@@ -0,0 +1,70 @@
+From 7448ee811d86b18a7f7f59e20853bd852e548f59 Mon Sep 17 00:00:00 2001
+From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
+Date: Fri, 17 Dec 2021 17:57:13 +0100
+Subject: [PATCH 15/21] target/ppc: ppc_store_fpscr doesn't update bits 0=
 to 28
+ and 52
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This commit fixes the difference reported in the bug in the reserved
+bit 52, it does this by adding this bit to the mask of bits to not be
+directly altered in the ppc_store_fpscr function (the hardware used to
+compare to QEMU was a Power9).
+
+The bits 0 to 27 were also added to the mask, as they are marked as
+reserved in the PowerISA and bit 28 is a reserved extension of the DRN
+field (bits 29:31) but can't be set using mtfsfi, while the other DRN
+bits may be set using mtfsfi instruction, so bit 28 was also added to
+the mask.
+
+Although this is a difference reported in the bug, since it's a reserved
+bit it may be a "don't care" case, as put in the bug report. Looking at
+the ISA it doesn't explicitly mention this bit can't be set, like it
+does for FEX and VX, so I'm unsure if this is necessary.
+
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/266
+
+Upstream-Status: Backport
+[https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D25ee608d79c1890c0f4e8=
c495ec8629d5712de45]
+
+Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.=
br>
+Message-Id: <20211201163808.440385-4-lucas.araujo@eldorado.org.br>
+Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ target/ppc/cpu.c | 2 +-
+ target/ppc/cpu.h | 4 ++++
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
+index f933d9f2bd..d7b42bae52 100644
+--- a/target/ppc/cpu.c
++++ b/target/ppc/cpu.c
+@@ -112,7 +112,7 @@ static inline void fpscr_set_rounding_mode(CPUPPCSta=
te *env)
+=20
+ void ppc_store_fpscr(CPUPPCState *env, target_ulong val)
+ {
+-    val &=3D ~(FP_VX | FP_FEX);
++    val &=3D FPSCR_MTFS_MASK;
+     if (val & FPSCR_IX) {
+         val |=3D FP_VX;
+     }
+diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
+index e946da5f3a..441d3dce19 100644
+--- a/target/ppc/cpu.h
++++ b/target/ppc/cpu.h
+@@ -759,6 +759,10 @@ enum {
+                           FP_VXZDZ  | FP_VXIMZ  | FP_VXVC   | FP_VXSOFT=
 | \
+                           FP_VXSQRT | FP_VXCVI)
+=20
++/* FPSCR bits that can be set by mtfsf, mtfsfi and mtfsb1 */
++#define FPSCR_MTFS_MASK (~(MAKE_64BIT_MASK(36, 28) | PPC_BIT(28) |     =
   \
++                           FP_FEX | FP_VX | PPC_BIT(52)))
++
+ /**********************************************************************=
*******/
+ /* Vector status and control register */
+ #define VSCR_NJ         16 /* Vector non-java */
+--=20
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0016-target-ppc-Introduce-TR=
ANS-FLAGS-macros.patch b/meta/recipes-devtools/qemu/qemu/0016-target-ppc-=
Introduce-TRANS-FLAGS-macros.patch
new file mode 100644
index 0000000000..3b651c0b3e
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0016-target-ppc-Introduce-TRANS-FLA=
GS-macros.patch
@@ -0,0 +1,133 @@
+From 232f979babccd6dfac40a54ee33521e652a0577c Mon Sep 17 00:00:00 2001
+From: Luis Pires <luis.pires@eldorado.org.br>
+Date: Wed, 2 Mar 2022 06:51:36 +0100
+Subject: [PATCH 16/21] target/ppc: Introduce TRANS*FLAGS macros
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+New macros that add FLAGS and FLAGS2 checking were added for
+both TRANS and TRANS64.
+
+Upstream-Status: Backport
+[https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D19f0862dd8fa6510b2f5b=
3aff4859363602cd0cf]
+
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
+[ferst: - TRANS_FLAGS2 instead of TRANS_FLAGS_E
+        - Use the new macros in load/store vector insns ]
+Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
+Message-Id: <20220225210936.1749575-2-matheus.ferst@eldorado.org.br>
+Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ target/ppc/translate.c              | 19 +++++++++++++++
+ target/ppc/translate/vsx-impl.c.inc | 37 ++++++++++-------------------
+ 2 files changed, 31 insertions(+), 25 deletions(-)
+
+diff --git a/target/ppc/translate.c b/target/ppc/translate.c
+index 9960df6e18..c12abc32f6 100644
+--- a/target/ppc/translate.c
++++ b/target/ppc/translate.c
+@@ -7377,10 +7377,29 @@ static int times_16(DisasContext *ctx, int x)
+ #define TRANS(NAME, FUNC, ...) \
+     static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
+     { return FUNC(ctx, a, __VA_ARGS__); }
++#define TRANS_FLAGS(FLAGS, NAME, FUNC, ...) \
++    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
++    {                                                          \
++        REQUIRE_INSNS_FLAGS(ctx, FLAGS);                       \
++        return FUNC(ctx, a, __VA_ARGS__);                      \
++    }
++#define TRANS_FLAGS2(FLAGS2, NAME, FUNC, ...) \
++    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
++    {                                                          \
++        REQUIRE_INSNS_FLAGS2(ctx, FLAGS2);                     \
++        return FUNC(ctx, a, __VA_ARGS__);                      \
++    }
+=20
+ #define TRANS64(NAME, FUNC, ...) \
+     static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
+     { REQUIRE_64BIT(ctx); return FUNC(ctx, a, __VA_ARGS__); }
++#define TRANS64_FLAGS2(FLAGS2, NAME, FUNC, ...) \
++    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
++    {                                                          \
++        REQUIRE_64BIT(ctx);                                    \
++        REQUIRE_INSNS_FLAGS2(ctx, FLAGS2);                     \
++        return FUNC(ctx, a, __VA_ARGS__);                      \
++    }
+=20
+ /* TODO: More TRANS* helpers for extra insn_flags checks. */
+=20
+diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/=
vsx-impl.c.inc
+index c08185e857..99c8a57e50 100644
+--- a/target/ppc/translate/vsx-impl.c.inc
++++ b/target/ppc/translate/vsx-impl.c.inc
+@@ -2070,12 +2070,6 @@ static bool do_lstxv(DisasContext *ctx, int ra, T=
CGv displ,
+=20
+ static bool do_lstxv_D(DisasContext *ctx, arg_D *a, bool store, bool pa=
ired)
+ {
+-    if (paired) {
+-        REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+-    } else {
+-        REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+-    }
+-
+     if (paired || a->rt >=3D 32) {
+         REQUIRE_VSX(ctx);
+     } else {
+@@ -2089,7 +2083,6 @@ static bool do_lstxv_PLS_D(DisasContext *ctx, arg_=
PLS_D *a,
+                            bool store, bool paired)
+ {
+     arg_D d;
+-    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+     REQUIRE_VSX(ctx);
+=20
+     if (!resolve_PLS_D(ctx, &d, a)) {
+@@ -2101,12 +2094,6 @@ static bool do_lstxv_PLS_D(DisasContext *ctx, arg=
_PLS_D *a,
+=20
+ static bool do_lstxv_X(DisasContext *ctx, arg_X *a, bool store, bool pa=
ired)
+ {
+-    if (paired) {
+-        REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+-    } else {
+-        REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+-    }
+-
+     if (paired || a->rt >=3D 32) {
+         REQUIRE_VSX(ctx);
+     } else {
+@@ -2116,18 +2103,18 @@ static bool do_lstxv_X(DisasContext *ctx, arg_X =
*a, bool store, bool paired)
+     return do_lstxv(ctx, a->ra, cpu_gpr[a->rb], a->rt, store, paired);
+ }
+=20
+-TRANS(STXV, do_lstxv_D, true, false)
+-TRANS(LXV, do_lstxv_D, false, false)
+-TRANS(STXVP, do_lstxv_D, true, true)
+-TRANS(LXVP, do_lstxv_D, false, true)
+-TRANS(STXVX, do_lstxv_X, true, false)
+-TRANS(LXVX, do_lstxv_X, false, false)
+-TRANS(STXVPX, do_lstxv_X, true, true)
+-TRANS(LXVPX, do_lstxv_X, false, true)
+-TRANS64(PSTXV, do_lstxv_PLS_D, true, false)
+-TRANS64(PLXV, do_lstxv_PLS_D, false, false)
+-TRANS64(PSTXVP, do_lstxv_PLS_D, true, true)
+-TRANS64(PLXVP, do_lstxv_PLS_D, false, true)
++TRANS_FLAGS2(ISA300, STXV, do_lstxv_D, true, false)
++TRANS_FLAGS2(ISA300, LXV, do_lstxv_D, false, false)
++TRANS_FLAGS2(ISA310, STXVP, do_lstxv_D, true, true)
++TRANS_FLAGS2(ISA310, LXVP, do_lstxv_D, false, true)
++TRANS_FLAGS2(ISA300, STXVX, do_lstxv_X, true, false)
++TRANS_FLAGS2(ISA300, LXVX, do_lstxv_X, false, false)
++TRANS_FLAGS2(ISA310, STXVPX, do_lstxv_X, true, true)
++TRANS_FLAGS2(ISA310, LXVPX, do_lstxv_X, false, true)
++TRANS64_FLAGS2(ISA310, PSTXV, do_lstxv_PLS_D, true, false)
++TRANS64_FLAGS2(ISA310, PLXV, do_lstxv_PLS_D, false, false)
++TRANS64_FLAGS2(ISA310, PSTXVP, do_lstxv_PLS_D, true, true)
++TRANS64_FLAGS2(ISA310, PLXVP, do_lstxv_PLS_D, false, true)
+=20
+ static void gen_xxblendv_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCG=
v_vec b,
+                              TCGv_vec c)
+--=20
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0017-target-ppc-Implement-Ve=
ctor-Expand-Mask.patch b/meta/recipes-devtools/qemu/qemu/0017-target-ppc-=
Implement-Vector-Expand-Mask.patch
new file mode 100644
index 0000000000..6d6d6b86ed
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0017-target-ppc-Implement-Vector-Ex=
pand-Mask.patch
@@ -0,0 +1,105 @@
+From 4c6a16c2bcdd14249eef876d3d029c445716fb13 Mon Sep 17 00:00:00 2001
+From: Matheus Ferst <matheus.ferst@eldorado.org.br>
+Date: Fri, 17 Dec 2021 17:57:13 +0100
+Subject: [PATCH 17/21] target/ppc: Implement Vector Expand Mask
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Implement the following PowerISA v3.1 instructions:
+vexpandbm: Vector Expand Byte Mask
+vexpandhm: Vector Expand Halfword Mask
+vexpandwm: Vector Expand Word Mask
+vexpanddm: Vector Expand Doubleword Mask
+vexpandqm: Vector Expand Quadword Mask
+
+Upstream-Status: Backport
+[https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D5f1470b091007f24035d6=
d33149df49a6dd61682]
+
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
+Message-Id: <20211203194229.746275-2-matheus.ferst@eldorado.org.br>
+Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ target/ppc/insn32.decode            | 11 ++++++++++
+ target/ppc/translate/vmx-impl.c.inc | 34 +++++++++++++++++++++++++++++
+ 2 files changed, 45 insertions(+)
+
+diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
+index fd6bb13fa0..e032251c74 100644
+--- a/target/ppc/insn32.decode
++++ b/target/ppc/insn32.decode
+@@ -56,6 +56,9 @@
+ &VX_uim4        vrt uim vrb
+ @VX_uim4        ...... vrt:5 . uim:4 vrb:5 ...........  &VX_uim4
+=20
++&VX_tb          vrt vrb
++@VX_tb          ...... vrt:5 ..... vrb:5 ...........    &VX_tb
++
+ &X              rt ra rb
+ @X              ...... rt:5 ra:5 rb:5 .......... .      &X
+=20
+@@ -412,6 +415,14 @@ VINSWVRX        000100 ..... ..... ..... 0011000111=
1    @VX
+ VSLDBI          000100 ..... ..... ..... 00 ... 010110  @VN
+ VSRDBI          000100 ..... ..... ..... 01 ... 010110  @VN
+=20
++## Vector Mask Manipulation Instructions
++
++VEXPANDBM       000100 ..... 00000 ..... 11001000010    @VX_tb
++VEXPANDHM       000100 ..... 00001 ..... 11001000010    @VX_tb
++VEXPANDWM       000100 ..... 00010 ..... 11001000010    @VX_tb
++VEXPANDDM       000100 ..... 00011 ..... 11001000010    @VX_tb
++VEXPANDQM       000100 ..... 00100 ..... 11001000010    @VX_tb
++
+ # VSX Load/Store Instructions
+=20
+ LXV             111101 ..... ..... ............ . 001   @DQ_TSX
+diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/=
vmx-impl.c.inc
+index 8eb8d3a067..ebb0484323 100644
+--- a/target/ppc/translate/vmx-impl.c.inc
++++ b/target/ppc/translate/vmx-impl.c.inc
+@@ -1491,6 +1491,40 @@ static bool trans_VSRDBI(DisasContext *ctx, arg_V=
N *a)
+     return true;
+ }
+=20
++static bool do_vexpand(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
++{
++    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
++    REQUIRE_VECTOR(ctx);
++
++    tcg_gen_gvec_sari(vece, avr_full_offset(a->vrt), avr_full_offset(a-=
>vrb),
++                      (8 << vece) - 1, 16, 16);
++
++    return true;
++}
++
++TRANS(VEXPANDBM, do_vexpand, MO_8)
++TRANS(VEXPANDHM, do_vexpand, MO_16)
++TRANS(VEXPANDWM, do_vexpand, MO_32)
++TRANS(VEXPANDDM, do_vexpand, MO_64)
++
++static bool trans_VEXPANDQM(DisasContext *ctx, arg_VX_tb *a)
++{
++    TCGv_i64 tmp;
++
++    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
++    REQUIRE_VECTOR(ctx);
++
++    tmp =3D tcg_temp_new_i64();
++
++    get_avr64(tmp, a->vrb, true);
++    tcg_gen_sari_i64(tmp, tmp, 63);
++    set_avr64(a->vrt, tmp, false);
++    set_avr64(a->vrt, tmp, true);
++
++    tcg_temp_free_i64(tmp);
++    return true;
++}
++
+ #define GEN_VAFORM_PAIRED(name0, name1, opc2)                          =
 \
+ static void glue(gen_, name0##_##name1)(DisasContext *ctx)             =
 \
+     {                                                                  =
 \
+--=20
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0018-target-ppc-Implement-Ve=
ctor-Extract-Mask.patch b/meta/recipes-devtools/qemu/qemu/0018-target-ppc=
-Implement-Vector-Extract-Mask.patch
new file mode 100644
index 0000000000..57450c6fb7
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0018-target-ppc-Implement-Vector-Ex=
tract-Mask.patch
@@ -0,0 +1,141 @@
+From 2dc8450e80b82c481904570dce789843b031db13 Mon Sep 17 00:00:00 2001
+From: Matheus Ferst <matheus.ferst@eldorado.org.br>
+Date: Fri, 17 Dec 2021 17:57:13 +0100
+Subject: [PATCH 18/21] target/ppc: Implement Vector Extract Mask
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Implement the following PowerISA v3.1 instructions:
+vextractbm: Vector Extract Byte Mask
+vextracthm: Vector Extract Halfword Mask
+vextractwm: Vector Extract Word Mask
+vextractdm: Vector Extract Doubleword Mask
+vextractqm: Vector Extract Quadword Mask
+
+Upstream-Status: Backport
+[https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D17868d81e0074905b2c1e=
414af6618570e8059eb]
+
+Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Message-Id: <20211203194229.746275-3-matheus.ferst@eldorado.org.br>
+Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ target/ppc/insn32.decode            |  6 +++
+ target/ppc/translate/vmx-impl.c.inc | 82 +++++++++++++++++++++++++++++
+ 2 files changed, 88 insertions(+)
+
+diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
+index e032251c74..b0568b1356 100644
+--- a/target/ppc/insn32.decode
++++ b/target/ppc/insn32.decode
+@@ -423,6 +423,12 @@ VEXPANDWM       000100 ..... 00010 ..... 1100100001=
0    @VX_tb
+ VEXPANDDM       000100 ..... 00011 ..... 11001000010    @VX_tb
+ VEXPANDQM       000100 ..... 00100 ..... 11001000010    @VX_tb
+=20
++VEXTRACTBM      000100 ..... 01000 ..... 11001000010    @VX_tb
++VEXTRACTHM      000100 ..... 01001 ..... 11001000010    @VX_tb
++VEXTRACTWM      000100 ..... 01010 ..... 11001000010    @VX_tb
++VEXTRACTDM      000100 ..... 01011 ..... 11001000010    @VX_tb
++VEXTRACTQM      000100 ..... 01100 ..... 11001000010    @VX_tb
++
+ # VSX Load/Store Instructions
+=20
+ LXV             111101 ..... ..... ............ . 001   @DQ_TSX
+diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/=
vmx-impl.c.inc
+index ebb0484323..96c97bf6e7 100644
+--- a/target/ppc/translate/vmx-impl.c.inc
++++ b/target/ppc/translate/vmx-impl.c.inc
+@@ -1525,6 +1525,88 @@ static bool trans_VEXPANDQM(DisasContext *ctx, ar=
g_VX_tb *a)
+     return true;
+ }
+=20
++static bool do_vextractm(DisasContext *ctx, arg_VX_tb *a, unsigned vece=
)
++{
++    const uint64_t elem_width =3D 8 << vece, elem_count_half =3D 8 >> v=
ece,
++                   mask =3D dup_const(vece, 1 << (elem_width - 1));
++    uint64_t i, j;
++    TCGv_i64 lo, hi, t0, t1;
++
++    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
++    REQUIRE_VECTOR(ctx);
++
++    hi =3D tcg_temp_new_i64();
++    lo =3D tcg_temp_new_i64();
++    t0 =3D tcg_temp_new_i64();
++    t1 =3D tcg_temp_new_i64();
++
++    get_avr64(lo, a->vrb, false);
++    get_avr64(hi, a->vrb, true);
++
++    tcg_gen_andi_i64(lo, lo, mask);
++    tcg_gen_andi_i64(hi, hi, mask);
++
++    /*
++     * Gather the most significant bit of each element in the highest e=
lement
++     * element. E.g. for bytes:
++     * aXXXXXXXbXXXXXXXcXXXXXXXdXXXXXXXeXXXXXXXfXXXXXXXgXXXXXXXhXXXXXXX
++     *     & dup(1 << (elem_width - 1))
++     * a0000000b0000000c0000000d0000000e0000000f0000000g0000000h0000000
++     *     << 32 - 4
++     * 0000e0000000f0000000g0000000h00000000000000000000000000000000000
++     *     |
++     * a000e000b000f000c000g000d000h000e0000000f0000000g0000000h0000000
++     *     << 16 - 2
++     * 00c000g000d000h000e0000000f0000000g0000000h000000000000000000000
++     *     |
++     * a0c0e0g0b0d0f0h0c0e0g000d0f0h000e0g00000f0h00000g0000000h0000000
++     *     << 8 - 1
++     * 0b0d0f0h0c0e0g000d0f0h000e0g00000f0h00000g0000000h00000000000000
++     *     |
++     * abcdefghbcdefgh0cdefgh00defgh000efgh0000fgh00000gh000000h0000000
++     */
++    for (i =3D elem_count_half / 2, j =3D 32; i > 0; i >>=3D 1, j >>=3D=
 1) {
++        tcg_gen_shli_i64(t0, hi, j - i);
++        tcg_gen_shli_i64(t1, lo, j - i);
++        tcg_gen_or_i64(hi, hi, t0);
++        tcg_gen_or_i64(lo, lo, t1);
++    }
++
++    tcg_gen_shri_i64(hi, hi, 64 - elem_count_half);
++    tcg_gen_extract2_i64(lo, lo, hi, 64 - elem_count_half);
++    tcg_gen_trunc_i64_tl(cpu_gpr[a->vrt], lo);
++
++    tcg_temp_free_i64(hi);
++    tcg_temp_free_i64(lo);
++    tcg_temp_free_i64(t0);
++    tcg_temp_free_i64(t1);
++
++    return true;
++}
++
++TRANS(VEXTRACTBM, do_vextractm, MO_8)
++TRANS(VEXTRACTHM, do_vextractm, MO_16)
++TRANS(VEXTRACTWM, do_vextractm, MO_32)
++TRANS(VEXTRACTDM, do_vextractm, MO_64)
++
++static bool trans_VEXTRACTQM(DisasContext *ctx, arg_VX_tb *a)
++{
++    TCGv_i64 tmp;
++
++    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
++    REQUIRE_VECTOR(ctx);
++
++    tmp =3D tcg_temp_new_i64();
++
++    get_avr64(tmp, a->vrb, true);
++    tcg_gen_shri_i64(tmp, tmp, 63);
++    tcg_gen_trunc_i64_tl(cpu_gpr[a->vrt], tmp);
++
++    tcg_temp_free_i64(tmp);
++
++    return true;
++}
++
+ #define GEN_VAFORM_PAIRED(name0, name1, opc2)                          =
 \
+ static void glue(gen_, name0##_##name1)(DisasContext *ctx)             =
 \
+     {                                                                  =
 \
+--=20
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0019-target-ppc-Implement-Ve=
ctor-Mask-Move-insns.patch b/meta/recipes-devtools/qemu/qemu/0019-target-=
ppc-Implement-Vector-Mask-Move-insns.patch
new file mode 100644
index 0000000000..96fda98771
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0019-target-ppc-Implement-Vector-Ma=
sk-Move-insns.patch
@@ -0,0 +1,187 @@
+From 4d5202aad706fd338646d19aafbf255c3864333c Mon Sep 17 00:00:00 2001
+From: Matheus Ferst <matheus.ferst@eldorado.org.br>
+Date: Fri, 17 Dec 2021 17:57:13 +0100
+Subject: [PATCH 19/21] target/ppc: Implement Vector Mask Move insns
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Implement the following PowerISA v3.1 instructions:
+mtvsrbm: Move to VSR Byte Mask
+mtvsrhm: Move to VSR Halfword Mask
+mtvsrwm: Move to VSR Word Mask
+mtvsrdm: Move to VSR Doubleword Mask
+mtvsrqm: Move to VSR Quadword Mask
+mtvsrbmi: Move to VSR Byte Mask Immediate
+
+Upstream-Status: Backport
+[https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D9193eaa901c54dbff4a91=
ea0b12a99e0135dbca1]
+
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
+Message-Id: <20211203194229.746275-4-matheus.ferst@eldorado.org.br>
+Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ target/ppc/insn32.decode            |  11 +++
+ target/ppc/translate/vmx-impl.c.inc | 115 ++++++++++++++++++++++++++++
+ 2 files changed, 126 insertions(+)
+
+diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
+index b0568b1356..8bdc059a4c 100644
+--- a/target/ppc/insn32.decode
++++ b/target/ppc/insn32.decode
+@@ -40,6 +40,10 @@
+ %ds_rtp         22:4   !function=3Dtimes_2
+ @DS_rtp         ...... ....0 ra:5 .............. ..             &D rt=3D=
%ds_rtp si=3D%ds_si
+=20
++&DX_b           vrt b
++%dx_b           6:10 16:5 0:1
++@DX_b           ...... vrt:5  ..... .......... ..... .          &DX_b b=
=3D%dx_b
++
+ &DX             rt d
+ %dx_d           6:s10 16:5 0:1
+ @DX             ...... rt:5  ..... .......... ..... .   &DX d=3D%dx_d
+@@ -417,6 +421,13 @@ VSRDBI          000100 ..... ..... ..... 01 ... 010=
110  @VN
+=20
+ ## Vector Mask Manipulation Instructions
+=20
++MTVSRBM         000100 ..... 10000 ..... 11001000010    @VX_tb
++MTVSRHM         000100 ..... 10001 ..... 11001000010    @VX_tb
++MTVSRWM         000100 ..... 10010 ..... 11001000010    @VX_tb
++MTVSRDM         000100 ..... 10011 ..... 11001000010    @VX_tb
++MTVSRQM         000100 ..... 10100 ..... 11001000010    @VX_tb
++MTVSRBMI        000100 ..... ..... .......... 01010 .   @DX_b
++
+ VEXPANDBM       000100 ..... 00000 ..... 11001000010    @VX_tb
+ VEXPANDHM       000100 ..... 00001 ..... 11001000010    @VX_tb
+ VEXPANDWM       000100 ..... 00010 ..... 11001000010    @VX_tb
+diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/=
vmx-impl.c.inc
+index 96c97bf6e7..d5e02fd7f2 100644
+--- a/target/ppc/translate/vmx-impl.c.inc
++++ b/target/ppc/translate/vmx-impl.c.inc
+@@ -1607,6 +1607,121 @@ static bool trans_VEXTRACTQM(DisasContext *ctx, =
arg_VX_tb *a)
+     return true;
+ }
+=20
++static bool do_mtvsrm(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
++{
++    const uint64_t elem_width =3D 8 << vece, elem_count_half =3D 8 >> v=
ece;
++    uint64_t c;
++    int i, j;
++    TCGv_i64 hi, lo, t0, t1;
++
++    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
++    REQUIRE_VECTOR(ctx);
++
++    hi =3D tcg_temp_new_i64();
++    lo =3D tcg_temp_new_i64();
++    t0 =3D tcg_temp_new_i64();
++    t1 =3D tcg_temp_new_i64();
++
++    tcg_gen_extu_tl_i64(t0, cpu_gpr[a->vrb]);
++    tcg_gen_extract_i64(hi, t0, elem_count_half, elem_count_half);
++    tcg_gen_extract_i64(lo, t0, 0, elem_count_half);
++
++    /*
++     * Spread the bits into their respective elements.
++     * E.g. for bytes:
++     * 00000000000000000000000000000000000000000000000000000000abcdefgh
++     *   << 32 - 4
++     * 0000000000000000000000000000abcdefgh0000000000000000000000000000
++     *   |
++     * 0000000000000000000000000000abcdefgh00000000000000000000abcdefgh
++     *   << 16 - 2
++     * 00000000000000abcdefgh00000000000000000000abcdefgh00000000000000
++     *   |
++     * 00000000000000abcdefgh000000abcdefgh000000abcdefgh000000abcdefgh
++     *   << 8 - 1
++     * 0000000abcdefgh000000abcdefgh000000abcdefgh000000abcdefgh0000000
++     *   |
++     * 0000000abcdefgXbcdefgXbcdefgXbcdefgXbcdefgXbcdefgXbcdefgXbcdefgh
++     *   & dup(1)
++     * 0000000a0000000b0000000c0000000d0000000e0000000f0000000g0000000h
++     *   * 0xff
++     * aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffffgggggggghhhhhhhh
++     */
++    for (i =3D elem_count_half / 2, j =3D 32; i > 0; i >>=3D 1, j >>=3D=
 1) {
++        tcg_gen_shli_i64(t0, hi, j - i);
++        tcg_gen_shli_i64(t1, lo, j - i);
++        tcg_gen_or_i64(hi, hi, t0);
++        tcg_gen_or_i64(lo, lo, t1);
++    }
++
++    c =3D dup_const(vece, 1);
++    tcg_gen_andi_i64(hi, hi, c);
++    tcg_gen_andi_i64(lo, lo, c);
++
++    c =3D MAKE_64BIT_MASK(0, elem_width);
++    tcg_gen_muli_i64(hi, hi, c);
++    tcg_gen_muli_i64(lo, lo, c);
++
++    set_avr64(a->vrt, lo, false);
++    set_avr64(a->vrt, hi, true);
++
++    tcg_temp_free_i64(hi);
++    tcg_temp_free_i64(lo);
++    tcg_temp_free_i64(t0);
++    tcg_temp_free_i64(t1);
++
++    return true;
++}
++
++TRANS(MTVSRBM, do_mtvsrm, MO_8)
++TRANS(MTVSRHM, do_mtvsrm, MO_16)
++TRANS(MTVSRWM, do_mtvsrm, MO_32)
++TRANS(MTVSRDM, do_mtvsrm, MO_64)
++
++static bool trans_MTVSRQM(DisasContext *ctx, arg_VX_tb *a)
++{
++    TCGv_i64 tmp;
++
++    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
++    REQUIRE_VECTOR(ctx);
++
++    tmp =3D tcg_temp_new_i64();
++
++    tcg_gen_ext_tl_i64(tmp, cpu_gpr[a->vrb]);
++    tcg_gen_sextract_i64(tmp, tmp, 0, 1);
++    set_avr64(a->vrt, tmp, false);
++    set_avr64(a->vrt, tmp, true);
++
++    tcg_temp_free_i64(tmp);
++
++    return true;
++}
++
++static bool trans_MTVSRBMI(DisasContext *ctx, arg_DX_b *a)
++{
++    const uint64_t mask =3D dup_const(MO_8, 1);
++    uint64_t hi, lo;
++
++    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
++    REQUIRE_VECTOR(ctx);
++
++    hi =3D extract16(a->b, 8, 8);
++    lo =3D extract16(a->b, 0, 8);
++
++    for (int i =3D 4, j =3D 32; i > 0; i >>=3D 1, j >>=3D 1) {
++        hi |=3D hi << (j - i);
++        lo |=3D lo << (j - i);
++    }
++
++    hi =3D (hi & mask) * 0xFF;
++    lo =3D (lo & mask) * 0xFF;
++
++    set_avr64(a->vrt, tcg_constant_i64(hi), true);
++    set_avr64(a->vrt, tcg_constant_i64(lo), false);
++
++    return true;
++}
++
+ #define GEN_VAFORM_PAIRED(name0, name1, opc2)                          =
 \
+ static void glue(gen_, name0##_##name1)(DisasContext *ctx)             =
 \
+     {                                                                  =
 \
+--=20
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0020-target-ppc-move-xs-n-ma=
dd-am-ds-p-xs-n-msub-am-ds-p-.patch b/meta/recipes-devtools/qemu/qemu/002=
0-target-ppc-move-xs-n-madd-am-ds-p-xs-n-msub-am-ds-p-.patch
new file mode 100644
index 0000000000..7e747298a9
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0020-target-ppc-move-xs-n-madd-am-d=
s-p-xs-n-msub-am-ds-p-.patch
@@ -0,0 +1,258 @@
+From a3c7553efdec661a8f7d7dfc0c0618a35fab005c Mon Sep 17 00:00:00 2001
+From: Matheus Ferst <matheus.ferst@eldorado.org.br>
+Date: Wed, 2 Mar 2022 06:51:38 +0100
+Subject: [PATCH 20/21] target/ppc: move xs[n]madd[am][ds]p/xs[n]msub[am]=
[ds]p
+ to decodetree
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport
+[https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3De4318ab2e423c4caf9a88=
a4e99b5e234096b81a9]
+
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
+Message-Id: <20220225210936.1749575-37-matheus.ferst@eldorado.org.br>
+Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ target/ppc/fpu_helper.c             | 23 ++++++------
+ target/ppc/helper.h                 | 16 ++++-----
+ target/ppc/insn32.decode            | 22 ++++++++++++
+ target/ppc/translate/vsx-impl.c.inc | 56 ++++++++++++++++++++++++-----
+ target/ppc/translate/vsx-ops.c.inc  | 16 ---------
+ 5 files changed, 90 insertions(+), 43 deletions(-)
+
+diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
+index 5cc7fb1dcb..853e5f6029 100644
+--- a/target/ppc/fpu_helper.c
++++ b/target/ppc/fpu_helper.c
+@@ -2036,10 +2036,11 @@ VSX_TSQRT(xvtsqrtsp, 4, float32, VsrW(i), -126, =
23)
+  *   maddflgs - flags for the float*muladd routine that control the
+  *           various forms (madd, msub, nmadd, nmsub)
+  *   sfprf - set FPRF
++ *   r2sp  - round intermediate double precision result to single preci=
sion
+  */
+ #define VSX_MADD(op, nels, tp, fld, maddflgs, sfprf, r2sp)             =
       \
+ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                      =
       \
+-                 ppc_vsr_t *xa, ppc_vsr_t *b, ppc_vsr_t *c)            =
       \
++                 ppc_vsr_t *s1, ppc_vsr_t *s2, ppc_vsr_t *s3)          =
       \
+ {                                                                      =
       \
+     ppc_vsr_t t =3D *xt;                                               =
         \
+     int i;                                                             =
       \
+@@ -2055,12 +2056,12 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt=
,                             \
+              * result to odd.                                          =
       \
+              */                                                        =
       \
+             set_float_rounding_mode(float_round_to_zero, &tstat);      =
       \
+-            t.fld =3D tp##_muladd(xa->fld, b->fld, c->fld,             =
         \
++            t.fld =3D tp##_muladd(s1->fld, s3->fld, s2->fld,           =
         \
+                                 maddflgs, &tstat);                     =
       \
+             t.fld |=3D (get_float_exception_flags(&tstat) &            =
         \
+                       float_flag_inexact) !=3D 0;                      =
         \
+         } else {                                                       =
       \
+-            t.fld =3D tp##_muladd(xa->fld, b->fld, c->fld,             =
         \
++            t.fld =3D tp##_muladd(s1->fld, s3->fld, s2->fld,           =
         \
+                                 maddflgs, &tstat);                     =
       \
+         }                                                              =
       \
+         env->fp_status.float_exception_flags |=3D tstat.float_exception=
_flags;  \
+@@ -2082,14 +2083,14 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt=
,                             \
+     do_float_check_status(env, GETPC());                               =
       \
+ }
+=20
+-VSX_MADD(xsmadddp, 1, float64, VsrD(0), MADD_FLGS, 1, 0)
+-VSX_MADD(xsmsubdp, 1, float64, VsrD(0), MSUB_FLGS, 1, 0)
+-VSX_MADD(xsnmadddp, 1, float64, VsrD(0), NMADD_FLGS, 1, 0)
+-VSX_MADD(xsnmsubdp, 1, float64, VsrD(0), NMSUB_FLGS, 1, 0)
+-VSX_MADD(xsmaddsp, 1, float64, VsrD(0), MADD_FLGS, 1, 1)
+-VSX_MADD(xsmsubsp, 1, float64, VsrD(0), MSUB_FLGS, 1, 1)
+-VSX_MADD(xsnmaddsp, 1, float64, VsrD(0), NMADD_FLGS, 1, 1)
+-VSX_MADD(xsnmsubsp, 1, float64, VsrD(0), NMSUB_FLGS, 1, 1)
++VSX_MADD(XSMADDDP, 1, float64, VsrD(0), MADD_FLGS, 1, 0)
++VSX_MADD(XSMSUBDP, 1, float64, VsrD(0), MSUB_FLGS, 1, 0)
++VSX_MADD(XSNMADDDP, 1, float64, VsrD(0), NMADD_FLGS, 1, 0)
++VSX_MADD(XSNMSUBDP, 1, float64, VsrD(0), NMSUB_FLGS, 1, 0)
++VSX_MADD(XSMADDSP, 1, float64, VsrD(0), MADD_FLGS, 1, 1)
++VSX_MADD(XSMSUBSP, 1, float64, VsrD(0), MSUB_FLGS, 1, 1)
++VSX_MADD(XSNMADDSP, 1, float64, VsrD(0), NMADD_FLGS, 1, 1)
++VSX_MADD(XSNMSUBSP, 1, float64, VsrD(0), NMSUB_FLGS, 1, 1)
+=20
+ VSX_MADD(xvmadddp, 2, float64, VsrD(i), MADD_FLGS, 0, 0)
+ VSX_MADD(xvmsubdp, 2, float64, VsrD(i), MSUB_FLGS, 0, 0)
+diff --git a/target/ppc/helper.h b/target/ppc/helper.h
+index ef5bdd38a7..e147b37644 100644
+--- a/target/ppc/helper.h
++++ b/target/ppc/helper.h
+@@ -376,10 +376,10 @@ DEF_HELPER_3(xssqrtdp, void, env, vsr, vsr)
+ DEF_HELPER_3(xsrsqrtedp, void, env, vsr, vsr)
+ DEF_HELPER_4(xstdivdp, void, env, i32, vsr, vsr)
+ DEF_HELPER_3(xstsqrtdp, void, env, i32, vsr)
+-DEF_HELPER_5(xsmadddp, void, env, vsr, vsr, vsr, vsr)
+-DEF_HELPER_5(xsmsubdp, void, env, vsr, vsr, vsr, vsr)
+-DEF_HELPER_5(xsnmadddp, void, env, vsr, vsr, vsr, vsr)
+-DEF_HELPER_5(xsnmsubdp, void, env, vsr, vsr, vsr, vsr)
++DEF_HELPER_5(XSMADDDP, void, env, vsr, vsr, vsr, vsr)
++DEF_HELPER_5(XSMSUBDP, void, env, vsr, vsr, vsr, vsr)
++DEF_HELPER_5(XSNMADDDP, void, env, vsr, vsr, vsr, vsr)
++DEF_HELPER_5(XSNMSUBDP, void, env, vsr, vsr, vsr, vsr)
+ DEF_HELPER_4(xscmpeqdp, void, env, vsr, vsr, vsr)
+ DEF_HELPER_4(xscmpgtdp, void, env, vsr, vsr, vsr)
+ DEF_HELPER_4(xscmpgedp, void, env, vsr, vsr, vsr)
+@@ -439,10 +439,10 @@ DEF_HELPER_3(xsresp, void, env, vsr, vsr)
+ DEF_HELPER_2(xsrsp, i64, env, i64)
+ DEF_HELPER_3(xssqrtsp, void, env, vsr, vsr)
+ DEF_HELPER_3(xsrsqrtesp, void, env, vsr, vsr)
+-DEF_HELPER_5(xsmaddsp, void, env, vsr, vsr, vsr, vsr)
+-DEF_HELPER_5(xsmsubsp, void, env, vsr, vsr, vsr, vsr)
+-DEF_HELPER_5(xsnmaddsp, void, env, vsr, vsr, vsr, vsr)
+-DEF_HELPER_5(xsnmsubsp, void, env, vsr, vsr, vsr, vsr)
++DEF_HELPER_5(XSMADDSP, void, env, vsr, vsr, vsr, vsr)
++DEF_HELPER_5(XSMSUBSP, void, env, vsr, vsr, vsr, vsr)
++DEF_HELPER_5(XSNMADDSP, void, env, vsr, vsr, vsr, vsr)
++DEF_HELPER_5(XSNMSUBSP, void, env, vsr, vsr, vsr, vsr)
+=20
+ DEF_HELPER_4(xvadddp, void, env, vsr, vsr, vsr)
+ DEF_HELPER_4(xvsubdp, void, env, vsr, vsr, vsr)
+diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
+index 8bdc059a4c..0ff8818084 100644
+--- a/target/ppc/insn32.decode
++++ b/target/ppc/insn32.decode
+@@ -451,6 +451,28 @@ STXVX           011111 ..... ..... ..... 0110001100=
 .   @X_TSX
+ LXVPX           011111 ..... ..... ..... 0101001101 -   @X_TSXP
+ STXVPX          011111 ..... ..... ..... 0111001101 -   @X_TSXP
+=20
++## VSX Scalar Multiply-Add Instructions
++
++XSMADDADP       111100 ..... ..... ..... 00100001 . . . @XX3
++XSMADDMDP       111100 ..... ..... ..... 00101001 . . . @XX3
++XSMADDASP       111100 ..... ..... ..... 00000001 . . . @XX3
++XSMADDMSP       111100 ..... ..... ..... 00001001 . . . @XX3
++
++XSMSUBADP       111100 ..... ..... ..... 00110001 . . . @XX3
++XSMSUBMDP       111100 ..... ..... ..... 00111001 . . . @XX3
++XSMSUBASP       111100 ..... ..... ..... 00010001 . . . @XX3
++XSMSUBMSP       111100 ..... ..... ..... 00011001 . . . @XX3
++
++XSNMADDASP      111100 ..... ..... ..... 10000001 . . . @XX3
++XSNMADDMSP      111100 ..... ..... ..... 10001001 . . . @XX3
++XSNMADDADP      111100 ..... ..... ..... 10100001 . . . @XX3
++XSNMADDMDP      111100 ..... ..... ..... 10101001 . . . @XX3
++
++XSNMSUBASP      111100 ..... ..... ..... 10010001 . . . @XX3
++XSNMSUBMSP      111100 ..... ..... ..... 10011001 . . . @XX3
++XSNMSUBADP      111100 ..... ..... ..... 10110001 . . . @XX3
++XSNMSUBMDP      111100 ..... ..... ..... 10111001 . . . @XX3
++
+ ## VSX splat instruction
+=20
+ XXSPLTIB        111100 ..... 00 ........ 0101101000 .   @X_imm8
+diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/=
vsx-impl.c.inc
+index 99c8a57e50..90d3ac665b 100644
+--- a/target/ppc/translate/vsx-impl.c.inc
++++ b/target/ppc/translate/vsx-impl.c.inc
+@@ -1201,6 +1201,54 @@ GEN_VSX_HELPER_2(xvtstdcdp, 0x14, 0x1E, 0, PPC2_V=
SX)
+ GEN_VSX_HELPER_X3(xxperm, 0x08, 0x03, 0, PPC2_ISA300)
+ GEN_VSX_HELPER_X3(xxpermr, 0x08, 0x07, 0, PPC2_ISA300)
+=20
++static bool do_xsmadd(DisasContext *ctx, int tgt, int src1, int src2, i=
nt src3,
++        void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv=
_ptr))
++{
++    TCGv_ptr t, s1, s2, s3;
++
++    t =3D gen_vsr_ptr(tgt);
++    s1 =3D gen_vsr_ptr(src1);
++    s2 =3D gen_vsr_ptr(src2);
++    s3 =3D gen_vsr_ptr(src3);
++
++    gen_helper(cpu_env, t, s1, s2, s3);
++
++    tcg_temp_free_ptr(t);
++    tcg_temp_free_ptr(s1);
++    tcg_temp_free_ptr(s2);
++    tcg_temp_free_ptr(s3);
++
++    return true;
++}
++
++static bool do_xsmadd_XX3(DisasContext *ctx, arg_XX3 *a, bool type_a,
++        void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv=
_ptr))
++{
++    REQUIRE_VSX(ctx);
++
++    if (type_a) {
++        return do_xsmadd(ctx, a->xt, a->xa, a->xt, a->xb, gen_helper);
++    }
++    return do_xsmadd(ctx, a->xt, a->xa, a->xb, a->xt, gen_helper);
++}
++
++TRANS_FLAGS2(VSX, XSMADDADP, do_xsmadd_XX3, true, gen_helper_XSMADDDP)
++TRANS_FLAGS2(VSX, XSMADDMDP, do_xsmadd_XX3, false, gen_helper_XSMADDDP)
++TRANS_FLAGS2(VSX, XSMSUBADP, do_xsmadd_XX3, true, gen_helper_XSMSUBDP)
++TRANS_FLAGS2(VSX, XSMSUBMDP, do_xsmadd_XX3, false, gen_helper_XSMSUBDP)
++TRANS_FLAGS2(VSX, XSNMADDADP, do_xsmadd_XX3, true, gen_helper_XSNMADDDP=
)
++TRANS_FLAGS2(VSX, XSNMADDMDP, do_xsmadd_XX3, false, gen_helper_XSNMADDD=
P)
++TRANS_FLAGS2(VSX, XSNMSUBADP, do_xsmadd_XX3, true, gen_helper_XSNMSUBDP=
)
++TRANS_FLAGS2(VSX, XSNMSUBMDP, do_xsmadd_XX3, false, gen_helper_XSNMSUBD=
P)
++TRANS_FLAGS2(VSX207, XSMADDASP, do_xsmadd_XX3, true, gen_helper_XSMADDS=
P)
++TRANS_FLAGS2(VSX207, XSMADDMSP, do_xsmadd_XX3, false, gen_helper_XSMADD=
SP)
++TRANS_FLAGS2(VSX207, XSMSUBASP, do_xsmadd_XX3, true, gen_helper_XSMSUBS=
P)
++TRANS_FLAGS2(VSX207, XSMSUBMSP, do_xsmadd_XX3, false, gen_helper_XSMSUB=
SP)
++TRANS_FLAGS2(VSX207, XSNMADDASP, do_xsmadd_XX3, true, gen_helper_XSNMAD=
DSP)
++TRANS_FLAGS2(VSX207, XSNMADDMSP, do_xsmadd_XX3, false, gen_helper_XSNMA=
DDSP)
++TRANS_FLAGS2(VSX207, XSNMSUBASP, do_xsmadd_XX3, true, gen_helper_XSNMSU=
BSP)
++TRANS_FLAGS2(VSX207, XSNMSUBMSP, do_xsmadd_XX3, false, gen_helper_XSNMS=
UBSP)
++
+ #define GEN_VSX_HELPER_VSX_MADD(name, op1, aop, mop, inval, type)      =
       \
+ static void gen_##name(DisasContext *ctx)                              =
       \
+ {                                                                      =
       \
+@@ -1231,14 +1279,6 @@ static void gen_##name(DisasContext *ctx)        =
                             \
+     tcg_temp_free_ptr(c);                                              =
       \
+ }
+=20
+-GEN_VSX_HELPER_VSX_MADD(xsmadddp, 0x04, 0x04, 0x05, 0, PPC2_VSX)
+-GEN_VSX_HELPER_VSX_MADD(xsmsubdp, 0x04, 0x06, 0x07, 0, PPC2_VSX)
+-GEN_VSX_HELPER_VSX_MADD(xsnmadddp, 0x04, 0x14, 0x15, 0, PPC2_VSX)
+-GEN_VSX_HELPER_VSX_MADD(xsnmsubdp, 0x04, 0x16, 0x17, 0, PPC2_VSX)
+-GEN_VSX_HELPER_VSX_MADD(xsmaddsp, 0x04, 0x00, 0x01, 0, PPC2_VSX207)
+-GEN_VSX_HELPER_VSX_MADD(xsmsubsp, 0x04, 0x02, 0x03, 0, PPC2_VSX207)
+-GEN_VSX_HELPER_VSX_MADD(xsnmaddsp, 0x04, 0x10, 0x11, 0, PPC2_VSX207)
+-GEN_VSX_HELPER_VSX_MADD(xsnmsubsp, 0x04, 0x12, 0x13, 0, PPC2_VSX207)
+ GEN_VSX_HELPER_VSX_MADD(xvmadddp, 0x04, 0x0C, 0x0D, 0, PPC2_VSX)
+ GEN_VSX_HELPER_VSX_MADD(xvmsubdp, 0x04, 0x0E, 0x0F, 0, PPC2_VSX)
+ GEN_VSX_HELPER_VSX_MADD(xvnmadddp, 0x04, 0x1C, 0x1D, 0, PPC2_VSX)
+diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/v=
sx-ops.c.inc
+index c974324c4c..ef0200eead 100644
+--- a/target/ppc/translate/vsx-ops.c.inc
++++ b/target/ppc/translate/vsx-ops.c.inc
+@@ -186,14 +186,6 @@ GEN_XX2FORM(xssqrtdp,  0x16, 0x04, PPC2_VSX),
+ GEN_XX2FORM(xsrsqrtedp,  0x14, 0x04, PPC2_VSX),
+ GEN_XX3FORM(xstdivdp,  0x14, 0x07, PPC2_VSX),
+ GEN_XX2FORM(xstsqrtdp,  0x14, 0x06, PPC2_VSX),
+-GEN_XX3FORM_NAME(xsmadddp, "xsmaddadp", 0x04, 0x04, PPC2_VSX),
+-GEN_XX3FORM_NAME(xsmadddp, "xsmaddmdp", 0x04, 0x05, PPC2_VSX),
+-GEN_XX3FORM_NAME(xsmsubdp, "xsmsubadp", 0x04, 0x06, PPC2_VSX),
+-GEN_XX3FORM_NAME(xsmsubdp, "xsmsubmdp", 0x04, 0x07, PPC2_VSX),
+-GEN_XX3FORM_NAME(xsnmadddp, "xsnmaddadp", 0x04, 0x14, PPC2_VSX),
+-GEN_XX3FORM_NAME(xsnmadddp, "xsnmaddmdp", 0x04, 0x15, PPC2_VSX),
+-GEN_XX3FORM_NAME(xsnmsubdp, "xsnmsubadp", 0x04, 0x16, PPC2_VSX),
+-GEN_XX3FORM_NAME(xsnmsubdp, "xsnmsubmdp", 0x04, 0x17, PPC2_VSX),
+ GEN_XX3FORM(xscmpeqdp, 0x0C, 0x00, PPC2_ISA300),
+ GEN_XX3FORM(xscmpgtdp, 0x0C, 0x01, PPC2_ISA300),
+ GEN_XX3FORM(xscmpgedp, 0x0C, 0x02, PPC2_ISA300),
+@@ -235,14 +227,6 @@ GEN_XX2FORM(xsresp,  0x14, 0x01, PPC2_VSX207),
+ GEN_XX2FORM(xsrsp, 0x12, 0x11, PPC2_VSX207),
+ GEN_XX2FORM(xssqrtsp,  0x16, 0x00, PPC2_VSX207),
+ GEN_XX2FORM(xsrsqrtesp,  0x14, 0x00, PPC2_VSX207),
+-GEN_XX3FORM_NAME(xsmaddsp, "xsmaddasp", 0x04, 0x00, PPC2_VSX207),
+-GEN_XX3FORM_NAME(xsmaddsp, "xsmaddmsp", 0x04, 0x01, PPC2_VSX207),
+-GEN_XX3FORM_NAME(xsmsubsp, "xsmsubasp", 0x04, 0x02, PPC2_VSX207),
+-GEN_XX3FORM_NAME(xsmsubsp, "xsmsubmsp", 0x04, 0x03, PPC2_VSX207),
+-GEN_XX3FORM_NAME(xsnmaddsp, "xsnmaddasp", 0x04, 0x10, PPC2_VSX207),
+-GEN_XX3FORM_NAME(xsnmaddsp, "xsnmaddmsp", 0x04, 0x11, PPC2_VSX207),
+-GEN_XX3FORM_NAME(xsnmsubsp, "xsnmsubasp", 0x04, 0x12, PPC2_VSX207),
+-GEN_XX3FORM_NAME(xsnmsubsp, "xsnmsubmsp", 0x04, 0x13, PPC2_VSX207),
+ GEN_XX2FORM(xscvsxdsp, 0x10, 0x13, PPC2_VSX207),
+ GEN_XX2FORM(xscvuxdsp, 0x10, 0x12, PPC2_VSX207),
+=20
+--=20
+2.17.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/0021-target-ppc-implement-xs=
-n-maddqp-o-xs-n-msubqp-o.patch b/meta/recipes-devtools/qemu/qemu/0021-ta=
rget-ppc-implement-xs-n-maddqp-o-xs-n-msubqp-o.patch
new file mode 100644
index 0000000000..11d732ac13
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0021-target-ppc-implement-xs-n-madd=
qp-o-xs-n-msubqp-o.patch
@@ -0,0 +1,174 @@
+From 1c1f82fbf0a434948b041eb35c671137628d5538 Mon Sep 17 00:00:00 2001
+From: Matheus Ferst <matheus.ferst@eldorado.org.br>
+Date: Wed, 2 Mar 2022 06:51:38 +0100
+Subject: [PATCH 21/21] target/ppc: implement xs[n]maddqp[o]/xs[n]msubqp[=
o]
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Implement the following PowerISA v3.0 instuctions:
+xsmaddqp[o]: VSX Scalar Multiply-Add Quad-Precision [using round to Odd]
+xsmsubqp[o]: VSX Scalar Multiply-Subtract Quad-Precision [using round
+             to Odd]
+xsnmaddqp[o]: VSX Scalar Negative Multiply-Add Quad-Precision [using
+              round to Odd]
+xsnmsubqp[o]: VSX Scalar Negative Multiply-Subtract Quad-Precision
+              [using round to Odd]
+
+Upstream-Status: Backport
+[https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D3bb1aed246d7b59ceee62=
5a82628f7369d492a8f]
+
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
+Message-Id: <20220225210936.1749575-38-matheus.ferst@eldorado.org.br>
+Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ target/ppc/fpu_helper.c             | 42 +++++++++++++++++++++++++++++
+ target/ppc/helper.h                 |  9 +++++++
+ target/ppc/insn32.decode            |  4 +++
+ target/ppc/translate/vsx-impl.c.inc | 25 +++++++++++++++++
+ 4 files changed, 80 insertions(+)
+
+diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
+index 853e5f6029..bdbbdb3b11 100644
+--- a/target/ppc/fpu_helper.c
++++ b/target/ppc/fpu_helper.c
+@@ -2102,6 +2102,48 @@ VSX_MADD(xvmsubsp, 4, float32, VsrW(i), MSUB_FLGS=
, 0, 0)
+ VSX_MADD(xvnmaddsp, 4, float32, VsrW(i), NMADD_FLGS, 0, 0)
+ VSX_MADD(xvnmsubsp, 4, float32, VsrW(i), NMSUB_FLGS, 0, 0)
+=20
++/*
++ * VSX_MADDQ - VSX floating point quad-precision muliply/add
++ *   op    - instruction mnemonic
++ *   maddflgs - flags for the float*muladd routine that control the
++ *           various forms (madd, msub, nmadd, nmsub)
++ *   ro    - round to odd
++ */
++#define VSX_MADDQ(op, maddflgs, ro)                                    =
        \
++void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *s1, ppc_vs=
r_t *s2,\
++                 ppc_vsr_t *s3)                                        =
        \
++{                                                                      =
        \
++    ppc_vsr_t t =3D *xt;                                               =
          \
++                                                                       =
        \
++    helper_reset_fpstatus(env);                                        =
        \
++                                                                       =
        \
++    float_status tstat =3D env->fp_status;                             =
          \
++    set_float_exception_flags(0, &tstat);                              =
        \
++    if (ro) {                                                          =
        \
++        tstat.float_rounding_mode =3D float_round_to_odd;              =
          \
++    }                                                                  =
        \
++    t.f128 =3D float128_muladd(s1->f128, s3->f128, s2->f128, maddflgs, =
&tstat);  \
++    env->fp_status.float_exception_flags |=3D tstat.float_exception_fla=
gs;       \
++                                                                       =
        \
++    if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {  =
        \
++        float_invalid_op_madd(env, tstat.float_exception_flags,        =
        \
++                              false, GETPC());                         =
        \
++    }                                                                  =
        \
++                                                                       =
        \
++    helper_compute_fprf_float128(env, t.f128);                         =
        \
++    *xt =3D t;                                                         =
          \
++    do_float_check_status(env, GETPC());                               =
        \
++}
++
++VSX_MADDQ(XSMADDQP, MADD_FLGS, 0)
++VSX_MADDQ(XSMADDQPO, MADD_FLGS, 1)
++VSX_MADDQ(XSMSUBQP, MSUB_FLGS, 0)
++VSX_MADDQ(XSMSUBQPO, MSUB_FLGS, 1)
++VSX_MADDQ(XSNMADDQP, NMADD_FLGS, 0)
++VSX_MADDQ(XSNMADDQPO, NMADD_FLGS, 1)
++VSX_MADDQ(XSNMSUBQP, NMSUB_FLGS, 0)
++VSX_MADDQ(XSNMSUBQPO, NMSUB_FLGS, 0)
++
+ /*
+  * VSX_SCALAR_CMP_DP - VSX scalar floating point compare double precisi=
on
+  *   op    - instruction mnemonic
+diff --git a/target/ppc/helper.h b/target/ppc/helper.h
+index e147b37644..b5080c4955 100644
+--- a/target/ppc/helper.h
++++ b/target/ppc/helper.h
+@@ -444,6 +444,15 @@ DEF_HELPER_5(XSMSUBSP, void, env, vsr, vsr, vsr, vs=
r)
+ DEF_HELPER_5(XSNMADDSP, void, env, vsr, vsr, vsr, vsr)
+ DEF_HELPER_5(XSNMSUBSP, void, env, vsr, vsr, vsr, vsr)
+=20
++DEF_HELPER_5(XSMADDQP, void, env, vsr, vsr, vsr, vsr)
++DEF_HELPER_5(XSMADDQPO, void, env, vsr, vsr, vsr, vsr)
++DEF_HELPER_5(XSMSUBQP, void, env, vsr, vsr, vsr, vsr)
++DEF_HELPER_5(XSMSUBQPO, void, env, vsr, vsr, vsr, vsr)
++DEF_HELPER_5(XSNMADDQP, void, env, vsr, vsr, vsr, vsr)
++DEF_HELPER_5(XSNMADDQPO, void, env, vsr, vsr, vsr, vsr)
++DEF_HELPER_5(XSNMSUBQP, void, env, vsr, vsr, vsr, vsr)
++DEF_HELPER_5(XSNMSUBQPO, void, env, vsr, vsr, vsr, vsr)
++
+ DEF_HELPER_4(xvadddp, void, env, vsr, vsr, vsr)
+ DEF_HELPER_4(xvsubdp, void, env, vsr, vsr, vsr)
+ DEF_HELPER_4(xvmuldp, void, env, vsr, vsr, vsr)
+diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
+index 0ff8818084..6bcb1e6804 100644
+--- a/target/ppc/insn32.decode
++++ b/target/ppc/insn32.decode
+@@ -457,21 +457,25 @@ XSMADDADP       111100 ..... ..... ..... 00100001 =
. . . @XX3
+ XSMADDMDP       111100 ..... ..... ..... 00101001 . . . @XX3
+ XSMADDASP       111100 ..... ..... ..... 00000001 . . . @XX3
+ XSMADDMSP       111100 ..... ..... ..... 00001001 . . . @XX3
++XSMADDQP        111111 ..... ..... ..... 0110000100 .   @X_rc
+=20
+ XSMSUBADP       111100 ..... ..... ..... 00110001 . . . @XX3
+ XSMSUBMDP       111100 ..... ..... ..... 00111001 . . . @XX3
+ XSMSUBASP       111100 ..... ..... ..... 00010001 . . . @XX3
+ XSMSUBMSP       111100 ..... ..... ..... 00011001 . . . @XX3
++XSMSUBQP        111111 ..... ..... ..... 0110100100 .   @X_rc
+=20
+ XSNMADDASP      111100 ..... ..... ..... 10000001 . . . @XX3
+ XSNMADDMSP      111100 ..... ..... ..... 10001001 . . . @XX3
+ XSNMADDADP      111100 ..... ..... ..... 10100001 . . . @XX3
+ XSNMADDMDP      111100 ..... ..... ..... 10101001 . . . @XX3
++XSNMADDQP       111111 ..... ..... ..... 0111000100 .   @X_rc
+=20
+ XSNMSUBASP      111100 ..... ..... ..... 10010001 . . . @XX3
+ XSNMSUBMSP      111100 ..... ..... ..... 10011001 . . . @XX3
+ XSNMSUBADP      111100 ..... ..... ..... 10110001 . . . @XX3
+ XSNMSUBMDP      111100 ..... ..... ..... 10111001 . . . @XX3
++XSNMSUBQP       111111 ..... ..... ..... 0111100100 .   @X_rc
+=20
+ ## VSX splat instruction
+=20
+diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/=
vsx-impl.c.inc
+index 90d3ac665b..4253f01319 100644
+--- a/target/ppc/translate/vsx-impl.c.inc
++++ b/target/ppc/translate/vsx-impl.c.inc
+@@ -1249,6 +1249,31 @@ TRANS_FLAGS2(VSX207, XSNMADDMSP, do_xsmadd_XX3, f=
alse, gen_helper_XSNMADDSP)
+ TRANS_FLAGS2(VSX207, XSNMSUBASP, do_xsmadd_XX3, true, gen_helper_XSNMSU=
BSP)
+ TRANS_FLAGS2(VSX207, XSNMSUBMSP, do_xsmadd_XX3, false, gen_helper_XSNMS=
UBSP)
+=20
++static bool do_xsmadd_X(DisasContext *ctx, arg_X_rc *a,
++        void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv=
_ptr),
++        void (*gen_helper_ro)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, T=
CGv_ptr))
++{
++    int vrt, vra, vrb;
++
++    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
++    REQUIRE_VSX(ctx);
++
++    vrt =3D a->rt + 32;
++    vra =3D a->ra + 32;
++    vrb =3D a->rb + 32;
++
++    if (a->rc) {
++        return do_xsmadd(ctx, vrt, vra, vrt, vrb, gen_helper_ro);
++    }
++
++    return do_xsmadd(ctx, vrt, vra, vrt, vrb, gen_helper);
++}
++
++TRANS(XSMADDQP, do_xsmadd_X, gen_helper_XSMADDQP, gen_helper_XSMADDQPO)
++TRANS(XSMSUBQP, do_xsmadd_X, gen_helper_XSMSUBQP, gen_helper_XSMSUBQPO)
++TRANS(XSNMADDQP, do_xsmadd_X, gen_helper_XSNMADDQP, gen_helper_XSNMADDQ=
PO)
++TRANS(XSNMSUBQP, do_xsmadd_X, gen_helper_XSNMSUBQP, gen_helper_XSNMSUBQ=
PO)
++
+ #define GEN_VSX_HELPER_VSX_MADD(name, op1, aop, mop, inval, type)      =
       \
+ static void gen_##name(DisasContext *ctx)                              =
       \
+ {                                                                      =
       \
+--=20
+2.17.1
+
--=20
2.17.1


