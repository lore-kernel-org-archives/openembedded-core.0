Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F108C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 02:51:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.91450.1701744678095954630
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 18:51:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=jsHYk5jj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0703886c81=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B52W6WN014209
	for <openembedded-core@lists.openembedded.org>; Mon, 4 Dec 2023 18:51:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=HZCXqsSM3Fk/5YfwlTXptIWLbScGjIYlqWIl0cfpU3E=; b=
	jsHYk5jjgvirumcTbXFar7LieeWdxZc6w0KQytG172FNhfz6wPr7IITGRcovCKDE
	hg+/HOZ7L+VfUgnFSGfVPq/s/zaWhkG0msoa0Zx0aJmLa0WRHxrnjI9XjuT7nIsB
	Rug02D1O5QuIM8Q6BXJNhu8l+iMksHlXQDea0RDlHrray1Lp56dfoEuTi5jO0ppk
	r9ywViQU+LF9ERM5eHVng/Z6SJ+P36t0dog9PtwfflrQZr2oY2+/8FCNrHYrzThV
	a83Gq2218Mmdyvo9TZ7Rnf/9p7pi+agwlvcoZaKO8QqcmSJ2JZau4pyhfaHFxE0p
	Ez58AvLxZLi2kdz/KdWryg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ur4ym21e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 18:51:17 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3B52pHxN004050;
	Mon, 4 Dec 2023 18:51:17 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ur4ym21e7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 18:51:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5NfvdE49Y9kzO3gD7YpG7n3FZayntrxgqaBekhnIUcuDduGCyNBNDi1riZxLRdNV8h1lGbENpMfxm99CtzbCnuWw8AlxPyqvCtnWxTyZIjlkuyfbOOdKBAZt6cOTQdgesOoVIxPawHNu3SDDvkY0k6X+Ip2vRGHEY2vZlroIePnIhDA+vDAB23GIZRN0f49DPJNTvAG6/jpw28BfN+RQA4rjR56GhQn9oR6lNJ2Os4YMmxR1Xq1x+53YHJiieUpR8NTCX0FLN3nipOINbTpWpSG+4YzY94coG9FV6YmnWAPdoiBQCoHrJcOKpDa+u7EqarbOEU+O3U0XjrsRchpFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZCXqsSM3Fk/5YfwlTXptIWLbScGjIYlqWIl0cfpU3E=;
 b=IOKYkAo7CVK8/zPZsy+vx8mto10PInMyrYDzdlDn0XPMoKc5eBSHHSjGe+V9ZtIznBd7fMfNAdxyuuCAoHL3B4cTSgx4L5iNf937rff4xuBGFG/5oKwgPh0du0PPlyjkYrS+/FLsvyQNl/cqIug9P3Cyp1huMtnSh0t8prNYcc7vG0okaB0+g4pwlalO6zq+/WY/2Oc4e40Gr0vfGaI8yVFo5av9abiY1fu14O0IWl5dyHOpVNKgFdhhdK2FWXS84gP80I55f27y10DDkfpdab3OyjDKTWhbbU38qDHDScb8/67cKKjcap8oMO92HQ8RsMhzjJbIi0MGIzaZI3IYFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MW4PR11MB5870.namprd11.prod.outlook.com (2603:10b6:303:187::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 02:51:14 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::9289:cc3:164c:b6cc]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::9289:cc3:164c:b6cc%5]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 02:51:14 +0000
Message-ID: <ef31fe38-2390-ecb8-405a-570895ef1ab9@windriver.com>
Date: Tue, 5 Dec 2023 10:51:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH] openssh: Add SSHD_SERVICE_TYPE variable
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "Yu, Mingli" <mingli.yu@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20231204085408.2125531-1-mingli.yu@windriver.com>
 <6170bfa781bf455736f763a3bc4e4978f916c96a.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <6170bfa781bf455736f763a3bc4e4978f916c96a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0053.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::12) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|MW4PR11MB5870:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f7dc4e-7436-40a2-7b03-08dbf53d0b3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EM0B6Z17wo4Mx/yug68B8EPeodj7b2jn8bA3b7mpZy4MTv65JWx33AR5i1KH684RY12tDleUT2Njvt/4yoMykSaYrH7rJaKwagwLAS+xCR75YEr9OzuPiPl2GaFMdefKaxRysriAfOJsmrfl10GA19ZPp0KginFyq3HPMu424Mtp6o+tAM7HmnzFDZcbHvuqUF89vLOy1EGlvRFl2c/rHx9OfPDPDHm2BSlc80/Up6m7kP0jSlFzjOuS7MSbnoGoq8DsfYTauyLHc3Ya9rkZ2EOOAFNpbwG8P1xf2PfYK6CzrRGqK4K51TIFmmBuyNgkZzO9rfAlil6QijzPscinDqCqilj/31b9rZosP7PBGfoPtYeWgZ/vj8adNdi5Tdm24WwBffm7upjNMpqdW/S4hwhSz4624rZ0LKG2O09MrLH3ai/qjU3uDDENDyndof6qCOPPWTLAZNKN3DQT3NkvgRHI/me+ghcgNCO3+9NlcBUZ2yG8vmpDlJUS7IGnR/4UyGVQ1q2mc5b6IgCl3u4zr7wubh3e+zGmI6rvC/VWCgewnMEIkpx95OwkM5APfDNP1qAC2QrvBRZzx2WrGTpNKJA6bHG6RqOiip+pM5rRF+XfJndNYFpwtiNBAmGxTqRHz+BhlHei/Cw5NKYwHy25KNrcsP/Q5DvlRMwjdTNbnVG0Fy04fxtIKNy8CjfdEnJk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(230173577357003)(230273577357003)(1800799012)(451199024)(64100799003)(186009)(41300700001)(31686004)(6666004)(31696002)(86362001)(5660300002)(2906002)(83380400001)(66476007)(8676002)(66946007)(316002)(36756003)(8936002)(110136005)(66556008)(6506007)(478600001)(2616005)(6486002)(6512007)(53546011)(26005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RXF0enU0OXR2K1hHMDZLckhNWnJiWFFGdWtvcjUvNnF6SWFnb1BkclhrRjRP?=
 =?utf-8?B?RFpuRDRrcHVxL0xkTXJhdnhOcmNIL3NBdUxBVjVhZXIxRW9lWEdtUjZMRGcr?=
 =?utf-8?B?QUZ5TEdNbUtkNktUaUNTRXlEajRpNUJwUTQ0OER1WmJDM3RIZDRWZnhaVjNV?=
 =?utf-8?B?dlM4VHI1U0g2OUU1eTdmRE5SYUxqc0RBOHBzbWFlb0FXSVFMTGFNTEdFQXEr?=
 =?utf-8?B?azlyVE1zYllIT0w5UEwxL3JPMFVHTlpVdzI1dldtZ3c4Mk9hVEd6ckN1QjZs?=
 =?utf-8?B?ZnJMUFE4cDJTenFkNkVwbWIzTUdzWHNhenFDT3QycjdnR2RSdkpYZnduQXFP?=
 =?utf-8?B?a1R3TFdJd3pXVnpmcy9zVzVzOHBiQUYrMG5hcmU1UEhiUFZ2Yk9BY29La0po?=
 =?utf-8?B?elFpSDFHYWZHUmkwM09vOGZmMituZ29PWmJBSXdQbUdZOU1kOUVwbXZGTGJP?=
 =?utf-8?B?aXNOZUZzODFyeDRkWktuYTF2bkFTQTlLS2dIQWM2U0pqQzFhUDZXTnVYcnV2?=
 =?utf-8?B?eHZUNXJwdEJOa0lSZ0gxV3FVMUdvSEh4azlTNVNWVmpzbjc5SzdlRGFrWXJU?=
 =?utf-8?B?YWdNbk9UQXhvQ1J0STl3cjZwVHdXRmpyQ0NTeTB3RFdITC9HUjAvaGI0MjRa?=
 =?utf-8?B?Q2E0bzZmV1E3SE5aYnNSQUl3aE1rbDlMQzNjOHhYWnFYR0M2bWc1d2VwSVRu?=
 =?utf-8?B?K3pSOUJKWFh3aU02K3BZckYyay8yNGpydXVkSVdNNFhydkVGWjg5NVVsQmFX?=
 =?utf-8?B?V2RaRXJPVjJjVlNGR24rNWpqSEZYelpndWJib1BOOWZRdEYrSERCOXYrc1pq?=
 =?utf-8?B?aDBkbEJ1bW94ZTRqd1hMbTZrUzdtdnc1U2xaY1Y3UittQS9VRFIwQVQ5ejRX?=
 =?utf-8?B?U3o5TVRxQTBJSDhTcjBVK0JWRDIvbmxFeE8vSk9pd1dGdjNheHRUVXBkRDNI?=
 =?utf-8?B?N001dzB2clRTdi9jWFU3bVZ6NU42MlJqVUpHRWtLREFQakJCMmJFUk15YitG?=
 =?utf-8?B?UXhGRVJ1YkQxS0t2WENCdmtIZmVCdlhkeTRqVXFoRk4vZUkvVUE1SjFESzdB?=
 =?utf-8?B?N25zMGJnWmg0aXJhOFpIQmZkNVRKaGwrM0YrZGIzRkR6N3lUSGNwdEMxemJs?=
 =?utf-8?B?TEkrY3RqQXppZEJUb3JWWkxwNXhTZzhqREQ5ZnJUaG40RDhQRUQ1SXI3TEZN?=
 =?utf-8?B?RVBnRTllb0hzbnpCamw4b01uV1dDMGltMmdNTmlkWDNCRUJSVEpJcFpDK2h6?=
 =?utf-8?B?OEtZeWJGWVc5eFVzTVMvQWdSNmV0TTQvdWNWMlFkQ0VtNE1yVnNRNVZoeEdL?=
 =?utf-8?B?REM5WHFYejFldURmUS9FZVMrZFIwdFRIQ2ZqL0Rzd1FrbmtQTkordVZpbURr?=
 =?utf-8?B?YmJ5cnBkSUlQTmVwbVB6NHc5b082MWwrbjAveTgvL0V0SmFqcTVON0N1aHBB?=
 =?utf-8?B?RE9iOVBWR21yRGtYYnBvQVJ4RlpqMmd5ZkhQYlRXWFZDRUsrUXBGaDVFclNK?=
 =?utf-8?B?ZkUyVXJSdGdPN0ZHRTJ2ZXRUT0dhSk1oZDNUMnJmc0liaW9vQUdhd0VTU1JM?=
 =?utf-8?B?dDNyZkplT3ZXSCtkd2hmYnJJYVNidjlnT3ZNUldYaytNL3NKWjhFMnlIYWhx?=
 =?utf-8?B?bnpXcm1MbnRac1QrRU9BNTMzTnJ2L2theG9nb2dQOUcxU0tqY3oweWNXMXhV?=
 =?utf-8?B?SHduRlRyZkVtRXZGWC9RWGd4MjgwMnVOVkVNNGtUMUcyb3pDOWJSWUJXeXZx?=
 =?utf-8?B?MDJFQk9UY21nK2h6NFBmVlhDc3Q0QlJDMWxUaDNIRnVXelprSG9idGR2Y1Vo?=
 =?utf-8?B?SUhTSlNLUVNlWlEzaW5kVjVRK21SekpYcVI2SXlPbm8razFiVGlhMklIbzdS?=
 =?utf-8?B?Ynh5QmtheDNwRWN2MXMvaWt6cXJubjNtVzZwaVZ5S3c3NnJwaTBCZUtndGI0?=
 =?utf-8?B?QmVFTmVrSDlwV0t4V2k1WWdsMFY1R0I4NmtuOWZzK2hLRXZ0aWNIY2lYVFI0?=
 =?utf-8?B?ZkZBTVd3WVpLUE1zdFZCd2JEamhWT2pnM0ZlWmRmb2VGZzRXK09QZDMzT2lC?=
 =?utf-8?B?R1NIZFNyTVRaNFQ3SVBOeEgzWTNUbTBpdnpoOVZDZmxwcHhrbWdYVHFhMjlq?=
 =?utf-8?Q?1aSHaPgswdIBMn9nlXVCBJYJg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f7dc4e-7436-40a2-7b03-08dbf53d0b3c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 02:51:13.5278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQCNX7MB5S95+c5w9/MHW2cH3bpIrJ2wmShHaVopS5zxfStXemy8aMp6wv5G//ajawicASLoYGy0RA/omnMFRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5870
X-Proofpoint-GUID: IljcXPZd2LaAJuIVYCBZK4fo1cOYadOw
X-Proofpoint-ORIG-GUID: G8zTvGu9UTmVwsuHfc41cmKQHznxTXgY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2312050023
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3B52W6WN014209
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 02:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191776

Hi Richard,

On 12/4/23 19:07, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> On Mon, 2023-12-04 at 16:54 +0800, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> There are two types of sshd server now, one is based on socket
>> activation(sshd.socket) and another is service activation(sshd.service=
).
>> And the default sshd service type is based on socket by default as bel=
ow.
>=20
> Firstly, I'm a little frustrated about how these changes are being
> proposed in pieces. The original patches made no mention that this was
> eventually going to be controlled by a new variable. I did wonder if
> something like this was going to happen but the didn't push back. Now
> we're "pinned" into a corner with the direction this code takes now
> we've already merged the on target configuration change.
>=20
>> But it's more convenient to determine the service type at build time
>> if there are so many devices.
>=20
> Why did we merge a patch which made this an on target decision then?

Maybe usage requirement change? sorry for noise=EF=BC=81

>=20
>> So add SSHD_SERVICE_TYPE variable to enable sshd.socket or sshd.servic=
e
>> at build time and we still enable sshd.socket by default now.
>=20
> No, we're not adding randomly named variables which take magic options.
>=20
> I cannot look at SSHD_SERVICE_TYPE and know that "1" means socket
> activation and not setting it means service activation (or whatever,
> the fact I can't check what I've written easily proves my point). What
> happens if I set it to "true", or "socket", or "apples"?
>=20
> I'd suggest thinking about a PACKAGECONFIG option such as systemd-sshd-
> socket-mode and systemd-sshd-service-mode which at least uses naming
> users are mode used to and says what it does.

Will sent v2 to use the common PACKAGECONFIG option to control the sshd=20
type.

Thanks,

>=20
> Cheers,
>=20
> Richard

