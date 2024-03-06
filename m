Return-Path: <william.lyu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5597C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 19:57:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3919.1709755018636568641
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 11:56:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AtBnzUYm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=37956c3c62=william.lyu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 426H4POV016198
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Mar 2024 19:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=H7y0fUAG8riEGIoKtN
	sX6PEnM659I7i1DS3wHlmnse4=; b=AtBnzUYmsxdg+cS2tBFnePGjRdCzwHvGwZ
	9QI9GlHsRLVVLxjrYqQQg1zUDR3+ZYXotoIJRdbHOVWdAIFc4vq2U9SgQUEFvbQ1
	vOzjBJCH3YT3UdrlIqEBv3cg3jXKc9o0MNIEx8m3IQsfkZt/QDUqm3AhzslYjMU0
	CbpSSMQuGfReNq0wn9DNPDwaFSQhHrqQ9k4kDg6Lo/ldJIPhgCKjdxNw5Q96WKPQ
	57GIMVkJxqVfd3QuImcCx9pkFsgMDvqr+1ykSHhZNCaoI5kS02nq9jsUVA+RF/+B
	GXtlwofT+qL7Y1j3thHYnaruDxhnPSPxm2eVMg/W6xpIRUjKDzew==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wksawvdvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 19:56:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYvMYLgcuBuaUzkaiFNTDG+97Q12AjqfiHBz/9NmfR0J9tzwz0f8bUfjY/gD+vk9Eu/K6pA6XguF7hPHussKqHd9iKWIFYQEGYPsZ4N5lkOBBwHsvPuYNRKfWJgYuAI6O49VGB/oJcVVMyicHwRxrqIpDReNeNfsVJNwiZ8xr7611I3PDAiNT2H1sGyH8hO2uX/t604GumEJcel7rJH2x8NHSLwfx0zZnavafnw2KqwqQPUyJvHQmS44IuAqWCULk1skGejaIdwfRWeKHviHCp8/9fR0YpfArZN19XwY+jhqAP2ZXsLSIdxZ9drqGx+TEqpG0xfwJvH5IOwea7EIiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7y0fUAG8riEGIoKtNsX6PEnM659I7i1DS3wHlmnse4=;
 b=GzX8RLENEEpbnhVTiaoqunk/UbEFiwFdt9Ipj+npdGj+Y8nUnHoxcGTLEHZXrNz2XXWHAZPXkn1lNsTl6Y3V4PMty4DBFU4+aknhG8KnfgNokDI5hIUN4yXusnGugOYXCt3sH9uVAXpI9odDhUCUz+PEbIA1KfB/SMMcQnACx9TqJflr1RVuai11uXtNEXsMMvI5a3N0+EParaFLr/J4FG9SBQZbhMhBSDsHXX+qkRITjfNuFQY1mo4fpff4oTb2nS/z4hTcqmeIxzBMLQ6MxQJC0qzQlUiYqeOOw8NSfdWwmgEei2joIsjUxi/hDt6twC6JAxhsax7OMKehcOYZjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8767.namprd11.prod.outlook.com (2603:10b6:408:215::11)
 by IA0PR11MB7882.namprd11.prod.outlook.com (2603:10b6:208:40f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 19:56:55 +0000
Received: from LV3PR11MB8767.namprd11.prod.outlook.com
 ([fe80::6730:81e2:544b:1379]) by LV3PR11MB8767.namprd11.prod.outlook.com
 ([fe80::6730:81e2:544b:1379%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 19:56:55 +0000
From: William.Lyu@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssh: Add a workaround for ICE on powerpc64le
Date: Wed,  6 Mar 2024 11:56:45 -0800
Message-ID: <20240306195645.2807044-1-William.Lyu@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0049.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::24) To LV3PR11MB8767.namprd11.prod.outlook.com
 (2603:10b6:408:215::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8767:EE_|IA0PR11MB7882:EE_
X-MS-Office365-Filtering-Correlation-Id: 03687bdc-d337-4bd2-cc08-08dc3e1792ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+TnV7BXcCV9j67/YaQUubTQdGK0qCOS+q3mCp+OPJV3w4lugn47VZd3BdiyzgMVAau/5Vqzdn82MnjPeemQec80kqh6MlxE/qxHUQJ4j8fcmc3yhZrk4D8cKrQZexEy3A+tlGtX8wOyqfpcDy3Zl9X7BrdxzRXVTaLCkeLWwNToWmL4UJAAjTmRXD2uj2ZsZTR5PJcvjPghMmK6m5ilBWG5BHnkqMzWVFAN04cDyDS804dND/DduVVKFld4hrQZJdS/Iey/Gi75y1H+xClZJbQ9MGxGazHT6p+L+vNZMDtWDYAbMT6cZ9DLiAhicE4m7ZF7wc3AUaVpUUtaEOuciEUvH+YaNaZzSf82XUx+P1tWBR34JKzzUfGg8mPgNwwW3iq++TRw3Htl+WytLwETf1MC9OgRerUm5d5RuxXZ0v2+4gj0cofsuvi1RtBAFOAyO/faLg1cc6MswqkUoGvjwCrMmzn8foCM+ZNehtzDDDIpZA1CA6NufDtQWSO5kFolyr5Rd38DoFXigka5n1W3/4Hx/4SKoAPVE0pSGwOKENel09cnk9ASgxk0rAnmlatvWo8Ma8NjWRIQ/X77xrA36C7zehe6Tl0r0JvKNrrYqp1AHnWhq53NsKN8AXx1CJ6rLTuLrBQQunH50Smmf8SrlATifsqskjm6RFPSWqqIimE0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8767.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0nrBGx8L+oh7Ut2d27dxK4tdmHDSZMlGPMu0blnMq8E9MebXYGbgxEMYIw0w?=
 =?us-ascii?Q?kD3AnToAzeS5jwkH+4H7agLblUGKrdnWtZdsSee2YjMyO/LBIJ/WD7xEF18N?=
 =?us-ascii?Q?bd/8LxwY4JulCWyP+0j8XXCLP2TwK4DhQaMHBAyGt5qpYIOphImLo+TuhLDv?=
 =?us-ascii?Q?L3BSu3yhLGC40h5HCCnvcF38MG3IBgGrace4iY+wUw+aiOWpjGFWCWwABTYV?=
 =?us-ascii?Q?PRi0GO/I41LAqFpCZQO4nlnKuIjhywLV9Usj7wJwVTM9zmpioFgBgXmIGz89?=
 =?us-ascii?Q?Q7kv7YN4TQ+p73b7oH8w/kPQRwFfxZp5j0ZnRyEwEQpuH2+TNEOeXkNA4nn8?=
 =?us-ascii?Q?Zbz4MroL88iBVTnBbdsFD5N6RWLA2kkMEXfpx/YHll5glvBgMBsUIWXoxgVV?=
 =?us-ascii?Q?zXh4WmLkbnyWwVE2ALk5YE4hIDHMOahrN36rBqNR2lEg2gljC6/CwOfBO9Ax?=
 =?us-ascii?Q?EKzXqC1pgHYxPpm7CWnjrM08QKamgXsiZnBc1WZcXson85HPdnnpMoQvNUNl?=
 =?us-ascii?Q?fk3FGFDUsadhJCm+a5o1Raa2B7rFUTgvCfTkd0GFJO3ubgxngBwq7Od4CGk3?=
 =?us-ascii?Q?oZOSh+u+vgDpxKxvo4GTpK9cHFRUt7PndaS7CpqZFr8HqLvWaiguqPpjDmhm?=
 =?us-ascii?Q?J31Dxk6NyzGZS3OhPNP+Zt9rEyeLbILR+4Chv1AabJgA9gqB3s3KNHPZMB3a?=
 =?us-ascii?Q?Zb2c1+WwmvAx3t0+d5gFmWgYjC8jXKkZqOnWox40SzTQc4x4lXfbky2FDLCD?=
 =?us-ascii?Q?xm4ETYk/7AJ5BUyoDSY9y2EOnRn4X6HGstRC34C9lQWvcFgVqEgFONHlVrWS?=
 =?us-ascii?Q?/P1c3jr4Nw6ePWspvyn8KD0wfMNY4OpF1L0tOGwexcGPBsnAsm7UaEnpNJjw?=
 =?us-ascii?Q?q93ug13wjtZivlFG/l7pmYnm1hMRTixjJeYRBkqyI0u12IaRe+CrGJ5ftjft?=
 =?us-ascii?Q?2zgSaoLi/cEKIsWXUtE9tOegoFo4rWhKQyFuBppFh+h676Fy7GfHDLWLvWKA?=
 =?us-ascii?Q?UKlKGZWHeEBrBunnzlLAMO9A8i31gVpM1mIMC1JyLMGsaqrKrZtCg9hgmBPP?=
 =?us-ascii?Q?Ec7viNRh/htyaTVEiNQ2wlk0hoDAr9XowLX88SUuG8hzJB2RSt5ZYUFKH5xj?=
 =?us-ascii?Q?nMlnTV/omH0hYJvkWzzgQc2cc7/DEEvRJFKhcWznOpcCxckVx9brb98GevQw?=
 =?us-ascii?Q?cnko6f3B7phGAy+UuCuasLlKE5u25N0OwuUJnf8QclDXJhwwng+DHw4wZTj9?=
 =?us-ascii?Q?5QOPiBTNj7oITJ9IZp/X9WeWbZu9Z6f7Quuq4LQNohVKNaBkGhgTcgV3UKVy?=
 =?us-ascii?Q?jOgs6QMX1PTdKF0ZUPWy//OJ1Zhx0OAtvupTBBGB36GwFXuYA01efo3MQO62?=
 =?us-ascii?Q?JHLegOq4TNjT2jU3aGq71S5i0PPcv1neYzSVS80Ey4eF9Fb1n/73qt0/Guu1?=
 =?us-ascii?Q?sdevsQ6FyFv5lk3krZZmXfUzDgrnAFmWbWM9ssr9N2asEJsAVfzyXCWrW6i+?=
 =?us-ascii?Q?M9SiXEMzjzVvo9EvI7yBiOk7VZTHcLcXx3VQiNTLOCQx15oAE/m1XHUnw2qZ?=
 =?us-ascii?Q?90CFLlYp8LUwYNDIol2uW/XrQTFstS6EdZNxkK/VwxkukHVw/tcnK0SWHjGa?=
 =?us-ascii?Q?ug=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03687bdc-d337-4bd2-cc08-08dc3e1792ff
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8767.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 19:56:55.2348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVaPyktLBlTz/aNljyW2MNASSYQSOyz7SDSWMa0E1bXHOxOkbo/mwprh+/GCYWykEyiHcZUvWH6yDDY/Lbf/U3GNRSz2gMVVtk7sAfWl0Gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7882
X-Proofpoint-ORIG-GUID: 00wXjkgJc8kt2rpzgT5yb8_7GsfaaUJ0
X-Proofpoint-GUID: 00wXjkgJc8kt2rpzgT5yb8_7GsfaaUJ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_12,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 mlxlogscore=797
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 19:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196755

From: William Lyu <William.Lyu@windriver.com>

Fixes [YOCTO #15415]

The new openssh version has an ICE on powerpc64le similar to the one on
mips/mips64[1]. By adding flag "--without-hardening" to "./configure",
compiler option "-fzero-call-used-regs" will be removed when compiling. This
prevents certain functions from triggering the following ICE:

unimplemented: argument 'used' is not supported for '-fzero-call-used-regs' on this target

References
[1] https://git.openembedded.org/openembedded-core/commit/?id=5b290566519a87c563945a033cb49863317ad63d

Signed-off-by: William Lyu <William.Lyu@windriver.com>
---
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 1fd36a266f..edd8e8c2d1 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -85,6 +85,9 @@ EXTRA_OECONF:append:libc-musl = " --disable-wtmp --disable-lastlog"
 EXTRA_OECONF:append:mips = " --without-hardening"
 EXTRA_OECONF:append:mips64 = " --without-hardening"
 
+# Work around ICE on powerpc64le starting in 9.6p1
+EXTRA_OECONF:append:powerpc64le = " --without-hardening"
+
 # Since we do not depend on libbsd, we do not want configure to use it
 # just because it finds libutil.h.  But, specifying --disable-libutil
 # causes compile errors, so...
-- 
2.43.0


