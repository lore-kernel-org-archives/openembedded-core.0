Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.69])
 by mx.groups.io with SMTP id smtpd.web10.2775.1591991310440107843
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 12:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@uievolution.onmicrosoft.com header.s=selector2-uievolution-onmicrosoft-com header.b=cKhbXLc8;
 spf=pass (domain: xevo.com, ip: 40.107.243.69, mailfrom: rrowe@xevo.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRSHtBtCngS9Dz25H8T84TQJHTwqHbLNCKwLvJ5+LwWk/IKBQ6nOBW6bz0rlG/k9D3VGeIkcFi5Fdpj2arD+92WbWt3ubWmMwn0s2ub2KIyBGjZc59YLZmZXD22TJWgm/o639tvWkWeUMQqV6RrVikgHjaQTqsZN6piU62YoKWZQDeVah9ekZEOdbN1Akk/SDEiaiJ/Wh/PDdVYZfLXluSoGyZe2wL07OV7TAjtD1MWvMxD2kEoZj38ys/2Eq3Raa/PNXo+GU2CEhq2RldsHyJAzo1IqEQ++0PxYDHv62x+KSxMpoZJta3DQbm7jVOG4oNd3ueNGeVL0XU9+dwyPZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BF/8okjTbLcSwitkUfyS0i0k2FOkIZPmvX01rTIuuY=;
 b=WbFXh37QYMGpvDkmSnKNYn7RXS0R4651Tu18eSx34TYhSSR6nKmbx7wjfEcBrT8u+yQ92oo8tjGcM71qKx0p4QX+1b9AHmQE+De3PSdaqzCgKzJyCPm8tOTcZmFqbhRryBf05/zV57L2HPh16nuySwbDhTCqK4trjM1mTlIY2By0JiEmlxDiJtwyIo5jGuzCOWRClLtO9EAYNbg9Sb9fv2R3wFHJlySWwvYsCbf39FPVYiGQirAFPlETXb4uSpCg0TifuBHIaDNEWThpiw7W+NstKCKGVHPdzF5n+9KNqLxB1FhRGzhrK1xVZb7bq5ZBV7a6y3jaZCM3C0M42hhCIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xevo.com; dmarc=pass action=none header.from=xevo.com;
 dkim=pass header.d=xevo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uievolution.onmicrosoft.com; s=selector2-uievolution-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BF/8okjTbLcSwitkUfyS0i0k2FOkIZPmvX01rTIuuY=;
 b=cKhbXLc8JbSCbZ180qPqOxkIr41BTRFyg+P3eR9Y0n9vMi9mCZiNLcHqDukAQsLi9Hl5NOnHmgye5FgRbZB/6T75kOLPK9UmTXRhHcY78tKeh2eXFI8f9Ydf5EDQ2oDTbMWtdwj7ib41BSpGNLp6NB/FrZ7F2OHrSmbV+/JmfNg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=xevo.com;
Received: from MW3PR18MB3659.namprd18.prod.outlook.com (2603:10b6:303:53::19)
 by MWHPR18MB1245.namprd18.prod.outlook.com (2603:10b6:320:2c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Fri, 12 Jun
 2020 19:48:29 +0000
Received: from MW3PR18MB3659.namprd18.prod.outlook.com
 ([fe80::3d7f:edb8:f540:5050]) by MW3PR18MB3659.namprd18.prod.outlook.com
 ([fe80::3d7f:edb8:f540:5050%6]) with mapi id 15.20.3088.022; Fri, 12 Jun 2020
 19:48:29 +0000
From: "Ryan Rowe" <rrowe@xevo.com>
To: openembedded-core@lists.openembedded.org
Cc: Ryan Rowe <rrowe@xevo.com>
Subject: [PATCH] python3: fix PGO for non-reproducible biniaries
Date: Fri, 12 Jun 2020 12:48:24 -0700
Message-Id: <20200612194824.2360-1-rrowe@xevo.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
X-ClientProxiedBy: CO2PR05CA0080.namprd05.prod.outlook.com
 (2603:10b6:102:2::48) To MW3PR18MB3659.namprd18.prod.outlook.com
 (2603:10b6:303:53::19)
Return-Path: rrowe@xevo.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from CASE.local.rynet.xyz (73.83.210.194) by CO2PR05CA0080.namprd05.prod.outlook.com (2603:10b6:102:2::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3109.10 via Frontend Transport; Fri, 12 Jun 2020 19:48:29 +0000
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
X-Originating-IP: [73.83.210.194]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b25a0ff-58e6-4dd6-41c8-08d80f099468
X-MS-TrafficTypeDiagnostic: MWHPR18MB1245:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR18MB12454579108968819216B419CC810@MWHPR18MB1245.namprd18.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0432A04947
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sPRDFW3LXVwwilqyygnTa+RcMI2p19AIjMnCQdRd3qG9vVIt0weX/OVpeEXJ3CeIa2F9nCeY5v6o1fY73mEUwS50n2ulEs0rJgNH77YEkytIudq2v+aED4rzDIosPNj2F9pX3bfRd2se1d0DnmSGZ/ZOo/8QZTGFRsrzjBL2Go44WckzqYidnePv2XGPgSHjZcfPZL5ZfNoJcl6ufuSHS8unU/4r5ZZfQAZcW5e9WewGA3mIvlJYW8Q+CR7cL1nt2N/nbIgyMrozwPevkPWKP57672sXDyiwhJp82Y0mzRJwjWnMgL7lYX96z6NgsjwQ/DqaxXdEZ/b9KUKaim5e7Fhlv9d/iA75D/X2lUzXclYFX8hcs+31RT/1jqfRCCVb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR18MB3659.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(396003)(136003)(376002)(366004)(39840400004)(6666004)(2906002)(86362001)(478600001)(316002)(186003)(2616005)(4326008)(956004)(6916009)(52116002)(6506007)(66476007)(66556008)(66946007)(16526019)(26005)(6512007)(5660300002)(6486002)(107886003)(36756003)(8676002)(83380400001)(8936002)(1076003)(4730100016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	bSBtUga2RIQPQAt5CqJrCfDsEuCRWoQ//W+P0kYrmwvhD2C1sNSXDWPwQAkMRS3Feqhvna4HDFc7Z34stnf7rj17B2GD4gRmlUQk14XALH7TknH5QxM2WLwWgomhk/vwdLnTTkDtN1OmNRNH2RE58V3ln1vdf1ie5JbhMSoH/5nEveTpmMtqQXsxZBfqJvKT3f7fnfW7q2H3qF3wqwH2h8xr0X4hzNmq6NKNXwYRDmkqOx6Rld9VgkWqB6DOL8e6fEOywFRnWq186GipZ2SrEjfhh/Hvwm86/7wMjXbW0TNqps4T3DUd/Ix1d74DFdg9RjElIjK5awyI+K0Hava9N3pLHRB2zr4osZJfsqfT0Gh7qyDuyDYcGMtPMFVHxN4mEy5QuPn0fRuw+goZZA3ULu5ECsm15NPaa9ttqUkmwb4qNuLV02jWj+yWFobIhq3E7wlGDr8nGGzrxRCQTZOuioovvcZQsnyfRcL7PQDcQmQ=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b25a0ff-58e6-4dd6-41c8-08d80f099468
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2020 19:48:29.3620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yegy84/l15hp5YOYjJ41rK6D4IH53MsPFUZeMG8HIuzfwRvTb+OJTpyo2+rzgoC+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR18MB1245
Content-Type: text/plain

When PGO was disabled by default by e53ebf29, a bug was introduced that
prevented PGO from ever being enabled. At the time at which extra config
is appended to PACKAGECONFIG_CONFARGS, PACKAGECONFIG_PGO remains
unevaluated in PACKAGECONFIG_class-target, due to setting its value in
an anonymous Python function. As a result, the PGO options options will
never be included.

Signed-off-by: Ryan Rowe <rrowe@xevo.com>
---
 meta/recipes-devtools/python/python3_3.8.3.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.8.3.bb b/meta/recipes-devtools/python/python3_3.8.3.bb
index 4367923b55..3261e5fb17 100644
--- a/meta/recipes-devtools/python/python3_3.8.3.bb
+++ b/meta/recipes-devtools/python/python3_3.8.3.bb
@@ -82,16 +82,16 @@ CACHED_CONFIGUREVARS = " \
                 ac_cv_file__dev_ptc=no \
                 ac_cv_working_tzset=yes \
 "
-python() {
+
+def possibly_include_pgo(d):
     # PGO currently causes builds to not be reproducible, so disable it for
     # now. See YOCTO #13407
     if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) and d.getVar('BUILD_REPRODUCIBLE_BINARIES') != '1':
-        d.setVar('PACKAGECONFIG_PGO', 'pgo')
-    else:
-        d.setVar('PACKAGECONFIG_PGO', '')
-}
+        return 'pgo'
+    
+    return ''
 
-PACKAGECONFIG_class-target ??= "readline ${PACKAGECONFIG_PGO} gdbm"
+PACKAGECONFIG_class-target ??= "readline ${@possibly_include_pgo(d)} gdbm"
 PACKAGECONFIG_class-native ??= "readline gdbm"
 PACKAGECONFIG_class-nativesdk ??= "readline gdbm"
 PACKAGECONFIG[readline] = ",,readline"
-- 
2.17.2 (Apple Git-113)

