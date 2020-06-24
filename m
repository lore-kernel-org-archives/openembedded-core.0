Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.44])
 by mx.groups.io with SMTP id smtpd.web12.4544.1592963109386771069
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 18:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gDI/0Sss;
 spf=pass (domain: windriver.com, ip: 40.107.75.44, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=meqA1Ed30OOXsKsZZthbWQo/ZWvQoUSS5s91A5UtqxPcZP3ikOxOf1WS4JwmuPD1FRQ7MHIJpE2ckaAupthTuY1PYkcYVLeZMNyhuknls0XQ3pDBA7Ub7njr9xoJ1cqjdJAlkxg5HjDMyJzS2ABoRFC0IwJhldixrPf9xUVTsMXxAUSb/vGnpWUWXoguPiMBEKT9WX1aiyTb78FkXXiB/oX/+OoD51CiI3CfE1CEthDCEMPuTh3QB45FWVy/3Y3CMY/xIaH/0fliTsgDo3Tvu7/M+iyZc6llNA/7/jlsD9M395xa0PVNWBnJi2fsVgU8IofjDnWOTmNGRenzRXlX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISnQT5iFRe7Nl0I2EOe5j5mPeRo3DWiYczHsu3K5sQU=;
 b=N6KsWAzseU/SIPSOYP8nBdtThlF8teYfzNFZPXVMXyJyOZ2zs6UZm2aiHNcOe0Oq7uGfhDmiCdDvS7uUhs1ycvyg7pkBdS2/NcOvICbLvahisvfajernmTojUpoKRHErmzWDGs0qa5WZLTry2Oj6a5F+39uwZff9W35CCRHkDShpcgKLBm4r9aqZUDYPUQC7zNsV4FaFaObZbzE411GehdmK6e5T9S66L6ATPiO9EnBD8uLnyviZfsU00Q6tdKEC66Ndl88H2TgMJeu646ZGRPwUMvXIqYQU9FHrXfXijKNGWwBpAstmdFmow1StjzYpTwgSkkZ+u9Ynow+L74+27Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISnQT5iFRe7Nl0I2EOe5j5mPeRo3DWiYczHsu3K5sQU=;
 b=gDI/0Sss5lRtAPHzX4EDFIFPKYIV/iULAWQmsdTcvMEokifioNrGAW1A673qrQ/VzN0CS8c5tS9yN/4VuHwOCP/ygLm5HJdVnlcnSh+vY9pzbeRVLlWZpeMMdJPg6Yb0QsTnHxGe6DzhymMQe8+jBU55hv13qWUpB6g8Oxo0DFg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BY5PR11MB4181.namprd11.prod.outlook.com (2603:10b6:a03:18c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 24 Jun
 2020 01:45:07 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702%4]) with mapi id 15.20.3131.020; Wed, 24 Jun 2020
 01:45:06 +0000
Subject: Re: [OE-core][PATCH 1/1 v3] classes/kernel: Use a copy of image for kernel*.rpm if fs doesn't support symlinks
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20200619114727.40142-1-yanfei.xu@windriver.com>
 <20200619114727.40142-2-yanfei.xu@windriver.com>
 <CADkTA4NApB19MmwAWP3Mgtf+zNEtsPuSxL7h19S8c3FNoC2o4Q@mail.gmail.com>
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Message-ID: <5199cabf-4da8-7240-37a1-016ed72e720a@windriver.com>
Date: Wed, 24 Jun 2020 09:44:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <CADkTA4NApB19MmwAWP3Mgtf+zNEtsPuSxL7h19S8c3FNoC2o4Q@mail.gmail.com>
X-ClientProxiedBy: HK0PR03CA0104.apcprd03.prod.outlook.com
 (2603:1096:203:b0::20) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by HK0PR03CA0104.apcprd03.prod.outlook.com (2603:1096:203:b0::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Wed, 24 Jun 2020 01:45:05 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6e34802-1520-47fb-13e7-08d817e038a2
X-MS-TrafficTypeDiagnostic: BY5PR11MB4181:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB41814B2BDE6B510B62BF4CADE4950@BY5PR11MB4181.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-Forefront-PRVS: 0444EB1997
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0NEpoOx16bdUVV9yGWYEIwsbiFVfXkm+r5pHsUkJ6YomfxwraRSbcls89jWEvsDmUVmW0YtMHRl2f07coRrBZQCiMiKuHLY6ilCBBEQ3DiDoKfVZM5UlvV3T5IpMDeihnjz8YGxUupi3bkBXp2YdkxdPTClmnXxkB9+E3eW17MsAklcV1ojARbTLU5AtEfgjiGp6dD8xmJMNdDZJKSJ6ZgMrU7p/FjXU/+lxX5+elZT9CupHYE4tF7DVpAP8s5wxsIJxbF6vTItsxCTyMOHCQbyRbt4COn4FWvvYnWQTNFuHMl60g4KP34qW15Uu0Tt8ZcMKO8L6EWA0oI9hMSJ3q/ViI1V+xobW8d5m5YY7ZJFyZT5kuOxHK924kyPKdW325euUBFqSaSQejDlZqV9NECl1Z6CX4vRjQK8zcCS3srOwd/iYfWLxyNyJjGecIqFi5rZDgm2DlYHrIBafbVo8K8NVk8JakncD4TMCnfsrtFFPhD0WofCySgQRYfCslOZEKTzrZvOCqSSNIcEtbaJwBw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(376002)(39850400004)(346002)(136003)(366004)(8676002)(478600001)(8936002)(316002)(16576012)(66476007)(66556008)(54906003)(66946007)(6706004)(186003)(2906002)(31686004)(16526019)(2616005)(53546011)(86362001)(36756003)(83380400001)(966005)(956004)(5660300002)(6666004)(26005)(4326008)(31696002)(6916009)(6486002)(52116002)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	7czJrqokJE20uj66kN8T3LltfyfqgcWAT3sZaz/mhXJFQUYCaeAeSIqz+qOVKt5CkB3VjryvuazJQBdAtWSQAA4/evYvpSH/ShhgsO4C0G26GxnIYiMtitlVqcHJfEYouP1rRCTDUR/UtI1/Puw20Drp0ZELsYWjn7g3JMqg8rrtWAJKLVAzMxhYPxV3NeVizqkgUBjGb4cw/PnhobyGvmtHMd1COnxJpyTNaLRZrQVt8XN9FwkqXOm1Rw4mZ90iET4NcJTwrRDzZTuRXS05Rrv2XMHup/ChCE0m001KUGmnRW9mjUsGCbgVdtBL0h96GGWNeP5J/VwSiKlCOUb7fiZJ5vHFrpCcvx3TjMBv0Cmb6O0IWbbJJoatstCM2ulaqjcheJkD0RXTNGvcDbtjliVNDjROBmciFGzxAMS1mTjoyvHduWdInVemCDH83XbmpI65qhftxEz2n+Oh/K2Qwe8auuXbqheeiiMsWYqjD6g=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e34802-1520-47fb-13e7-08d817e038a2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2020 01:45:06.5033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUVH2TUZAIH/UFSkgEkUc+pzTlMbaYCn379/Vn6o2Pcxbc8I/fhcqTU0YJ2LicHpYvVQiqbdBKosseWNSi0+qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4181
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 6/23/20 10:31 PM, Bruce Ashfield wrote:
> On Fri, Jun 19, 2020 at 7:47 AM <yanfei.xu@windriver.com> wrote:
>>
>> From: Yanfei Xu <yanfei.xu@windriver.com>
>>
>> Some filesystems don't support symlink, then you will get failure when
>> you install or update the kernel rpm package. Now we use a copy of
>> image for these filesystems instead of symlink.
>>
>> Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>> ---
>>   meta/classes/kernel.bbclass | 19 ++++++++++++++++---
>>   1 file changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 20a0135fc9..1269b54343 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -94,6 +94,22 @@ python __anonymous () {
>>           d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' % (kn=
ame, typelower))
>>           d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-%s-=
${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>>           d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
>> +        d.setVar('pkg_postinst_ontarget_%s-image-%s' % (kname,typelowe=
r), """
>=20
> You were previously concerned about boot issues if the unversioned
> image link/copy was deferred until boot. I don't see a summary of why
> that's no longer a concern in the v3 of the patch. Can you confirm
> that it isn't an issue ? Is it simply because the booted image isn't
> installed via this package, and hence we are fine ?
>=20
Yes, it is. Previously I have a wrong thounght that the booted image in
boot partation is installed via this package. Then I confirmed it isn't
like that by compiling wic image with an empty kernel-image*.rpm=EF=BC=88m=
odify
kernel.bbclass=EF=BC=89, the no-versioned iamge still be contained boot
partation.
Hence we are fine.

Yanfei

>> +set +e
>> +ln -sf %s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
>> +if [ $? -ne 0 ]; then
>> +    echo "Filesystem on ${KERNEL_IMAGEDEST}/ doesn't support symlinks,=
 falling back to copied image (%s)."
>> +    install -m 0644 ${KERNEL_IMAGEDEST}/%s-${KERNEL_VERSION} ${KERNEL_=
IMAGEDEST}/%s
>> +fi
>> +set -e
>> +""" % (type, type, type, type, type))
>> +        d.setVar('pkg_postrm_%s-image-%s' % (kname,typelower), """
>> +set +e
>> +if [ -f "${KERNEL_IMAGEDEST}/%s" -o -L "${KERNEL_IMAGEDEST}/%s" ]; the=
n
>> +    rm -f ${KERNEL_IMAGEDEST}/%s  > /dev/null 2>&1
>> +fi
>> +set -e
>> +""" % (type, type, type))
>>
>>       image =3D d.getVar('INITRAMFS_IMAGE')
>>       # If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is=
 set to 0,
>> @@ -385,9 +401,6 @@ kernel_do_install() {
>>          install -d ${D}/boot
>>          for imageType in ${KERNEL_IMAGETYPES} ; do
>>                  install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} ${D}=
/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}
>> -               if [ "${KERNEL_PACKAGE_NAME}" =3D "kernel" ]; then
>> -                       ln -sf ${imageType}-${KERNEL_VERSION} ${D}/${KE=
RNEL_IMAGEDEST}/${imageType}
>> -               fi
>=20
> For on-target installs, this is what I was doing in the past as well.
> Make the symlink during package install, that way we are encapsulated
> in that unit.
>=20
> That just leaves my boot question as the last remaining thing for the ch=
ange.
>=20
> Bruce
>=20
>>          done
>>          install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSI=
ON}
>>          install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
>> --
>> 2.18.2
>>
>=20
>=20
>=20
>=20
>=20
