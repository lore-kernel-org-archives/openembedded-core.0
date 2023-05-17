Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F3AEC77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 10:06:29 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.45])
 by mx.groups.io with SMTP id smtpd.web10.45727.1684317978878948402
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 03:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=QaF3zzQ8;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.241.45, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0rXOXWm/n06D40ASM33TFJdi40D3FF8B0d5gjUAT4CPVHPPU9uJh3PisPLY0QAubAVkmAtFJB6Kc7a96zxbmeVOXTv+8WnHY59jEZYW2ryo0KzOKmCTDEIvFpXo0x3p+IkuaIjRdhKejNJXb038sxvnL26bev74neElxJBTLn8c2nCumaSc1nCeTy0/UmqCs1jxQcZHtf61MmUJudCDWsUPk09CQMOfZPd/R83d3Rmj814EP7lO6GIpNzB4eTupIo+m5aBl+OGQ0HitHgcZCNm6VKNnd4898QyZPNv1xaavfhRuu53CVd2xD94k9X7HTfY3AxPTybMfommp98dakw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bv/YRwV9RQqKUmzl0qTFc7Ts7W2j7f2skvWcmPlhUVE=;
 b=HhelrI0CXIMs/hKzKQUi1DGOFFl1wyII7w+83D8dfzU9WdhZ+IK9W7n7ELXP0+inL9Bb0x0FHlxhCkHIJyhNOc6oXLsQnxQkEpwshWuhfyi2kQqQAVbEvW0Jgy34Y1D2mHnLPg7nNiykTeHgrKFzHePUdHUFjJCdDiJY+rLqlXA3Sq/Da9YIdagWTuLCied4YQosg7i/OMOvyAEHTCCcoyJDyY5qZKcpfmiwIMb62mT69BdOJuXLRFAYXcfeGWKVNLpnNqNJQMfO3nWJOGjycBxxraoebWJr+3K6UMgiKyCoYT93jCpBFVDRi6xmhH0OGYqJLKaQ/1dbQP3L7pnhEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bv/YRwV9RQqKUmzl0qTFc7Ts7W2j7f2skvWcmPlhUVE=;
 b=QaF3zzQ8Gx8+ki5J9vdmt/pUjPr9lp+vgfpKv4ADrQnUJV+eXZ1nf9+n9lghsv3pG1bjZ2hkIosK0zIbjycbPiNazS73Qth0oX5rJhFQC/38Nqa440Ow2bTt3WE9YuPH/5WYDNOK+V1l8vFf+5Ng//w1GxrdnDYrtlCKrqpr2Vx7+GvBrSC9xjASphLuwV2mpOdbR6czSyVj2u66jqg38tfSM8I441WSvJgg6gmhR7/uGR6eq4OJONlSlS6MCA3NjcUyB44eDVvuwNYRACNFU9x3MgsFQ3fj2M8jtxXqPEunufb7OxkQsDBl/nLST+fNox858/v5hHScVWiZE7L2Zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI1PR06MB6527.eurprd06.prod.outlook.com (2603:10a6:800:128::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 10:06:15 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::9b07:4b2e:9949:63cd]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::9b07:4b2e:9949:63cd%2]) with mapi id 15.20.6387.034; Wed, 17 May 2023
 10:06:15 +0000
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] gcc-runtime: Use static dummy libstdc++
Date: Wed, 17 May 2023 10:05:48 +0000
Message-ID: <20230517100548.1431325-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF000013D6.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1::e) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VI1PR06MB6527:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a595ff-3d1a-4794-8489-08db56be59ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Qx3/VkIBzSWxeAPQWZ3T4NvbdAbeEF6cdrSBZKmPojsENXbx8aBlLeiUFv4Kpw2je3BjDOJfKn/wNo2wccp6D26bEqjTEMkaDOZPHYDw64/YFnnN+y7OLlo1QPBgx9oIpHrUZeHg+63+P9uYrkmQadX3opBgJ4ljmno6o5wywM6/A60TFTSNsKgmTMqdWny7n7afQtfPpZ1qcmDowGrRXBEuac/3G6eFwAPtAdJ6SA/Mj5nCGGkJa6qMAplStvUS0loAJo8+H60bCvEI/O7RCK9T7gZwnNHSq5Ptls+UJlt7U+xYg5BCtVXOAYqQHUbxZH1KGygaQKQCaJxG08hHL8UsRDceR+45QGsbky0xl2NQkvo/bLsAebaSMw20IQ0QpJm30zMunUKP+8Xh2bD/lOjdgPVd5pmHx5qRFpAY8Oeo3gF2fl3OQ8MtwwV9nzW52CKP8LX554Tas7ijQgiXdnV8eGzswHT9liOzQFCGIcDIx09e0V01HlcgAoAeL9UnP7ja/Y5EcbU2aihd6bx/7LH1yXuKXxJP/x4m2wxctPoQZUdeyA+jlSOdEY95eowsJPAkYTuCse27l3tpFWGGnXKUsLL/sOrcWPKgVnA2Hb5ZWvzP6tj1cpZONOrJ11GC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(346002)(39850400004)(136003)(451199021)(52116002)(4326008)(478600001)(6916009)(66946007)(66476007)(66556008)(316002)(54906003)(36756003)(86362001)(83380400001)(6512007)(9686003)(1076003)(2616005)(6506007)(26005)(186003)(6486002)(5660300002)(41300700001)(8936002)(2906002)(8676002)(6666004)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ChAUNr/pm3eIWXvI4JITWsvxpnyxtdqekHZ05DEx7raf2Q9QrdbmzBX1Lszs?=
 =?us-ascii?Q?lIiJMhPRTCX+clJ5oZfPqkHbp9jyub2ZJp+y7M0hUyo51h/YshqJ+mB1d24s?=
 =?us-ascii?Q?FzCsXWjRPdwVWQkKyXdm8F6kHfv1xKmaQ9zQOwncKNj77ie1PLUIxTekRBEv?=
 =?us-ascii?Q?g7za58UaebLr9Jbumj9OmoiW9K9D7Upb85vraAyV8qkLs1I8+iURfS7DWElf?=
 =?us-ascii?Q?AfbTzt8Kz+2Fscrxw0XgsImSDUKdC+b4WTf6s6lx3D+ubc8/hE00WnRXBNE6?=
 =?us-ascii?Q?3qu6/1vnZhdtY39CFS3NZIf7RjChO5KfqLmY7BPJ1EzHgixgmMRY7ZYpWHza?=
 =?us-ascii?Q?TgluR7vCZLIb1MEG4CR/MGf/sljYIl8ucnPvKoXA/XvLDOCbAqvcIrbnsQQE?=
 =?us-ascii?Q?AOHFd0MYiS2f//YQN0/LrKdZK7Fqs6PX7H/IsBTKLzfK+nhfwrcw1b5t5rn6?=
 =?us-ascii?Q?ZVdo9A4r09duArTAqz8dgSR0FQdCJVUyu6q/tL1MZFQBZnH+qDxiYP0kHE+/?=
 =?us-ascii?Q?mDOB4mjM2vClNejLdIOGZ6clRNR/VTtWoE5g7MISO2X3Np099y8BJWxlsypE?=
 =?us-ascii?Q?vepzkVzyQznnbnz78CZ68VSclQvQcj6UqMqqXkekjqXFnA9uQ2WQSURHE6e4?=
 =?us-ascii?Q?BjC+6TSHdww2BL0v9+7IP9Ihk20vjWNMmG20Ql6iacoFXVSAtqpD6X2V2BN+?=
 =?us-ascii?Q?plDmUN43F0sEfjJAbc7zcN9cHWFZMB+fUlR1ecSw7ZQQfq5ZDRO5VOLWvwbx?=
 =?us-ascii?Q?S8dye3ZXAOqyXwhBcPdGEsbEAPgqHmco3X8fJy9ZjZod4i8X88Te49bSnGZc?=
 =?us-ascii?Q?UWtleFPR/vjV5NIR+njemY7R5ADxY+SxGBaxhGuq5+qPFROSMto+0sd8k93o?=
 =?us-ascii?Q?fCKV5ZU9s5Cg5jJ+2v/0tpH728Sh3R/oVC/Fkhms+AV6p4O98hZlx+4NBpTQ?=
 =?us-ascii?Q?BTAQkE9lAF3XRLEFzHatis+cHzQrWNeGf8s8AB2cNZv2eGw+fdMTMNjUAg1m?=
 =?us-ascii?Q?DDWJ7K/7WqjBlIz9HUvXGZZyX/CZbNlSiYFqEBvIhqe1xiENQ+fF4tILqInt?=
 =?us-ascii?Q?ucYJ26qzSWcx3Z9GWW8bBeYAxuS1I1fso9qBlKCRvRFgSDhbY8s19Y5U6wf6?=
 =?us-ascii?Q?JAa8aechaLCLdNtq67KTnS09grTEe/KHWcMr+C75aqA4zRnP+aftXMAbVgC2?=
 =?us-ascii?Q?R0KWLv+pfC93hK5Q23Q6BmjsHjWOQq5QpMN752uldgyRyMPT31bO/pN03apg?=
 =?us-ascii?Q?8lxWe25aw5NyzRigvoXov3mFkqospemNUbSaAXTMFhmYzp41sGAnraQt6pkZ?=
 =?us-ascii?Q?8idGjz7AkUd7vuUMjxHcEtuimIP5l/WFe2SpUM4xR247cmkvOJS6svNLvAoz?=
 =?us-ascii?Q?8Wk3KRBEpRZ4ESCNg42khjq8b8/9yCcRt457fIvaQ7PlDZGL77LNJ8WbdQf1?=
 =?us-ascii?Q?Rcc7+0C5Uy938qHks+nQ/QoPHG5IWmzTzKZOz6tVuSWLBq8I+wCYQTR7/iix?=
 =?us-ascii?Q?hLRw7BLGwMNcZs2lajHAzindknB/H8SMMIVKaAQvqtNV6Z9Zxb5YqqG00sSL?=
 =?us-ascii?Q?aqkB+le1mRO03gXXkRS270wL0e/JriFoevBnYhFQdcYlZNwLj/7gtWIL9i0/?=
 =?us-ascii?Q?Tg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a595ff-3d1a-4794-8489-08db56be59ec
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 10:06:15.7497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jrJpzMXWRmFnsKUkU5zxDgUeASm18R4kFtysv8e0Rl9mAZbobSwpcIciQPH2rqjtvk8x141oKrR2LjGXu0IY5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB6527
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 10:06:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181484

From: Khem Raj <raj.khem@gmail.com>

some standalone targets e.g. riscv64-elf disable shared linking for
baremetal ELF ABI in ld, therefore lets make it a static library

(From OE-Core rev: 3c6219dfcbcbde314648ba8cc54a90b32ea1c952)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devto=
ols/gcc/gcc-runtime.inc
index 8074bf1025..d019b0790b 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -68,7 +68,8 @@ do_configure () {
 	# libstdc++ isn't built yet so CXX would error not able to find it which =
breaks stdc++'s configure
 	# tests. Create a dummy empty lib for the purposes of configure.
 	mkdir -p ${WORKDIR}/dummylib
-	${CC} -x c /dev/null -nostartfiles -shared -o ${WORKDIR}/dummylib/libstdc=
++.so
+	${CC} -x c /dev/null -c -o ${WORKDIR}/dummylib/dummylib.o
+	${AR} rcs ${WORKDIR}/dummylib/libstdc++.a ${WORKDIR}/dummylib/dummylib.o
 	for d in libgcc ${RUNTIMETARGET}; do
 		echo "Configuring $d"
 		rm -rf ${B}/${TARGET_SYS}/$d/
--=20
2.39.2


