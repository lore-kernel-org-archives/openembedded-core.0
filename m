Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFFB1C64EDF
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.3666.1649995494022759693
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 21:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=EiGO8LIQ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=110437c6ea=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23F3lMpE012643
	for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 21:04:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=zg+ZVK8jGOH1s/GQ5ji9h32u1alGzkqMoISfyi8ZoVw=;
 b=EiGO8LIQk7X2VW+et0iuP5jaZJmXwNrE50sARsbV8WIYhB2c3X1EjHOj3R6CZQJR+Yj1
 QbNM0PuB1ZaRxVap3F/NvvyXrTqtI/CCtwpY/mAoXOVCnaHwd34G2ZxCq9585aaUlmdg
 0SFde9HBq7OY3qo/DtPyfYWTV11QJKJV5zkhltwJMzE2+QO4y12VycBOk53TSxiB/LgL
 koRGbfyulBRWQ/7Ubp7P417PxAFqsENJgMbWOCgB2b0/gA2m+SqId8HpxE319h5V9c+8
 fdYwY5OZGPLtYIew5fTDb+eVPMawB2iYOlj7whQeiLdcH1+V+aURgdMntfJoIyqMmJ5d Wg==
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2047.outbound.protection.outlook.com [104.47.74.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fc0jebt7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 21:04:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXCTUuc1jEsYP0kWTuPBKFPRLOXtCXVQT25S6Uy4rqvfx/udnwySZ8tgSa0WErHsdN4QzaAxR2U+0/SDy7pDTYSZPEgw7jHntyTMVjMDeKtGGjYFcuZwgErizCa6kts/2ys1fnfjBM8OPangsVYb4zAr9v/x2QFMYKI4nb4xGNgX85YvigbDHc+TVWwOVk/DfBfa+94jL2lQJMdlSJLw2f36/K/Lp1Vf+DWEvN0yKMU0zWLHt4RLuVClcGMRQUW0yl5MGy1WUIIJTZfTv9qz+dSDyaCNmmhy+cwYMmX/KDlsD/VDzLdaKgm+Ol2ZnEwffIjxi7yn6trscYr3jeEvog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zg+ZVK8jGOH1s/GQ5ji9h32u1alGzkqMoISfyi8ZoVw=;
 b=KRvQAJLz/o11jj/OdW73eSLmnGET1qxamYhcy8MVXkiyIhdL/SRAretlMxU0RQ+L19wE9kgt+Kd20Jrd0QzRzSm0zISpRrlI40YD/s/OqcoBBye8lDR3lDTos89zO8TSpmYXY/jkdqvUlio2K3L0LO26dkoXE6cpSxufdfVk8XfsszZigMHd+sg3ZbQWJOqqO2+swS4tbshhaN4ovknRStUjqrgwf0KUvPj8KnRJW+2Gi2obpdsYzINy+5g2UgrGZaB6sdyTczu8FUs9QSklQRj/dChFwgfSGE8Ebb2vtnqzrwzHU20SKQ8Y36AswgyH44IdPH3rbij3taTFy2z22g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Fri, 15 Apr
 2022 04:04:49 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::952b:793c:c458:460e]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::952b:793c:c458:460e%3]) with mapi id 15.20.5164.020; Fri, 15 Apr 2022
 04:04:49 +0000
Message-ID: <6090ddad-c4cb-83bc-f1ce-38105d4cde07@windriver.com>
Date: Fri, 15 Apr 2022 12:04:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] License mismatched for libxshmfence_1.3.bb and
 recipeutils-test_1.2.bb
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
References: <16E5F5A87F1A7A28.11564@lists.openembedded.org>
In-Reply-To: <16E5F5A87F1A7A28.11564@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: HK2PR04CA0064.apcprd04.prod.outlook.com
 (2603:1096:202:14::32) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8663d7d6-452c-41ca-48ba-08da1e9515f7
X-MS-TrafficTypeDiagnostic: SA0PR11MB4574:EE_
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4574BC12979A016EB8A9BB86FFEE9@SA0PR11MB4574.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3dOUKkqKl5aAjmAXvpVEHBA1HceGaQMIBC6izXo6oBduEE35RHGbspaD4q55yCrzBkEQQD2QYX/HKekKK6j7Y9ou6yLc2noxELZHX66YUrJhelwl7TYScgs3dwhEsidKaJ8R6E54tC7aCOmpYjRMfo5iPj2x0RWi8Jm8oGlpb1+JqS77Wgi3jntk+fSrTP4kX7sN7WxgXZJtrRwnQnlDufrJwHOxRc1cU857uN4VLcTLREJRSsVBNcNKKNFTC2EZfU8deZsBi0nszjo8AfBF+dfrie8DQQ+Ecq6I5pv8g3NJJd66L5w3b6WyliJMg9qEzj2lssp/grenNlRWEjPzj2dM38qTLdAmFye4WTcokhKyGDtvuIH1EuhZxkSTwnr61mNOcn7sEo3DRP/SfSeuv9JpJiHwjqIWDi3QInvZy5oyPZ+/IJhWWWobOtsw/bwCrCRJq9pC14RxoaI+lZwRj9l97G/atmb7x+RJ1zOu+2BeamXfRhUBkXjO+XpGdwvs/Xe3AOZuYEYVz4NYF6rX9lq70eme2IEs7FGPMxXqbLQEhPUdeQNZtmqd6pJcqklFJeiD5Xjae2is8N3K2rqVtNt9Fw8I2NEeQwJIoVRlEdy4LdV4CJD88yo3qPIlz5Qgdsz5+eAwOE29VWmA3U3cslj34CMAJJDN+gde+c8fGiGbCeAGGIw6kLLKILTnWTWSD25GqIyk+nUHVvWlhxFWe5ZyfVxflBRw2wFak0xG/x+bCXyiYkLMygbOHMCnaonCUl9gGAZxLcEIZ1uD71CQllgbMZpTC0+3FhCobD0EC8Cd/Y1WTTbz2SZemkjs24vsbKuTdnvZJeqIRHl10E/L3RzH+MXcm/51+STIo700eDEH+1AmR7i6RIKxgb6AEcIXGtRNVfiJW/egSZdTbElEE1qpsPW3VXzcVIpwkMY1S8E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(966005)(508600001)(86362001)(31696002)(26005)(6486002)(66476007)(186003)(2906002)(83380400001)(6506007)(6512007)(38350700002)(38100700002)(6666004)(66946007)(36756003)(52116002)(2616005)(53546011)(316002)(8676002)(8936002)(5660300002)(31686004)(6916009)(66556008)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K3NzaHEzSy9pZmk3UWI3ZEZPRG9Nd09rVlBwYmRJSkJlSldYcDRrQVBvVENa?=
 =?utf-8?B?QTJqS1ljNzBKbVpnQUdUWFlMdElpZkVtb2FOWVEvYlJNSUYyemUvZEpQbmFX?=
 =?utf-8?B?V003cmY2c0ZTYXVOTlp0UnMrZU5aME1OdDZBYU4xK3poclcycWRqM0QwYU96?=
 =?utf-8?B?TzB2ODZVWGlpYjNvVTlFNVRZMnhndE9wZ0VIN0xCak5Hdmo1MkQrNjB1NElE?=
 =?utf-8?B?UUR0UVNGWFZML01XWS9qRG50a0MyOEtIeUNxWTdwSmpSQm5QaXRtQlh4VWlz?=
 =?utf-8?B?V2VrL3BXaDhJWG5CVGo3eGNFSTlMSDY4V25jdExYTnFrMW4xOVhOVXppYVNJ?=
 =?utf-8?B?U0NkUkNDSjB3cE1XSEl6dTFJK1pMUFdaMGdmN1hoelRBVkdla1VVa0Q5KzBJ?=
 =?utf-8?B?NGFPWWtTbEd5MHJVOXR4b2FlSmZUVGpnUTBWSVB1OVNWWnlOdk1OdmJDeGlT?=
 =?utf-8?B?WlJSRkoveTZ6VXF2ZW85MmhhVU5LaTN4SzVNeEdidTZabWE1L1Qyd2oyY0Zv?=
 =?utf-8?B?Qmw1M0RPOGVhN2hFSE05c2xhbHJmamQvbmpucllmemJRNENqTEFQK1g1ZzJt?=
 =?utf-8?B?UWVQc2k3cURHbEtwYlh1RDY5RkszU0JnM0svN1FPYnIyOGs0V09OSEtRbVA2?=
 =?utf-8?B?UXpSMHVqMWtYaVI1dWtNRkluNWFRSjBDTk1OVC9uclpqQmJjWXNYSkt4ZWtt?=
 =?utf-8?B?VDZldXVsNWNjVkpHNzBJR0Q2VExwNC9DaXZaQUJKdlRJWm9pYVNyWjhGelIx?=
 =?utf-8?B?SnJUL3lndEE5Uzl5STM3OUZhbThJTWZSaHBWN2NFQVI4dkI5aGUzMTZjeDcz?=
 =?utf-8?B?M2ZreS9ZL01vMzlBaGttN2RtdWdKbnJ3R09qc1FwUzZ3c21CQXJCVjJtWllo?=
 =?utf-8?B?d2pGSHJYaDF5S1VHWG9UbUFTcXgzcnAxZFdWYWRhUWRNaWtwNDd2MllkQ3Jr?=
 =?utf-8?B?c1FzSWFmS1JIVGx3UzlURlZpemxrSXJhb0FHMU1xQjNtM0dsbWVzUWxJeWlL?=
 =?utf-8?B?S2RSN3E4N2xqcVhoQ2lLZUp1U2txREdRbmJGVDRGZ2VJdkcrazlCbG4renpq?=
 =?utf-8?B?WDlRbFZqYm5neG5hSzZObS8xYlhPL0JCOVlKMkczdXk2R3dKTlJXc2dBVExT?=
 =?utf-8?B?Y0pDcUdQeXNtZy8wbU1IZWl0ZEVZSDJoZ1BlNUJHRG5SdUlublVzMzk1WkpY?=
 =?utf-8?B?ODlvZ1dYdUh0Z1ZCdDgvR3RKdU5Dc1JWVVlLTXdKdTAxaTdZaWlxaGZKNHlM?=
 =?utf-8?B?MEg1SnNBTzNvWnBXVXVNRGxhVVB5YUtQYkRxUW81WS9waTJFbGIyTGpENXRw?=
 =?utf-8?B?YTlsNGMxKzA4UXFveW9UOXR2M3U5NGIrWjIyRHI5UVRBZmpYTmQxdkF6bVpy?=
 =?utf-8?B?MVBnUjFsRWpMREJ5aC9nSU5nQ1VhbmR0NzFJNUpXRVpOZU1kb3FiUUhqeFFv?=
 =?utf-8?B?WjQweDd5bzJ6NVNvMDhhejZsVndiMzVlSGtWZXF2c3BQUy8rMHJNTXJvMHpW?=
 =?utf-8?B?QTIrdEFLK3Rsc2liakl0ZXAxQWtyQzBkd0VNMUhYYXcwbVBabGFiY3I2Vnp6?=
 =?utf-8?B?L0dyRUZHdGNqSGZXc1FzQldOK0t2NjRxNmRCYStGTnBEcGFrMmZ4RFd4Z3lR?=
 =?utf-8?B?aFBrbjdtdHNaRmVJMUpxQTMrQ1I2WlJFSENRUjNubUlSUVpNcFJCdkUzbzhC?=
 =?utf-8?B?OFh6ZXBZU0VKaTU5U0lyeUoxNmFwcGx4R1NKNi9RZ1BqTkZKNXg5T3d5Ym10?=
 =?utf-8?B?VFNBeElacURjeDFKdUt0b1hYTGhZK0hwekxuRHNHdkJtNWY2YUFoTmE0QWF3?=
 =?utf-8?B?M2tLRGhweStJdEdITmFuU0F0NzMrTUlLaXlDYk9IYVpwNTdVbUxZOW9ubG92?=
 =?utf-8?B?M3NDbGphbjVJWGZPMkdPakJGeTNzTUhXamlrQlZaMUIyWXlrcERtTWc4Tzh1?=
 =?utf-8?B?bUI1RFRnYWFUSnVNWGpLRU5NakwzWU9zVTFTcGh2dUZqYkwyTStMU2NCMEJC?=
 =?utf-8?B?V1pMOE1DZ1pLVlhHeUo4U0hpM2pWZTRJZU5hNzgxTFF6RnZBbFVzZjRMd09v?=
 =?utf-8?B?UEdmUHdrVnNYMXp0QjdpUG9DY0tCWGx3ZzNuQVBYdFozQWs4RFM5c2hkQXk0?=
 =?utf-8?B?MFkwZTBqMk1pWnVKMjZQV2oySGhRWmJrUnBzR2hKdUFCVjZ4UUVrOStyaVpS?=
 =?utf-8?B?a0IyZ015MkZjNUJvYUo4cWg1NnFFOHFSSVpPN0xtMzZlVktCRVpra1Q5VVA5?=
 =?utf-8?B?amdrYVh4eUFkMlFkSndBU1cwMjRra0pkTWtMRDlIanc3VGRxZ2hxVHZPeEZv?=
 =?utf-8?B?MGU2OEhkbytMcnJVWGRWNkRpb25nSlFOU0pNWmVkVEg4bElMUDZEVzVhcTVL?=
 =?utf-8?Q?ZdeqnLe6m92MuJrM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8663d7d6-452c-41ca-48ba-08da1e9515f7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2022 04:04:49.6490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Te6rNRGv4jQpVtZSKyU122V98xZkQ+ZJ3+hSWB8hcuf9OwVo75ZQQS+DiFmGibP0ECInu325kL4gc2cYBV2h+gx3AqqpFECydawUWIZ1fx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4574
X-Proofpoint-ORIG-GUID: iqBnunFo-QnkGLC6c_RzrvFaLdsCK9pF
X-Proofpoint-GUID: iqBnunFo-QnkGLC6c_RzrvFaLdsCK9pF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-15_01,2022-04-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=562
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204150023
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 23F3lMpE012643
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164418



On 4/15/22 11:55 AM, Robert Yang wrote:
>=20
> Hello,
>=20
> The following two recipes use the similar sources, but their LICENSE ar=
e different
> in the recipe:
>=20
> meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb
> SRC_URI =3D=20
> "http://xorg.freedesktop.org/releases/individual/lib/libxshmfence-1.2.t=
ar.bz2"
> LICENSE =3D "Proprietary"
>=20
> meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
> SRC_URI =3D "https://www.x.org/releases//individual/lib/libxshmfence-1.=
3.tar.bz2"
> LICENSE =3D "MIT"
>=20
> There is a COPYING file inside ibxshmfence-1.2.tar.bz2 and=20
> libxshmfence-1.3.tar.bz2, they exactly the same:
>=20
> $ diff libxshmfence-1.2/COPYING libxshmfence-1.3/COPYING
>=20
> Please check the end for the full contents of COPYING, it's not either =
MIT or
> Proprietary, but should be a free software.
>=20
> How to fix the LICENSE name, please? Add a license file called libxshmf=
ence? Any=20
> comments is appreciated.

Here is the COPYING:

Copyright =C2=A9 2013 Keith Packard

Permission to use, copy, modify, distribute, and sell this software and i=
ts
documentation for any purpose is hereby granted without fee, provided tha=
t
the above copyright notice appear in all copies and that both that copyri=
ght
notice and this permission notice appear in supporting documentation, and
that the name of the copyright holders not be used in advertising or
publicity pertaining to distribution of the software without specific,
written prior permission.  The copyright holders make no representations
about the suitability of this software for any purpose.  It is provided "=
as
is" without express or implied warranty.

THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWAR=
E,
INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT OR
CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF US=
E,
DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMA=
NCE
OF THIS SOFTWARE.

// Robert

>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164417): https://lists.openembedded.org/g/openembed=
ded-core/message/164417
> Mute This Topic: https://lists.openembedded.org/mt/90480400/3616940
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
liezhi.yang@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

