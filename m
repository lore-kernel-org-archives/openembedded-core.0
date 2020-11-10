Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.23263.1604980624263556343
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 19:57:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CBb3H1pw;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OdnA5Zp4Vi6NmVl3878xZDwoHaUclXgfVPt/Tr4uJKrOIQyJU9BBMu3t9iqFs4yvafqhrPwwq0wi5Yl3DaZUaMnPasjzVvn25U0Y2ZwE27ZAv4bIqSf+s8ipGswHDjKSx0MioVmZQTvuEa+fTjrU2auv5cemlLdRFmmJkpoC7JI+9KvOgbfY32nwc1YoXHghjOlKgclqTOjvOCmY2UbwFl5b1rjaSEVhxuO08j1DAxcPHI2uY4NUBIIQC9Vjvor1dOkZx0ZT3TJMI4ib9AjZlFOj48xcNEFmJyHmVW4igNerxgQa1Eh6hnpROuihmY4g8XntrIiFDGGftT4puHJL9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K90D7J5xnrCPtNg1HHhAh8bjJbo6SA2+pVrltAlIoe0=;
 b=IBx1wJf3uDJIfV/x98Eo+URvYyYYQ90fL79JrEjbrAQB6Ypx+S3ijvK7awk1wH512R5IMqCeeM1ogOxR2QRaXOboP2WUl6YLVehcwGfsCpJeumyyxt4y37vOacmJTXB0ciP9GOebkuX8aCjwAzJH6ha8jWcAmlegBuaSfWZhIBCyRYiGj6qSIQopy8VQ/NFcXE5lQUa0AiffbGKolI+gQjNixqIiOgpY72UXuVIZF43ApvLW/pvopdOJkE3UUyKXdLQl8AKvK0jZqzg6EWorImxW0J4DcwEdPl09eTO1BMHd8OY+AIL9Z/7zD668dx2K+N4a2M78FppoAA80tDj9BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K90D7J5xnrCPtNg1HHhAh8bjJbo6SA2+pVrltAlIoe0=;
 b=CBb3H1pwhU3C7zWfPg6SPyVltCbvNicSNs2y0aAXsEcMDcd5zPjYe4qAPg6tevXc5ySIkeDNHA+vtrZfdmhhxyiJ7cdBUQlXtRGqDVNYkqzhKBPHXol8vZV5PisfF4f6JrAE/oWApw3bMkY1LYYmrQe0+ir92W5bTtU983nrFWk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SN6PR11MB3421.namprd11.prod.outlook.com (2603:10b6:805:cd::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Tue, 10 Nov
 2020 03:57:03 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2%5]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 03:57:02 +0000
From: "kai" <kai.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] add new extrausers command passwd-expire
Date: Tue, 10 Nov 2020 11:56:42 +0800
Message-Id: <20201110035642.19754-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201110035642.19754-1-kai.kang@windriver.com>
References: <20201110035642.19754-1-kai.kang@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0018.apcprd04.prod.outlook.com
 (2603:1096:202:2::28) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR0401CA0018.apcprd04.prod.outlook.com (2603:1096:202:2::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 03:57:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41ce883a-be27-4b27-7b65-08d8852cae03
X-MS-TrafficTypeDiagnostic: SN6PR11MB3421:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB34210A39F53CB789393C794F95E90@SN6PR11MB3421.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QyN50BwOHAJ7ZPQ7lXjmf2peLZazMvJG23DdrliFf7K1dosNazCMsHcYN7UiuxkcyPlCBFDMlcDBtuolX0+XyKHS7kDIYG4OJmxG3wsJXfFLmIEVdxQuWHczFshRMtiF8kT5ucRjq2df+vx7QsG5XUqylQFt4GktoM8hWls8F4hSgrFH/4GZBOeXCisAX2BE4h7pDhqwZLBqfHJ734bG1Xbxu6SqQ+079gwgL/oeVkCMnUvuMkPXCpQ0YGbW/CClTx3ukaevVBJtHVBmK5pC+jPA83jn0PkOpe5xePiqTIqHPVoiQp5XAWAD7qXzrJ2+UBC+031VJAJO+WDcQJqHEg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39850400004)(366004)(136003)(396003)(6506007)(6512007)(478600001)(9686003)(8676002)(6666004)(1076003)(66946007)(8936002)(6916009)(66476007)(186003)(86362001)(52116002)(26005)(36756003)(2616005)(956004)(2906002)(66556008)(6486002)(316002)(83380400001)(16526019)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	6+V2d1jHAiHP2hKo+J226aaXamA2Y9aQUOIpEXtaLdySJJaqqDUA6NgR5VNpQNm4X7kJ05Rw50j2qchqWxKjaBST4BnSose6xyiiU8o2eJgsUC2dWO4YypSaNCpH/Cj1zZzQA6wSt+FHha0XYAkRsakmpcsIiBqAPe/N9Hr7rCdAICs/MtxQzR2kN/xNV2y5y3eFRhrlV5/Q00+Fd5hHWqFMy3oHEJV8tslW3uQEPQZeGkOKow7aEB0oLI4bnVVoOqKTLoGaAGHIguGVWC4ethlLYcOdZlnsumM/QdS3Jh6Qlw+35z8z4+gj5zrrmf+iDnlmKoUlT61swkhb+4W8y/x+pFQ2LmymmIpANcB2wXr/wXdppqigLTWaKSY8D2IAGftCD6NQGgG+vSeBkQmhHbT04uHYtLrqPZurZqfq6gD/Ne0T0jdmPBpJaRmOK5fgIHTmJPRkPHXF8maoBzYWfIOWEmcPxK5pWzDqs+9MtjeW0xf77uDohEZDE5NBRJvYNdA9kOz6yyJgHJp94ltJa+i1QIeIRHkHu1hGPuJ/zTjL+LhRyI/VAiyKj6PndYW5a2OgnQoDoIJya+G1GOGyvO9zKIf3FepKRp8BOPyv2Uq9Zym02GN3lrA2aLbab32DvzsSYvTvq5iA0KGWXI/9VQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ce883a-be27-4b27-7b65-08d8852cae03
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 03:57:02.0082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04MubYx+wBDUoDwbcnzw/1xWhQSfnD61xTujaZowPtJmpYBVIMYmSHhd7xDIfes3dI3YUg0uryigYuII3NU2/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3421
Content-Type: text/plain

From: Joseph Reynolds <joseph-reynolds@charter.net>

This enhances extrausers with a new passwd-expire command that causes
a local user's password to be expired as if the `passwd --expire`
command was run, so the password needs to be changed on initial login.

Example: EXTRA_USERS_PARAMS += " useradd ... USER; passwd-expire USER;"

Tested: on useradd accounts
When configured with Linux-PAM, console login prompts for and can
successfully change the password.  OpenSSH server works.  Dropbear
SSH server notes the password must be changed but does not offer a
password change dialog and rejects the login request.

Signed-off-by: Joseph Reynolds <joseph-reynolds@charter.net>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/extrausers.bbclass   |  3 +++
 meta/classes/useradd_base.bbclass | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bbclass
index 32569e97db..90811bfe2a 100644
--- a/meta/classes/extrausers.bbclass
+++ b/meta/classes/extrausers.bbclass
@@ -46,6 +46,9 @@ set_user_group () {
 			usermod)
 				perform_usermod "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts"
 				;;
+			passwd-expire)
+				perform_passwd_expire "${IMAGE_ROOTFS}" "$opts"
+				;;
 			groupmod)
 				perform_groupmod "${IMAGE_ROOTFS}" "-R ${IMAGE_ROOTFS} $opts"
 				;;
diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
index 0d0bdb80f5..7f5b9b7219 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -145,3 +145,21 @@ perform_usermod () {
 	fi
 	set -e
 }
+
+perform_passwd_expire () {
+	local rootdir="$1"
+	local opts="$2"
+	bbnote "${PN}: Performing equivalent of passwd --expire with [$opts]"
+	# Directly set sp_lstchg to 0 without using the passwd command: Only root can do that
+	local username=`echo "$opts" | awk '{ print $NF }'`
+	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
+	if test "x$user_exists" != "x"; then
+		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO sed -i \''s/^\('$username':[^:]*\):[^:]*:/\1:0:/'\' $rootdir/etc/shadow \" || true
+		local passwd_lastchanged="`grep "^$username:" $rootdir/etc/shadow | cut -d: -f3`"
+		if test "x$passwd_lastchanged" != "x0"; then
+			bbfatal "${PN}: passwd --expire operation did not succeed."
+		fi
+	else
+		bbnote "${PN}: user $username doesn't exist, not expiring its password"
+	fi
+}
-- 
2.17.1

