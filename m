Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.84])
 by mx.groups.io with SMTP id smtpd.web09.6117.1603963637258468276
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 02:27:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=eHFLTP28;
 spf=pass (domain: windriver.com, ip: 40.107.92.84, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJk8AvzzvNmohdz59Ps/8vRVveDCbu9CRQZyUV551sDypC7ITe3vCNxN/uCSX9LqZhc/dZKMieS7Z5d9DKjJx1KP71fWKuiCvvFV4bR0aUMhk9amhdeB8aw7f83Ovuu04n/jk7ACsWMHaeu+RoHS6+PvZXpad1zOpMERbUqy1DdKsT+p03ct3+Je9bu4pQkuWHsRXSnl+6UsbQbmK0zS+stt7g+xpVnN4Vqqy7rq0bXYw94t5BsegyMxPFzJJL7H53ELT43khDqTyxWj5bqA9+9aaff0otR0jX6z/LJVe7c0a+ISZqb1+Dibrl8xzivtcPl4Ze2k2SFeG5Wu3c7K/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGa+ORulw2n4LgUacMbuOQkc9JQDwctMYRVxqRd8bGk=;
 b=bLe3UwxqOngaNBYBMFXUg5wtOs/FqdzwZVY75m1aCX71D1yH9s9m5GiKl6V9SD0zQotJShxU6tS9tHs0Bof9Hka+x+NU2TGZsrcPKHMOnDTyz8gW9RNdrYg9cftPTby++1sdEyH/soIIee/w04R4gUBaRK2LsEnF3sOYRZm6EM9xX9tnFMwSMm/4vFtQRX0+pSTfa9DPWGNTX2gEtaytRvBOsUrWPelVAKUaj3D7ajYfkiZnbnW0S/ibO88hbh+MBm50RdU+dDO4B4iE3CdUTGBJIzZ7dPGnyPqytNEwPoh9Inn1d44ooVl+ObhSlHQeEQKLYyELhoRxE0hG55B66A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGa+ORulw2n4LgUacMbuOQkc9JQDwctMYRVxqRd8bGk=;
 b=eHFLTP2801KLTRky6xpgSTucH8T6HE+o9WpgiaYLczKSRI577eudVRpPPe6M+XRdaF43m0OhxpgM9DJt+i/smjRUQnqoCPggRMCb23w9KDu2byuXX+g5nXyPB7fjoFu/2vNluas0P+NbO+qwMxxYQ+SshTL6DBFOrdR8aHq3b5k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SA0PR11MB4717.namprd11.prod.outlook.com (2603:10b6:806:9f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Thu, 29 Oct
 2020 09:27:16 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::34d3:7c3f:9259:d3c5]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::34d3:7c3f:9259:d3c5%7]) with mapi id 15.20.3477.028; Thu, 29 Oct 2020
 09:27:16 +0000
From: "kai" <kai.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] systemd.bbclass: check whether systemctl works in post scripts
Date: Thu, 29 Oct 2020 17:26:50 +0800
Message-Id: <20201029092650.34868-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201029092650.34868-1-kai.kang@windriver.com>
References: <20201029092650.34868-1-kai.kang@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0002.apcprd03.prod.outlook.com
 (2603:1096:203:c8::7) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HKAPR03CA0002.apcprd03.prod.outlook.com (2603:1096:203:c8::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.10 via Frontend Transport; Thu, 29 Oct 2020 09:27:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdbedbf8-7657-4deb-9299-08d87becd330
X-MS-TrafficTypeDiagnostic: SA0PR11MB4717:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4717BF3DDAF85F84BED0794795140@SA0PR11MB4717.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ufrsItvr+HcG4Q6langClwqj5NdjlN6UG3G82BngTyz0R4Cd0cUPVeynEmFcbVET/NsdjF+ibSX6haluRcHlOBvYNYRlckpeeRwUixtc1UvvEQt00+DOpv/OTMYovmy2If3YrgSovaoDPEdffgL8gI/n5jQ+cmBeiUM27AV45lgh5Odv7OPFwAVDyDhKkrwCeCcc9VlY7YpX56C4u4CrExe3NTMxC/P0IJItSGfPVRltRg6zcDiGI0V54VN7dIIkOEuIrI5691k8OjGdD/wsNLa8O9DbzFsaBPeMZwgcFZScIbbWOmMj/JEa1XIQLf7qFISVCifubsZBdpD2BbamoQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(366004)(39850400004)(346002)(86362001)(6666004)(6916009)(9686003)(316002)(83380400001)(2616005)(66946007)(66476007)(66556008)(6512007)(956004)(2906002)(36756003)(1076003)(5660300002)(8936002)(6506007)(26005)(186003)(6486002)(16526019)(478600001)(52116002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	i9KdWNxEjrko1/uPqrDo3BcQMZuQfpaAZmnycSymUfFfbNr6+cAeCNcNUgdUz1ey2Gdk+YwCMiw3fNfnyih0LE//Tmu5PiG5mlFiElxbQS+uQXPZw2MwEkI2yj/sN8JL4HiMQw07+YpZe1See30b1o8pVlpQWa7OEvM9+E7EcNuX/g63bjnI2hpXeodiWrf7/hjF31+RHerkTWCaDp/49e11oRcAXvVSyOcSa5NWgXoax08SjQRtXIHMEkH7noS8xoPFA/vmViUo1xuK03I1eS3aK6b8XLkvWYNhCpFRd4qxGSxx0l66Lf9kiq2v8ui2Pc7ujeltjUj1IvTyK9MJZ4UTBOohrLYq8prHg1G/DWFawc4yq6EoguMidaZbGkX3M7Wx1o+J+D9sIN8oem4LaVf7pOs0br7rVJJV9ndJujEHC3E4gixrI3ZWc3HuQ0737ytHFr8tJfaA7OCDMK3JI8kqlMbm7c/g3yUSxOiMnKuUd0jWbXrTwjZlCo9s6fxrx7oPvG4UvjEekW43LHXc/vhd6ExD0KjRgHQapua0/e8VU6ge6Dv1OPi6NXHsVtLw8MyeTTPFmZ1H5zTSfxrHCw9B0ITBRv7JaX21i53wwmlq1M0kaw2w9a7KUDX6jd1jOlaemkRMC5VHYLC2YHrZZQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdbedbf8-7657-4deb-9299-08d87becd330
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2020 09:27:16.2397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nmwZWYWl80wzDr0q0KG9lxWL/EBcdpitNbS+3QWPhDUZvU9Fdo0TcARRH/RuOSprh5TKE4g/9w/8smprHrEjLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4717
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When use a core image tarball as a docker image with 'docker import', it
fails to install/remove package which calls systemctl in post scripts.
Because it fais to run systemctl in a container:

bash-5.0# systemctl
System has not been booted with systemd as init system (PID 1). Can't operate.
Failed to connect to bus: Host is down

Replace 'type systemctl' with 'systemctl list-machines' in package post
scripts to check whether systemctl work rather than existence.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/systemd.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 9e8a82c9f1..9938425e2d 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -23,7 +23,7 @@ python __anonymous() {
 }
 
 systemd_postinst() {
-if type systemctl >/dev/null 2>/dev/null; then
+if systemctl list-machines >/dev/null 2>/dev/null; then
 	OPTS=""
 
 	if [ -n "$D" ]; then
@@ -48,7 +48,7 @@ fi
 }
 
 systemd_prerm() {
-if type systemctl >/dev/null 2>/dev/null; then
+if systemctl list-machines >/dev/null 2>/dev/null; then
 	if [ -z "$D" ]; then
 		systemctl stop ${SYSTEMD_SERVICE_ESCAPED}
 
-- 
2.17.1

