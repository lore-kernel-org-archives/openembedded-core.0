Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A71C54E58
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 16:01:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.87.1710259258051229009
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Mar 2024 09:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=DJLv5y7x;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=380120f52a=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42CAh07P025524
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 16:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:to:cc:from:subject:mime-version;
	 s=PPS06212021; bh=0aSHJD8urdwM1lV3t2l2Qps/rlugUobbmuXQMiFSGJE=; b=
	DJLv5y7xSyzt//0Q8Eauk+id8T7XHcD9iGkEhyxOiOIT1UFA4j6ZgH8yXEeUvg9/
	E3gi6JDayBFvMdK9SbRbRj4Qr6DsrN4Rj2RO96nWxNGZwytgwXburr9ZuMGg/hEn
	/VCOnwn7qAgdcND6+6pjuUNh9YNbksyJT9UrlnfisX0/HqtrdpPEcwPD69h2d9dh
	FZfW1XGQMdz7MyzD4s73+jozTjW5nb4wknCJQRNNnMvXWFCXCO1dDBDqm82KRZ9w
	Y0EJmGQ2tsFm3Yl3GKdT5+WPWlNowLyDw5I1JFbDQ/xuL0LwaEUoTYKL6+5ib/YN
	mzBZiuj2WN0u1VzlnEU9cA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wrcyxu2p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 16:00:56 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 42CG0uQJ021795
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 16:00:56 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wrcyxu2p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 16:00:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IA5vwjKC8pO+zx01vly1+/tlgHGs7V86PY/fa5Q8Ti4Yj2Xx5ERlOXkR5gSWRSmIH7AVaYnqGl2gkn8gHxdkzHg/S1lejFQyEu/K/NSkKvgPHSvUSlkUt+WXyOug90zEx6KUd/Kv6N2YCCo6dGDPGoU69QhYEiP5FHoJdA8KXhKY56afrtWv94Yi0yzXiTpNEBFE7RlFOyY8LJBDJaky+001dBAMolkIF6fbvnt4XNthzBtw8JDxd6lN11lxP0wiKtmn4py+IJgqAuKi2cH+desHHWAB63vuF3gn95fC0pebdYltnUWIKK6M3kgf2T3ZdfI0V3sATFTOUykW3TOcTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aSHJD8urdwM1lV3t2l2Qps/rlugUobbmuXQMiFSGJE=;
 b=ZQYRdwzgpgy5X7NjIn+kfguQ++SINrl/V7ZT+dUe1nWZQ1uc9foUFIyFMKTb8BH44PwUkhfdgpG4p51boLvOeSPTZoO0hl5F4s7RklCvsDMI3wcvI11Xje2Bid8VbMSaej9CckrSN+ZqntImm8qFGVKNxHiLDnbC6y6Cj+GYtxMqyKyFLDiQr9B7Dn/PnOlWdwMwVOdXni53lZnixwETbq/Egwz6FU/YzQbmTHB4BhP1Y0qSAg25Fq0C+gPPnWDoavB9w2mnFIzEApXkkn1mpZtXRMyngKbwjCmcvDTu/8JdKGIw/2Gbh7WH6CdXrM+KvJ/1uCeuY2FRJAprVcG2gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS0PR11MB6326.namprd11.prod.outlook.com (2603:10b6:8:ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Tue, 12 Mar
 2024 16:00:52 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::86fd:8a6:5f86:104e]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::86fd:8a6:5f86:104e%6]) with mapi id 15.20.7386.016; Tue, 12 Mar 2024
 16:00:51 +0000
Content-Type: multipart/alternative;
 boundary="------------A1BeTS6Zi0ABhqEYRR9ToWkl"
Message-ID: <bfcda403-4c77-4309-9582-8c3885a96d8e@windriver.com>
Date: Tue, 12 Mar 2024 21:30:42 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "MacLeod, Randy" <randy.macleod@windriver.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
From: Yash Shinde <Yash.Shinde@windriver.com>
Subject: [RFC OE-core] Bug 15423
X-ClientProxiedBy: MN2PR19CA0069.namprd19.prod.outlook.com
 (2603:10b6:208:19b::46) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DS0PR11MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: 4639f7dd-083f-487f-5029-08dc42ad973a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	n4xyNhuuLRGpyjr/GnkZfKa5ZBvxoQ3Qi+U7pwYpuwtbRk6qaNwJ1lwoIaD1V3DbTQ0JueRdJpoYW3s1Wv3rbxSycDG7vluuwtZBdOdurx0I7Ar6v/4PkLGFwV98KVioyrUcCOq3RQyMFNwJ3riwGhTL/dUXWPrPGyb0XRHWahgaisVSGym7giPlJ1LNwzoSSHdXfC42GloHPAb1hKXnSj6u1aDOa7uODwUn8g/zKIB5asC/yR6Z+ke3dSNuZ/SUYgpMeFsCX+mrswd33KmmFwbQdKLwXZ+vHvVfQzUuUl7VCwqf83gOnJyO1X062hdNS/jpFRT3hLvaBUenvRNLEPbEdu7+Gv0ia/PvDjg3yzT4HW7AQzyaX8dTHrv8UOBmyfbO/PLfuU8Np8YeslfAcB5I+t9PNHWKdeEl3H+HUzfKQb0wVQG269g67TCEnAlbo0L/mV8czxIG4ZdD7BwsXkNt7UXi7YTa1HEi5U959qy4J+hH5d5rOktY1ltzeCNgSMXRT/WMcSBf5Y2fHf+hHasj9ryfCsMrY6T0c6IhUEFhz+wctqhPoz75aeIxjDIYgo+ty9ilZIBREa3tevpE/adepWclaOMn+RL3RwZqZZg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RnVNTG0rS0RQZ05XSFc1eEo0VlhlQ0FZK05PaGhMaDNMQ2VkRGM0OXFCamFF?=
 =?utf-8?B?RFVuTjRUYUlsSDVKUmxWd0lQYVBGU1NxQjJJTGRHUDRxQ08yQ09ycDd2dzZh?=
 =?utf-8?B?eXhaUy81UVAxMlNBRjJLdG5vTE5NeGpiTXZ3cEoyM05IUGt6UWNoTnNrTndh?=
 =?utf-8?B?dHdQc0JXRDRneWczcmdBVU5wVDBTd3Q0b1Y2RzQveUJkcTdXeHptWXoxSFBF?=
 =?utf-8?B?T1pKbjRnRzFQVzhzYzMweDlJRk5PVThPUlRzOEh1bVVlUGEwaTdPQWlZSlMv?=
 =?utf-8?B?YlZJaUxzRkRSdHN4c1VyNjhWNHAwY0plK3BoUVhna29IbXNBTWpPdnJKR1BI?=
 =?utf-8?B?alhlbmJ3Ui9JNWhhcTd0OE82OVB2MjVIaWprNGI3QTluYmdOZEluSk83S1dz?=
 =?utf-8?B?RWlJbTI4aHVRK2RPdE45NHI0bXpHOGxWdS9TSHNWR0c0RE9ma0xrQ2xnT0x2?=
 =?utf-8?B?bllBdnNJSllTTDJhc09Tei95RFFZSUsraG56ZVJvQXI3SjVWVHVtVVNmNllU?=
 =?utf-8?B?ajFqS090aFpsSldpWXVseXFWZC9nT2NsMWVDejdaMEhmcng0bTlUYUkvR3FZ?=
 =?utf-8?B?ZVptLy9mWlhFWGxZRnlPc2lLcGlrTElZSU5CN2wxRGZXVFVYdlpNSTUrZ28y?=
 =?utf-8?B?T0JSdjdtYThlZmMxYlc2OGIyQnFFbHpKZ2tMemNoUFBxdE16WUtRc0VMbU5t?=
 =?utf-8?B?UGY4cHNPYTQyNzJCMzFuR1YrdUcrYWVNWVdsS05LQm9IMWhTcEw2WG1adWtF?=
 =?utf-8?B?c09YSjBvOUdRemJ4WHJBVmhxR1VsWlhReWpJV0l1UDAyL1ZZQzk4VUFUSTRZ?=
 =?utf-8?B?WHpCR053TUs1dkpqd1dSSWZFbGh4dERJMDRETFRuZmFRdWt3eHMzR05LZnUy?=
 =?utf-8?B?NnVhSkxlVytXcWM2cGQ2WmEydlZYYXJLbk0zcmc4UjMrL3RrY1J6Y1ZteEla?=
 =?utf-8?B?NnpsY01RN0RiM21ZTTdoTXlnWGx3NzcyT1U0OUg5TkFxd0lrNXQzR2R4Qzlz?=
 =?utf-8?B?ZDlNV2MwOXJ3TlZqVUEvcUJMNGFRYTFyNGRpd052bVJIbm1UZm5lRC93Unh5?=
 =?utf-8?B?NERIZlBSeTY3REtHMGNEVmRCTTdkSlZNVlNvTEgxRU14azM3cUZDQ0I0R0xR?=
 =?utf-8?B?aUVhcVExS3pPWHpCeldZWTZic3BsOXVDWDM0UEkxTzhyTDBMRWNITFhvODhr?=
 =?utf-8?B?dmQ3SVVHcVV4NWRnRnFxdThReG5kcEc1a1RIQzNBWklTdVZGcWhaMFNsbjlp?=
 =?utf-8?B?VnY5WE5DbWlvL29XU1FBZzZtU2pTNzZBdEhnSDdMRHpCQTRSR0Y3VjFVamRi?=
 =?utf-8?B?UllaWmNWNitwR1ZCV0VXbytZU2hpei9qdENZTkdaSVZZaFNRcnBSVDlrWlhE?=
 =?utf-8?B?R2d4VzFWVDU0RldVVitUdERvRllCN0hmY1Y1ZkI3bUdjUjlEa0pEWUdCUzBG?=
 =?utf-8?B?Qm00Z0xVaVZLRWRQZUxzYjVXL2xPWUZBU1hOODhIeGo4WWZpd2w4SzN5NTZi?=
 =?utf-8?B?RHdmdkRmQjFvM3N0ZXA4dnZESnAwWXB6K2lwalkwV3hKRnpzS1lYRnpqamNH?=
 =?utf-8?B?VDd4S3hIeHN0aHNTTTd3bm5neVVBQ01mYzJCYjl4V2xNVXVWN3RtMnhwRzB4?=
 =?utf-8?B?endzNDZUdHhPcHhuTDA5WUJvSFN6TnJTSDdCSDdoR3hpUE9MZ0VwL0NadnRu?=
 =?utf-8?B?YW40VnRYUnJEYS9Yd09MYTduTmtCL2R1azEyS016c29PRjNsZVUzR1kxN250?=
 =?utf-8?B?bEM4Y3Q2NkJNTGlrZVkxMy8xR3Vyb0RBZjdpUWYwOFhucnFGT0tRekN4QWMr?=
 =?utf-8?B?UnBSR0RMS2pFMzBlQU5EMC9wTE9aU2c4K0x1VWtQUlBMZ3R5WldCZ0tiMTNq?=
 =?utf-8?B?UlJ0N20zYStmcjFLZnJ3U2pLZ2JLdFNoS29lMjA4c0JseitIdXJtaVR4T0FI?=
 =?utf-8?B?R1MvQUMxQTR1ZnRPbmxYNElvcnk0ZktnVytVa0ZrNGZ0L212SzVrc1ZhQkQ1?=
 =?utf-8?B?V1MxT0ZqUXV3UU9raHFsTzBKaGw5bVI5cERheUpRUEw4SDY0RFVvM1lHMUYz?=
 =?utf-8?B?ZjVuUnYyMXZCeUxudWpLaGowT3JMcWNWOWp5THErV3VtdEE2eUxyQ01sUGV1?=
 =?utf-8?B?aW9QTUxOSkppNGx1MG5Pd2hVc09RRXBJdGlya0phblFncHBuQkJXaUczUmxl?=
 =?utf-8?B?Q3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4639f7dd-083f-487f-5029-08dc42ad973a
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 16:00:51.6016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ld6FUugI1ild+kaC86i6/4qef13iFoRGFXTbhxWWEScTxQUK4yr2DzNJDZxFuibcLVit2YM+qt2Ncuc5LCif0TwxZyAr/8Iugc2MmSbTfRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6326
X-Proofpoint-GUID: _UtDHgLxYUp5c3rlummaSkK0HiuZw336
X-Proofpoint-ORIG-GUID: 4bUMItHI-rzfW7trQrLAEemc1gT8UoXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_10,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=818 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 phishscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403120120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 16:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196995

--------------A1BeTS6Zi0ABhqEYRR9ToWkl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 42CAh07P025524

Hi,

For https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15423,

I=C2=A0am=C2=A0working=C2=A0on=C2=A0to=C2=A0find=C2=A0a=C2=A0work-around =
until a proper fix is found.

I am looking into if there is any=20
way=C2=A0to=C2=A0skip/disable=C2=A0individual=C2=A0test=C2=A0cases(tst-sc=
m_rights.c and=20
tst-scm_rights-time64.c which cause stale qemu processes) for glibc=20
testsuite but didn't find anything useful.

Another way to handle this can be toadd runCmd() that kills=20
the=C2=A0stray=C2=A0processes after=C2=A0the=C2=A0testsuite=C2=A0is=C2=A0=
completed in glibc.py file.
Something like following,

*cmd =3D "ps -el | awk '/qemu-ppc/ {print $4}' | xargs -I{} kill {}"
runCmd(cmd)*

Let me know your views or suggestions.

--=20
Regards,
Yash Shinde

--------------A1BeTS6Zi0ABhqEYRR9ToWkl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,<br>
      <br>
      <span style="font-family: 'Segoe UI';">For <a href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=15423" class="moz-txt-link-freetext">https://bugzilla.yoctoproject.org/show_bug.cgi?id=15423</a>,<br>
        <br>
        I&nbsp;am&nbsp;working&nbsp;on&nbsp;to&nbsp;find&nbsp;a&nbsp;work-around until a proper fix is
        found.<br>
        <br>
        I am looking into </span><span style="font-family: 'Segoe UI';">if
        there is any
        way&nbsp;to&nbsp;skip/disable&nbsp;individual&nbsp;test&nbsp;cases(tst-scm_rights.c and
        tst-scm_rights-time64.c which cause stale qemu processes) for
        glibc testsuite but didn't find anything useful.</span><span style="font-family: 'Segoe UI';"><br>
        <br>
        Another way to handle this can be to</span><span style="font-family: 'Segoe UI';"> add runCmd() that kills
        the&nbsp;stray&nbsp;processes after&nbsp;the&nbsp;testsuite&nbsp;is&nbsp;completed in glibc.py
        file.<br>
        Something like following,<br>
        <br>
        <b>cmd = &quot;ps -el | awk '/qemu-ppc/ {print $4}' | xargs -I{} kill
          {}&quot;<br>
          runCmd(cmd)</b><br>
        <br>
        Let me know your views or suggestions.<br>
      </span></p>
    <pre class="moz-signature" cols="72">-- 
Regards,
Yash Shinde</pre>
  </body>
</html>

--------------A1BeTS6Zi0ABhqEYRR9ToWkl--

