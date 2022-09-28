Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6483CC32771
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 18:03:50 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web10.1037.1664388212399631461
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 11:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ni.com
 header.s=pps11062020 header.b=g7Oy96Bh;
 spf=pass (domain: ni.com, ip: 148.163.158.57,
 mailfrom: prvs=7270b21313=alex.stewart@ni.com)
Received: from pps.filterd (m0239463.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28S86VOC026985;
	Wed, 28 Sep 2022 13:03:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=message-id : date : to :
 cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=PPS11062020;
 bh=3CVkR6Xb9yH0C7dBty7yX53Rhox67ebnDk9WXRVfnEQ=;
 b=g7Oy96BhmoeSGvmnQSKPLTefKU/7MGqU6yAoG8AsAtKmu/s7+sPbXlfPkO7AdafDv1dy
 jkJ4hcN4TEdUPV9VcUI1zoBp92qym8tLn+pZovG7Jv9t0GvqXPncGDJcBHesHlLG137w
 Gt6poWC9erNfyWIlpeyYbCAjWb9b6gvkMZTk0mEYdDPinEfmtjRcpfClg8kNCu2jb87J
 6gYt1EEcpZJJIhXKjaoU7C3gWebudakIj6tzOiNRz4XnGrpqmeBrrAlDvfVdrRWl69jo
 0Hi3wNehR0VX0J63mHUgFs7HNCZZ000p2g2+4j1WwKTZRClcWim5ktIU8ap0vOZGWhkA Fg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3jsw9dyu8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 13:03:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W36dn9hi9kynbq5XI07zqXOm+eiqDO5CI4/H8rIQKrNaaizeA0yaKNSFAsPYlLSIGKJFPICTWamYvZiVJsfwUVhghffhVbBjdi5AB85l0k8KtEKtt4VVP3Mbn9BLBGgxl5MmhceEptfcAv/SIJPCrrIukXE47petzFi1TqGfwAwsbbutGnr7OYmHefzDGPxTzbqls52Og8uT3WLzrxN2HNylyoAvmtCaXrI8rSVJDTdkKkq5GTraBkIz5PDYeO8u4dzEDUbGjkmgbuv1jj8Kp6Qk5z+mJ2+7i7gkiyIJZ1ZQg/n/15PNiJ4DLXIUDTOKHp9x4Y43bTFMSp/sPm8ktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3CVkR6Xb9yH0C7dBty7yX53Rhox67ebnDk9WXRVfnEQ=;
 b=it/wBeFsTkXibcb9v7JZa98HvHaM0pXPXnFfRoIp7bH5d1W6e8dfbqZMFrmSeYS6mFmSykYUaVhlcH3yMmpa45oZc4fVMLgu+Fh4BDr0XjbPnD0aTvRCDVBW7CV5lnRQ60J7EefKTPosd7J0qX3R6SoAxYMxkNY7P0b5WtG2pw/DDDBFGQGdmFM0debbm63JpB2ctZXS9omeNbICn3FLTXRM7g0o6DzXsfcDhnHiTqLlIutjStKKZJstP/351yFwCC71rxEoq/leV/g9fXp9WSs9gjNzK/HHraaoQUEWra+XmKJ2S1DIclehQiobxZkESNE8bPKMJu9oBK2oWQgBTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CVkR6Xb9yH0C7dBty7yX53Rhox67ebnDk9WXRVfnEQ=;
 b=eOTX/csI5SuCY2OgR/kYRnCRg75V00776tZfKN3/Exh6pjaaawNtjixL291pRUa+HHt6WfozTZWzYJmNPLF0zayrVsRKPq0YEHk6ZrsUs0RlD9kOTVhpArA974cJwn3VFct8MBq3yoXWzpMCsEpv0f1NNUAWZF9GtfiiJ5CIQPs=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by BY5PR04MB6565.namprd04.prod.outlook.com (2603:10b6:a03:1da::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Wed, 28 Sep
 2022 18:03:26 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::cdb:af23:81f5:620]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::cdb:af23:81f5:620%6]) with mapi id 15.20.5654.019; Wed, 28 Sep 2022
 18:03:26 +0000
Message-ID: <14e8d736-c641-9a40-508e-281db834a23d@ni.com>
Date: Wed, 28 Sep 2022 13:03:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To: Etienne Cordonnier <ecordonnier@snapchat.com>,
        Khem Raj <raj.khem@gmail.com>
Cc: Alex Feinman <afeinman@snap.com>,
 openembedded-core@lists.openembedded.org,
        Etienne Cordonnier <ecordonnier@snap.com>
References: <20220913123741.3416807-1-ecordonnier@snap.com>
 <a29c5799-9964-526d-d9e3-6a4f28cb1bc3@ni.com>
 <CAMKF1srWRB4vLNjtS+aaY=w2wcx-Y+Gt7gMFPVhftWx84+J1RA@mail.gmail.com>
 <CANOoYsMVb9YpfwjTNHv4kSARM15_3T34CA-Ekr=t7P5F0XO4bA@mail.gmail.com>
 <24771ab1-ada9-fd2a-059f-4960b6b2e073@ni.com>
 <CAHUKmYa_CPg+2uX9Yz00ATDNfEJzvcc28eJVUNeBn1+=UY4dDA@mail.gmail.com>
 <CAHUKmYa-=GFHwZUEjTfDb5gyDf8KH8MFM6bm3GCU6xpA6ppVkw@mail.gmail.com>
 <7c864dd1-27cc-ff28-dccd-8370ed5fc61f@ni.com>
 <CAMKF1spi2YGcR-COXFfChZp8hgPhhSKNqxrr4waY8_RyxdvM6w@mail.gmail.com>
 <CAHUKmYYsZDyEJ4OqP+CNVKt7_nkgFLYhfiXcGG8r6hgaGL_Uug@mail.gmail.com>
Content-Language: en-US
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: 
 <CAHUKmYYsZDyEJ4OqP+CNVKt7_nkgFLYhfiXcGG8r6hgaGL_Uug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: DS7PR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:5:3b4::12) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|BY5PR04MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: f281d002-2f4f-4a87-fa2d-08daa17bbda6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fYps5A1ml331p9TQ629TDdJyULRHv9rtQZy1FJphQxCx63xyz8b0Mslb2ZSDB+1bX76z5JggSldWci3FyLMlfyaD0CPJ+mpVMZ9RYqmTiipwt/MLELQG+nWlXSJWF5FeBOAbhN4CzStsKfzdubMF9CqZKVRddvL9iAg3dYRIzyPeOyaInmgniaUgg40lFyG/vEB8kByF3mbYgFf3glzC5TmuLyYfXF2xa+0DZrcBNAhkjMI5tOLUWbgAgfntIw32Q5UjOsLn6j8mHoAo8DTTnU030jA+h6ef6GDcMeQcWz15TMCy8fut9fD2c36bfpyfEs/UA1yLPQ9GBGYRk6kiHVnqwsroxA1aIcatIHINDCnKG7szhHSxPQAM4sJtldEuv3ZR7zom8xcRDfHtCIRPCLVNsRe0V+QbSbRhXDEbc3dBIaVpBwdR/XXHhGhMXiS/qT9e7VltrEbAqLVdyCy/8Np6pNkk0AfqQqJDRe1BGlinbj8cCLmmiX6oFFW99HjyPCjkoQgyrWRs+MuVAQUvFOzlFzTbZk4YCV9WT3QHoA2I8YdFaL/NTpn/QREzTmjMGF1PKhyd4G2+f1ZqdIoCx/4DdQ4kCZz4rnh4XtpogBatOwD5jb/ctd4CeKg/y4aeXlDZXCxWncZuL9qUy4Sl4sIv899Uo0Cy+nPv8INBitDpzhLWYNZTIy6gK9UvaTJ7cnsMWAY5Z3GgTw6RwPWeszwywNu2A2Sjc1C1zO+rRdY1ffwXLhqAqXBQvXjHwQvv7mLE6JoJmamfdZ4PO4GG2Y80ARaTMGo82AmpMbbEYKk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(136003)(346002)(396003)(366004)(451199015)(55236004)(2616005)(38100700002)(186003)(44832011)(8936002)(5660300002)(2906002)(41300700001)(6666004)(66946007)(478600001)(6486002)(36916002)(26005)(6512007)(6506007)(66556008)(53546011)(66476007)(4326008)(8676002)(316002)(110136005)(54906003)(36756003)(31686004)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RkJOZUoxREZBaDluUlF4SjhhRmYvZVRpeUd2ekV3OVJBb212Qm8zRURiSmNj?=
 =?utf-8?B?TXNqSWIrYlVqNDBJd3EwU0grZW9zcE12dTFtR1N3aVh4ODhwbnZFTjM3RjNi?=
 =?utf-8?B?d3pGZnk0ekN2RGxmQm9JbmUySDJzUDh2YjByVURFc09jZ05DQkhlVWIyOTBn?=
 =?utf-8?B?WmtQTkhwUkpCOFJuR29YZFdMVWMxTjFoS0w2aXFvYlk1RUF1RWhOSVV1NzZS?=
 =?utf-8?B?UTk5aENqVEcyZWFlNEtpUVF4TzJVbGVSZlVnQVVTc2FXTTBWZG5xekRDVjBx?=
 =?utf-8?B?aVk4NjJJVTk4VmVWYkNyL2g2YXRKeStNYnpYdDNSRzJnR01QVVBnd1c2Tkc1?=
 =?utf-8?B?ai9sRW5aZ3gwUEVZWTZSSVN3cHFEdWgxamdQa0xmRWFPVDB6QTBNdnR5cFJw?=
 =?utf-8?B?OE5iVi9rYnZ3NE1RV0tycmJRWnBndjRZT09Cc2hTM1llQzY2R0FEZCtXYkR3?=
 =?utf-8?B?YTJFU0wzUFRSbjdaZmxqRGJ0ZDZ5eUdGMVc5MFUwL0ZVVDNsVFJ1TFo5eHRI?=
 =?utf-8?B?dlhvVWtqUS94WWlZTHgyRDkxdk1WenpJZW55WVQyTUZYQ2pTRFB1citqdGUw?=
 =?utf-8?B?UGlRTVE3cU9JQ2x0RDhMK0FoSmJUa1h2V0o1NVlndVVGaW5qaFRERVYvS25v?=
 =?utf-8?B?YTdlVk44Mmd1VVVTYzhBMVFiUXhWbmE3OU1mdlcyQmZQWGZDK1ZhMmhyTXZD?=
 =?utf-8?B?UUhBdlh6TjdJUXNwM1VYNnFUM2hsV0VsZWJVVHVPTlpqVUtXZks2S1ZhamZu?=
 =?utf-8?B?Tmg3WmZ2R3hJQmRFcUxLMHhYMUsyVG1Xc0dpbkM3MzlvUHVyZFNNZU4ya0M0?=
 =?utf-8?B?ME03cGNUaHZVZ0FYUjAxSEIwbVZ0TXk1TU1IUFRzMXFqa2lyNWlsZEtpTGlI?=
 =?utf-8?B?dlVORjBaQVJKa0dHV3NTMEphVERwdEFPQUdCVUpIQjlnditXbDhuajFRaDlJ?=
 =?utf-8?B?RTlwTG1NRUNrTUthK3BJckxoOTNUT0R1aXJyZnNMcWxtOHVMaTlDV2ViMU5W?=
 =?utf-8?B?dWo1TWE0ZHpCYzFMQ0ZQenVicFIzUHpzdThZbkl0VThzSWJNTVF6WlZXRytK?=
 =?utf-8?B?YndpYzRrTnJOZVNzd3YzRFh2a2ZCWHg4a1FFZU9ESGxwWmJIZHhOOFRVTzd6?=
 =?utf-8?B?TjRLUi9GQWRpaU5pYVo0MFh5ZnB5akdzWjZyRUUrcm5WM05HNUJrKzFzd3ZL?=
 =?utf-8?B?ajBFQ1JxTlVwaDQ2V1VBYTNPUUdBV1Z1ZjVkVUd2Q0x6Q1FJazRML2tDNVow?=
 =?utf-8?B?c3ZqWTJEK2Rodk1ZZURiQURLWjJoTGg0THJHQmRtbWhDVmZvR0tEVEJSa0xD?=
 =?utf-8?B?MmdxaGJrYmVUUHBtSzhVUUlWNDJma2JYV0kzU1Vwc3NWcDNMaDJzMVBaZjJI?=
 =?utf-8?B?L3hETmpGWHhaV0N5dWxDL01YNFBCZ0k0bUNKQUNkSkNvR2ZGbWdvSlo1OW5l?=
 =?utf-8?B?UjFDb3VJclY3YjM0RTVZTUQwR3NyNHdTMlJyWjMrRjJxbVhlcUdTUnlIbVBp?=
 =?utf-8?B?bFpweHdxU2lTTTVjWEx4Um9PcnVLeGRoRCs4a2VxaW9XekZQMENYZThDYnRl?=
 =?utf-8?B?ZUtFQ0VKM0dzbGFtTEQ5RERXM3RCWTRLMmdKSjFZUWJ0U0Z6S2VHZ1dwU2tK?=
 =?utf-8?B?ZWFQeXJHRmZiTU9uSnhzZlZCV2Vyd0VCcE5RT3BOMkYwSm1ZM0pISS9ndzBS?=
 =?utf-8?B?Z2lEUnl1S09aVkprNFZnSW5iSTg0R09MRHQvL3c0bEtPMHNoRkJZcWFFUWs2?=
 =?utf-8?B?YzN0MG82cTJoL2Erd05FL0R0czNMVFNCcVJxNkZjMVdsYW15UG1HaEZldDR1?=
 =?utf-8?B?dlEzcHovMHY1SXdOTnBQUnFmS05NcllwTEdMeldjZG54ZWhhcE0xdzdmZlE2?=
 =?utf-8?B?Y09kaWloKzdJWE9VWXcxM2oxYjA3QUZ4aDQvVlJTNHNVM0dsNi9aNUtnNStt?=
 =?utf-8?B?Vi9lQlk4OGtNbkVLLzZCb0hBZXhscWpEUVZYZTBwTHhMWnlLNkp2VVFxOEpz?=
 =?utf-8?B?K3RoSktnMGJvRGYxQnVOcFUvSTIyZFNoa3FTN3VQTldVa2pWNnJKQ3RrNkor?=
 =?utf-8?B?TVhIVERxTzNzYTU2RG5HM3NjN0FicHVTSFZPUEVaTW5lclNjRElhQkZoUVgw?=
 =?utf-8?Q?4kI/krN6WX8SchV4jk5kfoCHH?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f281d002-2f4f-4a87-fa2d-08daa17bbda6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2022 18:03:26.2638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 chF2lXDYEB/0f+HcUUG++E6S7ic5DmdnkPGhpBl5KKqCFRiwxXzkw6Pr5GpJr2QAnn7o307AwiTh+VHtNN/c1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6565
X-Proofpoint-GUID: HmQYNVAlO_i2w6-PRVMX-r-czImPE7mK
X-Proofpoint-ORIG-GUID: HmQYNVAlO_i2w6-PRVMX-r-czImPE7mK
Subject: Re: Re: Re: Re: [OE-core] [PATCH] opkg: enable zstd support
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_07,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30 spamscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280107
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0b-00010702.pphosted.com id 28S86VOC026985
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Sep 2022 18:03:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171152

Thanks for doing the research.

What was the build time on the zstd L19 compression vs. xz? Was there=20
still an improvement?

On 9/28/22 11:50, Etienne Cordonnier wrote:
> I tested it a bit more today. I used the standard poky's local.conf=20
> and added those lines. You can see that at zstd level 9 there is still=20
> a significant difference in the compression ratio with xz for gcc-dbg=20
> which is a big file. At zstd level 19, gcc-dbg is 241MB big instead of=20
> 214MB with xz (12.6% more).
>
> PACKAGE_CLASSES =3D "package_ipk"
> ZSTD_DEFAULTS =3D "-T0 -19"
> PACKAGECONFIG:append:pn-opkg-native =3D " zstd"
> OPKGBUILDCMD =3D "opkg-build -Z zstd -a ${ZSTD_DEFAULTS}"
>
> Zstd at level 9:
>
> build$ ls -lh tmp-zstd-level9/deploy/ipk/core2-64/ =C2=A0--sort=3Dsize =
| head=20
> -n10
> total 1.5G
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0302M Sep 28 18:33=20
> gcc-dbg_12.2.0-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0249M Sep 28 18:33=20
> openssl-dbg_3.0.5-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0106M Sep 28 18:33=20
> openssl-ptest_3.0.5-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 44M Sep 28 18:33=20
> binutils-dbg_2.39-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 26M Sep 28 18:33=20
> perl-ptest_5.36.0-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 23M Sep 28 18:33=20
> gcc_12.2.0-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 15M Sep 28 18:32=20
> elfutils-ptest_0.187-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 15M Sep 28 18:33=20
> gcc-src_12.2.0-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 13M Sep 28 18:33=20
> coreutils-dbg_9.1-r0_core2-64.ipk
>
> zstd at level 19:
>
> build$ ls -lh tmp-zstd-level19/deploy/ipk/core2-64/ =C2=A0--sort=3Dsize=
 |=20
> head -n10
> total 1.1G
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0241M Sep 28 18:04=20
> gcc-dbg_12.2.0-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0213M Sep 28 18:03=20
> openssl-dbg_3.0.5-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 36M Sep 28 17:58=20
> binutils-dbg_2.39-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 30M Sep 28 18:00=20
> openssl-ptest_3.0.5-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 22M Sep 28 17:59=20
> perl-ptest_5.36.0-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 20M Sep 28 17:58=20
> gcc_12.2.0-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 14M Sep 28 17:57=20
> elfutils-ptest_0.187-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 12M Sep 28 17:58=20
> gcc-src_12.2.0-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 12M Sep 28 17:57=20
> g++_12.2.0-r0_core2-64.ipk
>
> xz at level 9 (the default):
>
> build$ ls -lh tmp-xz/deploy/ipk/core2-64/ =C2=A0--sort=3Dsize | head -n=
10
> total 963M
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0214M Sep 14 10:44=20
> gcc-dbg_12.2.0-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0193M Sep 14 10:44=20
> openssl-dbg_3.0.5-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 35M Sep 14 10:44=20
> openssl-ptest_3.0.5-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 32M Sep 14 10:44=20
> binutils-dbg_2.39-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 20M Sep 14 10:44=20
> perl-ptest_5.36.0-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 19M Sep 14 10:44=20
> gcc_12.2.0-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 13M Sep 14 10:44=20
> elfutils-ptest_0.187-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 12M Sep 14 10:44=20
> gcc-src_12.2.0-r0_core2-64.ipk
> -rw-r--r-- 3 ecordonnier ecordonnier =C2=A0 11M Sep 14 10:44=20
> g++_12.2.0-r0_core2-64.ipk
>
> On Wed, Sep 14, 2022 at 5:42 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>     On Wed, Sep 14, 2022 at 8:37 AM Alex Stewart <alex.stewart@ni.com>
>     wrote:
>     >
>     > Thanks for checking.
>     >
>     > I'd be interested to know if setting a higher compression level
>     for zstd
>     > can get us to a similar compression ratio to xz. If so, then I
>     think it
>     > could be some real value to distro maintainers to be able to *tun=
e*
>     > their compression.
>
>     yeah it will be interesting to say try something like level 9 but
>     I think times
>     might regress with that but it might be good to know the balance
>     and perhaps
>     suggest size mode and performance mode of zstd instead of xz
>

--=20
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


