Return-Path: <christian.taedcke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E041AC61D9C
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 10:01:06 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.83])
 by mx.groups.io with SMTP id smtpd.web10.15912.1700647258368650542
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 02:00:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=0yNJUReb;
 spf=pass (domain: weidmueller.com, ip: 40.107.7.83, mailfrom: christian.taedcke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y53JQFrV8sJXcDcrHSU3dE+lUk4cyYkNRGn5OdD8z17eLoNW5DZrH9Tzv/otpDdNCoqBKoaOrqzPd66WaEISWil7IBKs43JeqKoWs6JjJKTqoyqmBGubn5x22bGQ7o8pBAzNPehPlowwU1GE9ow+EV69T8pzTddqxBc3kalzzSq7GgYRtsBjjgifCny5hX26dnIhI1FyjkO/LOuwQku7ceowd24OoPX/v2jsVudnYvlUhkXstSyO097BwLhOr+62VeLgCOdZ2uT7VonKS9PvpRiEn6tc/Wxls3mYac2WbIbQ+uJdZdZMgr576Pl5BHV6P/viUEGj3ZHeVCmCDGVw7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThIRftePMQ4BN8UisX7LSbXmOtBlpvSAVxSyMvFlICg=;
 b=jI8Gfxg0RUZQOLv8Uop5/kPWeKIA2rYslPYczvjmpK2/BJUIXuTLDH+lYQ+pp9D3JHBXwIN3t40ailaHyHR+LGNpRGwVip+Q9VaHK5EDKjFf6GirwWdXSsByNy7JZQCbdarZlQgceP35CHuI82ni9edkoLUiAxMRbi40fWcKjOEvmyjB8enHJg5nBKyOWx3JumXyQTbv0dIKjBYm/eJrSIgcEB8SHy1zRt8dDElbPiJ9px7BqNhQQATDe/tQCECdKwBiz0sPJHtwj+XlGKc5ImOpd0wMpXAnK5/beYpZHhpqliSWkI5UwBI/J8RwPNxVpZPk2YeSeKxKR8KHqDtTTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThIRftePMQ4BN8UisX7LSbXmOtBlpvSAVxSyMvFlICg=;
 b=0yNJURebKWjdaPuiiy1lpEnO0Q+2Mbq86SNr7hxfTXF5NTLfX+mhktOGHzm75cuZG+5+Pta5m9QvvqyH0dhLwOZW1hozPJhT9zHYrZ4MinoFc+1m4d4MMeK6sCcS1dlUROwWE9gq7ltI19wiYWe1JftzQZ+YfywYAhuG576Jld8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AM0PR08MB4946.eurprd08.prod.outlook.com (2603:10a6:208:165::13)
 by AS8PR08MB8184.eurprd08.prod.outlook.com (2603:10a6:20b:561::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 10:00:54 +0000
Received: from AM0PR08MB4946.eurprd08.prod.outlook.com
 ([fe80::a732:6327:19b0:b4d5]) by AM0PR08MB4946.eurprd08.prod.outlook.com
 ([fe80::a732:6327:19b0:b4d5%3]) with mapi id 15.20.7002.026; Wed, 22 Nov 2023
 10:00:54 +0000
Message-ID: <7b991338-147d-46bc-bfc4-1b5c956cc82b@weidmueller.com>
Date: Wed, 22 Nov 2023 11:00:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] meta/lib/oeqa/selftest/cases/wic: Add tests for
 configuring kernel image install into boot partition.
To: Kareem Zarka <zarkakareem@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Stefan Schmidt <stefan.schmidt@huawei.com>,
 Kareem Zarka <kareem.zarka@huawei.com>
References: <20230308103448.2134894-1-kareem.zarka@huawei.com>
 <20230308103448.2134894-2-kareem.zarka@huawei.com>
From: "Taedcke, Christian" <christian.taedcke-oss@weidmueller.com>
In-Reply-To: <20230308103448.2134894-2-kareem.zarka@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::11) To AM0PR08MB4946.eurprd08.prod.outlook.com
 (2603:10a6:208:165::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR08MB4946:EE_|AS8PR08MB8184:EE_
X-MS-Office365-Filtering-Correlation-Id: 13722437-e053-46bc-9b7e-08dbeb41ea60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1dsp4dUX8U+FOJaS09ZXNAXajv96lQzalgMkMV/4t8fzmB1cFV7CZBZYo3Rs5BinIGMYBHC6RnciHlLNcUxUOPfHhPKV1/7sj4P+dh1rKP5TbpPSAZ8I5FGrVi1EnKlR8OCG21g8c3oGD5U9rCQfIwaE6K4iHAH8aMoVDpM3x9QUcvYCfnN28A0xWtz/LGQW6GcIVNJ9+l1k8cOEKjbEhoDvCTPUKClGTR9F+FXuqaLAl9u4ltXx1PbNLo7mu4GmB9da1nOXbcnVOgeBL6eNrHHyiLUgc8g8RgFbMe/ciABXuQImGrhruzLBI8FwUIroFMlxuV5VhRCQEnM2bWWpLONXUPAHlX98DhQzUUnyX//nz/makmtCEvvYAr4XgcrNxMwBgnbeRCe/9g3aYjPMK8O9RAL7G7iqzM7cTGfKFEmTDQnBMKIZnfVfT/Q/idBxozuiUNLt5k2PfE3X3fkWdSQMJle4eb2w1cwPmDN4g/ws4VqWnzDAebl1yp5CJCxYK5jzdsSBlpMLe+pvIESul3GF143y+jb7ZFfdkquLE70fYDkCTPVEpt4ds+egIiACF3qUboHn8D/FttJR0zk1IL50LyJYDrbNObII1aJdoeijuqOkBHHDOUUP47oq5Ovb3EmPjNp5TkHeM2GWwLmiLA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4946.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(39860400002)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(6512007)(6506007)(53546011)(2616005)(83380400001)(2906002)(8676002)(8936002)(4326008)(478600001)(41300700001)(6486002)(5660300002)(316002)(66476007)(66556008)(54906003)(26005)(66946007)(31696002)(86362001)(36756003)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QnVMUnU2TmU1M1hvUmFSQ1ZMdGpVL1NBaDU3U2JCUk92QWExTEdvVmxIU0Jt?=
 =?utf-8?B?ZGtHYmRnTndMTXp5OFhpemNsZWFjcml0azM1QktpelpDNzV6Yi8rUkNnWVIr?=
 =?utf-8?B?Q1d1KzRpRG50eGQ0QWdDUERvRTgwdW9UYVY1SG8xVEZMM0VwZUNFaXhnOU1S?=
 =?utf-8?B?UEZneFRXMGphYTA5VWN3dVE2YnJlNTIwU2ljTURidHVVaW04Yy95QytHcXJQ?=
 =?utf-8?B?NXhJdmVEa05nZDNZM3ZRR2c3c1BlZE90bEJsd3doaUFTU1NObWo5V3VsbGty?=
 =?utf-8?B?bDloNXhVQXMvQjlBOVEvOU9hSksyTHNNdUpDYkNFOEVzMFFrMUs0cldCcFJq?=
 =?utf-8?B?U3ZpdHBUTFpMbktlY2lNM201ZXdzVGdhc2J3SFpiSEszQklmN1VrY0l6WUEy?=
 =?utf-8?B?ZzQyVGp4SVhTQ1owVEVXeVZuOWs0aTZMZFJvZXdnNUFVY0RTbGFWZEhXUlZk?=
 =?utf-8?B?K3QraXk3K0h3cE9BYVJzaThYUlA5TWxHRXJNUGdmU2FTajI1SUR4N2NWb1k2?=
 =?utf-8?B?K2k4WC9meUwyQzhCOEYyZk9paGdsMVg5ck9KS0VhK0syYU1qaHYvc3h1TzV5?=
 =?utf-8?B?aVEzUWtmZi9wRXUydkp5QjV0dlZUUUV2d0twR1lQKy95ZGtCZk52TFVDN1hF?=
 =?utf-8?B?VkRKVWtQTFFnQTErUk94RWZBaGNyOTFMcHdjZ1lSaVB4TnBGZy81RkZ3WUtY?=
 =?utf-8?B?T0l6WjdVQkRwL1JoamsyeUJQMjBJSkxVbHYyRXpYV2VBOVc5YkdIVUVBckpi?=
 =?utf-8?B?MnZiTTl0SVhxL3NsRkZpYThWZXhDWGVVQ1dFd0JSOXErWE9Na2ppTk9GRzhU?=
 =?utf-8?B?RFBMb0pLa0Q5bXNKWkdENEtDaGd0akhpa2RaR0Q2K1JvWEt6Skk5cHBTekg0?=
 =?utf-8?B?MklNcVVkSHQ5ZDBJUExjc0YyanpiOHVCeHdEbm1qaDVrelFaQ0x5ZjI5R0Ry?=
 =?utf-8?B?YkY2OXI2Q0Z3MnIzdHgwa0JmZDVkSWRBdVJiWHJRN29vY3QrWnc3YTRLUnNr?=
 =?utf-8?B?VnJVS2RYTFNINitjajIvT3ZwQjI0YThydXZTZUh6NVJvNVYwK0dvdERkTVE3?=
 =?utf-8?B?VzFqZnJFYitEdE00c1p1a05Ub1YyWVVQN2lyUDE5a25SUXQwQklZcTI0c3Fo?=
 =?utf-8?B?Z0t6Zmx5M3FsdW5FUDhEVHF4di9XM0VpMTJBZGEwSFJySndiaDhIUm5CbUhj?=
 =?utf-8?B?V2RNczVaZE1OL3YvWThqVDNUUkVNMzIzZHE4cldSWHJUek5ZUHYyUTBuenpa?=
 =?utf-8?B?WmRHVTlxT1Jsd2dSNC84Sk0zMlZnT0s4dWdHOG5qZVhVZEZ3WFdTaWY0QUN1?=
 =?utf-8?B?QVF2U2x0S1FJZzRkZlFTdkhZUFRoakt5L0Y1Q2hiTm8xMmwvUElRS2Fia1lN?=
 =?utf-8?B?c3FNM0JRcG1rRExIZ3VudElTSDVXNnFXTjVpWk5JTkloaWN4RWtKcFRML2VO?=
 =?utf-8?B?TWlyemhESVNQditWei8yOUdiaExMZFBIWEEyY2ZkYmg5UjkxSFVjdlpUeGxt?=
 =?utf-8?B?bFp1eU4xVStEMGdTK2dLSDU4N3U1ajJmNGtKYUtUc3hEQ3BBcFhES2pqU2Fy?=
 =?utf-8?B?Q0p0THh1SURjUXlMajJiRW1xM3FBN0ZTNHJJelZRdGZ1TGdnVzNOZ0t0a2dS?=
 =?utf-8?B?bWZwU2p2Wm5aaXVJc1FDblc1TEl3N2NTd0oycGdva3hzL1JzSkdGUkc3dXlv?=
 =?utf-8?B?SFlVaEVPeERNQmc1Nk1qVmUrUGdZV0dBSDh2bm42T1puWXl2emV1eldQUmhT?=
 =?utf-8?B?bktkbXRzYVo2ZlFjblJsbVIyY0tPRVJMb3ZDdTNtZDdGb3NjUFdYZlNmVE5K?=
 =?utf-8?B?MlpucnFWSmRoOEVvWFUzbVN6TlFLU1d6UXFZQ3ZBOTBPc05aM243Y0NTdWph?=
 =?utf-8?B?WmpZN3g4S0ppWkdoVUJFWmk4RSs3Qkd2SW9Za1NadE5Kd2ZyZDFBQytHdmhE?=
 =?utf-8?B?d1FJNVN2MENmWEdONWVHN3JpZVNLZDRnL0hYN1NMZmZicVZrK3pzU25qSThr?=
 =?utf-8?B?c1FQWFM5clNQakhOWnltZVJKamFEaTNod1BJUFhyOUowVFVNOUZyMTlRa2FC?=
 =?utf-8?B?RkRqUjF3MjhRK0x2M2NqdnJHck5WazRoK3ZjeHljNGhHTkl0dmRwd01RVEhV?=
 =?utf-8?B?S3U4TFFCT0w4bStINFdRem8vN2sraTZib2VuNC95MGQvUk1OYmhvbXYxdGZr?=
 =?utf-8?Q?BdqhrXDEJ3NIvJt+vKm8FfGmaD54Zg9CbOXXumP+vfq9?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13722437-e053-46bc-9b7e-08dbeb41ea60
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB4946.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 10:00:54.3602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mmmtFSixmCEVd9mViEi9aZcBgtURboFYkPWFQPGfOLMZK+fE+UNRWVO82obhVxNLMRlUSKBbwuYejedZOoo+zfLa4B2Ki1GSLHzgSsIH+gTDfI42rGf8K3QdEE9qx5wN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8184
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 10:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191049

Hello Kareem,

are you planning to continue withis this review? If not i would try to 
get this merged.

On 08.03.2023 11:34, Kareem Zarka wrote:
> - test_skip_kernel_install: This test verifies that the kernel is not
> installed in the boot partition when the 'install-kernel-into-boot-dir'
> parameter is set to false.
> - test_kernel_install: This test verifies that the kernel is installed
> in the boot partition when the 'install-kernel-into-boot-dir' parameter
> is set to true .
> Both tests use a WKS (Kickstart) file to specify the desired
> configuration, build a disk image using WIC, and extract the disk image
> to a temporary directory to verify the results.
> 
> Signed-off-by: Kareem Zarka <kareem.zarka@huawei.com>
> ---
>   meta/lib/oeqa/selftest/cases/wic.py | 70 +++++++++++++++++++++++++++++
>   1 file changed, 70 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
> index b9430cdb3b..7f5db1dc73 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -16,6 +16,7 @@ import hashlib
>   from glob import glob
>   from shutil import rmtree, copy
>   from tempfile import NamedTemporaryFile
> +from tempfile import TemporaryDirectory
>   
>   from oeqa.selftest.case import OESelftestTestCase
>   from oeqa.core.decorator import OETestTag
> @@ -146,6 +147,75 @@ class CLITests(OESelftestTestCase):
>           self.assertEqual(1, runCmd('wic', ignore_status=True).status)
>   
>   class Wic(WicTestCase):
> +    def test_skip_kernel_install(self):
> +        """Test the functionality of not installing the kernel in the boot directory using the wic plugin"""
> +        # Build the mtools package to support FAT filesystem handling
> +        bitbake("mtools")

I believe this should be 'bitbake("mtools-native")'. This should fix the 
error on the build server.

> +        # create a temporary file for the WKS content
> +        with NamedTemporaryFile("w", suffix=".wks") as wks:
> +            wks.write(
> +                'part --source bootimg-efi '
> +                '--sourceparams="loader=grub-efi,install-kernel-into-boot-dir=false" '
> +                '--label boot --active\n'
> +            )
> +            wks.flush()
> +            # create a temporary directory to extract the disk image to
> +            with TemporaryDirectory() as tmpdir:
> +                img = 'core-image-minimal'
> +                # build the image using the WKS file
> +                cmd = "wic create %s -e %s -o %s" % (
> +                    wks.name, img, self.resultdir)
> +                runCmd(cmd)
> +                wksname = os.path.splitext(os.path.basename(wks.name))[0]
> +                out = glob(os.path.join(
> +                    self.resultdir, "%s-*.direct" % wksname))
> +                self.assertEqual(1, len(out))
> +                # extract the content of the disk image to the temporary directory
> +                cmd = "wic cp %s:1 %s" % (out[0], tmpdir)
> +                runCmd(cmd)
> +                # check if the kernel is installed or not
> +                kimgtype = get_bb_var('KERNEL_IMAGETYPE', img)
> +                for file in os.listdir(tmpdir):
> +                    if file == kimgtype:
> +                        raise AssertionError(
> +                            "The kernel image '{}' was found in the partition".format(kimgtype)
> +                        )
> +
> +    def test_kernel_install(self):
> +        """Test the installation of the kernel to the boot directory in the wic plugin"""
> +        # Build the mtools package to support FAT filesystem handling
> +        bitbake("mtools")

Probably 'bitbake("mtools-native")'

> +        # create a temporary file for the WKS content
> +        with NamedTemporaryFile("w", suffix=".wks") as wks:
> +            wks.write(
> +                'part --source bootimg-efi '
> +                '--sourceparams="loader=grub-efi,install-kernel-into-boot-dir=true" '
> +                '--label boot --active\n'
> +            )
> +            wks.flush()
> +            # create a temporary directory to extract the disk image to
> +            with TemporaryDirectory() as tmpdir:
> +                img = 'core-image-minimal'
> +                # build the image using the WKS file
> +                cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
> +                runCmd(cmd)
> +                wksname = os.path.splitext(os.path.basename(wks.name))[0]
> +                out = glob(os.path.join(self.resultdir, "%s-*.direct" % wksname))
> +                self.assertEqual(1, len(out))
> +                # extract the content of the disk image to the temporary directory
> +                cmd = "wic cp %s:1 %s" % (out[0], tmpdir)
> +                runCmd(cmd)
> +                # check if the kernel is installed or not
> +                kimgtype = get_bb_var('KERNEL_IMAGETYPE', img)
> +                found = False
> +                for file in os.listdir(tmpdir):
> +                    if file == kimgtype:
> +                        found = True
> +                        break
> +                self.assertTrue(
> +                    found, "The kernel image '{}' was not found in the boot partition".format(kimgtype)
> +                )
> +
>       def test_build_image_name(self):
>           """Test wic create wictestdisk --image-name=core-image-minimal"""
>           cmd = "wic create wictestdisk --image-name=core-image-minimal -o %s" % self.resultdir

Regards,
Christian

