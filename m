Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F43C3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 08:33:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.41736.1723451574983976175
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 01:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=89543a5aca=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47C6UQQX008705
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 01:32:54 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40x3g01exu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 01:32:54 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47C8WrkR017809
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 01:32:53 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40x3g01exq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 01:32:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZjHtqJsjraouuIl1FZbHclnYld3Gmnghw6eMQePvLmMR8HryackziIx8PQYXv8ypPDHOZ09Iyf18C+y9h2vSSkVjGeHERC2JuO03DwxAPo3o3whb416T5AWW+Bj/mSoAWIlqK6fUefS4M/O+mHeR48rezH5Bm2xeifm5hwmr+x2/BeI8vc7g+Oyg6lewoeZh4ybDpI17hOowdiLJ2oPZHLHJzapHAzz/XcrCiJUZ8LrmNIDre9q5phH7wiMK3jSK3OiSlXVBFFbZB9+Khk9W+rclX4RHCRo2XaK6RDviz+s2NhEP3QBfCNO/awe3vvAcdHVqzJU+EhzVqAg/EzhUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMt5JbIyBl5kWONnpxbGGUfgjf+E8iXmZP6N3wKphas=;
 b=OL1pUTg3Koo/5UCYPvIAyWDdROTGRhlU+WrUrVdj7SD3/3Uz0/7FcmsKAb2IZM3cia151i5POahCxC+x5lFSIvKc7P3JOC4Up9owThmPGdeOwqNLK/MheBfacTPGsFFFERM/MS/wWpGKWfafNiN2UUsdQla1IyXkJgBmXHhXkUwoEesKHS//UoYeItspF2tEAcGUU4OWd0KE87OFsHUry2VDVnYkU+g/RPGsSDYvVKu/zi5+Sch0tfYiCol5J+rkcgbq6lpfESrJSbJYHTWPrFFhfJetlOSPNPmOr/pL+hTMRCMV08OASFWlUsFbL1b4l1tbNiUQN+ncJnNG6rtqsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SJ0PR11MB5789.namprd11.prod.outlook.com (2603:10b6:a03:424::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Mon, 12 Aug
 2024 08:32:41 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 08:32:41 +0000
Content-Type: multipart/alternative;
 boundary="------------bKQ0y4We0n9T1K70949jLH5p"
Message-ID: <2c71d621-6b84-4d55-8693-b1b0d6bbd3de@windriver.com>
Date: Mon, 12 Aug 2024 16:32:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][master][PATCH 1/2] apt-native: don't let
 dpkg overwrite files by default
To: openembedded-core@lists.openembedded.org,
        Steve Sakoman <steve@sakoman.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20240618033019.1181198-1-changqing.li@windriver.com>
 <17D9FBA631EBE6C1.1999@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <17D9FBA631EBE6C1.1999@lists.openembedded.org>
X-ClientProxiedBy: TYAPR04CA0021.apcprd04.prod.outlook.com
 (2603:1096:404:15::33) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SJ0PR11MB5789:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8e1790-8d90-408a-054a-08dcbaa95462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eS9yT3VqWDF2Q0FZUzU2Z1k2N2pRWUlNY0hXWFhwallIMjFxaVZDUTlJbk9t?=
 =?utf-8?B?MGN2ZzAzc2RvbnFHaFVQRlJNdm1BVm43WG5PNG0vL2ovTkhiWFA0dktDcnJF?=
 =?utf-8?B?dHdqd3gzYXlRRFdJSjZ2SmdxQzRBRTNrSGlQUlN0cjBXdndRdnBteE5VbTUx?=
 =?utf-8?B?K3RZOE1uU0hVL095OWI2VmxLdm1pOFRBQnlRN0o5STNxVVRqempNenRmY3A1?=
 =?utf-8?B?UUYzZU1hS1hvNUo2K0RsNmJmMlJtTnJGbXpmRmlzeVZ4QXhiVExMSEdtTGJU?=
 =?utf-8?B?dGJxS1N6TlVCOGpCajlZYWZDZktrcnJOOGl5bWZSekRsZzBFbUNZbDcveXBX?=
 =?utf-8?B?VDdGeWpNRXBIWVAvN2xVdllWWTFFSHh3SFkrTXJ6enFkVWZXaFRUbjhha3JW?=
 =?utf-8?B?YWNiNDdJYVAvV29RUUtHbjEydkZsaFFnamtUbm1oanhFVm16V2dwd0lqZ3F5?=
 =?utf-8?B?MHZIVWY0YklVeXVhd3dOZy9BNWYrY1Q0akt4TG1VU3Ewb25uNXo4OEs2cFdB?=
 =?utf-8?B?UGhsWWRmZERZYUJ1L2VBWGlBbGR6Rm1aWlBBR2Z0VnI0cVg3TlpwR1hDUVNk?=
 =?utf-8?B?ZUdqWUpYMjJwSXhKclU4WmhiUlBwWU1YS0pUVnN1cm5uR2tVdXoySkNxTU5q?=
 =?utf-8?B?aEc5OE40UmpwR01EQk5CVFJMNWtKVTdJNllYT1lwV3lPUnBnWjZuS1Q5cm5K?=
 =?utf-8?B?WnBxL1NxZExZQlM1TzUvdXkrYmI4UnhwR0daUEQ3ZTh1NjlJQXhoOVRZR0sv?=
 =?utf-8?B?UWlVTjBrVzZ0cmYvM2VVK1NFRWx4dE9QTW5YQXVDV24rbTNVb1BWSHhIZzRj?=
 =?utf-8?B?SVJOVUlmQTF4R0hRT3BuRnZRaks1bDM1UUdQN29ZU0FTci9DUjhycWlvc3lz?=
 =?utf-8?B?MnJvVzhUSGVmYkNZODZMV0VESFhUYUg3SzBMa0ljSm9rMVc4Zm12VEozSWVG?=
 =?utf-8?B?dTlEbDI2NWZsZjRGeE9vU0Vpak5DVHRUS3NCSDVWY1k3TXh6VnBQeE1Tek5w?=
 =?utf-8?B?Y2FycWRLbXNaRTNnK2RiMGtJb2JGL1ZjK05zTFp0U0RUY3pJc3lZaUJtdWIw?=
 =?utf-8?B?ZkE4anFNSkVXc0YydWxVS2QzQ1liT09ZUFpGRHNYQTkwdXhOMzlTL3FXenVM?=
 =?utf-8?B?Q1A2NmtLSkdqQXlQTjd6dFdCVXNwZmpVQ0FnR2lFWEhXb0I5MG00ZjdOYmRk?=
 =?utf-8?B?djNqK25VcldRc2hKYTlBTHBBVGpPOGpvaStKZTdQamNGenJQM1lRVDRHZ1di?=
 =?utf-8?B?bktOcVM5VzUrb2x3Y0hJMGMxVTNnUEdqQjgzeldQSFFFOEFDT0pFK002bmt6?=
 =?utf-8?B?NVNXLzBaMjB2SnpiNjE5WXV3RUpOQXVWUHBqNmR0cHIrVFJFKzVTeGlGMWFO?=
 =?utf-8?B?K21WZ29TR0VXbUdmQ0lDb0VIS0dWaW9mYXozWjRtcHRISWozN25vdzRadEMy?=
 =?utf-8?B?cUc0Qmc4V2NOeHZoZHZ6V3Y1dUd0UGgzczlpZ0gxd29JUFdhVTBsNjFvRWx1?=
 =?utf-8?B?N25FRmlFanhqUFQwTDBDRzg5dUY3b2lDelRMdUNmRzZ0ZEdpeEdzeTJZNlBF?=
 =?utf-8?B?ZWdvU2N2MkZZeFkrYmdzTXJ4T1hlVzRxcGpGZkg3YXRXaG15a2tnb0FsTDh2?=
 =?utf-8?B?dlBGdjM3RmdrNVl0akdGOGFDRzNRZ25JYWE4MEFnbytxV2pFQ1JKY3RCbXFq?=
 =?utf-8?B?R01VQWFOUEI5MHFZOTl6OG9ZRThEcjBqdjU3QTdvTmUvNTd5SGhIMy9CN0hz?=
 =?utf-8?Q?NhrjJdo9Wg3yHzR/Yg0SyLvKYA9VZ5V/Xd/iNTI?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VCt2WmtFR1dJRDVjQ2NQWWxBZXFHVTVVeFB6TFQvVWtpRGVXRHVMbGtua29E?=
 =?utf-8?B?QlovMXFPWWtSTGVFKzVSWlVPSVdWMm5aQUMyTTVTWXRFQkZyV093V0ZIY3Z5?=
 =?utf-8?B?emlXT29sTUJsMjFhYVVFcFhNRDVYSU5ydUtQeFFRVGlnVFVmL1ZpRGtGazli?=
 =?utf-8?B?bVRMQVZEOFJ0MkdjUkQ5K1d5SzZMYk1wdUx0TVIwTDVXMVhTY3BhWm5qa3Mv?=
 =?utf-8?B?ZUxJZzVDWTk4cUFzRnd0QlpFczlndVFDN0Myb0l4UVpGYldoU1RSU3o0ZU1H?=
 =?utf-8?B?SFF4cWVQelBkaWlnVjl5bm1LL1FqWU9makpHb21kWktDNEtHSmxPSk5UdWhr?=
 =?utf-8?B?STBNc0NFZzBpcUl5cnkzNDNkM05FckhXZVh2Tm80bGNPY0ZIbWNBTTVpOEdx?=
 =?utf-8?B?TlYrZlZPbHdlY29uWFVsd1lmS2Qvd3FPQTBkOVdPQXVncUJkdmFEdXY4dG95?=
 =?utf-8?B?THFLTUliNmV0TTdDSDZyYy9IcEdjOTd6Q21MZjM3TUFLTVQ3TExUUWhSaUlo?=
 =?utf-8?B?V3R6ejdvZDQ1RzJQUGgxYlBORU9nclc0RHNoaWlndzJMdU8wYk93K1BDTHBX?=
 =?utf-8?B?cXVSMkFqWHlYVEk1S1M2MkMzMGVmbEdENWhrVWtpWFJvZ2gwWXRsakNzNTRo?=
 =?utf-8?B?YXYzOEpKZkRzNWEzMTJpUHFNb1Z4bGRVTlU2RXlYNVdCYXp4S3VnMVpwZXNr?=
 =?utf-8?B?ek1rZGhvdEtnR2xhN0lQdFRMbDdXWU5nQnpYMVFGaUszL01XbmVSN2ZiMlFo?=
 =?utf-8?B?OWVYZlpRdzBVc2R2YmNsK3NBQkoxaVc3QS9CbUNEVHF1REdiMGI4ZTRHa0FL?=
 =?utf-8?B?bGFkYzliWHgvQm16SmNPeTFpRDcrbU1sZzN5OFhlUzBuN29qOGNQSmJZQVFy?=
 =?utf-8?B?TWpXMXhtQUtIVGZ0VHhncjU4ZWwvMlRWRVljM0VrUkJ6Rnltd3k4dEUybzFm?=
 =?utf-8?B?SDY4SnUzcHRpdUNETktvbXZpOFUxUDlMOVpMSzZydU0zMUZ3L1orT2xKMUpU?=
 =?utf-8?B?SXBwcTF4N3FjQ2ZxekdLRTBsclpEUE5KTkJIWHZFYndHckN1djR0RzQ4Njl2?=
 =?utf-8?B?d2gycWZQaXdyTzZZdXo4WFlMVlo4ZWE2bXkvQTczUGpZNVc3ZkNDZ2xydDdX?=
 =?utf-8?B?M3Jta2xIU3krYWxtMGhrZHk1RHRIclZLZHV2WmRFaDd1THFXYzdqanpvazh1?=
 =?utf-8?B?YjkzOXRvZm16bmJNVDNNeHRZNUkxL2JVaGhreUhkSU5RTnhaR1N6YW9oZUMr?=
 =?utf-8?B?T3d1eTNCaHBqWWIwMVphazB4K1lnMkplRDVRTFU2YU9aYjZwQ0k5ZEpGNHNj?=
 =?utf-8?B?UnVUUk52NGxDb2JUMnJ6Z1FYdW42WHdMZDBHbDJmQjdpT2h3Q3FYVDJtZkx1?=
 =?utf-8?B?ZVk3Rk9OT04wOVBDai93akpPVzRJVTM3VUdvYVVVU1Evc3ZLczNFc3BxSmVu?=
 =?utf-8?B?aDBHOFRNeGtDVmZ3SGUzaWNDQnpqRGgxN1RWOG1DNzUxWG9FRXR3MU5Lbytp?=
 =?utf-8?B?Ykx3ak1qYXlYajV4VlIzTVovT09DU1YyUTJTenBBTkNVd1dsNmJqaUJXWCtM?=
 =?utf-8?B?Y01lRnhjQUNDWEowYWRIQzU3YXRJZzlEUEF0SndTeThPNWNZM2VWU2JOOUVL?=
 =?utf-8?B?aVRndGlmampHN054WHlIWjlUWTk3UXprMmJGWG1kdjJ2ODF3Wnh0NmVEb0hG?=
 =?utf-8?B?SnFBbFJBd2Q3c2srQXRtRjM5enFna0wzSzZrM3ZHcFo3bkdydXBpZU04NHB2?=
 =?utf-8?B?OXd6SjlPcDFwdmxGYWgxZ205YVQ1Y04ycW1rTEhjeGhRdDc3R3k4Z3huZlgy?=
 =?utf-8?B?dTk0Tm1oNUNPN3pDNmV0MVFOYzVkZ1lEV2NEZzNnejFvWlk3M3ZaWlpwTFBq?=
 =?utf-8?B?ZGNWQzl6Nk41eGVsUXFNcFZkZCtFajNtbnBXOVRxRmNhMWtDUkx0ZWkvcnNK?=
 =?utf-8?B?RTRqR2hGcDF3cnR2WkoxK1Rhb29jTUJrZEdMdHFmL01MWU9rWERNUG50cmlv?=
 =?utf-8?B?WUxRbnBtVlJnd3BqZVdkSForb1Zvc2M0QlJzSDNaTWZOajBsZFg4bTJsOE9r?=
 =?utf-8?B?NDkyRnlHa0cwUDlMZFpZY1NoQjdpZHk3VmtLWVFiZTlQcUpnQkZDeERMeklh?=
 =?utf-8?B?Nk9LRzlZUmxGbm5UM1cxMzR5Q1I1U3pKTnJWQ0xZZml0dHB3SVAxd0V0aFhW?=
 =?utf-8?B?S3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8e1790-8d90-408a-054a-08dcbaa95462
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 08:32:41.0016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QfkioZLprOu29o5gUCBJAGiOTcUrKL1tyCNbqgVKYSU8liw2Msq3VKo+tf8HnZjEaeH7QgB5b9U4pDml7LzgGYMMOMBDqJwbU6DgRF4Aksg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5789
X-Proofpoint-ORIG-GUID: v5MtMbbdBse23que3cT_BOX6dScSA5_b
X-Proofpoint-GUID: Sgftt2FkzqzYGP8InDeXEL7HU0d2w2gn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-11_25,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=858
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408120064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 08:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203209

--------------bKQ0y4We0n9T1K70949jLH5p
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47C6UQQX008705

On 6/18/24 11:30, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> With --force-overwrite (implied by --force-all), dpkg will not abort
> when a package overwrites files from different packages. As this can
> also lead to "The following package disappeared from your system as
> all files have been overwritten by other packages: <package>" and
> subsequently broken dependencies, this makes the simple case of
> conflicting files hard to debug.
>
> Instead of finding all possibly required force options, only disable
> overwrite for now.
>
> Signed-off-by: Jan Luebbe<jlu@pengutronix.de>
> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
>
> Take back fromhttps://git.openembedded.org/openembedded-core/commit/?id=
=3D4292387ef6c4e80428bad6a07c844a288b27d9a1

This patch is dropped in=20
https://git.openembedded.org/openembedded-core/commit/?id=3Df058272de9cba=
188d96940c8c921cf31727fe4d1.

And apt still behaves like before,=C2=A0 it is possible to meet the probl=
em=20
this patch try to fix, so take it back.

And scarthgap merged this patch,=C2=A0 but master not yet.=C2=A0 So ping =
for master.

if master branch reject this patch,=C2=A0 should scarthgap revert it?

Sorry for sending the patch to both scarthgap and master at the same=20
time and cause this confusing,

Will send backport request after master merge the fix in the future.


Regards

Changqing

> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   meta/recipes-devtools/apt/apt_2.6.1.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devt=
ools/apt/apt_2.6.1.bb
> index 68bd7c5407..26a6d99f84 100644
> --- a/meta/recipes-devtools/apt/apt_2.6.1.bb
> +++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
> @@ -111,7 +111,7 @@ Acquire
>     AllowInsecureRepositories "true";
>   };
>  =20
> -DPkg::Options {"--root=3D#ROOTFS#";"--admindir=3D#ROOTFS#/var/lib/dpkg=
";"--force-all";"--no-debsig"};
> +DPkg::Options {"--root=3D#ROOTFS#";"--admindir=3D#ROOTFS#/var/lib/dpkg=
";"--force-all";"--no-force-overwrite";"--no-debsig"};
>   DPkg::Path "";
>   EOF
>   }
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200854):https://lists.openembedded.org/g/openembedd=
ed-core/message/200854
> Mute This Topic:https://lists.openembedded.org/mt/106734920/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------bKQ0y4We0n9T1K70949jLH5p
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <div class="moz-cite-prefix">On 6/18/24 11:30, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:17D9FBA631EBE6C1.1999@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

With --force-overwrite (implied by --force-all), dpkg will not abort
when a package overwrites files from different packages. As this can
also lead to &quot;The following package disappeared from your system as
all files have been overwritten by other packages: &lt;package&gt;&quot; and
subsequently broken dependencies, this makes the simple case of
conflicting files hard to debug.

Instead of finding all possibly required force options, only disable
overwrite for now.

Signed-off-by: Jan Luebbe <a class="moz-txt-link-rfc2396E" href="mailto:jlu@pengutronix.de">&lt;jlu@pengutronix.de&gt;</a>
Signed-off-by: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>

Take back from <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?id=4292387ef6c4e80428bad6a07c844a288b27d9a1">https://git.openembedded.org/openembedded-core/commit/?id=4292387ef6c4e80428bad6a07c844a288b27d9a1</a></pre>
    </blockquote>
    <p>This patch is dropped in
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?id=f058272de9cba188d96940c8c921cf31727fe4d1">https://git.openembedded.org/openembedded-core/commit/?id=f058272de9cba188d96940c8c921cf31727fe4d1</a>.</p>
    <p>And apt still behaves like before,&nbsp; it is possible to meet the
      problem this patch try to fix, so take it back.<br>
    </p>
    <p>And scarthgap merged this patch,&nbsp; but master not yet.&nbsp; So ping
      for master. <br>
    </p>
    <p>if master branch reject this patch,&nbsp; should scarthgap revert
      it?&nbsp;&nbsp;</p>
    <p>Sorry for sending the patch to both scarthgap and master at the
      same time and cause this confusing,&nbsp;&nbsp;</p>
    <p>Will send backport request after master merge the fix in the
      future.<br>
    </p>
    <p><br>
    </p>
    <p>Regards</p>
    <p>Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:17D9FBA631EBE6C1.1999@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">
Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/recipes-devtools/apt/apt_2.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtools/apt/apt_2.6.1.bb
index 68bd7c5407..26a6d99f84 100644
--- a/meta/recipes-devtools/apt/apt_2.6.1.bb
+++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
@@ -111,7 +111,7 @@ Acquire
   AllowInsecureRepositories &quot;true&quot;;
 };
 
-DPkg::Options {&quot;--root=#ROOTFS#&quot;;&quot;--admindir=#ROOTFS#/var/lib/dpkg&quot;;&quot;--force-all&quot;;&quot;--no-debsig&quot;};
+DPkg::Options {&quot;--root=#ROOTFS#&quot;;&quot;--admindir=#ROOTFS#/var/lib/dpkg&quot;;&quot;--force-all&quot;;&quot;--no-force-overwrite&quot;;&quot;--no-debsig&quot;};
 DPkg::Path &quot;&quot;;
 EOF
 }
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#200854): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/200854">https://lists.openembedded.org/g/openembedded-core/message/200854</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/106734920/3616873">https://lists.openembedded.org/mt/106734920/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------bKQ0y4We0n9T1K70949jLH5p--

