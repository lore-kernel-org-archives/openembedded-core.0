Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD9EC43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 09:10:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.22683.1656580194245894717
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 02:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=PzJNdES9;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=4180c7f93a=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25U8NEOO008471
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 02:09:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=2S4l6fA9gVM1sdA6GqLVt5htQRL7YcbokWZoP4cdnhs=;
 b=PzJNdES9013jXkJBZmZ0LwW877XfHdI66yk+WB7RJbDCicm9WKyu7aQongFucAgf3+mF
 A4zaNSTNIX2CK3AI7VOrw+4/MFcawzDspHnWQdKLtRR/Zc8GKHnmhA+5smrBKYXKiouC
 qSLIhIKjp3RttZC4zVuwJYALwhevguNE5ln4QxjBce2jR6gET5ErRO0XvMiQqi4jvyFQ
 lL/pwlADFQUanFVACvL5KWy2ksIstOE0NTyOAkQoj/Oz/UvqeBzWc2N1oHgMWFGWjKBq
 K1rtRCozlbz7OGS3z6TJ83ONQASCuUdduTawgu4rkL+h+c7moTW1QAYgafFOb8hPJsGN ZA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gwwn4bufq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 02:09:53 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25U99rcn015027
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 02:09:53 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gwwn4bufn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 02:09:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8JGUw/mlT4JE0AF7zPXRtAvRNbu1azo1tq7MdB/g3eFRcTGugrdm8xM1/JMRa9A1GPuh327ED9ql4kUFnlSsVqGOkNsrjmwqhEXvXbPs/ALili7cMO6kvEzSoUm549utk1N6RdggS9pZW7iMkBmFlddO7AO5cEzOUsYOcgP5jZLsNfx9VnOkwXBCbvOdbU4Ah5oNYcD5hqqhv7SyxUJqZac/xmsTwYQjQbEqcIi9vpSgV58p1pbGm6w8ze7YW0Nj9HgbKo93APcByglciXr6v3cPpTYnTPR0OEfzwUPsseAvrlN7HOgb3zjX+Od6fJ6gEcdly6fQZpp4/EtLzKtWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2S4l6fA9gVM1sdA6GqLVt5htQRL7YcbokWZoP4cdnhs=;
 b=NBQxEBspCCjkhlP1g1zQgwUrnCT1NMM6XS12HXX62nOD568HbHKvPd0Bto6TUyHCKGkNDZm4Df7U2l70iNNKucAtIhjKpMbtV/K2Z/gCxvkHBXw5pmp1Wgr1IEE6QDixQUMSOZMlIqrDFkwzVN+NKI0n7L4G80KyRy545fmO7Nsn5EpSqaxOP3eNm+8jrFQLCvvZJCj+JcT2ShdFOHR3SlwyuxTCl76tFYidL75Thcb9sz4bXskD6S0kkZ+pHENLAAlYjdoSADVBpmUWalGuVC3G4TNMr4GPeA0razhz0jeMKbTavqYojBZHlSiD+/tQ+j/RI9UzpgUWgctaDOdpFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 PH0PR11MB4982.namprd11.prod.outlook.com (2603:10b6:510:37::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.15; Thu, 30 Jun 2022 09:09:50 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::19a3:c1fe:52d2:e9f9]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::19a3:c1fe:52d2:e9f9%9]) with mapi id 15.20.5373.018; Thu, 30 Jun 2022
 09:09:50 +0000
Subject: Re: [OE-core] [PATCH] glibc-tests: not clear BBCLASSEXTEND
To: Randy MacLeod <randy.macleod@windriver.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org,
        "Gowda, Naveen" <naveen.gowda@windriver.com>
References: <20220628152228.16791-1-kai.kang@windriver.com>
 <738df83db6fae233af819932c4bf56174cac0528.camel@linuxfoundation.org>
 <7f63cc20-9042-8c15-2fed-f25ba2e7229c@windriver.com>
From: Kai <kai.kang@windriver.com>
Message-ID: <3e7e0d56-d7e4-4d2e-b4b0-548b5bb7df8a@windriver.com>
Date: Thu, 30 Jun 2022 17:09:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <7f63cc20-9042-8c15-2fed-f25ba2e7229c@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: SL2PR04CA0021.apcprd04.prod.outlook.com
 (2603:1096:100:2d::33) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f82dcdd-99d9-4616-47e7-08da5a78494f
X-MS-TrafficTypeDiagnostic: PH0PR11MB4982:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aVN4WZX2CZsmxoVdPs/2WDedoujW2Y8M3AWzK61X8PggekMD5NN5FhCk7JAgjs3FEuw86Q1ClRnfddWQsKEbFZ0S4QaJb9igL6I8H6+/IzZ/j2692OZ9q8+XrQajXL86UXTfGmL9x56lJO4bNm5crXIdJ698VEAglo0uIYwaMqchZUP2uzcHuT7jhESrEUX+H1qwetL6tefz6y5Yx0zoBek4DnHS22tJGrXWkewipzq9jU/QXOcmaMExfK+mMDv5d37VOe9zppvfZaTef8Fepg50HgttrlaXb0tWA6KwLR+7K0oHJ72dTYZiLH2dV3yqMreCCKnTgqErGevCc6KwWhVU7qbDPRVI8gdWWXJ0Z6dYHDrhyQ5B28DRYjS233236hJsfNdZ4KPJOT8T6fxGeZBcLG07iDEcRA5nfXM8eApxpYt6QkCDm+xMxA37raX+odW+IFdJe4YoLqsExuijTI5nfEjLUjGDU4Ua2d1c6/3QvsKeJaLlZP/2iV0K4zj9MuSfJZhdk5PPfmC2kNWceSndUNYc8MKa9CqFCAuZw7pO/weiGzLHnfnmPzyZD3TLxeA0LNCIpO5GkaJpphr72z80w6ooie8tKDy4Jpg264Gtw2kR0x95G8Yb1oynRlTjJMshOpQ9pfC/BE6FWrFml9HtIHDKpOGB8c/3i2Sja5EOaTgJoI24NQzVvC629QitLmFJD/V+LnQrmx1yDH4KJXvm1dbHtO9hjRTodgTmsrX21/Er3rU5dAzxvSi3cWrDRnXgZQjQhLrqBg657FKKJD6fjEJxkv9zjHYeo5XWvW+JNd4TIgq5v0220g3K3lYUW0eahFWejBJmysvPi6gdHAFL+eokZUq64/XQXx+xY3xOdW/755iR34BQK4iMMb89fSuJbs+oG0owNmZFngA0vghrTgtJ095qR76E3vwPMPlFNemJ+cux/pc2d4bqz2lg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(396003)(346002)(39850400004)(366004)(53546011)(186003)(6506007)(52116002)(6666004)(2906002)(41300700001)(2616005)(26005)(6512007)(31696002)(86362001)(38350700002)(8936002)(38100700002)(83380400001)(66476007)(66556008)(66946007)(8676002)(36756003)(6486002)(966005)(478600001)(5660300002)(31686004)(316002)(110136005)(6636002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QXV2M004NHBpanNva1NId0s0SGtPalZhcE9TMWUxTis1T1UwYnhIenlxcnR3?=
 =?utf-8?B?UUJYT3V2WmNVeTFoUXB2MXBrdXdUZG5WSmg2TVFZU2tCaHRzK0dBT2VXUkh6?=
 =?utf-8?B?SEhXZnRmQjdvdDNkcjRDbkd6TXhyMk5TTzc1Umw4WWpjSGEybmNuWnpHS1kw?=
 =?utf-8?B?OVpSMUtNaHd4ZFVSSDRqTU1sbS85RnIwNDBIYzIxZnQ3VElSQ1JNcGpyTTFl?=
 =?utf-8?B?ZUVhLzRDcklVNnRLQ2xQRTlYOUx0Q3dxWGRwK3RDUzM1VkQwdGV5QU5CT0h3?=
 =?utf-8?B?WEJxcXNYY1pnQkNVditzbHQ0M0NBWVNkYmlHL1lYcWMzbUhsTUkwNG9abDhN?=
 =?utf-8?B?K2x5TjMwL05iNXFVL2FHdWYvRS9UNjRoK1pLYXNNYXhXYzF5NmJ2Zm1JQVRC?=
 =?utf-8?B?eDZnMjErbzVVTDV5bitKVkxqQUlpZlQ2eHlzZDUzVVJ4QjdvRDcvUXNjVGdO?=
 =?utf-8?B?cFQzd0dacWNtWUFwYjlWYXZ3Vk5aS1VmN3pLcEpDNDRWNHFVazdVS3N1L3Vq?=
 =?utf-8?B?MVlmRnFadGtZRFoxVFAzQmFsa2dka3RPMjZHL1NLczJISFNyWm9iYTRFUVdj?=
 =?utf-8?B?S3lValNOa3ZweEVSMEgyRzRTYThCaHJCMk8xclpSRldFMHhLVms0eWVlRDNa?=
 =?utf-8?B?K1VKM2tkK3F3UEovWnh0czdDWGpJUWdCTjVia2xDQ1lKblBGVk4ra2N6ZlYw?=
 =?utf-8?B?Y09OcmYwMXQ5VGZTb080ZmxscGx0c2ZwY2hNaVBWNVNSM2h3bGxkd2JveFdF?=
 =?utf-8?B?YjhjZTNYR0xxVWp4WS9jVmxNM2FYcWY3cWQ0Z0tJanpRSmVWS2wzZGF5VkVv?=
 =?utf-8?B?N2dpMXR4WGorN2ZZQ2VjTWVCb2t0RktBY09oNDJDaTNaRDlhK0Z3a2FIMW40?=
 =?utf-8?B?WG4vNEo0NW5uNWpEc0JVQ0RmSTBPY0lZRjE2Q0JoVFp6QXRxOERzcW1JR1dW?=
 =?utf-8?B?cXNtcytLRU5YTVNQWG1DUEtpOWs0eWVKMTFTLzJmUk1iUkF1V1BIY1NMUE9D?=
 =?utf-8?B?TE1rd2twMmhKR2RkbUhRTjlabFh1Q2M4YUxrUnZ2MmJ0MDhtNGpBQkcyYitB?=
 =?utf-8?B?blFWTlQ2OWpjelkvS2pLeXd4Q1dxbXllUHlSaVNtNlZwajBOU0dyQytvZEJw?=
 =?utf-8?B?d3I3NzNoSlVIdEs3bE9Sa3ExQVVFa2hYaGVzbTI5cFdCODRJWUdLUXZ3dEJR?=
 =?utf-8?B?SVBoejZHTTJUMXZQMUQreVpYZFg2UXNDZzhKNGRPR00wM2hFekpJSndSbFpi?=
 =?utf-8?B?eDJJNVNiUTFtNWpSVjJOcm40N0xVS09aSHhXUVIvOEVrQTVWL1ZZd2x0MEhR?=
 =?utf-8?B?OFVwb0xSamdNcDRSTmYyZ1FJNVhldzM2UEN1OXoxR3VuOHhJa3RYWVQ1UGQz?=
 =?utf-8?B?MTZzRnc1YTlCclA3T3d6NDdUclhqMTR5c1lqUVdjeG1meDBHYnMwd1hQR0k4?=
 =?utf-8?B?UDBEZDVBZ1VMZFpZYTFHZUUwR0xkN3MyalFLZy9yVHNyYUtQYWNVd1hwZnAz?=
 =?utf-8?B?SVRmSEQ3aHFla21McHNjbERDZXNXVHRjV3R5VG55TXRSYmlVSWRWT1dlYVM1?=
 =?utf-8?B?aHRsQytCeVZ3YTRSWkVhbW85MmJIaXNEaVlraXJmY29HQldkbnJlUjF6ZHkr?=
 =?utf-8?B?V2VpSkcwR2FSdmIrL2lNeVdFSUd6NkVHb0xIQmpWelZXQlRLcUF1b3p4VE5L?=
 =?utf-8?B?S0d1U2FzZXdzSWo0U005UStzbWhVNXl1Y1owQlE3WmZrZ2pxekJ6WWkyd0xE?=
 =?utf-8?B?ZHNtc1Zrc0hPNmo5K1hLSjV3MXFHSTRHenQzS3lZVjNvQXlhekdoRDJhN2FK?=
 =?utf-8?B?RFhicmgyVEduZ1I1dVZZdVE3RE9hb0hSYXR6aHVaR1JkdGtLSkNWVFRrdStL?=
 =?utf-8?B?UWF4WWxvRVZqUzV3ckJiRkFtR0F2bnJFS25qTmRSVHJFZTdOTDQzSk9JTzlv?=
 =?utf-8?B?UllOQkpLWTMxOFRuWVU2NWtBcnlQeVp1Y29yS2hKRjBOQVd6QkdnMFp1MFJn?=
 =?utf-8?B?NW5SZVk1c3VYWGlPRjNpRUIvZHBwdjJ6THpyQ1ViL2xWbmlYYytiR0ZVY2NW?=
 =?utf-8?B?cU04NnBFZlQzQ3c3R3Fhandrcmx1cWVhSGUyRncwdTVPSzZDdS9vK3laR3Br?=
 =?utf-8?Q?/eajDV6hyYPit5hwmFVaI15h4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4f82dcdd-99d9-4616-47e7-08da5a78494f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 09:09:49.9947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dZ0h+78WzqDBMcoZVYA0zBslU0/asKDcxrp5MQLruTgfy0xrioNpATScNpHROBr2eiHZ06VXt8+XVhsWpXXGTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4982
X-Proofpoint-ORIG-GUID: bvs3crmIq3XMf9o2cvgGvy2PoSpP1NHv
X-Proofpoint-GUID: qq1I67hrsL5ezuRvXjEqw03F-aIdGSgl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_05,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206300035
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 25U8NEOO008471
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 09:10:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167407

On 6/29/22 6:23 AM, Randy MacLeod wrote:
> On 2022-06-28 12:03, Richard Purdie wrote:
>> On Tue, 2022-06-28 at 23:22 +0800, kai wrote:
>>> From: Kai Kang <kai.kang@windriver.com>
>>>
>>> It clears BBCLASSEXTEND in glibc-tests recipe to remove 'nativesdk'
>>> which is set in glibc recipe. The side effect is that it removes
>>> "${MULTILIBS}" at same time if multilib enabled. Then there will no
>>> multilib version glibc-tests. So only remove 'nativesdk' from
>>> BBCLASSEXTEND rather than clear it.
>>>
>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> ---
>>> =C2=A0 meta/recipes-core/glibc/glibc-tests_2.35.bb | 5 +++--
>>> =C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/glibc/glibc-tests_2.35.bb=20
>>> b/meta/recipes-core/glibc/glibc-tests_2.35.bb
>>> index 414f8660de..028e83e865 100644
>>> --- a/meta/recipes-core/glibc/glibc-tests_2.35.bb
>>> +++ b/meta/recipes-core/glibc/glibc-tests_2.35.bb
>>> @@ -18,7 +18,8 @@ python __anonymous() {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar("PROVIDES",=
 "${PN} ${PN}-ptest")
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar("RPROVIDES"=
, "${PN} ${PN}-ptest")
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar("BBCLASSEXTEND"=
, "")
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bbclassextend =3D=20
>>> d.getVar("BBCLASSEXTEND").replace("nativesdk", "").strip()
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar("BBCLASSEXTEND", bbcla=
ssextend)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar("RRECOMMEND=
S", "")
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar("SYSTEMD_SE=
RVICE:nscd", "")
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar("SYSTEMD_PA=
CKAGES", "")
>>> @@ -95,7 +96,7 @@ python populate_packages:prepend () {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar('DEBI=
AN_NAMES', '')
>>> =C2=A0 }
>>> =C2=A0 -FILES:${PN} =3D "${PTEST_PATH}/* /usr/src/debug/glibc-tests/*=
"
>>> +FILES:${PN} =3D "${PTEST_PATH}/* /usr/src/debug/${PN}/*"
>>> =C2=A0 =C2=A0 EXCLUDE_FROM_SHLIBS =3D "1"
>>>
>> Have you tested the multilib glibc-tests and been able to use it
>> successfully?
>
>
> If Kai hasn't Naveen will.

Thanks. I test it on core-image-minimal with multilib enabled.

And 132 test cases of lib32-glibc-tests run, 121 PASS, 10 FAIL and 1 SKIP.

Regards,
Kai

>
> ../Randy
>
>>
>> Cheers,
>>
>> Richard
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#167350):=20
>> https://lists.openembedded.org/g/openembedded-core/message/167350
>> Mute This Topic: https://lists.openembedded.org/mt/92046086/3616765
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=20
>> [randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

--=20
Kai Kang
Wind River Linux


