Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071DBC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 09:43:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18503.1702547018710160299
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 01:43:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Nj8bKVld;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=07120609ca=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BE5PFLW032110
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 09:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=oU67OL5FMC1iZ9MxEv0CI+sX8Mr7hoXwcHVLGMG2Y6Q=; b=
	Nj8bKVldjZDJ3PtONsZOtMwOfLWbHlTz2a0oADVP6ZfMRlDK0AAIkIX9M2ccwY5D
	7/4iBio9PpgOov7pzTIFQGcBHcO6hMvyLgREoTQ/RO1EQZxMwzmhR90M7Aiji8Sf
	SVY810AIjULOB9tM3aEQz13tAeB6/3vBatJljOAN47fG0eZXtxnSFLPt0MlzrlkH
	JkKTb8RchOq50gmhjeaIvL+b2I46Ha3Af63vPZvRHw0YTmLx+VDmS+CX0MqVu1WE
	wFUB5wakmhwVXAS+L/aF+UznT86hfjk8b8zhcXg9U8zjOhyspDij1h3MtwGoI9ED
	hAbpPTl9GJ+BDrk0hKFNEg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyrcqr9gj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 09:43:37 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BE9hbLq028185;
	Thu, 14 Dec 2023 09:43:37 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uyrcqr9gh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 09:43:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOOfIZ3es6pi+X7IrezQeUVzCnO0heLIsB+yZUROwQTDJgLoqa8xccg4gb1ilWaXuw0cCkWzYK0fERWxD/Ixv7WFDiE1PVVwZ+9JIBnjXvKmwpKiQg/H8c5S6hQpfRF8CLWlGny8jOzr8YIIvqpwO+jtA/zMkJOnx0facHGrK6GDQzpHSS7Sri0ReVKarVqCipJWlitjgiQ6tawe2S0Kz/QabtoWxsdkP0I+f9fQ5ltbknRviPWTGLghcEutqhWvxf36A0/6DMlnQUTXAqzn9iD3sVTeXs0mPyaNuJa1tMuoGqgH03OJH79Abf6ZopaH6otFKL47R2//P+tgAni//Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oU67OL5FMC1iZ9MxEv0CI+sX8Mr7hoXwcHVLGMG2Y6Q=;
 b=FOTko1Y/I9Xvet4d20EfwI4XDfCDKIndlaJ3dFGdnOFg4X00ReeaiHtL9o8t/Vzc0wU/98fdu0Vad+aUSRv7POgFzDkGzT37ZHemdNTxKfHglkgnr/2FXnF2yuTvGGVPBU4S/Hwro0FCvWQmN9zE3F+x68Xj24yK2L1AqRR77WjKPx7z29nbJckrh38NDhBiXaHbU2PXDx5mcFtsgM+lshlzINBy1NMTROS28sQmvsRLAM1NIlIJMKvra7G4WbVABkolfl/vXes3K9C3HK3AlsEAVyNyZ104w4QF1hqPrOFeZKtugtMvk1Mg3+FGxxARxiJopFdpUsFFCpEcL6aBzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CH3PR11MB8545.namprd11.prod.outlook.com (2603:10b6:610:1bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 09:43:32 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 09:43:32 +0000
Message-ID: <c562eddf-7c97-49b8-8bb2-43d80e78f9cc@windriver.com>
Date: Thu, 14 Dec 2023 17:43:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rxvt-unicode: set correct outdir for tic
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <20231213083045.194148-1-changqing.li@windriver.com>
 <CANNYZj-Xa1R-yKXpKB3Z_Pit9w7BacPPpwQigOGQN0a7OW_M8w@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANNYZj-Xa1R-yKXpKB3Z_Pit9w7BacPPpwQigOGQN0a7OW_M8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0063.apcprd02.prod.outlook.com
 (2603:1096:4:54::27) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CH3PR11MB8545:EE_
X-MS-Office365-Filtering-Correlation-Id: 78adcbb0-168d-476a-c295-08dbfc8921fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QFL3LUD9Sctm7VTnSc16oBRR59zhoBUY8QL5MxiCOupaJOPpDgS+RgRKfUR3rvxv3FzsrWAq39Jorxpt33dj9IJ8+LlN25s4W4jDIkYBpAbdyO4MIru3Lred8w/f2UrKvKThuthUQi1OFPFz/TF8sSqmcZ8nFzLnYodU7KRestuwNVyob24IWmPlkHcpVwhMHfpFblrF0hjO7Xxv44r7R5hE5CyTePH9LCHt1d5vAXSi3ifgmlFTTUbvf+eh9372g3eQ1KOgGTZJqqPOiiZs9pJOrP/Y7jcEtBimLU+1yZIib1kDTrRm0lN+eIRJT5aokXCzYJuJoPsHq4Dn62qOW4oMOO7KXEUJrQN5tp1xv2z9pjHd9rBM/FILisHqLTiRLl87JvydKes3iinB0rmyqdGuAZb1+WYfHauJIJU0N05IKFRzeJx/B66BJNBH+qm0BSmGvt1BU6AWF/BqWScXrXhtdx4miJfYSK6PEW0T1QmcAJyN2FqY1ggmjDNyhoJiuzva61zl3TqOF2dTY4lyqlQRGmZXdB/LVHDXdPPdkIZQ1bCHOIR/NuCIitOM9qGAbs1eRObiXLdg+aJBFQYenuWWuYOk2hD6/C8ebXJ9P/h8/dGeY3qvzcWfReepPk4DVrCkhDt4mp8PcGo9/U5UdQTq+tPkhpLaplmHw6xjxEpRA763git2VKu32Y9goAR2N4aRQ4o05CCQgdn/mzI4ggGmmKLyxFjBwlChYmtvZnM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(136003)(376002)(39860400002)(230922051799003)(230173577357003)(230273577357003)(451199024)(1800799012)(186009)(64100799003)(31686004)(26005)(6506007)(2616005)(36756003)(31696002)(86362001)(38100700002)(4326008)(83380400001)(44832011)(6512007)(53546011)(5660300002)(8676002)(6486002)(8936002)(66946007)(66556008)(66476007)(110136005)(316002)(41300700001)(2906002)(478600001)(6666004)(43740500002)(45980500001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L1dSNmJpVDBsbUt0VTVUamRyVU9xRmdLL1AvcW1uSWJHOTB4UFRVVnRsL1JT?=
 =?utf-8?B?dVFMOEZSbVlUM3FjTDVYSWkwbCs5VGFWUVdRODJxdExEZW12cjk0UUo1azFh?=
 =?utf-8?B?U3JKTGVRZmNuR2VRYTdYWEVjMXRtYmhaODQ4b3pSblVRU2VpRHVNRktvMEpr?=
 =?utf-8?B?RHpSc1hKOGhVNTR6TitHVW94NG9VeTJlNXJFd2RFSk1VVE10UGZiMCt4VkRV?=
 =?utf-8?B?U0RQQmt6STZpcWhGeTRqclN2djdiTENYcEE1QktFQjRCQkV3czhTZnZ5eGxr?=
 =?utf-8?B?L2J5YndnMXJ6dUtaZFNCb2p1d3diU1BGTkxxUVRpK2FOM0JkNDlwVVg4T3Ax?=
 =?utf-8?B?dVc2Y29BQ2hOcnp5UFdVbHBtSmo4Slg3NXJPK0JwYVhJMzU4OElKNUhqbno2?=
 =?utf-8?B?YlhxSy8zVlhzL3RjdmdtSWhLdmlrWmhhaFJYNHNOMDRFZi94YzNtZmx2d1dE?=
 =?utf-8?B?UCs0dEdxcW1OZjdvUlNDOWxuK20vamptR1hSRHVUOUM5c2Fzd0krQ0Y2L213?=
 =?utf-8?B?NkNxSzFOaERWYTBQdFcveFB1cTIzZTR5US9NMlRBUWNSMmd4cDI3MTNGZTl3?=
 =?utf-8?B?Mjh5bHhHbk5KN0hHb0NTM0lOYWVnQjdDTHVnZjM5V1dVZERGdmZWU3pqbVox?=
 =?utf-8?B?enNNUUIvOE9lR2x5SmlSYjFqUFgrZzZubE9jNE05TWdZRGM4cUZFWndEN0NO?=
 =?utf-8?B?ekRwMDlIQTNHeGgxU1RIRzRhM0RWeVNFVS9JdEJJNE5QalIyeXVIdVRoY0NN?=
 =?utf-8?B?bHlzYkt0emUydmJSdjc1cFhRZ3ZudWZtMURUaitsYi8yQ3BhbDVUaDVZMFZv?=
 =?utf-8?B?RWxPbkI1T0pIcE5vMXpFbHF6cnFYNjNqYmNOUEpRZGZMbStNVEpQb3VwdUVn?=
 =?utf-8?B?MGp4eXNnNHZCZmRkaG5kNlhtbGlTdUpMYmY0Tko5eVkxakZjdHhsQytxcXZE?=
 =?utf-8?B?WGd3R0d5RXRQVXZXSGhOSjZVdmg5cDBIbnZzV3BaVWo4TmxxbFFnd2IvRzJX?=
 =?utf-8?B?QVRzdnkvSHNpMndnT0xndWZQcHhVL3c3amJpSW9HbnlBeElPbGpzQlhMSWhq?=
 =?utf-8?B?OW9jelJGYnFPUnI1TDM2WjFoR01qM000Sk1ydUgrZ0QzbVNuUmlGZS9MSzg5?=
 =?utf-8?B?SHpPelZXZ1JOMjdBR29NQXZwTkJ6TW1Cek96d3hxSWpwSC9wQVBnaGthN2ph?=
 =?utf-8?B?L09UU3B6cU1acll5UGxSRHh2RVZVOUhvZlRqVlk3d2lxdXlaeWFUWVVySG9k?=
 =?utf-8?B?UUxsSy9PYUpBL2RMRGdzb1RPdmZocGJHMnloS1VNN0FUZzRYd3ZVL1cveHg5?=
 =?utf-8?B?K2s4ZC9BYnFZdE84UFFkRUVRT21FaGdvbWZlUGtMVzNaWXdBZWpPbU0wRmxF?=
 =?utf-8?B?SWJpTDlHNWdRdisvZGFhRFFIak1oamJKaVgrL1diTHAySkd5dThkd1NJUlJQ?=
 =?utf-8?B?aXZGb256U0VabWloWDhFQVBKVEJXV3FXVDJheHFGeGdWOStnSHluamhWL1c2?=
 =?utf-8?B?cy9DMFNoS2RYaG00MzhXV0pYeHA1UGpXam5Xa1ZjZkFiRVdMQ0RRRUxlMk9n?=
 =?utf-8?B?aCt4SjNWZ0JPTFJUUE1qVHlOSE9IVTV5L3pmcGdDU205WWhtRVp0Y0ZCZkx4?=
 =?utf-8?B?bHdZMFJjNUtPMVNpN3hiYnpnbGFwYnpsMkp6Rm1tcnVEMlkrcDQwZklQZjl4?=
 =?utf-8?B?QUtvaW54Rk9oRzh4OEVDVUJtM2FtMElUVTR1ZytQTkpKeThHSkltb1g0Titt?=
 =?utf-8?B?aEZlN3NQYU92UitPQzVYMEtkYVMzdm5BQ1hid29qZEZUNWk0alhlQ2ZvQXZN?=
 =?utf-8?B?TmhOMDZJWDQ3ZDI2UkdQZWFXS1orbWgrVmdlQUpraWMzSlpDOFprcFk0dnl6?=
 =?utf-8?B?MURjeWplRlE0RDRRWFZrbkRVemlEVHFyRXJoTmd6eDhiWlNRSklwZXpFcVJo?=
 =?utf-8?B?azV6YWRxb2pmRitqeVp2Q3lsUjJBTjlmazBpb3JQaFJUU084Ym1MT1BrTGFW?=
 =?utf-8?B?OVNLK2FrT2NEL0VzbktSY1R0MGdVZUxBa212blBCbzdTWmxvU1loYmNlL0N4?=
 =?utf-8?B?akxwNktpdkRkQUNNVXp4bWt1M1NCTzVVQVVhSGdMNUVNNW5hQkdNdmZoK01K?=
 =?utf-8?B?Z2M1ZjJ0Tlc3SDVwN3lVdzUzWWdBZE83RDdPL295K1AzUU5FS2RDb2F0Z1Yw?=
 =?utf-8?B?Mnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78adcbb0-168d-476a-c295-08dbfc8921fb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 09:43:32.0124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I7VVB9qyyu7iXntF0ARkLyJs+QrwM2zt/P4YEXYNJBt2xdpOvVrOjDUkfnnT8iLWcB/3dj0etV7qVxcpfn4ZMTRRZBBXA8Hgyg0Ut3005rA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8545
X-Proofpoint-ORIG-GUID: s_vEsMzsjxxwDTWN3z4byinMqkQWUIXf
X-Proofpoint-GUID: Ucf7UDNwWCPKI93kKf11Xn5MdD-PkwQn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312140063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 09:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192341


On 12/14/23 00:28, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Wed, 13 Dec 2023 at 09:30, Changqing Li
> <changqing.li@eng.windriver.com> wrote:
>> +From 1b7d547453fc57806ef86f64c86706530a23e62e Mon Sep 17 00:00:00 2001
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Wed, 13 Dec 2023 11:53:18 +0800
>> +Subject: [PATCH] Makefile.in: set outdir for tic
>> +
>> +tic is from ncurses-native, and set TERMINFO as
>> +${RECIPE_SYSROOT_NATIVE}/${datadir}/terminfo of ncurses-native, so the
>> +rxvt-unicode terminfo will be wrongly installed in there.  set the
>> +outdir explicitly to install them to correct dir.
>> +
>> +Upstream-Status: Inappropriate [oe specific]
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + doc/Makefile.in | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/doc/Makefile.in b/doc/Makefile.in
>> +index e3d1fe8..1de56d3 100644
>> +--- a/doc/Makefile.in
>> ++++ b/doc/Makefile.in
>> +@@ -100,8 +100,8 @@ install: all
>> +       $(INSTALL_DATA) rxvtd.1.man   $(DESTDIR)$(man1dir)/$(RXVTNAME)d.$(man1ext)
>> +       $(INSTALL_DATA) rxvt.7.man    $(DESTDIR)$(man7dir)/$(RXVTNAME).$(man7ext)
>> +       $(INSTALL_DATA) rclock.1.man  $(DESTDIR)$(man1dir)/urclock.$(man1ext)
>> +-      @TIC@ -x $(srcdir)/etc/rxvt-unicode.terminfo || \
>> +-           @TIC@ $(srcdir)/etc/rxvt-unicode.terminfo
>> ++      @TIC@ -x $(srcdir)/etc/rxvt-unicode.terminfo -o $(DESTDIR)$(datadir)/terminfo || \
>> ++           @TIC@ $(srcdir)/etc/rxvt-unicode.terminfo -o $(DESTDIR)$(datadir)/terminfo
> This does look like a suitable change for upstream submission, and
> should not be marked Inappropriate. Please do so first.

Thanks, V2 is send

Changqing

>
> Alex

