Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADAABC433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 20:23:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.33160.1669321373159104846
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Nov 2022 12:22:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=C+ioaTws;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83272b3e81=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AOKFbFm006088
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 20:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=tjym3zEIE2GwK92CWG4ts2pBoe9NmbcRXeANFrpsEUk=;
 b=C+ioaTwsPrOH3+nXyZIKreRYit+VGrvrvCSIUarON1qy+AUHPB+rdXb0SoYP58TfuP3s
 6bgMVhmw1xiXqAv6XstVFniOx/5Z6trxrrUQdFUP/T2bncjGmC1duPJYuoFdPzL4Jrmu
 H/kPzUEpoq+ypKnqbvDOt5OYCdHmLLj6zF3/k3f4yZ5CxJdYhz2g6kMbWF0RbadxyEzF
 S25emPzAw5ZPif/ZHpK7GmJgKq7t0uIBMkib/jAvwxvqc53anb9Mn7yhhnkV23Lc0Gui
 cZAaHfquX+x1McQX3aFCnWWUKSvH+xiFumfZljeFcoC1zlB7dNPd+glMdMLw23UcIXoi ig== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxp48mgen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 20:22:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dj4mKvUKbmk+ot9qTjXGd5za+c8ts8A0ctIw0owTmYLR/fA/lp8D1mkwIbQLo3eB+zLYXKtBWUj8dwkPse+cDfTmcvKCaCaUde7cXwE6h+92yoEY4vYYzXTWFsaXiwcQLyQfjjzkU3QykPR0ayKelx0MJkY4Eomyz7sqHQRWgG9eptgmeDcrYZrPoEMU5Gmuji1vQgzlTaYt7VB6xAaumG+gjIdk/kwBQagHnA89IbT5aiFC6LjvGdNT3nAhzNwMu3JqptDVzGF6w5pyu5kFWA6gLhGlP+DxbuqubtaPO/HTmtPDhMmd/eyUKM/R2m7ASxDjMT3yJeibCmEJWezU9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjym3zEIE2GwK92CWG4ts2pBoe9NmbcRXeANFrpsEUk=;
 b=EyKDE9vYmna48AIphaHi066T8P1+iR/9eoXMi1klCUgt0yeJvPojUK8W+e/NP0i2yBRnPZg07LJgGCbCO6EtfJ2mLW0HjP0IMCQwI1RqVZYDobbWYybUihRCXiabqzAyxbK30J55k/WGUjihIswCH9hRiiYXkBEzlJtV3LSX0FPybE97FJampaYb7CLHOB8DsRznUbUjhHJtIqwKx/+LDedEZD7lQyt3skDNoyYCUr+vJzZfTJ3fAtshEaMtvzDlWyHBOxQbrpKzXSXFLDc4nFH0yNpwd5y+7FgDcw58oESJB3+WN/8XwULcQJYwn4Bk00cXJ609oeBXIWNX0qI/1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 MW3PR11MB4524.namprd11.prod.outlook.com (2603:10b6:303:2c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.19; Thu, 24 Nov 2022 20:22:49 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3ec4:f05a:8bf3:59e0]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3ec4:f05a:8bf3:59e0%7]) with mapi id 15.20.5857.018; Thu, 24 Nov 2022
 20:22:49 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] go: fix CVE-2022-2880
Date: Thu, 24 Nov 2022 15:22:31 -0500
Message-Id: <20221124202231.3210199-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQXP288CA0009.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::20) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|MW3PR11MB4524:EE_
X-MS-Office365-Filtering-Correlation-Id: c6cecadf-38ba-473a-327c-08dace59a7d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KSiQeb1lbuwQfQxKm5Gd+9dV+pln4MLVOcaolt1in2a67IaAkeNd041UslIYZOtr38Wkjv+MlahlSiJQlsyg7IdD2wdSC53/EeONOWjuycr016uJM1E7PguZfQBRpIYHtbd3jlKlTucuE112pmx1SMB8NLodtatt8JNIQjRcLPRFf4pdhcJ3omJLhrkQs45RQUf07F8qXnqF55PaCu1Ff8twf84NkOsPNKDUKQaNrugGSuAUVe7fbqRjicKyfw6Yybm2mDD0Y6tdUi99bMuwU7jH27aSW7rjFcTv8L0vrEmBnXIWfbzq5/asujH9zGL/xCFsqqff0DjCB+9NfsA1e92OGrXLxX+xeywiBSRRHljBDpzVRLpdcMVsUUV36iRElLTr2o5OSK9enykLXoyxtgehniUwC5BUWqH8OeawGVq5aMqtairCLEynggf3ok9iewPsK7LXHnizVQr6lEHyGZ+3cCFXog3OGwbHNaDEodtWD3oS2Qi0Zpya1w/oeszDv9YnICG4oZV0Jb4pZu3ZOHM/MiA6sDlF1uBllK907JWX8AqLwMiEGWapHE3la5gDs9gEZAViCy24hQu5otsFG//1/mujZPhDbsCr2TEzMEYeG8fUgDSOUBlIANuRutt/QaLVJl6upv1FCKUpI0DRPSRc8CTCagRTB99YbOJEAxaapAmDquEKuRKUEUrcYRjGJ5nyBu0//E9miQWMIpfAfgs00DFxCRODoZMLK0YltSc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(396003)(136003)(376002)(346002)(451199015)(8676002)(66946007)(66476007)(66556008)(41300700001)(2616005)(5660300002)(186003)(1076003)(8936002)(52116002)(26005)(36756003)(316002)(6512007)(2906002)(6916009)(38350700002)(83380400001)(86362001)(38100700002)(44832011)(6506007)(6666004)(478600001)(6486002)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rEDdKFfHLcYdMfxcNj6YyPZy09m9qZyVWvPsOxfTBhO5Kl6e4CdeHfwGxiuz?=
 =?us-ascii?Q?GsWkUzqHV58+q8FaPKC+i/1zKZKoQBSrLo16F3WKPs+h6j7uXzeT/AYA4k03?=
 =?us-ascii?Q?aK0+asc3CsKIVKMFZaciNT+xqFqyK6ITz/QfyosB0R9/p9L2fL1i9GR34bvs?=
 =?us-ascii?Q?gZPAw49tTlHl+NBeuU/KFuTaEhE/PjeY5dI//MXVyTHWFKdY17OxrwBNhm1L?=
 =?us-ascii?Q?xqecZJ8qqO4mGPmdNmqoKVd7UjMayvfobamGhFlKG7Vxr4dyPUw7VTdwigxH?=
 =?us-ascii?Q?h+/AmaKleHxzN464BKpkwWFSBUku8thyIpd2Xv8xaCFTr+10lb+g0C+bjY2x?=
 =?us-ascii?Q?Wattd0V+CbWhvk7JOpv3jiLGgtGcpivs++6rHb+qSgVguhw6P4LSbGncwo8b?=
 =?us-ascii?Q?j7ZKqwh3WTddR/aqEt3YO050dKapY/BK8lpDzlBo2sROWxEuMp+OoaxLCdIj?=
 =?us-ascii?Q?7ls3AFWpQAYgyKFZgSnuvh41ShTvO71XOoQU2H7Ohd14RF1UrzwyYI0XQ/B1?=
 =?us-ascii?Q?DSXYGkGq1OFc4lCVGAg1jIeeOsmSkISIUWNidv4ZkG8pCk+tt2AiUoHw36HT?=
 =?us-ascii?Q?xGfyI65b9Vwj49tGvDPX6kjbtQu6ZnYuCh3ND41VRqSEXg14g2w+2jWJlT3Q?=
 =?us-ascii?Q?7qmO9XfdOArcWRLsc8r4GDuwem5YBKKH9fFWR5Ne5joRI6nOhjUGKWbxMaD8?=
 =?us-ascii?Q?t5ZdLVkqE3EOZaPjkZ+UiZoIP8r8gZmR9E1gbUEKp0qR7CkjKNqRcCwYVC98?=
 =?us-ascii?Q?McraZDDwGbnxiCrXr3ORBnGXM5PnUc+FfgDXRHSou7lwiUFaoXuA/nUoxTVr?=
 =?us-ascii?Q?rtyDpg3rqgMVnwqpMEcU5gl01sp22W72H4ED5MEECws5cNLk60XP8kqrOywY?=
 =?us-ascii?Q?rP8ccsNRgiLjxQKrOmOPTNzPv82vGRCOfXOGv0DpCF6+K3i0mHAn0Rp9/22V?=
 =?us-ascii?Q?zqqSo3fo25HNbo57WNuS02kZ9Myeh7gwWubZ4btRwNd2/O2X1hLFV0u3tRtB?=
 =?us-ascii?Q?y5t4c2besbCVTtF+ZsHeX2hfJsD6NxrjdeHPr9xY7o/B/ZM7gxA2OMylp1Kn?=
 =?us-ascii?Q?R9Tq4QXX65Jz4x3uZP2cOeDS/Y/cRGEuAwtqgRUsBrQwurYNtpplJ/5kMGxc?=
 =?us-ascii?Q?Oj2iPA8/2wydo2Xzd6bmnjfyvGt7BC7vk+vx2bZcjzBJyv64y2NEvc6UPgwn?=
 =?us-ascii?Q?lEHPuTIz5T0MQaSpoYF98X+zhC0k7KZ/3DJn+uT8GGlbXiWP2n/GXTxd3voe?=
 =?us-ascii?Q?BdB4458P4n7m6dUUNbQ9MeLOFMgldM7sptfKBYkk9GsyaVN91XEnadVqCM3s?=
 =?us-ascii?Q?gLuXDoCCG1GO4fl6CqBHkHEE9u99PFPpcHA2cm7IVpwTqqt48UVW50bkfOdI?=
 =?us-ascii?Q?cH3XQDrDEOo0QvTxmqyywQUuxsBaKSPpcy2iBL42cyuuJo+fKvFZCMscpoPU?=
 =?us-ascii?Q?mS0MuFNkSXB1AzUMjQwX7tmty85Evzhmb/FpzH+ZWTXyyIMwjUleSUdSlsZA?=
 =?us-ascii?Q?3SN3u6JUhIowhqKhWIHiieWAFZNy4k7eBdp7+hWwVyGv5LmGWSM41R1O3ol7?=
 =?us-ascii?Q?qlRFr0VbQL0+JTINM/1q874vpjvuRHDRzIwbxQ+6lvzmS92PeUyUHCwEv/OG?=
 =?us-ascii?Q?7w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6cecadf-38ba-473a-327c-08dace59a7d8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 20:22:49.2377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEjHpGIptxY3NgRBwvXkZI/OgSaBQ0Px6QVDLc1UYuqj7PqTt7II7OqW/HQl3zj1095vyr+o2Ow9Jx7AEWre6/hgiFk+WX8/d0VhyprYxzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4524
X-Proofpoint-GUID: 6SLvC4jQxigZqhWZArJaEYUumBzTToxs
X-Proofpoint-ORIG-GUID: 6SLvC4jQxigZqhWZArJaEYUumBzTToxs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_12,2022-11-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211240152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 20:23:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173756

Backport patch to fix CVE-2022-2880.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 ...util-avoid-query-parameter-smuggling.patch | 178 ++++++++++++++++++
 2 files changed, 179 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/0001-net-http-httputil-avoid-query-parameter-smuggling.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index b18de66f42..9c467d63b2 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -17,6 +17,7 @@ SRC_URI += "\
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://CVE-2022-27664.patch \
+    file://0001-net-http-httputil-avoid-query-parameter-smuggling.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/0001-net-http-httputil-avoid-query-parameter-smuggling.patch b/meta/recipes-devtools/go/go-1.18/0001-net-http-httputil-avoid-query-parameter-smuggling.patch
new file mode 100644
index 0000000000..80fba1446e
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/0001-net-http-httputil-avoid-query-parameter-smuggling.patch
@@ -0,0 +1,178 @@
+From c8bdf59453c95528a444a85e1b206c1c09eb20f6 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Thu, 22 Sep 2022 13:32:00 -0700
+Subject: [PATCH] net/http/httputil: avoid query parameter smuggling
+
+Query parameter smuggling occurs when a proxy's interpretation
+of query parameters differs from that of a downstream server.
+Change ReverseProxy to avoid forwarding ignored query parameters.
+
+Remove unparsable query parameters from the outbound request
+
+   * if req.Form != nil after calling ReverseProxy.Director; and
+   * before calling ReverseProxy.Rewrite.
+
+This change preserves the existing behavior of forwarding the
+raw query untouched if a Director hook does not parse the query
+by calling Request.ParseForm (possibly indirectly).
+
+Fixes #55842
+For #54663
+For CVE-2022-2880
+
+Change-Id: If1621f6b0e73a49d79059dae9e6b256e0ff18ca9
+Reviewed-on: https://go-review.googlesource.com/c/go/+/432976
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+Reviewed-by: Brad Fitzpatrick <bradfitz@golang.org>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Run-TryBot: Damien Neil <dneil@google.com>
+(cherry picked from commit 7c84234142149bd24a4096c6cab691d3593f3431)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/433695
+Reviewed-by: Dmitri Shuralyov <dmitshur@golang.org>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+
+CVE: CVE-2022-2880
+Upstream-Status: Backport [9d2c73a9fd69e45876509bb3bdb2af99bf77da1e]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/net/http/httputil/reverseproxy.go      | 36 +++++++++++
+ src/net/http/httputil/reverseproxy_test.go | 74 ++++++++++++++++++++++
+ 2 files changed, 110 insertions(+)
+
+diff --git a/src/net/http/httputil/reverseproxy.go b/src/net/http/httputil/reverseproxy.go
+index 8b63368..c76eec6 100644
+--- a/src/net/http/httputil/reverseproxy.go
++++ b/src/net/http/httputil/reverseproxy.go
+@@ -249,6 +249,9 @@ func (p *ReverseProxy) ServeHTTP(rw http.ResponseWriter, req *http.Request) {
+ 	}
+ 
+ 	p.Director(outreq)
++	if outreq.Form != nil {
++		outreq.URL.RawQuery = cleanQueryParams(outreq.URL.RawQuery)
++	}
+ 	outreq.Close = false
+ 
+ 	reqUpType := upgradeType(outreq.Header)
+@@ -628,3 +631,36 @@ func (c switchProtocolCopier) copyToBackend(errc chan<- error) {
+ 	_, err := io.Copy(c.backend, c.user)
+ 	errc <- err
+ }
++
++func cleanQueryParams(s string) string {
++	reencode := func(s string) string {
++		v, _ := url.ParseQuery(s)
++		return v.Encode()
++	}
++	for i := 0; i < len(s); {
++		switch s[i] {
++		case ';':
++			return reencode(s)
++		case '%':
++			if i+2 >= len(s) || !ishex(s[i+1]) || !ishex(s[i+2]) {
++				return reencode(s)
++			}
++			i += 3
++		default:
++			i++
++		}
++	}
++	return s
++}
++
++func ishex(c byte) bool {
++	switch {
++	case '0' <= c && c <= '9':
++		return true
++	case 'a' <= c && c <= 'f':
++		return true
++	case 'A' <= c && c <= 'F':
++		return true
++	}
++	return false
++}
+diff --git a/src/net/http/httputil/reverseproxy_test.go b/src/net/http/httputil/reverseproxy_test.go
+index 4b6ad77..8c0a4f1 100644
+--- a/src/net/http/httputil/reverseproxy_test.go
++++ b/src/net/http/httputil/reverseproxy_test.go
+@@ -1517,3 +1517,77 @@ func TestJoinURLPath(t *testing.T) {
+ 		}
+ 	}
+ }
++
++const (
++	testWantsCleanQuery = true
++	testWantsRawQuery   = false
++)
++
++func TestReverseProxyQueryParameterSmugglingDirectorDoesNotParseForm(t *testing.T) {
++	testReverseProxyQueryParameterSmuggling(t, testWantsRawQuery, func(u *url.URL) *ReverseProxy {
++		proxyHandler := NewSingleHostReverseProxy(u)
++		oldDirector := proxyHandler.Director
++		proxyHandler.Director = func(r *http.Request) {
++			oldDirector(r)
++		}
++		return proxyHandler
++	})
++}
++
++func TestReverseProxyQueryParameterSmugglingDirectorParsesForm(t *testing.T) {
++	testReverseProxyQueryParameterSmuggling(t, testWantsCleanQuery, func(u *url.URL) *ReverseProxy {
++		proxyHandler := NewSingleHostReverseProxy(u)
++		oldDirector := proxyHandler.Director
++		proxyHandler.Director = func(r *http.Request) {
++			// Parsing the form causes ReverseProxy to remove unparsable
++			// query parameters before forwarding.
++			r.FormValue("a")
++			oldDirector(r)
++		}
++		return proxyHandler
++	})
++}
++
++func testReverseProxyQueryParameterSmuggling(t *testing.T, wantCleanQuery bool, newProxy func(*url.URL) *ReverseProxy) {
++	const content = "response_content"
++	backend := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
++		w.Write([]byte(r.URL.RawQuery))
++	}))
++	defer backend.Close()
++	backendURL, err := url.Parse(backend.URL)
++	if err != nil {
++		t.Fatal(err)
++	}
++	proxyHandler := newProxy(backendURL)
++	frontend := httptest.NewServer(proxyHandler)
++	defer frontend.Close()
++
++	// Don't spam output with logs of queries containing semicolons.
++	backend.Config.ErrorLog = log.New(io.Discard, "", 0)
++	frontend.Config.ErrorLog = log.New(io.Discard, "", 0)
++
++	for _, test := range []struct {
++		rawQuery   string
++		cleanQuery string
++	}{{
++		rawQuery:   "a=1&a=2;b=3",
++		cleanQuery: "a=1",
++	}, {
++		rawQuery:   "a=1&a=%zz&b=3",
++		cleanQuery: "a=1&b=3",
++	}} {
++		res, err := frontend.Client().Get(frontend.URL + "?" + test.rawQuery)
++		if err != nil {
++			t.Fatalf("Get: %v", err)
++		}
++		defer res.Body.Close()
++		body, _ := io.ReadAll(res.Body)
++		wantQuery := test.rawQuery
++		if wantCleanQuery {
++			wantQuery = test.cleanQuery
++		}
++		if got, want := string(body), wantQuery; got != want {
++			t.Errorf("proxy forwarded raw query %q as %q, want %q", test.rawQuery, got, want)
++		}
++	}
++}
+-- 
+2.32.0
+
-- 
2.33.0


