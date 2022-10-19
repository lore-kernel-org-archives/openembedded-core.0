Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78BFAC433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 05:55:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.4718.1666158925126599642
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Oct 2022 22:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=lkyFTBWw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7291063f4f=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29J5rEuh021604
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 22:55:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=MyH1GVcFe8EXA38hTdRvoX1uC+npfT0o/BaX7tcBkkg=;
 b=lkyFTBWwfGrF+j+o1lM6Sn0D0vE46Q4oKnWlg1aqAFsNIvoytb1oBOQfYaOwtmjjmYZD
 3l/Bwdshsv5/PggW3T4k0rEh2nDHwBLj+7Mw+gim1B+2Rh6J4bZjmCXYLNi8wuCQyMAk
 IffdvOEygzfY2IGpmoirtcX/NodGRsJEYpqkIrwqC4iNwCBjDdYdF/7oxOLol8RA4XDB
 1itqKfnhkVlIM6vfBxT3jY7JJ7dUwUvndPjuIF+n5XsUK/F5d99mfK4hRY7273VguhtX
 kjbbjVvecI3o8EpgnYGouPKcyAj9s0cXEPpOXj/Ykywuhj1T9ujQxhV1LpA4wHtVILYv iw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k7r54bnrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 22:55:24 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29J5tOCd026348
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 22:55:24 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k7r54bnrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Oct 2022 22:55:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDkx/NG2o8Hc855AXHL2t61tDfp1KWvcXgubuKfhFTdxiv2gcQDgj+3dMe5fzcld7PfQZ1kBpvSgpqwsyRZ3PQEqJOjsm3YVYmMsNZDyLXNB4GPgW6qGFHDNHaxy8dGmfZr3OZd1xcliMY6ZnC/JC9l7UbpJrEzGQRySfMTiFZI52AruRUSh3qWRQJLQg6yGZKvwcaZHQc4pAM6+phkskTnhH02E8KzfIhMy3ghmC2rAttt8ZmdxFZedzKA0IjERBtBN0cnUqCJNr7vCT9eqqNg40PT92ik0hlKKuMMwNkW6BN472f4Rean9XAHUUCvllotP5J6FtK6J1OMRQ7m0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyH1GVcFe8EXA38hTdRvoX1uC+npfT0o/BaX7tcBkkg=;
 b=SCE0Yo4ka8f5f46+n2PSgb2nl3p5gst+b/RbPpM5Zo8Ux5wDrL4JvH2Xb93vwK459Wlhxe9knG6T48xvmoC6rLZkZ4avpjfUMBiCJDYbd+p+vg0aqLxlSv+XfqsXzXAdHvrb8igEB01h6E+KZRH+ZUWMKh8qGpPCpSJde+wVcOlo8FMGqB9LVUSJvns13eNv+IPx+5X4dZ/ByTZtlDosbUOrRr6vZzAH4rNMmDjRQ1el00LZqqLxR5c20HqlL5q99T7SSSlmlglm5u5WaTmLqtZKintbabDq5bP3//wNnYDdZSAWqe+wu4dW0Rz0KXZ5tKhGxPiU2kanqnTkdcX2gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 SJ1PR11MB6299.namprd11.prod.outlook.com (2603:10b6:a03:456::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Wed, 19 Oct
 2022 05:55:20 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::28f6:87a8:896c:30a0]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::28f6:87a8:896c:30a0%9]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 05:55:20 +0000
Content-Type: multipart/alternative;
 boundary="------------DiY1KHxx0eRihvl1PSHqbGFG"
Message-ID: <b43c49da-a285-1c6c-3ebf-d6c38c4326f1@windriver.com>
Date: Wed, 19 Oct 2022 13:55:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH v2] mesa: Add native patch via a variable
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20221018230820.2385167-1-raj.khem@gmail.com>
 <171F61FEE1540458.9064@lists.openembedded.org>
 <CANNYZj8sYJ9-RfzTAwpiiPSmmSRQvrjhTyFYPn-hub0eSUC2PA@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CANNYZj8sYJ9-RfzTAwpiiPSmmSRQvrjhTyFYPn-hub0eSUC2PA@mail.gmail.com>
X-ClientProxiedBy: SL2P216CA0149.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::9) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|SJ1PR11MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: eaf7d742-2019-4e0a-b778-08dab196814c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LhrvT+T7qIKQ0mCBK4sM+mIu5JQOxUlz+Mm7p///g65zd0FYk6xY4jT5ZnP1U+7ifGxFPeMxPvBqb7puge4E2MMNAPFKg60JNMjXRi+Cd2j/8JhzG9oE4D7LgJzRjTjMZiVQkC0Pbh0wWa78KsgG4E8GCFgmMjmGy+F/p7aWQwHuIsKnp/79wqyM/pDWP4NbVBcAA1SZ9q8bM6i3quHkicbotvz8fRFAjAlzNczAkfSWqRVEhjMRrnMzB3sqAB4cwC+5O5yYknLt6cfkORVKPJSbqGKBt3dFgR/UVTrg3fm8RTuypCIGNIEBoZLJsoJHmPDR1Nr9Wxyu54vEno0bdzSmZzWH8XA3uiDUtsaSAVKPL23MvlHjDXi/XuGRU9TEIW4G5Bu5nb3fhJoUNZFg/AnYaBGcFNA4wLns+52yYitHQFNHU+9v9YLEPEI3AIFseC3AnrBpyToFFNOVUTMUYA1vC59XuK+cTvmlIZn1fPnu3EJA0B9KTedlgQBb6zlBIRK/12aTEqhCu0EA4r/Wsyaf5vYQeZNbspE7QL357EH84ZoVMo1s+aT6VPGxSRukxk5kV7rWOPlVnnkWWqq/Jem5hw50j9wdk4VIowRUbcGDyTgj+rxzUhMRWwTR59N1hQARCdVj5bLgK/UKwDeSZGg4Io2Un5VUg2mtkMRqPRoxEKzGR3DA/+uUiSNFyi5B8CjZqw6j0ZJ8tOagEcZ2cUtENPEF6HQ/rnyYfcxdkC6cfuqIkT5HW0mEVZdXpZUb73DfQNlmEtbSadnP0CnJkPP23wdRlGtSv9OQ5QQlibm+BvTdwwQKeRjPVFgPrQAV1wheNoeXsicg9uHCh2+vf9nPycP60HJ3DwWuYcDHW7w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(39850400004)(396003)(136003)(376002)(451199015)(31696002)(36756003)(38100700002)(86362001)(66899015)(31686004)(166002)(2906002)(53546011)(33964004)(5660300002)(2616005)(186003)(6512007)(83380400001)(6666004)(26005)(6506007)(6916009)(66556008)(66476007)(8936002)(966005)(6486002)(316002)(478600001)(4326008)(41300700001)(8676002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dUZLOXNwbHAzZUZpQXI1U2FNT2JVRFVHd2lZVENjQ2drQ3lsTEFqVFFvUFpY?=
 =?utf-8?B?M2prMFRJdVVWcEU3cDF0N0t5M21uODluRDJ3SVR3b3FTdDBJeVNzWGU3czJY?=
 =?utf-8?B?Z1N3VFlOdDZyZ0h0REkvRVdKdHdQL1RRdU1VclAxTTJxdzVVVVlzRHlPYWdW?=
 =?utf-8?B?VStYY21Rc3VMdVVKcENWRGZFeWhBTE96VDlTMTYvWThZcEljZGV4MHE3eTZV?=
 =?utf-8?B?ZkMxd01ONDRXOFEwM3FBVU1yTmROVDRCbzlPVHF3TWI4UmxQMzJubnljV1hK?=
 =?utf-8?B?YzcrMWlBbS9xQWw1eDFkUGxmMjNJSXY2eVVYVlBhaThURmJRMW81NGVzblZI?=
 =?utf-8?B?UmdJd2pGQWFuemhSMjZYcGhQMWptOHFSS0VqOFZkNXQrOWZqeDE3dVQ3aTZZ?=
 =?utf-8?B?OGthL3lUNEx5S0ltZzlLdDFWeWIxNTRYOVZiL2tORmpNQWRocW1YZ0ZaMHhH?=
 =?utf-8?B?SU9CVm5nZUVFcnlDYy9tRkE1Ylo2ZnNzQ3k4bG1pYTlWN0tGanFpYm5vakZV?=
 =?utf-8?B?VHV5YWtaRTZKUlluOFhqMHZWSThBVitiZXBCSndwU0wzME9jMTh3UmZDM29m?=
 =?utf-8?B?SXd6YkF6UkcrTUdPK2h0bStZMjVVNlZnK3FTV2hYNTZPUWkyN2ZxeC9Va2Rp?=
 =?utf-8?B?WklxTk1lWmRFaFpTUGw3N2YwMWJ5TytQeUJhQjRTcUNWZXdPRFVhVzQ4eWpM?=
 =?utf-8?B?bGdqd3EvZ3o4MXk3SWcyemZlS1FJZFA3M3ZyalZiVm5odnVKd1V2MXVjcldo?=
 =?utf-8?B?NzlQem1uQXhuSVBDbTkwMzZKM3YwT2VWRXVVQkNyTEFXYWR2NldpR2RydzQ3?=
 =?utf-8?B?c1hGSGJ3Ukk1aTZsQVY5V3JuZU9iNG90S3dOZWt1UHhYZEgwRVA1dlhuYUNu?=
 =?utf-8?B?MzYvY1R6SjB3aGswbWRadEwxWmp1aWtoT1hSVVpPY0FFMENHM0NtZGY4S1dV?=
 =?utf-8?B?MzhYVkNnUjFtcUVzSmYxU3RYRzlhbGx0NzBCU2FMSVUxRXUyV3U1amZUQ3pW?=
 =?utf-8?B?TjNKV05ZK1FTa0JFRG9zKzZmM00rTERhMjc3SGZWWGhha3IxTk9zeTNPd3Fh?=
 =?utf-8?B?VndES0Q4bUp5SFhBMjRqZ2I4WjlnR3dnaVg4cEpwV1ZibnM5RFFKWE16dkhN?=
 =?utf-8?B?UW41RG9iSEkvd0xnUWh6Z2paOTZyMlRVYWJVdzFzS3d6Z3FnMWZRTlp5VEQz?=
 =?utf-8?B?dUpRN1loaTZBNXo2OTc1WGlHUWw1dlJKeThoMUpJd2hWemtITHVvaUsxaE1w?=
 =?utf-8?B?K21xUlhTT2M2ZEl0cmFpRFk0VXgvNVlmYVl0ajRwRGtOZmdJZjlnTlBJWmdN?=
 =?utf-8?B?MjZBSTdnNHdEVStqZ1BxTC9leWRXTkt5eEpHMzVHL0Vkd0FGQ1VzZjc3WHpx?=
 =?utf-8?B?SnlpQkFFTCtUV0R1WDFSTG1vREd3cittN04vdUJvQlpTcnhRYU10Q0JzdGRK?=
 =?utf-8?B?Z01RNzEzd0V5bTNQUW5oUFVyS1JGWVB4eS9Hc0JqOTNCRmJkTDBwMUlWMUda?=
 =?utf-8?B?Q1M0aW5McUYxeUlndXMwWnJlTGtZTThZUHdseDM5WlNXbGNRc0diTHpKdXkw?=
 =?utf-8?B?OWZLQUtIcmNEdnpxZzZYNE14ZVdxdnZ3bXY3QTk5ODhHVWN6cHlVcXlEVUVv?=
 =?utf-8?B?TExJVTlFTHNOekZVUVFYeWtKRGx0bnFGMzF5dTRhNnVVQnNiN0d3dHhrZ1Fa?=
 =?utf-8?B?TEN3a25PMUF6cjgyM2h2YXpaNldxTHlxaXFvQkx6SUZkb2YyQlJuM0JHSmY5?=
 =?utf-8?B?SEJuOXo1cVl2U3lwazhad0lsaUJLZ0NsazBxOWNkbGIrWE9HL0VBU3R3WjJt?=
 =?utf-8?B?R2pqOWk4WHJTUTlUYi9DbEtxNmwxTlg2b2pjV3I1OFFIZStPSDZ0VTdGNXVX?=
 =?utf-8?B?Z3VTRlpBK2p4Q2xzbTZTbW1oczBPcjFYUERFMkp2TTJsekk3UWRKaCtHN3hB?=
 =?utf-8?B?c1ZBK3FNMGE1cVoyNGJubHlvSGJCVDM0R3JyQlkzbnRSZnFjTFJHeXVuQnV4?=
 =?utf-8?B?eFZhTjVlSFduSCtzd2dtc005TlY5WlUzenFhKzhwV1lBV0t3WFc1NjBBTnZX?=
 =?utf-8?B?VXJISFJxOEVRUE1TUnVHd3Fjd3c0SVM5M3h4SElDRTREekZEeTRrejIwR0V1?=
 =?utf-8?Q?QNVkc1h5GuRH33Nl/C5DStjgi?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf7d742-2019-4e0a-b778-08dab196814c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 05:55:19.9939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIaH89UFEgv/l50Oi17v3BWhW1uhya1/TvGTbtu2T7vtlBnzsB+a/ACxDySIOgbsH1ekKtISv9lvD9sbZGb6ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6299
X-Proofpoint-GUID: ma7P8H7vXujo-QlIJE1c3gO6DihkpTtP
X-Proofpoint-ORIG-GUID: syrioow9MIpVBILxvZHZ3MfcsYT6bfJj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_02,2022-10-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210190031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 05:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171956

--------------DiY1KHxx0eRihvl1PSHqbGFG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 29J5rEuh021604

On 10/19/22 13:50, Alexander Kanavin wrote:
> Come to think of it, the right thing to do is to actually not do=20
> anything at all, just adjust the patch explaining that it is needed on=20
> 18.04 hosts. Is there a problem when it is applied for the target?

It fails to compile mesa-native on 18.04 if DEBUG_BUILD enabled. But it=20
fails to compile mesa with that patch.

Kai

>
> Alex
>
> On Wed 19. Oct 2022 at 7.42, Alexander Kanavin via=20
> lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!eZulY7DjDKYv2r3yzQn8Vn8UN9xivFvCN3petJXB1tdJL1wXemB_puMLwiTRps7xFdrrl=
qhC7Jmgij04C42w4jI$>=20
> <alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
>
>     Can you show examples where this is needed? Custom variable does
>     not seem a good idea. I also worry that it=E2=80=99ll break automat=
ed
>     updates (it=E2=80=99s bad enough with mesa-gl, this might make it w=
orse)
>
>     Alex
>
>     On Wed 19. Oct 2022 at 1.08, Khem Raj <raj.khem@gmail.com> wrote:
>
>         This helps override the SRC_URI in entirety if needed by
>         and overriding recipe
>
>         Signed-off-by: Khem Raj <raj.khem@gmail.com>
>         Cc: Kai Kang <kai.kang@windriver.com>
>         ---
>         v2: Weakly define NATIVE_PATCHES
>
>         =C2=A0meta/recipes-graphics/mesa/mesa.inc | 5 +++--
>         =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>
>         diff --git a/meta/recipes-graphics/mesa/mesa.inc
>         b/meta/recipes-graphics/mesa/mesa.inc
>         index c94e439363..04d78a6aa5 100644
>         --- a/meta/recipes-graphics/mesa/mesa.inc
>         +++ b/meta/recipes-graphics/mesa/mesa.inc
>         @@ -19,10 +19,11 @@ SRC_URI =3D
>         "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz
>         <https://urldefense.com/v3/__https://mesa.freedesktop.org/archi=
ve/mesa-$*7BPV*7D.tar.xz__;JSU!!AjveYdw8EvQ!eZulY7DjDKYv2r3yzQn8Vn8UN9xiv=
FvCN3petJXB1tdJL1wXemB_puMLwiTRps7xFdrrlqhC7Jmgij04FmSFkx8$>
>         \
>         file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch =
\
>         file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patc=
h \
>         file://0001-util-format-Check-for-NEON-before-using-it.patch \
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${NATIVE_PATCHES} \
>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>         -
>         +NATIVE_PATCHES ?=3D ""
>         =C2=A0# required by mesa-native on Ubuntu 18.04 with gcc 7.5 wh=
en
>         DEBUG_BUILD enabled
>         -SRC_URI:append:class-native =3D "
>         file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.p=
atch"
>         +NATIVE_PATCHES:class-native =3D
>         "file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.=
patch"
>
>         =C2=A0SRC_URI[sha256sum] =3D
>         "b1f9c8fd08f2cae3adf83355bef4d2398e8025f44947332880f2d0066bdafa=
8c"
>
>         --=20
>         2.38.0
>
>
>
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#171954):
>     https://lists.openembedded.org/g/openembedded-core/message/171954
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/171954__;!!AjveYdw8EvQ!eZulY7DjDKYv2r3yzQn8Vn8UN9xiv=
FvCN3petJXB1tdJL1wXemB_puMLwiTRps7xFdrrlqhC7Jmgij04ZTM5SzE$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/94420106/1686489
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/9442=
0106/1686489__;!!AjveYdw8EvQ!eZulY7DjDKYv2r3yzQn8Vn8UN9xivFvCN3petJXB1tdJ=
L1wXemB_puMLwiTRps7xFdrrlqhC7Jmgij04N8vN8aQ$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!eZulY7DjDKYv2r3yzQn8Vn8UN9xivFvCN3petJ=
XB1tdJL1wXemB_puMLwiTRps7xFdrrlqhC7Jmgij047kVLbgo$>
>     [alex.kanavin@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
Kai Kang
Wind River Linux

--------------DiY1KHxx0eRihvl1PSHqbGFG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 29J5rEuh021604

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 10/19/22 13:50, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj8sYJ9-RfzTAwpiiPSmmSRQvr=
jhTyFYPn-hub0eSUC2PA@mail.gmail.com">
     =20
      <div dir=3D"auto">Come to think of it, the right thing to do is to
        actually not do anything at all, just adjust the patch
        explaining that it is needed on 18.04 hosts. Is there a problem
        when it is applied for the target?</div>
    </blockquote>
    <p>It fails to compile mesa-native on 18.04 if DEBUG_BUILD enabled.
      But it fails to compile mesa with that patch.</p>
    <p>Kai<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CANNYZj8sYJ9-RfzTAwpiiPSmmSRQvr=
jhTyFYPn-hub0eSUC2PA@mail.gmail.com">
      <div dir=3D"auto"><br>
      </div>
      <div dir=3D"auto">Alex</div>
      <div><br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed 19. Oct 2022 at 7.=
42,
            Alexander Kanavin via <a href=3D"https://urldefense.com/v3/__=
http://lists.openembedded.org__;!!AjveYdw8EvQ!eZulY7DjDKYv2r3yzQn8Vn8UN9x=
ivFvCN3petJXB1tdJL1wXemB_puMLwiTRps7xFdrrlqhC7Jmgij04C42w4jI$" moz-do-not=
-send=3D"true">lists.openembedded.org</a>
            &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembe=
dded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">gmail.=
com@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)">
            <div>
              <div dir=3D"auto">Can you show examples where this is
                needed? Custom variable does not seem a good idea. I
                also worry that it=E2=80=99ll break automated updates (it=
=E2=80=99s bad
                enough with mesa-gl, this might make it worse)</div>
              <div dir=3D"auto"><br>
              </div>
              <div dir=3D"auto">Alex</div>
            </div>
            <div>
              <div><br>
                <div class=3D"gmail_quote">
                  <div dir=3D"ltr" class=3D"gmail_attr">On Wed 19. Oct 20=
22
                    at 1.08, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-f=
reetext">raj.khem@gmail.com</a>&gt;
                    wrote:<br>
                  </div>
                </div>
              </div>
            </div>
            <div>
              <div>
                <div class=3D"gmail_quote">
                  <blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px
                    0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bord=
er-left-color:rgb(204,204,204)" dir=3D"auto">This helps override the SRC_=
URI in
                    entirety if needed by<br>
                    and overriding recipe<br>
                    <br>
                    Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-=
link-freetext">raj.khem@gmail.com</a>&gt;<br>
                    Cc: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver=
.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-fr=
eetext">kai.kang@windriver.com</a>&gt;<br>
                    ---<br>
                    v2: Weakly define NATIVE_PATCHES<br>
                    <br>
                    &nbsp;meta/recipes-graphics/mesa/mesa.inc | 5 +++--<b=
r>
                    &nbsp;1 file changed, 3 insertions(+), 2 deletions(-)=
<br>
                    <br>
                    diff --git a/meta/recipes-graphics/mesa/mesa.inc
                    b/meta/recipes-graphics/mesa/mesa.inc<br>
                    index c94e439363..04d78a6aa5 100644<br>
                    --- a/meta/recipes-graphics/mesa/mesa.inc<br>
                    +++ b/meta/recipes-graphics/mesa/mesa.inc<br>
                    @@ -19,10 +19,11 @@ SRC_URI =3D &quot;<a href=3D"http=
s://urldefense.com/v3/__https://mesa.freedesktop.org/archive/mesa-$*7BPV*=
7D.tar.xz__;JSU!!AjveYdw8EvQ!eZulY7DjDKYv2r3yzQn8Vn8UN9xivFvCN3petJXB1tdJ=
L1wXemB_puMLwiTRps7xFdrrlqhC7Jmgij04FmSFkx8$" rel=3D"noreferrer" target=3D=
"_blank" moz-do-not-send=3D"true">https://mesa.freedesktop.org/archive/me=
sa-${PV}.tar.xz</a>
                    \<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <a class=3D"moz-txt-link-freetext" href=3D"file://000=
1-meson-misdetects-64bit-atomics-on-mips-clang.patch">file://0001-meson-m=
isdetects-64bit-atomics-on-mips-clang.patch</a>
                    \<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <a class=3D"moz-txt-link-freetext" href=3D"file://000=
1-futex.h-Define-__NR_futex-if-it-does-not-exist.patch">file://0001-futex=
.h-Define-__NR_futex-if-it-does-not-exist.patch</a>
                    \<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <a class=3D"moz-txt-link-freetext" href=3D"file://000=
1-util-format-Check-for-NEON-before-using-it.patch">file://0001-util-form=
at-Check-for-NEON-before-using-it.patch</a>
                    \<br>
                    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${NATIVE_PA=
TCHES} \<br>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
                    -<br>
                    +NATIVE_PATCHES ?=3D &quot;&quot;<br>
                    &nbsp;# required by mesa-native on Ubuntu 18.04 with =
gcc
                    7.5 when DEBUG_BUILD enabled<br>
                    -SRC_URI:append:class-native =3D <a class=3D"moz-txt-=
link-rfc2396E" href=3D"file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-com=
piler-error.patch">&quot;
                    file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compil=
er-error.patch&quot;</a><br>
                    +NATIVE_PATCHES:class-native =3D
                    <a class=3D"moz-txt-link-rfc2396E" href=3D"file://000=
1-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch">&quot;file://0=
001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch&quot;</a><br>
                    <br>
                    &nbsp;SRC_URI[sha256sum] =3D
                    &quot;b1f9c8fd08f2cae3adf83355bef4d2398e8025f44947332=
880f2d0066bdafa8c&quot;<br>
                    <br>
                    -- <br>
                    2.38.0<br>
                    <br>
                    <br>
                    <br>
                    <br>
                  </blockquote>
                </div>
              </div>
            </div>
            <div>
            </div>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#171954): <a href=3D"https://urldefense.co=
m/v3/__https://lists.openembedded.org/g/openembedded-core/message/171954_=
_;!!AjveYdw8EvQ!eZulY7DjDKYv2r3yzQn8Vn8UN9xivFvCN3petJXB1tdJL1wXemB_puMLw=
iTRps7xFdrrlqhC7Jmgij04ZTM5SzE$" rel=3D"noreferrer" target=3D"_blank" moz=
-do-not-send=3D"true">https://lists.openembedded.org/g/openembedded-core/=
message/171954</a><br>
            Mute This Topic: <a href=3D"https://urldefense.com/v3/__https=
://lists.openembedded.org/mt/94420106/1686489__;!!AjveYdw8EvQ!eZulY7DjDKY=
v2r3yzQn8Vn8UN9xivFvCN3petJXB1tdJL1wXemB_puMLwiTRps7xFdrrlqhC7Jmgij04N8vN=
8aQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https=
://lists.openembedded.org/mt/94420106/1686489</a><br>
            Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@list=
s.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">openembedd=
ed-core+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://l=
ists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!eZulY7DjD=
KYv2r3yzQn8Vn8UN9xivFvCN3petJXB1tdJL1wXemB_puMLwiTRps7xFdrrlqhC7Jmgij047k=
VLbgo$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">htt=
ps://lists.openembedded.org/g/openembedded-core/unsub</a>
            [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank" =
moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">alex.kanavin@gma=
il.com</a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------DiY1KHxx0eRihvl1PSHqbGFG--

