Return-Path: <diego.delossantos@belden.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6529DCF34B4
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 14:03:47 +0000 (UTC)
Received: from mx0b-00015a02.pphosted.com (mx0b-00015a02.pphosted.com [205.220.178.250])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7646.1763561007313555323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 06:03:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@belden.com header.s=podpps1 header.b=t443WX5c;
 spf=temperror, err=temporary DNS error (domain: belden.com, ip: 205.220.178.250, mailfrom: prvs=541809f34d=diego.delossantos@belden.com)
Received: from pps.filterd (m0382793.ppops.net [127.0.0.1])
	by mx0b-00015a02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ8bw2b2638408
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 09:03:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=belden.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=podpps1; bh=YO
	UPS3/6JqtomXfOcNdWg0qR+e8TeTchdFjpVvhxX10=; b=t443WX5cvs566qU2nU
	ADa99xSQ0iBDB1ad2SbmSaOOqMzVscM6d29O0hJqQGRbSrV99wqaoI2Cm7dyUX7o
	K/HoA+Bk7DK4//h5E0naR2xnGE2COuWhKdPq0dEG+8waF1QjLngDmblt/HlF8qXC
	ZiS3mAKfnoz790uCFayUdCTChu1Zcpgb3HqiOEGoSFK7ekh2Lwbsiv26WX7O70Yd
	Rg3Ip9YVC8Bm4KL1rSJaWHI+jF68xWHFSaPPfDlHYiHXXc7A+nBB701EwjY4dUH0
	OltaBY+bXwBbjv8lpCcCiyPXW53ehRQwKZZKkmdrfE/oIszcz7a3hjSB4xHVHCgt
	nYeg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010049.outbound.protection.outlook.com [52.101.201.49])
	by mx0b-00015a02.pphosted.com (PPS) with ESMTPS id 4agtt22fkw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 09:03:17 -0500 (EST)
Received: from SJ4PPF978963F72.namprd18.prod.outlook.com
 (2603:10b6:a0f:fc02::f30) by DM6PR18MB3681.namprd18.prod.outlook.com
 (2603:10b6:5:2ac::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 14:03:15 +0000
Received: from SJ4PPF978963F72.namprd18.prod.outlook.com
 ([fe80::7420:6428:2c9d:246d]) by SJ4PPF978963F72.namprd18.prod.outlook.com
 ([fe80::7420:6428:2c9d:246d%5]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 14:03:15 +0000
From: Diego de los Santos <Diego.DeLosSantos@belden.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] patch.py: disable gpg signing
Thread-Topic: [PATCH] patch.py: disable gpg signing
Thread-Index: AQHcWUUXchSl2w+BoU+bq8AY/58TdbT6B59w
Date: Wed, 19 Nov 2025 14:03:15 +0000
Message-ID: 
 <SJ4PPF978963F72904E09DAE13467890CA09AD7A@SJ4PPF978963F72.namprd18.prod.outlook.com>
References: 
 <SJ4PPF978963F72ADD7F28E59F5FF60FAEB9AD7A@SJ4PPF978963F72.namprd18.prod.outlook.com>
In-Reply-To: 
 <SJ4PPF978963F72ADD7F28E59F5FF60FAEB9AD7A@SJ4PPF978963F72.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ4PPF978963F72:EE_|DM6PR18MB3681:EE_
x-ms-office365-filtering-correlation-id: 1c74760c-349b-4270-85c5-08de2774627c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?L/I1v2+Vul2JFqdBQOUbrxFsuN4BT+oQO85wUgiafwCRKS+wrnTkQN7Ja9?=
 =?iso-8859-1?Q?W8gGQ/7RaJuuOkL25zcN0LgiU+VTSSdx6Kwj36A6DXZIdpaEBcfYWcbxJ/?=
 =?iso-8859-1?Q?wydr9mNNTLJJ7CxjW56AzxAchm5w/Gny2YjGgFkDVUEphwvp7H4vl7/qxE?=
 =?iso-8859-1?Q?4ckDUkApGVGOi2oPsoFO2WOUkNQc0utAptDLardJxJWQvNbv5Ygp67hUY7?=
 =?iso-8859-1?Q?cwLv1zmOwxYuopVJJC/YBik633fp+La1RnGVY+xLiqCvuvWSHlSdQalwVt?=
 =?iso-8859-1?Q?vHM4Lt45pf9wgUivLIdhVSL+nxM5PPRO/WfihWMaO+S58+wZqrUhP+crm7?=
 =?iso-8859-1?Q?5FFGsoiQBxrd3Uv/Jt8y/lUW4jOhQgoyVfU5WETL2LgOXUf4HnS+Kub8Q4?=
 =?iso-8859-1?Q?c9Bpxl+4kaXM1paF6Gj7Nt8Z16hYcshV0BoV55evC1Qa3l67eDQ4wGWwaE?=
 =?iso-8859-1?Q?OPubyWjUHFYVfP+cvZBQGoIYEObUZNpgikE6dOH0yN/Nq0hQzgDXJZVQvF?=
 =?iso-8859-1?Q?bZbjOX1JexXSqPgTzQ7RrZOkT4dYxObnZHjfja+lRNv02hD1D61fky1OI0?=
 =?iso-8859-1?Q?vVNt7+hp/7ak+4phQwRqQwr1U8eZBNwC4On2SEgXFDQoIvVq51M0xYNRhW?=
 =?iso-8859-1?Q?ZlS0w6sSm+iLVg+2zKKEcjdzA1riWfvWovN4aITIxxuvCRb4EGAF0QKqRf?=
 =?iso-8859-1?Q?IQ3vVgpTq2ozAQmZuZfmkjsEqouO+LbNNSaz9giiLVuzj7vTW0YlXf8owl?=
 =?iso-8859-1?Q?h0Q8Vr25tNs9xT5ub33eq3l8yAttY46HTwN1k5nYLpoQYEjaQqoACFO6M3?=
 =?iso-8859-1?Q?L1beUdpc0L/eY5q2sc+yCLhOzxll+6+lB3vAR8hVnKDw0rQWv5VGdoZ3qo?=
 =?iso-8859-1?Q?HUyEMl7g/sPzp0JyAiwT03qdm0dgh73PctIyrv0uAvANmDXOQuy7p3kR9K?=
 =?iso-8859-1?Q?fWlZHJgzVoyeLiKnzPKFsobL/5vjsam2LJT7mfdKd7p49CxkoqmVnelH8j?=
 =?iso-8859-1?Q?goZxndVlNhLykwlynShkuhxc9hlrHWTd/eh7RC6P3QgzM96CiHXMP9tJlD?=
 =?iso-8859-1?Q?6gCuoo/GlSnDH2vx2Bowc0iXA1vs6U0TVn+K4RU/qJU89Voc0/q9v3goRp?=
 =?iso-8859-1?Q?nmjy7Bs/3S1Lr0h5Pt9K++yyDlF50Tsq+cvq1kBsR33r+9diGe670HIuuU?=
 =?iso-8859-1?Q?O5np9XgwyOm0qy/wvZMzHqRArEs2Jz4ej4sXfi0m1AvAZJP5b57hTtF+zI?=
 =?iso-8859-1?Q?xZklY+Ko77kkqTzvkhXBcwpJl6/fJRpp+UbYd46twvL39L+YfzPTq2YqBB?=
 =?iso-8859-1?Q?OHwTZX1U48iBkgb7QtdUQITy0RRh+e8gZmArx8xyIgU+p9g2S3gaqG5+hv?=
 =?iso-8859-1?Q?GVAEDRiYNPeEievrw2G45+KfMA4MPw8hcnjNdWXOqEek/TSLXStTT/tVOG?=
 =?iso-8859-1?Q?Cg51UWkNJo6eI1HzyXnd/At1PijKU48Ja0Wlk+yhFEQQkzPSMkDMv7c9tN?=
 =?iso-8859-1?Q?SX45C5W7EN/Wanmr2kXhinsDFP5W0fdAttreOhpHaPXOHHoqmWa611/+50?=
 =?iso-8859-1?Q?qXFQ6Nbqs4AVwZtVjvWbLX3dgA3g?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ4PPF978963F72.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?3q7yLMo3wXPcy0wHJ6FW4Sg3su+Z3vg7F0ZqBlQo1w+D4aHLHLlTegKEV0?=
 =?iso-8859-1?Q?Dav8twHc1ajvQfL8sbX7l9V8r4i/ZlkQjlevRY5y6BGxpKTOAiz8EMtoEM?=
 =?iso-8859-1?Q?j13szX2TSESxo44URm9zq0FXBChFeUqP/08jmn0yLnKJrYRqMQR8Urokyz?=
 =?iso-8859-1?Q?dY9GC55AXbfJVADZH0d43E1Q6lmi0DO1g8IhqOtURtukBS3USsn1u8zoLq?=
 =?iso-8859-1?Q?6hbwodWApcULwK8LD5BMIgJpTzvYPY+H7VMNvZVlm+7G6GznPQhDSWR4Jp?=
 =?iso-8859-1?Q?ogenD0F7Jppxnj66MRVGfM2ckx+1MfL1Uim8g7CKZFqceLDPeyfZddVRkm?=
 =?iso-8859-1?Q?mjxZG7UW4mHcawLd5V/xV7Vvd2V7D3pKKQt44J1p/TIvg/tX5gn15MoQoc?=
 =?iso-8859-1?Q?KgX5nx6DBGuMi9W6e5pQ8w3U4f20WAeztwTyrmA9vCLmS49ZRwqbOAM+ZL?=
 =?iso-8859-1?Q?kj3Il95oEVfVRWEFlLDsqM8ZeokVc6Jc3hsHeKusd6uK1pTr4Ok2UQRJIl?=
 =?iso-8859-1?Q?4XDzLEG334rjrtwwomJkRgJWM8R3VW5knWUivbqV6DqwFuoA/+C8OkCG7N?=
 =?iso-8859-1?Q?mfV7mUtdQN5x3/oD6TVPu9a7VZKVlsSKaBMXOevVuSFYkvcjfTHU4I1Oto?=
 =?iso-8859-1?Q?agchrMCZHcH2XSIx3r16twNCYcV9QKH7n+sv+h5wsUqSLznzTFHYsuEuQu?=
 =?iso-8859-1?Q?k8OJ8LdLvvWx2PEQmN+3xIcGn16WJSCqm474qHdM9LHEHzTNTpu6J8IMt8?=
 =?iso-8859-1?Q?lCDoC9wauVp1sXf61Q+SkvbPhMZcZcmt4abCZbLVC09Poo1V70lYroOJbM?=
 =?iso-8859-1?Q?aI7EPy6IXSYQIV9R0OfqKv2V83QWCu871ciWjFjNt79qhLy2LURMiMV+jh?=
 =?iso-8859-1?Q?VcXoh7sZc0UhqAOwiih9Ba6bkUL+WbujAehUxzWZnWPPVLkvKG4GGtzNYd?=
 =?iso-8859-1?Q?0E1H/jPZxVU/S6M7YD2mdT2UKJcH+TzCo/VGOPGuE7jYPE8Kdwfh7CffZ2?=
 =?iso-8859-1?Q?D0B2Fx58iLv/+SJiSX1zyWZnLALtP9oOnaB02w5jGwqYwiTJDY+3pEqQE7?=
 =?iso-8859-1?Q?ZGC2hD7DyMqRpDXbvoQCe+BRoHfDCqLjl76Dv+HXlEY+NNlOahhdxYENLq?=
 =?iso-8859-1?Q?a7IfqeKPZICXybKpv3PODp7CEDKUWhVIB1PWCJ7ZsgwXi5OoaBN5rE0TN+?=
 =?iso-8859-1?Q?7nxopRweeN17uGtSOb+S6DXSQOJMvfzUTUmIsWiRuaDxjaErmJgEafdapq?=
 =?iso-8859-1?Q?ex86VjF9e88U703me2fyUIMih0tWiRPHV+vFKN9193A0Ee1RHdAFSgaivH?=
 =?iso-8859-1?Q?b6r59gtQk06CEtC0xQVJSTWCsHsJpYSnmCPAQW4Zjti9/ljsT6yFvXCLfK?=
 =?iso-8859-1?Q?egZqp2Bu272dHyqvjLsZVOXliHNnjZ6yki9d6dRe13dFtI1Zg2wcItqQ36?=
 =?iso-8859-1?Q?WgyEOPv9UJ2s9p30TQNPr2jsfWQtXFbqzDViw7mekW9yaLRqwtxieH4nRv?=
 =?iso-8859-1?Q?MZEJjapN8jgt9KQOTx5DY62lWJkkrod1kCzCKcZCYX+8NTZ5h5lS9yMdxx?=
 =?iso-8859-1?Q?knoXE3y4dJHImmOtIBmwW4BIbJhqBr123of4AK0/seIQyI0WblkCb5nvH6?=
 =?iso-8859-1?Q?U/QEsfsF2Vm6woSHJt1ByoB+ADj/vYaU3+OZJQxCjl6tZf4p2euASfCA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	rBtziIYjjKdWw3BpLuMaZqRy54s28Gz/k1NcwdfeQ/+LShzLFJ1DBpA+mml+ncfqEFVQOjyhQHChbXWJ6xCn82lYuFbOjL/LpZMHuGGqpoqU9A7QW7OolI1MQK1+3jmfr83NsDK/fIoEC4qRb62jzEjWq+1Yzjx2X8F++QuqWZZs71tNAEpWjmUV5ocjJzZRHmZUkRGtuCBpmOMUbZfi7F1Nn9PLRLqVAaSvPC82pRjgeLn+ewG3SU11lfpOlbQ6yj0qo0GLfvIa7HWy0xSTB1WvYUPGQChxUEeqIZPszEttSDoivV/H6Y6dLnnT9ENkACDtEa/ya7XA+73zjSoAuYTA0J9BXPSI9Ba40RcM4yHp0dvxrbP9Z5JRkvyTpLymyJ9AHCaiBHvThMpPJ5VJa5Na0YOZdAOmXeycJjIu+lLd70XZ791A91cXf9jpH3UE2AnZT+ftI7SeuQEkldCGXaonOf1qQ+s1BB4i3L8+o8Jq7o3UTy6nx+ROcMwkoYGPuwvXBkKFiCUwrvzXBJdlIUI7Atpvt4+LDeoO5RU3J8JlBMxYsQVyw7Qx2R+t+TokRN5WksFfzuMfQrF6+9MFW6WawThwNAkGt3HsijYxNMpCV8pOTzHLEQLTm/esH3mF0yh/QQo73uqWn22sosw2uA==
X-OriginatorOrg: belden.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ4PPF978963F72.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c74760c-349b-4270-85c5-08de2774627c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 14:03:15.4729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0f7367b1-44f7-45a7-bb10-563965c5f2e5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xFY5aLWX/ACv6QoMrj+mn3qxHYzkl/HVxkAX6tqlYp2iWeqxbYo33MtDgaPlLJec8BTouwM+CTgikLVj2r/FUbK9w4ENbKJ0HMxjIbinZJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3681
X-Authority-Analysis: v=2.4 cv=I6tohdgg c=1 sm=1 tr=0 ts=691dce25 cx=c_pps
 a=Gv32SYzo0qTo49aZOIuVGw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=mCf63rc527wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=WDlp8lUfAAAA:8 a=2odP6P5RFTFJp2yRdt8A:9 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: DTZSjSAariuqf8-kR8d0Mvfzf6aGKaRw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDExMiBTYWx0ZWRfXxgDfsCyzoUlu
 /80hUw4dOkNLGoIn76HA5Xr55jkaFVPsLkEtDTGJAujMuXdxAHXL1GCGionQVNbBOw3qtsZjMn3
 GLYvBo4C4xt82KV8Cjt8g8AIYTv24WS/W+Cqztp8CSLyeYWDHr4kQYllotdi077Nu+zwoAY/RqP
 oUY9Z6MROU3rPhcqHgNZzaB5SJdONHOe8wV52T+uxlxTC/6R4/88k/g++DgWXruQEhiP+4j1FT4
 Kj5QO2h8uyRSCOlvEA1/4d3lST4JU7Sw+PJ70yyvK2hQc5aGgWJdUykMcm0MKJr7esxi1aenQEL
 w6s2AprvSnnnvRNCldUkztU0VDQXCno8W1K2x2YkJPa6FFdKstBs194+AXjzsCSjoL1briiRGN6
 G0nQWR/H8N+/PedFGPmI+LScnTT0iw==
X-Proofpoint-GUID: DTZSjSAariuqf8-kR8d0Mvfzf6aGKaRw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190112
X-Proofpoint-TriggeredRule: module.spam.rule.outbound_notspam
Content-Type: text/plain; charset="iso-8859-1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 14:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226555

This fixes patching failing when git is configured to automatically sign
commits.

Signed-off-by: Diego de los Santos <diego.delossantos@belden.com>
---
=A0meta/lib/oe/patch.py | 4 ++--
=A01 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 417333e431..5500d8f46f 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -453,7 +453,7 @@ class GitApplyTree(PatchTree):
=A0=A0=A0=A0=A0=A0=A0=A0 # Prepare git command
=A0=A0=A0=A0=A0=A0=A0=A0 cmd =3D ["git"]
=A0=A0=A0=A0=A0=A0=A0=A0 GitApplyTree.gitCommandUserOptions(cmd, commituser=
, commitemail)
-=A0=A0=A0=A0=A0=A0=A0 cmd +=3D ["commit", "-F", tmpfile, "--no-verify"]
+=A0=A0=A0=A0=A0=A0=A0 cmd +=3D ["commit", "-F", tmpfile, "--no-verify", "-=
-no-gpg-sign"]
=A0=A0=A0=A0=A0=A0=A0=A0 # git doesn't like plain email addresses as authors
=A0=A0=A0=A0=A0=A0=A0=A0 if author and '<' in author:
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cmd.append('--author=3D"%s"' % author)
@@ -507,7 +507,7 @@ class GitApplyTree(PatchTree):
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 runcmd(['git', 'add'] + files, dir)
=A0=A0=A0=A0=A0=A0=A0=A0 cmd =3D ["git"]
=A0=A0=A0=A0=A0=A0=A0=A0 GitApplyTree.gitCommandUserOptions(cmd, d=3Dd)
-=A0=A0=A0=A0=A0=A0=A0 cmd +=3D ["commit", "-m", subject, "--no-verify"]
+=A0=A0=A0=A0=A0=A0=A0 cmd +=3D ["commit", "-m", subject, "--no-verify", "-=
-no-gpg-sign"]
=A0=A0=A0=A0=A0=A0=A0=A0 runcmd(cmd, dir)
=A0=A0=A0=A0=A0=A0=A0=A0 GitApplyTree.addNote(dir, "HEAD", GitApplyTree.ign=
ore_commit, d.getVar('PATCH_GIT_USER_NAME'), d.getVar('PATCH_GIT_USER_EMAIL=
'))
=A0
--
2.34.1

**********************************************************************
DISCLAIMER:
Privileged and/or Confidential information may be contained in this message=
. If you are not the addressee of this message, you may not copy, use or de=
liver this message to anyone. In such event, you should destroy the message=
 and kindly notify the sender by reply e-mail. It is understood that opinio=
ns or conclusions that do not relate to the official business of the compan=
y are neither given nor endorsed by the company. Thank You.

