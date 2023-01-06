Return-Path: <florian.bezdeka@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C8EC54E76
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 08:56:09 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.85])
 by mx.groups.io with SMTP id smtpd.web10.9749.1672995367407297423
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 00:56:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Wg4nb0QU;
 spf=pass (domain: siemens.com, ip: 40.107.13.85, mailfrom: florian.bezdeka@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qr0dahOgJBnIiKr7JIB0mjgjt7eK464NCN6y6nxb18QecWDH8NxWBBfA4LCUeO0vO2Ehv/2nIRAQ34w4Asnxy6vgX4FRdxNoAO0WR/HMAURbvnRr6sHGtN6qHSW8bTIMryoVZ2GDvZmawsHQjHY4HLquue6Z50yhGUThr0CQ8dj4PAfyOyG346grrs+eBbUipGIBfShqAx2X+gunYARxX2lHnfIjSl+c74odrLJTJkUscsjs1avTi/jffyIY8CApSAvq4lDCw4u8vQxWXSEZPpqh7u9osuVlL+C18rB68fzgpqGwGjsIKckxvfkgTo0eGFPZvND7AEZC9lZGFEaaPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USn8FHXa6nuRWgz7LAXyDVZo/5y7qszgomreniAji40=;
 b=n4t47I4bBtNELkbmtQg/fXg5Ts9Wbi+dX3QWxU5nVBgiLeKxq4QDUeS+1UPw1XUWmR0p/fDPtWeo1JKRJlfV0gEvtv6hXXb+A3tjMXL3TgVcXLCQ6h+DzNw5y0UMoBq7Z04OGJzenQT24XlzHhO8HVnJ+Pyli7RsfShwSH1W1zGe+z9vMAsQaTb6ULaEKKdfyaCW3Cexmq1U8tcVS/dURhLab6qQXwofywHHBQNoD76vK8lqHyUNflnQubp+RG9PUZnsw/FWzHpxdTsfzV61upH5YWWS+CszSZVlcSKqo2S/yehndUTeoiIB5S0UnIBhVmaeTa2x33qN7z1YWufpSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USn8FHXa6nuRWgz7LAXyDVZo/5y7qszgomreniAji40=;
 b=Wg4nb0QUtnzrH6lxhVekPq4bwupnJXny58IJ95NoP8JngfrqkpOuF7r6/n6g+GJruz7qlUtyMJmwhHGpc7V40z1L+d/c2XRjbmu81LQgsA9KssvVgrX5sKwnLz/pycJKK7opShGpzQ/tlMu+svyiNiI/SI0oojFyBrZn8VDhflS072BTy7nAM0yNk7d4dEA6FUoQcJk3qARAh8IT5xZH/BjlJ0Ptw2DqVKxrDiFlhUVvgoPfwL792h1HOWQHpAJdA6Bzi7Yzxp2M4VMI8DHJjXiFPXK1UjoZrr+lcWJOhkxdi2IO4VMDg3vgLvhQ/KHd4wLvwB8oFkYJNsVuXtNsnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from PAXPR10MB5712.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:248::14)
 by PAVPR10MB7282.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 08:56:04 +0000
Received: from PAXPR10MB5712.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::13db:8a1:709a:4671]) by PAXPR10MB5712.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::13db:8a1:709a:4671%5]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 08:56:04 +0000
Message-ID: <9e1cddbf-1214-0571-3826-bea0c182a7a7@siemens.com>
Date: Fri, 6 Jan 2023 09:56:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [OE-core][PATCH 1/2] wic/plugins/images/direct: replace fstab
 entries
Content-Language: en-US
To: Henning Schild <henning.schild@siemens.com>,
 Felix Moessbauer <felix.moessbauer@siemens.com>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com,
 alexandre.belloni@bootlin.com, richard.purdie@linuxfoundation.org,
 luca.ceresoli@bootlin.com
References: <20230105125223.398216-1-felix.moessbauer@siemens.com>
 <20230105125223.398216-2-felix.moessbauer@siemens.com>
 <20230105142439.42b893f6@md1za8fc.ad001.siemens.net>
From: Florian Bezdeka <florian.bezdeka@siemens.com>
In-Reply-To: <20230105142439.42b893f6@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::19) To PAXPR10MB5712.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:248::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR10MB5712:EE_|PAVPR10MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f771c3c-2665-4438-985c-08daefc3d79d
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	in32PRoiDC2NVFNlPmC4sJLsPHz9EZC8RVy5UD6DhYPbsZVpzDr0Mx9rnW3+ngEqCFLjJW75rbknQh6sx4Xxo70QkdojqDokoET4uZkJZ73/LV7O0RghK/UFrQHPuArCXnprdp9OKLVY9xXetDN2NA+FprGX7XocAGe5/kfZQtUtS+fNgNbUTEHusvCXuRpDh3aY5xUDFdUaiGX5ofUrHHarJlMvYeMypDAvY1sR+UMMKsXrBh7noN+YNuodmrGc8WkY8xEue8fl773nSWQozVqrd9VdzQL6FeTbI1EGwmUzesNvn+8BY4nbRSQPPg0wT++NhFkXNfwFGaBBIuBwiZa4MPPZtt68nTYMzG9reb8LnIOYrsFqcej72cGsHyesqMbL5TNdmjwptha8cJ0SHHkf4BlyOI0Jc1Dm5WtRwQZ0K36r+CZCQYjfZ4m9GfbyWy5ozTMhaVTUTXXRKe48gWytnPk3pT7XRVHoU0RCINe3yQMx8sqaaMCgE8Ikod7QQImB2f/BGtfOWpcPVyc3TjuDEyKGPii41o4HM+boyXa/WghmZM4aQHg6hQbPFyHLEYrjkTlOGCW3tUbLskya7qhYWGzpD5sIx1fKqFCJ9z9a2elhEkZJP+LV/6+AwVVp1QASldfLS5Rweq9mRnwy5ejrSXD2QdnUcRYCHVbScZrhsBDUwIJX5ZHc3MM3vClnAqPnAnFNEzOcGMAGrT2qiOTpKXIQWm/HOCEQVTsFrWM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5712.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199015)(110136005)(6666004)(6486002)(31686004)(26005)(6636002)(186003)(66946007)(66476007)(2616005)(8676002)(478600001)(6512007)(66556008)(41300700001)(5660300002)(44832011)(83380400001)(8936002)(2906002)(4326008)(316002)(82960400001)(38100700002)(86362001)(53546011)(6506007)(36756003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?THJFWDRibW83UzBRWlIzODZvVUdhZFcxVFYyK0F4WWhhTG8wc0ZtMjFwdkRH?=
 =?utf-8?B?OG9ZVWRDendMUUt3Z1ZKdHRPWTgrUlRQUkNSVWJhMjZZUVR5dXptb1JBUE9G?=
 =?utf-8?B?eDdWUE9Oa0RMTE5mdGc1b0djb2xrQldvQUhTTjY2SzdTWUpYTHdvL1YyL2lj?=
 =?utf-8?B?KzA2UklUbncrWkhySkZTZERWbVBzeitSNklmSUNxR0xCa28vZlhVSXF2U013?=
 =?utf-8?B?MkNlRzV2YVA5RXFjZU45bUwvYkZwTDBZRUwrZnlRWUtDUmY3TEgyMng2M01j?=
 =?utf-8?B?VjZMWlV1N0lLVi9rSHlJRWtjYzd1cldHMUFEb2pTeFJ0dWJXU3RGWXYwMEdN?=
 =?utf-8?B?ai84ejFZMDk1SWdjZnhyRG5VcmZReERTSzZFd1RiKzkwNGFHbnRYbnFRS3kr?=
 =?utf-8?B?Z1ZZTExvU09zc1ZGSVlySDh3V3hWT3dFTEUzVzM2UlV5cHROMHBaNm9MU1hD?=
 =?utf-8?B?Z0FESWZlL3VGa1M3a2prdWg4NWZBNVZBRWVyanlVblBIMjZrdDl2YnloZmJs?=
 =?utf-8?B?cWxEcjV0ay9INnk5QTNxRFJCcUovMStzRXBaVFExVHBvNm1rSTF0NkVhNXZz?=
 =?utf-8?B?eDQvNW5VSjBtZ1NJKy95aGZXREZDUEV6QTcyNWZpa3JQb3M4QTlkaHhzWSs2?=
 =?utf-8?B?RnlYYUV0Q2Z3MndmbWMxblI5S3dTR1hSZDdCTlZDSVYxenlRMExuc003SDNx?=
 =?utf-8?B?d2VLdURLVk4zclB5Slh1aER1MkIxakE2QjFCcVVVelBhdnRNT3JPakJseDRB?=
 =?utf-8?B?MEVBVWVraU1LYTk3N0tEN295OGxUVkxEUkllSG4zTFR1T2JyKzQ0Nk5JSDZV?=
 =?utf-8?B?QlZUOXRBemRCZW8rTVJsZ1F2YTVZS091bHJ3WFdsNHhYNUViVEd2SHF0aFNt?=
 =?utf-8?B?cVlOSkpZS0YxN3JJZTFYaDB6anh3THZVeG53K3lnY21UMVJINEhwU1V3UWdG?=
 =?utf-8?B?SCtPc2h5Y0ZvZE40NGNBdFRyM015WUZrUXY2VFcwQU9BdnJsa3REUmEyay9M?=
 =?utf-8?B?YnU2OG9PZnJCYkVhb0EyNHRxcERubTB2bGhXQXJIWVRlbkpkekwrdVFhRlFl?=
 =?utf-8?B?SkF1ZlFQRFpNWHRVM0lIYTNWeHFwMDZUY2dhQ0tBaHlPY3FrUjNrYzNkYXhB?=
 =?utf-8?B?STBZcitKTjltNEo0QVFyeVRreUdRa3J5aFd6UkRhU3lFWUg1N3BUZjBHaHZN?=
 =?utf-8?B?YlRVeDFpdjJSYlpJVGFjNXJFUzZ2UWRBeEd5c0tFSTF1bHBmTDVDRTZxV3J4?=
 =?utf-8?B?S1I3MDVBT2llZWFubVY4ZCtXRFRJUExOV2xaVHpIS25BSCtNLzNSb1ZKbXpm?=
 =?utf-8?B?RkRkQkNnZDk4enlFQUVIZzlkZmdMZE80ZUFMdDRUK3JwbzNEVk1CSmJmS1dn?=
 =?utf-8?B?QTFrVmtvcEc1dGIzeEZxY1krV21WaGo2aFRrYUV0bGEwZ1lFWXRjTnpDNEN6?=
 =?utf-8?B?L3UyRFhuT20zMjlTY1RVUy9WSW9ETVBHZno4VVBJOExnaUE1enNGMEVPaEdj?=
 =?utf-8?B?ZDVKZXZjWVRsTG5UMUpOMTZzbFQvR2xFNmtLWlhCSHlHV0JNN2o0bWpmamI3?=
 =?utf-8?B?bjRiWko5MVZJZGdNbGIvVzhvanZOeGdGWlZ3RThsbFFkOWlXN0pXZkMyVWdE?=
 =?utf-8?B?R1JHUG1ZYWVOaUUvMEkvQ296eEVOZWZQQXZHblFiSXB6OHNvZmR0UURzVVUw?=
 =?utf-8?B?RXFjTFIvVnpsSk4xYSs5cWE3cnFSNWhoLzJnZ1Y3WUxzclYvcGF4KzBPMXh5?=
 =?utf-8?B?TkxsenZ3YjR1dldkQThabGlKT0k4VHAwT1ozNGRhYStMSUxxUVdRWU8zYmhG?=
 =?utf-8?B?QU50Q0RWYTU5UHAxK3A4Q2cvNFg4UEI5TEhDc0dUeGtsTlROTzQvR3JjcmZC?=
 =?utf-8?B?SWYzaGZXZVNuK2RiM2lTS2w4ZGFROVZGUjgwUmtIRllxSG9RdDNSRC9NdElZ?=
 =?utf-8?B?WUFzcDVrVGpMc01iMDEyckliM1JUUUF5MCtRMHZOM2w0Q24vRy9zcFU4b3ZS?=
 =?utf-8?B?QlF4Z0tlbCtBVFRuUU5HNmJscHVIRzltdTRsSmNvYmNqd1NseXpsZnk1K1F1?=
 =?utf-8?B?ZE5FQ2NEK0VMMURFdXlZeW4vZ1BoWUoxZVhOaFcyR2pycmd5cHBVRTMwT3lj?=
 =?utf-8?B?WUVnM1RNQmRDYlMzQWp1K0FkQ1ZWNDlYcVAvTjlTZzA5a2NmQ3VSSU5lRDdV?=
 =?utf-8?B?UlE9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f771c3c-2665-4438-985c-08daefc3d79d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5712.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 08:56:04.2687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPJ36zmpEYE9U4swnReMGqtuZcWU6jo95Co8CvfzmIbCvnONvas5KCe7PLvhDrcmTzQLL4vPwVPcGc4gPfWTNrU54BRSpXrtrUAHwe7r6J0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7282
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 08:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175562

On 05.01.23 14:24, Henning Schild wrote:
> Am Thu,  5 Jan 2023 12:52:22 +0000
> schrieb Felix Moessbauer <felix.moessbauer@siemens.com>:
> 
>> This patch extends the imager direct class to check if the mountpoint
>> of a to-be-added entry in the fstab is already there. If it is, the
>> old entry is removed and the new entry is appended.
>>
>> This solves issues with duplicated entries that come from the rootfs
>> itself. One example where this happens is when generating images for
>> both direct kernel boot and EFI. In this case, the rootfs mountpoint
>> needs to be in the fstab of the rootfs and needs to be replaced in
>> WIC.
>>
>> With this logic, the reverted commit 20d43a2 can be included again.
>>
>> Reviewed-by: Florian Bezdeka <florian.bezdeka@siemens.com>
>> Signed-off-by: Felix Moessbauer <felix.moessbauer@siemens.com>
>> ---
>>  scripts/lib/wic/plugins/imager/direct.py | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/scripts/lib/wic/plugins/imager/direct.py
>> b/scripts/lib/wic/plugins/imager/direct.py index
>> dfaa901567..085bf8b463 100644 ---
>> a/scripts/lib/wic/plugins/imager/direct.py +++
>> b/scripts/lib/wic/plugins/imager/direct.py @@ -104,6 +104,14 @@ class
>> DirectPlugin(ImagerPlugin): 
>>      def update_fstab(self, image_rootfs):
>>          """Assume partition order same as in wks"""
>> +
>> +        def _get_mountpoint(line):
>> +            """return the mount point of an fstab entry or None"""
>> +            parts = line.split()
>> +            if line.startswith('#') or len(parts) != 6:
>> +                return None
>> +            return parts[1]
>> +
>>          if not image_rootfs:
>>              return
>>  
>> @@ -142,6 +150,8 @@ class DirectPlugin(ImagerPlugin):
>>              line = "\t".join([device_name, part.mountpoint,
>> part.fstype, opts, "0", passno]) + "\n"
>>  
>> +            # if this mountpoint is already in the fstab, replace it
>> +            fstab_lines = [item for item in fstab_lines if
>> _get_mountpoint(item) != part.mountpoint] fstab_lines.append(line)
> 
> please bbwarn here, while this seems ok it indicates that two places
> write different things and users might want to drop the offending line
> from their template

That is the expected behavior. wic has to update the entry for / and
that is what it does. I can't find a reason why we should warn here.

> 
> Henning
> 
>>              updated = True
>>  
> 


