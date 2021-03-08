Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.56])
 by mx.groups.io with SMTP id smtpd.web11.32542.1615182779257523236
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Mar 2021 21:52:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=S5ECkeUB;
 spf=pass (domain: windriver.com, ip: 40.107.243.56, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTO1MLK+Ndb7PPVllPz5C9JP8wBVEo5hcTlMRmT/znfst2s8CX1IClQx1Z+ecY2qapKHj9SqTE3jzXkwgdj2sOCIKkRG4nVefQsXn1QXlrV+rGXa529HDwYUmR3ZGRx0hMthL8wk/YU9yVfrwwr1pBmhuViDT5h3wmH/V4Ouds+3o7BPaJ8cza3ZZikOtUtYDOI7VzQcXhyxu1hEjb69wAcnIY2c/o1kwqoqvyd2goXuSA8dQ5xvrwu2HgpCmv3rGeFCGhhLkA074NJf3/er0iH5cPwvk2B0NbXXbQGj5h8FFD/uZAkhYSFAf5gD4n5L2yFKXhnMiEBhZ8gZOuCvHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMpLWXikw3BUo9ftfaRzq60ES2TkDpkOtDkM0hDHEv8=;
 b=BGUFfnqmwwKKy6jJ1ndi6yGjLN8c8Law1VMtLfEtatV4Ap05aD0GZ/wNFqjaTc8Iu+fVrLyPNnitCm+aJIGH1NRpyt4R38mLMoeTGzm4kWmPq5REVVZn3Xpv4/sa/cuAkPbxtWPX7lIISzVd+TAt6OUtVH8QUtQIDAA811cNavNxXGp4Ps9jbEL3ERnVx/MiICcZIDc+OK7w/x/M/qsV5gezFUe7pXlfDx9l5B8A7JFMI1dq3/bp31pOeDk79DuN26fwEmCWwNwGg0rQoO+AHTi+ZbVDNB3Sgsb7VDH6jAn9D1dC9k21grDfsQWUs8Y86azsRp/8FAukVGa3MYhr2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMpLWXikw3BUo9ftfaRzq60ES2TkDpkOtDkM0hDHEv8=;
 b=S5ECkeUBZHM8K/XTSpZWT477XtlzjcgdnKk6aH0oCMhrnLNY9D5gHFyR8Mbq2SYd5yiNt67slYWDlK9axOpFcF0X9bHGar2uWIBolzdfe4BETcCpwssL+InifYIFx91HDnNVa40aFIjIhxO988mKWxlg6/TJgpeT6Rlfi2JMfT0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Mon, 8 Mar
 2021 05:52:57 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 05:52:57 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] base-files: exclude METADATA_REVISION for signature computation
Date: Mon,  8 Mar 2021 13:52:41 +0800
Message-Id: <20210308055241.13462-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:203:d0::25) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HKAPR04CA0015.apcprd04.prod.outlook.com (2603:1096:203:d0::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 05:52:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39fec354-5535-48ac-382e-08d8e1f66c99
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5053:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB505319A732B8AEAFC059BBA0ED939@SJ0PR11MB5053.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:393;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+abIURYUCwsU8dU1e5BVyNMY6SktTQCdzruxfpoPntmRWbLRQz7gQf+k6tniOZmWFHwNA9+B/LtgjaoQnGySTqphkkOvZrtCDCMWUYGzJUCFVlzZ79WeSURFk9miqj0xiHWJfsUEOqjMEPZZRBXPaExxC1NB7vczyTkjQqWG2n97+UCsAHeatME+xx25DKSOUhrMX83S1O7vKs2Y3ejP7oMQFxXa6cU8GUL9J4xeujX9onn7E78/jxFNKg/iBGNCiFAdXuOL40lQy1H0LD3z6+7wrt6e82cnDyXVfklCKoiwWS2XqArGzVlW5HSKSCnI1+3HRmD3BWdSyhHoHT81kkvYgDYtr3SPoq+PdvhJ79iov+SriaChYQUZIEGu/Ih0GhcUoVvnUeXrZflIahqRTSpgjgw/hyR6eMx+ajYy+5Wt2iJRnLenHHPvbSbzPwUlyFKRdHraB5nFzPlpeMBfcuoIBNRMy0pgenMqBvsw0ouDgYze2gGv6lQAwCYToVt32N0f/czc74mIsLc/BvT/MQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39840400004)(396003)(346002)(366004)(6666004)(16526019)(66946007)(186003)(66476007)(66556008)(6512007)(4744005)(1076003)(316002)(6916009)(52116002)(8676002)(26005)(2906002)(36756003)(5660300002)(2616005)(86362001)(956004)(6486002)(8936002)(6506007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?qB61Hpw4ZGCHLsSb0xPKH9O9EB2hWyGVDPGKlU6NTp3okh9B+P5ltHRcLduA?=
 =?us-ascii?Q?YgJ1kOq/YdchzK6KUAOhl0mOwY1E17Z4shWLUBqGo0kKb1791nNm/ueJ+GuN?=
 =?us-ascii?Q?LokCjplbPc/r3SDTxg3zzAI/M7IwXBwqxQOUj3n249UFhJSWDd6hvSct4lxW?=
 =?us-ascii?Q?LJNfEGjrfWLVZ4mU1d4Q4/Hi2HLomZ4ME/R7VrqRL7wBAyhwkjn6Pl1Y381t?=
 =?us-ascii?Q?XX8vPoZjoTHeOnsS8yycd8oiUHj3zAv3CyVyD0JrKomCW26OKu03m5IFjRPP?=
 =?us-ascii?Q?p8JaKafSJUaBtaHKjSXaf0Sn64s+mbvKE1/TDC0k4XqruMhDxg4sXoTxXU1w?=
 =?us-ascii?Q?utF+/tbeupmydxaHlGOY3VVNNedUxr3xFqLXX7Xr7uUQ5axach45Axb0dPSj?=
 =?us-ascii?Q?A+pVchZbtES7I+2Xs1vdE+PxLpBL5FnSHbQSdS/AYtkf2VChfjDJl8nu/QDM?=
 =?us-ascii?Q?O7LvkMsjNzvnVaQKtLsvlnWf1lVcI8N4HYO1MfZ3w/ChXH5ruz0NyovkogPa?=
 =?us-ascii?Q?BWFyiXzT23/K5/dkoOsLKQcA+ZZrQmPAkoZG4LNpQZabC0C/51SvczqQC1hv?=
 =?us-ascii?Q?b3ufyTGWLqJpofmnJDK8+/dG6k0d0ny3s0cai0zJbRHTMmaH1TmOh3YvNCQo?=
 =?us-ascii?Q?bzkONqy6dUlM5AxRwBAorbWN87XVk9eHlyPDmwQV3FHSbfb7jeQjYvjEpcBO?=
 =?us-ascii?Q?ZXxlopCyf81RVWcpdrkt8GHiQDVJeH/4w28jkIPRchotm5P3otVCWsfKjTjy?=
 =?us-ascii?Q?G8nvXvNM2424HjhH81Aq2eh2XIcATAIrfUCnR/0jq5Rvuvm0Ww/90nbVKwLF?=
 =?us-ascii?Q?2KdxomhwGOe0bv+L0RZBHL8+H3pvwHxqiO1GXAEUQK3yxYktwQCUFf1RBwLz?=
 =?us-ascii?Q?7Um27IuFPzZRta8nUQDBQqj5kIhAd0JhxtwyxE0FLHhgaBSFTtODhHAXlAYO?=
 =?us-ascii?Q?yGksmu7dSvIcaqzzDQKEKBo2uGKcRqXiFRm6qLS4gIMVu1fC0D/fnot80+aI?=
 =?us-ascii?Q?mJRFsSgLvuD2mM8Fmxdt2nK54aW9z51LDZVYbNuLColCpmT3mhfOIVCHgIrb?=
 =?us-ascii?Q?K72WJhgvPd0ryWvAs+sdNECFwAiKneyOtwibmUR60vgLnZhzKglFx54MIiIW?=
 =?us-ascii?Q?omSivobsumiK6cMFWD8wEn90Kv4gP7hepNICzIRGqdEBHQiJC0TDpG1RKubD?=
 =?us-ascii?Q?F2Di39QTPzCb27ojRX+OoYb9rB/sycZuoUmpm8FG4dDbn+5BGs4z/uO+Z9Wr?=
 =?us-ascii?Q?6QFJuOPhn2oDeQRLqU2qVqRRXLL6iUXI0zPI2ZHvaYlQm+F4U9UQvc68KMtl?=
 =?us-ascii?Q?ZSITHUrusfB8BUrdtgKpNKeK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39fec354-5535-48ac-382e-08d8e1f66c99
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 05:52:57.6348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TwTrb6DZsgi3kKXKl6+1p6jqXD5RhHXEl2xCJN18zuTPtbQH58ZzGA3gj4iN3jvEEc9soBnsxa7ZOWYnG6s2qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
Content-Type: text/plain

A previous commit changes poky's DISTRO_VERSION to include METADATA_REVISION.

  """
  poky.conf: do not write current date into distro version, use git hash instead
  """

This results in base-files do_install depend on the METADATA_REVISION, which is not
expected, exclude it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 94299431f6..338e75580f 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -144,6 +144,7 @@ do_install_append_libc-glibc () {
 }
 
 DISTRO_VERSION[vardepsexclude] += "DATE"
+DISTRO_VERSION[vardepsexclude] += "METADATA_REVISION"
 do_install_basefilesissue () {
 	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
         if [ -n "${DISTRO_NAME}" ]; then
-- 
2.17.1

