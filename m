Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732FAC48BF6
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 02:46:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.33489.1708310758427204304
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 18:45:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QryEIp0d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=27791b0084=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41J1e26m002596
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 18:45:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=w1P2kO/k2dLOdWRAyQI
	GL6ii7GQDAPuQtNg5rDoQf5Y=; b=QryEIp0duJbCeDLn86Q5S5gieC0uFV2iS2Q
	zZcvTpEVqfHDg5sjFWyNLsCH1PMch6u75hE0akQkgw2yaKi37uXnCwZbFKS2xKqO
	vwMf2pzrBg2AyrBBIxe9r+8eXWJf2EKqNy7NrMRB813gnbPu27I5bvRjldfxpmXB
	QHeE7LbFJCM9TJz6svYN67kp5sAAkjnar1flvNUCb3OB+BPnt0CMbynG33E5oxgB
	ojgCSmhgxn0aGbcadrs+DfvXt3eGLoBJ2Dcrry1ZVW1IGwupKrYMnQgEnRhH/zIY
	Rpp9AuvzENDcIhnW0qX6hD/wmXncDJtxwlBp/ztgrHwTloQVCsg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3waw6kh0xv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 18:45:57 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41J2jv09028817;
	Sun, 18 Feb 2024 18:45:57 -0800
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3waw6kh0xu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 Feb 2024 18:45:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/BpRguM/J4TXnhmYSK151uDfkVlKR2WbNh7DLsE3o399kdZS3LV7bQE4JhgJbVbDeA+zUaBhFnGvq6KezU4qAkh9gQahmJ6MsW3kDfd/Zu1IGLVz4+RU/R6A+mVtljxx9lB+fz/oKfhGVJVfYUNK8Nl7VACTVqacNyIMvxLZvhEmLHcX6wz1to3OjS3Tad73pT/7XeKhK0uU9ZFfcYKz5iSjgoJ3Z3H0mgX48kK7D624suoEuPxtp0cy52A6C3I+2dne0EqkB1ek/qFHOgR4MhG4dFvTToiu/LA25LvLdSlCjQEvlIh/WuSMr0Yo5Efj7dqY1RXweQx42rZkS+pgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1P2kO/k2dLOdWRAyQIGL6ii7GQDAPuQtNg5rDoQf5Y=;
 b=NsCjK/H+omRt+slRNe2P2adRKLxBSI2i6UpxYWxWdfIy5JyBuAwlgT2cwCAD+XYkNKfBAjZZdCYIiLMT8RgRrFAkGH9znBW1V5IQXc4UurPxFfnmo7/iEn+scp6vj/be5DPp88jzwAB/7vmxadmCsYqTVmOdLtZmMBPSKnOjWQZStAxYyUziR6c5xwP1lZ0hT267R3bIkSCF84y9qmQTl6U9eMaHm2FR/F5zuQk7F/EXCJXRnfLkZc+oD6H9VEPWnF130RtEpdLee80Uc5fty2ZqAPeOqaZRdYULCin6tfu38AzP+GXRAsg6EJAqRCrN8xkxALeLzEjGyvRvkinV6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ2PR11MB8470.namprd11.prod.outlook.com (2603:10b6:a03:56f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Mon, 19 Feb
 2024 02:45:53 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%7]) with mapi id 15.20.7292.036; Mon, 19 Feb 2024
 02:45:52 +0000
Content-Type: multipart/alternative;
 boundary="------------Z4eoCkPSH6gPm9PMM4QjfYle"
Message-ID: <88c97c1c-fc32-b5b4-aa84-42576c02b48c@windriver.com>
Date: Mon, 19 Feb 2024 10:45:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] systemd-firstboot not triggered on read/write /etc
 folder
To: dave.elek.96@gmail.com, openembedded-core@lists.openembedded.org
References: <vkHb.1708249394873752860.quep@lists.openembedded.org>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <vkHb.1708249394873752860.quep@lists.openembedded.org>
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ2PR11MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: 040f3bb6-5c7c-48c5-9377-08dc30f4e341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U+4X/o8wHZ/X/I//yn18Q0vEulMZmZZp9XMKz3KsTDkBaJChoNSSNiJdqM/vH4LbX330g9Az9ikJ7NEZGLvjj2yPDvx+qoIzodjoJvU3AmsJJXOYI3bJRbaHJeJPhHcxLc7WfOGtBd2hiY+nufHh318v6uYYILTQ4HwIAPHAIDhcFHd9YzZWBcAkYU//WX8HgdTH2uE1bJasHIZRhKm8mZ/JTH4uhvxmw3JF7CJCzpbM75uFlphFYeBMmC4OsA7OBeBwkHKmU0sHdWpFMNbXNX7XCxqthqvD4klv/jONA7ipWrINDkdkOy5REJSx6CevW0m0Lld5N2HqSGGlqfy+VnaFtdwXlnIMDCw0hPsFgZkoxcmWl1+aeGG8+Y9UicYfpnqf4IxKZ09HlO4MBWlDIOesL5uRBgIEP8q03tvym4ju3pxOLOs99EE13m+5KKkzH9wJ6+hccA4b5QTqVGSViytmx0dRTJDlYZ3QcWnaQIiUwngICeVQ0laQtv2UcocOjuec2ZncCXXNROUEBMQww6bW8ew1AaOCFRLEvax0bIU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39850400004)(136003)(346002)(396003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(26005)(41300700001)(2616005)(83380400001)(8936002)(66476007)(66946007)(8676002)(66556008)(316002)(33964004)(53546011)(478600001)(6666004)(966005)(6486002)(6506007)(6512007)(36756003)(166002)(31696002)(86362001)(38100700002)(66899024)(5660300002)(2906002)(31686004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UmFtalJuZDN5MFJXSGVzTnhiUnhaV2VTSFpHMFdLUlZvSVFTNjhnWVNGZjNl?=
 =?utf-8?B?MEkzUXBEdDVvWVFhamsyeGlucDl1K2d4YU12MllrQjdXQnVFelFrOUFRcGZQ?=
 =?utf-8?B?OGdzSk54N2gwRTBwY2cxSXdRYW51eWJoTnlSMjBwbG9hTDd6TFVBN3NRRGtQ?=
 =?utf-8?B?T1R0OXkvc2JXWDM3QTBHYXJHVEtrMDNqUkc4MC9NSU5mNlFaRE9yNWRmNkto?=
 =?utf-8?B?SHlDSFNueC9ISno0U1lDUVl4UjZYeTJ3aFNCN1RtamFYRVkvYnFYU2dlUnFG?=
 =?utf-8?B?WjlGaG9GRy91dDRpeDdSdUhrQzZPaTkyT1ZJM0hYWnNyT0d4WGVMVXB1dTdh?=
 =?utf-8?B?cDdzMVlIa2R1ME1KejhtRngzWXd2M055OGEwMFFpV0VoOGJ0UkMrOVRBeE1z?=
 =?utf-8?B?YXlnMEhoSEdDWmxibFdDUlZ1UnZmMEJuMjF2MWlxTjk3QnV5dFJDV3NoZVl5?=
 =?utf-8?B?aHlXR2g2UEhHTVVGeFJ4dUF0b2xGVUR3dXF5Q3ZSRFZJd25BcFVJQmpUTlEy?=
 =?utf-8?B?Z082U1RUUmdYcTJ0aTlWMWZTVjhNOVE5WnFuREMxRkdsV0ZsVGFNQk1uaFVP?=
 =?utf-8?B?U1owUnFzZHBQZS9td3h3dzVCTmxPMEdJK3NVbndqbDRrS3dnWkdRQWduY1R3?=
 =?utf-8?B?bUFIZ3VQcG9aWGRkR1JlYUhzR1haWGNIR0gzUjN5VERuSWdYa2dJVUw3eWdW?=
 =?utf-8?B?TmMva3NLcG1xalNMNWcxWWdvZmo1dFNNWnFjS3JwL0FSSUI0MDBUL2dMeVpV?=
 =?utf-8?B?V284cE5ZMlk5R0JIN1NzYnFtYUhiVTl1RDgyYlV5b1B1VjU4Mmk5cVp1LzhE?=
 =?utf-8?B?LzZKWmlzdU1obE9nQUhiZGdtNWIwNWs5NXlzSXVUdzlpTTB5ZkdhMTFIWXZI?=
 =?utf-8?B?cS9wc0VHWkdwbytXNzF1aHNyQUw0TVk2TVNOQmhvdWc4cmZxSTBLSFFRQUlQ?=
 =?utf-8?B?L2cyZ3VHTTZsQmZzbTJaQS91eVRrRzlhNTU3NklqVEZZb3ZlSjM4bTdPSFFX?=
 =?utf-8?B?cmR1NWdjRWdhcW1nY3QvdHVEMEZrdnJod2JMWERqdGtNZTVMdjRqSDE1QlN2?=
 =?utf-8?B?TDJQVVhONGhoNDRoWHhtSkFQdW42MmwwV3pYMmVyTysrUFdPS2pueFhLV0U5?=
 =?utf-8?B?NzNVajVVZGpIcUg2V3NXcytDUzh1dmhuNXlsMkRGUktGT1BIamhQNVp2c2hS?=
 =?utf-8?B?U0lqMndQR0NFaHJ1bEhSNmRKWUZzZGk5dkpOOHVOWHFhdUQ2ZW1CcVdDeFNz?=
 =?utf-8?B?eWdaVFpTT3JiQU1wL2R0OFlENlNzZHMzclE2TkpoWWd3M1F3TktyZllXT3pZ?=
 =?utf-8?B?dkR5NXR3cmNvTkFPMmR5aEtZWVROdWVuVXRXU3d0RHRaVEM0bmE4N3Q4VTND?=
 =?utf-8?B?UG4rUVFpcmRHNGRzMjk1TVFka3FpSFFnLzVMcEJqQTZLc3pBYzB2WXlKRXpN?=
 =?utf-8?B?QVhtd01qaUJJQmNLS2VjRDhFV3h3VGF3engxNjg5UnRSaFI1ckRXUHVqaHR4?=
 =?utf-8?B?SXJiTlFmZ05qeWJiK1FqM3dhYTMxdm1HWUUyQ3Axc0NQTkhQdk9hVjZrRTFU?=
 =?utf-8?B?Ym1yVkdmNCtueGZkVTB4YU1EbU1WaFlya09JRFVsVkpKeXVURjRvd3M1dmVK?=
 =?utf-8?B?N3ltMDFiR05wSFZDZTJxeU5vclU5N2w0b3Jia2lRY0QzMVRTN0pzMjJOTk9n?=
 =?utf-8?B?dW9MM3pFdHlMcG41blFUa2k3bHBFdmJWYmJ4aGc2LzFnZHNXM2lSZjBXdnJq?=
 =?utf-8?B?U25XZmJYeHovTkN1RjJwQ3AyblhVWTU5RzRGU21WR2pPTUlmRDUvalY1UkJo?=
 =?utf-8?B?OFFETTRtSHAwK2dVOThkU1lvdmpwSWlkdVNFdWdmak5zek1ZQjV0NDkra2JH?=
 =?utf-8?B?YXp3Z2NBTHZVSHFpaFAvUXJOM3VkQkNXQ0JDbE5GRlhwejVRT0k0bHlSQjRv?=
 =?utf-8?B?OXJWaUlET2tYSGFCTlF2bUxTVXU1T2RDdi9HR3drSThvY0hEcXJqeDVpVisv?=
 =?utf-8?B?bXVvQWhiTmc5K3U1eUlZT2sxeVY4VjlhSFBaT2R0Z3krTkZOL3NiZmp4Ulgy?=
 =?utf-8?B?Z1Brb0xsUFpDZmtPMllqQndya21tRVd3K3ZBdjZ4alRjZm1HZDFtYUZuTjE3?=
 =?utf-8?Q?AhQAK3ThOj+on3LZvLpiAibP+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 040f3bb6-5c7c-48c5-9377-08dc30f4e341
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 02:45:52.7016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bqFFmOBnuDi5kK0O7dKlgWIhKViLECxk7shcJyM/VoRP87UFUfmIEm340SwqV3IIY8Dyc26BomsimEwsWG+BXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8470
X-Proofpoint-ORIG-GUID: WBRVEuM6gpXzDWh7Dfzby7vpUNgaMLLs
X-Proofpoint-GUID: MiaUmVE07Yld5tPZAASc47E53eKFzZ9e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-18_21,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=655 malwarescore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402190020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 02:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195861

--------------Z4eoCkPSH6gPm9PMM4QjfYle
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Does adding 'stateless-rootfs' to IMAGE_FEATURES work for you?

meta/classes-recipe/image.bbclass:IMAGE_PREPROCESS_COMMAND:append = " 
${@ 'systemd_preset_all systemd_disable_units' if 
bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and not 
bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d) 
else ''} reproducible_final_image_task "

Regards,
Qi

On 2/18/24 17:43, dave.elek.96@gmail.com wrote:
> Hi!
>
> In the systemd-systemctl there is a *systemctl* script used for some 
> configuration/settings for the systemd services (e.g. enabling services).
>
> In this script if we call the *preset_all* command, it will create an 
> empty //etc/machine-id/ file. This is required on read-only //etc/ 
> folder, otherwise the systemd will fail to boot. However on read-write 
> /etc folder this file is still created, which prevents systemd to 
> satisfy the ConditionFirstBoot condition. This is used in systemd 
> services, for example for systemd-firstboot, where you can configure 
> the root password, localization, hostname, etc.
>
> The preset_all command is triggered from the /image.bbclass/ file. A 
> quick solution in my case was to add a task in my own layer, which 
> deletes the //etc/machine-id/ file, but I think it would be great, to 
> prevent others from the headache it can cause to investigate/fix this.
>
> I attached the patch file about my proposed solution.
>
> Waiting for you reply soon,
> David
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195823):https://lists.openembedded.org/g/openembedded-core/message/195823
> Mute This Topic:https://lists.openembedded.org/mt/104425254/7304865
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

--------------Z4eoCkPSH6gPm9PMM4QjfYle
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Does adding 'stateless-rootfs' to
      IMAGE_FEATURES work for you?<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">meta/classes-recipe/image.bbclass:IMAGE_PREPROCESS_COMMAND:append
      = &quot; ${@ 'systemd_preset_all systemd_disable_units' if
      bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d)
      and not bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs',
      True, False, d) else ''} reproducible_final_image_task &quot;</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Regards,</div>
    <div class="moz-cite-prefix">Qi<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2/18/24 17:43,
      <a class="moz-txt-link-abbreviated" href="mailto:dave.elek.96@gmail.com">dave.elek.96@gmail.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:vkHb.1708249394873752860.quep@lists.openembedded.org">
      
      Hi!<br>
      <br>
      In the systemd-systemctl there is a <strong>systemctl</strong>
      script used for some configuration/settings for the systemd
      services (e.g. enabling services).<br>
      <br>
      In this script if we call the <strong>preset_all</strong>
      command, it will create an empty <em>/etc/machine-id</em> file.
      This is required on read-only <em>/etc</em> folder, otherwise the
      systemd will fail to boot. However on read-write /etc folder this
      file is still created, which prevents systemd to satisfy the
      ConditionFirstBoot condition. This is used in systemd services,
      for example for systemd-firstboot, where you can configure the
      root password, localization, hostname, etc.<br>
      <br>
      The preset_all command is triggered from the <em>image.bbclass</em>
      file. A quick solution in my case was to add a task in my own
      layer, which deletes the <em>/etc/machine-id</em> file, but I
      think it would be great, to prevent others from the headache it
      can cause to investigate/fix this.<br>
      <br>
      I attached the patch file about my proposed solution.<br>
      <br>
      Waiting for you reply soon,<br>
      David
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#195823): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/195823">https://lists.openembedded.org/g/openembedded-core/message/195823</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/104425254/7304865">https://lists.openembedded.org/mt/104425254/7304865</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:Qi.Chen@eng.windriver.com">Qi.Chen@eng.windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------Z4eoCkPSH6gPm9PMM4QjfYle--

