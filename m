Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.44])
 by mx.groups.io with SMTP id smtpd.web11.16039.1611682278843515869
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 09:31:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DT/ldlvO;
 spf=pass (domain: windriver.com, ip: 40.107.92.44, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wy2RYrnu4H5lLZgkGOpNoj9siiOtsvQ0a+FXIL7bN1Lyn+8qmqfXEuYYvdb6UhOf8sgKROHyzXkW9NPOhDIWaFk2F/CgIOHIIyTi+eHXhjTMxm6BaTsF4EkHt3stpQwFeB2WLRhHRtte6DHRsdrTAZ8FAN+gzf4tSR4H9DadUJ7IxP0zKa6mkNKo6GEvRlMvlxO0COwQSjDXCilQI9js+KeFBAFIVm4lucSy/RXXkuD2xohX/2sMiQk4nfwVwFtU03FPqZJqaKXrIX7xLsz9hbNMHjvLOxFoCcN64qIRzIpaFruuypQCDFmDZgAOD5eIXw/eV76hsz60SNxM3nJCsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qz9HRm9ChBwoE2RFsA3HVPapTVEocqWqKIdsOqRS3AI=;
 b=gLr6wBD4X2OfZxahqZFdqDrwPrd7ge2r92i9ORg6vplSdqhZ7Wp3qz9qOY+EMITn2uv0HprQ+6cGqDeocG6fplS1Jv0NLClrXZznqgwZEH2gKKbIRZGR4+djOTclHdEUtz0rN8O4t0lFPUtQtYufrPPQ7pPexPE0J3g8Q3HEuLgnSI47C9gDdF+4YgBpqJ1EW+OMk5KSDdcpg4Ma8qKta+sBRgfic5Qbiq/UJGTpNE9DTpZxwxyBzVKAku0FvImdjc3gmWaBdmqOYeEmLcvF6GUsA+Kcl/uAGGmIlW69Nl1SqYXSe4MzMe8bctVdXcT1OsZRiOK710yQpa9uAm5dnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qz9HRm9ChBwoE2RFsA3HVPapTVEocqWqKIdsOqRS3AI=;
 b=DT/ldlvOVWe6WXb9/cBxriPQvtwnc1XO775AtwrVijmDkH2sErWfVLE1kZx7xMycVhbYa2NGVn13Fwc1No19lA+jZN8qU8qbLqhjOGD9GSGbwMLGS95gyCAr4VDrdCBGFQ48a9ZYLJA220wE4sHV+E63bTeFRBLyWI8ZQYGn+0s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1534.namprd11.prod.outlook.com (2603:10b6:301:c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Tue, 26 Jan
 2021 17:31:17 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1864:f651:3f8a:f71f]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1864:f651:3f8a:f71f%4]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 17:31:17 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] Enable QMP Dumping for testimage
Date: Tue, 26 Jan 2021 09:31:05 -0800
Message-ID: <20210126173107.2204111-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: CO2PR04CA0059.namprd04.prod.outlook.com
 (2603:10b6:102:1::27) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by CO2PR04CA0059.namprd04.prod.outlook.com (2603:10b6:102:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Tue, 26 Jan 2021 17:31:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e16fc8e-ebed-4ef7-03a0-08d8c2202fb0
X-MS-TrafficTypeDiagnostic: MWHPR11MB1534:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1534974CD99F7E6A8EBC5AA5EEBC9@MWHPR11MB1534.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	paBR+/n2QNFh/3LotqorCOmiWsAAECsUB0USLL24WcXswF41fEToL67L1JWsCKyF3tptTufvquxq2a9q5WygUholgKc24cRpyYuhcoaUJRZnKKKnkcfdEv5mO+p/bSubjGrfcDJTNwA/TtbnkMSqyoutuj/2NH2a6xePg2qyqRqQn6Ev9z0Nr1OFFO4CxYZgiQdLf4KvWgFo4ry8cRCKY7K8Cqe2cymNjf74PQ7DwHGlNuxu/1K6xa+6bLIaEPsxZ78pY/LyxEU8s5zNiRtU45+TDgjwoJ8cXP+Q75vjdmKQKBIsm+TWoxEbXFOg6PKTw8wIt98lcsUVqYlsy4M4KSW/wncmODJNG79byCrHL8fXPK6W4O2lfQNhC3oDf6OLjxasnmwjw6J0TpsnbHExX2SyLucVA/f5QD0GD7vskYPd+kBRWoO1skGt8jFNc6N3NG2aW/ajxbayqiXcRu1xdLPIi4wGnDKHESiyN80HlmUh3/2P5GowocqtUH7BCdngB1KZqyWedllvBGaE83V2eQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(39850400004)(136003)(346002)(186003)(6486002)(6512007)(956004)(16526019)(1076003)(52116002)(6666004)(6506007)(478600001)(36756003)(2616005)(5660300002)(83380400001)(26005)(86362001)(2906002)(66476007)(66556008)(8936002)(66946007)(8676002)(44832011)(316002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?HiJmj/OboOYniEjoEAg66r81mkfa9GL409LEiA0TAnLv6RNCdQrEQLc/22ua?=
 =?us-ascii?Q?aBT4PY6WdcCKyR1y0cOyUOKETvNiSEtnwgFor9TI965nVBDaB3oOvCN2FAr7?=
 =?us-ascii?Q?rTpiLQS54ca+pAku99cPTufI05T8S30gJls+D93U8tTlgHGxs83UKeft+9N1?=
 =?us-ascii?Q?0SPbOadfFQQByD4c8MHwzI63IeSBD3/bKO9QcDBlEBZe6eIdXiHTwijfujgU?=
 =?us-ascii?Q?OWJNzkAZkkMd/hQUzAqtQOL+tBmGiKd3Ha/5oOcDQ+NVbq88M2BeCIM0RwuR?=
 =?us-ascii?Q?q2u7fiUm+r6ydDAiN93dxOuKjZjLDcWDQCme87WvHiwqOAyo+DmysKbpdilD?=
 =?us-ascii?Q?eK64Y6YznC0NtYNCtsPPyP7IQ9gonCwd2TxvWJdLpT1NlDW+Jb0B/bRe/rCU?=
 =?us-ascii?Q?8WCQ0u0dH/4+EMYwxSh2hcBBA170PfSCYmBCAE22zjJ2Z3krTJRiJAfS2WS+?=
 =?us-ascii?Q?qF6I/E67FY0dchuYdBP7jWXfDTBMOdfSxBYXMGyg1GEblWXnEZyfIn5hhdH2?=
 =?us-ascii?Q?L2tMbPlBqJUjlTKOk0lbxvbA9/12dhXHbZ5UDwIKgMoY4UhJ46WyVwUAC+Vq?=
 =?us-ascii?Q?w6esnvmmZU4On1rMSJVCfoK7hTg+6bOwXbeB6+/w1/DhkWkLpnMvNHPzpdhg?=
 =?us-ascii?Q?d48G/vd+15P3SyHBlKPI1LbYxs1LKm8Z5qd2HUbr9900RrNUV2Hw54jZppgj?=
 =?us-ascii?Q?csT/BH9tPFxJCurn0PpV2IBGGO2rlcCB6yyPl3rsUW3nT8bmQYEhy0r/NgAf?=
 =?us-ascii?Q?pg+Lqc9+jHC5FmqIrB2qrqjfgKGz+ph56Nh8PX59HKL0a9tP/tq8fvDcPdZ9?=
 =?us-ascii?Q?RLDMI2CK2/1uSZaiXW8RyF6jwUUbjU7TpN/WrGr33Fem8KWNIjlRbiC5qBv/?=
 =?us-ascii?Q?R7yrtJ/XZsBHPd5QIyPvxFkZ5u0L2cXmFzRN8IWeneUTCOlYNaa0SXJ0R4RF?=
 =?us-ascii?Q?AnXZZ7zB/iXub8QqmiGo7iOCtIOv7iTc25NaRhSSLUeQ875Sal5gpzu9ml9J?=
 =?us-ascii?Q?JyEnQd1vBpwJAx279mF7eLOQO7RSUqlwrHY3stINrT1S2gye6j1oOmiFmQnB?=
 =?us-ascii?Q?5VvsVNTz?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e16fc8e-ebed-4ef7-03a0-08d8c2202fb0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 17:31:17.1037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQT1Q9zmLBPiF6Hau6YIDxHN6HEv+0cfaIG2gFVyK0z3U8UPbNNmH6l3Cgqq85flv2vKZ/5NOPBHwU23rCLZGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1534
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I hope that this is the final pass!

This patch set enables getting debug information from QEMU via the
Qemu Machine Protocol interface. The Qemu source provides a qmp.py
module which is instaled in the recipe-sysroot-native and loaded=20
via python's importlib during runtime.

The initial commands that I issue to qmp with a failure is detected
is: query-status and query-block. The output goes into formated json
files as follows:

tmp/log/runtime-hostdump/202101061054_qmp
=E2=94=9C=E2=94=80=E2=94=80 qmp_00_query-block
=E2=94=9C=E2=94=80=E2=94=80 qmp_00_query-status
=E2=94=9C=E2=94=80=E2=94=80 qmp_01_query-block
=E2=94=94=E2=94=80=E2=94=80 qmp_01_query-status

Comments welcome, I tested this by calling the monitor_dump code=20
directly in the target/ssh.py code instead of waiting for a given
failure.

This has been tested with both testimage and oe-selftest as they=20
take different code paths to the qemurunner code with different
parameters.  I also tested oe-selftest with and without the -j option.
I saw 1 failure which I think is due to my setup and not the code in
question, runtime_test.TestImage.test_testimage_virgl_gtk_sdl failed

Sau!

Saul Wold (2):
  qemu-system-native: install qmp python module
  qemurunner: Add support for qmp commands

 meta/classes/testimage.bbclass                |  6 ++++
 meta/lib/oeqa/core/target/qemu.py             |  6 ++++
 meta/lib/oeqa/core/target/ssh.py              | 17 +++++++++-
 meta/lib/oeqa/targetcontrol.py                |  3 ++
 meta/lib/oeqa/utils/dump.py                   | 31 +++++++++++++++++--
 meta/lib/oeqa/utils/qemurunner.py             | 29 ++++++++++++++++-
 .../qemu/qemu-system-native_5.1.0.bb          |  4 +++
 7 files changed, 91 insertions(+), 5 deletions(-)

--=20
2.25.1

Saul Wold (2):
  qemu-system-native: install qmp python module
  qemurunner: Add support for qmp commands

 meta/classes/testimage.bbclass                |  6 +++
 meta/lib/oeqa/core/target/qemu.py             |  6 +++
 meta/lib/oeqa/core/target/ssh.py              | 17 +++++++-
 meta/lib/oeqa/targetcontrol.py                |  3 ++
 meta/lib/oeqa/utils/dump.py                   | 31 ++++++++++++--
 meta/lib/oeqa/utils/qemurunner.py             | 41 ++++++++++++++++++-
 .../qemu/qemu-system-native_5.2.0.bb          |  4 ++
 7 files changed, 102 insertions(+), 6 deletions(-)

--=20
2.25.1

