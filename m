Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EC7C3271E
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 18:35:09 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.127])
 by mx.groups.io with SMTP id smtpd.web11.24349.1720204500991953477
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 11:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=xuNSmtDX;
 spf=pass (domain: navimatix.de, ip: 40.107.249.127, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDi1Zz3VmWJcI7VE8Zy7lxjaJrGfuQumsI1imjMmPDMfkQzODbI79LwMD87cCFEFNAkAXUSt1HSVfqIBfZR1dd4Q5RSpOzZzBU/XNBKQ6aw4X7dhGvVClXPikKjwxRQAqf0cToIpICO1cOXIzAD3Mlq7uT8KE+K6GDKNCcxrC1iEao2gAFiA3N+il6aFrWlYz4LJv5Ai01cTVpbUsbPoNvZVh0ZXD2HjuabLfOe/UNefspLx7sJG6DAIY9q4pW5troDlHwc7fuxDw8g/SPBDdPYgqUtGlr1DHVESyuHquk/WnLrKHrsM12tjkfByQSwESYeaa6WTH9tnVVoOlPZdYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNPmT82KbNXjCj5yebMn2LM+0cW57oJyxhZYDE4UhFE=;
 b=iDXT0VgCv/E47Fe5UshDYskAfuMsdE4UIChxeGU/G3sLx/wFaVQkhEt7TAtdWwZqYvLX6HOHEj8TuUM2T/5ufj5uXQN/q/gtZqPn7vbdj8H4bmXg8YoTRJOYPTAndzSTCEt7vNBM1nXC10HKLluQf4RBamJNtXixY+/LGMPdofB5eI9EMZM41eZv+aPuJsPdXWI3dupz0/6v6InjLXZyJCFqbgosZpx1+8tAQM9LkpDIWp5EgfdP2yKaI8jLjc3dra05bY3Lf25F/vG205qof0EVCC8wZRSD7SBOKt30oZufpzNfAUVIvwqljGDOvWS3s3mBUgZVLXLv1WYtOwDZkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNPmT82KbNXjCj5yebMn2LM+0cW57oJyxhZYDE4UhFE=;
 b=xuNSmtDXfrSdzsCyKGZKCbbtBhuk/gcTvtZawhYjwI0IWlOPvQofo9AA0epBx07/LxzToVgreHupyJUaKz8hx0Dr5/+Sw3IJvsBiLIimkzFx7h1ihU1pzK0iOTo2KliTvlxwJmxHkh/ONdWgxWE9qzOtz1eFPYThDXTLC9pa0H0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by PR3PR01MB8052.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:177::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Fri, 5 Jul
 2024 18:34:57 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7741.029; Fri, 5 Jul 2024
 18:34:55 +0000
Date: Fri, 5 Jul 2024 20:34:53 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] classes/kernel: Delay module signing until
 after strip
Message-ID: <6ualexsmklcjl6ez6m6knrkntqzc3jix4lgpo5yoi3k5kh2tio@iynnmkehphry>
References: <bc15a9ebae0ad3841ac2be887c288b451426e69b.1720185337.git.joerg.sommer@navimatix.de>
 <CADkTA4O-jWiZHHy4h4qw6TN=HZdvLSs2vdD80pqCjA8CFwnJaA@mail.gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="emxl3iuutlsyxwa5"
Content-Disposition: inline
In-Reply-To: <CADkTA4O-jWiZHHy4h4qw6TN=HZdvLSs2vdD80pqCjA8CFwnJaA@mail.gmail.com>
X-ClientProxiedBy: BE0P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::12) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|PR3PR01MB8052:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bbc090d-8f24-4958-db48-08dc9d212acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dldpdlZXd1ZkWmhWSmp3Z2NBSmRLa3pTQkUrZEM5dmczZlNHZ25QMEFxMVgx?=
 =?utf-8?B?VnZ1Nm5JNjV2NFlMZjhaWUhkNTFySGwvdDViQTQyZVFEZnB4VXRPNWh2VTlZ?=
 =?utf-8?B?YldkKzZldjRzTGl2SGVWdTYxSU5pZktGdzBOV24vWklqbnBYR3k3WmFpTEhk?=
 =?utf-8?B?bVNGQmpFZHlpQ2F2czFIZkh1cFdKVE9sRkVxTk1meXV5WGRTMGplV2RnV2tY?=
 =?utf-8?B?YWFkS2dwZGNoZ0dHdGczaHhIQzRjalBlQmJFZ3kwcXRScTYycnZicTcwejk2?=
 =?utf-8?B?OTBGY010OHpkYXpJL3BIOG13MmRxQ29nNDBOYVlsbzdyZ2txalBlQmtieFVM?=
 =?utf-8?B?bmNZRElERkNwYzdjajJjQ0RYMEF5d3QxSyswVWtETFZMN0lTS2J2ekxHQXF0?=
 =?utf-8?B?Qm92L0kvUzRxQjByd1Z1Z0dYWHBXd0pNSmFXRzZzZmlkNFNBNGhVaG1DODQ4?=
 =?utf-8?B?TWVWQmJpSC85NU1lTXlGNno3ZHVEK05lTFRHaE1nd1A2Nkx6L3dldzRTSktC?=
 =?utf-8?B?VWhaR0JqMXVRZXFJSDRBS1hBVDZDNnE3NFV5ZjI5VGhSMHhZNHVscnFqUnR0?=
 =?utf-8?B?aTZBTmt1Sk5uMldYY0ZpM3ZGTDVESEpodG9JeEJuQWtrcmF3ck9jc2Fhekcw?=
 =?utf-8?B?SmJLdTRYWmYzRWp1NDY3WGlRRWowZjdpaHZHK1hYZkVKSjQwT2RlRkl1VmpV?=
 =?utf-8?B?eHJOVU5yK05SZmE1SE1XNXZXQVFZRWplUkRJeGJjMnZ3NUhtS1h6Vmt1Z3Yy?=
 =?utf-8?B?bUdBbkRpM1NTV0xaZ0JnaDlUUmhSRWZnWG93b1VKYW9UNzBlVUNQRU84NGZ5?=
 =?utf-8?B?RGtkbThqMUF0U2Jkc0JURmxnOUhxR0R6RWNxdVBGUnlHTDlhVndkT0FldHR0?=
 =?utf-8?B?aEhCUkFrV3RQRGVyeHZwMGtCcFFCUytucFNYR282YnE5RjE0czd2azcxTkJG?=
 =?utf-8?B?Q2FyS054MndINkhBbWRuMXdMNGVPdnZuUU81TFdQeWJ5NGI5VVlPOXpSSm1S?=
 =?utf-8?B?Z253Q2NFd0pTTVpqM1BIelQ5aUppcWJtbk1rUkRXcW9ybmpsMUtlbHhsNW1x?=
 =?utf-8?B?MlIyY1c0cExLVDNqaG5UOTdMNzNZL0FtQ0d6R2dnN1lFNXZaQWdqdDFBVnpL?=
 =?utf-8?B?RHJlSjVvbEd0b014YW1KU2owSFh3cEZkRSszdFdtK1RTcmNTUjZ4QWJUOWMx?=
 =?utf-8?B?NlhmZWlRaWJGbUI5SGVVR3lnU3FsS3Ara0xPeFlvdGpMVU1mNStxdEVuZ0NR?=
 =?utf-8?B?Qndxc0NwMVV0TzBHK2Z5M2FKNDBqZGloZjB1dkxQVU1sM3JSR0h0NWZFbGNi?=
 =?utf-8?B?UnVlZDZBbVgzVFdQdUdTeHZKWkc3cnFLeWlrOURxMXR0MEREeHJPN1k3UXY4?=
 =?utf-8?B?RHhWclhLOElyNkE4SGxqUkZlSHlINDFiaS85eGh3cFZxM3k2ZHp6N2d4ZHp1?=
 =?utf-8?B?U1Q5YWcrMnZLbzkrcjBJVjl0c0l0UUp0cVo1cm1QVjZTQ3FkU3UvK0VaOFFG?=
 =?utf-8?B?cW9KWjNncGl1VWxIMzd4M1FRZENKRlV0RVBYeEM5dDNIRnBqMWNOd1dJOFhR?=
 =?utf-8?B?ZlNBeHZOdFkyemEvVXdLdGdyT2E0L1pWeXJmRlpwdEprRFhSOUZHb0ZHb1hN?=
 =?utf-8?B?ZFMvWXVtK25JRWhyUmRsWGlaNzlkU2ZrbTdYMWE2TEVQOHhXY1hZVFlMNVhM?=
 =?utf-8?B?KzY1NTNXOGlUcVVFSThld0UzZVlvaitraTJDdHYrekNYa1ZlYTdDYTdPdUlS?=
 =?utf-8?B?Y0N0SmhEb2dPS25iYXZjV1FBUTdlYXVJejkvZWtmVE1uck9lWXJORVYyMGZL?=
 =?utf-8?B?SC9STVU4QXlRVGg3WWpEZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R0pzcDEwc2d4K3RucVREbis2OTQ1aCs2YWlTc1RrWjZPdjI5Q0hoY1FiNm1w?=
 =?utf-8?B?dXV1TDI2MkRvYkhETjVZYnRZODhpVnNlVDVLdzBDMFdqMU5TUmF3RXNyY0lE?=
 =?utf-8?B?Ym9Ib2RVSzNnc2ZlK2ZuNWlnaXNHcG9TMjFvSDFpNHlWT0EyK2o5S3p4bGRt?=
 =?utf-8?B?VVdIUEVZSk5kT3R3U0NhSFU0ZTRBSDNMK1g4WmM3OXA2aFRhWXlZMzFXc2Q3?=
 =?utf-8?B?NktqM3ZsTkplTjhFTjVFNE5BSklFTjdRa2pRV1doZGtkR0FDTTJMRkRpZmlI?=
 =?utf-8?B?dUE4K2lYVmhicXNOaTlGMVJ1Qktmb3AxNzRDbEE1dEVCSG1uUXNUZjRKemd1?=
 =?utf-8?B?dXFmWGd5QmVxaU9pcG5IdHhEaWJHR3ZNZjJYT2pUc3RnN3orU3Q5VG9lclFU?=
 =?utf-8?B?VGRLR20xc3RNenNkVnhxWW5CUGdTYnpla3RYUUJRTlFQc01mamsreUdYVmxZ?=
 =?utf-8?B?eldWZzMzMDYrZlRGZTRhUVNoN0tYSWYzbE9xSElSWHc3MDBxcnpRakF1a0lN?=
 =?utf-8?B?MmJtRloxM25vNEY3b3Y0UDJYVStzclBhQ0hhQWE2aDJhSDJPSzgyUE1KMm1Z?=
 =?utf-8?B?L3d2MGcvcVNuMnZ1RFBZaWkxN3lQWHhQWlU4ZEp5THhDbnEzTk5VVytoNi9D?=
 =?utf-8?B?K05vYmk5eDZjV1RQMUZlSG5DNUVxNVBGc1dkenI0WEM4UmpJR1pCUnUzaGxH?=
 =?utf-8?B?ZVVtaVFBbC83c2trL0J5S3lrUUJYaWc5SVBEMTFhYTh5am15cC8rSlVRVG56?=
 =?utf-8?B?UzJiQllQVkdURmg3eVNYREhwcmRkR3dMeHpNOXdlcTZVdFYwSkw2elJOZ3A0?=
 =?utf-8?B?NTlXWnlMZnlaeFpEUndCWEVhc29kZElrOW9jYUw4bDRtTHlOOVFka3p2bzdQ?=
 =?utf-8?B?dUZXSUdIcXUyTE9PdEpIZStOZFN4NGx6SHpHNTRaWTZzWENqN0Fkbko2azhY?=
 =?utf-8?B?Wnk4SFYxZllFWE0yN1ZkaW9LemhwYUo3Q2lXQzZ5VEFsVSsvdUsvZWxoRTVT?=
 =?utf-8?B?QVJtZGkxRnQ2QUdlSmJrNHhiZVk0V081OGhmQkVHNDdDajFXcDZNYm5vQjRs?=
 =?utf-8?B?OC9heSt5UXB1SmF0Z0tKR3NMZkgvbDd5b084NFZoakhaajVWWXQvbFNqRjZC?=
 =?utf-8?B?MXFRT2pTMXBkN2laTnhPSWJUMlJ4T1hrdFNYRGs2YmltZllWa1BLRmNPdDhI?=
 =?utf-8?B?Y3pPSE0xVGs4TlBQak51RnllbTkzSGxnWkVhNHRVb1VRN0V6QWR1KzZFZ3Rw?=
 =?utf-8?B?VmJVUWE3RXptYWhjMGtXMVZLTWRVcXhYTlM1ZkJNVS9YK2JIdU5oZlhJNnhT?=
 =?utf-8?B?ejZDdHpNR3E4TTB1dWtSQ3hZYnpTWEdsRUJnSEZ3K3VUMy9wYTZCMmErbmNv?=
 =?utf-8?B?V2RQQnFrQUVWK2RHZWxIREFCWkRqL0hpbnhLZnhlRHd1bTU0NERGYTlNcEtF?=
 =?utf-8?B?QmhTU2dncU9aYWtQckxjRnFnTkdtSjA5TVo2ZzRKR1djWlZNNEpGVjg0S3FC?=
 =?utf-8?B?eVF0cnJPcUdkUWsrcDM5dGN0Lyt5Vnh5eHVzODJVS0M5YjVISVE2aGUwbWI1?=
 =?utf-8?B?czR6ZzN0a0xNQ1AySWxQOTN6MldBQWR1eVZibjQxL1BpcHVlQllVY0p2dUQ4?=
 =?utf-8?B?bTNuZnV2MXBER0ZDMmJRdXVtT1c2YU1mSldGSHBEUmIwZGplb0paVGlXcXVL?=
 =?utf-8?B?UkJvT0pUWDNOcTNHZWxMUklDbHREci9xR2NFZFFHU3hWcmR0SG1CSW5Dd2Rn?=
 =?utf-8?B?OGd3d1k5cFZVOGp6Z2dLaDlmS1pBOHFjd1FhdVJMVWhJRkgyWExudGhPdy90?=
 =?utf-8?B?ODFQb0EybWV0bngyM2Vrblk3RXBkVjlvalNHVDBGakxjbFlJc3Z4SEo4Q0gr?=
 =?utf-8?B?MTc3YlM1N3BkNk1IL0VjRHByaFRqaVR2UDc1ZmlyQXZRSEE3bkhQMGRYWjNu?=
 =?utf-8?B?ZTFHdVhJai9oTnIrb3N1dHpFajkxYUo1WlpmOVk4VlZyRW9BRXRMTzEzSzlK?=
 =?utf-8?B?eWNka1JZUjdQRjNHcjBtS1R0dittampaN2dvK2NNckZQdlRITU1Bc01kclVm?=
 =?utf-8?B?RCt5NXNHY09KUVVWVWwrR1E5WXliSWNDRWZ4ZDZQRjVMUGkzUkdrd0Z6Z3hK?=
 =?utf-8?B?NThKMUMyRGd3Y0pqSmI4OXU3ZkZqaWxodExUdE5RRW5qTGpidERML0NFZlBl?=
 =?utf-8?B?WWc9PQ==?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bbc090d-8f24-4958-db48-08dc9d212acb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 18:34:55.8904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AnnmdkDzBAaWnKdPKJI071ekx45f6BBbDNqSKgCO0sZYRSOoOxFNK8lTfo0GpY1OpttqwJiKPwRaovxFW0jHOqZxsIEQb1F+PyuaWzbdv5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR01MB8052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 18:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201614

--emxl3iuutlsyxwa5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [OE-core] [PATCH] classes/kernel: Delay module signing until
 after strip
MIME-Version: 1.0

Bruce Ashfield via lists.openembedded.org schrieb am Fr 05. Jul, 10:08 (GMT=
):
> On Fri, Jul 5, 2024 at 9:19=E2=80=AFAM J=C3=B6rg Sommer via lists.openemb=
edded.org
> <joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
> >
> > From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> >
> > The current do_package does not strip the kernel modules, if they are
> > signed. Hence, the files in a release image stay very big and the debug
> > information are not split into the kernel-dbg package.
> >
> > The idea of this change is to suppress the signing of the modules on
> > `modules_install` and run `modules_sign` after the debug information was
> > striped.
> >
> > Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> > ---
> >  meta/classes-recipe/kernel.bbclass | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> >
> > Another idea would be to move the code to split the debug info in packa=
ge.bbclass to a
> > stand-alone tool and inject this in the kernel's modules_install.
> >
> >
> > diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/k=
ernel.bbclass
> > index 89badd90f1..96e40be085 100644
> > --- a/meta/classes-recipe/kernel.bbclass
> > +++ b/meta/classes-recipe/kernel.bbclass
> > @@ -461,7 +461,8 @@ kernel_do_install() {
> >         #
> >         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> >         if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
> > -               oe_runmake DEPMOD=3Decho MODLIB=3D${D}${nonarch_base_li=
bdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=3D${D}${nonarch_base_libdir=
}/firmware modules_install
> > +               # don't sign now, it's down after extraction of debug i=
nformation
> > +               oe_runmake CONFIG_MODULE_SIG_ALL=3Dn DEPMOD=3Decho MODL=
IB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=
=3D${D}${nonarch_base_libdir}/firmware modules_install
>=20
> This isn't a good idea, since it both hardcodes the option name, and
> it doesn't allow any method of overriding the setting.

The option name is also hardcoded in the kernel Makefile and drives this
feature. I would threat it the same as DEPMOD and MODLIB.

> > +PACKAGEBUILDPKGD +=3D "sign_kernel_modules"

> But even if those other variables are used, this seems to force the extra
> signing step, which I can say for certain that not everyone wants.

What would be the other option? Having an anonymous python function to check
the .config if signing and debug information are enabled and configure the
process accordingly?

As I said, the other way would be to create a stand-alone tool to split the
debug information and feed this as STRIP into modules_install. But this
would alter the process too, because the stripping happens during
do_install.

J=C3=B6rg

--emxl3iuutlsyxwa5
Content-Type: application/pkcs7-signature
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIITyAYJKoZIhvcNAQcCoIITuTCCE7UCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghDNMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkqhkiG9w0BAQwFADCB
iDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcTC0plcnNleSBD
aXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVz
dCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTgxMTAyMDAwMDAwWhcNMzAxMjMx
MjM1OTU5WjCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQ
MA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVT
ZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY75tqSvysQTqoa
vIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEibivHbSuejQkq6uIgy
miqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHKRhBhVFHdJDfqB6Mfi/Wlda43
zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFbme/SoY9WAa39uJORHtbC0x7C7aYivTox
uIkEQXaumf05Vcf4RgHs+Yd+mwSTManRy6XcCFJE6k/LHt3ndD3sA3If/JBz6OX2ZebtQdHn
Kav7Azf+bAhudg7PkFOTuRMCAwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5v1qqK0rPVIDh
2JvAnfKyA2bLMB0GA1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNVHQ8BAf8EBAMC
AYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQw
EQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9jcmwudXNlcnRy
dXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNybDB2BggrBgEF
BQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNvbS9VU0VSVHJ1
c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3AudXNlcnRydXN0
LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAQUR1AKs5whX13o6VbTJxaIwA3RfXehwQOJDI47G9
FzGR87bjgrShfsbMIYdhqpFuSUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2f102qxxvM3TE
oGg65FWM89YN5yFTvSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGWMeK1w+vnKhav
2VuQVHwpTf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF8Co2AOlVEf32
VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bwc/Tn2FlIl7tP
bDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZGXq6F2nnBtN4t5jO3
ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMGquITn/2fORdsNmaV3z/sPKuI
n8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmdWC+XszE19GUi8K8plBNKcIvyg2omAdeb
rMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4hYbDOO6qHcfzy/uY0fO5ssebmHQREJJA3PpSgdVn
LernF6pthJrGkNDPeUI05svqw1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVvJsmzNicwggWB
MIIEaaADAgECAhA5ckQ6+SK3UdfTbBDdMTWVMA0GCSqGSIb3DQEBDAUAMHsxCzAJBgNVBAYT
AkdCMRswGQYDVQQIDBJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcMB1NhbGZvcmQxGjAY
BgNVBAoMEUNvbW9kbyBDQSBMaW1pdGVkMSEwHwYDVQQDDBhBQUEgQ2VydGlmaWNhdGUgU2Vy
dmljZXMwHhcNMTkwMzEyMDAwMDAwWhcNMjgxMjMxMjM1OTU5WjCBiDELMAkGA1UEBhMCVVMx
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
DgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsG
AQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGyMQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBz
Oi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYHZ4EMAQUBAjBaBgNVHR8EUzBRME+gTaBLhklo
dHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFu
ZFNlY3VyZUVtYWlsQ0EuY3JsMIGKBggrBgEFBQcBAQR+MHwwVQYIKwYBBQUHMAKGSWh0dHA6
Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2Vj
dXJlRW1haWxDQS5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggEB
AANadCCx1OE0/PYv8CMHn1qrbn3u9yIQuut1yAVv1daof2ULxyGOm/M+XnSW1h+xcUukaNTB
qwJx6KTauuWjVL1LRXz9+sNvQfS1KdJF9yfgcCTiIMNjfKap+t/dD275tpVeLbRSWyJaQRhb
GVjarr8yry1mnaaiJqv1TERaHqjDNpEwU/Ex8XetmkdJK01qCP+ZOEHwRr/pEB/oEKYB08+P
CfWWWT0YVlwW3FdYpMi70zyynhyE0ZkxBuwh20CulXlafk9nzu1ly9HDU2MG6fnKLirJLOj1
+9s6RvytgsBtk1dB4lJEMe32RnTa4ABWg2VpdqmG7wjr2BlUCzLzuxUxggK/MIICuwIBATCB
rDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPzh908c
7MYmJwWouN4Q9n4wDQYJYIZIAWUDBAIBBQCggeQwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjQwNzA1MTgzNDUzWjAvBgkqhkiG9w0BCQQxIgQg4LG4+K0V
F4z6tmpEFZHNgeyfW7YeDfjXc92DOJa9iwgweQYJKoZIhvcNAQkPMWwwajALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEB
BQAEggEAf2Zz//QUde0bD8ZzNIWK2MU66RehK4T4VDnm6Y5VRSCycRKSgVCGLy0G5evIFevC
PYRfEMQVm2HJUo0ka/tw76i4rKkr+/nszYA8U8qn1qe6NCrlH9C37gzeBCXIYkaYMpknRfiP
Y0PNUrGYVYE/NW0WK4ZZGWzzCaXHUdIaSlzSZiXVr4JBdMY4LO4cZ6NxBa4Tq1vwAWcyhxvw
vvfKjF7C9+qXPxAWDQf33k5aSPG3Sw8WvXBxvPFc9t32Ki7ojYK7TBbJPB2rgMdyme8EWoCB
fEWE2TcWRWfR4bLZvl29+6as9kIcbUnjxt3jLuths/eEeQrJT+lCQWwtqmD7OQ==

--emxl3iuutlsyxwa5--

