Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BFECC433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 19:14:50 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web10.56453.1638818089867764659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 11:14:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=OQPbaUIa;
 spf=pass (domain: ni.com, ip: 148.163.156.75,
 mailfrom: prvs=7974a63cae=alex.stewart@ni.com)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1B6Hq79c005144;
	Mon, 6 Dec 2021 13:14:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=message-id : date : to :
 references : from : in-reply-to : content-type : content-transfer-encoding
 : mime-version : subject; s=PPS11062020;
 bh=G7Y48lmRUGDe1t8j8njhurL+s5ymJ2eZidN5zg98nCI=;
 b=OQPbaUIaMyffavVGlzfV7Ypi2Ye/ZQdMrv4SlU9YxaPz+b62fR4JzQR0SNo7sZMIGjap
 MvtoSnUasK+En9w41oHBTgZSYveedVwuegkTR5tnfOx3kX+bsNf6rEWcNZDy7F6uJRB2
 8+C5kwwS6HAJOb7/vyK3/Cucl+A7QAMl7cuS08gKWZaQ6fN5IFxPm6B++WyCoKlxlXhE
 /TIbLUiCEB7TwOfKqhGHa6KPVkcShWF7qgcKg0PkrQNltS++O3aOmuM7XqfeYtLnDotZ
 WstZ8s7C+75WuF/iYXQZkFz+P4WnfGNzAEZrfikWSwCEjb37DQdGt/cud+/2I8W/2gEH Lw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3csa8jsff3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Dec 2021 13:14:45 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OiliTTpNdhNtiaOlekZNZ8qZKwAW9EFCLsKirPWDoR7nX6RzJ78Wz3oAZSmvmoUWzwMFD6zxZD+9kDT/ETWloZiw9+3EWfdsGwdTUjjSUs8c019sRBK016gT31xgncap6QLZAS9hHVOo0FF1Unf3waWH49CdGMuXGtfUmmP3JkRYO/zY4oR34R7LnKB1q1AtoyFF+YuULc9OpD9A9sUs+FlUUj9cavKeurPXM+RjitRcLfbEO0z1CslfUPtS+I9BYckgZCGFSqz/RRWhaSvJLlBr9941sGieFEWLcqfO5g5subAMqeOExvuwwmKbth9DmqwygZ29YA1o/KcBCMzp5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7Y48lmRUGDe1t8j8njhurL+s5ymJ2eZidN5zg98nCI=;
 b=hN0d9bo5aVT2QHMfzhZdAjXuowR+eU5qejSXFHWxRVEHrUhuaW45fcjOcsMb8ZU5+Y4ZXavx2JkyUEffIi7eMyW7MUbp/Q7mNQuQiR+jaU3GbbMudPxPVSyInF+TQuVgmEd6Mgaq7xCWsMPQRz0zUATsbbL9w9Nl8Bwi+XKnvwTan9jMCo7zefKNGESlOepAW+RRDkiMalbznjiEfyK/DD2JNBAXSJ7xB2+bd9B9zMq1Sgy5lTbdUofC4uc1xRxjuoN59MVV7z0yAO4Mx93zQagGmTULJgerOc+Hsyf98bvv812LIIpduL9GWKFx24+gmPV5vRU85rHSCnamscAIXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7Y48lmRUGDe1t8j8njhurL+s5ymJ2eZidN5zg98nCI=;
 b=TteMWAkQTJVuoot0rWnLzBVevKoaHPVTFKY+lddbFPvYCpB96dMZ/a+PcsGaSmeIJKrVD1k8xz+FoNDdOi4tMwot6vx2zsQhztQMtb5POrNak97hIFjqaGR9RQinafSuPu2MQJZDC/T0dNmSIYmDgp57wngFl6FQUI0WfEC5lEs=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by SN2PR04MB2189.namprd04.prod.outlook.com (2603:10b6:804:e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 19:14:43 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d5bd:eb01:7b59:ed67]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d5bd:eb01:7b59:ed67%4]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 19:14:43 +0000
Message-ID: <9e8351e2-8829-2b15-426f-25961b8c00ce@ni.com>
Date: Mon, 6 Dec 2021 13:14:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: zhengruoqin <zhengrq.fnst@fujitsu.com>,
        openembedded-core@lists.openembedded.org
References: <1638835585-3872-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: <1638835585-3872-1-git-send-email-zhengrq.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0089.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::28) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
Received: from [10.8.0.5] (37.19.213.64) by
 YT1PR01CA0089.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::28) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Mon, 6 Dec 2021 19:14:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4121d334-6336-4cd7-7cde-08d9b8eca87c
X-MS-TrafficTypeDiagnostic: SN2PR04MB2189:EE_
X-Microsoft-Antispam-PRVS: 
	<SN2PR04MB218996173D73AE8DCE546D49FE6D9@SN2PR04MB2189.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3BaU5erngekZ64aghSilk75iZS77WGl4ywZTwejADlX8ybPOUt0rANE1wR+E/TPTSvcaSH0IIWA2m7vykS8R+ccmy37zV7RRGsD95q1wuYAYiCL4x6jN/z0JtE+q41pdnB/5YW0wVuQnYScEp+g0wx9d25a0qPFnKqRzgMS55+s2tsTGh8MrUKkNWuSoiDbvRGj0jqJRrdKMJBhOiJxJijAjWUfpbGCDoFfDOQw5pXLJVUvuRw8NG5ewFU7D1PnSBMBo25BkCpzOTkpbe53JAO7wf+4uW6QiDgBTBAEcu4ty4DdXC4qv6ZtwXqdthvRZJvg+inba19x3Gcbh09tBaj2AjyZR8eePINaK1X4qZO+ZELV3r/kMt5FizVQVBVDo57AsTW5tuoqOwI2FDyXe070/orlJF96i6hLqntQ6erDtOV41uBrQpid8FdnnWyrnH/mgHWiGZEB/lwElgCwrfu73OQrX/HRPaDVgjvIEpAGvS9MpxcqFFnYEPN8UZVqt5J341RjyMkLk9TTITouzVIRjCpA3kzG8mjOBLlsZirtS6wa5fjWdkp9Yfk+V3MNgEVBPDi1nqsYZYxuMsQt2OAy/YohcXVJZbcsqAB9P18c7mwkcn6/prtr7UmEKWJMsF8trp40Au4iFafta7NfXyJ3BynfzZguWExlsLEQmFaYT5U0o6c6LUdxHhg4A4zJokeJBEHvW50vRE59hEZfIrTLLUmgzZ9BI7M8coTnQ8ly3+bsdRF515pjOs/GgRjAbTBXUOGD1DIpjWOKURRhiXXyOm0vMxS1LYGrObgmqLDU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(44832011)(52116002)(8936002)(956004)(31696002)(2616005)(5660300002)(36916002)(36756003)(508600001)(2906002)(86362001)(31686004)(16576012)(38100700002)(38350700002)(558084003)(316002)(66946007)(66556008)(186003)(66476007)(6486002)(26005)(43740500002)(45980500001)(15477505002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a3U2OGl4SU1qSjRydndEY09iK1d2OWNXc2p4RlJuWUw4a3lmbmZQOGppczMv?=
 =?utf-8?B?S2RXQ3F6ZEJ5VHd1MFVRaXZJei9yTXRvc0lyd2RVbzRLc3pHTzVrdktuZjB1?=
 =?utf-8?B?QXRpd1N4RFJZenVYdFY1cStZUE5sLzY3S0hhWERXcmxDSWhmUDMxVG5nUDV3?=
 =?utf-8?B?MHdlVWVoS1dST2dyRzE0OEErWDZjcjZjYmtDRWZxWmtjeUcrcjlDUmo4Rk1D?=
 =?utf-8?B?Y1o4TEZWbHNjenJ5V01KeFQ0bEVyWm1tMFh1TnhUcStjaVJGeit4ZGVBSEpz?=
 =?utf-8?B?ejNIdVJnQU1RWng3Smw5VlBQVlRNT1paZDNIb3p2cXo3bnNjVUU5UTZvNE9q?=
 =?utf-8?B?cWRzZ0syZTUxUzVkekVoSTUrYlRXT2lLaThEQW1mS3E2SEpiQmc0cENCQU1r?=
 =?utf-8?B?Ym83Z3RhdkttMnh4enlEWFFoZUdzb3ljdlBLeGR0VXpwWGlQN3pDMFlzYWZQ?=
 =?utf-8?B?alBoblZhZ3lpU015THZ5UlJ0dFRuUkhTT3VKTmcyYnpucnVTUGRJVWUxODBM?=
 =?utf-8?B?d2dKOWhEZFo3QXUyK01BRUFFVmFpSEtQUzRpR2pXRStDUEl6cGZjSDJzaUJS?=
 =?utf-8?B?c1JCSFFSME9WK3g5azI4TEZMN1ArYzc2T3NwKzI0U0ppT3lXSFNpWkdYL3N3?=
 =?utf-8?B?M1RXTEl0TTBlQkp2UC9oRUhHV0hjUEZ2ZWJkejJTQmoySDhMcllQWE5tUklt?=
 =?utf-8?B?VVh2TzJlS1pkODRBSzgycHBFVzAybW1PWkJUOHBEYTdBRVFQVWhDd0JabjhV?=
 =?utf-8?B?M2pLTXdOVHhSMGZSQ1hlTXBVdWxvQUNqVG51MjV6S3ExN3oxdW9UbHpXUmFJ?=
 =?utf-8?B?RE85Ny9XejdzMWhEdlBRZGM1MjlNR3lDalk1M1dMWENhOHJLcmUvcldLSmJZ?=
 =?utf-8?B?REZpNnBndFpwTC9uTkhZSW9hVXhKMVRqN09EZUZNVEEyTWU5L0FaeHFLYWhW?=
 =?utf-8?B?K2lJVkVTUS81OHNuZkdOTEFYMjBTeGNYY0pscXpyYURhaHdocmxTQkdtTGtj?=
 =?utf-8?B?cDZPMFVvMGhmWEdONFB2eUpZTHdYMFJxT0Y0YmFKQTQ2TWNPeVFNTG5ZMU1W?=
 =?utf-8?B?TEE5YWdobXcxWmNzcTlnN1JHalRoTGhkV1ppVHlIYUxsVHNYRHpLcGZmeWg5?=
 =?utf-8?B?Zk5LdTdxL1J3TENyL0s5RGlINlZ2NFN1azYwRStHQWpUeWtqQno0SjQwcm1l?=
 =?utf-8?B?TU1Tc3REMG5ibnBtaG94eS9JT0YwMjVFZmhVMitWU2NSQVhwdUhTQk5ISGhn?=
 =?utf-8?B?UGNHaU44akVDUEE1U25QWjVoSi9QbnErOWZnYUR1M1pDa21SMmxhL2N4T0hx?=
 =?utf-8?B?RWFDWTdlc0FYTlo5aW5CU29QS1RMaUFHSGF4M0w4S0pYT2dEdmlOZjBtdUdQ?=
 =?utf-8?B?akF0VmhKRTZGbVhGZElmeW1ZN0ZZUzkxbW84WHl1UGlhOUZVT0xWZlRYbXBS?=
 =?utf-8?B?aGxRdDFyQWRFSi9ZbDNzSmFGeDBlTi9TTzVrdjE3V2hVUnFJZ3dnblYwUTRx?=
 =?utf-8?B?eFRocWxpN3VsQjlDT0M2bVRKR21keDhRSGNrTmxHeTg0NHRMbi9xcWhJYkFN?=
 =?utf-8?B?N1FvZGpaaDFocnhqc3VHQWVIN0VkS0ROTjdIVytacDB1dllpM0c1VUcxa3hT?=
 =?utf-8?B?NEtkUU9Tb2NZcnFhN3lGRUUzTDJvcldnamFDbEx5ZXlzVEV3NGFSVkxiY1ZJ?=
 =?utf-8?B?RXQ4VXdqYlhuSWN5YzBZT1VyZDBiZVprTWFhUDY3Y1RrSWh4c2lyWnhzekND?=
 =?utf-8?B?ZmpNRGJaOElaVk0yZnNxaTI5bVpqVVJ1THA1Z0lsalV2d0w4akF1ZG5xMTZE?=
 =?utf-8?B?SXZhMzN5RGZrU2V1QlhFRjhRNHdzR0xZQ1NsM0RnZ2xGWStSR1ZKdHJvUndO?=
 =?utf-8?B?anRJdTNvVzBzVHMyMXREMGV5dDZES0cxV3lCZm1YNXpvaG9vS1h5MVpvejVP?=
 =?utf-8?B?cHlvWXhydGo3d1Erak1CRjU5WGFDYWkzOFB5YVVIT0IyYmZrc3lUa2RTKzNK?=
 =?utf-8?B?MlpnTGIvZ3Z1bWFEZExOY1Zsbk9HZ1pneVhjT2c2L3Q2TXFmaUM1ajhXL2Jr?=
 =?utf-8?B?dnF6aXlvTDFoNndBbkdHb3Q0ZlBRcGVQeTRGQUlDSHhGTGdPZG9XR1ZmeVBq?=
 =?utf-8?B?SWl5Zll1ckkvMVhsMjd3dXNtTEhyMWZzamF6VSszTGlzY1RQTk55R3NGYmZi?=
 =?utf-8?Q?vI5N6vZ40PCg3dcMf4f0VeI=3D?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4121d334-6336-4cd7-7cde-08d9b8eca87c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 19:14:43.0228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1JeHaYsM3MIzs6Y8/IztXW5zTsGcnJhCfkIOkjxcHMZr8amxXO9gNPDwTuN42nzo4VIoboU2NpzfM9q/WZ2luA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR04MB2189
X-Proofpoint-ORIG-GUID: 7ihTmXy6HBvwMEKGTnXDfOfVgYnziCD5
X-Proofpoint-GUID: 7ihTmXy6HBvwMEKGTnXDfOfVgYnziCD5
Subject: Re: [OE-core] [PATCH] opkg-utils: upgrade 0.4.5 -> 0.5.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-06_07,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=843 phishscore=0
 bulkscore=0 mlxscore=0 spamscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112060116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 19:14:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159268

Patch looks good to me! ACK all.

Thanks,

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


