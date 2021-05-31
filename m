Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.120])
 by mx.groups.io with SMTP id smtpd.web12.45150.1622473187588613235
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 07:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mysnt.onmicrosoft.com header.s=selector2-mysnt-onmicrosoft-com header.b=dTYBDIz9;
 spf=pass (domain: kontron.de, ip: 40.107.21.120, mailfrom: frieder.schrempf@kontron.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8MES/dvAfp9H5aGmm6+7Kil70XNqgsn9iWlZX6swyxe69KBjpmb03FFYhkmQRJbGUMV+qf9C5KQdyfNxmAB+ExKh4MLURAbzIR2vwrujqADe8EwoNQBA9eMN+BdiWqrL77uk61VgFJ6/LMzyHS37dRRNTBQhhppiOiysoSHIp/9vJ5jmo2peQhHvu3DC8P8j9eh59p4iWj9OGxYyFA92otedxrqBKO9Kt3YcV4yLXcPOZ5wN0nFQJ4sNJuowRjP9mbqWrbpppiMvQzI0EGniqEI18G0nYKoz1XqBYiU4iO/Fzz72/HSOTnKOzBmyVdZCCMDTcPtKLGcthVKw+JceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptuKll3Kw/NIjYpYkdKmQz8viQR+6BZMW1Al6ymNHnY=;
 b=j6fB5yCWyDUUexL+6t9s9IcbfYilOjQ3RsD5mK74/cfRZKCsgOT0g0fjKYFpAmL++ccKp1lYiTDHgklQWmJCC9wk9vxeH306HXbJ1U2cO40hFtPTaq2zyUONt76UaCfZnGk6qS+BfEqnB+4Drm3F70Rkz5oQ7nZwvdim5wAi0xbw8grmkt25C4OVV9o9ZjFuzikSqBnGDHNjhVi6Hc7VeiSa1oj09pqBY4b9orYoPp4RPtKBYlxuigSyi1UvZS847fh3ld1es+c+OmCyUnZ6fJlzeGb/pSsgqJaw10H7QXNJ6yHbOyGA+R07IZRy32FckruVOKX7aov4iN+zAu2SFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptuKll3Kw/NIjYpYkdKmQz8viQR+6BZMW1Al6ymNHnY=;
 b=dTYBDIz91Ep5lCLlnc5NdrttR1PzbOBy0nv2Siwkd0fUwEzbQnur7/DABmj/SbN9J5yylIa21r5vUc2wHaoEa3ExWTHS1uQdkr7m33BMxbGGSkgrLdankHhpZnK4D2ZxeojNAJt7QzsOnDPCIcefMgQkoHOHl9jT0tv62yT7NaM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB3249.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:186::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Mon, 31 May
 2021 14:59:44 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1133:8761:6cc9:9703]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1133:8761:6cc9:9703%5]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 14:59:44 +0000
Subject: Re: [OE-core] [PATCH v2] kernel-fitimage: Don't use unit addresses on FIT
To: Steve Sakoman <steve@sakoman.com>
References: <99b61172c516c71dadbc7342da4e20a064299110.camel@linuxfoundation.org>
 <20210222183818.22615-1-klaus@linux.vnet.ibm.com>
Cc: klaus@linux.vnet.ibm.com, openembedded-core@lists.openembedded.org
From: "Frieder Schrempf" <frieder.schrempf@kontron.de>
Message-ID: <648ca8e0-5a3d-ff2a-2b5a-5884cd618f5c@kontron.de>
Date: Mon, 31 May 2021 16:59:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210222183818.22615-1-klaus@linux.vnet.ibm.com>
X-Originating-IP: [46.142.175.98]
X-ClientProxiedBy: AM8P190CA0009.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::14) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
Return-Path: frieder.schrempf@kontron.de
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.32] (46.142.175.98) by AM8P190CA0009.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Mon, 31 May 2021 14:59:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fa0ae9b-139e-41f4-2e15-08d92444b9e4
X-MS-TrafficTypeDiagnostic: AM0PR10MB3249:
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB32496A88E97329D22A9C25F4E93F9@AM0PR10MB3249.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:328;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aQ8hCI6Q1CCXFdOTR7uOtO3xWqMTWId9aU8oqvcHbo8MX9sa0rwCZS+3iPOWQzex8gD/fjkUqIVYLmoU2FTmJH/yAiGEBgBW3dCyNUpJUZujP7c2+P4FJY0O1pmMsNPeErCaBGK4Ob+el/bAhjydfBCvIUuGib28NKD33tCNAFQdKHHNnL0nyCTC5sJE+dSFhWIcW9KjlSEHnoowVC0sa+BLbnxQyndMGH8J+39CTXNxpJq2YA5m8NkHMfjQ9HiXX7+W9gVydsU+ANwYRFG1Ky2m4FO7az69/4DPwwpjV5u8BlV+hKG+wF8BMAKSmvfDgPnejPmn5pxTrnc6TrWrIvFgQAJXVnKvibAO68EHGGZ+KT4zJhN/gtYCQpt4A0NhwDYkQj6kzTLQdF8VwCoi1uIcWmlH6OKqvRQcGlt9S2DE34702kpVWGdguFr+uFlp+GM3EnJUG7dE4GSd0cQtsieqi/03IRdwCAplwrrDDK95y9d9plfpxAqn5OuUErvxVCmJ9Pds4LMxHn1IHW4r2QN2VWvL9HuKRD2TCJhl0e1lhXglpPHz4pK12AfM0B0Cx1rToN5Vs9hKiYozcVJWxqzJqBQiNvHOSAnSYvqxb5DTwhWOQ67sBHTs2GIjcspr7OjGkCC1BxNc8FinQVGWznnKgVahugX9YtaLe9JXoIOFd2fIXlE1ygmLO2nG22RYBwT4Tp2TSN/5q0dv+fz42Ne9teLOd89iPedVABMce2bvAG0OBFxAsv/4gg06sZ6iRTxzXoo5uy40P+EipJLo22scD1PwVTD26e2/mTH8xpT2YASiTFw8QFn4QBeAwUfN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(16576012)(316002)(5660300002)(2906002)(30864003)(2616005)(478600001)(44832011)(36756003)(4326008)(38100700002)(956004)(6916009)(6486002)(31696002)(83380400001)(8676002)(966005)(53546011)(86362001)(186003)(66556008)(66476007)(31686004)(16526019)(66946007)(26005)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?N1VUeDBUSEpKaExWWEZ6UE1MckZLampRam5sQ2cwWUFEWWpWREYyaFVRNHBy?=
 =?utf-8?B?dVdGR0JZR2RLS1NTSVZxUFFBLy9OZFp0WFYxalMvVEY0UDhRTUF1V3JLLzNE?=
 =?utf-8?B?NFJzMU1VL0Y1L0x3K3RZNW0xVEF4ZzVSbVZMM0xoUTArbFMxMktqUnBqWU1G?=
 =?utf-8?B?a0gzZTQzRGlUSE5KRFB6bzl0YURzY0t6ZFZiWVZGQks5WUVrM2RQK21hVU1U?=
 =?utf-8?B?ZytSTlMvNkMwWnhvZ0J0Vmg2MWI1SWVQeUpFMjdRUzBxR1pZc2FEa094em56?=
 =?utf-8?B?aEhMcVdaR1cyUStnVVRqYzVhemFDY1ZnRC9hWWRYTmY5VWJHT3RZUW5jYTNw?=
 =?utf-8?B?S3JOUEVjWUd3eENYV1llK2dQR28rdFRTTGEybDFGaW14SUNTWXoxT3dMVHhW?=
 =?utf-8?B?OW5ndmM2QkhlU3J4RXUzM1BzN3MwNkVReEdqVDZuS3ZHNEcwMlozYVNWUEFu?=
 =?utf-8?B?S0hYTWpURjVLbFhMVXBxWlBxVUlmRFFHNWNaa1FON3ZVd3FyOEVzVllBTG51?=
 =?utf-8?B?U05hUnZmd0xFaHNhZzVzV2tKZ2FYSEVSRmtZdkMreFAwazFXemcyK1JpbGIv?=
 =?utf-8?B?STR2Tjhhazloc2N1TGJUd0krK3BDU29taTRUNHYxQjJzWFBQbVZCRk9QSFhJ?=
 =?utf-8?B?blBpaGtJYVZ1MWgzUElnWnFYK0s2NEFETm5STko3dTZJdFNIOExxVTJyTjl3?=
 =?utf-8?B?MXpVT3Byc3hIa1poeFJIOUkrRUM0aUpRRy9HVE1yaVZycGVLYU5zTTZxNHZV?=
 =?utf-8?B?cmUvb1dsVTFUb1A3anhvV2VPWW52K3l0aG1rcTg1SDExWHFwVC9wKzZCRDlF?=
 =?utf-8?B?ZGhjUG4vcnR6dm94UFZLNCtHUHNXT1REcXR3angraXM3djVNSXZ1KzlWWTkx?=
 =?utf-8?B?ekljd0JBV1Z2WmhNQlpuOWlRU1paOWVMd1B0YnljaG9qR1AyNEZ0U2R0aU9r?=
 =?utf-8?B?MEFHWSt5WElyNXpZQjlIeGpMaWNlVk9uWFRkMWNwbmlPMGRYcG9XZHI3ZUlY?=
 =?utf-8?B?TDkyZXNXSnRscE0rcFk2WGVmWTlMeTNtSlFQbW9uVmIrRHpkdVJ5WGhrN2Z0?=
 =?utf-8?B?M1R5N2pvQUloejNzT1dpSzJ5VkF6Q1hLekxLR1c5VHRGRG5CSkt1a0lyb2ZJ?=
 =?utf-8?B?eHh0eCsyQXVlYUZNbzUvSEJPeG9uSnVhcldUeERmanBqQnd2ODZNdHczNDFO?=
 =?utf-8?B?MVk0ZzlUb0U1TFEvcVJvR3EzZmhIWG5EOU5wWitibWF6OHZFM3kzMmRmbUJz?=
 =?utf-8?B?OW93NWR1cWVoQUl1YWg2QVVIRFdjQjVKcjNGSS9iT3dGRjloeG90YTE0UzRm?=
 =?utf-8?B?dVJtV0hLemFnTUczeWcwMlVpaXpoNVc4YWthSC9ra1QyT3VFOUlMaFd5Q2VK?=
 =?utf-8?B?VFJGd3JoVFF5MVlXVGFwOW94TThrL01qRDBLNFFPUExFMWVZN2NjT1UzdThl?=
 =?utf-8?B?ZlVhRnZOU1FOczloanAzK1kzaGlFQjUzZGdLWGtQZVlWazQyRDd1OWI3ZnFE?=
 =?utf-8?B?NUZMYWo4ZklObUVUY2hkVVlNUzVGWE1YU09IeGRhYkVPVmFCY1ZrSWN3Q24w?=
 =?utf-8?B?VzU0ZEZoQlBuSE12QkNvQitpZzQxakpXNGE1RTdVRDdDT0lmVlFSckN2Wmw5?=
 =?utf-8?B?WWZTR3lpMVR0byt5MlQxQk1lNkNEZ0tOV0VJbURkVDkwZi9XMXNSN3o2OFp1?=
 =?utf-8?B?alV1SGlHMzFia0orWURxandHWktFa3RlRWVhTHpwQS9YdGIzZ1IwOFR0aEc4?=
 =?utf-8?Q?4ccGUoQkpBXC3lAUxrEfn8fhlbTxYhoVzFUoufQ?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa0ae9b-139e-41f4-2e15-08d92444b9e4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 14:59:44.8018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYj7E1O4ONz3/Z2e1kgTS1ZEyj/4BTlXIE2l8r57XWiyI4293R23JlhnmrQD/vjQu5iTonvIA9dKYlA9u6oeUV64KPI/DnOIPR4/9FiHImE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3249
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Steve,

On 22.02.21 19:38, Klaus Heinrich Kiwi via lists.openembedded.org wrote:
> Das U-Boot 2021.4-rc1 has the following commit:
> 
>     commit 3f04db891a353f4b127ed57279279f851c6b4917
>     Author: Simon Glass <sjg@chromium.org>
>     Date:   Mon Feb 15 17:08:12 2021 -0700
> 
>         image: Check for unit addresses in FITs
> 
>         Using unit addresses in a FIT is a security risk. Add a check for
>         this and disallow it.
> 
>         CVE-2021-27138
> 
> Adjust the kernel-fitimage.bbclass accordingly to not use unit
> addresses. This changte is required before we can bump U-Boot to 2021.4.
> 
> Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>

Could you pick this and the follow-up patch 0ef3a5e2a6d4 ("kernel-fitimage.bbclass: drop unit addresses from bootscr sections") to the dunfell branch to fix FIT images on U-Boot 2021.01 or later with dunfell?

Thanks
Frieder

> ---
> 
> Notes:
>     V2 Notes:
>       - Adjusted testcases
>         (reported by Richard Purdie <richard.purdie@linuxfoundation.org>)
> 
>  meta/classes/kernel-fitimage.bbclass     | 40 ++++++++++++------------
>  meta/lib/oeqa/selftest/cases/fitimage.py | 36 ++++++++++-----------
>  2 files changed, 38 insertions(+), 38 deletions(-)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 2414870817..f5082c93df 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -161,7 +161,7 @@ fitimage_emit_section_kernel() {
>  	fi
>  
>  	cat << EOF >> ${1}
> -                kernel@${2} {
> +                kernel-${2} {
>                          description = "Linux kernel";
>                          data = /incbin/("${3}");
>                          type = "kernel";
> @@ -170,7 +170,7 @@ fitimage_emit_section_kernel() {
>                          compression = "${4}";
>                          load = <${UBOOT_LOADADDRESS}>;
>                          entry = <${ENTRYPOINT}>;
> -                        hash@1 {
> +                        hash-1 {
>                                  algo = "${kernel_csum}";
>                          };
>                  };
> @@ -179,7 +179,7 @@ EOF
>  	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${kernel_sign_keyname}" ] ; then
>  		sed -i '$ d' ${1}
>  		cat << EOF >> ${1}
> -                        signature@1 {
> +                        signature-1 {
>                                  algo = "${kernel_csum},${kernel_sign_algo}";
>                                  key-name-hint = "${kernel_sign_keyname}";
>                          };
> @@ -210,14 +210,14 @@ fitimage_emit_section_dtb() {
>  		dtb_loadline="load = <${UBOOT_DTB_LOADADDRESS}>;"
>  	fi
>  	cat << EOF >> ${1}
> -                fdt@${2} {
> +                fdt-${2} {
>                          description = "Flattened Device Tree blob";
>                          data = /incbin/("${3}");
>                          type = "flat_dt";
>                          arch = "${UBOOT_ARCH}";
>                          compression = "none";
>                          ${dtb_loadline}
> -                        hash@1 {
> +                        hash-1 {
>                                  algo = "${dtb_csum}";
>                          };
>                  };
> @@ -226,7 +226,7 @@ EOF
>  	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${dtb_sign_keyname}" ] ; then
>  		sed -i '$ d' ${1}
>  		cat << EOF >> ${1}
> -                        signature@1 {
> +                        signature-1 {
>                                  algo = "${dtb_csum},${dtb_sign_algo}";
>                                  key-name-hint = "${dtb_sign_keyname}";
>                          };
> @@ -283,7 +283,7 @@ fitimage_emit_section_setup() {
>  	setup_csum="${FIT_HASH_ALG}"
>  
>  	cat << EOF >> ${1}
> -                setup@${2} {
> +                setup-${2} {
>                          description = "Linux setup.bin";
>                          data = /incbin/("${3}");
>                          type = "x86_setup";
> @@ -292,7 +292,7 @@ fitimage_emit_section_setup() {
>                          compression = "none";
>                          load = <0x00090000>;
>                          entry = <0x00090000>;
> -                        hash@1 {
> +                        hash-1 {
>                                  algo = "${setup_csum}";
>                          };
>                  };
> @@ -321,7 +321,7 @@ fitimage_emit_section_ramdisk() {
>  	fi
>  
>  	cat << EOF >> ${1}
> -                ramdisk@${2} {
> +                ramdisk-${2} {
>                          description = "${INITRAMFS_IMAGE}";
>                          data = /incbin/("${3}");
>                          type = "ramdisk";
> @@ -330,7 +330,7 @@ fitimage_emit_section_ramdisk() {
>                          compression = "none";
>                          ${ramdisk_loadline}
>                          ${ramdisk_entryline}
> -                        hash@1 {
> +                        hash-1 {
>                                  algo = "${ramdisk_csum}";
>                          };
>                  };
> @@ -339,7 +339,7 @@ EOF
>  	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a "${FIT_SIGN_INDIVIDUAL}" = "1" -a -n "${ramdisk_sign_keyname}" ] ; then
>  		sed -i '$ d' ${1}
>  		cat << EOF >> ${1}
> -                        signature@1 {
> +                        signature-1 {
>                                  algo = "${ramdisk_csum},${ramdisk_sign_algo}";
>                                  key-name-hint = "${ramdisk_sign_keyname}";
>                          };
> @@ -377,7 +377,7 @@ fitimage_emit_section_config() {
>  	# Test if we have any DTBs at all
>  	sep=""
>  	conf_desc=""
> -	conf_node="conf@"
> +	conf_node="conf-"
>  	kernel_line=""
>  	fdt_line=""
>  	ramdisk_line=""
> @@ -396,19 +396,19 @@ fitimage_emit_section_config() {
>  	if [ -n "${kernel_id}" ]; then
>  		conf_desc="Linux kernel"
>  		sep=", "
> -		kernel_line="kernel = \"kernel@${kernel_id}\";"
> +		kernel_line="kernel = \"kernel-${kernel_id}\";"
>  	fi
>  
>  	if [ -n "${dtb_image}" ]; then
>  		conf_desc="${conf_desc}${sep}FDT blob"
>  		sep=", "
> -		fdt_line="fdt = \"fdt@${dtb_image}\";"
> +		fdt_line="fdt = \"fdt-${dtb_image}\";"
>  	fi
>  
>  	if [ -n "${ramdisk_id}" ]; then
>  		conf_desc="${conf_desc}${sep}ramdisk"
>  		sep=", "
> -		ramdisk_line="ramdisk = \"ramdisk@${ramdisk_id}\";"
> +		ramdisk_line="ramdisk = \"ramdisk-${ramdisk_id}\";"
>  	fi
>  
>  	if [ -n "${bootscr_id}" ]; then
> @@ -419,16 +419,16 @@ fitimage_emit_section_config() {
>  
>  	if [ -n "${config_id}" ]; then
>  		conf_desc="${conf_desc}${sep}setup"
> -		setup_line="setup = \"setup@${config_id}\";"
> +		setup_line="setup = \"setup-${config_id}\";"
>  	fi
>  
>  	if [ "${default_flag}" = "1" ]; then
>  		# default node is selected based on dtb ID if it is present,
>  		# otherwise its selected based on kernel ID
>  		if [ -n "${dtb_image}" ]; then
> -			default_line="default = \"conf@${dtb_image}\";"
> +			default_line="default = \"conf-${dtb_image}\";"
>  		else
> -			default_line="default = \"conf@${kernel_id}\";"
> +			default_line="default = \"conf-${kernel_id}\";"
>  		fi
>  	fi
>  
> @@ -441,7 +441,7 @@ fitimage_emit_section_config() {
>  			${ramdisk_line}
>  			${bootscr_line}
>  			${setup_line}
> -                        hash@1 {
> +                        hash-1 {
>                                  algo = "${conf_csum}";
>                          };
>  EOF
> @@ -478,7 +478,7 @@ EOF
>  		sign_line="${sign_line};"
>  
>  		cat << EOF >> ${its_file}
> -                        signature@1 {
> +                        signature-1 {
>                                  algo = "${conf_csum},${conf_sign_algo}";
>                                  key-name-hint = "${conf_sign_keyname}";
>  				${sign_line}
> diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
> index 0958036a6f..02692de822 100644
> --- a/meta/lib/oeqa/selftest/cases/fitimage.py
> +++ b/meta/lib/oeqa/selftest/cases/fitimage.py
> @@ -69,9 +69,9 @@ FIT_DESC = "A model description"
>              'type = "ramdisk";',
>              'load = <0x88000000>;',
>              'entry = <0x88000000>;',
> -            'default = "conf@1";',
> -            'kernel = "kernel@1";',
> -            'ramdisk = "ramdisk@1";'
> +            'default = "conf-1";',
> +            'kernel = "kernel-1";',
> +            'ramdisk = "ramdisk-1";'
>              ]
>  
>          with open(fitimage_its_path) as its_file:
> @@ -137,12 +137,12 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
>              "%s FIT image doesn't exist" % (fitimage_path))
>  
>          req_itspaths = [
> -            ['/', 'images', 'kernel@1'],
> -            ['/', 'images', 'kernel@1', 'signature@1'],
> -            ['/', 'images', 'fdt@am335x-boneblack.dtb'],
> -            ['/', 'images', 'fdt@am335x-boneblack.dtb', 'signature@1'],
> -            ['/', 'configurations', 'conf@am335x-boneblack.dtb'],
> -            ['/', 'configurations', 'conf@am335x-boneblack.dtb', 'signature@1'],
> +            ['/', 'images', 'kernel-1'],
> +            ['/', 'images', 'kernel-1', 'signature-1'],
> +            ['/', 'images', 'fdt-am335x-boneblack.dtb'],
> +            ['/', 'images', 'fdt-am335x-boneblack.dtb', 'signature-1'],
> +            ['/', 'configurations', 'conf-am335x-boneblack.dtb'],
> +            ['/', 'configurations', 'conf-am335x-boneblack.dtb', 'signature-1'],
>          ]
>  
>          itspath = []
> @@ -158,7 +158,7 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
>                  elif line.endswith('{'):
>                      itspath.append(line[:-1].strip())
>                      itspaths.append(itspath[:])
> -                elif itspath and itspath[-1] == 'signature@1':
> +                elif itspath and itspath[-1] == 'signature-1':
>                      itsdotpath = '.'.join(itspath)
>                      if not itsdotpath in sigs:
>                          sigs[itsdotpath] = {}
> @@ -182,7 +182,7 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
>          }
>  
>          for itspath, values in sigs.items():
> -            if 'conf@' in itspath:
> +            if 'conf-' in itspath:
>                  reqsigvalues = reqsigvalues_config
>              else:
>                  reqsigvalues = reqsigvalues_image
> @@ -210,9 +210,9 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
>                      signed_sections[in_signed] = {}
>                  key, value = line.split(':', 1)
>                  signed_sections[in_signed][key.strip()] = value.strip()
> -        self.assertIn('kernel@1', signed_sections)
> -        self.assertIn('fdt@am335x-boneblack.dtb', signed_sections)
> -        self.assertIn('conf@am335x-boneblack.dtb', signed_sections)
> +        self.assertIn('kernel-1', signed_sections)
> +        self.assertIn('fdt-am335x-boneblack.dtb', signed_sections)
> +        self.assertIn('conf-am335x-boneblack.dtb', signed_sections)
>          for signed_section, values in signed_sections.items():
>              value = values.get('Sign algo', None)
>              self.assertEqual(value, 'sha256,rsa2048:oe-selftest', 'Signature algorithm for %s not expected value' % signed_section)
> @@ -298,7 +298,7 @@ FIT_HASH_ALG = "sha256"
>          its_lines = [line.strip() for line in its_file.readlines()]
>  
>          exp_node_lines = [
> -            'kernel@1 {',
> +            'kernel-1 {',
>              'description = "Linux kernel";',
>              'data = /incbin/("' + initramfs_bundle + '");',
>              'type = "kernel";',
> @@ -307,7 +307,7 @@ FIT_HASH_ALG = "sha256"
>              'compression = "none";',
>              'load = <' + kernel_load + '>;',
>              'entry = <' + kernel_entry + '>;',
> -            'hash@1 {',
> +            'hash-1 {',
>              'algo = "' + fit_hash_alg +'";',
>              '};',
>              '};'
> @@ -327,7 +327,7 @@ FIT_HASH_ALG = "sha256"
>              else:
>                  self.assertTrue(test_passed == True,"kernel node does not match expectation")
>  
> -        rx_configs = re.compile("^conf@.*")
> +        rx_configs = re.compile("^conf-.*")
>          its_configs = list(filter(rx_configs.match, its_lines))
>  
>          for cfg_str in its_configs:
> @@ -348,7 +348,7 @@ FIT_HASH_ALG = "sha256"
>              else:
>                  print("kernel keyword found in the description line")
>  
> -            if 'kernel = "kernel@1";' not in node:
> +            if 'kernel = "kernel-1";' not in node:
>                  self.assertTrue(test_passed == True,"kernel line not found")
>                  break
>              else:
> 
> 
> 
> 
> 
