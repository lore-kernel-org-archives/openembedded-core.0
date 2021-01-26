Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.52])
 by mx.groups.io with SMTP id smtpd.web11.16040.1611682280660642658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 09:31:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Wu4CWc+g;
 spf=pass (domain: windriver.com, ip: 40.107.92.52, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fyj68JajZI1/9aUP6zROomiqlyZW4Qr5or7vSMf7M98xjXAdmSLWzwbcn6piV7qAYZ6rkynVEq/Sv4GIfbmM958J0Cns1wi/7DV4DtTvCuDbgl33d4KUZwgwS2uDNAS47UQqCqIpnvjwmh3NFNKsC7rlemwjl4l2Wz0D2Wi7i33DHpyWJm+v+nAm65OT6vKlHLUxL2UxuIiyKBxiScw+HBOxdnPbfOviJ2Ma5eALh74q4V/lxyRo8o43zpn7pH0gUfyZ80ppP5L61XbF1PVCFY4/8BawwsAlUCgoJ+tB5DqPFWCfSM41ecF1IcljL7dw5GpeQ0FJB5KEvIxO4HRr3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7W5DtxgC+b9ZfT8JLOgx/nawPJkt2bs6buWgRFfFWSM=;
 b=OyrQ1D4Yk/CwhydCo0IrSzyg8RTkNRYP/ixx7QrYDYJ5Qv9UdxTzeHAOcgySvPOZk8BmD+vsJXE7QYKx2OAOnFOy/Euo+HNSNYvdW61hzIxkM5yTPrqeeOcvbyzgRWGYMk2vRIzGuQh40iqMuIt6xATx9NVm+/YohRlka+fg1NotaVZcT4GuHb8Jo+lb2/eyAKg7e6kg6PIOa/DSxMK0HG4IPV7K0lvOcwRTicfot8w5VV5fVw9n+NEQHNm4WGr2NL8Aip4zroEEop5EbhAt7pAar3coANe7enM143CTl+EKFUnSTj1sCipdSw/sJWxuC0ZWNJgb7RF5DxAA5mYRag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7W5DtxgC+b9ZfT8JLOgx/nawPJkt2bs6buWgRFfFWSM=;
 b=Wu4CWc+g1upDwlVKFBtGDzYY1m8i7iBVBzrZ9T0j9DHCPWus1T1yW3G6dm1G/2ODSB6rkDsCYq3fk9IioNxnHHP4/c6rlfkKe0RkvV+O5HgsE4zFWNhgBwCEOn2D4yFsQXLALWIq0dZSyNFzYWn+gbz8EIsXi0pd54ixWTJbj3A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1376.namprd11.prod.outlook.com (2603:10b6:300:1d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Tue, 26 Jan
 2021 17:31:18 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1864:f651:3f8a:f71f]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::1864:f651:3f8a:f71f%4]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 17:31:18 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] qemu-system-native: install qmp python module
Date: Tue, 26 Jan 2021 09:31:06 -0800
Message-ID: <20210126173107.2204111-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126173107.2204111-1-saul.wold@windriver.com>
References: <20210126173107.2204111-1-saul.wold@windriver.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: CO2PR04CA0059.namprd04.prod.outlook.com
 (2603:10b6:102:1::27) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by CO2PR04CA0059.namprd04.prod.outlook.com (2603:10b6:102:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Tue, 26 Jan 2021 17:31:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 832ec0bf-7b65-4d3b-9726-08d8c2203038
X-MS-TrafficTypeDiagnostic: MWHPR11MB1376:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB13763811D7D9E4145652E077EEBC9@MWHPR11MB1376.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Fp3potJAlpRH5bfO6mGmjWUOth6iVYqyUVPppQ0CNT7z5wViS3GooA2ee/ygVqb8XIMtSIPgxhQN5qdPSLA+FKXusAwgAE7oHQCRStCs9xBfdyrRh6XWfXNOH0dxMfwpytpRSgBG0i+h0hpe+kpcMB27VInAjWVstJYdZ8JKKQQuFx2WkIk5JghUvc2nX3fqeKOWpThSN8sFovbIK+Q9zQ2MSAf70G/9VNhSAsmLVqXEiZokCQnnwqFBly49SdYOvtYHwo+MEWILPhRf6gYp8wYFxP3zpOzS4n1hj/m5VWkLqiIo7wVl4UVb/gk+yoAVpjogCRFR6d5PjrfDDrGzfer6ISIQc1vCq+pcndodpclXQeTZB2Xa61bsMvZrBZIMVW9PQSv7XqiC8ldJ+mHIkHjoQKcLmoUkNMmeVl+VaF2yDgWz7AgNI8x6PzzW9g9PqzGdV2agSyBgXZXMHRo0DpYgPijiKzSSp6ot7ZHGoJMSVwRXJ4l3RwmYba3nKCvI4dxtFRYtAVbpoeF5q9XoDdoxWozn05eKOVsLZB+wAHogIOUL+hb8W/qWKHpMQk0qVOEkjWeJQx6socaMI1POCi2CrgsABEHEdNXG7+3CGh8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39850400004)(396003)(366004)(26005)(478600001)(6512007)(16526019)(8676002)(2616005)(6506007)(6666004)(44832011)(2906002)(6916009)(66556008)(66476007)(66946007)(1076003)(316002)(5660300002)(6486002)(8936002)(36756003)(966005)(186003)(86362001)(956004)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?ZJQ40+e0+2DAfqaB7W8FHArDFFkW7Yi42u9OvPaFnfXGV034FLEzTML/7dC3?=
 =?us-ascii?Q?OCtJlrvT0Nmss7Y66yxuVRezoV/PRoAjmQXI8gzuGmG2eiEMWk4rCbmMuMGr?=
 =?us-ascii?Q?3cUhG4vHtECizrz/q2LdDP26VsfOI5YOzRYWr+YKcH879FJslWWtskGu/YFh?=
 =?us-ascii?Q?zrEgHCH56Bryj12u7fXQU2yF7JCK4F8N6K+Ew0LsZcfyVSu+IC4MpMY0amN5?=
 =?us-ascii?Q?6BOKFfRl8as8RKyLrWo3Goz99jdNEJwYJk5ZdNuJmeQqfL6zvJ/QEi+enwob?=
 =?us-ascii?Q?R8w041kMf8d45J8l8pllzyOE9M8VVm6d1qc0AOwxHkZabJ26H57XB+dc9nyt?=
 =?us-ascii?Q?iJ+iJdR/f5a213TifLSh1BKX5yd494i+kASbUY8J+CiYlDA4ISpTK8j2hb7l?=
 =?us-ascii?Q?SocbCwoBs0GcBDKmC+HHNL0tVFR5AXyNWP1TASALs5VBpXj+Wapw/O8RSo9L?=
 =?us-ascii?Q?94LtIR9Swl4VST7tGw1fBbhKq3/IncJep8LD/MEwOYwsHVzbI+5pGxprZInp?=
 =?us-ascii?Q?7y9KMw3j0rId+MAs/1plHCDSRgz9IDBiexx39JIN/QWPc7Ic5nts7EX2RJMY?=
 =?us-ascii?Q?sLwYe89rrvPCmOW0G0O+TKMJfWC7agffySlStGkHQL7/y0qScSp9hcX4Rw11?=
 =?us-ascii?Q?3zh+LqzgUz158ZYmKLMohoaZcI0zxetGdQv/rPghiRX+TipFd/IyADGU4HpO?=
 =?us-ascii?Q?MGf/fI9sdhcMf1tP26/z+PDmL7jIYpr9n4ODa5priKgwkp/op/VkaMwW23jm?=
 =?us-ascii?Q?fh7q3jQ9eIWlCp3t0OP0r4z8CZlenaNumW0zZy44cJ3AcY0wlAZMQvhiw7Y+?=
 =?us-ascii?Q?GEThHl9+xCX9hR/ilh3789qOABdiQ6iZVib33ma5uG4o0nnrGJnpmNWxex8W?=
 =?us-ascii?Q?Q+l8VjK1LVjTGJJ2AkD4vY1wRgY3aSbqu4mKgnzpkbbXYdmHQzGuaA+7qWzE?=
 =?us-ascii?Q?brroVYuvkQF3E8Z0t51xw/GRKmhRMpfWjkehdMIO7MQQZ3PHCrnnC7L0yfsu?=
 =?us-ascii?Q?/3u5wDIW6ToSV3MJj34RqSlbbWlxY+BSJwwcFGE4D+y+kn0xANbO34Dmg+W4?=
 =?us-ascii?Q?Ga4k6Lh3?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 832ec0bf-7b65-4d3b-9726-08d8c2203038
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 17:31:18.0495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6RY8E8pRDpIe5U/lGCF5dMH+Er0yBFQYPtpMz80sJxmicgxW/5SFgYZTVR11C+KaEbV3jg46VjCq3stnRjAsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1376
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The qmp python module supports the Qemu Machine Protocol [0].
This module needs to be installed in a known location so the
qemurunner python script can find the qmp module.

This change causes it to be installed in the recipe-sysroot-native
of the target image and that directory can be added to the python
sys.path that needs to use the qmp.py module.

[0] https://github.com/qemu/qemu/blob/master/docs/interop/qmp-spec.txt

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/recipes-devtools/qemu/qemu-system-native_5.2.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu-system-native_5.2.0.bb b/meta/=
recipes-devtools/qemu/qemu-system-native_5.2.0.bb
index 222b55cbc6e..4a58bf9055b 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_5.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_5.2.0.bb
@@ -2,6 +2,7 @@ BPN =3D "qemu"
=20
 require qemu-native.inc
=20
+inherit python3-dir
 # As some of the files installed by qemu-native and qemu-system-native
 # are the same, we depend on qemu-native to get the full installation set
 # and avoid file clashes
@@ -23,4 +24,7 @@ do_install_append() {
     rm -f ${D}${datadir}/qemu/trace-events-all
     rm -rf ${D}${datadir}/qemu/keymaps
     rm -rf ${D}${datadir}/icons/
+
+    # Install qmp.py to be used with testimage
+    install -D ${S}/python/qemu/qmp.py ${D}${PYTHON_SITEPACKAGES_DIR}/qmp.=
py
 }
--=20
2.25.1

