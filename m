Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B52C28B2E
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 06:29:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2689.1741674567585404987
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 23:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5165aa4577=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B5e2ng010671
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 23:29:27 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458p9qjndm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 23:29:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5KpdXrvV4ixNPf7SZrMNWqaD1+xYJ3umrQaT6khfQW1AMbThSqJEZlIqm0iFv//W31pfmG7rgdsgzGDJMRLrIV0sdW77PSoYfTsNMH/E285ImV+xWQlSWiDVLTb5S07BIWSLlBTQh7e/crzvevTDbnL5ShmzRVWz5aNJ91Oz4yiM87Ptr53bCI+Zp+1S0OxlBwVSj5FwRIbWQ2n9nNhEVOA+SHTPRJYbxv3Y1PjVoa5QMiyH50svnnVaJTrQNhNITGizjloYlprxWQZdGjyPIl9+odI81r1SRgVuxZqfl1ttzeGHqZ/xNV4rbNDJu8a5EpPXQ50/1IrZTjD2Lm5GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvx7z3rFaDQc1DvlUyY4+TCQgbUQX0hpxddV2+ZybbY=;
 b=Yo6jN8MQeMZUwdtHciPytpUAjidkb85YTvraTdM0hHwCI2PTOmYdSplWuUVQGLkq+IN2dM9w/1FggSU8EU4Js4XqSprAW/4nPCvOWv1RkUdkrVabMdzSEgNirRWVy2LxDUNXmWX8vw7Q4UhxMPWlQv605ryoUHFK8Nic9ewJVJcph54qpomhlUcMfMkTpVtnEkgIZsNQ+FXxiqqd9Ees4e1Ql/G/bh9k05aHhq762dbS3tzP5XRWROGUexnqD4NQZ/JNsADiF5Ttgo5e6sfIVyjAC5r/PvjW2yG7LEIZ7LLIqOpN0uaXM9I/C2GSnKGCbqeY5C3L5x1c6ss+eue6Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 DS7PR11MB6080.namprd11.prod.outlook.com (2603:10b6:8:84::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.27; Tue, 11 Mar 2025 06:29:23 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%4]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 06:29:22 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
Subject: Re: [oe-core][scarthgap][PATCH 1/5] openssh: fix CVE-2025-26465
Thread-Topic: [oe-core][scarthgap][PATCH 1/5] openssh: fix CVE-2025-26465
Thread-Index: AQHbjem910X4rd/N6EqJa5vFLhuzh7Ntge8S
Date: Tue, 11 Mar 2025 06:29:22 +0000
Message-ID: 
 <DM8PR11MB57035EF3E5CE9C8AD3B26DBD84D12@DM8PR11MB5703.namprd11.prod.outlook.com>
References: <1829F440ACCF827D.14109@lists.openembedded.org>
In-Reply-To: <1829F440ACCF827D.14109@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5703:EE_|DS7PR11MB6080:EE_
x-ms-office365-filtering-correlation-id: 99566c29-94a3-4b90-b28d-08dd60660ff8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|8096899003|13003099007|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?qaWykEvxtk+DcsWZMMNaBiNnSX4eX7wctD6sEDzJPN6ImuJ8AL3c1JoJBh?=
 =?iso-8859-1?Q?6OkFUY5A1nJDG1NKR8J/oR97isMJfMpyY8JqBEbfUaX+AaEydpCLUuf6Cb?=
 =?iso-8859-1?Q?vobFLtfS8MmrZOWhcjarYoj9v23s8OdFSQ3rm2VhVn4hU0aeIlS2drEmjs?=
 =?iso-8859-1?Q?/t1htOpU9s5Gqxpw+9ApYNPJagT50AIpYRZiYQ9p4oY3gfuXyl6nZB+Hf1?=
 =?iso-8859-1?Q?Ml4rzJwzOTCm6JyOyn97XoAjmbVhv+OGg7I940h1tlNQqA1HJi/92K1nBr?=
 =?iso-8859-1?Q?fPFm9M1MRECmn+vfnkacg0n22fRL61BreGm9L0FHQG2YT+DrBjCzBbv9vY?=
 =?iso-8859-1?Q?WcL9s9pxpcSY3DDdPaBz2NDsxLfQYxZWY/3h14V9ZvOeo/8IBHflxW5HM4?=
 =?iso-8859-1?Q?lddT5O64G1zrr/jrNfRn4o69Phk7/85BxUtxTbOycNC0MDYPqMPWAe64FC?=
 =?iso-8859-1?Q?dKMZ33Yns7jfX7Um8Kx9WRZDo6SoKqCaBUkELdYbSWLkpUeMLepHTPIcE/?=
 =?iso-8859-1?Q?1mxMEaj1iqKd1eByJJDEmGc7XJzETJjb3CZDDEB1nM+kh3AOeDgoEKGtPP?=
 =?iso-8859-1?Q?6yfcmJK97gOnvHKXCnOVe57eP971n4jfOD1NMa4mXL84/JT3y+1/aZiBGg?=
 =?iso-8859-1?Q?7odOVm9DCkfBx1Sxi9xLZTZvSJBrTUnfawPusblv1B2MTnAlp/PDgEp2YI?=
 =?iso-8859-1?Q?oKW1eFZK2gG8bmNBDq0wlICsG/3M6awAyN2gnI4wMoMaZhQQC6HkjsCY3U?=
 =?iso-8859-1?Q?gJEG6grWVJ6X+/pAd/dv/5KheFCpXugdi+CFr7Bi5/F7hiTf/IKgV9AQrp?=
 =?iso-8859-1?Q?U7LIqkkSk2GGesWAaR1vBG0iEhvzf6058hwfc105PINJ1uQiFn1gqC5EgF?=
 =?iso-8859-1?Q?ovXCuYv92T9EuFIUfS7mTYvCkEJBojzdilGJHiqsqsZoFn39+Y0hLAS/1D?=
 =?iso-8859-1?Q?MnGV6syIXnwEUEC7obdrDX5D7C+McshU4hjb610/tbc4/2afWAJ3XMGkgs?=
 =?iso-8859-1?Q?LkvQpMb5zTRIxUnQWRMIJSUAegQKW/r7HropXoLzjeVWxUYi3wyUyPv2GZ?=
 =?iso-8859-1?Q?lnNSCBElrWJReWKLFrleMdq1ziFXBG1MKi4hAYG2GrCh2EdivxG7An2h0j?=
 =?iso-8859-1?Q?3zQ8gVBSyPvFDFEwcDYs6uuc4yopHqgTdrmDlD6bl1G0uGyN/h9IyrDDPZ?=
 =?iso-8859-1?Q?qP45uN3wnefo5YCQ2qe46nueoSgt72TKhsmwOgavwUYZncBbxMrkG8pkPY?=
 =?iso-8859-1?Q?j8ETHzYy8kdgXpfLo/Hwplf4BGh28KuKpDfFOg183cY/dBuhVSd53zYKaj?=
 =?iso-8859-1?Q?9XGVx6vaX84s38qjntU3cK+ghDRSI+ADCRV+qug9Fs/KEg7uK9xsYjsbKL?=
 =?iso-8859-1?Q?fxEmVgrS3OFrXcW11n/VME3mPDT7o6nvfBtVCuBkig6BKYhHtjhun8pHtB?=
 =?iso-8859-1?Q?LBtjCnryoBjtPfXB?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5703.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(13003099007)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?dXHZLRTHmXXCNg9ksme7Ib1Ov6dxvNWTUtfzvtgkct9xEPIQOaPY0LRLda?=
 =?iso-8859-1?Q?3a5/oCBrBgoMptbFKmcSbjt/HpLdZzCYgGUc0IdUeLyVInZaPRk9jvR6c1?=
 =?iso-8859-1?Q?T5+vucEvLf6q7TcGcftsHY4RVwbtyY8fBT1Mc47mmukD99U3kLDuU+/Y4h?=
 =?iso-8859-1?Q?jwMxABF1Lqsn5i/d7+9YOohmID2JkdksKQsM7WkmHMjh/+i7G1LRpzThkt?=
 =?iso-8859-1?Q?hE4ePUbHU/S9eXRWDt/f7vf2JAlpl66TRe9HD6LUimWOMCEm+qyH7c0Sxn?=
 =?iso-8859-1?Q?YFreuoDfn4+L4+9hMuXxnxcdcPZuY37qJU8960zNBMqTjfKddC8dJ0mIga?=
 =?iso-8859-1?Q?tBwrjyRdmTnz764/pyUZEoFmcc5l2qgrWyUUggr7aiCM991yt3zfBZ33XW?=
 =?iso-8859-1?Q?tlD+7qcAmv3OtdjdKvNCNpxiK4LDZoKSycXz4h7zBPptoL3iadyfX/l6JP?=
 =?iso-8859-1?Q?rfxgNpciA61LS74Hz+1Z3TMdkzzJzte2coVz+wzv5YiOaMBwmiqRj5mx4r?=
 =?iso-8859-1?Q?Tp8eWnq51JSxnYqst4V0X+JY2eaBXDqSBoAGUqD4bCW+lfIcJmfwPGaFEq?=
 =?iso-8859-1?Q?1PcW3+H1IIHUFFPXbT9RNyFu8uZHHbaLABvWplekV3URBsKFnPQ9Gh8SyT?=
 =?iso-8859-1?Q?pR5ugs20PrtFnpwRrI0IOwpD/9QePL8ygipJEg8n61W6+Kgo5DyuSRlUPd?=
 =?iso-8859-1?Q?IulVxCvtg59oCYRszI99O6bNBkIv37KvjXX+YhrhN9tmMZgzp6PExwGpjF?=
 =?iso-8859-1?Q?bIJLkyClf/88vvFXiGGcnG8bkadf7122tXGSMdY+afAIYT4wlFBr22g5KL?=
 =?iso-8859-1?Q?pZVEtDIwBW7Bzvfksp36ZlFROgajbkYyTIl25veB4KovjwmTQS1rpBkSKr?=
 =?iso-8859-1?Q?Xq9MFRc/JqjaEFOhSwsaDrI8uAC5Om1pYbbl6W//1a8LMji6YisHcA8cjv?=
 =?iso-8859-1?Q?XY1j5wazATDGEVkEB4ciSDMggpcaNtfjXyITqasgmtZ/Xi6HexIrt6c6dW?=
 =?iso-8859-1?Q?Y0GNF6CuZ3upk//rSWO46PbmR9aTBdMh5JcZIqfLHkWocVAQNL6J6bBem8?=
 =?iso-8859-1?Q?JDpjhIikF0ycQBaCMPtOKYNJ+ThCAmsiiM/GC3w0RjNCoVn3HN2qWHfBu/?=
 =?iso-8859-1?Q?JBacAeo+l4SbvuQc550zpdSpa6IL0tY3AGIOuca375j3B6bkKf2RA+lEn+?=
 =?iso-8859-1?Q?dUATOCxU+jq4V4PjQq8RIQx6Q+AniwU5WpOqR+0ZmpD2ELhLRn0J29ijKK?=
 =?iso-8859-1?Q?ny+tEuKDKt37HnGgI94RQoNihmIf56Csb5+Br2e06n/CJ3W28XJYnc7Fhv?=
 =?iso-8859-1?Q?0jggray+deokgbNm+Jd0B2zNULy2jpWXo+4YNoWxEcCvOMJbNPbJd24fva?=
 =?iso-8859-1?Q?5zCjzvCYi4r01Z80HDPLWM88fXbxmkdPhBwDLPLjiijH+pYPB0fxCebB8P?=
 =?iso-8859-1?Q?s9m62pZvjvoXjNqd1oTyuqHXCT/MOicq60EhmbxtUYoa6U2UlRJMi/HhzM?=
 =?iso-8859-1?Q?BWVbG0bYbPJtSrD8IJLP441/pifrnHmFAypJ8Zqs6+mlQe/3O95/ktjVU4?=
 =?iso-8859-1?Q?hAPSFxmhTHIaZqvKB4XfxRkcxKcivz6oYHAy6NjkV+HLcmVLW659Qp9rC9?=
 =?iso-8859-1?Q?5K7fx/p6cwf2R18JQalzLYd5q/f9k1L3jEoYEdDrAFIicx4YCmdx3oAg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR11MB57035EF3E5CE9C8AD3B26DBD84D12DM8PR11MB5703namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99566c29-94a3-4b90-b28d-08dd60660ff8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 06:29:22.7319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NtGisRbH2JnPpzJqkS3i0SFLRpJVVn1yPwrJkMHR6XjOUOALyqG4HjWDwgHEPn9vdfm+3c6lTEAL1S8D08l/qrBCbXnIb2Y2pQotHYMnk2Fos3jr5yWF/l2I6dckor1j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6080
X-Authority-Analysis: v=2.4 cv=QNySRhLL c=1 sm=1 tr=0 ts=67cfd846 cx=c_pps a=wMNeujlvNozESTkKEiiyVQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=NEAV23lmAAAA:8 a=3tcz3bTJAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=WcxHNsqOAAAA:8 a=HU1OPnRnAAAA:8 a=v7Rpbd0y5yUma8wmELsA:9 a=wPNLvfGTeEIA:10 a=uuGWQC_aDZXvu7GbY18A:9 a=hxRmg0UQtEgSbf1b:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=ImwWUX5h3JJ3gRE9moBe:22 a=4EbjBm0RLgFgoQzmu6QD:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=WXeDAsiyfwSRC1lbKA7R:22 a=vQ5cN67eHy2kcvnFvKcb:22
X-Proofpoint-GUID: 5QbrW5p_RY8ESkJ-Ub6CRa9feYaJTZrl
X-Proofpoint-ORIG-GUID: 5QbrW5p_RY8ESkJ-Ub6CRa9feYaJTZrl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503110042
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 06:29:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212544

--_000_DM8PR11MB57035EF3E5CE9C8AD3B26DBD84D12DM8PR11MB5703namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Any issue with this patch?


________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Polampalli, Archana via lists.openembedded.org =
<archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: Wednesday, March 5, 2025 21:44
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: [oe-core][scarthgap][PATCH 1/5] openssh: fix CVE-2025-26465

From: Archana Polampalli <archana.polampalli@windriver.com>

A vulnerability was found in OpenSSH when the VerifyHostKeyDNS option is en=
abled.
A machine-in-the-middle attack can be performed by a malicious machine impe=
rsonating
a legit server. This issue occurs due to how OpenSSH mishandles error codes=
 in specific
conditions when verifying the host key. For an attack to be considered succ=
essful,
the attacker needs to manage to exhaust the client's memory resource first,=
 turning
the attack complexity high.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../openssh/openssh/CVE-2025-26465.patch      | 169 ++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |   1 +
 2 files changed, 170 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-2646=
5.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch=
 b/meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch
new file mode 100644
index 0000000000..0a3cf1496b
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch
@@ -0,0 +1,169 @@
+From 0832aac79517611dd4de93ad0a83577994d9c907 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Tue, 18 Feb 2025 08:02:48 +0000
+Subject: [PATCH] upstream: Fix cases where error codes were not correctly =
set
+
+Reported by the Qualys Security Advisory team. ok markus@
+
+OpenBSD-Commit-ID: 7bcd4ffe0fa1e27ff98d451fb9c22f5fae6e610d
+
+CVE: CVE-2025-26465
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/com=
mit/0832aac79517611dd4de93ad0a83577994d9c907]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ krl.c           | 4 +++-
+ ssh-agent.c     | 5 +++++
+ ssh-sk-client.c | 4 +++-
+ sshconnect2.c   | 5 ++++-
+ sshsig.c        | 1 +
+ 5 files changed, 16 insertions(+), 3 deletions(-)
+
+diff --git a/krl.c b/krl.c
+index e2efdf0..0d0f695 100644
+--- a/krl.c
++++ b/krl.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: krl.c,v 1.59 2023/07/17 05:22:30 djm Exp $ */
++/* $OpenBSD: krl.c,v 1.60 2025/02/18 08:02:48 djm Exp $ */
+ /*
+  * Copyright (c) 2012 Damien Miller <djm@mindrot.org>
+  *
+@@ -674,6 +674,7 @@ revoked_certs_generate(struct revoked_certs *rc, struc=
t sshbuf *buf)
+                       break;
+               case KRL_SECTION_CERT_SERIAL_BITMAP:
+                       if (rs->lo - bitmap_start > INT_MAX) {
++                              r =3D SSH_ERR_INVALID_FORMAT;
+                               error_f("insane bitmap gap");
+                               goto out;
+                       }
+@@ -1059,6 +1060,7 @@ ssh_krl_from_blob(struct sshbuf *buf, struct ssh_krl=
 **krlp)
+       }
+
+       if ((krl =3D ssh_krl_init()) =3D=3D NULL) {
++              r =3D SSH_ERR_ALLOC_FAIL;
+               error_f("alloc failed");
+               goto out;
+       }
+diff --git a/ssh-agent.c b/ssh-agent.c
+index b6a3f48..2d2c6fc 100644
+--- a/ssh-agent.c
++++ b/ssh-agent.c
+@@ -1204,6 +1204,7 @@ parse_key_constraint_extension(struct sshbuf *m, cha=
r **sk_providerp,
+           "restrict-destination-v00@openssh.com") =3D=3D 0) {
+               if (*dcsp !=3D NULL) {
+                       error_f("%s already set", ext_name);
++                      r =3D SSH_ERR_INVALID_FORMAT;
+                       goto out;
+               }
+               if ((r =3D sshbuf_froms(m, &b)) !=3D 0) {
+@@ -1213,6 +1214,7 @@ parse_key_constraint_extension(struct sshbuf *m, cha=
r **sk_providerp,
+               while (sshbuf_len(b) !=3D 0) {
+                       if (*ndcsp >=3D AGENT_MAX_DEST_CONSTRAINTS) {
+                               error_f("too many %s constraints", ext_name=
);
++                              r =3D SSH_ERR_INVALID_FORMAT;
+                               goto out;
+                       }
+                       *dcsp =3D xrecallocarray(*dcsp, *ndcsp, *ndcsp + 1,
+@@ -1230,6 +1232,7 @@ parse_key_constraint_extension(struct sshbuf *m, cha=
r **sk_providerp,
+               }
+               if (*certs !=3D NULL) {
+                       error_f("%s already set", ext_name);
++                      r =3D SSH_ERR_INVALID_FORMAT;
+                       goto out;
+               }
+               if ((r =3D sshbuf_get_u8(m, &v)) !=3D 0 ||
+@@ -1241,6 +1244,7 @@ parse_key_constraint_extension(struct sshbuf *m, cha=
r **sk_providerp,
+               while (sshbuf_len(b) !=3D 0) {
+                       if (*ncerts >=3D AGENT_MAX_EXT_CERTS) {
+                               error_f("too many %s constraints", ext_name=
);
++                              r =3D SSH_ERR_INVALID_FORMAT;
+                               goto out;
+                       }
+                       *certs =3D xrecallocarray(*certs, *ncerts, *ncerts =
+ 1,
+@@ -1737,6 +1741,7 @@ process_ext_session_bind(SocketEntry *e)
+       /* record new key/sid */
+       if (e->nsession_ids >=3D AGENT_MAX_SESSION_IDS) {
+               error_f("too many session IDs recorded");
++              r =3D -1;
+               goto out;
+       }
+       e->session_ids =3D xrecallocarray(e->session_ids, e->nsession_ids,
+diff --git a/ssh-sk-client.c b/ssh-sk-client.c
+index 321fe53..06fad22 100644
+--- a/ssh-sk-client.c
++++ b/ssh-sk-client.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: ssh-sk-client.c,v 1.12 2022/01/14 03:34:00 djm Exp $ */
++/* $OpenBSD: ssh-sk-client.c,v 1.13 2025/02/18 08:02:48 djm Exp $ */
+ /*
+  * Copyright (c) 2019 Google LLC
+  *
+@@ -439,6 +439,7 @@ sshsk_load_resident(const char *provider_path, const c=
har *device,
+               }
+               if ((srk =3D calloc(1, sizeof(*srk))) =3D=3D NULL) {
+                       error_f("calloc failed");
++                      r =3D SSH_ERR_ALLOC_FAIL;
+                       goto out;
+               }
+               srk->key =3D key;
+@@ -450,6 +451,7 @@ sshsk_load_resident(const char *provider_path, const c=
har *device,
+               if ((tmp =3D recallocarray(srks, nsrks, nsrks + 1,
+                   sizeof(*srks))) =3D=3D NULL) {
+                       error_f("recallocarray keys failed");
++                      r =3D SSH_ERR_ALLOC_FAIL;
+                       goto out;
+               }
+               debug_f("srks[%zu]: %s %s uidlen %zu", nsrks,
+diff --git a/sshconnect2.c b/sshconnect2.c
+index fab1e36..a5f92f0 100644
+--- a/sshconnect2.c
++++ b/sshconnect2.c
+@@ -101,7 +101,7 @@ verify_host_key_callback(struct sshkey *hostkey, struc=
t ssh *ssh)
+           options.required_rsa_size)) !=3D 0)
+               fatal_r(r, "Bad server host key");
+       if (verify_host_key(xxx_host, xxx_hostaddr, hostkey,
+-          xxx_conn_info) =3D=3D -1)
++          xxx_conn_info) !=3D 0)
+               fatal("Host key verification failed.");
+       return 0;
+ }
+@@ -709,6 +709,7 @@ input_userauth_pk_ok(int type, u_int32_t seq, struct s=
sh *ssh)
+
+       if ((pktype =3D sshkey_type_from_name(pkalg)) =3D=3D KEY_UNSPEC) {
+               debug_f("server sent unknown pkalg %s", pkalg);
++              r =3D SSH_ERR_INVALID_FORMAT;
+               goto done;
+       }
+       if ((r =3D sshkey_from_blob(pkblob, blen, &key)) !=3D 0) {
+@@ -719,6 +720,7 @@ input_userauth_pk_ok(int type, u_int32_t seq, struct s=
sh *ssh)
+               error("input_userauth_pk_ok: type mismatch "
+                   "for decoded key (received %d, expected %d)",
+                   key->type, pktype);
++              r =3D SSH_ERR_INVALID_FORMAT;
+               goto done;
+       }
+
+@@ -738,6 +740,7 @@ input_userauth_pk_ok(int type, u_int32_t seq, struct s=
sh *ssh)
+                   SSH_FP_DEFAULT);
+               error_f("server replied with unknown key: %s %s",
+                   sshkey_type(key), fp =3D=3D NULL ? "<ERROR>" : fp);
++              r =3D SSH_ERR_INVALID_FORMAT;
+               goto done;
+       }
+       ident =3D format_identity(id);
+diff --git a/sshsig.c b/sshsig.c
+index d50d65f..1b7f40d 100644
+--- a/sshsig.c
++++ b/sshsig.c
+@@ -874,6 +874,7 @@ cert_filter_principals(const char *path, u_long linenu=
m,
+       }
+       if ((principals =3D sshbuf_dup_string(nprincipals)) =3D=3D NULL) {
+               error_f("buffer error");
++              r =3D SSH_ERR_ALLOC_FAIL;
+               goto out;
+       }
+       /* success */
+--
+2.40.0
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/reci=
pes-connectivity/openssh/openssh_9.6p1.bb
index ea5face097..6ae4c81a42 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -30,6 +30,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/p=
ortable/openssh-${PV}.tar
            file://CVE-2024-39894.patch \
            file://0001-Fix-missing-header-for-systemd-notification.patch \
            file://CVE-2025-26466.patch \
+           file://CVE-2025-26465.patch \
            "
 SRC_URI[sha256sum] =3D "910211c07255a8c5ad654391b40ee59800710dd8119dd5362d=
e09385aa7a777c"

--
2.40.0


--_000_DM8PR11MB57035EF3E5CE9C8AD3B26DBD84D12DM8PR11MB5703namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Any issue with this patch?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div dir=3D"ltr" id=3D"divRplyFwdMsg"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;openem=
bedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded=
.org&gt; on behalf of Polampalli, Archana via lists.openembedded.org
 &lt;archana.polampalli=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b>&nbsp;Wednesday, March 5, 2025 21:44<br>
<b>To:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded-c=
ore@lists.openembedded.org&gt;<br>
<b>Subject:</b>&nbsp;[oe-core][scarthgap][PATCH 1/5] openssh: fix CVE-2025-=
26465</span>
<div>&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">From: Archana Polampalli &lt;archana.polamp=
alli@windriver.com&gt;<br>
<br>
A vulnerability was found in OpenSSH when the VerifyHostKeyDNS option is en=
abled.<br>
A machine-in-the-middle attack can be performed by a malicious machine impe=
rsonating<br>
a legit server. This issue occurs due to how OpenSSH mishandles error codes=
 in specific<br>
conditions when verifying the host key. For an attack to be considered succ=
essful,<br>
the attacker needs to manage to exhaust the client's memory resource first,=
 turning<br>
the attack complexity high.<br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;.../openssh/openssh/CVE-2025-26465.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 169 ++++++++++++++++++<br>
&nbsp;.../openssh/openssh_9.6p1.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;=
 1 +<br>
&nbsp;2 files changed, 170 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025=
-26465.patch<br>
<br>
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch=
 b/meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch<br>
new file mode 100644<br>
index 0000000000..0a3cf1496b<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-26465.patch<br>
@@ -0,0 +1,169 @@<br>
+From 0832aac79517611dd4de93ad0a83577994d9c907 Mon Sep 17 00:00:00 2001<br>
+From: &quot;djm@openbsd.org&quot; &lt;djm@openbsd.org&gt;<br>
+Date: Tue, 18 Feb 2025 08:02:48 +0000<br>
+Subject: [PATCH] upstream: Fix cases where error codes were not correctly =
set<br>
+<br>
+Reported by the Qualys Security Advisory team. ok markus@<br>
+<br>
+OpenBSD-Commit-ID: 7bcd4ffe0fa1e27ff98d451fb9c22f5fae6e610d<br>
+<br>
+CVE: CVE-2025-26465<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/openssh/openssh-p=
ortable/commit/0832aac79517611dd4de93ad0a83577994d9c907" id=3D"OWA66db0b0b-=
c2df-2763-8686-07f8bd0d8b01" class=3D"OWAAutoLink" data-auth=3D"NotApplicab=
le">https://github.com/openssh/openssh-portable/commit/0832aac79517611dd4de=
93ad0a83577994d9c907</a>]<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ krl.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 4 +++=
-<br>
+ ssh-agent.c&nbsp;&nbsp;&nbsp;&nbsp; | 5 +++++<br>
+ ssh-sk-client.c | 4 +++-<br>
+ sshconnect2.c&nbsp;&nbsp; | 5 ++++-<br>
+ sshsig.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1 +<br>
+ 5 files changed, 16 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/krl.c b/krl.c<br>
+index e2efdf0..0d0f695 100644<br>
+--- a/krl.c<br>
++++ b/krl.c<br>
+@@ -1,4 +1,4 @@<br>
+-/* $OpenBSD: krl.c,v 1.59 2023/07/17 05:22:30 djm Exp $ */<br>
++/* $OpenBSD: krl.c,v 1.60 2025/02/18 08:02:48 djm Exp $ */<br>
+ /*<br>
+&nbsp; * Copyright (c) 2012 Damien Miller &lt;djm@mindrot.org&gt;<br>
+&nbsp; *<br>
+@@ -674,6 +674,7 @@ revoked_certs_generate(struct revoked_certs *rc, struc=
t sshbuf *buf)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case KRL_SECTION_CERT_SERIAL_BITMAP:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rs-&gt;lo - =
bitmap_start &gt; INT_MAX) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; r =3D SSH_ERR_INVALID_FORMAT;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_f(&quot;insane bitmap gap&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto out;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+@@ -1059,6 +1060,7 @@ ssh_krl_from_blob(struct sshbuf *buf, struct ssh_krl=
 **krlp)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((krl =3D ssh_krl_init()) =3D=3D N=
ULL) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; r =3D SSH_ERR_ALLOC_FAIL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; error_f(&quot;alloc failed&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto out;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+diff --git a/ssh-agent.c b/ssh-agent.c<br>
+index b6a3f48..2d2c6fc 100644<br>
+--- a/ssh-agent.c<br>
++++ b/ssh-agent.c<br>
+@@ -1204,6 +1204,7 @@ parse_key_constraint_extension(struct sshbuf *m, cha=
r **sk_providerp,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;restric=
t-destination-v00@openssh.com&quot;) =3D=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (*dcsp !=3D NULL) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_f(&quot;%s=
 already set&quot;, ext_name);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D SSH_ERR_INVALID=
_FORMAT;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto out;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if ((r =3D sshbuf_froms(m, &amp;b)) !=3D 0) {<br>
+@@ -1213,6 +1214,7 @@ parse_key_constraint_extension(struct sshbuf *m, cha=
r **sk_providerp,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; while (sshbuf_len(b) !=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*ndcsp &gt;=
=3D AGENT_MAX_DEST_CONSTRAINTS) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_f(&quot;too many %s constraints&quot;=
, ext_name);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; r =3D SSH_ERR_INVALID_FORMAT;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto out;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *dcsp =3D xrecal=
locarray(*dcsp, *ndcsp, *ndcsp + 1,<br>
+@@ -1230,6 +1232,7 @@ parse_key_constraint_extension(struct sshbuf *m, cha=
r **sk_providerp,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (*certs !=3D NULL) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_f(&quot;%s=
 already set&quot;, ext_name);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D SSH_ERR_INVALID=
_FORMAT;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto out;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if ((r =3D sshbuf_get_u8(m, &amp;v)) !=3D 0 ||<br>
+@@ -1241,6 +1244,7 @@ parse_key_constraint_extension(struct sshbuf *m, cha=
r **sk_providerp,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; while (sshbuf_len(b) !=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*ncerts &gt;=
=3D AGENT_MAX_EXT_CERTS) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_f(&quot;too many %s constraints&quot;=
, ext_name);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; r =3D SSH_ERR_INVALID_FORMAT;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto out;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *certs =3D xreca=
llocarray(*certs, *ncerts, *ncerts + 1,<br>
+@@ -1737,6 +1741,7 @@ process_ext_session_bind(SocketEntry *e)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* record new key/sid */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (e-&gt;nsession_ids &gt;=3D AGENT_=
MAX_SESSION_IDS) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; error_f(&quot;too many session IDs recorded&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; r =3D -1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto out;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e-&gt;session_ids =3D xrecallocarray(=
e-&gt;session_ids, e-&gt;nsession_ids,<br>
+diff --git a/ssh-sk-client.c b/ssh-sk-client.c<br>
+index 321fe53..06fad22 100644<br>
+--- a/ssh-sk-client.c<br>
++++ b/ssh-sk-client.c<br>
+@@ -1,4 +1,4 @@<br>
+-/* $OpenBSD: ssh-sk-client.c,v 1.12 2022/01/14 03:34:00 djm Exp $ */<br>
++/* $OpenBSD: ssh-sk-client.c,v 1.13 2025/02/18 08:02:48 djm Exp $ */<br>
+ /*<br>
+&nbsp; * Copyright (c) 2019 Google LLC<br>
+&nbsp; *<br>
+@@ -439,6 +439,7 @@ sshsk_load_resident(const char *provider_path, const c=
har *device,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if ((srk =3D calloc(1, sizeof(*srk))) =3D=3D NULL) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_f(&quot;ca=
lloc failed&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D SSH_ERR_ALLOC_F=
AIL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto out;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; srk-&gt;key =3D key;<br>
+@@ -450,6 +451,7 @@ sshsk_load_resident(const char *provider_path, const c=
har *device,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if ((tmp =3D recallocarray(srks, nsrks, nsrks + 1,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(*srks))) =3D=3D NULL) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_f(&quot;re=
callocarray keys failed&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D SSH_ERR_ALLOC_F=
AIL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto out;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; debug_f(&quot;srks[%zu]: %s %s uidlen %zu&quot;, nsrks,<br>
+diff --git a/sshconnect2.c b/sshconnect2.c<br>
+index fab1e36..a5f92f0 100644<br>
+--- a/sshconnect2.c<br>
++++ b/sshconnect2.c<br>
+@@ -101,7 +101,7 @@ verify_host_key_callback(struct sshkey *hostkey, struc=
t ssh *ssh)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; options.requi=
red_rsa_size)) !=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fatal_r(r, &quot;Bad server host key&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (verify_host_key(xxx_host, xxx_hos=
taddr, hostkey,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xxx_conn_info) =3D=
=3D -1)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xxx_conn_info) !=
=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fatal(&quot;Host key verification failed.&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
+ }<br>
+@@ -709,6 +709,7 @@ input_userauth_pk_ok(int type, u_int32_t seq, struct s=
sh *ssh)<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((pktype =3D sshkey_type_from_name=
(pkalg)) =3D=3D KEY_UNSPEC) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; debug_f(&quot;server sent unknown pkalg %s&quot;, pkalg);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; r =3D SSH_ERR_INVALID_FORMAT;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto done;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((r =3D sshkey_from_blob(pkblob, b=
len, &amp;key)) !=3D 0) {<br>
+@@ -719,6 +720,7 @@ input_userauth_pk_ok(int type, u_int32_t seq, struct s=
sh *ssh)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; error(&quot;input_userauth_pk_ok: type mismatch &quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;for decoded key (received %d, expe=
cted %d)&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key-&gt;type, pktype);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; r =3D SSH_ERR_INVALID_FORMAT;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto done;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+@@ -738,6 +740,7 @@ input_userauth_pk_ok(int type, u_int32_t seq, struct s=
sh *ssh)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SSH_FP_DEFAULT);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; error_f(&quot;server replied with unknown key: %s %s&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sshkey_type(key), fp =3D=3D NULL ? &quot=
;&lt;ERROR&gt;&quot; : fp);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; r =3D SSH_ERR_INVALID_FORMAT;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto done;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ident =3D format_identity(id);<br>
+diff --git a/sshsig.c b/sshsig.c<br>
+index d50d65f..1b7f40d 100644<br>
+--- a/sshsig.c<br>
++++ b/sshsig.c<br>
+@@ -874,6 +874,7 @@ cert_filter_principals(const char *path, u_long linenu=
m,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((principals =3D sshbuf_dup_string=
(nprincipals)) =3D=3D NULL) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; error_f(&quot;buffer error&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; r =3D SSH_ERR_ALLOC_FAIL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto out;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* success */<br>
+--<br>
+2.40.0<br>
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/reci=
pes-connectivity/openssh/openssh_9.6p1.bb<br>
index ea5face097..6ae4c81a42 100644<br>
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb<br>
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb<br>
@@ -30,6 +30,7 @@ SRC_URI =3D &quot;http://ftp.openbsd.org/pub/OpenBSD/Open=
SSH/portable/openssh-${PV}.tar<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2024-39894.patch" id=3D"OWAdc190113-6c74-70e2-ae78-4729effae=
fd2" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2024-39894.patch</a>&nbsp;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-Fix-missing-header-for-systemd-notification.patch" id=3D"OW=
A0b33539e-5a52-875b-f733-1264498b20a2" class=3D"OWAAutoLink" data-auth=3D"N=
otApplicable">
file://0001-Fix-missing-header-for-systemd-notification.patch</a>&nbsp;\<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2025-26466.patch" id=3D"OWAbc61758b-da35-4140-e791-209dc2e5b=
cf8" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2025-26466.patch</a>&nbsp;\<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2025-26465.patch" id=3D"OWAfd476873-bef0-2302-a87a-bc32e094185a" c=
lass=3D"OWAAutoLink" data-auth=3D"NotApplicable">
file://CVE-2025-26465.patch</a>&nbsp;\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;SRC_URI[sha256sum] =3D &quot;910211c07255a8c5ad654391b40ee59800710dd8=
119dd5362de09385aa7a777c&quot;<br>
&nbsp;<br>
--<br>
2.40.0<br>
<br>
</div>
</body>
</html>

--_000_DM8PR11MB57035EF3E5CE9C8AD3B26DBD84D12DM8PR11MB5703namp_--

