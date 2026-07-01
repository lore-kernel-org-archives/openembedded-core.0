Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E461BC43327
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 10:48:38 +0000 (UTC)
Received: from mx-relay48-hz1-if1.hornetsecurity.com (mx-relay48-hz1-if1.hornetsecurity.com [94.100.128.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41944.1782902914602869295
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 03:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=do+S/c8k;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.58, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate48-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=40.107.159.129, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=osppr02cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=URJUHNX7XmdfFhf8t2rQOO06oIcEXQku/CGc+vLQ7K8=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1782902912;
 b=iGPIAMUqM6JXDlI/GnJ7e6yBm31J0eCXfcmMBGF9yD3QBN3qlr/5Y3SfZVQ4jfXyheBs1CdL
 f+X2MgboBeSRamcRE5DQ+AHvQUj2v7FYz1QROnO9M4qOoN1IbOkb+1IhhpApS2BYg2L4nExwnfT
 QFpY6DUQPexKHC5RFG/RuImbkb90qA2ObtLb32n4kNTYzrpxypOPOReuRa9xddqyk92Ivah82/T
 ZLFEiQawswptsH1iYbsP5AOcXww0Ouqn6YnzRwtGa0IOFOtmAX0B8Ila0mQiIq9Q4jtMeRtBaGj
 YcdRVYtfO+dtpSs/kYEnYmnYUWq8DUJ2am/BT55od+2TQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1782902912;
 b=UiFL882sg03WGagTxppvkxcT6nBNOV1xfHy3Ugd7+J2qspxoaXlvPWHAJwADBjbQ0csOboh8
 Qdi5of5pKCSR+snIWqWYYcuxTljSNgEkOBE/Yd3uIya413+8beQq+ByESXjF3sEC+WtLrE1uLf8
 w+7M+ShITXPb4nHx2G3sdHXYCCBF9KrEgjxfq0vQelL37MJAszPl50PZwKYTS2Mdr6GciQAjn8A
 UNIVQ0G3yyf2cSQUbjP5R1jvu+864Ob5XEyZ6b2JaoM8oueuzGkcGqwlxnTgD+kfPtZPSQev1hG
 xpL4foVgqBsO2ckJKaNj1849g0wt9TPuUC7scIKXgUj2g==
Received: from mail-norwayeastazon11023129.outbound.protection.outlook.com ([40.107.159.129]) by mx-gate48-hz1;
 Wed, 01 Jul 2026 12:48:32 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/opg7/shJllwXf9QGBdXULbkEHDaFO2GiYfYoAdWlvWDjs7C6iAJ1xisJ6u68vz2xo7V8ygoXH3dasYBevRWXcg1573W7N1L4lXoKGqhvOFkMHuWf79/2Yrmq5cwaqfYXKcyPLHQM8yayVuugcEUjXN7+FXwue9UiYJHBdH0W0226FLr6KNbi4t/4DD4c7dkk6VT724jJNRZ7D8GB+gJdA+tt8KA4kGPEu+goVlcUuWnjr04Tig40TRpDL4GLjINDBpsfdiYRRYt9tuHrL9sJ5BbuFv5z5zf46VO4Isy1efe5glmWL3/GW+Xgiz/2HYSkdUU1HbGsrJvE8wH+eRrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URJUHNX7XmdfFhf8t2rQOO06oIcEXQku/CGc+vLQ7K8=;
 b=E0N5kZfxgXKpPL1qsxilWdIbH1rggU2M1/rpUtmPhPFrj/3oc8MYhSs3koT2YbmEiCI6Q6OdeJUg4uhPhY1efXjqyHGSEXHcZXmXOVrpOss9//9ZjJ69hmH7qmTta9kZ3sQ9PISzsZrTtOpuothzXP6GmWy1nrWKBamHosAuVjSm15wglVFDdA9D+yh1bfIH9OYiaiBksA0Au/hA+lJlF1C/EbRR/0wcz5oPsFAe20JB0sSbuUhFh3yYZHO/v6G8qxYs4FfSKK3s3bAQMh0NzGixNDavPFrGbBkTJVDLdwpYzImzsBw+GqGiV2hKRCiFtlMtFHbibuJOoFK9Vb+U6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URJUHNX7XmdfFhf8t2rQOO06oIcEXQku/CGc+vLQ7K8=;
 b=do+S/c8ksR1dCENuDnZL2BAF2pVPRrRvKE37YS8o/0iCq6mikpxz+0p/KBZj5g3/S09lPNSZmUcl1+ifvfFy6TAhJKhZHIL169V6SfsLY7ClqRrSDpr3t+iu4vrjqJY8RpYKD0Co56xMscf28oaKqOlAyNtjxfCogv2IjRgpyCELHWSTZBaXP/JQDl9I7+x1uZvfu9dKce5V8JZrzL5mld2q3Bx01/cyJtYW3ZykQCu/2Ey9smNhPLv6Uo1jghQ9nS7xwqmf1J4Md8wIIqC6R8WgYHT8jgmfdJ0WgZUAHR4W2/bYkQcqxHK7m7QdareX+WKbt8TXqIgBeyv/DMrNKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:1ad::24)
 by DU2PPF9A909934E.EURP192.PROD.OUTLOOK.COM (2603:10a6:18:3::99c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 10:48:20 +0000
Received: from PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6]) by PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 ([fe80::a160:226a:5870:e1d6%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 10:48:20 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [wrynose][PATCH 3/4] dhcpcd: patch CVE-2026-56116
Date: Wed,  1 Jul 2026 12:48:07 +0200
Message-ID: <20260701104808.3577244-3-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701104808.3577244-1-tgaige.opensource@witekio.com>
References: <20260701104808.3577244-1-tgaige.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::8) To PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:1ad::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXP192MB1405:EE_|DU2PPF9A909934E:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ac6cb00-e23c-4aea-55f9-08ded75e43fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|23010399003|52116014|376014|366016|1800799024|13003099007|18002099003|22082099003|3023799007|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	HJSkrW0/o2fwWWlL67Z76REp4yp7IqB/ubXt9hABATT/gytekYiVZifsXVLhdVKYeoMa6fZ5/UuFhMC4yXrmqXF8j2PBLSmf5FjazyTllrJgEMitFXZ/+OBONJavBpBNUSqW8Qs1jK+41WDyvO6OzPNSvNEX79lcLCcvgN2PSE21GOB5yMM65ikMeecfpix85+8G4g1AQVSACmyaBbNxAZANA9KCIiSHlQ209zCNp09/1xGzK5ks32JSUZXXGIqSlp3vRrrc6QNH5r+rsecWuxUPlxO6EZdI0rwgz/yqd9RoVehbWHdM3gm4mlUGsa+NPhMN96NHiwUM9EI2pLoZ4K9UPikiBO9ew4FWPm6FjkhOLdmkyizdpTAMnu5DvwhHd7LB93wLavZItnKH31DSaB0l+TjfNu9lHVN99rRUGiUEAPZWpMhPNjXFfJly8o2GXiwuiW4sqp3VNomPZvIOc4os4k1H+0BEH8n2EUT7uS/MGnUA/fk6I4aIsDIetR7nq2QU8Z6QonTfv6utlkh6PxSJCiQq9uS6dVikNasU2nzBD9qffLSxgKs/wTRe1cqxZQaZMRiLn2HijRFe0mv/KbBDIgg61S/Ec6SpMKz26PaMXQgi1EYrR61KDHlvxsnf2Olbo9cvJ4Ns+Ym1hH7AnNICqcORyomSvz89GPJGUEo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP192MB1405.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(52116014)(376014)(366016)(1800799024)(13003099007)(18002099003)(22082099003)(3023799007)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xShS8muhHga29YJJVwAwKP371RBZEEqKhejlSJEJZ9TqE08b0JPRLtAsqACS?=
 =?us-ascii?Q?addF5+TwtyiKcDyg0SKlmE0xY07pD9FVyx73MCePbcFStXHvJmTgBxUzBaX8?=
 =?us-ascii?Q?0m1Aau7s2r2LRoX2S3WKxsr8CDTEIG+uUEdrmhHl5eqpxunVkVAE9H+dVpOo?=
 =?us-ascii?Q?eyGLEwSvpRoY4pBEv8GNC4Mei7ZpV4F5uwkGY+TLH+vWkSV90g6PYlKij3o4?=
 =?us-ascii?Q?1kRmsT+tPRdijyvy8ygeMB5x9hbrSDFt4qbyLVmZGJhzbt8CEhYFPXjdIzTa?=
 =?us-ascii?Q?PO2aLnABUcEVCkKo9ZP2KgAWzvfZS/cXkvntr6q9zU1xe9yHxIENes5+f3XR?=
 =?us-ascii?Q?qZj7x97hdikWC8dvpw+gT1HxiC5kpu9XbjONjxa7mex9l4yLp3tj5tIAUIZ4?=
 =?us-ascii?Q?fx/VWVxfl4Ei7yGrwCszPkj994a7OoyMgI7UfMg7Kw8KuJuF90pbhKIHTcU1?=
 =?us-ascii?Q?bijRmLEoiqAtTyA9AScn2P02AM2jQc/mRwb7CGQtLACbx211I+hyMqkCdIRf?=
 =?us-ascii?Q?Ynf8psaG2K2b7+NFUut2Omj6dwRAIl5/Jje+TLhHmjc/69tq6BEhyaSZR/fT?=
 =?us-ascii?Q?723oNnt5b73VYtIcvFjdfUo82NEXFOOCjd83OB+02SPOjQgoMPIpg740HP8g?=
 =?us-ascii?Q?28uk08KqGWC5PsGOr1lsli7VVZxkWMZaeFl6bWz2R61mNCpEAxnxgUqH14Lm?=
 =?us-ascii?Q?fXkYsjD9F6cLdqGP8puY/2tF3/exn/zrUfUtwbuai2WhoVDTnU6SAC19UYIX?=
 =?us-ascii?Q?PqgYd7LQzZEcAY/+P34s/++MZ0HkTr2SANHH12W4EBY6IoZBMvG/OEwSidOk?=
 =?us-ascii?Q?cHdMBR6ZiEYKxw3QtilmnIEKI1gs8kgLZahV/ByDvwIZiWkCl2rhbXd4Mq9N?=
 =?us-ascii?Q?T2a+455+X9e/MdaJH9Z94v6+oVSN3EvPWdEFFpSVjGzFqmcp5IVwacVApspd?=
 =?us-ascii?Q?PFkeZqot1swu0/7Mn0o8q5tT10ZzcLn9gXCKp/li+XLxQyV1mbrHBOn84CSt?=
 =?us-ascii?Q?OOSoskeL8fISA2+3aiJyszJhiEQ+7a2xMW0qS4fLz9k4eilSTTqBoxp7z/W5?=
 =?us-ascii?Q?ng9PMVrnJTYTsDtZ8m9dI6Ct5gTnEWhMqmOkG6++eDp2ZyapnPJwXxYTHfqE?=
 =?us-ascii?Q?IvwNkLTIqpOh3QlD0VZHGzC7Nt+alkLi8QA3Q84LYUoYHNNuqFZbh+Ieg1sf?=
 =?us-ascii?Q?RCOk/E39RF4F8IVwot3ubLluEjeAo0TWIUXXIu2bOvc57XlfUy5Va192cRai?=
 =?us-ascii?Q?cnNF4gTpyWOH1I/VusOX9eGgMKQxj4/L0PjE2dOlCsHr4eRYoeUwXApzDiDp?=
 =?us-ascii?Q?WCv9atSaZ7E/s0cqhF1fbDwRbqImyGEHRVItgmUMhpvedxLrkkLGpF1b2RWM?=
 =?us-ascii?Q?tdp/r7CS/khjadQZOOfzrIhYz8jNONGmW4sEAjI9t+i9booP7cuVyuBtrZw8?=
 =?us-ascii?Q?5BC2t6eTQQWYnKpukkJIs4SM4jdPc2+iEq7gyzRtfmyspnmOUpkgUniVuVbH?=
 =?us-ascii?Q?M1pM+A2RgGanrJi2qbxCIJEQgZvnLeIzXiufODJVwq1YhLKunf/DIzq4XtGS?=
 =?us-ascii?Q?GDX5p0LrEpWYCrmC7gzgzX0VxpvCxL38Si7OBI5bD2C9tYh1T2H+5XDPNg9I?=
 =?us-ascii?Q?aXKEzrJlFhNbYhZxsWqmSTBkyFJFw/Zgc5cdvY3W9gy8HhztRn1VV8G6/Qa2?=
 =?us-ascii?Q?bpKqmqRu0zVxHRZ4elJPde7RkgwYNo+FnsZOcQRSi304uluI9W7Qg4FKPFhf?=
 =?us-ascii?Q?GnXwS3283h4DdLgBHTzACS7NHMhXs4slE51h7qC+f5JHKnTVpAIAMhWnsMvq?=
X-MS-Exchange-AntiSpam-MessageData-1: bDw9EqMq/9OfvQ==
X-Exchange-RoutingPolicyChecked: 
	RSbOsVq/ziq3HMAlfWa6s9Fn58qh1Er8p64NsWr/3dFDn3WopxxZoLwVGWW8UfieY9JbfXBPDTzoKTa5u2xRlh9kL2K0G6CWy9jvWWTVj4OEGQ6XvAxLSg4z79mHqlABNp//5PYeOGvmCkYMG96TQfYFhpgiPM/dQrLeNVNEZ+9l3aNIpuF9bIfkVC+U5W68TjlUuOl5M16j0RMb67QYGEhqtwv06T4WT72WzFp7cN6GfK57rELXtnz9ixsjUqSSFat0AydTVft05zqO/KhZGgJclb0vlSPrklBbDH98issHB7jP9cX/et06Cbh/BtVMGPvJLGKx3T2F3O0csWtRXw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	eXZLvX/PJZdjiV7XCfCzEp9mkIGNthyBd1i8dfz68oaaP2CZo5ChlUWJRk68zOStDcLLvcVMx/21q/z8v7X7YmycrG7cloaXF+v1LXDzxYQMBeaggMaHAjYDApUXqGM3gfsVwsekYqn9C05kZTmPiuFutuqzd2VMiQ3qfnvdlSrFzVOgPz4m57iFpfWjHUvY1a8FDXK+KFqTaLBaHnQDOV15sMduMIuIhU2d2e9sKhD1BR3O7VJ3c+tYk02lPIWvH6IdQVoY7rA0QcoqeguSwUqVXXnIsk5Gfe2Tw528qOO4rVlyLAK09BS3eekubbjXVGQz4mJk93aHpXTjZEU3T0ezVcUgo0U9AYys2zS+FGJ4dpp5eO3kukNXLp07/WqBdssnYoviKtmq5jH0GeKButP0qO6Son8Z7BReexDCtclnIsbeZv3A7zZMNIXfgYknfYjXkqr7RgKxgoG/WsFqfvSZJ8Q/zcQxO5g6j7kRE6jKtzPUDYyYj1pRAKghW0Sf5v0iUgzZdV6ePpsIcmjqcNmeTrF9Kw39a53yOti0OmJ8XGLSysXUcczKt9YQOpN86g2kbryB+rIkPTMTetl+qdjZDRaN2zyUjJq18PYWyE2dJrD4gGXOeUjHeu0Y8jeY
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac6cb00-e23c-4aea-55f9-08ded75e43fc
X-MS-Exchange-CrossTenant-AuthSource: PAXP192MB1405.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 10:48:20.1554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xU5qAqJ73+lerkuKBs7TUi9HaulfN0G7Ib4DvYIPGDSC4BB70LG352LcsylrBNvkmvETjMMGsIclxAug1Tu4xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPF9A909934E
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate48-hz1 with 4gqxZP00Hkz1wqT5
X-cloud-security-connect: mail-norwayeastazon11023129.outbound.protection.outlook.com[40.107.159.129], TLS=1, IP=40.107.159.129
X-cloud-security-Digest: 7b410cccf1018d0ca3eeef69d3058755
X-cloud-security: scantime:1.286
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 10:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239969

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch [1] mentionned in [2]

[1] https://github.com/NetworkConfiguration/dhcpcd/commit/708b4a56bae080a5b18c2e0c4c6fbe103131a2b0

[2] https://security-tracker.debian.org/tracker/CVE-2026-56116

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 .../dhcpcd/dhcpcd_10.3.1.bb                   |  1 +
 .../dhcpcd/files/CVE-2026-56116.patch         | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
index 8195cea029..e214c03416 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            file://CVE-2026-56113.patch \
            file://CVE-2026-56114.patch \
+           file://CVE-2026-56116.patch \
            "
 
 SRCREV = "42ff6d2548209af3185473e6cb6f9d235c48bbf4"
diff --git a/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch
new file mode 100644
index 0000000000..a329f92e6f
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch
@@ -0,0 +1,31 @@
+From d37f45a39aed5fd5d0d2c87f62b22f5eed7495bd Mon Sep 17 00:00:00 2001
+From: Roy Marples <roy@marples.name>
+Date: Tue, 23 Jun 2026 00:34:58 +0100
+Subject: [PATCH] IPv6ND: Free routeinfo when it expires (#670)
+
+Reported-by: CuB3y0nd <root@cubeyond.net>
+
+(cherry picked from commit 708b4a56bae080a5b18c2e0c4c6fbe103131a2b0)
+
+CVE: CVE-2026-56116
+Upstream-Status: Backport [https://github.com/NetworkConfiguration/dhcpcd/commit/708b4a56bae080a5b18c2e0c4c6fbe103131a2b0]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/ipv6nd.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ipv6nd.c b/src/ipv6nd.c
+index ccf71241..557ff50e 100644
+--- a/src/ipv6nd.c
++++ b/src/ipv6nd.c
+@@ -1789,6 +1789,7 @@ ipv6nd_expirera(void *arg)
+ 				logwarnx("%s: expired route %s",
+ 				    rap->iface->name, rinfo->sprefix);
+ 				TAILQ_REMOVE(&rap->rinfos, rinfo, next);
++				free(rinfo);
+ 			}
+ 		}
+ 
+-- 
+2.43.0
+
-- 
2.43.0


