Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.6936.1609935006756585984
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 04:10:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cVygz4RT;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=giNjnJ3JqzcXq8zYeuLerQEoYCS4a7nk4OjwQTJX6Bcw1+8kw9UaXBh7kNg7zLcVhTnISxlZPWoep1bGJF2xeYnWxVRWSX89vf9uDlQw+1jPHqBGayUdVTcffL1RC1RC5K3B083nv2DKZjlNluFcgXB446aoxt1xN9N0+p6ijsGSPhm4S71eFBo++1HXIO7/mVuz8Inkr6e4+q/U2HSluY5EvpZlXxLvH78OWFAFAMm9jvBPMgQpoyeWUj4K27qV9180xlf8oWGIHSkJCXb0Fn18GOvBvHN4GN1e5hsLFsORG8KWP88d8xfQiDE2JjW+rnDhAoRKJltvVB9Bn3BGTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byyZgRaqPGDERl7FyHoSmaI/Uw5nylpNrewJoWtlIxo=;
 b=fSrI73oyr6KSB5vsWh+9hq0oZQRTevY3PdNJWuDFet0srArMTa3dss5N78VysN2qO7ExkANP1uS4dyI3Iuj/Bmz/rZ2nKxJtbUNeIeimFQ9wiDtF8wgxpYBBndCVNOtJb96PeHo7/FnPDDYJu2up7cxKzPkEWwRk97GdtcJucYMS56+r0GhGecqBMbTWQvkdMb6oN5xXpYn52WEKeTLDvu1I48BXfaaEwj5zEQ1Kmt/XZHt184ZFfQLIvlwsKtH2ZPHLBCBsb7owGF8O/9paWhk7xWiYI8aJhX+UTUG3tv9YaSV28ptkMEKp7T++0OjMPM2TuJImpfApGnlRAFzuRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byyZgRaqPGDERl7FyHoSmaI/Uw5nylpNrewJoWtlIxo=;
 b=cVygz4RTks8h1bqDDb/k7s8I7NXx12AwDspdJENvoLp3RLE2nj6NFC+GLasiEERU/9CRwozBs93DC31qksB0ZZ5TuAMDXNDbocnG9fS5yGtzX+mBqdNonPO+P3/R8AVOw9gnS1+94bYzTE9Q6Y6bN7SF6g/vqE/fp1Jo0lYpneA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (52.135.126.77) by
 SN6PR11MB3088.namprd11.prod.outlook.com (52.135.124.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.20; Wed, 6 Jan 2021 12:10:06 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1%6]) with mapi id 15.20.3742.006; Wed, 6 Jan 2021
 12:10:06 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] ccache: Extend to nativesdk
Date: Wed,  6 Jan 2021 04:09:50 -0800
Message-Id: <45da26f2bf615b09d4b69341c5696d07568170d9.1609934927.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609934927.git.liezhi.yang@windriver.com>
References: <cover.1609934927.git.liezhi.yang@windriver.com>
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: YT1PR01CA0110.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::19) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by YT1PR01CA0110.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Wed, 6 Jan 2021 12:10:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60d89b7b-ae99-45f0-de72-08d8b23c0161
X-MS-TrafficTypeDiagnostic: SN6PR11MB3088:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3088AF8246EC33943624554DFFD00@SN6PR11MB3088.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s1IFTj6Ui5zTH7qtL28bMG6rJwhfaa12w+bWsUI6JMN5E1fjShRT3GAtlDq4OSxleUTK3PSHQDyvZzHJ8dbcRaspO+ZimjdxPR4ZBS18PzqpqSbXf+F7kMOVSefwCtIVwEUriqGYTQkGjxHgwV6ImWn3pB2tarqN7+cTkpYbW4vtSJUmVYofKzsMmcsYcr2GptP94RCYiQEwq9VwCeQHZWaBD9V16zhqyL2FKukvaWNtDXvmFp/HtMKh2XWOtrx/9A9Vs46lMe4beYpJ01lbPhlz03+m7QAULXwb9cSIVXzhM/EZ4IfMC3KzuSzvaKwYUQ/5Pp/xIHkbo5Z/4Pr1O7g4B2paSKq5JLiutxhcbQk/2hHo8c0V8t9oOWv49fSSQ7aPkLWMt02nslDpEs6pzg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39850400004)(366004)(136003)(5660300002)(478600001)(8676002)(956004)(8936002)(2616005)(6486002)(36756003)(83380400001)(6512007)(4744005)(26005)(186003)(66476007)(66556008)(66946007)(6916009)(52116002)(6666004)(16526019)(2906002)(6506007)(86362001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?1o9nT1Nup7RDQQGaNeH+5yQnHe/4PY88jd2HMa7XrbDKUKAHi/9Gb3yIvAI7?=
 =?us-ascii?Q?qHUqmB1GsQuNDRYPmWPbTVGlDw9Lq1KoovZeNHfZD7RVPmr7AtRnvK4n6TZi?=
 =?us-ascii?Q?ezasSvzCNqKw3tKO9YzMyx6anqtYbvVAui43Hb14bYUDeM0BWcxz8GbbmSUH?=
 =?us-ascii?Q?10OvfC87vVqRk/kmhARLeXXknhqseA1ID9t82k8E0iaBnaSIp8fZuoALq7LA?=
 =?us-ascii?Q?Y4/6Oe24bYNIMVDTCkRU5NnSTWH3ET6iipEToYyMMVLnvgR1YrKKXssLnpGM?=
 =?us-ascii?Q?QhK9EHxVqRRJkJjK1dGTBB0dzw0FzsEitnBe4OJDWG4hapTJXoD9pWg7PGDW?=
 =?us-ascii?Q?ujpxEyneHBtQarEZ39GPdZ2J9aJz7Z+Qo2hHM9jKyB+ZzKNYU9aTTuPTTEv3?=
 =?us-ascii?Q?K3Jqn5Oz1f7oGFS9NjW/oUN9WxWCw5bT6U2MzR4rTKNRL1gwJ16o07FFYctR?=
 =?us-ascii?Q?x8iI9V4lzlaGMb5Hwr1zccT1dnBfgE5MfrxiHL2NXkaUhbr+e399MMLKKxCL?=
 =?us-ascii?Q?LRf+2I6OAVlttkwDnEttATm/J7Jdrkc26NzeILWD9ccPb9QDqiFa/5kOeP1M?=
 =?us-ascii?Q?o0R4/48fSLlUknWhrB4FG5sV7STBzQlHBCDouUN2KlETz63YzmGI0W00gjhX?=
 =?us-ascii?Q?4IbuNg2bHwim42PvCjW4Y184iWOwzvt8Nh1nCQQ1HkKp2lKcO0K5GSkpN1Uo?=
 =?us-ascii?Q?6DYT0FNYa17L9AS7tD6RIgFBwpWD2L43TjEpoZVNQ7P5OXbNtfFKLOJAnya4?=
 =?us-ascii?Q?qKXJTJX8qCRay1jhIAujbcDmRu+X6WcW5LDbeMoIxw6SurCDrmu+9/TXaKLo?=
 =?us-ascii?Q?phqwnwhT27pHBwzL0tG+RTFP0+FoFwAlL9pg6W7r2qP/RxdzwO1gvpgAkFfe?=
 =?us-ascii?Q?G4YGk7azA7Pv8B9/CoxbRDqqEzGf3yjSt26ShQxXF0CDrSWUs8x685qcULbs?=
 =?us-ascii?Q?LpGUbB7hH0IqMVram5KPatS8owQsVcbLULDaEyTbLfkzvfexcysMi8YKgAYM?=
 =?us-ascii?Q?nMoL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 12:10:06.2818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d89b7b-ae99-45f0-de72-08d8b23c0161
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uz3By72Eqa5RZ5kJdzTx8kng962rpqFJl4/1pxCGc2lDrypwIPdKUkPz85eZ1wS3PO8Jvb/0t4RktvnfXswj1CteyTVNjhjY+7AaggztWOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3088
Content-Type: text/plain

Now we have to use host's ccache as described by:
f5b29367af ccache.bbclass: use ccache from host distribution

So extend it to nativesdk and will add it to buildtools-tarball.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/ccache/ccache_4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ccache/ccache_4.1.bb b/meta/recipes-devtools/ccache/ccache_4.1.bb
index 96254a38753..1205f4996cb 100644
--- a/meta/recipes-devtools/ccache/ccache_4.1.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.1.bb
@@ -23,4 +23,4 @@ inherit cmake
 
 PATCHTOOL = "patch"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

