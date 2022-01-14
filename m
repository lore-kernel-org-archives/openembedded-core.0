Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B82C433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 18:10:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.11023.1642183825460437975
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:10:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=fD1aqCD1;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8013922c5a=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20EHGfVq029491
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 18:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=PMTUEtv/u/FnU9SXmeQ8YlsoT7To4K/nsoQe8XSHXWA=;
 b=fD1aqCD1m5TrU0jCmJhkI1PXuVzKD+Ig38XNfwGZ5yQYV1aW1oJq7b0Y6VyiFTsRm8J+
 rwnOvQreMwzxc0/pCoRpzE5QJKFvkvnfGaSlNMEsJtgfqyrDVoB+jHg9W3C3JpGRmnRH
 aoJLXfxFscY9XWA4EdksXW56g7Z5USzlOKFmkwU4PkqOLYQpRzuxloQGbAuxT5oLzhKn
 zeUcwowglXsyPHoCeaUrBlcYcnKOxrr9pl1vg7NHpD1GOz0SQKcvqi0NBNL7Bn9+OX3D
 sfFklTNeLwkr09Uy5R46zW3Yy5pCPRgjocUJBFmmtCi0wKO0IIRJTqkBqghRpRBnrA6M tw==
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2043.outbound.protection.outlook.com [104.47.56.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dk6scrank-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 18:10:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1vDq/UGUomRLgRIOfPI9yaCuOX0ZOgD4+5dBIaFVZfbGlRLBE6eCpwNCNbpN82ZnF8rjAV0y2ZHiaro+EwV1tJH340AchNpPWmWAD9cJ2Qo+ofpjf4HRsn3MlSwdWaW0sCdMq8A/0DbGkGCA6ARdRBz6acPj5i8K1iYlv8srD4hLUyAcQwO/ZVYu6slHYwy1MScD9AJvnyIVafISYXjlwitK/l4jlLuDcJIoDfY2Hx8teUdim/CISNBBPZj/1dVVZ8SDAEDUE9GZC4fYQRapO7pPvBKoDjly2+k1Jfpx7B1UagPvbGQOpb/3dh9KmhdG4R/+9KNptMwd17cqYmH1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMTUEtv/u/FnU9SXmeQ8YlsoT7To4K/nsoQe8XSHXWA=;
 b=DEGZzK7MZHZv3khxHF8pHZUXLQA1QefoG0MjP0aHcOyr8cLM/Sst9OLh1eis/LFC0KknAoAa7/ur6cyCZOeCb2dr7v1+MiXL0iNnT/zQFR3pNKeWxLROj9NeNybnnlSWqUQQGBRhCbAnZ2TgrjeQzyF4iaosrmGRLbGzMI2GzDM0exCFaVbeO1W+md6aZ5LHUHF0Ac6iQZSprriCiiDjXmuA6sTuzjLBjeIWC6nYdKWuOvqMdEW3uA4JP72/NrI/47OjbZbADvmbBVOsLaulMTftXsSgyxTaCaZCMlypL06Wn++M3yDH4LwAldku4+v3On6Uw90TeiAXh+PCMc1l9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 CY4PR11MB1605.namprd11.prod.outlook.com (2603:10b6:910:10::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.10; Fri, 14 Jan 2022 18:10:21 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::c0c6:aa6a:ad0e:6344]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::c0c6:aa6a:ad0e:6344%3]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 18:10:21 +0000
Subject: Re: [OE-core] [hardknott][PATCH 2/8] qemu: fix CVE-2021-3593
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <20220114180320.3526-1-sakib.sajal@windriver.com>
 <16CA351C3BA3B44B.29498@lists.openembedded.org>
Message-ID: <fec4cf3c-06bc-7d80-3369-8d83b74b8ff8@windriver.com>
Date: Fri, 14 Jan 2022 13:10:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <16CA351C3BA3B44B.29498@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------2723C35C9E6DD1920D6BEAFE"
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::20) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf3ff709-36e4-4118-372f-08d9d78920e7
X-MS-TrafficTypeDiagnostic: CY4PR11MB1605:EE_
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB1605C6F10BD71720E27CAA66F2549@CY4PR11MB1605.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HJ00XGw5QfPgA7fgeD8a+1QiQvXEvsnWDuHUHpGLqQrwHl22JjPAyAhydir3ibtkQjZ5ey/GLNoKo/FDfWUdA7smQhLJurO4OEEmePzRXGoHvUugD2XCCQ+QZLAi0IDM7jTg6GUvEWlZanCRPfo3z8CEC9q6i77ZXuRWwLUKCCZ2m2WeBm9LsUuWgfpZbB2RcqkIkwX4ct+qjYVUOCEEb/dHw6OE7LTzxPS1C6AfUN+h6f7nuEkQ/it3C1RLdn2zJ4f/TcTmQhC4wyCPQlOvzDMUsVysCYHXcx2mtSLGU47llpwBT1DABO47xOszpY6si4AdbxLJ+CXHX9nQUqljAOgup7kchlASzL5gFY2NhSA/bBmM7Kw6oj+vn9/9AnUNTluf7jXO5SlI5ouBB6yTIjWnzxX5gH+ZDw10I1S+gq79LtD52PIABmJn7W7oGQeZZu43Pmt/DVN/YJpIwvPfOEOPquwjP/arRMxovU6BX38+BvvNZdzpLUWugvSEfKp9apZ3/HZh1hqYdYk29+25xfEO2kSmR2eCoV0FOJvwz/MLy3FNnSP2mKfunShbrTXKkw0U2AMCt3yzgrwhjF/uM2x6jjcn2w278yGc2AopF8x9Rf+k3WwUk6LT1dcYEngos9+eVKFzACaxAOsiTKjTKvTwel42074LSnJZM2uLKB7g508gmICSPOX17s32mCWS+Oa29JHrmQwHdqJnWMlpnbEBfsUw5whCYPwlSLfYDk+Ga+U3GKeF5TpMhWf8uO43D+JX5fjrrCpY0njbrt5enW5Wvfz8rhzgM5JHfP2Mh94F9vBBnUwXkXJjqPGq5BI6tUFKKPuEY/jjrLxaMrt5UDPL9CWkfopkDk9dJvJo03v9NqnB1E4Arc8xTDJnuOo8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(6506007)(33964004)(53546011)(6486002)(186003)(6512007)(2616005)(38350700002)(2906002)(38100700002)(5660300002)(508600001)(83380400001)(86362001)(26005)(8676002)(66946007)(66556008)(66476007)(31686004)(44832011)(6916009)(36756003)(8936002)(316002)(52116002)(966005)(166002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ejI5bTFFd0dHUmlGUVUrZDRVdDVQYW5veGVhWWV1bUR6U2R4aEZTSmVHWG5k?=
 =?utf-8?B?a2xMdTF6M044c3VhYThTUjZ1dlJiK3lyb3BidHVkckZlQU01VVphM09obGxl?=
 =?utf-8?B?am14aEpBWWZmL3Q0MFFpcTVoL0R6RE1Ncm9uODMvN1J3YUN4MFkweVY0bGJP?=
 =?utf-8?B?NFBobld4MHRzOG42VzhTU2RoYldldEJCTyt2Yjhhalc5bis5T3hoZGFPNGdz?=
 =?utf-8?B?aWRTVHVzUVBrckpERkNqREhSQ0g4QURjOXdqR0xPOW0xSVdmOUhmamlKOTY3?=
 =?utf-8?B?dHBSR1hBMkRZaVJxWVAyMXBFWWRmeHN2ZTVQdXI4K2FVTnZUY1lYc04zSU9L?=
 =?utf-8?B?bjRKWENmSFh2NWJjN0VhNDNxemlXYWVKSm5yaktqRFJ0TEE4TFNRS2xPWFI5?=
 =?utf-8?B?MnE3ZWY4UGVXb2JBU3RFa0pXYjNBTm8wU0tnSDQ2MW9aT1lhSS91RVE0SE84?=
 =?utf-8?B?eUM0NE82dkk3eTU2M1FSZk83RnV1RVRLRjQzellsblpSVGtzZ2RmOEYvWTh4?=
 =?utf-8?B?WVJFS3JHSHJvTVVVMFMyOWdrbEptZkRkRk9EWUt1UmVSVFdiUHJSYXVmS0Zl?=
 =?utf-8?B?RVh5YjM1WjY4K1Jvd1d5c2VTbkxkT0Mzc2RQd052SjJrVHc2ZzBRcWtkT0RR?=
 =?utf-8?B?OERnUmRkZWZnSUdTU2JQc3BidWYzRldtcUppeVdibHUyWTBPaWl6NzdJMEI3?=
 =?utf-8?B?RlMyRFdZUEIzRDFzYnVCdUxxK3BtOTNFY3RnakgySE9aKzJoT21TQVUzQmVI?=
 =?utf-8?B?ZTlTcVkwNjR4THpRaU93YmpWcmNPUndDOXovR01IaHFhRGlpUzFxZGhoY0xx?=
 =?utf-8?B?aWpxVUlyZy82RUloYkNhT3ZEZlNpdzZNdGx3ajNuZHlIbXA0aGo3aVd6dmpM?=
 =?utf-8?B?NExDR2wvL3A1TnFhWTE5K3R5MlUrMHUxb0crWlR3TmtrMDRURitudVk1LzVy?=
 =?utf-8?B?cjlpblVXb0tMWDRUczBPVkVvZG4vWmtWNUZVeUlRcFBjOHBka0U2U2NYQ3h1?=
 =?utf-8?B?NWIycWVOdEwzWXVmb2dxYndnWSs4S3RLZERZZUhJZ3NFVm5MVzZXN0E0bC9Z?=
 =?utf-8?B?dWdOUjhBbWpqMjJQN3Bya2IrYmV3YWZPNlNQR0JEUGJKT1lEbDVLL2RUSkJa?=
 =?utf-8?B?VjhndS9kNC9HYXRhSWJ0MkdlY01kVldYRjdjZ3N1ckJaRUdndGZGQVpIaXZ3?=
 =?utf-8?B?eWRNMG5jT1E4cmJtVUJoays4eXNyaWFyMWtLYmg1dG1od3dGdlZ4ZWdkL2pJ?=
 =?utf-8?B?dzduV0dWZ0w1QUkvUG5ndmZQejM4UWFYbnVydytzaklaa0dTbkI5MDloRys2?=
 =?utf-8?B?UXpXcDVMbkI5UmJSQVB0M2FkVm1rTGpjRGprcUpjeXZxUHRZRVRsT3g5VzQ5?=
 =?utf-8?B?WDVid3Z4c051OS9tWkdjakJXLys1VFhwNTIwUXVUU3o2ZE83T2ZaWGpwVjdr?=
 =?utf-8?B?VmgrdVdRZEUzU09hYVdMZ1FQTUdidEx2TWdNcGgvYXdmc2hsalI1bkM3SkFB?=
 =?utf-8?B?RHhFU3NCZnphVmUyNUZldjZ1MmhPWGZsc2NpYXlBajE0cVNOaHd4aFZRWTlU?=
 =?utf-8?B?YStMTFdaMzFXbzlWbnVBR1R4engrcDFlUmc0TWhWZGxXRXoyUXVFNlVUNWxN?=
 =?utf-8?B?OFRnSnF0eHNabnBFV3pBTXNuNE53ak04K3M0YjlRY2FrMDFqazRPUjVNeXRN?=
 =?utf-8?B?WS8veWJOYVEvOU5DOFA0MXZRZy81TEZ5bVRDTmVOZ2kxM0ZwbmZ2S3M1ZS9T?=
 =?utf-8?B?R3liNkVrL3hpQ1BodjU4K0hZQ1VlbzZ4TlVVUDAreHVNdFkwSmRDSjdqL1A3?=
 =?utf-8?B?cU5GWXc2Q2lqaXF5c2g5NjhJcWc5M1I0Wm1mNnJQeXZjcDd6YkhzQXFScnZq?=
 =?utf-8?B?TEdQR1RZd2JoQ0I2MVRCdlNXZS8xaG9vdDU2TnRSTE5mSEZUQlFuOS8wMmcy?=
 =?utf-8?B?MEthaEZ4ckdUYUgvT3ROM29FR3cveG9KUWNvU3c1QTREWUlzVkZZZ0FaYWw5?=
 =?utf-8?B?OTc0T3QyRmJXU05PQzhxTHMvbXVaSkZtWms1Z2lVWUw1Y0M1YTlIbEZ6bHVP?=
 =?utf-8?B?VlBlOXpUSUZyZDlQZ0ZydnU2K3NaWFF1RUJnaW9IenJCYUJtS05VdVVHYzBu?=
 =?utf-8?B?dnBpL2F1d1VnSlAzQVc2Mjg1S0NUTURyeVVjaHg4U0s5Y21YYnVEY1ZkNTRF?=
 =?utf-8?B?YlZtSVRZNkRxSzJlNTY4UWlGNTNKaCtkdWV6UmFtTHhFOEZNbUdaZUJkOU1T?=
 =?utf-8?B?UmpjZU0vSDlDZDhxcndaMk1TcDB3PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cf3ff709-36e4-4118-372f-08d9d78920e7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 18:10:21.3088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 K0t09+9ywLT11zOOyfzH4qEZQz352V9Jd4HyVeufQ8nNvGRqAeO2bkx8jV5rOWYLtj1c/zw0vdlOXOE4Wis9++EvXZtuCMYsFHw0aJDglQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1605
X-Proofpoint-GUID: _5YdMLoqMj0SpCHeN1YGyz3zeiz9ggON
X-Proofpoint-ORIG-GUID: _5YdMLoqMj0SpCHeN1YGyz3zeiz9ggON
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-14_06,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201140112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 18:10:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160583

--------------2723C35C9E6DD1920D6BEAFE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20EHGfVq029491

Please disregard, sorry for the barrage of incomplete patch set.

On 2022-01-14 1:03 p.m., Sakib Sajal wrote:
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   meta/recipes-devtools/qemu/qemu.inc           |  1 +
>   .../qemu/qemu/CVE-2021-3593.patch             | 40 ++++++++++++++++++=
+
>   2 files changed, 41 insertions(+)
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3593.patc=
h
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtool=
s/qemu/qemu.inc
> index 6c00bf274b..6b544a4344 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -73,6 +73,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.t=
ar.xz \
>              file://CVE-2021-3592_1.patch \
>              file://CVE-2021-3592_2.patch \
>              file://CVE-2021-3592_3.patch \
> +           file://CVE-2021-3593.patch \
>              "
>   UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>  =20
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3593.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3593.patch
> new file mode 100644
> index 0000000000..dd14c240a8
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3593.patch
> @@ -0,0 +1,40 @@
> +From fe99634066e1074aaf55e83b576385877d7e4bcc Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <marcandre.lureau=
@redhat.com>
> +Date: Fri, 4 Jun 2021 16:32:55 +0400
> +Subject: [PATCH 04/12] upd6: check udp6_input buffer size
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fixes: CVE-2021-3593
> +Fixes: https://gitlab.freedesktop.org/slirp/libslirp/-/issues/45
> +
> +Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> +
> +Upstream-Status: Backport [de71c15de66ba9350bf62c45b05f8fbff166517b]
> +CVE: CVE-2021-3593
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + slirp/src/udp6.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/slirp/src/udp6.c b/slirp/src/udp6.c
> +index 6f9486bbc..8c490e4d1 100644
> +--- a/slirp/src/udp6.c
> ++++ b/slirp/src/udp6.c
> +@@ -28,7 +28,10 @@ void udp6_input(struct mbuf *m)
> +     ip =3D mtod(m, struct ip6 *);
> +     m->m_len -=3D iphlen;
> +     m->m_data +=3D iphlen;
> +-    uh =3D mtod(m, struct udphdr *);
> ++    uh =3D mtod_check(m, sizeof(struct udphdr));
> ++    if (uh =3D=3D NULL) {
> ++        goto bad;
> ++    }
> +     m->m_len +=3D iphlen;
> +     m->m_data -=3D iphlen;
> +
> +--
> +2.31.1
> +
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160575): https://lists.openembedded.org/g/openembed=
ded-core/message/160575
> Mute This Topic: https://lists.openembedded.org/mt/88426914/4422444
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
sakib.sajal@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------2723C35C9E6DD1920D6BEAFE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20EHGfVq029491

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Please disregard, sorry for the barrage of incomplete patch set.</=
p>
    <div class=3D"moz-cite-prefix">On 2022-01-14 1:03 p.m., Sakib Sajal
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:16CA351C3BA3B44B.29498@lists.op=
enembedded.org">
      <pre class=3D"moz-quote-pre" wrap=3D"">Signed-off-by: Sakib Sajal <=
a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:sakib.sajal@windriver.co=
m">&lt;sakib.sajal@windriver.com&gt;</a>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3593.patch             | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3593.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 6c00bf274b..6b544a4344 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -73,6 +73,7 @@ SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"=
https://download.qemu.org/${BPN}-${PV}.tar.xz\file://CVE-2021-3592_1.patc=
h\file://CVE-2021-3592_2.patch\file://CVE-2021-3592_3.patch\+file://CVE-2=
021-3593.patch\">&quot;https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3592_1.patch \
            file://CVE-2021-3592_2.patch \
            file://CVE-2021-3592_3.patch \
+           file://CVE-2021-3593.patch \
            &quot;</a>
 UPSTREAM_CHECK_REGEX =3D &quot;qemu-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&quo=
t;
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3593.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2021-3593.patch
new file mode 100644
index 0000000000..dd14c240a8
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3593.patch
@@ -0,0 +1,40 @@
+From fe99634066e1074aaf55e83b576385877d7e4bcc Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D <a class=3D"moz-txt=
-link-rfc2396E" href=3D"mailto:marcandre.lureau@redhat.com">&lt;marcandre=
.lureau@redhat.com&gt;</a>
+Date: Fri, 4 Jun 2021 16:32:55 +0400
+Subject: [PATCH 04/12] upd6: check udp6_input buffer size
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes: CVE-2021-3593
+Fixes: <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedes=
ktop.org/slirp/libslirp/-/issues/45">https://gitlab.freedesktop.org/slirp=
/libslirp/-/issues/45</a>
+
+Signed-off-by: Marc-Andr=C3=A9 Lureau <a class=3D"moz-txt-link-rfc2396E"=
 href=3D"mailto:marcandre.lureau@redhat.com">&lt;marcandre.lureau@redhat.=
com&gt;</a>
+
+Upstream-Status: Backport [de71c15de66ba9350bf62c45b05f8fbff166517b]
+CVE: CVE-2021-3593
+
+Signed-off-by: Sakib Sajal <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
+---
+ slirp/src/udp6.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/slirp/src/udp6.c b/slirp/src/udp6.c
+index 6f9486bbc..8c490e4d1 100644
+--- a/slirp/src/udp6.c
++++ b/slirp/src/udp6.c
+@@ -28,7 +28,10 @@ void udp6_input(struct mbuf *m)
+     ip =3D mtod(m, struct ip6 *);
+     m-&gt;m_len -=3D iphlen;
+     m-&gt;m_data +=3D iphlen;
+-    uh =3D mtod(m, struct udphdr *);
++    uh =3D mtod_check(m, sizeof(struct udphdr));
++    if (uh =3D=3D NULL) {
++        goto bad;
++    }
+     m-&gt;m_len +=3D iphlen;
+     m-&gt;m_data -=3D iphlen;
+=20
+--=20
+2.31.1
+
</pre>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#160575): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/160575">https:/=
/lists.openembedded.org/g/openembedded-core/message/160575</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/88426914/4422444">https://lists.openembedded.org/mt/=
88426914/4422444</a>
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

--------------2723C35C9E6DD1920D6BEAFE--

