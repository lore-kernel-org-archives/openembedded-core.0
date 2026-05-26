Return-Path: <debal.ghosh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66BBCD5BC8
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 08:05:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32365.1779782722305391319
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 01:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=OJNukVKH;
 spf=pass (domain: intel.com, ip: 192.198.163.18, mailfrom: debal.ghosh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779782722; x=1811318722;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=PRflGEqy8gydqoXYH8C6zDSGFtu/Q9uOcRtuUder6x0=;
  b=OJNukVKHC6TtWYkNUbgthteB4DfOYV1JJhyoJcn4CSBegTio8pFM2cOv
   e3WQX6bB0fyzeUiTP4IwL0MIbt8rJfFR/kHnIqo3Llf3aMs7sDeLZQeFz
   kQtC38J8yUq0bwUunnyqADpjLqdf5+EmI1jJg2Z0kmnRSAKoL4GQSlnJt
   wvx2tTN9zxndPoNi7U5SfLEOKNFhwHGuI6iKJObS8bjRIwEXdygfW6Xwm
   V7NjJyfvrv8v0HFS51weOZdg1siyrQ0JUo9pVydbooIGNmtkYU1U6NnCn
   MHxsphY/tVplZ2UHwKDG74IAX8+aBZ0cgVo7LHApIHevgZf5hRvug3k8f
   A==;
X-CSE-ConnectionGUID: Gd3aTR6/RHC3vG6eV+qR7w==
X-CSE-MsgGUID: +GTW+VVcSZ6a7C8Y0UYJWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="79736396"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="79736396"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 01:05:22 -0700
X-CSE-ConnectionGUID: GtGAitt8QfyJI2N+mjSTWw==
X-CSE-MsgGUID: bxoP17wuRiiYZcFg5h80JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="239247760"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 01:05:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 01:05:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 01:05:20 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 01:05:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iert8WDv6zkNIE3z4SEoMZlAWyzT44u6JrPv+1/rbNbqjCCP8weV2DatsGPR93V2V8ogH7Ri8BIQWQOxoLiYspq7NFF39N3kWYiNg3Ztn49dDq3iJws/xzcKm8ooCCrQ0ktqclmsF0rUYmFyMKmSCCV1G7baphdCECo4N5dGUZsfogawwmJ29Av71bUk0K5qRThZhYcXBnK9a+YDQes7iKW+m4dO/X0wMzbV+JUJrDinWA3hrnrHeubZ9eTrxM9bmmlLZDIuc4b2OE3++qy3Rdp8sx1NeT1Pe7qjfvaNeiV1n10hIoEWTqM2iHXxFcdTsMOo5+NlPRgiC4aVC9w4yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZ0gQTykJuwJZTSEKwFqw4m3EnsZ+3SIglJPR586OAw=;
 b=XIxbZrtZ5dt5v74f5N8ucXzColv1cXGvfv1iYntOllgtLyOrtKf+oUPmpFKRtRVseFkvnIs4c7lArXUndcMPlihr2uATZ6pZdnuRbU99bxxA7UMb5D0mC5J1XvC5+3HYyrCax45fXBOXI8z7REE3H2v+6vHrtkh666kEa2NQF1M8QPyz9DsR89X0upcMFhoW/m8wVd5PASG0spMDCy1EIxOqQ80br3P+8xL3KATvU3RBH9Fe7KuiOSn3znByW0Cjjx1ws5BxqbBlaIEMsCRxLVQoZLv8u+5sZj6iQBvy25OeYirzybMDXelF1v9eMqN1lUif13BjWS5pu4qJe4Oyjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7029.namprd11.prod.outlook.com (2603:10b6:303:22e::14)
 by PH3PPF801A91A7D.namprd11.prod.outlook.com (2603:10b6:518:1::d34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Tue, 26 May
 2026 08:05:17 +0000
Received: from MW4PR11MB7029.namprd11.prod.outlook.com
 ([fe80::a9e0:9ba1:3d89:fb38]) by MW4PR11MB7029.namprd11.prod.outlook.com
 ([fe80::a9e0:9ba1:3d89:fb38%5]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 08:05:17 +0000
From: "Ghosh, Debal" <debal.ghosh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>, Yocto Mailing list
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Pokybuild User
	<pokybuild@yoctoproject.org>
Subject: RE: [qa-build-notification] QA notification for completed autobuilder
 build (yocto-5.0.18.rc4)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.18.rc4)
Thread-Index: AQHc5IXXglR4+sO4b0mK9K39TQaN17YgAtKw
Date: Tue, 26 May 2026 08:05:17 +0000
Message-ID: <MW4PR11MB7029E91B5B155C694DC3FC28F40B2@MW4PR11MB7029.namprd11.prod.outlook.com>
References: <0101019e2c6a472c-e8f433d6-8561-4b8f-a64d-9901c9195493-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019e2c6a472c-e8f433d6-8561-4b8f-a64d-9901c9195493-000000@us-west-2.amazonses.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7029:EE_|PH3PPF801A91A7D:EE_
x-ms-office365-filtering-correlation-id: cb5b55cc-2788-4423-b55e-08debafd8636
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|56012099003|18002099003|22082099003|38070700021|11063799006;
x-microsoft-antispam-message-info: mFdftdpstVtl+L+aL4UUIZUnBjdGqhSl6nz8Beqs/gAE1qpbbWQaCBCiXbEAZdR66uqkpn3StOq5NybRkAr1QUpDdzCUi0WTdov+5b0tFp2swgJrUuK+4i47esYppHFfwUUWf8gUUG1D9B/6LNrJwuzDYT4PhvNMFZMEouHsXagjDgR9w/4f+R7JnHpw0QH7M+f+gU9X4OYXLna0v5xtvn3lafHGLyLrHEY/baeLJ8GU3MrOguW+SzS4GYIfKwwIB4z73VfTyKmbS1UL+9D55pYPidyB7bk+Q7EdCI9GmsT33vfJBOoChZejVhIkLUK6vfs1jrLMQ7Pr85AqwHL2qAejirLP1NSSEFPZGWJ6HGN2uHJ4cReVeIjpGuM2BoKFycxWS4WmimDKIzLeVhIQ/dZJ0w3KrzFaTGu5cq3goE12QtoTMa3rfGsB6uvqqJJYVu7ZWfRHI5AcuJitq4l9p0T9Z/k2oe0a6UmtvJ/6YUKuoLGR6auSO+BfvzLN2R9j7qrIDTV7Yb8xM7bm4pVs3Duqh3ebmAcFeCOvw2pSTvwMW3QrlGIOYMgydhsug0BC7NkjXtmX81XqHEsO3OH42e1UB8+UlMDnxIQx8sOoC8ivRFCdmz1qdQizCQBjocRMiyM4iDVeixp1L3v8XlPx1hFoYjWUfITsQGIc8wu09bm/YIa4TnyixRVvhixK7F+FXasGo93f/X6foE9R0/XmDA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB7029.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(56012099003)(18002099003)(22082099003)(38070700021)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cFTLSz50W8xEz4cI7WIzd2WCq+e2fH89d3TJ/t2lRr+v+v4U7M9H91bRHIXB?=
 =?us-ascii?Q?TenqNAyuftW7P1vQc7nn7QScsoVbhExq240h5wUmYceCIzzk4TiRNEYk0BoG?=
 =?us-ascii?Q?uuiRjdtMCJvqh3jNd6GUyxZThwar32o01iWgI92XGKrKM3t3/gdLwhJrF4nf?=
 =?us-ascii?Q?D2f2w1x3O5oXK7e0DkOJpoARc4HisNAMla4M+ODYLR0wXfBz9zuOzvwGu0OM?=
 =?us-ascii?Q?uWahPxLIQ3RjpXAfhJZeGJgkkvH4AxzfqHLZyTrfdFofVnKhSCknY70livIg?=
 =?us-ascii?Q?nBvLlCODAjlCBMt20Lw9oYC7JA4ugfLdZSUHFt+tja+rJtNDCe52rf15zx14?=
 =?us-ascii?Q?kujZxno3zvFAav1lfKceYSkCHzeju/JmXAMW58NuGUY3tZhB8TJuo5IQfetm?=
 =?us-ascii?Q?8gl0BnAj7puu5mZy/hvFg75pS0w+F+raZn1eKgHNnubh5/tfa08kLTX8Ls5y?=
 =?us-ascii?Q?kAnq+msK+qfaVIsPqT+fGP6q7ONskWSbOY3k3Zn6ZhFx+LoHVLj+SNBOaTlK?=
 =?us-ascii?Q?BIR+WooQmucqCsXwM6ubGb+xg2B9ba+Nkg8GhB2lFyf0y+u9WPKjOFsOj1m3?=
 =?us-ascii?Q?fy1ng7t83ARQx+hgyZi0NulYKvRz4ragaJgaWqBCtrlRnhYk6TrwnJwnUx1x?=
 =?us-ascii?Q?yu1PmMpwLHYwDs1YvRWAIwqdnRH2xcIYNH8fKWD/tAEi2XUomiAzQDheIzlM?=
 =?us-ascii?Q?nXiethng1FC0CWZMsIEVRyXTsQhZSKwQg6z4/qBQzUv7/3kROJyz1yA0nMQH?=
 =?us-ascii?Q?WIyae/JlEMH3OamgVpK9y7Z+U44naAXAQi0pSPmVX9aM1nxM5epnSiR43wMm?=
 =?us-ascii?Q?X0lcbfvowy3eliWnWjsl9fofTQFwL8cjviv+S9eOGAjhxvW6kYtkifoIy43X?=
 =?us-ascii?Q?nvSTzVXGbDaEdnb/W7xJP+rbtKev0mCFeMTFhvLUYwrjb0Jb5RO1jUtb5r90?=
 =?us-ascii?Q?urZlESYRwLEU0a2oC4l3x+/jBvbubWcU1fI+sA/A6MWnmeOk0oumvF/oyc1C?=
 =?us-ascii?Q?43P8SV6IIU/upQqM+b/N0aTCPdJxBhiV3mRw69V/GmkrRcvppr2OEYDyyAwm?=
 =?us-ascii?Q?64azdX961HNoR7jLSAU5yz9AimYkxZyoc0qA5TN3DDuhdvpWVB5yAcMCXDnZ?=
 =?us-ascii?Q?IPqzhHTfvEibBClqRBRX6pIkrFmN6MN3Z6/sKFKzcpSlnN+kuWCvFnW1l/yU?=
 =?us-ascii?Q?8alN/CSfx7lD41ZixjuoP9NPztwqynQPQxtOKDOlQk2Kcwk1WbcK76YZkmUU?=
 =?us-ascii?Q?y+nC1XgSGPZKMGSTatHTPVisbilZPpJmeBCs49LkdzI00v/+97EdWTU9MN2Y?=
 =?us-ascii?Q?RcTa6R5/FwfdYLsliVtx80XpqOUiTOfC4CoL5+JGLnm1ZG+eunDrDfVnmrDh?=
 =?us-ascii?Q?/Bow93IVV8gIUiB+Fikl+9+TdaKd791FMa+3w52WQP/O3yBbI61fLCrzaMFS?=
 =?us-ascii?Q?mz593N6uPwFvlm6nQ9pA1/N/FAC6D1/fPv+iYMpF3CMqaz0gP66I939JhSGA?=
 =?us-ascii?Q?rprgNkw2PqDH2cdw/TUbV99XiBaFmlf6PN4UOXi8ICOjuJr7hpUCw4QH5G1q?=
 =?us-ascii?Q?HTpERBsMn68t9YshxTMNEcCcp+WfkTTNEBSQu3drsv0wiUDhoI7EsBnfQRC8?=
 =?us-ascii?Q?2SA7p0Zvoy9NmEC1mOVmo+xOj/AnTdb6wrZgGkfrnLS32+li7Akvl7LTtfHK?=
 =?us-ascii?Q?F3+qxzQSNaHeR4UxkbsSYEcDg1gKC8H/XmTF878ROTcPiCabzkbxzZ23wNJZ?=
 =?us-ascii?Q?kp09X7eX6A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VHNXPr6OiZSjSBbz5vtRkrF+j34tQjdIatE/EnuH/vNXFSstlL3+7qn4eBzs770HvxMIe6JRUgDvM6frC0hAMboc8XVnUmvWJ8/RREJQTL2vyAbU5KiyV9dUfgo/xgOT27tpp78PqR9tZa+QLZzjosh+QNNeiefWw3rgm6gbUDlX1eJQBJVBRFGi7B/zhGwZU/L/Ie3xsIx8c7L+j+SIwG2c4yooLi4+CxYwaHStQR16LuF2v1FdKuiEUxOe1AeuJMF0OSv/9w8QoABLzCF4DePhaO+IffJJOhl+1hpNzgeKPKQfTnmmX2PilNpCo0bQAUAKVo8dvo74ZViqZvP+DQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7029.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5b55cc-2788-4423-b55e-08debafd8636
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 08:05:17.3984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JVI7b3STkXk6se91ZsVcqYaKzKyits1InR6tuvcBUcC1CSw2I07GgDHMnd5A5CkgJILOX7ull6LEWQQYOtTQSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF801A91A7D
X-OriginatorOrg: intel.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 08:05:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237588

Hi All,

QA for yocto-5.0.18.rc4 is completed.=20


This is the full report for this release:=20
https://git.yoctoproject.org/yocto-testresults-contrib/tree/?h=3Dintel-yoct=
o-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

No new issue found.

Thanks,
Debal Ghosh

-----Original Message-----
From: qa-build-notification@lists.yoctoproject.org <qa-build-notification@l=
ists.yoctoproject.org> On Behalf Of Pokybuild User via lists.yoctoproject.o=
rg
Sent: 15 May 2026 21:44
To: yocto@lists.yoctoproject.org
Cc: qa-build-notification@lists.yoctoproject.org
Subject: [qa-build-notification] QA notification for completed autobuilder =
build (yocto-5.0.18.rc4)


    A build flagged for QA (yocto-5.0.18.rc4) was completed on the autobuil=
der and is available at:


        https://valkyrie.yocto.io/pub/releases/yocto-5.0.18.rc4


    Build URL: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/=
builds/3834

    Build hash information:=20

    bitbake: 82abbfcdbda949851a03bb2cb2049ea689564ad6
meta-agl: 5116ec52656f7c7dd78b2f60326a0bdb984aa663
meta-arm: a81c19915b5b9e71ed394032e9a50fd06919e1cd
meta-aws: 437d3207ee2ca178a98531b34c0d9623154aa059
meta-clang: 5bce7e26a38a58bb52242494e54ab2af40009574
meta-intel: 5d153e35b4e752505efeae368f188fac5e31cf33
meta-mingw: bd9fef71ec005be3c3a6d7f8b99d8116daf70c4f
meta-openembedded: ae7dfb12245c7f9b9a353499e2688015bd4e6413
meta-qcom: ec80a36bce11d8182b4bb2a6fa0359adfeccde0a
meta-virtualization: 8409bc0c8b9209327add72d8fa72571cdeb5521e
meta-yocto: ca5a51aadaf651881d640688dc3e1e123aa30bf6
oecore: ece80784b493c8b7493478fa2ba0dc1d6d80aa79
poky: 44dcf08572ce391d7c0df4f8c7510af5e096baca
yocto-docs: 1c5e7f136d7460fa5ad4c8a49ab1de31bd670e59


   =20
This is an automated message from the Yocto Project Autobuilder
Git: git://git.yoctoproject.org/yocto-autobuilder2
Email: richard.purdie@linuxfoundation.org


    =20


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#710): https://lists.yoctoproject.org/g/qa-build-notific=
ation/message/710
Mute This Topic: https://lists.yoctoproject.org/mt/119332379/9976127
Group Owner: qa-build-notification+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/qa-build-notification/leave/1=
4426999/9976127/44033455/xyzzy [debal.ghosh@intel.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



