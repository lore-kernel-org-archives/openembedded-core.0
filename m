Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CAEE743FC
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 08:43:35 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.127])
 by mx.groups.io with SMTP id smtpd.web11.13125.1695977008162573245
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 01:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=Lnix0fnR;
 spf=pass (domain: prevas.dk, ip: 40.107.20.127, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpsPA75AhR/JkuRWCHz2xDZQL3qhBX7HcimAP2Twao147d53/L3+z8+AjZIq99TP7DxW6/KpA1qM8/563TId2oM63168BptXboKcWfWzFoSK+NRcQZj766DHUq5tz5wq1R5o0B+gvdpg/4eJU5Bo2u50xzlJ4BXAXI1Na8Z3sQ7NHuEPoprNCGPoLICVUx2Br1LtR0Imp4HTfzbcIG+PmZWZk5WN2WmiKslfAI2PGI7wHQz/fkmuGbVYRb8qHVzLopaQK1zZOFJEhyde/1U3wdgBx5svkr7yXQdMSjMUe5yvg4bMLbTPxPEVOC8vcv/SOhpX/LGpmC9wa/ZJGgdRhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhnUu8NFB0EzinnoVzOMCoinnBWNpekJQLhzsEguLHM=;
 b=SGRpkW+b548od0MG+j00G8Cjh3+eHSEQ85TZJDZ/7nW7F88QxGpCoTRx62rcewckmlsZLj2H+p4LlEQadqH4YYm/Iz2ZV/zwzv8En97ftq8PkCOZNH1bwTyHf8gLlLQOAyyrEwc3Dcgj6noIF/OFv8pICutqaM3KEzkGIk2Tl2a34k3ZczUid9J5E6RMM81aAxjfZnygmiMQEe3lDjyXcVR11cXf/EqvUNMXZqP2T7yegfh6/gaghPGCVwTXeAmVX/fO+O95h8VHBBN8BRLBmHp/7V/0IgHe2O/LA2hk8XbRj1q5VTbwvK1eXZj1RGR3JEJfZaQIs4RFFAX/RMbVkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhnUu8NFB0EzinnoVzOMCoinnBWNpekJQLhzsEguLHM=;
 b=Lnix0fnRCKySEUGeq2YDDeSTMWR7fNIXW35ZUdkakpe+2FjOJ/0is+co0IbwjXGPXrUg5gkFRY7e5Lm166C4K9z8F903ZyXmxKLI6U+jMvNYSktRqGpxzNEKQQKXinZ3LDvNQa0YGfPay0FbhF/kr1uzlyKdoDP980oubRBecm0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by DB5PR10MB7653.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:489::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 08:43:25 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::52ba:4d74:6ab:aa5]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::52ba:4d74:6ab:aa5%7]) with mapi id 15.20.6813.027; Fri, 29 Sep 2023
 08:43:25 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Jan Luebbe <jlu@pengutronix.de>,
	Siddharth Doshi <sdoshi@mvista.com>,
	Ross Burton <ross.burton@arm.com>,
	Chen Qi <Qi.Chen@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] openssh: update sshd_check_keys script to make use of 'sshd -G'
Date: Fri, 29 Sep 2023 10:43:15 +0200
Message-ID: <20230929084315.3390977-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.40.1.1.g1c60b9335d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0120.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::34) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|DB5PR10MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: bf4e5a65-abdf-4f9d-21e2-08dbc0c824da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	o7RX9PXVtqe+n0IyxEqC5mkECX0m2KJTTkpB1aOzfX+b08hmcRV79Jt1mfqtH0zh1DZpe44Nctgnsq50iHnaahwG0TpC/oygXNISxuuGTn9s5nA9P2rHVNvLLvek/6UZmS6SiWqKjiNnzm+kLRqezusH9HNYz+FYZNyEcQ0Aib35pr5i8oz+kSvSSxhJNHNFMcVZTjC1QrdAzO7cmqqjlo6wGGsZfPcyG4sPkat3RPLbNe2NA5leB7kTeqvLuinTYFZn1K8AURzBNvslh51lgCBfsFOrOpKZ8zvDH39VD0Au16JJPud/2VpfIFMPA9a9MElK3wK3a22aPwceNTu/vTGfFKR+BSiTueci4dm484a5oE/BUBZlvCXR841R0qjFEIH33Oj6KvBOyb7h2vZrE+YqlryutBgjzmSeqbmwMzD01EmcsTpVgNeQWwM5lnUfYaphUIfWx0PqiWAXPeaMSIzT46/G0cDFGW+q8JxP6efjIRRcUs+NvuEnnXA+tLNVSu0BZvWyXq2CMcDvG+k2RtED9qpfCr1B9qzIM3CQKrklNY0Th+KIzModOzPwLfempamB/9iqsR6IS2QP+urJ1L3VNJpGGumZebBYdr5aejSAsNsVxDMJYVAgOqi2Nk0O
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(136003)(376002)(396003)(346002)(366004)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(5660300002)(8936002)(8676002)(8976002)(4326008)(26005)(44832011)(2906002)(478600001)(316002)(41300700001)(6916009)(54906003)(66476007)(66556008)(66946007)(6486002)(52116002)(6666004)(6506007)(6512007)(107886003)(36756003)(1076003)(2616005)(83380400001)(38100700002)(38350700002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2Dt2+rUXyN3vSLFTEeEFlcGRfifpzlkZRIOvnL105nUmaAKeg7ts/qmcVFU4?=
 =?us-ascii?Q?G124l0y1B1SoNJjKPRK8cHl2ZyrSazMqggVjSdoCQzthkwTJqiSxPbBvGVEs?=
 =?us-ascii?Q?u0X8rMCyKbfhkjvBM8SbRyQR4PsWwLUyLB9e/nbXoUIvIMMfniVyyJqDvD60?=
 =?us-ascii?Q?uRQmkJd2DWln6xTKqhNy4IV3gbeDYOhCsQ0wIg/yQQMnd+fHgSw+zLzy5YTG?=
 =?us-ascii?Q?0w9weIV8kLtONpzKYHbwBqne+rEx28nizbsXWmxOwVAuk6FTfO5FA7SRpP5j?=
 =?us-ascii?Q?cgg+W5AR3ayCZw09tcxID81uAvzaBpe2gRG+OtF4mfEsOyMg9LqP/zEuCJYZ?=
 =?us-ascii?Q?v5CGIGu+lWA7/HE/es0aSQUADcGUzW5AckOxK5D46CToTQGOGfm5fHrf0Ate?=
 =?us-ascii?Q?MPV8crLyybFFRZ187N8KfqpxXWs0ZrWhhWNhWo1Tau7PEFsg8pocWS/78qm2?=
 =?us-ascii?Q?GJmIaBVnxpvEQQqgVeznohcZXhxbG4B54KMRwPBHH+yBbu4bq3/bttScR7eV?=
 =?us-ascii?Q?9Z8PqX5h7qGhcVq2Qv7wuJwDDUxv1OfiCV2llGwFnh/KxOrvdJsh2XHvjFH9?=
 =?us-ascii?Q?4Zrk2PwpGO6PZUFwgyVxos1JB3k3ZoEBn29PW+cBfVFvs3bMX210PA84Bk3u?=
 =?us-ascii?Q?NdbU69Ibb+3yncQREcHxGrauMN+C91n0pYWV3UMwC+HvHjqDYzMA1jaKkBKx?=
 =?us-ascii?Q?rmaqOmerXoGVOAoEC7dCOxkKlouPCdYOC7Py1YFiB7iy0u9v3I6cQbj78dV1?=
 =?us-ascii?Q?/6gMukKPXD9aIkiYjtUrZ5al8AIT3thB6YRHqzzxNyR5kbJ3V9jAVVe/Ojpn?=
 =?us-ascii?Q?pjUv+dFdQyMfPY+AiMZnSlUNlk+Q8dr9Jaa7WpIxbV+b9D61ARSGsMxzQdRR?=
 =?us-ascii?Q?ItigkdDIFAZPa/fvVQ+e0yWCshrt3hYhdfco4HRJ8kpqOkZHFFcF2Zb2soKT?=
 =?us-ascii?Q?cK21mfz2pWGGxomKWRFAl4gqOaR39ibRxe6jg2wuEJzs9K+Os6q9nBh+GOt1?=
 =?us-ascii?Q?sgh/b5SaGCj/UfzM1SkqY2+RVGDpTQN0a9yGGsvuX9EKYNpuREmp5/Q3IRiz?=
 =?us-ascii?Q?ExX3B2YB9+kBVuIcmJ2V9pbBSljgvN1Plo2+02+je8QUqKKoxyIcB6ONwzTU?=
 =?us-ascii?Q?v7fxnz6epYFiunttd3gNofORjtSsTFB1QyQOWT7ECupKHZ8IjvB0TbljX0b3?=
 =?us-ascii?Q?1Z+TLdYZbNxoLoikLunYQPlrys3rCxeaqH3lscUQjM+75doPPgR8LQnS5y+j?=
 =?us-ascii?Q?UE9ve3PsH0OWOwaL3EUS8ReZFrSOHs+a0Q/c4JWHrTvaQPQFCs5MMNiso6+q?=
 =?us-ascii?Q?AsLaHsH3Vv9ioCSrq9leDO+AC5i4ixiTk1+AKUc2+sua5/Xe3fqSQ8+hFNbj?=
 =?us-ascii?Q?jZXUBDZek0QE0q9HwMPUscxxLodAFZ5YVLCyX8ew20XDjBMAW9GeWb5CdvlY?=
 =?us-ascii?Q?eO6SLHigC3QPtICAoNKNsZ6bJbvlViAwxwd5aegFjjx+45OwiY/Rjmr4hWwB?=
 =?us-ascii?Q?bPGSQHkMLRvE2YaZ2qLMUWkgLoWb6UeiR/J9FdNgSoQicKmlVLtIFMopYokx?=
 =?us-ascii?Q?ielrNPEI1EXUwaEKtiEOq6kSo5FIwsheWSduupVPTYdb+bPZah5gi05Y/ruX?=
 =?us-ascii?Q?rQ=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: bf4e5a65-abdf-4f9d-21e2-08dbc0c824da
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 08:43:24.8688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EAAZkjQJRTSKoE/2qZ2XgVr+D97anrrr8aAWeZbTN0qxmoHA873uBcnKHTSak3uqxBK2y7tvxMW5lnQSqJnabDtdyCgG/t+F6CI+1TV0XvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB7653
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 08:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188396

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Parsing sshd's config file with 'sed' does not work in for example the
case where somebody has made use of the new ability to add a config
fragment in /etc/ssh/sshd_config.d/ with one or more HostKey
stanzas. Also, sshd_config keywords are case-insensitive, but the
current sed pattern only matches the CamelCase spelling of HostKey.

In openssh 9.3, sshd learnt a new command line flag '-G', which causes
sshd to parse the given configuration file and print the resulting
effective configuration on stdout. So use that instead.

Furthermore, since that "effective configuration" includes the default
set of host keys if the configuration file has no HostKey stanzas, we
also avoid the script needing to know what sshd's default is - that
could plausibly change with some future release.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/recipes-connectivity/openssh/openssh/sshd_check_keys | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys b/me=
ta/recipes-connectivity/openssh/openssh/sshd_check_keys
index ef117de897..606d1894b5 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
+++ b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
@@ -57,8 +57,7 @@ while true ; do
     esac
 done
=20
-HOST_KEYS=3D$(sed -n 's/^[ \t]*HostKey[ \t]\+\(.*\)/\1/p' "${sshd_config}"=
)
-[ -z "${HOST_KEYS}" ] && HOST_KEYS=3D"$SYSCONFDIR/ssh_host_rsa_key $SYSCON=
FDIR/ssh_host_ecdsa_key $SYSCONFDIR/ssh_host_ed25519_key"
+HOST_KEYS=3D$(sshd -G -f "${sshd_config}" | grep -i '^hostkey ' | cut -f2 =
-d' ')
=20
 for key in ${HOST_KEYS} ; do
     [ -f $key ] && continue
--=20
2.40.1.1.g1c60b9335d


