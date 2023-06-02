Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DE5C7EE29
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 11:42:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10338.1685706151891230334
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 04:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=c+WB9qhC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55177065e7=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 352Abvdb005991
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Jun 2023 04:42:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=rqVAP3KQt05ydZ0DBE0thdggXk5+K6izwGOLiL51Tq8=;
 b=c+WB9qhCOZj2SagFjvqTyBkfJURB/+MURujFFHz3F5YWQyrrWwJowX2gJ2MNDGm1W5sI
 nDart+X4FTqfrlLJzwwgeqq399pFOt6S58svZPwEZWntzQJkA1+EZ5ISv1cQijmyFWS6
 G31Di3wnd3pUSdGXDy+9regotxbLRciqS7UcU2m6wXT/Zo6sCrnmiXya+zD0EYRJmXUA
 +PcT5WH+6LyRxpkNoR49zcrTCey80DgU/9uPKGdk+ae+p1c56uTQrCgoogxyLRO6fj98
 vvHbes57Od3s2wMYlkh/stF1pL8fDvYoVhNeF7ZcI7qT1NrDgROsuayyai3q+UN0xIuK LA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3quhcjdmfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 04:42:31 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 352BgUUU022992
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Jun 2023 04:42:30 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3quhcjdmf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Jun 2023 04:42:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbWMSrBA56CpFrJwKk+EktpS4pf+WrGlaT3TmGaTE8DBy4gY5KnmS+zye8Y7Raabyz0RM8eOXNHoaFHXRDLeOvXDMOpc9VoghLJ+0AScy3UPoRoow/qkDXexRISEoPj50leg3lqWdI85cN4D3CYziDsCQqXhZWe1omNCmt3NZjpBac3tE9aG3pihs5IOMIYkn2R/12lpmseF1ug34jhmI2QhIF+5HVvzFsVHE4X1sqNi8DOSUTkEQ5odo7nGsC+lQsmPKeRfv09Kz4Trp6FHc4u/tGMWP1APsHLD8EHv8oDQbpsFO2SRuhjO0vISPXm9IGTAxFr0SeKFzKsn2JFEVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqVAP3KQt05ydZ0DBE0thdggXk5+K6izwGOLiL51Tq8=;
 b=hEBoI4jwcGwGtaSgooZmckBzlazy5uM62usmgWYVqzNlWYULFSnDciVxsouSkf1Dvqevd+TgVSqZkCti7jlm3kTtxNFtCO4T09k7dBjDieGFX92tq6Bb+xPWGxqAQwMI7xoW4SSAJIzqNlVmcfqDyOgf3lyBZPKcOeNLJ5O+YAn0AI1OOPw7zKBpF4ATkk4USYJTe5jsTcCNQ9DFBo1ScsW8OCdtyKKSC7OrFVeNPb/bndsayE5LWT6F7t0rEFdJ1StAFpgF7CWT9Wtr5YP6sDG3vXESHzfzymIJ3q7lI39ty30kNrb9D3Rdu8beGmjlA01m/SGI8zxxZLqdO3rDTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CY5PR11MB6188.namprd11.prod.outlook.com (2603:10b6:930:24::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Fri, 2 Jun
 2023 11:42:27 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b29f:c09e:71b3:df12]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::b29f:c09e:71b3:df12%4]) with mapi id 15.20.6455.024; Fri, 2 Jun 2023
 11:42:26 +0000
From: "Shinde, Yash" <Yash.Shinde@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "Kallapa, Umesh"
	<Umesh.Kallapa@windriver.com>,
        "Gowda, Naveen" <Naveen.Gowda@windriver.com>,
        "Moodalappa, Shivaprasad" <Shivaprasad.Moodalappa@windriver.com>
Subject: RE: [PATCH v14] Rust Oe-Selftest implementation
Thread-Topic: [PATCH v14] Rust Oe-Selftest implementation
Thread-Index: AQHZkuTFrue5rkJstE6ePHeUChW9Gq9y2A4AgAEaWwCAAy0PE4AARpSAgAABvxI=
Date: Fri, 2 Jun 2023 11:42:26 +0000
Message-ID: 
 <SJ1PR11MB61295F1D6863021D6749FCC7EB4EA@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20230530105125.445622-1-yashinde145@gmail.com>
	 <7c9a0a78204958d84c4a3779da7c0f1b0e66dda8.camel@linuxfoundation.org>
	 <CH2PR11MB4470880E838BBC66386FA2A489489@CH2PR11MB4470.namprd11.prod.outlook.com>
	 <SJ1PR11MB61294CC48FD3D027E729C03CEB4EA@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <32fea4adeae13df4a98727293e9aa82b0f65b87d.camel@linuxfoundation.org>
In-Reply-To: 
 <32fea4adeae13df4a98727293e9aa82b0f65b87d.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|CY5PR11MB6188:EE_
x-ms-office365-filtering-correlation-id: 636717aa-aca6-4876-00d9-08db635e7053
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9mrmupG/MCsFmJE+DWPMOhlb0Iv02Z91xOH77NNeHYMYhfCFAkwlmt54AlRYSeXm8HtUC5hd+HWy/ib3aE2mwnzBbGKD0itk0btPN4PHVfp56RuCI6PsctZN/95iOXIkxtrCLK6/b6GxGwXFLuYcYv6n/b3VNhWHIJvNTe25ibxUdFqtCvtOB46O4MxJTHItA7IeUbHba8d4zpIZ7lNBpRR0SWRXHcZfyrdpZRxd0VpwS/07e5IiJKsq8+S4ZT4lUNEQ3mA9dkbY5cnGiBV/LY0U6F1fuXyjYYV4Y4cISa29b1i95pvTFKXwbTvx0LZ7nUkCwnTH2AWN+yIXYEZUB6nhMLJ0cZi5Xh2YWwDICkY7SVqoQjyepT0O+ah0/aRwobi4cZYkde0AGbmAS/W46558/ArotwTY/AGPj8x6PjLou41kd6Hu0z7qyLhk+ABHsTnMzTvq6fB2aOEkgLpQp68oQjAf7J4Dq9WCt8frmVCn9ptDUbg6IBV09impl9bPTILymzAQnoxq1j4BDwCbW81JzZPKV7M9534ZcZFdlobSdbyRGsm2L/0F+LwqnfwmoF1f0kBV/g6MbvUQ91zCjDcLDLKLBfUO0Usv7BrbfP0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39850400004)(376002)(396003)(346002)(451199021)(33656002)(83380400001)(52536014)(8936002)(5660300002)(166002)(9326002)(8676002)(38100700002)(2906002)(9686003)(316002)(38070700005)(122000001)(53546011)(4326008)(6506007)(26005)(41300700001)(86362001)(76116006)(66946007)(66446008)(186003)(66476007)(64756008)(66556008)(110136005)(54906003)(478600001)(107886003)(966005)(55016003)(71200400001)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?dVqnww4lyzyuqdTcJMcWSfLaLEvbWEQ9cOmsZiobUIanHLWOw41ukTudt7xf?=
 =?us-ascii?Q?QfgB2aPwAFt0YlUtwmvB16UhS2X7kyJWLTr8nLw6yo3JVTAEwiO8IjCuCx10?=
 =?us-ascii?Q?ZSNUXyvcW91EOU6bJmMr6TDhXgTXT7aIcSTazFt217+S9kBs5AtBFqIL6Bpq?=
 =?us-ascii?Q?174n0RKoNmIPnrARkGlicEmwCQON53pr2obzxTQy473+IgSECYVGSoZJRP8X?=
 =?us-ascii?Q?psQgFFjptvufT2xYn6ju0wqdHVnkEy4tlUflCwsqKdOSQahIa3xhjH4xDjL1?=
 =?us-ascii?Q?EKeZwDsUleQrMVnzrsh+/gjLN+s+OBoTLQ2pLmVipKpatg0eoO/DYa3j75QF?=
 =?us-ascii?Q?tkTQQuB1SSR27OHZimCESAjwRfKBvA7U7+qQuzt5yA0GEiU3ysJAgoTffCsS?=
 =?us-ascii?Q?h/VzipBCQqQhDygKlVaUlPT3st/BKRyEfODM+owLzgWS78QAZuyzqo0BCBL5?=
 =?us-ascii?Q?sqCBa6pNVjAgbIYIf0RRSNU0f5tZnSR5v5hxHLigODFqYLho19WDWPY+Eqg6?=
 =?us-ascii?Q?8mb1QUroWsGozVZAEVMcv5A2lKFdqyvfNPZv+cFkujeuaI5vQyptw85zhJ1i?=
 =?us-ascii?Q?ZAHQkAxZQlPUEFsxlBLMA7Hu4YMaysC348IqUP44u3mHHyDKG3CX2YeUMSnR?=
 =?us-ascii?Q?ZzWvIsP1RBd1lb/prLMagJevfzu28SU+DlBJcGZiLfkaRigzX7BrEXwu2iy3?=
 =?us-ascii?Q?Shxys5bMHt+yEcIkrdcrn7P95iwlL0t4S2tCnnIO37EeT6x7nEYygAyvskdK?=
 =?us-ascii?Q?rHqSiTYi7N5sNFl+gIpHealSW85j6KYDXWg6pV+bMTTR6XDc4IQ4dSeK7h4l?=
 =?us-ascii?Q?8bSCT6uV6znfo7AjbcZ3BVkb6aMi1XUV8I5o6UhkFj9LNcM/EE4EMHAbjxRZ?=
 =?us-ascii?Q?zXE1JxTEbDWcLbkCFKen+UB9gAXl2CM8OVAt3eI7WeYmIGfbQz+AGGbFEm/Y?=
 =?us-ascii?Q?7ktSJiX8EIRsImQfKwSM6ih7v6CbuhkUmDkg+2A2YVrG3qaBhPfVNB6L+AqO?=
 =?us-ascii?Q?k9t5obyLOKO+5uXkPQGgriPq0aRiZzZczOCWdBY5dCEydYwwdMpy+Fw8s2rp?=
 =?us-ascii?Q?Ql7paZ4TW91c4TG/QXJNEqhmVL3Hjqhy8Gwt7EE7V1+lhJAb+5LNe5xk44Ln?=
 =?us-ascii?Q?VYX0TlRkXt66tPl4/GjA8wvExm+p+b1fI3x2yguukZJ1yo2dnfFen3l4cXM5?=
 =?us-ascii?Q?/U0Yx0s5SH+QfQCeL9STxDcBnN/VPj9VWuJx0F2SrL/gUzQQvU2SGdHQqcYp?=
 =?us-ascii?Q?T7gsryyJWHi6Cvr/QAxnwgKn8eub5lIrOXKnML2T3fIgxlkKNcSH3aVVGwmi?=
 =?us-ascii?Q?biaLH1o8FSnyfEUj9OH6hYa1zzpULLNfu5DHwp7O53PJyZLzzdxdFY5R7Tv7?=
 =?us-ascii?Q?azdjkXB9TqQZtqF4JGPk4eakeOfru5u2LXCJUfq9/iU1XD9KvOWzpWQm79YJ?=
 =?us-ascii?Q?V/GBwVe55UULlKO77GWyRc8hpK5VSrQLZcslaAfoc0xIuSwiVYEqWfV98TUk?=
 =?us-ascii?Q?1N6Es7XmFEd3nBYnz7G1j09eBO8iLcx+Gtg32pGInCqdvLFv3rzyP1gVRtJ7?=
 =?us-ascii?Q?OzR7CCYRiFW/W7v7U9lj/TkX3wxoFU3sdYnLqVNmV7O+SOULtDkzmOXgCGGG?=
 =?us-ascii?Q?B83wb1+qTADKISAMKqoK0Pg=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ1PR11MB61295F1D6863021D6749FCC7EB4EASJ1PR11MB6129namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 636717aa-aca6-4876-00d9-08db635e7053
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2023 11:42:26.5071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1jbliX3IWaFyychfaJ7vRaMn/vCDg3Pv+IcZaWXOeddpYU4cps//ALMZrkpPy4QzK/PPYqOYqZb7V7ZUvvXdftvGk5b+ZT4gqh6/CHIDUGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6188
X-Proofpoint-GUID: O7-YRe5u6ZwXNfzzPMm3-KB_oNYE4im_
X-Proofpoint-ORIG-GUID: BhFb5oqHPgqcD8JO_N1O3MGRwtpeLH6X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-02_08,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306020087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 11:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182305

--_000_SJ1PR11MB61295F1D6863021D6749FCC7EB4EASJ1PR11MB6129namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Thanks for the confirmation.

Regards,
Yash

From: Richard Purdie<mailto:richard.purdie@linuxfoundation.org>
Sent: 02 June 2023 17:02
To: Shinde, Yash<mailto:Yash.Shinde@windriver.com>; Kokkonda, Sundeep<mailt=
o:Sundeep.Kokkonda@windriver.com>; openembedded-core@lists.openembedded.org=
<mailto:openembedded-core@lists.openembedded.org>
Cc: MacLeod, Randy<mailto:Randy.MacLeod@windriver.com>; Kallapa, Umesh<mail=
to:Umesh.Kallapa@windriver.com>; Gowda, Naveen<mailto:Naveen.Gowda@windrive=
r.com>; Moodalappa, Shivaprasad<mailto:Shivaprasad.Moodalappa@windriver.com=
>
Subject: Re: [PATCH v14] Rust Oe-Selftest implementation

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Hi Yash,

On Fri, 2023-06-02 at 07:25 +0000, Shinde, Yash wrote:
>
> As discussed in the meeting, I am sharing the steps followed and host con=
figurations used for the testing-
>
> Steps followed for testing-
>
> 1. Clone a fresh poky from $ git clone git://git.yoctoproject.org/poky
> 2. source the build environment setup script
> 3. add the meta-selftest layer in conf/bblayers.conf
> 4. add SANITY_TESTED_DISTROS=3D"" to local.conf
> 5. Apply the testing patch changes-
>    a. Add  meta/lib/oeqa/selftest/cases/rust.py file containing testing c=
ode
>    b. Add meta/recipes-devtools/rust/files/rust-oe-selftest.patch to excl=
ude failing cases.
>    c. Add rust-oe-selftest.patch in meta/recipes-devtools/rust/rust-sourc=
e.inc to apply on rust sources.
>    d. Add "do_test_compile ()" for testing rust sources in meta/recipes-d=
evtools/rust/rust_1.69.0.bb
>    e. Run the oe-selftest via "oe-selftest -r rust.RustSelfTestBase.test_=
check" command.

As I promised, I did try these steps and you are correct that they are
successful. However, if I try:

"bitbake rust"

I see the failure here:

https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/7128/step=
s/12/logs/stdio

likewise, I suspect "bitbake nativesdk-rust" will also fail with the
other failure mentioned there.

This does not happen unless your patch is applied so it is a
regression. There are likely other failures however this one is pretty
fundamental so we should start by fixing that.

I did document my exact steps as follows:

$ git clone git://git.yoctoproject.org/poky poky-rusttest
$ cd poky-rusttest/
$ source oe-init-build-env
$ echo 'BBLAYERS +=3D "/media/build/poky-rusttest/meta-selftest"' >>
conf/bblayers.conf
$ echo 'SANITY_TESTED_DISTROS =3D ""' >> conf/local.conf
$ echo 'DL_DIR =3D "/media/sources/"' >> conf/local.conf
$ wget
https://lore.kernel.org/openembedded-core/20230530105125.445622-1-yashinde1=
45@gmail.com/raw
$ git am -s raw
$ oe-selftest -r rust.RustSelfTestBase.test_check
$ bitbake rust nativesdk-rust -k

where the only real difference to your steps was to set DL_DIR to my
local sources cache to avoid downloading things needlessly.


Cheers,

Richard


--_000_SJ1PR11MB61295F1D6863021D6749FCC7EB4EASJ1PR11MB6129namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Mangal;
	panose-1:2 4 5 3 5 2 3 3 2 2;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-IN" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Richard,<br>
<br>
Thanks for the confirmation.</span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<br>
Yash<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"border:none;padding:0cm"><b>From: </b><a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org">Richard Purdie</a><br>
<b>Sent: </b>02 June 2023 17:02<br>
<b>To: </b><a href=3D"mailto:Yash.Shinde@windriver.com">Shinde, Yash</a>; <=
a href=3D"mailto:Sundeep.Kokkonda@windriver.com">
Kokkonda, Sundeep</a>; <a href=3D"mailto:openembedded-core@lists.openembedd=
ed.org">
openembedded-core@lists.openembedded.org</a><br>
<b>Cc: </b><a href=3D"mailto:Randy.MacLeod@windriver.com">MacLeod, Randy</a=
>; <a href=3D"mailto:Umesh.Kallapa@windriver.com">
Kallapa, Umesh</a>; <a href=3D"mailto:Naveen.Gowda@windriver.com">Gowda, Na=
veen</a>;
<a href=3D"mailto:Shivaprasad.Moodalappa@windriver.com">Moodalappa, Shivapr=
asad</a><br>
<b>Subject: </b>Re: [PATCH v14] Rust Oe-Selftest implementation</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">CAUTION: This email c=
omes from a non Wind River email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
Hi Yash,<br>
<br>
On Fri, 2023-06-02 at 07:25 +0000, Shinde, Yash wrote:<br>
&gt;<br>
&gt; As discussed in the meeting, I am sharing the steps followed and host =
configurations used for the testing-<br>
&gt;<br>
&gt; Steps followed for testing-<br>
&gt;<br>
&gt; 1. Clone a fresh poky from $ git clone git://git.yoctoproject.org/poky=
<br>
&gt; 2. source the build environment setup script<br>
&gt; 3. add the meta-selftest layer in conf/bblayers.conf<br>
&gt; 4. add SANITY_TESTED_DISTROS=3D&quot;&quot; to local.conf<br>
&gt; 5. Apply the testing patch changes-<br>
&gt;&nbsp;&nbsp;&nbsp; a. Add&nbsp; meta/lib/oeqa/selftest/cases/rust.py fi=
le containing testing code<br>
&gt;&nbsp;&nbsp;&nbsp; b. Add meta/recipes-devtools/rust/files/rust-oe-self=
test.patch to exclude failing cases.<br>
&gt;&nbsp;&nbsp;&nbsp; c. Add rust-oe-selftest.patch in meta/recipes-devtoo=
ls/rust/rust-source.inc to apply on rust sources.<br>
&gt;&nbsp;&nbsp;&nbsp; d. Add &quot;do_test_compile ()&quot; for testing ru=
st sources in meta/recipes-devtools/rust/rust_1.69.0.bb<br>
&gt;&nbsp;&nbsp;&nbsp; e. Run the oe-selftest via &quot;oe-selftest -r rust=
.RustSelfTestBase.test_check&quot; command.<br>
<br>
As I promised, I did try these steps and you are correct that they are<br>
successful. However, if I try:<br>
<br>
&quot;bitbake rust&quot;<br>
<br>
I see the failure here:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/73/build=
s/7128/steps/12/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/=
builders/73/builds/7128/steps/12/logs/stdio</a><br>
<br>
likewise, I suspect &quot;bitbake nativesdk-rust&quot; will also fail with =
the<br>
other failure mentioned there.<br>
<br>
This does not happen unless your patch is applied so it is a<br>
regression. There are likely other failures however this one is pretty<br>
fundamental so we should start by fixing that.<br>
<br>
I did document my exact steps as follows:<br>
<br>
$ git clone git://git.yoctoproject.org/poky poky-rusttest<br>
$ cd poky-rusttest/<br>
$ source oe-init-build-env<br>
$ echo 'BBLAYERS +=3D &quot;/media/build/poky-rusttest/meta-selftest&quot;'=
 &gt;&gt;<br>
conf/bblayers.conf<br>
$ echo 'SANITY_TESTED_DISTROS =3D &quot;&quot;' &gt;&gt; conf/local.conf<br=
>
$ echo 'DL_DIR =3D &quot;/media/sources/&quot;' &gt;&gt; conf/local.conf<br=
>
$ wget<br>
<a href=3D"https://lore.kernel.org/openembedded-core/20230530105125.445622-=
1-yashinde145@gmail.com/raw">https://lore.kernel.org/openembedded-core/2023=
0530105125.445622-1-yashinde145@gmail.com/raw</a><br>
$ git am -s raw<br>
$ oe-selftest -r rust.RustSelfTestBase.test_check<br>
$ bitbake rust nativesdk-rust -k<br>
<br>
where the only real difference to your steps was to set DL_DIR to my<br>
local sources cache to avoid downloading things needlessly.<br>
<br>
<br>
Cheers,<br>
<br>
Richard<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SJ1PR11MB61295F1D6863021D6749FCC7EB4EASJ1PR11MB6129namp_--

