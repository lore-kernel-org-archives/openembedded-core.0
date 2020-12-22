Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.69])
 by mx.groups.io with SMTP id smtpd.web09.9202.1608625788022083232
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 00:29:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WjlZcyLf;
 spf=pass (domain: windriver.com, ip: 40.107.243.69, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HS8ZiQOkgN7bSJ2ZXZcAtMmXIXmyerLu0hgGMveRS31aaSzi01iQKc6ImkKFNXTV4IhpLgqOSYnxBLvPrUV68wJ7jLcrg5IjQdESfKEEDx4T5Mv9b24SlyqZmSZRjgK+UMHR7KQt3vKz4QwemGHw/vdLfrAOnSVrZRJy1wyvfaLjIEH42skmMGcB+npM8rRsivevGV9InhWE9Hr/2VSIjA29jztAZYVX0O0elH6jrOXNICUIlRWgdAf0rzs24cbnym0nLuFCkEKPsmuZBsxD+0MCtzDMfeSGuZx3K1HXrHtl7x0PgUfrmyeqwV7Ex8XIx0fUfqD10NL5sPLCHvwC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dY6IwSnNp5RhK92H3bSpp2Hm7GvmeZECSWCX12D8Q8Y=;
 b=MvuJ7QryHVcsTUg6+JaVsqSxQ4mUxjBoqnM8Jw/edF5T0fVzsnmZFqyfF4oapz8rs+QJBbt8a2qI7bez0LrnwJexbscHAAVWdNj5g7LYWqjtQlmsDSkzPDq3kQWaCl8xKaJdsATEik9V/WrMpKZ2JCA6hJ+1f4q9BUtNl4CYGxTQna/VUXxJPNSNjcMFAMyEjoTQ4qLOpzkhrWUNuqyzCsiHmN8CoxLNTegvRMQJgxZkgZoPx2NbKEgMZLTychY4vlo/95Kk1T2lwBRr17aheS05mSUoF7rDvtdvGg81P2Xdp90ENS8/3YvItKQv97YlPseYchczqzocGoWXPzHo/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dY6IwSnNp5RhK92H3bSpp2Hm7GvmeZECSWCX12D8Q8Y=;
 b=WjlZcyLfzJ/ezl9+85ywJtOCdoUWWk1B/mYrBXDYh2csgsXDKBS2IwLtFh3NkEsdmTdnAH1raAZuqoyRXsKa1kynsZjmDZ4lxPXicBf6qwfOlUw2sAaBC64XZaUdqWchrsBxWPKWTAUL244Rsz8UYqUo4nXbNYfVH6tjUSvcivc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB5169.namprd11.prod.outlook.com (2603:10b6:303:95::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29; Tue, 22 Dec
 2020 08:29:47 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5%7]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 08:29:47 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] inetutils: add dnsdomainname to ALTERNATIVE
Date: Tue, 22 Dec 2020 16:29:34 +0800
Message-ID: <20201222082934.208800-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201222082934.208800-1-yi.zhao@windriver.com>
References: <20201222082934.208800-1-yi.zhao@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BY5PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:a03:180::18) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by BY5PR13CA0005.namprd13.prod.outlook.com (2603:10b6:a03:180::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.19 via Frontend Transport; Tue, 22 Dec 2020 08:29:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a27d1137-3843-4756-d003-08d8a653bded
X-MS-TrafficTypeDiagnostic: CO1PR11MB5169:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB5169EA3B433F7496902CA0F3F9DF0@CO1PR11MB5169.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4vD+vGDrJ/4ynGfGGB/IKP/Nof/2986mTLe1ot8ZXKkBm0T9xXzJE9b7n+plGFl7MhoXW5MC+/lTeEzOZQIJinpB8Sld5FHzUfeAfdCKANXKufczR9Bbv2B4QFzdwtsXw6BfsXrl6whFGjM3BNuIts094xEtsjizNerIVSghjnP3lXqsm+kDoRxWigoTO+F0fwVTvceaRTP3yPhlQmxAmqcUZjNkxcvdceUYHIpmGHWKqlYwGjG/rxmJdhiitZA8rKlq2tM9piL3ntKlcBQpfh3AjMju974LjTrO+kVXzriUw7B1Xj4a4BkbhAOP+85JgimqWobO9VVDemu966GbWorVqj28vyYqQB3UsFCknEfLs+BkvPiAWZcwQrlgE+Win+y+KNxclUDbaf8j7BahFQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(366004)(396003)(39850400004)(2616005)(44832011)(8936002)(956004)(316002)(5660300002)(36756003)(8676002)(66556008)(2906002)(83380400001)(66946007)(66476007)(1076003)(478600001)(6506007)(6486002)(86362001)(52116002)(6916009)(186003)(6666004)(6512007)(26005)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?4xGmmUJli9m4XTw3kRm8stpb7ZXhl1OCb4RU0X3YzqR453ayLjGFBr/BQG5w?=
 =?us-ascii?Q?6raD8mKrZ9oo11hMGY6wlCiihecjRe5eb5uO+gIYsKRUsHWdxetJyuWwPLbZ?=
 =?us-ascii?Q?2KYRuPCi6gGCh8bAC4jXey+q6gFi2AMg/boVqS7i46xkTlXM2qRFOPuvQNTb?=
 =?us-ascii?Q?rNg2/0QPoOw6ONxx/JwEx42qDenofKO0EK+M3f37ax71nv/A3yanvkm52158?=
 =?us-ascii?Q?22iebkIgIdVP8jkTmyKJWhAkhkcUR/R/mZTzMQFCGJFWH1mQT/Fr9Wt8j1Cg?=
 =?us-ascii?Q?xk9zM6Wfq+pK562oqsxFDGm68+zDsymbF5afaI4JgMIM6UG+9iyq5h/vpgeD?=
 =?us-ascii?Q?O0mehNRMklOk7xF3H2U1BN7IMEofEAIMPkzRltBm3qaGG04D43Z5DdC2qqYU?=
 =?us-ascii?Q?bcTOIaVbweym2XMYTwB9jUhXwiQcx85MBDBJMvQ9D6IADDgqADY8PgTZzfUO?=
 =?us-ascii?Q?M7d1naJEhStYtfKmgogE1TrFYK1/Kec57GqJ71oLmmJAsusn29nZr/gNIujN?=
 =?us-ascii?Q?Lp27DsNzO7lmRzc5s8wwkoWI+LKZuQrnsp+CCjliqOh2c+ILK7Pij5s9DN7e?=
 =?us-ascii?Q?gtF3zLA0PA9lArOeHjx4Let0PIk5N2bnmigpuAbZLD4bjzFc7Q5ldHmqWtu0?=
 =?us-ascii?Q?ECn6evn3LpZYPdkSYrfJuZig1neG6LSiEL3rWeUT4w7TXD1pKWM9H5NfcTUT?=
 =?us-ascii?Q?yXvrDSJcgUdLp1q3zpLB3M/OhwDpFnw+EdQCHPBWSFNMR7uhe3loUEE4cp9I?=
 =?us-ascii?Q?OIhOIBjTohNqaCIGykBiStS5jnvG6aBkseXCFS9kXEPyA+Ue1rz4ZziGn9lO?=
 =?us-ascii?Q?RwynriT6DwC3/+rUxefQZJ9GgqAowE9O9SgS49eF8InLk4BPiF5v9sIUHTkF?=
 =?us-ascii?Q?eloUMZ7DKaN/uQumouJ2fWRw7rsQkBkSigGQxJzBtZoOe4HZNZoPw2vHv0Wa?=
 =?us-ascii?Q?X3iNRK4qnt6/7Xlv37zHVp0Q/TOIvQRwLr4vq0InJN/eMEMqO1knpS2FA0U9?=
 =?us-ascii?Q?cNYg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 08:29:47.0735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: a27d1137-3843-4756-d003-08d8a653bded
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yodJVSyys0loUoDQz/niD2+ZIcGcyO18ymcQFidJnzTk4wN8DerEEQIjgh2wMxUrbDf4CQ8lhOyqyPx9Hs7uGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5169
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The dnsdomainname can also be provided by busybox and net-tools. Also
move it from ${bindir} to ${base_bindir} because the command provided by
busybox or net-tools is located here.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/=
recipes-connectivity/inetutils/inetutils_1.9.4.bb
index adf6d4414e..09a196ad9d 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -71,6 +71,7 @@ do_install_append () {
          install -m 0755 -d ${D}${base_bindir}
          mv ${D}${bindir}/ping* ${D}${base_bindir}/
          mv ${D}${bindir}/hostname ${D}${base_bindir}/
+         mv ${D}${bindir}/dnsdomainname ${D}${base_bindir}/
     fi
     mv ${D}${bindir}/ifconfig ${D}${base_sbindir}/
     mv ${D}${libexecdir}/syslogd ${D}${base_sbindir}/
@@ -118,8 +119,9 @@ PACKAGES =3D+ "${PN}-tftpd-dbg ${PN}-telnetd-dbg ${PN}-=
rshd-dbg"
 NOAUTOPACKAGEDEBUG =3D "1"
=20
 ALTERNATIVE_PRIORITY =3D "79"
-ALTERNATIVE_${PN} =3D "whois"
+ALTERNATIVE_${PN} =3D "whois dnsdomainname"
 ALTERNATIVE_LINK_NAME[uucpd]  =3D "${sbindir}/in.uucpd"
+ALTERNATIVE_LINK_NAME[dnsdomainname]  =3D "${base_bindir}/dnsdomainname"
=20
 ALTERNATIVE_PRIORITY_${PN}-logger =3D "60"
 ALTERNATIVE_${PN}-logger =3D "logger"
--=20
2.25.1

