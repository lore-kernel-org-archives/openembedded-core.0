Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA69C433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 01:29:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.147.1652837370079377636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 18:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jZrxXzaN;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=2137c2352e=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24I1M1Sp000391
	for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 18:29:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=CpcKymISuQzumSQ9iswYhEhqBIv4Pejxemq3rtejbUw=;
 b=jZrxXzaN1aJYR0Nc4l84D+L0bfETjWt143aIekJrKsH9IT0rDikyJlZSR2cpw5eeriI3
 FsWK0gupPwcgn6YTbnoKzBEYhhCRCl2QBECwRRWPctAan/VCbfSsMy16uvzn61FTBFN3
 YQ0k/IKN6VjN3D6B96LiOtriBuw2xjYVFnq8YcTOgyEC+HaFEOQgCp9lSE9U9CuUjxMG
 XEgw7nOiqaybmTmtLl7UYiXSbqlxLG+obaVm/OzFhavt51V5DvOV8YVEgRh2pCvQnuOM
 8raIGaPrLM87L3Feks1G7GQN2UlZZU+wPSA2RzaaYHB97PvX8P9hGVYn16YC0eBOkJ4r wQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3g27q4twcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 18:29:26 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24I1QEKA010538
	for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 18:29:25 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3g27q4twcw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 May 2022 18:29:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNqDfvb/nBYIei1AzXMTJG/ANn/n01z5fPqn3D6hxdUMwtxn0ozUcsIlFoghm0R2vaYBtTOZa8E1dvu+7ojnbZxBpjD6498vQMKNsPyGeva5fLuk5Nk87aTRI46Siym6f1Mi7mRtQYkWJrZ3ES0py4MQ2drl3JkWQnOzsOCUBCWH/82GW2nfxMiXZTa2se26BHeaFYgMVP9J85H34Loaf7m9WhSH86Vv0ygj4bVQWICw/f5+AuhDVK0d9EErPDKTnR6CBwimfDjTeAFxEHC388Y1H/nUXvxxDvVSH2BDNW/hIWR8vOY6Eb2BAsfXU2ZU8FDt0tzOhOnoAkVH3KVypA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpcKymISuQzumSQ9iswYhEhqBIv4Pejxemq3rtejbUw=;
 b=lAl7rNN3y8PlEOf6YOJYx18tqNQJ5whN/IJu7QoiLQKZc4/uOltI4Kg2qZCT+2Hu/f2zpGd00Sh7sJb1Se7PVhPeA9/M8OBbu21wCU03qK/kIck/bNfALkZN5ecgotXlGrDNeVEWGeY4kB1hszqvXeVSnK+qus7f0/7oXXDMINyMGmP0ObMb4XouAOKXbSApnE97DbfGxpE2tVJ2nqSYn29b7CBNOHnXy3RBzJXIR3H5mltchnEgRJFnSotZz/jHQEbvAoM/GAY9YSnq9ewt06+uvXP1/Wm7kUPCtHH0aG4zdXHkJf7NldSVmihkoB3/jIwh48bFfHuvfPIwrtAXxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by MWHPR11MB1310.namprd11.prod.outlook.com (2603:10b6:300:28::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Wed, 18 May
 2022 01:29:22 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::4cb8:f51f:5fa8:4de]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::4cb8:f51f:5fa8:4de%5]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 01:29:22 +0000
From: "Li, Changqing" <Changqing.Li@windriver.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] squashfs-tools: always install prebuilt manpage
Thread-Topic: [OE-core] [PATCH] squashfs-tools: always install prebuilt
 manpage
Thread-Index: AQHYaRNbA0Jg4WR14E+XMteRzIZvUq0iU8aagABamACAASwQ+w==
Date: Wed, 18 May 2022 01:29:21 +0000
Message-ID: 
 <SN6PR11MB25574E091E31C39E9E61904982D19@SN6PR11MB2557.namprd11.prod.outlook.com>
References: <20220516104207.1734099-1-changqing.li@windriver.com>
	 <4e640d6e43aae9a6be851539f6ddbb7882b82a62.camel@linuxfoundation.org>
	 <SN6PR11MB255785E91DAB262B87A46FBD82CE9@SN6PR11MB2557.namprd11.prod.outlook.com>
 <3b2685854aa1b08583247b6144e5668332508499.camel@linuxfoundation.org>
In-Reply-To: 
 <3b2685854aa1b08583247b6144e5668332508499.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8a48375-b26e-4294-1f39-08da386dd608
x-ms-traffictypediagnostic: MWHPR11MB1310:EE_
x-microsoft-antispam-prvs: 
 <MWHPR11MB131080240EB0C33350A9773382D19@MWHPR11MB1310.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 7YMJny1BmyhLv/W51kdzzIxlBZRnW7Sf2fHquKwNX/ZJnt+8sUQeh1g+B31jrUAbdU+oGG94lnw+KjMPX4jBkOdddq4yBPT8UyaHiBgrD/wokOG8Ra3wwHFBoNqPNAr1b2cC3JDNld8J9EaQF6A7jcWJacp3BpvWlWww2RCVd/wFPPZpk3ijQdrWPDShlzOyziB4rxy48b7DC0WGJVPnaPqJWj7uzEOKNZhe5eeEnWxymbRaE+dljbayz551OxwIsbNrFs1KP+O+YCMjVUB6PITKWxcGlBAL9CNU0cpVCd0x0FQqy10RejpB4GsNaGfRqKYd5KCo0y4XKM5ycHakzWkfCaHwCLAE6iMBczDODr0RdVYeUzwHhM+2LxmZF8C0lLM8t5193kA7eoC7oNxDkQOB3/8phqgFOp4jATAlNceI0h0Qwc9vIeUTE0beC4GGBGctPk0poFP5ybrbuxJnl+GmsyypF0dTTRp/OFlVtCo9n3LMHIQ1vEYFeAFB2Wd6tanYLHk1zeMrtbr3pqRAKiZWpCW0WG6xijNz9DbinncA5cPj2QCyKvxg7SlJNwVNZi5RqIPeYKYtfbrP+U/jfIbLWv9KHjWgKtAPiXjZXnazaGlIjMJsxapT9+rJ36HKibYQLwqVV9PiGR7JR9ALVN7PsTY2fWbWWxZi/hYRHlOtZKX18KbKXYDEBPtJtxKF1jRU0KJ8UkmIdDlVeAvz9A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(2906002)(53546011)(83380400001)(7696005)(38070700005)(5660300002)(38100700002)(122000001)(52536014)(26005)(9686003)(55016003)(508600001)(19627405001)(6506007)(66476007)(91956017)(66446008)(66946007)(66556008)(76116006)(64756008)(186003)(8676002)(316002)(110136005)(71200400001)(86362001)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?oHaN1/LsuBFtf8Lu38+4Cs2ElLLLebazC2y+/4aQFGSyjIjSuix/oPIpjK?=
 =?iso-8859-1?Q?A1aTT1GbU8ZKtovWmRC7A2FHEGB/vBbltZ7mNwvE5Bv26inOrN3VPfzCXU?=
 =?iso-8859-1?Q?PJQkJcB/KMzbqJK02H3Kc3VjiBtfWxh5NwhGi+ZqpkBBZClp+Lt5OHmMCo?=
 =?iso-8859-1?Q?wYvsHFwmWBt7mwqRqNi5S6NA5tuiTznMpv1uayoJ/cqmkL6preB0i5wFdv?=
 =?iso-8859-1?Q?d0V74E+Hk4fTnKUYPlAPhMbp3iJwuLRaOv9HZr0jjYDPSGQ7mrYwXKVE6O?=
 =?iso-8859-1?Q?g4RVTQhC/ESA1a8W1PYDHNRH6zXXGyUquH3aRhRA0Yy+RjvnOPQnMDyHoT?=
 =?iso-8859-1?Q?dRlEvc+2PSDeb1e+YRRSxRKf0YDsOg0cg2Tst94SY5dNFEawBAbWNq4Y99?=
 =?iso-8859-1?Q?N6fxhmtLOJlzkaGgERkGdXG+r+kYGdgeCs8hF9pxcJB9f5tQ9YGYwfm0q1?=
 =?iso-8859-1?Q?xm1OE9al51VXJaybgEiocg6Ijumd1UGzPIAgOO7XBjAk17MdE+Rn7RZuTH?=
 =?iso-8859-1?Q?uGUcft9mSOPwJG2axg9/5QlsqD+OO+Ny8eyn1IkwTItFJPe+MbaHjlE4N9?=
 =?iso-8859-1?Q?lRPBd5OkvPDTY1JufCfwqZyiR9Z826OmFSqQrrkkvnR+tyibQx0Gvl6jVz?=
 =?iso-8859-1?Q?CzQ3naxJkjvD0nAJntc4+UNGhGnyGHtR2xQcmY7PVSuNfnfHM1KKgWH16f?=
 =?iso-8859-1?Q?gub3sBiecHJj8jHWUs5ubjvhdCoBneEBGgE11V+0SBKeJyFEa0Fw3lLHuB?=
 =?iso-8859-1?Q?L8QN2k4v4jkyu7FR+667+Lb6vMmjK0eo6deL9GjRoZ47mm6EcyAfx0Zqv3?=
 =?iso-8859-1?Q?MEO8pnmpK8k69a8x8PDY8PcRJHMud/+U1IzSIyPO3JbMYaja8BKa1DQeOY?=
 =?iso-8859-1?Q?L1vURrQ6sr0s3q9zUJjNngkV6gfQpuRRQoc5Zg04SNBwlWDaOHkBLld53T?=
 =?iso-8859-1?Q?mdLbReCIulS+Q+afEPKadm9aVnKR2UBug3g51lrvk+lmIJaWv48sNUlU3W?=
 =?iso-8859-1?Q?XWxTjHsjLXFeCMo1bGQccLM5jBfXW7wA1JeoR+EJq5GY4zj5JsfDUX7bWP?=
 =?iso-8859-1?Q?4pOVFbxS8SjmWx9yyN8tr/zdQNBD0EE2Oq01kp5a/cTRK0H7RZIe4PUmli?=
 =?iso-8859-1?Q?Gk7jTiJG0oZ7SED/k0hoVXQzKbUFINIfJCsKMeICGZXhVgl3evzKM/5IBl?=
 =?iso-8859-1?Q?ysamnEyoDfxCgfp5dE6W67dSCyd4M3BuB9cNAsBwOH7Yov9tT5StWdLQhN?=
 =?iso-8859-1?Q?MFr0KB+bh4wrrloG59cAkS36JcRHIXAkBE9vnZBRFffTTKvbwGW0OZPsy9?=
 =?iso-8859-1?Q?XXW9nzrRj+CkL7icUSWB/PHRpMZHoAC//1xTQIORbmXgX34XqCVX6s/SiT?=
 =?iso-8859-1?Q?cxnEgNENIeHzchnAW3PqM/h9biJVgv39Pgc1cl1gVCx22EAiPIAyqZQxwV?=
 =?iso-8859-1?Q?o/vcEREMB2vcWrdRLc4WDSZ4S0hwbP5ZDkqNbuKLR6ReVjGWKhUOcjfpCY?=
 =?iso-8859-1?Q?pm5JViALGny74x4NTgr3eDbPkapfAag+leYjr/oInokp9yrmAZlbSH9WfQ?=
 =?iso-8859-1?Q?pqbC58LPEu57W4Rd0YoQaSIFVHbZineCiKBfLb9my4hk5JbfosecdzUxow?=
 =?iso-8859-1?Q?n2ByoevZqZUKJ4q+biSmYNecSqiVwcD8Ud87qHTqu223aeqhIAM8p1essW?=
 =?iso-8859-1?Q?B4LUxnlWCafyBm6WbNPmaSrrQqYzhMo078waICL40J5JSDydt80hqJkOP3?=
 =?iso-8859-1?Q?2wRKWAb9M8xU6eJNdE+5BbmR0k/fVSe17r3bWSRmMUE6zb798mgsFsTCfY?=
 =?iso-8859-1?Q?S5I8pUgdK5Fu4IfmxEldnfBOM2NQ/Gk=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SN6PR11MB25574E091E31C39E9E61904982D19SN6PR11MB2557namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e8a48375-b26e-4294-1f39-08da386dd608
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 01:29:21.9481
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 oZvRswqZo8SN5hL9U2+okrIc7RzS0JOoZsGfRWOs/CC0pvJEjRPLeHCpGlAN+J/FnkHLo0t2MH+scg2YoTxyrdcP04e0C9eQusyP2+dSd/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1310
X-Proofpoint-ORIG-GUID: SVhhvAP2VlzL7hOmVtMG3tUyweP_AcAQ
X-Proofpoint-GUID: NzoNgXQPtDLit9a8l5ma62JiICWO9hlJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-17_06,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 mlxlogscore=950 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205180006
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 01:29:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165781

--_000_SN6PR11MB25574E091E31C39E9E61904982D19SN6PR11MB2557namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: richard.purdie@linuxfoundation.org <richard.purdie@linuxfoundation.or=
g>
Sent: Tuesday, May 17, 2022 3:32 PM
To: Li, Changqing <Changqing.Li@windriver.com>; openembedded-core@lists.ope=
nembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] squashfs-tools: always install prebuilt manp=
age

[Please note: This e-mail is from an EXTERNAL e-mail address]

On Tue, 2022-05-17 at 02:27 +0000, Li, Changqing wrote:
>
>
> From: richard.purdie@linuxfoundation.org
> <richard.purdie@linuxfoundation.org>
> Sent: Monday, May 16, 2022 6:54 PM
> To: Li, Changqing <Changqing.Li@windriver.com>;
> openembedded-core@lists.openembedded.org
> <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH] squashfs-tools: always install
> prebuilt manpage
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Mon, 2022-05-16 at 18:42 +0800, Changqing Li wrote:
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > When other feature enabled, and involve help2man into squashfs-
> > tools's
> > recipe-sysroot-native, install-manpages.sh will run target binary
> > on
> > build host, eg: mksquashfs --help, which will cause error.
> > Eg:
> >   ../squashfs-tools/mksquashfs: /lib/x86_64-linux-gnu/libc.so.6:
> > version `GLIBC_2.34' not found (required by ../squashfs-
> > tools/mksquashfs)
> > > help2man: can't get `--help' info from
> > > /tmp/tmp.pEG5R8COVb/mksquashfs.sh
> > > Try `--no-discard-stderr' if option outputs to stderr
> > > ./mksquashfs-manpage.sh: help2man returned error.  Aborting
> > > ../generate-manpages/install-manpages.sh: Failed to generate
> > > manpage.  Aborting
> >
> > Fixed by always install prebuilt manpage, avoid running target
> > binary on
> > build host
> >
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
>
> I'd much prefer not to carry a patch doing this. Which "other feature
> enabled" trigger this to happen?
>
> When  meta-secure-core  is involved,  and DISTRO_FEATURES efi-secure-
> boot and ima is enabled,
> in meta-signing-key/classes/user-key-store.bbclass,  it will add
> DEPENDS as following:
> DEPENDS:append:class-target =3D " \
>     ${@bb.utils.contains("DISTRO_FEATURES", "efi-secure-boot",
> "sbsigntool-native", "", d)} \
>     ${@bb.utils.contains("DISTRO_FEATURES", "efi-secure-boot",
> "libsign-native", "", d)} \
>     openssl-native \
>     ${@bb.utils.contains("DISTRO_FEATURES", "efi-secure-boot",
> "efitools-native gnupg-native", "", d)} \
> "
>
> and efitools-native  DEPENDS  on  help2man-native,  so all target
> depends on help2man-native.
> efitools's manpage also don't configurable.
>
> We might want to talk to upstream about making this configurable
> rather
> than carrying a patch, or we make sure help2man is never accessible
> to
> this recipe in some other way.
>
> I will talk to upstream about this first.

What would also probably help is adding help2man-native to
SSTATE_EXCLUDEDEPS_SYSROOT in layer.conf in OE-Core.

That runs the risk of triggering some build failures as it did when we
added pkgconfig-native there but is probably the right thing to do. It
would force recipes that want help2man-native to have an explicit
DEPENDS so we'd have to test and fix any recipes that needed that
adding.

Thanks,  I will send a V2 patch with this solution later.

Regrads,
Changqing

Cheers,

Richard


--_000_SN6PR11MB25574E091E31C39E9E61904982D19SN6PR11MB2557namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size: 11pt;"><b>From:</b> richard.purdie@linu=
xfoundation.org &lt;richard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> Tuesday, May 17, 2022 3:32 PM<br>
<b>To:</b> Li, Changqing &lt;Changqing.Li@windriver.com&gt;; openembedded-c=
ore@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;=
<br>
<b>Subject:</b> Re: [OE-core] [PATCH] squashfs-tools: always install prebui=
lt manpage</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText elementToProof">[Please note: This e-mail is from a=
n EXTERNAL e-mail address]<br>
<br>
On Tue, 2022-05-17 at 02:27 +0000, Li, Changqing wrote:<br>
&gt;<br>
&gt;<br>
&gt; From: richard.purdie@linuxfoundation.org<br>
&gt; &lt;richard.purdie@linuxfoundation.org&gt;<br>
&gt; Sent: Monday, May 16, 2022 6:54 PM<br>
&gt; To: Li, Changqing &lt;Changqing.Li@windriver.com&gt;;<br>
&gt; openembedded-core@lists.openembedded.org<br>
&gt; &lt;openembedded-core@lists.openembedded.org&gt;<br>
&gt; Subject: Re: [OE-core] [PATCH] squashfs-tools: always install<br>
&gt; prebuilt manpage<br>
&gt; [Please note: This e-mail is from an EXTERNAL e-mail address]<br>
&gt;<br>
&gt; On Mon, 2022-05-16 at 18:42 +0800, Changqing Li wrote:<br>
&gt; &gt; From: Changqing Li &lt;changqing.li@windriver.com&gt;<br>
&gt; &gt;<br>
&gt; &gt; When other feature enabled, and involve help2man into squashfs-<b=
r>
&gt; &gt; tools's<br>
&gt; &gt; recipe-sysroot-native, install-manpages.sh will run target binary=
<br>
&gt; &gt; on<br>
&gt; &gt; build host, eg: mksquashfs --help, which will cause error.<br>
&gt; &gt; Eg:<br>
&gt; &gt;&nbsp;&nbsp; ../squashfs-tools/mksquashfs: /lib/x86_64-linux-gnu/l=
ibc.so.6:<br>
&gt; &gt; version `GLIBC_2.34' not found (required by ../squashfs-<br>
&gt; &gt; tools/mksquashfs)<br>
&gt; &gt; &gt; help2man: can't get `--help' info from<br>
&gt; &gt; &gt; /tmp/tmp.pEG5R8COVb/mksquashfs.sh<br>
&gt; &gt; &gt; Try `--no-discard-stderr' if option outputs to stderr<br>
&gt; &gt; &gt; ./mksquashfs-manpage.sh: help2man returned error.&nbsp; Abor=
ting<br>
&gt; &gt; &gt; ../generate-manpages/install-manpages.sh: Failed to generate=
<br>
&gt; &gt; &gt; manpage.&nbsp; Aborting<br>
&gt; &gt;<br>
&gt; &gt; Fixed by always install prebuilt manpage, avoid running target<br=
>
&gt; &gt; binary on<br>
&gt; &gt; build host<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Changqing Li &lt;changqing.li@windriver.com&gt;<br=
>
&gt;<br>
&gt; I'd much prefer not to carry a patch doing this. Which &quot;other fea=
ture<br>
&gt; enabled&quot; trigger this to happen?<br>
&gt;<br>
&gt; When&nbsp; meta-secure-core&nbsp; is involved,&nbsp; and DISTRO_FEATUR=
ES efi-secure-<br>
&gt; boot and ima is enabled,<br>
&gt; in meta-signing-key/classes/user-key-store.bbclass,&nbsp; it will add<=
br>
&gt; DEPENDS as following:<br>
&gt; DEPENDS:append:class-target =3D &quot; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; ${@bb.utils.contains(&quot;DISTRO_FEATURES&quo=
t;, &quot;efi-secure-boot&quot;,<br>
&gt; &quot;sbsigntool-native&quot;, &quot;&quot;, d)} \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; ${@bb.utils.contains(&quot;DISTRO_FEATURES&quo=
t;, &quot;efi-secure-boot&quot;,<br>
&gt; &quot;libsign-native&quot;, &quot;&quot;, d)} \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; openssl-native \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; ${@bb.utils.contains(&quot;DISTRO_FEATURES&quo=
t;, &quot;efi-secure-boot&quot;,<br>
&gt; &quot;efitools-native gnupg-native&quot;, &quot;&quot;, d)} \<br>
&gt; &quot;<br>
&gt;<br>
&gt; and efitools-native&nbsp; DEPENDS&nbsp; on&nbsp; help2man-native,&nbsp=
; so all target<br>
&gt; depends on help2man-native.<br>
&gt; efitools's manpage also don't configurable.<br>
&gt;<br>
&gt; We might want to talk to upstream about making this configurable<br>
&gt; rather<br>
&gt; than carrying a patch, or we make sure help2man is never accessible<br=
>
&gt; to<br>
&gt; this recipe in some other way.<br>
&gt;<br>
&gt; I will talk to upstream about this first.<br>
<br>
What would also probably help is adding help2man-native to<br>
SSTATE_EXCLUDEDEPS_SYSROOT in layer.conf in OE-Core.<br>
<br>
That runs the risk of triggering some build failures as it did when we<br>
added pkgconfig-native there but is probably the right thing to do. It<br>
would force recipes that want help2man-native to have an explicit<br>
DEPENDS so we'd have to test and fix any recipes that needed that<br>
adding.</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">Thanks,&nbsp; I will send a V2 patc=
h with this solution later.</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">Regrads,</div>
<div class=3D"PlainText elementToProof">Changqing<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SN6PR11MB25574E091E31C39E9E61904982D19SN6PR11MB2557namp_--

