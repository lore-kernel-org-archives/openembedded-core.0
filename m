Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.76])
 by mx.groups.io with SMTP id smtpd.web12.2040.1592462991719507800
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 23:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ow5+tbwf;
 spf=pass (domain: windriver.com, ip: 40.107.92.76, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLnou0l3bApDpWOGQPr3pq+3GInqkQcHAUk+jzgwSPgKHqqOmSDTtRfqij5/ncpN9gzR6AujuEUeOtiMTwMtAH5SCwZoKy8Zno6qb1JhDKDJj3QEEAYi9VEhmyDXEiYjZNe1Xt5dkJx/TJ9neCU2I3FlOZ0TnMB58YQfbkj95V68Ec4OHUGQHNfxJAMvOl6TI2neN8yOuWWzBZmYnPCeEDs4VuStz7atCnWzGxHRecRZTEADZdEasX17RtXrhZ6UuPg5+t+4lKE+qeBz0Hq+H+mbo96FlekxFo585jQYfnkogcM1fQUVz6c8W4knCnUZ6mscNnqURFuvUuuGVnOfwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIJUoy1xJKxMUfK+1VENw16DkPc+Jeuy3KnsVl/srLU=;
 b=ijnAarCGkWomco9Tjn8fjBKg8g5PnYingrPxJyAz0mL2mjdhIb0loqsLCAMqBCRgpktCRe6Wx5oBqSYC5+IRr/J7Nk78CMbtzg47UUGDZBgIsMDFEQs/uUfTqv5QLV0UV//60w5CtsDfut+BoHJfIQ8LjjR7xjvMuXZyu/283EKIrs3ot4xgAji0Axzwgzs0qRD9c3f/XH6uKhe++ryNlFDZYaRvPSyj9YOKhiJ7Cxgx7RjhiqcKS5XjTsy6niLX553NfdUkeIuDfwsMpVkNhw3MrcyCyJpTjUdCFeurE6mFsqr/s9Oj1lWIWrznUyT2ytPXfwRgRQVtR8KfIIqRhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIJUoy1xJKxMUfK+1VENw16DkPc+Jeuy3KnsVl/srLU=;
 b=ow5+tbwfKZScC3t/bYo4pQfTpccNRqF1wk+TEsN70kamJJmgBOflM8Ls82Jr90DMUGjgh9lY8ZhYaCe6xAVs7onyIXvXifp2UrE8tuPyLARxiB/5CywF7DBBIqDJwzrrmNfqO6f3a2y6IiZqLyInpuFXCONjyImGZhuPbXy2Dt8=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BYAPR11MB3477.namprd11.prod.outlook.com (2603:10b6:a03:7c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Thu, 18 Jun
 2020 06:49:50 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702%4]) with mapi id 15.20.3109.021; Thu, 18 Jun 2020
 06:49:49 +0000
Subject: Re: [OE-core] [PATCH 1/1] classes/kernel: Use a copy for kernel*.rpm when fs don't support symlink
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, He Zhe <zhe.he@windriver.com>
References: <20200617062028.5542-1-yanfei.xu@windriver.com>
 <20200617062028.5542-2-yanfei.xu@windriver.com>
 <CADkTA4PiqVvnmZFEoBSTX1g7JxpqAkRQbAozScYtOWJ_6omQBg@mail.gmail.com>
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Message-ID: <c80a8d8c-1f18-198d-4d27-8c75fc113608@windriver.com>
Date: Thu, 18 Jun 2020 14:49:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <CADkTA4PiqVvnmZFEoBSTX1g7JxpqAkRQbAozScYtOWJ_6omQBg@mail.gmail.com>
X-ClientProxiedBy: HK2PR04CA0059.apcprd04.prod.outlook.com
 (2603:1096:202:14::27) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by HK2PR04CA0059.apcprd04.prod.outlook.com (2603:1096:202:14::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Thu, 18 Jun 2020 06:49:48 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf83622f-3509-4a24-ffd4-08d81353cbca
X-MS-TrafficTypeDiagnostic: BYAPR11MB3477:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3477014E8E60CA1B955FAA8FE49B0@BYAPR11MB3477.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 0438F90F17
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QxZmUbRY+YsJcv6JxgIEVEMluNX0+M+UaH11XpZdrrwbk+OWEDSyDiBUUeAyR/WrB3XOJos+TyUAiFwO7PuC2o9hsE/L29zkdAZvnspXcpPZYERcSgFy84SQgBkUyPVnNffYGc4Nk3+vkkm2VpMeimsZa07Li30zvs5gGM63XV4uAyx5ALyLCpn98o08AGAGt40/aL4KjYdvcR2Y+RpzvfuvK2chs0Bgmc0V81qm2BDJDCJ1JFflXCFX+A84JCQEUJ2ORUJyhYkN/eaf0vv4SGyv5My5t+UsP680hLwVBIyJ2sfWZxzVfVD5u80ThcM3RsF9Oo1mZdQi0ZbZN1p5mOR46JxGvB2BagzZsE5tGMIPdW6ZQAkai7i/o7R8QGREwky8SJSjk6rq5fhbveDTPdI1o5nDOXItSeG+Q1SsWsLhKcF8PCBS6wn121CHHvqo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(39850400004)(366004)(136003)(396003)(36756003)(86362001)(66476007)(66946007)(54906003)(4326008)(107886003)(956004)(2616005)(316002)(8936002)(6666004)(83380400001)(5660300002)(6486002)(2906002)(53546011)(52116002)(16526019)(26005)(186003)(478600001)(8676002)(66556008)(31696002)(31686004)(6916009)(6706004)(16576012)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	fcOx/LSMXigLLvnmk71cpUd+rs/SfRs1A97FFD5PBjNirXVxT0D1b+7Usf5tYZnrB0esgQs0Jhbek7d4BdXMBcGLmvkqwPVPU1JbLzrqo0abqQC8YXTxy8vtOnSM6xayVavDXwp2KJLEYBdXsjO+xIclJ6PWo7vJE/+Kw9mtPs5+zlJbCi/08Zd0cOKVJKd4u6cKrKGLQ+yUrHNTNmLtNWh/A/X1COCuEAmgv2lni1l+G3q8HVoDlP2hFCus4I5eIbJjSV1jOWnEAaZCglV/Pv6dIYdPxGPaEB6ENtX6RDDVXuEc5wJ5a5whZlYFbXT2u2apPx6IBgllg7dopDPjG7+1CaJhZMXkqa0bc44RfX14BG2kMUevVxadDK8PnBPFt6qot0dkQdxQaRhohDb+tEBP+5wI5RgHVsDLkYn0xnTvyyp5taHRru788wE1PzTwpfaQ6uEoQXoF7wnlZldHqL0u/UQkbqO1YyrN9fqtLmw=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf83622f-3509-4a24-ffd4-08d81353cbca
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2020 06:49:49.7165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGtTVi0k435MwsEnFtG4PA6d2mF0ypG2rF6VuuJOw+obDEcIE5uwo+9au8f1phdkvVJe2HmSXH4fKCEB3OOX8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3477
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/17/20 9:48 PM, Bruce Ashfield wrote:
> On Wed, Jun 17, 2020 at 2:20 AM <yanfei.xu@windriver.com> wrote:
>>
>> From: Yanfei Xu <yanfei.xu@windriver.com>
>>
>> Some filesystems don't support symlink, then you will get failed when
>> you install or update the kernel rpm package. Now we use a copy for
>> these filesystems instead of symlink.
>>
>> Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>> ---
>>   meta/classes/kernel.bbclass | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 41101a64a0..e9b5a84de7 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -94,6 +94,14 @@ python __anonymous () {
>>           d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' % (kname, typelower))
>>           d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>>           d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
>> +        d.setVar('pkg_postinst_ontarget_%s-image-%s' % (kname,typelower), """
>> +set +e
>> +ln -sf %s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
>> +if [ $? -ne 0 ]; then
>> +    echo "Filesystem on ${KERNEL_IMAGEDEST}/ doesn't support symlink, then use a copy."
> 
> This could say "... doesn't support symlinks, falling back to copied
> image (%s)" (and fill in the image file we are actually using).
> 
This discription is more clear. I will rewrite the message.
>> +fi
> 
> I expected to see the fallback copy here in the postinstall, but this
> looks ok to me .. I'm going to just type in my process of reading the
At the beginning, I was going to only place versioned-image in rpm
package, then make symlink or copy in postinstall on target. But it will
cause rpm package don't contain no-versioned image. However, ARM device
may use the no-versioned image for booting in boot partation. So I
didn't implement it like that.
> patch so you can correct me if I'm wrong.
> 
> The logic is split between the two places. Below during the build
> (do_install), and here in the postinstall.
> 
> In do_install(), we no longer symlink, but instead copy the versioned
> image into the non versioned 'image' file. And then in the
> postinstall, we try and make a symlink (which may fail) to the same
> thing (the versioned image to a non versioned one), and that's a force
> symlink so it will clobber the previously copied one if possible, or
> implicitly fall back if the symlink fails.
Your understanding is right.
> 
> So yes, that logic seems fine to me.
> 
> The reason I went through all that, is that for on-target upgrades.
> You won't have the do_install() to place the versioned image, have you
> confirmed that the versioned image file is packaged and will be
I have confirmed that both non versioned image and versioned image are 
packaged in rpm package.
[bcm_2xxx_rpi4]$ rpm -qpl 
kernel-image-image-5.4.46-yocto-standard-5.4.x+git0+f8c88c4331_87b52c3030-r0.bcm_2xxx_rpi4.rpm 

/boot
/boot/Image
/boot/Image-5.4.46-yocto-standard

Besides, I have tested "dnf install" on target, it did place files of 
package and then run postinstall script.
> present on an on-target install ? So the logic is the same with the
> symlink ? It should be, otherwise this would never work, but I just
> wanted to be sure.
> Yes, the logic is the same with the original symlink, hence I also think
there is no new bug introduced to on-target upgrades.


>> +set -e
>> +""" % (type, type))
>>
>>       image = d.getVar('INITRAMFS_IMAGE')
>>       # If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is set to 0,
>> @@ -386,7 +394,7 @@ kernel_do_install() {
>>          for imageType in ${KERNEL_IMAGETYPES} ; do
>>                  install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}
>>                  if [ "${KERNEL_PACKAGE_NAME}" = "kernel" ]; then
>> -                       ln -sf ${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${imageType}
>> +                       install -m 0644 ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${imageType}
> 
> Looking at this, can the existing line:
> 
>   install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}
> ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}
> 
> be combined with the one you added ?
> 
> We are copying the non-versioned image into a versioned image file,
> and then in the new logic, coping that versioned image into a
> non-versioned one. Couldn't we just have one copy of the non-versioned
> image, into the non-versioned image in KERNEL_IMAGEDEST ?
I don't think it could be. Cause the existing line :
"if [ "${KERNEL_PACKAGE_NAME}" = "kernel" ]; then"
can't be ingnored.

Thanks for reviewing,

Yanfei

> 
> Cheers,
> 
> Bruce
> 
>>                  fi
>>          done
>>          install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
>> @@ -602,6 +610,7 @@ pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
>>          fi
>>   }
>>
>> +
>>   PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
>>
>>   python split_kernel_packages () {
>> --
>> 2.18.2
>>
> 
> 
