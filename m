Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93331C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 23:01:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.4019.1645138868297792745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 15:01:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=X/I+tLCk;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=9047f6eb5b=saul.wold@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21HLtVTH017651;
	Thu, 17 Feb 2022 15:01:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : to : from : subject : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=BU1gy+r5NkDf1zjcB+6X4nrXGi5RF/KYOppYow4nri8=;
 b=X/I+tLCkr3iDKl7P/o4LoVwLH95PDV18u4LBiQDY73m/72C9J8XazZf6uCz/X5vbSB4w
 wDxJOv858+kxs6M9lQCSgNUaV0u/9PLfmOxaqG9Twg29PusmvyFZKOVj5TwJzk+F+oDH
 HzQV3A64JoRilISUjNeyezcts3Y1POkEIr4y3B+8ACWDWR3TUvhEQpsy5GC717DYtL54
 y/2/nvCdUGR6K83L/U7BERuvwS7IcvTm0d/Ujr9ygdBSgQwMqJo+DftKP6E3mnopgJC6
 4dwY9vqyq19i7F3m5ILjsbuA7BOoKorlfXfA1bBg3Qdmepa2jq8Hh8N1BrOetFg2rEt8 6g==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e8n1x1v11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Feb 2022 15:01:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlCwB7FfDNluDjT7MlhMHkFw8JLoDQ9fFAwRsh2RK7EJ4a5Hrw+FmHdIM/5yy9e9n9jtpsErZlNGfVOv7U/vURuGPMneijpsIhqC80zpzfKjxMXwSo6fYJyzmbsqsf+YBEYFgD7RdQeOpUjXPfRhofGkJHMRduGc26hJ8pksEt0h463aVLTQGbg0G8MG+SgibTM4AWKRcrtt15QF1AtH9G1ZiIcsJKGiCIZ7NBEJUGjD37HTbNusLR++mlF7yavG79u42+dZwbAh5/WeUrCdc4mjXGYd0tcVcXjssmb4vW9rsUp61AjfL8kvI+0WWlvRTSBFTgOM/92w3T+MifD9nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BU1gy+r5NkDf1zjcB+6X4nrXGi5RF/KYOppYow4nri8=;
 b=kipyX1ZgeY72eh+yPwFT8Yp2cvXIiBbe1afHCEgYWMGsAfEA+5ZM/KpSJsiAEy2FuNTjDe/QUTGDY16oZlY/papMUOmk6m90YPg3Ju693MxDA3ai8gCN9rLgd+text5T9nBFK+1UOpo/SixU6egNBV30e/i0V5L8nZSy69eXAdLgT5ik+z1W1xRcupp25LnILpUOecJz8jAn8L0JVVZcTuAKbWJy39YvT0kKTM10Eu4BzQgDbbMJJvj4/GwX9iHbt6X32rCVI7k+LJE6lSNdemke7/TZmQEUh4myF3tiT8b6hKt1RveJRDf9mMrDZH90/rPHniHWFvLIBKUARYvc9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by SN6PR11MB3343.namprd11.prod.outlook.com (2603:10b6:805:ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 17 Feb
 2022 23:01:03 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36%6]) with mapi id 15.20.4995.018; Thu, 17 Feb 2022
 23:01:03 +0000
Message-ID: <7d187920-92f0-a0fe-22b9-a77a1c98fd7d@windriver.com>
Date: Thu, 17 Feb 2022 15:01:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: openembedded-architecture@lists.openembedded.org,
        OE-core <openembedded-core@lists.openembedded.org>,
        OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: Saul Wold <Saul.Wold@windriver.com>
Subject: INCOMPATIBLE_LICENSES and WHITELIST_<license> usage
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR18CA0028.namprd18.prod.outlook.com
 (2603:10b6:320:31::14) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de48a160-9d31-4010-d65a-08d9f2695eda
X-MS-TrafficTypeDiagnostic: SN6PR11MB3343:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3343696048DB3B09AFDB2FFFEE369@SN6PR11MB3343.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LVgpkr+NMsT4JY5QPy7ln8VVU4y4EN/EvFnfcvX4eDetaDa0kbYDwJyqutW/89FOg9H4D8KU/Hmwcz2XPA3lASmW6Z9sFdwXDn5x4/BXTFEpqsbHi5B9ngR7RZOkObCQpw2/pciLTK+WXNQlJmItnoojZDTkT7WCjThEZUTgJSCFWsfAGVJvuSb28bZUAT939fHkWdjZ3+ABVF2MAuC6aT+0/erbVziY+eebwBDrU2nwvqkengZSHPAV6f+HAz28VggHP/5lP2wo9GeqA/65lJv4Ysrsfvh/UMJyEaJ8tJJOhktx3qj5TxjjoZ0NnfF97te2fsVgsPdgP5Rkn4TZpTGrGEOF6iEfNI5pQuCoM+5m7BAKMxdW/pgtEm9hGwFBhfmHehahBHW6bGrRRtwPuRfV1FJ2q/r+bO0XIbklXVtgJ5UaVGsM6R5zMI4N8x3RuHx1w38KV5Myh0WE/7RgcBBem+iw52PbT2JIejSWLwxUhzJH7OLJUmOp9ziEM4zTFGkhE2Ci/PMT/AmMc5Bo9r1KmFWKCMeFhhAD3B4h2lceNdRkhbNwhtMrAq6ZncX4InFND0UAcjkxVStt81dGfReJKdYXmKoL+YJG/nSuc3Rp1U0l65KwnXS5rspYNH5tv3JMBF7yxeSL9p1EDKcBMpUxZOIEyE0WTwOPf8R4Lch/SxUdSe8J2HBCAfJbZ52XxTk6o+rFiX/0p9CHhsG87pek3tmJ/0w/hZR27ISi+QF6/jUfvjzcxR3k6IGDMWnqeyay0nCu36narGTEvQyfaenYXKMViwmR7g7gT2zbtE4NMsza5SSeqpFFb4XKOzDFRuIb+XHOeL5T1Gm8SRN/EPygAtcXqCRmWDU+Zfzp/og=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(2616005)(36756003)(6506007)(186003)(31686004)(83380400001)(26005)(38350700002)(38100700002)(2906002)(8936002)(966005)(4744005)(5660300002)(66946007)(6486002)(8676002)(52116002)(508600001)(86362001)(110136005)(66556008)(450100002)(31696002)(66476007)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?clhXWWsvSmJZeTZLeisrN0d5UFpFanB2VFFGaXA0TlQxOHVCKzlPcVU4dWJw?=
 =?utf-8?B?Zk8zVkoraVY0RVd1MU5MRE9PYlRBdXczUmlhelo2QnVVZEJjaXZ5eVFRU09m?=
 =?utf-8?B?dVZlNUx4bkdtd3Vnb2FPTXhRd05pLzFBbWRjc2lCR21ocmVCVnZZUE9vcTNW?=
 =?utf-8?B?SmZNWFBvVXNWNkNKdHlsZHRLRGx0TittQ2NMd1MrN2JJNnVYeit1eHdQTmNs?=
 =?utf-8?B?QlN1S0VMb0NVRFhLVVIxUmkxY2xBNkZIcCszTk11QWg2UDBCMlAvcjVyMitI?=
 =?utf-8?B?VGFaZGIrZFFXZUdieWVicW9NOWprQXRPOUwycGlMMFpwOU9mL0tJVEVRUi9T?=
 =?utf-8?B?K1RMcTNQMnI4UndudzRSeHRmYlRPRU5GOXFwZEV2ZUNDVU95UVlUOWYxYlBa?=
 =?utf-8?B?K3oraisyaENyZXVlbTRmbEJzbHQ2Slo1VTNoNThDMHZhOXZtR1lrUUIxYXhI?=
 =?utf-8?B?Tk8yb3FXT3UycUd2WEVyV3BTOE5IUE5qOS9rQ202WURnNldCaUxpTmllNEFM?=
 =?utf-8?B?NVlZalB5R2Q5RUh2WlZzT1hiWEpHdTRUWFFDK1ZCcWRzNDR0QmpYUmRJSjFo?=
 =?utf-8?B?ajJjRkZLcVArZTBHTjJNeFdqV0Q4YjBtalBQYkZQbUNiT3c1VFluQ0FndW03?=
 =?utf-8?B?WGI4Mk9udjJTR2U5VTFKZWRLUWE1L00rTHI4M2RMazVIK0pWSWY3ZjZwNU5y?=
 =?utf-8?B?aTZOZTd6bXVtczJOaUY0bGZwVW1kZ2NteGc2YmJPMVkrUnhyeDFZMVRGaEt6?=
 =?utf-8?B?WFhSVW43RXZPc1hVbXR3MDFMQnVTUngyZEszd2lQVldOK2o1NlB2Z0l3RXIr?=
 =?utf-8?B?VlFrWmVmTi8rUjBGZ2lTdEZIbWpSMmU4NU5PUzRhV1VnQ29mUTlHOFoyK1NM?=
 =?utf-8?B?TlU1L1VWSDh5VXpvbzdLcWFYeFQrd3U4eDdKT1VJYkFQUEtuUFlwczNnZFVz?=
 =?utf-8?B?TVJqc1hJc2NyOE5kdE8ycG1uVUhJMExhbWFRQnkwYlo0d1czR1FYbGlBZUpo?=
 =?utf-8?B?UVRDUElBaXFHcE40UzZsNzJlTml4VDFYbk1maHZ0eE1YeWREV2U0R2syMWd1?=
 =?utf-8?B?S0pDM3ZpUGhGenN4cDJYRGpDa1gvSE5JV0xHcnp5VGFGMWtYRms5Z1RDU1Qr?=
 =?utf-8?B?QmRWbkFPZVhET09oTS9lK21UQ0JLc0dyYTBDV3RpWm93OGFjN0d0VStKUkw5?=
 =?utf-8?B?SGNidTMzcW4zMmZDSi9kcW5zMG9LcjduSDBDcWdRNVZRbkV3K1hNQ2hYZlhq?=
 =?utf-8?B?RDVtZG1wZURuUFZRYTc0SGJtVlBtbnhuK3lTanNCUjRyN1NidTdRaE03alRE?=
 =?utf-8?B?MTlLVFZUMVFCTnFJUnJQSkVCR2RUSXJtbUQwVHlESjdzYmFINjNYclI5d2M4?=
 =?utf-8?B?OG9BVGVFS1JEQ0o5MFYyajNRaGVZTjVsY00reWJ6a1p0M0ljM0hZYlhIaHh1?=
 =?utf-8?B?UjhFY1Q1blJCdS9oU0hvSW9RYjJKQ2x4aytsL3VrN1F6K212RDM2YlR5c05D?=
 =?utf-8?B?MmZwajhqK1VyWlFBOXZrcEJYdytiSjZhZkZwdk0vVTdYRTJMR1ZqdVk1Nnlt?=
 =?utf-8?B?cHViZnZaU3lIOUNaY1Q3OGNBTjZJcldRV2VYM2hBTlhwbmVhUlhuV01URENO?=
 =?utf-8?B?QmtFMEliWGZDWEtpQXJibWhQQ2Z1UWg2M1JqY28xQVRESGZoakVIWlVPVG02?=
 =?utf-8?B?bGVxVFNiTnYwTXVYTk9VSDc3RFFKQWh6YUlPdXJMV1FZUnNDNFE1M242enR3?=
 =?utf-8?B?SVZxeTZXM0xIZHVaNVJjMXVaOVZIL3dXUlowRDNlekltL3JvMFhHS1FxZUJG?=
 =?utf-8?B?WnUvQkM0V0thNVBlWVcyUnhGcXo3dGtLU3prOW0rSTFjcE5idlpFelgybS9K?=
 =?utf-8?B?S1BnZTlDYm4rSlRibXBLK3FjekhHK2xuZWlBVExxNnE5YzVCSTVHWHhMTXRt?=
 =?utf-8?B?bXVXcldZV3RnUU5rOGo4RkxMMWV4Yk44bjNJZkt6SjdMYk85WWR0OUQxVzhH?=
 =?utf-8?B?cXpIb0JVNml3bTlvNmZNWTZacGFUSXJZVjY0MnJpY1BTb2E4dzNYS1pOeWw2?=
 =?utf-8?B?S3h6UjM5M2Z0YTNLUThxalVTSjNQTXhveUFPMHJPMEU3NmtkZFM1LzFFbWdE?=
 =?utf-8?B?SlUzV0o0UDFkSFJVTUUrVmRrbHFDOTZMdGdBazQ5RGtlRmxXdWEySi9jWmNN?=
 =?utf-8?Q?c4Q+HwYDTtisu+VaLljg37Y=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 de48a160-9d31-4010-d65a-08d9f2695eda
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 23:01:03.0754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eupna4XuIyatInJ5arDc6EV+kL9A49j7/4TKYcQpJud/F3/85zRVpwNr56sfX+xmnA35dOipets7qc4rZYPNkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3343
X-Proofpoint-ORIG-GUID: U6zgtXU5TYJLpUFlT1qzHgbXEYR6A2TA
X-Proofpoint-GUID: U6zgtXU5TYJLpUFlT1qzHgbXEYR6A2TA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-17_09,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 mlxscore=0 phishscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=957
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202170112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 23:01:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161870


Folks,

I am working on a proposal to re-write how INCOMPATIBLE_LICENSES is used 
and processed to possibly include a COMPATIBLE_LICENSES variable as 
well, see PeterK's email [0]

I am trying to determine the usage of WHITELIST_<license> which would be 
used to override a license that might be listed in INCOMPATIBLE_LICENSES 
variable.

Randy and I have done a quick and dirty survey of a 100 or so layers 
(thanks Randy) and could not find any real usage other than what's 
currently in OE-Core for WHITELIST_GPL-3.0.

If you are using WHITELIST_<license>, please let me reply with your usage.


[0] https://lists.openembedded.org/g/openembedded-devel/message/95166
-- 
Sau!

