Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web09.6275.1607420609895827439
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 01:43:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HfXbcXWW;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0TKRwFIOKE+4t0AQaX2KoWLWJg5RVbKGVn/TPFaV6pM4JFr5bljTTcqg10Mfv9ryBj/T705jHZEktLrYC1X3f3XMMaQV6HH/V/1XWHv+8emSrYqWjT4dfvw2R52BxYbsJHq23PjvFj8+w8zItNUdiXA3FHhbsa+ajTZSiFKNajDV3oyEsWan32FF/IIIKw1hhPqY2juGgeV978Sv0POMRrcHvpgcnFlPFQn4uX7xSr0vum9T4LHRnFC8ykQUk/UbfL0JeqrDAMS7iXqYIkp1esxKzlzQGfECoQV5EVPuY0O3gw9JZ0vWh+QzX+yfsYMMdb8g6IbxoffZw14RQC7lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDnoJyniVRL6KbOCRyb+X9VnHiUW0YSGvRj8oml+oO0=;
 b=FEeTzNQGuE2SKqjLjcwQA0cw2b2y7IWahbSUEqzZVeUkI3KZ+UvcM+obC/iHPtXYAfUohYYMfR/LmgeyeWydUArgSW/luDOmdSI7XCFfzsjCYMugCHg+Y6ypkhWMOPLqozoszWEyatr+Z6FiDMobGarP9JT7thcGuQUxDeippT3wXQxFr6Ogg7TC1Sn3Ih0FA3lKdip6lXRZ1MP0XM0FDaC+Ogb4kYe1N4dv3UkcZFjAaVBfLoHMcfb0EExIbRCVKmmr9R4XEzuV81gQ8UVwEuvI8MW/aJZMr3oz6RZQzw++ucfI9pNWENcvRJyuyROo0qF+hrDJURTfcjywmBo2Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDnoJyniVRL6KbOCRyb+X9VnHiUW0YSGvRj8oml+oO0=;
 b=HfXbcXWWRhr5h6b85ad6UJ0G0D2Mk8iXxmJG+gqjOBxOWJCT33mApfIYkMK1aroMj0Oe7CqsSNVMizU2h0w6v4tCP45AZ4/n422y7+qrDquKP5TAm0jKBThXTQ0jxA2ijLom3Mjo8Ed0NdR9NIhaRglcmr1LYOCO7OMmNmJ0Ck0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (52.135.126.77) by
 SN6PR11MB2814.namprd11.prod.outlook.com (52.135.90.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.21; Tue, 8 Dec 2020 09:43:29 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16%7]) with mapi id 15.20.3632.018; Tue, 8 Dec 2020
 09:43:29 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] buildtools-tarball.bb: Fix PATH for environment setup script
Date: Tue,  8 Dec 2020 01:43:13 -0800
Message-Id: <af469d1014584f3a8ef3b46e5373e9eb0841efc1.1607420550.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607420550.git.liezhi.yang@windriver.com>
References: <cover.1607420550.git.liezhi.yang@windriver.com>
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::34) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 09:43:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73710788-7262-4c8e-2134-08d89b5db80a
X-MS-TrafficTypeDiagnostic: SN6PR11MB2814:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2814A7F3D3937DF4F51D85F1FFCD0@SN6PR11MB2814.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oyw8Wfm2t8ZAdQMu6AMDzHKQooxlap2xBOs7Asir7E0w3SwAHdR1hUExwsnYN8TV4KNIkKBY0SWY6t7vIX9O9b4nydKTtGI384CHRtQE1rjiYICLg3nvZvuxXFslzd7IsE9IFUqlcTy9TVqlvasdNKTpQSKH/VZfDke7oKwGLrrQv1gqtR42KofaNN/ZYCKmt6c4BQfII+C1kHu2NSKHpTtD3PD/PBlGQ2qYdhuhrHfHKoLhGrwVTA2zN2vKZ25v/Hq6b2ur9EOCRw0FJxNYQWvuAx+k/OuUj9Xkd7qRHeyZ2JUjh1K8+k6rPlx++vAd21fRNzKUxrjVuYCpHoc0QQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39850400004)(66946007)(2906002)(66556008)(8936002)(26005)(83380400001)(6486002)(6916009)(16526019)(5660300002)(186003)(6512007)(52116002)(36756003)(478600001)(6506007)(66476007)(2616005)(6666004)(8676002)(956004)(86362001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?aEmZq3W36vprdH0a4JbgJD/5qjG+Zbb5NaEswl3ikbUzEhXgOPi9BsT9/OWy?=
 =?us-ascii?Q?eaHYlewL5VptPbPl/S4CTUlW8FTlz50SR+STlKu4vAUYEOyix7cJT3iJIvMA?=
 =?us-ascii?Q?uSfVKGj4VVoy2wOD3EBPWW9eFBMP5iNis6/DvQMuhjFUyVa0mYIvXUxFK5QA?=
 =?us-ascii?Q?sPHn7TVvogf58gnNEZ9wZOMxSwpUghGgYOC8gnRQZTyDqdHa+xmzaR3z17qH?=
 =?us-ascii?Q?ztJyY1HVk1cO/ciX/xG7ZVz6PQmBqVfqo+xd9QglKtAyvOLhrwZ5/FC1L3Uq?=
 =?us-ascii?Q?DJM+T+JFYtxzyGPVWHVdaELFPDFb/i4tJ1x+CtbI17DK27j2J73iMjToBE9+?=
 =?us-ascii?Q?5/WLnpFQGT8sfHf8VC+PQmDv1k0JY25XAi1bSj9N14R4cvrjywndEdTzXxz5?=
 =?us-ascii?Q?bzVEUUMN3xy4IYfqQ79KZVPz+38/6vVxdWYKbfoIN3BUViEA+nvhMEe/ijzW?=
 =?us-ascii?Q?dtQVLUAqzVdGCbDT8G1ca/tvp7qq6x/OKzSuJQfafQKZO3BZb3v5nyH0hjUc?=
 =?us-ascii?Q?SDWcOMAKBjToIulsZd0ZI+3uqFiuFtD39cL5aD7rkUXetIYQd51C4etkVm+P?=
 =?us-ascii?Q?TGhzgoV5iBCs9m+1czt2JIWEpIhKN3mUlprf9KAlbf2S1E169+ZytJ2siwpU?=
 =?us-ascii?Q?QnKE9tqk/Hio9hHXdv0+VHHtSQeX5kuJrDFA4i3Dtl9Afk9zrs6yAQz4TkHW?=
 =?us-ascii?Q?tiQKLB/hM1Miznt9oyV6oWB+tBTxZ69wei/O1wv/io/3SxOI+Mz35xquzKyZ?=
 =?us-ascii?Q?h5g6k/Iwh/zVwf3FwskKMf7lcNBppvr5UhAsckKpuMl5xfsORHiogLYIAOp+?=
 =?us-ascii?Q?q98m+e66WZN45xX7gCu0jlajscGFqBI2Q26F/pL+bouxYNO//bgLP7T+vd8i?=
 =?us-ascii?Q?crVlfzrGwRE2ge7EA8OXdF2rU+5K8od2oS4+rycVfCmKP9cOvnAxgAh6YNvh?=
 =?us-ascii?Q?WsElobMR+qMeRGlgJk5yQCV3MBQ7+zqHh8gAcMbgrVdeccCtai2k4WSdkI8R?=
 =?us-ascii?Q?KD2T?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 09:43:29.3791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 73710788-7262-4c8e-2134-08d89b5db80a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bAAJum/4J51MT8e9/VjMD9WDqBHineFK/oA9ZZe+Y4L9zDFHGMcVt5vVCXA9DPhb245jRsHPh4xJFTc+PXWwiSslBj6v/mMDwGOUQz+HRYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2814
Content-Type: text/plain

It only added ${SDKPATHNATIVE}/usr/bin to PATH which didn't work when files
were installed to other bin dirs such as /bin or /sbin, for example,
nativesdk-pigz installs the files to /bin, now fix it to keep align with sdk's
PATH.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 560b8d67b9b..9da81d55235 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -67,7 +67,7 @@ create_sdk_files_append () {
 	# Generate new (mini) sdk-environment-setup file
 	script=${1:-${SDK_OUTPUT}/${SDKPATH}/environment-setup-${SDK_SYS}}
 	touch $script
-	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:$PATH' >> $script
+	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${sbindir_nativesdk}:${SDKPATHNATIVE}${base_bindir_nativesdk}:${SDKPATHNATIVE}${base_sbindir_nativesdk}:$PATH' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
 	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 	echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
-- 
2.17.1

