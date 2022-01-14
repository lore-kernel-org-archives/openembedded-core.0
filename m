Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABA6C433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 18:10:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10709.1642183810275580053
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:10:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=df3IH1gO;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8013922c5a=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20EEKsOQ027701
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 18:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=9X1/e7Yr7FMlTw4UOAZYwqrcLYCY+lGTRKyupucVad4=;
 b=df3IH1gOezxflIhz1EazpLqYZ3FCW1XSYMaM8NVw7EO4PyLVFVwz1S0WHBT0kfELAFT4
 HWait0RBbNmKiyeTasFYjmA38gMd/IixWM+svMuxd4TXt5ve8gipnRylsT8ALZzRUUvU
 LKxhglhFx6w97Mq8w3hiBnrI0rb1nYoR+wi1cZCCgui5og0C3NJpnLnhpR2MJJky/e0s
 SJoMqh95DS6HbbuMSCF7C5O3y2CDO2Ozl+T1ysWjd/t09M4eejqqZ3db0f0nYxBtaJ3W
 LaEEHZa3JFyPX2SnRDk4qyxvzocUl2csj6uSrNiHzM/okS/1vWV/513DIExGlgIgpwS4 eA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dka9jg6nu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 18:10:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsc7XwDG3To7rgluwM6yoHkUgXhFi3RF7P2JBur1apIk1yLQKydI5N++GD9BxSfB7VLU/ts2c4QZvbTY6PBISyWFFMgxPKXyvqs3YjbH9WzATWWG5/50jBPTbkOXK6qqSzphit1dcCd3BXCwFAcOKz+7OPwQ8VG7K4QSmlNQmXGNxZeAYcO5KIS6KUHq/hBFE15zols6Dsu4qh6F2PeL10J5/pO06olOSYV2+bxWQn9jdUeqofjU4a3uBK4iQ9IQFKSndA+w+PtcUdOqcinyU8mg67u4xV2XvUL/EP0/Ve5l6+X7hv5GdBQhe//CcQ4qf1jYcBa3qWVIqDRR7ZU4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9X1/e7Yr7FMlTw4UOAZYwqrcLYCY+lGTRKyupucVad4=;
 b=GUoCinRFvTioy79h2qlfiaPxAe+6SlgGhZS3SZJ2TMMrTXSFtxJ7C3Ux5Cl66eX5nphF8Q3M9ZycIafzYPHbdglnlsykDAKST7A79CMNg/nZh6zd+6bF9oseeQ2XdNX/pCyv5wFK49con7mhWbLl0sxMHff/grXTVLrtUVtl7cGnT6hsY/lpfmOILB9BKQeWp9tU2cE0sWloBBotO9geKR4V5hUnvmNQuOlt1h0VZ7iMPk2Qiqwo/ItrgeHbnf05qRgLhiWP22/FdugQqQ5JwIpCmh1hvl9Gvu87BvCHuWvf1mUGUYKdi+9bKGXljt2Z26dlq5KEu02jLerbe/pt7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.11; Fri, 14 Jan 2022 18:10:07 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::c0c6:aa6a:ad0e:6344]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::c0c6:aa6a:ad0e:6344%3]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 18:10:06 +0000
Subject: Re: [OE-core] [hardknott][PATCH 4/8] qemu: fix CVE-2021-3594
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <20220114180320.3526-1-sakib.sajal@windriver.com>
 <16CA351C3E7E813D.13159@lists.openembedded.org>
Message-ID: <622ce6d1-0f5d-728e-0aba-25faf73f15e5@windriver.com>
Date: Fri, 14 Jan 2022 13:10:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <16CA351C3E7E813D.13159@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------5B4A28CFDADDC55991A87DD1"
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::29) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78235445-6fb5-44cf-dc09-08d9d7891842
X-MS-TrafficTypeDiagnostic: CO1PR11MB4851:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4851DCC4AF31197049BA21FFF2549@CO1PR11MB4851.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kHTT7bs+gNUlS8OXPS3tL8SFVQwDj39LwTo2W8Nej2lBUiKpgYrh7RW42rCfoIDBr/j+YyVfN3AwU1bfOYohqCez5B7pc4KtxeZtiuiPDwFgNzW4TKxccxzseR3f0izL9OzG6UPVYLzFqBkVMkgFuEKaJ3SaKm4ymnNFC/N6lT52Ed/VflOhuDRkJKTI/fS3nIaO9hmJDH6vJH66858aPkXcyEPeu2u09vYpC9fOGQw2CJl34FSx91wefwDeNEFX+VJjc6WfOyXU36IDtg2yH17YmniSFOyi+YmdPVLGV7PiSy3ot8iw53wU2mIPuHW9hgYEqEGXsgwC5uMJgbW5yiRsdtkaNi0u6FqoUbVchE7bKkwTlXNrCG8VcZ5AdCHD0iXGgUqMb0Txrr8Al4K8x316i0xiibGyTUBl80GEOaoDUeuLX7Nmdzc1WUX9Ns+WuCf2j0wqfPBT+XYrGLrTG6TQrbBU/thXzfZDsnuseqcw85OEQdYq0WZqGCoCnAx/yTk+hbj8RzsQObnrQYuqjpIxm7KzrAFkp6xFH5Xxf/2VLMbxvfmCUIuCgs59M0GKLNifx5ePA8CyntjJupV4UuognOiJBuI5rWBmcpz+OfqWHFYCA+FssOwA03KAU/07KIgXqQBxH4w2G6RSRmQDS4v6H1Uaa2IJ9KTDATRlLasW1X+vIs8uZACwFveRit6g2wYN2hwQhWzRGePkkTU7cyPqt6c71py6F98xLUknVVCpjNxGLQcTF+R5BLvsDfZR5rX+dDVjPNJToyEutbs39gTc6f19Bj+LNr1ifiZ37wsTYO3IxvIYgUEhiuJPWb+esMyGRm+gSJWeu5nNyc1RbJXmOf/tL0rEOknFmnKEPl2f6d3KU2T9p0E+LlzLvKh9wNFYljb8oCQT+jU59xeCZA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(44832011)(966005)(6486002)(2616005)(5660300002)(53546011)(316002)(83380400001)(38100700002)(86362001)(6916009)(38350700002)(66476007)(66556008)(31686004)(33964004)(66946007)(508600001)(8676002)(36756003)(26005)(8936002)(186003)(52116002)(6512007)(2906002)(31696002)(166002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dFBGZzZwZU54dVdsYlo1OWo3Y1Q5ZTNqNmI3Rm1yZUFsMndvU1FrVG10cHFh?=
 =?utf-8?B?MFVsNFhMZ0tqRVpyNXhleVdFTFR3dU9kSTNucFBGTGVmVWovd0pkMy96YXkx?=
 =?utf-8?B?dUgwb2U5WVBpcHdSa09uUlhRaGN2S0ZmeGJteFpjYlNGdWcvWEZsNm5DZVVn?=
 =?utf-8?B?ZjIyb0dVN3VNZTdxcWxUOXpiNTZEKzZxU1E4cWQxTUlXYUdwSTJXZTB1YlB0?=
 =?utf-8?B?MnlwSjNBSk5TUFJqL2FJZSs1Vkk0YXF1U2t3UHBIZm9odTRoNHNtRmpOMlJE?=
 =?utf-8?B?d3JCb0xBNTQ0clNsY3MvbFJFNXVPc0RwcVVWWG9Udmgza2JvMTZpOVV4S2Vz?=
 =?utf-8?B?Y3lKbWtRSVVZM0IxWmVDVCs5TUR5Q3VHdEVmM2w0Qi9ldWpJRWsrb0FWMlli?=
 =?utf-8?B?VFYzZ2owejhlNnpyaXpCeGVQQVN5YkZDbEo5Nyswbk53aEttNFI1eUY4S3Vi?=
 =?utf-8?B?QVBQbGxzUmlVWXl3V2MzNVFLYThDOE0xdjk1SWwrdHNESnk0OU5rcXZLMktv?=
 =?utf-8?B?NUxZNmRBd24yWHBsKzM0ZVhOcXc1V2t2aE1FTjY5cVE3VStKRXpXUXJnTWo2?=
 =?utf-8?B?a3lON2JyUHRUK2I2akJpei9sTU9yM3crRXNDSTNjcHNIQ3pQZ3FiWHp6Z2V4?=
 =?utf-8?B?b2EyZ0lyQ1FSRGJoUG94bW05RkxHSnF2TG1ad0h2cUlJRDU3UkJ6YU5mQTcw?=
 =?utf-8?B?TXFsZVBFOUlUZzdHbW5CMGF1dGg2MkpOVVV4bFdDMzJ2SFhYclViaHdGdFVS?=
 =?utf-8?B?T1Y2SU9GMkdpeXMxZkdtR2RLWnFTL2tKaStPaE5qK2FQVGNBWXV5Ym9GNWM5?=
 =?utf-8?B?Ny82QnVia3lCdHc3R1VMMG93TjQwbzN0TEJwcU1pdVdGWlR6QTA5V0l1WGZG?=
 =?utf-8?B?cG1nR3c2QkJFWjgxeDMzOVZIZUo0RG5zem5UbkxIZndTRkZCVWkzRjhuTnJk?=
 =?utf-8?B?ZHNrb1p4NWlFVVZWc3plRWRFM2F1NVI0U1dFclNFaXRtcDV6SkNVT1FRcEpY?=
 =?utf-8?B?Nk9JbFY2VE1NUGluSEIxMFYwamVXY1hiTjI4UEJxeEpEdUVDUHVlZnJ5UDY0?=
 =?utf-8?B?a2UvK3R5M1ZLSTdQRGlVYjkwSWlkK0tvUEhFdzFPNG9QamtTd24zWno4Szk1?=
 =?utf-8?B?Z2hlSytJUEFJUDQ3a2ZhUi9yS25QZVM1blo5ekpybUc1em1pMDFKTWZtbkI4?=
 =?utf-8?B?QVUzY1BhcnJTb2pZZDdTWXpVODE5dXFlQUh4cEFZU3BUVCtKaXdENlI3RkFL?=
 =?utf-8?B?Q2IzYjBFRmwzdVQyU3BVUzNQYnZDSW96TlZiL2xCTDVxVkVFRGpiZXo5WERX?=
 =?utf-8?B?a2Q3bnVSMndjVDV0bVlkcEdrU2VYUnFqZi9SaW1ITTk2ZmpYS1NjNnpYaTh2?=
 =?utf-8?B?b2dlTUhGRDdGRW9PVi9jSDdoSFZrMlI3cnF3MUx4NTlBdkpwMTBSc2pRYnlo?=
 =?utf-8?B?VWtJQkZJN3dWeHMxVTY2UE1OSklsdWx4amhIT0VwTEVJb25sMzZRSTlNeVBD?=
 =?utf-8?B?c01yL3ArUGJnYWgyQ1B1WlNITGZ2RXlzZTVnaXk5SlltNkF3R3NJRHNaRFdn?=
 =?utf-8?B?NWM1Qy9tR2hVVkV0ZUwzOVBPakExY3NmWUNheUVoWHNjY0E2QTZ6UEhOOHVj?=
 =?utf-8?B?NElPdFN4dXliVTJYbmFRSC9xdUxrUkpTMlNrY2t4YnBiYU1PWFZyNjNDK1lC?=
 =?utf-8?B?SmNKdkFhQms3UndpUk5zSHBSRTBLeENjQytvVUFNV1FvUHJ4djNtNllJS0Zy?=
 =?utf-8?B?cElUNmNUcTQ5d2tlc1VyOHVJSnhoaURoK3I1Nlo5L2phT0MvbENmKytZRHpQ?=
 =?utf-8?B?SVhKb1hNdzFCU2taYmw3L2QyajA5RThGWGpFSmVtaGl6T0RjaWI4TVNNZjBP?=
 =?utf-8?B?NVpuRVJNbWN6aHJwSXRpdk5zd1hwL2NvRnNFMjZFZnRIeWtMWllsZm1ETXB0?=
 =?utf-8?B?TWU4cG8wRmIyb1RDaW9VM0xwQ1ZHMjVTL2ZFeldXbFFPYTIvc1NaejB0YWZo?=
 =?utf-8?B?ZmRiQkROb0ZKZ3FpeEc5SHZ6eVlOODBjditmb3B0bEhHQkF6cmZUWDAyY29Z?=
 =?utf-8?B?eG13ZitYSUJ5S21COTR1aXVkMDljK1dRdVM3M3lMaTJaNWdQVjRORkNDTGtL?=
 =?utf-8?B?M00yZTVQMjNuUnhibXVkUHcrNTVRWmNnRDNKTnRNR0REaGNnS1BHczJqQXMx?=
 =?utf-8?B?cnNOc21iM0NhTWF6TWZZaFhSKzNWYmpjc1BpR0VwZUVvU1Y1STlzSUpnaEM2?=
 =?utf-8?B?YnhxZFpkenBIazRydEgvcjRjQzJnPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 78235445-6fb5-44cf-dc09-08d9d7891842
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 18:10:06.8724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BK/v9av5Ng37rDg9LpYfU7Drz3D3hbI59t2EDnabHkqVzbrzRFQW9mdJjOTqRM9MwEN1j5CWt4zQ3zAx5qoSmNludwOilIdmBdDb1ccsFbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4851
X-Proofpoint-ORIG-GUID: QDOrrDHn6ecn5SBhRLIrBZDLL2oRJbBl
X-Proofpoint-GUID: QDOrrDHn6ecn5SBhRLIrBZDLL2oRJbBl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_06,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201140112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 18:10:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160582

--------------5B4A28CFDADDC55991A87DD1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20EEKsOQ027701

Please disregard, sorry for the barrage of incomplete patch set.

On 2022-01-14 1:03 p.m., Sakib Sajal wrote:
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   meta/recipes-devtools/qemu/qemu.inc           |  1 +
>   .../qemu/qemu/CVE-2021-3594.patch             | 40 ++++++++++++++++++=
+
>   2 files changed, 41 insertions(+)
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3594.patc=
h
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtool=
s/qemu/qemu.inc
> index 811bdff426..4198d3a52c 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -76,6 +76,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \
>              file://CVE-2021-3593.patch \
>              file://CVE-2021-3595_1.patch \
>              file://CVE-2021-3595_2.patch \
> +           file://CVE-2021-3594.patch \
>              "
>   UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>  =20
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3594.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3594.patch
> new file mode 100644
> index 0000000000..c99ba7a7cc
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3594.patch
> @@ -0,0 +1,40 @@
> +From 7a5ffd5475f2cbfe3cf91d9584893f1a4b3b4dff Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <marcandre.lureau=
@redhat.com>
> +Date: Fri, 4 Jun 2021 16:40:23 +0400
> +Subject: [PATCH 07/12] udp: check upd_input buffer size
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fixes: CVE-2021-3594
> +Fixes: https://gitlab.freedesktop.org/slirp/libslirp/-/issues/47
> +
> +Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> +
> +Upstream-Status: Backport [74572be49247c8c5feae7c6e0b50c4f569ca9824]
> +CVE: CVE-2021-3594
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + slirp/src/udp.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/slirp/src/udp.c b/slirp/src/udp.c
> +index 0ad44d7c0..18b4acdfa 100644
> +--- a/slirp/src/udp.c
> ++++ b/slirp/src/udp.c
> +@@ -93,7 +93,10 @@ void udp_input(register struct mbuf *m, int iphlen)
> +     /*
> +      * Get IP and UDP header together in first mbuf.
> +      */
> +-    ip =3D mtod(m, struct ip *);
> ++    ip =3D mtod_check(m, iphlen + sizeof(struct udphdr));
> ++    if (ip =3D=3D NULL) {
> ++        goto bad;
> ++    }
> +     uh =3D (struct udphdr *)((char *)ip + iphlen);
> +
> +     /*
> +--
> +2.31.1
> +
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160576): https://lists.openembedded.org/g/openembed=
ded-core/message/160576
> Mute This Topic: https://lists.openembedded.org/mt/88426915/4422444
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
sakib.sajal@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------5B4A28CFDADDC55991A87DD1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20EEKsOQ027701

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Please disregard, sorry for the barrage of incomplete patch set.<b=
r>
    </p>
    <div class=3D"moz-cite-prefix">On 2022-01-14 1:03 p.m., Sakib Sajal
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:16CA351C3E7E813D.13159@lists.op=
enembedded.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">Signed-off-by: Sakib Sajal <=
a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:sakib.sajal@windriver.co=
m">&lt;sakib.sajal@windriver.com&gt;</a>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3594.patch             | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3594.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 811bdff426..4198d3a52c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -76,6 +76,7 @@ SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"=
https://download.qemu.org/${BPN}-${PV}.tar.xz\file://CVE-2021-3593.patch\=
file://CVE-2021-3595_1.patch\file://CVE-2021-3595_2.patch\+file://CVE-202=
1-3594.patch\">&quot;https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3593.patch \
            file://CVE-2021-3595_1.patch \
            file://CVE-2021-3595_2.patch \
+           file://CVE-2021-3594.patch \
            &quot;</a>
 UPSTREAM_CHECK_REGEX =3D &quot;qemu-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&quo=
t;
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3594.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3594.patch
new file mode 100644
index 0000000000..c99ba7a7cc
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3594.patch
@@ -0,0 +1,40 @@
+From 7a5ffd5475f2cbfe3cf91d9584893f1a4b3b4dff Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <a class=3D"moz-txt=
-link-rfc2396E" href=3D"mailto:marcandre.lureau@redhat.com">&lt;marcandre=
.lureau@redhat.com&gt;</a>
+Date: Fri, 4 Jun 2021 16:40:23 +0400
+Subject: [PATCH 07/12] udp: check upd_input buffer size
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes: CVE-2021-3594
+Fixes: <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedes=
ktop.org/slirp/libslirp/-/issues/47">https://gitlab.freedesktop.org/slirp=
/libslirp/-/issues/47</a>
+
+Signed-off-by: Marc-Andr=C3=A9 Lureau <a class=3D"moz-txt-link-rfc2396E"=
 href=3D"mailto:marcandre.lureau@redhat.com">&lt;marcandre.lureau@redhat.=
com&gt;</a>
+
+Upstream-Status: Backport [74572be49247c8c5feae7c6e0b50c4f569ca9824]
+CVE: CVE-2021-3594
+
+Signed-off-by: Sakib Sajal <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
+---
+ slirp/src/udp.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/slirp/src/udp.c b/slirp/src/udp.c
+index 0ad44d7c0..18b4acdfa 100644
+--- a/slirp/src/udp.c
++++ b/slirp/src/udp.c
+@@ -93,7 +93,10 @@ void udp_input(register struct mbuf *m, int iphlen)
+     /*
+      * Get IP and UDP header together in first mbuf.
+      */
+-    ip =3D mtod(m, struct ip *);
++    ip =3D mtod_check(m, iphlen + sizeof(struct udphdr));
++    if (ip =3D=3D NULL) {
++        goto bad;
++    }
+     uh =3D (struct udphdr *)((char *)ip + iphlen);
+=20
+     /*
+--=20
+2.31.1
+
</pre>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#160576): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/160576">https:/=
/lists.openembedded.org/g/openembedded-core/message/160576</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/88426915/4422444">https://lists.openembedded.org/mt/=
88426915/4422444</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:sakib.sajal@windriver.com">sakib.sajal@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------5B4A28CFDADDC55991A87DD1--

