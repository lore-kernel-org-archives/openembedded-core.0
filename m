Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.70])
 by mx.groups.io with SMTP id smtpd.web08.25046.1604283505806681755
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2020 18:18:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BOBy8M2j;
 spf=pass (domain: windriver.com, ip: 40.107.70.70, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMYyzqbv4EqwEk2MrT7GuyznOivzxn+oh4AB/QIklOhg+bTAzjMGTHSsZXDj1WPdDkmEbEYU487d+o/JNuD0zEBt6hHSQmZSaggr3D/+r6kXEiComdVHj+F0tfsj8z8yXtcRZbI83GZZyIWw72CBn7GcRJK+7QpJs6H5nl1k+HhzyW6iUSU/9Dg/b+B38LlAkkS84M5mWIYsYc+h0MU9yONx+5nACgy2xUyOgiVCdyATECsdsaM3IXI02+vhia3JHcFgRfZ9aCJATaPXTKj6WRIOFoCPDSKZuunyJBI9CDoh/FF4SLF4ZqoLyMarvMGVua1aDlGZZcrl6YZ/WawTOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpLlvVB3vr9OkV4w+sANL3GjKJbhu7ctXVMHXaThLU0=;
 b=mFuyoXCHQLRRqXIVW1WJCG5Ly/4Jb+I09w1urBNSY6lD6qEflZUaVQSCgy1LQb1sQEX9CqhxTvNzaHHPoRDx0zupO1MRGxSvEJFGrnKfqWRv3kRQ5g0nyfKoM+XhFBrb1wWGJ+PotqIRCBYKldxKVowu/FtNsIEow3YQIoK9gRlZYf+dkAySKi1BnmDDLTLekjoyUP6oITY9OonYleYFFF44Vuq762zkX3YJ++Cy+cRiJPpKIGZHlek7b6H/69eS+plHdthas66L1mLl3tFFU6+lNVL/jGgL+Tty7VLfa5YmIxAAkAsqnRks1DLJoOpcGrBOAQ5Lqv2nE92T50nJ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpLlvVB3vr9OkV4w+sANL3GjKJbhu7ctXVMHXaThLU0=;
 b=BOBy8M2j88gFRSuqZ2z4802xIFMA3hJiKHJszzKw61ZxElRlP3wDKOQRgh/OLJyelyXh6Hz5bQ/gHYyXYLnJsguZriNooPBgvN12QvSQR734JYOATQ62EcqFR1cg8QzU+OGNjAPG/oDSPoeeyZQ4ik7Al8BxmabgHUKnmcDY9D4=
Authentication-Results: opendreambox.org; dkim=none (message not signed)
 header.d=none;opendreambox.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SN6PR11MB3485.namprd11.prod.outlook.com (2603:10b6:805:b7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.28; Mon, 2 Nov
 2020 02:18:23 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2%5]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 02:18:23 +0000
From: "kai" <kai.kang@windriver.com>
To: obi@opendreambox.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] systemd.bbclass: check whether systemctl works in post scripts
Date: Mon,  2 Nov 2020 10:17:57 +0800
Message-Id: <20201102021757.32532-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201102021757.32532-1-kai.kang@windriver.com>
References: <20201102021757.32532-1-kai.kang@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0112.apcprd03.prod.outlook.com
 (2603:1096:203:b0::28) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK0PR03CA0112.apcprd03.prod.outlook.com (2603:1096:203:b0::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Mon, 2 Nov 2020 02:18:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebce30e0-fa4c-45a5-aaf3-08d87ed592a4
X-MS-TrafficTypeDiagnostic: SN6PR11MB3485:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB348530E7D58735230138472795100@SN6PR11MB3485.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vuj5RC2JvbQg+a8lUqN2JtW4duz9oYk0ycdhjWTI+18ej16Kk1uCSlMc0LkUVTru0RXRK3enWQyK8akgLi7qtAprUDAu57qYP2O7YCPrWeUKRCqVeiwh+v4NkOO39myk1/FtgVifb5QpdzOcMGSkn4nOyIpScThihAnDyiomDxFhW8M8cOhznb+FdpsXHeG3CPKJLqf/V3HrxsNrpctgRpfGocLl4wUw7JLKQuEusugdfZPTJjBHJycVpc//RSchvD47xQI8p71Ii4slGFD0IGlpIX2Au3eqFH/XiN8XjdcA+nqGWgT2qik4AKzdLPKWLiyGF/AhM/KEmxTgqXfjxw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39840400004)(366004)(376002)(396003)(136003)(2616005)(4326008)(956004)(86362001)(8676002)(52116002)(66476007)(8936002)(66556008)(6486002)(66946007)(186003)(16526019)(6512007)(6916009)(316002)(6666004)(1076003)(6506007)(36756003)(478600001)(83380400001)(9686003)(2906002)(26005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	R8q2tsQBQicPHT2RvqqZC0Cm15L59eqEHLRXYBdy3EIldT4zTz6WrFDbvbbmzrtVnUqvaKA36DVq052WjjSzhR5NN/JjB/QoEtnBPfC3rCgvv+5jCXSHiR3S+XK6dWhV/tpMR61xg5nyBm5xObIWTfw38LDPBHfRAzMTen7hV0qsGRVdiklsAPHqkRDIGQvs3IeVOShKoUmxYB53Id8R+R2ZWwa4vewmRGkXrG/q0b3HzKpYRaCKOTJClUjYA0ZUx7nf1LjBF0FMWurKXOw5wjpQQjAwFNGs0gLlL6K5jADzV2gfilgcsSX35ssrO5Q9Pp/FBkviKPCknUw7q8kb2qDATD7MvJy78TCyYIobYfik6JK/lK6thRXx8PGt9N03dTGQnUUPeCR+qK3NCpm8zz2/KtCLTuM504pv0rWz988w8UFsSPQTeSIe2wEBHrMm/0pZp2Kyy1IuLq8qE75+V5+0hfFYTBriKaZe69JnURq4FTyHTmuZb0zu6EJS+Zhla0Dm5Sa1AwscADaU7f3GsWMI1xkUND24EhxIrTFU+9jGaNAuUe/mzSVcl4xE+Zq9ndUd9qMDh0xZDGriDIIHKjnARzgXEH4MjKG+sy8510ieQylhOjX8QslCEdu22NJBmAD2sM4ax1wdPRgoWREAWw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebce30e0-fa4c-45a5-aaf3-08d87ed592a4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 02:18:23.0471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8WL8+feDY6E7tcjQnvfSHOJc7sgWSSVPS7UPlmuC9IT+MgbEVb4SBUUvzPXjcbh0T8tbK39vv3+vDhgBkhj8VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3485
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When use a core image tarball as a docker image with 'docker import', it
fails to install/remove package which calls systemctl in post scripts
that it fails to run systemctl in a container:

bash-5.0# systemctl
System has not been booted with systemd as init system (PID 1). Can't operate.
Failed to connect to bus: Host is down

Replace 'type systemctl' with call 'systemctl' directly in package post
scripts to check whether systemctl works rather than existence.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/systemd.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 9e8a82c9f1..9ec465c759 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -23,7 +23,7 @@ python __anonymous() {
 }
 
 systemd_postinst() {
-if type systemctl >/dev/null 2>/dev/null; then
+if systemctl >/dev/null 2>/dev/null; then
 	OPTS=""
 
 	if [ -n "$D" ]; then
@@ -48,7 +48,7 @@ fi
 }
 
 systemd_prerm() {
-if type systemctl >/dev/null 2>/dev/null; then
+if systemctl >/dev/null 2>/dev/null; then
 	if [ -z "$D" ]; then
 		systemctl stop ${SYSTEMD_SERVICE_ESCAPED}
 
-- 
2.17.1

