Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1984C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 08:10:49 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.38])
 by mx.groups.io with SMTP id smtpd.web11.8561.1646295048078475148
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 00:10:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=t4BmTWJQ;
 spf=pass (domain: outlook.com, ip: 40.92.74.38,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DzS8n/1H5uWzAAFVzy4Cuimm2cvPAxte7AGUccilzpG44Dw5hKVJX8x9LkwLbzrRuJgKW39UQBwuslVvFwlaG0C/R8DAt+pPdIUuv330X0MZUNvCfgKn1ERzL9HShgO2WNhCcZF2tmJWUPa2pdSdxsg5yR1MNGOhb9RSLz29lpNvtVERNpfQJTXBBjTfTsQNiQfmiUKNbTQxYC4/yYjKW0ABuoLbMj/NQ5v248ICB5yXLVbUkZvIgO51O6AL4FbxM4ZA6NuGYnTUuXD17ckeoOwYPMYPPp3iDIhJ7h/e4k1erxccSC/Asxt+tZ2bGR7go+fllOkK374HsMAj0AcmGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yw0GDXpuI4DN+FijDwe3aMGmPphsLXNqE2EueLw9XYo=;
 b=GiWjI+GI2Z28tpl/cGLQuDBSn4Am2d+CGrIIEsz3TyZBQ/k8W4m3/BIJbjDGfu6XnIAjZt5NxKfLytqegaUYJZg5LUWLH8JVV78BYD8v8ZTXC+2zO0miUc4OkqiySTRQWX+56WzVNIUh0YQGM3M2J048CPiaM2LnYfEippxPc9NFSbvnRXmGP92L4PoQlDE1BRH1ftvCM7Gvm2OJvht0R6By9ftVgKFCdPz70kzopAq/x+CCW/Rec4sjoLy2BmoWv60IhT+HE66eLIUxQmMjCqaCX2v5lCxysC53G3zljJ7hsfqqbBPNWvL6yq31tOuHeoLis3KdsfNJFtU3Huv1Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yw0GDXpuI4DN+FijDwe3aMGmPphsLXNqE2EueLw9XYo=;
 b=t4BmTWJQyoKIHWayMFd5yHjCutXbSGv3pBUkkTCIGhEU4n0VXEkWt6amhuQE6zHi8YTSQVOKb9VfDExZ1F1C+iFHuRcpgebDreabvbbBhYbkRAXQ/2btg8c9qTqGtOYSEzGBxuH2fJZ8kNB2jt7E5mF+qyVMGd0tDXP/jxRpFxSLaZ5zv7iSz/8ldoczd2JgessTFCH6ixKNNIGvKDRqaEJSlFgRDktJho1rQp61BRzEiMBYuYqJz+K/3lQM4lt5FPM3DYpX9eO5XUJNl3DO5eWatQ6yXhg93jACsNnKO8ZXXUZAbZdYTuYkCOi1Ym2sAvZ3ZGw/iISZEMximF4AxA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM5PR0902MB1922.eurprd09.prod.outlook.com (2603:10a6:206:11::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 08:10:45 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%8]) with mapi id 15.20.5038.015; Thu, 3 Mar 2022
 08:10:45 +0000
Message-ID: 
 <AM9PR09MB4642A596E4D70E846363B638A8049@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 3 Mar 2022 09:10:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH 1/2] cve-check: get_cve_info should open the
 database read-only
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
References: <20220223125432.2733396-1-ross.burton@arm.com>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: <20220223125432.2733396-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [CsAmm19Y9BItLlzbBGqLJVStnACkSNIHLJB3LNf7PShEm9+hgjZjAnF+NdXHI/YY]
X-ClientProxiedBy: AM6PR05CA0017.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::30) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <11746e80-4806-b7e1-d6f4-af3c63758ba2@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db0ee4a7-b682-42e4-b981-08d9fced5150
X-MS-TrafficTypeDiagnostic: AM5PR0902MB1922:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cvFjOC4yq86/5+9M9kgi0f12PZ5EjJjZii1x8JYNTQAyJ+4qpvlvM7UOtjvNlkPVzhgRk7B510VmRWkNJVNHfdK5IdE4D19WFfc1YAnOeOcvqnIyjdydtgfENLEKUD/f/7LtSKSSRmHfFEY1nucMhAvgH0g+2ta1C29Y07106pgT+lgBpJf49+tORUwF+hmcPoMjiU51QTCmvbOVebuKE+g/MUkr5ODVJX8UbrTII+XkUN6lewUJQqdvsvi/usbvPJLAgwjpiomCw4MH4v8AFPXgbWn8UuX0ReEz8K/wtbV6PyKaTGp4qM8iDZSPkxzVU4+6wuiTMm2uXU4zT+yi3dcZwXg36xRCd+X4iFLWM19AyFe4AgRvbGN1rL/2K1j5ec4rwz7fyJG9kajZGPmVNZhRNlb+lSdlkaIkAxxD8MaqdJIJGivTVGfdt+MDfGW/fShAmGQwGccQhbprBK2ZYLUzST/AwDTSk1DCS5SUJs4yks/TAQvUmAcKD/iGxXjTGJ+tkct9bpmLzGUkZixW8/vUAZh3CghzsoKYuVaFgl399vQs2F6iGZUfxbzcptHqkkh3DYkXT6tHvrxBiB10+p40r46uknhLKAYEFe7xo0NdzfFkN52giy2MZz84o0/uXuokc/WyxMzlUnT9/JmC2l9hLUtkYBV9Ve/avEPfZvA=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y2JBbXBkN0g1ZGMzTlk0SHoyZ0x2OW9VTzVxMlpFeFdqeUZMUjNoM1VIaWl0?=
 =?utf-8?B?a3dIa0dUbGtDREcyYzkvMkxEYytBME1tY3NaMDRLcHlNeHh2cHZZaEtuRjlW?=
 =?utf-8?B?V3hISkIyOHB0YW1DbkxWMUdjR1kvanpUTkU2MlRkVmlHcC9jQStlTjRUcWFY?=
 =?utf-8?B?VlhnVU92WitqWW1hMUFmeGROT2lkRkJmTFJzOWNUbS9QL3dTakYrMWd6YWxN?=
 =?utf-8?B?Z2xEd3FXWmpKM3NGWUU1VnN1ZEhneCtYN0tzc1JJOWJSVGU3Y0dHYjd0Q2Rw?=
 =?utf-8?B?bWNWK1hRUHd6SU9NNUtqYzVlU1o3RWNMeklGTHdsSzFEL3d3MkR1LzhqSTR6?=
 =?utf-8?B?djl6YTRudi9PMVpXeEV6R1F1K3hnWldmMVAxWWtGN1BUZ1IxSUdmRW4vK0or?=
 =?utf-8?B?ZmUvQU9kd3hWVmltekVzMXpSbUtENGZPMDh4TnVvZUVqVTN5eklrczBwbDVk?=
 =?utf-8?B?bUpuMDlYV3BMajRhaDVtWVljMmlUeHFsY1JGQnRLUmhUNXo5eUhNQk9Jb05o?=
 =?utf-8?B?T2xNcjBoV3VVM0YxLyttclpCa24yUUNnWHJRbGwrNklsa0JLQmRtREpzdjdL?=
 =?utf-8?B?YXJENTcyVXUxbVloUHFIdGt5VWlwWTJNaGdoZ0VIazNzNXdkTjRTNU9sK3lv?=
 =?utf-8?B?d1g2dFdCTTl3QXRXRGduOWNXdURGclJZSXV2ZnZqVVJWQy9xSG80ZzBrcmxT?=
 =?utf-8?B?aW05T0JsQ0VVVVlocjlUQlozSTJodXZDMnBYN3FONXVzZWtEVUZlYkNMSDJQ?=
 =?utf-8?B?SnNxNW44Y3l1YmdtVTNKRW9CdmlxMVRnNGVlQm1kK21FOEV1TVgrZWlPQmNK?=
 =?utf-8?B?OXhSakhaWWRLbzVRd1hwT0VEdnQ3Nk50c0gzTHcreGFvZmxGSTJGR3hLOFl0?=
 =?utf-8?B?ajIraDlGMEhHNzc3R0VEZmZnWmRMblRKTjJCZFVqS2hyeW4rbVZ2SUhJeTY5?=
 =?utf-8?B?UlJzTmZoSGVWK09HaGFHbTBLNktGNEY2MFZLWlhqS2lsRXVReGRadUF2bUlu?=
 =?utf-8?B?eWNsdUQvMXVPb3FlZWkrdHUybTBSVEZaTjVGbXpWZGJXckI2T2xBRlI5V1B0?=
 =?utf-8?B?SmNyMUV2R2p3TERuVXJsOTBuNWI0Q1NoajJrdXlFTlM1TE0yY0NHUFlCNWF3?=
 =?utf-8?B?Y2ZxejZwRVZtaFJ5ditTWXhyZHd2SU14Z0RNYS9TZEVaaUYwZmNjaHQ1VDFN?=
 =?utf-8?B?cm5ubFo1VnB5K3I0TThBMzJ6TmxOUWlMRmgvblNNQ21CRDdscSt4RVZTMUdm?=
 =?utf-8?B?aERHMlF3Mko5QWM5TTJ2dndkYW5wR09WRktpZjY2S04xNkhjeDZpTVZycTB0?=
 =?utf-8?B?M1JFV0Q5RVRCWWozWEpYMUZTd0dhS3Z3NHBqVHg0eW5XeGRaYzBjSmFBenlj?=
 =?utf-8?B?OFg2cjhqU0NzQ1E9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 db0ee4a7-b682-42e4-b981-08d9fced5150
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 08:10:45.4297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0902MB1922
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 08:10:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162637

Sadly I encountered this here last night

NOTE: recipe cve-update-db-native-1.0-r0: task do_cve_check: Started
ERROR: cve-update-db-native-1.0-r0 do_cve_check: Error executing a 
python function in exec_func_python() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
      0001:
  *** 0002:do_cve_check(d)
      0003:
File: '/opt/build/sources/poky/meta/classes/cve-check.bbclass', lineno: 
104, function: do_cve_check
      0100:        try:
      0101:            patched_cves = get_patched_cves(d)
      0102:        except FileNotFoundError:
      0103:            bb.fatal("Failure in searching patches")
  *** 0104:        whitelisted, patched, unpatched = check_cves(d, 
patched_cves)
      0105:        if patched or unpatched:
      0106:            cve_data = get_cve_info(d, patched + unpatched)
      0107:            cve_write_data(d, patched, unpatched, 
whitelisted, cve_data)
      0108:    else:
File: '/opt/build/sources/poky/meta/classes/cve-check.bbclass', lineno: 
198, function: check_cves
      0194:        else:
      0195:            vendor = "%"
      0196:
      0197:        # Find all relevant CVE IDs.
  *** 0198:        for cverow in conn.execute("SELECT DISTINCT ID FROM 
PRODUCTS WHERE PRODUCT IS ? AND VENDOR LIKE ?", (product, vendor)):
      0199:            cve = cverow[0]
      0200:
      0201:            if cve in cve_whitelist:
      0202:                bb.note("%s-%s has been whitelisted for %s" % 
(product, pv, cve))
Exception: sqlite3.OperationalError: attempt to write a readonly database

So it seems your patch doesn't solve the issue



On 23.02.22 13:54, Ross Burton wrote:
> All of the function in cve-check should open the database read-only, as
> the only writer is the fetch task in cve-update-db.  However,
> get_cve_info() was failing to do this, which might be causing locking
> issues with sqlite.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/classes/cve-check.bbclass | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index 2d69aeba4b..d715fbf4d8 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -265,7 +265,8 @@ def get_cve_info(d, cves):
>       import sqlite3
>   
>       cve_data = {}
> -    conn = sqlite3.connect(d.getVar("CVE_CHECK_DB_FILE"))
> +    db_file = d.expand("file:${CVE_CHECK_DB_FILE}?mode=ro")
> +    conn = sqlite3.connect(db_file, uri=True)
>   
>       for cve in cves:
>           for row in conn.execute("SELECT * FROM NVD WHERE ID IS ?", (cve,)):
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162258): https://lists.openembedded.org/g/openembedded-core/message/162258
> Mute This Topic: https://lists.openembedded.org/mt/89339702/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

