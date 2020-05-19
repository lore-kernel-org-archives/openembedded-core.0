Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.84])
 by mx.groups.io with SMTP id smtpd.web12.9408.1589885192589031748
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 03:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Twi7IWFJ;
 spf=pass (domain: windriver.com, ip: 40.107.223.84, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A90WNry9sZHxkJAqQsA37F3ooZ90x/p8R7wartueZc6y09ctxBKJq/D8XaW6gweXJM09QZdqovHnsMxv57QXAbDGkTUD3j+UMdPaU8kW68ZCWT2X///mZiMR40bN/21esArmrU71m0Z75gZecXKaz76aI+zga0S7TTk9+z0j6+VoMa6WXY+FBqLqNr5XbhZwvz+XWRg5Drck7RhBayAmT2FxfHy0naOAix9br0tWvsxdjUEVrdkmxFVKlwoVw40AdPQv0SfYto4gqxNlRkOP6y6F1HJwekoc6ixd4QIhXS6cyF1drOejAP+/8Gj0wW2bUtFRvHM3sTcJTiJN9Z8YXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srmr7IZLMKeQMPTYzDQCYZDr94z+aqUTGFbq9O4DcJY=;
 b=FRSRxkMebTc66bqXoph7cuCUoSuKZyADI7BWMCPa2rFofKwcre2IW8rBv+kpEF9BK98YJmnMoFWE6XgnqBq49v8t3VsgOx1pnPF/vHCmOcif2oTMLSZNj4WsSwd5cBQb39ukSoXgJaCgZEuKWa9s4tryR3pX8vaXiqE0pBIbhBCabgsbqnfq0VHJT8BFZJboHKJ+G5XYP2FgLsAdrsZdEuQkx6nF70c06DZJ/kg1zoPk3KMDth0F6cZObhCyiQ3NOdlVDMq96f5+MitrzofszBr/W2T+NwbRwjVvkAnsdxU+9BqjSnRfQowZDvgw4CDX1o7saev3nZlL1MQGXLeWDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srmr7IZLMKeQMPTYzDQCYZDr94z+aqUTGFbq9O4DcJY=;
 b=Twi7IWFJ0QO5r9oh9IUZyKitWUmNWQ+7ppPkiOKLYklUrGG1jsVS5/6iTwfsPGUIMZSe0zJ1Bw4G0tBwLUN0x/0KuzQ15Yczefnmskxkm8hTB6tuC/VJnMMgPvXrw1m1Jea5ESFZ35KBHqHxog/mJRFSJ8E+NNrMYi/787Dz/zE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4369.namprd11.prod.outlook.com (2603:10b6:a03:1cb::25)
 by BY5PR11MB4244.namprd11.prod.outlook.com (2603:10b6:a03:1bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Tue, 19 May
 2020 10:46:30 +0000
Received: from BY5PR11MB4369.namprd11.prod.outlook.com
 ([fe80::1d54:2958:2ac7:8fa0]) by BY5PR11MB4369.namprd11.prod.outlook.com
 ([fe80::1d54:2958:2ac7:8fa0%7]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 10:46:30 +0000
Subject: Re: [OE-core] [PATCH] classes/image_types_wic.bbclass: fix racing risk on rootfs
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200518160003.7429-1-hongxu.jia@windriver.com>
 <6c522a2f25257552f6970fd6d722f9e5db90dc17.camel@linuxfoundation.org>
From: "hongxu" <hongxu.jia@windriver.com>
Message-ID: <ddd6953b-2dd3-46f7-4927-98193653c441@windriver.com>
Date: Tue, 19 May 2020 18:46:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <6c522a2f25257552f6970fd6d722f9e5db90dc17.camel@linuxfoundation.org>
X-ClientProxiedBy: HK2PR02CA0210.apcprd02.prod.outlook.com
 (2603:1096:201:20::22) To BY5PR11MB4369.namprd11.prod.outlook.com
 (2603:10b6:a03:1cb::25)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.148] (60.247.85.82) by HK2PR02CA0210.apcprd02.prod.outlook.com (2603:1096:201:20::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend Transport; Tue, 19 May 2020 10:46:29 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d858abe1-a270-4491-1c37-08d7fbe1e386
X-MS-TrafficTypeDiagnostic: BY5PR11MB4244:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB424428386FED5467C5BA351494B90@BY5PR11MB4244.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 040866B734
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ze/G5/9TWJqso+TiQi6s6dxgMgZXugI1rLIqE8Y+TqPLAPuzz3bVa3EcthjXoOwRN2lGKgZtqb0TcNJvd3Dsl1rUz+zd5s1KmW5SBIVxQqzmK4Rhwx29SVChCL5EZjzY34jtkJBXKL7r6VnoXpHBWWS8rxspydqZeFhWpJR4KhyyHECkD8aODpdstW6ttm8SsrHclchSfbYpalK1XKQUPpLI1QH/rImTecxz3dyIAcAJjWZcKV1MtSlOg8FnGaPYjKxhAOAUdf55ZB5aHHDhIc7yk4gNnzPVd/5NCoiCYLbP7X1iyuMBtHEzAxM9MkUVCBsT9wl0X9jh57aDMl9z12bUPYU0vxY9nuecN54MmTh0kma3Q7cZXeeXKS4tYg5MMKI1qgsft1uC3QAMJw1LtS9rJ+46hdMwj1LXXpbi2Qjgo7HOJaN3pO0h5Vtb5zioCWsZIvQh4P9IGnxxyvxkVZUPuITWGKssRcXAJqqQdvVIzdCMYRL2/eo3ZAzfQUceuzROjxEo5njLmXOfAzpYVLmQV7H43fqp2rSDJWMWn4vArg7TO+YRGOUYRM54Cg/eHHRAKRYj1DY6jlysigMK+Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4369.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(346002)(396003)(39850400004)(376002)(366004)(44832011)(31696002)(8936002)(956004)(2616005)(52116002)(316002)(6486002)(8676002)(86362001)(2906002)(6706004)(16576012)(53546011)(31686004)(186003)(66556008)(6666004)(66946007)(66476007)(26005)(16526019)(36756003)(5660300002)(478600001)(78286006)(21314003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	e2MSfQb/c1+8zlg/+tssvCAlmICWdu1O3SVIN1199zECCb1k018suB6JglT7Wfkr/LvSDS/m4FzaMQ6tnL7sqaZlQ5QRujHVy64e6WNEXr89CgVBdOU39oHwL+EmpZh2EzUPU8sRC46WVHTArH6xQc7k6wlJq7ERVDA3zdA83SX3oBNnVXewb/EPRjbATMga4ER+slhjjEIpu0dFESt3tzli6iOQvsTUb1qEIJ2yy8i6M5NFL2UuAobsGBUHfOEEhIvVw2H8cUlYlf+h/wAp4wTzUdtBE1ZYLBDa6oyyOCXsZ7cra5RmJ1YM6ywMkVblJV8VHvwwHR1VV9XHcasiWpDT2TX5bKkr6IKWNqyCkWoIjDeFgbvE6D6gKJTQo5F3vgKuf62G8wLGPKh4LS+lSuSEO3/jrfHXiTMh1guSxZcSCBM436JqTJehuKRJL+/fygpI2Vs2gxC0v/EXKzXv5xec4rNqRaDaR+Ng5nDFr7U=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d858abe1-a270-4491-1c37-08d7fbe1e386
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 10:46:30.3532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0TQ+rUmhowdQSE0B1Sd7Pukrg+IarNjjlNy9TSuKRYrIVNy7Ya7JEB3xKyOOY1jNJlPRnTh8xPyJoCVHv5rAY/dN4E+4tVDC6bR68hEr4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4244
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 5/19/20 6:19 PM, Richard Purdie wrote:
> On Tue, 2020-05-19 at 00:00 +0800, hongxu wrote:
>> Since wic image creation will temporarily update rootfs/etc/fstab
>> to add UUID (*temporarily* means rootfs/etc/fstab will be recovered
>> after wic image creation), there is a potential racing risk with other
>> image creation (such as tar, ext)
>>
>> Such as UUID was unexpected in tar.bz2's fstab:
>> $ cat unpack_tar_bz2_dir/etc/fstab
>> ...
>> UUID=3D219B-2933 /boot vfat defaults 0 0
>> ...
>>
>> Explicitly make do_image_wic depend on other do_image_XXX (listed in
>> IMAGE_FSTYPES except do_image_wicXXX) to avoid potential racing
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/classes/image_types_wic.bbclass | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_t=
ypes_wic.bbclass
>> index 96ed0473ee..79bafeb818 100644
>> --- a/meta/classes/image_types_wic.bbclass
>> +++ b/meta/classes/image_types_wic.bbclass
>> @@ -25,6 +25,7 @@ def wks_search(files, search_path):
>>  =20
>>   WIC_CREATE_EXTRA_ARGS ?=3D ""
>>  =20
>> +IMAGE_TYPEDEP_wic +=3D "${@' '.join('%s' % r for r in d.getVar('IMAGE_F=
STYPES').split() if not r.startswith('wic'))}"
>>   IMAGE_CMD_wic () {
>>   	out=3D"${IMGDEPLOYDIR}/${IMAGE_NAME}"
>>   	build_wic=3D"${WORKDIR}/build-wic"
> I thought wic took a copy of the rootfs which it could them modify for
> this reason but I can't find the code which would do that.

The is my v1 fix for this issue long ago

--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -26,14 +26,21 @@ def wks_search(files, search_path):
 =C2=A0WIC_CREATE_EXTRA_ARGS ?=3D ""

 =C2=A0IMAGE_CMD_wic () {
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [ -d "${IMAGE_ROOTFS}_wic" ] && rm -r=
f "${IMAGE_ROOTFS}_wic"
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Refer oe.path.copytree(src, dst): $=
{WORKDIR}/rootfs ->=20
${WORKDIR}/rootfs_wic
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p "${IMAGE_ROOTFS}_wic"
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tar --xattrs --xattrs-include=3D"*" -=
cf - -S -C "${IMAGE_ROOTFS}"=20
-p . | tar --xattrs --xattrs-include=3D"*" -xf - -C "${IMAGE_ROOTFS}_wic"
+
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 out=3D"${IMGDEPLOYDIR}/${IMAGE_=
NAME}"
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build_wic=3D"${WORKDIR}/build-w=
ic"
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wks=3D"${WKS_FULL_PATH}"
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -z "$wks" ]; then
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 bbfatal "No kickstart files from WKS_FILES were found:=20
${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUILDDIR=3D"${TOPDIR}" PSEUDO_UNLOAD=
=3D1 wic create "$wks" --vars=20
"${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o=20
"$build_wic/" ${WIC_CREATE_EXTRA_ARGS}
+
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUILDDIR=3D"${TOPDIR}" PSEUDO_UNLOAD=
=3D1 wic create "$wks" --vars=20
"${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -r=20
"${IMAGE_ROOTFS}_wic" -o "$build_wic/" ${WIC_CREATE_EXTRA_ARGS}
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv "$build_wic/$(basename "${wk=
s%.wks}")"*.direct=20
"$out${IMAGE_NAME_SUFFIX}.wic"
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -rf "${IMAGE_ROOTFS}_wic"
 =C2=A0}


> I think we should teach wic to take a copy (using hardlinks) as editing
> files in the rootfs in do_image_* is not allowed. By using hardlinks
> and putting it on the same filesystem as the original (rootfsdir +
> ".wic" maybe?) then it should be fast.

But it does not quick, just a copy, no hardlink

I guess we could split the copy operation into two parts,

for the editing file, we copy it, for the others, using hardlink

//Hong
> Cheers,
>
> Richard
>

