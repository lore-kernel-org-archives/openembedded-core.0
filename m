Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CBCFC6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 10:11:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4217.1678875066326852136
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 03:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=X0OXwsbe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=243843133b=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32F8I43g004192
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 10:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=QouCPwIiFfY3DjL8D4Olp/kGbT5qhixxim3/AAHzof4=;
 b=X0OXwsbefcwEagAmMx8MxXh3dYP7mqX+bL+bAxu1R8wDzm4iUnb2bJnTQQXftlZOqI77
 A7F5cRaeZm4B4AY6HmL7UcdVuyDkTDUucVY++ItxNTnEI6Kr9iP7DbryUSd09cCsUa/2
 FZoB7daZ0si5eIDmrbw4aqbZTrTXcizSjKlN3IUScGGGwepwQfJhz+q7OpSO7TEax2Nk
 kVFgHizaoEiWC6gEB/v9fr31bld4nS+vh/WsAC9wMeiR8/IXofTn0Oaz6ax402V0uroA
 GRSJi2O9GpBzBbjF5fZx9gyatWuNQlYdUVNthU5uxRztUL8+P4Td9KifYUH6LtD3Ao7G 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pb2anrd3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 10:11:05 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32FAB4S0014883
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 10:11:04 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pb2anrd3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Mar 2023 10:11:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YC6sUeGeTWhV/LwobymFfVQbLvKmnZUfpBb/Cbu10oNGiv/Ep5jGKz2QBNwvPHdkCelkVg7JBLKmSwwm/Ge6Wx6Ro0iVQtKBq2wDC/a4JpuRsSnWPBV++ZeZBaeJjlfmKqWwIjQEo0URQH0AYMOdrjO/E8coAlzvWaesXufHf3BO1s+j9J9wthMCZgsrvLg7Z10V2PlG6tPy3HmiQQxopxJ7zgMYdofXy0K0F/g+BDakifcJ+MNxL8Qkkv7ISlJeW/Jay2P+LW/iOwZpkPBaJngNbfUTq7T0WGImA2NbQgOsc41LQSvfAM13udNUW1pJx/AxJVb7MrHnUwCrfGshMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QouCPwIiFfY3DjL8D4Olp/kGbT5qhixxim3/AAHzof4=;
 b=aGFvp1sxxWSyASd8/XBr/yuW8mmNfi9AmSIVRJnraGbkBdmo0UnbSJ/jCxgojX+EBS/jGIn5atL0hpSmpMTNXl1hAFw3hCIUVWRG/SfM8ZJi7BckCQezFGzU1/hJHWlOYXb9wyWs0mBxl20ZFqPqqWS3w1rnpcVl0Llb6ygWQHg8gqpzvoNsaUyCwhAQruBkdWPwkI9AAHo+g+vazMzg1LJnCW4QQU8CcLOvhXtYDgL+j9/jS1jGezK7u5D3K56dO5yKO6eZnDtoLyE6BSRkDz0PNVu9a/VqA/1Uz7pqb/cK2LO0qs/aSc8erJyuvDjEI40GSIE1pda4HFDPklX6SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB4950.namprd11.prod.outlook.com (2603:10b6:510:33::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 10:11:00 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95%5]) with mapi id 15.20.6178.029; Wed, 15 Mar 2023
 10:11:00 +0000
Message-ID: <b006eac7-bc3b-59f7-0ac3-7701042bac54@windriver.com>
Date: Wed, 15 Mar 2023 18:10:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [OE-core] [PATCH] systemd-systemctl: Create machine-id with
 "uninitialized" text in it
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Armin Kuster <akuster808@gmail.com>, Bob Henz <robert_henz@jabil.com>,
        Kristian Klausen <kristian@klausen.dk>,
        Nick Potenski <nick.potenski@garmin.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230227191548.95504-1-marex@denx.de>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20230227191548.95504-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:196::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB4950:EE_
X-MS-Office365-Filtering-Correlation-Id: 12de06b4-ff69-4d88-5db1-08db253d9355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	D3ejMliH4hjfkk/DtwGnIpkCknf2kHre+Eb0ONoKJo5Cw9cYKBU2QvuJ+9nepRgqdO/txpVU52fCJYA59Rrk/SRZaZnAEK8HzHAFX2WKL7xx3gXFgKPHnu7KWOnCwAjlNY2K9/VKjBed28BIQHGazmj8Owf19LnUpYugStMaXlCTdx9MRE9eTG3W/fwuuF64ia/QpNgvj5KvyBYViRlJ5pegSnYUP/58jFPuRt+ARIy8HEeAbWxD5DPenS0wg628R0rs7q0UgdOuNDdGEovGY/O6f4FEb1naZ6aIizm5L2S4ghbfoIqyFPjczQVqHFZ0jK6kREgO6bYmDRrruGuQCvNAGk3o4zHn+6tvkv8z2U07A+NsCwGQavy7heiQOxQqIXvEOAvO8vWETFD7rsKBmmAZNJnCRxy2arLypuuvcyghSIYbDoBPkYQj/HWXoM4HOFMPPs+T3Et5AaDso2th0G68ED2fXc/4ERGB7IQ63Rtg0VSrym3i5/2Q8vsddKVCNeSbaTfkEaDKfQ58uOm0cX2kJyFieMAbkLj+8QZRXetl5EfiwnDeWsgxbpjPYc0TUG2hHLHh5Dt5/FftZIPxnNOQ4Zsnw0zyFY3K82F4EERZ9UY+y3uN5MAFfDzfTS8+yulje46BG6Te+IInRkPSxetF6/yHxDeJvWRgx3EVoiQH/hoptMg0Z5yNFoKyo6XIfRsCQwPheVi0ZyRFFre2iAlrhEVEk9oRAP6aFSTs4hlOEIgBf/H0trpFPSi0v34e
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(396003)(39850400004)(346002)(366004)(451199018)(66476007)(66946007)(66556008)(31686004)(4326008)(38100700002)(41300700001)(8936002)(316002)(54906003)(66899018)(83380400001)(5660300002)(478600001)(8676002)(31696002)(86362001)(6486002)(6666004)(6512007)(2616005)(186003)(36756003)(6506007)(26005)(966005)(2906002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dkFoTllESjNWN05oUk1XNzBHYUpVYkg2TTZXSThXUW9lelBTY28zdUZ5WHF6?=
 =?utf-8?B?WHd1MGJwZnQ1V0wwWHdJNFlmM2RSNzlaTzhIanBoUHdIVW5raDRCRkRySTd6?=
 =?utf-8?B?L0NIRDNZVENVbVVkQkFaL0FhT1hnV05VWm5IYkVsc0dHSEUzNm1DODFucTRW?=
 =?utf-8?B?Q2ZWRllWWUxVTUNxN0h4bFRFQ0NUcXRPcGxJZG1vcURjSU9IYkxjZm5MbFRx?=
 =?utf-8?B?aEFSQVZPcGJZa253NHkwUlg2ajZVVHU0aTFBcmpsbFFReVN2VTlvbVRHQ2Q2?=
 =?utf-8?B?bURHZ3FrbnJldHdUV1FDcUZKbFgyb0poazJsblVtVGNRZFpIUzJWOUl5TWlD?=
 =?utf-8?B?WkxOeHVoeE15YUcvTXk0bWlYU2dPeDdkSFVMM2NPL2pPNVdCRi80N0ppTzkv?=
 =?utf-8?B?TFFlZUJ2dmhNQWdsVnZvaUplb25nekVoVVhteFpnRHNlZmI5RnkxbmxSU2gr?=
 =?utf-8?B?dndUbzlKQVFvNmxseDVJWkd1QnlSb1QvMkVkMndZUGpQL1Z3ZHlHTjdWcVpq?=
 =?utf-8?B?R295aTJhdnE2Z2NERGdyTlFKUGNvQU5NTlFBM085QlhINFB3NjY1bUp6anBa?=
 =?utf-8?B?cGZISGQ0Ty9ZWGFBdFIwek1ZeG9ERHZzTkhuckt2eEdoVVJJRXppWmRjU3RQ?=
 =?utf-8?B?MXRCL2xrR0lSN1NrNXAxMG1SRW5rR1hpcHVtZUJjYVdQRXFwMy9ncHJTaVlh?=
 =?utf-8?B?Q0pVdEMyWGIvVElmOVZ0U1Y2SUpzRTR3MzBqRzlmZlR0bHNLeVNwTHhvTUIw?=
 =?utf-8?B?cENScStyc1AwQldnME42REJFd1phMjlKejQvK3RVczM5RjZ4a1FOV3J5Uk1S?=
 =?utf-8?B?aFQ0cVBKaFdUVFJ6cFovWnV1WDRTK3ZIM1k3anpsMVpsV3p5ZG1IVlZYa01E?=
 =?utf-8?B?MHUvdTFYTGw4dExLUkNiRG1PL3gybE5UTWlGcnVXSkxPQ0FGR094SVQ4SCtJ?=
 =?utf-8?B?YUYrZG1NRUk3THhPSXBNWW9BUzBvQ2hSMXFMeGI1bDNEam9QeEtFbjEyeC9I?=
 =?utf-8?B?dHgyUlJwNEIwRHIzSExCaTRmMWFOU1NKODNPVzRISXRWMFh3R0ZxN25Dclgx?=
 =?utf-8?B?NkpxQ0txY01VQ09hTGlFMDZnTUk2cXNxUVlNc1pIMEQzUStyUExWcEtJZFBL?=
 =?utf-8?B?NlF2TUhVcGFPUGk5NkRFY0pBMGdEamFJU3lQZFZBMDExSngyT042UzZhS0JG?=
 =?utf-8?B?NGp5cUpxVWZjOHEyaTAvLzhHRkowdjhwUm9ydVVsbTdMMVFOR2E0TkViWWtw?=
 =?utf-8?B?QkFBT2FmZXBUU014MHFyRjBJanVvSzA5NEJQWURCTkdjZ3owMVRlL3FNdGJw?=
 =?utf-8?B?QnIxcnh2WUFPQ3oyU05URjE4MXJ0cGM4dUtiNjYxYzJZMk9GbUR5NjdQQ1hB?=
 =?utf-8?B?WDhtbzBUMTF0cGYzSlhvWEg5ZTFGY0dGeHJ6WmY4NDZ0MlZzaStlV0UyVHgv?=
 =?utf-8?B?TDF6VXFBdWlrOVIzOW5PelE0TjlQMlV3TWhwaG5YcUZ0cG91RHpXdDJhaGJE?=
 =?utf-8?B?SFhmL21RM2dSeXBUUUR2V0RuTWpCRVFLU1pYNnRNeUFGdHlzTUlxL0RaSHF6?=
 =?utf-8?B?V0FmYVFJWTNacFNkZ3ZLL0ZUUXRzc0wrREo5MkZ3SnFLQWRwQVdweXFkM1E5?=
 =?utf-8?B?OTVaa1BzQjJtZHkreithaXRPcWc4S0owUFc5dmZ5djUwd3BucHQwOWROUC94?=
 =?utf-8?B?TGdOZGtWSmN1YXBHMzNIRlJqYmZOY0ZjcWtrVk1OaTBvOEJ0VVBNM085U0l2?=
 =?utf-8?B?NnEyc2Zvc3lvajFqaUlDZkFDajJjbW1BblVFRkZkQUxsUldBUytvQk1DMHBr?=
 =?utf-8?B?STZ4SkVhZzlGR1BYUDJDQUZ3eU9oZ1QvSFZVaTVCL2piQXMveWlYcnhYT3ZW?=
 =?utf-8?B?YUJQd09ZTTByc2R4dUZaSnllWkk1OHM4STAvOWlwaXNzWjZvQndzeWd1clFr?=
 =?utf-8?B?YnRuQjBhVWxlTnI5SkxPa2JYQTRwQWRiUjZ2UTJCbDAvc2VFUGZjRkJtMklj?=
 =?utf-8?B?QWZmNTQwMDVqZVQwT01JZnlJSm9PQXkxaVFrMUxXRHR1SUhtZkdmVkp5S1Rr?=
 =?utf-8?B?cFc3UExnOHVQQkdRamFOVWJCUndnYmc5V1BwSnF3ZU9tVk1qRkNuMkttTk12?=
 =?utf-8?Q?8auP4+GzmIhJ65H1AZ/p4q7HZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12de06b4-ff69-4d88-5db1-08db253d9355
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 10:10:59.9697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZ7EQ4AfAw8H7jcfbc6pUXYtr+M9A+UrUuwvgLywtdxw99za/QbhMCDEqLbXr8izp2yLg+AngZ+63n7dqIjP4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4950
X-Proofpoint-GUID: L-c-XddXEpgXDnDU1ArY4k_j2KFFzVMY
X-Proofpoint-ORIG-GUID: DS9-7vZg-FI4OBENfsvrCVf2o6H7fINJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_04,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=513
 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150085
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32F8I43g004192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 10:11:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178533

This patch is forcing systemd to do preset-all at boot time (first boot)=20
in a function that simulates 'preset-all' at rootfs time.

If we look at the comments above the changed line, we can see that the=20
/etc/machine-id file was deliberately created as empty, for the purpose=20
of making systemd not treat the system as first boot.
"""
 =C2=A0=C2=A0=C2=A0 # If we populate the systemd links we also create /et=
c/machine-id,=20
which
 =C2=A0=C2=A0=C2=A0 # allows systemd to boot with the filesystem read-onl=
y before=20
generating
 =C2=A0=C2=A0=C2=A0 # a real value and then committing it back.
 =C2=A0=C2=A0=C2=A0 #
 =C2=A0=C2=A0=C2=A0 # For the stateless configuration, where /etc is gene=
rated at runtime
 =C2=A0=C2=A0=C2=A0 # (for example on a tmpfs), this script shouldn't run=
 at all and we
 =C2=A0=C2=A0=C2=A0 # allow systemd to completely populate /etc.
"""

I'm going to send out a patch to revert this patch.

Regards,
Qi

On 2/28/23 03:15, Marek Vasut wrote:
> Instead of creating empty /etc/machine-id file using touch, write
> text "uninitialized" into it. Systemd requires "uninitialized" in
> the /etc/machine-id file to trigger systemd-firstboot .
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Armin Kuster <akuster808@gmail.com>
> Cc: Bob Henz <robert_henz@jabil.com>
> Cc: Kristian Klausen <kristian@klausen.dk>
> Cc: Nick Potenski <nick.potenski@garmin.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/me=
ta/recipes-core/systemd/systemd-systemctl/systemctl
> index cddae75a06..45b29671ee 100755
> --- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
> +++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> @@ -302,7 +302,7 @@ def preset_all(root):
>       # For the stateless configuration, where /etc is generated at run=
time
>       # (for example on a tmpfs), this script shouldn't run at all and =
we
>       # allow systemd to completely populate /etc.
> -    (root / SYSCONFDIR / "machine-id").touch()
> +    (root / SYSCONFDIR / "machine-id").write_text("uninitialized")
>  =20
>  =20
>   def main():
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177804): https://lists.openembedded.org/g/openembed=
ded-core/message/177804
> Mute This Topic: https://lists.openembedded.org/mt/97273986/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
Qi.Chen@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


