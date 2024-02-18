Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2AA1C4829E
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 05:43:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13495.1708235008627084216
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Feb 2024 21:43:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=OwMxYYGI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=27787d4edb=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41I592V6018131
	for <openembedded-core@lists.openembedded.org>; Sat, 17 Feb 2024 21:43:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=2H20T6LiJYQ9NX8LDTn
	9I5mXsxJPvzcB5lAu97VY9V8=; b=OwMxYYGILRR8VBjkPdzqrhbIJMrFp0GdYAL
	ufd52AcxFxKzQgauLwUCFWuU3FGvxKl6NVvjgzaVy6dJTdMAFoPd2C/QzjZWrRJ3
	NqBWuJju2eXwMeqGH5UCaJTnFpe9jSXqCw/B5u34PgjjUHv92LoSjsRQY2T5DZ1F
	PRRr+rkDyauhmKD20YYLZqsUE0s1qhrAnUlPSsZj+19MDpRHZySNskZ4gN5iPzwW
	YGNnp/5OyjvZIarB4r7Mj3hHbc+d7GhuG8kKwDU/bpZSSxgjBd2DaCJHvl9zpHIZ
	zHSSyCfrlx4YBadZlzi2aHNEX2efxCBwEvxbAUSrd++QdOQdoUw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wary48jm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 17 Feb 2024 21:43:28 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41I5hRgg031820;
	Sat, 17 Feb 2024 21:43:27 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wary48jm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 21:43:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+SFgAC+yMABfq6WXqeEUM250wbYgpYwRbr7G+FoB1Gc+Fce9vQPCBY39t2/PSsyNb0Yz0+Pz4sMD41PKtm3fu7sPwul8Js74kRaN6BJH08AYxDmM9lVFouQkK7/bET49PcnPz9Yu0AdINteSLAeV65YVDJZfcn8WS9T3NFeM6rwGmxzcgju3rWN2Xoh3UGeMcVxu/gRBx5C35yBDito/zbrlF67BRu6xsAnzVOfGAaOyucpsHm2zfo0WwnH2HiWpQgyfO3ihj+8BbjVhheuovTFNHJ+WJP8jfPzWhCbvrpney+6aULQlnDRTVJFCbPp+XwYa3gOGzpcCiS4d7PHKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2H20T6LiJYQ9NX8LDTn9I5mXsxJPvzcB5lAu97VY9V8=;
 b=lUxC4xSce155Q67aOiA91s8EiBTcd2YGvBgVcncWTvG+mFfukk2PkqJUygwekwbJyI3eahRIy1smYzWmuR0oREMUeKOkohennIF+tO7muXdMbsV6o4/1MnA195+HV4nh2tmnURjy0FTvpC660CKxTSzQWnM92XXxYKlsf0nTh/jHXOf3XrbRFXs14RL3ujLiPMSRtU0+Fsb6GLvxDkP3jsg+nwTAU+TsPUjcGJUvW9+i3WMWWfdURvGQKo9MXFi0VnOssQW6gg00pO+BzMiFaQcw28/loSyaDcaChFSUih7GdiiMQAwu06g0h/vn9j8UKY7i3uMza8AiU4mg+f7kTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by BL3PR11MB6529.namprd11.prod.outlook.com (2603:10b6:208:38c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Sun, 18 Feb
 2024 05:43:25 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21%7]) with mapi id 15.20.7292.029; Sun, 18 Feb 2024
 05:43:24 +0000
Content-Type: multipart/alternative;
 boundary="------------mNHbjIS0a05l7tGg34Ftykm3"
Message-ID: <66366499-acd2-4660-9379-63e0e2c35ee4@windriver.com>
Date: Sun, 18 Feb 2024 13:43:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V3] systemd: fix a dead link under /var/log
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        Changqing Li <changqing.li@eng.windriver.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20240207083337.2180157-1-changqing.li@windriver.com>
 <DB5PR02MB10213E702244E4060D157880EEF4B2@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <DB5PR02MB10213E702244E4060D157880EEF4B2@DB5PR02MB10213.eurprd02.prod.outlook.com>
X-ClientProxiedBy: TYWPR01CA0030.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::17) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|BL3PR11MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: 96bb0768-1219-4f46-5149-08dc30448618
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+AtAYbjKnBR+0RYGKEyx6575Z1NH7sPW2VILfiSNzUOkdeXyA3nHZyhufE9OUS0MYSmw49Z2Sv3ZoR1BiA8PVeEoQIMj6R1nfD86Bi9Kt6rnLxivUeTMyxjk3+ORP/VPMe70oHeYJgCpTIW1MyK926/u14qTyF/aCOtPoreFimRXfE6Vu8oMcXwGaILLdv5UqFcQNk9xgrFPlkYR7slP6qiHAYFA3HziMO3ZLPg7STeU6e1MjT5XYttVJJnb3bBTY90l1etd6SeWnLhqwZWMrnQ4G/vvBZo0UScysrOzdmkBsWS2I0CJ0IDsnvToCgL5IYS4z+od1wfG9Kik5q3qT1APTsbSaso3hS9taR9Vaj7V7Cw3tUTJUsUTPcxKUAluh0W5BFA48bF4ThnoD39QtCDNvydCGqbIAUmf+iI93jy5RYsbU8ukhHIKNT1HWX0LIBmh8JVfouPVVPaOqUw/R95C5TiLLwCqG0QSr8Hj7D6+ZbEVujnbu5w7iwcHWqBMYK4VbacreKj9BXfYGpzWGdepBCpPwAbWXxLeDbGzFmh9ykqJ057MsU+QQp2fHmjq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39840400004)(346002)(396003)(136003)(366004)(230922051799003)(230273577357003)(1800799012)(186009)(64100799003)(451199024)(66476007)(66556008)(8936002)(83380400001)(53546011)(66946007)(6666004)(41300700001)(8676002)(316002)(478600001)(6486002)(36756003)(6512007)(6506007)(31696002)(110136005)(33964004)(38100700002)(86362001)(26005)(2616005)(5660300002)(31686004)(44832011)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NDVSVjR1eSthdGMxS2l4RXQ1ZFN5ZmkwcDVCVUV1aGxlRFpZeVRIQ0Y0VFN5?=
 =?utf-8?B?Z0R0NFV2NXk5S0ZmS2xRRU9PL0Ria1N0TFNZRGJSWkNBekpBdXBJdGMrREZ4?=
 =?utf-8?B?a3NIQ00zRlRwZVpVWnl2MURYMEVkZVZYTDFYYzV5WXEvYm53V2kwZFlFdkJY?=
 =?utf-8?B?UmtnQmZ0V3RlWDNlZkdLRzZIb2Nsdmxranp2OFVWNHlIWG1CSXI1Qm9yT1JK?=
 =?utf-8?B?Uk1VRlJiK2ZGWmxjaERvcWIzZzN6REo2blhHaFozNDBWRTZQVVRhNkRMdVpn?=
 =?utf-8?B?ZEU3UktNcFRjdWM1NFlUWFhNYkw4aFFVU0ZabUh5RTRuRzJLeWtkRk5BRzRX?=
 =?utf-8?B?d1pmMDduOXovam93dS9oR2FPRW5oOUxEVW5XeFRIQkRSSkVhSXlrb0VlR0pQ?=
 =?utf-8?B?Z2pXSUFTYnpaaHJuYkRpdm4xdTg2T1ZXbXVUTEFtd2NaSGNLRXpFcGtkZ2I1?=
 =?utf-8?B?L0Rma3E4TDlFdzRIdzZSbXpRQjV2RTByYzJ5dEo4a25WN1hUT3hweXZ0K1FM?=
 =?utf-8?B?Y3FVTUdmR05RMTgzRFIrL2F6V21POVB0YmVNR2RsRUtPbkZ5NEVneGFBOXp4?=
 =?utf-8?B?NzNIUXozaWN1ZitTTk1xRUxvdFplV2lpUExxUGYrUE5jU3YxVTdxaW9qa2hO?=
 =?utf-8?B?TjJaSVpuTVpMenVrOWNBK2V5MDIrWkJtcXVKaW9NWUJ6bGpNczFLNksxUXZ5?=
 =?utf-8?B?aVpmNUYwYnV3ZTdUL0FoeUY0V2Z1dEMzNXBLLzdJajdBWnhESUpzbXJudG1y?=
 =?utf-8?B?clpqeDJRazV3aUJybjRDZjhHSWd0S2RWZkVtSmxqQS9LNkR1T0dqTFVqOXo1?=
 =?utf-8?B?YmRFK2FzSEtXUllmOXV6Mzl2Q1lpcjlUa2owWGw1TitOTG95eGY2dXZxc3hr?=
 =?utf-8?B?QjRJY05JNFNnQUpvSkZjYUpLQUdiVlBwNXI4aHVDUkl6a0FyMXorWDFPcEoz?=
 =?utf-8?B?WmhzeWxTaXh6SXNEOFpmdFcwdVNEeXd1dzlsOEQwQWd1cGR5SGdSSmovaXhw?=
 =?utf-8?B?NTBWTkZSaGpZTktCUzRlcHZQVHVjM09oSTlqQXNPNnRTeHMxMnZyRU9YNld2?=
 =?utf-8?B?TUViMHExSGxBbHZCdm5DaDBOL00xTVdWS2ExRElrSVR5YWdhZ0F2cFNHUlN6?=
 =?utf-8?B?Qjg0YjhKOXMrSUNGTEVnb3EzWGo3clVtSFpTY3I3SEpLYTJaL013dXBEV01t?=
 =?utf-8?B?Y0VoWGpMVmFmbkF3ajBmTWFiUzU3VlFERFpVa0RKczBXbS9yQzBzNzVXNkNx?=
 =?utf-8?B?eWV6azBaVS9ZUXgwSkltbUw0VVFQMjFJUmh4UVVCYmxTTkg5WTZsUExpT0Qz?=
 =?utf-8?B?aHJva3F1WUoxR2VvcmpBVDhFN1A4MVVTNWFrRWZUSEF6ZkEwM3ZBYzJ1QTY2?=
 =?utf-8?B?T1FNMm5aMGZpQUExck1Sb1o2VnJpTmpuOUdIa3pwb3VwcmdOVGJ0cUpReGdo?=
 =?utf-8?B?UUNDZ0tTdXFrMnNQYlJFL0xuM2NrWGVlUHhBQVM5TTkvR2p1WFA5MHYyTDFt?=
 =?utf-8?B?WFVoeit6RjBPc2IrbEV3NzEraXZnQVlxaDRydkZBV3MwZkFGdGU4U2QrMWZq?=
 =?utf-8?B?TzBkMllWUVJVVmFNQ2lURFVvbVFhRkNxSUtScFNIOWxEWnRMV1htcXdMbGhL?=
 =?utf-8?B?Z2V5amtUUUViTS93N05YdE9LWkpuZTRqanNqeTNEc0JzQTIzNkRMdzBZSlZH?=
 =?utf-8?B?RWZ0aHpZRU8yR0MrWWhoRW16TTVrUEl4QUpOR21qYnVUV1c4MEVML2I0c2pM?=
 =?utf-8?B?VnlueUVOYUZIUGNIZVRuYytTUUIzUHUrZXFIcm9aQjdoQWlZejc5aWVQQ25D?=
 =?utf-8?B?ZXJweGZCTFBwVVBwMnJ5Ny9MMUZRckZkcW1UdnZQOWx4SmJpdFFIUEZJY3lt?=
 =?utf-8?B?QVlkK2JRVVExMEZveWtvR3dobVkvQmY2dnJLbFpJZFQrUmE5WHpJOG41SEF5?=
 =?utf-8?B?V215Q1RySUZpb0FqWGlYbjE5YUZCTmJmQ3pYZXU5N05VYmtySVo5cHZITjlS?=
 =?utf-8?B?Q2QrZ3Z3TncvYXdYZGdGU09UMURnbHMzazdxeGZtYkJFUXhva0UwWEhpdDVT?=
 =?utf-8?B?UEVEeFZoTkRwYWJld1pUSVYzZUMvU24rYWxsdVFGelEvQ00vMzQ4RDlzUU1Y?=
 =?utf-8?B?OXNDeVF0T1Q2aDYvRlRjb3ZFNC82SE9OUDFMaWVRY290Z3VudG9xSnpGM1M2?=
 =?utf-8?B?RUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bb0768-1219-4f46-5149-08dc30448618
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2024 05:43:24.7244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6OqWuXYH0Y/gQ66YP7Iyf+ROdQ4nu/vQ1R5529JSCe1RcyyiktJpuO4ddGPcab6Vxs4ovJLmXyaJSFO0ZGmcxh6DFmLPa+nTOEC3VUgW74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6529
X-Proofpoint-ORIG-GUID: Kkl8kPgxvgpXcfcxZGBULGD_8n3AA9Cf
X-Proofpoint-GUID: nELXoYI1pDEhgRr8XTdCOSP5igp6vc4Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-18_03,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402180040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 05:43:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195822

--------------mNHbjIS0a05l7tGg34Ftykm3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41I592V6018131


On 2/10/24 05:40, Peter Kjellerstedt wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
>> -----Original Message-----
>> From:openembedded-core@lists.openembedded.org  <openembedded-core@list=
s.openembedded.org>  On Behalf Of Changqing Li
>> Sent: den 7 februari 2024 09:34
>> To:openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH V3] systemd: fix a dead link under /var/log
>>
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> Commit 6fe23ff31c0 changed README to a symlink to README.logs, and
>> install README.logs under systemd doc dir.
>>
>> But for OE, systemd doc dir is splited into package systemd-doc, when =
it
>> is not installed on the target, there will be an dead link:
>> Eg:
>> root@intel-x86-64:/var/log# ls -l README
>> lrwxrwxrwx 1 root root 39 Jun 20 08:57 README ->
>> ../../usr/share/doc/systemd/README.logs
>> root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.l=
ogs
>> ls: cannot access '../../usr/share/doc/systemd/README.logs': No such f=
ile
>> or directory
>>
>> Package this link into systemd-doc to fix above issue, meantime, set
>> symlink according to log dir path
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   meta/recipes-core/systemd/systemd_255.1.bb | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_255.1.bb b/meta/recipes=
-core/systemd/systemd_255.1.bb
>> index 9e09c89355..eccc916af4 100644
>> --- a/meta/recipes-core/systemd/systemd_255.1.bb
>> +++ b/meta/recipes-core/systemd/systemd_255.1.bb
>> @@ -386,6 +386,18 @@ do_install() {
>>           sed -i -e 's/#RebootWatchdogSec=3D10min/RebootWatchdogSec=3D=
${WATCHDOG_TIMEOUT}/' \
>>               ${D}/${sysconfdir}/systemd/system.conf
>>       fi
> While here, please correct the indentation of the above if statement
> to use tabs like the rest of the do_install() function does.
>
>> +
>> +    if [ -f "${D}${prefix}/lib/tmpfiles.d/legacy.conf" ]; then
>> +        sed -i -e '/^L \/var\/log\/README/d' ${D}${prefix}/lib/tmpfil=
es.d/legacy.conf
>> +
>> +        touch ${D}${prefix}/lib/tmpfiles.d/legacy-doc.conf
>> +        if"${@'true' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')=
) else=20
>> 'false'}"; then
>> +            echo "L /var/log/README - - - - ../../../${datadir}/doc/s=
ystemd/README.logs" > ${D}${prefix}/lib/tmpfiles.d/legacy-doc.conf
>> +        else
>> +            echo "L /var/log/README - - - - ../../${datadir}/doc/syst=
emd/README.logs" > ${D}${prefix}/lib/tmpfiles.d/legacy-doc.conf
>> +        fi
>> +
>> +    fi
> The above solution is error prone as VOLATILE_LOG_DIR may have been
> redefined in a way that does not meet the expectations above. It is
> better to reuse what systemd's build system produced. You should also
> use ${nonarch_libdir} instead of ${prefix}/lib. Taken together:
>
>          entry=3D$(grep '^L /var/log/README' ${D}${nonarch_libdir}/tmpf=
iles.d/legacy.conf 2>/dev/null)
>          if [ "$entry" ]; then
>                  echo "$entry" > ${D}${nonarch_libdir}/tmpfiles.d/legac=
y-doc.conf
>                  sed -i -e '\%^L /var/log/README%d' ${D}${nonarch_libdi=
r}/tmpfiles.d/legacy.conf
>          fi
>
> That way the link will only be setup via legacy-doc.conf if it was
> present in legacy.conf in the first place.

Hi,

Thanks, other comments fixed in V4,=C2=A0 and checking of VOLATILE_LOG_DI=
R is=20
needed, please see commit message in V4.

Regards

Changqing

>
>>   }
>>
>>   python populate_packages:prepend (){
>> @@ -622,6 +634,8 @@ FILES:${PN}-udev-rules =3D "\
>>                           ${rootlibexecdir}/udev/rules.d/99-systemd.ru=
les \
>>   "
>>
>> +FILES:${PN}-doc:append =3D " ${prefix}/lib/tmpfiles.d/legacy-doc.conf=
"
> There should be no need to use :append here:
>
> FILES:${PN}-doc +=3D "${nonarch_libdir}/tmpfiles.d/legacy-doc.conf"
>
>> +
>>   CONFFILES:${PN} =3D "${sysconfdir}/systemd/coredump.conf \
>>        ${sysconfdir}/systemd/journald.conf \
>>        ${sysconfdir}/systemd/logind.conf \
>> --
>> 2.25.1
> //Peter
>
--------------mNHbjIS0a05l7tGg34Ftykm3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/10/24 05:40, Peter Kjellerstedt
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DB5PR02MB10213E702244E4060D157880EEF4B2@DB5PR02MB10213.eurprd02.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-----Original Message-----
From: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a> <a class="moz-txt-link-rfc2396E" href="mailto:openembedded-core@lists.openembedded.org">&lt;openembedded-core@lists.openembedded.org&gt;</a> On Behalf Of Changqing Li
Sent: den 7 februari 2024 09:34
To: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
Subject: [OE-core] [PATCH V3] systemd: fix a dead link under /var/log

From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Commit 6fe23ff31c0 changed README to a symlink to README.logs, and
install README.logs under systemd doc dir.

But for OE, systemd doc dir is splited into package systemd-doc, when it
is not installed on the target, there will be an dead link:
Eg:
root@intel-x86-64:/var/log# ls -l README
lrwxrwxrwx 1 root root 39 Jun 20 08:57 README -&gt;
../../usr/share/doc/systemd/README.logs
root@intel-x86-64:/var/log# ls -l ../../usr/share/doc/systemd/README.logs
ls: cannot access '../../usr/share/doc/systemd/README.logs': No such file
or directory

Package this link into systemd-doc to fix above issue, meantime, set
symlink according to log dir path

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/recipes-core/systemd/systemd_255.1.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_255.1.bb b/meta/recipes-core/systemd/systemd_255.1.bb
index 9e09c89355..eccc916af4 100644
--- a/meta/recipes-core/systemd/systemd_255.1.bb
+++ b/meta/recipes-core/systemd/systemd_255.1.bb
@@ -386,6 +386,18 @@ do_install() {
         sed -i -e 's/#RebootWatchdogSec=10min/RebootWatchdogSec=${WATCHDOG_TIMEOUT}/' \
             ${D}/${sysconfdir}/systemd/system.conf
     fi
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
While here, please correct the indentation of the above if statement
to use tabs like the rest of the do_install() function does.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+    if [ -f &quot;${D}${prefix}/lib/tmpfiles.d/legacy.conf&quot; ]; then
+        sed -i -e '/^L \/var\/log\/README/d' ${D}${prefix}/lib/tmpfiles.d/legacy.conf
+
+        touch ${D}${prefix}/lib/tmpfiles.d/legacy-doc.conf
+        if <a class="moz-txt-link-rfc2396E" href="mailto:${@'true'ifoe.types.boolean(d.getVar('VOLATILE_LOG_DIR'))else'false'}">&quot;${@'true' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else 'false'}&quot;</a>; then
+            echo &quot;L /var/log/README - - - - ../../../${datadir}/doc/systemd/README.logs&quot; &gt; ${D}${prefix}/lib/tmpfiles.d/legacy-doc.conf
+        else
+            echo &quot;L /var/log/README - - - - ../../${datadir}/doc/systemd/README.logs&quot; &gt; ${D}${prefix}/lib/tmpfiles.d/legacy-doc.conf
+        fi
+
+    fi
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The above solution is error prone as VOLATILE_LOG_DIR may have been
redefined in a way that does not meet the expectations above. It is
better to reuse what systemd's build system produced. You should also
use ${nonarch_libdir} instead of ${prefix}/lib. Taken together:

        entry=$(grep '^L /var/log/README' ${D}${nonarch_libdir}/tmpfiles.d/legacy.conf 2&gt;/dev/null)
        if [ &quot;$entry&quot; ]; then
                echo &quot;$entry&quot; &gt; ${D}${nonarch_libdir}/tmpfiles.d/legacy-doc.conf
                sed -i -e '\%^L /var/log/README%d' ${D}${nonarch_libdir}/tmpfiles.d/legacy.conf
        fi

That way the link will only be setup via legacy-doc.conf if it was
present in legacy.conf in the first place.</pre>
    </blockquote>
    <p>Hi, <br>
    </p>
    <p>Thanks, other comments fixed in V4,&nbsp; and checking of <span style="white-space: pre-wrap">VOLATILE_LOG_DIR  is needed,  please see commit message in V4.</span></p>
    <p><span style="white-space: pre-wrap">Regards</span></p>
    <p><span style="white-space: pre-wrap">Changqing
</span></p>
    <blockquote type="cite" cite="mid:DB5PR02MB10213E702244E4060D157880EEF4B2@DB5PR02MB10213.eurprd02.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> }

 python populate_packages:prepend (){
@@ -622,6 +634,8 @@ FILES:${PN}-udev-rules = &quot;\
                         ${rootlibexecdir}/udev/rules.d/99-systemd.rules \
 &quot;

+FILES:${PN}-doc:append = &quot; ${prefix}/lib/tmpfiles.d/legacy-doc.conf&quot;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
There should be no need to use :append here:

FILES:${PN}-doc += &quot;${nonarch_libdir}/tmpfiles.d/legacy-doc.conf&quot;

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
 CONFFILES:${PN} = &quot;${sysconfdir}/systemd/coredump.conf \
      ${sysconfdir}/systemd/journald.conf \
      ${sysconfdir}/systemd/logind.conf \
--
2.25.1
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
//Peter

</pre>
    </blockquote>
  </body>
</html>

--------------mNHbjIS0a05l7tGg34Ftykm3--

