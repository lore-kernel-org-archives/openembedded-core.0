Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.2702.1605179347997596683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 03:09:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=c5g0gYVj;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5URwrVBlgMkshiF7JuVHx2q/UqICoTZIFg7ESVi6rYaAwg+tMwrOMqOVIozN23eJh3+gIu/OU+d4YP4QThNTMJtywSgsu0tYQ8tn9Yz3i6pUa/OYehg23XkDn8CNqfiBiozY4ffuNqcXCn5+5HKElRTI7hy9kDHXiKli0rhjWKF4UQOtCdq1cu2cP8XXxZzsQJjveCt1ZjRo4SxCr7ki9y5LoeHBLNNc66c3lJWuCX669itMQXEkNczOZP7/Fg9+jaV2D1g5W/wcAlgJTP338FF9Y0IUvytEiFMHO7veglsU1CW3Gcz0V5g/KVU/j1E04cZi+Ivirh0cF/SgWR5YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3Jbnsk9p0uBYZSepUnQSEH1d0XKSY9WThNKgw9n7uU=;
 b=EGWW3iDGoyIXJayazx+z4zPhcrXI3olOm3ZdpqycbyNimygrCaBAhVyMPE6QmyqWN2DU1D4XZYg0g9P0+sYYZ2BhxmFa1l4xUFfwGZefzdOpPeG6H3Z6c/JywXj0I/QRtgwSG+5s//dPg62P8tW9Ylk2JuBGcCx+/CKHHyNCXSDd02ZmstSAhn5M1dksqB0c61mMv8sxLrp3q6PwP0WuB3DI3wQwGIQowxYeu27PRqrJZwll2wBz4PnwZXpnMcj5DDXr38zn/YEt/gPwFLUF0HwWGzboXLTJmcp0xLRHiIS98SSOo32Bsck0whLGb4ie6AWSmMNzPcPK3UfiI585lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3Jbnsk9p0uBYZSepUnQSEH1d0XKSY9WThNKgw9n7uU=;
 b=c5g0gYVjtBmnIlokuvdBhPAHr09fz4cMNAHe0uo2uvPWCVtbUeFJhFI2U+RIsWWqgxP3ORtAoThRR8AqOP+xxU1BdKsBaTh67ZDMayKHYWtep7+WKeU03P6AV6p4kWNnLJW3ZTwvnu8uI15/+vvd4uyK2ERzIXFSED6JhOVSFe0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (2603:10b6:805:d5::13)
 by SN6PR11MB3040.namprd11.prod.outlook.com (2603:10b6:805:db::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Thu, 12 Nov
 2020 11:09:07 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16%7]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 11:09:07 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] oe-buildenv-internal: Support extra settings
Date: Thu, 12 Nov 2020 19:25:49 +0800
Message-Id: <9d68429be743586fd36b8f76f086fea16968054f.1605180304.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605180304.git.liezhi.yang@windriver.com>
References: <cover.1605180304.git.liezhi.yang@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2P15301CA0022.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::32) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core1.wrs.com (60.247.85.82) by HK2P15301CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.11 via Frontend Transport; Thu, 12 Nov 2020 11:09:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34154d70-ebb3-4105-732e-08d886fb5f6d
X-MS-TrafficTypeDiagnostic: SN6PR11MB3040:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3040E6C8775D348D59A2433FFFE70@SN6PR11MB3040.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pyLxgEY3rHR7Vk+7iM6kHM4vl/Vt3QKYijyCPdrAKjFwCSmMcMWSPn+DDqIYzk8C50RYc93hzqIdFASXDgqCrFIR/etYmcJImw9aSe9TX2vMKdR1/5pjsTGOnMIgkvWeFDv6G6G4fNSYENBfr05c8G+LhkqKlvjL3KO9CPKy7LOj2pGZ4rMxiOK+i60ctVFJGOIIuEA84V+7M+qQVHWgWN/0+kVyd950CaS+ZbxnMLmeIZzkRLnGsUieGWTDh2Ne+bpTwT1JNOu2Zn2OndCtCnOdEn+DpXmdFXf1tAJPqlQkMAUeOcO90oEL+m3ekM7d+3nVyVKYlbP734LlNijbtg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39850400004)(366004)(956004)(2906002)(6916009)(186003)(52116002)(66574015)(26005)(36756003)(8676002)(316002)(6666004)(8936002)(6506007)(16526019)(6486002)(66556008)(5660300002)(66946007)(66476007)(478600001)(2616005)(86362001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	m3ZKgcL09slonS6RQoZFjn7ZJm6BtnoOm5Iq1A71eUqElTgTIj3bVlO/hI6VR+2y0dO1gm9FJ5dgQYX8k3prMU7TIzc1dD1C9JZhcT+42KeSLWOTCBdY9Ad4dPU1rTsCdjI08Ndt2NwUpsgwltrX0GEQv3Ib2GQQFfxT5BX9tZ3NvwYt0WI/8x1VgDK75Y+zxMSlXNZdyDV8xvYkKf3NOm4ptUxchwByn+Z/B4yQhIkwOcaZcXLrq4DhHTH6BQLo6mg2MZw1sRtthv1RLqHdkQNLZfJBekiKwMPza4bFMsUw4iOEfRcjaZ7MgxoRugOPfFAhd6rF+ecTZhLqfvWVyPv4QgDOxSleaTPB91ef4C4r9Sx8UTFW95OhNhCSlWv5xqwju2mDaxxopOcbrYZxx7hKIgsTzTzge1K3NdYwCYk5cKnwnJz6v0aAKAwXSkbdG6elkmo/oz9t2A/58ink/BCOYntKwQ3rjP7WqvNiqVBmoWbN/Mkpo/7IhXenf799DrTcP18vB1gKxw1cfAeQIxkMH+gP5UorOvfLmzbyarNR1Knt6v+dLm2G5yzihSON1RiBaaKpRrnxg9faim6UP8Xa/C9eMODwdbjGaBDa00GSFe6XVxeuscNFZIFihxOQQklXQOARPR0iV2OHG1y4DQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34154d70-ebb3-4105-732e-08d886fb5f6d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 11:09:07.1895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKtwGQlFMVyJ0PlOmOYHUcGQJjUbqQeu6EdN3V1wsnzKbwPQsOo4wENEUML8/IUhgxKuTnqryMULyb8BLRa8p8dHAAPBu6IF+N/Wc8xLTmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3040
Content-Type: text/plain

This can make it possible to do extra settings such as PATH for other layers,
for exampole, other layers may also have scripts directories as oe-core, we
have to run them with path since they are not in PATH, for example, there is a
tool meta-browser/scripts/firefox-gen-l10n-recipes, we have to use
/path/to/meta-browser/scripts to run it. Make oe-buildenv-internal check and
enable $OEROOT/extrasettings, and set a line like the following can fix the
problem:

PATH=/relative/to/$OEROOT/meta-browser/scripts:$PATH

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/oe-buildenv-internal | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index ba0a9b44d6..bf84003d72 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -98,6 +98,10 @@ for newpath in "$BITBAKEDIR/bin" "$OEROOT/scripts"; do
 done
 unset BITBAKEDIR newpath
 
+if [ -e $OEROOT/extrasettings ]; then
+. $OEROOT/extrasettings
+fi
+
 # Used by the runqemu script
 export BUILDDIR
 export PATH
-- 
2.17.1

