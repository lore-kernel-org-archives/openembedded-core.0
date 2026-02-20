Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B440C56201
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 14:21:33 +0000 (UTC)
Received: from mx-relay31-hz12-if1.hornetsecurity.com (mx-relay31-hz12-if1.hornetsecurity.com [94.100.139.231])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39752.1771597288640115777
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 06:21:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=RmvDhSeg;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.231, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate31-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.72.89, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=am0pr02cu008.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Hzy5EepCwMQB/++wN6/htL14hV2GVgeeQFOFJ6Hl0PE=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1771597286;
 b=VSAyRu3wi1q92FU0qlB7ucB2/qdPK0aGK4Rz1iSPPT2zZLZE0MYvzSpLk/Azo5ARhqt7oaKh
 s7u+s/UY7Ts1iyM7FJAGTZJvvZDYLdYvFHPT32xAVKYiDLNc3WUbEBg2rla6Gr80TmwvPM+6uq1
 qs/a8Fn8ahWZr5xssPbOudm15QbJCjDZgQG0hW5C/+gFn2q0Yp4x2vP17YxCymNpJ/Hp109Rucx
 xvyu6JswhGOu9lGQcWzprpgCo+/PHyvSxzLorf2EReWlds85zngarxbb1TaNtrgnN0RPJUvyFc5
 5gc59BwOeDplww7JByCE3GgOIU5hdAP+Y3YgEFM4jHy3w==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1771597286;
 b=BEEaO+W3uGH06uvdMc77g1yjJeDHj/YVnR+2fzZJThj8YThNWSXjclGr+X6dkfChFiea42pQ
 D1k/VtD580htB90kJAoIKN4pKwb6Odq2u47szuIgv2LSl7CvfZKCnLnRSqYqKHO4yha0MO6SmeX
 F1ctQabVibw7iNyCC4XTLLMzTcQzxk9F1aCM5bRJK1HDc1pHYoR/ZsYKlirmf2HUvbAgtD7ejf0
 l4SZpXAacs3xGrzWO+JYAnlRtEO2ZzylOC94NggJzwDd66mptp/DAx2hRoWl0cS9lQ2iKZWJfOO
 jmjG/0w+9EFn5wP7lbAzyNnV4WPCD/nwtCgn3fVhHG9RQ==
Received: from mail-westeuropeazon11023089.outbound.protection.outlook.com ([52.101.72.89]) by mx-relay31-hz12.hornetsecurity.com;
 Fri, 20 Feb 2026 15:21:26 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjVuTXTPOuh8Ql8bPbs/egTBXmuauPNd3HoN88lIPaI9UHp77cGx9FOgosuwECZiuUJ1qh3s2Y/4of+g8L5OYSZ/XM0F8FSQNBopCMyPss+D8ZE1X323ZXQZ4PuZSQN9UvjZJtSSIC6FyRqPDzlbfUEeK8WUSrHiCD8TckdWz47DFqyF1ovSTABw6b24rw8PsCpUICMhuKn/VBhCoBeal2HZ4GPh+t09d83s51XNM1pj+yAa1Jf+K2ELbqSYAlEZxIVC6HKS6CL3xmkHaMe8N6eDQBpOey5K8YwHUg41pYaabb5u0dVieDL0iaDqnPMJkpMw0YLlJBBHTsdjtp2H0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hzy5EepCwMQB/++wN6/htL14hV2GVgeeQFOFJ6Hl0PE=;
 b=RjBSHA/2nXBtS7NvAAXKsxgvUf/w/uteqqiAguqC06cw8Zz4YauhgoTiLhDCEd8YB035GgKL/GcSnNmzFHKm+40ZD1WJtCXpho3bizgRFlgsqYtjs76SOSfFwEocpHqW5BkmIfxojOG8AvmI+jMuuhGoWUgwDkTdDeuMH2Xkv4QfX8SrwdmD83fRV02xZxFP/BotuVv8tOEp55i8+yGozYSP2VQc0SnCm5SEdduGfj5s0vCJmaz1efCWemvE5NDehmbgNbSvUsr+Bb3T8nykjvKMcjAmtG+i9w7XefIsW33ns+1PmRzDWUU06eZ2YsC1J/VrOwbXYUb2EXvz14eGPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hzy5EepCwMQB/++wN6/htL14hV2GVgeeQFOFJ6Hl0PE=;
 b=RmvDhSeg3mgqgz6+Cg9VoIruE3vPL2Tp5ef6aEpgC0+YQpX3Kgr0/n25KLhIU2XLInZ4Uv46yx+AM+e5NsTjP0KCovj1BInPybiJeBzcUK7j6MZUj/vWrvNvgNbcRyMPuJXoddWO+yZIeihJxJurHhsHGkSwpux0kDrS2SGsrblMIpKBmt/HuAPOpr6fOqBQuhD/EUPDcg1nhJmmwg515dIfj5LEDUMIzFdLss8lbOReR1Vz7Pubf4hGGCovflrNaBjoWCjKrlPBJWYrYMfdvRvOLjF/njXvS1OF4mjRNx4Q4CwDDQ8q9rWESAxkp974mDIX0TfDtzYGdUoZ4RzxBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 VI0P192MB2943.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:2b1::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Fri, 20 Feb 2026 14:21:18 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 14:21:18 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [OE-core][whinlatter][PATCH] zlib: Fix CVE-2026-27171
Date: Fri, 20 Feb 2026 15:21:07 +0100
Message-ID: <20260220142108.881783-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0063.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::14) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|VI0P192MB2943:EE_
X-MS-Office365-Filtering-Correlation-Id: 5af095ac-66b3-4f51-17ad-08de708b506b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|10070799003|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eAja+OFmYfzMH8mXJ0iLBOzYqP2aEJoG2NnOXJJAsEanQq2kKX5PjsYjbCgR?=
 =?us-ascii?Q?DM+yDULMdbf6NK2LDq9wyZIsEPI/emwYYQz5qEIp7s4qyyC/NVII+TXG3ev1?=
 =?us-ascii?Q?OIiwPPrZyJLXFS0h3IkygyowvL+XFjsM9cps4MSeELADBdZJ7zG0bBs0mlvV?=
 =?us-ascii?Q?y+9bfls4jjeORKcSbFZvQt+nGcq0eP/90l3j5ln4/dSA3g1ApPOXw5Kav5ij?=
 =?us-ascii?Q?PzX9L7oPnVkb/lhVlRjf3E72PFnKFuunsKo3YkwRvIBRq3iZAyu29tetRKTK?=
 =?us-ascii?Q?uhSHB1Rj3lxcVk04lXr/QG+vGV5pow3LXK7/VLcDxxQDDc+3q5eAcN08X2Ng?=
 =?us-ascii?Q?pToey07adLvFmwnoiFLdJYIKmCY5JiESX3Nb5ulSiFSDBbDiPBJ0UFRhVFoG?=
 =?us-ascii?Q?ScC3JiVjqDRr30XMlwuPktAvsUUy3ZGL1EMNH/wS6VbjgbKMik5kKFxAHob+?=
 =?us-ascii?Q?uMVjcB3FuTh4+6lj8ZutycYMdB0RPfCrea6Gb+4FHq11qyQeU4uhOWckSKZz?=
 =?us-ascii?Q?PCjVOYGv+rjJi2Nki9Q/1y+Izm/SFkHSvm3k+ovx2nAN8WUJmJaTUHNjNq+V?=
 =?us-ascii?Q?eT71lMoRSN1vqoJAr12pJ/98FDiKUHfas7WAeClHAIgWMOyhXm/Lcr7Io93v?=
 =?us-ascii?Q?yQc3dX0nrYWe8MyOhLxlqv/B/d9bZgbK/5qd1BxCSYRmw8MzGIPNk+MAFwz+?=
 =?us-ascii?Q?Csm9encZCx6BPEyx1T6ZqYnBcFR3FXN+SDk0njJfMILHthH7B0lg41K5Vt+t?=
 =?us-ascii?Q?6hcEGicREllMkojlP4gD4fZ8zM6YB1oGMx2UKLk8KpzGcFpWS672fF0pr1qK?=
 =?us-ascii?Q?WkT5/PjMjEAU8H45YKybTccCkw577cbMko8+mXWAu53LMCAP0izf0GgnZcsE?=
 =?us-ascii?Q?kPO74WqYRTTEOFbAmCyspUsG9OxzTAWXsaAVjTh8viF+olQTBhAF6a5sgCWE?=
 =?us-ascii?Q?wrbPeK4xWCueEBmkTewzfxfGJkX8TtuijOmORxcP2ptHqInaER4n9x7NuLGS?=
 =?us-ascii?Q?x0K6mLht7aNts+DUZIPD1gfJgtIwxbrhNs5RuGg575SzpfPcBKw44BwWrAPq?=
 =?us-ascii?Q?AeqjBwky0TdAIf29s3CT81P8O2sQCy/DRcVOTePioW8ErLmt2FAwEKryaPPE?=
 =?us-ascii?Q?LWyMpJkTf4R1sHQ3P/olIOWluOkH19AnuHLoDP9Zdx2g9Fb+/UB1Mq7csjyf?=
 =?us-ascii?Q?bRMJPdTt8JuFajS0NZAjMfpLOzbJPmu3bc35BXw7BEioIvKJHthCw1yjDJLa?=
 =?us-ascii?Q?HSaY1GzYyHA341mI21vxzWwsxU5q9vYpcPeXolRQfyyZbhxwl2tadXhkJ5vA?=
 =?us-ascii?Q?EEFDQqz2M52zYHc95Nm4AKfy7MYR57SWupq4WP0ZF9pshUcvJqFTHDBgMF6o?=
 =?us-ascii?Q?SFs4FI+MpaKL1QGDzVB248b5uLuPpu/d3MvMZjn9lwuaILd0mkNzI3OpNh5N?=
 =?us-ascii?Q?x1pZ7MPNfIHJrM0j+UrVWhaj4eBUgV1ae2UgqsLgHkTdkUXAoTvxMG3dPojn?=
 =?us-ascii?Q?Njir2SPRtMyVc3LVAMB1giYRxCr4BYgXt5D0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(10070799003)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cwQaU00tYQ/BWp0Rclmz1JjjMDjgPboPe7MaWyPTQgI3biGW5Lu7I4LJU1wP?=
 =?us-ascii?Q?BsZyYdZI5h9xgW4YG0CAAAjeF2AcUgzIZPS34JqneIjQ4N2nXiUd0Y0QUGrc?=
 =?us-ascii?Q?UiAKs2XfmDBo0NHhkS/kU++VNArZBhrpx0tn2gXrHr0rwTpm0SWLTkUqCGOC?=
 =?us-ascii?Q?HjZr156xzXVHJGLbT6lCOXPtsiiZBwIZz0IjIy+mfrJPIQLsGTf4WDXlmpl/?=
 =?us-ascii?Q?cVFxeFJpDi8MEG8xlLLC1P395cavpBo1ST5cI1XNf1vgSWknSgliat5NfCi3?=
 =?us-ascii?Q?mRNBVpI9LVO44BUJUZNitVUfcdjNZ07ArFDVh54epb7wtczDGwrk1sqDaiD5?=
 =?us-ascii?Q?cmMm7tPXd4BvN4NDh6ToWjhHeb1C3c46VmRMeytvTB58EiTmceQzFQKAwcJ8?=
 =?us-ascii?Q?q+6D//v1t0cOKdxFGGhKEBhjo5prCq/5T8k57EO55rUbSAOXdpPl3T0ICDFz?=
 =?us-ascii?Q?CASJKgWeqYFMbmBfOFJ4DxmyVOoVOdA+0XRzcC7II549e56wnHPcdJZnQQPd?=
 =?us-ascii?Q?lvAi2cCTiK7BFaAKYt61p/Vt5J20ZvWHohJWGRqfmUNnxBdf536zYr5HeVfk?=
 =?us-ascii?Q?Sxo/YZ4YXBId7zi0LSWVe3kwig87rRv8q7uucHCqdu/GskKMlQrb8KgKH+hL?=
 =?us-ascii?Q?f9gGb1S8K/IUpADhVjDsVBmDomChib7Kz6ly/Gpt+mtX4rAiPAttNmXssNPm?=
 =?us-ascii?Q?wiFn6DN9E8cIdxq1vrxFtHKJg09eKziLKz94bBI+zHVssJCBEtiXVhC75yhx?=
 =?us-ascii?Q?bE1uAhzYMTNWHBKuOLjlOlxJIHQlKhFTcPEDkF2vcwHuufniw4scOOP9zY+b?=
 =?us-ascii?Q?KxteZCPD/dKRdO4v9M8iPpNOv9OFta46jSn8xS3ZlxmNUHnNQ0jtnGdzhKAH?=
 =?us-ascii?Q?p0WZ353BwRy+d9lWbytRiAAckkzNRL0gBamEFTFkMzk+/oW/Lb8sh7TlOzKp?=
 =?us-ascii?Q?zTBi2MdmkRXY1kg7E2xV3ex5aDi4rn7FgNj/URD5bOrcm0W+uI1cfaUkIxqq?=
 =?us-ascii?Q?KLDcpkDnJFO3o4F1XrI8dNsVod3xuoCasVLP4wC7L9uTO2NW4aVwehz+RbRF?=
 =?us-ascii?Q?HD7F0h4q4kicVumYiGnBSDpAOE3dV+h2n/GGNN7kjZWEpX3NQpOHyQkgUhGW?=
 =?us-ascii?Q?3yVY28co6TG9CsfN515JogOZG7aH9c9EE2Gc5RNlN7FuDHMu4eqN2dnaylr5?=
 =?us-ascii?Q?Lwpxpmc2pIIxgzRCO/YttLipRYSuO4l5vIXQIpBqH6cD/NdOkzENgRBCeMu7?=
 =?us-ascii?Q?IgUK2cvjaAI31weq9bTSWpsdWnWBeVvQO/yoC3D5LG2jiecrFNyTuazGOIYm?=
 =?us-ascii?Q?j6YrkjqXc+hmepvHAe9ZD4wUg8hrfNoyNZ/9yn2nnL3iHFwy7RFrGSo+sU8S?=
 =?us-ascii?Q?w/QlyXA82IEg+PTpceAq4C0hU9almSaTXrmMMcY+M8zVexzT75VPu1AZ4Bbm?=
 =?us-ascii?Q?OoV/iBaoriWdF963rfM7LkXkJiWr8OPDXr9/k8HGJXZpieThTRlOn6VhR/en?=
 =?us-ascii?Q?7N3aIx1He0pvVLMAqSW5F1TZbkT0QNxSsZvb15vS/J8nLrrXQjGZ5CIAeaXs?=
 =?us-ascii?Q?nFdBWE0yhGzODb6TqTC8rJYxvKBeLMSxd72/zwtwwdRX6xijcVDbcnvG02do?=
 =?us-ascii?Q?asTgSEGPu1yjmpino2rGJSteBp00+tRBZUPpq8x/x1UzYuxwY9fK+mUJs28i?=
 =?us-ascii?Q?8M9cSO/rvWy/SRlqd4LbHrrLdkSTo16nvFbhQCuKvWxjpwt38aIZOdspsJL3?=
 =?us-ascii?Q?dn0c1Gq9L1aDQ7oP+GKxIrygU0RhIjbNx1v/MyHFq6YRDnx1uRtlNsKDweFi?=
X-MS-Exchange-AntiSpam-MessageData-1: kBDTuS9y2E002A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	SHtaDsTwhTIbii1HNBMwJhSX9rs0YuWY70y+FZKt1scCBAEAsSHVSEcCJS3Gx9YVPUQIzoHLh760N6nZynOv3J/EFzfPvKO1l8VfOPpziWhwrhYJSn+qnBgrFnsJeE1nU7RpGXDlUzvs9c/wCy7H5nehmTLCIRoELrktXkK/2MsNL/z/GUxMGCglCLenNVf6evraqgjsRPpXdpITFE4yOpPKOl0BfnVwEU0IW3WMJvb1POFDN2FgtZs/EpXRMVfMcbDtovG30e59UVPeC5n1M0FGILxcVb+iwC3YW5QeWBJro56AmtjNHWxyVaeLRL3kDFNzfxILhOlYAbdy127tjs3mJGe3fbuCNITXaUqJynUIObGHMH6MdSAllEX3rYb2WrQaB0FGjGnrxY2fCHlVD4D3421J7fR666pbY1XA7A4Vx+xsRQP+2bvBzIVKzIABzxJh1nHec3egcC6ddtNq6OSfzgnBPuxqHlfC1RT4ORBt9H9ZH6/rzqjx+JdGgg3xq0G7tmhZ3I/EIW4zXfc/CJyCzWb+X97K9h4FrYYL3RB2x4yRVBclxtIJKOIqLSz+mGTWXB8LYMB64RoH9/L4bDUkXo1XD98AEoQJSW+uQY76Pup2qFN8baw/TKFxfBNL
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af095ac-66b3-4f51-17ad-08de708b506b
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 14:21:18.6030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vV3Wrnul7WuUtoPAb2GVRAWtVAz/eGvfF8QAH78IzKHwg0g36GBfflqd9OiYv5YkAjSVCxMKZ0J3/RgBwdZqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P192MB2943
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay31-hz12.hornetsecurity.com with 4fHXVS6XGxz2TSN4
X-cloud-security-connect: mail-westeuropeazon11023089.outbound.protection.outlook.com[52.101.72.89], TLS=1, IP=52.101.72.89
X-cloud-security-Digest: e77cf3e9522da5f6dd929ce1887eb7f5
X-cloud-security: scantime:1.734
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 14:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231515

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Upstream-Status: Backport from https://github.com/madler/zlib/commit/ba829a458576d1ff0f26fc7230c6de816d1f6a77

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../zlib/zlib/CVE-2026-27171.patch            | 63 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.3.1.bb          |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2026-27171.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch b/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
new file mode 100644
index 0000000000..e6a8a3eac5
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
@@ -0,0 +1,63 @@
+From f234bdf5c0f94b681312452fcd5e36968221fa04 Mon Sep 17 00:00:00 2001
+From: Mark Adler <git@madler.net>
+Date: Sun, 21 Dec 2025 18:17:56 -0800
+Subject: [PATCH] Check for negative lengths in crc32_combine functions.
+
+Though zlib.h says that len2 must be non-negative, this avoids the
+possibility of an accidental infinite loop.
+
+Upstream-Status: Backport [https://github.com/madler/zlib/commit/ba829a458576d1ff0f26fc7230c6de816d1f6a77]
+CVE: CVE-2026-27171
+
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ crc32.c | 4 ++++
+ zlib.h  | 4 ++--
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/crc32.c b/crc32.c
+index 6c38f5c..33d8c79 100644
+--- a/crc32.c
++++ b/crc32.c
+@@ -1019,6 +1019,8 @@ unsigned long ZEXPORT crc32(unsigned long crc, const unsigned char FAR *buf,
+ 
+ /* ========================================================================= */
+ uLong ZEXPORT crc32_combine64(uLong crc1, uLong crc2, z_off64_t len2) {
++    if (len2 < 0)
++        return 0;
+ #ifdef DYNAMIC_CRC_TABLE
+     once(&made, make_crc_table);
+ #endif /* DYNAMIC_CRC_TABLE */
+@@ -1032,6 +1034,8 @@ uLong ZEXPORT crc32_combine(uLong crc1, uLong crc2, z_off_t len2) {
+ 
+ /* ========================================================================= */
+ uLong ZEXPORT crc32_combine_gen64(z_off64_t len2) {
++    if (len2 < 0)
++        return 0;
+ #ifdef DYNAMIC_CRC_TABLE
+     once(&made, make_crc_table);
+ #endif /* DYNAMIC_CRC_TABLE */
+diff --git a/zlib.h b/zlib.h
+index 8d4b932..8c7f8ac 100644
+--- a/zlib.h
++++ b/zlib.h
+@@ -1758,14 +1758,14 @@ ZEXTERN uLong ZEXPORT crc32_combine(uLong crc1, uLong crc2, z_off_t len2);
+    seq1 and seq2 with lengths len1 and len2, CRC-32 check values were
+    calculated for each, crc1 and crc2.  crc32_combine() returns the CRC-32
+    check value of seq1 and seq2 concatenated, requiring only crc1, crc2, and
+-   len2. len2 must be non-negative.
++   len2. len2 must be non-negative, otherwise zero is returned.
+ */
+ 
+ /*
+ ZEXTERN uLong ZEXPORT crc32_combine_gen(z_off_t len2);
+ 
+      Return the operator corresponding to length len2, to be used with
+-   crc32_combine_op(). len2 must be non-negative.
++   crc32_combine_op(). len2 must be non-negative, otherwise zero is returned.
+ */
+ 
+ ZEXTERN uLong ZEXPORT crc32_combine_op(uLong crc1, uLong crc2, uLong op);
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.1.bb
index ef83142121..892467a1fb 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://zlib.h;beginline=6;endline=23;md5=5377232268e952e9ef6
 SRC_URI = "https://zlib.net/${BP}.tar.gz \
            file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
            file://run-ptest \
+           file://CVE-2026-27171.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-- 
2.43.0


