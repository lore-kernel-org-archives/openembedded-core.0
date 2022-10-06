Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B0AC433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 15:51:41 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web09.742.1665071491424841353
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Oct 2022 08:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=sdIi7MZZ;
 spf=pass (domain: ni.com, ip: 148.163.158.57,
 mailfrom: prvs=72783f6c60=alex.stewart@ni.com)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 296FLbdN009243;
	Thu, 6 Oct 2022 10:51:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=message-id : date : to :
 cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=PPS11062020;
 bh=KOw8a7arkKw+9TsuBj5a7iZwfXl4MTaTOY4QyCNXWXs=;
 b=sdIi7MZZ2XelI7GqvbH5RtynhBAZrzjqBKvmv7TZLC+KPTCkbN9uNbG+Q9RbDi4ARk/9
 +8t1jILCVkf+/rnIDfosmetotfaX3P6gb8ACtBHKUjSf5eEUzYaxpK7aOD5orrM61Bl1
 2PAFDfvhBMg+hBkw73n9MnQlYDg+5kAdRoOGGfyYmqlegxorV+RKgAVKdmjXhYVelkvv
 Sv+leYnCJkso1e8K34zly6Zf3BbO1fNHd6mJMilw3WLSs0eA7WDTv1JOiWIWYte2o/u6
 jcgPW3NoZa6wlpotRTHLjeHUJuuEXKp0ixyOB3ibKQt4+nEFyEgMkd22HPC7Id0evF3l 6g==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3jxkc79erj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 10:51:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ga0V+KkHv8Wl2sdjJFlE+1KJqmC8BtFqv0pNc94YFB+ybEHPqD2HZCXNRY93I0ehLvJuNPS9ACWg6dEZogwYyHvK4McEoT1EVC/i1uVf9wQMtOWc60zUUdDbPJ51yY2S5IBq8xrcf6QcUdsfssnXnFx7O02hxcJkYYxyT/V1f4j+thzfNZvzA5/UfOlypd9FUMfQ8RwuX0q4bpOwZ/AQ/c/0z4eKWywRCT5TyFnHdYW+Hj1YB2lQVg6VERQ1SCyrm5nMRhcTdGZnoOObG81P4O0Qf2NJVV5+cG/hEgfxcO+IAYE75/ZH3Wn+uisOffMFyYysrNkEqEkspLjsdbMUPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOw8a7arkKw+9TsuBj5a7iZwfXl4MTaTOY4QyCNXWXs=;
 b=d6R5clHAutvqy644JZt+tEEG+nCifU/0oc2zU/HwgLK2zOdLRfcWfXFJ2sVO5EOlY/ZDwHrCmMmHJvDsNYaRQxgPErl3upiv4Fizx25+JHkChjKuDlo4F5Ltee5j3f7AXlaCwvTzmIh2aRU4Ybh7EsHB2EEpf7yrdC22gAiq0gkcg2ikSV4GUotpXeh80DHN7yvGOstDMU5NFD9Fq4xC2xpORqn20HoNw9yTHBz5lY87NRe3jrVaI+XZm6TIBxkzWcus30etajKUUHb23/ByyfiAY0mKCrjwFU7awY4xbwe44ejWzzQXtjqROZ4735LzbutoegBksgVpaPfCOc7B8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOw8a7arkKw+9TsuBj5a7iZwfXl4MTaTOY4QyCNXWXs=;
 b=bZpWWv9CKKaz3/I1uGBdiMENz0/or0dhhI93OTpYSFynKeyWqNapu04yzLjcvRDFUCkHEZgpiDVT1KdGw7Ts+incLE6F3PmSXIXrrVlT62E6KVdnj0sPH2K0svm4H2X/MLVAikoXSpGp35hPqHOtt9inf1C7U5Meb/z0yrWE/ns=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by MWHPR04MB1153.namprd04.prod.outlook.com (2603:10b6:300:7c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Thu, 6 Oct
 2022 15:51:25 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::cdb:af23:81f5:620]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::cdb:af23:81f5:620%6]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 15:51:25 +0000
Message-ID: <c1cc63c2-3552-0337-cce6-8c4ef2d1eb66@ni.com>
Date: Thu, 6 Oct 2022 10:51:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To: Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com, openembedded-core@lists.openembedded.org
References: <20221006133122.493953-1-ross.burton@arm.com>
Content-Language: en-US
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: <20221006133122.493953-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::9) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|MWHPR04MB1153:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f168f95-608f-4ff9-530d-08daa7b29fa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	53cse/Vfk0ITtG7lGdkXqfzq4T3mGealLvhxIAFYY/mU3XEUVchWv/UtyAn5dAO2/GqUFG5bCM1Tdtv/j34EhH8hBK/AbG5os62+hMFe4Aot7hIjqelC/KxoV3lxHobqsS1tpJMXUauJuZUJZYVhAek4+YclJdk5hgdLxyLzBVimFhqf79zXOXAtXM3CmdUYLWP3k37EhpqyuSOhi9zoyel8mzDRRSGF8xJRBf1LD4VbSczyfx+zAV0JKVp0SZDTbs/+MMB8eoSgqEFoRq1BKrVeB3CI69C6AalDCm1J+BqrcZPQ375xUirFrxqdgxRJhP3ooRsnNd7sHhjlBGzi3We/uoJf4UnajC/C8U9PXUiypsIYBILaETmzn8Vuf99PCn1sSub44DQuuhCX/lI5VSEOtjigdZYCX2x116Zk7IMFLqPMuH/fVjKzumzb42XKcFEgUovRwpPdj7puMl+HK+TIhzwjRe0cHih/IvsE5O7Ap9T6N0RH/CKgbvHMiFAReVf4vV4PCWzgi13hGBKbjkdRVQo/vF6eOOI/cXs6K87hOCiy3FHz5zSMZk4Iy0D3mXAdTctQ4JJeTiO+XKWytqt6VPcEeT4sGU6LK+OMBtPkCMQZMEISo5RY934rSxmH2MSIc5izwiqD3421uZznqAY/AAnQIy2ljF8HhTA/W/MZbMiBcK4PpaQKs9wK0BKc9+bcrWNp/4FQ6i6wE1+kEA4J7SJPlY5oLERGn8K9dVQLz5OKpdJ47M73uI7kQf3V6XbAg9dFqCdvy9jpcvspQJAP/1nNtWFtzVm7GLO90qgwiLE89XUmGmSJV0jXzBHlgxVieg/HW3R/t8GpIkOZqa2xCITeu5BplmDHfCHRTQU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199015)(53546011)(55236004)(31696002)(86362001)(478600001)(44832011)(2906002)(316002)(36756003)(2616005)(6916009)(186003)(38100700002)(6512007)(26005)(4326008)(8936002)(66946007)(66476007)(66556008)(8676002)(6486002)(5660300002)(966005)(31686004)(66899015)(36916002)(41300700001)(6666004)(6506007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bFRSTklTWFFnV0tTUTR3VUJ2dUlwNlpWVHpJS3lFSmNibngvbjhmaWJ2QmRO?=
 =?utf-8?B?WFNyYkZmV09tWTVodmhiQ28weHAwTlFSS3R6a3d0TEFxcDJvb1N2bHc1QXJB?=
 =?utf-8?B?NjJmYU1UVzZzZ0RhVFkxVHNGamJpSUI5V3NaRWhJT1dsWHFoSFMrUGkrQ0dk?=
 =?utf-8?B?OUYvZEwrZ0Q0VU9tTXZKcUkzc2RlSTROdDhycy9WKzJ2UnB0WjBMMk82U2Rz?=
 =?utf-8?B?REh6TGFlWFdNMU5vRHlWTEhGQnVvOW51dVQrOGRIMUlaK0tTT3RoT3ZBaC9U?=
 =?utf-8?B?akR0eVV5TXVjTS9CSnhrZTJXbjM3VlJqM281NjI4cDZMR1R5V0tRMjd4elJa?=
 =?utf-8?B?TDV0dDhXUndPMHlRZmh2TEpreUJtcXlNaGpGY1FSRDBBK3NmQ2xCYlBaS2xH?=
 =?utf-8?B?dXZUM0VTYXpINS83WlRzVGduRmxLRlF6VitIUjVvMlFBVTFUZ21xV3BoSTVW?=
 =?utf-8?B?UnhWMkc1V3hMQmVqZm15bUFJYlVTNGdvemQ3WUN5SmM2V0tBRElaaFB0TEJy?=
 =?utf-8?B?QytYaWVSOU5UY29TS09FQUtNb3JLZGxUT0hoS0xhWWxsY0VpK09QbTJ2aGpX?=
 =?utf-8?B?VUZQZm1sdTNkcHNCVy83K0RuTEFHYWlBMXFPUmtPYWRpd20vczZKallPQzNG?=
 =?utf-8?B?V2VIYkd5dUFpOXQ0K3l5MkxZZ1pXYVB4MnM1ZVV1dEF2SUM3cDcxZjJiaDB1?=
 =?utf-8?B?SWhJZWlPcFFSZ1llaWd3am1vVHdBY3hkbWJBRk1VNTVTMWVjK1AxdHF5dGox?=
 =?utf-8?B?NHpQekl3Wm0vSUVhNExvQmU5dEhORlNOakM3MkZXTDNVeUFaTlVJUVlQbVRT?=
 =?utf-8?B?ZnR1VEl6UlRXdEVxY0xFWnlwMkEyNU9IYWk0Vm5pYWcvOHZOWlY5d1pCS2dJ?=
 =?utf-8?B?cnNaWTI1ejZybVA5VU1hNXQ0Qjg0QkNneXRPMmhrdHdlZ2tQZ1FyUWNuZXp5?=
 =?utf-8?B?N0JqeDFta3JlUGV0YVRkVzgrcjhLanpUU2hYMFpqMEliaG84OGs5RlRQUnZF?=
 =?utf-8?B?UW1rV09mYXVvYjlpbnFnbzFjT2dIMmdoMy9USXVpeFhpaDZCYTlwZDAyc0Ji?=
 =?utf-8?B?ZzhVeDhxdCtqMW56VngxOTZ4ZkxMd21VcGo0M21paUJENi96cEkzQmtHQzBC?=
 =?utf-8?B?NHdHMm9maFBBS0hJblpYTlR5SUtLdVJLNUcvVysrSXpMei93OFBFZTN2V1Jz?=
 =?utf-8?B?cUR1NWhsZFRoL3V2Ryt3NFIrNUlwSzUvQUhOK09iWVptMlVlVHpaS0N3bTJD?=
 =?utf-8?B?NW9oSit3K0dmZ3MzbSt2dTZMQWU1cWZzazBvSnl6dGFKWXJ6SGwyb0dXSDBF?=
 =?utf-8?B?SDlpZXFxbHp0RVlsTDI3N0hPNFBsTlk2YTBQTVBqYW5DWWcwMkNjYkowVW1N?=
 =?utf-8?B?SjQxNnpGYmZSbGVmZjE1QmJuMnZIeG5DVC9rNm9EbDZ1SkFGT21qVjNGdlRx?=
 =?utf-8?B?TCs3MnNTMnNyVUdHZFgzeGxEbHV2MWp0aGJmaHEyWENkT2tISzY5Q0R0UlJm?=
 =?utf-8?B?dnJPeDVHQ2lLVHlybzgvQWM2dUNlMTZ3d3ArME1GaTFsOVR6M0dlb0pXVWl0?=
 =?utf-8?B?NXlyNVNncUF2bk9odUlVUmJpVjdKSW5TZmVvZGJuU3RHUU1uL2RneWQ0L29s?=
 =?utf-8?B?cHNuc2tNUTM3a2I1Yy9SZGdIR2FwdGpZNUhVOUw2WW5vRDN2cEVZa2xuVldQ?=
 =?utf-8?B?OE9GYU5LSGRvU2pZMXdacXU0S1lweTZNZGNFU28vMVhaVU1VVXBmTnArV1BD?=
 =?utf-8?B?cElMeUJ0Nm5TYm5FVHdkalRmZHBnQlcyOWVhWjRLNXROY2EwZWx0UDFUcUY0?=
 =?utf-8?B?OHNEUi9ycWdWdWhoSXlzQkJ6R1pJa2t5amdBZVhqT05DUDhDeFRqdUg4QXlI?=
 =?utf-8?B?bkxQQTlxS2xiM0tIUFJ0cXFPVElLbGN4dFpUMUloR25iSHg2T1oranhNWDFE?=
 =?utf-8?B?Q3RnbTdGTktHZmFDbzN5YStzZ2ZpNlBjeFozK3hFNFdjdEZpQkw3RjRiNDJ5?=
 =?utf-8?B?TURIYnE1YTBqWWlFM3YwYmhHbXZpZGUzOFlyeTZ3WTNFMExkeDZKN3hYK3Mw?=
 =?utf-8?B?K3g2NUJuNzMyaHdiMGFCcjV5Q3FFNWY2WWo0ZVNlT3NnbXdHMkJuY21zYUhV?=
 =?utf-8?Q?5PfmJm8D+q+F6z7Ub/3TIptPR?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2f168f95-608f-4ff9-530d-08daa7b29fa3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 15:51:25.1894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 onFQOFj7r5G08KjtLdVolsb8E1gpjfMH8MHeS6kusG2EKrDzYG7X+zlEz3sSJ8/2HEB+dau/ilPpCQpMd7fu9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1153
X-Proofpoint-ORIG-GUID: JQUj4sUOYcRVmCf7kSvVjEbAMGbTeaLD
X-Proofpoint-GUID: JQUj4sUOYcRVmCf7kSvVjEbAMGbTeaLD
Subject: Re: [OE-core] [PATCH 1/2] opkg: use a git clone,
 not a dynamic snapshot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_04,2022-10-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30
 priorityscore=1501 suspectscore=0 clxscore=1011 bulkscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210060092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Oct 2022 15:51:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171509

NACK.

The downloads.yoctoproject.org fileserver isn't a dynamic cgit snapshot. 
Those are static tarballs that I manually create every opkg release. [1]

[1] https://git.yoctoproject.org/opkg/tree/scripts/make-dist.sh


On 10/6/22 08:31, Ross Burton wrote:
> opkg fetches using a cgit snapshot of a tag, which is not reproducible as
> the tag could move, not reliable as a future dynamic snapshot could have
> a different checksum, and a waste of CPU load as these tarballs are built
> on demand.
>
> Switch opkg to use a proper git clone of the relevant SHA.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/recipes-devtools/opkg/opkg_0.6.0.bb | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/opkg/opkg_0.6.0.bb b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> index 4cd589cd29e..f9e5073ba5d 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> @@ -12,13 +12,15 @@ DEPENDS = "libarchive"
>   
>   PE = "1"
>   
> -SRC_URI = "https://urldefense.com/v3/__http://downloads.yoctoproject.org/releases/$*7BBPN*7D/$*7BBPN*7D-$*7BPV*7D.tar.gz__;JSUlJSUl!!FbZ0ZwI3Qg!pyuHI_PMGrZ2NigEUgUanIZNHVUAWoJRWYY0JDL6RQzMmoQPyN-WSs9wjjW7a9E1qPmn22PazWgh2nsmLQ$   \
> +SRC_URI = "git://git.yoctoproject.org/opkg;protocol=https;branch=master \
>              file://opkg.conf \
>              file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
>              file://run-ptest \
>   "
>   
> -SRC_URI[sha256sum] = "56844722eff237daf14aa6e681436f3245213c5590ed0cda37a79df637ff3a4c"
> +SRCREV = "9007789c18f70bc9f315a566c589231ef0a2e6fa"
> +
> +S = "${WORKDIR}/git"
>   
>   # This needs to be before ptest inherit, otherwise all ptest files end packaged
>   # in libopkg package if OPKGLIBDIR == libdir, because default
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171502): https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/message/171502__;!!FbZ0ZwI3Qg!pyuHI_PMGrZ2NigEUgUanIZNHVUAWoJRWYY0JDL6RQzMmoQPyN-WSs9wjjW7a9E1qPmn22PazWj0RaRGrQ$
> Mute This Topic: https://urldefense.com/v3/__https://lists.openembedded.org/mt/94157332/3616788__;!!FbZ0ZwI3Qg!pyuHI_PMGrZ2NigEUgUanIZNHVUAWoJRWYY0JDL6RQzMmoQPyN-WSs9wjjW7a9E1qPmn22PazWgOZqMzhA$
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/unsub__;!!FbZ0ZwI3Qg!pyuHI_PMGrZ2NigEUgUanIZNHVUAWoJRWYY0JDL6RQzMmoQPyN-WSs9wjjW7a9E1qPmn22PazWj3f46u5w$   [alex.stewart@ni.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


