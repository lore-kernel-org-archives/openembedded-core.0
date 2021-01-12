Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.47])
 by mx.groups.io with SMTP id smtpd.web10.14.1610493101961372097
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 15:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kcvSVPn9;
 spf=pass (domain: windriver.com, ip: 40.107.220.47, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IopJBBnSUfE5XRVF0ZXZDCAYKdPWVTTpVA8trRWC8wzDqhHEDotVXgqrdgz8sd9clZ5Wnsa/mwppAh/lweNZl3xW395WcrgK+pk9rlMF+hw/vB/GhI9fPiwRlDvQlQoNLdpzRRHOq2NLM7QNxg7HB9kJIy2hDnOhN0KInC2CVgC/WYjwDZ3vudLZgHWmxTYqTy589vz+aqbUdwzAhmi2x43fu4D9Dhg0V+K6erYGLJFsEjrB33rI97jAYVyzMbx8Gq/B7WQWyaMb0Uf9hue4nV2oOX3+Cz9v9TLQT1z2TQCOTQo1HLPbCWaXlNBQE3vg2QusiccxQ91W0fvkjXwIAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqWqhSbrdXk2ieBwpQx9fOSIsQW1wRF/hfSo1m6EaOw=;
 b=FSWvqsvFjqMhELsAcrpWKefy94LBgXITeI5crBAj6b94h4kWlLdRtxl4NsLJkprv61eaSklzraYhdBXQ6oWgs4btzFhC+1J7LzU1LaXz5sTrfWxMV5YvyTEUKq5kXz0fd4wjEgAIjnWnKbIKb9SE1BXg3Lo/b3onJf9BfAASKYwnR8iVjWYVW9/xXJHgGUjp22qrBKQRQaYzWfcmPrl41ay9Cp+WEI2jeaTYhwctLe3uw421NReCbHdSboeM2I4qF8snv/XfC7tIh/XYZYRunvI3mmiYL8hprWsQmIxqOSbETSHVNa36cwkww2eCv+nF+6BObZTaEDeIQtcx0YHhcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqWqhSbrdXk2ieBwpQx9fOSIsQW1wRF/hfSo1m6EaOw=;
 b=kcvSVPn9A7Yp7RnakkUkhQYv7bTOJ6Uh1ivNlb4bIyB4jRFGA+Tr5SOU24mLsI89gszYisUJE8KLsLwbVTvX1udAmrNM8URxZj/KAzbl233UbYzJgY3DAiJ2fqN2uNU6nXW9Zar635KBflOy5ZxYKqCHQx/zmM1V/hMnv5fNFOc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1534.namprd11.prod.outlook.com (2603:10b6:301:c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 12 Jan
 2021 23:11:39 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1864:f651:3f8a:f71f]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1864:f651:3f8a:f71f%4]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 23:11:39 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] Enable QMP Dumping for testimage
Date: Tue, 12 Jan 2021 15:11:06 -0800
Message-ID: <20210112231109.4048330-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MW4PR03CA0389.namprd03.prod.outlook.com
 (2603:10b6:303:114::34) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.localdomain (71.238.119.71) by MW4PR03CA0389.namprd03.prod.outlook.com (2603:10b6:303:114::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 23:11:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22bc61fe-4178-41de-d419-08d8b74f6af7
X-MS-TrafficTypeDiagnostic: MWHPR11MB1534:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB153432432AFDF44D5CE3AB37EEAA0@MWHPR11MB1534.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Nkhndtlm9+uvjeywxYVsgB5Vj+lMtO0hzB6VSe/MDc6s4KhSASoF8a8DcqMX/aTpuwdrZlgHIkn6ZS0s4CeuJQcIcnByp8DgJhhB8Dfhgy9+USaCDb0NeffMt0rbUbcPZVc4eayd19WriAmj6b74MtJ3qyrEhLUOG2iXimeNjullYUHGgYQ3x79x3EWeX9LYuj5NglQrn4/aFWqgWZa3eH7p315fhPfE/FPHPbk/yi8Iz10+iDCczfLr/19XMpKLFhmcTfm9/4ebomMs76Hzo/3yI7Q/9bIgrcIwxWeOoDZ20O/UTKp4nl9OyHb0njAZlqK/88wMfxEgdrJC/1Z3LLV7pOMSm75gbHPBCaL9hkhKNpsFxGdMQa7RhkX9jEKI1ypw11Sh8Td1o9Aqrmlaaw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39840400004)(396003)(376002)(366004)(136003)(186003)(26005)(6506007)(16526019)(66946007)(83380400001)(8676002)(36756003)(316002)(2906002)(52116002)(6486002)(86362001)(6666004)(956004)(478600001)(2616005)(6916009)(44832011)(8936002)(6512007)(5660300002)(1076003)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?0Nl6S9jbCutEDXUSyuYF/2RTL1uh0HKUlfV2N2jP7ZxbpikGwl6QvftakQmb?=
 =?us-ascii?Q?eoK/K6chiX7ymB6fnK4UT98w9FXtuO50dTcNV6jP6w6PUOe9vkCZSyZIr/Iu?=
 =?us-ascii?Q?I1neoXa998K3ym+TdbArDZKnSCW4w4K2S3F57XDwH+gZpPGufy0wbXAE22TI?=
 =?us-ascii?Q?IdsT+rjUUFYFYR/rB1hyMCSFdt1jJm6zoevK9yXO70cvBlKWcAPdmKNx7x0a?=
 =?us-ascii?Q?ANNRuvHBpYbr7weLygcPPYyNyZzShvFJUN3Bw3K5rvQo7lXWQ8oNClvnaqTP?=
 =?us-ascii?Q?UNW2BbaW5GvX9x3Z3vu6jCiEKWJFbNZa9HtTEzrFia+urMOm/mKkGePlZk01?=
 =?us-ascii?Q?DRt4WKbvy/7NanE/BD3dGpUupAJJsTt7fFNbCxUONk4XG8tQOnZa21M7xlxK?=
 =?us-ascii?Q?te5frLrVsAvAQYyitQUVOp+2au5FReUzVKlHuhPurPxmkcp1eSJenF2i0X77?=
 =?us-ascii?Q?uWj6MIfS1/Ouk0qdeS8tQ3XUJfolS5Htj5cI2rvOP0hZi/g0v/j3ldk4KGFu?=
 =?us-ascii?Q?Zg4BwGmPPTmawS2iFiVYD/c4KSeEp4PLewIcNcD4gzCltNRXOepAP88omAzS?=
 =?us-ascii?Q?Rupl6eUS/si+N/A5jR2nQ4GSsajtrZ1n0/dpnV7WQ2cvH4/zLZfG2qpQhdOu?=
 =?us-ascii?Q?F3Vi4P49JW7qpIT4Fg3dMFYwOBBXHoHbfx1qePP+yGsRa3wEUJTN+MFpsvTu?=
 =?us-ascii?Q?Ix2l5y2mMtCAsgXrWymZ+n9w1RHGtZt+mOMwWEZLtek803c5HcP7UmIGI9I3?=
 =?us-ascii?Q?ZXmv7giYp9HvsjsiBC2/EFqvhXckp6O9ulJ7G9u5xQ1geOER36Gth2rtTrZu?=
 =?us-ascii?Q?KoWKiozPI3s0sz+gwjTVDdpztnBDJLp9IhTGDpO/xs+oGgg1D1iXt14hDpW2?=
 =?us-ascii?Q?EbKFPovArzpOZ6bqxt/isbRUbxp9crasjM7C5mQJTncLWxWkrWQu76z7pyVV?=
 =?us-ascii?Q?Yqlo5WYXg0L4g9Tx6u9stLbgiufviihX2dXW8RoCzXAKMaWsiwF14Dh09PLk?=
 =?us-ascii?Q?w3aR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 23:11:39.6795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 22bc61fe-4178-41de-d419-08d8b74f6af7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvEObGSNLxdfGjW1suua3T/wxnRLK7TkJ6BgJBeRLkB5vYddnUjmKAmojo5SZEYbiS/2H+jKMBPchHj17HlMKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1534
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This is the second pass at enabling getting debug information from
QEMU via the Qemu Machine Protocol interface. The Qemu source provides
a qmp.py module which I install in the recipe-sysroot-native location.

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
 meta/lib/oeqa/utils/dump.py                   | 31 +++++++++++++++--
 meta/lib/oeqa/utils/qemurunner.py             | 34 ++++++++++++++++++-
 .../qemu/qemu-system-native_5.2.0.bb          |  4 +++
 7 files changed, 96 insertions(+), 5 deletions(-)

--=20
2.25.1

