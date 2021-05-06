Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.53])
 by mx.groups.io with SMTP id smtpd.web10.1328.1620316140337326426
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 08:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YHROvtvk;
 spf=pass (domain: windriver.com, ip: 40.107.244.53, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DM0ABOCv7uqpcd/UFWaz2wVGuxnc8CEWzccJoWWsttlDyy0vxu04SdZdP6pHFu0j57kOAZCW5/WvHQ+zGQuwyIGqXIhu4x+ib1yjDGP0TtD+CF5ba6GQDLHkBJpAk3LYohtXrdFKbjYKRLlYpoxCkS6wU37V6W6/WpGWN7VTJoVCeVjWUtK28mQ+grjyK9dPiTwu3bunrEGVCw+BEsXdywu3QAXdoditH/rdgGMFAfsfTV8zNyMJeyDoExOlZkqvZOsmtq7MW9LG347c/ltaAqm6tnhtokfIoiiEo3n+E8vsuulONteumFDy1zILeMsHKyaTm+qyQYMWykmwoyZbaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bicY0CdtHX2w29JAiz0sZNKfEUEfmREyupE7iEDIaeI=;
 b=iF5dudadDS/novFHZWaMwKplc8B2xFUBUT9A/hBRNZluOkWNRSA7mR+RYa0/Y3CcDuwxc3/J7a8hrlnjBO+WahUqroSGSZxf+Li6lnlEy//AtOVfXdjEHBnHZ2bJAhRHta89PEiVgAXEyng6D0ExvGfjcwLlZhtvCBpSnAA+o4o+M8R8XH47rPVnqZkPzzXn+4R6yhvCnPz1YqAPbJFmide8jjxNfNTnVE40kixcX8GRD1evmZ+IgJK1WCB2VUodWH2JhM2koW6sRXVcET+K7CLzFctHSubR8sF5qXvbbKve9YIUvFg4zl/6ZVBC6UBfBO8/0QZgajo+diuLvybG1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bicY0CdtHX2w29JAiz0sZNKfEUEfmREyupE7iEDIaeI=;
 b=YHROvtvk68vFS7Magrr/wIUBQeQq6W7VU1NDPrwy3flkWlwuzzOBNTPUe74Eh+C5eX39Uihtu0OFBhyeikKHkWbhHEG/qK+uaisdQz7fIt6Bmcv1I7FnvSWWAljlc6LvAAzh/5dYUGYgALE6cHxXKOXUJTErSroYQ5YMC1g4i4Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1903.namprd11.prod.outlook.com (2603:10b6:300:10e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Thu, 6 May
 2021 15:48:58 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7%6]) with mapi id 15.20.4065.039; Thu, 6 May 2021
 15:48:57 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemurunner: change warning to info
Date: Thu,  6 May 2021 08:48:44 -0700
Message-ID: <20210506154845.1247433-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MW4PR04CA0062.namprd04.prod.outlook.com
 (2603:10b6:303:6b::7) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: saul.wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MW4PR04CA0062.namprd04.prod.outlook.com (2603:10b6:303:6b::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 15:48:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 730c6ad8-3753-4065-8a87-08d910a67582
X-MS-TrafficTypeDiagnostic: MWHPR11MB1903:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1903A21B208518CD2AEB5B0BEE589@MWHPR11MB1903.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sQ8HEfnQR4KssNXLsRkZSIe6pO6GabVUkvCWAeT8CXNIDUdAAps/CpQo4cP+hsx4ilAf5IJeKXDX3wxLCusVimREKkcOdvO/EYdhB7rzo4GerMmncCpr0tuyTy3MjpkE5rpWdZs2PwOSjqdkIAsNlbRz3lesR4ZMSow2HZNr0LkHfgEFJigloLi5Lm/ioy0bjLSqlGhc0MjNOCpMBQOKCuNosdsDJyQv4B9hF/LdpPASKpak51R6kO1zC9doG0wxc0N49tW0AbZdZZxSh4VrrLfmgHfPTk53TWcCi4OgsW1g1/vmpB2/nXkK7kfNHfDao7WxA7bB7Hb99d/gOwtyNE7zaZjq0J0e+lxdXqdTi3t6h/5yBikkggG40rrUWMDDnhR+XIvX23veGoq4h6bFyBOzA14KAM+G20v7El6/OGrA5ZMTy0JjWh8XMN3FtFHgjLYpNberFYFO/p58tyBPvNzRGgDjEgQJc1XJUITmr02Ud7bRHlAcKdTI08VyUKtE4WtMry4QXyLoZDms0sIDloJXBljjfwxlSQgdYA3QL+sEbndOz8IRhD96BOC1HldYAUMC4xCEUWcc8WaqsFSNmFBo4aKiimoHRhns5w2Q49bjTeD4Rcke9nUha1W5M/5uYchL5hd0fuDcbzinNucFKg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39850400004)(346002)(366004)(38350700002)(38100700002)(1076003)(478600001)(66946007)(44832011)(16526019)(316002)(83380400001)(2616005)(6666004)(66556008)(4744005)(36756003)(26005)(66476007)(8676002)(956004)(86362001)(6916009)(6512007)(8936002)(5660300002)(186003)(2906002)(6506007)(52116002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?uMTIk34HqIQSjmJfmftayd8ToME/4jlDT7dKjywkOEsfhf0XrQeheEiXSulM?=
 =?us-ascii?Q?Qvdw7nkMnj55WVvf9VkRwJgh5+7OKO81gijZPLAURIyjgswx/ZHhrAzWkg71?=
 =?us-ascii?Q?Mid3HLAdGmYtgG28IIYmk575RZYy3FRA/sEHevrdXfbkKe7KFzNO/wKpW5nP?=
 =?us-ascii?Q?/Oeter5MRgfGMhSDQ7SF0lCZcrhJfQ9ABo0/6uUBjCVDwUvjm03SAekMxUCy?=
 =?us-ascii?Q?mHFwzcHQYxkDtYG8U+4Vf/GhGh967j+72/3utNjNM/QLSAjIPB0PhvFqHunX?=
 =?us-ascii?Q?sdYZn+/iltT3fsZkyMpgVH/iURKkpnhZauSf1HAD6kBMdOltv97SZEb72QC0?=
 =?us-ascii?Q?F47zaq2+Kn1i+yeq24CKZjO1HV8YvPPfPqg1ko2JUmWp9/Yoo8wF1JUTpJky?=
 =?us-ascii?Q?ftoztcTw9i2nM+FkYExT8kOvoo9/936sntbeACAfOdxTOP4fzrJQ1lJCK5kj?=
 =?us-ascii?Q?4vXLx6mOyDUYRQrpWnPeSsBFTwUyq3xkrfTPSDE75sVrHe8e63iai/E2nyzn?=
 =?us-ascii?Q?+zZMojCo/b4hrteao8bkBIlu/x+oq1v8nPTCO78zn6U2PBLxQ3wjgVTOuvWv?=
 =?us-ascii?Q?8+jP2SJ1hr/F/LYk9fKfu2UsqgFAJKUOf8O/ObOIWxNHqo7OitwSrmQ4oRE2?=
 =?us-ascii?Q?COG0boH7fBhR9J+X6RBkupqD4shiqFrOx7VCpFz4OgL2PrPkvbZ/dadF5xzU?=
 =?us-ascii?Q?MJWzyeggFm4yehXcGBhv6YnPGeQgGiS0M4vV/iDc7GbmtNb633P9yyCw8BHc?=
 =?us-ascii?Q?Y97qW3C/GvIyVw/guRGSEWfiyxwdEXPeX6O1vrEpTUXmziO0wvpVqbWlIkbE?=
 =?us-ascii?Q?tUZ9vHw6idOerbM672YkpWJjhp299Rc72sFggX6ZeQehAtNZcYkBNGouT+KT?=
 =?us-ascii?Q?Iyzn3lyc+/CqzQbbve/5y5k9eKTxV46zcp/9dFXKKl+vID1eQnwlZa/ZP8Zk?=
 =?us-ascii?Q?GZ63/LQG0GD4TsDhdiGznXOuuDoONaa5DpEeMd8Z4+f/w9qH4beOvFi3ypIg?=
 =?us-ascii?Q?MZm99Kol6pJoS+R1yYpvkegvD3Htcyr03NGTcNd6el2KQS3Q90PVoQAanyDv?=
 =?us-ascii?Q?wbVHegPvzG8ZxyvVgRTCM8Gv1pD/1mdim2aN5/czuTOpJc6IVPauXgVm3JU2?=
 =?us-ascii?Q?AC738yIOR9/SJrS9nVUYhRMv1wtFTvTuDVrY6jr9AoIMU/HjsGfsP8slxQnP?=
 =?us-ascii?Q?xIcRnYq/BXTKiFbWOH3vsuV7amiW1W89IU5VzgIPC7Iaoc5QmXMoGbyEjfx7?=
 =?us-ascii?Q?u+tcij0o0ChmNno6n+2cTxjReF61lYPG154kzPZ6S3SMG1hRXpl23HmZAiS8?=
 =?us-ascii?Q?OUx4BtJg8jh/aUhhWyJS7oVL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730c6ad8-3753-4065-8a87-08d910a67582
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 15:48:57.4339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W141xTWBW3IyzydKnY3c4akpuxVPR3BnLA/ysSxOOrOzjIuF4nw5R6A49jG17iTbW1QI1Yfm7nSeajMMUy0Yig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1903
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This information is useful, but should not be a warning level.

[YOCTO #14382]

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemuru=
nner.py
index 3d3213d3d31..69fee27511f 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -304,7 +304,7 @@ class QemuRunner:
                 self.logger.debug("QMP Port does not exist waiting for it =
to be created")
                 endtime =3D time.time() + self.runqemutime
                 while not os.path.exists(qmp_port) and self.is_alive() and=
 time.time() < endtime:
-                   self.logger.warning("QMP port does not exist yet!")
+                   self.logger.info("QMP port does not exist yet!")
                    time.sleep(0.5)
                 if not os.path.exists(qmp_port) and self.is_alive():
                     self.logger.warning("QMP Port still does not exist but=
 QEMU is alive")
--=20
2.25.1

