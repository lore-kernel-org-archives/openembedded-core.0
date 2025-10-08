Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B3ECCA472
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 13:01:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15396.1759928514936751084
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 06:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=B0xc5ZJ3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=237684db3f=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5989rJjt894199
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Oct 2025 13:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Vo/WDc/lP
	B1SNbTmgFYzKGl0cNrq+tZNuFQqULEk+Bk=; b=B0xc5ZJ3Y02TnDSjeAIhxwHNA
	JlFfAkpn2j718odUTj+Kji4uEvEodAOWngSB3r6A68/iGPxsEUaFK7ICwd7Xm7nA
	6LpoGI3mbHqF24kvUgAE2/UNBqDs58hcFjvf/dA6iF56Gz0byH3kka6j4360UJW5
	AvFOmzE/IlLMTliSymfIoxnoJ50/kqMFDlEuOZTsdQ9KLNvzPHSIuQPSeGhYcxyT
	mgUCe0Kmbz6WIG+0qXpjUbX9BLln3LV9hBcaeSE5YPHeMc4d5zR7wkAQMGoOdZ7a
	Iv55hP1XLsX1PXeLUMi6QWwfw6luq/vZAPU0Fh2szYeh7jP634uDhcdEzojUw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49jtj3cg6k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 13:01:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aYVO1MJ+p2mgbwT7bhMwUiCIosR8VzKmn1hcY9mWEhCOnTnihFVIvpZ8aD7l06qJsCke2HBUvMuJVSzXuF9+qBzQ2+c4xiUDVXScKSfwpihj1rqjul19iFWQGhvZny9ZwDU+keKs0HMdGqFVY5vUsypiJO/ujdv5RgdygsVGw27EqWbUXoOouRZHH0LKmy1nCG+eHlbB8pYgQ7RZpkL22/ZI7dBMHjSM1j4ml27ypUG2VoPkGSudTMdyhFjieCEg7366JpB62Tai6re32X04ZUJ9Z25XXIMyMYzA3ZTolVUcp9E2adMrkvgVd3w3I5NpTnZxEzXCkvAm0MrRT0gNMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vo/WDc/lPB1SNbTmgFYzKGl0cNrq+tZNuFQqULEk+Bk=;
 b=ghgUsiODJGi+nalvllY6P2xxwZvP61ruaiMPKi2c5DF/D/QKaCBbNyCcsKA43bKZSQS3neaThhS7d6MB3x10Kj/2/g9KC6tzJDGFk+L73jOsPwKSmznwTOgYEgVm2QdjEj0vReh9WaS5/IOicPNr7nFeRqsScyc9srQgw35eG0vrha4PoZrbkzThY0QU22pjzm0MY5kfG6eYg8F66BmhM0xrq0DVv8ckYwr9pymu50X8hSxNwqq8CaD6JoW3Ypc0Xs7GzjF3++nx8DRk5pEBgruSSAit9QwnKKccK9iJnBpTvzqgyb8akj8rxbUKxTI9evDwbHj9NGbiNyH7c8ETrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by SA1PR11MB8541.namprd11.prod.outlook.com (2603:10b6:806:3a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 13:01:50 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 13:01:50 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Yash.Shinde@windriver.com
Subject: [PATCH] cargo-c: fix debug symbols containing TMPDIR references
Date: Wed,  8 Oct 2025 06:01:37 -0700
Message-ID: <20251008130137.2266449-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0035.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::48) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|SA1PR11MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: d76af76b-0035-4f63-bd5d-08de066ad84a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GkmjfzqeBdOUm3hUn7FKeTaPya25mCD7uSWBx46ZQ+IJo0E5OvCr47T7R1ep?=
 =?us-ascii?Q?u6b1qT3Io3W5+i9p6Kz7z8E/kmMIlxxcXPiiJ2C5cuuCNlTMUVtWsjS/sLRB?=
 =?us-ascii?Q?zLO1yJvZ0t/+4vfo7O3RcN5Ym4ZMuyrmp7KBOCG5vs6mjIqlAalY+Zv9RvSL?=
 =?us-ascii?Q?qfsdmAa2OlQlTApNO/Jah3ecRBBjAgTcrPuKNVNbzesb0cwNIHWGpAHRylAC?=
 =?us-ascii?Q?OO48PGB0eK9jSBtlbzdQB2BlphqIw6WUAb5FDN+YrgF+KwWEdOmxp4CPDrgE?=
 =?us-ascii?Q?Wb8yk8+n7tATfenUuo/wMGkK+s5lw0jJu0/Ok+EZW6wbp/ZnWrpEciRBcoJ+?=
 =?us-ascii?Q?e/JLex8PY4H+Vi8rHAYjK61+Py7i27IkAK7TBOvknkaijPWiWiz2V78AE9RE?=
 =?us-ascii?Q?Bd6wYrJswTtdlXseKtLvO21ZqVnTpEMxu0H2Qj5IoMtmNe1IDbFJayLw+pKM?=
 =?us-ascii?Q?ECl6e5GPYfWGIgcKhDMWNUESl3/3+F9nZmIeVtdPoKmUw91QO81Q2OiqMvRN?=
 =?us-ascii?Q?rHMQTV3VOB/wlGd4rhWNFErn6W/U8eySSBrTND7OP26PGmMe65Njjrp6VneF?=
 =?us-ascii?Q?UReDNujvRIJLWJZ+URpSL2g8R5X3KqHxW3GMTEzPN+wS0JY3mV/wD0eyt/00?=
 =?us-ascii?Q?dRNSIDZzxtWGDIGHWaXAKlFzZEjBhmgBZxGoBSESSuhFrsfwasOeyj64inKN?=
 =?us-ascii?Q?8CEgIx+4TkuAbQFxXQfAKdGVZBmWH+i1mhHAVU18HuinWjpFDi9RHG3G675s?=
 =?us-ascii?Q?ndbiLqbHD7eG3KIAss3b/lSHty6YbmgSw3TpSPawuMakqGVwGZ4ega8lgK2A?=
 =?us-ascii?Q?WUWyywDSYcziDBgwWz6OjSlEX3KfbLXVRsDg3xu2gUigehyvz9qyiNW3An7N?=
 =?us-ascii?Q?n3U5kx7hQb/QuKtNBsOZBiB2UDuJ7adShG0pk8E6sMNWEL+020S8366lqYhW?=
 =?us-ascii?Q?6dkyHCtctVRJDAbjfXkvc9QTEX7ZKQ8AiGN8+iLpfJS9qbWxeHUxIYxc6ce0?=
 =?us-ascii?Q?M9y1Q124Byu4Nv8yOqR3MhH8DO/SkdB/bU5yvhexSDj8b0/TYyc+VzOcdLp2?=
 =?us-ascii?Q?QocNsZo4jB6LunAxG592xbign6fEv1Q1FAa22QPUIm42dlE9OMhiuMnRYWAz?=
 =?us-ascii?Q?9TODXXW60f46Z8iFl3hBjjfG5arYLFYJlGWi+lOsYBFiPuKfXEXeCKLGzfLK?=
 =?us-ascii?Q?J9EnZLa/urYVrRGv96x0YFs2cNBFlR5ebNzlKYvurMb2n5rOrJLnF5hkHrw+?=
 =?us-ascii?Q?zVfHKCvTGEpG2j3Z5AAqbIzgZLHcTw2uFMluFgn53EoQ1wVB8nOiRuNnkbzh?=
 =?us-ascii?Q?sDpbySvkN+rBL838FhAo5SVCbnWDbD777XC7LsWTfUP7jRt6lAWrsy5zJfS3?=
 =?us-ascii?Q?tZ8azCcT6e4tCE9vn05iKhCMwDmcVuI1Pvf0/X0SMyCEyuPfKEE5I2aSLTxv?=
 =?us-ascii?Q?BmSLCV1tze0+W93keHcLMz9fHq1GvSKmMG6frJe1Rwz3yZdsA/X+q9L193Dk?=
 =?us-ascii?Q?oL/pHWPuO5VVlFdh3CAasxNzk/Dyl6gQJHue?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tddQaSX+QZAGAZ498Dp0GjihlSwNJGPmolUaKI3aMxivd2H1gBJFOlm/NzEf?=
 =?us-ascii?Q?Qw9t97Nc7wlafH8E7D4lNV104uBjPcU/jb6i2m91es76gbdCZGo5bW7oMyQC?=
 =?us-ascii?Q?ezRq9JIcca5j6CN8oy2ahgpps9fcoD3qzPODyMkAnDb0hikoEXMZMbxWw6bN?=
 =?us-ascii?Q?JK0Ag88zs16PWjMWmiviNJhCAGmRkqtMNAkOPZodBA7WvUc4/aB66pXzy1RW?=
 =?us-ascii?Q?L9K3B5I8V1c3JFXxIXlGNSlr+kZh+h/BXCB0CHqApg21QiDrFXqrQ5NLP85F?=
 =?us-ascii?Q?YBFxOV5Hyaq3B/vFbmj71wpyqf/JMqHnoEdWJRK3M3Wi7L66crfGwuKuXTQ0?=
 =?us-ascii?Q?CqEIX8FzXNdLm84zZb5qobn4jZgV17ugOfy15/KEencF7SyUd0pWiNIwtL02?=
 =?us-ascii?Q?jXigOXn2qJb5CmQNX0uuSL0CHsJuscs6MaCFnwuFujEC601Gk/BZiBlk5/zr?=
 =?us-ascii?Q?FbWPYc+oHKf2UEVXpDHjfqorvUmKrZQl62AxBmzaZNiqZSmXzhg3eJOrLifm?=
 =?us-ascii?Q?P64RrSsCwDzW8FWP+MMqRbEAFwQ0qPHWItL+q0E9mA5zYc0T3ebQsXIujdcD?=
 =?us-ascii?Q?uLzpNrv1ut2nhB9GoTEjMDsg+LK8uqow1OaK1wpVVAkvhnlMmsdz+xfvcZYY?=
 =?us-ascii?Q?1hhQ7Cqzhlyt51jemuCsUOA5nM2pYI40kzZCCjZNZl4Tr0fmyrjUt+hyxk3e?=
 =?us-ascii?Q?frnUMpFnCtwWe4nmZ2h76ewZhYxFXROzCQ4gUr8pwAkNud1Y6kzeDD95Vljr?=
 =?us-ascii?Q?G7hnuhKb2oG9545dTOvJ968Zvoagw99+Sb0WOpJQk2r7S4OGBNXfH4EcQr/m?=
 =?us-ascii?Q?zagev4xIMQ+g1VIDyinYI9rgxSxUl1KRCbiCeOEPXFDLZRCvNSfdF03JBm21?=
 =?us-ascii?Q?xoJtmZAnhggo/4zRkLSv0KF/qJcTvMKDmdVnYuzfbZj64H3lvrnjYmgJ2AbG?=
 =?us-ascii?Q?ZLPUT5IYOfJbx1bsit+QEt9fnMubYVoXAVDA7nmF1LBL4+a8e3ECH+X+W0Mb?=
 =?us-ascii?Q?6GTd20Zezf9JD6GaDChpWnHUEd+9pCNm4rOG8EhPZe6d/Dw3ZD8VQcowxzIM?=
 =?us-ascii?Q?So7viMtnq4KtFZvgNeisW/4JXBlX/g1ys0oBRKzjCCDvBj4LIn8iAjO2jYrA?=
 =?us-ascii?Q?bQZsO9mr7B6/4h7deVTP2nUEmzXy7KkhheRqeUxbcmg52RtqY8ipPQti4rml?=
 =?us-ascii?Q?VnAkETlA+D/wCFOAkdWcKixQRXclXGLQV42UY8JqSte8d8SkUUSqxmQ4WbLM?=
 =?us-ascii?Q?8M6jcce+DlzdblmNK6cld/zrOswZ9oAh2JdBejL30AVzt8LZYWUiT3380s/B?=
 =?us-ascii?Q?U3mUSwX55l2git1LhZarVvBaardVAcXx1Y/1gFExMZNBRdcFwy8yVvW/MG/2?=
 =?us-ascii?Q?ILNpJuiTrXFASo1Rd7TtvMpe2qmmO1cvQC/95//KH8a/vaHHULYMejcGGpcL?=
 =?us-ascii?Q?3vKk6wI0rBP6NWC7eJfvQrnr/miiD2qNXjhZ7FXOz+tEvMiQde6Bqpbk18og?=
 =?us-ascii?Q?1i+egiOmUKunQqLVZ4Kmfhzp6cIn+Uv0d58O5/VZnXJySUWHAEiC8QjowILE?=
 =?us-ascii?Q?aa3leqHpDnpeCN6vCp/u93Jj9BUIoktW/PjgId16I2JxHexbiY50WTy4yXoP?=
 =?us-ascii?Q?8g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d76af76b-0035-4f63-bd5d-08de066ad84a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 13:01:49.9647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjousYHoGmpfmAGd1pIIRfIao7JRv+N9ZuHJfYRkN0/rPMp4LObfy3AhVCtD5ervTU0ro6CXicqAPJLdc+pssYqAJKGslAiCHYPkp0B7flE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8541
X-Proofpoint-GUID: NdSgWjxR2kpIjckCfyPnHkJOeF5p6Mns
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDA5MCBTYWx0ZWRfXxFRbvef1HcT8
 wvTfKoDYQ/Z661Ry3DvbvKNSPFqQCacJj2hNu2cq/p0z1Fd0KR1RJr6mn5bwgVR7XtCeN6AGZwL
 wn8pLyJg0T8JQG8v3L+WSrDMHbGXwC511Pi6TXATpf1exgX6gfWXQLWAyti1FW4PCSYD4WtbOkA
 /4yzDtJXvgr07TLW/cANjm4kTmIT6TqWwj5SWT2CleUvnEhUvGvO/wqPQhD+KiFxvWWH+jq3hva
 HygRdzT9h6iVgNNitNn89Fpn2arcvQmXzVGnLLTmprpPhywC0vqy6RfrNmGvJ1Uf++tAh6NUHKH
 r27wmqVYpThze//F4ReOQwz3SPQMr5igYZYkrl4fcq5HdQlsbMkTHymSvycUd/005wi7Pr9Fu18
 9qkjys4GB7GQWIKGGCjT5UFH5OVw9w==
X-Proofpoint-ORIG-GUID: NdSgWjxR2kpIjckCfyPnHkJOeF5p6Mns
X-Authority-Analysis: v=2.4 cv=CqCys34D c=1 sm=1 tr=0 ts=68e660c1 cx=c_pps
 a=j8kfsx1CyBm2fJFf+vs0Eg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=t7CeM3EgAAAA:8 a=BhYV1jW0dVNcHO-lSyAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2510080090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 13:01:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224581

From: Yash Shinde <Yash.Shinde@windriver.com>

When building cargo-c with DEBUG mode, QA checks fail due to
absolute paths from the build environment (TMPDIR) being embedded into
the debug symbols/binaries. This causes issues such as:

  ERROR: do_package_qa: File /usr/bin/.debug/cargo-capi contains reference to TMPDIR [buildpaths]
  ERROR: do_package_qa: File /usr/bin/.debug/cargo-cinstall contains reference to TMPDIR [buildpaths]
  ERROR: do_package_qa: File /usr/bin/.debug/cargo-cbuild contains reference to TMPDIR [buildpaths]
  ERROR: do_package_qa: File /usr/bin/.debug/cargo-ctest contains reference to TMPDIR [buildpaths]

To fix this, pass an additional -ffile-prefix-map option to DEBUG_PREFIX_MAP to
ensure that paths under `${CARGO_HOME}` are remapped to `${TARGET_DBGSRC_DIR}`.
This ensures debug info is reproducible and does not leak host-specific paths.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/recipes-devtools/rust/cargo-c_0.10.16+cargo-0.91.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/cargo-c_0.10.16+cargo-0.91.0.bb b/meta/recipes-devtools/rust/cargo-c_0.10.16+cargo-0.91.0.bb
index fd15f02da9..5ef68e13c2 100644
--- a/meta/recipes-devtools/rust/cargo-c_0.10.16+cargo-0.91.0.bb
+++ b/meta/recipes-devtools/rust/cargo-c_0.10.16+cargo-0.91.0.bb
@@ -12,6 +12,8 @@ SRC_URI = "crate://crates.io/cargo-c/${PV};name=cargo-c \
 SRC_URI[cargo-c.sha256sum] = "17d431789b050b0fcf678455dfd5ceb7e5b45cd806140f8fe03b16b995d6cbff"
 S = "${CARGO_VENDORING_DIRECTORY}/cargo-c-${PV}"
 
+DEBUG_PREFIX_MAP += "-ffile-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}"
+
 inherit cargo cargo-update-recipe-crates pkgconfig
 
 DEPENDS = "openssl curl"
-- 
2.49.0


