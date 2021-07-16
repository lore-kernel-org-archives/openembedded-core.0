Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.3881.1626426873310992462
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jul 2021 02:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=U9yMDOdF;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2831fc28a3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16G9D3oJ003034
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 09:14:32 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com with ESMTP id 39tw3k0bv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 09:14:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q2opjjS14JdeHFvZnEvhsbuq56VRVoW7BXHF0+sN9Ipe81gVjDRXS33BKwqFMPn9h3NwKuvgAZCFPaLofElA13ai0CYgmvOmQ9r380yxZdVKTAobgfmXBpg/Cg7HO1tmfMEivbpIyV4qVRf8qOqaxlHiAicQeNamlsCsyjYsqEfg5xqLAcOXWLHe4xWJlsq8yNDwiu17/DOP1R9biXX9Yp6Ll5f6ruOVPPPpW/ATKTQOsYF8wjGuWAjv3Z9ygoeeSyPdQc+Dw8zOuMBGLeN4bsfMsS5imsuK7j1IdyBwRA17zkBlH4WXC8YjDAaCmZsUJQcLIhTrYvs07tppNUzSDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIPBZ6fOm8JQD38ig9act25ujgN+A/p13cWpv5BXNV4=;
 b=I0DgVnNe7ERW5PO9iwxRfwabOqEl4N6le7Zgbt/dJmY7ckCGFckC6xM4Vwe1PcSXyX5X15fI36AxY+fNoAQQIcqFEMUODs/s+Br5SwTt5WB62B42DQOnX7SuhIHcVA57kC9nS4/FSk2RHMEd6r1NoeRRXNpoQ48NeYZuqbqJOmZfISNeNkl/BXgedzT+ZRAMcvtnyAaaddzxG2NwfzMN5mi3/+x+6GGIrWKU2dqJQgZE63Pls1AamX8IGm2K3C0cwgdrEo/kFWcBzJrferPVAqGYqJU2wWZKPVQHKRCaRLIhsAzBFRcM8AaSmbelc81nuvi17Kdhimev6tvN8MZEKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIPBZ6fOm8JQD38ig9act25ujgN+A/p13cWpv5BXNV4=;
 b=U9yMDOdFK+1NrMIEhY4h/kQbu36RCzDIlvST/uPc7HbHn2q4/36DC3eGaP9QSVrJbEUmPvGYYEIlkiZbd6NwrirwdIOfd/JMaoNNNyadKY/wMBX6u7o8XTMz5e+7DjbNB77k/PBGT38NJ7TzlBTDDN9qxZbKsXzSSVpXWz3fgT4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1264.namprd11.prod.outlook.com (2603:10b6:300:27::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Fri, 16 Jul
 2021 09:14:29 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c%7]) with mapi id 15.20.4331.026; Fri, 16 Jul 2021
 09:14:29 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V2] libffi: disable use of static exec trampolines
Date: Fri, 16 Jul 2021 17:14:18 +0800
Message-Id: <20210716091418.55257-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HK2PR02CA0177.apcprd02.prod.outlook.com
 (2603:1096:201:21::13) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR02CA0177.apcprd02.prod.outlook.com (2603:1096:201:21::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 09:14:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 061948b1-a1f3-4df1-554a-08d9483a1dac
X-MS-TrafficTypeDiagnostic: MWHPR11MB1264:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB126430D49C8B0368611D575EF9119@MWHPR11MB1264.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:309;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ENvn9e5JK2u+FB1h/onC2rT+4Ox4oBMbHhRqxgqlfZjf5+BgCWsm+eJ+ykeIOtqMzv/JhLGEUrWD21tft2DcSYeWkHKhTK/yFY3RuNws/WhHEwgE/KKbMElXzj2MkzrD6bMvMLmRwjGgVemCkryqv4BwGcdO6QvWdhBBkS4W6WsQckBDcE2i2UevAlgN+8y++lNo0Xi7ZgqwWhmXtrDLAhQG00phBCmErTOefNt8SqfYkQ230+6JSAa7MsNVTP9GGoMSwBlxVOjHiUaJ9+HJYv6lZJv91e5K3jHypfYFtCqRl21++vRQs/5BfZJzKCft/eVgMiGY32FUeSvvbXw8mOaFXKS1cnxOlTYPHN9iMD1uOyjDhgSXJ5PIdDY2RopYNbxjsnZG8k4ZbS/UQiU12/IzwnvSbx9k+5wQIUFlyQ1oy4t7YtzCkri5ULgc3IW3H3Qowue1KaO17JX8Z2A/09Sk6Knxc+1MSpqNfExB55r3CUgMpob7MoEgE9vmVELj1/ahEzhZ0SlmI2KDo8P5UDaz26Eks5cE6e/ZVrj2wTZhKxJEu3XqJScyql0+ntiCrbSCDH9dgaRgBt6JTt6aRCPIuV253J+yT/76NuNt1JcD7rcKJSL5GpVqxEaiBJZ1+1m3xanKACZO9hvrJy4JcZZN1wKOod8Jo+QLEJFkeoITtW5eoB7MunfHHjNVsDeZB/HPx/i0pEr9A5UTdMmCll7FpLNPOh+kNmGERAlawrCXsqZqq8iSEFkXgiXxsZAlmUPUEBZe30JCx+t2TxfCDAq/AM7HyI7ejn3/wH+huc1jDQx80paSUJUozltSn8baB4x6HIjLpiZO9DASb3sXXA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39850400004)(2616005)(44832011)(186003)(86362001)(26005)(83380400001)(6512007)(52116002)(6506007)(6486002)(38100700002)(38350700002)(316002)(956004)(8676002)(6916009)(66946007)(966005)(5660300002)(66556008)(66476007)(2906002)(36756003)(8936002)(478600001)(1076003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jeth/qGX2wQG/LMQxqNf02DpQ1rSNLYg9TroDywhKTX62BKchc3z27ibag6E?=
 =?us-ascii?Q?G2Lq8KYJrkR/KpTNOpgnIfGTZQ2nJVkA8krq3TfnjGI34TEMoE99sq+CPokd?=
 =?us-ascii?Q?qKmxrEdn/kkLDrBeYqUp7gMliFyp0dKocxaisAy9l2KI/z4GRsZNXIHoSNhf?=
 =?us-ascii?Q?DGXW8A/sHJt9adwdfTrXvyVN0bB5fAnK0yG5L7W9Oyn6jfdkkycy0F7p69Uu?=
 =?us-ascii?Q?wjq2yVlZ6Da5QLAExnGQ+W6J5WwqJ2XPR2H69+sf8B/8EfwRYqT0Xs0MvQCj?=
 =?us-ascii?Q?J7Rd1I5TZ/U/89wRSP9ZgBcf21xKpsuqdxRTKX+Ob8dNf9SVsx8z7Mcvchf1?=
 =?us-ascii?Q?/nhpPpwKtcEkcKX2rPmNFvQXETWVl5uuRoWa1iCTnczZ8tC78ZdUa9LTeHM5?=
 =?us-ascii?Q?+DaetPESrWdvoUjmG/grIGaJeCO00Khav7FiHqi+QhCZSIUC2TKBo8GvFCn3?=
 =?us-ascii?Q?hbGEs3CidLGsS/qOfjcPhJ+20GLPO5jIEdP5Uou6b74rF7zTrARC6uEaDHnv?=
 =?us-ascii?Q?eznCe35WAj1o6yXNjwZj13wWwR9nYIb009xhhJAKD0YEKrE8Zz9GdoEcGDpN?=
 =?us-ascii?Q?AxWUj56LJgic0rUC0pT3PaEVEAu7wSkhHKU+H9JSfR2BI6amkBa/m8wyvEYl?=
 =?us-ascii?Q?P5wJ3JDDDrqId6Uo0AFlO8CslZXkZmOJ0ooMMQd2NOoiRQ2dfgyIlSfR7a3E?=
 =?us-ascii?Q?yE+tr2lYmdQeSfiJ1/LiEsilP6C5HXpjMakZwSxq9re3p8YMEmkZVqK5bSMw?=
 =?us-ascii?Q?VCJhD9tijRnq4Wze9zfmVnzWml4Mm0G1ygnulSc6NptS44SzHjNEggiQcPUD?=
 =?us-ascii?Q?WwrpWVmgznnQPBPB4R3eJxaFm/MQ2pps4ULWTK5MsmaPusV1DZ0zE0IyO1jI?=
 =?us-ascii?Q?xO0V1fkYQXDqnQBgwKPLXEOzDvM7XMvM/ApwilsufnKnOPPKUkvePyBtI/4l?=
 =?us-ascii?Q?nLL8eBA7jmmJF+rV+7W551sipwTHmhuAcg4sOE7bB+zTyXsJIaLFEsig71wr?=
 =?us-ascii?Q?nZwm5FVjpwNk0iykAEXjuQiykiFEOecu1ErBaL5t6728EeAwgnO+vfmTPtsg?=
 =?us-ascii?Q?9IWYsdWjCYDqGP32T1GQjo1LbzN7hwgfNd/b0YcLooUGVvaqCvGLAcaLyEkf?=
 =?us-ascii?Q?ggcNTfLLDL1/R8tN2w8adJ0V54fYfZ9j+W/CR0LG3rraC8JAQ+AtroVCJHqf?=
 =?us-ascii?Q?lQYMLmR3Pp0u2uNJSUcoW8w+T6oGbY1P6ZCN1piYEfZah4D9Xc5nuZPNMT8E?=
 =?us-ascii?Q?gaUmoQnBzRxaX6LMx6SeFkMhRHB1Q0c2zi2AlepNaaq8JtfMw5N0ysz2FLGA?=
 =?us-ascii?Q?GPmHaf3OfUhmgtSlWBSgMH1J?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 061948b1-a1f3-4df1-554a-08d9483a1dac
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 09:14:29.4006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zB+G2TS5jjLos6+Nw+/XqraCqUttFaO4oMltvGhAASsU8xFDM1YjE4OAd/wUaD4y5OFYtYI0/A63efwS5FVUWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1264
X-Proofpoint-ORIG-GUID: qyw5mz4KLvaVlTgoidIHG3S0hkkbz3UK
X-Proofpoint-GUID: qyw5mz4KLvaVlTgoidIHG3S0hkkbz3UK
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-16_02:2021-07-16,2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 mlxlogscore=812 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107160055
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We encountered a blueman-applet segfault with libffi 3.4.2:
$ blueman-applet
blueman-applet 01.58.45 WARNING  PluginManager:148 __load_plugin: Not loading DhcpClient because its conflict has higher priority
blueman-applet 01.58.45 WARNING  TransferService:189 _make_share_path: Failed to get Download dir from XDG
blueman-applet 01.58.45 WARNING  PluginManager:148 __load_plugin: Not loading PPPSupport because its conflict has higher priority
Segmentation fault

This is because the static exec trampolines is enabled by default in
libffi 3.4.2. However it doesn't work with gobject-introspection[1].

[1] https://github.com/libffi/libffi/commit/132699b95d3ee4d889ea2a80540acf3300987dad

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/libffi/libffi_3.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libffi/libffi_3.4.2.bb b/meta/recipes-support/libffi/libffi_3.4.2.bb
index 47b230afa2..19b6ed3e58 100644
--- a/meta/recipes-support/libffi/libffi_3.4.2.bb
+++ b/meta/recipes-support/libffi/libffi_3.4.2.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "540fb721619a6aba3bdeef7d940d8e9e0e6d2c193595bc243241b77ff9
 UPSTREAM_CHECK_URI = "https://github.com/libffi/libffi/releases/"
 UPSTREAM_CHECK_REGEX = "libffi-(?P<pver>\d+(\.\d+)+)\.tar"
 
-EXTRA_OECONF += "--disable-builddir"
+EXTRA_OECONF += "--disable-builddir --disable-exec-static-tramp"
 EXTRA_OEMAKE_class-target = "LIBTOOLFLAGS='--tag=CC'"
 inherit autotools texinfo multilib_header
 
-- 
2.25.1

