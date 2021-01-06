Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.86])
 by mx.groups.io with SMTP id smtpd.web09.13284.1609961305477918524
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 11:28:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=h1RrD5X7;
 spf=pass (domain: windriver.com, ip: 40.107.244.86, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcO1QT1medDUlLGDm+8LNg2zhNy6ekDXoM+YgDLiWb+QUCSkZRzAnx3zW3+76npai13b3SxgWPgkNt1mTP35bntTzPmwtcu3hLSXHrjwyZAXtNLAM041uQ/Dj5cAyf6urUASgeBhXSM2LCxqbfO/cHK8NI4nDzxMlG+5WfYaDPJ9v7mDAvwHyCyLO9AHvbXGkMxPYKU6UNGsva8wpPhxCKJ21hU89mjssIu/rJyjtPT/yt+kEYypxzvUaVC/Qg9cWNpmPhE3v+1pt0pWvbfUTQda/i+HJ2DSykOoLZkhYZDL+kPKs4Wf+ossRurfiV5hHdeIy2GN5oYjVVvTVQDh5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+a7NiOY43xsZhX927/Deu4zWjjDN/+25TD7fqLiUsdk=;
 b=IuSK7OO9eNINK5uEDPzJVt4SowQ5XV6fXQ7HOhCGYtmRWSxXc4Wdy497one7PbXcgX9RNwzH+vBr9U9e261IHJrYlvm2kTu1mYhzyGsBJjkH3ncAUJCS3xE7IV1oCO/HKwSgAXEv73fD9gK3XqfSrO5vKvwTE1uGDEpdWNEolVI+WXFV9TMoDEgbTlH/S8+A3JdEMOPkuFBfccgTnqN+BP5rEs4ZV2Mr2SXgn5pBHIlUmu2w+R0OYEsQPX4YkpsbzM4GSY19wfpHzEdsscRBe0GSVyBDyU4v36ixUhtGhcj1mK0EdFDvQybfiBiiML4hDbXWnjoDX8NQAp8oqhN+1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+a7NiOY43xsZhX927/Deu4zWjjDN/+25TD7fqLiUsdk=;
 b=h1RrD5X7rz9NHMTxpWK5mdCX4w/xOnBRjh9+N2EmzN4l1pQH3bOXsEiFJDYjkxcGBRumJHR1Tolr4Krtsyowadoykd3C6f1j1JD3EXsgMHEyNW+Eq42s00ROWFxB9QA/ulJ7c3W1k4RJOvTTN7yv092ck2P2kwzAnZMfcvMfm7M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB2031.namprd11.prod.outlook.com (2603:10b6:300:29::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Wed, 6 Jan
 2021 19:28:24 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1910:aec9:8c56:2264]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1910:aec9:8c56:2264%5]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 19:28:24 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 0/2] Enable QMP Dumping for testimage
Date: Wed,  6 Jan 2021 11:28:03 -0800
Message-ID: <20210106192806.1335560-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR21CA0070.namprd21.prod.outlook.com
 (2603:10b6:300:db::32) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.localdomain (71.238.119.71) by MWHPR21CA0070.namprd21.prod.outlook.com (2603:10b6:300:db::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.0 via Frontend Transport; Wed, 6 Jan 2021 19:28:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e60a2635-9442-48e5-8fa6-08d8b2793c40
X-MS-TrafficTypeDiagnostic: MWHPR11MB2031:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB20314B7930A2D2A721501ED1EED00@MWHPR11MB2031.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0v4N7PHeYp9YihAswxn1CQzDNgoRhNxOkGYtvgEgwtH5aksHuBAoz5ZTa/7xV4LRUsc0cWXJ/TezMn+foJoNhgM5jckc2jP6iIgdMBGOBGCjeanIzDGym7SEKV6ozL5dKIl/cpQmtRzBvHhfcNiAqeT05HhJCrrrj/jkstAmOax/zxm9FpXZPg7RWSopJziBUkVx4jU78rQWObeC7+g5MxP5y48KV5MMFcYQI9RmnXjlkk1BvGeLyctUmPg5g0iWGsBrVOlcP4kFWIDqMAcGvqpgtLW/MXO8v7rgmHxBVqv1QnX0yb2cU5FugCcFJ5o7+xKjYOfAmoOZqOdv2eI8mfUeTCc2nu2VZkNAxIeFbQ5DdfH+r2+11Ov2kInjzKEqDprBXlHBe0WaVEqj1qUzCw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(366004)(39850400004)(66556008)(66476007)(6916009)(5660300002)(316002)(26005)(6506007)(2906002)(66946007)(52116002)(8676002)(83380400001)(36756003)(478600001)(1076003)(956004)(2616005)(8936002)(86362001)(6666004)(6512007)(44832011)(6486002)(186003)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?+tD9JCUddigcxszn0y9Nwc0XRXpSS1PWFc7BC8+JHLrwMj5lXed6w0n+TUfe?=
 =?us-ascii?Q?TDnW1vCg+hGqGVh5aVCG///AS6qhQoh3vVRgCGU+yt7W003meNQ/WCFNpkK+?=
 =?us-ascii?Q?3BORN0dwJjK1OP7EXHtjpAQCfMxM4KyAySAzthwHiizQRHWeC14kUajjHD9C?=
 =?us-ascii?Q?py55BEhZrClCRZgLmtXmtlonC2zofAjQX+BvUs5989Z8x1YOIan+AOm5r+Cr?=
 =?us-ascii?Q?+ZFwkbeBj40SVlqiMZ/aUermeQb7ytOEXOCRqU3TjhM0jideh+FfV5wr53gv?=
 =?us-ascii?Q?pI+mArs3wb/qEVkv0iEkrtSiWpkWdJFmQrNn0pTYcppRxKEIJMApzlEfITLh?=
 =?us-ascii?Q?f1ELSMxXM1OywepMWxzyERHJoqvsvWs260937fS/NrOw7LIN1nEaXkf/SoJm?=
 =?us-ascii?Q?sG5V2G22vSsLl2u6nHiKIELR1K7kIrgiHzGZDSMrt8dnWkxA+boE2RxPsNpe?=
 =?us-ascii?Q?WJkjzwnL00BOlcYm3s6KvC8MDVeDUqAVIa3j/ux0J6D6NKVz+E/cPyfhifYO?=
 =?us-ascii?Q?4IHFo+qZP1ChhnsYKQsKPK2df0weGdT4iBCbtL93dA38uqxOuB63XOyquhin?=
 =?us-ascii?Q?GjgdhZUU55OzUp0VkLLzXolzle2kGafWlSH6LhMBg/OSjXMJ3EH/II2/6ytQ?=
 =?us-ascii?Q?SFJqUwyvg/8JkO0Jg69qhwh8D8Dc2407emZe7XJLPUD2FNfcsOacUecj7rsg?=
 =?us-ascii?Q?ZnJynzJ86IA2JFwjdCj6hQsneNPA53Ae3m6YASucWPkQPNA44J6jTp+7SrOF?=
 =?us-ascii?Q?/P6cKq0oywrXF8YdLwNGwzkLvv/9UHO0DLYuaaMhCQ5VFfObcLpT0tsCRtNi?=
 =?us-ascii?Q?u0g8eFw/Lo02vp5jjIgsdNL36A9NKumUnGVLEVc6tJ2PJxDNrFJhNnJpe+w5?=
 =?us-ascii?Q?ijWlDfqPC+z6/Ssw0tFMPQBCmumW8BGl4kzBXs4poBTZU/H8yl5LCpJ4sM6/?=
 =?us-ascii?Q?JSEfSbC5+3CXUIe/e4xn7thMIY13Ur7oOE46/kJXoaDsVsHjwGMAxpG4Z6ol?=
 =?us-ascii?Q?NjJa?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 19:28:24.3719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: e60a2635-9442-48e5-8fa6-08d8b2793c40
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HzXLNO33+1j7ECE+mqh01p4bVWf0KLeU1MvPRf2b2xGWhL9FwTWr/3QRsriKFFcZOZpW1klBgUyu0JZx4m5AzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2031
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This is the second pass at enabling getting debug information from
QEMU via the Qemu Machine Protocol interface. The Qemu source provides
a qmp.py module which I current install in tmp/hosttools as a known
location. I am sure there are various possible locations.

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

