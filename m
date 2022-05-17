Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B64C433F5
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 01:07:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.1784.1652749650019707046
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 18:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=rRXn2MVK;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=2136de53c6=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24H0uL8P021162
	for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 18:07:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=FOa/aeMmBhdIs/F40POqDsTNihO/3xlRpUd62ZPD4xM=;
 b=rRXn2MVKhtpzlb+7WGPnQ+n7r9sRBPFUuYY17oC9BS0UxsT7tgC+JQEGQQcnAfFrmais
 +y2q+ysT/IQCfg2m2bXXfkE5fTvz0Abb1+a0OAEaiMRuT7ahn7VYuvGHkl3P1zooBk9B
 movH38R7V0+k6wcjRBoCxWp3qeyewF5xy48VMbcIlfh2GAAGdOaHVzE1pPE8eYtA4uMo
 a6hgrjt9Qc4etbJlkvIo3VuNGTi/mdU6YpD4pw548+BrQ7FsZuCUOiH/PSHF8ODiR8Mn
 uK7J6dnCkwxim3a3hrb40qcqFAam8dOiGxdt4Z3K9oAN6N8Rba2XFTvNOQaFHX0bERez lw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3g27q4sy0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 18:07:28 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24H17SG3015679
	for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 18:07:28 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3g27q4sy0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 May 2022 18:07:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NEQCQVkWXBPckxh+EZpJ9foy9miLu29H7bPiljqRAOHZSIx9vk/nN/G+HGCq1a08FgZP3IEMEkn543g+gVdRVVuELAWWzT3i1pTVN22Jt9puhpsGxpTMTg2bGdKNCNSEUdBGlGBpHq4YC2stn2+uS2TgXKPEjGFButJ9buI/aGIpaXuwWfyU+rmrd405+JmWpEnRB2Gd1R0x2IzwPvmDb39N74DW6N0JsN+y5FcyUYMZnk28pog7Hts4pGfo6cpfh8062E5PmUKH04uWpMT7/6aMbfl0yandWckFeX503IBK44jT5bddD2HBYbNTpYnXRiKTbAjU55J6wxZGxkIK9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOa/aeMmBhdIs/F40POqDsTNihO/3xlRpUd62ZPD4xM=;
 b=eVFkLL1PxdgIZFMcvNcEEz1qwN/X13urEGtjKWSQ1gWZKZ4zv1vKWUldZXAGLxeRi6NuVJPzXPAX10+EtkCoDV1damYWmKCUwQIL1Sx0YjAjqO8ow1Bw8Ib4w0nhabEIEjhCNvUk/K0pu+p8fBIXSzvUg8avRLL0vxJIDPWeHfDqByX5mRXwQ8kAvnwvm4SudkqYfoGg6wR9ziWu3sX6k4acChUzAAj2eudvwlsGhUrn8JK2eunNEVxLrzXHEoiK9ic4BP1XjMsBPgNSndVcHW2edMidiyvCMCW6xG98e8m3ZxwKlTDFPymH1QPnIT5dDhDcJVL55Zg5BXIkQU0+ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by BN7PR11MB2580.namprd11.prod.outlook.com (2603:10b6:406:b5::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 01:07:26 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::c103:34e:6b82:8f92]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::c103:34e:6b82:8f92%4]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 01:07:25 +0000
From: "Li, Changqing" <Changqing.Li@windriver.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
        Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] eudev: create static nodes from modules
Thread-Topic: [OE-core] [PATCH] eudev: create static nodes from modules
Thread-Index: 
 AQHYZdRZqwkCY9rhpkqR+6R+bYoS160bC92AgAD6iqOABAaoAIAA8tTggACFWiGAAMOzVg==
Date: Tue, 17 May 2022 01:07:25 +0000
Message-ID: 
 <SN6PR11MB25574D269802D3241D83BC7582CE9@SN6PR11MB2557.namprd11.prod.outlook.com>
References: <20220512054303.429208-1-changqing.li@windriver.com>
 <CAO5Uq5TO3gZQNkucAy9s8aiJ=0+nMJDe-zw=SBT+wOjbUQwniQ@mail.gmail.com>
 <dbf5957af1a1afd39a90465b47eeae90fa6f350e.camel@linuxfoundation.org>
 <SN6PR11MB25578B38EF44CB5A0D00A40782CA9@SN6PR11MB2557.namprd11.prod.outlook.com>
 <CAO5Uq5Tyakm1_Q26j93ok83of5Uru-J07i4657fg58AYxBTaQw@mail.gmail.com>
 <SN6PR11MB255731C22AC93F566A3FEB6C82CF9@SN6PR11MB2557.namprd11.prod.outlook.com>
 <16EF875D3CF1EBA0.26893@lists.openembedded.org>
 <CAO5Uq5Sffo9-v-L_ZUrL5fTTskjXjoOtmX-Bf5AddBV5R6FXYw@mail.gmail.com>
In-Reply-To: 
 <CAO5Uq5Sffo9-v-L_ZUrL5fTTskjXjoOtmX-Bf5AddBV5R6FXYw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4108daeb-b965-44e6-a608-08da37a19b18
x-ms-traffictypediagnostic: BN7PR11MB2580:EE_
x-microsoft-antispam-prvs: 
 <BN7PR11MB25802586FD4A5157AECDBC0F82CE9@BN7PR11MB2580.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jWSpPOyGJN1IpXjp+JpVYjR7j3t7SgjCJeDB/T/eDMdyPqa+idrTx4Nbc7DFWY0PI7KMYM6y42KtJv+0kSpZ+pWyMmUbrrpeyCsQoMry0pK5Vk9dOoOOnP0v5xsbgXPxwJuggGptDzJCLS/mjfQrjDNcy7DieDcUcXlCWKd4wJ1jHm08EFgmT9ukEN2Dl1J+Wbb5jBsY8AE+3z97q9VJBMizUI+gVtz6aA4lt9Y9JtzEfKQUGoH7X2hWqS/9Hi4SBRW1VqVAcSLJP8se6VEIG20ncaXJ/dFHsVPURi6OX/g2XYLwSA6GgBnvKwFyNemqrSQ1ZoZ+tajFVXpEQDwEu8M1sPaRdyZXqq7QZGhcq66XiEqfNLcSp95xQi72Mn+ioMLl/C7N/WCgG4oWu+YAuFwQnrErGzYIgNiRPwmIorLmP959cJRy+UCoSNOL9ffJdloeRE4CJaTzoZYs0UZyj45dHE3ZwRDwauHNH9bEebVaDddJ42bHoxEW1o4nKt5Qp5VFf5GbPhk6HlTNcj9lRqbpsq37KpI7nFKu1osXIE8V6M0XPQFnsgX3PPIILVJlhpTb7r/1iEQNMRif/atX3Wdt9DSVk3oo7lq3XPoDlDj6Ss7GzpReTIXLQqkctPLtY07Sald7gQoqxQBVi8z/4Q+v1ma+zwrOvBFlJHjfkkKhHtXZfPI2irq9pa4HdonZ+Tdtj9vdVUG8KtOaLV6VNbLfjBV+YH4VpjC57sIA9eBA5f1MXUuLHIoNamekN6B2MBh/nNre5xFQc0PwML5nvr3EfoxG6ie11cWWSvR+EMrKgQw1R8NZJDg1rFrGQiG7RoP2ui65mfHsMXg94XoKjQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(19627405001)(6506007)(54906003)(38100700002)(55016003)(316002)(53546011)(6916009)(2906002)(166002)(5660300002)(26005)(9686003)(66946007)(71200400001)(64756008)(66556008)(8676002)(4326008)(66446008)(66476007)(91956017)(86362001)(186003)(966005)(7696005)(76116006)(122000001)(33656002)(52536014)(8936002)(38070700005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?sjiWRZmCMs/KBeGqlxC7xTiVisdH9j5Syw7LGVtJvZrEiJr30BUBH3I2T2?=
 =?iso-8859-1?Q?pTn6HFq8W8zBrCxP2BuwE6a6iOPv/4QGns5tWXZV+yj+SnNDx0SjmOgtOY?=
 =?iso-8859-1?Q?itSYe6tyRZa/sRH8E9RWG9LUZxnq7qvuQPiIF+k6HKxoMzwi3st4lpWDE4?=
 =?iso-8859-1?Q?HV6+QInU7GPDDPFFsvGcMt17XGQAdt9VmnRzjwXkdLXluVTDW97dRKDd2D?=
 =?iso-8859-1?Q?6AYf5xQyFq8FPM+0SZC558eHuvFa4Ei10g0uxXfilrNPAG+f2ry48w5u/y?=
 =?iso-8859-1?Q?MYWx6mPpMRIthE7Ug3KDM+OPmdwUA6v1jLIEJ3866rTYnSKCWLPptsOmy1?=
 =?iso-8859-1?Q?Ynb68MBo7HNGzV28QRrQ0QHB3eYDX0fCbiE/R2kLRwneUUsxhdzQUZd0qq?=
 =?iso-8859-1?Q?QEamwi5zv4ER3CjGA4khifWzK5Ew4L/dTS5FElYKipSrbjHmCUHVl0pEWB?=
 =?iso-8859-1?Q?fW41xU0rIrz9MA9rfQIVuiPNRYg1fOUkyePShnixBCwtbILTj/4xkJKokj?=
 =?iso-8859-1?Q?MrY4QSZxNFMYyZ+7NrshM7qN0vi74DlsYZSWXwBaSAMeqHgpYfoFg554Bw?=
 =?iso-8859-1?Q?HRYnAFw4UAJ04AYRFBkzzjwNny46n/os5nbeMi21d/5ew1uP2ZxbTi9qGA?=
 =?iso-8859-1?Q?puBEPmK7c30Uv+Fyqe1qnY3cCdVp9nSxVSdorluHBqC6F6eWNqEjmyvTD5?=
 =?iso-8859-1?Q?y15cnSvgaiSGou1TrnjpnMSXt0ssJHFAM6hSYIbslfu+L5IzzsZDGPDk08?=
 =?iso-8859-1?Q?immkZXvKGmVKDUCrGOY9Se3CkKWzoLM8s0HOqNkA6d4rOuFKXl21NQMpIV?=
 =?iso-8859-1?Q?pLoBGfy9tMPFEJsMje6we+lUOPliiagyDXZsn4U6R+e51kWskGr/Gavm/l?=
 =?iso-8859-1?Q?MvwM6E9s/FKbAFHDSyZt9VJpLd3cEI3a5sfEQbF7RSuW6fnM9uP/KGNw8j?=
 =?iso-8859-1?Q?Er5Tj5Qob4gvKppIaE0MpZkhelWHUFMirG/o/SqWmiN8G+zRYveJ2pvauB?=
 =?iso-8859-1?Q?ElSGuZEfSrUECs17aGIFTSlRdYR8Ep6wYplKNHEAe//h9w3hexWJd/pX8Q?=
 =?iso-8859-1?Q?PhRD4QU74O+5+hlREeUIIS5iJhDfnMylCF4iX4vvKdXepjLxnXAMtP1ala?=
 =?iso-8859-1?Q?14lQmu7LO962ze+Pvcb0FZ4pzdaHRq/BwjQ9syrT2sHhIM+PgK/gwKA1Ve?=
 =?iso-8859-1?Q?89+csLx2wosEfJ9m4zFTVmmn5MDk917eVczVB9RizJ7WKCtU+sDB04W0tI?=
 =?iso-8859-1?Q?9EaMNqRTCl179mOs+dWeXtqF/LPlA0u+mTV8jRWuQDazx8uePnkjyAko2G?=
 =?iso-8859-1?Q?60v/pFQevj8WYC1jAs5mFTWgFRaMJ7I9vGhsca5FVQNltdjXRmClHXpaV7?=
 =?iso-8859-1?Q?uv6PKGfuxlWIQ8fQtmIc+94Yhkud58GeC6l25zBaeWzwU5Kd7moqM9K2CY?=
 =?iso-8859-1?Q?cKxNjBNA4a/kxMsj1g/pDyWb9idra+hOU1p71ZHY9CiIDkDc/QIMOdr5ux?=
 =?iso-8859-1?Q?rcL5GnbuY00zUhQDBIE5a8xof6vXPI6AKIzV4RsytMDcNOY4M6zzJ3lVzi?=
 =?iso-8859-1?Q?hvk8B67OEfjtrFowTKkg7s5p4/dD88ykhKRxW1zENgEXfU9dpVkbX28oJm?=
 =?iso-8859-1?Q?CNekzk+BQEPvyHvQDs1HXN5W6i/m4pMfmAFf6RJdgFywDZDKO82wWYtFeR?=
 =?iso-8859-1?Q?HnQy0k9d7slcSKMoMMdhOK6o0wB2M1Ze2jpqzHaAk6CDa3Y+DJW2C6c8d8?=
 =?iso-8859-1?Q?j1lq2s2wcHyOgQjNXzZVJWKI/dw+p2DoTTWD1MoxJ9tHWmOOxAw1xqlYsR?=
 =?iso-8859-1?Q?G2DOSJgiTDOypABJFBXm9m2zLfDjOyk=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SN6PR11MB25574D269802D3241D83BC7582CE9SN6PR11MB2557namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4108daeb-b965-44e6-a608-08da37a19b18
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 01:07:25.7067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 CG/pVNaoisst1/2JVwU57Es+rxXsNWsD6jdzTtQNqrsTG8AIZ29QBJ8KlRD6iZcPJv6lLHo/1I0SguOBYRqN7Va4x+auVQRXt63QlLAG31A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2580
X-Proofpoint-ORIG-GUID: 8lV7w4pLZPnZcKc3Wi6g3A1SU5-5c_zH
X-Proofpoint-GUID: ucuKXJBL5eqabqiX3LU7IiQAcAHBZjzk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-16_16,2022-05-16_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 mlxlogscore=981 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205170004
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 01:07:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165701

--_000_SN6PR11MB25574D269802D3241D83BC7582CE9SN6PR11MB2557namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: Alex Kiernan <alex.kiernan@gmail.com>
Sent: Monday, May 16, 2022 9:25 PM
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Li, Changqing <Changqing.Li@windriver.com>; richard.purdie@linuxfoundat=
ion.org <richard.purdie@linuxfoundation.org>; Patches and discussions about=
 the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] eudev: create static nodes from modules

[Please note: This e-mail is from an EXTERNAL e-mail address]

On Mon, May 16, 2022 at 9:07 AM Alex Kiernan via
lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Untested, but if its useful (I suspect cut & paste will have broken space=
s):
Thanks.  I will test this.
>
> diff --git a/meta/recipes-core/udev/eudev/init
> b/meta/recipes-core/udev/eudev/init
> index c60dbbf6d512..64cd0ea3ef39 100644
> --- a/meta/recipes-core/udev/eudev/init
> +++ b/meta/recipes-core/udev/eudev/init
> @@ -23,6 +23,38 @@ kill_udevd () {
>      [ -n "$pid" ] && kill $pid
>  }
>
> +make_static_nodes () {
> +       kmod static-nodes --format=3Dtmpfiles |
> +       while read TTYPE TPATH TMODE TUSER TGROUP TAGE TARG; do
> +       case "${TTYPE}" in
> +       'd')
> +               test -d "${TPATH}" || mkdir -p -m "${TMODE}" "${TPATH}"
> +               ;;
> +
> +       'c!')
> +               if [ ! -c "${TPATH}" ]; then
> +                       old_ifs=3D"${IFS}"
> +                       IFS=3D:
> +                       set -- ${TARG}
> +                       IFS=3D"${old_ifs}"
> +                       mknod -m "${TMODE}" "${TPATH}" c "$@"
> +               fi
> +               ;;
> +
> +       *)
> +               echo ERROR
> +               exit 1
> +               ;;
> +       esac
> +       if [ "${TUSER}" !=3D "-" ]; then
> +               chown "${TUSER}" "${TPATH}"
> +       fi
> +       if [ "${TGROUP}" !=3D "-" ]; then
> +               chown "${TGROUP}" "${TPATH}"

chgrp

> +       fi
> +       done
> +}
> +
>  case "$1" in
>    start)
>      export ACTION=3Dadd
> @@ -51,6 +83,8 @@ case "$1" in
>      # make_extra_nodes
>      kill_udevd > "/dev/null" 2>&1
>
> +    make_static_nodes
> +
>      # trigger the sorted events
>      [ -e /proc/sys/kernel/hotplug ] && printf '\0\n' >/proc/sys/kernel/h=
otplug
>      @UDEVD@ -d
>
> On Mon, May 16, 2022 at 6:35 AM Li, Changqing
> <Changqing.Li@windriver.com> wrote:
> >
> >
> >
> > ________________________________
> > From: Alex Kiernan <alex.kiernan@gmail.com>
> > Sent: Sunday, May 15, 2022 10:59 PM
> > To: Li, Changqing <Changqing.Li@windriver.com>
> > Cc: richard.purdie@linuxfoundation.org <richard.purdie@linuxfoundation.=
org>; Patches and discussions about the oe-core layer <openembedded-core@li=
sts.openembedded.org>
> > Subject: Re: [OE-core] [PATCH] eudev: create static nodes from modules
> >
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > On Fri, May 13, 2022 at 2:42 AM Li, Changqing
> > <Changqing.Li@windriver.com> wrote:
> > >
> > >
> > >
> > > ________________________________
> > > From: richard.purdie@linuxfoundation.org <richard.purdie@linuxfoundat=
ion.org>
> > > Sent: Thursday, May 12, 2022 6:33 PM
> > > To: Alex Kiernan <alex.kiernan@gmail.com>; Li, Changqing <Changqing.L=
i@windriver.com>
> > > Cc: Patches and discussions about the oe-core layer <openembedded-cor=
e@lists.openembedded.org>
> > > Subject: Re: [OE-core] [PATCH] eudev: create static nodes from module=
s
> > >
> > > [Please note: This e-mail is from an EXTERNAL e-mail address]
> > >
> > > On Thu, 2022-05-12 at 08:45 +0100, Alex Kiernan wrote:
> > > > On Thu, May 12, 2022 at 6:43 AM Changqing Li <changqing.li@windrive=
r.com> wrote:
> > > > >
> > > > > From: Changqing Li <changqing.li@windriver.com>
> > > > >
> > > > > dev in modules.devname should be populated in /dev on boot.
> > > > > remove create static mode from udevd will make these devices
> > > > > cannot be populated. When use sysVinit, devices like /dev/net/tun
> > > > > will not be created.
> > > > >
> > > > > more info:
> > > > > udevd in systemd also remove create static mode in udevd, but usi=
ng
> > > > > service kmod-static-nodes.service and
> > > > > systemd-tmpfiles-setup-dev.service in systemd to create these nod=
e, so
> > > > > systemd works well.
> > > > >
> > > > > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > > > > ---
> > > > >  ...dev-create-static-nodes-from-modules.patch | 115 ++++++++++++=
++++++
> > > > >  meta/recipes-core/udev/eudev_3.2.11.bb        |   1 +
> > > > >  2 files changed, 116 insertions(+)
> > > > >  create mode 100644 meta/recipes-core/udev/eudev/0001-eudev-creat=
e-static-nodes-from-modules.patch
> > > > >
> > > > > diff --git a/meta/recipes-core/udev/eudev/0001-eudev-create-stati=
c-nodes-from-modules.patch b/meta/recipes-core/udev/eudev/0001-eudev-create=
-static-nodes-from-modules.patch
> > > > > new file mode 100644
> > > > > index 0000000000..19611f4e89
> > > > > --- /dev/null
> > > > > +++ b/meta/recipes-core/udev/eudev/0001-eudev-create-static-nodes=
-from-modules.patch
> > > > > @@ -0,0 +1,115 @@
> > > > > +From 573d6c4106d5b3828da43d2843c1d599ae3cd1cd Mon Sep 17 00:00:0=
0 2001
> > > > > +From: Changqing Li <changqing.li@windriver.com>
> > > > > +Date: Tue, 10 May 2022 14:04:35 +0800
> > > > > +Subject: [PATCH] eudev: create static nodes from modules
> > > > > +
> > > > > +Revert commit <src/udev/udevd.c: remove create static nodes from=
 modules>
> > > > > +https://gitweb.gentoo.org/proj/eudev.git/commit/?id=3D2b7abd5ec9=
cc47a8b895df6db77fb1537c6f1a39
> > > > > +
> > > > > +Upstream-Status: Inappropriate [oe-specific]
> > > > > +
> > > > > +Upstream intentionally remove create static nodes from modules, =
it is
> > > > > +expected handled by tmpfiles services, refer [1].
> > > > > +[1] https://github.com/eudev-project/eudev/issues/229
> > > > > +
> > > > > +For yocto, when start with sysVinit, to enable systemd distro fe=
ature,
> > > > > +and install systemd-tmpfiles is not proper, so revert this commi=
t.
> > > > > +
> > > >
> > > > Reading the upstream issue, I'm not sure this really is an
> > > > "Inappropriate" upstream. eudev has dropped this commit, because yo=
u
> > > > can use systemd-tmpfiles ("as it works without systemd and can be
> > > > compiled individually" - presumably using our unsupported musl
> > > > patches...) or opentmpfiles (which is dead and points you back to
> > > > systemd-tmpfiles).
> > > >
> > > > Feels like this is an engage with upstream rather than carry a patc=
h
> > > > forever which just causes us to be perpetually divergent.
> > >
> > > I agree, this does sound like something we need to address to keep th=
e
> > > project maintainable...
> > >
> > > I tried to suggest upstream to add this back,  but  upstream seems pr=
efer to use tmpfile solution.
> > >
> >
> > Given how limited the output format which static-nodes generates for
> > tmpfiles is (just d and c! entries), parsing that output directly as
> > part the eudev init script wouldn't be horrible. Or make kmod generate
> > files in the format that volatiles expects? Though that would need
> > populate-volatile extending to generate device nodes.
> >
> > Thanks, I will dig more about the tmpfile solution, and send a V2 patch=
.
> >
> > Regards
> > Changqing
> >
> > --
> > Alex Kiernan
>
>
>
> --
> Alex Kiernan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165667): https://lists.openembedded.org/g/openembedde=
d-core/message/165667
> Mute This Topic: https://lists.openembedded.org/mt/91052396/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
Alex Kiernan

--_000_SN6PR11MB25574D269802D3241D83BC7582CE9SN6PR11MB2557namp_
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
lor=3D"#000000" style=3D"font-size: 11pt;"><b>From:</b> Alex Kiernan &lt;al=
ex.kiernan@gmail.com&gt;<br>
<b>Sent:</b> Monday, May 16, 2022 9:25 PM<br>
<b>To:</b> Alex Kiernan &lt;alex.kiernan@gmail.com&gt;<br>
<b>Cc:</b> Li, Changqing &lt;Changqing.Li@windriver.com&gt;; richard.purdie=
@linuxfoundation.org &lt;richard.purdie@linuxfoundation.org&gt;; Patches an=
d discussions about the oe-core layer &lt;openembedded-core@lists.openembed=
ded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] eudev: create static nodes from modul=
es</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText elementToProof">[Please note: This e-mail is from a=
n EXTERNAL e-mail address]<br>
<br>
On Mon, May 16, 2022 at 9:07 AM Alex Kiernan via<br>
lists.openembedded.org &lt;alex.kiernan=3Dgmail.com@lists.openembedded.org&=
gt;<br>
wrote:<br>
&gt;<br>
&gt; Untested, but if its useful (I suspect cut &amp; paste will have broke=
n spaces):</div>
<div class=3D"PlainText elementToProof">Thanks.&nbsp; I will test this.&nbs=
p;&nbsp;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/udev/eudev/init<br>
&gt; b/meta/recipes-core/udev/eudev/init<br>
&gt; index c60dbbf6d512..64cd0ea3ef39 100644<br>
&gt; --- a/meta/recipes-core/udev/eudev/init<br>
&gt; +++ b/meta/recipes-core/udev/eudev/init<br>
&gt; @@ -23,6 +23,38 @@ kill_udevd () {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ -n &quot;$pid&quot; ] &amp;&amp; kill =
$pid<br>
&gt;&nbsp; }<br>
&gt;<br>
&gt; +make_static_nodes () {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmod static-nodes --format=3Dtmp=
files |<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while read TTYPE TPATH TMODE TUS=
ER TGROUP TAGE TARG; do<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case &quot;${TTYPE}&quot; in<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'd')<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; test -d &quot;${TPATH}&quot; || mkdir -p -m &quot;${TMODE}&=
quot; &quot;${TPATH}&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ;;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'c!')<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if [ ! -c &quot;${TPATH}&quot; ]; then<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; old_ifs=3D&=
quot;${IFS}&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IFS=3D:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set -- ${TA=
RG}<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IFS=3D&quot=
;${old_ifs}&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mknod -m &q=
uot;${TMODE}&quot; &quot;${TPATH}&quot; c &quot;$@&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; fi<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ;;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; echo ERROR<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; exit 1<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; ;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; esac<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ &quot;${TUSER}&quot; !=3D &=
quot;-&quot; ]; then<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; chown &quot;${TUSER}&quot; &quot;${TPATH}&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ &quot;${TGROUP}&quot; !=3D =
&quot;-&quot; ]; then<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; chown &quot;${TGROUP}&quot; &quot;${TPATH}&quot;<br>
<br>
chgrp<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&gt; +}<br>
&gt; +<br>
&gt;&nbsp; case &quot;$1&quot; in<br>
&gt;&nbsp;&nbsp;&nbsp; start)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; export ACTION=3Dadd<br>
&gt; @@ -51,6 +83,8 @@ case &quot;$1&quot; in<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # make_extra_nodes<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kill_udevd &gt; &quot;/dev/null&quot; 2&=
gt;&amp;1<br>
&gt;<br>
&gt; +&nbsp;&nbsp;&nbsp; make_static_nodes<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # trigger the sorted events<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ -e /proc/sys/kernel/hotplug ] &amp;&am=
p; printf '\0\n' &gt;/proc/sys/kernel/hotplug<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @UDEVD@ -d<br>
&gt;<br>
&gt; On Mon, May 16, 2022 at 6:35 AM Li, Changqing<br>
&gt; &lt;Changqing.Li@windriver.com&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; ________________________________<br>
&gt; &gt; From: Alex Kiernan &lt;alex.kiernan@gmail.com&gt;<br>
&gt; &gt; Sent: Sunday, May 15, 2022 10:59 PM<br>
&gt; &gt; To: Li, Changqing &lt;Changqing.Li@windriver.com&gt;<br>
&gt; &gt; Cc: richard.purdie@linuxfoundation.org &lt;richard.purdie@linuxfo=
undation.org&gt;; Patches and discussions about the oe-core layer &lt;opene=
mbedded-core@lists.openembedded.org&gt;<br>
&gt; &gt; Subject: Re: [OE-core] [PATCH] eudev: create static nodes from mo=
dules<br>
&gt; &gt;<br>
&gt; &gt; [Please note: This e-mail is from an EXTERNAL e-mail address]<br>
&gt; &gt;<br>
&gt; &gt; On Fri, May 13, 2022 at 2:42 AM Li, Changqing<br>
&gt; &gt; &lt;Changqing.Li@windriver.com&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; ________________________________<br>
&gt; &gt; &gt; From: richard.purdie@linuxfoundation.org &lt;richard.purdie@=
linuxfoundation.org&gt;<br>
&gt; &gt; &gt; Sent: Thursday, May 12, 2022 6:33 PM<br>
&gt; &gt; &gt; To: Alex Kiernan &lt;alex.kiernan@gmail.com&gt;; Li, Changqi=
ng &lt;Changqing.Li@windriver.com&gt;<br>
&gt; &gt; &gt; Cc: Patches and discussions about the oe-core layer &lt;open=
embedded-core@lists.openembedded.org&gt;<br>
&gt; &gt; &gt; Subject: Re: [OE-core] [PATCH] eudev: create static nodes fr=
om modules<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [Please note: This e-mail is from an EXTERNAL e-mail address=
]<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Thu, 2022-05-12 at 08:45 +0100, Alex Kiernan wrote:<br>
&gt; &gt; &gt; &gt; On Thu, May 12, 2022 at 6:43 AM Changqing Li &lt;changq=
ing.li@windriver.com&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; From: Changqing Li &lt;changqing.li@windriver.com&=
gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; dev in modules.devname should be populated in /dev=
 on boot.<br>
&gt; &gt; &gt; &gt; &gt; remove create static mode from udevd will make the=
se devices<br>
&gt; &gt; &gt; &gt; &gt; cannot be populated. When use sysVinit, devices li=
ke /dev/net/tun<br>
&gt; &gt; &gt; &gt; &gt; will not be created.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; more info:<br>
&gt; &gt; &gt; &gt; &gt; udevd in systemd also remove create static mode in=
 udevd, but using<br>
&gt; &gt; &gt; &gt; &gt; service kmod-static-nodes.service and<br>
&gt; &gt; &gt; &gt; &gt; systemd-tmpfiles-setup-dev.service in systemd to c=
reate these node, so<br>
&gt; &gt; &gt; &gt; &gt; systemd works well.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Changqing Li &lt;changqing.li@windr=
iver.com&gt;<br>
&gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt;&nbsp; ...dev-create-static-nodes-from-modules.patc=
h | 115 ++++++++++++++++++<br>
&gt; &gt; &gt; &gt; &gt;&nbsp; meta/recipes-core/udev/eudev_3.2.11.bb&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt; &gt; &gt; &gt; &gt;&nbsp; 2 files changed, 116 insertions(+)<br>
&gt; &gt; &gt; &gt; &gt;&nbsp; create mode 100644 meta/recipes-core/udev/eu=
dev/0001-eudev-create-static-nodes-from-modules.patch<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; diff --git a/meta/recipes-core/udev/eudev/0001-eud=
ev-create-static-nodes-from-modules.patch b/meta/recipes-core/udev/eudev/00=
01-eudev-create-static-nodes-from-modules.patch<br>
&gt; &gt; &gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; &gt; &gt; index 0000000000..19611f4e89<br>
&gt; &gt; &gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; &gt; &gt; +++ b/meta/recipes-core/udev/eudev/0001-eudev-crea=
te-static-nodes-from-modules.patch<br>
&gt; &gt; &gt; &gt; &gt; @@ -0,0 +1,115 @@<br>
&gt; &gt; &gt; &gt; &gt; +From 573d6c4106d5b3828da43d2843c1d599ae3cd1cd Mon=
 Sep 17 00:00:00 2001<br>
&gt; &gt; &gt; &gt; &gt; +From: Changqing Li &lt;changqing.li@windriver.com=
&gt;<br>
&gt; &gt; &gt; &gt; &gt; +Date: Tue, 10 May 2022 14:04:35 +0800<br>
&gt; &gt; &gt; &gt; &gt; +Subject: [PATCH] eudev: create static nodes from =
modules<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +Revert commit &lt;src/udev/udevd.c: remove create=
 static nodes from modules&gt;<br>
&gt; &gt; &gt; &gt; &gt; +https://gitweb.gentoo.org/proj/eudev.git/commit/?=
id=3D2b7abd5ec9cc47a8b895df6db77fb1537c6f1a39<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +Upstream-Status: Inappropriate [oe-specific]<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +Upstream intentionally remove create static nodes=
 from modules, it is<br>
&gt; &gt; &gt; &gt; &gt; +expected handled by tmpfiles services, refer [1].=
<br>
&gt; &gt; &gt; &gt; &gt; +[1] <a href=3D"https://github.com/eudev-project/e=
udev/issues/229" data-auth=3D"NotApplicable">
https://github.com/eudev-project/eudev/issues/229</a><br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; +For yocto, when start with sysVinit, to enable sy=
stemd distro feature,<br>
&gt; &gt; &gt; &gt; &gt; +and install systemd-tmpfiles is not proper, so re=
vert this commit.<br>
&gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Reading the upstream issue, I'm not sure this really is=
 an<br>
&gt; &gt; &gt; &gt; &quot;Inappropriate&quot; upstream. eudev has dropped t=
his commit, because you<br>
&gt; &gt; &gt; &gt; can use systemd-tmpfiles (&quot;as it works without sys=
temd and can be<br>
&gt; &gt; &gt; &gt; compiled individually&quot; - presumably using our unsu=
pported musl<br>
&gt; &gt; &gt; &gt; patches...) or opentmpfiles (which is dead and points y=
ou back to<br>
&gt; &gt; &gt; &gt; systemd-tmpfiles).<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Feels like this is an engage with upstream rather than =
carry a patch<br>
&gt; &gt; &gt; &gt; forever which just causes us to be perpetually divergen=
t.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I agree, this does sound like something we need to address t=
o keep the<br>
&gt; &gt; &gt; project maintainable...<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I tried to suggest upstream to add this back,&nbsp; but&nbsp=
; upstream seems prefer to use tmpfile solution.<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Given how limited the output format which static-nodes generates =
for<br>
&gt; &gt; tmpfiles is (just d and c! entries), parsing that output directly=
 as<br>
&gt; &gt; part the eudev init script wouldn't be horrible. Or make kmod gen=
erate<br>
&gt; &gt; files in the format that volatiles expects? Though that would nee=
d<br>
&gt; &gt; populate-volatile extending to generate device nodes.<br>
&gt; &gt;<br>
&gt; &gt; Thanks, I will dig more about the tmpfile solution, and send a V2=
 patch.<br>
&gt; &gt;<br>
&gt; &gt; Regards<br>
&gt; &gt; Changqing<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Alex Kiernan<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Alex Kiernan<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#165667): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/165667" data-auth=3D"NotApplicable">
https://lists.openembedded.org/g/openembedded-core/message/165667</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91052396=
/3618097" data-auth=3D"NotApplicable">
https://lists.openembedded.org/mt/91052396/3618097</a><br>
&gt; Group Owner: openembedded-core+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" data-auth=3D"NotApplicable">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [alex.kiernan@=
gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
--<br>
Alex Kiernan<br>
</div>
</span></font></div>
</body>
</html>

--_000_SN6PR11MB25574D269802D3241D83BC7582CE9SN6PR11MB2557namp_--

