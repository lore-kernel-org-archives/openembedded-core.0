Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.72])
 by mx.groups.io with SMTP id smtpd.web08.3648.1617857292101789992
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 21:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jbXNHF1K;
 spf=pass (domain: windriver.com, ip: 40.107.243.72, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7L8acFjekxFPSMTxEcRUoib+atv0W8tNrHtSZ3a8NDKGxz0oeXr3PoPugZ+OzlPRV8zTulU1gnbyn9VyzlB3Q/LGGrD8sulYHLa8WB+Gazc2ZeuO2gRO76WYUvRT8lQnrPo2v7RWOHFZFLvulC6sUktCmNAo/oUqt1zSQxqPid1Ug8o6IcrUUHeiHoPonPFN/XfodIxHipUEmtThYk8e18KDyO7hRoSznF1h20iqxGnCpj+iVpp0Vv4GmEXZc6z/1Sx1i2OhFh9SHex94tKgj6Z6LVWLzPctJ1epUD4zAodEAuedTUY/NWlL/2lBqeuvhtxF9FR1KKD6umC7bOgMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQuWLby0FJTvM70iZoERhsDEHvSSSRYFgZViXDjXIBQ=;
 b=ilwk+mwflwhmDI5kg89Nm/MBy+kVgKNtY8Mshl5V+kJD+2V7bxbaYCeyMOXOLP0nkhPIqaTPltnat5OtZJXTQJe2pgQ3oP2Xc9/7lsm8eK+de/zpTlCsaEVwknwkSma/h9q/6/FOCcBuU7urXNmt+fZsG61exMdSKx3mW9ziLuFMZwXZk24ynUm/IWRwaAwW4y+S0RYMZx40r1PaKiA6gQzHnkNg9AtdJ6HK5i/tlDM6+Cc/j/BFTHY/VyspqClrp6d6IKE7V7/Xidd+4QktIn1HHi2JlKNxjkkaT1+VEGCdxHmfg4FLbTOQlq9ftmaB+aLncTsz3LgVaGkWiud7LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQuWLby0FJTvM70iZoERhsDEHvSSSRYFgZViXDjXIBQ=;
 b=jbXNHF1KRyxZP9S8GGo/Q8NjcBpgru8pwHW97JMaSRhF0LME+mAsEsPd8i/0Suqmbarq0cwaCW3e2LhtBbMHevyQXNw9+lUMrpplp6PYw4DgQuPWfAtJsDLCX3Pvu8Q6t+cEIu61+zXGU3MXiVWPSljw+Lsdz/VQqaxxcxtMUWw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by SJ0PR11MB4911.namprd11.prod.outlook.com (2603:10b6:a03:2ad::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 8 Apr
 2021 04:48:08 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 04:48:08 +0000
Subject: Re: [OE-core][PATCH] busybox: fix CVE-2021-28831
To: openembedded-core@lists.openembedded.org
References: <1673C8868459A69B.16683@lists.openembedded.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <ea41a680-c7dd-e773-0660-56d9136e6843@windriver.com>
Date: Thu, 8 Apr 2021 12:58:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <1673C8868459A69B.16683@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0034.apcprd03.prod.outlook.com
 (2603:1096:203:c9::21) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HKAPR03CA0034.apcprd03.prod.outlook.com (2603:1096:203:c9::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4042.6 via Frontend Transport; Thu, 8 Apr 2021 04:48:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7a470f3-0802-4a5b-0e01-08d8fa4980fe
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4911:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB49110B4C215B46319A1DC819ED749@SJ0PR11MB4911.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q9Fdu5f9KNJDLA9Tj7QicnQTNzEOncG97eR8clI+oxNROCWmQkiirJAQA4Tvrv/y5AQhGbhafcrlciCQbMve4/0SAKBbMK/DVC1/ysRPIASQ7NiKbRl12wcCtBPTUjkMndKTvNyFUcpPniJtSk12EhXMpPDB1WvWZk0SkAppmbXAriGjXjPGnSXdsE9CLw7kIC+jGqvclBKqxoI54DaUdefm6MuGDWFiKOB4tA3exit+8W0pXaP8eT5Kkqncspr8Yk6X3DQo8XyI0cWQ3lg+MPS+4zkl5iI309IFpFiJgjv0zNwT+yAy5lTfdkNyOO2jqbrRSmGpQczmdo6KtsNk1fwcjDirtjcUfdUYjxVWDU6HC7VrsslJkD6Ae2uGRWtsCwQjlSrPZqoYeEJKA63GVQH/aHG2dBOCh9xwCFIKBP1CQTGlWhjUdE08rr8lwD1onNzDVlaeptkqs4cKhIhTNHW6k5Ks2d6hYixLmOkDMzGvcbM4g60pjLjBD45btiQFkxhjdmepNRsC1Mq1aHS0fi81SYr+zhll5YwojiWj+IPL1MgkIGooWcgMIUDjX+wu62h6HetgMjmBu6rKqfPoELIxa3HXc906C/zRLf/hKYGjNZiRSCL3+F+d94oi0DfmWXeTXJHD4+DhPNZFKDgB1GAyvEcMfX2DNjToqhuIKFkxQVW7Qd4jdwhp3SiDwuqoCDJTiaVinfz71MxxT87/NwQcwJiZS8LAqkFNekrND4JglzIS7VUZxf21BB/VGG9S2Z4cB86BXYYQVeD3ugA19c+s11mE9MfHlZQhK36qtBFBT76D15XmuulF0JNm0cGKJlxRKrX0QgLDYgtgNF2Rtoj0t8+X/vOngonVIIOadfo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(346002)(376002)(366004)(38350700001)(2616005)(956004)(2906002)(316002)(16576012)(6666004)(38100700001)(16526019)(186003)(26005)(6486002)(53546011)(6706004)(6916009)(966005)(8676002)(5660300002)(33964004)(8936002)(52116002)(31686004)(478600001)(66946007)(66556008)(66476007)(83380400001)(31696002)(166002)(86362001)(36756003)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?UGZhSS9EVW82QVhiK1ZIblJjcU1QZWUwOFJZV0xyTlJVSGxNa2VFWVQ0cDF0?=
 =?utf-8?B?WGFEdXNFSklGQTh1K2hHdTJvT3BPTWFYRGhiUHVFKzNRM2xZQ1c1RVEzQ2Z3?=
 =?utf-8?B?d1crQ1JBZnpibUlCZjJlaUJCQitBamQyZ0JxdGxQUTNydittY3NKcm0rbUNt?=
 =?utf-8?B?TEEvaG42Ry95TGFocEt1cWlDTy9aYkJiOWNkTmI1aEhNWTRLcXU4K0lyL01D?=
 =?utf-8?B?QnArUlNpajh5V3pMaHdjcFRkRXpoS1FrVnlZS2FwQXlrMGs3K2tSeUZYS1Ja?=
 =?utf-8?B?Y05YTDVxUENxeStVYldYd2lXaDNJUkhHemVWbi9aRE14NVYzejlYOFpkandw?=
 =?utf-8?B?NHcxMGlMQUJ3c1dvOEE1QW83OEhkVFhsKzZUczNnVkRkRzVEcmQxbVYrWHc2?=
 =?utf-8?B?QUxMQ2gwQ0VpT1dYUkxrYlRZR0RsMUpVc1ZnNVM5Zmh2SjVDRDJSRnQxWEJG?=
 =?utf-8?B?dGFlMzJvNXVMSk9DbnZMTVJLZGxZUlFSY3FyM3YreWhEUmYweC9tWkhtWXdM?=
 =?utf-8?B?b09oampvN3JOOTBEdGxTSmFRL2pzNWZjU0tTTVNNQ29vd0pGQ05vZkcvSTZJ?=
 =?utf-8?B?NTlKdGVIeGxFa1RYRTJYZWZmd2ZHMTREcFpzRGF6aTJHWnJwWkY0ZURncTM3?=
 =?utf-8?B?OHZMcUJRd296UUVXVmZKNmZxTS84cTlLTmxOZ0tPMldQckp3ZnhrRC9qYm80?=
 =?utf-8?B?UUY4L3J1RU12dkFZSm1SbzJWZlNVbDBnckdxSEhJUkhUTEJ0RFpnbzJrMEJQ?=
 =?utf-8?B?TnRPUC84Vk40WkdQK05yUG90SUJSZGI0aXB5dzJpWU56OHRFb1JWWitNTGg1?=
 =?utf-8?B?a0U0aGg4S0lBeVhoYWNjM3kwWEJOQjViM3l4RFgxbGtqQVlnck1YS2NCSjdZ?=
 =?utf-8?B?WVNpMFlvZGs5TGROWG54T3hiR2xuNVJraTE0bG5ZMDNPMGNPakZLS0szd3JP?=
 =?utf-8?B?cEpZVzRwcy80TXZpTmE3ZkJYaFhyQVRzZlhUT243TmJzbENvZktRYzQyblJh?=
 =?utf-8?B?Nk9STFdwdkVvSk8wanVKWTI3Y0pvRldiUDJ2WmFpck1mK3BjL1gxNW96TUsr?=
 =?utf-8?B?cEdwcmpsVng0RUcyYjQrNGtBUkJmNGJQQ0pwTXlnYzZKdzBFelNFQmxuemlv?=
 =?utf-8?B?dDNOQ2NOZUN1UDkrSDlFRkt6SnJZOE92YVlkbGx0U0QxZk44cEFDOTRFSEl6?=
 =?utf-8?B?d1VselhHeStQNkpaRUMxOUlVRmRwYWVpQlFhbVV1UUw5NHdWZ1lKd0JPMGpO?=
 =?utf-8?B?MC9VVk1MOS9yNGdRemxZUmQwZ0pSSWhJMHFDOHNSSjExdjJPT3V0Wkw4TlFO?=
 =?utf-8?B?MmJKWGtHTUIxSVZvUlRJREtQZm5TWnh5NW9nTnVTN3dTSldoWHdoRXVLQW5H?=
 =?utf-8?B?Nm5LbmlWaXNJMTB5OWlITytoOG5SaklvekhFWC9YVXc5UlZIZTViMWg2M1NC?=
 =?utf-8?B?aFhxWlNueFJabWc5T21wdk1OVGRsUFRZNXZENjRIUlNFTkx6ZVp6NXIyc3J1?=
 =?utf-8?B?cHVMVy9YbUFCVmlLckxQZ3cwZ1VBK2wwSGVqd1Y4ZUhLd3ArNVNqNEdGY2Zv?=
 =?utf-8?B?RVlJdkhrSm11NWEzOEtHUStXVENvL3c4RWRuZm0ydWFxUjUzTlpvbEtXVTJF?=
 =?utf-8?B?N3RxejVoa1Noa0EwNnd4Z3pTRmJRL3VrTHVYbkNZaW9LakJuMVZNN0tWK1hB?=
 =?utf-8?B?SW93NC9xTTdrL0xRa0FYOEpNS2hPc0dPU1BMY2hLVUlrZWo4STF3Z2kvbGNJ?=
 =?utf-8?Q?zZ/OFR3UINx1mTu4jns9vDlbZ8qAaDsqSDOt8Jj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a470f3-0802-4a5b-0e01-08d8fa4980fe
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 04:48:08.1132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CubS3lB/IFUoH8522S02ExEfIk9H698TevhvX4WxOBG5cxq0+DvUcHrqrj1GSeg17WBiosQYoPPMNW61waZk0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4911
Content-Type: multipart/alternative;
 boundary="------------5AE2EEDC875C4E5B42F7AAB3"

--------------5AE2EEDC875C4E5B42F7AAB3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry, please ignore this patch.

On 04/08/2021 12:46 PM, Chen Qi wrote:
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   ...ss_gunzip-Fix-DoS-if-gzip-is-corrupt.patch | 57 +++++++++++++++++++
>   meta/recipes-core/busybox/busybox_1.33.0.bb   |  9 ++-
>   2 files changed, 65 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
>
> diff --git a/meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch b/meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
> new file mode 100644
> index 0000000000..e8e9a8380e
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
> @@ -0,0 +1,57 @@
> +From fe791386ebc270219ca00406c9fdadc5130b64ee Mon Sep 17 00:00:00 2001
> +From: Samuel Sapalski <samuel.sapalski@nokia.com>
> +Date: Wed, 3 Mar 2021 16:31:22 +0100
> +Subject: [PATCH] decompress_gunzip: Fix DoS if gzip is corrupt
> +
> +On certain corrupt gzip files, huft_build will set the error bit on
> +the result pointer. If afterwards abort_unzip is called huft_free
> +might run into a segmentation fault or an invalid pointer to
> +free(p).
> +
> +In order to mitigate this, we check in huft_free if the error bit
> +is set and clear it before the linked list is freed.
> +
> +Signed-off-by: Samuel Sapalski <samuel.sapalski@nokia.com>
> +Signed-off-by: Peter Kaestle <peter.kaestle@nokia.com>
> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> +Upstream-Status: Backport
> +CVE: CVE-2021-28831
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + archival/libarchive/decompress_gunzip.c | 12 ++++++++++--
> + 1 file changed, 10 insertions(+), 2 deletions(-)
> +
> +diff --git a/archival/libarchive/decompress_gunzip.c b/archival/libarchive/decompress_gunzip.c
> +index eb3b64930..e93cd5005 100644
> +--- a/archival/libarchive/decompress_gunzip.c
> ++++ b/archival/libarchive/decompress_gunzip.c
> +@@ -220,10 +220,20 @@ static const uint8_t border[] ALIGN1 = {
> +  * each table.
> +  * t: table to free
> +  */
> ++#define BAD_HUFT(p) ((uintptr_t)(p) & 1)
> ++#define ERR_RET     ((huft_t*)(uintptr_t)1)
> + static void huft_free(huft_t *p)
> + {
> + 	huft_t *q;
> +
> ++	/*
> ++	 * If 'p' has the error bit set we have to clear it, otherwise we might run
> ++	 * into a segmentation fault or an invalid pointer to free(p)
> ++	 */
> ++	if (BAD_HUFT(p)) {
> ++		p = (huft_t*)((uintptr_t)(p) ^ (uintptr_t)(ERR_RET));
> ++	}
> ++
> + 	/* Go through linked list, freeing from the malloced (t[-1]) address. */
> + 	while (p) {
> + 		q = (--p)->v.t;
> +@@ -289,8 +299,6 @@ static unsigned fill_bitbuffer(STATE_PARAM unsigned bitbuffer, unsigned *current
> +  * or a valid pointer to a Huffman table, ORed with 0x1 if incompete table
> +  * is given: "fixed inflate" decoder feeds us such data.
> +  */
> +-#define BAD_HUFT(p) ((uintptr_t)(p) & 1)
> +-#define ERR_RET     ((huft_t*)(uintptr_t)1)
> + static huft_t* huft_build(const unsigned *b, const unsigned n,
> + 			const unsigned s, const struct cp_ext *cp_ext,
> + 			unsigned *m)
> diff --git a/meta/recipes-core/busybox/busybox_1.33.0.bb b/meta/recipes-core/busybox/busybox_1.33.0.bb
> index 1a3f218bca..4fcf533aa8 100644
> --- a/meta/recipes-core/busybox/busybox_1.33.0.bb
> +++ b/meta/recipes-core/busybox/busybox_1.33.0.bb
> @@ -46,7 +46,14 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
>              file://rev.cfg \
>              file://pgrep.cfg \
> -"
> +           file://lspci.cfg \
> +           file://lsusb.cfg \
> +           file://mdev.cfg \
> +           file://mount-cifs.cfg \
> +           file://ps-extras.cfg \
> +           file://getopt.cfg \
> +           file://0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch \
> +           "
>   SRC_URI_append_libc-musl = " file://musl.cfg "
>   
>   SRC_URI[tarball.sha256sum] = "d568681c91a85edc6710770cebc1e80e042ad74d305b5c2e6d57a5f3de3b8fbd"
>
>
> 
>


--------------5AE2EEDC875C4E5B42F7AAB3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Sorry, please ignore this patch.<br>
      <br>
      On 04/08/2021 12:46 PM, Chen Qi wrote:<br>
    </div>
    <blockquote cite="mid:1673C8868459A69B.16683@lists.openembedded.org" type="cite">
      <pre wrap="">Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
---
 ...ss_gunzip-Fix-DoS-if-gzip-is-corrupt.patch | 57 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.33.0.bb   |  9 ++-
 2 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch b/meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
new file mode 100644
index 0000000000..e8e9a8380e
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
@@ -0,0 +1,57 @@
+From fe791386ebc270219ca00406c9fdadc5130b64ee Mon Sep 17 00:00:00 2001
+From: Samuel Sapalski <a class="moz-txt-link-rfc2396E" href="mailto:samuel.sapalski@nokia.com">&lt;samuel.sapalski@nokia.com&gt;</a>
+Date: Wed, 3 Mar 2021 16:31:22 +0100
+Subject: [PATCH] decompress_gunzip: Fix DoS if gzip is corrupt
+
+On certain corrupt gzip files, huft_build will set the error bit on
+the result pointer. If afterwards abort_unzip is called huft_free
+might run into a segmentation fault or an invalid pointer to
+free(p).
+
+In order to mitigate this, we check in huft_free if the error bit
+is set and clear it before the linked list is freed.
+
+Signed-off-by: Samuel Sapalski <a class="moz-txt-link-rfc2396E" href="mailto:samuel.sapalski@nokia.com">&lt;samuel.sapalski@nokia.com&gt;</a>
+Signed-off-by: Peter Kaestle <a class="moz-txt-link-rfc2396E" href="mailto:peter.kaestle@nokia.com">&lt;peter.kaestle@nokia.com&gt;</a>
+Signed-off-by: Denys Vlasenko <a class="moz-txt-link-rfc2396E" href="mailto:vda.linux@googlemail.com">&lt;vda.linux@googlemail.com&gt;</a>
+Upstream-Status: Backport
+CVE: CVE-2021-28831
+Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
+---
+ archival/libarchive/decompress_gunzip.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/archival/libarchive/decompress_gunzip.c b/archival/libarchive/decompress_gunzip.c
+index eb3b64930..e93cd5005 100644
+--- a/archival/libarchive/decompress_gunzip.c
++++ b/archival/libarchive/decompress_gunzip.c
+@@ -220,10 +220,20 @@ static const uint8_t border[] ALIGN1 = {
+  * each table.
+  * t: table to free
+  */
++#define BAD_HUFT(p) ((uintptr_t)(p) &amp; 1)
++#define ERR_RET     ((huft_t*)(uintptr_t)1)
+ static void huft_free(huft_t *p)
+ {
+ 	huft_t *q;
+ 
++	/*
++	 * If 'p' has the error bit set we have to clear it, otherwise we might run
++	 * into a segmentation fault or an invalid pointer to free(p)
++	 */
++	if (BAD_HUFT(p)) {
++		p = (huft_t*)((uintptr_t)(p) ^ (uintptr_t)(ERR_RET));
++	}
++
+ 	/* Go through linked list, freeing from the malloced (t[-1]) address. */
+ 	while (p) {
+ 		q = (--p)-&gt;v.t;
+@@ -289,8 +299,6 @@ static unsigned fill_bitbuffer(STATE_PARAM unsigned bitbuffer, unsigned *current
+  * or a valid pointer to a Huffman table, ORed with 0x1 if incompete table
+  * is given: &quot;fixed inflate&quot; decoder feeds us such data.
+  */
+-#define BAD_HUFT(p) ((uintptr_t)(p) &amp; 1)
+-#define ERR_RET     ((huft_t*)(uintptr_t)1)
+ static huft_t* huft_build(const unsigned *b, const unsigned n,
+ 			const unsigned s, const struct cp_ext *cp_ext,
+ 			unsigned *m)
diff --git a/meta/recipes-core/busybox/busybox_1.33.0.bb b/meta/recipes-core/busybox/busybox_1.33.0.bb
index 1a3f218bca..4fcf533aa8 100644
--- a/meta/recipes-core/busybox/busybox_1.33.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.33.0.bb
@@ -46,7 +46,14 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball\file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch\file://rev.cfg\file://pgrep.cfg\-">&quot;https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
            file://rev.cfg \
            file://pgrep.cfg \
-&quot;</a>
+           <a class="moz-txt-link-freetext" href="file://lspci.cfg">file://lspci.cfg</a> \
+           <a class="moz-txt-link-freetext" href="file://lsusb.cfg">file://lsusb.cfg</a> \
+           <a class="moz-txt-link-freetext" href="file://mdev.cfg">file://mdev.cfg</a> \
+           <a class="moz-txt-link-freetext" href="file://mount-cifs.cfg">file://mount-cifs.cfg</a> \
+           <a class="moz-txt-link-freetext" href="file://ps-extras.cfg">file://ps-extras.cfg</a> \
+           <a class="moz-txt-link-freetext" href="file://getopt.cfg">file://getopt.cfg</a> \
+           <a class="moz-txt-link-freetext" href="file://0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch">file://0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch</a> \
+           &quot;
 SRC_URI_append_libc-musl = <a class="moz-txt-link-rfc2396E" href="file://musl.cfg">&quot; file://musl.cfg &quot;</a>
 
 SRC_URI[tarball.sha256sum] = &quot;d568681c91a85edc6710770cebc1e80e042ad74d305b5c2e6d57a5f3de3b8fbd&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------5AE2EEDC875C4E5B42F7AAB3--
