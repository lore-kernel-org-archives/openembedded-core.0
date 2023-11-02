Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04EFCC4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 10:11:47 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.65])
 by mx.groups.io with SMTP id smtpd.web11.27297.1698919898628055033
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 03:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=IMKqLWdD;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.65, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a29InDvaNU4cRth0gWIZX+VKKoJQj4nzYXh/UaqwBMNNuUHVumH1o7rxdyzg8hsEFxZlv+8VN90jg6KQOJuTo0hZICmGGCQp1vLteGi+GBIAKJDEWHtHfW+lXPJGQL0LF4TYwz1nEKse8HuHV7tyNwf9x90zg0jELbWkue8ML1If/LhyPJHWxTMtfUpUoJWjDz1InJh2Wc2TkBPVazawmkDvuVoQi8z+B5v3/rZS/fx+151MQD8EtXIxbNlqGJ2xc/MyiwGVgEYca8KVsyQ+Y7eJx9eV0BIPkbly1ve3lEIUv4JcJ9zrlEckf5rWg/K3X2SQczDBrpec9V99PBeDag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FI/manVFWFk7Uzw0BfwtPkcunrU9BZ+y73SdiYY13q8=;
 b=OSMLTMUDhlRt/J7M86ns42bRuFxGfPLuGd3O/nAI6SuYAcMO/p1vFOHyno0OFQynHVYzOEOL4F9O0CjXm5iqRyvyranWdwK9xsi123VBlSEXKRBaIdw1xxOvW8fK08vGA1gTSPU5NKAr1i5H6Ftm2x4mQ2vhpVQxiybIFJXCsf4bMcYlyEEa5UoWEUp09cJW3vloyNCuXRgL1CEgZX8PiclhiuvX2g1YJGDQM2AVlJ7pUhnsRtgsrAhbBrU9vX4k9kvktrB+F9/6onQzJ4IO2JFlMYE7YcGXFHS0NNO+O7koV70sKvEgQt7ro59dL57k4o8d6ci2SL0hUlMgv4BkRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FI/manVFWFk7Uzw0BfwtPkcunrU9BZ+y73SdiYY13q8=;
 b=IMKqLWdDRaKndLjPMghfAQ1Cr9z8YVR89Ssd/2rFuFi1euLHaxuM77znGtgddhDtIt3zYItwsGG+ux0SI/BzzYEGAzdEW8EBNO+DWyyOmAYwvJ9Qpqi0UGSTXHO2bGg+CHS0KrBFqcBM2IvZy3niZovn+OuDSVkXOwyv6Acduuj5NZfR3hxXn9xQT7dQCLCgwmdF6AC6XeRXMRR2vt2By5lJwjylQyNxCn5J8Ot0cIp/Btu/xSwGNmDmckRMEAjBnbiz/wDZRAkTbvUF9+CZwjaO168sK4vqR1JneBsKH5mxQAg+F4/VI9IIGci56LCKsRVqo22N2UID39evaoKP2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DBAPR04MB7350.eurprd04.prod.outlook.com (2603:10a6:10:1a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Thu, 2 Nov
 2023 10:11:34 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::8b7:c8b9:d800:8b4d]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::8b7:c8b9:d800:8b4d%3]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 10:11:34 +0000
Message-ID: <17f16ad5-286c-4f10-905d-af30ff1d3a7e@theobroma-systems.com>
Date: Thu, 2 Nov 2023 11:11:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v8 8/8] docs: cover devtool ide
Content-Language: en-US
To: adrian.freihofer@gmail.com, openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
 docs@lists.yoctoproject.org
References: <20231101110129.647878-1-adrian.freihofer@siemens.com>
 <20231101110129.647878-9-adrian.freihofer@siemens.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20231101110129.647878-9-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0305.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::14) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DBAPR04MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a45f9b7-05e3-434d-f2d2-08dbdb8c17d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	w5kha+NHsA01WBFT7R2s5RlF31XButcmagEAi15lKjDxUrvU7mLDp87ImTvqamEvdi9yDbXsRWsK3HmR07QKFkiEiSW9BSSxnMAjBxibGE7d5gnMZzamFNO1SisBixIoAJPeFAMVU4xINInDepbPxpmO7p8yavfwuT1l1wBvEhTDlf4ybbkZthIOyYcwgFtzdWZ2JfSsvpXA9ozweni+WgcVIEBs9kKh7M9w0iXTKmHEbuzwrPIxrueHnY37PnUzSyrhWkjUmwB/DNE5mDgoXJQGIEgan9QGf3Qwdy6FRkyQtckPK76SNZultXjU5PvxRnaY+E8UYfyaYYNVuf0RfjjhvJJBJDA+YmrROncVMOZu76/rkxXOILP0XtLPAOgj66QcCSbA2Qy6Zrn+rTlwWdbfj46OiloTkCwcqbA764nn3OKsbQZHn7Fw2PPdKLtnm51tKOzsGutIHwRKdHnf1frlNOEHrYMhnbF3uwiBIydFkniNnVSN4As8mC97hgiLiyU9YW5ORrxns5FBhmZr2eooKXQuFNnmTCkROqzQ5BY1VKNwIHBGwdxAh/qg0oyOClyV2pKXCUUnkfyam2HC1izlIEMCFJnkmI2eu6tvDTbZWWlGONtfxchHghcP0CJosh8mrYpS+Qu5M+UPZynWQnsYWn7NyDn3/IKLF/gdm00=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39840400004)(136003)(396003)(366004)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(31686004)(26005)(2616005)(6512007)(53546011)(31696002)(2906002)(36756003)(86362001)(38100700002)(30864003)(5660300002)(478600001)(44832011)(6506007)(8676002)(4326008)(83380400001)(8936002)(66946007)(66476007)(66556008)(316002)(41300700001)(6486002)(45980500001)(43740500002)(47845010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QUFVUDg5VHR2M21nYU4rN3dhMmk5Rys1UVIvaFEzVXg2WUxrN28rTm9VTjRG?=
 =?utf-8?B?QVNlQjl3aXhUQzY0K1lxNXhqc2swZVJDNUwrbnVOK1FVemlFZ21KcnZySmti?=
 =?utf-8?B?L3VGTHk4SkJaTVo0VjVGV2VrdzJxWG9qNmhwVnRTdkR3bUtNVFlHOGZrNkQ5?=
 =?utf-8?B?ZVg3cTZ0bkE0UCt3ajlrUjljNldQQzJvNkN6NWV4eHJKM3NodWM5MG1hK1U4?=
 =?utf-8?B?cE8zQVNzdFRDY1hoSGQ0RTI2MjNjWXFMZ0J3ZzNOK2pHT1lxb2hIZi9xcnpF?=
 =?utf-8?B?bml3RnpPb2NXL2JQcGp1V01sUGlOM2JSNXhyZGlxTGU5QTR5czVVOEVpU1hs?=
 =?utf-8?B?TnY4VDRTcXJtQXNkb0ZLNmtMUmJsWTRVVjBlSWdvZFdXNGVUMmo1Z2haUkpj?=
 =?utf-8?B?S05EeUF4ZThVdnZSdnVDcmdqUitPSXNMeEMwVzk0cnErclhsMUxFazVVTGdO?=
 =?utf-8?B?U3hHbTliSEgwY056YVpCa2dFbm1TUEVmYTI4V3ZtZWxjeFdsTGI4MXZtM1FY?=
 =?utf-8?B?UE0ySEFaN1hENU02SWsvdlFFdTZkeEo4ZGJJMS9YVk90b1k2Vy9scXRFaGto?=
 =?utf-8?B?cjRtaGhOcEtHQk96aUVOSHFGRFltcTNxRVlyWjlvaXZLcVpDNWV3Qk92MnlV?=
 =?utf-8?B?VXpxdW44NmpGVlpiTEoyYUE3WmJKMTRNcURHT29hSlJBbzBaZUowVDIvQVJ3?=
 =?utf-8?B?cXJEdGxKUlFKU1pKUktKMGJjZU5ZYlpidVcyellwMHhkMWxTWCtjN3h0Rjli?=
 =?utf-8?B?YVFjYjQ3RGxiaC9NK3RPa21LMnFmTWlJOVg3TGg1bjl0OEdiRE1Qc3lyRG1V?=
 =?utf-8?B?UlBFazBLUDl2Y21PVjFIZU5jb3I3N3NFb0pNWGMwU0pUSFdWYWEvUjBSZWpy?=
 =?utf-8?B?N1hneHBoczNWUlFWUm1zWEwyalhTaHNhMkUzWGw5ZGcyT1NsSWNkNEMzVlBY?=
 =?utf-8?B?VU03NnlRTmJ3MWdSaW5QdEhVbVg4ZE9RUjJDUUNhMnFhN1JVQXFRUEl5YUMz?=
 =?utf-8?B?U1FBS0lDSTV5QVZxRExCZ1pNS3BLSTR2VFB0Q0ZveFllekNEa25YemZvWW1E?=
 =?utf-8?B?NTZNdWl6a3NMS1VvbGlFNHpuRzdSVi9BOVVLVTd2QnBTRnRMdnhmcjN0TFBh?=
 =?utf-8?B?Y05kdUp5d2d3ZXVrcEFZLzluL0pUVlZWb3hibUJJRUVFSFRML2MrZjVQc0l4?=
 =?utf-8?B?WCtaMVArREFwamxLNEVlWDZzYzBZeDdjRHBYMDZiSXZEbzgxMHR1dXAxY2c0?=
 =?utf-8?B?Q1ZnazF4OVhUMUtoTm9JWjBIemlFZkhMSy9OOU94aU1LUjluK0hUVGExeDNZ?=
 =?utf-8?B?dEgyVXJHaURSYjVWRi9QVmx2bFNtc0NLQlJBNndLN0VWTlh4QTRhOE1tMjU1?=
 =?utf-8?B?dXI5T1ZnQzZQN0krWm1DS1VNRzUxQ1cyUG1GSDdDTCt0SjV1UWk1Y0Vzby9D?=
 =?utf-8?B?eDg0WWNDMEV1OFRQanRLRS9PQmJyQktqVHNTWnVsclBuTTE1Y1pwdVI5aS9X?=
 =?utf-8?B?L0VEd2N2ME5UTUZJbDlpSGVwUnJJelZ0blgxdDdFVHVLSHZ4RytzYUdjZ0VV?=
 =?utf-8?B?RU9jelhJMHE0TUV0OHRSK2hCS0dHTFNuU2xIWE9vSDFNdE5ZYjU0QWdOSnE2?=
 =?utf-8?B?YWw3NStUc2g3ZnEzUVVVbXd3eUpYWGZ6Vy9lVENKZEcwSlVxZkdWblVDWGFP?=
 =?utf-8?B?SW9wK2c4WEZiUFppeWhGdnRFY2Y1UDlSYnpwMURsUSt3WjFRWDNTN3ZjNGlk?=
 =?utf-8?B?SS9GZVdPM0V5VXA2blhBYklJR1JLQ0NqNGRaSGhTMkhXbE1LWFpoQ3Zrd052?=
 =?utf-8?B?UDdhdmdTS1V1bmdGTE9XRzk4R3VBUkd1d3lQYWI5dkZRRXhxVDJVUGhCTzZ6?=
 =?utf-8?B?cUVZWEFhcE1FNG5vbVk1RmVEVDFXWXRsVjB3b1UvVXl0dVdCczluYTJHSjU5?=
 =?utf-8?B?L01zT0xNdDhyRWRxMWN4eUdyM0JaSFh0SHBuSEpwM083S2pDemZPTWMxQWx4?=
 =?utf-8?B?WVVZa3c3OGozc2kwN2VNcmpVaFlIZ0x3ZFFjNWp5QUNXK2JaRXpWeDZTaEY2?=
 =?utf-8?B?SFh4NHkxc1lVVGpuT0VTMDFibEF0dUlpRDc3eGNkd1AyWERFbXpJUjNGd0NQ?=
 =?utf-8?B?S3AvSzh3eklRVXhNQVZmV2tZMlJLaHgyZXAyRzllR3pyRjcvL2JzZU1rb1lZ?=
 =?utf-8?Q?8Al893P94ZpIJ3UyNcMWgPM=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a45f9b7-05e3-434d-f2d2-08dbdb8c17d8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 10:11:34.5921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WDP2d3TgTX1HFgQZV3/+1ng1ngldfXkbWIKlZ9jrL5dRurvPpKDk2unR/HiJR5Xe/dHEH+DDYEamYbaqlxLIRznM6T7gwrpek6iqJ9XSjAy4bJCw8d3lmHHj8LkRHrvD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7350
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 10:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190073

Hi Adrian,

Please at least Cc the docs mailing list :) The docs is actually handled 
in a separate repo (well the yocto docs, for bitbake it's in the bitbake 
mono-repo along side the code), by different people.

Cc'ing docs.

First, thanks for sending documentation related to a new feature while 
it's being developed, this is very much appreciated.

As an overall comment, I feel like the documentation about the internal 
working is not necessary. The user shouldn't care about what the tools 
does internally, only how to use it and configure it. If somehow it is 
broken, not supporting a specific use-case or feature, then a look at 
the code is warranted, where the documentation of the internals is desired.
The part I'm talking about is the one between
+   Here is what it does for a recipe which inherits the 
:ref:`ref-classes-cmake` class:
and
+   It's possible to pass multiple recipes to the ``devtool ide`` command.

Other comments inline, only typos. I have never used VSCode and I'm not 
knowledgeable in Meson nor Cmake nor SDKs so that all i could contribute 
to this patch review :)

On 11/1/23 12:01, Adrian Freihofer via lists.openembedded.org wrote:
> Cover the new devtool ide plugin in the extensible sdk section.
> 
> Many thanks to Enguerrand de Ribaucourt for his re-view and
> contributions.
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   documentation/sdk-manual/extensible.rst | 153 +++++++++++++++++++++++-
>   1 file changed, 152 insertions(+), 1 deletion(-)
> 
> diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
> index 355c6cb0e4a..51d9fff2638 100644
> --- a/documentation/sdk-manual/extensible.rst
> +++ b/documentation/sdk-manual/extensible.rst
> @@ -63,6 +63,8 @@ their own pros and cons:
>      need to provide a well-functioning binary artefact cache over the network
>      for developers with underpowered laptops.
>   
> +.. _setting_up_ext_sdk_in_build:
> +
>   Setting up the Extensible SDK environment directly in a Yocto build
>   -------------------------------------------------------------------
>   
> @@ -230,13 +232,15 @@ all the commands.
>      See the ":doc:`/ref-manual/devtool-reference`"
>      section in the Yocto Project Reference Manual.
>   
> -Three ``devtool`` subcommands provide entry-points into development:
> +Four ``devtool`` subcommands provide entry-points into development:
>   

Just remove the number so we don't have to maintain it.

>   -  *devtool add*: Assists in adding new software to be built.
>   
>   -  *devtool modify*: Sets up an environment to enable you to modify
>      the source of an existing component.
>   
> +-  *devtool ide*: Generates a configuration for an IDE.
> +
>   -  *devtool upgrade*: Updates an existing recipe so that you can
>      build it for an updated set of source files.
>   
> @@ -614,6 +618,153 @@ command:
>         decide you do not want to proceed with your work. If you do use this
>         command, realize that the source tree is preserved.
>   
> +Use ``devtool ide`` to generate a configuration for the IDE
> +-----------------------------------------------------------
> +
> +``devtool ide`` automatically configures IDEs for cross-compiling and remote debugging.
> +
> +Two different use cases are supported:
> +

Ditto.

> +#. *Recipe mode*: Generate the IDE configuration for a workspace created by ``devtool modify``.
> +
> +   In order to use the tool, a few settings must be made.
> +   As a starting example, the following lines of code can be added to the ``local.conf`` file::
> +
> +      # Build the companion debug file system
> +      IMAGE_GEN_DEBUGFS = "1"
> +      # Optimize build time: with devtool ide the dbg tar is not needed
> +      IMAGE_FSTYPES_DEBUGFS = ""
> +
> +      # ssh is mandatory, no password simplifies the usage
> +      EXTRA_IMAGE_FEATURES += "\
> +         ssh-server-openssh \
> +         debug-tweaks \
> +      "
> +
> +      # Remote debugging needs the gdbserver on the target device
> +      IMAGE_INSTALL:append = " gdbserver"
> +
> +   Assuming the development environment is set up correctly and a workspace has been created
> +   for the recipe using ``devtool modify recipe``, the following command can create the
> +   configuration for VSCode in the recipe workspace::
> +
> +      $ devtool ide recipe core-image-minimal --target root@192.168.7.2
> +
> +   What this command does exactly depends on the recipe or the build tool used by the recipe.
> +   Currently, only CMake and Meson are supported natively.
> +   Here is what it does for a recipe which inherits the :ref:`ref-classes-cmake` class:
> +
> +   - Prepare the SDK by calling ``bitbake core-image-minimal``, ``gdb-cross``, ``qemu-native``...
> +
> +   - Generate a CMake preset with configures CMake to use exactly the same environent and

s/with/which/

s/environent/environment/

> +     the same CMmake cache configuration as used by ``bitbake recipe``. The CMake preset referres

s/referres/refers/

> +     to the per-recipe-sysroot of the recipe.
> +

s/per-recipe-sysroot/per-recipe sysroot/

> +     Currently Configure, Build and Test presets are supported. Test presets execute the test
> +     binaries with Qemu (qemu-user not qemu-system).
> +
> +   - Generate a helper script to handle the ``do_install`` with pseudo.
> +

Please use a reference for do_install. :ref:`ref-tasks-install`

> +   - Generate a helper script which does the same as ``devtool deploy-target`` does.
> +     Therefore ``devtool ide`` supports the same set of target related command line parameters
> +     as ``devtool deploy-target`` does.
> +     The ``--target`` parameter in the example above is just an example for that. It is optional.
> +
> +   - Generate some helper scripts to start ``gdbserver`` on the target device.
> +
> +   - Generate the ``.vscode`` folder containing the following files:
> +
> +   - ``c_ccp_properties.json``: Configure IntelliSense for code navigation.
> +
> +   - ``extensions.json``: Recommend the extensions which are used.
> +
> +   - ``launch.json``: Provide a configuration for remote debugging with ``gdb-cross`` and ``gdbserver``.
> +     The debug-symbols are searched in the build-folder and in the rootfs-dbg folder

s/debug-symbols/debug symbols/
s/build-folder/build folder/ maybe actually provide the variable name 
(if there's one) so we know where to look (because I don't really know 
what this actually means in terms of paths).

> +     which is provided by the image recipe passed to the ``devtool ide`` command.
> +
> +   - ``settings.json``: Configure the code indexers to ignore the build folders.
> +     Without reasonable exclude settings, it is very likely that some indexer plugins will run
> +     with 100% CPU load until an OOM exception occurs. In the case of VSCode, the indexers started
> +     immediately and do not stop or reconfigure when the ignore list is updated. This means that the
> +     settings.json file must be available before VSCode is started in the workspace folder or before
> +     ``devtool modify`` has added the ``oe-workdir`` symlink to the large build folder of ``bitbake``.
> +
> +   - ``tasks.json``: Provide some helpers for running
> +

s/running//

> +      - :ref:`ref-tasks-install` and ``devtool deploy-target``
> +

+running
at the beginning of the bullet point

> +      - start ``gdbserver`` via ssh
> +

s/start/starting/


> +   For a recipe which inherits the :ref:`ref-classes-meson` a similar configuration is generated.
> +   Because there is nothing like a Meson preset a wrapper script for Meson is generated.
> +
> +   It's possible to pass multiple recipes to the ``devtool ide`` command.
> +   ``devtool ide`` tries to handle the recipes in a reasonable way if possible.
> +
> +   ``devtool ide`` aims to support multiple programming languages and multiple IDEs natively.
> +   Native means that the IDE is configured to call the build tool (e.g. CMake or Meson) directly.
> +   This has several advantages. First of all, it is much faster than ``devtool build``, for example.
> +   But it also allows to use the very good integration of tools like CMake or GDB directly with VSCode or other IDEs.
> +   However, supporting many programming languages and multiple IDEs is quite an elaborate and constantly evolving thing.
> +   To handle combinations that are not natively supported, ``devtool ide`` creates a configuration that falls back
> +   to ``devtool build`` and ``devtool deploy-target`` if there is no native support available.
> +
> +   The default IDE is VSCode. Some hints about using VSCode:
> +
> +   - To work with CMake press ``Ctrl + Shift + p``, type ``cmake``.
> +     This will show some possible commands like selecting a CMake preset, compiling or running CTest.
> +
> +   - To work with Meson press ``Ctrl + Shift + p``, type ``meson``.
> +     This will show some possible commands like compiling or executing the unit tests.
> +
> +   - For the deployment to the target device, just press ``Ctrl + Shift + p``, type ``task``.
> +     Select the ``install & deploy task``.
> +
> +   - For remote debugging, switch to the debugging view by pressing the "play" button with the ``bug icon`` on the left side.
> +     This will provide a green play button with a drop-down list where a debug configuration can be selected.
> +     After selecting one of the generated configurations, press the "play" button.
> +
> +     Starting a remote debugging sesssion automatically initiates the deployment to the target device.
> +     If this is not desired, the ``"dependsOn": ["install && deploy-target...]`` parameter of the tasks
> +     with ``"label": "gdbserver start...`` can be removed from the ``tasks.json`` file.
> +
> +   Additionally ``--ide=none`` is supported.
> +   With the none IDE parameter some generic configurations files like ``.gdbinit`` files and some helper scripts
> +   starting the gdbserver remotely on the target device as well as the gdb client on the host are generated.
> +
> +   .. note::
> +
> +      To ensure that the debug symbols on the build machine match the binaries running on the target system,
> +      it is essential that the image built by ``devtool ide`` is running on the target system.
> +
> +#. *Shared sysroots mode*: Generate the IDE configuration for using a cross-toolchain as provided by
> +   ``bitbake meta-ide-support build-sysroots``.
> +
> +   For some special recipes and use cases a per-recipe-sysroot based SDK is not suitable.

s/per-recipe-sysroot/per-recipe sysroot/

> +   Therefore ``devtool ide`` also supports setting up the shared sysroots environment and generating
> +   IDE configurations referring to the shared sysroots. Recipes leading to a shared sysroot
> +   are for example ``meta-ide-support`` or ``shared-sysroots``.
> +   Also passing ``none`` as a recipe name leads to a shared sysroot SDK::
> +
> +      $ devtool ide none core-image-minimal
> +
> +   For VSCode the cross-tool-chain is exposed as a CMake kit. CMake kits are defined in
> +   ``~/.local/share/CMakeTools/cmake-tools-kits.json``.
> +   The following minimalistic example shows how the cross-toolchain can be selected in VSCode.

s/minimalistic/minimalist/ (or just remove the word entirely)

> +   Fist of all we create a minimalistic CMake project and start VSCode::
> +

Ditto.

> +      mkdir kit-test
> +      echo "project(foo VERSION 1.0)" > kit-test/CMakeLists.txt
> +      code kit-test
> +
> +   If there is a CMake project in the workspace cross-compilation is supported:
> +
> +   - Press ``Ctrl + Shift + P``, type ``CMake: Scan for Kits``
> +   - Press ``Ctrl + Shift + P``, type ``CMake: Select a Kit``
> +
> +   For other IDEs than VSCode ``devtool ide none ...`` is just a simple wrapper for the
> +   setup of the extensible SDK as decribed in :ref:`setting_up_ext_sdk_in_build`.
> +

s/decribed/described/

Cheers,
Quentin

