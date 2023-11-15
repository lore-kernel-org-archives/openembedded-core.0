Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA568C072A2
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 16:30:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17845.1700065825295257946
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 08:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QY5NJNuU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9683405c96=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AFAwFq7026507
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 16:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=9rFcuYm3ft8mq8Kcb9q
	320/E5EAlJ+al2j2WB/a5Rsc=; b=QY5NJNuU4iRP3FkI87mGCdh+zBYFUALtlCv
	o2yh/R4sB/PY6hWRGQVFSWANlo6wMBmKrR9+e6qpNtek7/R63KqEh0bChfDUqgsv
	ZueYOIdXUetJuCfgZQU4EEGzRXmYprHqfQN/O18gVSdAJjNBtaJwH4GMYsCvPZsc
	QwokX3IBruS4XSolqa3W4Fu9/wc0gPfVlZpddAr1RLwxobku+OQoxL8Z2xqVIJD1
	60Y3IEgkuwoX+OF5SF+YrQnklAP70VKIDJeCb8HzXfz2gtDQgMu9MYxFEn1AGw+O
	RtpOfOVN5vanffv21EwfpNb5I/SaxmdV6E82VG7EkrtycIPXgZQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ua0k6by0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 16:30:24 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 3AFGTAaJ028363
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 16:30:23 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ua0k6by0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 16:30:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvY7F+QbaouwV10INg+1uUCWLG9JSTsKbx9DJ81TXvYWLXxQnHlAR4ndVgQDcWhNaw7/moFnwGO5iZnx5U9dNiIiDYOh7y8JQLlxAMhej+nFx+EgiYS2jbhcACWE6Lr+mcvf5kixfScd22F7MY0mHTqk4CszY6sAU0QQ9YIRLOWNRXK9kgYJ7us23xcrIhqK4Pp7QAWpBw5AAkKiDHDpHVX8f4OW5k4GEwM5B28FZl8Ryi9vfoBiaOsj1K7BXXlPFw0RhboMPAFQoRsUDlDEEFeeB3SmPXOlsynKeuxDuf3uvXOJbJgzNTPxHYkfnQt2quRJg+4aH4ZK1ineFJ74RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rFcuYm3ft8mq8Kcb9q320/E5EAlJ+al2j2WB/a5Rsc=;
 b=Y0PxwwDfpQgGsQDN7/+T+OcZBZZivfcvQHZQ5KSrrVEysut2KZiVYWHoBRSdxmfzGkDmfGfZ/QOsS6lnU5dsqEJcU4I9xSKsv+7QhEItujEMpVRLJpgM8fA76+9NEEq9wzDv4Fd2en3xBHWF47KXNudwyBUp2CeIkGILfu6Q+wgFMml4qEBcNxY1kEL3tqg/Vc5cE6di7JHP2EqOw3uyOs21XF6dQh4t3rVBPJpXZVoSs58q32tqTGn+uVLJyonjVVkLiuleLdTsBkRg3+DQP8GZnj+WW5DRxueQAbo2IQ2y5VryKmubPKbJyhY4g24CG2L1iPPQAN4wLp0bldz2Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH0PR11MB7496.namprd11.prod.outlook.com (2603:10b6:510:280::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.17; Wed, 15 Nov
 2023 16:30:18 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::2230:eb1d:7597:427c]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::2230:eb1d:7597:427c%4]) with mapi id 15.20.7002.015; Wed, 15 Nov 2023
 16:30:17 +0000
Content-Type: multipart/alternative;
 boundary="------------BSDTh837YaGI8caXDPrvWeOk"
Message-ID: <685c9a01-2160-4f1d-afd0-cec3593b1be6@windriver.com>
Date: Wed, 15 Nov 2023 11:30:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC 1/5] valgrind: make ptest depend on all components
Content-Language: en-CA
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        "Shinde, Yash" <yash.shinde@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <1795D005C571B567.15940@lists.openembedded.org>
 <94196e06-f078-4df5-afee-e29c05f11b37@windriver.com>
 <CANNYZj9+N9ezYB9yiPsHUjgHCUdStYJWEq3_8mQDQXxswxfVOw@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CANNYZj9+N9ezYB9yiPsHUjgHCUdStYJWEq3_8mQDQXxswxfVOw@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0356.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::31) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH0PR11MB7496:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c9ca1e8-226c-4e9b-9216-08dbe5f82734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kB8m00PPQX1veju+o4aMWSg67PAKmrPvTUccwivxjmfElXrcxUPAZ9vGWHD2TE6pZPsXhbHNComvA8vPXsYNZ9yRX4j1FXOK1j9CCCIbZ3qvnQCwAtL17OSl40gMi878cLKQoc2cavLyfDwLacZT2riaOyJVv12QYs00R4pcAZ4evcJJVY6XryEYLUL+vk+NTDwrjLWqFLS1MXJDsTUt4Z6VRvsnZRlMjlT4Jc/XOxyBhsD8KUgncXxP6iNh/ZrcWTeOM2gvnITVYBRUoQUdASx/H0cYnn+8rDGGBMPV8cEHcbHi8NQbdWUy9bPPF96dRwjZBDkjhPhxduCw8Icu+XQhWOZ8sHyXcnwylyZbMJPLpeIgy1xxLckUl1tB3liYO/DYFd1UtQA1vgn2xTnX05Iy4f1sDhIx9fJgSufMMBnU7Aqy4KDXtDUq5O0tNwwBd5QWA9DZ1QaysJUXC7OBG/UlbnHbZH4zdft6nru/cCCObf/Lsu95cUFTnGCObvJuyA4TMv14XEqyNRfXDv9EwjBC4jmn9VrECGEG6oB+HYHgo6PkSSbXQXWdeAC1P2EHs3jf7MiXmPNPr1fFnlKQ7uWAHXJ9Vaw3RNLYMPsgmNb8wtDUmePrYEJ2tU06qHX3i9wFAI7aPTWeRNXPrxoewQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(396003)(346002)(39850400004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6512007)(26005)(2616005)(966005)(6486002)(478600001)(31696002)(8936002)(36756003)(8676002)(86362001)(2906002)(5660300002)(41300700001)(4326008)(4001150100001)(66556008)(6636002)(66946007)(66476007)(110136005)(316002)(53546011)(6506007)(6666004)(166002)(38100700002)(31686004)(33964004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TE9yU3ByY3JPcU9xVW92eVVSWDR3S0V0WHpqb2pMZUNEZVQ2S1pxMFUvTWNE?=
 =?utf-8?B?N0kvcHhPTVY1MkFKNmo5RnlzNTlpeUpxbEVob0wxa3RTeUJFNEZJS1A2c2R4?=
 =?utf-8?B?TFZDVVFaVEVtcTExVWFRc2lvcHdiR3A4RTg5UlFwRFFBUUd2Rkt0TTJoOGJu?=
 =?utf-8?B?Ny92Z3M1ZXhjOTU5bkhYN1F4VEs1TFJlQUNPM2xPUHR4U2o1cUlQMVc5RUdK?=
 =?utf-8?B?aWVPcGpuVW1YU2p1Z21vK0lnaFVoQXBLbFNDUWIvVlVWdi9ZMzUyR1Z4WnVY?=
 =?utf-8?B?VjcrcXBYNjN0MUFvS2s4OWdKcHNjWlFoNi9pRWduTHdqODlEU3RJRW1DVE1P?=
 =?utf-8?B?WmFSUkgzWVpWdm5FL3ZIMEcydS9Qb2d4d0FuamUvaVFoNnF4KzZnaWhiU1Bu?=
 =?utf-8?B?b0o5aTVEOUR2bkx1TlJXS2psT0l5bFRxbWsrWkFjUGhNeUU5K2JlalZvWXlw?=
 =?utf-8?B?N3EvV1F2cHVXWG1OVnltVlV5YXdhcFkzQW5nVEN4eGFGYmc0MjNDL1ZQV3k0?=
 =?utf-8?B?L05hdFhqUHBOS2tEWThZTDRDdGZrdWFqMVdGTWppc2loemx6YllXcUdFT2U5?=
 =?utf-8?B?azBBYXlOTVB5WWJwTDN1ZHYxTmdzVEZyQkl1UzdnbWtqdURVOWFCUGQ3NGk4?=
 =?utf-8?B?NVltRkM3L2Z4dU14SldVaTEyTXNjeXJmMTlMbVQ5SW41OUFNcGJlSjl1SG5k?=
 =?utf-8?B?TVd0VklsMm5YV3haeG1DbnVCWXFqK2RYUm1BcndCUytSTFN3RVZpOStEd3Fu?=
 =?utf-8?B?amgzdlVhM3M1VFczTTZzY3dIc01RK0c3SFJLay9vK3hQTVNvNS9QczYrL3FC?=
 =?utf-8?B?THdxY1E3R0ttWWtxWjI4aldob2VTMW91RElWb3NYSzJuY2ZDQmh0MktUd2tR?=
 =?utf-8?B?YzNGcHRQOUdiVHp2K29sYTRETHE5Z09YdFZpQTRPRUVZWENMbmN0NWJqNXNt?=
 =?utf-8?B?amcrUEd4ODlacjFKNTgrdEQyNXc5bGRQWm1qcDFVdGdXUDRDZ1dyM3NxUWNp?=
 =?utf-8?B?b3pNa1IwbFNjSEI3bzVCczgzRFR6eEMrSmU4dWlEWm40UWtPdS9GVW1QcTBD?=
 =?utf-8?B?ay9rR29rdmFHT2xHT2hxUWxDZzk1YmlpTDRETThMK1crUnFFVExLSG0vUC92?=
 =?utf-8?B?Rnk3a2E0QjBlcVFmcmpRV0pkbHdxZTlVTVRQQ21rTjRrZG02M25SVkpReHoy?=
 =?utf-8?B?VXE2cDJ4TXVpRVRPZkI0VWZ5NzV5QXR4MWFYZmNXYmo0QmpmUXNFK0hBS0RK?=
 =?utf-8?B?OTVPQ2l0bmlaa01GUjRCWmVuWXV0OHJwYmtvT2s2QXBuL0NLK1dlUDVFTlV4?=
 =?utf-8?B?WEUvN2w5U05RdnNVMm1UcldUU0prUlBmNms0cGtwYzRqZS9xRFM5MFBGazY1?=
 =?utf-8?B?Mk51dEt6MENkWjdmeUprbkpDdzRxTyttazkxRzhHdlpjZi92aGZuSFRDRm1S?=
 =?utf-8?B?QnEvdldDS09lVmR5WXFMYmxFMTlUY2orRHFhZHFhd3Z4ZklOaFlaK0xyd2FU?=
 =?utf-8?B?Y3FjOUxHR00vQk5yWFAxN1JyR3hFaUxkK2JtbVQ0MXE5aTFuNmExRXUyLzJr?=
 =?utf-8?B?dXdWWlIxR05oYjc2WFBrbkNYZUowZ3VNYi9DbkJOTVJBbmYvMmRqc29HSWRk?=
 =?utf-8?B?QTR6K3VpSktFZ01PTE5kTUNRZ0lIamRJaDQ5M08yNE0rVGV4eWNURjUvSlhZ?=
 =?utf-8?B?ek5rbkpBb1lGay90UmQrVlQwaVVWWGcwdHFEdE4wN0ZiTEZON1dLZDlqRVJX?=
 =?utf-8?B?eFBPRXBWZUpRdHBSanBoTnJTck5TSENDRDN2dTZlREFGTUdRcld4UUJ5emNL?=
 =?utf-8?B?TENLcVlvb1FGSEFMSG9jZFB2QVlhVWR6VUhpN1NBazR2N0NFWWpMVnNhcEZK?=
 =?utf-8?B?azJNeC84cUt2S3psY3hhZzQvWHZrN1ozcDFKK3hDeElmbDNiVjlubnhzNmVD?=
 =?utf-8?B?eDVybFhqclhab3kxZXFSZTNrOHdueFdoOUlSNUwwRkpDQnZMUDlYUi9XNi9k?=
 =?utf-8?B?dEs2NXI3ZDQ5cGpXUDlhNnk4NWpCcHBCYXNKRDc5YkIrRTJnTG5OZG11bi93?=
 =?utf-8?B?c2ZUbzZnQjN2eUxHaXFKaXozU3F3RDFWSG5XeG5RenFKWGxWTlRkdEVicmhL?=
 =?utf-8?B?U29rM1QrOS9JL2tZcHZyU3lJei9RcTVseFNCOU1NZUVqMCtXYUh3TTJ5cm9a?=
 =?utf-8?B?WWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c9ca1e8-226c-4e9b-9216-08dbe5f82734
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 16:30:17.6990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ek/fME8yTJzDwDwnHh4zOV8tBKlboGvqMVIvfj47n85IHUcYzCLGDfPP9vWA9zCJPB3zKQ4ouRccpZO9EghPYv13S/7EJ8GafKniP0ogD6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7496
X-Proofpoint-GUID: sE9li-gom7wLBag8sb2h7yBYB9kU1iOL
X-Proofpoint-ORIG-GUID: fH819Dmz4eCvGA2GvM6nKQ-WdlU7GZcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_15,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311150126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 16:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190736

--------------BSDTh837YaGI8caXDPrvWeOk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-15 9:48 a.m., Alexander Kanavin wrote:
> On Thu, 9 Nov 2023 at 03:00, Randy MacLeod<randy.macleod@windriver.com>  wrote:
>> As I said previously, I may not have time to get back to this until next week so
>> if anyone picks up this work, they might want to confirm that this is really required.
>>
>> I should have just waited until I had time to complete the update before spamming the list.
> Thanks Randy, I hope you find time to complete this, as I'm planning
> to work on other updates.
Yes, I will get to it but I have some things happening outside of work
that will make this take longer than usual. I did make a bit more progress
on fixing the ptest regressions.
> We're falling behind all over the place, as
> seen in the latest AUH report. Rust would be nice to do too.

Indeed.

Yash and Sundeep have 1.72/1.73 updated and are working on

getting the test suite to work but struggling with that.
I asked him to track what's happening in:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15275

../Randy


>
> Alex


-- 
# Randy MacLeod
# Wind River Linux

--------------BSDTh837YaGI8caXDPrvWeOk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-11-15 9:48 a.m., Alexander
      Kanavin wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj9+N9ezYB9yiPsHUjgHCUdStYJWEq3_8mQDQXxswxfVOw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Thu, 9 Nov 2023 at 03:00, Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:randy.macleod@windriver.com">&lt;randy.macleod@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">As I said previously, I may not have time to get back to this until next week so
if anyone picks up this work, they might want to confirm that this is really required.

I should have just waited until I had time to complete the update before spamming the list.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Thanks Randy, I hope you find time to complete this, as I'm planning
to work on other updates. </pre>
    </blockquote>
    Yes, I will get to it but I have some things happening outside of
    work<br>
    that will make this take longer than usual. I did make a bit more
    progress<br>
    on fixing the ptest regressions.<br>
    <blockquote type="cite" cite="mid:CANNYZj9+N9ezYB9yiPsHUjgHCUdStYJWEq3_8mQDQXxswxfVOw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">We're falling behind all over the place, as
seen in the latest AUH report. Rust would be nice to do too.</pre>
    </blockquote>
    <p>Indeed.&nbsp;</p>
    <p>Yash and Sundeep have 1.72/1.73 updated and are working on </p>
    <p>getting the test suite to work but struggling with that.&nbsp;<br>
      I asked him to track what's happening in:<br>
      &nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=15275">https://bugzilla.yoctoproject.org/show_bug.cgi?id=15275</a></p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj9+N9ezYB9yiPsHUjgHCUdStYJWEq3_8mQDQXxswxfVOw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Alex
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------BSDTh837YaGI8caXDPrvWeOk--

