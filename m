Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D66C61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 17:03:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12793.1788455027643409314
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 10:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OPqB0viN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=370613ba34=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683GFltu2993854
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Sep 2026 10:03:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=2sFfAYiwL
	7i5i/Kwwl6IpiGCw72W7o+ecDq8bjoXG5o=; b=OPqB0viN5UdyZ86BPh7wLEjI8
	jzx7qh2FWOFRUZQvGJVSZ2XiksM0ZAxZkLNXUQTGBJykW3GEQ9ZFZXUnMfo1lc3p
	KpbiZosgJejS/48A5Exhm9riYHS1MV0xOG6JSy1M9Lbhuc6eFkBA0XJlCLjaNSf9
	GLDazUja6VIQTJ5dcjXWB+gQ32kTjCEDT6Rg+vhHZ5R6+iV3qhjD5KvUHuHqv6YV
	9kbrz5ZI1kXNr/f+T+PakJqBxXTjcTGFji4gOzLkYFzB+2V6WjCEqlL2N2unlwvp
	lbemd/1GfSpCqjmjkRPg6CJ1YQZlcgFjRkhOZCWMPGaxQe+ZIaTLTpLh0PNnw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021109.outbound.protection.outlook.com [52.101.62.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gfc8p0319-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 10:03:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dIi3HEuG/wXCS9SWkVVLDOb9NyG0RvXXXMZQbdty3PTPpvRDM8oTC0ZyHSWxaoBIbDfJKuktWpaXhXAJuOM86uTfp1nK2ii4VCHJ/QVZWr//zrE/7u3tW8LxYVvKnEWOjl1Ka4KiSEir4UDXXFRPLGrnHNMQYhYJ/Wss/nOOy14hjiGyq/i94U8ziYzLcfVPUI9FpdSObRVJoAHEF/uDmYwHU0GDipmhHzvqpkfrhcMLZ9p2krfdg/p+33oUL9ihvFE6oJBhnXlyHg2UdVnizw2D2yRY1Ld0vlY9nrBPsmD+ZnEg3iAOhTrQm5E7fzCTg/p4VvjQlw65p/3JUtGBEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sFfAYiwL7i5i/Kwwl6IpiGCw72W7o+ecDq8bjoXG5o=;
 b=to8y80nQfbPCzmQEo7QfXOE8FJTq0bCfVc/6VwjzQO8Rj+azTmZWnQecFBeVITYPVYe+dYY2ga/mqKAQuA0kcllJ6Z6OOYPDfB1lX/9JqaQLZQsF1WvMNphIJ7fa6GPJrT4G2IMbfXTxTZyNOxVfaon6QAOCY/g+Se9umGAZ5I+MikBCQKd+go8Nyjc9W7EzpKi20JKnSPAfFYYPrL05FbME8B39FyeSH0C1VkLZB76hqNl+3IjWyzV76mBfxKmr+X72tzgnT/EUyYeMStWEuXP92cC3+oV4AXAWt/m7V6dg1RUozRd0TFYaKPrQrEjuTOOFnntxGIRlHO1Pwba52Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 17:03:42 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%5]) with mapi id 15.21.0360.006; Thu, 3 Sep 2026
 17:03:42 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [wrynose][PATCH] glibc: fix CVE-2026-19542
Date: Thu,  3 Sep 2026 10:03:11 -0700
Message-ID: <20260903170311.3316373-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0231.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::26) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH7PR11MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: b8cd4a97-0d09-48d0-41b3-08df09dd4eb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|23010399003|1800799024|11063799006|38350700014|56012099006|10067099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	/4JON3CiLOm0+Jkg1UJ8oLfT4dUM2qWLKnZRwzbYyrO24tnAP1PWSMklVztpzQ44eLlKsAyBvJQK6pCFKLJOSJH3/D/yYafJS/UUz/gOVUPfN0wdd+1xEWqDKrRdP7U2Q0LxhDpJCjswJNTn6BPFj+zKJ6NHf3mxKmDd3reVHsyRf1fQAjRji0HXOlgBvoR2MaXxl1zUCyHT9aOBa9ielH1dJw8wjf72NPJQP/8gLL32NS++VmZQmA8OWALx1j/yb4yvc3RWse753Ob+EyVnwyfNyi+GdU/661/PfQOuAoujWu4U0J7N5ldMG3pwQat5fLKUPjrB2Q3svq94/y5S0Bb3bAp0wPnZZr7ZZwVn/BuPwmOVYU6/MrtFAu9PrNOKP7XWzs+JfBnTzpZ4mW/y3Tag999JxZGeNe95CjON50HHdc+5eDNeRDLku4DULqeFfUXN8yF2FyxgQTA4ffyAZeJJv7aQlMIvHM5VmK7sHk4ErNwLJJVuUqheA3DaCoghH1IZTKVKamJc2e6ddFJ+VemtwFICX0EegDf6IAC4aJpcxTQR8zmSi2RNd5lsUQEe0tsBQlMZd1AJ0dcC/Q9AQc9PCIfyD/zDxZTqV++KM04pTTlFuR7NvDkFq929svO56Yqgye7w4XR6tmuWCQcXJ1WR33En/tSxA96hfKmhsxk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(23010399003)(1800799024)(11063799006)(38350700014)(56012099006)(10067099003)(18002099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7WHNRf+h+v9NkCu4XAgOBlnJAW4dD5sjL/I9lI09Bq3Yrup2acRF3J9CK5L4?=
 =?us-ascii?Q?7cX3PawH7D3bdbh7QLKcB+M8t1ordv5H3Fm6pjurSgxQ7cPLgLOAtrI+kY0V?=
 =?us-ascii?Q?4XOKaTauqC/z6KRrh36t1N6SJ7aYkpnf6UcyR113/QNG5sGcvAg6Y6F9T8KK?=
 =?us-ascii?Q?pV/aRTTkAyfKjp8/yhgGGo2S+rXeehI853oAMVsdNgtwP1ME0nDOyNwdkHbe?=
 =?us-ascii?Q?qybM9YyoYQuUO6woYZvZZ/hJh0JoEe1olfrV1hcDNSFWCTY3tUL8o3KfTQp2?=
 =?us-ascii?Q?jlDQOKbVlR/h9cRD2Jb0GalQ4M2jT4eYw44xeYwS4BfTfHq95YO2nPd14azM?=
 =?us-ascii?Q?LXbw4JlXzll2T2bm3tcmgQgWaD3VxSxJnTxW75FXd6yrW04jzAJUL0miKdqx?=
 =?us-ascii?Q?vKyKszpdbENffxxMDhgks16yTCe8Wt9nHtonlXpMUGopLvzG8OdrqDHLrrYG?=
 =?us-ascii?Q?DceNSpsrrPzyEM0MMrMwHvb4hxpQ+xYyi3inBgH+XLTr6f49fk06UotNPEgy?=
 =?us-ascii?Q?UbL3+TcYWpqS3icnT5w2t7Vuo8ouj1F5tJK47zSo3qLPHW/5hq3x+z4Xk3QZ?=
 =?us-ascii?Q?v9a8biSrDPU3NszNkcJVkgv/eHQO6lRo3/8jJ/fWdSi+PvNa+E2cFK9oAsbB?=
 =?us-ascii?Q?zx3D7dv4ByILXjIswa7Hjx1dONvaYLH1gvDZVA2DEBW5gQs37cKza/UWh6BG?=
 =?us-ascii?Q?vw/mmD/jpI39kDsOe8WA/NC3KAiaZo0/HA1HGlw8Vbry9CJ7A/+28WQLeg6G?=
 =?us-ascii?Q?avkmaxJXNydkfTtAOErnubCMzgOZDjP7xDnd4Z/xHCHrcQsbCd0xfD9zXtvY?=
 =?us-ascii?Q?/D2/4Lr+gGUoroYLe3K1jzxcEC4VfoPBcWuGvfY/rC8cgqkxUfqw8BR3hLSu?=
 =?us-ascii?Q?bjIgNZlk7CWTjq26vq5xOBsGFVadSiC/RaiF+uIW8DoKxgTNxAymUk0dubUR?=
 =?us-ascii?Q?1onTUehiJSgPXC0iT5AD4SOSDdTZloC67BDkmLd106gDps68qxOJjs9bS18r?=
 =?us-ascii?Q?R61iyC21ZzVSx4k6qGcFioEPoeDIwlCBgLvAV5FO+5cZCHCV3meaRz5u7Ibg?=
 =?us-ascii?Q?KowjgnVaZlkKIKWAlQseXQAO+WjXHE/rOJJQYCYO1O+OGr4xx3gGwkpwrhSS?=
 =?us-ascii?Q?+WIx9pQDrby3CUMb7iFiNXnkKvLDWf+1oozWcxpGKjxn8YVXa+4B30M8TNlh?=
 =?us-ascii?Q?rUTaBx7ezwQluctcZgR7zgR5gDljgMkBzVMj6egJlRo6Wi6bmT6W8aiUzTLy?=
 =?us-ascii?Q?hTP+/vnaQzW4mEZcgr89D0b1WESH6iF9l2VOTNhp7eDOgtZcW6lLb/eq81Rh?=
 =?us-ascii?Q?CQLb9M/rF+g2Hm+0NHf1THdZXECXn37vHikcMGw5Y86gEJbwfvUYcqvRGawT?=
 =?us-ascii?Q?56unUjrRXU9RQ3imRQj2pEdo4QhsdGWKAloGknGWo523YWnyeejycoXWeWtF?=
 =?us-ascii?Q?pNzKkel1/+NQuXKLmUUwQn21+h2N7nFHKBBUbyLaN0HW/Mn31Yd60+CzQFKM?=
 =?us-ascii?Q?KV06wT7LifNzNtmdqy0FJMlUDKFjOj0e18Y9sO11sOsZv30SLAVdjUPSdSJD?=
 =?us-ascii?Q?qXRqYgEReBoo+XaAD/Hd+qBARaZduBS69jrLcJmRelOgqF69+pW2BQy4wLCm?=
 =?us-ascii?Q?5fhzC3MM3oHg/fp7iK6iGNzL+oda2CNN1jYO98PAdyg7kMVGENU3H87K9YGa?=
 =?us-ascii?Q?xw6VE/vIQkUsHq2HxDt0eCdq1JnsKHZfSdJWA2RSqVtlB5U9iHhJ8WZ2T7C9?=
 =?us-ascii?Q?JOHk1BPF2DRdK9xczlGPOdpNU30GOmE=3D?=
X-Exchange-RoutingPolicyChecked: 
	ToaLTFNWp0FO90ocfaXIlCsAiBJt31YYe+aZlFWIN2kxjdn7vX5P92QnPK/9gFoS1d2hmRSNIUJ+qGNuHI7J+ENvZ5jbgyF8RtEDIDRKv7gwVsYYYWzEcccgpJJvR7y+bEk+imQ7PFwcKmw19blljrIpEJrPVHrRs58x3/a3BChmDUcbCkzfRCeKa3yYvn0dn2/hEfoR4CIdoPKVtZpU57W8OktoZCnno8u3Z8vXorNgiD+dSh261OnHradmhy7aeL5FDMk/uNE/dme1IWPYPYlj85j/i4n5ACTNoz3hJWocldfdCfSSLQk9xvJPuVb77ymp/67nBMnZRvJzOY8/bQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8cd4a97-0d09-48d0-41b3-08df09dd4eb6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 17:03:42.4543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBhGRk48qJSYElHDxpcRazTyw/bJ0SuACn9O+t0x1gSS3ZkpyL5rv5nDL2SvZ06OfX+sN7o+46+h+Hhvgb36FnAyTHWqpspcKdmE7vdX7NY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8252
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE0OCBTYWx0ZWRfXwsmQICEym2p7
 Js5/nT7r2XgbOiJBwHgQIQ45OFQXcWzfIym9E9VJhXeeynd+b2CM34hiSzwaBvv0swpZdEmijs/
 DCOb/JlF5hGUVPqUdAn17hp9SxMZ1YCd9x2Z8CAbkDQ/J8HTNuzz
X-Authority-Analysis: v=2.4 cv=GZcnWwXL c=1 sm=1 tr=0 ts=6a99a872 cx=c_pps
 a=4XUxxCGR/dZid869Kuw6NA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=CCpqsmhAAAAA:8
 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8
 a=G6R0OveSbEgIj4TFKTsA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 46OBTzfohBQAmTLRqVjfwThJGmN7fZh6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE0OCBTYWx0ZWRfX2Goyc6tBQ/R/
 qLeMAKbg8FWrcXGzhqQydmTTeyKWZ2Py0oUlse7nd9ASOR6wwahsj3OHFhWQCvLjEnjTd8x8Zcj
 tDQ8Za2RnraBcs6gnhNMu4eSOQvAdow95bgqIBajB/hg/w4AXe/UNtLpg2kKr6j6egZOr1ZVyFk
 KoSbBCf86JnKmGRmg0uMJzrCouigLd5kvu5ZFv6CG1fjXmCI9dnQFfqVz6NEn3D4eEt5zjd0LNo
 TiiIVSnRmnGtNO2H37tvEB6ZrpIdO/66NPUIxm5VhEei4HhPOXAz4j2ZjBzxetcMZG3B0JeNuSP
 yzDETjtjBQyD56XXEA3BxPaQODhtvrr+ecxXQ1usSedqzoGicgj/Gzj5vqSrqc11qD0Dg7kLrHK
 Lm/3B509r8eStr6aC46nTnLWIYPFbt4HndXUpFi8zYENfaxHlqyuJWsJhxz+086iCQd4Qt86Am3
 YuFzBmxVL9Ev03gzNMA==
X-Proofpoint-ORIG-GUID: 46OBTzfohBQAmTLRqVjfwThJGmN7fZh6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 17:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245036

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Allocate the maximum array sizes directly, instead of resizing
the arrays as needed.  This eliminates alloca usage from the
function, and fixes the out-of-bounds accesses.  The asserts
guard against the bug coming back if the balancing of the tree
turns out not to work correctly.

Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3]
CVE: CVE-2026-19542

Reference:
[1]https://security-tracker.debian.org/tracker/CVE-2026-19542
[2]https://sourceware.org/bugzilla/show_bug.cgi?id=34506
[3]https://sourceware.org/git/?p=glibc.git;a=commit;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../glibc/glibc/0023-CVE-2026-19542.patch     | 98 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.43.bb         |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch

diff --git a/meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch b/meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch
new file mode 100644
index 0000000000..d4b42c6ea4
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0023-CVE-2026-19542.patch
@@ -0,0 +1,98 @@
+From e2789c46e3bfdcd67a82bea9946b315c179e83d3 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 14 Aug 2026 13:41:16 +0200
+Subject: [PATCH] misc: Fix out-of-bounds array write in tdelete (bug 34506)
+
+Allocate the maximum array sizes directly, instead of resizing
+the arrays as needed.  This eliminates alloca usage from the
+function, and fixes the out-of-bounds accesses.  The asserts
+guard against the bug coming back if the balancing of the tree
+turns out not to work correctly.
+
+CVE: CVE-2025-19542
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=patch;h=e2789c46e3bfdcd67a82bea9946b315c179e83d3]
+
+Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ misc/tsearch.c | 31 +++++++++++--------------------
+ 1 file changed, 11 insertions(+), 20 deletions(-)
+
+diff --git a/misc/tsearch.c b/misc/tsearch.c
+index 9b2eb34b25..e517dfa712 100644
+--- a/misc/tsearch.c
++++ b/misc/tsearch.c
+@@ -85,6 +85,7 @@
+ #include <assert.h>
+ #include <stdalign.h>
+ #include <stddef.h>
++#include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <search.h>
+@@ -406,12 +407,13 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+   int cmp;
+   node *rootp = (node *) vrootp;
+   node root, unchained;
+-  /* Stack of nodes so we remember the parents without recursion.  It's
+-     _very_ unlikely that there are paths longer than 40 nodes.  The tree
+-     would need to have around 250.000 nodes.  */
+-  int stacksize = 40;
++  /* Stack of nodes so we remember the parents without recursion.  The
++     stack size is a conservative approximation of the maximum height
++     of a red-black tree, based on size of the address space.
++     Actual numbers are closer to 57 (32 bit) and 117 (63 bit).  */
++  enum { stacksize = 2 * UINTPTR_WIDTH };
+   int sp = 0;
+-  node **nodestack = alloca (sizeof (node *) * stacksize);
++  node *nodestack[stacksize];
+ 
+   if (rootp == NULL)
+     return NULL;
+@@ -424,14 +426,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+   root = DEREFNODEPTR(rootp);
+   while ((cmp = (*compar) (key, root->key)) != 0)
+     {
+-      if (sp == stacksize)
+-	{
+-	  node **newstack;
+-	  stacksize += 20;
+-	  newstack = alloca (sizeof (node *) * stacksize);
+-	  nodestack = memcpy (newstack, nodestack, sp * sizeof (node *));
+-	}
+-
++      assert (sp < stacksize);
+       nodestack[sp++] = rootp;
+       p = DEREFNODEPTR(rootp);
+       if (cmp < 0)
+@@ -470,13 +465,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+       node upn;
+       for (;;)
+ 	{
+-	  if (sp == stacksize)
+-	    {
+-	      node **newstack;
+-	      stacksize += 20;
+-	      newstack = alloca (sizeof (node *) * stacksize);
+-	      nodestack = memcpy (newstack, nodestack, sp * sizeof (node *));
+-	    }
++	  assert (sp < stacksize);
+ 	  nodestack[sp++] = parentp;
+ 	  parentp = up;
+ 	  upn = DEREFNODEPTR(up);
+@@ -541,6 +530,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+ 		  SETNODEPTR(pp,q);
+ 		  /* Make sure pp is right if the case below tries to use
+ 		     it.  */
++		  assert (sp < stacksize);
+ 		  nodestack[sp++] = pp = LEFTPTR(q);
+ 		  q = RIGHT(p);
+ 		}
+@@ -625,6 +615,7 @@ __tdelete (const void *key, void **vrootp, __compar_fn_t compar)
+ 		  SETLEFT(p,RIGHT(q));
+ 		  SETRIGHT(q,p);
+ 		  SETNODEPTR(pp,q);
++		  assert (sp < stacksize);
+ 		  nodestack[sp++] = pp = RIGHTPTR(q);
+ 		  q = LEFT(p);
+ 		}
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index 9f3a3814d0..3ef2301191 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -55,6 +55,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0020-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
            file://0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch \
+           file://0023-CVE-2026-19542.patch \
 "
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
-- 
2.49.0


