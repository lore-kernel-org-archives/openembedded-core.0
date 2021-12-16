Return-Path: <randy.li@synaptics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A18D7C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 10:39:10 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.96.70])
 by mx.groups.io with SMTP id smtpd.web12.9062.1639651149853719794
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 02:39:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@synaptics.onmicrosoft.com
 header.s=selector2-synaptics-onmicrosoft-com header.b=m7007FKA;
 spf=pass (domain: synaptics.com, ip: 40.107.96.70,
 mailfrom: randy.li@synaptics.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmStZZT82+0m40XCWqlDxJmMDyGuu9rVSNH7KLkUhKW/J2fdiTZP387jYDq3mCQ3gHBN7/dLTUJArKxu66IRP7gU7mpOg/V1Xi6Cy/gRGSu1MMV2tVzoaNmngdytCKN844XaGIK74QZpJh7ArP93gPNmKOV2Vppnd23WyiKF1MupTh8wmu8aeXzdgtNhKfZso2QhKpcbTVNueta+B/ugTtkUIpDRSb6rg5Yb9aFCUyE4l1gUjc/rHZtTZ9MgwOsXRIC2FYyeoLLBStQyQtWgKvXYsrNf22LB9m+hW8zzfzpZhLr4xgLoMetjx9nO1uU62E6zuHCsh5RhkvE3muq5aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFrbwG4oqO6yFR/EtP2ti5aKDDzwwF+lxJdIzXU7nkA=;
 b=IJhKQh9cZb78E47QlEJcy5RXEqh8AVzNtRyblbUtKJFhbMtkWAOUbk4JZcy6/bYbpnKrC0jR8YtLqSijX0qTBqmn2Agjs9b/+kN6IN5UKL9lxS06Cix2W1fk8zuEFMxAith0JQvadzwHuJSnRHgzqV3AC7wKJHYD1k/hGKy+ky8g0dsjVQkxN/IvQi+iDloyCFjvoxUmZRFQmuy3lThz97WSrIvyBqrmRdulM+mlFSPEcNgrE2E8lnl9UzPsswEnbGzuWQ2Yf9kmamUmRNky/n46okxHQFFvJ9r0JX2xVMXXTd2ONZnoye4jTmPocpnpWmfDkaElR96a/TF8KPbhiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFrbwG4oqO6yFR/EtP2ti5aKDDzwwF+lxJdIzXU7nkA=;
 b=m7007FKAE1IF7Ap9Chv1bjyDMxPEFArNyphDhvhwcoz22nIAQZL78AC6L4QFKzk/W7WC2qgZcc9w4eEQfW2xAjtOAnj0oabb5a47qkwrbBnTXERWcB//WOt44iiyf6ctmxSBVpRb1ItHWDWRI19UagKj+vXNx7SoZ85EgVLWqLU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DM6PR03MB4745.namprd03.prod.outlook.com (2603:10b6:5:182::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 10:39:06 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::6cc3:f8bc:aff3:f665]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::6cc3:f8bc:aff3:f665%3]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 10:39:06 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: openembedded-core@lists.openembedded.org
CC: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
Subject: [PATCH 0/3] support Android target in all build system
Date: Thu, 16 Dec 2021 18:38:43 +0800
Message-ID: <20211216103846.718910-1-randy.li@synaptics.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0042.prod.exchangelabs.com (2603:10b6:a03:94::19)
 To DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c76823c-70d8-405b-ee7e-08d9c0804843
X-MS-TrafficTypeDiagnostic: DM6PR03MB4745:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR03MB47455D645EC5EBDA854F7ED686779@DM6PR03MB4745.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ahouLHQovec4oTO02/SzXKRsBZJxLxXxBJJsZYlm88NFzbLLQFJPSDc5RfjDq567vVsgWHrN66qYVCBx6+7jpCe3plxp/tfiBZK7XMZskdeFDTU3KYZxssJ/H4TpV4vjindrKkTdujHVBlj6O/mmVR/QvGQXlo6lEBgXI4G54LpDD8H1pOSxTdWKpjNDyiRdpHB563aZPqk83BZHif8gKtccSOGf0g90xx75FRB9xiD6KTufMouiJuE5QEjOAXzjamC353+HX77R2WLh4JAww8JGBM5PLRkKwh/YE3G1o/caeOBy2YtfIyhG5PW/Y+njd8jsjQdJqwiNgw6yovbcylOzUOm0b2M0KFyn+Ft/k8UoVu3G8sThQTPJdePAwMIXODo+VNDA3ZXdsEL8JM4A4s1P4AMNTfql9FO9YTBLIpY1/PWTizxotX/OBKliQYgDFcLO63i5+qO/sJQhNMgbiqSTkQMUR1GKsK9WrdSU5qQabAtKYCNOz5z4auXak9jK1iUK6ZwS+AG7KaJL8wqAI2raS7KARiIYrIo0DYYK2eRQ1GHHh4V2FGHB8qUNxREnKOm4AT5muon6QLwfFFtteSRjGEdrokOdUQ4GH+Yeltbp0n2ISYL2qToChPhmSDdly0Gm15ruQBLhxWAme36bbZl50W7CHjRIfJ7f3nJyuzpuSV5M+fcw9/2IurvER3nUBp6IAnPyX0dUsS9Pf4Kx4A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(52116002)(186003)(2616005)(6916009)(36756003)(6512007)(8676002)(2906002)(66556008)(5660300002)(4744005)(66946007)(508600001)(6666004)(107886003)(8936002)(38100700002)(4326008)(26005)(6486002)(66476007)(38350700002)(86362001)(316002)(6506007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2W0ZS+Phq8JwD7MEkKK7k4GsRshcT2q2xns2c5Hw2N109jI5s9pfC1/6g1/x?=
 =?us-ascii?Q?bBSeKXehuM1y6HIz42HscwjHkQDBywidBzCUKjVyfSNN9g//z4lfcrDjtyoG?=
 =?us-ascii?Q?LAQOzTQBZGaLnYBxQR9UCjFkGXNpNvW9udDJmpW66HtkmXk6CNWa5A652PpQ?=
 =?us-ascii?Q?AhcysZfVjyghLbAUMNKFiMJiU+k3/NFrNjHIrMeVor8+znIYL23b3sywYe3v?=
 =?us-ascii?Q?M0pF7/W30JUZSQ+kSSx94rpYGPNPhaAuVXcqnWkosA4b7fQwN/uzng+3GOci?=
 =?us-ascii?Q?tOJB2jrhsLhyaqIfuOOXUKG1dUtv53Mme+R2LPiXFHsGOgbFqaol5LZajX9J?=
 =?us-ascii?Q?SVvjoWbHgRzKo3oRPgkJuR1pJVVNCTST5f0mwsrxNeqqZsv67w9zkpjbt6xV?=
 =?us-ascii?Q?CyHGb/gr/p7zRkUWz7NTpfZv/iVCfq4ylxhhaSZcNzTyqcLRfMgUTfvA7iZm?=
 =?us-ascii?Q?Mreo/Wo9ScresczDIqVbgUEdobUyrtb7btM5Pa2eRdBlYMSvJxkI4ssZ0EFZ?=
 =?us-ascii?Q?xarY7Ck0Fp72NjQo61g/fqKthEeZpYapLiRKEL12HXHnSec4bBusLw5cBq3m?=
 =?us-ascii?Q?UJi5Ywh+vYJvzKNyOUhzitYXFN8E7j2GnYZ5qwDzVXQ1xRhSWtWbZY+9VcHo?=
 =?us-ascii?Q?2osSUR70UWMrC5/tGiPjRL7ctu4W87gCQmV/SfM+P2gnLC0DODB1XI02Acma?=
 =?us-ascii?Q?RvL3shEAq8EoWOei7CXyb7BDpWWFjdygZxVRzob8/uEzct+USadlhmEb7IYI?=
 =?us-ascii?Q?ijzji2Y0o7pTzwrTpigO9HPx8E6ir28T75pVI093xUWZvM31YuT5+H85WmGL?=
 =?us-ascii?Q?qrfxNoD6rgNmwD7TrZHLhzgo9WwNzo70Px9YQuFqAalMXqV26+LorVT/K2Rt?=
 =?us-ascii?Q?5WR45gQB9/1sgbVTX9BQy7hpMcOaeaXSRBrbw2Mz2c+Wtz6+JqF6ETRyijdL?=
 =?us-ascii?Q?Z5GPofnXGFCgLJr6bPIsa+cn9f2GCN4h1jEqs1v1hx607ENxJM0xKRf3eXYD?=
 =?us-ascii?Q?tsSJ+BRftb/TWjUlI8AuDJOurAfKlnEmpX1wcgOpqAtOIOVDAHRmqs++pXnA?=
 =?us-ascii?Q?Bdcax+SHm3McnlPMSsoPI0QlY0cXTaHFah/VTrDvWi5KSjneJdhX3JA7Seiq?=
 =?us-ascii?Q?uMC4fuR88x4jxKBOJ37Oq6QHi0B8uFZDD8pqN1757J3yz33D56p8uQHmqtE6?=
 =?us-ascii?Q?GEYizmvf1vL6m53qKIywGsUqRzyqn7rKzUYjQ8fv0cL/wDm56HpxbdPnbtMA?=
 =?us-ascii?Q?T5QKAlUfS9TvZhlqJfFQxb2rXZChQYBM+dSkBKGJw8vbox3VN1xka/3MkYI8?=
 =?us-ascii?Q?zVEkerzc/CZ9QcWqFeA3Iq/d+SVip6w4lkz8sQ2JqFnRqfTglUJsL0jk9qJ7?=
 =?us-ascii?Q?RqA5TMrg8axCtRjn4ZKrOnDA2pd5guMdoWs0+rTz6+imIyPCZ98QbuzTjHxV?=
 =?us-ascii?Q?AHvStDECkNG+fXKLJrBx3dRHtVNF0/6gL8xdqG5067FWIPx5cEcgfIBK0DKa?=
 =?us-ascii?Q?63LP2PSFxqY9TqBbcZ180NR6qfX0CCO3WG+j3IVqqRHiF7Ygszjn81On1MQs?=
 =?us-ascii?Q?tdBOs85UA6oyawbaNm1Xvc1asp5EtTiX5mrPFpgop88J4muMQXcAsEvHTJRB?=
 =?us-ascii?Q?9ndKsupeDd7ji2pK75K60CU=3D?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2c76823c-70d8-405b-ee7e-08d9c0804843
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 10:39:06.2110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 T4zUlTgzSXP5DT4o6mWotSSLPINv4Isf11R76gkToty0ZhBfTQ1SgAgpCJck2petSl0jhB+n6bpvHUCLnNq8xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4745
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 10:39:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159776

From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

Both meson and cmake would work fine, left those GNU autotools,
customer script projects.

The behaviour of meson would become that as the following for
the Android target:
lib/libfoo.so is the real binary library
lib/libfoo.so.x -> libfoo.so
lib/libfoo.so.x.y -> libfoo.so

But when you tell the autotools the target host is android,
it won't make any difference in its output library. I would
like to fix that but I am not good at m4 script.

Hsia-Jun(Randy) Li (3):
  cmake.bbclass: support android os
  classes/meson: support Android os
  [WIP]: openssl: fix Android target

 meta/classes/cmake.bbclass                         | 2 ++
 meta/classes/meson-routines.bbclass                | 2 ++
 meta/recipes-connectivity/openssl/openssl_3.0.0.bb | 4 ++++
 3 files changed, 8 insertions(+)

--=20
2.17.1


