Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF68C7EE23
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 05:32:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15582.1684733548128794917
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 May 2023 22:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=GSAFKLUV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=45060de1b5=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34M5LaxA025439
	for <openembedded-core@lists.openembedded.org>; Sun, 21 May 2023 22:32:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : to : cc : from : subject : mime-version;
 s=PPS06212021; bh=JVZLkc0VSQ5leQE/3O7gaInmthTUKu2EA4gYE65b2Y8=;
 b=GSAFKLUVoWZFJ3XmbW5ZqURGIySOgAzxEoML/Vvk0PljVLimI+3lvxU6dq1sBfIX2LBX
 Kih6ZNByHlEHtJ+wz24lgTGGrXyheLQt3dPbIUjMMxaTJRKczNqRrASrqRWwTEnFOe51
 HDuuRL6DgqXJdMGv3qZ67TAZ7Fpz2WLcSOBOHdfS77h4MorsPxH5MMEPmT9v9Zrxyzty
 8gb5cshP7lUOYvWpPmBOATMm94CTsb3AN8cupcLqBlEuX85ychlrSqexuhowS6+qF0oQ
 GbtQmtRoAVqqOvDnXi/rKtWNc8/pE/dmXYkG9bSelHWAiqQ5wYtVvmmcO00IcWI14gmU JA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpsg1hatd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 21 May 2023 22:32:27 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34M5VCSA013924
	for <openembedded-core@lists.openembedded.org>; Sun, 21 May 2023 22:32:27 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2176.outbound.protection.outlook.com [104.47.73.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpsg1hatc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 21 May 2023 22:32:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbHu5Z3vr9Yam1FlxAZdLKnwM2cCbU1iyJvyRBddaD+OtiFG76ce1urQ0J4SWHTdqd9W+yXQqnVf8d1PnMTD1lgW0omcdaHpmL9m0AicixivSFCyEu7M7zaVvfCDAeywkgDiJf1leV9xbDqr0cTZIlHBEWdyWSRk7CLbwu4hrEYhD1iYh7yBPGv8ECu9qMY4CMSfUrbbVZkrKpMfDpRbu3IxMupFyAg4G1EYaOMgeAfhiNo06H1CR1SCK9uLUj0rgXVBfxFTp2TrhFzAxfQTNUezeaXpUNpi5NDgqb4d4SMtu3WgvtBb+/7KHlyqM5yCGKUl4UcV7IrniZ/tNVbrSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVZLkc0VSQ5leQE/3O7gaInmthTUKu2EA4gYE65b2Y8=;
 b=a/gQ6xrB4r0jHW/i6LVIyGyTme5vhXtPjf9P4N0SJCYdnXJuq3FU54z4TiH24QOF2XEy8e01brTjamASW8oqc3W150tfreCmasb0iyU34QTRH3/TnFOA6Z/nfzBpI7PyKIdF3YYvOHWBLfNh4oD28zTmM8qMA2tNrkCMJNZrQLLxxnsdcfyFnWbIoFYqo7IAANJRdxLvNajmFaqNa+CzPOufz7Rk0szC/0N0UYHgDZ4rh9ijuYKgweWM6N6dF1+OFknLpqilzxt5O35xsCXY4qHjbASjEcyLCPBJwfdFJjHSS7wWDsCzzTJ1egZQfLgDzlI3aRhBhhLbUTotU6hUkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by MW4PR11MB7103.namprd11.prod.outlook.com (2603:10b6:303:219::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 05:32:23 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::c0a6:3283:d97d:aafc]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::c0a6:3283:d97d:aafc%7]) with mapi id 15.20.6411.027; Mon, 22 May 2023
 05:32:23 +0000
Content-Type: multipart/alternative;
 boundary="------------UscRJb0xYp3vHW85uHmIK91e"
Message-ID: <b09094a7-c22b-a151-6119-0e957b188563@windriver.com>
Date: Mon, 22 May 2023 13:32:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: richard.purdie@linuxfoundation.org, Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
        Randy MacLeod <randy.macleod@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Subject: cmake-native build failure on fedora38
X-ClientProxiedBy: SJ0PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::17) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2557:EE_|MW4PR11MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: 83221a7b-9a41-4c1c-8ac5-08db5a85eb30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3BCd4zPBP0GMDOkut0hP8NF0LS/UFFCHz3+9tzg72j3J96per4Meu2829zKf6gXH1geh6gkkD/Afet0ZwFO8ZSpRuXRsIwzX6gvXfK0ZwkNm911WyEeQ8PantVH82Vyy9Rt9hmZwg81cr833NpoFT2Uc+Lmm6trYQ50XAFNfM0e9IDot4TkNyhpCPMirtYM/963ynvMFXGq+p1Hu/bbC/WdEPCRs40j+eSdBkRGWjH7+4sLIHwxcDxYVoWhxsvDZfba7sZ4TBa5WXC0EKs8Z52pdgapAnIPMXGQduiU0/h4iu7s3xRiF9f74WRmVpXWkcNqo/OIKfDgEIvgLGM45IvpR7/EUy/TDze6BZABuLqbOyZRdUuHeKEnQkhhr4RGi8Ruehm91EyXmuHmW/Mo6EiiMbL3bq9XusJztB6u6TR/GsNrHDQC2HPoKhprUt9WK8muW0qgzP4iqjYp8o83Ji7ZO+9cIeG7ZgCj/aSnuL3FiNnPSwMddtkrhUKOmfngSvOZPavFXRaIAq9RNyX8zsGqOhUem3nP9kAA9QQUY27JT92bSnp3vIXlx4plaHvjk+9KaPwr05Epokg6Yd7LizhZTlkm48PnJQRVNhOulV4T0GM3Q4jmYVVmJOKWzE2TP/Dd8wSxBMvTEnj+5jb5xI8gvEkkRtpWTazkzTWE9CAvPuG887Lm3FKlrCjSBEkuc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39850400004)(346002)(376002)(366004)(451199021)(8676002)(8936002)(44832011)(5660300002)(83380400001)(186003)(6512007)(6506007)(107886003)(26005)(31696002)(2616005)(86362001)(38100700002)(41300700001)(6666004)(6486002)(478600001)(33964004)(4326008)(6916009)(36756003)(66946007)(66556008)(66476007)(316002)(54906003)(2906002)(30864003)(31686004)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TDloWEFpd0ttdzFCMW1aUEUyUXdCanltK3RnS1o2YzNGVHdJM3hEMlR1QlNG?=
 =?utf-8?B?U1orTThUV0tjeUJRYUdKa0ZJNzcwOUlWZ2VKekdwR205V2krQmY2cldZaWx1?=
 =?utf-8?B?Vlo3MWxEODlObU1RY2N3a1dycCtaVTBEZFRwUXVPcU85M2hsWUJ6YkdBaU1Q?=
 =?utf-8?B?UVZqWDUrVCtrcmtKK2lOR1ExR21nc0hLVWZCY0I5UnlxYTJBVXczTTVoR0Nu?=
 =?utf-8?B?MmQvVHlDKzlaUXhaeDRGZTBYVXAycEdzYStwaXpkbS96S3hFajY1bk9Kb0o1?=
 =?utf-8?B?VzJNVlAwcXA4VmZZVnR3bHFXVXJDck9IdW5iUnZCcmZpc0loZ0kyL0ZJRzcw?=
 =?utf-8?B?VUFJM0NZZ3NPRk4rYTVNNlluZklWaGF2ckRrbjVQUHZGc2Q4d2hsMXNOb2Vm?=
 =?utf-8?B?bkNVNHhtM0RFZVkyTVlibVl1SnBtbHNZZGNSNllZU1NhRVZ2b3IzTmJPci9L?=
 =?utf-8?B?RXdtK3ArR1VKWjdYWERpSmNqZDM3UHY1K21TekhReWl5UXRvd0dLZGRmWWFs?=
 =?utf-8?B?TlhuMjN1R2xHaFRQQW9XQ0lWRVQ0aXJEZS85d1l0cTBMdjd3UFNHNDMzM0Vu?=
 =?utf-8?B?Z0REL2RHK2ozMDdBRU5lU01JakttcUZPQlVDNEtmaXgyYXdUVklPL3V1M0FP?=
 =?utf-8?B?eXphb3NBdEE4N2pibktvMkhRcm9oWi9OWU1yZzR4SDJja3hERmhmNUNNRHV3?=
 =?utf-8?B?YVVxTTFxMndNSUFqcXhmeEZVaVBxV296RytkZHZrNU96LytOdDRWMGxDQ01u?=
 =?utf-8?B?bmFlT28xdEdraVpYWmF0VTcyRkgyWWdnazRJaVVEQnNjSkZiTS9pTjl2UWw1?=
 =?utf-8?B?a1h3UGtVUjBRdzVsQTNpbVRpb0x3b2w1ejFucjQ2YVArMFpYNEZsUnpJUzNU?=
 =?utf-8?B?dmFGckFZcktmQUVwU0orNlhybXQ1ODhxRldhamNIWlAzVzV2Z1NsaDVEdXNr?=
 =?utf-8?B?Q044NGZKY0Y5L2lNQ005c2Jmc1p1K2p1WmxsSjFOU1hBRDdncW0vUWlJYVpj?=
 =?utf-8?B?bWdDNUI1OGZZaS9CYUVmTU8ydVJMQ3psRGlEaGNveXBQcDhDNFBZYnZXUEk4?=
 =?utf-8?B?M3R5bXBEc085dW5DVWdTSFB4ZUo5VG40WldWTXpDRktzVGNmM1JKc29BcTIy?=
 =?utf-8?B?RC9YVFFkWE9rMGNJcGtIclVubFIxdVRtNnFISEJWTWxQN3FKQjVFZy9samt2?=
 =?utf-8?B?eXZnc1VZR1crc1ROVEh3OFExYWxkRkk4UzJleHUxcHFIUG1tZFIxWG5tbHNC?=
 =?utf-8?B?MEoxT2sxREhkVTlqOTNwaExYdlBwMHdkZG9aZ2x4Rll0bDljeGNwWGswdVZ5?=
 =?utf-8?B?MytmWE9rNmJZTDM1WmFUWVRkRzdkZE9IcmN4RlZMM2Zwb1VpblRMOGU2ei9N?=
 =?utf-8?B?NVA0TzQvQ1F6MU5Fc1NUa0tSNHl3bWdjVjhUd3ZWTU5NdGNSWWg0cVBiN2ZO?=
 =?utf-8?B?TytjV0xCdmk2MWNlMThNYkVQZHFRT0dieHdBOHM0b3pGTkI0SVpOTU9BU2Vj?=
 =?utf-8?B?a1l1UzRNcmp3UnczU0pCVzVwQTNhL2lXVnhjMTBja1RRZUsxYUpJWFA2T2o5?=
 =?utf-8?B?dTArRkJhNWdsWkRIYjZWNjZ1cU9jTnpoR29KR0MzOGJ3Y1pmeFBCd2NVcDlC?=
 =?utf-8?B?ZitNQXdhSld2cWFWaGt5VWdhTDh2dG52TUtwdjUrRHZkQ3lNN0FVZGUrL0gr?=
 =?utf-8?B?aWRWeGprVVhyNDBvU3VidmNHNUJxTk5ZVlkyL0xmQ0FtNnRvc3FpRVY1OEMx?=
 =?utf-8?B?T0NhRkFQTlpqZjczOWk1MWJDVldDeUt4dlhBc240SXRiSW82M050ZGh4M1Zs?=
 =?utf-8?B?WVRPNGFRREgxMGxidEJPLzZDQ3F0MSs5cUNCdkY2Q0haUG0wZWJGdEhwTDJt?=
 =?utf-8?B?WjBEeDBwRlEvNzc5cGFOZGI3R2xONVdYZ0RpcHlkMzBRcVFIN3pIRWxBbUcv?=
 =?utf-8?B?aVJsOWMwcWU4eXp3MitLbTFDazlyTUl3NWtQVGkwWC9LVWNjaG5YY2JLKzFi?=
 =?utf-8?B?L3FLZlNNK0NiTGZra25tYVAyZmlYcDQwWXZDS0dSbzdQbDhnZUZ6NTNrR0ZJ?=
 =?utf-8?B?dTJqMDRoNG1nSzIrK2tFdlZKN1J4aVAxa2loODhLT0xaVExmNmFFRHJmcVA5?=
 =?utf-8?B?VWZVL3lhS2xiaWVTaUh5UlV6bG9URWxmaTFOMk5GWnQxNmN2S3Zkb0tEbXFT?=
 =?utf-8?B?eXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83221a7b-9a41-4c1c-8ac5-08db5a85eb30
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 05:32:22.8850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pkjIfmZanrxZcjfwMCrYMiDWL7ZrOizPa4nmQoE03EuN79Q7W0dfLTnfB9KHG1yAMDhf/AJOR984kWh91GFb7EbTU99lGxnMAL+7pKqsQTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7103
X-Proofpoint-GUID: sxCU1RfUIyVyn6eFJfujXZiubTpPazAZ
X-Proofpoint-ORIG-GUID: S11RiXehN7rEYEdKG25NBotH5deBUT_U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-22_02,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 adultscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 05:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181580

--------------UscRJb0xYp3vHW85uHmIK91e
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34M5LaxA025439

Hi, Richard, Khem

With uninative enabled, I build cmake-native failed on host fedora38.

Host fedora38 have gcc 13, and uninative tarball with libstdc++ from gcc=20
12, which will have runtime error when run the compiled apps. There=20
should be some incompatibility.

I noticed that Khem had an patch in mail list to upgrade oe-core gcc to=20
13,=C2=A0 we need to update gcc to 13 and then update the uninative tarba=
ll=20
to fix this failure.

Can I know is there any plan about upgrade gcc to 13,=C2=A0 and will the=20
uninative tarball be rebuilt after gcc is upgraded?=C2=A0 Thanks.


Here is the failure:

$ g++ -g -isystem/build/tmp-glibc/work/x86_64-linux/cmake-native/3.25.2-r=
0/recipe-sysroot-native/usr/include -O2 -pipe
-L/build/tmp-glibc/work/x86_64-linux/cmake-native/3.25.2-r0/recipe-sysroo=
t-native/usr/lib
-L/build/tmp-glibc/work/x86_64-linux/cmake-native/3.25.2-r0/recipe-sysroo=
t-native/lib
-Wl,--enable-new-dtags    -Wl,-rpath-link,/build/tmp-glibc/work/x86_64-li=
nux/cmake-native/3.25.2-r0/recipe-sysroot-native/usr/lib
-Wl,-rpath-link,/build/tmp-glibc/work/x86_64-linux/cmake-native/3.25.2-r0=
/recipe-sysroot-native/lib
-Wl,-rpath,/build/tmp-glibc/work/x86_64-linux/cmake-native/3.25.2-r0/reci=
pe-sysroot-native/usr/lib
-Wl,-rpath,/build/tmp-glibc/work/x86_64-linux/cmake-native/3.25.2-r0/reci=
pe-sysroot-native/lib
  -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=3D/build/tmp-g=
libc/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
-std=3Dgnu++17 cmake_bootstrap_7352_test.cxx -o cmake_bootstrap_7352_test
$ gdb ./cmake_bootstrap_7352_test
GNU gdb (GDB) Fedora Linux 13.1-3.fc38
Copyright (C) 2023 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.h=
tml> This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type"show copying"  and"show warranty"  for  details.
This GDB was configured as"x86_64-redhat-linux-gnu".
Type"show configuration"  for  configuration details.
For bug reporting instructions, please see:
<https://www.gnu.org/software/gdb/bugs/>. Find the GDB manual and other d=
ocumentation resources online at:
     <http://www.gnu.org/software/gdb/documentation/>.
For help, type"help".
Type"apropos word"  to searchfor  commands related to"word"...
Reading symbols from ./cmake_bootstrap_7352_test...
(gdb) r
Starting program: /build/tmp-glibc/work/x86_64-linux/cmake-native/3.25.2-=
r0/cmake_bootstrap_7352_test
warning: Error disabling address space randomization: Operation not permi=
tted

This GDB supports auto-downloading debuginfo from the following URLs:
   <https://debuginfod.fedoraproject.org/> Enable debuginfodfor  this  se=
ssion? (y or [n]) y
Debuginfod has been enabled.
To makethis  setting permanent, add'set debuginfod enabled on'  to .gdbin=
it.
Downloading separate debug infofor  system-supplied DSO at 0x7ffeaaffe000
Downloading separate debug infofor  /build/tmp-glibc/sysroots-uninative/x=
86_64-linux/usr/lib/libstdc++.so.6
Missing separate debuginfofor  /build/tmp-glibc/sysroots-uninative/x86_64=
-linux/usr/lib/libstdc++.so.6
Try: dnf --enablerepo=3D'*debug*'  install /usr/lib/debug/.build-id/7b/ff=
8bdd19faf549fb41f33504fa23bd0ae23ce8.debug
Downloading separate debug infofor  /build/tmp-glibc/sysroots-uninative/x=
86_64-linux/lib/libgcc_s.so.1
Missing separate debuginfofor  /build/tmp-glibc/sysroots-uninative/x86_64=
-linux/lib/libgcc_s.so.1
Try: dnf --enablerepo=3D'*debug*'  install /usr/lib/debug/.build-id/6e/9a=
3111b316bb6ec90cc2fff7af5a494d7e7589.debug
[Thread  debugging using libthread_db enabled]
Using host libthread_db library"/lib64/libthread_db.so.1".

Program received signal SIGSEGV, Segmentation fault.
(gdb) info s
#0  0x00007f5facbf9e6a in std::basic_ostream<char, std::char_traits<char>=
 >::sentry::sentry(std::basic_ostream<char, std::char_traits<char> >&)
     () from /build/tmp-glibc/sysroots-uninative/x86_64-linux/usr/lib/lib=
stdc++.so.6
#1  0x00007f5facbfa81c in std::basic_ostream<char, std::char_traits<char>=
 >& std::__ostream_insert<char, std::char_traits<char> >(std::basic_ostre=
am<char, std::char_traits<char> >&, char  const*,long) ()
    from /build/tmp-glibc/sysroots-uninative/x86_64-linux/usr/lib/libstdc=
++.so.6
#2  0x00000000004012ca in std::operator<< <std::char_traits<char> > (__s=3D=
0x402010 "debug2", __out=3D...) at /usr/include/c++/13/ostream:667
#3  check_cxx14 () at cmake_bootstrap_7352_test.cxx:25
#4  0x0000000000401120 in main () at cmake_bootstrap_7352_test.cxx:79
(gdb) info sharedlibrary
 From                To                  Syms Read   SharedObject  Librar=
y
0x00007f5facce7000  0x00007f5facd0c145  Yes (*)     /build/tmp-glibc/sysr=
oots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
0x00007f5facb67320  0x00007f5facc63692  Yes (*)     /build/tmp-glibc/sysr=
oots-uninative/x86_64-linux/usr/lib/libstdc++.so.6
0x00007f5fac9f73a0  0x00007f5faca682f8  Yes         /build/tmp-glibc/sysr=
oots-uninative/x86_64-linux/lib/libm.so.6
0x00007f5fac9cd660  0x00007f5fac9e3bd5  Yes (*)     /build/tmp-glibc/sysr=
oots-uninative/x86_64-linux/lib/libgcc_s.so.1
0x00007f5fac80d780  0x00007f5fac95affd  Yes         /build/tmp-glibc/sysr=
oots-uninative/x86_64-linux/lib/libc.so.6

--------------UscRJb0xYp3vHW85uHmIK91e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi, Richard, Khem</p>
    <p>With uninative enabled, I build cmake-native failed on host
      fedora38.&nbsp; <br>
    </p>
    <p>Host fedora38 have gcc 13, and uninative tarball with libstdc++
      from gcc 12, which will have runtime error when run the compiled
      apps. There should be some incompatibility. <br>
    </p>
    <p>I noticed that Khem had an patch in mail list to upgrade oe-core
      gcc to 13,&nbsp; we need to update gcc to 13 and then update the
      uninative tarball to fix this failure.<br>
    </p>
    <p>Can I know is there any plan about upgrade gcc to 13,&nbsp; and will
      the uninative tarball be rebuilt after gcc is upgraded?&nbsp; Thanks.<br>
    </p>
    <p></p>
    <p><br>
    </p>
    <p>Here is the failure:<br>
    </p>
    <pre class="code-java">$ g++ -g -isystem/build/tmp-glibc/work/x86_64-linux/cmake-<span class="code-keyword">native</span>/3.25.2-r0/recipe-sysroot-<span class="code-keyword">native</span>/usr/include -O2 -pipe 
-L/build/tmp-glibc/work/x86_64-linux/cmake-<span class="code-keyword">native</span>/3.25.2-r0/recipe-sysroot-<span class="code-keyword">native</span>/usr/lib 
-L/build/tmp-glibc/work/x86_64-linux/cmake-<span class="code-keyword">native</span>/3.25.2-r0/recipe-sysroot-<span class="code-keyword">native</span>/lib  
-Wl,--enable-<span class="code-keyword">new</span>-dtags    -Wl,-rpath-link,/build/tmp-glibc/work/x86_64-linux/cmake-<span class="code-keyword">native</span>/3.25.2-r0/recipe-sysroot-<span class="code-keyword">native</span>/usr/lib  
-Wl,-rpath-link,/build/tmp-glibc/work/x86_64-linux/cmake-<span class="code-keyword">native</span>/3.25.2-r0/recipe-sysroot-<span class="code-keyword">native</span>/lib 
-Wl,-rpath,/build/tmp-glibc/work/x86_64-linux/cmake-<span class="code-keyword">native</span>/3.25.2-r0/recipe-sysroot-<span class="code-keyword">native</span>/usr/lib
-Wl,-rpath,/build/tmp-glibc/work/x86_64-linux/cmake-<span class="code-keyword">native</span>/3.25.2-r0/recipe-sysroot-<span class="code-keyword">native</span>/lib
 -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=/build/tmp-glibc/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2   
-std=gnu++17 cmake_bootstrap_7352_test.cxx -o cmake_bootstrap_7352_test
$ gdb ./cmake_bootstrap_7352_test
GNU gdb (GDB) Fedora Linux 13.1-3.fc38
Copyright (C) 2023 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later &lt;http:<span class="code-comment">//gnu.org/licenses/gpl.html&gt;
</span>This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
Type <span class="code-quote">&quot;show copying&quot;</span> and <span class="code-quote">&quot;show warranty&quot;</span> <span class="code-keyword">for</span> details.
This GDB was configured as <span class="code-quote">&quot;x86_64-redhat-linux-gnu&quot;</span>.
Type <span class="code-quote">&quot;show configuration&quot;</span> <span class="code-keyword">for</span> configuration details.
For bug reporting instructions, please see:
&lt;https:<span class="code-comment">//www.gnu.org/software/gdb/bugs/&gt;.
</span>Find the GDB manual and other documentation resources online at:
    &lt;http:<span class="code-comment">//www.gnu.org/software/gdb/documentation/&gt;.
</span>
For help, type <span class="code-quote">&quot;help&quot;</span>.
Type <span class="code-quote">&quot;apropos word&quot;</span> to search <span class="code-keyword">for</span> commands related to <span class="code-quote">&quot;word&quot;</span>...
Reading symbols from ./cmake_bootstrap_7352_test...
(gdb) r
Starting program: /build/tmp-glibc/work/x86_64-linux/cmake-<span class="code-keyword">native</span>/3.25.2-r0/cmake_bootstrap_7352_test 
warning: Error disabling address space randomization: Operation not permitted

This GDB supports auto-downloading debuginfo from the following URLs:
  &lt;https:<span class="code-comment">//debuginfod.fedoraproject.org/&gt;
</span>Enable debuginfod <span class="code-keyword">for</span> <span class="code-keyword">this</span> session? (y or [n]) y
Debuginfod has been enabled.
To make <span class="code-keyword">this</span> setting permanent, add <span class="code-quote">'set debuginfod enabled on'</span> to .gdbinit.
Downloading separate debug info <span class="code-keyword">for</span> system-supplied DSO at 0x7ffeaaffe000
Downloading separate debug info <span class="code-keyword">for</span> /build/tmp-glibc/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6                           
Missing separate debuginfo <span class="code-keyword">for</span> /build/tmp-glibc/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6                                
Try: dnf --enablerepo=<span class="code-quote">'*debug*'</span> install /usr/lib/debug/.build-id/7b/ff8bdd19faf549fb41f33504fa23bd0ae23ce8.debug
Downloading separate debug info <span class="code-keyword">for</span> /build/tmp-glibc/sysroots-uninative/x86_64-linux/lib/libgcc_s.so.1
Missing separate debuginfo <span class="code-keyword">for</span> /build/tmp-glibc/sysroots-uninative/x86_64-linux/lib/libgcc_s.so.1                                     
Try: dnf --enablerepo=<span class="code-quote">'*debug*'</span> install /usr/lib/debug/.build-id/6e/9a3111b316bb6ec90cc2fff7af5a494d7e7589.debug
[<span class="code-object">Thread</span> debugging using libthread_db enabled]
Using host libthread_db library <span class="code-quote">&quot;/lib64/libthread_db.so.1&quot;</span>.

Program received signal SIGSEGV, Segmentation fault.
(gdb) info s
#0  0x00007f5facbf9e6a in std::basic_ostream&lt;<span class="code-object">char</span>, std::char_traits&lt;<span class="code-object">char</span>&gt; &gt;::sentry::sentry(std::basic_ostream&lt;<span class="code-object">char</span>, std::char_traits&lt;<span class="code-object">char</span>&gt; &gt;&amp;)
    () from /build/tmp-glibc/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6
#1  0x00007f5facbfa81c in std::basic_ostream&lt;<span class="code-object">char</span>, std::char_traits&lt;<span class="code-object">char</span>&gt; &gt;&amp; std::__ostream_insert&lt;<span class="code-object">char</span>, std::char_traits&lt;<span class="code-object">char</span>&gt; &gt;(std::basic_ostream&lt;<span class="code-object">char</span>, std::char_traits&lt;<span class="code-object">char</span>&gt; &gt;&amp;, <span class="code-object">char</span> <span class="code-keyword">const</span>*, <span class="code-object">long</span>) ()
   from /build/tmp-glibc/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6
#2  0x00000000004012ca in std::<span class="code-keyword">operator</span>&lt;&lt; &lt;std::char_traits&lt;<span class="code-object">char</span>&gt; &gt; (__s=0x402010 <span class="code-quote">&quot;debug2&quot;</span>, __out=...) at /usr/include/c++/13/ostream:667
#3  check_cxx14 () at cmake_bootstrap_7352_test.cxx:25
#4  0x0000000000401120 in main () at cmake_bootstrap_7352_test.cxx:79
(gdb) info sharedlibrary
From                To                  Syms Read   Shared <span class="code-object">Object</span> Library
0x00007f5facce7000  0x00007f5facd0c145  Yes (*)     /build/tmp-glibc/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
0x00007f5facb67320  0x00007f5facc63692  Yes (*)     /build/tmp-glibc/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6
0x00007f5fac9f73a0  0x00007f5faca682f8  Yes         /build/tmp-glibc/sysroots-uninative/x86_64-linux/lib/libm.so.6
0x00007f5fac9cd660  0x00007f5fac9e3bd5  Yes (*)     /build/tmp-glibc/sysroots-uninative/x86_64-linux/lib/libgcc_s.so.1
0x00007f5fac80d780  0x00007f5fac95affd  Yes         /build/tmp-glibc/sysroots-uninative/x86_64-linux/lib/libc.so.6</pre>
  </body>
</html>

--------------UscRJb0xYp3vHW85uHmIK91e--

