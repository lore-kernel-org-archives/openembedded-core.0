Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D94EC83F2D
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 01:44:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.39836.1693791857976542027
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Sep 2023 18:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=gaIoeTtg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=761197589b=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3841U1e9020462
	for <openembedded-core@lists.openembedded.org>; Sun, 3 Sep 2023 18:44:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=REHsRpUVmKpkoilwCVmkOMjLe27ZWPJcY6HP4QEveDQ=; b=
	gaIoeTtgL58TRUwgoeU8OapukgyJhpFVE8tkdn9fHgiRDK5nVw6wtx3siA4z+nnK
	AaLORDyqMlSIIeUHo7ZCoZadtWELNufWeRETYFPMGctjmcefER4fWjg0SELDOBEz
	CX+zfOOrI+qFW67PYD86k1NpbSAtj7zxrIjKJ9X6YcIYByvnw5mFR+i0X+JdZ//0
	vkXrdIX6BOTKS52+rzQ8gFSuV+VvYHD3pbeNSXkrtcw+7LYOdrskLDw4RB2HbOla
	7PT/C+vjTl8QV1DpV/m10wVuwfOW2ACWxYyudWkKqFN5bt82n166pfTHcn8rpWeZ
	7UJBP4rV2XkNs9eS97+/Ww==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv0b0149m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 03 Sep 2023 18:44:17 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 3841iG67012869;
	Sun, 3 Sep 2023 18:44:16 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv0b0149k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Sep 2023 18:44:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+cy6j3hXvaW+5f0jPnRuzjwgTiAN6z2y3hMK6yp/KCAD7ij5/qddlLyjFdzfhs46fXCP4MmGvsu80OpIrXpahv6GOSymdsxmQRQX+CATyRtiqnKwp7772UWySisMXpjBla+eSY7I67GgDmK43U2p//sYeWO1JsVxsl7Sy4aWYYpqYa1Np4g8FCXa6xe3BJNiCyK/0AfF1wKl+W8J4TpJXd732p1UbCEWEMUa/S5G6WRCBUOtgXCc8sZZknFOpPV+pmfka6BJTH2uX8hwMlSN6ZOdlxRuxsQZghuSEOvSrDt8OgigFodaAL6imByAUqYysQbA/Qt7nfJI6PzJYa3NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REHsRpUVmKpkoilwCVmkOMjLe27ZWPJcY6HP4QEveDQ=;
 b=i/BA6PqwDmBZ3WH84RkVkOztissFncxgzBHuY8A2DtDpqAzpvv7NaV5Utyn620e6tVRE1NuoF3JW2WteFqEM0bbazlpn906Bcy9t8CMaEBJJNkTkK1FRZXFqjceBuUTwBUX9Jnn1udeTWPdLOz6HKb4qtu0FSN/8rA/y3AAPMQzbeBsfAyUo4gtE+FGs+K4A2PIRM+xB3wYjoTf7r/XYrW2zUKxHmUzEe/D/lKYFq+6oGmUBLtihNvanCaJ+6dd/Ha/S395Wd6byn86GxNjM/EhjzuIvDFUVfEwKqlcSSC76ORFJMUev4RpND3WHEnj9rWFWn0jox+1+u/8JSBN4dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by DM4PR11MB6525.namprd11.prod.outlook.com (2603:10b6:8:8c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 01:44:13 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::5446:efd2:e157:26b7]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::5446:efd2:e157:26b7%3]) with mapi id 15.20.6745.015; Mon, 4 Sep 2023
 01:44:13 +0000
Message-ID: <29f382da-8e38-701b-28a5-509d24c5fddd@windriver.com>
Date: Mon, 4 Sep 2023 09:44:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [PATCH] sqlite3: set CVE_STATUS for CVE-2023-36191
Content-Language: en-US
To: "Marko, Peter" <Peter.Marko@siemens.com>,
        "changqing.li@eng.windriver.com" <changqing.li@eng.windriver.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230901090208.3242013-1-changqing.li@windriver.com>
 <AS1PR10MB56973160C9A591A77D8FCA55FDE4A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <AS1PR10MB56973160C9A591A77D8FCA55FDE4A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR13CA0194.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::19) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2557:EE_|DM4PR11MB6525:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d0876f2-1837-41e0-c766-08dbace8710d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oh6VtTNFOdic8CZaNhehAjFHkgMYzaryqS12wTdXhDcJGZAkwWFQcYuYP+3ZUwcWMGBuf+ZK7i8zbOoq6Efh26fMq7cVrpDLQENbQ71dKU1KFOHZVsYerhO6UJExDVJGYyya26JDa+ueS5l1CqBES4VFledgtZ4xvut78TeGGLTHfPxbZdFpec78MsKgdPVVjimVDkUqTh317pSht7zUhtuipoz8fhOT6XqIfkZNdGoqbJNPFzIMVsqnDr27wjT8INJ9rp5w1EomZnbA5Pvzquhu78gw1f1U+Rcydl01Sv/q/JnHrtLbJoAkllPtngFJcRk7Z7adFpNIghqeGa/itM45pNuEWriUvrvjzvR2OETaio5qTklsgiKwLv9YSHm3L2lW4xav6HK4JCG7QJKa/AP0u97bUIxjyGfPnA62BkpQQFhBL6beCXa6lDL5yrBhoqvVTvISgUKSfkhIdAL9k/naKT3hiAxYWeyJzQ2RERjlzKw9vbaCWEhZBdcY/cWa9Pc2gFSLmCayMe7pf1d7MBFUpSvOkX9UXTxOU0tPjin4/0HTEAGZ02Ge3bL07C+0Z/NeNDk/5Eu3E45Jl0Dode9ZHMV9CoCU4ne2/UjBHqLi6WxtwZPQ8lj9fbPEl5MVBGufBu3Rml1aAC/22TAOWQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39840400004)(376002)(396003)(346002)(366004)(186009)(1800799009)(451199024)(41300700001)(38100700002)(6666004)(31696002)(86362001)(966005)(478600001)(2616005)(83380400001)(26005)(6512007)(53546011)(6486002)(6506007)(66946007)(66476007)(110136005)(36756003)(2906002)(316002)(66556008)(8676002)(8936002)(31686004)(5660300002)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b1NsaFhxU00vNlBOTitKblhVY0t4bXljNDlSZ1JlanlwVGg0Y3ZvT0Z4S2g3?=
 =?utf-8?B?N0RJNmlweXlOdEUzTU02UGdnWnpNeDVraG5PSHUyL2tVN2xzWlJuTEJRRktu?=
 =?utf-8?B?d2NNbm9GbkY5MVBGTWRJMkVPajhQV3IxSjliZnJiZzVLN1BkaWRDZk9wMDV1?=
 =?utf-8?B?RVVnOVZtVUsrUE9rcFJpMW50SUVzSEhPUmp4RUIxWDVOVGZmb0V1TUp3NGNV?=
 =?utf-8?B?ZThQRm1wYk9kcURSc1BRWFpkVHY1N0RmSXJLR0lWMEwzTW5JQm9pc2RSZ3Y0?=
 =?utf-8?B?UXJrTjdpa3RxdE16ZTNFdTZzRytPKzFVZldzRDFrVGxGQXNweHYvM1E4VzVp?=
 =?utf-8?B?UzIraGZMcVV4MHd1S011Z0doaG5rMGFqVTNzdjZpL0Q2VU5hdHJKa2Z6Q1F2?=
 =?utf-8?B?REJLZ3JyVkdPcThnV2tnSmU0ZFNORnExQVc0ekFMbmZCamw0V3E5eGpONlcz?=
 =?utf-8?B?Mm1vQ2E0MHNMR0lvS2Y1WjRiUWhCMnRvcGd3dXJWcFFqSXc5bVcxa21EcjdR?=
 =?utf-8?B?akFOelhBd28wZ2M1MzlSNEk1eUhTWGtKS2k4Uk5uMW5KeCt4Sk9XTklzVW5s?=
 =?utf-8?B?dksxL1FycTRCR3dHekV2SXNUTllnSmRSbEZmWWVmbFY4WXY3MGV0YXUyMHdJ?=
 =?utf-8?B?UEJYRWhHYUJHYThZT2VsTzYrZmlmVHVkVithYmxlZ0hmdmZXcDczUUQ1TkQ2?=
 =?utf-8?B?ZllFQk1QQ1FkYlNJRFBicFpVb28zZVgydnRYa1A0ejJOM0JuTVdyalBSUXZT?=
 =?utf-8?B?bFRZRFVSK1RSN0czOTErQWFCVUlOczE3b3E2a2plMC8zNGJKb1dGZVZ4dmxw?=
 =?utf-8?B?UmZQVUpvNTNudFBpNVN6UzlueTROY3NBeWovSVArN2c2NFc2aWZxR2tTNmtK?=
 =?utf-8?B?K000OFJVaFcrUnlZZUdyK21vYWhDY3VzbGYzSmx0RWxQV25Wd0x4NXFyU3NF?=
 =?utf-8?B?TFVJRHRpNG1uS2dNYW9uK0Y1VWdFSkhhTitCRFdJYjVGeHBhR2FxZjJJZXVW?=
 =?utf-8?B?c242MEMrSzJSRHlEQWtvVWp0VkRYVWxVdS9RbXY4ZW1YN0gyUUNOakU5L1VY?=
 =?utf-8?B?WnNXYkV1TVViRDV0c3RZT0Zpem9BbGwyUDBVQ2taWXlEOWtUSzF6VzJiN2ZQ?=
 =?utf-8?B?YXZSQTgvTWUvbE54STdDaFVobzN5YU9RNUdmV3BmTkh4b1ZYbTVVbWdkTTcw?=
 =?utf-8?B?OHREZzZFV1ZTQzM1TlBDandkTmZMNjVEbXBmQXpWZXAxN1pmRFgzN0xGU0wr?=
 =?utf-8?B?aERIblJtcGQ4VXZXN2RGc1lKRm5XbkNnSGZrclYveEhJT3Y5SklYYmF5RWpK?=
 =?utf-8?B?STlkRXd5WFhuV0lJbk9GR2o0cmhYeW9DVUFLbmhkbG03b1hKdVJYNzRFQXpS?=
 =?utf-8?B?VGh2dGtDSG9NOVFpcWMxbml5bTVmTDRnbUI3bVptMSt5TEcrdUoxSy80VnBu?=
 =?utf-8?B?ZUwybHlYNG53Q3hmUkxZSFRpOUJhSmFFV0dlOWg3SWVuZlFVRGx2QzAvdW80?=
 =?utf-8?B?ZUdzaS9KUHZJclFrMCtBSmMrTmV3NW1lSTIvV1l2WFVSdnVWVnU5QU1zdnE1?=
 =?utf-8?B?UElTKzlva0xSYUJVTkIvR1RPY094Q0U4Y2Y2bElpRWZnWU9jSXlVek9FM2c2?=
 =?utf-8?B?ZFZ4Z2o3VTV6Q3htbm9xMEs0RUJWN0IrNTZ0YWU5ZmpKVGpoK1pTczZSemNB?=
 =?utf-8?B?QWVlRUhMT0srZ2dISno1RnIrVTlqL0hRRGhJMjQ5UWtVOVAzaDJpSi9wVGJN?=
 =?utf-8?B?SkM1akFBeG1qeXFlSzEzK1ovOEV1OG5QanBSUFVoeUkvZkVtYlc1b21IcVRR?=
 =?utf-8?B?SFlBeTVVSUgwNkhaclNBcXVrMW5jS2h5NS9meGJsZmxmVFpnWkNFQ0dvM3hX?=
 =?utf-8?B?OW1DOVlkV1g0aWVQdVBhaUgyd0l4ckV5RW9JL1BRSHFTNjBpekJiY0tZMytx?=
 =?utf-8?B?Qk1hNFllc3RMaGNBTzkwWnFlanQ1amhJdS9UWGlwZDdsclc1eUpqZjhJM2hy?=
 =?utf-8?B?WjNxTlNYby9IK3h1T0VmaW91MStXamQ3REpFWjkwamhHcnRFY3Mvc3poSzVr?=
 =?utf-8?B?a2s0dDNFM3JXMnlpQzMxYU8vL082cXdZOVQ1STEwYWs4cUhzdzRlMDArdTVU?=
 =?utf-8?B?cDhqWlRDZzd2bk51YU9NSXZHSk9nMXZ6Qys4cy9FeDFXdHVXTmhDc1VCdWgx?=
 =?utf-8?B?MWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0876f2-1837-41e0-c766-08dbace8710d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 01:44:13.4305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YHXRb7azGyClhhFw1QfdNA7xC8tKjNgNHbedXDFKjxhbMpyvipeWU8o9v1jcpDgnnktShMfQVyLFFhZlYixAKRejkSkvUhOqRLi8THzwYns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6525
X-Proofpoint-ORIG-GUID: IeOQ1HVmFSYQTVbl6730P_lxPSqwHiq1
X-Proofpoint-GUID: GoBUwMx9veqd5zCca_1SeA4sddxewyWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-03_21,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309040014
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3841U1e9020462
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 01:44:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187158


On 9/1/23 17:21, Marko, Peter wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> On Behalf Of Changqing Li via lists.openembedded.org
> Sent: Friday, September 1, 2023 11:02
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] sqlite3: set CVE_STATUS for CVE-2023-36191
>
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> The error is a bug. It has been fixed upstream. But it is not a vulner=
ability. You may safely ignore the CVE.
>>
>> Refer:
>> [1] https://www.sqlite.org/forum/forumpost/19f55ef73b
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-support/sqlite/sqlite3_3.42.0.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-support/sqlite/sqlite3_3.42.0.bb b/meta/reci=
pes-support/sqlite/sqlite3_3.42.0.bb
>> index 8783f620f4..b37644580c 100644
>> --- a/meta/recipes-support/sqlite/sqlite3_3.42.0.bb
>> +++ b/meta/recipes-support/sqlite/sqlite3_3.42.0.bb
>> @@ -6,3 +6,5 @@ LIC_FILES_CHKSUM =3D "file://sqlite3.h;endline=3D11;md=
5=3D786d3dc581eff03f4fd9e4a77ed0
>>   SRC_URI =3D "http://www.sqlite.org/2023/sqlite-autoconf-${SQLITE_PV}=
.tar.gz"
>>   SRC_URI[sha256sum] =3D "7abcfd161c6e2742ca5c6c0895d1f853c940f203304a=
0b49da4e1eca5d088ca6"
>>
>> +CVE_STATUS[CVE-2023-36191] =3D "The error is a bug. It has been fixed=
 upstream. But it is not a vulnerability"
> This is wrong format since it's missing CVE status map prefix.
> It needs to be something like:
> CVE_STATUS[CVE-2023-36191] =3D "disputed: The error is a bug. It has be=
en fixed upstream. But it is not a vulnerability"
Thanks for pointing out this.
>
> Also since this CVE is reported in NVD DB for 3.40.1 only, this CVE exc=
lusion is not needed for 3.42.0 recipe.

NVD DB is not 100% correct. The problematic code also exist in 3.42.0,=20
if this is an real CVE, it will also influence 3.42.0.

So I will=C2=A0 send an V2 with fix of above comments.=C2=A0 we can drop =
this=20
setting after the sqlite3 is upgrade to the version with

the bug fix.


Regards

Changqing

>
>> +
>> --
>> 2.25.1

