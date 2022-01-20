Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA270C433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 08:39:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.9121.1642667993114311443
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 00:39:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MvExUEIf;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=8019138f82=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20K8bliq005235
	for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 00:39:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=FLxlrQSMb/gkd6Z3GzAWxqnEmaP3/KMj8IUIrzL+vbw=;
 b=MvExUEIfnVdrKWNhAkQiQ1ejMz8PxBdtNBrb9tvp4WbdEnUmcltgEUHOorsLMt90QBIv
 EqtNGsK3KySDFV7IOYH5VP1XtOwFuMA8HS2Ek2t/sndqXeGa6m2ldpWEtMow2S+VWaYe
 YX9gcUi6Huv9X1NQdvG5F9Mng06q9gZaUr2meMxXUQV4KUM2L11NHJU1vFQd493/i7tB
 H83VWJ4sVYwZxeOgud77vlPg85WLxp9w3JIJH2WoR8SknFTncUcrvPM7qIukeE9DGZRJ
 CJjGsc5WzDvrl7PADdWwcoxvFh+iRvqjGlJYdiTYd6E7a2P1bOlYlVa4ZCDXOCGijElx Rw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dppj80fh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 00:39:50 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20K8dorV009350
	for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 00:39:50 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dppj80fh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jan 2022 00:39:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvBtoijoJECENH1HKMrz5DAgmyGY0wiTIx8vnRWhzh3wDx9JYdDQ1BcflNsjfpjFLfRUV3zID5G2bIj/NunlmkIcL0ANQFOz+W/zedzWIKkLA9xVf4XNEFBeI78wxjz4Fco0xe/pzJWiTnNyXLoKE5gvbbdXN7qqIG0TglXntE0op18LIrASATmuPQkm3JScxOcFpDNvL+/xsbKjVz4RiJMs8fdggPoWQe5rGOUjQiXe77qLJw2eBjblzkbZbtL3IV9xCDV6KgNIXxs+atba/GEUTnQfVtdv7gtDhN2voF+i1GZCFtbTvziICOb+geEPqsr88OGxrvDZrDBP/8DRTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLxlrQSMb/gkd6Z3GzAWxqnEmaP3/KMj8IUIrzL+vbw=;
 b=Es380u9Kt9dm5kEbnPdl5OmxwZ0YmeLXqgZWFlBwTz+TIdF1qL3al0DB4gAuYpWV9/EIn4u3YCpraKRcOo4qlFKhvb2FjM43gjVLu2LTNKtueQPeTXsFuO7/Ym1Y4qpqf1Fm3XiqTtQkqoSm2H/fhgr5gOErUPQCG+Nj1LVcEmh5Nx/275ngWFwh3dCF47LKHCOdPJy7KmCt4FzrpsgzUJ/py69J/hgdbRj1i8yaINy5T2k8WMin3/pQBC+2qrRCGQkdxlLMsbY4Nj5iuJioxACl3Kn0PNzXch2QJjo7mHCb+YuYQ9PGR/CiYmQedQnkfIR80qj3irkrC4k83+HLjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by MN2PR11MB4725.namprd11.prod.outlook.com (2603:10b6:208:263::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Thu, 20 Jan
 2022 08:39:47 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::e8dc:b06e:73c8:d95e]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::e8dc:b06e:73c8:d95e%6]) with mapi id 15.20.4909.008; Thu, 20 Jan 2022
 08:39:46 +0000
From: "Jia, Hongxu" <Hongxu.Jia@windriver.com>
To: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>,
        Alexander Kanavin
	<alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
        "Yang, Liezhi"
	<Liezhi.Yang@windriver.com>
Subject: Re: [OE-core] [PATCH] package_manager/rpm: conditional remove package
 manager database
Thread-Topic: [OE-core] [PATCH] package_manager/rpm: conditional remove
 package manager database
Thread-Index: AQHYDOGgc5anNC1K0EqAyuwF52D3t6xqIViAgAEWpDKAAD2zgIAAqImA
Date: Thu, 20 Jan 2022 08:39:46 +0000
Message-ID: <c1bb2cec-2d94-dad4-1f68-1a84294ce0cc@windriver.com>
References: <20220119030655.3484026-1-hongxu.jia@windriver.com>
 <CANNYZj_07b452gHNi_PhSZPGxQUWqcAZeCejTDzkMzfj4Bo+xA@mail.gmail.com>
 <MW3PR11MB463344722993C35052B97B86945A9@MW3PR11MB4633.namprd11.prod.outlook.com>
 <GV0P278MB02417BC1BD1E1FBBB8CB1239885A9@GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM>
In-Reply-To: 
 <GV0P278MB02417BC1BD1E1FBBB8CB1239885A9@GV0P278MB0241.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: MW3PR11MB4633.namprd11.prod.outlook.com
 (15.20.4909.008)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
suggested_attachment_session_id: 95a565c9-a20e-c76e-4838-6278ebf127fc
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb9f21aa-f662-4ce0-e0b7-08d9dbf06a26
x-ms-traffictypediagnostic: MN2PR11MB4725:EE_
x-microsoft-antispam-prvs: 
 <MN2PR11MB4725B2A56E7FA5CEC604F345945A9@MN2PR11MB4725.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kK0dEJNc06od+rrsjcXEBFbb+8GGgWr0o/6U3xV6lqt+8qZMgpAIQOH5MsQ5EmYEBC16So+JJQEHP36SLvbsXRrxFuF7jZuA6nH+c5T0xtJFXlqBey2rm4i7OdNxaj5E4gB63HlUCRIO4kWU7bz4A+sh0mqtWTr2MmVdkc1zHIqx057YQ/PspwHMUmyw3rCY05ah7fHVTACHjiE/wyOljOv1LIl03+cqKJLVYmN507waLfTj+KuzZRRveyHhmjmkSigOcItcdgki4nH71dKAfmtk3c5W7RfIwbwogAFH4lU1+rUIRMQm4YQnlJv/JkwFvgCcnxBQRxJPSpD1uupXG9+SLHrVPyBRdrvCEteuHETm7r3DikpnKEkZjuyJGVGUxs/wz4kfwW4WCFJRbPRPGudXO9z1YatP5rDtIXmRlCNbdaZnRwmgq/uh1gKEVecKRw3dIs2d6CYj2+nt2tKZSPQCfmbnuTAZdmClo65vHVBBkcU1SSJAwmCPffzT8FO2E/ICEwGfIwCIryVApoQgIfP/r46b9g9Nkb2JW0KSWMK58tpJCE+jo/Ixn2BuRLJ8BiJfvLZRCqSHV+Th9rC427fS3d4DH1pj6k8negtctsiA33RBpoNEmN3dB7TQyfU3hA/ZiHiCmGEIxURa71MgSFhWGh7jnNnd84VDgDBokn0AgaMZWnqYMKzXKhB14zXN7P9bNuDD2d7DQATcz1M7jmTisD5rIn4nqC1VsBjvTJokvLKMRZExGai15Gnsez9iKdv2gz8GtMfsC4kJ6N3BBnri3armRWrQQqy1r4K5uoFfXkQtvvVDvpTNxL7pf06I7bvGKPinT4cWtv0PtLjBPZ6aT/1WGFpmEPh2yLpfuZQUMG5PsfYmR44p5Yn7YFZUNVkjxxiOKkytTZZBdR2LQQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(31696002)(6486002)(8936002)(66446008)(64756008)(66556008)(66476007)(86362001)(8676002)(6512007)(508600001)(26005)(83380400001)(316002)(54906003)(71200400001)(36756003)(110136005)(2616005)(5660300002)(19627405001)(107886003)(122000001)(53546011)(91956017)(2906002)(76116006)(31686004)(166002)(186003)(4326008)(66946007)(38100700002)(6506007)(130980200001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?gg33F69GW8tev2IoHqQVwPV+SRFWT4gmhWKo+qL61dayLxxYiES5kxH/hL?=
 =?iso-8859-1?Q?kBrmA2Fvk62AC8wzzmA5CYaC/979jh17OvBK6oxCD42zaj+81s/6B9OpOx?=
 =?iso-8859-1?Q?tDcunc9rf3BVolNyKHvbRqXI9phGuJXj3W0hhYVuUClm2QKtoJUwLe4V4b?=
 =?iso-8859-1?Q?u4sniaAoLphbh3ilRwUORUbe7Z5mK8bpfbL7UQRiLKRkqASMQijPKZxSiJ?=
 =?iso-8859-1?Q?k+i/s36Q8XQ+byPvhSBDNLsIGgOceocDXu8ezvw04O1LsfwEGYESKIv0FD?=
 =?iso-8859-1?Q?G6YjCaVryhSkzdwshfERLhd8/1ZRXAaMvrkNPB8FZ5efvG/yny38orzqYY?=
 =?iso-8859-1?Q?INSexIRTnaO6PSB69GZ7L89oDqGvJ9YchenjiFqJ7hEslxoc9B5s6vcw0P?=
 =?iso-8859-1?Q?CKRF+ZN90mgxPPwhGtnFRM6ZdMuUUJ9nzhyz06OqQ2rmF5aFPL8tUqnaqw?=
 =?iso-8859-1?Q?b70Xqq55oaPC/eVnDeAdVTH85MG/kw7Xol754bSuBZWOjTEftaKWlP9Gy+?=
 =?iso-8859-1?Q?6SLJamC4rASwY4tQEr8Hnpg5sQ0gdCR5MRLzhFe6qDCyR9lRRoeFYV8hwu?=
 =?iso-8859-1?Q?bsPwPF5yZJvQllqYeYLO6eQgh72NXBHqQ9ofOguQIETKuSmgKE2tbZnob+?=
 =?iso-8859-1?Q?ZWvZoRCTFxONADdCO+C9kOmVBV6KkWdCTotC+MHSSRWg7nECTzu8Dn3mg7?=
 =?iso-8859-1?Q?FW9Ef+v1M+c6hERD3DUsF1Hb5op684Mi0HM5II0LBidvFv92uRZHzvLltM?=
 =?iso-8859-1?Q?iqJwtDWEv68PsCdBPONcJUVmUHWHMssR24ZeiGN8iT+ijXerNdPCJPBgWs?=
 =?iso-8859-1?Q?Yzvd9zSCSp/spWOKJhLQAzVKlBmdFfFW8r6u8BN4X1oAJihYgagLmmRwIw?=
 =?iso-8859-1?Q?s/YueD/I259gBxmNZZ/5b8/7RP0o+6TA0/wkik7ejedMxPFQt5dUGTJU3W?=
 =?iso-8859-1?Q?bL5gexX8+30Z8BAAeqdG20Gqesf4HE3IEZRe5gRNo37YoQLsH59M7pi7XJ?=
 =?iso-8859-1?Q?KIZXGnU8vE7GQJgcJdzySwwZIoVP/VW5vsY73kvcx9KJJ29lUogAgjQpwp?=
 =?iso-8859-1?Q?D1B5KorHE8LGMp6WKOUb6QkEsVStPjDfgvs9UZPvqUanxDLCAaV15GPo/z?=
 =?iso-8859-1?Q?TwhEJ8nlYoEqc9Msii/otAq7A4EFIjo/SAiJyeMuDfQLR8eVgzUmP+NncP?=
 =?iso-8859-1?Q?STL1oabeWtoF8vsbCbC/XBPRozmKRctn8xpc0RoyMhB6A/3vzdyeqMv5VD?=
 =?iso-8859-1?Q?0AfDelnp3d1m654UzrwGg7gxQQv5l6/REAoRkOuBV9f7WZm2HAvNlp1Pg3?=
 =?iso-8859-1?Q?uJJNK7jNgs3G2SdDztAvnuetieD6IOG1TDSuZg2PAPpUjhMAvJHavVeDCw?=
 =?iso-8859-1?Q?JplzewVSez0QvX6ag5GFc7hXRiTTTUpZKzPayroZdZjR6BNC1avmX4iks5?=
 =?iso-8859-1?Q?MpTK1Frsb/IbcpLwOn+QZWY+o/uObxaKtL4sgMGhY6mkinUspf/26I4nCa?=
 =?iso-8859-1?Q?Z1BWXvh1OVkg9mPbhLisO9OmO6jABxiyhSjv+yjC24uFzQXuGWq9h9akMB?=
 =?iso-8859-1?Q?tXJ4bPXhawBvqoXnWa00pWVJ7dtQfE1xO1jLccR2ABlgqEcgf6ajZRJ/AT?=
 =?iso-8859-1?Q?qMnyJCI9joizTTgdxVDFs8+PxH/8+wr9YAf0tyABb9PbqCuHIkk68F9gVM?=
 =?iso-8859-1?Q?eRJSAzGMRwFrVcPrH2oQxH5lLqOxqnSO4UVwHpV/yKlse01MRAnK5u4sqf?=
 =?iso-8859-1?Q?tCoQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_c1bb2cec2d94dad41f681a84294ce0ccwindrivercom_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cb9f21aa-f662-4ce0-e0b7-08d9dbf06a26
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 08:39:46.6077
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Mkx2D2ZL+3v+38aCo4/wypJIa4EYswiatBBC6nVOkcxOOxxEroPNiNqOsugIExLmN1eHIVTcFnGEziNP4C2h0ZI4454Az7UsLj5gZEb3scc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4725
X-Proofpoint-ORIG-GUID: NxRoQfPULf8XeWHTk--M97SChhEMcnYO
X-Proofpoint-GUID: cipt4eut62-ruDr3KoliKl7sSZHDL0VW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-20_03,2022-01-19_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201200044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 08:39:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160754

--_000_c1bb2cec2d94dad41f681a84294ce0ccwindrivercom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On 1/20/22 14:34, Diego Santa Cruz wrote:
[Please note: This e-mail is from an EXTERNAL e-mail address]
Hi,

We do exactly that in our images, keep rpm but avoid dnf. We do it by addin=
g this to the image recipes (via in inc file).

ROOTFS_PKGMANAGE_remove =3D "dnf"
ROOTFS_POSTUNINSTALL_COMMAND +=3D "spx_wipe_dnf_data ; "

spx_wipe_dnf_data() {
    bbnote "Removing all dnf runtime data"
    for d in /var/lib/dnf /var/cache/dnf; do
        [ -d ${IMAGE_ROOTFS}$d ] || continue
        dirsize=3D`du -ks ${IMAGE_ROOTFS}/$d  | awk '{ print $1 }'`
        bbnote "Removing $d with $dirsize KiB"
        rm -rf ${IMAGE_ROOTFS}$d/*
    done
}



Yes, it helps, thank you very much

//Hongxu
I hope this helps

--
Diego Santa Cruz, PhD
Technology Architect
spinetix.com<https://urldefense.com/v3/__http://spinetix.com__;!!AjveYdw8Ev=
Q!P_Qo8UNa9oH3Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8Cxd2SHbwc$>

From: openembedded-core@lists.openembedded.org<mailto:openembedded-core@lis=
ts.openembedded.org> <openembedded-core@lists.openembedded.org><mailto:open=
embedded-core@lists.openembedded.org> On Behalf Of hongxu via lists.openemb=
edded.org<https://urldefense.com/v3/__http://lists.openembedded.org__;!!Ajv=
eYdw8EvQ!P_Qo8UNa9oH3Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8CxZKo62=
pc$>
Sent: 20 January 2022 03:54
To: Alexander Kanavin <alex.kanavin@gmail.com><mailto:alex.kanavin@gmail.co=
m>
Cc: OE-core <openembedded-core@lists.openembedded.org><mailto:openembedded-=
core@lists.openembedded.org>; Yang, Liezhi <Liezhi.Yang@windriver.com><mail=
to:Liezhi.Yang@windriver.com>
Subject: Re: [OE-core] [PATCH] package_manager/rpm: conditional remove pack=
age manager database


I am afraid doing remove operation in ROOTFS_POSTPROCESS_COMMAND could not =
satisfy this case



The background is in order to save spaces in embedded device, user do not i=
nstall

package dnf which introduces python3, and use rpm to manage package on targ=
et



In oe-core, the dnf, rpm and pkg database are introduced by package-managem=
ent of IMAGE_FEATURES,

if package-management in IMAGE_FEATURES, we could remove unused pkg data in

ROOTFS_POSTPROCESS_COMMAND as you suggested, but we could not uninstall

dnf and all related depend(such as python3) gracefully;

if package-management not in IMAGE_FEATURES, the pkg data will be removed

before ROOTFS_POSTPROCESS_COMMAND, that's why this commit are trying to res=
olve



The root cause maybe dnf is too heavy for disk sensitive device



//Hongxu

________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com<mailto:alex.kanavin@gmail.c=
om>>
Sent: Wednesday, January 19, 2022 6:15 PM
To: Jia, Hongxu <Hongxu.Jia@windriver.com<mailto:Hongxu.Jia@windriver.com>>
Cc: OE-core <openembedded-core@lists.openembedded.org<mailto:openembedded-c=
ore@lists.openembedded.org>>; Yang, Liezhi <Liezhi.Yang@windriver.com<mailt=
o:Liezhi.Yang@windriver.com>>
Subject: Re: [OE-core] [PATCH] package_manager/rpm: conditional remove pack=
age manager database


[Please note: This e-mail is from an EXTERNAL e-mail address]
Apologies, but please no. This adds complexity, isn't possible to disable a=
nd is difficult to understand. You can simply remove the unneeded files fro=
m ROOTFS_POSTPROCESS_COMMAND in your image class.

Alex

On Wed, 19 Jan 2022 at 04:07, hongxu <hongxu.jia@windriver.com<mailto:hongx=
u.jia@windriver.com>> wrote:
In order to save spaces in target rootfs, the user wants to remove dnf and
keep rpm, in this situation, we should remove dnf database only

If rpm was installed, keep rpm database, after applying this commit:

Edit conf/local.conf
...
IMAGE_FEATURES:remove =3D "package-management"
IMAGE_INSTALL:append=3D " rpm"
...

Build image and boot, run rpm -qa on target:
Without this commit
...
root@intel-x86-64:~# rpm -qa | wc -l
0
...

Apply this commit
...
root@intel-x86-64:~# rpm -qa | wc -l
1865
...

With this commit, the rpm -qa works as expected.

It does not make sense to keep dnf and remove rpm, so this commit
does not consider the scenario

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com<mailto:hongxu.jia@windr=
iver.com>>
---
 meta/lib/oe/package_manager/rpm/__init__.py<https://urldefense.com/v3/__ht=
tps://eur02.safelinks.protection.outlook.com/?url=3Dhttps*3A*2F*2Furldefens=
e.com*2Fv3*2F__http*3A*2F*2F__init__.py__*3B!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt=
7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gIDKvdp1Putv*24&data=3D04*7C01*7Cdie=
go.santacruz*40spinetix.com*7Ccfe2bf45c56e4efe23b608d9dbc02521*7C5f4034faed=
2d4840a93facb1e9633b93*7C0*7C0*7C637782440578878242*7CUnknown*7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0*3D*7C3000&=
sdata=3Di0*2B51iSlYuayK9kClXpEUxk*2FhpzlSMHHkNLpa7*2BDSWc*3D&reserved=3D0__=
;JSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSU!!AjveYdw8EvQ!P_Qo8UNa9oH3Xr8z3HrU_xtzK=
sKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8Cxamel_UX$> | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager/rpm/__init__.py<https://urldefense=
.com/v3/__https://eur02.safelinks.protection.outlook.com/?url=3Dhttps*3A*2F=
*2Furldefense.com*2Fv3*2F__http*3A*2F*2F__init__.py__*3B!!AjveYdw8EvQ!JHTMz=
Gi0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gIDKvdp1Putv*24&data=3D0=
4*7C01*7Cdiego.santacruz*40spinetix.com*7Ccfe2bf45c56e4efe23b608d9dbc02521*=
7C5f4034faed2d4840a93facb1e9633b93*7C0*7C0*7C637782440578878242*7CUnknown*7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0*3D*7C3000&sdata=3Di0*2B51iSlYuayK9kClXpEUxk*2FhpzlSMHHkNLpa7*2BDSWc*3D&re=
served=3D0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSU!!AjveYdw8EvQ!P_Qo8UNa9oH3X=
r8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8Cxamel_UX$> b/meta/lib/oe/pac=
kage_manager/rpm/__init__.py<https://urldefense.com/v3/__https://eur02.safe=
links.protection.outlook.com/?url=3Dhttps*3A*2F*2Furldefense.com*2Fv3*2F__h=
ttp*3A*2F*2F__init__.py__*3B!!AjveYdw8EvQ!JHTMzGi0-aiMoNjIt7Jb186B-p8VNKpv_=
Yrm-v87Li0GFTZf07eaSBP1gIDKvdp1Putv*24&data=3D04*7C01*7Cdiego.santacruz*40s=
pinetix.com*7Ccfe2bf45c56e4efe23b608d9dbc02521*7C5f4034faed2d4840a93facb1e9=
633b93*7C0*7C0*7C637782440578878242*7CUnknown*7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0*3D*7C3000&sdata=3Di0*2B51i=
SlYuayK9kClXpEUxk*2FhpzlSMHHkNLpa7*2BDSWc*3D&reserved=3D0__;JSUlJSUlJSUlJSU=
lJSUlJSUlJSUlJSUlJSU!!AjveYdw8EvQ!P_Qo8UNa9oH3Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1z=
jZT1dhR0-6zDAqCXf8Cxamel_UX$>
index b392581069..dce5912329 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py<https://urldefense.com/v3=
/__https://eur02.safelinks.protection.outlook.com/?url=3Dhttps*3A*2F*2Furld=
efense.com*2Fv3*2F__http*3A*2F*2F__init__.py__*3B!!AjveYdw8EvQ!JHTMzGi0-aiM=
oNjIt7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gIDKvdp1Putv*24&data=3D04*7C01*=
7Cdiego.santacruz*40spinetix.com*7Ccfe2bf45c56e4efe23b608d9dbc02521*7C5f403=
4faed2d4840a93facb1e9633b93*7C0*7C0*7C637782440578878242*7CUnknown*7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0*3D*7C=
3000&sdata=3Di0*2B51iSlYuayK9kClXpEUxk*2FhpzlSMHHkNLpa7*2BDSWc*3D&reserved=
=3D0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSU!!AjveYdw8EvQ!P_Qo8UNa9oH3Xr8z3Hr=
U_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8Cxamel_UX$>
+++ b/meta/lib/oe/package_manager/rpm/__init__.py<https://urldefense.com/v3=
/__https://eur02.safelinks.protection.outlook.com/?url=3Dhttps*3A*2F*2Furld=
efense.com*2Fv3*2F__http*3A*2F*2F__init__.py__*3B!!AjveYdw8EvQ!JHTMzGi0-aiM=
oNjIt7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gIDKvdp1Putv*24&data=3D04*7C01*=
7Cdiego.santacruz*40spinetix.com*7Ccfe2bf45c56e4efe23b608d9dbc02521*7C5f403=
4faed2d4840a93facb1e9633b93*7C0*7C0*7C637782440578878242*7CUnknown*7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0*3D*7C=
3000&sdata=3Di0*2B51iSlYuayK9kClXpEUxk*2FhpzlSMHHkNLpa7*2BDSWc*3D&reserved=
=3D0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSU!!AjveYdw8EvQ!P_Qo8UNa9oH3Xr8z3Hr=
U_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8Cxamel_UX$>
@@ -80,7 +80,9 @@ class RpmPM(PackageManager):
         self.saved_packaging_data =3D self.d.expand('${T}/saved_packaging_=
data/%s' % self.task_name)
         if not os.path.exists(self.d.expand('${T}/saved_packaging_data')):
             bb.utils.mkdirhier(self.d.expand('${T}/saved_packaging_data'))
-        self.packaging_data_dirs =3D ['etc/rpm', 'etc/rpmrc', 'etc/dnf', '=
var/lib/rpm', 'var/lib/dnf', 'var/cache/dnf']
+        self.packaging_data_rpm_dirs =3D ['etc/rpm', 'etc/rpmrc', 'var/lib=
/rpm']
+        self.packaging_data_dnf_dirs =3D ['etc/dnf', 'var/lib/dnf', 'var/c=
ache/dnf']
+        self.packaging_data_dirs =3D self.packaging_data_rpm_dirs + self.p=
ackaging_data_dnf_dirs
         self.solution_manifest =3D self.d.expand('${T}/saved/%s_solution' =
%
                                                self.task_name)
         if not os.path.exists(self.d.expand('${T}/saved')):
@@ -237,8 +239,11 @@ class RpmPM(PackageManager):
         self._invoke_dnf(["autoremove"])

     def remove_packaging_data(self):
+        remove_packaging_data_dirs =3D self.packaging_data_dnf_dirs
+        if "rpm" not in self.list_installed():
+            remove_packaging_data_dirs +=3D self.packaging_data_rpm_dirs
         self._invoke_dnf(["clean", "all"])
-        for dir in self.packaging_data_dirs:
+        for dir in remove_packaging_data_dirs:
             bb.utils.remove(oe.path.join(self.target_rootfs, dir), True)

     def backup_packaging_data(self):
--
2.27.0





--_000_c1bb2cec2d94dad41f681a84294ce0ccwindrivercom_
Content-Type: text/html; charset="iso-8859-1"
Content-ID: 
 <9EB656E81B074E458340F0CDE35F36E4@windriversystems.onmicrosoft.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"moz-cite-prefix">On 1/20/22 14:34, Diego Santa Cruz wrote:<br=
>
</div>
<blockquote type=3D"cite">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered=0A=
        medium)">
<div style=3D"border:solid #9C6500 1.0pt; padding:2.0pt 2.0pt 2.0pt=0A=
        2.0pt">
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;line-height:12.0pt; background:#FFEB9C">
<b><span style=3D"font-size:10.0pt; color:#9C6500"></span></b><span style=
=3D"font-size:10.0pt; color:red">[Please note: This e-mail is from an EXTER=
NAL e-mail address]</span></p>
</div>
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;">
Hi,</p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;">
&nbsp;</p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;">
We do exactly that in our images, keep rpm but avoid dnf. We do it by addin=
g this to the image recipes (via in inc file).</p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;">
&nbsp;</p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;line-height:14.25pt; background:#1E1E1E">
<span style=3D"font-size:10.5pt; font-family:Consolas; color:#9CDCFE">ROOTF=
S_PKGMANAGE_remove</span><span style=3D"font-size:10.5pt; font-family:Conso=
las; color:#D4D4D4"> =3D
</span><span style=3D"font-size:10.5pt; font-family:Consolas; color:#CE9178=
">&quot;dnf&quot;</span><span style=3D"font-size:10.5pt; font-family:Consol=
as; color:#D4D4D4"></span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;line-height:14.25pt; background:#1E1E1E">
<span style=3D"font-size:10.5pt; font-family:Consolas; color:#9CDCFE">ROOTF=
S_POSTUNINSTALL_COMMAND</span><span style=3D"font-size:10.5pt; font-family:=
Consolas; color:#D4D4D4"> +=3D
</span><span style=3D"font-size:10.5pt; font-family:Consolas; color:#CE9178=
">&quot;spx_wipe_dnf_data ; &quot;</span><span style=3D"font-size:10.5pt; f=
ont-family:Consolas; color:#D4D4D4"></span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;line-height:14.25pt; background:#1E1E1E">
<span style=3D"font-size:10.5pt; font-family:Consolas; color:#D4D4D4">&nbsp=
;</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;line-height:14.25pt; background:#1E1E1E">
<span style=3D"font-size:10.5pt; font-family:Consolas; color:#DCDCAA">spx_w=
ipe_dnf_data</span><span style=3D"font-size:10.5pt; font-family:Consolas; c=
olor:#D4D4D4">() {</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;line-height:14.25pt; background:#1E1E1E">
<span style=3D"font-size:10.5pt; font-family:Consolas; color:#D4D4D4">&nbsp=
; &nbsp; bbnote </span>
<span style=3D"font-size:10.5pt; font-family:Consolas; color:#CE9178">&quot=
;Removing all dnf runtime data&quot;</span><span style=3D"font-size:10.5pt;=
 font-family:Consolas; color:#D4D4D4"></span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;line-height:14.25pt; background:#1E1E1E">
<span style=3D"font-size:10.5pt; font-family:Consolas; color:#D4D4D4">&nbsp=
; &nbsp; </span><span style=3D"font-size:10.5pt; font-family:Consolas; colo=
r:#C586C0">for</span><span style=3D"font-size:10.5pt; font-family:Consolas;=
 color:#D4D4D4">
</span><span style=3D"font-size:10.5pt; font-family:Consolas; color:#9CDCFE=
">d</span><span style=3D"font-size:10.5pt; font-family:Consolas; color:#D4D=
4D4">
</span><span style=3D"font-size:10.5pt; font-family:Consolas; color:#C586C0=
">in</span><span style=3D"font-size:10.5pt; font-family:Consolas; color:#D4=
D4D4"> /var/lib/dnf /var/cache/dnf;
</span><span style=3D"font-size:10.5pt; font-family:Consolas; color:#C586C0=
">do</span><span style=3D"font-size:10.5pt; font-family:Consolas; color:#D4=
D4D4"></span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;line-height:14.25pt; background:#1E1E1E">
<span style=3D"font-size:10.5pt; font-family:Consolas; color:#D4D4D4">&nbsp=
; &nbsp; &nbsp; &nbsp; [ -d </span>
<span style=3D"font-size:10.5pt; font-family:Consolas; color:#9CDCFE">${IMA=
GE_ROOTFS}$d</span><span style=3D"font-size:10.5pt; font-family:Consolas; c=
olor:#D4D4D4"> ] ||
</span><span style=3D"font-size:10.5pt; font-family:Consolas; color:#C586C0=
">continue</span><span style=3D"font-size:10.5pt; font-family:Consolas; col=
or:#D4D4D4"></span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;line-height:14.25pt; background:#1E1E1E">
<span style=3D"font-size:10.5pt; font-family:Consolas; color:#D4D4D4">&nbsp=
; &nbsp; &nbsp; &nbsp; dirsize=3D</span><span style=3D"font-size:10.5pt; fo=
nt-family:Consolas; color:#CE9178">`du -ks
</span><span style=3D"font-size:10.5pt; font-family:Consolas; color:#9CDCFE=
">${IMAGE_ROOTFS}</span><span style=3D"font-size:10.5pt; font-family:Consol=
as; color:#CE9178">/</span><span style=3D"font-size:10.5pt; font-family:Con=
solas; color:#9CDCFE">$d</span><span style=3D"font-size:10.5pt; font-family=
:Consolas; color:#CE9178">
 &nbsp;</span><span style=3D"font-size:10.5pt; font-family:Consolas; color:=
#D4D4D4">|</span><span style=3D"font-size:10.5pt; font-family:Consolas; col=
or:#CE9178"> awk '{ print $1 }'`</span><span style=3D"font-size:10.5pt; fon=
t-family:Consolas; color:#D4D4D4"></span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;line-height:14.25pt; background:#1E1E1E">
<span style=3D"font-size:10.5pt; font-family:Consolas; color:#D4D4D4">&nbsp=
; &nbsp; &nbsp; &nbsp; bbnote
</span><span style=3D"font-size:10.5pt; font-family:Consolas; color:#CE9178=
">&quot;Removing
</span><span style=3D"font-size:10.5pt; font-family:Consolas; color:#9CDCFE=
">$d</span><span style=3D"font-size:10.5pt; font-family:Consolas; color:#CE=
9178"> with
</span><span style=3D"font-size:10.5pt; font-family:Consolas; color:#9CDCFE=
">$dirsize</span><span style=3D"font-size:10.5pt; font-family:Consolas; col=
or:#CE9178"> KiB&quot;</span><span style=3D"font-size:10.5pt; font-family:C=
onsolas; color:#D4D4D4"></span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;line-height:14.25pt; background:#1E1E1E">
<span style=3D"font-size:10.5pt; font-family:Consolas; color:#D4D4D4">&nbsp=
; &nbsp; &nbsp; &nbsp; rm -rf
</span><span style=3D"font-size:10.5pt; font-family:Consolas; color:#9CDCFE=
">${IMAGE_ROOTFS}$d</span><span style=3D"font-size:10.5pt; font-family:Cons=
olas; color:#D4D4D4">/*</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;line-height:14.25pt; background:#1E1E1E">
<span style=3D"font-size:10.5pt; font-family:Consolas; color:#D4D4D4">&nbsp=
; &nbsp; </span><span style=3D"font-size:10.5pt; font-family:Consolas; colo=
r:#C586C0">done</span><span style=3D"font-size:10.5pt; font-family:Consolas=
; color:#D4D4D4"></span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;line-height:14.25pt; background:#1E1E1E">
<span style=3D"font-size:10.5pt; font-family:Consolas; color:#D4D4D4">}</sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;line-height:14.25pt; background:#1E1E1E">
<span style=3D"font-size:10.5pt; font-family:Consolas; color:#D4D4D4">&nbsp=
;</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;">
&nbsp;</p>
</div>
</div>
</blockquote>
<p>Yes, it helps, thank you very much</p>
<p>//Hongxu<br>
</p>
<blockquote type=3D"cite">
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;">
I hope this helps</p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;">
&nbsp;</p>
<div>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;">
<span style=3D"font-size:9.0pt; font-family:&quot;Arial&quot;,sans-serif">-=
- <br>
<b>Diego Santa Cruz, PhD<br>
</b><span style=3D"color:gray">Technology Architect<br>
<a href=3D"https://urldefense.com/v3/__http://spinetix.com__;!!AjveYdw8EvQ!=
P_Qo8UNa9oH3Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8Cxd2SHbwc$">spin=
etix.com</a></span></span><span style=3D""></span></p>
</div>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;">
&nbsp;</p>
<div style=3D"border:none; border-left:solid blue=0A=
            1.5pt; padding:0cm 0cm 0cm 4.0pt">
<div>
<div style=3D"border:none; border-top:solid #E1E1E1=0A=
                1.0pt; padding:3.0pt 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;">
<b>From:</b> <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openembed=
ded-core@lists.openembedded.org">
openembedded-core@lists.openembedded.org</a> <a class=3D"moz-txt-link-rfc23=
96E" href=3D"mailto:openembedded-core@lists.openembedded.org">
&lt;openembedded-core@lists.openembedded.org&gt;</a> <b>On Behalf Of </b>ho=
ngxu via <a href=3D"https://urldefense.com/v3/__http://lists.openembedded.o=
rg__;!!AjveYdw8EvQ!P_Qo8UNa9oH3Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqC=
Xf8CxZKo62pc$">
lists.openembedded.org</a><br>
<b>Sent:</b> 20 January 2022 03:54<br>
<b>To:</b> Alexander Kanavin <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:alex.kanavin@gmail.com">
&lt;alex.kanavin@gmail.com&gt;</a><br>
<b>Cc:</b> OE-core <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:openem=
bedded-core@lists.openembedded.org">
&lt;openembedded-core@lists.openembedded.org&gt;</a>; Yang, Liezhi <a class=
=3D"moz-txt-link-rfc2396E" href=3D"mailto:Liezhi.Yang@windriver.com">
&lt;Liezhi.Yang@windriver.com&gt;</a><br>
<b>Subject:</b> Re: [OE-core] [PATCH] package_manager/rpm: conditional remo=
ve package manager database</p>
</div>
</div>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;">
&nbsp;</p>
<div>
<p><span style=3D"font-size:12.0pt; color:black">I am afraid doing remove o=
peration in ROOTFS_POSTPROCESS_COMMAND could not satisfy this case</span></=
p>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
<p><span style=3D"font-size:12.0pt; color:black">The background is in order=
 to save spaces in embedded device, user do not install</span></p>
<p><span style=3D"font-size:12.0pt; color:black">package dnf which introduc=
es python3, and use rpm to manage package on target</span></p>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
<p><span style=3D"font-size:12.0pt; color:black">In oe-core, the dnf, rpm a=
nd pkg database are introduced by package-management of IMAGE_FEATURES,</sp=
an></p>
<p><span style=3D"font-size:12.0pt; color:black">if package-management in I=
MAGE_FEATURES, we could remove unused pkg data in</span></p>
<p><span style=3D"font-size:12.0pt; color:black">ROOTFS_POSTPROCESS_COMMAND=
 as you suggested, but we could not uninstall</span></p>
<p><span style=3D"font-size:12.0pt; color:black">dnf and all related depend=
(such as python3) gracefully;</span></p>
<p><span style=3D"font-size:12.0pt; color:black">if package-management not =
in IMAGE_FEATURES, the pkg data will be removed</span></p>
<p><span style=3D"font-size:12.0pt; color:black">before ROOTFS_POSTPROCESS_=
COMMAND, that's why this commit are trying to resolve</span></p>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
<p><span style=3D"font-size:12.0pt; color:black">The root cause maybe dnf i=
s too heavy for disk sensitive device</span></p>
<p><span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
<p><span style=3D"font-size:12.0pt; color:black">//Hongxu</span></p>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;">
<span style=3D"font-size:12.0pt; color:black">&nbsp;</span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"margin: 0cm; font-size: =
11pt; font-family: Calibri, sans-serif;text-align:center">
<hr width=3D"98%" size=3D"2" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;">
<b><span style=3D"color:black">From:</span></b><span style=3D"color:black">=
 Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" class=3D"m=
oz-txt-link-freetext">alex.kanavin@gmail.com</a>&gt;<br>
<b>Sent:</b> Wednesday, January 19, 2022 6:15 PM<br>
<b>To:</b> Jia, Hongxu &lt;<a href=3D"mailto:Hongxu.Jia@windriver.com" clas=
s=3D"moz-txt-link-freetext">Hongxu.Jia@windriver.com</a>&gt;<br>
<b>Cc:</b> OE-core &lt;<a href=3D"mailto:openembedded-core@lists.openembedd=
ed.org" class=3D"moz-txt-link-freetext">openembedded-core@lists.openembedde=
d.org</a>&gt;; Yang, Liezhi &lt;<a href=3D"mailto:Liezhi.Yang@windriver.com=
" class=3D"moz-txt-link-freetext">Liezhi.Yang@windriver.com</a>&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] package_manager/rpm: conditional remo=
ve package manager database</span>
</p>
<div>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;">
&nbsp;</p>
</div>
</div>
<div>
<div style=3D"border:solid #9C6500 1.0pt; padding:2.0pt 2.0pt=0A=
                2.0pt 2.0pt">
<p class=3D"xmsonormal" style=3D"margin: 0cm; font-size: 11pt; font-family:=
 Calibri, sans-serif;line-height:12.0pt; background:#FFEB9C">
<span style=3D"font-size:10.0pt; color:red">[Please note: This e-mail is fr=
om an EXTERNAL e-mail address]</span></p>
</div>
<div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;">
Apologies, but please no. This adds complexity, isn't possible to disable a=
nd is difficult to understand. You can simply remove the unneeded files fro=
m ROOTFS_POSTPROCESS_COMMAND in your image class.</p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;">
&nbsp;</p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;">
Alex</p>
</div>
</div>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;">
&nbsp;</p>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;">
On Wed, 19 Jan 2022 at 04:07, hongxu &lt;<a href=3D"mailto:hongxu.jia@windr=
iver.com" class=3D"moz-txt-link-freetext">hongxu.jia@windriver.com</a>&gt; =
wrote:</p>
</div>
<blockquote style=3D"border:none; border-left:solid=0A=
                    #CCCCCC 1.0pt; padding:0cm 0cm 0cm=0A=
                    6.0pt; margin-left:4.8pt; margin-right:0cm">
<p class=3D"MsoNormal" style=3D"margin: 0cm; font-size: 11pt; font-family: =
Calibri, sans-serif;margin-bottom:12.0pt">
In order to save spaces in target rootfs, the user wants to remove dnf and<=
br>
keep rpm, in this situation, we should remove dnf database only<br>
<br>
If rpm was installed, keep rpm database, after applying this commit:<br>
<br>
Edit conf/local.conf<br>
...<br>
IMAGE_FEATURES:remove =3D &quot;package-management&quot;<br>
IMAGE_INSTALL:append=3D &quot; rpm&quot;<br>
...<br>
<br>
Build image and boot, run rpm -qa on target:<br>
Without this commit<br>
...<br>
root@intel-x86-64:~# rpm -qa | wc -l<br>
0<br>
...<br>
<br>
Apply this commit<br>
...<br>
root@intel-x86-64:~# rpm -qa | wc -l<br>
1865<br>
...<br>
<br>
With this commit, the rpm -qa works as expected.<br>
<br>
It does not make sense to keep dnf and remove rpm, so this commit<br>
does not consider the scenario<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank" class=3D"moz-txt-link-freetext">hongxu.jia@windriver.com</=
a>&gt;<br>
---<br>
&nbsp;meta/lib/oe/package_manager/rpm/<a href=3D"https://urldefense.com/v3/=
__https://eur02.safelinks.protection.outlook.com/?url=3Dhttps*3A*2F*2Furlde=
fense.com*2Fv3*2F__http*3A*2F*2F__init__.py__*3B!!AjveYdw8EvQ!JHTMzGi0-aiMo=
NjIt7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gIDKvdp1Putv*24&amp;data=3D04*7C=
01*7Cdiego.santacruz*40spinetix.com*7Ccfe2bf45c56e4efe23b608d9dbc02521*7C5f=
4034faed2d4840a93facb1e9633b93*7C0*7C0*7C637782440578878242*7CUnknown*7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0*3D=
*7C3000&amp;sdata=3Di0*2B51iSlYuayK9kClXpEUxk*2FhpzlSMHHkNLpa7*2BDSWc*3D&am=
p;reserved=3D0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSU!!AjveYdw8EvQ!P_Qo8UNa9=
oH3Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8Cxamel_UX$">__init__.py</=
a>
 | 9 +++++++--<br>
&nbsp;1 file changed, 7 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/package_manager/rpm/<a href=3D"https://urldefense.=
com/v3/__https://eur02.safelinks.protection.outlook.com/?url=3Dhttps*3A*2F*=
2Furldefense.com*2Fv3*2F__http*3A*2F*2F__init__.py__*3B!!AjveYdw8EvQ!JHTMzG=
i0-aiMoNjIt7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gIDKvdp1Putv*24&amp;data=
=3D04*7C01*7Cdiego.santacruz*40spinetix.com*7Ccfe2bf45c56e4efe23b608d9dbc02=
521*7C5f4034faed2d4840a93facb1e9633b93*7C0*7C0*7C637782440578878242*7CUnkno=
wn*7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0*3D*7C3000&amp;sdata=3Di0*2B51iSlYuayK9kClXpEUxk*2FhpzlSMHHkNLpa7*2BDS=
Wc*3D&amp;reserved=3D0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSU!!AjveYdw8EvQ!P=
_Qo8UNa9oH3Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8Cxamel_UX$">__ini=
t__.py</a>
 b/meta/lib/oe/package_manager/rpm/<a href=3D"https://urldefense.com/v3/__h=
ttps://eur02.safelinks.protection.outlook.com/?url=3Dhttps*3A*2F*2Furldefen=
se.com*2Fv3*2F__http*3A*2F*2F__init__.py__*3B!!AjveYdw8EvQ!JHTMzGi0-aiMoNjI=
t7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gIDKvdp1Putv*24&amp;data=3D04*7C01*=
7Cdiego.santacruz*40spinetix.com*7Ccfe2bf45c56e4efe23b608d9dbc02521*7C5f403=
4faed2d4840a93facb1e9633b93*7C0*7C0*7C637782440578878242*7CUnknown*7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0*3D*7C=
3000&amp;sdata=3Di0*2B51iSlYuayK9kClXpEUxk*2FhpzlSMHHkNLpa7*2BDSWc*3D&amp;r=
eserved=3D0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSU!!AjveYdw8EvQ!P_Qo8UNa9oH3=
Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8Cxamel_UX$">__init__.py</a><=
br>
index b392581069..dce5912329 100644<br>
--- a/meta/lib/oe/package_manager/rpm/<a href=3D"https://urldefense.com/v3/=
__https://eur02.safelinks.protection.outlook.com/?url=3Dhttps*3A*2F*2Furlde=
fense.com*2Fv3*2F__http*3A*2F*2F__init__.py__*3B!!AjveYdw8EvQ!JHTMzGi0-aiMo=
NjIt7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gIDKvdp1Putv*24&amp;data=3D04*7C=
01*7Cdiego.santacruz*40spinetix.com*7Ccfe2bf45c56e4efe23b608d9dbc02521*7C5f=
4034faed2d4840a93facb1e9633b93*7C0*7C0*7C637782440578878242*7CUnknown*7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0*3D=
*7C3000&amp;sdata=3Di0*2B51iSlYuayK9kClXpEUxk*2FhpzlSMHHkNLpa7*2BDSWc*3D&am=
p;reserved=3D0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSU!!AjveYdw8EvQ!P_Qo8UNa9=
oH3Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8Cxamel_UX$">__init__.py</=
a><br>
+++ b/meta/lib/oe/package_manager/rpm/<a href=3D"https://urldefense.com/v3/=
__https://eur02.safelinks.protection.outlook.com/?url=3Dhttps*3A*2F*2Furlde=
fense.com*2Fv3*2F__http*3A*2F*2F__init__.py__*3B!!AjveYdw8EvQ!JHTMzGi0-aiMo=
NjIt7Jb186B-p8VNKpv_Yrm-v87Li0GFTZf07eaSBP1gIDKvdp1Putv*24&amp;data=3D04*7C=
01*7Cdiego.santacruz*40spinetix.com*7Ccfe2bf45c56e4efe23b608d9dbc02521*7C5f=
4034faed2d4840a93facb1e9633b93*7C0*7C0*7C637782440578878242*7CUnknown*7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0*3D=
*7C3000&amp;sdata=3Di0*2B51iSlYuayK9kClXpEUxk*2FhpzlSMHHkNLpa7*2BDSWc*3D&am=
p;reserved=3D0__;JSUlJSUlJSUlJSUlJSUlJSUlJSUlJSUlJSU!!AjveYdw8EvQ!P_Qo8UNa9=
oH3Xr8z3HrU_xtzKsKiL3G0BxR5ApZ1zjZT1dhR0-6zDAqCXf8Cxamel_UX$">__init__.py</=
a><br>
@@ -80,7 +80,9 @@ class RpmPM(PackageManager):<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.saved_packaging_data =3D self.d.expa=
nd('${T}/saved_packaging_data/%s' % self.task_name)<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if not os.path.exists(self.d.expand('${T}=
/saved_packaging_data')):<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bb.utils.mkdirhier(self.d.e=
xpand('${T}/saved_packaging_data'))<br>
-&nbsp; &nbsp; &nbsp; &nbsp; self.packaging_data_dirs =3D ['etc/rpm', 'etc/=
rpmrc', 'etc/dnf', 'var/lib/rpm', 'var/lib/dnf', 'var/cache/dnf']<br>
+&nbsp; &nbsp; &nbsp; &nbsp; self.packaging_data_rpm_dirs =3D ['etc/rpm', '=
etc/rpmrc', 'var/lib/rpm']<br>
+&nbsp; &nbsp; &nbsp; &nbsp; self.packaging_data_dnf_dirs =3D ['etc/dnf', '=
var/lib/dnf', 'var/cache/dnf']<br>
+&nbsp; &nbsp; &nbsp; &nbsp; self.packaging_data_dirs =3D self.packaging_da=
ta_rpm_dirs + self.packaging_data_dnf_dirs<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.solution_manifest =3D self.d.expand(=
'${T}/saved/%s_solution' %<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; self.task_name)<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if not os.path.exists(self.d.expand('${T}=
/saved')):<br>
@@ -237,8 +239,11 @@ class RpmPM(PackageManager):<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self._invoke_dnf([&quot;autoremove&quot;]=
)<br>
<br>
&nbsp; &nbsp; &nbsp;def remove_packaging_data(self):<br>
+&nbsp; &nbsp; &nbsp; &nbsp; remove_packaging_data_dirs =3D self.packaging_=
data_dnf_dirs<br>
+&nbsp; &nbsp; &nbsp; &nbsp; if &quot;rpm&quot; not in self.list_installed(=
):<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; remove_packaging_data_dirs +=3D =
self.packaging_data_rpm_dirs<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self._invoke_dnf([&quot;clean&quot;, &quo=
t;all&quot;])<br>
-&nbsp; &nbsp; &nbsp; &nbsp; for dir in self.packaging_data_dirs:<br>
+&nbsp; &nbsp; &nbsp; &nbsp; for dir in remove_packaging_data_dirs:<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bb.utils.remove(oe.path.joi=
n(self.target_rootfs, dir), True)<br>
<br>
&nbsp; &nbsp; &nbsp;def backup_packaging_data(self):<br>
-- <br>
2.27.0<br>
<br>
<br>
<br>
</p>
</blockquote>
</div>
</div>
</div>
</div>
</div>
</div>
</blockquote>
<p><br>
</p>
</body>
</html>

--_000_c1bb2cec2d94dad41f681a84294ce0ccwindrivercom_--

