Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.64])
 by mx.groups.io with SMTP id smtpd.web08.7882.1619448326636311072
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Apr 2021 07:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Wq9VAQtN;
 spf=pass (domain: windriver.com, ip: 40.107.92.64, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OB1jqDFC1Fx56U8EpIy0pwddU1G0rUbjRyUcavfvajpEvptXM8dUmxO1u0BvrJgWvduSG7Web67B2K81GR4LXRNZr0QplxzG3t/IopmBIXLSRNhUZMt2rdTRq7NsVzX8nM/OyueMJgnW1rc296tJx+n1ttHrGKCRK/ivXZPxGXBYvO4zDQMBb7n0ZeELUxXk7tVFnHQMxM8+yXrUCq4ekNmQKmrkq0WWvAXEMuBRmsoL7qC+vKumkHut7kU+SgWXlUS/ERMLasrLUIGPWmb1uniApPgCFBktuskSc/JBt7oopI6B/pUGdSd7ex7bUpQMdChUYZFJWLwnPbIki4g9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uAX098XeNJaE7cMPK+z18TUrfGdBw8NkaUCHoVi2yM=;
 b=QrfPcMd/7FdWzXRNG6X5en6MYCWsXCb3//jFmSnfgqJgFRJLvipeozHZ0dMDZIC7Q1ZwjNbMpzprxAirNBXPlJ0Phq17L5HBeDiDus8zT/w9SN8/4CAX0sawsAKu2b5+eGrlwHJwwAUICPcImfXGonGR3PDjgwchoNHY27OZfXLQiY+bhwFCAC78J5k5ZDhw36PepoOow2dDhdPI4hoPMr7vB4k4lz3UXX/2eDMeabFl6+Dke7W5NYsvg7767CKCiR2kUmH/K/xapKSP8+TB6HLwEsxdR9bkjaa36v+7zEHkxi+xnmdFuU686x1RXeXeTPy5denaMrfnVFMjdqBFJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uAX098XeNJaE7cMPK+z18TUrfGdBw8NkaUCHoVi2yM=;
 b=Wq9VAQtNVyLz7AskGMJvbOZcYFZ2fouYVw4wgQKRFkGUH9uPuTPht2C0m3a86PWhKcD8O8MdDe1HRBBw6JeHuULIPT5t0Z+VkO//DVXREtAMVWoRjA8YdANxR5JbDEIchXq2LzOJhaWNjadKKHVBqXNtFZ5BGQLwdz/YYz0TLl0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1981.namprd11.prod.outlook.com (2603:10b6:300:111::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Mon, 26 Apr
 2021 14:45:22 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7%6]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 14:45:21 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] Enable QMP Dumping for testimage
Date: Mon, 26 Apr 2021 07:45:08 -0700
Message-ID: <20210426144510.1568305-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MW4PR03CA0164.namprd03.prod.outlook.com
 (2603:10b6:303:8d::19) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from soho-swold-l2.corp.ad.wrs.com (71.238.119.71) by MW4PR03CA0164.namprd03.prod.outlook.com (2603:10b6:303:8d::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend Transport; Mon, 26 Apr 2021 14:45:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc4ee756-dfe6-4183-e41b-08d908c1eb26
X-MS-TrafficTypeDiagnostic: MWHPR11MB1981:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1981FBCC7379CCAA49D54AAEEE429@MWHPR11MB1981.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	601+TFc1PVEjCnJRoCaPSGbZuor5y+SVR5W4mFBFO/QNq+modLZWOKuLI1KAcoTApaWFX/U7ZffjRL0PhsmwkbgwCxzzI05N299MFPtNCh5oVkmvuLnvfzc22J0O+D5qoKJIv1DkFQhrtZ+y4p/NcNZ/BLL92HMnxDzqq/Z0Or1G9CYP157ErK4SE0+AGciF2s97cvvnLS5fWa3VtV15oRfRNDVqMcm02TirE220q2rEnmSrBT1lx+bKG0gnBcyRMSgAc3GQREYndjoyNQ74PrvVB4npO/ZkZWIr4a8r5HZAvhQdFKW5KABpMZta3aM848mVJKPxVTtbv2yUbmi6sUePJ7IlQkAlA5Mim7YZHUbx7hunNASTK/r7hgQUwM5J7FkHNtXFx5oVbJkCXviL2+HK3mDXV7sc+CyciQkKSd2hGNFEJ7iB5dqPs84uLNh3eSEnOKLj+CfXOZ6SnBN26V9ew61CFp9x0KNnQdrQSm2PybaxyHMnZGQMNakbBeGNHTg+KK7Bsiz6YbXqCY4RuWS7QqS4/ZbwLhpw+OCVVjXBQDHrZUB1xb7fzwPh9Tp+iIR8JvCYXR539Pq78EURzquASPISgAJaietOCr8RG6HpuHCihBWlK46rPkvhy8Zq7ldFMatIUCNv0X3WEYJGaI2ZlwP0uqWa8sFymj/P6XA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(376002)(136003)(39840400004)(2616005)(83380400001)(86362001)(956004)(6506007)(6666004)(36756003)(52116002)(8676002)(186003)(6916009)(26005)(16526019)(66556008)(66476007)(316002)(44832011)(478600001)(6512007)(1076003)(2906002)(8936002)(38350700002)(6486002)(5660300002)(38100700002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?7YK/s3Ahkb+jGiUusJeiGUpt8xRt6ixCG0ubx5M8LjZkd0dZ93/4dnf0gpxQ?=
 =?us-ascii?Q?WYgYbTjRF7MIaeA3Bmr8WyUmFj3tS0h9PWS222rzdS1K9s8t6RnUeoK+grIT?=
 =?us-ascii?Q?QtdPjt4952eu+8XZcMgU286z8Hug5H3G+gH26JmJMZ06oI43TmHQNB5YPx0l?=
 =?us-ascii?Q?M//2oTMh4E2La+FuugAj5tKPo4QZyUn7gvivdWShWz9aO9IJrQHGfP1dnrkq?=
 =?us-ascii?Q?WTlLlxYdVWha1HbQdws2jl1B7OX3R7E5g5THw52vypGHXUql5SeI+tfksaZA?=
 =?us-ascii?Q?s1dBzVnWkKF7D2oDY4ZPbPltXEtPp3JXMLmvlShVnF7hRSHzkK74UWrjZecE?=
 =?us-ascii?Q?y/R9OZzgRwu0v2i3o42/HpJdMuN3VO5qCpPj7FmH6o55gdYCt8i5N9BIfz2c?=
 =?us-ascii?Q?yFns6hlkRfMNxWRwkBeMd48ERJlt2lTw/KwZVUVMAuAiKL4Wzx9QfcG+t2on?=
 =?us-ascii?Q?YpGEZZZME2FW20ExRwxqHPDC7KuvQCUQKKQ1s9n/KrasfyY6loV4I+Vh2hKE?=
 =?us-ascii?Q?joiA9PTSjzCX6xRDKKzTKk5FTUA5/xjuPpQZJ+ZrSmScMAfs5IG4VacUh2rY?=
 =?us-ascii?Q?R8NwFbIr6ht/QKWHQY4z0Fn3td4XLn0uk8jjpamag9/kvSUAyX4YhjiDaxRo?=
 =?us-ascii?Q?nMJ48vgX5NqqTyN252PBGmoh0ri23nkcRcpVzqxRLtX/oSmTWU/JcALyu8JH?=
 =?us-ascii?Q?hHubpwX9ouvWjsqotZSJlYWm25ALpnN5j7/UAflTY9QuqeBqYmx2VIkYo+4Q?=
 =?us-ascii?Q?XtwYwZV/syibKK9AUuMKTdEMAGoNuagGaWfBl67AASuHOo6npP4lDYeBcyxn?=
 =?us-ascii?Q?3iky00E+6YvhO1kB7jWE2VCj7TrN9U8G5zD5xxgR+4I+0YBR+GoBmNKJ4IKW?=
 =?us-ascii?Q?3GuiwgqtqqpBMfDEqt0phlFFn+6ybkNOVfoo5Oee954+c9HPOycaLFq7JS3w?=
 =?us-ascii?Q?cBR3KZTRgBojdlquYJM2+td5vibHXBr1AGcUW1U0y2mOgc6FqenVo05fIKf9?=
 =?us-ascii?Q?6FfpVWmX9EegjsfkKJ56jeyovna+x9Sy+e1Qs9N73XQKJHbrbPe40K8mH4qB?=
 =?us-ascii?Q?HtbZ/HKaS0F60BL0aArA07QoR+/TQOgp9YAkznt1m8T8dqEoR8dfePUq5lMv?=
 =?us-ascii?Q?yfnHVNLtK1uAKDIcJ3faXL4bZ+nOjKX9OLbAnLt+ILbrAs1L8POFHyKPIIGL?=
 =?us-ascii?Q?QVpxZfohirYOeBeWlXtQ92FsdyLR8qQksyRly4/aztu7pUw9ySyDEITq8mRc?=
 =?us-ascii?Q?Do+PS6FOMZD5kM7/B69Er8fa+UVw/ruChmh9LposoCNgkSsBXm1NZmhrlhUe?=
 =?us-ascii?Q?7OdfC4LmGMWV7nUG6Mh0FXTT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc4ee756-dfe6-4183-e41b-08d908c1eb26
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 14:45:21.8253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+FW7vjoVpSY5ItPQec6w5LZYNoUtl+Ur9zrJKTqOdrKNeFOIQknk88ndFm1P1QDwLTqK9mFAF/B2JQv7sWsTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1981
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This is the forth (and maybe final) pass at enabling getting debug
information from QEMU via the Qemu Machine Protocol interface. The
Qemu source provides a qmp.py module which is installed in the=20
recipe-sysroot-native site-packages.

The initial commands that are issued to qmp when a failure is detected
are: query-status and query-block. The output goes into formated json
files as follows:

tmp/log/runtime-hostdump/202101061054_qmp
=E2=94=9C=E2=94=80=E2=94=80 qmp_00_query-block
=E2=94=9C=E2=94=80=E2=94=80 qmp_00_query-status
=E2=94=9C=E2=94=80=E2=94=80 qmp_01_query-block
=E2=94=94=E2=94=80=E2=94=80 qmp_01_query-status

This has been tested by calling the monitor_dump code directly in the
target/ssh.py code instead of waiting for a given failure.

This version adds a time-out loop to check for the Unix Socket file
that was being problematic on the CentOS-8 builders.

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

 meta/classes/testimage.bbclass                |  6 ++
 meta/lib/oeqa/core/target/qemu.py             |  6 ++
 meta/lib/oeqa/core/target/ssh.py              | 17 +++++-
 meta/lib/oeqa/targetcontrol.py                |  3 +
 meta/lib/oeqa/utils/dump.py                   | 31 +++++++++-
 meta/lib/oeqa/utils/qemurunner.py             | 56 ++++++++++++++++++-
 .../qemu/qemu-system-native_5.2.0.bb          |  5 ++
 7 files changed, 118 insertions(+), 6 deletions(-)

--=20
2.25.1

*** BLURB HERE ***

Saul Wold (2):
  qemu-system-native: install qmp python module
  qemurunner: Add support for qmp commands

 meta/classes/testimage.bbclass                |  6 ++
 meta/lib/oeqa/core/target/qemu.py             |  6 ++
 meta/lib/oeqa/core/target/ssh.py              | 17 ++++-
 meta/lib/oeqa/targetcontrol.py                |  3 +
 meta/lib/oeqa/utils/dump.py                   | 32 ++++++++-
 meta/lib/oeqa/utils/qemurunner.py             | 70 ++++++++++++++++++-
 .../qemu/qemu-system-native_5.2.0.bb          |  5 ++
 meta/recipes-devtools/qemu/qemu.inc           |  2 +-
 8 files changed, 134 insertions(+), 7 deletions(-)

--=20
2.25.1

