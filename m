Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79164C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 20:55:55 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (EUR02-AM5-obe.outbound.protection.outlook.com [40.92.67.71])
 by mx.groups.io with SMTP id smtpd.web11.3003.1646254554527188732
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 12:55:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=PJnYYeAx;
 spf=pass (domain: outlook.com, ip: 40.92.67.71,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqJOWgfIUez/vJdiuatJQl5UaEYpH0t4z0W9sMUHDvC0jKMAZdQqj3n6pIcF+Nindn9CJUTjZsXf3mxwcXc9IGgB97xCSc5KP6Z/+PzgXl+EEvw8qOFwfFRLv4REGUvmOTnipk4SbsSHhu7MjBK8IcNOGqFYC2dSKFU7fH0PNgaXbh6qgcz88vPtsXvbR/wWO7QKf+3RyAKRlHZ1I7sSG8ZerVrsfAWqbPN07x/qx7Kf9SA7MvjnK/TLjsWat0EnqfTRsNNMJ4z3UKrEhs+MPaxM3NBci5WtEHvccb6Otb8WXwiCDrd9mGBhw+TbzWCxM+rDa9aGJPwT476qO5vfCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVZHxV62vzi/lDJNiGtnk84Y4IQnPWw54AJdYC442jw=;
 b=EsJkpGwj4/SOWK3YCs3oQ0WqjdjnIlwhZ4lvySWfvAAJstCRs8IgUARUDDskWzwQFLLIOVB6t12sLW8Eyo1vc4eiXxK78YNm3A0rGA/qR4i2wF1k2SvlX7vnWidq9sF4j6bUlaL8Tgn3A0071lKUGfbCX6cnfeO4uFTcnqLdjD5DwAvL6LMBNePc4t1nthAcHWQ3Fuyw4z2nt4bguQnlUljUdjjdvEMNjqfW+y54SILDackSy/tzm+MPo/AeMqyov4Qs4nzVI13lh/+S+VCgK06RgjtLYNzGRQp8HnHMQdmsJ34ZCmwvBvBdOVT5jGkfRmdCGgArNNjG4hQQRX/MgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVZHxV62vzi/lDJNiGtnk84Y4IQnPWw54AJdYC442jw=;
 b=PJnYYeAx1xfPKx+M6u/lEN6zyDEPOK+/zz/kouncaF49YsLXjVmL6T4BoOLUZAD78neuNzj6hzQOgNI5K109piCv0VaKjS44JKp7cWVHg+oL36Wsxol0P2eO4a2++1qgE8caof7/nkhaCHFS+5RBgjKoBX/oNQn3p+seqpRgpl8xPN22jweOCxXBNeiPmV3HZN3Lrjja4oFUlscN5ST59kzffnhWi9h4qAXwO9lCjhj4nAcLCVb/0jhUYXr4FJ2ov1IxtIskA4WLSCaxoatU8y9gjgPBY8K+z/pZ5XlgoBy95qZSb+0AgU3F+7ekBkA3f7ke97JC0iLK6AzMYvTaYQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by VI1PR09MB2493.eurprd09.prod.outlook.com (2603:10a6:803:86::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Wed, 2 Mar
 2022 20:55:50 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%8]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 20:55:50 +0000
Message-ID: 
 <AM9PR09MB464217F0B4A5828BA8092D4AA8039@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 2 Mar 2022 21:55:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Language: en-US
From: Konrad Weihmann <kweihmann@outlook.com>
Subject: staging: FileExistsError
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [hBA0E8sji7shTSZG/JjHREuCGbaLn21taf34acYH/MmnSBCWTDjv1Cjaz55CyhBZ]
X-ClientProxiedBy: AS8PR07CA0010.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::8) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <8bf25cf2-4ec8-4f09-4a3d-bf7cbfb33078@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0848358-71d7-4b90-8aca-08d9fc8f088d
X-MS-TrafficTypeDiagnostic: VI1PR09MB2493:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cuEtzb9EKaxgaiFVMjo8rqwfoWVXFdSCD0c+raOtyzLgTslAnauBz7p8BXjRwIiyyfIsXGQhNFfqKrJrGbOOYt9l6obK49f+NHyFHTgWS8Ulm1GGUufmWOS6L5t96M4aVn2VjMJuH5USgi3g7boshGWIX4xviVL9f3WzUNGdpsIHS5JYJiY5/GEhzs28t3MsV7nNwAU0AYq11HBmaBhmt007v12zHVyFgtGF2YJLm9g/6v0xScQh/wcj1an0Fk1tV8I331G2xVVBj5K4MIodAalUZeMnJerG22YDIf2628krkzB0kkFYOKAEhGfHvN93ZXeE4Uy/ddU5MMSFM04oP+7xW04a4MpGg+cpg9UpzMt1zvEswsGRCtARTajgpiR9+LmXRrCZBEiKuyxow/2gXcdDyTisvD2ZcoA4jA429pmr/clQI8lsQqqIKjurgSaWjccj7wm81z278YbtIDAKbpWhf+v+OB7g+Bve8aArr7V1KGWcvJzA2UgK1P5KwEsdGK3CytL6OwUJrXZxEFfAch/HP+Hk5jN1kwLWIi3JZvnPvQ1IY/6TaTrHLaBTFCd907SgbPP1RSIxwZsNrxATpA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UE1PVXM4cExnWTZwWFh0QS9rMGM5ZnBaank1eDNtbDBiTEtEWDVqMFJ0QnJh?=
 =?utf-8?B?ZUtOem5xSlB5WDlmNjlTSm0vTTh4alFucUpjZ2FIbnpBYjV3NVhTdUFvN3Ax?=
 =?utf-8?B?MUJydXpuK0JOeHM1ZjM0K1gxOVUyU1dWZmNXbGs5Ri8zaXR3UFJOd2lVbjBp?=
 =?utf-8?B?Uld1Mkc5OXUxZGVJRVNCb3hnWTNxVkdNWXV6ekRWV09XTzkxbVBib0NTdXVp?=
 =?utf-8?B?ME5mTjJCK2J0aFBhaXQ2Yng0Yjh2dk9IUU51OVFjbTJlMFpacFFzWGJqajlR?=
 =?utf-8?B?V2Z1SWVaMjlrNmVucmxmN1dYRzFsTFVWZFJMOHhnU0o1QlN0Mkovb0h0SUdB?=
 =?utf-8?B?UW00VWZlVnNpdGVrdTE5bGtINXgyc3NsY0tZeUdQZWdxd1JpWVRQemp2dXd6?=
 =?utf-8?B?RGtQcVlFa0I3ZzY4RVdyUnFMTE5HZFd6TDNmemg1OCtrTHgvdUU4OXVuTFls?=
 =?utf-8?B?SnRPR0ttU0VEUUJqOUFMUXNTc29wcjJWLzF5TnNSczBoakFVSXZuRHVRRXdY?=
 =?utf-8?B?WndOaHFEUzIxNjlUcno4dmd3bjNtVVNtZi9lQmU3aXBQUUUvL1psQzN4V2hY?=
 =?utf-8?B?Wlk2bzQrWlF0QlN5TDVPNVpiZ1VJRFk2VGN6TTNLY014eXEvbmY0VzhNbndz?=
 =?utf-8?B?L3hpamE4TjZ4aW5kaFFTVEdDOGx3ZmRoQU02c2w0RUNpM2xnd0JoblAzN21I?=
 =?utf-8?B?L0JLOHU4MDdIRWY0TzM5RDdyU0x2R09UMTF1MUxocHlPOExrYXBLZmptR0hp?=
 =?utf-8?B?Y0FWYm1DWlpPY1hFWU5CK0ZwMHFBS1hnZ1daSFBtYU1CUFZxUHhYZlF2SDI2?=
 =?utf-8?B?MU02dUpieUlxaCt3ekFwaWo4amZYdDZySEFSMmI0QzFjbU1tS0RsbnU3Nkwr?=
 =?utf-8?B?S3duK29IejNJM0lXTFIvVnVMS3dYTUJQd1pXR215ZExSNXVQK0xVbHpzVDVq?=
 =?utf-8?B?aTRSYVZWbzU3QjJrVHRiRDUycit2SmptTitERVVUMmJrWHRHd3N4citOL1Jy?=
 =?utf-8?B?Mk9sNHpmSE16TTN2eUt6RDVlWHhSTTRVcHdhT3UwbFpsbGxzSGFaZWJGT0xT?=
 =?utf-8?B?NGhZMlo0b2s1bVZyT3VJbnJRSUNHSFZHTVFIbEI2NUM4NHhKMFl0R1NEN0tT?=
 =?utf-8?B?eElVQzJNY2JCVmtTT241SEI5MW5haGxZQ2ZWaHJmODY3YWF2SjFTdGdkdlBj?=
 =?utf-8?B?dS9HN3pBQ1Rxb24wd05VWlc1Unc1WFdKMWxWSnNmdFN1dndvWnQ0YmM4eE1y?=
 =?utf-8?B?clFWMmNuekdPUVNXbVljdldkdDFteC9EM3p4US8zM1BzYnpzVVBsWmhVK3o3?=
 =?utf-8?B?QkROc2h3bit3d2ltOUoyVHBOK3dZd0J4b1hqaUJmQzdqM0dxNjYrS2JYblNM?=
 =?utf-8?B?ZklkaXhlcEVhTUE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d0848358-71d7-4b90-8aca-08d9fc8f088d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 20:55:50.5696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR09MB2493
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 20:55:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162624

An interesting behavior struck me once more after a long long time.

  *** 0002:extend_recipe_sysroot(d)
      0003:
File: '/layer/layer/poky/meta/classes/staging.bbclass', lineno: 584, 
function: extend_recipe_sysroot
      0580:                    if "/bin/" in l or "/sbin/" in l:
      0581:                        # defer /*bin/* files until last in 
case they need libs
      0582:                        binfiles[l] = (targetdir, dest)
      0583:                    else:
  *** 0584:                        staging_copyfile(l, targetdir, dest, 
postinsts, seendirs)
      0585:
      0586:    # Handle deferred binfiles
      0587:    for l in binfiles:
      0588:        (targetdir, dest) = binfiles[l]
File: '/layer/layer/poky/meta/classes/staging.bbclass', lineno: 158, 
function: staging_copyfile
      0154:        os.symlink(linkto, dest)
      0155:        #bb.warn(c)
      0156:    else:
      0157:        try:
  *** 0158:            os.link(c, dest)
      0159:        except OSError as err:
      0160:            if err.errno == errno.EXDEV:
      0161:                bb.utils.copyfile(c, dest)
      0162:            else:
Exception: FileExistsError: [Errno 17] File exists: 
'/build/tmp/sysroots-components/x86_64/some/path/to/some/deeply/nested/file' 
-> 
'/build/tmp/work/x86_64-linux/some-recipe/1.0-r0/recipe-sysroot-native/some/path/to/some/deeply/nested/file'

This happens in rare case when doing a differential build o a recipe 
with hundreds or thousands of native dependencies.

The file mentioned is pretty much random and it's unique (no duplicates 
among all the dependencies when it comes to filename+path).

So far I helped myself with ignoring this error by adding

         except FileExistsError:
             pass

to staging - I wonder if anyone else ever seen this behavior and what's 
the best way to deal with it

What comes to my mind is

- ignoring it - but then no one can be sure it's the right file
- falling back to the OSError/EXDEV path and copying over the file requested
- a 3rd option

Any thoughts?

(Just to be sure, this happens like once in a thousand builds and only 
on differential builds)

