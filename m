Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.45])
 by mx.groups.io with SMTP id smtpd.web10.6422.1592484013184786283
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 05:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mMRkgbZn;
 spf=pass (domain: windriver.com, ip: 40.107.70.45, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZ5MUobN4hWlGEH5iPTvxEzLLTyXJ8LcyAVBomN/jtGSdOIMiAngonU0Jv0WYGNk8KEN1j5I6x71yN/wUwf5xZSF8mO19G0esIwFkHHN1h70wNDSitTu0EzVqUjzcofRI6snH1zO9Tt9dEgtvAmJDxlZaIGWiv+6MQMUfnVuVmtkiJUfwfQt8f+JcoLQLvkvDb/Kfvuk3F9Ocqq8Bu++JNNyZIB92IQsJTw+LNBcWc0nug3HzE72SHKA8uKtRXCYEebQ8+vqovR4VugS34t7MB2oAyk9nmImzMbhiI8r0bO3AIc6PLhhO46JQ1WrFBU7xc/0Ng8JhRHWOrEG+GLAsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDgAh2sAwp1DWgQ9soHGhER82qApmnKBret3rPylKpA=;
 b=h+qlg8wyGEiml4HGGLP/fVGPLS/fAWDWBZnmk5PusW3KmT9+aHTdVgiQ6F3DpZR02wSwC8tmYUEXtURKeV96MyCZUrTSRw7UX8N+T+72EU7qIwnQRh9dGllqPYJlXB8ZY24Nct4SK2+QpD32RsPc3eL89ql/JZEfIfHGSC42WhCfgaml0BHfv9Z+62scA+K5Hxdevwq7gDz9QRPfQ7s8cK7LI0LKUwl5sNFuI7LeIlmF1Ktz5gr/4lOA+TickposVmj1le/8PXaxH+AQ095KTGTbvhrKwqRp3poYnC4G5bXYgaNJhHqk2sMigumsKbj4GevBe5J2CC2WlOFPizrugw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDgAh2sAwp1DWgQ9soHGhER82qApmnKBret3rPylKpA=;
 b=mMRkgbZneugzs3ETJQCHMxg1mx00+irSsBeNpInz0ns2m6dE0AWTZwhY0tzqutCuobXvMpxezr7iDX5aV546FneUAsZlc9kPKsyX/B6DeUW/G99sq7iDaNSn/hSl9q7NLABwL19mTnthXIEdTw73pxA34com4gsROPZXfk4YHzA=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BY5PR11MB4184.namprd11.prod.outlook.com (2603:10b6:a03:192::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Thu, 18 Jun
 2020 12:40:11 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702%4]) with mapi id 15.20.3109.021; Thu, 18 Jun 2020
 12:40:11 +0000
Subject: Re: [OE-core] [PATCH v2] classes/kernel: Use a copied image for kernel*.rpm if fs don't support symlinks
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com
CC: zhe.he@windriver.com
References: <20200618075725.39434-1-yanfei.xu@windriver.com>
 <5e93588e648dfac9263dfc9520ba9b205d933703.camel@linuxfoundation.org>
 <1619A34BFE3B323C.29792@lists.openembedded.org>
Message-ID: <518d51d8-8f64-684c-1e53-2c52334e6e74@windriver.com>
Date: Thu, 18 Jun 2020 20:40:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <1619A34BFE3B323C.29792@lists.openembedded.org>
X-ClientProxiedBy: HK2PR04CA0062.apcprd04.prod.outlook.com
 (2603:1096:202:14::30) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by HK2PR04CA0062.apcprd04.prod.outlook.com (2603:1096:202:14::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend Transport; Thu, 18 Jun 2020 12:40:09 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88980876-b194-44dc-c806-08d81384bd67
X-MS-TrafficTypeDiagnostic: BY5PR11MB4184:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB418423752B7A8F95D9E82454E49B0@BY5PR11MB4184.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 0438F90F17
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	apxgOMgM0QvkXjb4SjYDgrZFEeNWf2Tg9kXvZpvZepno707YQb9kuTY7ziII0oyapnSD8GJfqCZSx8wor+wv9Wn5sLjvtw2wPfADISzatPaomitp6QPd1JNP1fWNR1ajtzR/Ua+dAvGLwSzWLsEkRJlF6+yuh6UIe3dZY44F67i7f7FwGs2hTA1lR3OQayURVvsdB+EA0rdfKMqY547JLlwEAwUrjl+uqDULeolK31nxysZVz3QqLNOEyQtS/jHEa5BahozNzsHvnNzbLo1r5kaSQHAQupmFL1zLNOo0nM/TUUxLVD9TP1qIPnFEqVm3dU6J5SNVgBKzBAQls47vTMG+MoBiKrMfS4++LvQjO5FxUWRIHM1SBsaCn2NgvS97wT0GGLstIXNKLZz29OZTSPMqq2vkn/7v4XsXdu+4TyysZiFkox2bzenL14J/cKtTGZa//azYcF7njNoiMRM2hnM6FKF6xGoR7eyDND32YJFNEDTDl0GQuwttGhQiNuuYU5dhhnfG66bSe1orNVFMIg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(136003)(396003)(39850400004)(366004)(346002)(5660300002)(186003)(8936002)(86362001)(2906002)(4326008)(966005)(53546011)(31686004)(16526019)(8676002)(52116002)(31696002)(107886003)(83380400001)(26005)(956004)(316002)(2616005)(6706004)(16576012)(66476007)(66556008)(66946007)(36756003)(6486002)(6666004)(478600001)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	58bKCrM/iPt4XSu/jMMmEBKZiUvbS8+/R4ZAlSX7EoRza41b2RXZiyPA4yh4pibtfxhyLbMYfoDY40HJDZqbwwTD7lbQq3XiNKxuh6kM9EFhP6Z+u9JiAWf3nfPbLp6uRbigB9lhWafhlM0WSv2Al/dCB/rspRqIaNq+QcSfzcG3jN2YOp7AaPxTS3fvqq8KmV+u/ku4uRB8gLnA6HSio5LJAf16agphJ7J59VyjnYlaNy74j+f+Ege3Nb5KpjW1p45Jp27yyBu33Z/VPtOEaAee7EG5JWA74x9BhPYQqiFkJleq38WDH72dGLWV9yPFoCg5TwWgDNR4hIyOKlXsPv3zbeXYrdC7vGAXlsYjeGJfIFMCAVOWAE+f9m6fAsPtmxRWNYZCwQoMiR4QZXS4i0sy/CHg1on5s4xBEpm8RRnCtrwdwxvfxU+BGZPsd77nu+mr1AWAUw9S9uHZn48lboKoi1EaKHpkWw+eVdw7Zs8=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88980876-b194-44dc-c806-08d81384bd67
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2020 12:40:10.9330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T87pZ8t10SljhnhfwfgW3dbtV7q+9An7rI7SMSBHh17zVXQl7f3tP/9jiKhWRdPrJq3E+bAnRScwwdr+GPLQhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4184
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 6/18/20 8:31 PM, Xu, Yanfei wrote:
>=20
>=20
> On 6/18/20 5:52 PM, Richard Purdie wrote:
>> On Thu, 2020-06-18 at 15:57 +0800, Xu, Yanfei wrote:
>>> From: Yanfei Xu <yanfei.xu@windriver.com>
>>>
>>> Some filesystems don't support symlink, then you will get failure when
>>> you install or update the kernel rpm package. Now we use a copied iamg=
e
>>> for these filesystems instead of symlink.
>>>
>>> Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>>> ---
>>> =C2=A0 meta/classes/kernel.bbclass | 10 +++++++++-
>>> =C2=A0 1 file changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>> index 41101a64a0..749d1a0f29 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -94,6 +94,14 @@ python __anonymous () {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar('RD=
EPENDS_%s-image' % kname, ' %s-image-%s' %=20
>>> (kname, typelower))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar('PKG_%=
s-image-%s' % (kname,typelower),=20
>>> '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar('ALLOW=
_EMPTY_%s-image-%s' % (kname, typelower), '1')
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar('pkg_postinst_ont=
arget_%s-image-%s' %=20
>>> (kname,typelower), """
>>> +set +e
>>> +ln -sf %s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
>>> +if [ $? -ne 0 ]; then
>>> +=C2=A0=C2=A0=C2=A0 echo "Filesystem on ${KERNEL_IMAGEDEST}/ doesn't s=
upport=20
>>> symlinks, falling back to copied image (%s)."
>>> +fi
>>> +set -e
>>> +""" % (type, type, type))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 image =3D d.getVar('INITRAMFS_IMAGE')
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # If the INTIRAMFS_IMAGE is set but the=
 INITRAMFS_IMAGE_BUNDLE=20
>>> is set to 0,
>>> @@ -386,7 +394,7 @@ kernel_do_install() {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for imageType in ${KERNEL_IMAGETYPES} ;=
 do
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644=
 ${KERNEL_OUTPUT_DIR}/${imageType}=20
>>> ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ "${KERNEL_=
PACKAGE_NAME}" =3D "kernel" ]; then
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ln=
 -sf ${imageType}-${KERNEL_VERSION}=20
>>> ${D}/${KERNEL_IMAGEDEST}/${imageType}
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in=
stall -m 0644=20
>>> ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}=20
>>> ${D}/${KERNEL_IMAGEDEST}/${imageType}
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 System.map ${D}/boot/Sy=
stem.map-${KERNEL_VERSION}
>>
>> I am a bit concerned about this since whilst it solves one problem,
>> doesn't having two copies of the same file around significantly
>> increase the size of the packages and the update payloads updating such
>> systems would need? Are these two copies of the file in the same
>> package or not?
>>
>> Perhaps the symlink creation should fall back to a copy on device
>> rather than having the copy at build time (as I understand it)?
>>
> I had a wrong understanding about the no-versioned Image in /boot
> partation from wic. And I just verified that the no-versioned Image in
> /boot partation seems doesn't from kernel image package. So you are
> right, we don't need to have the other no-versioned image in packages.
>=20
> I'll change the logic to having the copy at build time in v3.
sorry, at the postinstall thread.
>=20
> Cheers,
>=20
> Yanfei
>=20
>> Cheers,
>>
>> Richard
>>
>=20
>=20
>=20
