Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.59])
 by mx.groups.io with SMTP id smtpd.web12.1574.1606875723955470272
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 18:22:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=osNv9jVX;
 spf=pass (domain: windriver.com, ip: 40.107.75.59, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHWR6vjeWR7NUMc58H4fUplIOK6e2FV7pol+NRGI388aHAVSIBTDQ6nhgoBa1/87o0OTd9uheYI8HqqqFKN0BUqxKdkLl8I3Tz7yUcPAqtDOeCmUT0yynlI3ngvMf+jv9/14eETF8ijGepMBMKt+w2gtm1SRpUvXsStW2ApPbgIuhlEoP4YZfdVPO/GL3rxLusHB+Gfw8WOvQsDEeoqDnsd2zyOJndse3X/VPNCesPCzyzx9labh73MQ1lWxwX1dsNdAqym80JwU2ismmJw4/97xsGn9sW7MMo0nCw14f1quPp14qit3nZXLVtekpvdsh1bSWoIQcihf9JO1kB+hWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d61uZzSvY1NyptZ0QCtTIa/ow3NeJqaCWWP4sLfuibw=;
 b=cOWhrgvtzoEqI1iAdIRgRgnK0LvTqcvMPN8yCjrd6nbot8vM5Mt6Bo0YRy+1PyyF21Ks2B4kT31FVN+5EAUvtiO2BQUDsGatRLTSHbcHMJgW2srCVXd0A+nqvZFA0RgKNyV4O+yrG4JbT5G37nzXFKuXue0VeyxeGToJyVojEWVEOdJ291N9danF4BEXnh2FC89v4O6XnbpLz/0b7rT1Di31Z7SBUWHUuYl6ydGpkdDmXw4D7uAwlgzylfQOjbbc19/M4OzzoyFgIXKFvx/Ccjd6HV3lpH/SLjmsxjuc5Fn4+otGFekyBVmEhsyWzLrXL8YqZSqS/74timBkgJcrxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d61uZzSvY1NyptZ0QCtTIa/ow3NeJqaCWWP4sLfuibw=;
 b=osNv9jVXQJsDBcyU/WMS267MxXNsMYjaUmbF5x+Tt1hzhzN3MLLFBzI1dzznSwhRNMSrwnrHganDidJzRjSnh5Lw0z1Y9DMAygGj3Tj4Lo+hjF/puvLVsatRpNpIEhYGOt7MffydH50wtRp+zeIibDXwd39YKe6im1J6KjHgP+0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SN6PR11MB2573.namprd11.prod.outlook.com (2603:10b6:805:53::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 2 Dec
 2020 02:22:01 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4%6]) with mapi id 15.20.3611.032; Wed, 2 Dec 2020
 02:22:01 +0000
From: "kai" <kai.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 0/2] Update the criterion whether command systemctl available in systemd.bbclass
Date: Wed,  2 Dec 2020 10:21:43 +0800
Message-Id: <20201202022145.31476-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0184.apcprd02.prod.outlook.com
 (2603:1096:201:21::20) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR02CA0184.apcprd02.prod.outlook.com (2603:1096:201:21::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 02:22:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99189a11-004b-42f3-92be-08d896690d45
X-MS-TrafficTypeDiagnostic: SN6PR11MB2573:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2573E8DC4CF10DFEAA33764395F30@SN6PR11MB2573.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0Jre8k5TkOOkR5uQBABaYRuikInR8qENIgsMcCXRZbjJxiuTo+GOAxIXdeNrBq+bB2goWGqjaykGEp8Id2J8fuO52TvZNxjtTaoxJpv5oCiyQjxPbgz1qiqaubzRUyu/rMj2NXFI+qb1SkCaG5dfMtNchhe00KcD5lHbpWReOmj4lnJy2TLeqWSpKMgiXE3BTYhU7cFYR0JfA47gL0OpXkkOPWOXMaSY1c47ggs6jrCIw8YTNX0BgSVnlJANzn8Th9i8vmvOot8s2rmurHlno4bcYeJJ35u+5PwE1CG5FXHpHGqZt8SLutE1rXwxFGCn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39850400004)(376002)(396003)(6486002)(8676002)(2906002)(316002)(6666004)(8936002)(52116002)(4744005)(1076003)(5660300002)(6506007)(6916009)(83380400001)(6512007)(9686003)(478600001)(956004)(86362001)(2616005)(66946007)(66556008)(66476007)(36756003)(16526019)(186003)(15650500001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Aaa6nKIX4GSKIkkmXlH1Pn984ARItuBIsCQQCkt/1kSPIrQNi6PzTY7DmOl6?=
 =?us-ascii?Q?BVYX7CnFxcew95pYynC+05GEBrteEAXaZm0yjGjEJHmuXbC6tYEDda6th8+Z?=
 =?us-ascii?Q?gitrLCLrEb6PVFT3iBbWxDqLc9LHNfmGogSfQjquniHgxIXpLUUjgnfuW+c4?=
 =?us-ascii?Q?0XDp++zxK7VYxrxWol36lzOdLvLjSH4b2hSs9b+8RxQBA3d8rkv6Xve9lNlf?=
 =?us-ascii?Q?0+zhlfyMBh/wRcQ00U+Gvilg95TNRPtmgdTD5aOGY+GvUT79INK+EEJ/OgOL?=
 =?us-ascii?Q?ltKhuTkf9iCy/yMfut7bO82dPEQrAbYaZZN9BQPhNkDaHjK1c7GC6sDpsHG0?=
 =?us-ascii?Q?sw+N/68a8y6ImLlAILKj0QR9EXlrdwfgbJWTsc0+XqQiEbUpVrJhvgLVSi1H?=
 =?us-ascii?Q?fBJbmhJ3g3fjQtyDZI9kK4n6p/y9tonHVQTBBrQqP6aZkuwfYaVxZlWGpqt5?=
 =?us-ascii?Q?mJJS8yFBjCAVFmZ7YpAanKHK8N+4K6Z6wiih4/M/UHQPwcF1E04li9EN9VOB?=
 =?us-ascii?Q?X7wxnWlCiSMhtbdXrZ9uwT9qpnf7YPsr776izdPNI8YF7/joD/BHus22LSIN?=
 =?us-ascii?Q?iLd3mq8gGaOZZKVXLs/oHUAuDvZRyDWQv71d6D+nOtnQH17Ph14ssFq+szvA?=
 =?us-ascii?Q?cKcyIe2Rlde39q/Lu2GToV2tgktGm/E1xXJtkm3Gr8EiRKRvKyMcd5sVQgzB?=
 =?us-ascii?Q?9NoLZLHUiKlltOpGtKBZ/S7A0fhKGU7QkeVXD+AP3bIaCBqDAxGmmvsqBMZ5?=
 =?us-ascii?Q?ocMraK9qPZIYEN7pYDRu/IhwxyFZtOvKPbbTfh0CGU9xGfeCYIBqD7Q42/00?=
 =?us-ascii?Q?S5LUbeav1OmtfJBaLxX2nsX97Tjv7XHx6udCCk6I0GRNnjWps368s4/5VNV+?=
 =?us-ascii?Q?YQVAFMf1nPLaW/V8gJLNJvy8HeNPgtPEaIvwOC4uMVpfKEMfUypGeIK7N4XL?=
 =?us-ascii?Q?khWX/kVPTtPEZf2k5ktw7FTGazgyHGuTXHDtiGIpKniBFRnop8X6+8QeHtJa?=
 =?us-ascii?Q?OMCp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99189a11-004b-42f3-92be-08d896690d45
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 02:22:01.5058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60Wc2Hp3S9JRKAPfSNgu+AUQNaq1due8ZK7wYLOVMU9R0b+f9cnvzvxuIjPByraJs8u//UWzYOlL2s3aIbu09A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2573
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

v3:
* update commit messages to make more clearer

Kai Kang (2):
  systemd-systemctl-native: capable to call without argument
  systemd.bbclass: update command to check systemctl available

 meta/classes/systemd.bbclass                          | 4 ++--
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 8 ++++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.17.1

