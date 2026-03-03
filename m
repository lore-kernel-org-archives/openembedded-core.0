Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E84E67A69
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 05:14:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11630.1772514846685460055
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 21:14:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=J/OPXLDG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7522a5c2d2=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6234VbYV3902896
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Mar 2026 21:14:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=etmxnUiXGdDt4gTSQYu8
	2PMMNGLdAcc5lEXMJR3IJyw=; b=J/OPXLDGAzE3LTtDnLc391YRGkN9KaSOtyHM
	JGTJ81Xp+7yZ5L5+7nc78R8GaXPgH4umNUc33cbLkggWG5x/u11kLzRCZu+7s3zk
	Fk1dwZ7IoEZvjug7rPPbxE+mGOslQyU5iHggJW0Q+GWVu6VYEJDwpDXto9gjyzJH
	MqtIJ7iB3zSbm2AWp6C5AdIBD2dgqWhRd5EQGLCI4+8xDguwYKXXHffrUvd7FvNm
	igCPDqJR7wDDnItzhVHPMJWVupUBRu9ZjBBJMADUyRpPAYJHLEngDIe0EEK21bVP
	BCcfsRpnNv43r6btdwoqmEkF2ODTr4g0yg7+ZWXqf4b5/caNHg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010046.outbound.protection.outlook.com [52.101.46.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cm0rgjryy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 21:14:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+yPSNBLKSC3nfVihNTJEKRfC2Mgv8HfX4Nj/x0M8A+ba7d340xZyolCg0dBdxALhg3BZ0X1IP6DYTRMem+mCZs1kzE3smR9YzB1svH0rclKBn0D4oqhmeoltgnN8s8wv7l+TcIzVPbPtKNz71js5KJMVRGJDCzYXL6m6VDC4nMvPqGPkZRH5hIngk82SRtPTmW5Ds9dujc6RRju7o1C1Dbb/hmhxA0Gw1z9CotSqiSmtHKLktH9smXg1s1y1Le/BDNAB+ggQwbaEPnq5U7jC6c+M0jxYzS4QPbDw4M74M7hviBJ6D/GFU987omlzE57ifiJj9ImgU2uKbvmrJneFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etmxnUiXGdDt4gTSQYu82PMMNGLdAcc5lEXMJR3IJyw=;
 b=rBb7egocPWBU6JpseBL+SKtYvvOi9Rr80f3bmK6wx4hLITakzOhwD7UzkxpCrPgIdJsFCwgKrMKNRPctC/zOiW1cTnYqr/lqQBlaikgfBy22Htef0Jrm/8bGK0jsFhp51EGaBwnV/TBzV0CqM45n1JrNw11EcNGnP6mYEKzY3cX4YZJhbuMnBjMIgl2pRqeKrjS5OuFBl/CTVQm91wgQSW8BqsjjU+Tjl6rO086EQdh5iHqU5OrXL6v4PRKIF9GwSXpJVTU463Qf3QTNTFXuZui9nQeM+n24fmORv5PEO75ho7YAQu4kyZ9FqE5is4DDLZICmBCvwImfqFfY1CXLpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH8PR11MB6999.namprd11.prod.outlook.com (2603:10b6:510:221::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Tue, 3 Mar
 2026 05:14:03 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 05:14:03 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ruby: refresh patches
Date: Tue,  3 Mar 2026 13:13:41 +0800
Message-Id: <20260303051341.2759660-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0097.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::6) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH8PR11MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: f8f944ae-3187-46af-9100-08de78e3af98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	hGXDFVo5Jd/sgGRcp9RnIkgK0qkopv4YvtAEuZDUO2GLmeveTcwRlOYAGCE5NzKuTESN7mW/KClCNVsOlanip8NdEEr85nd5ovZVQ2E1wasn3yenQB9CeA9kvkgN+GKlJxUhbs3QdhUalr2dG4AzEddSPytI+Wq7tt50xUgtxWtKGckKmMPEx4ZJLOTzw16U7QC+Dzj8d1KNxx7BU5cg3Qjwv+MI0XbH+AKgD6YXd/ul/Z1nwIXqKMvymEtce0VDHfvZtUmAN7DkYh9JCUCUXlcbU58WHejQxkWxeDtGDjtRfqQw7mbxKy30pT7vBoVm/b/BFRPENQAq9LrXiJCcAZnPuLrrAVpTCVqO9EhyzH/EEsX+t85p96yvq8tAlDTzSgfodgf3Y23M0/WJgiKiYkyr8LPHFcMiaeM6tTHNMW70/GpzZGwpeL2ELan2nK7HAgYhlfuGUbWLkwOinrOv+vAioQp/wW/w8RmIzC5reacR98KaAvbVdgY33rzpHHMw3iW77bX5Q3WiR091zNcVx47FxToCUWYumr+cskPGwWWxrmmIFuAguBepsPvu/NNsm4RCPQZOpDWvjobbSnFvbD6sdhzpMnjvHpj8WEY8R/stwmhnYVFyTQZh1+lNO2qRYEp5yENa/el4n/uUwskzUPqHHFoETwlSOnZyK7RKwk0uLevL2zmM2QVwQg8+BsgXTIqFMsMwd9J6zp+eUA63LqnEbElXkNj3RlQlAmRzFFBvCDbYnU1qGH4CaLmyCaiLN4Hm/SWsesilEPQYOLJ7idR+MURwUD5LbXEb81oFtek=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2W+ibsgCVVDeP8we1lxr/psuTN0RwOLRiPcn/ZTLxG8lMGo9iNLCpJ4+YPNS?=
 =?us-ascii?Q?lZ0SrcSLyg3LtbUSn7F6mnZHbC7PiUwKDxCCEBhfNWwPAWYJQmp6+fhzEn6K?=
 =?us-ascii?Q?MSadxpCc+329xA3GNKbvuTWgN8EI3s9RvZ+IGpkamdAzxvRtOgGHGiZPjZP1?=
 =?us-ascii?Q?5NKhpc3e8yhd6IbhDiHnYoZnmcmv6KtV7IRA80aZkA1n7cxc5KnRoSiin9gn?=
 =?us-ascii?Q?/m/qGsIAL+1YPfxCa68W57ctI/L1WDuoE3tvDMJzv3UycWLM/r7ImLr8N9Nc?=
 =?us-ascii?Q?/MHHwI62SXWWe8ppabg0FbNeTl2Ez2pv4DRzDaHw3Nxq7JO44Tyo3V0mnUch?=
 =?us-ascii?Q?kPG9HrC6Ls855z+E5+sD4nfNvIbMTkU5rzGmdxxzcIksj7+UoJgCVj6REcD/?=
 =?us-ascii?Q?1lcWayFUrEkBKSlvpfuAHCkQbaWCPPfkKW06olGot5AuS63K0ul8f1WL3D9p?=
 =?us-ascii?Q?Qta1/PPX8Fpjd684g7VKxrA9/BQw5vbFF3saq+YxAH/+KCqejfpcX/qaWzls?=
 =?us-ascii?Q?eZbGQBEIfk6jTgRoY9EgW+Ecj9g1brldMFdnXVamG1Mzh1YxmCM/7VeGoCBQ?=
 =?us-ascii?Q?CoIT9TxZtH1gOTGBBF0T/9fuOjDkNW/wbIE6EdJLLRDJBItjS+PwRX8p/B5k?=
 =?us-ascii?Q?+hk6jWupjVKOOy2hxXE7oRekOlGsBYGjlh+GDk8+lDGzxiFjhg9ZyXglWEkn?=
 =?us-ascii?Q?VPPrP0/NVUuAT9avZtYvAKrars5U2nGUfc8RQ9MEFoVrFektunGizdrxG1Bo?=
 =?us-ascii?Q?q980UrVvyN5kyD6LgOEzAnCQkqpi+k4augRvci7YzYwgqzR9bhJW+XNM89Je?=
 =?us-ascii?Q?kia8zqhOv0pLNntnOjnc7ibQyl10fQ4ttJStpz9cwnNCnaItYQTxwfBEcGEV?=
 =?us-ascii?Q?GQhLg0JyIFnBccqSAE+SGY7+yAGnhfi5acl+feU0269GTpwn1uRIABE61Q5/?=
 =?us-ascii?Q?DD8dhAIgyExAnfH3eMee8Lo/faW1lMLH7quThRwG14syt72s7Y61olzUN5YO?=
 =?us-ascii?Q?JyFgznyiLs7BSl3yJ0D8fQyO7o9TP2tLsKYslNFfzCCw/7g+B8YzaLYoWE1t?=
 =?us-ascii?Q?IFVwIsXY8Oybqr/OlbBbg4buWRF3j18FwYf7MvQW3N2IlnmSr873ucevI/VE?=
 =?us-ascii?Q?LydGysCJ7dv5YQnc+8OTMc/xDrDsrBkbxQ6JbcQCYPA9w1K14+TnLkQyzZkV?=
 =?us-ascii?Q?EYDKYMZZSCYHQAs7c9skpkMe35p4GKRDs0jupTgyoJErGP0Nc/Vt7gosdsRC?=
 =?us-ascii?Q?0Z7SLPOrn7+pIA4YsGCt+gx1aEru+/9aphTUDbDhdENmEyRBpx9Im6pJGIk9?=
 =?us-ascii?Q?AWwYGCPZFFNLtgSa4VGMi752g9yIz3aZRnrLZqGG2rbDbxZlsHp4KkBmEHS6?=
 =?us-ascii?Q?HG5Kg3WtIbWmCsUmZkiqnM30JM4Z56KooEg5dmZKRPPno+HL37E/xuvaPHn6?=
 =?us-ascii?Q?K0hc1+oiGS2btr4kBqdvLA9hJfeKbXVDQK9PphC6sw7mg9PXgy2ao3HvImsQ?=
 =?us-ascii?Q?ACe9LYZ0EvIn2sDgj+BPMJStOIO00kokSn5fEoMHuAbGYWs4MqfT0if1xtbw?=
 =?us-ascii?Q?nXO6bWYZvZjt4HvfxuFxue5gLc2vIAj5E3wsBxPVjKgZzTWWesew44oga0l0?=
 =?us-ascii?Q?dpU5WKANFbeFk6+GhOLZf2EXHC0umDpcbY5P1DqLm5pRBE4x938JVjLBrTDF?=
 =?us-ascii?Q?zOK99D1DiIWKU7m5nk1N5qN8sWQy+0/tqdOvLzXDYDohmCd3GqKjpDrnR6jY?=
 =?us-ascii?Q?CpjCMIS11sGthIfVHLbCfmVaslCmxrY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f944ae-3187-46af-9100-08de78e3af98
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 05:14:03.4123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0U9ec0AfojwPneTt1ckIo9f/o5wge2L6HvJ7hzOdNXmYunTl3YsmskgVsgcUnbfTkS7QDO4TMH4/EvrrRvlSNuiBbJ2bjKLoOlZTKOrEDos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6999
X-Proofpoint-GUID: Vnkjusu7IYInLJRZ9PuUsmdaNupgeMZi
X-Authority-Analysis: v=2.4 cv=Of+VzxTY c=1 sm=1 tr=0 ts=69a66e1e cx=c_pps
 a=BcPl/o76WFXIZ3b3OvynCQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=xNf9USuDAAAA:8 a=VBA3-RLlZK8BPYEXYXwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Vnkjusu7IYInLJRZ9PuUsmdaNupgeMZi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAzMyBTYWx0ZWRfXwNw7F6cmpTGI
 5TVsLA6dQ8x3UXaKnwmtVGCb76KsUwovJR5IsJZYWdYWgx6v2w/r0RTMoz9xu8Zg/rifMhI+wk4
 nJ87ELEn/GQVw5hSTgg2yCOy+K9Ln6nVUugzBCkUmQFqFcMQXKDyNc2wOHrMHikykzVjT7ZV5O0
 TchUUuXG0sTCntk+iI9PZpSn/ynkzyc+nCcyXK0jMOXsEIdoRFOmoQwdFcNDHGOxMgTqBgrLNXm
 FTgsTuXBxuF89QdOKugG0RdPoYeI+07xqgZaun1ChXsSiWXFg8wJ/H3K24dJ7vtmdYB9WOpxNMu
 0zTNfJvxGcf9aQnV83c/TlBkVeis70rPSXKSrSH8Nd3sfvjMRmGXHYvjzs3sx0R8/WY8Ifgh34I
 QsjA56yfa4G0+Ap2B6kUd/CQU0ditVjggUTafRySKGSvB5gtb3GbA0YwkDik9OUUfwkvYyvpRWJ
 Tf5dZAl0zOhPk5DPSnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 05:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232235

* 0003-rdoc-build-reproducible-documentation.patch remove the not needed
  lines
* 0001-Don-t-save-the-original-name-and-timestamp.patch use better array

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...-save-the-original-name-and-timestamp.patch |  6 +++---
 ...rdoc-build-reproducible-documentation.patch | 18 ++++++++++--------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
index 3db5328565..0f24d2ea0b 100644
--- a/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
+++ b/meta/recipes-devtools/ruby/ruby/0001-Don-t-save-the-original-name-and-timestamp.patch
@@ -1,4 +1,4 @@
-From 6250ed93d1d7407eb84241296d604e6f98ff0a82 Mon Sep 17 00:00:00 2001
+From 2cedad6b2beb908a8fb80da0e45e5055dca65e99 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Fri, 27 Feb 2026 16:59:24 +0800
 Subject: [PATCH] Don't save the original name and timestamp
@@ -16,7 +16,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tool/rbinstall.rb b/tool/rbinstall.rb
-index 874c3ef..0bba588 100755
+index 874c3ef..eb99a70 100755
 --- a/tool/rbinstall.rb
 +++ b/tool/rbinstall.rb
 @@ -173,7 +173,7 @@ def parse_args(argv = ARGV)
@@ -24,7 +24,7 @@ index 874c3ef..0bba588 100755
  end
  
 -Compressors = {".gz"=>"gzip", ".bz2"=>"bzip2"}
-+Compressors = {".gz"=>"gzip -n", ".bz2"=>"bzip2"}
++Compressors = {".gz"=>%w"gzip -n", ".bz2"=>%w"bzip2"}
  def Compressors.for(type)
    ext = File.extname(type)
    if compress = fetch(ext, nil)
diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
index f0be3e4af6..bf57f97d7e 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
@@ -1,4 +1,4 @@
-From 278d02b08f513b288f31648bc5ec5c47ecb61686 Mon Sep 17 00:00:00 2001
+From 02cd20470448676d97d77c2e6789ecce43f0e21c Mon Sep 17 00:00:00 2001
 From: Christian Hofstaedtler <zeha@debian.org>
 Date: Tue, 10 Oct 2017 15:04:34 -0300
 Subject: [PATCH] rdoc: build reproducible documentation
@@ -13,25 +13,27 @@ Signed-off-by: Christian Hofstaedtler <zeha@debian.org>
 rebase to version 4.0.1
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
- .bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb | 2 ++
- 1 file changed, 2 insertions(+)
+ .bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb b/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb
-index 065caa4..a76c202 100644
+index 065caa4..cfa1f33 100644
 --- a/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb
 +++ b/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb
-@@ -177,6 +177,7 @@ class RDoc::Generator::JsonIndex
+@@ -176,7 +176,7 @@ class RDoc::Generator::JsonIndex
+     debug_msg "Writing gzipped search index to %s" % outfile
  
      Zlib::GzipWriter.open(outfile) do |gz|
-       gz.mtime = File.mtime(search_index_file)
+-      gz.mtime = File.mtime(search_index_file)
 +      gz.mtime = -1
        gz.orig_name = search_index_file.basename.to_s
        gz.write search_index
        gz.close
-@@ -195,6 +196,7 @@ class RDoc::Generator::JsonIndex
+@@ -194,7 +194,7 @@ class RDoc::Generator::JsonIndex
+         debug_msg "Writing gzipped file to %s" % outfile
  
          Zlib::GzipWriter.open(outfile) do |gz|
-           gz.mtime = File.mtime(dest)
+-          gz.mtime = File.mtime(dest)
 +          gz.mtime = -1
            gz.orig_name = dest.basename.to_s
            gz.write data
-- 
2.34.1


