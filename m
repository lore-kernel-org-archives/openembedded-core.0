Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4407E7E37F
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 12:06:21 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10319.1775217976223921285
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 05:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ga+MyoWg;
 spf=pass (domain: cherry.de, ip: 52.101.70.22, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yyak1lQ9w/pCEUtjf5lgxtQY25jTJAAOBF+fqyG09QhGbFsdrZyUHg+bhe5Kzhe2er2k6QsrceuPc0MiM46IHdOUC33iW2MgiRMeic5lqDTooTGnZxO9oUn2sGhslgxU5PHAUmoF9iGE2tW+u3djKSuyI3i/k7WO8TJuBypiRlAqe2cufLKVJm5L8CG3lgZpiIJgVLDxHL0j7B5JVtB2vsSLFxop2wXj9KOdFBQeptg3PdtcVuNiA3youyfXDJVkbD9yaPxpDvh9GfSkZna1N8WAuGELIs9xGExKsCQuLtt0CRmuy4JtsDcLokW1i/pUup3nnrPVn/+fbmn2u6TEhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmsMB//r5nPIY5I2n+0tXotu7WstNfYEn+yQWiICGOo=;
 b=BWS0Q803+/0jJrZ/qX4UmnWiRBfWaeN7m9At3+bi3JOa1W2Naj5dwF29Xfvksx0H5ndL1IAcCaq5oFnfxDmeT0yUTDXAPrdXOcKqxagakCL0Mn/f1paSIva98613u5oJGFh7klPN8pBntyFBIbZTZGV44sOrHP8B8saBExaIvRdB7LSpDI50tkXwUg8BZ0uK13xjMFbsz+kYdlN6bxlLvzfsfUpc0MWvKBp1I2ve4ICNyo5ugqudKAogHJRNuzfUds8q8eVjwKSg66NXtmfX1n1AYNgiDM0nqBEr/jASv5rVjvSZwThhULWyYTUS8Ymnpcg3PM6FQLQbYq6oiAFb3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmsMB//r5nPIY5I2n+0tXotu7WstNfYEn+yQWiICGOo=;
 b=ga+MyoWgHsbBadn7Ru4Miboo+VN5Fjfg81553Qq2ejHmpIeGoJqyVlMWB9WmjKrLJMuXN84dIOZoIbLGGONFxhuaN8LX7pJ/5GjaMiYHFLOI4cXNRcDlp8fpWUqIFMrerdpVERHXaTag+2UOqQFUuMOsrCJT+z7p8VETJ/w7SCs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by DBAPR04MB7333.eurprd04.prod.outlook.com (2603:10a6:10:1b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 3 Apr
 2026 12:06:12 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%4]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 12:06:12 +0000
Message-ID: <aebb87e9-8bb8-4e89-ad2c-6dc447cd8ece@cherry.de>
Date: Fri, 3 Apr 2026 14:06:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] sanity: Require tar 1.35 or later on
 rhel9-alike distros
To: paul@pbarker.dev, openembedded-core@lists.openembedded.org
References: <20260403-rhel9-tar-v1-1-b9c7fb64bbd9@pbarker.dev>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260403-rhel9-tar-v1-1-b9c7fb64bbd9@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0120.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::18) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|DBAPR04MB7333:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e4e7dc-0785-42bf-09cc-08de91796617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	FbjqMBZqoZmuBxjXrTup7lV8udl+kvFU7bh582hIdXhU+54OBpJGd7NQmgkg42TlbfjwqB2uPmYjHq7IzRx6ApL9UonRlxfirp/9FIEBwXjtilx27lgWRZZf7q4hlbkEAhkLySyKyBF4aMkIk2NUkXp+wEN00UKFfQt0Hk6tI81QP5dl6Yt/G9DlGYm52ZLEyZ08M0Tx2o5XIvTcaOeJSMrgW6SquPIjZk5KXdD8t5U1sGow2gFq+MBJD9/9PAdu9ZDhg0bBtU4hl5Z7j0wwua1AWUnqTpA4A2vLE2bFLFMc8Bl5HFkQhw3rwlzlt5UuITAWzIsqMpDdsoD3EZJx5bJnh+HSXnupqIoGAULG9EbKCSDkldp5XaxH9NU9NvzZCRDnK39hl6W92iGTLPAWNXXWylqkJlBym+NQvUQVN+Y6DPGm0pMna+Nydip/0fOHwpjur3WAPBi8NBWBkk6SCEDwJmqwfxCceIni2IBqazuVQjDSBVndcidHsM/iLoI71yWddCQpk3UMt0vW1KGLWzzE6417RPdPjemlgHjLeKOuWFOOXlrCEYFbjQRD6VbxEVOW0guphCVAVc/rDAP1rDmQd9PzqeyxgHT0lJ/n6xTpDUIbzV8fG3QApiNEE2Sc/ZRfUDixwWgrdHZaRY+RPyIk1lz9U+cDAxYNe/AFgAMQHu/suUzY4T2+wpfxjmfVDkZuDq4Q0YOxfztyBfhWFYa3mlLZQfLtObL+et8mtmM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d0dUcVF5SFpCa3BML0k3OHhQK3NmT0poQVdoZWhTY1ByVWFyV3dQdDdmc08y?=
 =?utf-8?B?eWJBZmxmcHdPT253ZVFzWi9oL2VvOGlYUGlJM2dMNHNMcG9QMkNjSU9POXZ0?=
 =?utf-8?B?YU5xM2dIQWV0Nm5GUmM1R2dZTENDdWFUTUhXNlRFaGNLTUlwV3R3Rkc5aW1J?=
 =?utf-8?B?dFBoUm1YY1RrK0MrejFXTTJPMmFZQS9odVNXQittYm9PWUs1cVNqV2tCMTdW?=
 =?utf-8?B?bXZlNU9iclcyeVh0V0Frd0NaR1NEaTVqNjkwVU1xcVNCelVlNFlpKzdUckpN?=
 =?utf-8?B?ZS90czhsSDc1TlYxbkNyVkJGZXJrckMvUTJ6NnRFU0JyV1dHblhoQlJYOWsv?=
 =?utf-8?B?SDNBNTNpdHhnVlloaHBlNC9yZHhvcWJCaXhqbTRMaTVzTW9hUENjTnRIdVZw?=
 =?utf-8?B?L2ozZVlYa2ZKa3NzZUNPMjlZc3dTSFIwWGZ2VUJ6RE1sS3k4cVlyYjYxYy94?=
 =?utf-8?B?OU9jLysyS2hIdTRTVlYvUC9mcmJGS0hXRGtDZyt2dHVFaDV3Rys3ZGlicFpT?=
 =?utf-8?B?MFZDQUdMeGkvM3ZrM0F0aVdoWVNYUGZaMmJDenVET1VmOXZXRmtVVHJoQlc3?=
 =?utf-8?B?TGZSTGJKWjZ5dFpRQXBjMGtJTTNoaXliZmtNVjN2U3JTMHJTUDRVUzlJaU93?=
 =?utf-8?B?REN5TXI0NU9jZmx1UG54RFRIZ1pmMThHVjhnMlZwdmUvVXd3cFo0eTVZQWhl?=
 =?utf-8?B?M2JMNE9CWlN2eDJVN2tiMytFTStBcCtQbTVtNUlqeDNiVC9nL010SFMybWM4?=
 =?utf-8?B?Z3MxUlJFbEFnMGUxRXhLQTgvUDlHVEkyNXRjMzB0OVNJdUFKcFZIYXk4bzds?=
 =?utf-8?B?alU0czF0dmZVVkJDeHZiZnM2QUJJWUp6cHVnQ0NtSEttbGdhbEdZNXlqVjl6?=
 =?utf-8?B?TjFTVDFLWU9NTkY4bldmczRKRVphZ2xSZk9wcVZSanBuRlpub1dBRGVSY0xa?=
 =?utf-8?B?Y1ZZV1cya1B6WnIrYW95Z2dGQ0RiQ1ZuSk1jNGVsclFqWlJzRHlTZ2FwZ0o2?=
 =?utf-8?B?UVlhT1RXcldBMlRrT3RWWnZwcDRYaXhZL2VFeFkycFVleVJ4Z0owTzdzUWpy?=
 =?utf-8?B?amJQSVh2b2IwWkNrYWpMUzF6SXZhQTR1dUd0ZDZGcVhRbElUVEs4RTBLcFh5?=
 =?utf-8?B?UmxmbUFSZmtjUHJTRFBGK3IvNXkrR1oxS3NKNFIySGtGeU1FVzJ2TVBOU2RS?=
 =?utf-8?B?QlJhUlh1dkdvaVI0ekh5ZlcyQkZIWmdWa29KL1BRblgxOTZNZVZ5SVNMNmpN?=
 =?utf-8?B?NElxR1FYeHdWY2J3TlY1TG9vS0pNOHlRM1duMDdVZ1U5QzlORlJnNGFINzI0?=
 =?utf-8?B?YWt2TU1rWmZCMzlvNEFXVFlYNFpWRFJ1cXRpWFI1Tm9mT2doaEh1cEJDZDlr?=
 =?utf-8?B?U1pVQWNERER6TllxYVlnbmZUMzd6eDRsQXpJRWZ6SjRDd3JYVTdtcjBxU2x6?=
 =?utf-8?B?a2MxOUVTNE1vUnNOL09LZnVBRkdjbkZ0UmpNeUsrME85WThEdVU0WUt3ekl1?=
 =?utf-8?B?VmNkSGUrU1NhTmJXa0VaYVpqSmNQL1BqQVJjTE01S0FSbWRRVlpSTWtWMkNK?=
 =?utf-8?B?WGZDSTNHTm1hS3RFMWlkQ2FqK0twVUMyT2pmZXNaMUd0bVFFYTBZbm9vcGcv?=
 =?utf-8?B?NHhFRmFmUm93emh2c1UxYVZScFk1NlE0S1haR0t4Qjk1MzNqOVZFZ1B3aEpH?=
 =?utf-8?B?V2ZCZTQ5b1hvcHNVNitLMGxzc0xoa05YR3NCYjQvM0wwbGxkeEZoWlRwdWZW?=
 =?utf-8?B?YjFJTGZkaUZHQmQrVldJOTBtemVyQTZ5VS92bW5kVGhwSStORWZMRTdoT3Vo?=
 =?utf-8?B?RUVlSWxwWjZkS29IelU4WDhlZEZuci9xd1lPc1JJYmY2ckZiSk9zMnFKSkZP?=
 =?utf-8?B?L3RHckltaDJJdC9wWFpxU0trSjR3SkRvVjEvU2VPQjZuMXFxcVFxY0prM1p1?=
 =?utf-8?B?U2VnRTQ0Q3pCakJJekl3NHRCdm43UWQyeWRRSmhDd2tpbzFuVUNmZUVPL1FT?=
 =?utf-8?B?TFhmWXJjbC9IZzVxTE5CQ2lPWk9kWDl4bHppOVNFS29GU0lFRDc1U1NZTTJP?=
 =?utf-8?B?YmpZNkNVMm1GRDAwSDhCbFNSbkdUNyt3UUtUZExKUThSNzhDWElDazlsVUs0?=
 =?utf-8?B?VlRsS20vZHdMNHFBc3NhREVFczlXSE9RcGwrSE8yQXRoM01rZEFkUGZLVXQ5?=
 =?utf-8?B?R0ZnbHJrN2ZIN2g1YUNhNUJMQ3NmR25wTXkzaCt3VzRBNWs1NnQvMVdkR1lp?=
 =?utf-8?B?TzhJOU9aZTFjd0hKMjJNV3gvdEQwQnovUmFwSDBrZjNyRDIvVFBtRTRHRWpw?=
 =?utf-8?B?RjRFbUZnUnlRaVlidUIwZWo3MTBHRTE1SU1UclBOWjBjSG1PRUFmZnRJNm5q?=
 =?utf-8?Q?8JPQtlb+LxOVmVIS3xWJIUjqn01VDUcOtb/nP?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e4e7dc-0785-42bf-09cc-08de91796617
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 12:06:12.4528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRgDz86Zy8/AMND7AAdM90N+KTvGrTUibrkmHa7uIkqLnBqGrWwZpKjR3GogG1u6o7GWlXba4tm4KNgR3tzhz2fbbvys1jvcv74j/jPkquc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7333
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 12:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234583

Hi Paul,

On 4/3/26 1:54 PM, Paul Barker via lists.openembedded.org wrote:
> tar 1.34 (and possibly earlier versions) is unable to extract tarballs
> containing read-only files with xattrs. This was fixed upstream, but
> it's unlikely at this point that the fix will be backported to RHEL9
> related distros (CentOS Stream 9, AlmaLinux 9, Rocky Linux 9). The issue
> affects these distros specifically because they have selinux enabled by
> default and this uses xattrs.
> 
> The specific failure we've seen is with the /usr/lib/udev/hwdb.bin file
> installed by the systemd recipe - this file is chmod 0444. This leads to
> the following error, typically during do_image_wic (shortened and split
> to make it readable):
> 
>      subprocess.CalledProcessError: Command
>      'tar --xattrs --xattrs-include='*' -cf - -S -C .../tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/rootfs -p . |
>      tar --xattrs --xattrs-include='*' -xf - -C .../tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/tmp-wic/rootfs2'
>      returned non-zero exit status 2.
> 
> That error message is likely to confuse users, and the fix is not
> obvious. So, error out if tar 1.34 or earlier is present on affected
> distros and recommend upgrading or using the buildtools tarball.
> 
> Signed-off-by: Paul Barker <paul@pbarker.dev>
> ---
>   meta/classes-global/sanity.bbclass | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
> index b5d905399b73..2e486966a93b 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -551,6 +551,21 @@ def check_tar_version(sanity_data):
>       except subprocess.CalledProcessError as e:
>           return "Unable to execute tar --help, exit code %d\n%s\n" % (e.returncode, e.output)
>   
> +    try:
> +        distro = oe.lsb.distro_identifier()
> +    except Exception:
> +        distro = None
> +
> +    if distro:
> +        rhel9_alike_prefixes = ("rhel-9", "centos-9", "rocky-9", "almalinux-9")
> +        rhel9_tar_minimum_version = "1.35"
> +        for prefix in rhel9_alike_prefixes:

The commit log doesn't explain why that is specific to centos 9 and 
derivatives.

Did CentOS break tar only for themselves, or is it the only distro with 
that specific broken tar version or is it the only distro with that old 
of a version of tar?

I'm asking because I am not sure we need to filter on the distro AND we 
also probably should update the min version of tar listed in 
documentation/poky.yaml.in in yocto-docs.

Cheers,
Quentin

