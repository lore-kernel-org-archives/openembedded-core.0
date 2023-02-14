Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CADC6379F
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 17:22:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13520.1676395336985662997
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 09:22:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=BIN/TkI/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1409ec1bab=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31EDXLwT025594
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 17:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=09mjZ16QxyaPaH1mc0z66DoUnTMJwghaxD454Hz1UWw=;
 b=BIN/TkI/I1a8koBwfIO37EUHIZIvrs9/1sGk4ZRsk8r3pBnLs3dffJZgCdglHkGHebHW
 VLiAL9RoFBDwR9ym29n3LneTYiGY/usaq/FJfXetmWklyHtXBJ56WdpU+7f62s3rei38
 lSLlqbD5ch3Kf997eLq2XQm797Nx2qI1ZgFQ++5l4ucJTNQ2xYzFD071vPptq445OT3z
 GW27vh/3oSKqMZny+vgGaWKfxTpGOTe7dotm3RhoHf8Eff6fIPzGXXf2iy4Pr1dTkCgE
 8MH7QuAw0FYG6YPsc7GeTCJyZ4gdxpwuKHxuce35rIqKFfYoxYWKEBGrsB22AXxLAsfa WA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np20a2w18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 17:22:15 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31EHEX1I004677
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 17:22:15 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np20a2w16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 17:22:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLzjS4X5wcuswL1g6lyv8MCavcl2gPp3fWWWV2GizF0UBcnI45IAAIvU/das4s3A5r0c1Wj/VYnd8iAt4F9/Rrh+UN0my12HRz3TsGBCyF+4KFHJxNM8rC2EVs1eGzJRhA9+yiDby5aSMNE9VT24ItH5O+LfupeBInbvZw19L2/osVxYLP7ajfdUF6745yaeBxz0nwxF9s+6o+BUJ05hrQpYy8nEH76V94XrD+MqLk8a4Ib/+K2012PdLN1wbuuaOufpvo0oCcq7KCHSsWGttLtDPpscWlPD3/Q+x6mo8tw4Z4Eb7TvWfNFCdHfkiXiJyyfTtvcR3A5Npyxmt6FiYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09mjZ16QxyaPaH1mc0z66DoUnTMJwghaxD454Hz1UWw=;
 b=c/mDNbShC0bbS5fJsUju3byjd+6Cy6qKCDyiTJM/UD5O91bbpBVmTRM5qxa7+KM4LU4Oj3enVJFyxZQPJ//9AlfUYJn0lj7GdYiIwm6IFHmBu06fYrwO3yTNlDKFBya8itbbq2iXFCA0fvLe0lg5AfAqGjKX/B/WlT5eO8RikIc6YVCjf4XKP4RaozOVtoIs3GXeDDXriVD4/s6CpDyH0RP4ba0/0WKG2gZ0OyWsoxFwT96zzppUMp/CW0MiOnRge/78zGgMTVoE2RSSCk82FJ/Xh/WxRw7Pv/23S/f/ymcotUbuWIGsb597CCA45lHmNXS8d7K0JZKV36A9u8y6Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13)
 by CH0PR11MB5489.namprd11.prod.outlook.com (2603:10b6:610:d4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Tue, 14 Feb
 2023 17:22:10 +0000
Received: from MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::f606:748d:1395:815f]) by MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::f606:748d:1395:815f%3]) with mapi id 15.20.6086.026; Tue, 14 Feb 2023
 17:22:10 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com
Subject: [PATCH v2 0/1] Add support for custom annotations in SPDX
Date: Tue, 14 Feb 2023 09:21:55 -0800
Message-Id: <20230214172156.3799436-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0093.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::34) To MN0PR11MB6035.namprd11.prod.outlook.com
 (2603:10b6:208:376::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6035:EE_|CH0PR11MB5489:EE_
X-MS-Office365-Filtering-Correlation-Id: 52306a4f-6def-4095-fab0-08db0eb00131
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+us2urtq3Nj8wmE8/TZ2zhB1dwMmkig6cl7Przc/Bs/jtdQ3MmuUlQ8lu+DZhwVXlrUOrB5DPtB40xBocaM5jkjlI4uquDHzh/Xx6qivcct4hnQagGhTwp7TWjryomIecaXaV9gNM+qxC0jbic0TGRq0lGUS3J0aEm1rHdY6aGcP8FF+d/5ukKRaP1yhmF3TZeiqgbK/E6i/xv2n7RUcN9UldJKJSGLtoPC0xV90EjZ3p3zPs+EMzGYHmoQO36XMQX7H4OTRlbQiSkYMmO5/G5Jw/LqfxbKTH2gPnR2HxVFwsQNuVRKUVXp6hz192KClshSFGA44ZxLW/gWudzol5QsBZL8QqZBcbRjAimByziuDsI+DzXfWV8K5OfjzMFLuJLC0HLDyZzJLHTGaV8Rx6hn2NDF9rWJvlI/DVbmUEI5ktWQR2XdDu7ur0ZAalL42fQlY0leaxHDJBQFPZdIUuTdWfuuCgi8+AXSpP8nnnk++wCmlBvJnI/1XyJfUonRrC35l7fXf2KhF+/5Xysr0gQtuSgJyvK47po+RKCVZHB6X+VppVauEzAsNhqzaMtztrRqeSde5RSXhKfFd/rUpvTmUSopBftprhIel5XHgTrTPrpbA1qF26sv59f8PlPtOmwJnnYlNbxvDIVEAS3ZJBw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6035.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199018)(38100700002)(8936002)(6486002)(4744005)(5660300002)(478600001)(41300700001)(36756003)(2616005)(2906002)(6666004)(186003)(6512007)(44832011)(6506007)(1076003)(52116002)(86362001)(316002)(66556008)(8676002)(66476007)(66946007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+mSdMMeaOmJCaXg9jBeq9NdLRaCIbt5oZ5+XgDug2ISvou0++vf/eIvZ+utI?=
 =?us-ascii?Q?LVbIPuVITaBGRVdUjoZR5J6P2DlrJ6dV6b7Tu9CKG7C+pcRvrHwI5G1sj5hR?=
 =?us-ascii?Q?TSgDUDAzHE36cVERs9aObJcNj3MKdtTTAqYfFrVad/BWt+gpulGuEcv4vBrt?=
 =?us-ascii?Q?bXF4jjQBtDnfwXHz0VRHujjdiVsCrZaDV2lXRm4h+mdlMlkzwk5QNk3LG//p?=
 =?us-ascii?Q?zpvkYlukZjefpZVnOc1mfMSl9q8h5hThcaVWXEjoezc8hBwZoDqFn1W9gb0A?=
 =?us-ascii?Q?EGK+sSA/Ufo0YxALIGbFpRHpRfnsDSYURiK8eyA51+dbkFSGHfCmti4wi/4p?=
 =?us-ascii?Q?tr+wMvLgHWkU4O17qjhSWR4gdFfQ1F8/7gm6CZYOpyQKEAnBO52J2OaFyz75?=
 =?us-ascii?Q?ugQDtfUVosvRviyvtyjpsYW0fKl1twEl5cZY8PmZvbPHyQmegmSHfTlQ6AhP?=
 =?us-ascii?Q?XHEKlyLhrUMkg+ApoaQqnJQHI8sS4iU2ql4h98AAIvtZCwnSzgMh5WLZMDyA?=
 =?us-ascii?Q?/n9twbS7WUdj471EdBrcmKf3oJZEv1TCStNO0k9HHqgy0eNy6TbchmxRi16L?=
 =?us-ascii?Q?YxTqMYvQdi0G3fHlK+vYXmoAnroTdkA0pIXXIL8bw8mjLWIJxhNtCclIlrYR?=
 =?us-ascii?Q?pij0/eik0rRj+ik4Lyun8edOP5z51dxtP2kRd1aBhrFPyOitgCTQBCrYt4qM?=
 =?us-ascii?Q?HlyZ2wUcNd8qzhHGrM+S+XQxDbvAit365443lL5bv8C8atHrSi8tZtIoBejk?=
 =?us-ascii?Q?ahcU6XpIsXv2QlL7aSGtEVjQSJWKyfx/j0cyg81K0nxL/uTHrQhevAvJAaAe?=
 =?us-ascii?Q?eN1rvp7OwsUBUaAWQtPHCHxha3FwDAxdw4rHdt+UIYkzJjRqa6g6gCKEVvNS?=
 =?us-ascii?Q?omjzXOwETMx4dvyyLuY3TFaKZcSOSje79wBKvBp+jxgK5/c9LuXzIeCjpFqp?=
 =?us-ascii?Q?qRxAYuVuojDNxPWGvuD7wx5HQWioUMZURlTj5iQCpwOQXU34SZa+oBlaRXF9?=
 =?us-ascii?Q?nkN835dJUTCgAdOpQDJGlRaEV2zsZ89f4l6gqklzAPhp17TMb6ToeC9um6b8?=
 =?us-ascii?Q?tvaff+F3IknlK6Mk3OZ0s+n+R3o1D/ONyY1krnQluS1IfY+v0EFxpCqUUIfH?=
 =?us-ascii?Q?2O2TWLJ/0XnbjvkKtpwcKVPqSat7VY88aLlw1gQ2kCwpIPoiQLdBnks4T7jd?=
 =?us-ascii?Q?oc9M+0NXEHyyhA09iUcKtyOW2foLNdz6GkYVboL9oK46+S4exnctlrnbiQli?=
 =?us-ascii?Q?k2DOIeaCPk3auOJngMG/+8JuXm7S1TQIdDndcv7ckeQWz+tge65VmdNhVIo9?=
 =?us-ascii?Q?bDVKNEx+RUfuJqfQZgyF4/MzA2NMg+OkN6ardV/T5gwHkdcqO+Jvo/dTw/m4?=
 =?us-ascii?Q?c8nzhSYSLm8OfT/KEOQ/bH440RIVLaSx2WnKg6AZdejuXj7FaTS+iRwPPDki?=
 =?us-ascii?Q?fcAv5WVml6oVTulxE+3c/acC1dLW9XurNZ9pQzFr5/UmqEhTT6OwSw7d7YYR?=
 =?us-ascii?Q?ysmjSMsAUqIJaH/RpgTCqB5pKEbvyAzY0UPblfi2Ln5hla8uOb0IwpuK01tt?=
 =?us-ascii?Q?GLPJ2dRFSUsupb1LtaCttbEZEOpNcu5jaq+hjUwPHgZw7sfR6T95fQDwcuR7?=
 =?us-ascii?Q?Pxt8E51snCBLJ/xcQXLpgIAZYHQuQLQxiTos7ysfPCmfxX5Q6RmMtvjaWC8R?=
 =?us-ascii?Q?uMnwng=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52306a4f-6def-4095-fab0-08db0eb00131
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6035.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 17:22:10.1997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcD78pi2ZFIDExu4Q6F9D5sN/GyM/oEI2Hpf7lh+W78LNv5LSHUd1DTlMDq5i8ps1TOLJe8eohl1uMN+GQ14Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5489
X-Proofpoint-ORIG-GUID: HAJi_ueCAu7GGnw9JRQrrn6YArP1rmOZ
X-Proofpoint-GUID: 8lgRfxPCwZGnQqPzIb6GOPdjHDbWtn0e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_12,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 mlxlogscore=770 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302140149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 17:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177168

V2 fixes commit message and adds additional check for empty
custom_var.

Additional testing with SPDX_CUSTOM_ANNOTATION_VARS:pn-${PN} and
SPDX_CUSTOM_ANNOTATION_VARS:append:pn-${PN} confirmed to work
as expected.

We will leave the variable flag handling for a future extension
of this code as needed.

Saul Wold (1):
  create-spdx-2.2: Add support for custom Annotations

 meta/classes/create-spdx-2.2.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
2.25.1


