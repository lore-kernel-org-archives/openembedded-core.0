Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F233DC5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 13:15:42 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.11])
 by mx.groups.io with SMTP id smtpd.web10.16205.1749042936400248817
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 06:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=hQd7tKsZ;
 spf=pass (domain: prevas.dk, ip: 52.101.84.11, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZKBJAl+j156iG5LnKb2GcF4arMta6/rMv5llb9f3IlC4z9d4M8y/LnP50q4Ijoc8mbjc5nuIEqfTV3QldZVChL+5160vhTDtd8Xfx8W94AKS3on+Fc8qNzJexH3uSiNGVQpLEkc0Ad5FphRAnfRYBW69RMc5oMHIfzVggkN0fnGLYd1Sx8u3EIPuQJ1IRywqUig+O20tkDjCqSrp6M/pwJQcvd0a6pk6y/dzidrGy2jI1gUSpIphVWL+F2vkjjuJ9hBeUrF6YXp8c2Z4FH5ujfg1ZYuV5lXP/RAd9xKonf7gQov4eh9oodC32T5/pH0wCJp+OIAPyvicNJhCKt9bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Um5TB7S/DeG/Aptl3TgA3P0yqsA7ogmBOlxFgtUoSHs=;
 b=MMwm44C6si8c3aV4Yr8s8Dh3Kq00FchCmXOE+jHJZT6CdEUZ0tNJCqcVxXJcbqWGEZqZcVVoJYrMUvIhfgty67n8of3BZX7rJk+QFJ3l7DdjoIrM696WEYtJz5hf5NeDBAEUJhpz1fI2fm2DXsSWYZ3TeuBl8CheB4fwjSEc9c6KGx5DIkCDwbCzkOQGGhztVye2h3aDCa/K9tR88TSFBkKWmSS/jtg4qRcAe3YgrTR5fw9D/3e50umPGcA9xsnPzQ/+F4jBMPbCa1Zn+Db2Xjt38S7MkNhPnjlogoJvg/hOmjEPa8WEvVCRBeIzo9nGw2WR6ejxPrzzXyy2wDYQ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Um5TB7S/DeG/Aptl3TgA3P0yqsA7ogmBOlxFgtUoSHs=;
 b=hQd7tKsZ4eMlCBtEkeZfr2Jqn0gpp2LjAhuwVc8/BmSGJfi06WW2v9o6sPz8//AA9hMF5kZUA2HpYZKbbVCQwPZrz7QmETD1ag+ijJfSc5FfaMFY+6qVNnvhQ33wWSwmxoIsGwi5iFxyscpYOTwtc5rn7t6iChQp1/E/ujlfGBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by VI1PR10MB8157.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1d8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Wed, 4 Jun
 2025 13:15:29 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c2c9:6363:c7c2:fad5%6]) with mapi id 15.20.8769.025; Wed, 4 Jun 2025
 13:15:29 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
Cc: emkan@prevas.dk
Subject: BB_DEFAULT_UMASK leaks into generated rootfs
Date: Wed, 04 Jun 2025 15:15:26 +0200
Message-ID: <87wm9r1wcx.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0106.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::25) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|VI1PR10MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: 4333bd4d-a460-4c3c-f183-08dda369e03a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FUoyE+hIvoZGYK12pZPONsl2BJFNvBsxAg2mfSd449RddqneXVYT/CJ94X8f?=
 =?us-ascii?Q?LWcDvKul5ZzmWGAsW+/T1nEnfrnNKBNmORNXNFFzukD7liP+Oj4ggHiBX5zl?=
 =?us-ascii?Q?BLRxS+hfsDWodJvDrjzkc1SBgP8HuqNxdv1U5NMusyx1AMhbEeUTU32Mr5Sb?=
 =?us-ascii?Q?UWgEacXkhV/7EVT3BDnuGR58McHVxxqk3VHwnL7fBsYVjFJrRhml/Pfxs38Q?=
 =?us-ascii?Q?f5eiVvyaowvm1lGnDQjpYOQAa1Us11jA08jx+0Rjcr949WKofYMBYj58z8A+?=
 =?us-ascii?Q?3GET1XTvWIzQ9YhzCqAuLBDJk/SRihpYYMM0kZ7Ck12zWao0yvqvvlVHpKHV?=
 =?us-ascii?Q?uNRoZvBP/gYdmokPxXzSzD0JVPtbp9QX6OEA9g09uXoyhdJAi6AGHfUVpjJ+?=
 =?us-ascii?Q?mVb6Yjl9plcmOxTq3PuR3ZAYySDGBAkkLg+xS8UmlyFnypjiICf6kWx7GBD7?=
 =?us-ascii?Q?3nIp4x422qRzOlIj0wYd79rEaAd5UsRRFsQURrxYn8+b2yo2KMZH+O6cG265?=
 =?us-ascii?Q?0ZPs1usFTFAZKcQmUHhi5uemnpRYLZaLUTnCYoCBiz9Mo/otau64mZCCJo3T?=
 =?us-ascii?Q?NA5/XZh5Ao6LHGyHOBg74BwBZsGXtwNOfYBMZbqE8Xaj2AQE7xAGDw0i/nLJ?=
 =?us-ascii?Q?F+gylFS9I1EjFtXGgqC9o0Lsk3lcnYO8SyZHbK7NxOh6BYVoLc5cONUZkhaY?=
 =?us-ascii?Q?SqnULyX0dsrwaR20LXwq2kS2HWk8R3xe6KFd497xmGiSd/O4MOdx/pTYpMfU?=
 =?us-ascii?Q?s1YSa6pJN+vQefIPqifyYadojzPGPh1rMAOwq+du9pUQiYfLvyEWWT5bIAq3?=
 =?us-ascii?Q?YNHBGx2OMKVLcUKLxMIKI6qINKjfCLTYiV+SvA0YRrmHQ0jKpBZFCFCaMcRf?=
 =?us-ascii?Q?ksprRixPd7dRBHYiPSoEu4Ycec/As55cLKZhwNEok5oG2D1pKMtJDgz+SaQT?=
 =?us-ascii?Q?Htz0IcM7JqOHcV7UL4USH4Uaz9OuXi1fwblS6VA7dqAL5oT6N+l+gPzIlE4p?=
 =?us-ascii?Q?cTJKTzDAmlDLySeqm+1r55kqudbsvHcTztDkEFrjJc1AHz0XDxDXRaG+OS6g?=
 =?us-ascii?Q?B61/nE1dOOXWz7GsAyhk2+2bW+/czVlRuEY9V2UUqzrr5kYjZeiJouU3Z4wH?=
 =?us-ascii?Q?gEzlTbDRNnz2REtnnmZ8669H4EzYn/PfGRuGzewOS2hGXhaFKXEzb6PMQV6X?=
 =?us-ascii?Q?cMBu70okXMhkKdH68X4PcTR8uu7LRAVuVUE68FF8x6tn+UBjhBKqp8b6Kl7P?=
 =?us-ascii?Q?G6ElvF4NL0LUWiCFGCbE3qCk4k37c3ShGWb8uCQD6LsOzW6wwb0yqiopXyY+?=
 =?us-ascii?Q?VJYw30ZbXky7gGnqwDRmuZ8p/EWj84ZuXwCEK2zcN3wsgXa4+pC0sChPRhnk?=
 =?us-ascii?Q?I1HYuoXewAB90dZ8kWycWwqK9ZhlA8D+JO56ADEsSoFFIUBSdOfmiLoKMF/X?=
 =?us-ascii?Q?PN9kFzsx6VuoA9kvj9nvX0LAq2MbXy8moOR5ttaSruMqNYBgroavLQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RrS7jsCjFaYVzy1xvjP6ZNWJY1WVoROA5cxJzg1IGCAmu5tQRP2Lt9EORyNi?=
 =?us-ascii?Q?/Jl6mrHHGoeBj5tJuhJsGWI9Umt+2Ht/fvuJH86N1zJGRdtkFu+OULw+vIO5?=
 =?us-ascii?Q?IsiFzWGHEFM5ezYYaII39iBftip8fcOnD4yVtul68FhqDSdnNhPeEaWjL/mH?=
 =?us-ascii?Q?cwVi5qD5Lys4gZawnbatfG2QqoI3C3//ZQlzFS04eyr8+q6uInodxpn8ynom?=
 =?us-ascii?Q?GxFVmhYyUSc5jpu6k7REFMgOigY0JcHMkNBpVI6t8cPGDZWslMTY1uPsUD0F?=
 =?us-ascii?Q?RTuRs1HF1b4cxiTW4cDBUrS0kanrfzOzwrfV74q7MwqIC5Td7iByxgnwwJ0U?=
 =?us-ascii?Q?cy7C6etBzSWRO1OcRrci6dN8YiZ4o4a8mzEt3fI2WyPJjjw1BVyP4g9CbeQq?=
 =?us-ascii?Q?mbMB6jomdrggBPcfELEVWcBu8hxMn9nFj/k3AlW1zTRZRd93zQhQT+50IDBu?=
 =?us-ascii?Q?GRrP/g9i011ZcWmX8Z6kBYzNiEif3vTavv/AFyZJDVd6gFo0r7CL4EZyQVtC?=
 =?us-ascii?Q?Mq/SMs2YHrXf2sWc5vNxSpWUeH1ZLmzL7Tf5WLRc+qm1LI5+hQzMZz3AU/kG?=
 =?us-ascii?Q?ZKZGkuczxCfC3nXNJqZa0/qlOAjtP8ElSoZToF8u2g6OvURXjXCwect6A8Ze?=
 =?us-ascii?Q?uRh03JdxAv28K3RKAjAFV9JE4Qam0fIC+ligPlZgs3VQWSjs8FuD6vIG6KKJ?=
 =?us-ascii?Q?Bk2YYwVnNqITNRbEVAsq7OI+uuthWq6Hza3kVV8AJ2sCoZ5oc8ZajLVQkJys?=
 =?us-ascii?Q?cLpn9ZJzGuha8odwv5wtCnPPn2qlDnlJmyjEV1rZ4miLmD6UPYqpiHGc/9vB?=
 =?us-ascii?Q?P73Kk2hIYp+anrjuzd8fIIMwF6avqSvUeR/0nPYk32kMPkmAY+bikoCvTzZA?=
 =?us-ascii?Q?NPjc1oswkhV0eMVZQmp5lwft8sg9p6iNzs5nkxhuz5Lpt/v7hYpD8bsskd5n?=
 =?us-ascii?Q?zIc+xbYRvXeM8ms3Ra5GJd+uo9AHxk0bW1sTI1BJLdBsLXFMWN4NJx+NAcPU?=
 =?us-ascii?Q?ZkDbjbRNd9C1zZWJ8QUVWxOvVQ3RQ32Vw4bKEwDpzRY2Uxj9DjpMyMtGS3td?=
 =?us-ascii?Q?YT3CVghukj0iYVlr2MowmodheBWkST0WV6xxPwK2zl8EQ15VvbG2fGK17geo?=
 =?us-ascii?Q?kVL+wcb/bhjLGW3OBv4R6OmCS3Svc4LGa3/yFId3/EjijEH6TCGsAcHJJ6gR?=
 =?us-ascii?Q?pq/y9q05Euc5OoRPLxEFxdzk/b2aBaeABsOOei811hi3+MJEC9YbeopxG7vR?=
 =?us-ascii?Q?cM+lgammhJaVchxJea47x75YaEdAz0nEecRLTDeToIJw1DDHW58CLQvzQs6m?=
 =?us-ascii?Q?icOJ5P3eKm44nEtECp10QnudA2EkSr7Ofhkc8vkdN81n51+Dxw+SRkuLdcBh?=
 =?us-ascii?Q?31P3mrDSqXINyuffwdqeIjFV252MDRxHoz1H8FWggOW8wutxzROxNAta9ZTY?=
 =?us-ascii?Q?j9C8grY/4p9Fp0tq2K3o3jNqeWX4UeO2hRUHdJhs6z+VnHCkx4sH0bNdwvGU?=
 =?us-ascii?Q?KfkS2l9j49ubDSxDmy+ZilZCs9np6u06BNzWpejN9pbzaUPl861qBX392Bo4?=
 =?us-ascii?Q?+jhM7T+e0IjLC3dmRacSa6MfAhf0bEiGAGeNY8tG6W3dWhUk2l4TKN/IL7fP?=
 =?us-ascii?Q?zA=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 4333bd4d-a460-4c3c-f183-08dda369e03a
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 13:15:29.2454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YW5Uy8DedsbVJLzYi0Rcc2a9EzH/pzBSGBO3Z1f5LtCh66t0QF5JtSxiwLpDT7mmqfQFY7ywb0kan928PchSqLEFKbJ6nwZPx9vz+G07Qb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8157
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 13:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217945

Hello

After setting BB_DEFAULT_UMASK = "002", we started getting

  sshd-session[1965]: error: Unsafe AuthorizedKeysCommand "/usr/bin/userdbctl": bad ownership or modes for directory /

on target. And true enough, the permissions of / are

# ls -ld /
drwxrwxr-x 15 root root 221 Apr  5  2011 /

A somewhat odd oberservation is that while the umask setting does make
various aux directories under ${WORKDIR} have the expected 0775
permissions, the directory 'rootfs' itself does not have write
permission for group:

  $ ls -ld deploy-source-date-epoch/ recipe-sysroot-native/ rootfs/ temp/
  drwxrwxr-x  2 ravi ravi  4096 Jun  4 14:42 deploy-source-date-epoch/
  drwxrwxr-x 12 ravi ravi  4096 Jun  4 14:42 recipe-sysroot-native/
  drwxr-xr-x 15 ravi ravi  4096 Mar  9  2018 rootfs/
  drwxrwxr-x  4 ravi ravi 12288 Jun  4 14:43 temp/

However, both the generated tar-ball and squashfs images have recorded
that 0775 mode for the root entry:

  $ tar tvf deploy-pil-rootfs-image-complete/pil-rootfs-rpi4.tar |head -n1
  drwxrwxr-x 0/0               0 2018-03-09 13:34 ./
  $ unsquashfs -lls deploy-pil-rootfs-image-complete/pil-rootfs-rpi4.squashfs | head -n1
  drwxrwxr-x root/root               221 2018-03-09 13:34 squashfs-root

so I assume that must come from the pseudo database.

And the problem seems to be much bigger than just / having wrong
permissions. We also have /etc/passwd being

  # ls -l /etc/passwd
  -rw-rw-r-- 1 root root 1060 Apr  5  2011 /etc/passwd

Other files/directories being affected include /usr/lib/clock-epoch,
/usr/share/common-licenses/ (but not any of the files in there), and all
the xml files, but not directories, under /usr/share/mime/.

Rasmus




