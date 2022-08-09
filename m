Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE92BC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 19:53:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.194.1660074809308410478
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 12:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=GfxxDIt9;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5220609cec=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 279JRJM6030078
	for <openembedded-core@lists.openembedded.org>;
 Tue, 9 Aug 2022 12:53:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=CsPgGaai1cXRGMyLQYLpClL4kTKr2RN1V7g4b6CxDSU=;
 b=GfxxDIt9w/+1Sm6m08hyQt+zyBXfJjjy6BUoBw0XsBKN0jpH+rGkJFcmtMq9N6Gb8q9s
 mX86Rg+fbW0hHaSaJpCnvKGs0tQ1Jdjw9yItfOtCeXemfGUZZq+fcHp8Fd0D9xUP2qBi
 zeDOt15qsoHqi89WHSlUFUOKmyesxYSzXXqdelVRa0Pnd2gOEL5rh77Gar04cFOjDw98
 bGdY0jCFQp5SU/N01ytkHeaO7pxv8lYmtcyhtS9EdihZ5dor2orQL+vBmjWgOgtPXvCO
 7RlbbgKwQjWnDt1e+XpcNr/J+hHgvcu/iujxLrIFlsn9PTHHCni0apOOCYZLpvo/5ny7 jg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3huwr7r0gs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 12:53:28 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 279JrSAx001810
	for <openembedded-core@lists.openembedded.org>;
 Tue, 9 Aug 2022 12:53:28 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3huwr7r0gr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Aug 2022 12:53:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gl1R0db2UtcVQ5XDno/sro/Y/Q6eYa7ivNh0Hm8wlbt7Bp6sGyNva+x/ZlpWEPQUv51WoKoE8t4trrZ75PThjCH0RWAJjN4QA/0SyD/xokTHkkXZdNhwhC8FoLDGXFR5rEkm8aSq8owKktf0brIkcAILTwj5g0LmUEPSk04CKujRVsXzZafgYUJ5Aa08jDoqjvyk0AKkDueEz5KcyyS6s9YYg9VuVfj6HdJpLw8khZ461IQLrN4x0sA+Jdl/5556hbuv2Xv9babUtQ3DG4mEuH/GVVyYjpPT45RUsH4pd0mvf/NRwj4zkq5pkAqW4facBAU9+4aPTKRBll2cgjfkiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsPgGaai1cXRGMyLQYLpClL4kTKr2RN1V7g4b6CxDSU=;
 b=aSfYOpdlgUI50VazUtx7z4yKVeO+qzUEiXQzkoO836xmx7cWHwcE/NOS19dPT9OAemcdCCaKty/jlcPY+my441RuBZIVG7Fmk3OMdne4HMz5gNDsKF8aC9b4IX8moMw0EYk+ibyKMEoQkD4yal1tMF6D9noZzXVZFUisORuCgHilijULZmYEl11P9HCDCTbUj2CCM1vqxhYo+jSoEv3IF/HVMiOnjqwujSTjZKlR8XeeADTv4Wg/KGjTj7mp0EOkaTFVpiQZBL3ZqaL1pkeygS5zNRbg5E6HJ5nh5U3Klgj7m+5gOYwAYF97HP1t+pYCl2s9JKnCHscxo8eKQaOFnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 19:53:24 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b5ff:be5e:771a:9060%5]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 19:53:24 +0000
Content-Type: multipart/alternative;
 boundary="------------SJL3uI2encjELPO50p9g0ca1"
Message-ID: <be26318e-b250-0292-d18b-02f4cf645c15@windriver.com>
Date: Tue, 9 Aug 2022 15:53:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core][PATCH] classes/sanity: De-golf regex
Content-Language: en-CA
To: Joshua Watt <JPEWhacker@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: luca.ceresoli@bootlin.com
References: <20220808131951.2029559-1-JPEWhacker@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20220808131951.2029559-1-JPEWhacker@gmail.com>
X-ClientProxiedBy: BY5PR20CA0014.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::27) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96616c1a-c01a-46e0-2122-08da7a40d15d
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5598:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EJDpUpGCkD6feyX/wUaaj8MtCLYj3ptT6NyFetxwtUJW2yyzO5MSHB9ONIDMACmt/7y4Wq2NzpO/9ck83ZHM50wr3fKEczNghNvf5E/t6Qo+FgvjS/EzktRnsMw9K0poAgaC6gSi6Tj/UPxono22sgxs81QBAcGUD54p8z4Jm2Me+WvbAUE5SIif8MgjRwmH9F6s9kgIM111pXTc6V4htSFFrTQxChJrY5GYY/2AMIomTLQyY3TKBpRY6pw4V8ClTpmHUvr3l7MuBomQAQd+7g8Uj7XCJedecHdicvU+PhOnRej6vSMggSpjnAllbOWHCMpT+vgbo1/peyrU3sTUxfpYjNW+2pX7Pr0EZBFlGFBkaRH5YIdDG+XMzfOVthOHlTOGonCnkLSF30Gb/g3wLHeBEJpEjsjrDcLZ5Hfxntz3PhoqkBjP0rSF2wibJ+w3ELzCug2Em/Nz7UsvvjWvOVhUaAP2wLSdnxRlkoWjvr136AADDWn6lNg1S+kQLcOk7VqzIjxDupV1S3IIWQNknGCSs5HhIXB2QO/pRwRrRqRK3CkIWxsvuv5a+XTpLTGWOuxTaJRX9MpBiahxoG2KnAfxFGGgPqFBLleEpAEsEhwjK7xpkgM+3h+Rm1Z5WDT9De43KCnCfHb/82teOC+lOb9i/q3rq9iJsHonep2qhNGAdqhtaaNV0CvKj7KXvlk+wd0oghsrt4MAc1J1/XEFFsJk2o71QfcEUrFgeOQxSUhOHNpKD8vv/vUL1f1hjnnqosZ4Wcztl1uggrvINtbc9hI3kF6o5oBHhb4cLusWByBq/PlikxcSHgK6vObQ9x0nG7wx79KJHA63EyCXhX80hX4qypy6d2c6Tj+XtLBLbvnNLSAZ4h8j3IfPv64PbMe2vnVyVqQ9XNZDno8MGSi3s87sRNFsdaWbosDesA85aBM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(8936002)(66946007)(966005)(83380400001)(478600001)(66476007)(66556008)(6486002)(7066003)(4326008)(86362001)(31696002)(8676002)(316002)(186003)(2616005)(6666004)(41300700001)(5660300002)(166002)(53546011)(6512007)(26005)(38100700002)(6506007)(38350700002)(33964004)(52116002)(36756003)(16799955002)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZExCYk15SmNIL0pMMkFvU0FRbWMrSG41aVpXcUFZWS84ZzA4SURaUkdseFR6?=
 =?utf-8?B?S3YwUld3bVh6SVZDSmlhNVpTV0ZWMm5mMllUT1NCK2NjT2N1cFVnUnpJc1Uy?=
 =?utf-8?B?bGJJRGJGZFp6YzBHZ0N0Tk9XYjBDNU9jY3F6blJKaFdDSjduTUY1MGVNUWlQ?=
 =?utf-8?B?Q2l3MThINi9FTXZrb3FUaEFweDlsRit6OWhRaE40UHZEU002V2ZFSzZpdFhj?=
 =?utf-8?B?c2lrY3VNZi9odno1Z3I4a1Q1bVJpWkEzZ1YySm1Ca01kSXJTd0VTZ0thVE83?=
 =?utf-8?B?OW1TcEphZzU0T1JJRVovSWw2MGk3M0x0Q3EwMklZR0xhVUV5VEVkdnNSVmVZ?=
 =?utf-8?B?SDhlQXBEc3M5cFJEMmJPaXdTK3JDNXQzMmhsSVRQbmlQLzlpSk5wNEE2Y3hz?=
 =?utf-8?B?ZTJaWngwZTd2cXNWaVhGd2F5bmRpMXBZRHRSUHFXK2UzeHdVREFYYjJjTnF3?=
 =?utf-8?B?RDlESEVTMmNhaE1PWU1Da2NpaUY0bm1ndEVCd2pwZXVwVU9FSzdrZFR4aHlv?=
 =?utf-8?B?Sjd1ZVJLaEIxWktwejJMZ0JSSEQrZkFoVDJuQ2FvbFZnS2RjR3o5YUl0NHEz?=
 =?utf-8?B?TDVtaFZiSExKRXlMU1FCdDZObjNoRUZMOXZtc0p5dHVKYWhobFdoZmxNdmcv?=
 =?utf-8?B?aS9ENjg0OVVnZXNTNkpwemhQTVE1eWVZeURxOXYyRk82QUpWUTJCMWN0L3Zw?=
 =?utf-8?B?STRUd09hbUpWVEErK0lIc3FrOGVBMzhOaUp5d1JlU3NtY1BRRHAwNWF4UmR3?=
 =?utf-8?B?ZEMxZmppbVovMDd1aHpBam1vb0lVa3cvV3dZTWdIRTZEVVQ3TGNkenA0UHNS?=
 =?utf-8?B?Z0FXak02Q1lWdngxaEl0czBIYzNNSjc3QTBEWXV4cXUrK3FuTnFzNjE2Rm9S?=
 =?utf-8?B?SWhJeUNOdWlyQ1dFZVZiRElTWXkxTDVadnkweWd1d3hzNURteHV1M1RoT2N0?=
 =?utf-8?B?d0JWMjd3dzhCekU4WCtydnVOcGd0c0YzUm0xV2Y4MlpLbDVzT2tuRFhCUVhJ?=
 =?utf-8?B?WWsxZzFaZEZ5ditpVjNVTXVRRUQ3WlhEN3htdHZudnl3a213UGR3ZWt1MXNY?=
 =?utf-8?B?cXMyMUFEMmdkUGdmZUNsNnM1NG01ZDJldkNYWXJkdTA0OFNEcXZiK2k5azlv?=
 =?utf-8?B?aGdVZkVEQnVleUlNWG95ZHdkVWZXUzdCcUkxM2JwcnE0cWc5Y0tIMENSekln?=
 =?utf-8?B?NHNnZVBINWpHYmsyVTR4djdCR2k2OWxxbjYzaENnL3NjSm9JNXdnTFREYmwz?=
 =?utf-8?B?TFBaUWRNc2p5cXBmRWowanZWUE5wR2luOU9OcjJjQnNpWUFkNVhmY1dnZEk1?=
 =?utf-8?B?emRHNmhROUR0b2JMVEhseVB4NmZwdzRRZ2MvSEYvTjBEKzBoVjcxWkpEcnQ4?=
 =?utf-8?B?ejdOZVpaWTVZNkI4M2VVeFFxTFhpVG5yRzRHTXluUDVBVm1FK2FhclJnZExy?=
 =?utf-8?B?ZjNDOUF4SElmYXpxQWdmbit3czZ5WW05TFYrdjN6eGtYQjNiZGN0QnJNNEJT?=
 =?utf-8?B?TDFCTVo2SkQwa0NqZXJ4bDBNN3hXdDZKdDFYQTI3d2t4N2V6bDlVYXhVdlpV?=
 =?utf-8?B?WmFXc2loMC8xWFE5M2xuR1FnOHdPcVdaTGVBUEx4d2J5eWlpYXRVUTVEcXhX?=
 =?utf-8?B?emxmd1QrbERVTUtIS3A0aXQ0NFM2VzZJem91b2FZejVnUFkrMVJndzdpQU52?=
 =?utf-8?B?RldCbEM3anRCV3RYUy94TTVUbCt5Qis3N0M1ZlM2MHAvS0x1VzUvTG8vMity?=
 =?utf-8?B?RVpaeTRnMXBRYmdCdHk0bVFUTlllVUswVDBQeTdoVm1hcFNUelpsZlZrVXla?=
 =?utf-8?B?MXFqd0RYcWwvcUVxSjVtakppMkVnWHRYbjg2SGx5ZGJlZzJNZGh3bXkxbmdm?=
 =?utf-8?B?TzZuTHFCd2k1b0tGb3VvM3NPbGMvRVErQ0xVN2NEVHVqNGxENEZ2Um5kTDEv?=
 =?utf-8?B?TnVNVG9TbVZOUzBya3ZJNzlSOFhXYVpzM2RjR1ZmTUY5aHpLSkJhSk1FcEsr?=
 =?utf-8?B?Q2NjeWQvaTJtUEhUUkFPbElSSFN6aW91QnBRSHNZS2FRNTBsOUp1TGgwMFR6?=
 =?utf-8?B?MWgrY0VmTXJwNFNVcStuaytKL0JRblNFNm1FdnVKZ1N4VlFXMmNFeEtkUlE3?=
 =?utf-8?B?OXcyNll2K1RINEFKWmc2RmtUSitwSGxPWTl2SDJGR3BTRE91NEFpcjhHU0Zm?=
 =?utf-8?B?Ymc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 96616c1a-c01a-46e0-2122-08da7a40d15d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 19:53:23.9445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 D//ayqKQH3z+1998nemvfHcTJp2/MF9Nh6zj+erATTRhpj4+LSpUWedtbTV/nLe+CgqxPbm8wV0Wjw4V5A0NenmkeLRewfejVUNRoaHGnEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5598
X-Proofpoint-GUID: DKMSuOb5ZW3R_SUMZGNJcrF0ocM51G3D
X-Proofpoint-ORIG-GUID: -19Oq0zFjuRvHunfqmwOSxW73huB4LvP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-09_05,2022-08-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208090074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 19:53:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169160

--------------SJL3uI2encjELPO50p9g0ca1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

De-golf?

LoL: https://www.explainxkcd.com/wiki/index.php/1313:_Regex_Golf

on "regex golf <http://regex.alf.nu/>", which is a discipline of "code 
golf <https://en.wikipedia.org/wiki/Code_golf>", a game in which 
programmers attempt to solve a given programming problem using as few 
characters as possible,


I need to get out more!

../Randy


On 2022-08-08 09:19, Joshua Watt wrote:
> The regex to match github or gitlab was unnecessarily shortened, which
> prevented them from showing up when grepping.
>
> Signed-off-by: Joshua Watt<JPEWhacker@gmail.com>
> ---
>   meta/classes/insane.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 37e10ad850..b66926f540 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -1335,7 +1335,7 @@ def unpack_check_src_uri(pn, d):
>           oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses PN not BPN" % pn, d)
>   
>       for url in d.getVar("SRC_URI").split():
> -        if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url):
> +        if re.search(r"(github|gitlab)\.com/.+/.+/archive/.+", url):
>               oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol" % pn, d)
>   
>   python do_qa_unpack() {
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169085):https://lists.openembedded.org/g/openembedded-core/message/169085
> Mute This Topic:https://lists.openembedded.org/mt/92891575/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------SJL3uI2encjELPO50p9g0ca1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>De-golf?</p>
    <p>LoL: <a class="moz-txt-link-freetext" href="https://www.explainxkcd.com/wiki/index.php/1313:_Regex_Golf">https://www.explainxkcd.com/wiki/index.php/1313:_Regex_Golf</a><br>
    </p>
    <p>on &quot;<a rel="nofollow" class="external text" href="http://regex.alf.nu/">regex golf</a>&quot;, which is a
      discipline of &quot;<a href="https://en.wikipedia.org/wiki/Code_golf" class="extiw" title="wikipedia:Code golf">code golf</a>&quot;, a game
      in which programmers attempt to solve a given programming problem
      using as few characters as possible, <br>
    </p>
    <p><br>
    </p>
    <p>I need to get out more!</p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022-08-08 09:19, Joshua Watt wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20220808131951.2029559-1-JPEWhacker@gmail.com">
      <pre class="moz-quote-pre" wrap="">The regex to match github or gitlab was unnecessarily shortened, which
prevented them from showing up when grepping.

Signed-off-by: Joshua Watt <a class="moz-txt-link-rfc2396E" href="mailto:JPEWhacker@gmail.com">&lt;JPEWhacker@gmail.com&gt;</a>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 37e10ad850..b66926f540 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1335,7 +1335,7 @@ def unpack_check_src_uri(pn, d):
         oe.qa.handle_error(&quot;src-uri-bad&quot;, &quot;%s: SRC_URI uses PN not BPN&quot; % pn, d)
 
     for url in d.getVar(&quot;SRC_URI&quot;).split():
-        if re.search(r&quot;git(hu|la)b\.com/.+/.+/archive/.+&quot;, url):
+        if re.search(r&quot;(github|gitlab)\.com/.+/.+/archive/.+&quot;, url):
             oe.qa.handle_error(&quot;src-uri-bad&quot;, &quot;%s: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol&quot; % pn, d)
 
 python do_qa_unpack() {
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#169085): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/169085">https://lists.openembedded.org/g/openembedded-core/message/169085</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/92891575/3616765">https://lists.openembedded.org/mt/92891575/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------SJL3uI2encjELPO50p9g0ca1--

