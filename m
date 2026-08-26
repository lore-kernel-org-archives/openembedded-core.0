Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74D1C61DD6
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 21:46:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23517.1787780765653519667
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 14:46:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jdS0miR2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2698f24599=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QKdIFD745864
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 21:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PMSnjZ0Om9lyxUFPVbIQJjkiscHUQYRXHfWjUy1dvfU=; b=
	jdS0miR2WFiAaEugE6WVoI9uFiE6NECgo8EMtkjYTkFCl2uxr+vo0QcvT1Yjjb1Z
	v9G78VDvZou3tun94bcvs+DJb9smxCjbCHDhRlsbJ5lLkq4Q4i4HCHC/75BTEYug
	T0Hge0j3WEw1FR3VDggFxTfWkHfA75LwIKK42AHf3vyGGsK9PzJNnBjUKPyKiA4Q
	MCsNl3r3F4547fm8Un//UTlgYqXpw+AJ/Xxj/ogm2b2k79PnhRG8pUI+Hd9yAWVg
	EbW948anZUwNSiW3VRpzEv1kEz9Kh9Vrkppew4deltw05kAfeAUFfMVYBLQQ+OHC
	N5RJOJFJRm7GzGJs4zIxqA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020100.outbound.protection.outlook.com [40.93.198.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7100qm09-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 21:46:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hyEeFl4RoG4n8/RipvIANyqE9L82SV48PAkK/28ga3wTgYUroWYIgLrq0HzD8zmMXPS3RhDHgMus++V0EuLTpX8570N4nPf7TeKonsLUB20eIL7Na1jfA9Uv7jYca2LAbzFiYBbYb2iG6D4Sn8cFiyjNZFaNaVmLb6c6bpjHB2x/6htzVz/f6+2UjUgjGIB70wvSAtMevz7KvzTw7nrSwkbGX8XjyffVIURXgpUwZmpPsh516qYR0Uz5i/nCd8Ew6fOmWMBOBU+vbxiRM/W/k1eayZHy//1Caguv5C3JlSgFoDnzumZS2Ph/1/DoepxyL4H6Og+Vw4JQqtViJ3Cbdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMSnjZ0Om9lyxUFPVbIQJjkiscHUQYRXHfWjUy1dvfU=;
 b=rIy+FmqSBYZHKBrwOXWq4WWCfcY5DtZGkFbWs+lm0oZjH0spWxT2DlfqAPVyiE6gSqQxx9tdYv+KtviHM7nW+DSsBW3ah9IM0cZv4WEO6upW8D3rKJHiQ9a6PQlhmzUXUmQirf65LmnJkoiMN13uNDO4rZ8Gwf4rjP8N2LcgymNQvwXTnT7jKEgVOciGDHUDXqgXxhBJEGiCGsWfXQmsMGiTt9qqm0oHG6OOwRzK2NtFZ0kd64K66BUcEELgg7cXy8eepD7KPy1SDNypEWYxcLDjmYD9MP+VnWXuk9i5eCBn46ZR6Dd/drg6tyw43NPp9jYgsMYbkPyeTFRJ7JAXOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25) by SAWPR11MB9898.namprd11.prod.outlook.com
 (2603:10b6:806:54c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 26 Aug
 2026 21:46:02 +0000
Received: from DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b]) by DM3PPF5EA507B64.namprd11.prod.outlook.com
 ([fe80::4f8:91a7:e7b9:874b%7]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 21:46:02 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v18 02/16] package_rpm.bbclass: Define _lib and _libdir for rpmbuild
Date: Wed, 26 Aug 2026 14:45:34 -0700
Message-ID: <20260826214548.3002838-3-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
References: <20260826214548.3002838-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To DM3PPF5EA507B64.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF5EA507B64:EE_|SAWPR11MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: a1e2a20a-33c7-46a0-505a-08df03bb6c3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|23010399003|56012099006|11063799006|10067099003|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	FJ3pUf8tquvcPOZemmdQlrvBlb9ft3OnM3wFk6X6K/twUJ9LuzaZzEOATAftcaQf/7lsX04g2XxhYEFTQZnokCXiLXajQzJuIJWoREcmqOAf0s2fnnzYaemMTYyc8ajSoRUr1UqbI3JS5U7xrcRFeaxWMvAjpzw37QgAV+jV0vD2iorV+94u572lIC8Tyzsn7oPScwbvASmuaGJvCHsKsRDPGsewA6lwn6/Wh+Qn+SfkYlQWV8qIuXC++MtM460q3I74AQUZOijPfVQQHVjXkBMr5qvMkOEyy5PKA2PDojuZwJZZ+S3VZJmNSFJJ4M7zFZK2oIZh7Fj+NKVtwQGIFQQSxlqSmupIGXPvNJEdXprCNW92Bcier//QtXOVPaIfYgbgyNcuBRFmCgEICpuziGNSjDeb1GFV1Avoefngvs9OFUKriqKsn38E2nwxTH9+5JuOULKAwYBIhOX7LRs/50gs0a0f8iW+HurLWSDxyts4yMhfTQjiwH+fNWKT45tosd3+G0G2H7GrQ4j7DGrOUE4tqA7iQ3WbU+kDx+Y4ADfqIvTeRHr5ksaZemZIxsp6rO1IY8nRF4cKkKOlkzh70PiZ24xnG/6/Wh+xpR3UdUF7Eb9lErkEhrxmZSbl8H6lw1JaPW94d2z3gcBPtjHlDsA9+G6SYzdqIfhJQqygFR3Y7fYu0q8kAKPygJ05cZwRXrENiYdppEQDnG9WXByFN+3/1JFkIKE2qXqjYfXrYK4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF5EA507B64.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(23010399003)(56012099006)(11063799006)(10067099003)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WNqMqbjT2/m3M2Pv43xStrGr72hOEMxCSfZFQRBQaB83NnPob4G7EsN7dT1a?=
 =?us-ascii?Q?LiPjfg1iLnRQDifvya1xlLyVhxPjKEvEVLgg33csmYbDpYQBQNVImM4o6eZ0?=
 =?us-ascii?Q?jsdyUnP+mPsU8/znoPOUs/rkS7aZLHQI+9Ov/DwOnSXp4inRqsuERM9k/NSG?=
 =?us-ascii?Q?sE64pAsAuV0I7pAV8Z8/H37zDz42pgJxGQP3PXDv2NV7zO4XpNUTlnutn4xO?=
 =?us-ascii?Q?uqmarvlC7YEfwAO1zmqrs3yL3NGm6Mob3Jmb6eiFUnIQ2lIa1r7r9JF0vHLH?=
 =?us-ascii?Q?kORscxaSmyMgOSvYx4TpD03XKR61HH+vE3ywsYd/B+vpXZy7Lp7/jCO3d5oC?=
 =?us-ascii?Q?ltbX4/L+IPIIeTFIK8M+GH0Ni5tqBU7wH8mAJIxea4GOnGmElxyoTJBX94mq?=
 =?us-ascii?Q?/JdhrenaJ0WcHp25s8270lkcMOpFbxsO7KGFmVUnYk3yrrszUzdSIw5fbAdH?=
 =?us-ascii?Q?s4pUdsCGDqSyGruT/kpYhTtQNxFHF2B+g6TZZPvRNHuYq8xk5/1pWfWJnQRr?=
 =?us-ascii?Q?+3qwrsoThCjG62RTZS00lY2EO8mtSsykeZz7tBWxoMLRL60DRgvR0nkAj2uR?=
 =?us-ascii?Q?B8fCju0wwkmAK4Hs2W2wNp6uKGgv6gIZVku/YKhk0eGLjtbdOTZp6GIOfDap?=
 =?us-ascii?Q?73bL1VtZ5lqD75IZlvgxOfP1Lzx2zce4WVXqf/K96VWzvEWnpBBspkPUy7HX?=
 =?us-ascii?Q?tdDI/STPYkEgdMEoRcjGRA7jp3xFBxXiqwIZFkCAqgGJIlioto3T0knFkthL?=
 =?us-ascii?Q?umX+e4v/UhZ82rZmqw1ndA0mGdNdzKhaRrHafEfoFrWNCNjk65MxG2cRU9GO?=
 =?us-ascii?Q?AxpUKdSPfLlPcPzB275PfrNLX0DpRNLp5BNBjlNn/E+73jAO9A3alvrxa6HL?=
 =?us-ascii?Q?LtR06jD2IVxrycPtxrnG6WvoNjWL37tV7chdDB+6ELTzkrHHmi96scvi4qYS?=
 =?us-ascii?Q?uFEYRPVssGAq74SLWRGTMu6du4hL/LdhwNAi1NPXzxBALAKgcsYnZKwmHUAm?=
 =?us-ascii?Q?UAhjXTAKCqGR6Y5eejLRfjVzb6W7UiUS9h027bklSFcA5uovWlRRjTZZF/Ne?=
 =?us-ascii?Q?E890Hny0YoW6FQM3HVkDgNbBv2c0jcivapIQfE9Cb2s8uONtX4twXSOVSmIQ?=
 =?us-ascii?Q?GPemRJnrOGV7ElJ844VUUKlQEPQfWcLGVOh1kgOgG3PavU9dzcGpVmLz+4aF?=
 =?us-ascii?Q?224+x1aAs7O4cvceAIUIvS7g0PnVyFk9TvY2dzK4eil0jeD5q5vuU0dmGmje?=
 =?us-ascii?Q?VeUPIG81vW4MOSfq1PBOwfsN7iC/NPedV2mtqPLXx1BImUzf2J0p9FlDIiPe?=
 =?us-ascii?Q?VcI6UKE1cf57Iwbao1d486HaWbY4doKgMPgQCd3kYj0dej9gZoyWsVfUCslk?=
 =?us-ascii?Q?QdcZ8gxKXC6R8FuIDE2SZ7NqlkyJW6kVOj7NcZD5Uq+U5SIS++lDbNODIYZa?=
 =?us-ascii?Q?kMracj+unaakWqK2Sc+y1oIut9jQDDyVvW4vSDg8DKUdlcVWVZ94VtlCXikx?=
 =?us-ascii?Q?QeNSRWTQWKf6Y2FXuzY61V0AHNCnkowWTNTa3OeQ6GSe1zNWHT5BFevrcKrC?=
 =?us-ascii?Q?yRFq95E0YTmHrPR2kNszmDbxifU4phG4YlyaeDjx3PIwrJQSkR/0Jk7rzOKS?=
 =?us-ascii?Q?Ssj2vg81QTu4yY1UoLsmVRROs+DZfy2eA7YQ7MmwYAC+TB8nJCi2r8bfytU5?=
 =?us-ascii?Q?knubsycVsrsZSCFUB+nJ1m/DP1eF2Av++VrrGtucYOk7tf7N8kD9vOFdMTAH?=
 =?us-ascii?Q?SCNyfhk3/9N012MeA8v2ZV8FHjX/otU=3D?=
X-Exchange-RoutingPolicyChecked: 
	iJK2mmMrQOEfs1IxRDohJzmhRNARbOTcxOLpd0x8ihMSJsamCxXAhEUEksYQfN1Amym4yZtqu36zl466h8KN0TJonKwXzBWLS64i3txf092yUrvz82P/EZi6X9ehJaCMhvRX0joinK0xqi8jvgnBjAWwaU4H+QfqKMIf91yW22yXhNZCEGuUzLIhpMkBZ3KEnVIkX0s1EzowH8kjNkJTgQoGVf8MicTxv+ntc6lNNkoWd9e5IoCTDhM8/hjeaaqJf4uquplK8olFajQPH0hjhxhqJGLU/UAa2tiJBgALh4bYsaWHSo/EV/ZxuiUQbID74oYsayysxodpdnF0L13bBg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e2a20a-33c7-46a0-505a-08df03bb6c3c
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF5EA507B64.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 21:46:02.0625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +bDdWpWHzVvrkRwZvKA4DK/dlqzAbsvdMzAd31I2sqOY/V1to4QmI2nv29tSL9Lkbs03A+xT04oXVngZc1go+HbLVye7hmLOhswMoolquU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9898
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: p_w3z9AU02Sma-RhTX9Pu35Z8GnqxwQA
X-Authority-Analysis: v=2.4 cv=UaJhjqSN c=1 sm=1 tr=0 ts=6a8f5e9c cx=c_pps
 a=rsLXg5VPEOJQy+C7BNxFIQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=uhQZ5Q_QBcnTBNJc4ooA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: w7ZcCEF68VQ3-hl3XDcjipNFUzJENtgF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfXxNiGOIehtb+8
 PasN4Pd3OsUi8LgaLPairWtFw5rXIthcNN4hKTPn4pfICI39KS3LbQvkkQcIRCHt1pnPOifVwfN
 2FNxi5/Fjjc90fWrD6/lwvlJ9jlZNHRqSLy1FZSFZ4OtX49c+MHe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE4MiBTYWx0ZWRfXyoi+TrTcFJPc
 bW84f5ZrfepTJn1NJxCe8ly4qIrK1vW17yI9gqDe/1SF6bJv/DhPFUTYi7YtalH/yO//fQxaEFi
 DUy+2FkUj7Q+6qwDz7v/JoijTCxUv7G+nqtEt1orLt7YxybNhNiq8TqMbbn621f9kpepKYhJOi+
 aZdUILQKNFIiBktQa9s50eHtIcElpsp+5XITHVXCWTG0SEOS0tNKim0t7+CuBGDbppVJUcRcQ0D
 V7YOmbleqhPQoWO/bd/A5xZVrZwIA+4ySG4wB2Qj+XLmBiBnSAAIjK7MsPkhbijabW71eRoPVoo
 FZYeChqpSmvd/EuBgyl17Bu6xM1krUAzCc5J5txgtl9JoZb2zEAkkkNXWXQu63iGFQAf3PXu5Xx
 L6YVNFP29ED2Q5XVNrUtKMyvaFpiuPvEAfbe42TLYOvODk7RK8SLd6aAfO75SFrth3TsgTjY6US
 EDRJW7CKY/qOA1b8tSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_06,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260182
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 21:46:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244418

The rpmbuild is from rpm-native, the lib and _libdir may be
incorrect for target, for example:

* rpm 4.20.1:
  No pkg-config files can be found for qemux86-64 or qemuarm64

* rpm 6.0.2:
  - qemux86-64: The _lib is lib64, this is incorrect when multilib is not
                enabled, and _libdir is RECIPE_SYSROOT_NATIVE/usr/lib,this
                makes the pkg-config files can't be matched.

  - qemuarm64/qemux86: The _lib is lib64, this is incorrect, but _libdir is
               correct (/usr/lib), so the pkg-config files can be found,
               this also looks wild.

The rpmbuild is like cross build, define the values when run it can fix the
problems for rpm 6.0.2.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index f286d3a0e2..9af4cbdd94 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -585,6 +585,8 @@ python do_package_rpm () {
     cmd = rpmbuild
     cmd = cmd + " --noclean --nodeps --short-circuit --target " + pkgarch + " --buildroot " + pkgd
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
+    cmd = cmd + " --define '_lib ${BASELIB}'"
+    cmd = cmd + " --define '_libdir ${libdir}'"
     cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"

