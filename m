Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB49C47422
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 03:09:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13423.1705633768113194785
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 19:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NIA3VLGe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1748b1ad81=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40J2RfWN011206
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 19:09:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=B5kiIHwumgPGA9ZO2ezBKJViY3KZKooIuU5cAnZ0RQU=; b=
	NIA3VLGeCNLJ1omrTUXcmdYyUi6cskyVNQ/oWolv81p375tKfgnOAdJxFkaGy9iq
	zN6BLUGQKAl/ziN5ibfCCiuDzLfnf7yGgsGJuYpp26iPE1wI8v/DYW5JwCkIc08G
	25wCs76SHaoCA5fRq2RB1avlb48mpeoQTBKlb3piWcoQ2QJ6WLqqlystEc8mGXSY
	NFZvmQK5dCH0xM5K7oXJJZlrd0fee2a2sIMHiuYnDwNVK9Pvh5Ep8pxfB6UbZSGs
	lDL7WRAJQeWpjYyN7UyG2MsO09D9uAlzRI09YOtiOQ+dRna0atqpJAYD5u9cBHXP
	NTp+su8BWTuzI0sNHJG0MA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkpp46bn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 19:09:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOZV1M5XhAQsOeV1tZZRQ8H4yJyPDY4b7NTCtZBdpCnxBrNRxxANaGHK0tagNJe3/7yqjyadH0O5DCVeowtsJACObTFlZKtLR99gikRehwhciji6WfCYqnbUSmhMxnfP0HJ5a/BfMAQbC8nrvSrTXg/WahPQm5UHbMNi33euLOaAIxtDfN7kCi8XLjdpqJ61NvPXciaXAj8CfVrjr2pR2aVfXyg5zqOFlTswI7VIRW7d/YYsCfT90yiTchaHhqBQfTsfjhqoIfbfruNvs9cI3tIJH3dN3/tn7RM2VNLw1nZRMROEUSPQ42NAvAe/Ap5pHl3yg1JpiDvmuWEMepEudw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5kiIHwumgPGA9ZO2ezBKJViY3KZKooIuU5cAnZ0RQU=;
 b=GFo3+j/OIqJxmf5apakspjYDEPr/IZHv5fBcHWSSzjvMepWx/k4zwkqkJvgMhYI1AteV0+7wWwLaMobwOHxTzzX3E6W+XoRZ8mYedbaL9QF6TrmRaSPJoEDhd8EkDRCdodZ6CfN9tIzPoYBRB/3E1gg0CGYzj4sV0Y5CT6dNOvN+EJ2IhvZ5O/TB3cXogxCO4FQPJZfbsiE1Xlp1GzjaPkR5La+UAtBJJTUgSUU9FW7ZzXr5bzUtsz5Q6Roo5CfKO0w/IKXhAg3XTgjY/sqew9fQtMprylBOH8rJ/5RazJ5Yibs39r4Z4qAddvGAdugKr12UD0eGoBFpaHDSbl07EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY8PR11MB6964.namprd11.prod.outlook.com (2603:10b6:930:57::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 03:09:25 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%7]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 03:09:24 +0000
Message-ID: <2968be9a-c13d-5d98-e1be-d291d0b5b008@windriver.com>
Date: Fri, 19 Jan 2024 11:09:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH 1/3] systemd: upgrade to 255.1
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20231227042036.2376255-1-Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20231227042036.2376255-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0298.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::33) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY8PR11MB6964:EE_
X-MS-Office365-Filtering-Correlation-Id: ce6f5a82-63e5-4e6a-3a66-08dc189c0a5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dluL8nrAlu4VK8dLcs3LSpTBh1x6Jw8naSXfAvIOUnGeX/EIwtnbUV14+ZHk2ETsywvUcjfAvqpDZBs9QUsonTVhB3AszS6jUsZpPFFkFNMeBJ5wzPiCnX5dw3CtLIi0qoMhjv2NT/aX1LTUEWMqY3EcON/Ahm/NZyR+jVGI0wgc4XwS49Tk/sAn41ld1FjWlCbkUAPReIyW/iyjrN/wX0txd8ogjw4IMz3FDx514fD/n5V0sET2u3OX+C7+uXFGDb7MYe8v6t6uHkzlXNl/sFwO2tzVxeka6YnbFY5eZcqpElHQ5SW4Y4hWmJetrtMiigqA/UpTJnHumK5vpQokHKex6yBGbE7BslOnSvWsRFlHX6SeUL8MTI5OaMoHPHgrUPz8MAs9QqTq6Iz40GceqGy8YXD0ltZUMz3OwbAdAky2Te4XDrb1enNMyzkmzcrWBTXMznCo/ycH/WKzCVvTQQWgWZ6ho4ohxgbebKzofNxGFs7y3nQ5Jvtf0jYOmkAgMVwSJlrlNERLjxc2LwHr005V74DmrG86oBavKHSzQsPDF4ZAgtzcAh/982m2e/s3MajyLNIrOE1HAx8zJ8BWvnIyM718586OyU4LUBs1uy6Ks9NdKVCYuzFtUtk8K2cH08d+4JBM92fOtTzfcA9fJsjfQ2Ie2ecuscC8NvCy2vmQSNN9TCa4mhTUWvwQHSVSnAoCwOggGkt+LjBr51vWDJq3aaPvh7ho5bTOVuP8HApxcYWeaJXVqh1gP2N4Nk1g
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(376002)(396003)(136003)(346002)(230173577357003)(230273577357003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(66899024)(41300700001)(2906002)(30864003)(36756003)(5660300002)(316002)(66476007)(66946007)(6916009)(6506007)(31696002)(66556008)(86362001)(53546011)(6512007)(83380400001)(26005)(2616005)(478600001)(6486002)(6666004)(8676002)(966005)(38100700002)(8936002)(31686004)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TEtJdnpiYWh0cW43dzFzYWl6bkRWK0JOV044UDZkYmo4RXR3b013UUp1UmRI?=
 =?utf-8?B?Rk5wZEEwTE5xVTJLNTgwSXRmaUhWZXlXRXAyRlJ6OHRPc2phK1gyTEg1TmdS?=
 =?utf-8?B?ZjVuSU5BMnlrTUdoS3RtRlVKa2VzeDMvQkNBTXBDTzgxM2VhSWFXTDZPZWEv?=
 =?utf-8?B?WXVtOTRsL1pVUms1VzNDTnMvMjZRd3Rxbzl1ZkdHVzdkK0tCeTc1RlU0dEJm?=
 =?utf-8?B?M2ZLU1F5bkNsbnVPU3YzQVphRGp1cXM1c21vb3o5QlV2bEw3UTIxVTlGbFFV?=
 =?utf-8?B?ZmU1Vm9JdXZZblVScWZGL0haNVY0aVpmaDA3eGhJSGw5NEgrdTZ1YjllOFFM?=
 =?utf-8?B?bi8ybGlNMEZ1Q0dzYlRFNUdlSjNrMjlFUWtMaUszMHJ1TElBdVl1dGwrR1Fu?=
 =?utf-8?B?RE1heENuMm5TdzdDUzhHSTErLzRkdENPNE90OThBTzM1aTZQWml1UUlLSjRK?=
 =?utf-8?B?ZmJkQlJuOTFEbHo2K2Y4bG95blhPT3dhVVpkK294c2ZXTmV4NU13T1FXYmRE?=
 =?utf-8?B?Q1prNWFsaGZuaWpQc284ZjRDQXJYOVpYWTBSQlA3dVFGSVBDbjg4L2s1Njl0?=
 =?utf-8?B?WHp2c0hSYVRYQm5UVHdIZVlCQnZGRXNURXFZMTd2TXh1WGxXY21XQzhrOEUx?=
 =?utf-8?B?cmhGRlQzNkM0U2M3U1pUajdETk85Snp1eVY2TUtjRUN4N3F5RHhIaUJrT2NU?=
 =?utf-8?B?V0lWaVA5VHJIOG5qU0RTNytlTjRydGk0STRLbnc3WnhRQW9zeHpqRjIzYmlr?=
 =?utf-8?B?WTdXZUNwSnlQUGdPMVVHeFpBclVJc1ptaTJOZTRIRUJLSG42bnVaTWpHUzgw?=
 =?utf-8?B?aENHYUZlVy9OeGM2ZzBVOWVNNVBkR2ltVVFVQ2FSVTkvUnMzS3MwMThTTzFB?=
 =?utf-8?B?UDhYZ3dTUEpxdWRQYTF5NHdVN1Q0dy9KQk8ycjY5M2p5cncxRWlhSmVEdW1m?=
 =?utf-8?B?KzBuVElnVVFhL1VYNkt2VXRkSkg5R3BCSXQyYXh1aklyVnpmY0M1M1dLMUVj?=
 =?utf-8?B?bSs1ZWVvR2NidGVXV1ZPSlRuc1NPUmNla0d5YnVJNjlRSFk5VVFjWVU1bkpL?=
 =?utf-8?B?SjdPdFFtOERvVFF3dERYRTRQdmdjODNyZU9yZ05tb3ZEcE0yZTJxQ0N2YzM3?=
 =?utf-8?B?OUNheUxXcEx3WE5ic0N3Ty9NcnZmQ0hCZUFIUjBtejdTZjJoUVROQ1B2UExL?=
 =?utf-8?B?Z05VWmZQaTB1NUViY056Rkc5dUZ2QzNPTitmUVZkTW1ib3pKYlBRUGp6bU40?=
 =?utf-8?B?UTdubWNGUHJFS05tL09RMVdGSTAxY0tCNGJNbS96ZjlOVkUvVXExQ2NBR0tG?=
 =?utf-8?B?V1NVcFRBTmpSblZpeE9Bb3NuZWo2UHdHVmlvaDRnYXFOOStTN09FcDRoRDAv?=
 =?utf-8?B?eGxaWktZMmtMaTRtMDhTU0RoaHQ5WjR2M0Y2UWpWT2JHdU92M0l0YTYzZ0VW?=
 =?utf-8?B?RFhTS0YzNTI4TVlYeHpnVERKREhvbCtaWUJYbWdIZE9hTXVyWDd6dVZzNXN1?=
 =?utf-8?B?b2RYakdFbUo3a0s4VFdTQi9zT0RTbTFobXNKNGRuWW9RaFdrNW96UXpna2t4?=
 =?utf-8?B?cHd1MEhSY1JCN2t3cVJpMnJKckFwa2N0Z1ZRNTU5dzRsQzVVc1ZiN09LbWE3?=
 =?utf-8?B?eWlzazFWOS9saG9uZDV5M0NGOS9leGd0bDJPLzZ3R2lIaFE0TFMyUkxiaTZP?=
 =?utf-8?B?Vkx4aEZCcEpHTnlueFFkNUEySkUwZFl6WlFySHhia003cDJYT1M3bVlvNTNj?=
 =?utf-8?B?SzZGM3hCS1dacHhybGdhQzViRWhxWk15RmlYeXptbXBYUFhxd213YWhKL09o?=
 =?utf-8?B?MWVPUFVVUVVWbS90d1J2UkFVNVMwcFFlbndCYWxwbUdzNzNyaHY1WFRtaDY1?=
 =?utf-8?B?NDNGaWNlUkpzbWdSMUQ3L0pnN2RGY2xLeHVoUFRHekxCRWFUZDVTMnZ1dUQr?=
 =?utf-8?B?ak1NZmswd3QxYk5RVHNMZTg5czJPTy8vaXQ5RTB0ZUx2NmFiSHB6dy93eUNr?=
 =?utf-8?B?cW9DQ0hyOHJJTmNvbU1PY1huWlZPcnp4K1JnelFITEJmZjFmUy9NeUdnOEVr?=
 =?utf-8?B?OE5qNmpMR1M2bC9lM3ptUXhFbU5KWmdDNXhDTHFpL2lHK0lrRlZTSm1kL21k?=
 =?utf-8?Q?4srsgoPpXy128m3yoDu5dDz6i?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6f5a82-63e5-4e6a-3a66-08dc189c0a5a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 03:09:24.8459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C4zFrCkQTD3QI4NJsEZKcVCc0GUkgtOt/Ou05WDA52EAfkVMX2XP815pb+VoeF5M8cX0SvR9CA+Z50zZmifRSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6964
X-Proofpoint-GUID: r1C_SdmOp7VaEWaZQc02qAvPHUKowUsi
X-Proofpoint-ORIG-GUID: r1C_SdmOp7VaEWaZQc02qAvPHUKowUsi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_12,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401190012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 03:09:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194007

What's the status of this patch series?
Is there any issue or concern that I missed?

Regards,
Qi

On 12/27/23 12:20, Chen Qi via lists.openembedded.org wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> 1. Patch changes:
>
> 0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
> is removed because it has no real effect now. The /lib is now
> /usr/lib because 'usrmerge' is a required distro feature for systemd.
>
> 0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch is
> refreshed for the new version to avoid patch-fuzz issue.
>
> 2. root user's home directory now defaults to "/root":
>
> The sysuers.d/basic.conf is still modified to respect the ROOT_HOME
> value, so if users set ROOT_HOME to "/home/root", the behavior is the
> same as before. However, this is only for backward compatibility. With
> this patch, The ROOT_HOME value is set to "/root" in init-manager-systemd.inc.
> This is because systemd's source codes are hardcoding "/root", and other
> values are not officially supported. See the list below.
> $ grep -rl '"/root"' src/ | grep -v 'src/test'
> src/core/namespace.c
> src/basic/user-util.c
> src/nss-systemd/nss-systemd.c
> src/nspawn/nspawn.c
> src/firstboot/firstboot.c
> src/shared/userdb.c
> src/shared/user-record.c
> $ grep -rl /root network/ factory/ sysctl.d/ sysusers.d/ rules.d/ tmpfiles.d/ units/ xorg/ tools/
> sysusers.d/basic.conf.in
> tmpfiles.d/provision.conf
> units/emergency.service.in
> units/rescue.service.in
> tools/list-discoverable-partitions.py
> Previously, the recipe was just substituting sysusers.d/basic.conf.in,
> which is not enough to be treated as 'fully support'. I deliberately put
> a warning message in do_install to warn users about non "/root" ROOT_HOME
> value. Don't remove it until all above places are handled.
>
> 3. cgroupv2 is now the default.
> cgroupv2 is the default for systemd for many years and it's the default
> for distros such as ubuntu and fedora. Let's also use it as the default.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   .../distro/include/init-manager-systemd.inc   |  2 +
>   meta/recipes-core/systemd/systemd.inc         |  4 +-
>   ...tall-dependency-links-at-install-tim.patch | 22 +++---
>   ...sysctl.d-binfmt.d-modules-load.d-to-.patch | 73 -------------------
>   .../systemd/systemd/basic.conf.in             | 40 ----------
>   .../{systemd_254.4.bb => systemd_255.1.bb}    | 16 ++--
>   6 files changed, 25 insertions(+), 132 deletions(-)
>   delete mode 100644 meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
>   delete mode 100644 meta/recipes-core/systemd/systemd/basic.conf.in
>   rename meta/recipes-core/systemd/{systemd_254.4.bb => systemd_255.1.bb} (98%)
>
> diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/conf/distro/include/init-manager-systemd.inc
> index 595d1f2644..0a76647459 100644
> --- a/meta/conf/distro/include/init-manager-systemd.inc
> +++ b/meta/conf/distro/include/init-manager-systemd.inc
> @@ -5,3 +5,5 @@ VIRTUAL-RUNTIME_init_manager ??= "systemd"
>   VIRTUAL-RUNTIME_initscripts ??= "systemd-compat-units"
>   VIRTUAL-RUNTIME_login_manager ??= "shadow-base"
>   VIRTUAL-RUNTIME_dev_manager ??= "systemd"
> +# systemd hardcodes /root in its source codes, other values are not offically supported
> +ROOT_HOME ?= "/root"
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
> index ccc3236457..1417e0150f 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -15,8 +15,8 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
>   LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
>                       file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
>   
> -SRCREV = "2e7504449a51fb38db9cd2da391c6434f82def51"
> -SRCBRANCH = "v254-stable"
> +SRCREV = "2018ccef6645ce00c784369a22dc4e98f6d7061d"
> +SRCBRANCH = "v255-stable"
>   SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
>   
>   S = "${WORKDIR}/git"
> diff --git a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> index 085f1e9052..be231cf6b2 100644
> --- a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> +++ b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> @@ -1,8 +1,8 @@
> -From ca7d9a8d9c81702af9c599bb79706f12b1a465cf Mon Sep 17 00:00:00 2001
> +From 29a58009a172e369ad7166e16dab2f4945c6b0d2 Mon Sep 17 00:00:00 2001
>   From: Chen Qi <Qi.Chen@windriver.com>
>   Date: Thu, 21 Feb 2019 16:23:24 +0800
> -Subject: [PATCH] binfmt: Don't install dependency links at install time for
> - the binfmt services
> +Subject: [PATCH 1/2] binfmt: Don't install dependency links at install time
> + for the binfmt services
>   
>   use [Install] blocks so that they get created when the service is enabled
>   like a traditional service.
> @@ -25,10 +25,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>    3 files changed, 7 insertions(+), 2 deletions(-)
>   
>   diff --git a/units/meson.build b/units/meson.build
> -index c7939a10f8..219570ab19 100644
> +index e7bfb7f838..1d5ec4b178 100644
>   --- a/units/meson.build
>   +++ b/units/meson.build
> -@@ -149,7 +149,6 @@ units = [
> +@@ -154,7 +154,6 @@ units = [
>            {
>              'file' : 'proc-sys-fs-binfmt_misc.automount',
>              'conditions' : ['ENABLE_BINFMT'],
> @@ -36,7 +36,7 @@ index c7939a10f8..219570ab19 100644
>            },
>            {
>              'file' : 'proc-sys-fs-binfmt_misc.mount',
> -@@ -246,7 +245,6 @@ units = [
> +@@ -251,7 +250,6 @@ units = [
>            {
>              'file' : 'systemd-binfmt.service.in',
>              'conditions' : ['ENABLE_BINFMT'],
> @@ -45,7 +45,7 @@ index c7939a10f8..219570ab19 100644
>            {
>              'file' : 'systemd-bless-boot.service.in',
>   diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
> -index 6b1bbdc91e..5ec5b8670a 100644
> +index 5d212015a5..6c2900ca77 100644
>   --- a/units/proc-sys-fs-binfmt_misc.automount
>   +++ b/units/proc-sys-fs-binfmt_misc.automount
>   @@ -22,3 +22,6 @@ Before=shutdown.target
> @@ -56,7 +56,7 @@ index 6b1bbdc91e..5ec5b8670a 100644
>   +[Install]
>   +WantedBy=sysinit.target
>   diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
> -index b04412e037..63f116e4fa 100644
> +index 6861c76674..531e9fbd90 100644
>   --- a/units/systemd-binfmt.service.in
>   +++ b/units/systemd-binfmt.service.in
>   @@ -14,6 +14,7 @@ Documentation=https://docs.kernel.org/admin-guide/binfmt-misc.html
> @@ -68,12 +68,12 @@ index b04412e037..63f116e4fa 100644
>    After=proc-sys-fs-binfmt_misc.mount
>    After=local-fs.target
>   @@ -31,3 +32,6 @@ RemainAfterExit=yes
> - ExecStart={{ROOTLIBEXECDIR}}/systemd-binfmt
> - ExecStop={{ROOTLIBEXECDIR}}/systemd-binfmt --unregister
> + ExecStart={{LIBEXECDIR}}/systemd-binfmt
> + ExecStop={{LIBEXECDIR}}/systemd-binfmt --unregister
>    TimeoutSec=90s
>   +
>   +[Install]
>   +WantedBy=sysinit.target
>   --
> -2.39.2
> +2.34.1
>   
> diff --git a/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch b/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
> deleted file mode 100644
> index 98914ae154..0000000000
> --- a/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -From f75f03ef6bc3554068e456bed227f333d5cb8c34 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 29 Sep 2020 18:01:41 -0700
> -Subject: [PATCH] Move sysusers.d/sysctl.d/binfmt.d/modules-load.d to /usr
> -
> -These directories are moved to /lib since systemd v246, commit
> -4a56315a990b ("path: use ROOTPREFIX properly"), but in oe-core/yocto,
> -the old /usr/lib is still being used.
> -
> -Upstream-Status: Inappropriate (OE-specific)
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> ----
> - src/core/systemd.pc.in           | 8 ++++----
> - src/libsystemd/sd-path/sd-path.c | 8 ++++----
> - 2 files changed, 8 insertions(+), 8 deletions(-)
> -
> -diff --git a/src/core/systemd.pc.in b/src/core/systemd.pc.in
> -index 693433b34b..8368a3ff02 100644
> ---- a/src/core/systemd.pc.in
> -+++ b/src/core/systemd.pc.in
> -@@ -67,16 +67,16 @@ tmpfilesdir=${tmpfiles_dir}
> -
> - user_tmpfiles_dir=${prefix}/share/user-tmpfiles.d
> -
> --sysusers_dir=${rootprefix}/lib/sysusers.d
> -+sysusers_dir=${prefix}/lib/sysusers.d
> - sysusersdir=${sysusers_dir}
> -
> --sysctl_dir=${rootprefix}/lib/sysctl.d
> -+sysctl_dir=${prefix}/lib/sysctl.d
> - sysctldir=${sysctl_dir}
> -
> --binfmt_dir=${rootprefix}/lib/binfmt.d
> -+binfmt_dir=${prefix}/lib/binfmt.d
> - binfmtdir=${binfmt_dir}
> -
> --modules_load_dir=${rootprefix}/lib/modules-load.d
> -+modules_load_dir=${prefix}/lib/modules-load.d
> - modulesloaddir=${modules_load_dir}
> -
> - catalog_dir=${prefix}/lib/systemd/catalog
> -diff --git a/src/libsystemd/sd-path/sd-path.c b/src/libsystemd/sd-path/sd-path.c
> -index 1af3a36d1d..def502b717 100644
> ---- a/src/libsystemd/sd-path/sd-path.c
> -+++ b/src/libsystemd/sd-path/sd-path.c
> -@@ -365,19 +365,19 @@ static int get_path(uint64_t type, char **buffer, const char **ret) {
> -                 return 0;
> -
> -         case SD_PATH_SYSUSERS:
> --                *ret = ROOTPREFIX_NOSLASH "/lib/sysusers.d";
> -+                *ret = "/usr/lib/sysusers.d";
> -                 return 0;
> -
> -         case SD_PATH_SYSCTL:
> --                *ret = ROOTPREFIX_NOSLASH "/lib/sysctl.d";
> -+                *ret = "/usr/lib/sysctl.d";
> -                 return 0;
> -
> -         case SD_PATH_BINFMT:
> --                *ret = ROOTPREFIX_NOSLASH "/lib/binfmt.d";
> -+                *ret = "/usr/lib/binfmt.d";
> -                 return 0;
> -
> -         case SD_PATH_MODULES_LOAD:
> --                *ret = ROOTPREFIX_NOSLASH "/lib/modules-load.d";
> -+                *ret = "/usr/lib/modules-load.d";
> -                 return 0;
> -
> -         case SD_PATH_CATALOG:
> ---
> -2.39.2
> -
> diff --git a/meta/recipes-core/systemd/systemd/basic.conf.in b/meta/recipes-core/systemd/systemd/basic.conf.in
> deleted file mode 100644
> index fac288f7fa..0000000000
> --- a/meta/recipes-core/systemd/systemd/basic.conf.in
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -#  This file is part of systemd.
> -#
> -#  systemd is free software; you can redistribute it and/or modify it
> -#  under the terms of the GNU Lesser General Public License as published by
> -#  the Free Software Foundation; either version 2.1 of the License, or
> -#  (at your option) any later version.
> -
> -# The superuser
> -u root    0     "root" :ROOT_HOME:
> -
> -# The nobody user/group for NFS file systems
> -g {{NOBODY_GROUP_NAME}} 65534       -            -
> -u {{NOBODY_USER_NAME }} 65534:65534 "Nobody"     -
> -
> -# Administrator group: can *see* more than normal users
> -g adm     {{ADM_GID    }}     -            -
> -
> -# Administrator group: can *do* more than normal users
> -g wheel   {{WHEEL_GID  }}     -            -
> -
> -# Access to shared database of users on the system
> -g utmp    {{UTMP_GID   }}     -            -
> -
> -# Physical and virtual hardware access groups
> -g audio   {{AUDIO_GID  }}     -            -
> -g cdrom   {{CDROM_GID  }}     -            -
> -g dialout {{DIALOUT_GID}}     -            -
> -g disk    {{DISK_GID   }}     -            -
> -g input   {{INPUT_GID  }}     -            -
> -g kmem    {{KMEM_GID   }}     -            -
> -g kvm     {{KVM_GID    }}     -            -
> -g lp      {{LP_GID     }}     -            -
> -g render  {{RENDER_GID }}     -            -
> -g sgx     {{SGX_GID    }}     -            -
> -g tape    {{TAPE_GID   }}     -            -
> -g tty     {{TTY_GID    }}     -            -
> -g video   {{VIDEO_GID  }}     -            -
> -
> -# Default group for normal users
> -g users   {{USERS_GID  }}     -            -
> diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_255.1.bb
> similarity index 98%
> rename from meta/recipes-core/systemd/systemd_254.4.bb
> rename to meta/recipes-core/systemd/systemd_255.1.bb
> index 0c12926bef..daa3a01fef 100644
> --- a/meta/recipes-core/systemd/systemd_254.4.bb
> +++ b/meta/recipes-core/systemd/systemd_255.1.bb
> @@ -21,7 +21,6 @@ REQUIRED_DISTRO_FEATURES += "systemd"
>   SRC_URI += " \
>              file://touchscreen.rules \
>              file://00-create-volatile.conf \
> -           file://basic.conf.in \
>              ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
>              ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://00-hostnamed-network-user.conf', '', d)} \
>              file://init \
> @@ -29,7 +28,6 @@ SRC_URI += " \
>              file://systemd-pager.sh \
>              file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
>              file://0008-implment-systemd-sysv-install-for-OE.patch \
> -           file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
>              "
>   
>   # patches needed by musl
> @@ -73,6 +71,7 @@ PACKAGECONFIG ??= " \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', 'link-udev-shared', d)} \
>       backlight \
>       binfmt \
> +    cgroupv2 \
>       gshadow \
>       hibernate \
>       hostnamed \
> @@ -266,12 +265,16 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
>   # The 60 seconds is watchdog's default vaule.
>   WATCHDOG_TIMEOUT ??= "60"
>   
> -do_configure:prepend() {
> -  sed s@:ROOT_HOME:@${ROOT_HOME}@g ${WORKDIR}/basic.conf.in > ${S}/sysusers.d/basic.conf.in
> -}
> -
>   do_install() {
>   	meson_do_install
> +	# Change the root user's home directory in /lib/sysusers.d/basic.conf.
> +	# This is done merely for backward compatibility with previous systemd recipes.
> +	# systemd hardcodes root user's HOME to be "/root". Changing to use other values
> +	# may have unexpected runtime behaviors.
> +	if [ "${ROOT_HOME}" != "/root" ]; then
> +		bbwarn "Using ${ROOT_HOME} as root user's home directory is not fully supported by systemd"
> +		sed -i -e 's#/root#${ROOT_HOME}#g' ${D}${exec_prefix}/lib/sysusers.d/basic.conf
> +	fi
>   	install -d ${D}/${base_sbindir}
>   	if ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'false', 'true', d)}; then
>   		# Provided by a separate recipe
> @@ -754,6 +757,7 @@ FILES:udev += "${base_sbindir}/udevd \
>                  ${rootlibexecdir}/udev/rules.d/60-persistent-alsa.rules \
>                  ${rootlibexecdir}/udev/rules.d/60-persistent-input.rules \
>                  ${rootlibexecdir}/udev/rules.d/60-persistent-storage.rules \
> +               ${rootlibexecdir}/udev/rules.d/60-persistent-storage-mtd.rules \
>                  ${rootlibexecdir}/udev/rules.d/60-persistent-storage-tape.rules \
>                  ${rootlibexecdir}/udev/rules.d/60-persistent-v4l.rules \
>                  ${rootlibexecdir}/udev/rules.d/60-sensor.rules \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192923): https://lists.openembedded.org/g/openembedded-core/message/192923
> Mute This Topic: https://lists.openembedded.org/mt/103380516/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


