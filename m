Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B4FC25B06
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 00:55:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.11436.1660524946242049936
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 17:55:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=LijTGtf0;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5226248fcf=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27F0qXFU006848
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 00:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=ZhVTph/Av2eI4ptKFMniTDopbS88+0SkH80Ihew+6ZI=;
 b=LijTGtf0MKxRZk8NEaKz/m4EHCU/gX1pGeD4ns+ASecdGxNfw1Mi3r7WAy/gVL8IuNDj
 DlPoCRup2TqIc17irtvxRQjzfMBCPNLHDfanHaQKhawh/4qoznhYrEU18hwRsISnhg4s
 ex20sJSoW6F1Ti1+XlstgzMIv9xhXAuV2C5anjA4PkV5jKTZyvip/GDRdnsut8Ngk40s
 qRvV+/jcQYLubUXCUnSINl9WDAy7oct8Q/oPpZaEiufVnazj+JfNcFncy4Tr0IpZc8zb
 ik0Vkm5eRjUDV/vR0HXw5ol/Dz8x9tY0DbOBT2L6pVEVMfbUN5tCatoxILmY8XlkWj/C AQ==
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2043.outbound.protection.outlook.com [104.47.74.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx160s9f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 00:55:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImdRwOs+IHv7oDcnpgQw2HF2mmbBdPjJnMVn5+F4mzQktGIBpAIxl86IqaW3UlkxO7aVi42YwwwBxP2tBgQvfeu8ulfS5N7N5BBlppnkSBpsVvePuevFyxh/ygN6aYJW877w2qIlBhQR5PbRR8yNYWToOlZpUSVlzvOATyHNG7wQpTv8jF+672/FnURQBrNELyZksgiQsWulrnGZArULDjGGiGpuK+rWnNhAX0OAKgCQ//tP7gDv6w8cgIoWcOWwUOz05yN1r4cpdqBaBUHsRYpcI62g3+JAJEcuPhmLkghayofwICk8skdqaAcOxQRIFJtnB25wR+HD4wSDv10WtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhVTph/Av2eI4ptKFMniTDopbS88+0SkH80Ihew+6ZI=;
 b=NNBJ6+4ctftjJcYuoLkUOFrMNVmkzDQw1FKDKnqk+doRCDzSfnvY3dDKxUwoKk6t5DFHyoIrmwh3k2uZqHCUiHcoO3luRZoyBFjo4JSzoUYVxBGcUoJZU6nX/pYHIYUYfXbkvJy1p8DoIsBpOBMcM3mADeR0ZMtU4ZQHIjojMz77Hy2mu+6fbCx3L0GvpU9WFkjdYqyWbJoG9CIdeWFv6ONaCUaSfYszaZxfz26i4OPWJ6468P8ViIalLrts5V8VxervntHF7cRP9vwP04pRO/qif4dX3jGagIW0SbQbyouHayLMPVp850TrmMfhpfxo3WyLuqkq2MPlGzs3wvCShw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BL0PR11MB3426.namprd11.prod.outlook.com (2603:10b6:208:32::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Mon, 15 Aug
 2022 00:55:41 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060%5]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 00:55:41 +0000
Message-ID: <c008089a-169c-f32f-6321-77eee4df1bba@windriver.com>
Date: Sun, 14 Aug 2022 20:55:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH] rust: update from 1.62.1 to 1.63.0
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <170B5D557FC1DE54.3142@lists.openembedded.org>
 <8ca96140-85dd-341f-c615-16be619bfea0@windriver.com>
In-Reply-To: <8ca96140-85dd-341f-c615-16be619bfea0@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BYAPR02CA0066.namprd02.prod.outlook.com
 (2603:10b6:a03:54::43) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f28561aa-b8cb-42ff-98b9-08da7e58e092
X-MS-TrafficTypeDiagnostic: BL0PR11MB3426:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vS5TOYe3fZwo1E1r9yttOGHefAzY6Xm++dNMsZ5YD0DQU9R5kCO0Y419/SYstmNNy3UlzbReGjhOOhnutzKWOXuFYdgB0TUqavNcKpdgQqsZE7E9oav2MAyuShlRF37e2IvJF4Zn+h+5iymf57d2qq8P3wNSyU4bm229s09ayENQpOIpiv8kucD/ZULdmf5oKKnsEVl7itshXbzWr1+uUQLkQ0lgRJzfUDm2GcDN6GNKr3Z7GiHnYXCdJ/clgxnAoALVTPsD/sOMJyjWvPZzikOknjsKB+08E6a+mTe9bmYi46ql5gUjYXd03gv1I5veeZIO1jPF1poZg3oxeWs2Cp1XxqOUqzKDBhsSQcaO5CxXy0b1HUN9M2lqR43q/HOYHZ97vg5HMZaMYdzyJ+nzhFbDstKC+7UzgrAMxRk1TIBsOSEUlmqgHoxcKgYX/xLa8Bk6NjEvZmVonb9te+uJigTbddRPp82ReuupHmT2uxhFnDS3+f7W3E3mZaYDPBRKTkucUzRvdeIqiMVCY6Vwtuh3zM/dlJmTOYKNmyQUKDGuWHfmtdRxBZdJwj39s1kHH47j8/JEq4tjxPOdR6pqvu5zKmUulR1T2DnW06vzKJQgoHvvqOsws3zdZxTAdcuiJJ5eGaXO6p4Ursrd/3JLpAWCA5nDu33/eLIXPI1S9WUyfi2ML+IiFZ0w6RcgDFjPrU6rz5eI/UeIEcVuSifsSI4oJxOQJ/RMcy9fPDVjIn/OLFzfqjx3GzapJErO6CniX/mRMqF0L2z/vEXj8F328bx/UcjzGraJlyYuSrvlJLlTtooQFZa1KNsdF/PQ8MLW0fT71CwAl+L+tVnyA3oRUNi0pg3kMY1z2v7Kha03BlOAtH5MRUOoqNCDK9rFhyO7G1GSgtlthDS+JKcOOY+kRNhlZLS/dTgxN22gHPiEhfY1d4OwSXmJbfR+nc0AHFWn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(376002)(136003)(396003)(39840400004)(316002)(83380400001)(26005)(8676002)(478600001)(6512007)(186003)(6486002)(2616005)(36756003)(6916009)(31686004)(66556008)(66476007)(66946007)(8936002)(15650500001)(5660300002)(38350700002)(2906002)(6666004)(41300700001)(52116002)(53546011)(966005)(6506007)(86362001)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?em5qT2h1a1E0UGR2TG02bmM2T2R2VFE2RmZPTXBuaDBub0YyU2tNUHR6Qnli?=
 =?utf-8?B?ekRjTGtIN0dEa00rRHg1d01iYk1QMGowbzF4Z1p5UlpFU1NjNjZkZnM3Q3dq?=
 =?utf-8?B?a3UyNWRWUDF2eExSNTFXK25uTWlrdVNRWnBjblovSVU4Q1BldjhnRTNaa3kw?=
 =?utf-8?B?d2N4RVY5enNkQitac1prMW8wV3k3cldyajFlR0RpNkdSaFNVTC9WRE5PbXcv?=
 =?utf-8?B?VkdpRnA0NlVzZ0Y5T3BxSWNoTXZ2UElUSUN6ZFZySG1GanQ5OGNacFlZeVhl?=
 =?utf-8?B?ZWlTbGp6R2R1RXJwMHpsWDdvMmJWa0NpQVFGdGZiOExhMjkxTWNKWlQ1aEhw?=
 =?utf-8?B?Y0luVzN1ckkyM3JTNGVkWmlIQ2RTSXNkZVNBbmQ4VGZMUEpkTElOWWU0dVNt?=
 =?utf-8?B?WTM3eFoya21Ed3VNTHVZb1NBL2tYS1hQbjZueDlQQ3RYT0U5RWlHZnFLY0NN?=
 =?utf-8?B?L2o4VGVhZk9PYVJtOFB1ZDVmRmY4RG1TTW01WS9VZVNwVG04bVdOZWZ5RzQy?=
 =?utf-8?B?U3l6QVlacTM2NmlRUWFzdXhPK1F1N1pKYk0vcmV3R0IxTzZoMmhJc1pkdzZ0?=
 =?utf-8?B?ZktIcWRqZWd1YmJEdXlLU2UxR05pdExqSDdpR3JJZnV2ME9GMm5aTkNmQytl?=
 =?utf-8?B?dXpkSDdsWnBSa3JkQXJNMnNEKy9hRktzY2JpN2FKWjRhRGUvUHJXZW45R1Yy?=
 =?utf-8?B?U2Y1YlZ3TnArd3RsSGZSVWliQVNQTmxiekszdWp0Y3h4dlhmSEF0bjBZZHh4?=
 =?utf-8?B?UXVKWEZuNVpORGpaSlhzMXAzTlQ0V0c1cUt1Sk5KS1pEVENNUjQ2WHgxaGFv?=
 =?utf-8?B?WWxMRXVmbVdrQXo5ejdhbnhTMXpLSmVPU2hDMTNPekhXV3NsRFdvdEtxRVQw?=
 =?utf-8?B?SWdEMG04ZWhIYlFMMUhYQWtxVERrM1I1WlJILzFFVFpoK1YyQm1HYUc0dEF6?=
 =?utf-8?B?Z1BKa0d4alF5UXRCV2Vyc2J3WHBJdTJ3QlFnQ3lYTENCRWIvK2w0d2tGQW01?=
 =?utf-8?B?bmZUY0hJcU9CQnloY1lWamo4Ry95NW5qVkpGNWlQRjlyVFZqREpOclJqRVd0?=
 =?utf-8?B?OTJOOWxuZ09kMWtLczBLVkx0Vyt0L282cXRYMklnaStnc0xGK25TbkRvQzJh?=
 =?utf-8?B?Q0c5ZEk0bFBhRkJmMVJyZHM1SXNmTHdFMzJZREZwL3Bhb3MyUS90MkpCLzAy?=
 =?utf-8?B?byszRDZid0JlR2FsbW9rd0lmT0UwT2RmVlFVY1lPZlhvcEZQOXZhMkNqR2k5?=
 =?utf-8?B?VnZsb2UxaDl4eGQ4QkdmL0JNUXlaRG9xK2xweUFkWXBRcnViWEJSdlgyc1Ri?=
 =?utf-8?B?a1pLeWkvYm9rTHZ5MlRvTTVHbUlSY08relFiTjd3amNodnRHbXdFTEpUV2Vq?=
 =?utf-8?B?TUExT2N4OHE3N3ZiRVhlbFdQVGovam5haEM1OGFMaGpOd2YvbG8wZW84eUFQ?=
 =?utf-8?B?TXRWZ01XYzB0M045TWRtd2xUQ3FUekNKZ2VybFhBUlcxMzV1VXRzZG1EZ2x0?=
 =?utf-8?B?T3R3bkE2NHpiREcyNG9kQW5TdHBoUFJ1eUljVlZPMlQzb2xTaDVWWW9oQTBI?=
 =?utf-8?B?K1FKdWZUQW5ROEhsNGFZRjRDZjh3WUdRa1dTRm1xZkN3Z0JwNlBWRHQ4TkhE?=
 =?utf-8?B?Z3IzK3NCWTlXMnpiTDhneXhuKzNhZTY3VWZ0RFpZditZL1lQN1krd2J3dDZI?=
 =?utf-8?B?YStXblV6MXU2SkxlUzhJaXlTUDZTQ3psVkFkbEF2WkNtblRHTW5HTGNBWHQz?=
 =?utf-8?B?bHdjaTk2aDNRSU1MQlBwNUtqMTFBcjZ0U29KNkRCc1dQeFc1dm5HZERqcHZi?=
 =?utf-8?B?ZUNzQ0M5Rk9wdkI5Z2FxMmhQV0FXUi9Dbk9XWmc3bTdqNURXYTRBKzJUN0Zp?=
 =?utf-8?B?TDBiWkN2RmZXKzFudjc0YTltd2xzYTlJTE9RRXJ2T1cyWGFJZlpFZ0NRRkNJ?=
 =?utf-8?B?RUN1N2oxYWIweXRBL1QxY3R3dzRTb01MUFZIV2ZHNUIxbkZ4UVk2R1pwRWt4?=
 =?utf-8?B?ZzI4dS8zdERvMlozTVJXT3YyUDg0ZGF6NkhWMmE5eEx5U1pmYm51Qk9jeFZK?=
 =?utf-8?B?YnZZYlFpbUNyZG1kZW94bDhwMEQ0MktJWHNkclU5cXpOb0p3a2IxSTNITi9w?=
 =?utf-8?B?UklGT3hvcU1WZ1drZ1Z6TXM1M1hEOWRFMU1EYmVLL3dnYjRIL1l5RnBEaitt?=
 =?utf-8?B?RUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f28561aa-b8cb-42ff-98b9-08da7e58e092
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 00:55:41.7521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ex6XwkNttFHUH3XW7qxHM7/GoWrBRx9icr1EstKKkQ+TBOF4ZAlBmvsGAQRH5aLBkdpfcUCXaczFt7UejZrL1y5LPHzLU2jaLhVNcYrCX4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3426
X-Proofpoint-ORIG-GUID: kT1dHUUJrP2p33QAFpOcTJWRYggSEKfS
X-Proofpoint-GUID: kT1dHUUJrP2p33QAFpOcTJWRYggSEKfS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-14_16,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=919 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208150001
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 27F0qXFU006848
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 00:55:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169341

On 2022-08-14 20:35, Randy MacLeod wrote:
> On 2022-08-14 20:31, Randy MacLeod wrote:
>> Release notes:
>> =C2=A0=C2=A0=C2=A0 https://blog.rust-lang.org/2022/08/11/Rust-1.63.0.h=
tml
>>
>> This is a standard upgrade aside from the path for the
>> stage2 tools binaries (clippy, et.al.) changing.
>

Please ignore this patch.

I checked the logs and 'rustfmt' isn't being built for some machines
as shown below.


>
> I didn't check what the build status was before but
> so far I have:
>
> BUILDALL-QEMU LOG FOR rust
> START TIME: 2022-08-14_13:30:45
> HOSTNAME: ala-lpggp3
> HOST OS: Ubuntu 18.04.6 LTS
> HOST KERNEL: 5.4.0-122-generic
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUILD RESULTS:
> [glibc]
> FAIL: qemuriscv32
cp: cannot stat=20
'build/x86_64-unknown-linux-gnu/stage2-tools/riscv32-poky-linux-gnu/relea=
se/rustfmt':=20
No such file or directory

> PASS: qemuarmv5
> FAIL: qemumips

and:

cp: cannot stat=20
'build/x86_64-unknown-linux-gnu/stage2-tools/mips-poky-linux-gnu/release/=
rustfmt':=20
No such file or directory


It's odd that cargo-clippy and clippy-driver are present:

ls=20
.../tmp/work/mips32r2-poky-linux/rust/1.63.0-r0/rustc-1.63.0-src/build/x8=
6_64-unknown-linux-gnu/stage2-tools/mips-poky-linux-gnu/release/=20

build=C2=A0 cargo-clippy=C2=A0 cargo-clippy.d=C2=A0 clippy-driver clippy-=
driver.d=C2=A0=20
deps=C2=A0 examples=C2=A0 incremental


../Randy

> PASS: qemux86-64
> PASS: qemuarm64
> PASS: qemumips64
> ...
>
> It's still running.
>
> I'll send the complete output tomorrow.
>
>
> ../Randy
>
>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>> ---
>> =C2=A0 meta/conf/distro/include/tcmode-default.inc=C2=A0=C2=A0 |=C2=A0=
 2 +-
>> =C2=A0 .../{cargo_1.62.1.bb =3D> cargo_1.63.0.bb}=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 0
>> =C2=A0 ...ibstd-rs_1.62.1.bb =3D> libstd-rs_1.63.0.bb} |=C2=A0 0
>> =C2=A0 ....62.1.bb =3D> rust-cross-canadian_1.63.0.bb} |=C2=A0 0
>> =C2=A0 ...ust-llvm_1.62.1.bb =3D> rust-llvm_1.63.0.bb} |=C2=A0 0
>> =C2=A0 meta/recipes-devtools/rust/rust-snapshot.inc=C2=A0 | 24 +++++++=
++----------
>> =C2=A0 meta/recipes-devtools/rust/rust-source.inc=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
>> =C2=A0 .../rust/{rust_1.62.1.bb =3D> rust_1.63.0.bb}=C2=A0=C2=A0 |=C2=A0=
 4 ++--
>> =C2=A0 8 files changed, 16 insertions(+), 16 deletions(-)
>> =C2=A0 rename meta/recipes-devtools/cargo/{cargo_1.62.1.bb =3D>=20
>> cargo_1.63.0.bb} (100%)
>> =C2=A0 rename meta/recipes-devtools/rust/{libstd-rs_1.62.1.bb =3D>=20
>> libstd-rs_1.63.0.bb} (100%)
>> =C2=A0 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.62.1.b=
b =3D>=20
>> rust-cross-canadian_1.63.0.bb} (100%)
>> =C2=A0 rename meta/recipes-devtools/rust/{rust-llvm_1.62.1.bb =3D>=20
>> rust-llvm_1.63.0.bb} (100%)
>> =C2=A0 rename meta/recipes-devtools/rust/{rust_1.62.1.bb =3D>=20
>> rust_1.63.0.bb} (92%)
>>
>> diff --git a/meta/conf/distro/include/tcmode-default.inc=20
>> b/meta/conf/distro/include/tcmode-default.inc
>> index 31c9dd5065..52d0f7a79f 100644
>> --- a/meta/conf/distro/include/tcmode-default.inc
>> +++ b/meta/conf/distro/include/tcmode-default.inc
>> @@ -27,7 +27,7 @@ GOVERSION ?=3D "1.19%"
>> =C2=A0 # This can not use wildcards like 8.0.% since it is also used i=
n=20
>> mesa to denote
>> =C2=A0 # llvm version being used, so always bump it with llvm recipe=20
>> version bump
>> =C2=A0 LLVMVERSION ?=3D "14.0.6"
>> -RUSTVERSION ?=3D "1.62%"
>> +RUSTVERSION ?=3D "1.63%"
>> =C2=A0 =C2=A0 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
>> =C2=A0 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
>> diff --git a/meta/recipes-devtools/cargo/cargo_1.62.1.bb=20
>> b/meta/recipes-devtools/cargo/cargo_1.63.0.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/cargo/cargo_1.62.1.bb
>> rename to meta/recipes-devtools/cargo/cargo_1.63.0.bb
>> diff --git a/meta/recipes-devtools/rust/libstd-rs_1.62.1.bb=20
>> b/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/rust/libstd-rs_1.62.1.bb
>> rename to meta/recipes-devtools/rust/libstd-rs_1.63.0.bb
>> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.62.1.bb=20
>> b/meta/recipes-devtools/rust/rust-cross-canadian_1.63.0.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/rust/rust-cross-canadian_1.62.1.bb
>> rename to meta/recipes-devtools/rust/rust-cross-canadian_1.63.0.bb
>> diff --git a/meta/recipes-devtools/rust/rust-llvm_1.62.1.bb=20
>> b/meta/recipes-devtools/rust/rust-llvm_1.63.0.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/rust/rust-llvm_1.62.1.bb
>> rename to meta/recipes-devtools/rust/rust-llvm_1.63.0.bb
>> diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc=20
>> b/meta/recipes-devtools/rust/rust-snapshot.inc
>> index 3bd7b07cef..b9d7edd672 100644
>> --- a/meta/recipes-devtools/rust/rust-snapshot.inc
>> +++ b/meta/recipes-devtools/rust/rust-snapshot.inc
>> @@ -1,25 +1,25 @@
>> =C2=A0 ## This is information on the rust-snapshot (binary) used to bu=
ild=20
>> our current release.
>> -## snapshot info is taken from rust/src/stage0.txt
>> +## snapshot info is taken from rust/src/stage0.json
>> =C2=A0 ## Rust is self-hosting and bootstraps itself with a pre-built=20
>> previous version of itself.
>> =C2=A0 ## The exact (previous) version that has been used is specified=
 in=20
>> the source tarball.
>> =C2=A0 ## The version is replicated here.
>> =C2=A0 ## TODO: find a way to add additional SRC_URIs based on the=20
>> contents of an
>> =C2=A0 ##=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 earlier SRC_URI.
>> -RS_VERSION =3D "1.61.0"
>> -CARGO_VERSION =3D "1.61.0"
>> +RS_VERSION =3D "1.62.0"
>> +CARGO_VERSION =3D "1.62.0"
>> =C2=A0 =C2=A0 # TODO: Add hashes for other architecture toolchains as =
well.=20
>> Make a script?
>> -SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D=20
>> "270b07aa5f2de52255a117e1e587138d77375ce0d09a1d7fead085f29b3977e9"
>> -SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D=20
>> "21c4613f389ed130fbaaf88f1e984319f72b5fc10734569a5ba19e22ebb03abd"
>> -SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D=20
>> "9461727d754f865ef2a87479d40bbe4c5176f80963b7c50b7797bc8940d7a0a0"
>> +SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D=20
>> "addfae87b6b1b521d98a50fdc5120990888a51bb397100062e9c558267c67c77"
>> +SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D=20
>> "e7f71f4ef09334ddc9ec8cbf2f958d654e36f580c95f8fec6d5c816ce256dbd6"
>> +SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D=20
>> "815c63119a9cf0282ff240c6444b6f867238763ee3dea182f10837ae7dbbb1d4"
>> =C2=A0 -SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D=20
>> "57d60a519dbce12146849f7e72d55f3cffe9cdcbff8d58e90bb62d3c016bb5c0"
>> -SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D=20
>> "c996de6391e3ea94629fbc09b03bce186fcde345159f43ec95a82c500adb5e94"
>> -SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D=20
>> "a055e6cfd9b5f8938780db6179d2ef92990c714ce64278337d7edf3d29c8ab62"
>> +SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D=20
>> "dd5df8a92af3e5d49a1122b9561821ebd72a9317884a37ecddae041e652a7563"
>> +SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D=20
>> "0fa320a19d41dcfc592bc006f5e9eda8e3b972598a26c96ad64eedd868516df3"
>> +SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D=20
>> "475038ecacca9ff586cad2082d5d950544b0d581a2a287facc7d899aae488813"
>> =C2=A0 -SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D=20
>> "36c0ccff14c80419507561db050f9533f0abd43fc50f3ddb859c10df74b1c351"
>> -SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D=20
>> "dc54893d747e4f3330515caa75e404f78c6c5475a1216d1428f5e7ce1c2e9602"
>> -SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D=20
>> "09817011ff1ef4b7006387c7cabb6a059731792a9372533dec7d87e7f014444b"
>> +SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D=20
>> "d6678b7c971f3adbe7f820adae669d03a314468441e2907747c76eca98e0be92"
>> +SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D=20
>> "b66d0bc6dbfdc0d4b826f787ec4e772dea8e3d2015cecbe2105632d468c28dcb"
>> +SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D=20
>> "016257f1641693008068bd086fec66d68550d1778f6aea9d06c9b263fca392d5"
>> =C2=A0 =C2=A0 SRC_URI +=3D " \
>> https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Dr=
ust-std-snapshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components=20
>> \
>> diff --git a/meta/recipes-devtools/rust/rust-source.inc=20
>> b/meta/recipes-devtools/rust/rust-source.inc
>> index dbcef2cbc2..47bfbe98a7 100644
>> --- a/meta/recipes-devtools/rust/rust-source.inc
>> +++ b/meta/recipes-devtools/rust/rust-source.inc
>> @@ -1,5 +1,5 @@
>> =C2=A0 SRC_URI +=3D=20
>> "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;name=3Drust"
>> -SRC_URI[rust.sha256sum] =3D=20
>> "02066a93c2f6596cc046a897d5716c86e3607c1cd0f54db9a867ae8c8265072e"
>> +SRC_URI[rust.sha256sum] =3D=20
>> "8f44af6dc44cc4146634a4dd5e4cc5470b3052a2337019b870c0e025e8987e0c"
>> =C2=A0 =C2=A0 SRC_URI:append:class-target:pn-rust =3D " file://hardcod=
epaths.patch"
>> =C2=A0 SRC_URI:append:class-nativesdk:pn-nativesdk-rust =3D "=20
>> file://hardcodepaths.patch"
>> diff --git a/meta/recipes-devtools/rust/rust_1.62.1.bb=20
>> b/meta/recipes-devtools/rust/rust_1.63.0.bb
>> similarity index 92%
>> rename from meta/recipes-devtools/rust/rust_1.62.1.bb
>> rename to meta/recipes-devtools/rust/rust_1.63.0.bb
>> index 81923c3331..3081cd5ef3 100644
>> --- a/meta/recipes-devtools/rust/rust_1.62.1.bb
>> +++ b/meta/recipes-devtools/rust/rust_1.63.0.bb
>> @@ -43,7 +43,7 @@ rust_do_install:class-nativesdk() {
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${bindir}
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for i in cargo-clippy clippy-driver rus=
tfmt; do
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp build/${RUST_BUILD_SYS}=
/stage2-tools-bin/$i ${D}${bindir}
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp=20
>> build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release/$i=20
>> ${D}${bindir}
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chrpath -r "\$O=
RIGIN/../lib" ${D}${bindir}/$i
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
>> =C2=A0 @@ -60,7 +60,7 @@ rust_do_install:class-target() {
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${bindir}
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for i in cargo-clippy clippy-driver rus=
tfmt; do
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp build/${RUST_BUILD_SYS}=
/stage2-tools-bin/$i ${D}${bindir}
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp=20
>> build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release/$i=20
>> ${D}${bindir}
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chrpath -r "\$O=
RIGIN/../lib" ${D}${bindir}/$i
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#169339):=20
>> https://lists.openembedded.org/g/openembedded-core/message/169339
>> Mute This Topic: https://lists.openembedded.org/mt/93027065/3616765
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=20
>> [randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

--=20
# Randy MacLeod
# Wind River Linux


