Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17095C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 06:17:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.38039.1702880228445861054
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Dec 2023 22:17:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=tC5zfaB/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=07166d5ec4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BI5dEqN030238
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 06:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=YWAhiw+eUbAaeijc2vzMEWiAeQX3JcXE8aE3H1gR4go=; b=
	tC5zfaB/wOUftkpmDvtdhUlF9Hofs2ahFHbhWjt/QPRml3kj23u4r684STNFa5m2
	HpZma4XrwNaI4PvtybW2eJZGQSdBBb1MIf/ms7tl0U8eGpfkWjC/qs0ahHav9nc2
	2QpeAtft7kYL21pWu04XZBvIPSXcurJ+vgji12qTVwz1o5NcZv8EWxvlj89+08WN
	hqJduGSDW/fG05F98KX/3pcXR8hXAljbVk6NJGXbfI09gJsgFJTZL7WnCsbufUM+
	ZmeRs9HWZA9j+0ZrU9HqReAYOPSzaaBktDSgX0o0H1uIAZrDdDLT2z0Lh+fD+UUX
	GU3vI/RzcXcSL4+QIl5MNw==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v113x9nfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 06:17:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgsjmwnalqvSM9/mMdErstZf/psKMJO+enrjDiZTUGYY9fHdeOxQfWpIHHClrS4MatGhkm5dIuU3ZyqNfRXvrbPf95fLN+FvsD09EWKdxhm/DirSi2Qxwn+aCJnOFHEMtfpx+mE2NJY795PXGrUWyIScv/Ii7XvBcbgmWhGH64iXuNvRcB6ka8gsEoqdqM4/GaGTKRBqti8+W8q3QKL09wGq6N+IHMYRWX42g6mjCTbISsNyNGnBYccHwkqgXp0P/F+d8IqMCL9oq67ygeUrmPXdbYn6GkJ90iEbK767Z2RePMBJBrX/nuY6J+3rlnBBOZZ3CZBt52e2am6p7+sIBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWAhiw+eUbAaeijc2vzMEWiAeQX3JcXE8aE3H1gR4go=;
 b=aYQZZXFspmUbbA1Q8QwOHAfrcheHrjRZgyudov1sje5cXiuiDGGLDjc0PGyIVmHhYAnDTOnRaTuXWJlpHkrqOBT6TZo99Gsq2n9ZlpNzS/VcoabFS9UnN8AEpPWdK9QqRhkfpKrDKwhZ4YECG/4Ys9n3LL4zu0JaDFSMTwBIku9YWm1TqbeVsTlKu+/TARarj9ybE2B9Sst0Blr/8H6LeE7Uihj8HasTUvs820zv0yQjoAwP2J5ioKhzMCp4EAwX1JR60Q/meFJWbeXYr/xUwvDuPLfb2v/iJxcGvuk9Curg1oCRgAVHobUjdfhXod9ptVsjiCnARgeam78hVEOAoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5014.namprd11.prod.outlook.com (2603:10b6:510:31::17)
 by PH0PR11MB5594.namprd11.prod.outlook.com (2603:10b6:510:e4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Mon, 18 Dec
 2023 06:17:01 +0000
Received: from PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::7261:3384:c5d5:af95]) by PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::7261:3384:c5d5:af95%6]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 06:17:01 +0000
Message-ID: <bb40f37b-b9a5-bd34-ccb6-b958611b9c61@windriver.com>
Date: Mon, 18 Dec 2023 14:16:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH v4] openssh: Add PACKAGECONFIG option to
 customize sshd mode
Content-Language: en-US
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20231205074322881971a5@mail.local>
 <179E3241B25BBB7C.1352@lists.openembedded.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <179E3241B25BBB7C.1352@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0105.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::15) To PH0PR11MB5014.namprd11.prod.outlook.com
 (2603:10b6:510:31::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5014:EE_|PH0PR11MB5594:EE_
X-MS-Office365-Filtering-Correlation-Id: da08324c-10da-4dca-3a6f-08dbff90f1d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sp5I5vJ/y1UaKkSs/w7k3o5+aU/QKgx2qZqsTHhiBq2FPxugorQN5hR6eI81ooKr90si9/tw1VCGpdNtaNQMAkMM/JwPViSQO2z70euidmPx8uNVZa8SwN5XL9LPMPcJm6jdTar9rA/NCZarFybmTHk0gJ26/nL9lHWj32T8eUqfjvXSU6HKD9lqxwPxQKM05K6fyfM5g96GiVUlOK/5JER4u2eL8905xNoXFi+wcL0bM7gQVsOqwPqNImc9dAIFStcqnUUh5UrPjD2CsHo6Gf7DMpcKKmRWdySYUC/Hf7iX78zPMNOdI+YfX1D7vqc4SNJwmbut5OA3QLvV1CvZthlc55d7ZwmILvjoppDDK9r2VFMBAOOO4X6kxdtRWDVxQj+oUHKFMXHXsH91YEZndKWFTmj0rYy/XMj/C+rf1ef6snh/LkQCPGLsgrYlXi4VDPWQa1h1/GM1wrmETONY9Rzkpzd71fjCqNLmNTD3oDLedSmUTIisHXMyhFRtkK6t+DsFtwPM8xc0q3DzaCuyh9xgCZ5IrI3n2NwGjH1fr+i8WNEIUzIBzSaxnmGNctL57ICXlGdCisqwGQEm8fSMWwOSOAR5G9vhW+iAG8L+lo1hW8Ct/fU3CTuxGNsm+U9PHcUJsfcvhKt6wcptU8hhf5HkWsXETiG5+B+RLeYuL5U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5014.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(39840400004)(136003)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(31686004)(66899024)(26005)(2616005)(38100700002)(36756003)(31696002)(86362001)(83380400001)(5660300002)(6512007)(53546011)(6506007)(6666004)(8936002)(8676002)(66556008)(66946007)(316002)(6486002)(66476007)(41300700001)(2906002)(966005)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?emRvYTl0S3E2Q0Vycmk2SzVqVHNKYWZoeVdBS2IzckVnTlloSWNYanFObmUz?=
 =?utf-8?B?Qm1ZVDBCdk12bDY2V3M1dGRtZy80aGxPdklYcnZuNXp2Q01kMWVabmpJS3Mz?=
 =?utf-8?B?QXFZeU1KT2h3TUQ2V21YMU5Kb2VOclpCU3gyYjRJS3NFMW1EMEJ4MnBBZ0F3?=
 =?utf-8?B?NjJLVHkrdzdWVldpWFZ0c0RWMS8ybG1mME5RQTZiWWxvTDdTNHNkZk5aWjBu?=
 =?utf-8?B?SVovOThhTitTS2tXZ2V6TWpQQVlLMmk4a0FZTWY4bzBEd05VblhGRko4RVdP?=
 =?utf-8?B?VnlLVENXemVJT1ZndXhDL0pQMUJsNHlCcFNMUlpjZmU5NWo1ODdQckNjNW9v?=
 =?utf-8?B?dU1INllJbHJrVHdTLzdOTmc2TnN5NWxnUGtlNFp1MUpCc1BncE43MlJHZEJX?=
 =?utf-8?B?bzk1M1J0ZytXVjNWb3BBOEgycGZSMmFNaFRSVDNQeGk2OUJwWWc4K3k4L3gr?=
 =?utf-8?B?alY3ZWpMdmVFeVYzMU1nVTJYakJ5U0RHZVlIdjd4b05TZ3JJbTREYzNSOGxz?=
 =?utf-8?B?UGlnd2NhQ1VXcFRRdFlQTnBiQnVZTExNcDI3YlpaVGEwWXBrdlVSeGg0NzBW?=
 =?utf-8?B?eU9rQit2NXU4aWNManRaak14RHpIWENQcDYxWUVFZzlzcVJ3RnZKWWd4eGsy?=
 =?utf-8?B?WmJnRkhRNXdLV3YwamtKbEZwQ3dmTDdhMkdhTjRxREZoS2Z1UnJ6TFpvM2hh?=
 =?utf-8?B?bDhJMkRmU0lTQlBLb284KzkwS0J0T0ZFK1dCRWRzaVUwMXUxM1dDM3R6MTdn?=
 =?utf-8?B?S0JBK2JWZEw4Y3VSRDFmaGhCL2YreFNKTHFDSkx3Mk1iUHpsT0ZqRXM3L1Jn?=
 =?utf-8?B?cE1nd3F0VTBrb2hSL1BJeUNHTU5XcXdzZ3Njb1krWlhCZ2VZYnA5NTU2UEZt?=
 =?utf-8?B?THRNRWZWeDhBOEU3OWIyYXVCTC9LaHVKY01VL2JTQUQ2UytnWm94SHFrOHdV?=
 =?utf-8?B?RkFQNDRQQWZlYU1XM2NuYTdjazlqR2wyeEFXZFNubFd3K0FGRTZGSUt3L1Ax?=
 =?utf-8?B?NlFqeW9jNkdlRkpLbjV2Tm14V0YrbkdneVNqZ1Z5OGQ0NnVjcjNjaFYzYUV5?=
 =?utf-8?B?QWdyZ0xsczJtWFNqaUEybHdPY1A4UkQ0R0IwbGV1d3FtdlBydjRnd0ZGMzl2?=
 =?utf-8?B?RzIzZmZScFA0T1crRGZGbThxYnRRdTBLYkYyS29ObmZzYW9DMENxZ2R0Z0tn?=
 =?utf-8?B?OGl0RVowTmNUL1B5VmY1dE1FcHZidWJybWlxZ0QzRmVjeXhaY1BNYmJQWDcy?=
 =?utf-8?B?RG9rSXpRMmd3MHdnVVk0TVZqaHJhT21KZmtjZGRVNCthVnFHTVFSSURIVU0x?=
 =?utf-8?B?WkJ0eTcrYndjMzlCa0JjWVRMOThqYzdORUNWdktzc2xMUmpYcmg4ajYzcXYv?=
 =?utf-8?B?Rk00dlBVSnQ0cHNxWlBXaVBWMExIK0RxU0pzWFZtM1VQTXNobWtIRGNIUXIr?=
 =?utf-8?B?Wm5uM3lzd21KdnlwUFZWbFl6NmlUd1NQcVNSQWxjejluYjJXTDBreHFVU2tn?=
 =?utf-8?B?ZW13dDVPNlZmWGU4V29aNkIxdTVYQXRDNm5neU9qcC96QUFmSGk1Uzl2a29K?=
 =?utf-8?B?S005QUtXcTl6bHY0K0R4TEJLVHhxV0w4UjRFYmdKNXdKR3BPTkViZ01sK2R0?=
 =?utf-8?B?YllzZ3RvWUhjTjIvY3M5c3pUQlJJY0hZa2o4cytsLzcvTDg0anI4bktzMys3?=
 =?utf-8?B?RENRdVBzaWsxUGRNVWxQZlhzWkgzZXM3S0hhYjk5RVc0Y1R3UXN4TFU4RldW?=
 =?utf-8?B?RjRJZ2N4eDVmZ1N3RXFWQWZlSXBRMGFKZlpDVVVrMzdiVmFvbUdpQUkwc0lY?=
 =?utf-8?B?K25ndXB5WkQwdFU2TTFpc0dlMGFtRWtYNWNHa3p5V2o1TThtRzdjekRnMk5N?=
 =?utf-8?B?UENpSWdHMElwYzAwenI4TWZLWVBaWE5IcHB1VGVaeTR3MGFkbitEbkIvVnZT?=
 =?utf-8?B?SVp2SnJnYlhRSnJJbmFOWmNHd3hDSWtIbkpoRkxZaW5xb1VCZ3JyU1UwRkVu?=
 =?utf-8?B?amhsVUFOU0x6cVkxWVdTTEVWdWpqUEUwOGFWcDNZQnM3RjRZR0h5UFJRQjRr?=
 =?utf-8?B?L2w2dEF1UytPKzF6bU5WcEVKY1prN3RRVFhUTkRWYUNDVDExQno5ODY4MWZV?=
 =?utf-8?Q?B9X7MU/KRBzP3b5Gplm+gDWil?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da08324c-10da-4dca-3a6f-08dbff90f1d6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 06:17:01.1044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mq/LA3uIuPTdACn9A2behrn+gOCeRbI8BxhWHeBItlY57T4QYXKpHPDIN6PBzQIWPrMAjVbdVnxmX+m2gYj9ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5594
X-Proofpoint-ORIG-GUID: S8ZD872HmjxzhOlwmJzXyg-UvsQkis0d
X-Proofpoint-GUID: S8ZD872HmjxzhOlwmJzXyg-UvsQkis0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312180043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 06:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192604

Ping.

Thanks,

On 12/6/23 16:56, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Add systemd-sshd-socket-mode PACKAGECONFIG option to choose sshd.socket
> and systemd-sshd-service-mode PACKAGECONFIG option to choose installing
> sshd.service.
> 
> The systemd-sshd-socket-mode PACKAGECONFIG option is enabled by default
> and user can customize the above two PACKAGECONFIG option to choose the
> sshd mode.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
> Changed in v3:
> rebase based on https://lore.kernel.org/all/20231201140947.792594-1-xiangyu.chen@eng.windriver.com/
> 
> Changed in v4:
> make it possible to install both sshd.socket and sshd.service
> .../openssh/openssh_9.5p1.bb                  | 25 ++++++++++++++-----
>   1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> index 2c1c821ea9..58dd030c64 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> @@ -50,16 +50,20 @@ INITSCRIPT_NAME:${PN}-sshd = "sshd"
>   INITSCRIPT_PARAMS:${PN}-sshd = "defaults 9"
>   
>   SYSTEMD_PACKAGES = "${PN}-sshd"
> -SYSTEMD_SERVICE:${PN}-sshd = "sshd.socket sshd.service"
> +SYSTEMD_SERVICE:${PN}-sshd = "${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-socket-mode','sshd.socket', '', d)} ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-service-mode','sshd.service', '', d)}"
>   
>   inherit autotools-brokensep ptest pkgconfig
>   
> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> +# systemd-sshd-socket-mode means sshd.socket and systemd-sshd-service-mode
> +# corresponding to sshd.service
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} systemd-sshd-socket-mode"
>   PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
>   PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
>   PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
>   PACKAGECONFIG[manpages] = "--with-mantype=man,--with-mantype=cat"
>   PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd"
> +PACKAGECONFIG[systemd-sshd-socket-mode] = ""
> +PACKAGECONFIG[systemd-sshd-service-mode] = ""
>   
>   EXTRA_AUTORECONF += "--exclude=aclocal"
>   
> @@ -124,15 +128,24 @@ do_install:append () {
>   	echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
>   
>   	install -d ${D}${systemd_system_unitdir}
> -	install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_system_unitdir}
> -	install -c -m 0644 ${WORKDIR}/sshd.service ${D}${systemd_system_unitdir}
> -	install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_system_unitdir}
> +	if ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-socket-mode','true','false',d)}; then
> +	    install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_system_unitdir}
> +	    install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_system_unitdir}
> +	    sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
> +		    -e 's,@SBINDIR@,${sbindir},g' \
> +		    -e 's,@BINDIR@,${bindir},g' \
> +		    -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
> +            ${D}${systemd_system_unitdir}/sshd.socket
> +	fi
> +	if ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-service-mode','true','false',d)}; then
> +	    install -c -m 0644 ${WORKDIR}/sshd.service ${D}${systemd_system_unitdir}
> +	fi
>   	install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_system_unitdir}
>   	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
>   		-e 's,@SBINDIR@,${sbindir},g' \
>   		-e 's,@BINDIR@,${bindir},g' \
>   		-e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
> -		${D}${systemd_system_unitdir}/sshd.socket ${D}${systemd_system_unitdir}/*.service
> +		${D}${systemd_system_unitdir}/*.service
>   
>   	sed -i -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
>   		${D}${sysconfdir}/init.d/sshd
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191874): https://lists.openembedded.org/g/openembedded-core/message/191874
> Mute This Topic: https://lists.openembedded.org/mt/103009646/3618448
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mingli.yu@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

