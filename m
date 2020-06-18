Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.76])
 by mx.groups.io with SMTP id smtpd.web10.6265.1592483489171533151
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 05:31:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Jfb9jMty;
 spf=pass (domain: windriver.com, ip: 40.107.237.76, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTpTQcpd0PrJ7MKTz9uWxCiZyjqMLCP945ipMdz7E+lZSuB7iLlOU+5UPLnctu3Joxy1EM8nJbhTBIZiJFMW5tdnjc1o4/K5hOkNGdBk03/VKxQ4aSeIkHj+RA6Oz3giN/3g59YUDXKLjJ4IwlIIAsA2reh2tEzIf05NseAhhGKht6tosSEXzUYtqndZ2YoxZjSpXgo8mS8H3XXoL7/Cwqs3d6AjJ497555yKoXMFRhCaTXSd+o6yCp0FN/vNwvPZfQ0KD5tXoHzqmjhqMJzcdg7jR+qDwbjvjEVbms0WjZtK+98INMe/7gGSWdU0wcx20gzRwucmC/w8fU+LYepew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/jv0usxBE1mSgvk41DH/2RiAwj0z40kEcJtRgN7N/g=;
 b=dGKtsIF7J0TGT9hEHvgVkMPzKBqmQ3QlkP4Oqda0FKPuD5S+Qdl5U+EIT003mJCW0QxoVole3iKvapdr/HDmBiQQ0KmLoU9uU2CindiBqXpI/eRgWIGnl5ROG2ZkmOPVgMnhqJiD990W7HewNrASiH8q9WY8XIFysWLgF3W8LEsDPKqqpo4z46iE93zPZ1nAZXjv1NfxZIooU99929GsnltGw09hih4cYL5UOH0Ptuj7ah1sYFTuiX3L3ZlfXNv+SIQcE/YkobmW27XvL+Tp3xKq7Mmob4dN+p1XxXWq6sCkVf0A7g45z49jNupaTyZEkFMMruZxyDIjqVAFsVge0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/jv0usxBE1mSgvk41DH/2RiAwj0z40kEcJtRgN7N/g=;
 b=Jfb9jMty4cCbAx5RL8YMHUwOkfW6My/j2fWTlvjpzKxw3sufEyFL4R6wByzo+FY02ywaoBXhzQ3Z+E6Ge985gYoOWcqkIIgF4lOQ71/iUBupJ8RYNT1ZcDZdQcLnvwJG2B2JIlH77cz/ERycXtSs70wDA4nW4gZIJKCLvHZ36Rw=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BYAPR11MB3766.namprd11.prod.outlook.com (2603:10b6:a03:b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19; Thu, 18 Jun
 2020 12:31:27 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702%4]) with mapi id 15.20.3109.021; Thu, 18 Jun 2020
 12:31:27 +0000
Subject: Re: [OE-core] [PATCH v2] classes/kernel: Use a copied image for kernel*.rpm if fs don't support symlinks
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com
Cc: zhe.he@windriver.com
References: <20200618075725.39434-1-yanfei.xu@windriver.com>
 <5e93588e648dfac9263dfc9520ba9b205d933703.camel@linuxfoundation.org>
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Message-ID: <015909a8-8847-0a7c-8bf6-3b21bc0750ff@windriver.com>
Date: Thu, 18 Jun 2020 20:31:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <5e93588e648dfac9263dfc9520ba9b205d933703.camel@linuxfoundation.org>
X-ClientProxiedBy: HK2PR0302CA0007.apcprd03.prod.outlook.com
 (2603:1096:202::17) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by HK2PR0302CA0007.apcprd03.prod.outlook.com (2603:1096:202::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.11 via Frontend Transport; Thu, 18 Jun 2020 12:31:25 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0037ffa-4b5c-4fec-dbca-08d813838527
X-MS-TrafficTypeDiagnostic: BYAPR11MB3766:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB376627A6B00E3F220B7201A0E49B0@BYAPR11MB3766.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 0438F90F17
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q6d4JiJ/SU6+rYvAaOL3hxtraysSmR6EWmP91GCh2rFDvBoOwa+PRTYWxbeI6JTrJjUaenbN9FrxhJDCK01P37cSKshu1XCNPjmkL9k3HYrb5WYCfx6fP/roNpGjl7ZtWs7Co+qRnBRz3mw5warYgVy9JxkrqPMlYFwMqqRCVuP687/dg8VTX0ejuoDWb/wksHwiroz8JcgiwpCHLY4CuWX87+Z/58aRqPjzKv1ufta/dXu4AFXTeINlbskGYxxKA32f/ttQOeGK3W4LA9STjmXaIo+x0BPaoStBwZGHqr4UFnhQK+Tx2/TiK6Mn06x6bWnbk2dJUhkK4ymQO3EOjMZcK68cQQkl3f3R8NHDeM3lipkn8MDzAusllRURuVQ6w9Ye+RrADch6tFSqWgco9Oj+aMj4F9qXhYMKzdcrZktyeZ/K3BYc2wuFSxWhLItJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(136003)(39850400004)(396003)(6706004)(86362001)(31696002)(107886003)(66556008)(66946007)(66476007)(6666004)(16576012)(31686004)(956004)(316002)(83380400001)(2616005)(2906002)(478600001)(4326008)(6486002)(26005)(8936002)(53546011)(8676002)(36756003)(5660300002)(186003)(16526019)(52116002)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	LUK52QqJRDA5/ae1R4gD5xbSbSzrl9KoJxwVy2mI7cPB4QI4S7XV3k4Q29SI5cJgJmDBWYhcodOV0GeUH23pKfXiHYwfjs3dlE917KfhLsNUlIvkysvIxi2pYR1LLq/Ne6aFV+axQkFbyW1dnn5I8ADzOej/CsOVtXVDsUvl7WAK8UAzJhjNGX/1gv2XK1HTBmRCw97fRj2FjHMw4sTiVRQHrKE6PBbCLeLahrB5aw4gttIHYkeNAsqlxiwyyTGWKHzZjLXwS1VJPfPuzQCyv7dr0wZrhYIKObc9Wj0faLY/PrgyR/btD+tBXyPuF8Sv1Do0xmfn2cEk47dHdDGSc8gzezFmGqXHJ3/EQBoNdPJOaxJh6slhHcSMhKsV7o0BSZJQiqF45J+Du+JHe1Nh9Xhdbwuj503LbvZ4+hvylj9FPhfryqjTRDV6JQZaNhAjtYu2tE6J1BWwbyW+4vhQvxnooPtuaqByVPcAFuToUvo=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0037ffa-4b5c-4fec-dbca-08d813838527
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2020 12:31:27.1508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHyoslSd3zk89HRpkrxKgnCqq9Te8sOS1f8UEudFUcnAQf4OZhEgDffK1Z65aR+PRonKy6tSIy+bzrF955Hfzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3766
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/18/20 5:52 PM, Richard Purdie wrote:
> On Thu, 2020-06-18 at 15:57 +0800, Xu, Yanfei wrote:
>> From: Yanfei Xu <yanfei.xu@windriver.com>
>>
>> Some filesystems don't support symlink, then you will get failure when
>> you install or update the kernel rpm package. Now we use a copied iamge
>> for these filesystems instead of symlink.
>>
>> Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>> ---
>>   meta/classes/kernel.bbclass | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 41101a64a0..749d1a0f29 100644
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
>> +    echo "Filesystem on ${KERNEL_IMAGEDEST}/ doesn't support symlinks, falling back to copied image (%s)."
>> +fi
>> +set -e
>> +""" % (type, type, type))
>>   
>>       image = d.getVar('INITRAMFS_IMAGE')
>>       # If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is set to 0,
>> @@ -386,7 +394,7 @@ kernel_do_install() {
>>   	for imageType in ${KERNEL_IMAGETYPES} ; do
>>   		install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}
>>   		if [ "${KERNEL_PACKAGE_NAME}" = "kernel" ]; then
>> -			ln -sf ${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${imageType}
>> +			install -m 0644 ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${imageType}
>>   		fi
>>   	done
>>   	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
> 
> I am a bit concerned about this since whilst it solves one problem,
> doesn't having two copies of the same file around significantly
> increase the size of the packages and the update payloads updating such
> systems would need? Are these two copies of the file in the same
> package or not?
> 
> Perhaps the symlink creation should fall back to a copy on device
> rather than having the copy at build time (as I understand it)?
> 
I had a wrong understanding about the no-versioned Image in /boot
partation from wic. And I just verified that the no-versioned Image in
/boot partation seems doesn't from kernel image package. So you are
right, we don't need to have the other no-versioned image in packages.

I'll change the logic to having the copy at build time in v3.

Cheers,

Yanfei

> Cheers,
> 
> Richard
> 
