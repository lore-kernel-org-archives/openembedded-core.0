Return-Path: <eero.aaltonen@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907CAC433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 09:10:59 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.77])
 by mx.groups.io with SMTP id smtpd.web09.89854.1638349856415328960
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 01:10:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=VWaTKoJa;
 spf=pass (domain: vaisala.com, ip: 40.107.7.77,
 mailfrom: eero.aaltonen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjgkixU9kHIUWPI7ppcyG7743PfIab3LNMz67WJHhIVoNkb3g7sO0V1lf7xo54Z/qM3fkbji3H3YEJIwRbgmfb5xomFvVeLjTF0jfXiMQvE+p2VUJWFbuLDz8SQRhXQR9yYy9MPxflX5ttkVKrGMDBbSyHwp0BDF0FcBBUbyEvpCaq/eApgmgf8K5upkN5OK8orxiukn+s1P2hFMEFtj4AEq9nOLJ3qVU5ZjNU48i7NfofjVtYqzBpAVSmyl1+PImh+OkeOCqEF/naRmVgJo5ZLuI64kuiSvMc0CYTcc1NNqiYltHraWtnCzirmt39Rg+0nu2PoLrP2EB3AiK4Tw5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoM9KhvpLLkKXUNsmP+Oltn/mplm0xQ1MPiX/5G8ac0=;
 b=IpZFvsXa+fBTu4VbY4kmNYl0WNhhKphCZACe37Q4ieZ67UuscIBF8jJAgdYgw+LqxRaMaUcWGJnzrk1JFccijBWKMx+lzkL6IDMjokdqTXAs/lOfUTe7zM19OwZYXXmkLhBePhDe6fL3h2nQRQUZOJr0pn2XU8xwcGhaccJHjnwx8jp71e/qRMUBXt5uaVMEvhlDojpCW+G07Bi0Qs4sdODd4fSAxhBeOOkJxsI83IkaHlKSBi99RKfKHE/9oATa3owL0miQ+aXxR/CY08JQI+eLsPopkpvv9P/jhgUlle/e1bbEEGPvrIbbNJuF+4wy3UZmGlIp334eHf3wvCoXBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoM9KhvpLLkKXUNsmP+Oltn/mplm0xQ1MPiX/5G8ac0=;
 b=VWaTKoJaEP/+qm30+ZlCpwpgFcVnhUNsi64y2DryflcoO4gNoLvecwVWL9+IdgDAmUV2WDbAEAdiiPcEageQRMhv8WS4boiG09wtFiKuvBB3TzFnrZSdpdUdX4qZGCe14X8Ln68w/12Z+ycGH6aLM50Us7/nr6nPH1OAXiob9nOwPXbENzvjzTNwGcaoZHtu7nQt5xYRCss4MUqahRPzDLzYdQv+Y+2Sm+15g8NusRoZEoSnmAwaY3OfF4Qs6/+1cYhtHOlVn/HmPVUSISFftDQNH6NLiss51HK8UHqK0QR0kLfu3ckxZGBznjyJUj16lgJF40SsIj4epJKKJJ0bWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from HE1PR0602MB3340.eurprd06.prod.outlook.com (2603:10a6:7:23::31)
 by HE1PR0602MB3514.eurprd06.prod.outlook.com (2603:10a6:7:89::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Wed, 1 Dec
 2021 09:10:53 +0000
Received: from HE1PR0602MB3340.eurprd06.prod.outlook.com
 ([fe80::d92:5470:cb89:9852]) by HE1PR0602MB3340.eurprd06.prod.outlook.com
 ([fe80::d92:5470:cb89:9852%3]) with mapi id 15.20.4734.027; Wed, 1 Dec 2021
 09:10:53 +0000
Message-ID: <20fea928ba6e67fffae74459223ef5f8ba1d3050.camel@vaisala.com>
Subject: Re: [OE-core] [RFC] meson needs a pkg-config wrapper script
From: Eero Aaltonen <eero.aaltonen@vaisala.com>
To: alex.kanavin@gmail.com, Joel Winarske <joel.winarske@gmail.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Date: Wed, 01 Dec 2021 11:11:47 +0200
In-Reply-To: 
 <CANNYZj9ffMJjzjEOy_T8=WWEj8wtmFEKBHw7VH1+EwCTSjUs3w@mail.gmail.com>
References: 
 <CABKMkPJoE74O2OnAe7WsLSu56Ww4ZfPfxksZ43-Np43otAhRWA@mail.gmail.com>
	 <CANNYZj-DYfd_erYQYNzATL5K_rUMfDrrvzsWD2h0n_=_kXTBxA@mail.gmail.com>
	 <CABKMkP+1pDhZqzGwz-6baUnhEhsOopGonP5d7njNJ0WxsfgLEA@mail.gmail.com>
	 <CANNYZj8+jV09y-p1Fciw6xY_PHabj1DtEdG0ywxGpBOgHrUoyw@mail.gmail.com>
	 <CABKMkP+P1cZbuTL-tDFB-TeLB=AAwCc_zWy_D-+C_cDkz19onQ@mail.gmail.com>
	 <CANNYZj8EGG17430TY6en_xqcixWXTZ0PTgjfwKerre7EN2O+cA@mail.gmail.com>
	 <CABKMkPLw3w+3SSXUVfnKcqfsM-QWeUJ=DpPap=aoXJ=Bt8mD=A@mail.gmail.com>
	 <CANNYZj83cBVit2P32A7bRJizf7AS+3jEcBGS-k83gqy7kRQvrA@mail.gmail.com>
	 <CABKMkP+GsTCFyCqB8RihY+u17Y0bts20OpgaoP0d-hZ=Qwi8tQ@mail.gmail.com>
	 <CANNYZj9ffMJjzjEOy_T8=WWEj8wtmFEKBHw7VH1+EwCTSjUs3w@mail.gmail.com>
Organization: Vaisala
Content-Type: multipart/alternative; boundary="=-bf9Bs6aCF8Xc2Mb+bUuY"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
X-ClientProxiedBy: GV3P280CA0044.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::11) To HE1PR0602MB3340.eurprd06.prod.outlook.com
 (2603:10a6:7:23::31)
MIME-Version: 1.0
Received: from hel-blackbird.corp.vaisala.com (193.143.230.131) by
 GV3P280CA0044.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:9::11) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Wed, 1 Dec 2021 09:10:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe13aeee-9c1a-4dda-cb9c-08d9b4aa79ed
X-MS-TrafficTypeDiagnostic: HE1PR0602MB3514:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0602MB3514477FE3819B586F444286F5689@HE1PR0602MB3514.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XV1NyNFTK5HjxCxA8nTH4Ow19MjWTdABzYhuM0ZJy7gN/oSGK2yU+2HvZ4mdr2gn+mp3SKTBlTerXenQYdmh+rZH4HB2YNeLbO7VkhQ9M8HKWn2+WEYNEaJd4IE9b0y0L441S0ha2CJic1rEn4QRpoVQn4uQx0z7dbp3ZMeUZs6rZ422ZEr1DkRsAk+sIpgKFFveGq6XJYAlYEc3b0n4w8fh1bzFaUJDkGfCv4Zv1IaIWOVAxYcfTtTUB5gKMXhgavcPcRWWQJSUdgqSnqG2h0OVd49Fp8mbtNaUIAOtzF8gOb9kBvAJWKqrm9CLyq0+ptEL+vzSOt8mWsXkAnH27HbQ1rEU/A1G4oyxxV8UHb/PxzPuYwHiPvtPTlfMV/uFV0nMaVQmLXK17CYFEl7wN3sJQ4dVmRYcspSp4lYqt53ySdrxZVc9m82wKWFJWp/5ZjGZyquERQX1u8qQ8tyB0aJcEk9el0P1ZK7yQjOzrnpKtTSsIqmZKQr2mWzXEs5g/7TR+mDbdh9fugfdZvFJrvdBb8L7+RQ4oWkZREWzjfbpU9Z42XaxuLbekUHUxG2EFAcD3y3v/QaAz5XpIvPKfIZuNdIXZpuFDjRN0HR1xHKhLN/RhPTzpGfqqm1rc4WlqlTIKor1bIcVEFuy4QUfWdWYhGjPxdhjMBTGVwSRoKibInqXIr8C5jg6ZFtOwliNnU/OkV0jMMfU7e1Smf8WlWX3FHM16EHNCiNWmQoJrS+j54OckB8C+Gzf8RJkCesXb5vGy+sle8ygGm6EepkO1enTSbRfLYnIqlELdv4+QN4p1sGVFRIL0qmMNdJtFdfFa5cCYuj5Y9kgI/n9J/16ZVHGY1VjuZvFxMo1IN9Gi7vj9qn1j1qf4jpLp5QxH/VV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3340.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(956004)(4326008)(83380400001)(5660300002)(36756003)(6916009)(66476007)(66556008)(166002)(8936002)(2616005)(66946007)(6666004)(8676002)(44832011)(508600001)(21615005)(84970400001)(966005)(86362001)(316002)(53546011)(33964004)(52116002)(2906002)(26005)(36916002)(7696005)(6486002)(38350700002)(38100700002)(45400400001)(99106002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YlZCeFpmYVgzUGl4UUpmc0lTSzlJMnIwRmp0NHp0ZGpKRGVnRHVQNzNlR2Vw?=
 =?utf-8?B?ZEhkemhnWUs4dlExVmduRDJRaEROQkFVbmw2RDExRDBuTUxlS2N3Unp2UU80?=
 =?utf-8?B?TjNTSDVEbDJGdjh6aXBXSmw3aXRaMXYxT0xBQmd2UnlGUkFLbFFvSC9vV2oz?=
 =?utf-8?B?bVBwZGIvc2VXNkRPTWV5M1RXelF0UWgyTE9pSWNwams5WHJ4cHBmeWtseVFk?=
 =?utf-8?B?bHRZbGZQVERRYnE1ay9PSkw2dmNTUjkxbVM1SVh3MkZsb1dsSFR4WGJDbG1X?=
 =?utf-8?B?TkJBTmpEdVJ6cG1hMnVjSGUrUHlubmhPWEdHNWlTcGdsbTROaVNOamdZejhK?=
 =?utf-8?B?NVdpeXBCa2swSjJGVVhoWHVadVJRdEhaV01qMXJKb3ZLcGhJY0lUcDRyNDli?=
 =?utf-8?B?dE03WEdoZjN2Z1BHdWlxWUxoVTczMHNCVzZVaE1qR0ZkNU91dHNWajdZQ2ZG?=
 =?utf-8?B?VGd4VG1nbzhpNjdoWGxGNkdtdUtmSWtNa1dHdXdzTStMWjFhMFRobVZXSjBQ?=
 =?utf-8?B?S3dkVXB6VUF0ODRoYUFmQ0F4Skdnb2JpYjMwNWZWQ2tOZi9ndUVGRFhWMW5k?=
 =?utf-8?B?YjczYmw4M1crVVczM1AzOTEwejJoN0dIMUwyMWRlaG9oQTBZLzlNRGpva29Y?=
 =?utf-8?B?R21SWFJWTVVtTHVUMVd2TThNaGtjWXpxNVdXVW9zdTIyblhMbHZUZW5EWDdj?=
 =?utf-8?B?MWlibTh3Zm1Za1k3bU1ibFBOenhGb3ZmVEtlZXQrSVFlaFlsU0F5RkhSVDAr?=
 =?utf-8?B?OVgvbksxOExvamtXSFcxQ0kvcGlRRGpnSnF6b1B0VlNaM1dvTHllSm9HTVRr?=
 =?utf-8?B?MUZ0UG80L1BPMTJhY3gwa2RsYk11WkNUZ1NBTFNDb3B2TStNZ000ZmFyeGFa?=
 =?utf-8?B?bnRvSG1JOVkzSUtvQVdBeUF1eCsxNXF6eU9nWGFiTDJhY3FMdndRbWh1dXZa?=
 =?utf-8?B?S2ZHU2JIaStlYjdjV2kvVjZaMDlVV20xSWYwWEtGdy8zUzR6VnB3MUhrMGFX?=
 =?utf-8?B?RmtGS2VCeUhkb2lrc2liRG1VVHNkV2FzZUFlOGQxbTM5dU1MWklsS2FmUjcr?=
 =?utf-8?B?dFVHelVDQ2FmelhHc2xIbnkxNlFQaUgxRzBjTjZXMUdPdlhEaG81T3Blc0lz?=
 =?utf-8?B?dFJwdlVGcHJOUEdma2VHSk9BWEJjTE5YNklicGVjU05mMkRBaGRodVh4d0ZY?=
 =?utf-8?B?cm5RU1JDWFNiOVFEMGQ3UU5ndmozQ2l0SW5TSzFhRUZqbi8wTjQrZVBTQ2Uv?=
 =?utf-8?B?QWhFUjlyUnR6aFFGOFhuTUJDaFpZRzJzaThFQWc4aXRtZXFHck5jbSt3MWU0?=
 =?utf-8?B?eU9DQmF3U05KcDdENFBUQU0wVm94a2RTT3ppalVmbHNIMm1wS2hRVk5LbFB1?=
 =?utf-8?B?eCtyTFRkSGNCZktvVEUwcEhWOWRiK1VvR0x3bmdRenhtcGJmYitvcStJNUVB?=
 =?utf-8?B?RlFrd2FXb0FUU3cvR3U4R0tESFJQcUs1VWZqZ3VqQlFQZEdFQjV1Wks2aWp6?=
 =?utf-8?B?VHhQM1FUVHpDckFBNWJRdG1IQlk1RmI4bEo4b2pSc0pleWt0RWR4TE9YWk4y?=
 =?utf-8?B?V2RJeTluTFBBKy9kbk1lSy9vNUQ2akQ2eW0yakR3R1JPNGtsOEF6WGRZZ1lU?=
 =?utf-8?B?YTBOWDIzM0NEa2hwa3owS01uTkwrcVl0aHhaaG9CcmhMRmFKaUllQ0xvY2Z1?=
 =?utf-8?B?M2EvQ0wyKzl6cDR5VG1wd3AwT21oRUZIMHhSbzluMnUrS3cvVXJjUWtBSEZS?=
 =?utf-8?B?anF4cXJEelZKOU8xTTQ5MzgxQWZhNXRzL1k3N0F4SXRLVytQRFkxSlB5Rlhz?=
 =?utf-8?B?ODFNSExJODVzL2NERmliOVNXT0dsd3Y3M2IvMnBPQWxKa3BzR3VjZDJRS04y?=
 =?utf-8?B?enFmckkwNUljK0RFRUwrR1kvLzRYRXdJd3B3YXVFemkvbHZuejlDUVB0RzAv?=
 =?utf-8?B?MFhudkp1dzArc3dpNjRZZWFkY0lSOXpjanRPMmowVDQyQjA1R2F1MG10bHMv?=
 =?utf-8?B?cnBDU3laZGNoUVFYTS8zMWZFTW1FZVo4UG51aGtxbHBISFJ4bUw1R0x0N2tw?=
 =?utf-8?B?eUZ0dlBiZVFnTlRFbW8wUmJ0UTJid1ZzU2NmczhuR0IvZnNldDNJVE0wa1lv?=
 =?utf-8?B?ZUh3blZPV0prNjJzSFlueFUySVJQTmY5NmxWblFVSCt6NVBXWlRWTGtjR2Jz?=
 =?utf-8?B?TWVXOU80ODBtakE4Q2JNa3R1WDdWb0x5UXJmb2o2UWNoSUhlZGlOY3hzUkRl?=
 =?utf-8?Q?Dv5ms789dBrLCCe6PBPXTmnj7R6iyrAQn7nWtEEzDk=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fe13aeee-9c1a-4dda-cb9c-08d9b4aa79ed
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0602MB3340.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 09:10:53.3762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wxDr1TZBxbEzmMvF18nJxSSbba16ocPCIJKfhD+hyIUEXf40OaFFjX05WYn66o++iJJsOv+nuq2JFMRoWNWNZhobObl1qmtG9pc/ziYwgPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB3514
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 09:10:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159020

--=-bf9Bs6aCF8Xc2Mb+bUuY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

You can use `${pcfiledir}/../..` within a pkg-config file to reference
the install path.
Unfortunately the last time I tried it when cross-compiling, the
PKG_CONFIG_SYSROOT_DIR was ended up in the path as a duplicate.

-Eero

On Wed, 2021-12-01 at 09:36 +0100, Alexander Kanavin via
lists.openembedded.org wrote:
> No, it's not that. Even if you pass PKG_CONFIG_SYSROOT_DIR to pkg-
> config directly, it will apply that only to --cflags and similar, but
> not to generic --variable. Try this:
> 
> alex@alex-lx-laptop:~$ PKG_CONFIG_SYSROOT_DIR=/aaaa pkg-config libdrm
> --cflags
> -I/aaaa/usr/include/libdrm
> alex@alex-lx-laptop:~$ PKG_CONFIG_SYSROOT_DIR=/aaaa pkg-config libdrm
> --variable=includedir
> /usr/include
> 
> So a wrapper will not solve the 'includedir prefix' problem, and
> neither the wrapper, nor pkg-config or meson can possibly know which
> variable is a path, and which isn't - the only place where that is
> known is the component that obtains the variable. And so that's where
> it has to be prefixed.
> 
> Alex
> 
> 
> On Tue, 30 Nov 2021 at 23:38, Joel Winarske <joel.winarske@gmail.com>
> wrote:
> > Based on my testing, if PKG_CONFIG_SYSROOT_DIR is set or not makes
> > zero difference on the outcome.  I suspect this is related to how
> > pkg-config is launched by meson.
> > 
> > Looking at the meson source tree, in all ci/test cross compile 
> > scenarios they reference a pkg-config wrapper.  No cross compile 
> > scenario I see referencing the 'pkgconfig' key uses a bare pkg-
> > config.
> > 
> >     cross/armclang-linux.txt:#pkgconfig = '/usr/bin/arm-linux-
> > gnueabihf-pkg-config'
> >     cross/linux-mingw-w64-32bit.txt:pkgconfig = '/usr/bin/i686-w64-
> > mingw32-pkg-config'
> >     cross/linux-mingw-w64-64bit.txt:pkgconfig = '/usr/bin/x86_64-
> > w64-mingw32-pkg-config'
> >     cross/ubuntu-armhf.txt:pkgconfig = '/usr/bin/arm-linux-
> > gnueabihf-pkg-config'
> >    
> >  test cases/unit/33 cross file overrides always 
> > args/ubuntu-armhf-overrides.txt:pkgconfig = 
> > '/usr/bin/arm-linux-gnueabihf-pkg-config'
> >     test cases/unit/36 exe_wrapper behaviour/broken-
> > cross.txt:pkgconfig = '/usr/bin/x86_64-w64-mingw32-pkg-config'
> > 
> > 
> > I think adding a wrapper makes sense.
> > 
> > 5.2 Tool Calling Conventions - 
> > https://autotools.io/pkgconfig/cross-compiling.html
> > On Tue, Nov 30, 2021 at 12:13 PM Alexander Kanavin <
> > alex.kanavin@gmail.com> wrote:
> > > On Tue, 30 Nov 2021 at 21:00, Joel Winarske <
> > > joel.winarske@gmail.com> wrote:
> > > > Yes, if the sys_root key value in meson.cross is present
> > > > PKG_CONFIG_SYSROOT_DIR gets set.  Honister patch I confirmed
> > > > with:
> > > > 
https://github.com/jwinarske/manifests/blob/honister/rpi64/0001-Add-sys_root-to-properties-section.patch
> > > > 
> > > > The issue is that meson doesn't pass PKG_CONFIG_SYSROOT_DIR to
> > > > the shell environment that runs pkg-config, as with the pkg-
> > > > config sandbox test it does work.
> > > > 
> > > 
> > > Both meson source code and its documentation indicate otherwise -
> > > if you set sys_root property, it will get passed to pkg-config
> > > via environment as PKG_CONFIG_SYSROOT_DIR:
> > > https://github.com/mesonbuild/meson/blob/master/mesonbuild/dependencies/pkgconfig.py#L121
> > > Alex
> > > 
> > > 
> 
> -=-=-=-=-=-=-=-=-=-=-=-Links: You receive all messages sent to this
> group.View/Reply Online (#159019): 
> https://lists.openembedded.org/g/openembedded-core/message/159019Mute
>  This Topic: https://lists.openembedded.org/mt/87407703/6584069Group
> Owner: openembedded-core+owner@lists.openembedded.orgUnsubscribe: ht
> tps://lists.openembedded.org/g/openembedded-core/unsub
> [eero.aaltonen@vaisala.com]-=-=-=-=-=-=-=-=-=-=-=-
> 
> 

--=-bf9Bs6aCF8Xc2Mb+bUuY
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8"></=
head><body style=3D"text-align:left; direction:ltr;"><div><div style=3D"fon=
t-family: monospace; font-size: 17.33333396911621px; width: 71ch;">You can =
use `${pcfiledir}/../..` within a pkg-config file to reference the install =
path.</div><div style=3D"font-family: monospace; font-size: 17.333333969116=
21px; width: 71ch;">Unfortunately the last time I tried it when cross-compi=
ling, the PKG_CONFIG_SYSROOT_DIR was ended up in the path as a duplicate.</=
div><div style=3D"font-family: monospace; font-size: 17.33333396911621px; w=
idth: 71ch;"><br></div><div style=3D"font-family: monospace; font-size: 17.=
33333396911621px; width: 71ch;">-Eero</div><div style=3D"font-family: monos=
pace; font-size: 17.33333396911621px; width: 71ch;"><br></div></div><div>On=
 Wed, 2021-12-01 at 09:36 +0100, Alexander Kanavin via lists.openembedded.o=
rg wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border=
-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr"><div>No, it's no=
t that. Even if you pass PKG_CONFIG_SYSROOT_DIR to pkg-config directly, it =
will apply that only to --cflags and similar, but not to generic --variable=
. Try this:</div><div><br></div><div>alex@alex-lx-laptop:~$ PKG_CONFIG_SYSR=
OOT_DIR=3D/aaaa pkg-config libdrm --cflags<br>-I/aaaa/usr/include/libdrm<br=
>alex@alex-lx-laptop:~$ PKG_CONFIG_SYSROOT_DIR=3D/aaaa pkg-config libdrm --=
variable=3Dincludedir<br>/usr/include</div><div><br></div><div>So a wrapper=
 will not solve the 'includedir prefix' problem, and neither the wrapper, n=
or pkg-config or meson can possibly know which variable is a path, and whic=
h isn't - the only place where that is known is the component that obtains =
the variable. And so that's where it has to be prefixed.<br></div><div><br>=
</div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, 30 Nov 2021 at 23:38, Joel Winarske &lt;<a=
 href=3D"mailto:joel.winarske@gmail.com">joel.winarske@gmail.com</a>&gt; wr=
ote:<br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-=
left:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr"><div>Based on my =
testing, if PKG_CONFIG_SYSROOT_DIR is set or not makes zero difference on t=
he outcome.&nbsp; I suspect this is related to how pkg-config is launched b=
y meson.<br></div><div><br></div><div>Looking at the meson source tree, in =
all ci/test cross compile=20
scenarios they reference a pkg-config wrapper.&nbsp; No cross compile=20
scenario I see referencing the 'pkgconfig' key uses a bare pkg-config.<br><=
/div><div><br></div><div>&nbsp;&nbsp;&nbsp; cross/armclang-linux.txt:#pkgco=
nfig =3D '/usr/bin/arm-linux-gnueabihf-pkg-config'<br>&nbsp;&nbsp;&nbsp; cr=
oss/linux-mingw-w64-32bit.txt:pkgconfig =3D '/usr/bin/i686-w64-mingw32-pkg-=
config'<br>&nbsp;&nbsp;&nbsp; cross/linux-mingw-w64-64bit.txt:pkgconfig =3D=
 '/usr/bin/x86_64-w64-mingw32-pkg-config'<br>&nbsp;&nbsp;&nbsp; cross/ubunt=
u-armhf.txt:pkgconfig =3D '/usr/bin/arm-linux-gnueabihf-pkg-config'<br>&nbs=
p;&nbsp;&nbsp;
 test cases/unit/33 cross file overrides always=20
args/ubuntu-armhf-overrides.txt:pkgconfig =3D=20
'/usr/bin/arm-linux-gnueabihf-pkg-config'<br>&nbsp;&nbsp;&nbsp; test cases/=
unit/36 exe_wrapper behaviour/broken-cross.txt:pkgconfig =3D '/usr/bin/x86_=
64-w64-mingw32-pkg-config'</div><div><br></div><div><div></div><div>I think=
 adding a wrapper makes sense.</div><div><br></div><div>5.2 Tool Calling Co=
nventions - <a href=3D"https://autotools.io/pkgconfig/cross-compiling.html"=
 target=3D"_blank">https://autotools.io/pkgconfig/cross-compiling.html</a><=
/div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Tue, Nov 30, 2021 at 12:13 PM Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com=
</a>&gt; wrote:<br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8=
ex; border-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr"><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 30 Nov 2=
021 at 21:00, Joel Winarske &lt;<a href=3D"mailto:joel.winarske@gmail.com" =
target=3D"_blank">joel.winarske@gmail.com</a>&gt; wrote:<br></div><blockquo=
te type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;=
padding-left:1ex"><div dir=3D"ltr"><div>Yes, if the sys_root key value in m=
eson.cross is present PKG_CONFIG_SYSROOT_DIR gets set.&nbsp; Honister patch=
 I confirmed with:<br><a href=3D"https://github.com/jwinarske/manifests/blo=
b/honister/rpi64/0001-Add-sys_root-to-properties-section.patch" target=3D"_=
blank">https://github.com/jwinarske/manifests/blob/honister/rpi64/0001-Add-=
sys_root-to-properties-section.patch</a></div><div><br></div><div>The issue=
 is that meson doesn't pass PKG_CONFIG_SYSROOT_DIR to the shell environment=
 that runs pkg-config, as with the pkg-config sandbox test it does work.<br=
></div></div><br></blockquote><div><br></div><div>Both meson source code an=
d its documentation indicate otherwise - if you set sys_root property, it w=
ill get passed to pkg-config via environment as PKG_CONFIG_SYSROOT_DIR:</di=
v><div><a href=3D"https://github.com/mesonbuild/meson/blob/master/mesonbuil=
d/dependencies/pkgconfig.py#L121" target=3D"_blank">https://github.com/meso=
nbuild/meson/blob/master/mesonbuild/dependencies/pkgconfig.py#L121</a></div=
><div><br></div><div></div><div>Alex<br></div><br></div></div>
</blockquote></div>
</blockquote></div>
<pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</pre><pre>Links: You rec=
eive all messages sent to this group.</pre><pre>View/Reply Online (#159019)=
: <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/159=
019">https://lists.openembedded.org/g/openembedded-core/message/159019</a><=
/pre><pre>Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/874=
07703/6584069">https://lists.openembedded.org/mt/87407703/6584069</a></pre>=
<pre>Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembed=
ded.org">openembedded-core+owner@lists.openembedded.org</a></pre><pre>Unsub=
scribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/unsub=
">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"=
mailto:eero.aaltonen@vaisala.com">eero.aaltonen@vaisala.com</a>]</pre><pre>=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</pre><pre><br></pre><pre><br>=
</pre></blockquote></body></html>

--=-bf9Bs6aCF8Xc2Mb+bUuY--

