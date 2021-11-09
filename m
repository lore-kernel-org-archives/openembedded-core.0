Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 406EFC433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 09:40:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.9949.1636450832863801648
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 01:40:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=MgldiCyc;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6947b2a56d=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1A998LuV005438
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Nov 2021 09:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=ZBMWFkxP7QkUcD1hvHgqh0jXk29F50n8hiycmQPTOKk=;
 b=MgldiCyczIaa4GILjo0FsLJVjDdHUffQ3rni32Im4eTaZ1xRM24I1A+C3IXv2off2Hss
 K14h2UmInbb+cMxKrUpxIHpUx5vDbI7rIqXjuFZYDjfqoIGRYTIkRepryVv8W6cmbwM4
 qkxgNgJb6UDjWh+hkmqzvywIGca4idNOeEfBPi0r0nRWJcmALymFAX0RGC0E8sTFSwm2
 fmxpemfxfqTnCeTLFtvQgkZQZVgZ3bIS+MvZ9UyiSn8DKAv0DBqQ6iilFqCd5PG+mb1B
 Ojx0Js2KYEs+aH9kenOuRrmUjhJ5NBjDlvwG51aIZ7ij+7GYOAtEGoGxB2jxLmGoa/jz Pg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c6rqahcf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 09:40:31 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.1.2/8.16.1.2) with ESMTP id 1A99eUxl005995
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Nov 2021 09:40:30 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c6rqahcex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Nov 2021 09:40:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXuNoBEc9DxlvNWz/6FvWuyNPWQX99GVznN/NlHHhllPD8jpDXqDHlzSOs93pmsnjba9gnBP1D6Oax5O9NmPkPs+BUwH9nHcvX5r1nj+ui7tLNE1IPJsEF0yLLaUS9kqIHTnX9H/2mbTW5OkYu5Yesk8LK5AeY3Eh4fmK9gVGvC7tqSgeRix/0s7DhMI4hbRLxETLs1yOe9p4lH2ebQN6QG6BynY9M+fROdgWZyYRnII9+Dqsib46P7Ioiw/a+Iy7lBQzB4ES8JRK639NoVEyhiBFtU/np7kT+0kjsoF7z4jTpL1bzbs+rdd/1JCLV+0w4yW280mHST6gf0SJzdeeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBMWFkxP7QkUcD1hvHgqh0jXk29F50n8hiycmQPTOKk=;
 b=O/OZvUkpEdD60BFJv0Ch3n6IwzjcKkYprecwfj/oPd3nTuh++z0WJQswDs2peO9wgRmLkp0NztqrORhOwTIWxfBKCjfDyab3m3p5OHPLAQHcZ/VPzNsenxY+ccZWO1MnbT6GjyrDeTJTwVwhsii+k+aljrri+4Y0n/jco32jvi3XctHRyBJDeOHXSnH/ed1CJDXpAFRX49QPeH/vmQnv+EeEt2zFbzTIF3r4Hd2D+Beeu3MFLG5PhrGIyXhQi3hTiB497hC1y1bQ7dK9R+VP66f6XQTyRSBzgAMskaPu1UzjZHrs7jve5YIY/+lje+GGdRGb+51zMr+oXZRPTGvtkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13)
 by DM6PR11MB2732.namprd11.prod.outlook.com (2603:10b6:5:be::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 09:40:28 +0000
Received: from DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::896a:7d8a:5ecb:7970]) by DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::896a:7d8a:5ecb:7970%9]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 09:40:28 +0000
Subject: Re: [OE-core] [PATCH 1/1] bitbake.conf: Set ZSTD_THREADS to half of
 cpu number
To: Konrad Weihmann <kweihmann@outlook.com>,
        openembedded-core@lists.openembedded.org
References: <cover.1636447679.git.liezhi.yang@windriver.com>
 <5e10cddcd2697c7b762c8c8d245bb76f8666aefc.1636447679.git.liezhi.yang@windriver.com>
 <AM9PR09MB46429C45C98E52EAF652EBF0A8929@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <f4b8c857-395d-2091-00c5-5c96a2ce536a@windriver.com>
Date: Tue, 9 Nov 2021 17:40:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: 
 <AM9PR09MB46429C45C98E52EAF652EBF0A8929@AM9PR09MB4642.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: HK0PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:203:b0::29) To DM4PR11MB5469.namprd11.prod.outlook.com
 (2603:10b6:5:399::13)
MIME-Version: 1.0
Received: from [128.224.162.198] (60.247.85.82) by
 HK0PR03CA0113.apcprd03.prod.outlook.com (2603:1096:203:b0::29) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 09:40:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55800618-370d-4dd3-a6dc-08d9a364f6c6
X-MS-TrafficTypeDiagnostic: DM6PR11MB2732:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB2732E58843E3605BFB60AFA5FF929@DM6PR11MB2732.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oc8nYh6cou3MLCwu1WwkKL+pJjPUMar4kXy24KKFQ71/DbA6T32GxEmvZJLUxSpT10BO3wNxaQ8ektC91vxhV3rTvt/0AiFDoB7D43s4mpafSCXwvTFEPiA+ExaBzlDcAxHWuFUYkoj+ah26EER4SXyDKeLQ73OXR1p3t9BggVBxkhcSWr5NzaW2xHxv1BjMsaqvhLn0wSj5w5j/cBJBHDMTYWetSixB9qIa1IyVOIe7J3KS7Igm+xwRRUEH0U9deiBr0TPhq/TnGP3r6CbjZJk3gjjDWjHryWsnnLiWg6BCLLwh/iQDbNlz1+5wYkvk48zEckL7cH+zKleIJfAWirEN6yxDCEi04wAIeE7AZu8nMWy9g0M2zunKRxUAacmAcp7a50eMD9WJm0XG+wydEt5YGVulhIDYnziH9UlewLFDt+HFwHS7CgW3hcz4C8df1+NaUhIg8QEPnurLQxtNloNv9VcTffCWuAu9nS+WPo5KKFLJE0AFcm3P7+8R4FLhpVHP9eRNvJrIKptOmJxQvdxkwLtOiGEFzFkoH9C6ra1MHgPnUDFLTWS7C4EFnMfD0y+nbLj/QOe3ItmAPqgUZ4XnjxGDHQh5blj8X3tm63NJgA82RdVqi7d7iAwSiuLocyNyz2RnOXU2KX0ziZmDhNATW3wSRggLiOyJZ1z64gLHz0wfP/4OOTb/h2E/vOg7+NTpQQPNF3uUysQNAS1zIlzVAvbrKIifqpi8VkmR40i6VviBwJtnJzbd6vdRJo1I+8cZNw9OmLu2NkZTSAeuvmc+8EJshjCdQfLhRq9rKlrBsJOnzRDtL3nUKlz3uvzpCLoaWkPBAWXlzQtQzu9bGWtKQ2DAQESQZghVhzPhzek5yHwZvOTZICywuODjT7lpGtlVRRrwmpvIwJZxGxUkUfcLEWlMzPRfTnGgiA8HYQk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5469.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(26005)(36756003)(52116002)(83380400001)(8676002)(6666004)(316002)(8936002)(53546011)(6486002)(2616005)(956004)(31696002)(38100700002)(186003)(45080400002)(2906002)(38350700002)(66946007)(5660300002)(66476007)(86362001)(66556008)(16576012)(6706004)(966005)(31686004)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T1E4YktRaEhUN1N2bXhaVldYU0hqOTBKaUIvUzFOWEFDWHJ4bkRla2M2RzRX?=
 =?utf-8?B?Q25mZW9PYWwyaFlTVndSNk9wQzdFQmUwUkRiMzE3VnhDSm4ycEtzOW1FcGt4?=
 =?utf-8?B?SVNJcWtNUzZiWE5iUzBDR1FYNGtpY1VEdEpMWnJ0T0YrVi9hRVl0VFM4SW42?=
 =?utf-8?B?dER5YUtBNThxYW5KeXdYaEp6aDFUakQraVUwdW5KR3ZDRmV4NCtNSnVRd0Ir?=
 =?utf-8?B?Kzh2V29tSy9WOFNEc2RrUlNxQWtZUGc0dkkzZTFFU09reGhlbm5jMDB2OFUr?=
 =?utf-8?B?Qi9YOGdVa2tKb3N6bFl5T2tBUG5naURTQVJmZ1hpNnFMalFOeElHNzRJSzZX?=
 =?utf-8?B?UUFVMEZJQnc2Y2x6Mm1KZXMyMDRwbExiR0FGRTZNQTR4NUJ1Z1N6QXVYNEEw?=
 =?utf-8?B?UWhuYmR3S3E3b0szSjFXSWVoeVZxdm5Ec0h1bHpOeDM3c3huTzJOVFN1UUhi?=
 =?utf-8?B?NTFiM3JQUnBwcStNdmFtS1hYdUt4L0h2aUxBTHdadHVYckhGY0Q3WFA0RFBI?=
 =?utf-8?B?TEhRUTR6MGplZk5vN3NxeSt5R1JUQm0vV0ROQ3NGaGwrcGRPa1lhWVdSdmdz?=
 =?utf-8?B?b2VPZk9EZWVJbFAzWDhuZVhGaTh3RjlSb3RHTHphaHFiUld3TFVObDg2UnVs?=
 =?utf-8?B?b1ZON0hubkxJQjVpR0dkVERXWG1sL3VoRmR4MTVndUg2VkxOS1NyazM4WCs2?=
 =?utf-8?B?VWwyTW5jMElucnFDOVlnZEZXSkZFREtTSHo2ZFBTWnc2cWxwTlhTT3pxMTVk?=
 =?utf-8?B?QW1wYU52Q1hOSXB1UVZkS0JzdGZVejdtT292UUI1WEkwK2hKUFZjYWpua2Nr?=
 =?utf-8?B?RHEwbkxBTW1jeFdQcjVzeWgxS1lBclNxeUQ2OFNqOFpoY3JNeEFEdXlpaUFv?=
 =?utf-8?B?eHpXUXdRNjMzdHZqME5OMmRMMHRRdkY0OFI3M1pTMFE1YWRRUSt0SDJiazVO?=
 =?utf-8?B?OURSUmJHLzl3WHFBMW90VS9ablRidnlLc0JVQTBVQitzemcwWkhnQTFpVUNn?=
 =?utf-8?B?dVY0K2FIcUppZVEveTdRaVFLeGJ0Ym52QThDNFJ1RTEyOWJ4cmQvTFRIUGdU?=
 =?utf-8?B?emNERi9KbnVBQkd3bXk2TkZuSnBwNDJ4b2FlTFdldm80ODN2enNmeUFFRnI4?=
 =?utf-8?B?cmxRSDJlYk1KZHQ3UngzR0d2UnZ4T0JkcWxVaGZYWEh6cmJzZGhjQURMVDBw?=
 =?utf-8?B?a1lYTGdlL3lZdEtMMVU0WlB5N0UxYisvTVN1OGh3K29XQXlQMmdXemN1NVhJ?=
 =?utf-8?B?Vmg0a1VndmJpZHFIZXhwWTFJNHprZHV2K1kwdmUvR2JkM1VpUVdvQzFwa0lG?=
 =?utf-8?B?QnRjMHEyd2Z4b1p5aXVrY1lIUy9GUkpRdmIyeXhHWndEMVltNWszL1lhWjB0?=
 =?utf-8?B?ekZ2S08zSnZXcnI3TUtFMFMxMXBXRExsdzNQdTVPZ3N5UlpPT3RXRHNoaGZX?=
 =?utf-8?B?NlpoQnFVN0lxbjFmYTN4RG1OV2c4bFRBVjFwZ1pNWWpWK2htdlBDVUZaTDha?=
 =?utf-8?B?M0NJRzRBOThITkpPMUNtRUxZNC9NczM1dGN2Mi9SSk50V2hWVTBrRE9uZkRs?=
 =?utf-8?B?VTE4cjhrUHF2RUttNHpNdEM5OVJGNDQwQWhzSkgrbWJNS01rTi85Q3ROMzNr?=
 =?utf-8?B?ZEtTdTFIWnVmRVpPRzdtakhHNVMrTVlpY0F2L3hYRFRGU2F0aTlmd3RBVlZn?=
 =?utf-8?B?eXZtSU1kNFJrRGtyb05QVVVaZVpHSWRJU2syTHRJejNPU2FqeDNkR1VCNTJa?=
 =?utf-8?B?N3EyTXF1SlY3bHdnbUFQM1JLdG0xM1lVaStkMFVqWlRmV09BRmVrMnR1SnlI?=
 =?utf-8?B?b1BrSmJBRERmVjlVdmZDUkFLR293aXdSN204dHl6R2ZrNGlzVVY3UEllRUVn?=
 =?utf-8?B?WlM3WUh0c29lL1M4YXJpUGYrMzh5QnFIa2M3N3R5dXptSklmeEhualB2NUhU?=
 =?utf-8?B?UWFpWWFlNnFXTHVKSWlxTVRXdU41ekRRWHo4ZlBXaWE4RHplYlcwdGxVdk9S?=
 =?utf-8?B?bi9kU3QyTlYyNS9aWStBVEhBS0ZweWdxd1R1bWJzREZoMzdNNnVsQWlhQjlB?=
 =?utf-8?B?UWtJMTN1VW1KcEo5Wk9ab0dXcURHdkRpU20wcnBkazNETWFISlJyVFljK1FI?=
 =?utf-8?B?QzZKMVJ1N3FLWHhKaDJIWDgvMEVsR1NiZWwwTHZJWm8rNGdUZXVkWU1TbWJi?=
 =?utf-8?B?MElpOTROaTNxeTA2eGFJYjROdkxteGNPMXBSaXRBKzBHTlV4VFlZbmMvTkZE?=
 =?utf-8?B?SVA4eVYya1YxWkVrQ251YzVlODN3PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 55800618-370d-4dd3-a6dc-08d9a364f6c6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5469.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 09:40:28.4137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OknQCFeGrVkNpt/ENGE0F7gPRN2jd0vTzd5XbjCeCdcBaOzaJRjtOluyXiXJsD1rFkhaU9rZnucVgZNJeOFqKbKRpwMk9C9okW+ufcM3RdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2732
X-Proofpoint-ORIG-GUID: s963v6nrRsZBMP3XNlBDd8E9J2JnpP0B
X-Proofpoint-GUID: iEVRfiK8_W8zoEALM8Gql06C_V6QXqfQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-09_02,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111090058
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 1A998LuV005438
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 09:40:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158004



On 11/9/21 4:41 PM, Konrad Weihmann wrote:
>=20
>=20
> On 09.11.21 09:48, Robert Yang wrote:
>> The original value is very easy to cause do_packge error when cpu numb=
er is
>> larger, for example, 128 cores and 512G mem:
>>
>> error: create archive failed: cpio: write failed - Cannot allocate mem=
ory"
>>
>> Set the ZSTD_THREADS to half of the CPU number can avoid the error in =
my
>> testing.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>> =C2=A0 meta/conf/bitbake.conf | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 71c1e52ad6..46ebf5113f 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -833,7 +833,7 @@ XZ_DEFAULTS ?=3D "--memlimit=3D${XZ_MEMLIMIT}=20
>> --threads=3D${XZ_THREADS}"
>> =C2=A0 XZ_DEFAULTS[vardepsexclude] +=3D "XZ_MEMLIMIT XZ_THREADS"
>> =C2=A0 # Default parallelism for zstd
>> -ZSTD_THREADS ?=3D "${@oe.utils.cpu_count(at_least=3D2)}"
>> +ZSTD_THREADS ?=3D "${@int(oe.utils.cpu_count(at_least=3D4)/2)}"
>=20
> Then why not just limit it for the large setups you are referring to in=
 the=20
> example, for instance like
>=20
> ZSTD_THREADS ?=3D "${@min(int(oe.utils.cpu_count(at_least=3D4)), <inser=
t a sane=20
> value of your choice>)}"

This sounds like a good choice.

>=20
> BTW this can be also done in your local.conf - as Alex already said, th=
ere is=20

Set it in my local.conf can make it work, but it isn't good for oe-core's=
 OOBE
since the issue still exists.

> simply no reason to make it slower for everyone, while also half the th=
reads of=20

The whole build contains a lot of tasks, for lower cpu cores, the total
resources are fixed, so when zstd uses less mem, other tasks can use more.

Limit zstd's thread doesn't make the build slower, but faster in my testi=
ng,
it would be great if you can help test it. The simple testing commands ar=
e:

# Make everything ready:
$ bitbake linux-yocto

# Before the patch, set ZSTD_THREADS to 128 and run 6 times:
$ for i in `seq 0 5`; do time bitbake linux-yocto -cpackage_write_rpm -f =
>=20
before_$i.log; done

Note, the time will be printed on the screen, not the before.log, the bef=
ore.log
is for strip the logs and then we can read the time easier.

What I get is:
real    2m12.079s
real    2m0.177s
real    1m52.426s
real    2m3.396s
real    2m16.018s
real    1m58.595s

Drop the first build time since it *may* contain parsing time, and for th=
e last
five builds:

Total: 609 seconds
Average: 609 / 5.0 =3D 121.8


# After the patch, set ZSTD_THREADS to 64, and run 6 times:
$ for i in `seq 0 5`; do time bitbake linux-yocto -cpackage_write_rpm -f =
>=20
after_$i.log; done

What I get is:
real    1m50.017s
real    1m50.400s
real    1m53.174s
real    2m4.817s
real    1m53.476s
real    1m56.794s

Drop the first build time since it *may* contain parsing time, and for th=
e last
five builds:

Total: 576 seconds
Average: 576 / 5.0 =3D 115.2

So the smaller number is faster than the larger one.

// Robert

> a 128 core machine could be a trouble some setup.
>=20
> Last time I had this issue (with XZ back then) I used=20
> "${@min(int(oe.utils.cpu_count(at_least=3D4)), 20}"
>=20
>> =C2=A0 ZSTD_THREADS[vardepvalue] =3D "1"
>> =C2=A0 # Limit the number of threads that OpenMP libraries will use. O=
therwise they
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#157998):=20
>> https://lists.openembedded.org/g/openembedded-core/message/157998
>> Mute This Topic: https://lists.openembedded.org/mt/86926962/3647476
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=20
>> [kweihmann@outlook.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

