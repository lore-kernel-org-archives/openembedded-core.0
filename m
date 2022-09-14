Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7CBECAAD3
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 07:42:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3623.1663141338689366253
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 00:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qffiS3+3;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6256f4cbec=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28E70v9q006674
	for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 00:42:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=w3zHHL4d3aviJTW7NZXTK6BsUT5G6iVm6F+Lpcp5K70=;
 b=qffiS3+36yU/CiEhzzoB7HB0WStuI05D3sMgSUkJOqhcQ4SPskwCLx6w5BQq/zcqkLS+
 V4F/GipSFAyhyAWW+vXUlo/nGKsmITY9CWW8tNtgBFbaSk5uStIAUuB40jElGUd1NEbQ
 2AbCoYLOuUVK8sCla/XCUKobcbb+6hjlY9cVQhSGvOwKIeEZ1jc0KyAlMnOOXpL3vcgm
 EIOQs0kf0x2l6swYVGaQgqNi8G+WiHdGfkvw3bmlWVXupATInSfV/F3iXoLvUbym/74b
 IPXtlKDJ1yYKIadb1Qb/g/h6Tqwhqf9J9ELzEawUPY4AArFCbR1ur/Gf6sJ8phVXkqSj NA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jk4pdr9n7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 00:42:17 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28E7gHPA021307
	for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 00:42:17 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jk4pdr9n6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Sep 2022 00:42:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bu+4UAHROIOIggu1TIJU0RJufcstK/dYYpS/lplcAQHDtFhzPm0QlmL1zV4DGL90xVj38aw/dZluiEeKXEWvafDoIQp2HzEd/IvGuzC67PRZ0sgxVRhNFIGK8RAvjUwetJlx37WyWG9ZNQ7xvWjIWolmpRGSmY8vMDWnZk6KjI/OZer0RVgSdhqaB84cgsufB50CAiy6fwwg8cK3VeQCj1YNq1jPG/Ui1J9k+G8m+kw++XlGQN0CM0u2/E1QJOPO1tjcMepmeZpbz6bkiG9QVGzoDLp8kSfreWgIEXX0EtC5XIfWuYxMUmEfypI/Ayp9j9wn6juuAvLy9p/woE4wKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3zHHL4d3aviJTW7NZXTK6BsUT5G6iVm6F+Lpcp5K70=;
 b=GkiI1ZTfFseokDMMTaypC2km6zbxbz8QTZZC38+5LEO8rpDBwJpl7+Pa1xqUw45BbmcGATcfbwqA+quCORmm1l5VGh49/InrIHWZpFeXxKoyYNqqdZ6zSJtwnZbRKvSgWSe1lI2jgKnWWevDg8bos4dcXu65SKpwWNMkg0lC5li3uZjI9Op4gz8oeFGoJB0sMBYvNI+vqS7V7XkYn0WVjurIctR+37kOY5l34Bv1ZfkOPxbrEZiEfX88exFBpyGCOomB6HbqVQSfDOdOWwAepnS/lMPlx1Yz4pWK36pqmU3vvyxkrYA+6FhRW5uph2PQexouU3tnSaaq+EvnFb4Kug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 14 Sep
 2022 07:42:13 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed%3]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 07:42:13 +0000
Message-ID: <8e5b3cc0-bf66-fb7c-0199-ae6766c76cc8@windriver.com>
Date: Wed, 14 Sep 2022 15:42:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [PATCH 1/7] scripts/oe-setup-builddir: add a check that
 TEMPLATECONF is valid
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
        Alexander Kanavin <alex@linutronix.de>
References: <20220831111401.3330342-1-alex@linutronix.de>
 <e73f356f-87dd-2aba-7445-2f93ad6bf145@windriver.com>
 <CANNYZj-fLHiNEOLzp5etSQRwtNb55kHa4k02jzRRm=c3dohULA@mail.gmail.com>
 <6917e065-3b17-a57e-f862-90366717106b@windriver.com>
 <CANNYZj_OqjRgsQQwQditr1iHCM1RkZak-hFG-zEsqPmMfdNd_A@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: 
 <CANNYZj_OqjRgsQQwQditr1iHCM1RkZak-hFG-zEsqPmMfdNd_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0078.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::11) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: 12e229d6-1720-4f9e-755f-08da9624a39b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A77BQc7/LD9DDlzpBKhtIXSYom+aXoUEYjXbgNBjp6SBLY9eOzU8KXZ3YW5nmJX/KziplPj4qSe6pIDWZ/cw43alMM0krd/FTwKXeTYejChP7Xu+aUP9JtiXvGInbAucVi/Z5UQ55bGY+rCgWX3tI7+8QXndc9u3lR5cPirh7ZkNr1C/0aJyH3wPeocT74Qrt0QmKyK5xz0JwwA4syjFyCGhe00iVICqVe4Gw2/OJrEmU+aYhuSMdCkhkdeuqp0nJXU6E23sDvWfpRPxnkOWA8mLbxm+97tf8V1Xqj+iMFxbhu+6LldiONaZMK+qmfvz+WOonMRk0smtzyMNHz8EmIHbiNA08PuljHdo51JUxR+hN4cdd6zF7FHJDCm4fKbwSX9f2iuftoxG8VSdSVH2k91pnDk9wJGlONKT+opdPBZB8Lx3BFwNW1UZAViD1jaU4gsmFKYSSkvj/k/3hbaOptnClu9FMMTfFoSMX6tpuRkoT6QiMtWthziMl5HeFz8ewMfNHXSesUdD9U4tFGd+Vo4FrVWC6Fj2Ev9nCQnbWzNpDBozb9+vaQMEXdQw0FYhlO8LyzAvwiYmcVZLETu3VUNoSTWmN+7SiL3JK6G3FehBu6hr2hFWk55Rl5hCjF7n2iEf4Hgm329cKHmTG5hrusg6I48NMbIBwAfEpRq/43rK+7uRgGCxSQLfDSG1NUw9dQnUe4gkQrDAHVtWgywjSMeUh9tLBo4wvAdVgEksvILLFut7p5dWF6FIwjIljjBJnQMxi2NXIft+9lnfmnXq63k9wewSxGDyZWmzLQrBJW4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(376002)(396003)(366004)(346002)(136003)(451199015)(2906002)(31696002)(186003)(478600001)(41300700001)(8936002)(5660300002)(66476007)(53546011)(6666004)(66946007)(66556008)(4326008)(31686004)(86362001)(2616005)(6486002)(8676002)(54906003)(38100700002)(6506007)(36756003)(6512007)(6916009)(26005)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aWpTSkhDUWZsM0ZZdVJJSCtHcFloUjJtaFFuVjhXTFFmRjJXTHljLzh0ZmI2?=
 =?utf-8?B?Z00vZlFKZi9aVjdnUFZJS1dLYjlWTjBXdXBCUXRxWDhXVXV3NHQ1NE8rTUlj?=
 =?utf-8?B?dDZqeGJ0MGpmZkg5SU03eXlWdFdjR3A1d0k1bDMrVHorclc0RkE1M1owblpr?=
 =?utf-8?B?emltc3BsekxaWUhUZ0FSZGFTbUpxMElBV2lFdldpSXg1QTZZNDJVQnZxa1RU?=
 =?utf-8?B?RmZZZzBhYVVpUnlDVXBPc0lTd25iRjVpcnVTT2prbmZEOW5ycjVaUi91U0dl?=
 =?utf-8?B?YVoyUm05TitxclJUWEtuQS9nOStCY000bFdKd1FXNUNHUjFseFFwWFNLZDM0?=
 =?utf-8?B?RUpEeithSzYzSGpNeUdkMWJaWURGUjlTM0RIRDNKTSt5bnFRc0x6NjR2M3B3?=
 =?utf-8?B?ek9Zc3dDK0E2eXlKMGdPbkpIUVZWa1hNVEppZkl1djlLd3Y5YTd2cWRsVEFW?=
 =?utf-8?B?ak1UWmgvZ0YzZ2xKa1haOHZibjRFTjRtUHJ5VFBOM3REYUVwMnRxNG9IUUts?=
 =?utf-8?B?YU9pcy81Q2ptM1FsRitDNDdaa1ZqdFBiN092d3BJOW9ZVmRTd2lsRHczNXpG?=
 =?utf-8?B?alRoeXVoaXk5OFFndThnUFl5YytrSVJRYkJNNHJWRFBFMFBQN3pKZ3NkOHNk?=
 =?utf-8?B?ZFRWdUMzUVlxbzlGQmpWVlUwTmF3ZysrYjIrS1RSc3RjTm9Oa2xsQVRpSWEx?=
 =?utf-8?B?R054ZXYxRmlXSXJVQUZneUx2TnljOG9GNkNKY3Qzd3VTcEF0WkRsUnkvbUFk?=
 =?utf-8?B?Y0tGL25jU2Z4MHY0QTF6d2RBVzNIMld1bXpXV05UODU0aWlKdW1ZWVcwUEFQ?=
 =?utf-8?B?RDZ3SXNwaVFGZUdacFpYdW9XM0pxYjNhV2ZLdjdWdFpLU24yQVZNVitFb2FO?=
 =?utf-8?B?by9SREZ4WVRPOVZuNEczT0IrVHJMR3Fnb3FxNWRVaVhFOVVvRnFEVmNLMzE1?=
 =?utf-8?B?dFA0N1pCYnZGTk9rdDc1bExJMDd3ZkZvSXUvbEM4TXJnZnhyQmNsK0FqU2FN?=
 =?utf-8?B?SzVQL3JaUUgzL1I4SDJVOFZOMXdSenpHOHRBLzIwZUswSzMyYkcvcS9oc1Rv?=
 =?utf-8?B?cUUzUWsxZVRRbHFNeHJkU0RtdjEvVS9MemZPVGNWZUhIZUx2ZjlGdUE5bXJN?=
 =?utf-8?B?dG56UXRONCtpUFVubUdCMVo0aXdFV3hqVTZQRVFLdVMwNnpTT2VzZlYrNi9W?=
 =?utf-8?B?TUdwWEdNenVSRUZqYWM1MVRFUytCRDNHWXc2SlRacDhCazFxQVc0VXpScWJq?=
 =?utf-8?B?cEJkUVVpN3dqKzdTbmF5ck1GZ0ZBUVQ1S1lhYy8wYzFZWDBGaGVzZFN5SC9q?=
 =?utf-8?B?akJrVEJ2UkNVb0YwWnBiL2YveTdUUDg0cHM5aW55SVg4Ti9mYUcrSkxTUWdU?=
 =?utf-8?B?QWtJVnZFbW5FbWsyNTZXd21NM0M2Y1FNbHBxV0txWFpuUDNmWHlpeE84OTZQ?=
 =?utf-8?B?YTF6ZnJ1RGZrODZ6bDVXUXFxTElQeWF0dWloS2JUOUN5dytNRHp5ck9naTNN?=
 =?utf-8?B?bEZqZFRiWkhtTzB3TlNCMWNDdzN5ZmJ4bE4vZFMzTEpoTmxwQVNBUTJoclBJ?=
 =?utf-8?B?UHVSVUswN2ROZ3ZYc1NRSlFZcnFKTmxZMEtKeXprN3QrcjBEMWxhTHIwd1E4?=
 =?utf-8?B?eitON3hjcWM4N01tSG9QZlpLd1A0dm1pckhFbGUyU2ptbm9takwycEtVRFZx?=
 =?utf-8?B?YXdxTE9qWS9IMEhwYVdSTm5scDBCOHd6Nkh6MC9kNnJVZGUrUkRzWkZZbnhx?=
 =?utf-8?B?VlF3a0tCd3pCMElEaVFlZEI5YlJHbUZtNWtwa1JRZUxDVys4bkJlbUx1L083?=
 =?utf-8?B?VGlwNmxkUFN3VFVBWGl0SFljbTBEbEt3QnluWjFTN3M3dEY3YSsrNjBaWlFp?=
 =?utf-8?B?ZG9tV1pUdUVsRGp6T3RsNldwcmQremkvZkRkcnIzWGlzRTlURzFuMzBtMUJj?=
 =?utf-8?B?RzNZd1V3Z2NWR3RLdnBIblN4YTZRSlF1TDRCcmFqblN2TXBSSlJxck94dTZr?=
 =?utf-8?B?N292aE5mM0hOM0J5Q2RiVDdFYUUyWmxqbDhPWG9CMVBkUG9ZcVN3MUpwSlF0?=
 =?utf-8?B?Y3ZIcHNYNlZRY0pTdGlEM0FpNGxKRGo1TzZzNGEydUJQd09KRXhBR3l0b2Yw?=
 =?utf-8?Q?WGnxj/A4LTQAfVVB3n10yqXL1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 12e229d6-1720-4f9e-755f-08da9624a39b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 07:42:13.6298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yGEXAU0B5zBRPR+qzThNwP0E3UdS4hFFTAgqN3CqtO0j6v8eL8+BLsxm8nq7xFcxbesXmFpW5fIfoEgyHt9Bbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6006
X-Proofpoint-ORIG-GUID: VPVCHVKGypvFex8DfDP6GxIu6dDvY5qL
X-Proofpoint-GUID: nmTo47G3XKymXAYEG35wiE2Y-5zqxA8-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-14_02,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209140037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 07:42:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170638

On 9/14/22 14:39, Alexander Kanavin wrote:
> On Wed, 14 Sept 2022 at 07:49, ChenQi <Qi.Chen@windriver.com> wrote:
>> I'm reluctant to agree that this is like machine and distro, because
>> it's a hard requirement that machine and distro definitions be under
>> some layer, otherwise how can bitbake get info about it? But
>> TEMPLATECONF seems to be a different case, it could be everywhere
>> because it's used by the project setup script.
>>
>> In our case, the TEMPLATECONF is <project_dir>/config/, and layers are
>> <project_dir>/<layer>/. This directory hierarchy has been working for
>> years until recent changes.
>>
>> Do you think such directory hierarchy makes sense? How about we deleting
>> such check if there's no strong technical reason to do so? By 'strong
>> technical reason', I mean that some codes in oe-core are written based
>> on this assumption (this is the part I'm sure about).
> Again, it's not about only code. It's about humans too: we benefit
> from having things where we expect them to be.

$TEMPLATECONF/bblayers.conf.sample has a list of layers. These layers 
may have dependencies on each other or they may not. Which layer do you 
think should this TEMPLATECONF locate?

TEMPLATECONF, by its nature, is a project setup variable. It logically 
does not belong to any layer.

Why would people expect some project level variable to point to some 
directory under a layer?


> If your templates are
> in meta-layer/conf/templates/ you do not have to document, explain or
> support this;

Again, why this meta-layer should have knowledge about the whole 
project? It should be the project that has knowledge about layer, not 
the other way around.


> anyone new to the project will simply pick this up from
> prior experience or official documentation.

When users see a file in a layer that refers to other layers which this 
layer does not depend on and not been dependent upon, they may ask why.


>
> That said, there is already code that makes this assumption too: both
> 'bitbake-layers save-template-conf' and upcoming 'oe-setup-build' (the
> patch was sent for review here) consider only
> meta-layer/conf/templates.

Give it a second thought.

> I have to ask the same question to you: is there a strong technical
> reason that you cannot move the templates to the new standard
> location?

Yes. The bblayers.conf.sample is generated dynamically according to 
project setup.

That said, I could of course create a useless layer that does nothing 
but only holds these sample files to satisfy this sanity check. But I do 
think this sanity check is logically wrong.

Again, project contains layers, project setup could choose to use layers 
the project wants. Forcing a project level variable to point to a 
location under a layer is not reasonable.

Regards,

Qi


> Alex



