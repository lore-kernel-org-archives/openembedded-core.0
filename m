Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E30EFCC6B3A
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 14:01:59 +0000 (UTC)
Received: from mx-relay79-hz1-if1.hornetsecurity.com (mx-relay79-hz1-if1.hornetsecurity.com [94.100.128.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40914.1792072914429210757
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 07:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=RKUE3XEY;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.89, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate79-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=52.101.83.143, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=gvxpr05cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=A4ESuIE2QnC38DUbDALiAL2msxxb+f5cio94L2Vp1so=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version; i=2; s=hse1;
 t=1792072911;
 b=f2NZNI8DIKWknoSE0HHREmzZWVI8oFHxPuQ2KOPzGrnIaj07WuMTnULhpfY5orsolppBn0/+
 chyxABZYEsXEoy8Oy7MAkdxyqlK+17EKdJQDlea8Mf89qHBbx3Gj4wkEdtrRSCBfn+6LF5Ue3Ll
 mEtZgms7GLXvM34e/8Fa4ni96i7i7BZ4F8xlXAiWdgPda4uD4shKzPycll3X0SEDFfQ+P43Hkag
 qiU3fzHa5tbdemFa8INbehugBH2CrSYpxNm52K/7YXDwL4FVF9sKwi9JlXRLLoTi1t9IULGzkCA
 i9cNqnMkUnwm4vpkXP8BBzkvvaznESp0p0RCVCaAVJl9w==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1792072911;
 b=JBZiaRJxirCIlZzgV+1eXskSk706Pa5i98tBPCaOheq/FRXzJKHV+9/aX7sS7E0RgI7J7YAe
 VD39DWnev7rE0UUJ0LzzzBeW8PrqehLVF7qXa67Y+QMapFbxeojchrSSHzY55PwZFKP76Ox4f5y
 pF/lfURmS3oxpQoo21pArcn81gCSTCroJjaf4KkQjQgG7096MraoJndITMNjuQS5zTSBRfIIalK
 kQ+5TYuk8bi1ysccBllErhaWrbw3Wd5AOLpui6HsWmRRnd9aRnC2D/sxhoVLoe5CzN/p5crmIB3
 cZjt09VkYC9xntnffuL7RlVC7iub6qjrgiNHeE+JDNeQw==
Received: from mail-swedencentralazon11023143.outbound.protection.outlook.com ([52.101.83.143]) by mx-gate79-hz1;
 Thu, 15 Oct 2026 16:01:51 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJhEsNS3/Zf0nzCQOEk0d+OIBZfBiW/w5RPCd6z7/RxfeRaD8zH9zSs8kiog4UpSKRoRGNM0AIBqx8RT8ooK4ygfck4eYbopp3sUjLCnS61P5Z/Uxo4IHK8C3p1CNj8q/EKnfEwAx33TCqdUjxTLeDrZBJJjEfkuWnA2pCgR+PiRWSciQqDQmP8X3IqjH6cb2ssFxLJKXKhC+SDPjob93GBfjgouSRt77lmpNniCwUd5rdSOShqBtH52ZSr9FI7Zdcy7liHnJvvIqTfzrl3HQmNd6GJmOul5JwZoBSN2JdgjtBAjHyBYitzNfs7F/H+E3g32Old+KrjXtQuAxg9Drg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4ESuIE2QnC38DUbDALiAL2msxxb+f5cio94L2Vp1so=;
 b=TxDcGhviiwELxQFX8g9sOQEoyDzvuL+Z/KzZST4E72G69sbNbbOo3v164QmBrhLNZZnF/1QzSrOjkELzmKori5xMFHQDaq1QzfZ3ugLdi8SjolwmQPPb04jjihaeJu4wz30SxVTyJxjHSBMan/nAIizSRwd8rvNOP2168/w1WBx/9CobyldVNL/ztSsZKL/YroP1B/90WnySAA/vJTpR6vRMhsOg4e5J0FwbgcgMyum55s7GaA6Wlny5eeRpNSXeJZOTb+gBAxlCATDb8YkByCk1u2aWHU4j/767OyUXJ1IiSVZMsp5O82I8RiYC2PrXdHLLgMPEjw0xnHC3M4i6/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4ESuIE2QnC38DUbDALiAL2msxxb+f5cio94L2Vp1so=;
 b=RKUE3XEY97B3nHPQkWB+aphfhFeq4TzWLwfOCLJKJqDCU5pCxk+1qR6Zmw1EL7dUBrwz5CHORBD4Sb9p1cLoTiIahWg/YdoSvDtGDObLCgNGgE0mwdZ35VJZIlxlXnbG94cOwB6ixudc/ANdzDWDk+utfCtD1q4+Fms0Vu3kkwlMNmlBDtHEpYyow4j3rvcXJ8j9qLuUklvWBpbbjeGmQ6Rgca1cZh+5f9bZbT4kKuzJ33s3GkPjvRWjbqQGCojLZIJqlVCFrMBYitVzZvZxlrwpZwD4ulLyDoyNmqgArJz4bM4SUgg+ElF+4Sk7iJqMP6LMuhPM6gIHLl4OtZKHlw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AS4P192MB1862.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:51d::6)
 by VI2P192MB3242.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:2df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 14:01:43 +0000
Received: from AS4P192MB1862.EURP192.PROD.OUTLOOK.COM
 ([fe80::81a:852d:56c0:eb58]) by AS4P192MB1862.EURP192.PROD.OUTLOOK.COM
 ([fe80::81a:852d:56c0:eb58%6]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 14:01:42 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Hugo SIMELIERE <hsimeliere.opensource@witekio.com>,
	Wahid ESSID <wahid.essid@se.com>
Subject: [PATCH] python3-pyelftools: add missing runtime dependencies
Date: Thu, 15 Oct 2026 16:01:35 +0200
Message-ID: <20261015140135.2188972-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::21) To AS4P192MB1862.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:51d::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P192MB1862:EE_|VI2P192MB3242:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a119646-23c4-4671-0651-08df2ac4d77a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|23010399003|38350700014|56012099006|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	ng08IBMTt2pCWXB7fyh6Mb4sSQVmXSj3Yzw/5ozQcIc8rnhQYBIVNu+f6KsxMtEeyG+WsK7kP6yy7zWzlIPHf27UuUK7s405V/4dR8payhZ1r1uLxegDnxxKscjHkLK99hUGw+MuW+WpNfSM+Cx3gi32ch/n4uhKSwvsN9PAc3JXbifpZy2gFQVsSaJMxF5HPu7iYRY/lLQHxIkQy9A59cpM03iVDBgHoLrBOt8ApUjan6rMARUY3RvLMhNyJ6Eai9KHqmSGVA0+Cj5DX9SgcBV3Et7krsdb5TlPBnWvSbOoE9QIgmcCAeL/23+tqEfsZQ5LG+1dhRmT9fv6FZPlrJarsnzYQGNymEiVQezzbvqgmEmCZKRs+WppfKnRaOJbrip/Yu6PLIuW2vbq1TDiflbdQtl9e4iBhrx7WsD/hKkstcZ8PJD17lNfsNAhhGiKyaTXeJAzg6uDBgPomoJVx6IaJhYtKkJey9fFqixQl9l6LVZqN6vCEWqzwnEk2Xre1fX/GKmdsSYast+tIiKCH9Fh5jGFRSxcy/erFqhj8IPEAXMIO9w2nat4Tg90qm4hr8tfMc83Lfl1+HHpBAeBgnxWbol3Duc5hiXQ2eR9lmd8MAi3WxTYeodgIh9ng9KM6jcEM+P4QJ9vgv7e4546gDkBsVCIMPAPei0rNP/cN/SloBAE7EbmeMWs7XRIUGvCl3rRW6lr697oIQjopoknzbLUSTTRxvmHQOczvy6Rrco=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P192MB1862.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(23010399003)(38350700014)(56012099006)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Sp3vhNF6+2YpWFCiajv+WtCIgVJa4k2JsoK2QhhTagSYZyUotgn0JX1G4FpV?=
 =?us-ascii?Q?bAPmc4v707CmpTa+wAxPDtOknAgkGZvaUSytLe1tmd9cANbv3da/sXNb3L9D?=
 =?us-ascii?Q?SPYQI9nbkBDB5rQbF0thyrKWHEYDeyPL8u10zToi4fIlCv95mrGn3vZUd6OE?=
 =?us-ascii?Q?Tff7lpDu5gt0NKS1Im0HqDJEY+VHIZVfgjal14DAgq/lhfJUUb3Vv7d8Y+5i?=
 =?us-ascii?Q?l8llLtsBujaavS461R0ZxALlt1XI2e/eS4wkx1iO/O+F/LIuwrkYWAQUFC6X?=
 =?us-ascii?Q?9OPD35+go68yf2AOo2ACAA1KmtCC2m1t6bGAODjUMlm+Anll2u0ChXywR3Me?=
 =?us-ascii?Q?LloKc59reqnqjy4Zgfs8Bscty57Cmw6RpzOlDIBtG85oNhowFhOzxB8pnB6C?=
 =?us-ascii?Q?W8gETeimTJEV/FllVWOQ23P0S1+zP/UzU6FWINPao8JRODdAlJ+poRVHHe0F?=
 =?us-ascii?Q?VYpzGYg0oRZMuKJ1f2citOObcWqonfIlsnZ8XGj/azKHaVh8cpXkGqkli/PQ?=
 =?us-ascii?Q?ayZ2keb5oXXjXPUqo0L3BWfJFKO+AjqJkJ5udQGeB5CYo0azB5/aMor3Ljej?=
 =?us-ascii?Q?R2uf5MWvOpIdBD3ZziPu+XpUsJy5Q1n4DwQCBXgBHmg3Nv2s5N+beGtoBbJD?=
 =?us-ascii?Q?Nash+6KhzBxaq+oCFNWixPPM6y4OHsIgbdgQz6AKZp5/E3fD+CpdOea+J5SY?=
 =?us-ascii?Q?Cj2QJo23XdDEtuw40Sm1R4fnDNB5FxdWVrTlh4S4Eh/P6Vr+nBDMaWBPjv4j?=
 =?us-ascii?Q?Ej3edLzOcj2E51LcfgidTwqDRNfK9yf4xpxWDZTr5xXnfqTDnGMG4Wfkwdro?=
 =?us-ascii?Q?aboHXBD/W/hjQg7VjCXh7l1gUo9wWJEyXx3sdRW0vJ/L4Tq8nkTymDCgPWNE?=
 =?us-ascii?Q?85yz7oUPn13Ac09dt3bITK3BtGIxKSWhSEE4LZF7wT04rU09xdAhyC2On4Q2?=
 =?us-ascii?Q?NuD7OqQpkmzNQHT9O4TCShKDS/5GqWLFcKWO6l+DNM37APriqS6AvZcPFdNp?=
 =?us-ascii?Q?uFBUUSLURKX3NV7gPA5byQHXjqarPFyt2j7US2/mTHpIWwVZv1LfR+tKI0pm?=
 =?us-ascii?Q?7kaOMWs8075B2LR4tbGZQfa30BCYbtT7cvEpDy6ZqkLci9oM081Ux1W4uwQ3?=
 =?us-ascii?Q?/6eN9DMTBMZF1Qn5cVPoLI1rJwY/JBPAsvYO1D2G+Rs2W0SLq+U0MyGibBSF?=
 =?us-ascii?Q?/ll0EW56t3UCSdo10DJAIW8o7jMmrPZcBLV41f7jlXQ2ExoDW/gaS2I8GMjo?=
 =?us-ascii?Q?oNpicLfHGmQZrgqi8zFOTlfkCl40QoZIkjfS72MhSMbb8vU/2ikr3RgyOLxg?=
 =?us-ascii?Q?8AvlojOfJnQYnHaF00KIUQc6WlYi778PdXtl96ASBPiXfzJif14ztYc6cDZ3?=
 =?us-ascii?Q?mGR8ljoM3szNX0zOS1F1RZExBWdDUYTrkQmaaqthBQw1yWMn1PQwKRT9VLCG?=
 =?us-ascii?Q?DZm0ElXnZdSDiYEQ7giizTRBYkihTsIJUumRcEJ9lBktTUsMl0cF8Mjf7XQs?=
 =?us-ascii?Q?AfYnyy0axrG9QLZCCwHV8V+AiRuypV7uxVDNmDk84ysqBs/BHr5ji8+lvW5f?=
 =?us-ascii?Q?klcTnnZx5bvspj+W4jJFTHGvawoD8cUAE+I4EsJbKPtWtMthjFWhouzCFNbY?=
 =?us-ascii?Q?Uo6PmkSB/GuLixIHK6FQXvh5+xp4nFaWhN/55CvclMysicO80GnB/zOMFJh/?=
 =?us-ascii?Q?94LrCzPJ4fJHU5CcRUs4bu3f+K4hcaY6U3KGYIF7pktCZvQm36ys9F9kKX3l?=
 =?us-ascii?Q?xGZ5Ear1Mg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	fUnylam417tH/lfziLW1QvhlwKKwMqY0xQwUgneMnt0tvpwypeLOoYvkLClX2AJ551NXzwVrA/xEV9l7GxDu2gvrPt+ppkxzyXgu0Pl0cUsbobc+kBAD4d/vezvVVNIN0J27dzt66OQ8R7H58EzW4bSHeM9xLw2c2DREo/Z2xtq80EwYrn/wpeILxqnCl9+DewF+eR4jKSU3Cl8AQ01s5p7XSKOIACd1HQ3yQmlqSsy1v/lgJ1BN3jpkE0SzHf99b5lbLJUMpKT3qqARTo5Ju2q9MOO5vBpemtZxoRoYZPanpAoeWBZYj4a9Wk1VXNysBDPpYPc36LZA8nsQYAmXfQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	IjS4Ei2GhQFwTdVXU072HkdZdQbUAu6svsESBol/yALaW1Uw+KWbYthnum+K+7lkQvc/t1eZwcxPVBTu7u+IKg/hmLmqG7gh5jy3neB1q5osbFW0524hB2MGvAbIDE3C/5NxEGihX1QTeGNSUrTzmDWCxEZgC71NQsUqDQXT7MTAl4n+xmuuZMRqWovE98A0GS0JZZn9/lOdRGH56X2vLe/0zAEk5/BMenspUX1ArROc/ijPqR71GHTvXnzU9LO6sxkVMaBFSZtf8CcU2x5spGr83J3rvJyDxeazBsRg9fR/X6/psn8K8tA5JfJetCE3JzBq9qI3JChXwFvUNGty8OO07k8TU7Ne3/iLx1y9GepApxDPJpqUQuZZzEn9Hls1eGrKvAJd7K+8Y0GT2/HVvVpXns+SXPqEJA6zORT7z2HeoLg12/TEgbKezpUE6fWF6tawSSIsjazrCNnHqiOlo3593GDyBbla/1WnnUhJQdX+6+o51Vmzkf9tp1O3aBXQhOfjgZUNRVBoE6RyzhUwAkig1sjQSHP4GOTfnWGNh7Kkpszc1D5eBwO1QoNrHrZaAWIkGHo88OHz7bhccI8UqGf3MjRHqU5LKcHwUomnnOZ9taG+472lGSUX5OpJQWSC
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a119646-23c4-4671-0651-08df2ac4d77a
X-MS-Exchange-CrossTenant-AuthSource: AS4P192MB1862.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 14:01:42.8663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8YgeIJHZTnS296JBCx2tvp/S+tF8s041tIaDqWBe/jt8bnTfiwaxVtXYa+CauagacKVuOAecam2GK7M7lhYNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2P192MB3242
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate79-hz1 with 4j58rV11PTz2hKGb
X-cloud-security-connect: mail-swedencentralazon11023143.outbound.protection.outlook.com[52.101.83.143], TLS=1, IP=52.101.83.143
X-cloud-security-Digest: 89b728370e502b98cb6a61e03c6fdb67
X-cloud-security: scantime:3.561
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 14:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247885

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

python3-asyncio and python3-json are needed as runtime dependencies of
python3-pyelftools else the readelf.py script run into the following errors :

```
Traceback (most recent call last):
  File "/bin/readelf.py", line 30, in <module>
    from elftools.common.utils import bytes2str, iterbytes
  File "/usr/lib/python3.14/site-packages/elftools/common/utils.py", line 11, in <module>
    from ..construct import ConstructError, ULInt8
  File "/usr/lib/python3.14/site-packages/elftools/construct/__init__.py", line 36, in <module>
    from .debug import Probe, Debugger
  File "/usr/lib/python3.14/site-packages/elftools/construct/debug.py", line 7, in <module>
    import pdb
  File "/usr/lib/python3.14/pdb.py", line 87, in <module>
    import asyncio
ModuleNotFoundError: No module named 'asyncio'
```

```
Traceback (most recent call last):
  File "/bin/readelf.py", line 30, in <module>
    from elftools.common.utils import bytes2str, iterbytes
  File "/usr/lib/python3.14/site-packages/elftools/common/utils.py", line 11, in <module>
    from ..construct import ConstructError, ULInt8
  File "/usr/lib/python3.14/site-packages/elftools/construct/__init__.py", line 36, in <module>
    from .debug import Probe, Debugger
  File "/usr/lib/python3.14/site-packages/elftools/construct/debug.py", line 7, in <module>
    import pdb
  File "/usr/lib/python3.14/pdb.py", line 77, in <module>
    import json
ModuleNotFoundError: No module named 'json'
```

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Wahid ESSID <wahid.essid@se.com>
---
 meta/recipes-devtools/python/python3-pyelftools_0.33.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.33.bb b/meta/recipes-devtools/python/python3-pyelftools_0.33.bb
index 8a696407db..724d5afd4b 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.33.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.33.bb
@@ -10,4 +10,10 @@ inherit pypi python_setuptools_build_meta
 
 BBCLASSEXTEND = "native"
 
-RDEPENDS:${PN} += "python3-debugger python3-pprint python3-logging"
+RDEPENDS:${PN} += " \
+    python3-debugger \
+    python3-pprint \
+    python3-logging \
+    python3-asyncio \
+    python3-json \
+"
-- 
2.43.0


