Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2332DC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 00:58:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.97082.1702256312890825521
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 16:58:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=JPsfiyrg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0709ce2531=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB0ixJw024135
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 16:58:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=Vvl+VMnFwLBfm4AGlY7PahywW8MFuXvxLd9FCmudO1w=; b=
	JPsfiyrgYg3pf1i1tX4pGArDJTyZd5k5DM7ZeD77FM4q3mCG4lIDtCu5S3HQ0dXQ
	ZPOw5aaUZCeOkQMHoVGLrBJ7LMzshH/7zBaySwqzyAOIGO3bz9GFkGQmHtDXTW36
	h7FC6xXav39T5WLeykEIvYe62uNvKwUWls48PG6uJcHMeRTJ6dqHP5azbmK+n1jn
	zRNjodnw/tWzyhYnavH9d79bh1biwNAeuPCAB0Bi4kvm6t+zttN/KWeTtI8bLKWW
	fcXubQC5PW4TRfa2fXl8UrdHzl9Zfjk+tAWb5ldll5uDy8qqLLXXH2QUVEVIsoaY
	qpA6gYlK6kf8fDs5fxn+Hg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvmd490vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 16:58:32 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BB0wWcL006956;
	Sun, 10 Dec 2023 16:58:32 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvmd490vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 10 Dec 2023 16:58:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHm75g0S3+PZiOOfbjvyK5sSfoJAmD4gQAzbJv/NVUGKV854JZhQXbF4W3Biq3vf20ToZOQy9DMm7cbvZYtOgwxMKXYde3371ow6ysj5q7onYMl5O3X7XwpFkjyfnnxd7d6B3Cz05izTmx6ZtAgdYI2cXnzo/XjG31MES93BzKua5hSJi4DM6IMEcJY86byg+RvWy4BdQ1YDHim7XdU07wb9vm9iVIexdsZHZqxGJyZ6wC8z80pyhIvkz6nFmRI7Za6b7lfO2Uyq6/egmnNxIMIT5UNbj5mMaAu1w8xQk5DZ1bzed6IDZ6BZN7Ndli0GGxVwG+q1v3PDEPT3Vn81+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vvl+VMnFwLBfm4AGlY7PahywW8MFuXvxLd9FCmudO1w=;
 b=BeHSqdcRzaekKZE3+0UEbhd2EL42MI/LLnP7IlNHyCiS5I4LXATKJAk56D/ZNXlOGO5qHrrxiWgRwg5UiumuAvd3bOa7Ln8p3pEJsz7JF1ufLP7D1wN4SMVoAZQhLCyybNsYHBh8ERRrk+FkzEgnXfgnM+Ay2+V5TShLqOh2WCDO/w1ymzosGt1f9EDDZbnEpeeTlwg5WMpD7PYHdWr0drVtdWf5gkklDW32csqZHLZ2W4HFb3nl60m+jm5QO+ji/xmda0ecGJgg+Wje3WY5cYTYcSv0dpjrBctJyEEmix9r0s3MI+hIB2DfwluoKFd8OFPI1e7RMQFti1JE96QTFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DS7PR11MB6080.namprd11.prod.outlook.com (2603:10b6:8:84::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 00:58:27 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592%7]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 00:58:26 +0000
Message-ID: <12a5af9b-cc36-4ea3-bede-7a63fb1d1ccf@windriver.com>
Date: Mon, 11 Dec 2023 08:58:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/5] base-files: update dirs1777 and volatiles
 according to VOLATILE_TMP_DIR
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        Changqing Li <changqing.li@eng.windriver.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20231208101253.4042712-1-changqing.li@windriver.com>
 <20231208101253.4042712-4-changqing.li@windriver.com>
 <DB5PR02MB102131828BB5FA88EF7D86B59EF8AA@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <DB5PR02MB102131828BB5FA88EF7D86B59EF8AA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DS7PR11MB6080:EE_
X-MS-Office365-Filtering-Correlation-Id: 88780f87-c18d-41c0-6b93-08dbf9e44848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IbVdnumTyM6sDFvJxAgu697QlgMNyw+ugv00nge4yrBqOyrBngePbz8RRZgOtQrltHss0JM7prHS0u/kONWFrLftVXT8yEljC6bSmhFtsyU1eB4Vz4DL7PZhgSdJ8U8mQLOoJPJpsqNHGcUI7aGXCrsPxJfo6naNcRkTMlkCfxjLAqx3BnSBXYeyOqF+Bpt383pXP9dS1lRmtGhu0rlyuMYILYaSamJFFm1DOA1TdxDD3C2r/X/4L41EIscMqCcwG8siYQudBmEVDM0mu4uFxxBnxw51zL9oXoO8nCdVMK4r1/0uSjybI6cCWFUO3EaKkNwRupFn0mYnvbgZGBhpJLMPqgv0f3UDaWSbd+4S2lE1mNQi7dVDtu1JzOBRRaIDGr/Ceq/AqQPmNbIwxfSdO4SlrjKktlQpMSw6QqQAORqx6TFX4hmajOmsKunTHtQ044G+JAG81yNtw8/nVkatLkQ6v9UiYAMVtM4SrHZbNI2Nl9iUdfqQPIcswJDO/FAoUeHRDZDH1blp+zRSvNVM0GmZzG9vmnZJTt5tT29sVy5rOh5khrrl7ZGoc2hM1MMpwrMhjsUG1P+TtLVHEpURkVhLw0mjglbnsntltvWAXsZt9BmeQui4jXXi9UgxLCtLfA1E7HgV8zu4XsXRhXv82lzb0mpJPRGSumHNMjoYiUyUOkOnTQ2WpYltdtPJOax6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39840400004)(396003)(136003)(376002)(346002)(230273577357003)(230922051799003)(230173577357003)(451199024)(64100799003)(1800799012)(186009)(6512007)(6506007)(53546011)(5660300002)(26005)(2616005)(44832011)(36756003)(66476007)(66556008)(66946007)(6486002)(2906002)(83380400001)(31686004)(41300700001)(478600001)(86362001)(8676002)(8936002)(31696002)(110136005)(15650500001)(316002)(38100700002)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bVFnMHo3UXVNQ2VuaUFtVnJWZG5ncG5FbTdnVFFZSEcyYzdaL1I4bk1HT25U?=
 =?utf-8?B?WWt1V0tmSXlsTVd0RGxXVXVQa0RoZ2J1bTYxUnpoN2pTSzBua204ckFlemli?=
 =?utf-8?B?eU5WWWlUNktnaXhkVHN4aU5PUlhnTVpmbXpMZjlMakY4WlN4M0RhQzNRdGox?=
 =?utf-8?B?Njk3aEVCKzM0Y3pIMG9GZVFvYnNsLzJKRXVEL21jUFgxdHlERVJ4c2NTS1dR?=
 =?utf-8?B?ZkVrK09vWkQyYmEweW9mWEdDNExTNUhLNnFGblpkQllta3U4K2FzQUx4Y2Yz?=
 =?utf-8?B?NHd1UFF2c3JaRmlsTUU5Q3VMNnRIZGl4RU40NXl5LzBLcWdRdWdsVVhrbVRH?=
 =?utf-8?B?TzdvT0FINGEwdG9hMXhzTXRCOXlMV29yN1phcnpsMG9OWFpqM0gyNDVTclVV?=
 =?utf-8?B?UkI1ZTkrQVBhdjNtVDBkaFR0SnMyODZUQVlpMzIzaDNCZUcyZm9kWFFhc2xa?=
 =?utf-8?B?T0VZVFpPQVZZMXdRaS9sTXJlZ2RYVFhDcjJSV1QwdGsrMmhFN0lTbkVBaXd0?=
 =?utf-8?B?VzVkTGduNGY2QkpoV2ZaWFhuTTA5QTZhQk5SSG5xVE9mL3JzZWpDbjRoRkI4?=
 =?utf-8?B?Y1N2clhnYzVYMTUrZXF0Q2swSEdNMVc3WXk3TkxCbnd2aUJSVDROOUZDa1R4?=
 =?utf-8?B?cmY5NVh6N3B0SzBOQk5yRFhMVlpvSFJSOGxtbGhOdWpGeStWSmpCMS9ZMldX?=
 =?utf-8?B?dlkxaG1OUFNaWk1iSnorWEZhbHA5akNlTU9mR2ZrQUltaTFsdWh6b3hhazdE?=
 =?utf-8?B?M05HSksyOXhsaU1NS2lvbys4NDNhZFR2ZjNLZ096RVY0R3hDdk1tZUFIalEr?=
 =?utf-8?B?TDJCMG9ka3ROK0FzRmZDUXIxSXJ6aEQ4cmpNUmJucHlCQVNJUHpnamJsOXNM?=
 =?utf-8?B?bERUTGhkc3hrbmgza0MzRTBLcWlaeDBkRDlnSFBUekJFSHRmRDE4NElxQTBt?=
 =?utf-8?B?TjhURUN1cWsvTGd1TFg2RzhydXAvTk1XTldUdW1sYW44UFRERUNEL2hrWlJp?=
 =?utf-8?B?VlBGTkRPQXNlNVhoUlpzYkszTXI2WWFlbDJVRWUrb25jTzZsdk9lc2hJZU03?=
 =?utf-8?B?NE9UOFZuRmlRK2hndUhUNXk5c3hVczV1S1duLzR0aVkvTGl4b0djNlg0RW93?=
 =?utf-8?B?c1V3SExwczRaUzhsTHdiSmFrYkJQRVFxNTM2czVid3FmSzdwL20wc09DSm9s?=
 =?utf-8?B?a1A0blpwemhCd2llZjl3QTE3dCtZQjJIOXFOWisyU3JaVGJKaEdocW5rcVRY?=
 =?utf-8?B?a2Z4VHpCWlpPRmZ3U0hPYytoUnE3ejBMcHRibWVpWkZGLytETDNBOUN5Y2xy?=
 =?utf-8?B?ZlQ1aUVjd0Q3aWYzUElpanZTR25mT2hwZkU3bXdQL2xabFBHalVkZ1hXMmsr?=
 =?utf-8?B?alA1U3RodmJ3bTE1NEkxYThTWjJqUkw3ZVExOGQwaHhyVEpGYis0djJKNDZa?=
 =?utf-8?B?WlFsakZUbm9PaWhldXdJV1FnM0RmdGVKL0p5Q3U4ZTk0b29xejQzYU5KbUll?=
 =?utf-8?B?WUpYMlZZVUF0bXR5SmtVRFJ0MkdIU0MwVmh4NTcxVlc5K3J4czBHSUFXSit6?=
 =?utf-8?B?MnFLRzB4eVFZMEVKeDBWbW82ZW5MOVBPT3FzK3FtaXB1SnhMNnF5dEpwN1hF?=
 =?utf-8?B?ME12SVNXbmtaUENnZTc0TmdwNHllYld3TnI1bXpFaGpKWStCVXNhQU9GcGhx?=
 =?utf-8?B?eGNtWHhQTHVhS1dnbkkwMTR3c0FNSFdQSnFJbGZvN2daT1ZiWm9EdVVqV0xZ?=
 =?utf-8?B?NXdLaWkzT2RIQ09CR2JUR0VENzdjRDJHdWt6SkRNaUVINHJwMU5wK1BiYURM?=
 =?utf-8?B?MlQ2Qy9tUHRNTlo5ZW0wNlR2UkE3RVZPQU1ueDB4TkdsTHJTZGlpU25qMlZh?=
 =?utf-8?B?bEZFdHFhRGIvUTRjNENuVUM0UHBJZndSTUFpbXhHZXVxVUFJLzNjVGcvSHB2?=
 =?utf-8?B?YnM5aVhhQ2tsbEFSbnM1RXZtQWF6MGFJaHVZZC84ek9DSFNGSjBlbWtreFhk?=
 =?utf-8?B?TkdvdUxqdG03b2Z0L0pHU0JabTl1TFNRcS9nUlpEcHdmWVVPMXJhVy9VTGRi?=
 =?utf-8?B?K0UzQlVrbHBYVjVyWHJnRDZwQ3AyOFM5R2tZSmlJS2ZJM0EzMnFhcVQ1U2VP?=
 =?utf-8?B?cnVoTkZwRS9BK1lZK052ZXc0R2dKL011WXhJd01lTkx0cXlHVmFmeTgyL2tx?=
 =?utf-8?B?TVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88780f87-c18d-41c0-6b93-08dbf9e44848
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 00:58:26.6602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCmgI6nYgsQ/VdbR6B3S46b1N6XLFEWITD6UmJ+t5VEKWznx7cNaH5oIhUkeCPg2t+6M3lBG9UVZWBSBHQpQuyaamGV9NCFW7vDWhg1F0YA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6080
X-Proofpoint-GUID: QT8WDWagj1PTBUruwXri8PeT31DG9_9l
X-Proofpoint-ORIG-GUID: CVb4DmdQf7oTO7X2jrL-ZHV_ZpLznp1p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110006
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3BB0ixJw024135
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 00:58:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192136


On 12/9/23 07:35, Peter Kjellerstedt wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-core@list=
s.openembedded.org> On Behalf Of Changqing Li
>> Sent: den 8 december 2023 11:13
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH 2/5] base-files: update dirs1777 and volatil=
es according to VOLATILE_TMP_DIR
>>
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> * update dirs1777 so that only create /var/volatiles/tmp when
>> VOLATILE_TMP_DIR set to yes, create /var/tmp when VOLATILE_TMP_DIR set
>> to no
>>
>> * update volatiles so that only symlink /var/tmp to /var/volatiles/tmp
>> when VOLATILE_TMP_DIR set to yes
>>
>> * mount /tmp as tmpfs fs when VOLATILE_TMP_DIR set to no and init
>> manager is sysvinit
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta/recipes-core/base-files/base-files_3.0.14.bb | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/=
recipes-core/base-files/base-files_3.0.14.bb
>> index 9fab53ce63..01d076369d 100644
>> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
>> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> @@ -30,7 +30,7 @@ S =3D "${WORKDIR}"
>>   INHIBIT_DEFAULT_DEPS =3D "1"
>>
>>   docdir:append =3D "/${P}"
>> -dirs1777 =3D "/tmp ${localstatedir}/volatile/tmp"
>> +dirs1777 =3D "/tmp ${localstatedir}/${@'volatile/' if oe.types.boolea=
n('${VOLATILE_TMP_DIR}') else ''}tmp"
>>   dirs2775 =3D ""
>>   dirs555 =3D "/sys /proc"
>>   dirs755 =3D "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir=
} \
>> @@ -54,7 +54,8 @@ dirs755-lsb =3D "/srv  \
>>                  ${prefix}/lib/locale"
>>   dirs2775-lsb =3D "/var/mail"
>>
>> -volatiles =3D "${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') el=
se ''} tmp"
>> +volatiles =3D "${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') el=
se ''} \
>> +             ${@'tmp' if oe.types.boolean('${VOLATILE_TMP_DIR}') else=
 ''}"
>>   conffiles =3D "${sysconfdir}/debian_version ${sysconfdir}/host.conf =
\
>>                ${sysconfdir}/issue /${sysconfdir}/issue.net \
>>                ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
>> @@ -122,6 +123,9 @@ do_install () {
>>        fi
>>
>>        install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fstab
>> +    if [ ${@ oe.types.boolean('${VOLATILE_TMP_DIR}') } =3D False ] &&=
 ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'false', 'true', d)} =
;then
>> +        echo "tmpfs   /tmp  tmpfs mode=3D1777,strictatime,nosuid,node=
v,size=3D50%,nr_inodes=3D1m   0  0" >> ${D}${sysconfdir}/fstab
>> +    fi
> Inconsistent indentation. Please use tabs to indent shell code in
> recipes in OE-Core. This also applies to patches 4 and 5 in this series.

Thanks,=C2=A0 have send an V2 to fix these issue.

//Changqing

>
>>        install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
>>        sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}${sysconfdir}/profile
>>           sed -i 's#@BINDIR@#${bindir}#g' ${D}${sysconfdir}/profile
>> --
>> 2.25.1
> //Peter
>

