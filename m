Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B6FAC61D97
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 02:24:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9224.1674959088763861545
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Jan 2023 18:24:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=XVKtnlWB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1393a162f1=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30T2OPLs006708
	for <openembedded-core@lists.openembedded.org>; Sun, 29 Jan 2023 02:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=lL5/PLXRDSJFu1vA3h6j2OQuJ8lcUTIn3RAAwuQsGYw=;
 b=XVKtnlWBtwXkyqh2cFezwRS3gcaAS9ZM+ScWxjUGdlIoQY/26j5AGiSgWW40owrjj62p
 BFB1xAVyDc435IUkcC1vN1zMMM1E+idcAqv9B8NyQukDN3XqW3RSbo0QvVQ+VqfvpEY6
 wtgd8OPiP00WSNB60Iv2y/1IFB98tNyf8Wfz1g8ZrfnXXCROrKyv0QMTPxL/gi7vo+a2
 gOARKX69/q9KIVFKxbx6BeHKXcEjOWxygkaPVqYw/l0Coe0SHdTL0d1VR9zK5Uxm/FA/
 V3jHQr6UzelnLJG03cLvPJYCrI0r15MSIrkwwLCkq2DlDR0yiZe4nFyPZuwYEDQV2UOR VQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nctparygj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 29 Jan 2023 02:24:47 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30T2Olfj008271
	for <openembedded-core@lists.openembedded.org>; Sun, 29 Jan 2023 02:24:47 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nctparygh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 29 Jan 2023 02:24:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2WdFjX2eRMxQdpChyWXfUvzmNDvOhZvq8AAfLMUlHSPx3qoyyMd0X8Lk2Tfyij8yYKTI2Kk4hyYlHS43GEwcDBlBfmqAXd8FizX0TIyAZhv6CCkahlMSpYgnLuQZhv4zZAM8ZAtEEpcCKjud8Vkjom7hmUrk1m3QihZHNVCJ9NIZMo/0lsiKOzHMO4M6j94YVlzD1o/womyu839vGZX6gLQgGAJE9MZRsjkYDjbfdJ5tD3qE5E+AsrvyMxy3ILjYjlfmHr65lS90CKJWBIDaNAgA83kjMrknnBu8m4NcZSrD/v9+uA+AC2x3mwcVJ/PAhX8pm5BbbB5zJAgekrsvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lL5/PLXRDSJFu1vA3h6j2OQuJ8lcUTIn3RAAwuQsGYw=;
 b=Dl/E+yj9AcE8Lxhyc3HIxxgshhNW9ozpypld7P2eNlSK3hZsGkBsD+dWzHBZh5rzKQknqvR2zEsqQaxHxI9lxW6rJ/wjkLA3nIQFfVeXAdWP7n0JN6bTZGY80IS/Kqbr0yotEnUrjqQqeHI2iOmPoJJZjjAEVnpsbWiri0x8yStdMFzuKAobZHiIwkNutz6KutOkNKdW/xtR3ZEeD3Zy4vPQWB/A57XAEQOitVmHcJso3O1hGxkNIO7NoLU0+ORUmLnCnM3VwDFgSm8OGDAAmgBlpe8fIqvvNn074SsxbzpaSREZsy5qM3KpgfbYXWeBD829+PnFAnLWB1iQCCM/1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2549.namprd11.prod.outlook.com (2603:10b6:a02:c4::33)
 by MW4PR11MB6809.namprd11.prod.outlook.com (2603:10b6:303:1e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Sun, 29 Jan
 2023 02:24:43 +0000
Received: from BYAPR11MB2549.namprd11.prod.outlook.com
 ([fe80::c845:1d80:3854:419f]) by BYAPR11MB2549.namprd11.prod.outlook.com
 ([fe80::c845:1d80:3854:419f%5]) with mapi id 15.20.6043.023; Sun, 29 Jan 2023
 02:24:43 +0000
Message-ID: <0a36fdd1-0558-fb7a-119f-5494c0172a71@windriver.com>
Date: Sun, 29 Jan 2023 10:24:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-core] [PATCH 2/2] curl: enable nghttp2 for support HTTP2
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
        Changqing Li <changqing.li@eng.windriver.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        richard.purdie@linuxfoundation.org,
        openembedded-core@lists.openembedded.org
References: <20221229023442.2520067-1-changqing.li@windriver.com>
 <20221229023442.2520067-2-changqing.li@windriver.com>
 <Y7baMI4MLdLKahf+@mail.local>
 <a690d84f-aa54-4187-e0dd-780a966cf454@windriver.com>
 <Y8RwajkarV+GAz+O@mail.local> <173BE13D4A763969.24231@lists.openembedded.org>
 <37fd9f16-929e-4e1d-9fc5-1fd33cf3110b@windriver.com>
 <CAMKF1so4tRcTDTk2o3hsPmBFxoYd5X4rK=dR0DcPdv9tdsLxuQ@mail.gmail.com>
 <CAMKF1so1BQ133-BeO-xtUKUB9FSLQrpnqdp4wv+5RG2ePb1y5g@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CAMKF1so1BQ133-BeO-xtUKUB9FSLQrpnqdp4wv+5RG2ePb1y5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::23) To BYAPR11MB2549.namprd11.prod.outlook.com
 (2603:10b6:a02:c4::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2549:EE_|MW4PR11MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f11b563-6d10-4290-754e-08db019ffae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xANCOIEI0Yr3uy1ab0MK8/k1DxlGNJ1/GIoRenHpqbxuw0Ie6yudIQlzBYONLny/u5FDA1Yl0mHkkFaUq/mHKiq2sivQ51u74eXsHm4scaX/4TElS7cX1HaKVVRy76Q654AT+Eq/atVbRJd6YN6PLMnq0ARSku4bstPWTExKcOEqcHu+xsi+oCfI6Rkmx5yHOgjSxofgl9BVCLN5bIK7qh+nkDah4SqNVsXg/WBaoX4cWfVTART7rvFm1b3ATCKXQblxlQBtQY6Y3NXIn502SGr2QfuJWVZtKRto15oxjR+67SBnMEdcg5bIJPEEICXafSlH/yx+ePKzYZKTj4f87pRl/cQnei8Ar+fnoSn7UhTO3FZP4vGG1Mu/h4POZ4l7uLGslwfGq7sKmmhs36f2NPjd4zzuZnsFNppZDSzfaF3U850dYEcCw0JYPfaOYRwqRh8snfuwoHAeLv5QTe4zP+MItS1zBt0VQYNNRTQlhZtzVlJGLGPuc73ckyzOEfaN9hPOeylRvOE1lPLtHCJfIQcgTLH98p9koBs4i5XQy0b5H8BSjfNFKThIZPkHwoPjd2qfTbfx0QZHgzFNvi9ViNVB/DJ0BLSAvETm0hkQAQCR0Gf4Qw9hI/INqAKtUbiK5nDuhHk5eiSF4cC2HQxuaR9xXCSp272OqgLBLC5r5RaiatIA1NjspnZF+qIqRLzwGJMS/Pid9CXUmKrJy7TApyQhrtvv1Fezdi0MnRQ5aRqBDWDfhKl7/nGYqvaG3f8w/7uzoI0XBYfH1yRWRO9o4WBBjkecPT4SyPjmDCJwk9U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2549.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(39840400004)(396003)(366004)(136003)(451199018)(6512007)(26005)(186003)(6666004)(31696002)(53546011)(6506007)(38100700002)(86362001)(36756003)(2616005)(83380400001)(41300700001)(8936002)(31686004)(66899018)(2906002)(44832011)(5660300002)(30864003)(6486002)(966005)(478600001)(8676002)(4326008)(66946007)(66556008)(66476007)(110136005)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Ujhna1h2NVJlUDd1VEF0NFpvK3lITitDb0xhbEZ0dmR4aXhkdFZiSXlaSEh3?=
 =?utf-8?B?L29jYWV1dkZiWXdja0N1TzRTOHZ2RFNnWEVWcDFyUXdCZ2VBOHd1NzVIMjRT?=
 =?utf-8?B?cUxCOTNGNU16RFpoQ2FCelpqTG4xdXZpcTl5SGk1M2d4STZGT0s5R21UZlhS?=
 =?utf-8?B?MUkxdG9IdzZUNlUrL1M5RDlacHozeURBcjJBWkNIcjlGNlJDZ0N6Y1htOEt5?=
 =?utf-8?B?OHo1VG9VaytIbjFKRW1mTWI0eDhDQWdrMDVQVFA2T21OSXRBbGNRZC9WS29M?=
 =?utf-8?B?ZEZtY1JiSmF6VlFBVWJrWTZka0daSlpmUk9icWMvNTRSWkNXYW9iRFpnUmFn?=
 =?utf-8?B?SW81K29TZFM2SEM2WXk0dUNRU05QNXFycEIzQzRyQmhoVUZjaG9LbFJCaXFh?=
 =?utf-8?B?VUlmVVJnVVdIWEdya3J6VXFQL3VCWVF6aXBjclRlK3hiTVUxWjVRYzJlM3A5?=
 =?utf-8?B?dFhIc0FMZzVUWVFvRFFXSG5XTHl5ZnJnenpPc0dZWXBUdWZZOUsyblMvQjJS?=
 =?utf-8?B?ZmZuZzBNYjB4R3pQNXNvcmdJMW9rSnROR1lQTUo2cDQvQWZpODlBajNVSFJk?=
 =?utf-8?B?Y2NucWVUdXd3WWRuVjd5QUZtYWF5UUtEUi9UYUUrNVAwL0pZcjhWQUp4bmtU?=
 =?utf-8?B?Mkcwd1ZZK1JIVVV0TDFRSVBsOTdvZGtuNGpxSC9seTdwMlV6OWpTMzQ1QTVJ?=
 =?utf-8?B?TDVQd2Y5Sk9CWVZ1VHlwN0tzZmR0L3BHWGxUVCt0cXpaL0tmc2sxbmVrcVBB?=
 =?utf-8?B?VnA4Mng2YytTejZhSk9TWWE5cEJLWjdUc2VEakR0OUVCaXBPNkVPVExxUmJS?=
 =?utf-8?B?SUFrUVN1aFV6a0tPZHhkNW9RWlRBRVM5dFFMVWFKNWVDRkNqM1REUDkvV1VX?=
 =?utf-8?B?eDYydnc5alBKY01kOU9ZdHlyWDl4WTZ3ZDR5S3FRSlgrZWlLcVAzVHdIdklX?=
 =?utf-8?B?YWpKdkJVRzhTd2ZlUEhnZHJrS05iT2JyUWFDUWJjSFNUQlZDbjJYRzVnNUs5?=
 =?utf-8?B?L2VkV08yMitlMUNJQXJtcnY5WThmaHRNNmQ3elBtSE5ablBieEFlYjU3MUMy?=
 =?utf-8?B?OHJ5VHNBaVhjSUhkZGZqMW1TanI0dUQvWktreHc4S2xDVUk0T2orYlE2aTZp?=
 =?utf-8?B?ck54Tkt0VTJVbHVoV0lNOHlLTjF1UjN4eHVzSGsvTEd3ckJUZ0pabEVKbWJj?=
 =?utf-8?B?STZ1VEVXT3lqZHROWFI5NUhCOW01M09KZnMzN0lGNTRFV1Y1NUEzRXdWNUtj?=
 =?utf-8?B?R1MveFZRZ0htcFlMOEdNdm0xUzg4b25vMGIxNWo4aFlNZHhvNTRnTmwzQUpF?=
 =?utf-8?B?TmFCdGprN1FYaDBEWG9HcU9rRHI0cFdZbm5CcXJGRFNVZzdnU2Z3L1hOT0pN?=
 =?utf-8?B?NGRFVDUzNFFodjdqd2JZSmNSbERIV1h6S1JQZ0dtbWI4Mk80Ri9Wd01MYmIr?=
 =?utf-8?B?TTJqOTh1cEhiOTNFUktnTmU3VHRXUVpHbEh5ZCtKbW50K050MGhMUk1lOFBM?=
 =?utf-8?B?Tzk5YStEaXY5cVMvLzVFNFVYd0E1VlM3NzU4Sk9QcEd3Zm1lMXprMFQzZG9X?=
 =?utf-8?B?c29mQTJ5bzZqY0dZVFc2UmxjYnpXQjNSbVZGZTN6c1RZeklCbGxhSnRaT3BE?=
 =?utf-8?B?R1BNdXlMd0w3WENDMzdIdHZCdXk4WEhTVngrR0wwOTVyVElRWnk3VllqSkZH?=
 =?utf-8?B?K0xDbGp0U2p4SWp6Z0dFa0poc0NuOEJDdHJ5NlBXWlc1cDhuYTg2bCtUYlJ6?=
 =?utf-8?B?cXhYcU8vbFA4ZmRNSnNsaHJVWmdDS3dka2pPR0VqdEtyOEMvRUxhVUU0eHZr?=
 =?utf-8?B?S01VZmVCUUs2TTFyWkhxUkg1MjJ4WUZEaGhnK05IQjY5WUNUa2QxQUxuOGdW?=
 =?utf-8?B?YUZvb0dVaTZPZzQvcS9hL2Z3bE9hWGliekt1NFh1MC9ydlUxUFR2M2p2a2Nx?=
 =?utf-8?B?cDVJamtuOVd1THJWVTdxWFF1cUlJWEtUbk92MSs0ZG9KblhHQ2FqcFRwQXVm?=
 =?utf-8?B?Nm5RcGN5V2pGOGJ2dGpxUlJFQUxIRlVvV05wTExGR2JQdU5jQ1hTM3JVQkNa?=
 =?utf-8?B?MWZaWUVoZVpkTVc3aklJTDhDc29hMUN6SjJjS0xzMEExU1lwbVg5SVdqeU5u?=
 =?utf-8?B?VDBtNmVDTWd6cFdFNDZHbVNGMEU3YjZrOTQ3VmZ4dGlQUi9GK0xVTlFaYmhM?=
 =?utf-8?B?b3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f11b563-6d10-4290-754e-08db019ffae5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2023 02:24:42.6326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8w8aW18phH0aEBiUYZqjjKjurXM6m3W7+YafQwPvKGafKc5XUW4bCDsJhhY+S/AXGl+Mj5UziXbpvPEY1Oav4RgQbRLLIxW+ztCQ72z2SEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6809
X-Proofpoint-GUID: BtRh0DjirtB-vKlzNhGr1cPy48NVcU18
X-Proofpoint-ORIG-GUID: pCJtsikDRYkeC0HF0kzObqq3O5jciNw0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-29_01,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301290021
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 30T2OPLs006708
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Jan 2023 02:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176466


On 1/29/23 07:32, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> I have sent a fix for nghttp2 which unblocks builds on archlinux build
> hosts atleast.

Thanks Khem, I planed to send out the fix together with this debian11=20
issue, but I cannot

reproduce this issue on debian11.=C2=A0 It is an different issue with thi=
s=20
archlinux one.

//Changqing

> On Sat, Jan 28, 2023 at 3:17 PM Khem Raj <raj.khem@gmail.com> wrote:
>> still failing on archlinux
>>
>> | [26/27] Generating nghttp2.c
>> | /usr/lib/python3.10/site-packages/Cython/Compiler/Main.py:369:
>> FutureWarning: Cython directive 'language_level' not set, using 2 for
>> now (Py2). This will change in a later release! File:
>> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.51.0-r0=
/nghttp2-1.51.0/python/nghttp2.pyx
>> |   tree =3D Parsing.p_module(s, pxd, full_module_name)
>> | [27/27] cd /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-nat=
ive/1.51.0-r0/build/python
>> && /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.51.0=
-r0/recipe-sysroot-native/usr/bin/python3-native/python3
>> setup.py build
>> | FAILED: python/CMakeFiles/python
>> /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.51.0-r0=
/build/python/CMakeFiles/python
>> | cd /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.51=
.0-r0/build/python
>> && /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.51.0=
-r0/recipe-sysroot-native/usr/bin/python3-native/python3
>> setup.py build
>> | Traceback (most recent call last):
>> |   File "/mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native=
/1.51.0-r0/build/python/setup.py",
>> line 24, in <module>
>> |     from setuptools import setup, Extension
>> | ModuleNotFoundError: No module named 'setuptools'
>> | ninja: build stopped: subcommand failed.
>> | WARNING: /mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-nativ=
e/1.51.0-r0/temp/run.do_compile.2200023:167
>> exit 1 from 'eval ${DESTDIR:+DESTDIR=3D${DESTDIR} } cmake --build
>> '/mnt/b/yoe/master/build/tmp/work/x86_64-linux/nghttp2-native/1.51.0-r=
0/build'
>> "$@" -- ${EXTRA_OECMAKE_BUILD}'
>>
>>
>>
>> On Sat, Jan 28, 2023 at 12:03 AM Changqing Li
>> <changqing.li@eng.windriver.com> wrote:
>>> On 1/20/23 09:48, Changqing Li wrote:
>>>> On 1/16/23 05:30, Alexandre Belloni wrote:
>>>>> CAUTION: This email comes from a non Wind River email account!
>>>>> Do not click links or open attachments unless you recognize the
>>>>> sender and know the content is safe.
>>>>>
>>>>> On 13/01/2023 16:04:42+0800, Changqing Li wrote:
>>>>>> On 1/5/23 22:09, Alexandre Belloni wrote:
>>>>>>> CAUTION: This email comes from a non Wind River email account!
>>>>>>> Do not click links or open attachments unless you recognize the
>>>>>>> sender and know the content is safe.
>>>>>>>
>>>>>>> This fails on the AB:
>>>>>>>
>>>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds=
/4580/steps/14/logs/stdio
>>>>>>>
>>>>>> Hi, Alexandre
>>>>>>
>>>>>> I need some help to debug this issue.
>>>>>>
>>>>>> I cannot reproduce this issue on my host. First,  the gcc command
>>>>>> used to
>>>>>> build the binary conftest will
>>>>>>
>>>>>> have as-needed enabled by default,  so actually,  these libs will
>>>>>> not be
>>>>>> linked, and runtime check will passed.
>>>>>>
>>>>>> Refer the command:
>>>>>>
>>>>>> gcc -o conftest
>>>>>> -isystem/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7=
.87.0-r0/recipe-sysroot-native/usr/include
>>>>>> -pipe -Werror-implicit-function-declaration -g -O2 -std=3Dgnu89 -p=
edantic
>>>>>> -Wall -W -Wpointer-arith -Wwrite-strings -Wunused -Wshadow -Winlin=
e
>>>>>> -Wnested-externs -Wmissing-declarations -Wmissing-prototypes
>>>>>> -Wno-long-long
>>>>>> -Wbad-function-cast -Wfloat-equal -Wno-multichar -Wsign-compare -W=
undef
>>>>>> -Wno-format-nonliteral -Wendif-labels -Wstrict-prototypes
>>>>>> -Wdeclaration-after-statement -Wold-style-definition
>>>>>> -Wstrict-aliasing=3D3
>>>>>> -Wcast-align -Wtype-limits -Wold-style-declaration
>>>>>> -Wmissing-parameter-type
>>>>>> -Wempty-body -Wclobbered -Wignored-qualifiers -Wconversion
>>>>>> -Wno-sign-conversion -Wvla -ftree-vrp -Wdouble-promotion -Wformat=3D=
2
>>>>>> -Warray-bounds=3D2 -Wshift-negative-value -Wshift-overflow=3D2
>>>>>> -Wnull-dereference -fdelete-null-pointer-checks -Wduplicated-cond
>>>>>> -Wunused-const-variable -Wduplicated-branches -Wrestrict -Walloc-z=
ero
>>>>>> -Wformat-overflow=3D2 -Wformat-truncation=3D2 -Wimplicit-fallthrou=
gh=3D4
>>>>>> -Wno-system-headers
>>>>>> -isystem/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7=
.87.0-r0/recipe-sysroot-native/usr/include
>>>>>> -I/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-=
r0/recipe-sysroot-native/usr/lib/..//include
>>>>>> -I/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-=
r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include
>>>>>>
>>>>>> -DOPENSSL_SUPPRESS_DEPRECATED
>>>>>> -I/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-=
r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include
>>>>>> -L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-=
r0/recipe-sysroot-native/usr/lib
>>>>>> -L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-=
r0/recipe-sysroot-native/lib
>>>>>>
>>>>>> -Wl,--enable-new-dtags
>>>>>> -Wl,-rpath-link,/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-=
native/7.87.0-r0/recipe-sysroot-native/usr/lib
>>>>>> -Wl,-rpath-link,/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-=
native/7.87.0-r0/recipe-sysroot-native/lib
>>>>>> -Wl,-rpath,/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-nativ=
e/7.87.0-r0/recipe-sysroot-native/usr/lib
>>>>>> -Wl,-rpath,/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-nativ=
e/7.87.0-r0/recipe-sysroot-native/lib
>>>>>>
>>>>>> -Wl,-O1 -Wl,--allow-shlib-undefined
>>>>>> -Wl,--dynamic-linker=3D/mnt/lincd/build/tmp-glibc/sysroots-uninati=
ve/x86_64-linux/lib/ld-linux-x86-64.so.2
>>>>>> -L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-=
r0/recipe-sysroot-native/usr/lib/..//lib
>>>>>> -L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-=
r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib
>>>>>> -L/mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-=
r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib
>>>>>>
>>>>>> conftest.c   -lnghttp2 -lssl -lcrypto -lssl -lcrypto -lz
>>>>>>
>>>>>>
>>>>>> I also tried to add "-Wl,--no-as-needed" in above comand, and
>>>>>> manually run
>>>>>> it,  then conftest will link those libraries. These libraries can
>>>>>> also be
>>>>>> found at runtime
>>>>>>
>>>>>> since these libraries will be in recipe-sysroot-native.
>>>>>>
>>>>>> $/mnt/yocto/test/tmp/work/x86_64-linux/curl-native/7.87.0-r0/build=
# ldd
>>>>>> conftest
>>>>>>       linux-vdso.so.1 (0x00007ffd447c1000)
>>>>>>       libnghttp2.so.14 =3D>
>>>>>> /mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0=
/recipe-sysroot-native/usr/lib/libnghttp2.so.14
>>>>>> (0x00007f6bd36af000)
>>>>>>       libssl.so.3 =3D>
>>>>>> /mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0=
/recipe-sysroot-native/usr/lib/libssl.so.3
>>>>>> (0x00007f6bd3606000)
>>>>>>       libcrypto.so.3 =3D>
>>>>>> /mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0=
/recipe-sysroot-native/usr/lib/libcrypto.so.3
>>>>>> (0x00007f6bd31cf000)
>>>>>>       libz.so.1 =3D>
>>>>>> /mnt/lincd/build/tmp-glibc/work/x86_64-linux/curl-native/7.87.0-r0=
/recipe-sysroot-native/usr/lib/libz.so.1
>>>>>> (0x00007f6bd31b5000)
>>>>>>       libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007f6bd2=
fb9000)
>>>>>>       libpthread.so.0 =3D> /lib/x86_64-linux-gnu/libpthread.so.0
>>>>>> (0x00007f6bd2f96000)
>>>>>>       libdl.so.2 =3D> /lib/x86_64-linux-gnu/libdl.so.2
>>>>>> (0x00007f6bd2f90000)
>>>>>> /mnt/lincd/build/tmp-glibc/sysroots-uninative/x86_64-linux/lib/ld-=
linux-x86-64.so.2
>>>>>> =3D> /lib64/ld-linux-x86-64.so.2 (0x00007f6bd36e6000)
>>>>>> $/mnt/yocto/test/tmp/work/x86_64-linux/curl-native/7.87.0-r0/build=
#
>>>>>> ./conftest
>>>>>>
>>>>>>
>>>>>> This should be an host related issue,  Does the worker
>>>>>> "debian11-ty-3" means
>>>>>> that this build is built on debian11 docker or debian11 host? Than=
ks.
>>>>> This is a debian 11 host.
>>>> Hi, Alex
>>>>
>>>> I cannot reproduce this with debian 11 docker image.
>>>>
>>>> $ cat /etc/os-release
>>>> PRETTY_NAME=3D"Debian GNU/Linux 11 (bullseye)"
>>>> NAME=3D"Debian GNU/Linux"
>>>> VERSION_ID=3D"11"
>>>> VERSION=3D"11 (bullseye)"
>>>> VERSION_CODENAME=3Dbullseye
>>>> ID=3Ddebian
>>>> HOME_URL=3D"https://www.debian.org/"
>>>> SUPPORT_URL=3D"https://www.debian.org/support"
>>>> BUG_REPORT_URL=3D"https://bugs.debian.org/"
>>>>
>>>> configure:33927: checking run-time libs availability
>>>> configure:33983: gcc  -o conftest
>>>> -isystem/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0=
/recipe-sysroot-native/usr/include
>>>> -pipe -Werror-implicit-function-declaration -O2 -Wno-system-headers
>>>> -isystem/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0=
/recipe-sysroot-native/usr/include
>>>> -I/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recip=
e-sysroot-native/usr/lib/..//include
>>>> -I/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recip=
e-sysroot-native/usr/lib/pkgconfig/../../../usr/include
>>>> -DOPENSSL_SUPPRESS_DEPRECATED
>>>> -I/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recip=
e-sysroot-native/usr/lib/pkgconfig/../../../usr/include
>>>> -L/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recip=
e-sysroot-native/usr/lib
>>>> -L/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recip=
e-sysroot-native/lib
>>>> -Wl,--enable-new-dtags
>>>> -Wl,-rpath-link,/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7=
.87.0-r0/recipe-sysroot-native/usr/lib
>>>> -Wl,-rpath-link,/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7=
.87.0-r0/recipe-sysroot-native/lib
>>>> -Wl,-rpath,/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0=
-r0/recipe-sysroot-native/usr/lib
>>>> -Wl,-rpath,/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0=
-r0/recipe-sysroot-native/lib
>>>> -Wl,-O1 -Wl,--allow-shlib-undefined
>>>> -Wl,--dynamic-linker=3D/mnt/yocto/build/tmp/sysroots-uninative/x86_6=
4-linux/lib/ld-linux-x86-64.so.2
>>>> -L/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recip=
e-sysroot-native/usr/lib/..//lib
>>>> -L/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recip=
e-sysroot-native/usr/lib/pkgconfig/../../../usr/lib
>>>> -L/mnt/yocto/build/tmp/work/x86_64-linux/curl-native/7.87.0-r0/recip=
e-sysroot-native/usr/lib/pkgconfig/../../../usr/lib
>>>> conftest.c -lnghttp2 -lssl -lcrypto -lssl -lcrypto -lz  >&5
>>>> configure:33983: $? =3D 0
>>>> configure:33983: ./conftest
>>>> configure:33983: $? =3D 0
>>>> configure:33985: result: fine
>>>>
>>>>
>>>> Is it possible to login the autobuilder host to check this?
>>> Hi, Alex, Richard
>>>
>>> Could you help to give some suggestions to debug this issue?
>>>
>>> Thanks
>>>
>>> Changqing
>>>
>>>>
>>>> Regards
>>>>
>>>> Changqing
>>>>
>>>>>> Regards
>>>>>>
>>>>>> Changqing
>>>>>>
>>>>>>> | checking run-time libs availability... failed
>>>>>>> | configure: error: one or more libs available at link-time are n=
ot
>>>>>>> available run-time. Libs used at link-time: -lnghttp2 -lssl
>>>>>>> -lcrypto -lssl -lcrypto -lz
>>>>>>> | NOTE: The following config.log files may provide further
>>>>>>> information.
>>>>>>> | NOTE:
>>>>>>> /home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-10=
9066/tmp/work/x86_64-linux/curl-native/7.87.0-r0/build/config.log
>>>>>>> | ERROR: configure failed
>>>>>>> | WARNING: exit code 1 from a shell command.
>>>>>>> NOTE: recipe curl-native-7.87.0-r0: task do_configure: Failed
>>>>>>> ERROR: Task
>>>>>>> (virtual:native:/home/pokybuild/yocto-worker/oe-selftest-debian/b=
uild/meta/recipes-support/curl/curl_7.87.0.bb:do_configure)
>>>>>>> failed with exit code '1'
>>>>>>>
>>>>>>> On 29/12/2022 10:34:42+0800, Changqing Li wrote:
>>>>>>>> From: Changqing Li <changqing.li@windriver.com>
>>>>>>>>
>>>>>>>> After commit `ostree: replace libsoup-2.4 by curl`, ostree depen=
ds on
>>>>>>>> libcurl, but it needs http2 support, otherwise it will fail with
>>>>>>>> error:
>>>>>>>> OSTree:ERROR:../git/src/libostree/ostree-fetcher-curl.c:886:init=
iate_next_curl_request:
>>>>>>>> assertion failed (rc =3D=3D CURLM_OK): (1 =3D=3D 0)
>>>>>>>> | Bail out!
>>>>>>>> OSTree:ERROR:../git/src/libostree/ostree-fetcher-curl.c:886:init=
iate_next_curl_request:
>>>>>>>> assertion failed (rc =3D=3D CURLM_OK): (1 =3D=3D 0)
>>>>>>>>
>>>>>>>> Enable nghttp2 to fix above error.
>>>>>>>>
>>>>>>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>>>>>>> ---
>>>>>>>>     meta/recipes-support/curl/curl_7.86.0.bb | 6 +++---
>>>>>>>>     1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/meta/recipes-support/curl/curl_7.86.0.bb
>>>>>>>> b/meta/recipes-support/curl/curl_7.86.0.bb
>>>>>>>> index f5e3e7235d..6cee548f35 100644
>>>>>>>> --- a/meta/recipes-support/curl/curl_7.86.0.bb
>>>>>>>> +++ b/meta/recipes-support/curl/curl_7.86.0.bb
>>>>>>>> @@ -24,9 +24,9 @@ inherit autotools pkgconfig binconfig
>>>>>>>> multilib_header ptest
>>>>>>>>     # Entropy source for random PACKAGECONFIG option
>>>>>>>>     RANDOM ?=3D "/dev/urandom"
>>>>>>>>
>>>>>>>> -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv=
6',
>>>>>>>> d)} libidn openssl proxy random threaded-resolver verbose zlib"
>>>>>>>> -PACKAGECONFIG:class-native =3D "ipv6 openssl proxy random
>>>>>>>> threaded-resolver verbose zlib"
>>>>>>>> -PACKAGECONFIG:class-nativesdk =3D "ipv6 openssl proxy random
>>>>>>>> threaded-resolver verbose zlib"
>>>>>>>> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv=
6',
>>>>>>>> d)} libidn openssl proxy random threaded-resolver verbose zlib
>>>>>>>> nghttp2"
>>>>>>>> +PACKAGECONFIG:class-native =3D "ipv6 openssl proxy random
>>>>>>>> threaded-resolver verbose zlib nghttp2"
>>>>>>>> +PACKAGECONFIG:class-nativesdk =3D "ipv6 openssl proxy random
>>>>>>>> threaded-resolver verbose zlib nghttp2"
>>>>>>>>
>>>>>>>>     # 'ares' and 'threaded-resolver' are mutually exclusive
>>>>>>>>     PACKAGECONFIG[ares] =3D
>>>>>>>> "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
>>>>>>>> --
>>>>>>>> 2.25.1
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>> --
>>>>>>> Alexandre Belloni, co-owner and COO, Bootlin
>>>>>>> Embedded Linux and Kernel engineering
>>>>>>> https://bootlin.com
>>>>>>
>>>>> --
>>>>> Alexandre Belloni, co-owner and COO, Bootlin
>>>>> Embedded Linux and Kernel engineering
>>>>> https://bootlin.com
>>>>
>>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#176459): https://lists.openembedded.org/g/openemb=
edded-core/message/176459
>>> Mute This Topic: https://lists.openembedded.org/mt/95931602/1997914
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [raj.khem@gmail.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>

