Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D905AC4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 03:23:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14878.1701400974421441638
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 19:22:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=X4DnMjbY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=069939a247=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B130L4H019749
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 19:22:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=YINmS16hRDeiFqcY4RFhEs8Au0MAp2+f2dINPTednIw=; b=
	X4DnMjbY1v5hwP0t+8cMTXRZ3E51jTtgHhC2jYRJx2qwWNfs2DozAd5uz9KQPAG+
	lWT0GsPKoJLalCIl8fQM7T8MtTc6pdW5CFvaIhfxeLIgLb2YzbwIv4R45cCcVQn6
	N5BeodmEy6hzwwI5ieA30vrsrHLsSER0ImyJrHTqK2bqunUWCLkUWx/kZCIqHkye
	J/SVmjDn8qxP+2lFhRAMItYDVAwYIPFj3hIAhLfMg+JLEi5jw5T8D3K02zqY2FvN
	8JIPZfjaLXiDZkxt04lRS66lC+Corc2VdJjnyQa5xhZF5/4gS+xukOzvjethfMxi
	hl0Oj6Ab/zOdNW1U3pHEZA==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3upgxthb7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 19:22:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHzWdBJIx2ODqzn1Mjl3SoUy8a1BGjvXGsuGkDoKI1UEnpc1qH2YMcaNDDppnhZO37q2gXshK6IPGFkJIELcwmASMqD8HA3ouoQtJjmQAZTHwUxPizWKkolvUizobWy6dyFw3m1bNX6pgCyINofWSxgHU6Byri7elJ04JxPq5opMNIa+EWWhM06esGjJ+xcA/Ocv1ihEwFVkui7GNXRzcLnPmBzwrjLIbuESNz4oEDzQY7q2t6ZBbzWiE8JQbJgtUuxWMUexuRlLkENPXd0WZF6iUeZI1nyDl3kRILruDXOuOzwzcC3YgOpG3ml8UKP2Athb4OGY3AhI+o/AP9CUrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YINmS16hRDeiFqcY4RFhEs8Au0MAp2+f2dINPTednIw=;
 b=FLJnP+mpoCO6rFr0UIQlxJHMy7qVBfv8o9BCh9quvpzDy1uDRcwSV5a5hcooO/EHS077O+1BPBRdWuR4NMmBkBpfWs/L8lVd4wDBY/HY/yBARlo4uZWVoWATF/CVnqsJxFWY47gmVzH7lHb9IncOfpIMr3DEsxWMuQ9FF2gItdKK65DSZQDNWBnPK9IAXipTbryNEeT16P9XKwENbGhnYKBAuGQKTaBKLw/8GJAJIUx3812cA6CQbw1Qyps3WTcy7iN9kFQVkJyQLX7ffySJHUdWRByCTY/Fo3bMilaFR4GRa1AeoUAi/XXwO2I6HGPpsQUg9Wd6tw1cHewwsg2hww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB7613.namprd11.prod.outlook.com (2603:10b6:510:285::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 03:22:49 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::1ea8:e7e3:acc1:8eb6]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::1ea8:e7e3:acc1:8eb6%3]) with mapi id 15.20.7046.024; Fri, 1 Dec 2023
 03:22:47 +0000
Message-ID: <7830de2a-5b3c-7039-a784-06bde774dc49@windriver.com>
Date: Fri, 1 Dec 2023 11:22:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] rootfs.py generates wrong ld.so.cache in case of
 usrmerge distro feature
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <CAHvQdo1KaZ2S1srqjvyj=R0tVroUieExEXmfBpiEBq9J1RZxDQ@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CAHvQdo1KaZ2S1srqjvyj=R0tVroUieExEXmfBpiEBq9J1RZxDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0329.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: 3740ff8b-5362-4b1b-b6a8-08dbf21cca97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OVRScFrTIyyFSFsCvDMRf4IlZlVTheAbs7Vh0kGRzARLcrcJaskehY5q8aNVfyjjL3SZkl3i7HKmRF0uuJHyk9+V5vERaEVweIrYBVH+Je2MywRPXhwgT7XksZG0T90xtzF9DOCp/yd0vmP4Le6GDKdlcntuXwmBJaQpCFc1U8y+bGs4/mWG1xu3VToj91jOe0Gk2trd1XDcHjuqpJyXDwwZFbTuabuIqknaLiLin4Zh8pHbu4QCfgHgetjulIX0mTJIrc0NoEYtFDnryM34lICOMZidnavJYblkYOmoG4cyvOrETGlwOaVWAzNWL0YJZa1clKKgRZr+FrBVr8FOgLuXwS+YEFmJoI9pzTT8s3FYkMQN+oILrWTAepDBS/UDW370lHFnprPkK6SEz0MHQ5/jB/nNTJyHuutHI3mggmVCbA3qa38p/j6aoYi2PaqIq1GrYyBUgbWag4QPpenzxw4Iks55uIG46Gm+lEqorYcMuGRuGknskIbjv3TpYwC98XfwtDV6C8rhGWOTLKI3Lkj6ic/nR3dCECGowj9/+v2ikmnqgamAWk6lOiUp5nZWXyRD/Qx7a9mGB1kaL9XFv5LHtzdg3Muy2sHYmKjf5i25XZ8Mft1MRSQOlrRe5idg/yWlejDAYUrU+QGseGGQ6g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(136003)(346002)(39850400004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(66899024)(66556008)(66476007)(6916009)(316002)(31696002)(86362001)(8936002)(8676002)(66946007)(6486002)(966005)(478600001)(36756003)(2906002)(5660300002)(41300700001)(38100700002)(2616005)(26005)(6506007)(6666004)(6512007)(53546011)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OEFaM1I5d0Q1SmVXYkY3UThlNHJxUlptN1FFUmNBUmlxMUJQQ1hRRXJrMXFy?=
 =?utf-8?B?cllDd1VzbEY5d2syYXluUUJYSkpUVE5VejRzUnFGYkhZTW5ZdFdRU1p3ajdy?=
 =?utf-8?B?N2RGNHlTQmtPR0llNGw0MXNBUG45a0hBQXgrWkRVR2JSSTBEcHpoaXVCZDJz?=
 =?utf-8?B?STcxYVdaQVE2MlpHeTd4YWJ0dTBLOG1Ra3VzVWFWM0RWWDJPZTBxbjduZkg4?=
 =?utf-8?B?S3Nub3J0akV0dk9zVHZOdCtJaXZPUlU5SWRXUFl2dTVpbFp2TDd0QVM3Q0N1?=
 =?utf-8?B?ekw2WUZYOXk4M1ZCcE56bzgvNkp5NVJ0TDFrSFM2T1ZzZWhQTzh3bUxsSmVH?=
 =?utf-8?B?eVNSUWJXa0VocG5RbGZzTUdIU0JDa0ZVRmY1SUg0aERQK05BSTlvY3VrWWd5?=
 =?utf-8?B?Q3hJUDJuQXh1VWZPM0t4N0pkZ2hwMGp0NkpaYlU5ajBlT2tmNnJXMXN0ejZF?=
 =?utf-8?B?bllnYWtPNVZ4MHczVVB5SXhMc1IxNEN4eFlFOWlvQkZyU2tiQWNXbnk5eTJx?=
 =?utf-8?B?QUpReUE0V3AraExYaUUwRjd6NktNZElkQ0lBZ3A0d3dpWm1WbnAyWjM5ODhJ?=
 =?utf-8?B?cG40TkUzVWlpM29tcXRTSjI3QVpNNHR0S1ZTbXREb2Ruek4rcGk5VFQxckFH?=
 =?utf-8?B?NHIvTUx1WUYzR3ZaVXo2dnZlVER3bFU4RTdZR0VjUFZnSkIxbzMrckVTTDBl?=
 =?utf-8?B?dUlzdHh4eUtFV2JWakpxT3B0WkZNZ0RBNE83VzA2NWNSN1o4THI3UlhCN1Bk?=
 =?utf-8?B?ZTlmNTRCZG9MWitSczI3ZXlYMCtFZTFmRm03Um5memJFRnlpVmtXeWp3Uzdw?=
 =?utf-8?B?MG1JTVl1QS8yZ2EyYUpOOU1VMnhaN0pubU9ZN0VCOTN2R05ubzlocmp4QTdz?=
 =?utf-8?B?VHpwQ2lzREQ0SkJtSzlzcUZubnRSdm01Z201WmV3NE16dFgrRUhZNm15OGM1?=
 =?utf-8?B?OEFvVGZCNGo2UDBiY0tleTNpZkRVRlRMTkp2djZkVTV1Z1YvKzZyV2d3cGpM?=
 =?utf-8?B?aFBFU21ZMDlvaWhzbzBXMnh4TmlKVS9FUFdIZ0VrV3Jxd3VOa2wyZG96VkV5?=
 =?utf-8?B?T0dhUDlqRkJDSXpKS2FOZUpXNWd4Qks0b0pBdmZydUJMUWc1UE0vWE9pV0Vq?=
 =?utf-8?B?Wm1lMXhSK0haenl0R3ladXBSb2tJZHZGa05WYVhYdHRYQU9kNDE3UUlOVmhI?=
 =?utf-8?B?NythU21Dd3dIR2RldG50K1ZFL29xQkU2d0JkdjEwLzRsTGc2ZnJEeGxmY25v?=
 =?utf-8?B?dHgyYytBK2NheDdoNUs4RDZ3bzhSNGZ5TzU1MlRoVVpwblRHSDE4cDhHVVA1?=
 =?utf-8?B?T2RNNW9RKzI4NDJJUWlub0RWVFdjSWxLTUd0TEIxYk1LR0Z0OGdONXBSU3NJ?=
 =?utf-8?B?Q1lFN3Mwd09XdC9UMEhaYzVESmV3UUpMVVI3V2xXVEtDR081L1FPRzZBWXBj?=
 =?utf-8?B?KzdyWjdSQTZWRW4reS9uUmZaZUlRaFc3YlBMNGFSWDVyK3ErMXl0VHE5UEZE?=
 =?utf-8?B?U2JYUEtGOERBWXNzZ0E4QTRpMUlKVm9IbWtWL2Y3ZmtFQ1FkbStxSURBSUo4?=
 =?utf-8?B?dktpS2RMSnQ3WnNRWm12NHVETkdYQWhuSmFKUzBPYi9wemdZUWZoYlVianhW?=
 =?utf-8?B?cXNNZkJQK0tTOTRRN2hqK0ZFbithOHlwV05HeXJGcXdKTXFwU2Y1ME9FSnQx?=
 =?utf-8?B?QkFwQncyblJpY2g4bDU1NGZhem5FWlptdEM1QmYvS1BldVlZcXVKckxvb3J6?=
 =?utf-8?B?UDdpVTU1YWxKNmxqdmdnd2MwblFYcU1QcUVKdFpSR1pDTFhTYmMxWFk0b2dl?=
 =?utf-8?B?STdtbVZrVmRTZmQxeEQxc0lLZDYxWXdxd3ovNlNXMVNoSHhCOWN4SGZ1QjRV?=
 =?utf-8?B?ckVET2lYbVFLMFZEeDR1QWVCSGFjS0JUSEpXZ25WUUlkWE9XWVVOVW9VV05B?=
 =?utf-8?B?WnNaTmFRemhrWDJiSUVBa2hxcTlDbElzejd2VWtLU0ZPRWE3VnJjUkRWcU11?=
 =?utf-8?B?K3dnYThVQ2ExbUdGaFRZQmxHdTJiM0lZM0lpbWdyRjQ5WmJDWHlIRXZWN1ZH?=
 =?utf-8?B?MTNHMW14VFBQZTlOSzNBVlVQZkEza3IwcEQwQ0xrUlpGY3NrVW16QnhnM2g0?=
 =?utf-8?Q?fsjJT6jgIhIKJrFdRas76l9NT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3740ff8b-5362-4b1b-b6a8-08dbf21cca97
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 03:22:47.8873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zM3oGCFZH7H5k727bkaZXiOVuOvDAP8HTAAMxeD/jaR1fnoNszrPqBMOo+M88WtBaDos87ifg04t3B+SReYKsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7613
X-Proofpoint-GUID: 2jX02wg431J2m_kdzwfqVPx0EH6v7drC
X-Proofpoint-ORIG-GUID: 2jX02wg431J2m_kdzwfqVPx0EH6v7drC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=667 mlxscore=0 impostorscore=0 adultscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2312010019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 03:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191556

Could you check if your /lib is a symlink to /usr/lib on target?
/lib/libxxx.so.x should be fine if /lib is a symlink to /usr/lib. Right?
Or am I missing something?

Regards,
Qi

On 11/24/23 18:34, Johannes Pointner wrote:
> Hello,
>
> I did recently my first Nanbield build which required the distro
> feature usrmerge because of using systemd and as a result QtWebEngine
> didn't work anymore.
> I reported this to Qt(https://bugreports.qt.io/browse/QTBUG-119140),
> but looking deeper into this it turned out to be an issue related to
> the generated ld.so.cache in the rootfs.py.
> At the moment in the ldconfig-native which is used to generate this,
> are the paths to LIBDIR("/usr/lib") and SLIBDIR("/lib") hardcoded, but
> that isn't correct if usrmerge is enabled, at least I think so.
> The resulting ld.so.cache looks like this:
> 236 libs found in cache `/etc/ld.so.cache'
>         libzstd.so.1 (libc6) => /lib/libzstd.so.1
>         libz.so.1 (libc6) => /lib/libz.so.1
>         libxtables.so.12 (libc6) => /lib/libxtables.so.12
>         libxslt.so.1 (libc6) => /lib/libxslt.so.1
>         libxml2.so.2 (libc6) => /lib/libxml2.so.2
> ...
>
> Would it be OK to configure the paths LIBDIR SLIBDIR using base_libdir
> and libdir?
>
> Thanks,
> Hannes
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191179): https://lists.openembedded.org/g/openembedded-core/message/191179
> Mute This Topic: https://lists.openembedded.org/mt/102778802/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


