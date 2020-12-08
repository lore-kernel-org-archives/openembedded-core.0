Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.56])
 by mx.groups.io with SMTP id smtpd.web09.6275.1607420609895827439
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 01:43:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mPLBs0UX;
 spf=pass (domain: windriver.com, ip: 40.107.236.56, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHniz9DmvnHnF9Tzk4vHtBmBK1Cx4rLpk8edEWFa78GRHx1ykFvoGozidGd1FAz9BeuoW1KFM3pEcgQkmRz0cnJ2dZ9od4qMWZ03RqQIyscbw7Yt9zIH+4Xq8RCe7rQ+9RFj/Eo91wugoiVhDVZl14mleuJu5lF5fNZeeObwI3/eeuCDa/3twjIUjjq9vF16S4Xts95r67cY9rp9mwnHUg9xYX1/fYSYNazdGpG60stSBUi0ECTNGrPRN20eFC4cRPSUmWPnA2/ql1T3ln00au/IOsXPKc3UgMOqIVm8Czccl5T0ad89mhJgSSVFlxNWDqzntjuRA59fhMaqfCliOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqZj9rwsmWYOt25IbOu2jHhJuLalCOt5H3nHxOm4HvA=;
 b=ezQBSBEOkaKHP727H5kv0DcxUQGc9yPhxZLadmLh3QrTwdljd2DcmtYWp1Z8mPekUqC9BjHWcuPzfW4BEse/nc9q3q1xBis0b0lPxT0CnvdNc60Wv2q95GyCHapBY0gOJxMUDbEiIkCyHBeRbLOwtEkj0YZSx95B5+Nj62EHtMcer2IbBFUXmp9ieit1yhlpi8wGaWUmukPIjTsdb1DjzjHu3vAfTgHFS6on2gYigsvCO5Sc1E/pO9CBFf4depDZ+uj0JW1jjH5pIT6AaVzIeCrLfvEHiTB8wNsbtDSOzRZv+Rj/5mvFsRAWu+MIxURfk1AUDAyQwmVrDXnJuQjUhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqZj9rwsmWYOt25IbOu2jHhJuLalCOt5H3nHxOm4HvA=;
 b=mPLBs0UXmqZfoj9tnhoPfmgPMnyCgW50YLe9flz4sLlET6KND9kARk8BfLuES22PdW5Q9OmEAgSRSYMfvFGqgHlRpkOMNsLt2O5siw2nJdWlAz8oKsw5Yc7aQ5qRxEphZFAfE2iVwSb9M2CQ9UzvhGzrubR/W9DOih478JgcjnE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (52.135.126.77) by
 SN6PR11MB2814.namprd11.prod.outlook.com (52.135.90.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.21; Tue, 8 Dec 2020 09:43:27 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16%7]) with mapi id 15.20.3632.018; Tue, 8 Dec 2020
 09:43:27 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] buildtools-tarball.bb: Fix PATH for environment setup script
Date: Tue,  8 Dec 2020 01:43:12 -0800
Message-Id: <cover.1607420550.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::34) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 09:43:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c42f6706-56d1-42bf-bae2-08d89b5db6ae
X-MS-TrafficTypeDiagnostic: SN6PR11MB2814:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2814F39B8E443C50DE85620FFFCD0@SN6PR11MB2814.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yL/XeoOVrmC1D1rwEla3xDs4NR6RBm4QM+3s8uUUuyr0RuymGQpYk84OX5KWWlErZCuLFochOr2I03LiEyKk34F8PnLwhpLDdEk8NNYB1xtfwtmz0ytCNZLFCFmEwlpwwAhcoSdTrnS8Fv+90LB4J/80ypAvrdknfH7qeZjg79zQ1UyjvEdfur8wsGNjzo5zsqyZJqM2eG1rMF2B87fWv3Ya9jRToFkhfauXW1V0mAGBLmWFI+aQUlOG7xX8KB2k+AUotSXOND82VSPX++b8qF+QslC5FSrAXjxzBIIYLDrCwg5H4rxwa2dvJNAtx4tDDqBQONfWRCRRBPoJaU2L03ydggMJGf53EvOFwdV9CEWEmclkqiPAwxIt+Iu8kxvWZaP6nTDtizF9LEpa32W6Hg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39850400004)(66946007)(2906002)(66556008)(4744005)(8936002)(26005)(83380400001)(6486002)(6916009)(16526019)(5660300002)(186003)(6512007)(52116002)(36756003)(478600001)(6506007)(66476007)(2616005)(6666004)(8676002)(956004)(86362001)(316002)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?bMVE7M7t122VbIlnF6qHduakRen+W/Ekn5wqOwEa8IaWwqUyVRMHeAYwoYBM?=
 =?us-ascii?Q?QtFNJB0K9+CpmRUDSm1s/73WtU5cHCj687SmHJddBfZ6jHO7hBrabzUMDM2X?=
 =?us-ascii?Q?Fj+zriwmtKDW2/HY0V7zvBx2XR//G4A3LSQXAvR3khx7nRTWaeA04KwSONJS?=
 =?us-ascii?Q?L8qUjMmIHqJ8Zg7QH/gw5CBq7+4gHEg/3XCHig+BgR+uHk6hiOaF+Fl/0l/q?=
 =?us-ascii?Q?3GssxaY7EnkshUAR29t002wnQvO/h3aVLKJEXG73blK+BX2c6Zha0rBtIpYr?=
 =?us-ascii?Q?8Q3huQGvHAtXEuyqwkXUj0drLEiIgoOHS0de4gQRvN98JHZM5A1UbsbiU105?=
 =?us-ascii?Q?1XudmvQ6YY6KqX/mby4wWclHLlXiedOFOvvRy1bcEGOCUB/ou57+F0d49lSs?=
 =?us-ascii?Q?F3a7K/J8ALiKN2rb7mjnG3PkfIPaDvX7EsFOn3ldcc/q4B7+bLQdcn0rUKOu?=
 =?us-ascii?Q?rcwnZzFRz41pqwzAZUMbv3VMJTsQPAF6V3QAtWeM4Doh7xp8EkTGxNQEdH8s?=
 =?us-ascii?Q?eokwYKGkn+iQMy0niZ4cvTEeiPnJtWEtHHKKr9TGcKtegJe0W7MYhy3sCEW3?=
 =?us-ascii?Q?3rUKvK0QhYajLVvphBqAuBAbvjB2ZfH1z3wygZTbcFg9rbQJFZ+PM5MWbRDD?=
 =?us-ascii?Q?j83x8tE6cDRwmtNqlzBH+Ouae5Rn27/8jUXcIHDQEkVM3afzB0AQWF829/Go?=
 =?us-ascii?Q?ioDeIy7TQvX4AgY6bjh4AESwyodFfLLSnyU8aQ041+Lv0+aTud42HnsED4L5?=
 =?us-ascii?Q?+3aHUyqp5gWaHOo8Akk0a3274zEq+V39zqT7gQbT/TqxTenQAURDoaoglQBc?=
 =?us-ascii?Q?sWfaknHGWqacfQbo5MT1z8b1F64ywSSVSv2ywpuiNLYaiZjpn4We8cBnRsls?=
 =?us-ascii?Q?19wEEksIddI7zoQT46UmJcSg9VhEmKLwvofM1HSHvr+kwqy9Dddawhm5sLkg?=
 =?us-ascii?Q?a6qLm9B8D7LHKTy08oICOyvYwWG6i9tSiZY5HALBW6oUt4Rl7pE4Z8WObAkp?=
 =?us-ascii?Q?96fj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 09:43:27.0894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: c42f6706-56d1-42bf-bae2-08d89b5db6ae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wz5Z5M/cSCAwIdSrlSf0ROV8kvmDwcHO8oxl0kFmiohumxqjpDDx8C1c8R2bhLqXLhduXIeUgPA4e2syp6omPLRWCEcfVzCUfntU0QZWIN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2814
Content-Type: text/plain

The following changes since commit e995e67bc7a3d30adf9f8d0d2f4df92a941baeae:

  meta/lib/oeqa/manual/oe-core.json: Update test_bitbake_devshell (2020-12-06 23:16:50 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/bt
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/bt

Robert Yang (1):
  buildtools-tarball.bb: Fix PATH for environment setup script

 meta/recipes-core/meta/buildtools-tarball.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.17.1

