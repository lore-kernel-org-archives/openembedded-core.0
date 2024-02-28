Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192FFC5478C
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 01:54:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3789.1709085286153348633
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 17:54:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=nJUR4e1w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=278829b580=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41S1F2oX024998
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 17:54:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=2BtXsj+wXfePjHeGIaX
	BDTFj+NVdvcI0qcbM4VDhjPk=; b=nJUR4e1whHF9niBESKXpzED7z5uPw2EosPW
	jbzgJM5urESE2k3/wusB8Gjg8D8Q97Bb36zBoD92bSuazTy2i66kVfUvF62Od7gp
	O5tmIgrCOS6cMlSStZobQmG+M2pn/TL2b9N+UPFjy3bqSoagFs1zMSRXYQEtxk+H
	aBKj81Ul9nM71bUyzlWVPi4lfvXL2nvVYRTL9bciRJajiQMc18ytK7HvkY0ZEW0m
	k1ok+g4N0H4ahE1Z932C08rW8I/+7gP1anxTl3poUZZL8JmzJ6n1WJyax+at14zD
	6Rs8IF6D1A38l9aIRth5yY2ZZ1voQZTp47WEg7ogrz/E4W5tpAg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfgumkfue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 17:54:45 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41S1sjeL016101;
	Tue, 27 Feb 2024 17:54:45 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfgumkfud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 17:54:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aoYcNz78OF3F5LElZFi2yzcbZHNE74bHdmrqWyoecqqS6aQ+T7F3HnW4GxeCfanT2H4C5MCtAZiKQv0xtkpkQNO+/dkOotj6qH+Ew+d2XT4KlKyQGe4oXl0ScHd19mk4gI1HxlfNnIV3vlDVYsytvN7N5oXwdCCo1fKiY5jANeGmq13/baM+GXpkd9LRaLKOUTOrhMxFT7xvLKqgOrlihkaWFMTwn/sbsdmAIULeucqdQlj8pkS9YmZ9HEzz9N/tVJxNDeFxtw05+amUighTCP85Jo2gTPG2jR4KSjjLgv5OCcPVm5nnuSgv9lfAxhVX6hEIklZEWoi/o4CfOQOq2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BtXsj+wXfePjHeGIaXBDTFj+NVdvcI0qcbM4VDhjPk=;
 b=jbOYzEydVEuFTkqKOiNkVBZ0scb8r1fWxUZlBgXOtatDnO7c0T7QO/QbhnXWJCHz+U1CedwUoxMGRxlWumMKcTv8xq9S0ifgxbfni7O1C7NJdq2YXs+LOt7maAKUyhnRZVcwmGEwk7CsbNS5uqDakD832RQ4mxzSeOcF7kWFGLIuOym2gxqOyfknrygwPE5bbASrteTcfk3bn5excm7sRHoOt0qZtMhWRQWYQSsxc9xnkn598Ws8gpF3W5XNSTSQ0SVj7yI0OvnxM/odDauohNy5ZOk8KTou+nQZLb+OFMeLGtm71fcjS0O2X60MEwXQ3X3qRKWa8laB8OgrPsYrTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MN2PR11MB4694.namprd11.prod.outlook.com (2603:10b6:208:266::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Wed, 28 Feb
 2024 01:54:42 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::d168:2e49:fb61:dc21%7]) with mapi id 15.20.7339.024; Wed, 28 Feb 2024
 01:54:41 +0000
Content-Type: multipart/alternative;
 boundary="------------Wtz0Z2DJKQiItzQHa0jjIWxe"
Message-ID: <c00dd52f-0404-4c79-b579-198426f0a772@windriver.com>
Date: Wed, 28 Feb 2024 09:54:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V6] rxvt-unicode: Fix installing of terminfo
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240227071004.2402854-1-changqing.li@windriver.com>
 <CANNYZj-1oTYiqqMcN1S3q8M6WrWr8-TBf0EB2aEorsKK72qCcg@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <CANNYZj-1oTYiqqMcN1S3q8M6WrWr8-TBf0EB2aEorsKK72qCcg@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0182.apcprd04.prod.outlook.com
 (2603:1096:4:14::20) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MN2PR11MB4694:EE_
X-MS-Office365-Filtering-Correlation-Id: bcbaf4bc-812f-4868-d75a-08dc38003a9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fFmA72zLAODxnmN5/Az1Ozg5EyHkAxvkV5cKbuS5LAh9zv6/EkWv3EEB123zZTeS2zks0dMnBHz0enCWMRMplH95sJCkgpUIEtCH+t/820637oLqZ2i21CvgB/aAlMelMp6DnmtZhmFo8GiQ2Lw5iEAaVZiQBYw2xpoKoRHh1kYx1LhZeEtVbEbLes+Ewv1Zb0xGD+NjWzUE3fkpdZ0wKZCoQ1nwiC/mp/3c3lLHH+cfjoFwY2/2l9re830Dl/E8oZYq3q3Sj/kxBuQZX7HXQSMw323C/clKvnZqdfc4ofGP71BothddkmIvgxD9bG4WhK7K0Zr9ZsjiPzu3z15gVLuF4Cz68naq+B8hsUZwdT0AmolXJMDNGBqw+EFAJj75/FlBlUW60ut9hHXipoDVlxXp9B44tvGNCNzNuJQKWDQ3W4j8Fcvd0pq12JlcopdCvqjQqVANSWN0EM0cV8b4eZTp4m9n7nlu9R27jhA7M/7+X8K2f8XrXCQhsSi6ZXOS3vw0U7+qbAu8iGCzZ8NbUrspcOwn44IRqfdUa46Qw7Yj+A1z+xMrhcRDRA70bWuTRQW3MyPSOCLrRdQz56EeLzFez35JKZ4pWidPMNFhcosdSigp7jJS5FUIgY9CsDLO33HRwUdYZI/X9SVK/xVK7u4SSM8CDmAQ9klKx+LADNc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cFdHMmVWMldyODVuV0lMR0tNQjI2eVp0UXVOVEJka0JxQzE4b0tkdlJUK3NQ?=
 =?utf-8?B?YW9MMDhzRWlUcnJQZzIvRUhjaWJGOXludEZFTStreDV0M2N3d3V2RW5GamRt?=
 =?utf-8?B?T1pId3hVK3dvVnlrTkRCQjFGaHJKMmxaTTJmbkpDazJLZXh0VTBWNUdjRC9D?=
 =?utf-8?B?ak91L1lmOVk2MHovRWdUY1Byai9rc0hKOWtJY3BUOHpONXhUVTY3dnkyOC81?=
 =?utf-8?B?TXVCZllMbUxZUEY4bk16THNxdTg1NCt1eTVJUzFYSmhWNXBmTkRoQ2NoM3E3?=
 =?utf-8?B?K3FpQ2dPbjZtb1RsYmdSZSt4cS95cE5UZjhHRnJEdEZCS0NyQWN5bWs3d2xh?=
 =?utf-8?B?OTVlbXdOZHg3SGo0MUlxeUJkdHpiMGtTemo5dWdEY3M5SjJpZTgyY1BTQVR3?=
 =?utf-8?B?TzFzcDNDQkRGTm1OZXFQZ2Q4NW5uMXJER1RwK0h3NGxhRS81MnBkYXMvamd5?=
 =?utf-8?B?ekJ2N2NYSFhwRnZ5eWpHWE5vZ05lQWRVYVB3UjJOMHZHWUFtVzM5cGxWK0xS?=
 =?utf-8?B?NTJKV253cWFVOXJBU1BUOUNZUHhhLzdEMmkzUzRFaE9iKzI0UXRxdUdMYytZ?=
 =?utf-8?B?bUR6ejNvQWNsOHZrRENEUVB6aHZZUnBvRnUzY3BZcTdCMU02RnhyY2FMYkVw?=
 =?utf-8?B?YURDMjFZWHBmRlcxYTVqQkFRSzZqVFRINFIweUlZeFR6RXAzOVdLT1A3TGtT?=
 =?utf-8?B?bEl3V2hESG1ETUs5NUtNcmxiY2pLeFp3a04zQlI1OGh0di9YbFV5MlFSa2tx?=
 =?utf-8?B?aHhVTUlIM1V4VkFKK3R3SEdUNkg4dm9uK3MzTzk5c0lkS2FtdEtXRlFwNGQ2?=
 =?utf-8?B?Tzl0L2FKNGozazI0a3RuRnVmYWtsZkVyZFlhRmFJaTJYTThEYnhvNE9mU3Nt?=
 =?utf-8?B?OGVKS1AxWFZwRHZaaXVTbjlZdUpkVmhWWHNPU2EzRmduRm0rUUt4dmtXL3dF?=
 =?utf-8?B?cjBKTnhYb0ViNTg2Z3IzQjByK3YwdVE3MGVTUmZYcHZORUQzcEg1SW00RFJN?=
 =?utf-8?B?N2NzblBMRkZhZndIVTJleEdBb3ZuR29tU0l2NzNldkppZDlDZFYzZTA5ZXRy?=
 =?utf-8?B?Q3RucWwyRitIY3NrYjAxd2RleWZOVGtkR3daell5NTczeWVabEdTbGZldTIw?=
 =?utf-8?B?SDQxdmhTMFBkQ1ZuRFByOWd6Zlg1aElZZXZSSENWelp5UHhoQzBMTU5vcks4?=
 =?utf-8?B?VG85YmZOYnlFM2RqYVFUZkZXOGY0NkIyYnBDR2NDcnhxWU9GT2huQ2l0TTNU?=
 =?utf-8?B?RVplWFJBSHJkdkxCQTFSdHJMQ09lMmxpRjZxck5oNng3WW1iL2JmcTNPSE15?=
 =?utf-8?B?NHJGSFo3R2YybXlaYlVkR0o4M3Nlc0hoa2RzaDQrc0NHVlpleFQ3NWtTek1r?=
 =?utf-8?B?SEo3REdSQmJqeEVQQjd3b3hkSzZhd1BNQlU2SWZtRDkzVGgvTXB6WGJPejdO?=
 =?utf-8?B?dzROMElDUWgxZjRXWEh4QmhEVzdjUEo4STdZRHBwa2NiREFVUjRqb2ZYNldD?=
 =?utf-8?B?Q3ppbE95RDJzNFFBdC8xOEFUUy81endnSWlVbXFKcFZ0em5kd2k2UjRFWS9a?=
 =?utf-8?B?YlN5WEFHcTBOVk1uL24waFMrai9XN2diWGhTMDQvemxQdWpRLzVTd3lNN05Q?=
 =?utf-8?B?Q3NXZlRMbWdyOHErdUxRQStsb3F0S1FHeFFUSTRQMEZDK0s5bmQ1Zyt2YjEr?=
 =?utf-8?B?QXU5NWFqeHp1bk1zWkk1NnBqR3EvZUppVGdpZ29xalRmZjRkUDRiWnlKYk1S?=
 =?utf-8?B?dFJ1NDBNRVNrWmVUVWNibVJvZVhvVTdLV2l3RGl3ZDRCaFJMMDdHS25mUlYy?=
 =?utf-8?B?dHQwL3JWYkd1dkpTVnVFd3FPdzY3Nk9LWSt2ZGY0WWk2SWZOa2RJb0FlY01E?=
 =?utf-8?B?MTlVcVRVellCQStBb014VDFrODI2eXZJZmtOZjZPRGRZWDU3L2o2NmJPenZm?=
 =?utf-8?B?ZFNiaEFkZ2tsanZ1RkM5Y09sMndTZFNnTFhRY09Bd0dIKzA3TGE1anZLbmd6?=
 =?utf-8?B?YmhxTTk1dE5oaFFHUTREUEZWMVZZWTRBbUhFQmsyYVMreEwzcUsyZ05lQTlt?=
 =?utf-8?B?OXQzSGJDZFllSGU3Q2xnTDhWUkQ1RFozVk9hUGIrazAyRisrcFhUTXdPVFlk?=
 =?utf-8?B?bC84SU5oMnFxUzN0eTltSS83U3VZZWl5L2pqNVNNR0tDWWVTVm0wQVZ5YTJx?=
 =?utf-8?B?emc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbaf4bc-812f-4868-d75a-08dc38003a9b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 01:54:41.7623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6f9afbIsUhNHWfF8+eUSfp/GqlfFt824Gszaj6nsoSSr6/aCVxg0PSqDWvMiIRGuX2yCpGLPp3dgWSJ8QF9l/axWgm3aAHYkEIfwHvtL3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4694
X-Proofpoint-ORIG-GUID: YS0mt023Xh61I3OWlOr_GZJMIZY_779y
X-Proofpoint-GUID: gKvYJYHaUA9cvAzK57ktUXeXc4jYe1Bc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_01,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402280013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 01:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196318

--------------Wtz0Z2DJKQiItzQHa0jjIWxe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41S1F2oX024998


On 2/27/24 17:37, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, 27 Feb 2024 at 08:10, Changqing Li
> <changqing.li@eng.windriver.com>  wrote:
>> +
>> +       install -d ${D}/${sysconfdir}
>> +       install -m 0644 ${S}/doc/etc/rxvt-unicode.terminfo ${D}/${sysc=
onfdir}/rxvt-unicode.terminfo
>> +}
>> +
>> +RDEPENDS:${PN} =3D "ncurses-tools"
>> +PACKAGE_WRITE_DEPS +=3D "qemu-native"
>> +pkg_postinst:${PN} () {
>> +       if [ -n "$D" ]; then
>> +               if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-user=
mode', 'true', 'false', d)}; then
>> +                       outdir=3D$(${@qemu_run_binary(d, '$D', '${bind=
ir}/tic')} -D 2>&1 | sed -n "2p" | awk '{ print $2 }')
>> +                       ${@qemu_run_binary(d, '$D', '${bindir}/tic')} =
-x ${sysconfdir}/rxvt-unicode.terminfo -o $D$outdir
>> +               fi
>> +       fi
>>   }
> I would really prefer to make native tic do the right thing, if the
> only problem is that it installs the needed items into the wrong
> location.

Yes, the wrong location is the only problem. V4 patch is a way to make=20
native tic install to=C2=A0 a right location.

but this solution (hardcode output dir to $(DESTDIR)$(datadir)/terminfo)=20
is rejected by upstream.

if use V4 patch,=C2=A0 we need to make it an oe specific patch.


upstream said that to it is better to use target tic to generate the=20
terminfo to make sure ncurses in the

target environment can get the correct terminfo. That's why I changed to=20
use target tic. but we do will met

"some targets don't support usermode" problem.

So what's your suggestion about this? use V4 patch?

if you think the hardcode path $(DESTDIR)$(datadir)/terminfo) is not=20
good in v4,=C2=A0 I can do some change for V4.

Since native tic and target tic is from the same recipe, the TERMINFO=20
should be the same except native tic is under ${RECIPE_SYSROOT_NATIVE}.

how about like what I did in this patch,=C2=A0 get the native outputdir f=
rom=20
native tic, cut ${RECIPE_SYSROOT_NATIVE} to get target outputdir, then=20
pass it to nativetic .. -o=C2=A0 ${DESTDIR}${target outputdir}

//Changqing

>
> qemu usermode is notoriously brittle, and isn't available on some
> targets at all.
>
> Alex
--------------Wtz0Z2DJKQiItzQHa0jjIWxe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/27/24 17:37, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj-1oTYiqqMcN1S3q8M6WrWr8-TBf0EB2aEorsKK72qCcg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Tue, 27 Feb 2024 at 08:10, Changqing Li
<a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@eng.windriver.com">&lt;changqing.li@eng.windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+       install -d ${D}/${sysconfdir}
+       install -m 0644 ${S}/doc/etc/rxvt-unicode.terminfo ${D}/${sysconfdir}/rxvt-unicode.terminfo
+}
+
+RDEPENDS:${PN} = &quot;ncurses-tools&quot;
+PACKAGE_WRITE_DEPS += &quot;qemu-native&quot;
+pkg_postinst:${PN} () {
+       if [ -n &quot;$D&quot; ]; then
+               if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', 'false', d)}; then
+                       outdir=$(${@qemu_run_binary(d, '$D', '${bindir}/tic')} -D 2&gt;&amp;1 | sed -n &quot;2p&quot; | awk '{ print $2 }')
+                       ${@qemu_run_binary(d, '$D', '${bindir}/tic')} -x ${sysconfdir}/rxvt-unicode.terminfo -o $D$outdir
+               fi
+       fi
 }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I would really prefer to make native tic do the right thing, if the
only problem is that it installs the needed items into the wrong
location.</pre>
    </blockquote>
    <p>Yes, the wrong location is the only problem. V4 patch is a way to
      make native tic install to&nbsp; a right location. <br>
    </p>
    <p>but this solution (<span style="white-space: pre-wrap">hardcode output dir  to $(DESTDIR)$(datadir)/terminfo</span>)
      is rejected by upstream.&nbsp;&nbsp;</p>
    <p>if use V4 patch,&nbsp; we need to make it an oe specific patch.</p>
    <p><br>
    </p>
    <p>upstream said that to it is better to use target tic to generate
      the terminfo to make sure <span style="white-space: pre-wrap">ncurses in the </span></p>
    <p><span style="white-space: pre-wrap">target environment can get the correct terminfo.  That's why I changed to use target tic.  but we do will met </span></p>
    <p><span style="white-space: pre-wrap">&quot;some targets don't support </span>usermode<span style="white-space: pre-wrap">&quot; problem.</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">So what's your suggestion about this?  use V4 patch? </span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">if you think the hardcode path </span><span style="white-space: pre-wrap">$(DESTDIR)$(datadir)/terminfo</span>)
      is not good in v4,&nbsp; I can do some change for V4.&nbsp; <br>
    </p>
    <p><span style="white-space: pre-wrap">Since native tic and target tic is from the same recipe,  the </span><span style="white-space: pre-wrap">TERMINFO should be the same except native tic is under </span><span style="white-space: pre-wrap">${RECIPE_SYSROOT_NATIVE}.</span></p>
    <p><span style="white-space: pre-wrap">how about </span>like what I
      did in this patch,&nbsp; get the native outputdir from native tic, cut
      <span style="white-space: pre-wrap"></span><span style="white-space: pre-wrap">${RECIPE_SYSROOT_NATIVE} to get target outputdir</span>,&nbsp;
      then pass it to nativetic .. -o&nbsp; ${<span style="white-space: pre-wrap">DESTDIR</span>}${target outputdir}</p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">//Changqing
</span></p>
    <p></p>
    <blockquote type="cite" cite="mid:CANNYZj-1oTYiqqMcN1S3q8M6WrWr8-TBf0EB2aEorsKK72qCcg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

qemu usermode is notoriously brittle, and isn't available on some
targets at all.</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:CANNYZj-1oTYiqqMcN1S3q8M6WrWr8-TBf0EB2aEorsKK72qCcg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Alex
</pre>
    </blockquote>
  </body>
</html>

--------------Wtz0Z2DJKQiItzQHa0jjIWxe--

