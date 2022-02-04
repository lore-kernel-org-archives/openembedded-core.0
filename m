Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEFB2C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 17:02:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.11861.1643994122984231171
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 09:02:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=eqZi5d3R;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=903448d3ab=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 214GOe1k023764
	for <openembedded-core@lists.openembedded.org>;
 Fri, 4 Feb 2022 09:02:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=VUGQ9WJMa7QRWO2hy9Uh1joqeN0dPiKPJnywdIPfpVs=;
 b=eqZi5d3RgLqUpG9W/qlreZpv8pErBog3HpTgK2tPSSe8oWLOjmZjIQhgf8M1cMJz1OWp
 jt119OUAWjFN71TYkAab4PZUpuJdrRPYiA1BmF2LsyG8quUWE9u1vuPEvTI2IR4l4IBE
 G5MTSezLSHC79E9TilrSvdbhv4I/dk7/SqTZ4hSUBaeDbYMaalDnhROGfrlpDzM/2Oq/
 9S83mu/1mEEytqRY9W4mcH6OvILomW8xdt6zybXXra8Kti0ZQRp0HbtbhY+OH1zUjjvf
 3bLjnUKhxw+TaTsftA5KqyxyyLCce2XFC/6yrVsYYbpXyEmKgbJJc/+npe+WzY4eS2/I QA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e0jpgguu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 09:02:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqGnpOO4dJgEdifFAIXuweOts3aXGyNVqvMKsRXNpqeOGUYq1zydLrC9YRL4GZHJXQshKXIgjRMSukeZ+pz9fXgRxX8oMHmDTeOMBAiHDnyiXolsEQow+dW6GSkJdi6IHLjc8C8aOtWkq+LYSYH4AHF6j+iLJr9LZwDE6VXJ2CfTdIa+jfSaKq0FKLddo/xtTJTvJcDoA9tkXy+66sNo+pTVBiwv9bUpgBnwJKouZbC8EiRH48rOM8p1sjC11WabaH1JymkMtbhbuInt1Be2A3MlsGdgLh1kztr2Rmwgc5nIjn5tPxl/aG6nI4psByuMOEs8p4po07d7FHJO9YlLFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VUGQ9WJMa7QRWO2hy9Uh1joqeN0dPiKPJnywdIPfpVs=;
 b=FJl1Scmb1ewORncF5F0vbDSpYpSU/ocSAgXRVfbPVNI0KJnufYoxSpduHhdtIvXZ8zN6is+x87B23b8GakhQCFnyqeIl7LkcfG0MdCukcCdd/nQTsmsO7JaXQfeprJ+AeV1/HjigY4XyHBYoLJVZ6MWIio07qHL9gqIJvkdWCc5KsL1b22jLn1TB6x4R8I64muooCMkdWgkIHY/LjfQXdyWO93VKMIN9nVjvryePteC5FHXCLp3C0o7RiVXhJ3dYh71b0aTVMjPBU7Fk8bBOEc84J8RWUcnPteY2s2GUErGZ/VX49pvVDoRmDxqtQmDTVboDoOXTW3FQBTcuxPDYKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB5042.namprd11.prod.outlook.com (2603:10b6:303:99::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Fri, 4 Feb
 2022 17:02:01 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4951.017; Fri, 4 Feb 2022
 17:02:01 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 0/5] Use more descriptive variable for skipping recipes
Date: Fri,  4 Feb 2022 09:01:39 -0800
Message-Id: <20220204170144.105536-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:40::24) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3301df28-49d9-47d0-18c8-08d9e8000f8e
X-MS-TrafficTypeDiagnostic: CO1PR11MB5042:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB50424BEBD738FFE4EEF22248EE299@CO1PR11MB5042.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bPLGpTytSgKTSORWt7XZbZsM3Oqkl35qcnstJ6p0JfyFhc/AUln3TxAK0n1YyxFgfRq3VFqr/H6QYAhXVIbivnu+DeLn/hTYerq0/YtpaBYtH6k1D4vBlVKrA+ojshqhzB2vIdGw8bgFobQBOqVwHbqExjZenGKNyu3DxwBv+9HEzC7nTuq10lYZVt40oBvfdb9Q5ux6RsB0hgEw7X8z5v2xxOlESUaTi58vziLsBzgfbJHykltlD800QwehUQKylP+HxtSVjr1YAZ9LEC8p6UV1j/dQnClJDinIMKCe6ejYh4vjQwagz9UtS1rEoC+Q1pW0sm5R7M5WRw10Vv9vM0528VBzSwQL8g0TgLzCb2XAKYEjx0bNhxAjcMARMSqzqLmNGb2MZ6q1g6DN0AQsg1ToeLooViHOyhreRSV0wikapftywFgPe2vascXkboAFRvUsSxUbSpp/2m3v6Q/rdGe2ShD4zCl66Th3Q6V70bNsyHG+ejPF7gCfLFfAV6FU/eMPMEtzzXvL7F2XXKANiM/szlyQ02CDL6te7ZeCo74/C3QHZB132ebokMZ70umm+Y+WtKHvszdHtcz4+1fq3LhWVG/vDWaGbApWNKkNlCx5M7KaSbXEqBD1yLPumfZnybkcio3Ca+mojGPNdvtNjSlWW9oOPeuMKTh/nBu9d4Dm5JP+dH/DzXJIGjpKxJZk/Q/xWTqJQziczgpkHaS1Pg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(8676002)(8936002)(4326008)(66476007)(66556008)(107886003)(66946007)(83380400001)(5660300002)(6512007)(26005)(2616005)(186003)(1076003)(36756003)(52116002)(6666004)(6506007)(508600001)(86362001)(316002)(6916009)(6486002)(44832011)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6yqpaONFKfjn2EmUTfdPBVkcdxvj3oZ4rxKbMuiwosHXIlq723j0pRpDCCAr?=
 =?us-ascii?Q?5UeyzWRvIybf84nNEyl7ne9Qgaa7gABXEt4ke+lgouPusf4M5CRrfjOLheqD?=
 =?us-ascii?Q?TtugWxYcO4t5JI3Q8DOdUXhKwOG5ik9cSObeafArsyxdMUV6ksH2dbKl/GO6?=
 =?us-ascii?Q?vPOoQQtY+5QA092vTPXooT5LoXn0/a47IEDXJeQtaqcuxrL4Va4OFfL+Dyka?=
 =?us-ascii?Q?klSChbGBqKQwnkSCHyYVFruO8K1KfGQIkWHpNb5dk0hvO85dwJI+4Gy8ZPil?=
 =?us-ascii?Q?p3OXcSbHXj3qxncT2+0gRULqwrdbA1vs3CWlK2Bqsl224vZh5PiYA95eZBuz?=
 =?us-ascii?Q?e8nbQaNiGV9ybl/N6U6B87ThNiQRb/KdU8NwpWop9GXmQbKMUjs5qd1T6Wnt?=
 =?us-ascii?Q?31KMvUr8PZF4Tm9JEuziLJmygCIL8eBLDjDPldViOUAt1q9L4vKcOyXIpNqv?=
 =?us-ascii?Q?DVUedc+zAJdktTDs86gPGd13VofpBNbcGNBuQHkKmqKPp/FeYVu9lLLe+j/h?=
 =?us-ascii?Q?lAKaWTCpXauImMFq29YN5A7jdGVHVVzsk4qN8pl+mBv1n0cWD/TnH8puySTi?=
 =?us-ascii?Q?sgBHQJTjOg1YJzQFGltMD1hWFuUoyTZAkRuKQYwpIeCsuenkTVfv8RTp+eK4?=
 =?us-ascii?Q?8ILAMzj1bOWaaelRHYxmetdVe8V36l0aC6tl/FrJLsApOrmQIGAJTmFt/o2A?=
 =?us-ascii?Q?riN57leHIMMZCAa1CSRsFP1LcN0/JM4XK+1eeFwVmevhTs6yQw4hrpLAye2R?=
 =?us-ascii?Q?m6PgDd7m9j4G+jSl20eTSuxoDHB0ScZfTlLc+54+JbVYK5ECmcWZ+u8O/auD?=
 =?us-ascii?Q?P1Bi+kzsZmWq8NbBY8lJhVqd6oXsjl0bR0KRipPM+b4CrLFstSJP1ag7qJ7l?=
 =?us-ascii?Q?vgX1SvRqnQZ0vxT2+Z+9f8NMLTAnj9Ng/AH96ShAyZRRCYOXl/W/te1bsANK?=
 =?us-ascii?Q?DJ/pMz78l9Js2+j67ixCYCGKQwcCa/wPcGzzUIj2Lgovryk5OTsRs/y0K3ib?=
 =?us-ascii?Q?6mpqp/EWtAPPtCI/rZBFuKeJMhXHCmO4cRkj4vuXYFIyhweBgGDg0LZCmP1B?=
 =?us-ascii?Q?tPmeXxdIdROrA+Z3aiCN7kx3vjsHLcMv3MzLx3u9LcR92znprqGxepxhufOI?=
 =?us-ascii?Q?2RTSax/D3qYizE4TWpygl5ZM3oadVk0AYCdjNCz1GeGkZR0mdgid/PPUy0lg?=
 =?us-ascii?Q?1YCZUQS+zD0x62cGeB4hCsTeHzii9JiRQXc3Uis6yfrWZhJh58KgnHM+m3eb?=
 =?us-ascii?Q?QeSDggmP5WEZyHRYT4O75f3AKfhZ0nRCJThJ+GZHnCsCYBTWdTuyPchzU0eQ?=
 =?us-ascii?Q?G8HFWGW/d2/CHubmYMYmQAAw6iR1SuHY0bYjxOhQYMPE1u732CVtaHSV4VEN?=
 =?us-ascii?Q?tehvz5bs411l7WTEvnuZVQ50HOMLHHLZeud+M1vB9OhzzHom/C/BiIL0AIOD?=
 =?us-ascii?Q?AbSBsqMvHKUZSlZjIOO1yWZocKqbrm1af7QvviU3VTpqHjgfD8lgNEV4G1eE?=
 =?us-ascii?Q?GS7fC4rXH5lW39vwsKwI90/0F2sY7AWQMoJL6TbnTs8xxyUBCXdbYR7fVH0T?=
 =?us-ascii?Q?9/ZIhTYUSbqwvMnWFc5H7RgQ7EfLdzqPulD41vE/Y0n7j9NudQrxYYMaNl1l?=
 =?us-ascii?Q?gDu3FGQ//oUN19Ay6G6Qyp0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3301df28-49d9-47d0-18c8-08d9e8000f8e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 17:02:01.2156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qKAnozRet63g6dk/ukJPyvJLlwKctG1xRQhht/BCKZjpEYqfzii4QMEttxmQDtEoQqNMh6lJ8jpcV5hhvZgIOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5042
X-Proofpoint-GUID: faydsSwg3W1shFXBp6vjnGo9fGLvv_1W
X-Proofpoint-ORIG-GUID: faydsSwg3W1shFXBp6vjnGo9fGLvv_1W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_07,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=416 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 17:02:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161373

This patchset in conjuction with a meta-yocto and documentation patch
change the varFlag for skipping a recipe to be SKIP_RECIPE.
This removes the need to have to explicitly use the class by moving the
code to base.bbclass.

Tested with the Autobuilder (a-quick) and by using the PNBLACKLIST
variable.

Sau!

Saul Wold (5):
  skip_recipe: remove old class and rename VarFlag to SKIP_RECIPE
  imagefeatures: selftest: Change variable to be more descriptive
  multilib:  Use renamed SKIP_RECIPE varFlag
  dnf: Use renamed SKIP_RECIPE varFlag
  documentation: Update for skip_recipe rename

 meta/classes/base.bbclass                     | 10 ++++++++++
 meta/classes/blacklist.bbclass                | 20 -------------------
 meta/classes/multilib.bbclass                 |  8 ++++----
 meta/conf/distro/defaultsetup.conf            |  3 +--
 meta/conf/documentation.conf                  |  2 +-
 meta/lib/oeqa/selftest/cases/imagefeatures.py |  8 ++++----
 meta/recipes-devtools/dnf/dnf_4.10.0.bb       |  2 +-
 meta/recipes-devtools/libdnf/libdnf_0.65.0.bb |  2 +-
 8 files changed, 22 insertions(+), 33 deletions(-)
 delete mode 100644 meta/classes/blacklist.bbclass

-- 
2.31.1


