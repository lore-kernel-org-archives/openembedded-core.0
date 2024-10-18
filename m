Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A951D2F7E8
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 08:32:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17852.1729240319207428853
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 01:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=00212bf8b4=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I4sXJm025804
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 08:31:58 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42a3esk11x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 08:31:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Srxo9oD5oQ3LUeYus2Q8EwTyQPRMTX1r7eavMNzLmsfN0JdD5Wg4/XF3y/608puwjXYfrfjgzKjnyioCjRgadyATJR6dUvyxNXauVGJPK9gWES2QrdC1RLriL0G8sjEU6L7YJb1xx6KS82tN9MWQG8PCARsCwX4lc2yRPSyFKfj3apFTWi7y6D7eQ2duKn8eeYgnzMpo95PlJY6u0UQ7HD3og9WnvTI69XUZUCMKnSsD/iQuA86UY2khwhcfcxKH7MuZ4bl3VfYTqpb+0bykb++UQiehdXQp9uEVErK4nx6NGUddRgBXKW5wXZARMjighQZQdhnQn/wZ6Ihqy9OG+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDrFWQUVnXe9+ApeKONzxbrefBqAL8d7yuZ5lOJH4UY=;
 b=tZX2gxKX0bq42OdQxJ90ErwK3Vv7hOpoD7oE9rtbfzPPykcKp38UKsr9dEmNRk2WOb3XEwiEhiDrYGAc7x7bflwmmUNPh90YKNsX0zduwLEPyGomhoGblE0GaRsdGzj2+mA+s+SDV7fdSLRJytIZnNX6C07ojMguKf8emjnj+UDWrhsMkqYdd0iGRD97xO46yJmSX5FrZm4hfYmh17D4glvXOHkaX9ffnr8BIqPlVyYhFo+AMGXax931xBhua+fq5vzVXANnvuNzPsQX5SsTTccqBcN3MRzo71ulCSEL/24zA3YzBiaI5gOQOQiEeOIcJ4q2tWIHqgA/Dzb4h2B2ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by DS0PR11MB7622.namprd11.prod.outlook.com (2603:10b6:8:144::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 08:31:47 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 08:31:47 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] libgfortran: fix buildpath QA issue
Date: Fri, 18 Oct 2024 01:31:34 -0700
Message-Id: <20241018083135.3643966-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:a03:74::19) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|DS0PR11MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: db3a53fe-1ee4-4ad6-128d-08dcef4f4de1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yv2An17+Pd6CdBR+W5wJmtkVqhYrUBQxm/lUuGREaRrGfm1wYlNtedvbpoZw?=
 =?us-ascii?Q?IMWfO3HCqhSgvsqFb35kPB6RITTP3HpUBtCYFHOTytrm15fjDooPc0kJKQAr?=
 =?us-ascii?Q?GkaRs5Fzcn/z8Rr1Y9/4CI7R0nzIcSnZ6dGuXeszilpRxQ8Y3CD6B/CxLWPn?=
 =?us-ascii?Q?Y6cIF8mF7NBOkNrxJv2Ldc0yDoTFXsHUeuQYJJMD7nlYUCUaALCDwNP0FLLa?=
 =?us-ascii?Q?0EtWOjrgj3eT3jja1sM+SyanTq8lQ2U86rXe2RuJeL3VKtyjhy+rB9MfdUv+?=
 =?us-ascii?Q?veIHUx55v8svXbERD9LMtxqDpuqd3uy9icmq1frF6f7LQOc5mr6i1bN3LZZF?=
 =?us-ascii?Q?H0zb5878WLYYeipK4mSpQcd/BJlg8828ZoaOHjdcpc4EyJNY1RcM9VM61+LO?=
 =?us-ascii?Q?EU3FSA1+cxjHUm2k+jBPVLNmDIKuoxQODAhju9ZFw06cEr5463GrCDocEose?=
 =?us-ascii?Q?QzkToieQs+sfMzt9GF631Pagiaxs1XDfyMMsrVhvUtMKWwNazrgXecVmK+EX?=
 =?us-ascii?Q?b/PD+SD0DTN2HGthZn5arf0eU1dzrj35XRc4RwAk1k67+wnhcDVUIHoYLXxb?=
 =?us-ascii?Q?Ke3C3yV/Hj5AoQN8Q2htuS9QGcqWSZ5Aq37xPOupoXOzeod/KB8li8lnF95T?=
 =?us-ascii?Q?JdPLtXlKW1e8z48pi382Ap3HKiq34Fx2kR0MU+wfs0eG8J8O+l08Egj1uPId?=
 =?us-ascii?Q?d8JrlW1sJZOuClplF6FK6m69A78VyAqMB90KtoeywRoQQBIK4IawufPsP4tM?=
 =?us-ascii?Q?5EsCs1l3etTyIa10jqndmfv2mOgQ0YLY0Q0zPKSk3IIDFj2NVYwi+Y1CfcNb?=
 =?us-ascii?Q?9H3RNnBVfm9PhLqsAxvEG7Fkf17LMok+zZCl0oz8mys+MyFJxnYcWR2bEtR5?=
 =?us-ascii?Q?y9xokAOso+jFrVTDmx/4P3ry4+Ky8Z6Bh3B+oM10eu8b68KehJWoHeRzkxWf?=
 =?us-ascii?Q?qPwWT0xoNramGssBwqG4tY0YWlR8jVCYw9pUZ/SOwihWHyY43xOLmDgmVXKk?=
 =?us-ascii?Q?ehsa8CnAFDbcOephAwrt//3srivoC4q9KKIKJsiNSWjFW0XISkZylxaBGWLk?=
 =?us-ascii?Q?N9z896CP/To4Mt31+qj8xJYZd1tfQmBGUryFSzFCeZOrf44dKlwPqiUjvSBt?=
 =?us-ascii?Q?0YfGjrTaFzsU6AEbHBUefk/l0jMHUsvZA8R8x5b73tGXa5rBZPgOuzrhn64k?=
 =?us-ascii?Q?LWQqLIwEs9syERRCZiaCYg2/9SJaYIWWTcLUgQMijK0l2Oeg0cNQhQ8mRPu+?=
 =?us-ascii?Q?0FISLwWmjIlwHSJUqduMQse/MEotGvMKhYfxM6z1CJF5nyAYHphLJUUxWJTt?=
 =?us-ascii?Q?6m0WVHO3KjTKbtGyMX/w6AnKDUTgp+ZOCZ8sKwY+jnAeyyVALTSsie+5kkjX?=
 =?us-ascii?Q?5nYaqdJCIQi3fLcksP6d9C/7UBwG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rR0Mtojp+KdrnxpvtpB9pyZFTSgqhcWuiYJyLmuk+0B5RvSPueR01CJyzlea?=
 =?us-ascii?Q?NTMW8aonObsgb4aambuhAbimWa3cFiq6J4fjgknNHXW4XrIVRwxtyc+nlGav?=
 =?us-ascii?Q?zhpdq9qFfZJvgjfgo+t1lBLW7WkxqL8dG3Y9AEFDoOV6aU7JDmz34CsJ2Vv3?=
 =?us-ascii?Q?8IgZEJ1hCdCoYYvCWCbjKUQBJcZ8JvjLgBIOWbKG6IK0aerdnl+8sZ5HlVoT?=
 =?us-ascii?Q?Ro4pCZ35U9sGF0H7GHSlm2jUNe8JSs036W+NknytIcd5bn5iN3637GdxTKIX?=
 =?us-ascii?Q?mfwfpDK20AyhXcp0RUlapbGLqmzRf3CrY1zD0fqRqMmYsfOXttvkJT36TdyW?=
 =?us-ascii?Q?0GuxUmPhzu73Bp+mT2e+xFpBzmgcurQmk2UO7Fw8Yx/OZeh0gG2b4V1GsIdh?=
 =?us-ascii?Q?Rc3YGKNctsd3g2bLqjiiN/pSkyOUpRxJ6meTTtJcs5ASiFPdDIhKm0BCvpzO?=
 =?us-ascii?Q?gC/e+vLPOGF6E1eDh79Y8vZLcLeyhoD7fgZCtXQu1uqGtLRPCaYgLaOI9xF9?=
 =?us-ascii?Q?Hv4q+heHCEstvZje4BP8G6YFp8jxwzellzcpoGgvVNifEQwsJEHm90RljMkX?=
 =?us-ascii?Q?lex1fFCwk9bJ6OUTwjmfulnpG8+GdYwh4MBTT+vmDQzwr8V5Jnevp45QB5i+?=
 =?us-ascii?Q?HsVT2gfqWguDnm8lYHDrJK7mZLLIej+NrFVXWhCp2RRGsxgiA5mWxV+hQE3g?=
 =?us-ascii?Q?fn6QR7eqshBojZwcDA23VhPWyAu4FUKKAr7vpNcfSr5h8Yelze5qkqfpMMh1?=
 =?us-ascii?Q?vqAEIGvSu1pZmZf9N+XQz1crFJTVt7qfHmFHNlCY5dRJevKPKqBgoIlQazGX?=
 =?us-ascii?Q?GmVUG4bOyp5rgNVCrePSrm904W/Wbnbi9z+XilbvQ73DnQqcmqs1/LKLddTa?=
 =?us-ascii?Q?v+S8q1nrVVnHrTKlIH4lK0+rQqtSFk5e0zxanOzhWsi5PLNqFvarz62Pigaz?=
 =?us-ascii?Q?SW2nfBfig9oNO1wSnBrtuGyeE7ufrCoJlpdKflbWlalherZ2GVSxHEUwJoOj?=
 =?us-ascii?Q?jeuQgP7oy7RK4AjfscbasOvnFOYd+UzPhk5kDiSy/H1J5GpeIFCha3AffNxq?=
 =?us-ascii?Q?7Xt7X6El106jT4wMMDbqCQTBXK35OubavcvTuJ+I3+hFYAbwONUuGASL6JF2?=
 =?us-ascii?Q?Pa9RTWNl0mjw5toOkqQDqieMHF2RuNTQg031cWueYBZGu5zYZe1fGn+sWo09?=
 =?us-ascii?Q?pQJYlWlfouc2t0iRB9Dhhn8d0+uMm5Qftiw42+ukGPX6LOFex2mLvoHtAdJg?=
 =?us-ascii?Q?V0N9xHb9+ocld1U8B7wkbSts7xIIiH88zLiGk9mw85I0YnJ9zZUSjBekGjuq?=
 =?us-ascii?Q?MmUX+9b50kEzV9hyJkMfwSI3UY7U5OFCdMErxzJjbv6j4FvwEw4xi7tUiMCF?=
 =?us-ascii?Q?7f5UqrxAOQtwG6LsYzqOS/oRoH94Zd+lLSkTJ5lPfhhskxBfnQAHGpD2mzhw?=
 =?us-ascii?Q?iQuLdW9wzyqRwXuwzqBm8nOYuFxPxExK6KiYq3ovI4ncaHbKxgd+8Hcrm7Jv?=
 =?us-ascii?Q?aCrHuEoxQWkvrnv+rrSyUYTYG27ZKIjlqBpj1eBUo6Bmmw0VDQK0qF8Q2a55?=
 =?us-ascii?Q?cO5vBwTK8Q/AAIhbR2woHy28aBcwm5yvnjwqv+cE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db3a53fe-1ee4-4ad6-128d-08dcef4f4de1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 08:31:46.9557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Vu4XF4vQAf2yMTgs/8eOhmSQ+74lFCh0BMRXLfMs9nvXw7j5wHkWUWRsA0WLnDcsqbW7XgqQ0sFKjgu68XgmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7622
X-Proofpoint-GUID: Lm7IvcDZdp9_1w7w0KISt4_Z2Fr2kFh5
X-Proofpoint-ORIG-GUID: Lm7IvcDZdp9_1w7w0KISt4_Z2Fr2kFh5
X-Authority-Analysis: v=2.4 cv=cPWysUeN c=1 sm=1 tr=0 ts=67121cfe cx=c_pps a=OemXRkCljtmPz/OzEC+nkg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=mDV3o1hIAAAA:8 a=8kZsg1-Dhga2kE_UXJsA:9
 a=1hinXumtVEUA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-18_04,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 malwarescore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410180054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 08:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206040

From: Chen Qi <Qi.Chen@windriver.com>

The '-fdebug-prefix-map' options are used to map source files locations,
otherwise, DW_AT_comp_dir will contain buildpath.

The '-gno-record-gcc-switches' option is used to fix the buildpath introduced
by '-fintrinsic-modules-path' option, which is automatically added by fortran.
Here's some output from 'readelf --debug-dump libgfortran.so.5.0.0' when this
option is not added:
"""
<0><1a37d3>: Abbrev Number: 4 (DW_TAG_compile_unit)
   <1a37d4>   DW_AT_producer    : (indirect string, offset: 0xd653): GNU Fortran2008 14.2.0 -m64
                -march=core2 -mtune=core2 -msse3
                -mfpmath=sse -mshstk -g -O2 -O2 -fstack-protector-strong -fimplicit-none
                -fno-repack-arrays -fno-underscoring -fcf-protection=full
                -fallow-leading-underscore -fbuilding-libgfortran -fPIC
                -fintrinsic-modules-path /ala-lpggp72/qichen/Yocto/builds/build-poky/tmp/work/
                core2-64-poky-linux/libgfortran/14.2.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux
                /../../lib/x86_64-poky-linux/gcc/x86_64-poky-linux/14.2.0/finclude
                -fpre-include=../../../../recipe-sysroot/usr/include/finclude/math-vector-fortran.h
"""

See https://gcc.gnu.org/pipermail/fortran/2024-October/061204.html for more
detailed information.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/gcc/libgfortran.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index c68645e392..2a08872c25 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -8,7 +8,7 @@ EXTRA_OECONF_PATHS = "\
 # An arm hard float target like raspberrypi4 won't build
 # as CFLAGS don't make it to the fortran compiler otherwise
 # (the configure script sets FC to $GFORTRAN unconditionally)
-export GFORTRAN = "${FC}"
+export GFORTRAN = "${FC} -fcanon-prefix-map -fdebug-prefix-map=${S}=${TARGET_DBGSRC_DIR} -fdebug-prefix-map=${B}=${TARGET_DBGSRC_DIR} -gno-record-gcc-switches"
 
 do_configure () {
 	for target in libbacktrace libgfortran
-- 
2.25.1


