Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.58])
 by mx.groups.io with SMTP id smtpd.web12.3161.1588988844865991939
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2020 18:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=N89wE4DH;
 spf=pass (domain: windriver.com, ip: 40.107.94.58, mailfrom: yue.tao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJhzFmcmvhhGFNyfAOUNMqZBJwkVamCZ9Up2vTPdgJLm7qsjN4qU00zUMPgQXIm0Y4wIkELM8HrzjXt2PYXKiyRW7IGFgOJZZKrZfI8QR+xizbuWzdBb2kLzidmkaMLbgydW4ZrdsyvKBB7y4tKUhRWb6nfPyvjRvq2OQeBjgpQTQ0u6l7aSdV/QaHdiAX7IJyUeod6AIgdg2KSn+ED9NTS+cuikqzAuLVD4wvzKPQ/Lrwbi+lSomTexHb8V/luSF3AKwIyDJM/umDxZ9jKSCzP0QscKrIWTwo6xX7YPx38lyEaETmh3osPFqNbP6/KjwJ+w262W2iUWKRUZqfqMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gGv4rzxq6ucXNEIOYqqqG8hfYswXrhCuM/AkMsqSvc=;
 b=jkbNRCc+5WqwKkt1Lm5BxYC+xx+3aUkuzi2nofJ+K1iJ6BolGBfOzP0OI9a6BNP1jN4x7UJcopfRSfidCvQrQ5VVaErpo57BMov5xC5BFFoSG0Ye5AbSmXuFRc0PsNCTkJO153J09dCnPP5yGcIL/fKkoO6ulid8oQZ8xIgEIYu5UjLqhZ5OykYY0jNzsG8ixpeYzVhXDVSCnqtPFCp4XxVAyRNSs//5SGE03laR+C4ucQ8kuKQTnCqMix54HL51UptjDwDa/t0+8Z9dVgyYbLL/3Ra8Aowpdl6iPfeThv9JnlyZUUL773TR8roN8RgEubzYBljEaO/NgVlvjFIKTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gGv4rzxq6ucXNEIOYqqqG8hfYswXrhCuM/AkMsqSvc=;
 b=N89wE4DHBu23TaTCC7BVeikTq5z7rZsz5mZnOXyLkP2WgTadoq7Uu+2s1aTTs5MMUdBdasCvmFWBzASMezLFDHZPaPXRhyqbF9BuhC/zjtt4qpB8h4bzUwMJLWbhH+V/OWRJAJYEbb8dqF7V7/P3i/XLyNX01xpSdLAmyMaIXX8=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB2033.namprd11.prod.outlook.com (2603:10b6:404:47::22)
 by BN6PR11MB1841.namprd11.prod.outlook.com (2603:10b6:404:102::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.25; Sat, 9 May
 2020 01:47:22 +0000
Received: from BN6PR11MB2033.namprd11.prod.outlook.com
 ([fe80::5da8:c7a0:e358:7310]) by BN6PR11MB2033.namprd11.prod.outlook.com
 ([fe80::5da8:c7a0:e358:7310%9]) with mapi id 15.20.2958.030; Sat, 9 May 2020
 01:47:22 +0000
Subject: Re: [oe][zeus][PATCH] sqlite3; fix 2 CVEs (CVE-2020-11655 and CVE-2020-11656)
To: OE-core <openembedded-core@lists.openembedded.org>
References: <20200421061455.6968-1-yue.tao@windriver.com>
Cc: "yue.tao" <yue.tao@windriver.com>
From: "Yue Tao" <yue.tao@windriver.com>
Message-ID: <f93050cb-ce12-97a6-90e3-0a7c99b68a2a@windriver.com>
Date: Sat, 9 May 2020 09:47:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
In-Reply-To: <20200421061455.6968-1-yue.tao@windriver.com>
X-ClientProxiedBy: YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::49) To BN6PR11MB2033.namprd11.prod.outlook.com
 (2603:10b6:404:47::22)
Return-Path: yue.tao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.206] (60.247.85.82) by YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend Transport; Sat, 9 May 2020 01:47:20 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6aea0d95-ce15-4bba-6edd-08d7f3baea8b
X-MS-TrafficTypeDiagnostic: BN6PR11MB1841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB184119069DFC924C3B11A838E6A30@BN6PR11MB1841.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-Forefront-PRVS: 03982FDC1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bMFvZ6Qen5XWfWurcvAjmvvH7gdlpsyKKFzccE5ZeCCbmyPHZetFrrQoM4iAqOuoypILzG/3j2K4k14vZzdVHphUrtwaaVEuaMWSyGGoo8/k7/sROZ6QIZmSzNlxbh8h39I5CYaZhbjmtgZeh/lTrSzkdxsZmcg021NK2KKV2MbdpsBE5UVo9mvW4dGI9x264ixvHbqJSke6/zZfjvOqC15u2OvFtMPTwvkIRuCRDAzZVQ4PDpJ6W1J5kQoskKe4W9UsqBNUH6Srk3gQMG96lFTDIDvOn8IDkykDpOUVY336Q1qqNg08FB59iuVwo5TZJbkPxSvw5W/4b/XbO0VxghFiMC2uW/kzg8YNTM/GGLoY0Z8gdzJU8wK1rn5UbMt7F0YXqUu/yrYOWPzwbFdYRaYq7JcsuNhBFLY1tsyBqi0ieK61uv6rCFEFvi7N0uGHXadOFRsJRJxFdSq4XAMeSGUDfnO0NTl3QxoWEh2Rq7nkpXY8f/wYx/Djt3hbzJEde0H4b8BSWHOP4EEAf3lYoU6Mfr7IAlEzeW8y4F9dEdktvQdEJ3OZawb4kOr0cwXwlAqQLK28iKUoEUJrPa6d5uXeOmgN1P4Q3Gh9/i/C8qaW6yTOBe8FK8agoM5XYK8/FDY6acqQGrJBSCkGA6P1OcJfJhQOHmwN4wyYtAh+LWR4G0/2E3hUaR/wIBCvTXRbeJOx+mrUkfeTNRxqIfDm3Rzqi6Xn8DXZwltvUHxTvRk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB2033.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(39850400004)(136003)(396003)(366004)(33430700001)(2906002)(6666004)(2616005)(956004)(31696002)(6486002)(478600001)(66476007)(5660300002)(52116002)(66946007)(53546011)(66556008)(86362001)(33440700001)(16526019)(31686004)(36756003)(6916009)(316002)(19627235002)(186003)(4326008)(8676002)(26005)(107886003)(8936002)(16576012)(6706004)(78286006)(43062003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	E2sHRG5vbIGwc73uDwK6qPboE6JKP75az3rnKpLh/6pW58uBAMvb0eMKYeQZfi/MgSSVhyDJnhwRZwzBJeavj1hws26IvKBVKfh2Zk9goCwOPRzIaky1FFA6PqqCVK/v9oxzn1e1vBaQtJemwdLWmKjdP+1sWSZ8VihlgLZXIPpvf2dEg82IGMFafEgM1vhWexf//mvTWPwtOLT0qP4hqsHszCvp/uT6gtBRyt7u5KxGBu12jPuGJtqIJOvHr4Hyvouj1XiDPreosGgGnNV6pEQtQyHZoQY+NK7oTXwXh07a1y5fQo66VfVWlUWBQtu+q27f6asFEHzdwN0lAxJQE2HUjv9i9r2BWzRgASLvNFKZ03pA7sO9r0igK9Jp4Lt5qlGlt8dTx1zhFmeEhA3tR3S4tEviFLK+4CPfyuPa8X4RMMfM1uGUWcvc9uZgRPx4CCuqBq6eMlnBHN4bFzz9s7UdHTwswSCpKE6SGDhYf1s=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aea0d95-ce15-4bba-6edd-08d7f3baea8b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2020 01:47:22.4176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqe9Ecxa7JtePZRLhtquhAu70glMPgJ9+LgjUoEG/VIT3MFfpdpG+MT1R/5SqL0RK1JgVaMckzcLnoq/Df89pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1841
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Just a heads up, do you have a chance to review this patch?


ytao

On 4/21/20 2:14 PM, Yue Tao wrote:
> From: Yue Tao <Yue.Tao@windriver.com>
>
> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> ---
>  .../sqlite/sqlite3/CVE-2020-11655.patch       | 33 ++++++++++
>  .../sqlite/sqlite3/CVE-2020-11656.patch       | 60 +++++++++++++++++++
>  meta/recipes-support/sqlite/sqlite3_3.29.0.bb |  2 +
>  3 files changed, 95 insertions(+)
>  create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2020-11655.pa=
tch
>  create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2020-11656.pa=
tch
>
> diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2020-11655.patch b/m=
eta/recipes-support/sqlite/sqlite3/CVE-2020-11655.patch
> new file mode 100644
> index 0000000000..e518dd43e5
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/CVE-2020-11655.patch
> @@ -0,0 +1,33 @@
> +From c415d91007e1680e4eb17def583b202c3c83c718 Mon Sep 17 00:00:00 2001
> +From: drh <drh@noemail.net>
> +Date: Fri, 3 Apr 2020 13:19:03 +0000
> +Subject: [PATCH] In the event of a semantic error in an aggregate query,
> + early-out the resetAccumulator() function to prevent problems due to
> + incomplete or incorrect initialization of the AggInfo object. Fix for t=
icket
> + [af4556bb5c285c08].
> +
> +FossilOrigin-Name: 4a302b42c7bf5e11ddb5522ca999f74aba397d3a7eb91b1844bb0=
2852f772441
> +
> +CVE: CVE-2020-11655
> +
> +Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/c415d=
91007e1680e4eb17def583b202]
> +
> +Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> +
> +---
> +
> +diff --git a/sqlite3.c b/sqlite3.c
> +index b2dd5f149..59ba706fc 100644
> +--- a/sqlite3.c
> ++++ b/sqlite3.c
> +@@ -130409,6 +130409,7 @@ static void resetAccumulator(Parse *pPar
> +   struct AggInfo_func *pFunc;
> +   int nReg =3D pAggInfo->nFunc + pAggInfo->nColumn;
> +   if( nReg=3D=3D0 ) return;
> ++  if( pParse->nErr ) return;
> + #ifdef SQLITE_DEBUG
> +   /* Verify that all AggInfo registers are within the range specified b=
y
> +   ** AggInfo.mnReg..AggInfo.mxReg */
> +--=20
> +2.17.1
> +
> diff --git a/meta/recipes-support/sqlite/sqlite3/CVE-2020-11656.patch b/m=
eta/recipes-support/sqlite/sqlite3/CVE-2020-11656.patch
> new file mode 100644
> index 0000000000..5635fef48b
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/CVE-2020-11656.patch
> @@ -0,0 +1,60 @@
> +From fb99e388ec7f30fe43e4878236e3695ff24ae58d Mon Sep 17 00:00:00 2001
> +From: dan <dan@noemail.net>
> +Date: Fri, 3 Apr 2020 11:20:40 +0000
> +Subject: [PATCH] Fix a case when a pointer might be used after being fre=
ed in
> + the ALTER TABLE code. Fix for [4722bdab08cb1].
> +
> +FossilOrigin-Name: d09f8c3621d5f7f8c6d99d7d82bcaa8421855b3f470bea2b26c85=
8106382b906
> +
> +CVE: CVE-2020-11656
> +
> +Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/fb99e=
388ec7f30fe43e4878236e3695ff24ae58d]
> +
> +Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> +---
> +
> +diff --git a/sqlite3.c b/sqlite3.c
> +index ee193d18b..7114757a2 100644
> +--- a/sqlite3.c
> ++++ b/sqlite3.c
> +@@ -103507,6 +103507,21 @@ SQLITE_PRIVATE void sqlite3RenameTokenRe
> + }
> +=20
> + /*
> ++** Unmap all tokens in the IdList object passed as the second argument.
> ++*/
> ++static void unmapColumnIdlistNames(
> ++  Parse *pParse,
> ++  IdList *pIdList
> ++){
> ++  if( pIdList ){
> ++    int ii;
> ++    for(ii=3D0; ii<pIdList->nId; ii++){
> ++      sqlite3RenameTokenRemap(pParse, 0, (void*)pIdList->a[ii].zName);
> ++    }
> ++  }
> ++}
> ++
> ++/*
> + ** Walker callback used by sqlite3RenameExprUnmap().
> + */
> + static int renameUnmapExprCb(Walker *pWalker, Expr *pExpr){
> +@@ -103534,6 +103549,7 @@ static int renameUnmapSelectCb(Walker *p
> +     SrcList *pSrc =3D p->pSrc;
> +     for(i=3D0; i<pSrc->nSrc; i++){
> +       sqlite3RenameTokenRemap(pParse, 0, (void*)pSrc->a[i].zName);
> ++      unmapColumnIdlistNames(pParse, pSrc->a[i].pUsing);
> +     }
> +   }
> +   return WRC_Continue;
> +@@ -103750,6 +103766,7 @@ static void renameColumnIdlistNames(
> +   }
> + }
> +=20
> ++
> + /*
> + ** Parse the SQL statement zSql using Parse object (*p). The Parse obje=
ct
> + ** is initialized by this function before it is used.
> +--=20
> +2.17.1
> +
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.29.0.bb b/meta/recipes=
-support/sqlite/sqlite3_3.29.0.bb
> index cf3b179845..1db72f0b9a 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
> @@ -12,6 +12,8 @@ SRC_URI =3D "http://www.sqlite.org/2019/sqlite-autoconf=
-${SQLITE_PV}.tar.gz \
>             file://CVE-2019-19926.patch \
>             file://CVE-2019-19959.patch \
>             file://CVE-2019-20218.patch \
> +           file://CVE-2020-11655.patch \
> +           file://CVE-2020-11656.patch \
>  "
>  SRC_URI[md5sum] =3D "8f3dfe83387e62ecb91c7c5c09c688dc"
>  SRC_URI[sha256sum] =3D "8e7c1e2950b5b04c5944a981cb31fffbf9d2ddda939d5368=
38ebc854481afd5b"

