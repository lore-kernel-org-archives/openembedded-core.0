Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5374C4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 15:21:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.7642.1667402470541132111
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 08:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gxtFI+Kq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8305f9fcd3=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A2CKAsu000997
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Nov 2022 08:21:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=aFd6gUjkCkf4yaMTBZbzBde5bIzAcaz74PABOxuO0z4=;
 b=gxtFI+KqL2hLOMDzI497vloq82YWt8i4Ew+z4qyjUk1DPesyaygW+SEOToPzRFBxa/K0
 2dhioYLEcgZvdMkat2ReGQQkNDAJdDVqTdrp1c1cFp9OyHhSUj+FXbmQdPKY+5U8JsQA
 N4bcxij4obE7e4OfqheRwC8zRUFPCUxzPBpOqMTpotnz3WrZgXgrAL4Gz9v1d5VB2rE3
 Ddgn6P+FJ7LpFxxgxcAWEWI69b3/Lek2NHam4ouQqKToaEmVkBtfzP87eOPcHxA/+f5D
 FkQqMqKxnmn4GJcY6t/cZmjIZaDmHGjxgrfYM2evorxf4s+dGneLRTqwpnZziMATZvxX Ww== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kj2gsaff3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 08:21:09 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A2FL9Nh011006
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Nov 2022 08:21:09 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kj2gsaff2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 08:21:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3Ulum0IotsTSF1T9i3MyzTwUz5zOYc2IePwQJ1qSLD3soNu5weqmQTkRmvQSBWp11KOEutbY/Ous7ZPLnpAxdGdrK8OIxen26cVmnVmouBaDqR9zVei/UMS7pVZtEUrkm/zK//t0mD0lWk8a7/fGYVP67Pbqbn65RfnhIW3sUk4UcnJlP8mp7hwrMAub+2rdFPkCevmZGhzJ/4GJydNYgMPjfUcA68cvp+osteu++geRlBfC8rkTxGajWY9aKJVcp8wkSKXCLdJtSiKsQzK1hW5jBdGF68EWmlSreFUZzpIS2i0sNHtTCpiFZJaHkadZnxchmFhmzeyycXRjnmLyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFd6gUjkCkf4yaMTBZbzBde5bIzAcaz74PABOxuO0z4=;
 b=IGNOjXvVwHMlL1YWryCROAFxfatGgpzq25r3vUEfVrINlJpmKUmGowYwM4F8NeUV51uWH5y2QZbDOFi34nsCVjdjG5grcF5gxY8QaVHA/wibFvQLQaASF0fTrsMp5JSy73Vx1rU0TfuIp+NbHA1zH+I0n8nkQ2g3Nkd69UZjblfAX/bY8KwkGfuB2FjGpUC6xQz4rSVp5LfuaPyaiCFzuY0UdTKlfXWem3QJv6vBTK1cR4WhamLo4WCyvorcxg29uh7LfUFEZSgWramWdQqosHMIRYhumVvH/yyq5hmqaNRcyCoFHT0U5qgPkX+6NXQ12+0wEDxeeyydxiM8ubItEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by SA2PR11MB4841.namprd11.prod.outlook.com (2603:10b6:806:113::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 15:21:06 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::332b:c38a:c916:43d9]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::332b:c38a:c916:43d9%5]) with mapi id 15.20.5791.020; Wed, 2 Nov 2022
 15:21:06 +0000
From: "Mali, Narpat" <Narpat.Mali@windriver.com>
To: Tim Orling <ticotimo@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>,
        "G Pillai, Hari"
	<Hari.GPillai@windriver.com>,
        Alexander Kanavin <alex@linutronix.de>,
        Luca
 Ceresoli <luca.ceresoli@bootlin.com>
Subject: RE: [OE-core][kirkstone][PATCH 1/1] python3-mako: upgrade 1.1.6 ->
 1.2.0
Thread-Topic: [OE-core][kirkstone][PATCH 1/1] python3-mako: upgrade 1.1.6 ->
 1.2.0
Thread-Index: AQHY6d+HAj5KszDx+kuwI4zEZtgwDq4qNnOAgAF5n9k=
Date: Wed, 2 Nov 2022 15:21:06 +0000
Message-ID: 
 <DM4PR11MB55501F0FED5A7469F5FC9009E4399@DM4PR11MB5550.namprd11.prod.outlook.com>
References: <20221027083541.1757707-1-narpat.mali@windriver.com>
 <CANx9H-AzEchfTH796JGdD1AFRAa3zYD6wBDmWU3JYQiX+VVzvw@mail.gmail.com>
In-Reply-To: 
 <CANx9H-AzEchfTH796JGdD1AFRAa3zYD6wBDmWU3JYQiX+VVzvw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5550:EE_|SA2PR11MB4841:EE_
x-ms-office365-filtering-correlation-id: 7c71c809-457c-4dcd-ec26-08dabce5dc93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XPjw3be2cl6ILZdg3idsgk6xNTXPs9hyTJzZBCXvz27AR4GvAp7mQZ3w7qhOPvBC0+EjoEVTCER60S8WeF5wiyzcNSceZmBsuosC8NpkrIl2qgWjjo0uD+HmLtw9SoHoT1+4qdBa5VNcR4tYyCKR7tpCs7mbYHO5b96fh/LzzuF9hiAOM/T3mM+kDIW4hlRMnVrMXy4/8xXMwelUsTsr8yyAL70StkXEjrgNXuO4KPeWjADqfMGINccW8C9ZSWbWQ3SxbYDodwZyPHgu+KahHoy4YgcN2ohBGPDoIGDiRqr0tsnUf9IiSdAjbL/+9rT4Mmg+SOUobcpxeTGsa6PKE1+VG9IFQS1ZmjDJ7MSHhzdVMKCd/ltQ7WtebpHQ1PwsZc+CobFI+G+LmwgVZhLk2sj1INeu411eFsK1WhLd/mEsXkD+8s/fx45dFEijYrxYh/K7v46OQ3MBgodq+e8VZAqq7k3rswvfP0wO4cvUT6WGqD1ttc1XpjqEa6rrXsOk2SdkYW2DhH9sGGwUQtZcLWl4pXJkW0LQj0zsHN1m73LRPsFjryuuwDrpvbQW5iVROE5PhHjkB155pGq85QPgXrLdC9xrGb+rFdAEj3VO4WsIDqbWlzvIqcbmJntlzDAt+GVdhsyvh2muFLqZ7ZbmMaGeiU3UOxicL0Q3v0k4nffzmFQHNJFTc71/33EBd+cLBrICtQfKsv+Ng+XULJ2K4dwy4XvEnPu64hPs/XZfOwtCRyu/XQFIGDOdbr5F4u5sEPexcSMxM6zia786VogNz0WvCr4CVPcQQu7tATQiM2t1dhlQQt2cHa8mdwooFR5ycL5J++pAw0oRw7KkgS94hw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(376002)(39850400004)(346002)(136003)(451199015)(66899015)(33656002)(38100700002)(166002)(122000001)(38070700005)(2906002)(83380400001)(186003)(86362001)(71200400001)(9686003)(26005)(7696005)(53546011)(6506007)(966005)(316002)(8676002)(54906003)(6916009)(8936002)(66946007)(41300700001)(76116006)(64756008)(55016003)(66476007)(91956017)(66556008)(4326008)(66446008)(9326002)(52536014)(5660300002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?H9V2Cy9/Skkn0fZ6en9rR9Rf22gK4Cj3KvgRCCK8/Ic+yfPyEONNcZli?=
 =?Windows-1252?Q?sxgwzbOljqExkY8dqKXPUNfm6nbtaa4aINV8F8cfAwcTvcXZtvr+mTWk?=
 =?Windows-1252?Q?m7s5/rneXMBAWc7ztnmVmSFeIqOqvORooAz6tSiN2SsRMYuDitb17C9y?=
 =?Windows-1252?Q?YhjvUkt6Ob9zRupCATGASGKciUZ1SilZl2Jtr9+tBOmWKuUXs9HEIN/E?=
 =?Windows-1252?Q?z1MrMQTgPD6XfI/Wu3K+ab6+SbgwQ7tl/Anh0PkrffcGMu4ETGOjceHE?=
 =?Windows-1252?Q?JV3wNKSzhh2sOyST/MmVU+uOqAN4pNilT4joQsRHRtWDyLClN3fVAM2P?=
 =?Windows-1252?Q?mshOAhqlCLZg1T+SoiMSTd5y7xJ/2U2qdb/MrXwjAMaHAc4xpknjcsxE?=
 =?Windows-1252?Q?WwFim9dCCqD8gyjdg4/NHrtIp7Br5FNtVgZaREf7t1MfrRJkSKKQIYw5?=
 =?Windows-1252?Q?PgIE9M2Qn4rAxMs5zHTpPR4KX2qFojV0PR1mHeck6sA/YbnnfwJTJgXg?=
 =?Windows-1252?Q?4tIrekYp2QwsYBp4K/DuxySgoMEN2xVVkyGr2BDdow+9z3kbQiYzIBln?=
 =?Windows-1252?Q?LaGI0ZeVstc+p4SGRObP9phcJGwMbabbG9ACemE+rmx+LYEKfcPka3PC?=
 =?Windows-1252?Q?lkAm6Q2saqddNVJZg4cl+T1yCQ9D8sIqh7bOMb8R+9krvN6kO8j6EVmL?=
 =?Windows-1252?Q?W4EE2tazPZCqcQVoFHz+rCszAiFKomwz7cB6RzFozkcvmZNdz0N9nGfe?=
 =?Windows-1252?Q?irwsjhMQUJb894cYgnH4UPwNAVsQb/icbtjmx8/JLgBA4tg+xAj5xG5b?=
 =?Windows-1252?Q?tG29ISPY2at2tKN9UkR+MF+SnJImqzuUNCmcTD+iLAIeRT+XInhBpwvj?=
 =?Windows-1252?Q?GrkA8mtgwhypd2Ct4qnnO+48iSVGu0Dn1iewPJ0apS16qJ4nQ5Z9kL/D?=
 =?Windows-1252?Q?CDnDpoXioIQQ8+it3m2ijCq6HNN+cbObUd5sC5d+/p4uUCkC+EbXyQU0?=
 =?Windows-1252?Q?KjNupzlsA7c28gQqP5icAE15i1ANXLZueQ46Kl9EeEH0ZEHWrKRMtx7d?=
 =?Windows-1252?Q?9KAqzjXEKRdLbvPREHJJC+jLDVyfQew7z1GLYkyXOgLGq3J/CqNgTIug?=
 =?Windows-1252?Q?E0KhOiSLo5T5Egzgxvb7Rz+sofK3aclDx5jnJC/2OLeQtJdTSUBQXqQu?=
 =?Windows-1252?Q?c8pBDQLFTM5WHDShRp8T8Z9rdiZTTCDjZWSYNuRyUKggpZauAMaB+WUH?=
 =?Windows-1252?Q?ksKLEzvBhBcjNC9AbEHGK+hoEGrtqnWWHG+R3yA9ONd0CW0SHaG0qotE?=
 =?Windows-1252?Q?Buw5jqzo+HQ56F/iISRBC4cYCEcT1TiQNtToHogLIJqmkz6j6h3pfpdk?=
 =?Windows-1252?Q?bZLu4Cvhz3vJNqqMNNSDpUfZ8UwL+Ao0W3tx2+q2VIyrdgRq+iYAMvU1?=
 =?Windows-1252?Q?3mQ0Khcw8q3LUUHQhQx2Mt9UblWpgZoH9ehyhMIco9L6t+2Tck/sWCby?=
 =?Windows-1252?Q?Cf7IHEbj6AeDZX1F75MTYblj80OFncJ630Cb0gqiAV8ln4fhCDg4sj31?=
 =?Windows-1252?Q?2pEQNMf47/xYhVZoW/U7Jis10CPM4zDT6F1GnZ+BYhCieMyy9htnfuCl?=
 =?Windows-1252?Q?RaeURa6P/bjsLCEWxi0QIFeV5zLu7bF4fx0rLQtigRs5Ql/UJH8Sq1mG?=
 =?Windows-1252?Q?pi1xFk5H1APelOb3LtefgbTSvrqvFfcM2W1iCLQVw/cLZDGJVEjylx6P?=
 =?Windows-1252?Q?yBn+/hbVp2CgQz2CI8w=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB55501F0FED5A7469F5FC9009E4399DM4PR11MB5550namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c71c809-457c-4dcd-ec26-08dabce5dc93
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 15:21:06.0248
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KJAfymRmDs/xH7jnwJ5zjVm+UeM+LDSnb8zZTGiooO+Bk3WwsHvOBXa2IYsUJ+U1YV6iyspB/uTf74Bip78798EaF05r6oq1gmKdaB3wWp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4841
X-Proofpoint-GUID: pnA7Sn98TgE-yMkU5xyj-QHnEoH-7k9j
X-Proofpoint-ORIG-GUID: V1r5pxX6KsYIrZrOh7ktONmMpjb0mWA-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_12,2022-11-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 15:21:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172593

--_000_DM4PR11MB55501F0FED5A7469F5FC9009E4399DM4PR11MB5550namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Tim,

Actually, our product is based on =93kirkstone=94 branch in which the curre=
nt version of python3-mako is 1.1.6 version.
The CVE-2022-40023 has been fixed in python3-mako 1.2.2 version and this is=
 the patch available on GitHub https://github.com/sqlalchemy/mako/commit/92=
5760291d6efec64fda6e9dd1fd9cfbd5be068c

In master branch python3-mako is already been upgraded to 1.2.2 version. We=
 want the CVE-2022-40023 fix to be available on kirkstone branch so, I have=
 sent patch request to upgrade python3-mako from 1.1.6 -> 1.2.0 , 1.2.0 -> =
1.2.1 , & 1.2.1 -> 1.2.2 version.

Have also found that the version 1.2.2 doesn=92t include any new feature as=
 below.
1.2.2
Released: Mon Aug 29 2022
bug

  *   [bug] [lexer]
Fixed issue in lexer where the regexp used to match tags would not correctl=
y interpret quoted sections individually. While this parsing issue still pr=
oduced the same expected tag structure later on, the mis-handling of quoted=
 sections was also subject to a regexp crash if a tag had a large number of=
 quotes within its quoted sections. Credit to Sebastian Chnelik for locatin=
g the issue.
As Mako templates inherently render and directly invoke arbitrary Python co=
de from the template source, it is never appropriate to create templates th=
at contain untrusted input.
References: #366<https://github.com/sqlalchemy/mako/issues/366>


Shall I just backport this CVE-2022-40023 fix given in 1.2.2 version on pyt=
hon3-mako 1.1.6 version or what shall I do in this case ?

Best Regards,
Narpat

________________________________
From: Tim Orling <ticotimo@gmail.com>
Sent: Tuesday, November 1, 2022 8:47:47 PM
To: Mali, Narpat <Narpat.Mali@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Polampalli, Archana <Archana.Polampalli@windriver.com>; G Pil=
lai, Hari <Hari.GPillai@windriver.com>; Alexander Kanavin <alex@linutronix.=
de>; Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [OE-core][kirkstone][PATCH 1/1] python3-mako: upgrade 1.1.6 ->=
 1.2.0


[Please note: This e-mail is from an EXTERNAL e-mail address]

This would break stable policy as it includes new features:

https://docs.makotemplates.org/en/latest/changelog.html#change-1.2.0<https:=
//urldefense.com/v3/__https://docs.makotemplates.org/en/latest/changelog.ht=
ml*change-1.2.0__;Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODy=
Q_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABi7HzfhJ$>

1.2.0<https://urldefense.com/v3/__https://docs.makotemplates.org/en/latest/=
changelog.html*change-1.2.0__;Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5b=
LKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABi7HzfhJ$>
Released: Thu Mar 10 2022
changed<https://urldefense.com/v3/__https://docs.makotemplates.org/en/lates=
t/changelog.html*change-1.2.0-changed__;Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aS=
ur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABktopqva$>

  *   [changed] [py3k] <https://urldefense.com/v3/__https://docs.makotempla=
tes.org/en/latest/changelog.html*change-0dbd75123f8119e63fdcc0a442bc5113__;=
Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0F=
ewZr1UlMEFq79SSZABggEv0XL$>

Corrected =93universal wheel=94 directive in setup.cfg so that building a w=
heel does not target Python 2.

References: #351<https://urldefense.com/v3/__https://github.com/sqlalchemy/=
mako/issues/351__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_=
jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABkYd7YO7$>

  *   [changed] [py3k] <https://urldefense.com/v3/__https://docs.makotempla=
tes.org/en/latest/changelog.html*change-8485f890cb72df59b5f3f4bf19db2252__;=
Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0F=
ewZr1UlMEFq79SSZABqMiAt5y$>

The bytestring_passthrough template argument is removed, as this flag only =
applied to Python 2.

  *   [changed] [py3k] <https://urldefense.com/v3/__https://docs.makotempla=
tes.org/en/latest/changelog.html*change-2ce5a2bc81c4690be5216769085a6721__;=
Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0F=
ewZr1UlMEFq79SSZABoffi0Hd$>

With the removal of Python 2=92s cStringIO, Mako now uses its own internal =
FastEncodingBuffer exclusively.

  *   [changed] [py3k] <https://urldefense.com/v3/__https://docs.makotempla=
tes.org/en/latest/changelog.html*change-54c870bfa9e0a339f1334434165e87ea__;=
Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0F=
ewZr1UlMEFq79SSZABtghA8MK$>

Removed disable_unicode flag, that=92s no longer used in Python 3.

  *   [changed] <https://urldefense.com/v3/__https://docs.makotemplates.org=
/en/latest/changelog.html*change-0900c0303cb688a6d1702244e22320b2__;Iw!!Ajv=
eYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1Ul=
MEFq79SSZABqaskz-O$>

Refactored test utilities into mako.testing module. Removed unittest.TestCa=
se dependency in favor of pytest.

References: #349<https://urldefense.com/v3/__https://github.com/sqlalchemy/=
mako/issues/349__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_=
jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABkPlQz9_$>

  *   [changed] [setup] <https://urldefense.com/v3/__https://docs.makotempl=
ates.org/en/latest/changelog.html*change-0007ecb822c473326561cd0f9d7cb35c__=
;Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0=
FewZr1UlMEFq79SSZABnq_f2Pr$>

Replaced the use of pkg_resources with the importlib library. For Python < =
3.8 the library importlib_metadata is used.

  *   [changed] [py3k] <https://urldefense.com/v3/__https://docs.makotempla=
tes.org/en/latest/changelog.html*change-e9b48a2c87837a89fc445f43f2ea0b62__;=
Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0F=
ewZr1UlMEFq79SSZABpS8HLCK$>

Removed support for Python 2 and Python 3.6. Mako now requires Python >=3D =
3.7.

bug<https://urldefense.com/v3/__https://docs.makotemplates.org/en/latest/ch=
angelog.html*change-1.2.0-bug__;Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ=
5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABjjk2I2H$>

  *   [bug] [py3k] <https://urldefense.com/v3/__https://docs.makotemplates.=
org/en/latest/changelog.html*change-cc67f729bc0307e8fae39f27e355c7aa__;Iw!!=
AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr=
1UlMEFq79SSZABn1Bv5pn$>

Mako now performs exception chaining using raise from, correctly identifyin=
g underlying exception conditions when it raises its own exceptions. Pull r=
equest courtesy Ram Rachum.

On Thu, Oct 27, 2022 at 1:38 AM Narpat Mali <narpat.mali@windriver.com<mail=
to:narpat.mali@windriver.com>> wrote:
License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex@linutronix.de<mailto:alex@linutronix=
.de>>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com<mailto:luca.ceresol=
i@bootlin.com>>

Upstream master commit:
https://git.openembedded.org/openembedded-core/commit/?id=3Df273900e846b8ac=
416c9d579db32a08c2f34141e<https://urldefense.com/v3/__https://git.openembed=
ded.org/openembedded-core/commit/?id=3Df273900e846b8ac416c9d579db32a08c2f34=
141e__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b=
7fl0FewZr1UlMEFq79SSZABiU1UtWG$>

Signed-off-by: Narpat Mali <narpat.mali@windriver.com<mailto:narpat.mali@wi=
ndriver.com>>
---
 .../python/{python3-mako_1.1.6.bb<https://urldefense.com/v3/__http://pytho=
n3-mako_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ=
_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$> =3D> python3-mako_1.2.0.bb<htt=
ps://urldefense.com/v3/__http://python3-mako_1.2.0.bb__;!!AjveYdw8EvQ!dSMZx=
nosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABtTO=
sCS_$>} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.1.6.bb<https://urldefe=
nse.com/v3/__http://python3-mako_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5=
aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$> =3D> =
python3-mako_1.2.0.bb<https://urldefense.com/v3/__http://python3-mako_1.2.0=
.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7=
fl0FewZr1UlMEFq79SSZABtTOsCS_$>} (59%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.1.6.bb<https://url=
defense.com/v3/__http://python3-mako_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wg=
FxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$> b=
/meta/recipes-devtools/python/python3-mako_1.2.0.bb<https://urldefense.com/=
v3/__http://python3-mako_1.2.0.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKy=
aZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABtTOsCS_$>
similarity index 59%
rename from meta/recipes-devtools/python/python3-mako_1.1.6.bb<https://urld=
efense.com/v3/__http://python3-mako_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgF=
xB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$>
rename to meta/recipes-devtools/python/python3-mako_1.2.0.bb<https://urldef=
ense.com/v3/__http://python3-mako_1.2.0.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB=
5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABtTOsCS_$>
index 71e5d96ba1..11e5f326bd 100644
--- a/meta/recipes-devtools/python/python3-mako_1.1.6.bb<https://urldefense=
.com/v3/__http://python3-mako_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSu=
r9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$>
+++ b/meta/recipes-devtools/python/python3-mako_1.2.0.bb<https://urldefense=
.com/v3/__http://python3-mako_1.2.0.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSu=
r9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABtTOsCS_$>
@@ -2,16 +2,18 @@ SUMMARY =3D "Templating library for Python"
 HOMEPAGE =3D "http://www.makotemplates.org/<https://urldefense.com/v3/__ht=
tp://www.makotemplates.org/__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLK=
ErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABgBvHIC8$>"
 SECTION =3D "devel/python"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D943eb67718222db21d44a4ef1836675=
f"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db32291f107a8f1ea94c4a41e00a6a18=
d"

 PYPI_PACKAGE =3D "Mako"

 inherit pypi python_setuptools_build_meta

-SRC_URI[sha256sum] =3D "4e9e345a41924a954251b95b4b28e14a301145b544901332e6=
58907a7464b6b2"
+SRC_URI[sha256sum] =3D "9a7c7e922b87db3686210cf49d5d767033a41d4010b284e747=
682c92bddd8b39"

 RDEPENDS:${PN} =3D "${PYTHON_PN}-html \
+                  ${PYTHON_PN}-markupsafe \
                   ${PYTHON_PN}-netclient \
+                  ${PYTHON_PN}-pygments \
                   ${PYTHON_PN}-threading \
 "

--
2.34.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#172188): https://lists.openembedded.org/g/openembedded-=
core/message/172188<https://urldefense.com/v3/__https://lists.openembedded.=
org/g/openembedded-core/message/172188__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSu=
r9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABpc3uKtS$>
Mute This Topic: https://lists.openembedded.org/mt/94600007/924729<https://=
urldefense.com/v3/__https://lists.openembedded.org/mt/94600007/924729__;!!A=
jveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1=
UlMEFq79SSZABuCLZN3-$>
Group Owner: openembedded-core+owner@lists.openembedded.org<mailto:openembe=
dded-core%2Bowner@lists.openembedded.org>
Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub<https=
://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/u=
nsub__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b=
7fl0FewZr1UlMEFq79SSZABkgZsSyI$> [ticotimo@gmail.com<mailto:ticotimo@gmail.=
com>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--_000_DM4PR11MB55501F0FED5A7469F5FC9009E4399DM4PR11MB5550namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
h3
	{mso-style-priority:9;
	mso-style-link:"Heading 3 Char";
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:13.5pt;
	font-family:"Calibri",sans-serif;
	font-weight:bold;}
h4
	{mso-style-priority:9;
	mso-style-link:"Heading 4 Char";
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;
	font-weight:bold;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
code
	{mso-style-priority:99;
	font-family:"Courier New";}
span.Heading3Char
	{mso-style-name:"Heading 3 Char";
	mso-style-priority:9;
	mso-style-link:"Heading 3";
	font-family:"Calibri",sans-serif;
	font-weight:bold;}
span.Heading4Char
	{mso-style-name:"Heading 4 Char";
	mso-style-priority:9;
	mso-style-link:"Heading 4";
	font-family:"Calibri",sans-serif;
	font-weight:bold;}
span.gmail-target
	{mso-style-name:gmail-target;}
span.gmail-pre
	{mso-style-name:gmail-pre;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:36054645;
	mso-list-template-ids:-1;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1
	{mso-list-id:695816146;
	mso-list-template-ids:-1;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style>
</head>
<body lang=3D"EN-IN" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Tim,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Actually, our product is based on =93kirkstone=94 br=
anch in which the current version of python3-mako is 1.1.6 version.</p>
<p class=3D"MsoNormal">The<b> CVE-2022-40023 </b>has been fixed in python3-=
mako 1.2.2 version and this is the patch available on GitHub
<a href=3D"https://github.com/sqlalchemy/mako/commit/925760291d6efec64fda6e=
9dd1fd9cfbd5be068c">
https://github.com/sqlalchemy/mako/commit/925760291d6efec64fda6e9dd1fd9cfbd=
5be068c</a></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In <b>master</b> branch python3-mako is already been=
 upgraded to 1.2.2 version. We want the
<b>CVE-2022-40023 </b>fix to be available on <b>kirkstone</b> branch so, I =
have sent patch request to upgrade python3-mako from 1.1.6 -&gt; 1.2.0 , 1.=
2.0 -&gt; 1.2.1 , &amp; 1.2.1 -&gt; 1.2.2 version.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Have also found that the version 1.2.2 doesn=92t inc=
lude any new feature as below.</p>
<div>
<h3><span style=3D"font-size:15.5pt;font-family:&quot;Tahoma&quot;,sans-ser=
if">1.2.2<o:p></o:p></span></h3>
<p class=3D"MsoNormal">Released: Mon Aug 29 2022<o:p></o:p></p>
<h4><span style=3D"font-family:&quot;Tahoma&quot;,sans-serif">bug<o:p></o:p=
></span></h4>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li class=3D"MsoNormal" style=3D"mso-list:l1 level1 lfo1"><code><span style=
=3D"font-size:10.0pt">[bug] [lexer]</span></code><strong><span style=3D"fon=
t-family:&quot;Calibri&quot;,sans-serif">&nbsp;</span></strong><o:p></o:p><=
/li></ul>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt">Fixed issue in lexer wh=
ere the regexp used to match tags would not correctly interpret quoted sect=
ions individually. While this parsing issue still produced the same expecte=
d tag structure later on, the mis-handling
 of quoted sections was also subject to a regexp crash if a tag had a large=
 number of quotes within its quoted sections. Credit to Sebastian Chnelik f=
or locating the issue.</p>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt">As Mako templates inher=
ently render and directly invoke arbitrary Python code from the template so=
urce, it is&nbsp;<code><span style=3D"font-size:10.0pt">never</span></code>=
&nbsp;appropriate to create templates that contain
 untrusted input.</p>
<p class=3D"MsoNormal" style=3D"margin-left:36.0pt">References:&nbsp;<a hre=
f=3D"https://github.com/sqlalchemy/mako/issues/366"><span class=3D"Heading4=
Char"><span style=3D"font-size:12.0pt;color:windowtext;text-decoration:none=
">#366</span></span></a><o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Shall I just backport this CVE-2022-40023 fix given =
in 1.2.2 version on python3-mako 1.1.6 version or what shall I do in this c=
ase ?</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,</p>
<p class=3D"MsoNormal">Narpat</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Tim Orling &lt;ticoti=
mo@gmail.com&gt;<br>
<b>Sent:</b> Tuesday, November 1, 2022 8:47:47 PM<br>
<b>To:</b> Mali, Narpat &lt;Narpat.Mali@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; Polampalli, Archana &lt;Archana.Polampalli@windr=
iver.com&gt;; G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;; Alexander =
Kanavin &lt;alex@linutronix.de&gt;; Luca Ceresoli &lt;luca.ceresoli@bootlin=
.com&gt;<br>
<b>Subject:</b> Re: [OE-core][kirkstone][PATCH 1/1] python3-mako: upgrade 1=
.1.6 -&gt; 1.2.0</font>
<div>&nbsp;</div>
</div>
<div>
<p></p>
<div style=3D"border:solid #9C6500 1.0pt; padding:2.0pt 2.0pt 2.0pt 2.0pt">
<p class=3D"x_MsoNormal" style=3D"line-height:12.0pt; background:#FFEB9C"><=
b><span style=3D"font-size:10.0pt; color:#9C6500"></span></b><span style=3D=
"font-size:10.0pt; color:red">[Please note: This e-mail is from an EXTERNAL=
 e-mail address]</span></p>
</div>
<div>
<div dir=3D"ltr">
<div>This would break stable policy as it includes new features:</div>
<div><br>
</div>
<div><a href=3D"https://urldefense.com/v3/__https://docs.makotemplates.org/=
en/latest/changelog.html*change-1.2.0__;Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aS=
ur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABi7HzfhJ$">https:/=
/docs.makotemplates.org/en/latest/changelog.html#change-1.2.0</a></div>
<div><br>
</div>
<div>
<h3 class=3D"x_gmail-release-version">1.2.0<a class=3D"x_gmail-headerlink" =
href=3D"https://urldefense.com/v3/__https://docs.makotemplates.org/en/lates=
t/changelog.html*change-1.2.0__;Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ=
5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABi7HzfhJ$" title=3D"Permal=
ink to this heading"></a></h3>
Released: Thu Mar 10 2022
<h4>changed<a class=3D"x_gmail-headerlink" href=3D"https://urldefense.com/v=
3/__https://docs.makotemplates.org/en/latest/changelog.html*change-1.2.0-ch=
anged__;Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09=
o0b7fl0FewZr1UlMEFq79SSZABktopqva$" title=3D"Permalink to this heading"></a=
></h4>
<ul class=3D"x_gmail-simple">
<li>
<p class=3D"x_gmail-caption" id=3D"x_gmail-change-1.2.0-0"><span class=3D"x=
_gmail-target" id=3D"x_gmail-change-0dbd75123f8119e63fdcc0a442bc5113"><stro=
ng>[changed] [py3k]</strong>
<a class=3D"x_gmail-changelog-reference x_gmail-headerlink x_gmail-referenc=
e x_gmail-internal" href=3D"https://urldefense.com/v3/__https://docs.makote=
mplates.org/en/latest/changelog.html*change-0dbd75123f8119e63fdcc0a442bc511=
3__;Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7=
fl0FewZr1UlMEFq79SSZABggEv0XL$">
</a></span></p>
<p>Corrected =93universal wheel=94 directive in <code class=3D"x_gmail-docu=
tils x_gmail-literal x_gmail-notranslate">
<span class=3D"x_gmail-pre">setup.cfg</span></code> so that building a whee=
l does not target Python 2.</p>
<p>References: <a class=3D"x_gmail-reference x_external" href=3D"https://ur=
ldefense.com/v3/__https://github.com/sqlalchemy/mako/issues/351__;!!AjveYdw=
8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq=
79SSZABkYd7YO7$">
#351</a></p>
<p></p>
</li><li>
<p class=3D"x_gmail-caption" id=3D"x_gmail-change-1.2.0-1"><span class=3D"x=
_gmail-target" id=3D"x_gmail-change-8485f890cb72df59b5f3f4bf19db2252"><stro=
ng>[changed] [py3k]</strong>
<a class=3D"x_gmail-changelog-reference x_gmail-headerlink x_gmail-referenc=
e x_gmail-internal" href=3D"https://urldefense.com/v3/__https://docs.makote=
mplates.org/en/latest/changelog.html*change-8485f890cb72df59b5f3f4bf19db225=
2__;Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7=
fl0FewZr1UlMEFq79SSZABqMiAt5y$">
</a></span></p>
<p>The <code class=3D"x_gmail-docutils x_gmail-literal x_gmail-notranslate"=
><span class=3D"x_gmail-pre">bytestring_passthrough</span></code> template =
argument is removed, as this flag only applied to Python 2.</p>
<p></p>
<p></p>
</li><li>
<p class=3D"x_gmail-caption" id=3D"x_gmail-change-1.2.0-2"><span class=3D"x=
_gmail-target" id=3D"x_gmail-change-2ce5a2bc81c4690be5216769085a6721"><stro=
ng>[changed] [py3k]</strong>
<a class=3D"x_gmail-changelog-reference x_gmail-headerlink x_gmail-referenc=
e x_gmail-internal" href=3D"https://urldefense.com/v3/__https://docs.makote=
mplates.org/en/latest/changelog.html*change-2ce5a2bc81c4690be5216769085a672=
1__;Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7=
fl0FewZr1UlMEFq79SSZABoffi0Hd$">
</a></span></p>
<p>With the removal of Python 2=92s <code class=3D"x_gmail-docutils x_gmail=
-literal x_gmail-notranslate">
<span class=3D"x_gmail-pre">cStringIO</span></code>, Mako now uses its own =
internal
<code class=3D"x_gmail-docutils x_gmail-literal x_gmail-notranslate"><span =
class=3D"x_gmail-pre">FastEncodingBuffer</span></code> exclusively.</p>
<p></p>
<p></p>
</li><li>
<p class=3D"x_gmail-caption" id=3D"x_gmail-change-1.2.0-3"><span class=3D"x=
_gmail-target" id=3D"x_gmail-change-54c870bfa9e0a339f1334434165e87ea"><stro=
ng>[changed] [py3k]</strong>
<a class=3D"x_gmail-changelog-reference x_gmail-headerlink x_gmail-referenc=
e x_gmail-internal" href=3D"https://urldefense.com/v3/__https://docs.makote=
mplates.org/en/latest/changelog.html*change-54c870bfa9e0a339f1334434165e87e=
a__;Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7=
fl0FewZr1UlMEFq79SSZABtghA8MK$">
</a></span></p>
<p>Removed <code class=3D"x_gmail-docutils x_gmail-literal x_gmail-notransl=
ate"><span class=3D"x_gmail-pre">disable_unicode</span></code> flag, that=
=92s no longer used in Python 3.</p>
<p></p>
<p></p>
</li><li>
<p class=3D"x_gmail-caption" id=3D"x_gmail-change-1.2.0-4"><span class=3D"x=
_gmail-target" id=3D"x_gmail-change-0900c0303cb688a6d1702244e22320b2"><stro=
ng>[changed]</strong>
<a class=3D"x_gmail-changelog-reference x_gmail-headerlink x_gmail-referenc=
e x_gmail-internal" href=3D"https://urldefense.com/v3/__https://docs.makote=
mplates.org/en/latest/changelog.html*change-0900c0303cb688a6d1702244e22320b=
2__;Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7=
fl0FewZr1UlMEFq79SSZABqaskz-O$">
</a></span></p>
<p>Refactored test utilities into <code class=3D"x_gmail-docutils x_gmail-l=
iteral x_gmail-notranslate">
<span class=3D"x_gmail-pre">mako.testing</span></code> module. Removed <cod=
e class=3D"x_gmail-docutils x_gmail-literal x_gmail-notranslate">
<span class=3D"x_gmail-pre">unittest.TestCase</span></code> dependency in f=
avor of <code class=3D"x_gmail-docutils x_gmail-literal x_gmail-notranslate=
">
<span class=3D"x_gmail-pre">pytest</span></code>.</p>
<p>References: <a class=3D"x_gmail-reference x_external" href=3D"https://ur=
ldefense.com/v3/__https://github.com/sqlalchemy/mako/issues/349__;!!AjveYdw=
8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq=
79SSZABkPlQz9_$">
#349</a></p>
<p></p>
</li><li>
<p class=3D"x_gmail-caption" id=3D"x_gmail-change-1.2.0-5"><span class=3D"x=
_gmail-target" id=3D"x_gmail-change-0007ecb822c473326561cd0f9d7cb35c"><stro=
ng>[changed] [setup]</strong>
<a class=3D"x_gmail-changelog-reference x_gmail-headerlink x_gmail-referenc=
e x_gmail-internal" href=3D"https://urldefense.com/v3/__https://docs.makote=
mplates.org/en/latest/changelog.html*change-0007ecb822c473326561cd0f9d7cb35=
c__;Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7=
fl0FewZr1UlMEFq79SSZABnq_f2Pr$">
</a></span></p>
<p>Replaced the use of <code class=3D"x_gmail-docutils x_gmail-literal x_gm=
ail-notranslate">
<span class=3D"x_gmail-pre">pkg_resources</span></code> with the <code clas=
s=3D"x_gmail-docutils x_gmail-literal x_gmail-notranslate">
<span class=3D"x_gmail-pre">importlib</span></code> library. For Python &lt=
; 3.8 the library
<code class=3D"x_gmail-docutils x_gmail-literal x_gmail-notranslate"><span =
class=3D"x_gmail-pre">importlib_metadata</span></code> is used.</p>
<p></p>
<p></p>
</li><li>
<p class=3D"x_gmail-caption" id=3D"x_gmail-change-1.2.0-6"><span class=3D"x=
_gmail-target" id=3D"x_gmail-change-e9b48a2c87837a89fc445f43f2ea0b62"><stro=
ng>[changed] [py3k]</strong>
<a class=3D"x_gmail-changelog-reference x_gmail-headerlink x_gmail-referenc=
e x_gmail-internal" href=3D"https://urldefense.com/v3/__https://docs.makote=
mplates.org/en/latest/changelog.html*change-e9b48a2c87837a89fc445f43f2ea0b6=
2__;Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7=
fl0FewZr1UlMEFq79SSZABpS8HLCK$">
</a></span></p>
<p>Removed support for Python 2 and Python 3.6. Mako now requires Python &g=
t;=3D 3.7.</p>
<p></p>
<p></p>
</li></ul>
<h4>bug<a class=3D"x_gmail-headerlink" href=3D"https://urldefense.com/v3/__=
https://docs.makotemplates.org/en/latest/changelog.html*change-1.2.0-bug__;=
Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0F=
ewZr1UlMEFq79SSZABjjk2I2H$" title=3D"Permalink to this heading"></a></h4>
<ul class=3D"x_gmail-simple">
<li>
<p class=3D"x_gmail-caption" id=3D"x_gmail-change-1.2.0-7"><span class=3D"x=
_gmail-target" id=3D"x_gmail-change-cc67f729bc0307e8fae39f27e355c7aa"><stro=
ng>[bug] [py3k]</strong>
<a class=3D"x_gmail-changelog-reference x_gmail-headerlink x_gmail-referenc=
e x_gmail-internal" href=3D"https://urldefense.com/v3/__https://docs.makote=
mplates.org/en/latest/changelog.html*change-cc67f729bc0307e8fae39f27e355c7a=
a__;Iw!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7=
fl0FewZr1UlMEFq79SSZABn1Bv5pn$">
</a></span></p>
<p>Mako now performs exception chaining using <code class=3D"x_gmail-docuti=
ls x_gmail-literal x_gmail-notranslate">
<span class=3D"x_gmail-pre">raise</span> <span class=3D"x_gmail-pre">from</=
span></code>, correctly identifying underlying exception conditions when it=
 raises its own exceptions. Pull request courtesy Ram Rachum.</p>
</li></ul>
</div>
</div>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Thu, Oct 27, 2022 at 1:38 AM Nar=
pat Mali &lt;<a href=3D"mailto:narpat.mali@windriver.com">narpat.mali@windr=
iver.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
License-Update: copyright years<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
Signed-off-by: Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@bootlin.co=
m" target=3D"_blank">luca.ceresoli@bootlin.com</a>&gt;<br>
<br>
Upstream master commit:<br>
<a href=3D"https://urldefense.com/v3/__https://git.openembedded.org/openemb=
edded-core/commit/?id=3Df273900e846b8ac416c9d579db32a08c2f34141e__;!!AjveYd=
w8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEF=
q79SSZABiU1UtWG$" rel=3D"noreferrer" target=3D"_blank">https://git.openembe=
dded.org/openembedded-core/commit/?id=3Df273900e846b8ac416c9d579db32a08c2f3=
4141e</a><br>
<br>
Signed-off-by: Narpat Mali &lt;<a href=3D"mailto:narpat.mali@windriver.com"=
 target=3D"_blank">narpat.mali@windriver.com</a>&gt;<br>
---<br>
&nbsp;.../python/{<a href=3D"https://urldefense.com/v3/__http://python3-mak=
o_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDI=
a09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$" rel=3D"noreferrer" target=3D"_blank"=
>python3-mako_1.1.6.bb</a> =3D&gt;
<a href=3D"https://urldefense.com/v3/__http://python3-mako_1.2.0.bb__;!!Ajv=
eYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1Ul=
MEFq79SSZABtTOsCS_$" rel=3D"noreferrer" target=3D"_blank">
python3-mako_1.2.0.bb</a>} | 6 ++++--<br>
&nbsp;1 file changed, 4 insertions(+), 2 deletions(-)<br>
&nbsp;rename meta/recipes-devtools/python/{<a href=3D"https://urldefense.co=
m/v3/__http://python3-mako_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9e=
KyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$" rel=3D"nore=
ferrer" target=3D"_blank">python3-mako_1.1.6.bb</a>
 =3D&gt; <a href=3D"https://urldefense.com/v3/__http://python3-mako_1.2.0.b=
b__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl=
0FewZr1UlMEFq79SSZABtTOsCS_$" rel=3D"noreferrer" target=3D"_blank">
python3-mako_1.2.0.bb</a>} (59%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"https://urldefense.com=
/v3/__http://python3-mako_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eK=
yaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$" rel=3D"noref=
errer" target=3D"_blank">python3-mako_1.1.6.bb</a>
 b/meta/recipes-devtools/python/<a href=3D"https://urldefense.com/v3/__http=
://python3-mako_1.2.0.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErq=
H3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABtTOsCS_$" rel=3D"noreferrer" tar=
get=3D"_blank">python3-mako_1.2.0.bb</a><br>
similarity index 59%<br>
rename from meta/recipes-devtools/python/<a href=3D"https://urldefense.com/=
v3/__http://python3-mako_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKy=
aZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$" rel=3D"norefe=
rrer" target=3D"_blank">python3-mako_1.1.6.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"https://urldefense.com/v3=
/__http://python3-mako_1.2.0.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ=
5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABtTOsCS_$" rel=3D"noreferr=
er" target=3D"_blank">python3-mako_1.2.0.bb</a><br>
index 71e5d96ba1..11e5f326bd 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"https://urldefense.com/v3/__h=
ttp://python3-mako_1.1.6.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLK=
ErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABqRMx25E$" rel=3D"noreferrer" =
target=3D"_blank">python3-mako_1.1.6.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"https://urldefense.com/v3/__h=
ttp://python3-mako_1.2.0.bb__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLK=
ErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABtTOsCS_$" rel=3D"noreferrer" =
target=3D"_blank">python3-mako_1.2.0.bb</a><br>
@@ -2,16 +2,18 @@ SUMMARY =3D &quot;Templating library for Python&quot;<br>
&nbsp;HOMEPAGE =3D &quot;<a href=3D"https://urldefense.com/v3/__http://www.=
makotemplates.org/__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phOD=
yQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABgBvHIC8$" rel=3D"noreferrer" target=3D=
"_blank">http://www.makotemplates.org/</a>&quot;<br>
&nbsp;SECTION =3D &quot;devel/python&quot;<br>
&nbsp;LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D943eb67718222db21d44a4ef18=
36675f&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db32291f107a8f1ea94c4a41e00=
a6a18d&quot;<br>
<br>
&nbsp;PYPI_PACKAGE =3D &quot;Mako&quot;<br>
<br>
&nbsp;inherit pypi python_setuptools_build_meta<br>
<br>
-SRC_URI[sha256sum] =3D &quot;4e9e345a41924a954251b95b4b28e14a301145b544901=
332e658907a7464b6b2&quot;<br>
+SRC_URI[sha256sum] =3D &quot;9a7c7e922b87db3686210cf49d5d767033a41d4010b28=
4e747682c92bddd8b39&quot;<br>
<br>
&nbsp;RDEPENDS:${PN} =3D &quot;${PYTHON_PN}-html \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${PYTHON_PN=
}-markupsafe \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${PYTH=
ON_PN}-netclient \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${PYTHON_PN=
}-pygments \<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${PYTH=
ON_PN}-threading \<br>
&nbsp;&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172188): <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-core/message/172188__;!!AjveYdw8EvQ!=
dSMZxnosWE-wgFxB5aSur9eKyaZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZ=
ABpc3uKtS$" rel=3D"noreferrer" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/message/172188</a><br>
Mute This Topic: <a href=3D"https://urldefense.com/v3/__https://lists.opene=
mbedded.org/mt/94600007/924729__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKyaZ5=
bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABuCLZN3-$" rel=3D"noreferre=
r" target=3D"_blank">
https://lists.openembedded.org/mt/94600007/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">
openembedded-core+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://lists.openembed=
ded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!dSMZxnosWE-wgFxB5aSur9eKy=
aZ5bLKErqH3phODyQ_jGnDIa09o0b7fl0FewZr1UlMEFq79SSZABkgZsSyI$" rel=3D"norefe=
rrer" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"ma=
ilto:ticotimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote>
</div>
</div>
</div>
</body>
</html>

--_000_DM4PR11MB55501F0FED5A7469F5FC9009E4399DM4PR11MB5550namp_--

