Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E252C43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 14:54:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5816.1655304859565119063
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 07:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=bYECQ9MC;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=3165dc180e=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25FCuefi032709
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 14:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=uIGicMOnb2hgLI+rYLcUrrEIRNf6N29cuQShhHdBi0U=;
 b=bYECQ9MCv+Krb/ZJSNj4dOfnHR2CoszhTqjhqFeSsrPFAKT+a3BrjSb3QX80JGZ3RrRi
 e7VA9m9hX/w4KxwE7/1rKoJUtW7L7vvHSraQAQmcWbJq3Ljurc65q3GJmRZXtQzjz6o4
 CJR3LzyWXQeVt1dpv65VMSKTkKOMacp/JF8NIKElnrgfrqEkBi1XSMAp+V5Kh3QN95iG
 umRV8JYXG7B62KHcJhPq+djsXuAC4cqSxFBlD0dJHswph5OojpfvTl2IyuvrI7LcuXUP
 6vFelpleguGszKsH8EHv9t1nBfd94OgHQg7qRrfiOgpCB1qy0EXr3yWvvZrUj3IQatMA EQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmg91ufax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 14:54:17 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25FEpaRb008198
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 14:54:17 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2047.outbound.protection.outlook.com [104.47.73.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmg91ufaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jun 2022 14:54:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auHdZPGhQlc5uAkhnjj9Lt853oR+Ucdv4nVLtw4eUIi0qvG1jE6kmPX3LrniiJvIIgaFLTS/W1nW1PVVv4x7SPoSE6NQK78KhiqWuOPiRngD+XgatPmI+ZXNWGNQeSQn74DOlzrCbg9cJkqG3IcGhhNdU7SyL1wbIsS2D6HnrbUeofK+UWssoIYaK0yB//1JWy4QQ9UgFlby6pjZKTsoru+jm3/gW2Q/pBOzacHdqp5o3Fh0mWjfe896qdkMCbOinoh9j/PoleYV7mLKZ6lCe6hmgKZUGZvw4FUOI+If8VmFUImkmaRlalTeBdzOcB+27f6abBBselpNh2LS88AyBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIGicMOnb2hgLI+rYLcUrrEIRNf6N29cuQShhHdBi0U=;
 b=csWxNBLPRgLVamMyChQxE+GOLSQLUIp8mBgHXMWjSn5/HodlO5YBQrUaqYAgk6AnNWVWJbgA/pSaMKJoBnwIWMThg8HNi+tNY4pBxhSXAwrZcDkSz7OPF8Rr6mBcrdNDtDcWVLh5ZiEHO7S7/s5drwCp/ZT1XSAfuUQyhPW1HkltEquTSnaUA6N9Nqa+8GNW9dntWWiiyazLomP2cV3Qwtbqja0gbhb7s9GWMbKv49RNpG+bjn+vGFtZX51jy9JblJM96IVUIbqIQ8wZ6UDJ+3nrsE0vpjTW+eZ6kHODN2YMWAZ1IsZI94n6bwLRci1qZyYAcQ81g3jH32dyGXswsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB3867.namprd11.prod.outlook.com (2603:10b6:5:4::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.17; Wed, 15 Jun 2022 14:54:15 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b999:2318:495a:f64a]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b999:2318:495a:f64a%3]) with mapi id 15.20.5332.022; Wed, 15 Jun 2022
 14:54:15 +0000
Message-ID: <4bab99ff-3086-12e8-ed33-d6481db1e27d@windriver.com>
Date: Wed, 15 Jun 2022 10:54:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [PATCH 1/1] wic: Use ROOTFS_DIR to locate pseudo_dir
Content-Language: en-CA
To: alexandre.belloni@bootlin.com, Robert Yang <liezhi.yang@windriver.com>,
        anilkumar.rath@windriver.com
Cc: openembedded-core@lists.openembedded.org
References: <cover.1655274860.git.liezhi.yang@windriver.com>
 <9e7e057f730abc1b8c5f1a942618ba1303ef526d.1655274860.git.liezhi.yang@windriver.com>
 <YqmJk1TfiiQwvKWl@mail.local>
 <eed5a04c-b817-b35f-aff9-0580a21733c6@windriver.com>
 <Yqmy3PJcNWW/A+kP@mail.local>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <Yqmy3PJcNWW/A+kP@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0138.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::23) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13472c6e-2e90-4544-d0f9-08da4edeea91
X-MS-TrafficTypeDiagnostic: DM6PR11MB3867:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB38677C06079F487DAFC2C594F8AD9@DM6PR11MB3867.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WtkYPyhhSml2YniQzjN8atXPN6TD4Y30gVomMQa1Cy1MAsBY/D4goFMZg8s/+raGAPmstC/ZWtxthftvAoDwibPxxWLDSY0HmcuC8sxVNQgTRhJ/vOy+VI/769dBWQpAF1W2gEO4HD94nqZBz0ZmR7bxs7w7xmdstFs394dDNeuUBjMdzOP1zHxGy0irM+ufK4HFk5Y+jH/6H1rAvT61C5BsZUNpalmsOkwHfNRCDJRKCKcsLo830EbLYf1zOIiaCL4wU/NsesUWkjM3d/yode7Mi5NOVqteW7Q0Js2+V16YZmoHyqF+8KBb7aSn/61rB9abYUZx305SXoRpBnTB4zokthyB0KGxA4dUUZFEizXR946vWTXTj0lwwqo8fXuE2ZbrqkHm7PnnWZvSrS8PxqHQ1Nme5R3k3bNNIaU1NJTxW3ukNVOOOvb/hbyBWKcyDnN5Af9DCTHeelTCnJHG4lQHYuJoZ5JTSNb1e+MZBkyuhLoEVULNQbtGS77alAhZJDxbC4OAU0ktV6qqqG7SElvCoZ38j+9VTgMRSFwgsIAeeQkZI8s9qsvBnmGE/Z6sc8fF/9JBB1UM875bQwsLXJreXZoHFkU4o3ExsjpTc13Tz5vffc7SvkFgyRYOquLo7mTO2NO9dFtP/niyz0yXUlTBM7cK9A11IjRvMNkZiaiSpuANwroYb/ViKKFov+b0QQwTXl18jLEDyiyxl6A65b5swsWwLXwKicRlUyNG/pzHMOiyoQdAeJ92qYzVdBDLtaFojvNi4M/Q5iysfKrTH0LlHBZ/S+tes2XHimttjoITSqSa+nSaczKFG0PSBfACYv2bfMJishLqoL0QOS25AEryYl8u2IhoMKaggGh0+7hEiOn1jBLDnHYVRJyFxHniAjVHiuaU5PbfsY4QHTpaDQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(66946007)(66476007)(4326008)(186003)(36756003)(6636002)(66556008)(5660300002)(8676002)(52116002)(53546011)(2616005)(6666004)(83380400001)(8936002)(86362001)(6512007)(316002)(31686004)(38100700002)(31696002)(38350700002)(6486002)(966005)(2906002)(26005)(508600001)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WU5XS25WS0lFSGJLMmRBb1dPOHp1TXQrcUFFcWk3eEEwdWt1S20vUmYxRWNx?=
 =?utf-8?B?dUc3cHU4eG9aS3hBRDk4OEpGT2hPRkdvOE9OMTRkNldLajl4SXJTeldOQjhF?=
 =?utf-8?B?cjZIWHJxVXEyUW5lVHlLeWZTZE83MTg3RXREbnBuTEFBVTNtdnJ4SjlKbkdM?=
 =?utf-8?B?RDQ5QWpBT1Q2Tjl1OUs0aWEwMUZaenNtYWxxc2REQXg3a1NoMHpUK0hNUXFy?=
 =?utf-8?B?bWJwYzJ4M0ZBVG5Rci9zMElKTmg5ZTdsVlUwN2QyL3htZTFvb05vY3k4enc0?=
 =?utf-8?B?NUxRZFFnRkhwa0Z3Tm10aFFVZnFjanhmb0psZzd6UmRIZGk1SWZGQm83dnN3?=
 =?utf-8?B?OGJWYlZrVnltRFZZQTY1QjZtL2RybVpjL0RyWm5JUXRzQzdHQUZjZEJycnh1?=
 =?utf-8?B?MG4rQU5JMWdob050cTU4UUZwQVAvOWE4NnFXbFY5TWEvVXA2bXcrNDlTUkRX?=
 =?utf-8?B?N3JOSCtJaHQ4OEl0SDU4aUJJdVNZUXJZVmpraVRhSGdXdjNseGl4NU9aOVNu?=
 =?utf-8?B?MkVDQkg1NTE3OER5TUNnOUg3K0VIUlFhWnA1OWZrNFpoSXlTYUxFVVpkZU9s?=
 =?utf-8?B?cThzVW8xNEoxTFFpcVdFc1RxaVNnb3YrNHl1U0ZKVk5vcjl6RGg4cmpjWmN5?=
 =?utf-8?B?YVEwSFZ4N3JoNnVURzhLL094V0c5U2RKMFBmWnYxTXFqdHJ3Y3FaKzhKMXJy?=
 =?utf-8?B?cVR5dklSQUhWc1JHelJuNmtvblNHbFZYUHBnWjRyMDBLcGkwWFVHZk1VcU5Q?=
 =?utf-8?B?NnRZQ1NEVytxaDl6eHB6YjkrM3pHOHJ4MzdrL0Zlc01iVGhYWGsxbmFtT1dx?=
 =?utf-8?B?ankvSWJ2UkNCaXE0WVRxeTJVQmEvSEdmeFNESjFhanFjMVlId1N4M3RXUGgx?=
 =?utf-8?B?L1ZlQW5NTENyNysrNGVmZjdTZTgwTTFTY0JtM3ZubzUrV2h5a1RYUzE4VlpK?=
 =?utf-8?B?SmZNbjNxelR0Q2YveEhnNkg0QWpjVEErU1dQakJleFdFYzM0SXluNG5xUHli?=
 =?utf-8?B?ak5rWU5pSUh6dmo3UjZXck5wR2JTRi9PT1M3cExIdk9mdm1wT0t3MGx1V29K?=
 =?utf-8?B?eFZzU2d0VHJXWmp5ZmRLNFA1YnFPbTc0TnI5dThSalhxRVpsR1FUb3E3Q2Q0?=
 =?utf-8?B?RHNaV1c4c3hEWjJBTzhramdIQnIxODBnRUs2WlFyR2JzdmtveXhKTk9zTzBY?=
 =?utf-8?B?RW05QUpub3Jqc1FsY2tQVXJoSUVnaFhFeFVJa2hLUTM2aU9VRFRPL3JtVkZz?=
 =?utf-8?B?WnNoR0ZJT0FZWEoyVm41ZGpQN2RDVEpRVy9GVVVJcUZRQWJBQ0pXNTJCL1Jw?=
 =?utf-8?B?QUpQZWhZbVN2T0cxYjB3eHVoVUNWYlJEYUxFc2N1RS9ma0tLbVRPS2FCcFN0?=
 =?utf-8?B?bGU0UDFIVi9DWmdYMWdtc212MGRzQm1rbldRalJzMWc0WEUvVHNvTG5SMUk1?=
 =?utf-8?B?VGJYT1BwZWQ2aUhHQkVzSFZPWVB3b2hDeDNrV1U4SDFhSlFQcTlJUmFPdnY1?=
 =?utf-8?B?dlBiUkZHV0hlK2xXWU5qbUxYWlpBUFFRYXJMSmd1U3lCYjNYZGZ1WjRveFRi?=
 =?utf-8?B?Y2RTcGNmcHNrSFMydzArbmpyQkptelFacDNlS3NYNkhzUytGNEg4WHVzSE1m?=
 =?utf-8?B?OFpHZlkyWDhWSFVsY0w2TXExOFhVQTYzOVlCcXRGdXNKTExwdFh1MjR1SlNO?=
 =?utf-8?B?ZVhkQVozbzNQd2w0RkVWbkQydlVOV3RybC9xWmR0QlVJTURQZ05Mb05zSGFo?=
 =?utf-8?B?VEYvS1BQcDV4SG4zNGtjVlp1ZGZrbDhNUi9LUDBJSGZpaThURTd5VmNiNC8y?=
 =?utf-8?B?cnYxd24wTXN2UmFsMEVPWUovWTdaMXQ3b1VyYkVmU0wvazVoS1YvOHkrcTZX?=
 =?utf-8?B?V3F1V29WaVBQVFlYWkxXNXZKWHMwa3BIbEltbmkxTk1VSUFGNlJldkliMkdE?=
 =?utf-8?B?TEF4eUFMcEt6NFREc20vNW1WTzEyS3dPYW91TkUvRitTeUdtNm8yaVBrSmFz?=
 =?utf-8?B?NEh1bHN1S090YkhyenVibEV5czE3YUNmWDJIbXBudUJybEgyeStYZWVOa2Zw?=
 =?utf-8?B?MWxIdEVPT29CVUFqczh3VFNYNVNhZlZDMG5VTmUxV2g5YzErZlBjMzJsQWpK?=
 =?utf-8?B?K094RWlNU0ZCWGtiZ0tRb0l0SzY2bUxYUUhCUTM0cTZqQnhIMUxUR2hZNDNE?=
 =?utf-8?B?UmNFdWRBU0FrMFNRdVNpNTN2bDNPUGx2RHF3S2hKazB2UUdnWjV2SW5ya1py?=
 =?utf-8?B?cG44NDlWaUZZaHNJRXAxUDNBbTdISjIxbUY1cTh2V2RKV2RDeHFPbTdMQ2ZT?=
 =?utf-8?B?b1R0NTZ3NlZTS0lIQ0FadzZ3L2lrekl4Rk85OGdBSTMyTXMxWXd0V0hXMGVX?=
 =?utf-8?Q?LsqPcNUKvgBXZzFU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 13472c6e-2e90-4544-d0f9-08da4edeea91
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 14:54:15.3508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OwLoHBIoNbA6YJNe0v3KhJM1LOncPUtewywlSvGD08J91cRldEAtc1Ti+jUmLloF3xEiWHGWUDqc/IfMfKcpU/XOT9gk6jfsDHERORFnDlI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3867
X-Proofpoint-ORIG-GUID: gHg4UigC7dcNCecqD-cJwrJUIvSf4TID
X-Proofpoint-GUID: Am0WT9zmhHFYDh0Epj1udPlQUvchuK6c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-15_14,2022-06-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206150057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 14:54:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166989

Add Anil Rath, the patch author.

On 2022-06-15 06:22, Alexandre Belloni via lists.openembedded.org wrote:
> On 15/06/2022 17:52:18+0800, Robert Yang wrote:
>> On 6/15/22 3:26 PM, Alexandre Belloni wrote:
>>> Hello,
>>>
>>> On 14/06/2022 23:35:29-0700, Robert Yang wrote:
>>>> Fixed when wks is:
>>>> part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 4096 --fixed-size 256M
>>>> part / --source rootfs --exclude-path=var/ --ondisk mmcblk0 --fstype=ext4 --label root --align 4096
>>>> part /var --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/var --ondrive mmcblk0 --fstype=ext4 --label var --align 4096 --fixed-size 1024M --fsoptions=ro,relatime,sync
>>>>
>>>> $ bitbake <image>
>>>> $ wic create <wks> -e <image>
>>>> WARNING: /path/to/rootfs/var/../pseudo folder does not exist. Usernames and permissions will be invalid
>>>>
>>>> The --rootfs-dir can be anywhere, so the ../pseudo may not exist, use
>>>> ROOTFS_DIR to fix the problem.
>>>>
>>>> The patch is from "Rath Anil Kumar <AnilKumar.Rath@windriver.com>"
>>> We need a proper Signed-off-by and From: to reflect that.
>> I got the raw patch from a website and added the commit messages, so I didn't
>> add a formal 'From:', and yes, add it would be better, but I can't add the SOB
>> for others. I've added the 'From:' in the PULL:
>>
> Well, according to the DCO, you must add the SoB from the original
> author, else, there is no guarantee anyone is allowed to shared the
> code.
Anil,

Can you confirm privately with Robert to fix this so we can get your 
patch merged?

Thanks,

../Randy

>
>>    git://git.openembedded.org/openembedded-core-contrib rbt/wic
>>
>>      wic: Use ROOTFS_DIR to locate pseudo_dir
>>
>>      Fixed when wks is:
>>      part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat
>> --label boot --active --align 4096 --fixed-size 256M
>>      part / --source rootfs --exclude-path=var/ --ondisk mmcblk0
>> --fstype=ext4 --label root --align 4096
>>      part /var --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/var --ondrive
>> mmcblk0 --fstype=ext4 --label var --align 4096 --fixed-size 1024M -
>> -fsoptions=ro,relatime,sync
>>
>>      $ bitbake <image>
>>      $ wic create <wks> -e <image>
>>      WARNING: /path/to/rootfs/var/../pseudo folder does not exist. Usernames
>> and permissions will be invalid
>>
>>      The --rootfs-dir can be anywhere, so the ../pseudo may not exist, use
>>      ROOTFS_DIR to fix the problem.
>>
>>      From: Rath Anil Kumar <AnilKumar.Rath@windriver.com>
>>      Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>
>>
>> // Robert
>>
>>
>>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>> ---
>>>>    scripts/lib/wic/plugins/source/rootfs.py | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
>>>> index 25bb41dd702..11b09c1e80e 100644
>>>> --- a/scripts/lib/wic/plugins/source/rootfs.py
>>>> +++ b/scripts/lib/wic/plugins/source/rootfs.py
>>>> @@ -95,7 +95,7 @@ class RootfsPlugin(SourcePlugin):
>>>>            part.rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
>>>>            part.has_fstab = os.path.exists(os.path.join(part.rootfs_dir, "etc/fstab"))
>>>> -        pseudo_dir = os.path.join(part.rootfs_dir, "../pseudo")
>>>> +        pseudo_dir = os.path.join(krootfs_dir['ROOTFS_DIR'], "../pseudo")
>>>>            if not os.path.lexists(pseudo_dir):
>>>>                pseudo_dir = os.path.join(cls.__get_rootfs_dir(None), '../pseudo')
>>>> -- 
>>>> 2.33.1
>>>>
>>>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166928): https://lists.openembedded.org/g/openembedded-core/message/166928
> Mute This Topic: https://lists.openembedded.org/mt/91771589/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux


