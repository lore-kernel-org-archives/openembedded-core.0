Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A460AC433EF
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 07:06:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4191.1643353599589371047
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 23:06:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=RaH/FmPS;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8027a60b47=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20S6prrr023886
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Jan 2022 07:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=to : from :
 subject : message-id : date : content-type : mime-version; s=PPS06212021;
 bh=DuR9BU//MZ5bahXPY5ZjCChwHkpGqV5i3YcGA9iCYlA=;
 b=RaH/FmPSanEwEARvuPid/BLxbrMry90P7Y6W35nx5BLuE5rvoKuIIClVEixAPVY5euz/
 /BD5z9253ZvlVqKdHIT1HzUxYWJ8PAzDcq06PsBrTu1EevMzinjGvSglLVUS6urcq6sR
 JeNX2qTE34z2B5mhb/TvmtqpR3Pt/0GiK7DjAITfhWwucIs3SxVTyJZV+4ZYFEN0YrT/
 gxX8q6tsw7W/4b3asAzZff93kKWXWcimgzy1F/oz5p7RTpmsT47x0gX60ohwib4ARGUw
 4g9fJgGaWTZZyc23FZjKImAohhLqsgZAyYsStZzFn/suT4S37T0NvgAt8t5IkQQoirl4 yg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3du71d1grg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 07:06:38 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20S76bAL018722
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Jan 2022 07:06:37 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3du71d1grf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jan 2022 07:06:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=br1NApLcU7DG06lhdRzN37BMj7gm5BYlgfKfbI6GtGdWO/sCJOtsE7KiSyJXlado4duRoSqt7uW6i9sPnaZPLPuJU1tZIQ/H0efyyS3Xz1D4y1VTObN34iQ+GCMg5TVTIobFfop1KBE4VONdjLUvNCA+qpV6P2dMF+IFAM+hOfBiuxYqVo5VcGznSSbkI123t7SDAARzNekh6qAOedJsTUkOMXsHB6YVFmkc1AFhxLrJ7ICgUYMNhX7KbpcOJpGo3cBVtO36KXevse2H9iknTH0+LYJzeCnlLeXi+F7WKuawoj+Glc/0Q0WzN9xwADQPFm2PVTyoZOmUskp5YqHkXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuR9BU//MZ5bahXPY5ZjCChwHkpGqV5i3YcGA9iCYlA=;
 b=nFRzMtCs3Pj2Ar1Q+jzAhHw02B3AS7lp5UJICBSS2Q0lb7eSksrbyOaoZ5UK0ercH+A54ihobRTKGZr5yyqkuoDG79dKu9mSp8MpbBB2k1AYxAy4yeEnB7hAJuCPH8qzt18efby9KWoLMbSl40Qq9FRy31X0qAEWzozo0dZZCpgFEFn7ZlLVA+VP28cr8O/8+2P7eoG2tx64nGSsng+zzS7dkcwE/ZvItiLLrcgZbiDPPn8EqyJBU5QX9Jw76CU3RviC/Pwm7qOHJVlIHdur00bAl6UpfuciHnhqQe8A7GFId09Bv5V+wxPwOb83WmcYGesWLSm7O9nJjjCe4kSw6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB5803.namprd11.prod.outlook.com (2603:10b6:806:236::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 28 Jan
 2022 07:06:34 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc%8]) with mapi id 15.20.4930.017; Fri, 28 Jan 2022
 07:06:34 +0000
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Subject: About the sstate cache directory hierarchy
Message-ID: <fd53e270-fe25-c1ad-522a-8444ca8ba642@windriver.com>
Date: Fri, 28 Jan 2022 15:06:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: multipart/mixed;
 boundary="------------A34C43EC3E6A1717BCC28A53"
Content-Language: en-US
X-ClientProxiedBy: HKAPR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:203:d0::21) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc93794f-78b8-4a8b-fa71-08d9e22cb7bf
X-MS-TrafficTypeDiagnostic: SA1PR11MB5803:EE_
X-Microsoft-Antispam-PRVS: 
	<SA1PR11MB58032EA9A3E679680AB37013ED229@SA1PR11MB5803.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zE7HNzzdRltVTk1qnX1UOihTCXAJXdUnvdsswpA7jl1Ad4zdzvacQZPMy70P7Q2ASNhpOP1cV+08szh5BHjFSjhvYZNm7NAth5aueuI7JFgaOLvQuEe+lP8T7eVHsJFLHaC/hUi6G6PDcMC5Lh9HpOicr+Uk5wq3lEUIqgcujOR/Po7HgXivyjI8LDI0bTC/w7g3Zoxlfg9tbEU7iDWd9LrR4H8noXVpdxVMFV6Hv7KQ7plmmzeasGvCMA7cPazzmo1yYuGAlI7SyIXh778LnzIt+5GuJkLV7cmCA4GPEYJsegCh4qqJ2RoNXj25vEIszz2Oh2UU2zo9WQ9h4sL9xKrxAOrFFbp3z4yfPmL2MCKTe2oCqN+rayWnJ1aJyUMvvBw9SPDdbw8syoIgAR6ADO18AqOYrG6kNca/eQbHWC3dhq9JESNXxH41IajZ29K/M4YgzBQIk75a5fS2aN/QKQ6VXNaGWcEyMWhaT6vFN94JoHIKkwSMSCmA8Ln4gyD+VwEAVjJ7PE192oA6IDMFRjBmt4bVzQSrA+JDRIQflgHbj/E/eT9U1ec1VSdMMnVtqElNzE67Jic4NRhEeCJmJmwoIs43WMdH0fIJm9j+jLQL+AThOLstRjK6Klb/aS5SJya1WkVPpl4XAxjItVtn2+6kUFwa0bqxoxs/b01A7m+/iZos/Lwr5pUWRYEeht85LBfBSS+Jhv4LOFnFV/DNICn1dgiAIWsmWmI4owLciCs3l9++9LnAIGOdBxSiuioQ3wLoyhn2uzH/Dh3Iz5oODOx3eYOrKfUjWXX/32ksF8s4tsIa6Jkau7r2L/oGL/wakcVV40HtnomKwLok+qI45w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(38350700002)(31686004)(8936002)(6512007)(8676002)(2906002)(38100700002)(31696002)(52116002)(235185007)(2616005)(6506007)(26005)(83380400001)(5660300002)(316002)(36756003)(110136005)(6666004)(508600001)(66946007)(66476007)(6486002)(66556008)(86362001)(33964004)(49910200005)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N1YrUjNJWkNGZVJ1dURrVzhxMjNsVUFzdUVvcTlQRzhPcXFIRnV0Rlo3WUlY?=
 =?utf-8?B?d2piQkhyUGgzWEhHN0EyNTNXOTFzUW16OWNCSHZ1b3BHLzhjQmNHTGRKL0RW?=
 =?utf-8?B?eHBhSUI1aHgrcDdCVVBHZVlZNjB5c1VmeGZHdVJId1Jabk5VNmMwM0xwRVpk?=
 =?utf-8?B?Q3NBR2tqRE1XQm9yek5DOEhUVWxEa2dRRnJ6V3h5Y2t2Vyt0QzZYTC9xYzZE?=
 =?utf-8?B?TE15WWdRdGRLeTJpNmNqTE1DWW5QcGZUUG1wS2Z2RlN6UHUzeVBmZkRkeCt0?=
 =?utf-8?B?b29KdEpsVGU5U3FsZXF5clJEYzFqcE5LNnkyM1FkWW5NaC9lWjcxNVJDdElI?=
 =?utf-8?B?cThBR3NGd2ZpWXNEdmVrazczeFJlT0NzN1RwQ0x2MVhESURtdjltajNNSXJ6?=
 =?utf-8?B?bEh2OUZuSmR4a2s0RDkrcStRWnVvODZvZjA2NFFiRjZpRmFXcE5neUxoTUdh?=
 =?utf-8?B?ZlhIOWc0MHhaaTJPQ1JCNE1NT2EwMVVFMGVQL2haQWQyRHpJcDJ0MUlxMitj?=
 =?utf-8?B?dXJpUCtDMzZsTG9NQlgxeVdSbHlTMFJ5bUZhOHplT1BLcFBjbkNwK1I0TEpz?=
 =?utf-8?B?bEk5Z0luYUtMK1U2N21BbWsveHFwWS9LSXdPWDc5YmllNkFYQ2ZxeE02K1dS?=
 =?utf-8?B?R2UwWXlSSGtlUk5RQUJhRVhreXdKQTVqRE1vcjg1cHNqLzV5SjY0cW45ek5K?=
 =?utf-8?B?V1hYa2Q2OVhvYTZKTDUxVmc5OXJKRGc2Rkhqa0FzNG8raVVud1pSQ1N6S2dP?=
 =?utf-8?B?aG5VVzRpL2d5ZFNTOURyeTBra21xSU40MjFURXRHakJXeERMUkFqeWJCWUE0?=
 =?utf-8?B?VjdlTHFRUVdpNDhoS25qWGFMNUhCL2ZpWXJSWnc4Q3ZuTmlDL1JqOG9RRnAr?=
 =?utf-8?B?OVB1MEIrakhkTG5qZ0k5SngrdlN2R2I3RHlDcVlvdW9SeWtoUmJFWS9Pb3o3?=
 =?utf-8?B?T2R4aWF0UTVRdEh5aDd1bFJ2QnpxVmNPelAweE9vYk1haDRrMTlCUURrY09L?=
 =?utf-8?B?VGxmc1IzVDVTQStWaWlSeW9NUlNud2YwSmgrL2pkUjBlc1FHSzJYZ01abWtu?=
 =?utf-8?B?K292UG1FQ1QzdXhKSWhZN2pnRjl0TzVFdDdZeDkrcWhuN0x5a2NHeUw4WHlr?=
 =?utf-8?B?enBEUjlGWDFMYTIzNnhYWUFUNzhzZ3pGMVYzK3kwVDFzNGQ2NkJSQzJrQzJ5?=
 =?utf-8?B?WEFqZ0g0WStDN1ZWamZKRUh4cC9HOWEzakpiQTJSZVRmeDEvZ21CQWlqcVY3?=
 =?utf-8?B?cDdzOVFhdmE1RGw0T3lQVmpUZXU4MDAyaUtuRDhQR0lTT2RoaWxKR29SYjU4?=
 =?utf-8?B?UXBucENjNnZTeHlaTXJLcjZaK0g0cTM0aXRNWlJCdDcxVVZ4YXRnTGw4V05w?=
 =?utf-8?B?K0NnTGFYNHEweCtvekF5UHJvMW45VytyS0F3a3lYUmx0UkFUcWJvbFgrRERr?=
 =?utf-8?B?R0FDcXRMZkhBOXVMbmJLakVxRVlGZFczNWxjaGZHcWFqc0NPb3B2ZTQ1L3p5?=
 =?utf-8?B?SUxTbEEzOExXSkhsMFdXUG5UdzRxYXNjY3p4a05mbkdjMTF2d05uSUlnNWRY?=
 =?utf-8?B?T3lzbStjdEdQUEZUUGJCSHZkL3ZoZHp0dUFMR05rWnZFMmhpSWFWaGpPVGtj?=
 =?utf-8?B?L2xyR2RJVXBvTjIxS1BnTm1DWWJqOVhhS2pnNno3WThBUUM3MitXT0FzeE5Z?=
 =?utf-8?B?ZVlRMUpjNHd2b3JSTDBLMCtrTTNqL3I5QUNUbktQWDRmRVpmY25iRjB5TGpy?=
 =?utf-8?B?RTNBMTFmcTB1WWtMeEwzN1dYK1RoMmJSb0p0akRTT1FMWm9ISE90aWZ0dUNt?=
 =?utf-8?B?bkwvOUprV2Y4WlFXYkRnK2l0VmZuR2RESWJsYkFWNjdWYTNtWnBkbXVOeGJW?=
 =?utf-8?B?WVNNZ2dGaytYTlpYd21pbHFtenQ2bW90UlY5Y0hPQUlseFhnR0p0eG1pZTJr?=
 =?utf-8?B?dk9WVnJMdHJreGpGbzNiZk5GSUowRkVpY29jZzhRMGxLQjY1UWtqa1czdUZE?=
 =?utf-8?B?cWR3Si92KzNPcFdudnVTb1o1SDl2OGtjOHJ1RWZYL3lQUU80ZUJFVXdZeVdR?=
 =?utf-8?B?VFpFdGIvZGRuOVQxV0htYUlMUWhOalRyZkdaOHdpWkZBWkNDVTF4OTdpWXZy?=
 =?utf-8?B?aklSR3ZjSmNSL0cyTVZNeWNUZFhqTXN4NE03djkzc2VPeGo1bFlLQVVOQms3?=
 =?utf-8?Q?NiEfQcoZKtDuntdKC9EQo3k=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dc93794f-78b8-4a8b-fa71-08d9e22cb7bf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 07:06:34.4197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pKc0XSSkqOcl/KYWE0aPPVBygWUVWE8x/ZU2qq644XcdEaYpSVdKROvRDM6q9PTSDx/8YlcS8yFGLQaYzMVL/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5803
X-Proofpoint-ORIG-GUID: 6unbYfju5PBmjEd6bJmKI8sHlUxi8ij0
X-Proofpoint-GUID: vScdGqi_WeU5IKxl7m2K_cQ4vkVQjuu8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_06,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxlogscore=920 mlxscore=0 phishscore=0 lowpriorityscore=0 clxscore=1031
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201280044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jan 2022 07:06:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161067

--------------A34C43EC3E6A1717BCC28A53
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20S6prrr023886

Hi All,

I'm sending out this email because I'm wondering if we can change the=20
sstate cache directory to use ${PN} and taskname as subditories. Hope to=20
hear your opinions.

Below is the long story.

Recently I noticed that running `bitbake xxx -c cleansstate' usually=20
takes more than 10 minutes.

After some investigation, I can see that most of the time is spent on=20
file searching. This is because we have:

SSTATE_PATHSPEC=C2=A0=C2=A0 =3D=20
"${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}${PN}/${SSTATE_PATH_CURRTASK}/$=
{SSTATE_PKGSPEC}*_${SSTATE_PATH_CURRTASK}.tar.zst*"

And our sstate cache directory's hierarchy uses hash[:2]/hash[2:4]/ as=20
sub-directories.

This essentially means that all sub-directories are searched. This would=20
take a long time, especially when run for the first time. I made some=20
changes to=C2=A0 output the time and the logs are as below.

$ bitbake glibc -c cleansstate
WARNING: glibc-2.34-r0 do_cleansstate: Removing=20
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-=
64-poky-linux:2.34:r0:core2-64:7:*_deploy_source_date_epoch.tar.zst*
WARNING: glibc-2.34-r0 do_cleansstate: Took 611.8865714073181 seconds
WARNING: glibc-2.34-r0 do_cleansstate: Removing=20
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-=
64-poky-linux:2.34:r0:core2-64:7:*_package.tar.zst*
WARNING: glibc-2.34-r0 do_cleansstate: Took 1.3219327926635742 seconds
WARNING: glibc-2.34-r0 do_cleansstate: Removing=20
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-=
64-poky-linux:2.34:r0:core2-64:7:*_package_qa.tar.zst*
WARNING: glibc-2.34-r0 do_cleansstate: Took 1.470815658569336 seconds
WARNING: glibc-2.34-r0 do_cleansstate: Removing=20
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-=
64-poky-linux:2.34:r0:core2-64:7:*_package_write_rpm.tar.zst*
WARNING: glibc-2.34-r0 do_cleansstate: Took 1.251939058303833 seconds
WARNING: glibc-2.34-r0 do_cleansstate: Removing=20
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-=
64-poky-linux:2.34:r0:core2-64:7:*_packagedata.tar.zst*
WARNING: glibc-2.34-r0 do_cleansstate: Took 1.2369801998138428 seconds
WARNING: glibc-2.34-r0 do_cleansstate: Removing=20
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc::2.34:=
r0::7:*_populate_lic.tar.zst*
WARNING: glibc-2.34-r0 do_cleansstate: Took 1.1668426990509033 seconds
WARNING: glibc-2.34-r0 do_cleansstate: Removing=20
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-=
64-poky-linux:2.34:r0:core2-64:7:*_populate_sysroot.tar.zst*
WARNING: glibc-2.34-r0 do_cleansstate: Took 1.385568380355835 seconds
WARNING: glibc-2.34-r0 do_cleansstate: Removing=20
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/*/*/sstate:glibc:core2-=
64-poky-linux:2.34:r0:core2-64:7:*_stash_locale.tar.zst*
WARNING: glibc-2.34-r0 do_cleansstate: Took 1.4884181022644043 seconds

I figured that unlike git, we do have knowledge on our sstate objects.=20
It does not seem necessary to use hash value as sub directory. So I=20
changed the sstate directory hierarchy to use ${PN}/taskname/ as sub=20
directories, and here's the result.

$ bitbake libgcc -c cleansstate

WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing=20
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/deploy_source_da=
te_epoch/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_deploy_=
source_date_epoch.tar.zst*
WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.020630598068237305 secon=
ds
WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing=20
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package/sstate:l=
ibgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package.tar.zst*
WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0011608600616455078 seco=
nds
WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing=20
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package_qa/sstat=
e:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package_qa.tar.zst*
WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0007557868957519531 seco=
nds
WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing=20
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/package_write_rp=
m/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_package_write_=
rpm.tar.zst*
WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0013995170593261719 seco=
nds
WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing=20
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/packagedata/ssta=
te:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_packagedata.tar.zst*
WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0007488727569580078 seco=
nds
WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing=20
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/populate_lic/sst=
ate:libgcc::11.2.0:r0::7:*_populate_lic.tar.zst*
WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.0005896091461181641 seco=
nds
WARNING: libgcc-11.2.0-r0 do_cleansstate: Removing=20
/ala-lpggp72/qichen/LAT/builds/share/sstate-cache/libgcc/populate_sysroot=
/sstate:libgcc:core2-64-poky-linux:11.2.0:r0:core2-64:7:*_populate_sysroo=
t.tar.zst*
WARNING: libgcc-11.2.0-r0 do_cleansstate: Took 0.00080108642578125 second=
s

It's much faster.

In addition, the sub dirs now give more info, which should potentially=20
make sstate cache easier to manage.

Attached is the patch to quickly try things out. Hope to hear your opinio=
ns.

Best Regards,

Chen Qi


--------------A34C43EC3E6A1717BCC28A53
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-sstate.bbclasss-use-taskname-as-sub-dirs.patch"
Content-Disposition: attachment;
 filename="0001-sstate.bbclasss-use-taskname-as-sub-dirs.patch"
Content-Transfer-Encoding: 7bit

From 6f148d399c2ac575a9079eae682a56802dfac3ca Mon Sep 17 00:00:00 2001
From: Chen Qi <Qi.Chen@windriver.com>
Date: Thu, 27 Jan 2022 22:57:57 -0800
Subject: [PATCH] sstate.bbclasss: use /taskname as sub dirs

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/sstate.bbclass | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 17dcf4cc17..c657d40151 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -17,6 +17,7 @@ def generate_sstatefn(spec, hash, taskname, siginfo, d):
     if not hash:
         hash = "INVALID"
     fn = spec + hash + "_" + taskname + extension
+    pn = spec.split(':')[1]
     # If the filename is too long, attempt to reduce it
     if len(fn) > limit:
         components = spec.split(":")
@@ -30,7 +31,7 @@ def generate_sstatefn(spec, hash, taskname, siginfo, d):
         fn = spec + hash + "_" + taskname + extension
         if len(fn) > limit:
             bb.fatal("Unable to reduce sstate name to less than 255 chararacters")
-    return hash[:2] + "/" + hash[2:4] + "/" + fn
+    return pn + "/" + taskname + "/" + fn
 
 SSTATE_PKGARCH    = "${PACKAGE_ARCH}"
 SSTATE_PKGSPEC    = "sstate:${PN}:${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}:${PV}:${PR}:${SSTATE_PKGARCH}:${SSTATE_VERSION}:"
@@ -39,7 +40,7 @@ SSTATE_PKGNAME    = "${SSTATE_EXTRAPATH}${@generate_sstatefn(d.getVar('SSTATE_PK
 SSTATE_PKG        = "${SSTATE_DIR}/${SSTATE_PKGNAME}"
 SSTATE_EXTRAPATH   = ""
 SSTATE_EXTRAPATHWILDCARD = ""
-SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}*/*/${SSTATE_PKGSPEC}*_${SSTATE_PATH_CURRTASK}.tar.zst*"
+SSTATE_PATHSPEC   = "${SSTATE_DIR}/${SSTATE_EXTRAPATHWILDCARD}${PN}/${SSTATE_PATH_CURRTASK}/${SSTATE_PKGSPEC}*_${SSTATE_PATH_CURRTASK}.tar.zst*"
 
 # explicitly make PV to depend on evaluated value of PV variable
 PV[vardepvalue] = "${PV}"
@@ -482,12 +483,16 @@ python sstate_hardcode_path_unpack () {
 
 def sstate_clean_cachefile(ss, d):
     import oe.path
+    import time
 
     if d.getVarFlag('do_%s' % ss['task'], 'task'):
         d.setVar("SSTATE_PATH_CURRTASK", ss['task'])
         sstatepkgfile = d.getVar('SSTATE_PATHSPEC')
-        bb.note("Removing %s" % sstatepkgfile)
+        bb.warn("Removing %s" % sstatepkgfile)
+        start = time.time()
         oe.path.remove(sstatepkgfile)
+        end = time.time()
+        bb.warn("Took %s seconds" % (end-start))
 
 def sstate_clean_cachefiles(d):
     for task in (d.getVar('SSTATETASKS') or "").split():
-- 
2.33.0


--------------A34C43EC3E6A1717BCC28A53--

