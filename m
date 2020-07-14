Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.73])
 by mx.groups.io with SMTP id smtpd.web10.10640.1594688303039812016
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 17:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EFjY5aIG;
 spf=pass (domain: windriver.com, ip: 40.107.220.73, mailfrom: kexin.hao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwGDn8PZr8fzdhOA/eSSBpGORPwQHOkz5mKIWjdaya/gUznKKQNufpzmP2Ffi3tHcTSNGFta8X15O7cw0io/DljoaUZvaxU0PfnbgMzvPp8AY/M1RFhZqfDwy0JJE7qJKuzZSfPSpDlhCyU6QWoUfR0wUUSb8AYTN8Wz1hOazmT63Rsvvuvid4jZeg3FCRZWBEQTtLJ2WJljK2FUx7tyxJSeEcYfY1eVi1onjSxUn01tzO/o0zuyJeLZSyhd0osQs5/9nJL47Jn1G32huIwyvj4TZsvGIjJpEvhdPTSYzS0Kt7GHgVDxktSQZJNuw0y3zXPq940jGJCTjAKfmg+kCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBkZVGHAne6JWGh6PMJnLKiwh8lYbpIcwUN+FaX1OIc=;
 b=eWz8MgtI+tdk3PcbAL6AIp5ontuJA3P9Q79xFrKgFvdK4mw1Vm8RrVZV9o+7xKoIN5JvtmR0a/47knGO3oqbsyoNv4A04WfDU6+eH1HQJPJYm7SB8R+5nfu5O5VXB1kriMpeQf21PH2AtwkypUw6F00R4W0yisMzvWCC3TQs5UWcIRI/yW5OqG/lPxbCx5WhPaNesHLMdW0ouVriKGfbBvSfrRh4PiEJjWULDc/sNNeH+TnuXgoqYq0fTRnR6KoRlzXKbpvSdDcSKDvSZGfwOpIEoh3OfuMZocmc/h0ar8Le5L1h5VFUxyRgfEYTKkSKyS57WPSLQjmzoUqfShZ83Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBkZVGHAne6JWGh6PMJnLKiwh8lYbpIcwUN+FaX1OIc=;
 b=EFjY5aIGjNJSOKxPFleFBZDKTHEpSLvz+ajfd6gC39dUCtlesNuuiX1x/V0qvUS1xdB+EmmacVOCkE7kVMhGN4TOY7sdjt7npX2dlRGYGDJjYKnEzlZD0CO3Q+8UbWQH693TEyTeqc04sSJH2dHGODUDWzgpiweBpIrSeHNSaKA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4314.namprd11.prod.outlook.com (2603:10b6:5:1de::32)
 by DM6PR11MB2555.namprd11.prod.outlook.com (2603:10b6:5:c5::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Tue, 14 Jul
 2020 00:58:21 +0000
Received: from DM6PR11MB4314.namprd11.prod.outlook.com
 ([fe80::cde4:6e6a:1eea:23bd]) by DM6PR11MB4314.namprd11.prod.outlook.com
 ([fe80::cde4:6e6a:1eea:23bd%6]) with mapi id 15.20.3174.025; Tue, 14 Jul 2020
 00:58:21 +0000
From: "Kevin Hao" <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] wic: Fix a bug when running "wic rm" on an aufs filesystem
Date: Tue, 14 Jul 2020 08:53:20 +0800
Message-ID: <20200714005323.15819-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.26.2
X-ClientProxiedBy: HKAPR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:203:d0::12) To DM6PR11MB4314.namprd11.prod.outlook.com
 (2603:10b6:5:1de::32)
Return-Path: kexin.hao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp6.wrs.com (60.247.85.82) by HKAPR04CA0002.apcprd04.prod.outlook.com (2603:1096:203:d0::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend Transport; Tue, 14 Jul 2020 00:58:20 +0000
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85f1a329-44b9-4873-0f6a-08d8279100f5
X-MS-TrafficTypeDiagnostic: DM6PR11MB2555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB255594BBB68CF9D745C4412EE2610@DM6PR11MB2555.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nz36x5Cn5CvlbrLvXu/jF0P6nibeZb6RjIQtUYhqwfwf2qbN+1JSMLmr81D25LoFvGXhQRULhCy02VHabhKI3oiDJEimmZTW3avB86ZDG2edj8Y0mmmy7S4T1ePjHMA5ugd3NOkYRGT0jKR4Ur2S1UL7ZmeNgvyXfReSEHrjhhcuYhEbzTkloliOFIoS056h8K6UhhfhSS5QjVP9M3FGeuXErgWhx8S95e6amBPyxdawRfSHpN8QEWYTLilAhWJQ3duwQobhS5Q/M94yqENYittlK81tQANB+pRMIBH858WtJVldm9zJIhwncvM3PsnNWDLwk1FX+kqls7/I3+ZXXA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4314.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(366004)(346002)(136003)(396003)(1076003)(6512007)(26005)(186003)(16526019)(316002)(8936002)(86362001)(5660300002)(4744005)(8676002)(83380400001)(6916009)(66556008)(66476007)(66946007)(478600001)(36756003)(6486002)(52116002)(956004)(2616005)(2906002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	uUv1alt3h7Z9LMJljZNDUOt/cnkutQgNlGxk5cCraoJBJ1hV7LJ3f/N5w7X0lfm3ou3CIxjTtHdPJHTtXMx+j3Lv9cXRnWhCY8NmNpGDaS9aa9dVM5TOEowNmgcDCHuWiJpFVs+e7tHmknEzkFNnce6pcYNsd7bFYag31+pQ1WPDTmWecihUGiVwVcJOYbMBfQhoouxgesqXbIZVfyvcSsy2M+mdjPgaq9vydcEK1JGHyodMxg/B6DwyvpAmSkbDGI31+RFFGU/7P1yTKtBh/F/E/1JvZqT4Sw1npd98eLLtKuiJPHS688qMQsrzQGEjXpZwuJk//EuizULzL1b3NEknzYGBcs809O2CWJUR2v5ZoAPxlUBTGNeW889P0Z1uDj3ry9FA5aggCpOE7Mcb1T1Ce3cdtpMxFFJw0kk0FSk8/Wn6yM4q0Vs5aE6qhMh5A18zjq6AV+fs+jPyzqgVXj/nE9RzsZaulsIGpZW1UbI=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f1a329-44b9-4873-0f6a-08d8279100f5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4314.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2020 00:58:21.6454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lbnJG1OnP9Xzvfo12ZLuPiZlUEel/GWLB9sbjf3sMXXCznVw/Gh5iP7LdsyBgk1mTyuTzAmeCUlW1K0lUKC7Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2555
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

When running "wic rm" on a docker container which use the aufs as a
storage driver, the wic would raise a exception since both
SEEK_DATA/HOLE and FIEMAP are not supported on aufs filesystem. This
patch series fixes this problem by introducing a new class to fall
back to the standard copy in this case.

Kevin Hao (3):
  wic/filemap: Drop the unused block_is_unmapped()
  wic/filemap: Drop the unused get_unmapped_ranges()
  wic/filemap: Fall back to standard copy when no way to get the block
    map

 scripts/lib/wic/filemap.py | 75 +++++++++++++-------------------------
 1 file changed, 25 insertions(+), 50 deletions(-)

--=20
2.26.2

