Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5FCC28CF5
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 06:47:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.9356.1643179646494201176
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 22:47:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=JkSq6ZY0;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8025fc1da3=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20Q6U8p9014543
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 06:47:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=X11/RxfSS8xGcLlgROHNJYpHfqAX3pHMax/buzkVA9Y=;
 b=JkSq6ZY0X4eT5v1I2roEopht/g50ZhdVbZ5TOPSYOanUPh3u0ytZpmZBGZBLtLSSrP0/
 xXtAJqN9PCDWRF5hzurK1j2Eh/q+IbMNUFSsZi3aG3cBEW+wDvJavr/UIEif/15Qu2au
 2Dziaro1qFbTxWAFoxm5HvXZ/GISBKeGL/lR7SkPYL1daOpM5yYS1I/XnUsAVNCHAi9g
 szhc0C4cKhYsQ+ouJ5wShV50dEMcuP7ENWCW5vRkW6Op6XJU21Dbk44urguZIoYhU6if
 rqIjylZxCGucOgdw3/lO6oquEvr2ypHvtP/EbfB+sNmgh+5BRvVtRQLxK3a+bhn9J+cP /A==
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dsqcvhpjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 06:47:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9bO9dXVeu+7RH3RC1Mn+pzqyVI640NG4x48ZAnIMzaf+SgyZJBWeWMIeDj2574rC728Zn3GabWok31Q+zRHRPCW9L7NPSvYZ1N7aytiZwp6cg9SfUdWUh7gBN4sCiarQe0P1zXbngPgpOIUtLI9/hnfJWHkituT+deF6vGK800x2ksNpBu2vi7k5NVAVUmZvP1eecH8FMtVxlr1kMGpBv1vOWxeV38ejZlnYhzuo3mSWZz+5nQKOzEqmhwLLL3ahscQzn0XeioECI6AKLWV8PI4RhpS+rbQ0X9DznhpKk7LkuL9jnSLFOTfHuSfnuu+pFVqPUJC1LM4NAFTeMDglA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X11/RxfSS8xGcLlgROHNJYpHfqAX3pHMax/buzkVA9Y=;
 b=l+gdn9TF5wquuFxHUSIb9YnlMM09law8sJtwGwRrFJdes8jJQ1ES7vKfP6O7Eq0Mblr2haqQgwKkbz0AQMkmsTovnFMGlbTALmgPJSPxK4oArASTOOH/G/GwoFN9G1jMRPKV9zqWly9q4ADd66VUpn2lqdtG1QGqAShIsJ8dxM8KqFAFRcPyz3lAJgsFHvruCmGHkP+dt6lCd43ygxS8kIvaY+K3UgcjMCCxJrSjLFiBFNFaqNbtt7S4guemaqlg10Nauov3fSnfqZm7xkeUlPFZQ6F7g+d9x2UAqZ2cyBf+TN06xFk6Wv+SNjC/s/d/kE6/GgBET0gqqaRAbsgLbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB5437.namprd11.prod.outlook.com (2603:10b6:5:398::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 06:47:22 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc%8]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 06:47:21 +0000
Subject: Re: [OE-core][PATCH] mdadm: install mdcheck
From: ChenQi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <16CD76EA273FFEAC.6668@lists.openembedded.org>
Message-ID: <ca95a1b5-a921-3169-bdfa-cc7d68f34767@windriver.com>
Date: Wed, 26 Jan 2022 14:47:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <16CD76EA273FFEAC.6668@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------90ADC22F21DE6FEAA25AF3CD"
Content-Language: en-US
X-ClientProxiedBy: SG2PR0601CA0023.apcprd06.prod.outlook.com (2603:1096:3::33)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fdb4c62-822f-40ea-2a94-08d9e097b3be
X-MS-TrafficTypeDiagnostic: DM4PR11MB5437:EE_
X-Microsoft-Antispam-PRVS: 
	<DM4PR11MB54370B48FA24380298D8FF50ED209@DM4PR11MB5437.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4pKRRGbWzfMba3SdpA1V8MokChvYbFXYqcziZD8I1rYiFO5qB/KcxEw/xbiwAOud5+HTRjWi3ooBAOnT4uLRl7K815zRxbGO5HyhrYRWWjkdCYW55mEoc/fie/ba7I9AahTm2OEz2P9+KvU4GpRAgm+F/jKUSAJiMXM/aw5JyglGI2EEY6eIgEHRfS6tGcD5QYogjpyvT7yGeDNfbgVbn3RMn4ielr/nFda5u4VfJhBA2VvdBh0O6TsszwoiUwVT2m2mVJHX3q9PkwL+afoXqa8I1YTZ8rVf5yH6zxbrzXYUBjntYh1BhxAGFqZxxsNbppmpgy+FE/IDB/LFr8Jjsv8TSb1TY3cJNZjfVsmxGh+xdY8ZyWnUCL1LFWcLcyuBoG/CmTmFeOqOfe54IDK66ua4GHLAelqKW3FVK7LLCmcbtBTf47KTNt9NEoS5t5KhKNZ5rIhnjWh8mf89l+nTavU04AvupyPsOY96yF7u+7btoX3S2h8+vcpYNFVN9mcuQ7jH+DAM1B/qgJkwGnFI/oz/F3IjiMMuaKxcuDNfZiLWhsyoCKjeIDpfQKqxoGsgf2mHLUI9pIU9RLkwod1nGGIYL/Rns9YpnpQcVr+S0P5sv8cGUUXnIyBRs+AjQK/+0FIkBjSUM5xbs4yugFPfyjkeVe4hExH+uAlxDfpoqsbYhydjIS2HHHfKuNgiWApC03FJa63nstj84oxJ182lQ22ajyRURJsVINv4ASXibz8O1qtNHUc3zuGIDbIeTBAemmybRSGFfOfn4PL6FBnfTOc8k3NFNaztvDtR3Y8oSV66qMOD7Fq1pBFvu3K9qLjVcTewgbkAMXsdnxhefXJ/Ediz3UEfmJE/U3s9+77e3Sm8QRhdErfD0VgtIEKa/Y8/TJU9H2OpHghevBOdrwg/mRW3Uix2rJ/QkCH3YO/aPIs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(508600001)(966005)(6666004)(38350700002)(166002)(38100700002)(8676002)(86362001)(6916009)(66946007)(66476007)(66556008)(8936002)(31696002)(83380400001)(316002)(26005)(36756003)(6506007)(53546011)(52116002)(6512007)(33964004)(186003)(2616005)(5660300002)(2906002)(31686004)(21314003)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?elBaT3FpRWxUa2JFWUkxc0ptaSt2SWJEUzRyMkZLVnlVUWtlWUNWc0Vkbi9o?=
 =?utf-8?B?NG95dFo3QWhDYnc1RFEzOEVSd283dVJjU0F1a0lJZ1c0RTRMbTJwV003SlZq?=
 =?utf-8?B?ZXQzbFJidTA3eVY4bGNTZDVTK252WjdLRCt5N3A4OFNoZXNkT1lUcDNtY2ww?=
 =?utf-8?B?dWhsL2laZzE5ZW5jSjh4ZmdWZ1ZCSTZGSm4yNC8zUVVSdldEY2JlLzVjUURh?=
 =?utf-8?B?YjVsMUVhRWFSUEhCUUovTmdpSmF5QnJOUEFYaEduNFNUNzdoN1g3SXAya3B6?=
 =?utf-8?B?YTVDME9CWGlLZFhqdmlnVzkxNGhkL3ZJazNpR21qbjN2ekhibDNUTDFmOXpQ?=
 =?utf-8?B?ODNSK1czTk1XcCtxZ25DY2dQeThlSW15eTluTjZMaGM2YTJ5NENoSVhFY3lu?=
 =?utf-8?B?bUhCUVl5M1k1aHJoZ1ZXTTQ4eEdxYjFFRjc3cnViU3FWM3pmNUdVREc2S29u?=
 =?utf-8?B?RFdyVzgvUzFod1hWcWR6VlVlSmJkZGVTcWhSK2R3Y05FNHg3Y29xakRONnNQ?=
 =?utf-8?B?RzhaQVRqQWxFWnZyVjR2Wm5yYXVRZG4xZ2hNRDhtZlVJTEpHWTBkN0dpWVRP?=
 =?utf-8?B?SXJMSWJqM1YwOU9wUGtiTVJQQ0NjSE1rK1FUN2t5ZCtSMlg3SGxQamhJV1VH?=
 =?utf-8?B?VEllU0UyWkJudXI1R0xnMU1tT3pieEpJeGNKOHFGQlczUHF0WTVkckhFVnFm?=
 =?utf-8?B?eXBkczhUaW43L0xuZjBBdy8zUGdLSTd0ZGk2aGwrNzM3UFhGQjg4MWpsOUxQ?=
 =?utf-8?B?clNIZEdkRmNMT0tibzdhaklta09DMlFLNUVQaTBHRTVWeGhUQkJDSmxtQTcy?=
 =?utf-8?B?cVdNdHVmUm5HcytmY2lVNktOTTlSRmhQQURQUjMvK0E1QzZ1dG5zdFJvTUtP?=
 =?utf-8?B?d2RuVHpabXlobHFEenJnTUNkQXRXZGZZRE5xNEtKcng1bG9EeGtrK1pvTkhC?=
 =?utf-8?B?dGtldVBLZ0pwTU9QSzlOZDhSZVBTV01CVkRTdUcvaFlnQWp4RlpXNjZDcUhW?=
 =?utf-8?B?M3FkQkdBcnFibms5NVlNWjNtVU9GWDJEdnZleHpROEE3QVdlcVNWMlc4WnZL?=
 =?utf-8?B?SVNqSUdLdmRZY3FQSkpIN3RPbDBzZDVFS09yYkNINkxtMmxBWWdRWk0yckZz?=
 =?utf-8?B?UEtvWEhWelB1ZzZPOFhGT0lyeVlhUTBsWmVjS3NsS29pUTlLaHd2WDN5aisz?=
 =?utf-8?B?b2VNNnBEc25xRjQ4N3RWcWwyY3JUNzdYcGJrZ3Qyd1ZTeUJDRWVtdDdlcysv?=
 =?utf-8?B?ckxlQTNOYmVSYXhLWU1lLzZMZXVSSEdTcHUzSWZ3c3BkMU9RNkMyZ24wVXNj?=
 =?utf-8?B?T0RTNU9lMVZ5ZG9YQ2k0LzkydDlDTm1UNGxkSFVDSW9qNkNvR3A1UGwrS3R5?=
 =?utf-8?B?TlN5Z3NWcExTeHdFK3NGb2d2Y1NBRnZLUnJwaGVEV1RjU2p0OW9jNUxnV2w1?=
 =?utf-8?B?aWlyd1o2cDZQTmlCNmRiV3NxRzlpM0pPUzBXTmpoa2kxKzgweXlFRWgxN1lE?=
 =?utf-8?B?SklWYW9aSWsrM1h5eG8yWnJsNXVtcVFvRXVLam4yUGw5WVZIQysreTNNcU1P?=
 =?utf-8?B?QUd2czRPK3ZQZDhxTkNneW1TaFlZdlIyVHFGN0llZUVTRlpqZGlGQVZGNW4y?=
 =?utf-8?B?dm1zRXoxdnNGajZGZTc2a2RqVy91aVpjZW9abXlXdFNhWGlaTWp4SlV1Y3p6?=
 =?utf-8?B?cHVkMitJNWZvOHQ2Qmx2MWNtcXFnaDMvTktuWnkzNVlLbkRzSUdLSEc2M1hz?=
 =?utf-8?B?UDRqVWJ3TVZqTzIyeDEycXE4NURLMHFoTjM0b2FuUjVIOWNRbUc0VXFZeG5t?=
 =?utf-8?B?YW9zWFNXNGd4UytUU1JQMjhscmhpcU1CR1FaNjlyWGRNcE11M2c5WHFPdko5?=
 =?utf-8?B?NGhNYitzcWRMYytnd1VtbnA2SFZGRDVRU2pZV1FqdlJHTWFNb2dHa2k0dDRo?=
 =?utf-8?B?Q21GNzIxM1FlSUlqalk2UnpyM3p6SWg3bFdnbmQxaGJKVnN6aUFZb3VzUTA3?=
 =?utf-8?B?YlZXaVl6NTErU3UwYUw0ajNnRWVXSFp1b3VheE5MVEJhdC9BVi9GK0l5RExw?=
 =?utf-8?B?OGdBUXhOMGdiV3pnZU4xQllMV2tUUC9RU2Ezd2pQNVkvMXhSOXNQbkdzVjZs?=
 =?utf-8?B?MFQzMzVkNWRudytWMTFMaUltSFdnMk4zdS93VmlIdlIvb05PVU5FNlNoRmxi?=
 =?utf-8?Q?IGGd57IVD4HUQiMj77w2t+s=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4fdb4c62-822f-40ea-2a94-08d9e097b3be
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 06:47:21.4434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PY9sUwIEEPVW8CuQlXdG69BA3uWA/DkIWnuWds4DdAOTJ2Vd9HMAsevfgjH5lifefrhxcikq4Dk0tEHC7f+7Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5437
X-Proofpoint-ORIG-GUID: LVFJzjgl3oQwW1-KpHzNdJV30O3zglv2
X-Proofpoint-GUID: LVFJzjgl3oQwW1-KpHzNdJV30O3zglv2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-26_01,2022-01-25_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 06:47:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160957

--------------90ADC22F21DE6FEAA25AF3CD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this patch, it will cause qa error for mdadm-ptest. I'll 
send out V2.

On 1/25/22 4:42 PM, Chen Qi wrote:
> This script is used in mdcheck_xxx.service files. So we need to
> install it. Also, as it requires bash, we add bash to RDEPENDS.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   .../files/0001-Makefile-install-mdcheck.patch | 30 +++++++++++++++++++
>   meta/recipes-extended/mdadm/mdadm_4.2.bb      |  4 ++-
>   2 files changed, 33 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
>
> diff --git a/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
> new file mode 100644
> index 0000000000..3f76ef54d8
> --- /dev/null
> +++ b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
> @@ -0,0 +1,30 @@
> +From 97e776724ab9763c5bca9816370bb1635b7a8232 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Tue, 25 Jan 2022 16:25:01 +0800
> +Subject: [PATCH] Makefile: install mdcheck
> +
> +The mdcheck_xxx.service files use mdcheck, but it's not installed.
> +We need to install this script.
> +
> +Upstream-Status: Submitted [Sent patch to maintainer]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + Makefile | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Makefile b/Makefile
> +index 2a51d813..db40c7fd 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -303,6 +303,7 @@ install-systemd: systemd/mdmon@.service
> + install-bin: mdadm mdmon
> + 	$(INSTALL) -D $(STRIP) -m 755 mdadm $(DESTDIR)$(BINDIR)/mdadm
> + 	$(INSTALL) -D $(STRIP) -m 755 mdmon $(DESTDIR)$(BINDIR)/mdmon
> ++	$(INSTALL) -D -m 755 misc/mdcheck $(DESTDIR)/usr/share/mdadm/mdcheck
> +
> + uninstall:
> + 	rm -f $(DESTDIR)$(MAN8DIR)/mdadm.8 $(DESTDIR)$(MAN8DIR)/mdmon.8 $(DESTDIR)$(MAN4DIR)/md.4 $(DESTDIR)$(MAN5DIR)/mdadm.conf.5 $(DESTDIR)$(BINDIR)/mdadm
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
> index fa51364283..4e477bd260 100644
> --- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
> +++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
> @@ -22,6 +22,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
>              file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch \
>              file://include_sysmacros.patch \
>              file://0001-mdadm-skip-test-11spare-migration.patch \
> +           file://0001-Makefile-install-mdcheck.patch \
>              "
>   
>   SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
> @@ -92,7 +93,8 @@ do_install_ptest() {
>   	done
>   }
>   
> -RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs"
> +RDEPENDS:${PN} += "bash"
> +RDEPENDS:${PN}-ptest += "e2fsprogs-mke2fs"
>   RRECOMMENDS:${PN}-ptest += " \
>       coreutils \
>       util-linux \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160913): https://lists.openembedded.org/g/openembedded-core/message/160913
> Mute This Topic: https://lists.openembedded.org/mt/88667847/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--------------90ADC22F21DE6FEAA25AF3CD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Please ignore this patch, it will cause
      qa error for mdadm-ptest. I'll send out V2.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 1/25/22 4:42 PM, Chen Qi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16CD76EA273FFEAC.6668@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">This script is used in mdcheck_xxx.service files. So we need to
install it. Also, as it requires bash, we add bash to RDEPENDS.

Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
---
 .../files/0001-Makefile-install-mdcheck.patch | 30 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
new file mode 100644
index 0000000000..3f76ef54d8
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
@@ -0,0 +1,30 @@
+From 97e776724ab9763c5bca9816370bb1635b7a8232 Mon Sep 17 00:00:00 2001
+From: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
+Date: Tue, 25 Jan 2022 16:25:01 +0800
+Subject: [PATCH] Makefile: install mdcheck
+
+The mdcheck_xxx.service files use mdcheck, but it's not installed.
+We need to install this script.
+
+Upstream-Status: Submitted [Sent patch to maintainer]
+
+Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index 2a51d813..db40c7fd 100644
+--- a/Makefile
++++ b/Makefile
+@@ -303,6 +303,7 @@ install-systemd: <a class="moz-txt-link-abbreviated" href="mailto:systemd/mdmon@.service">systemd/mdmon@.service</a>
+ install-bin: mdadm mdmon
+ 	$(INSTALL) -D $(STRIP) -m 755 mdadm $(DESTDIR)$(BINDIR)/mdadm
+ 	$(INSTALL) -D $(STRIP) -m 755 mdmon $(DESTDIR)$(BINDIR)/mdmon
++	$(INSTALL) -D -m 755 misc/mdcheck $(DESTDIR)/usr/share/mdadm/mdcheck
+ 
+ uninstall:
+ 	rm -f $(DESTDIR)$(MAN8DIR)/mdadm.8 $(DESTDIR)$(MAN8DIR)/mdmon.8 $(DESTDIR)$(MAN4DIR)/md.4 $(DESTDIR)$(MAN5DIR)/mdadm.conf.5 $(DESTDIR)$(BINDIR)/mdadm
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index fa51364283..4e477bd260 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -22,6 +22,7 @@ SRC_URI = &quot;${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            <a class="moz-txt-link-freetext" href="file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch">file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch</a> \
            <a class="moz-txt-link-freetext" href="file://include_sysmacros.patch">file://include_sysmacros.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-mdadm-skip-test-11spare-migration.patch">file://0001-mdadm-skip-test-11spare-migration.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0001-Makefile-install-mdcheck.patch">file://0001-Makefile-install-mdcheck.patch</a> \
            &quot;
 
 SRC_URI[sha256sum] = &quot;461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d&quot;
@@ -92,7 +93,8 @@ do_install_ptest() {
 	done
 }
 
-RDEPENDS:${PN}-ptest += &quot;bash e2fsprogs-mke2fs&quot;
+RDEPENDS:${PN} += &quot;bash&quot;
+RDEPENDS:${PN}-ptest += &quot;e2fsprogs-mke2fs&quot;
 RRECOMMENDS:${PN}-ptest += &quot; \
     coreutils \
     util-linux \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#160913): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/160913">https://lists.openembedded.org/g/openembedded-core/message/160913</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/88667847/3618072">https://lists.openembedded.org/mt/88667847/3618072</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------90ADC22F21DE6FEAA25AF3CD--

