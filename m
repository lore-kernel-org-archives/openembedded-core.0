Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.115])
 by mx.groups.io with SMTP id smtpd.web10.14736.1599547983403796433
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 23:53:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=CHIEFSdG;
 spf=pass (domain: prevas.dk, ip: 40.107.22.115, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kag0LOjxByYJMyMhNZ8u/VvNRTDPCfLf/t0lylCUD7Ij7RirXdB/NqNyk2dQHVvS+6R56gd5ENlQPVXdku1GwikZyBVB7pI5UUc8LaXKvIvAKL83hrJUSsoXvDXJFc0p17mjT1e8AIwnpvfUVk2PW+LqSYYuXPKKRkcGL4vV8B6rpRH7QWuWigsoobF9t7ioDLgcu3LeQMOdbebv2MtPX5GVNahr1QpMT4NnKKtwvlu8M0XQXldGOyIQM9zWsebpzOH7dL7ri/FprRrQCOT104125RL9U162ahiPHrtM6X+nijZJhEsDDBkS25ThH6V0VVuDmpSSTKaEd9UGX63Zgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edR+2ISKSn9YksFkw/G+fPZqO6y2li3tixo9J3KtJyY=;
 b=X55N/tM32y8y2J5bsLWcUVRfImUa22Ysmei68yk5gM7OZpslEmsLy9hh8rrmy17iOF8H/FGbBiVij+/RONL70rC/gu3lzdtqR1tzUKuboV2Ie6zhdshBpS/MjDHl8KeU4o9/MvKMgjgxHYQFqTGPtDtA84Q9O+Zw55w6oKh/jdGjuurbnS5Qz3fhDUGEa+6AHPSp1xhbFXsd7CNFThtEdAVKrgxSkv5XJfBw3BXL+hlC1a3kb0+jv6tGviq236pT7x9OPkhlKUTf2I6p5BhHI/I2FDTlbBn2kxDotepO71o2MpScPhHA2fWNegW+OAt1vm7ZVYQAPjmc2wY2RmcJ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edR+2ISKSn9YksFkw/G+fPZqO6y2li3tixo9J3KtJyY=;
 b=CHIEFSdGQAwFXXtGxtwGvVB7my9UDbmCG3H4sHJB8VIcP34+6Mwkfh4kDA7yVFVz6ZGaWpMal6W0dcEtDl+n+7H4rOPMWAWQZ7lP72SoLd8FoW0EFf4fRwc1/ZcTHCiRirEIxkMXNmACxipKde0Q8ofHEDhNP2dfT3CpyZHUTDk=
Authentication-Results: prevas.dk; dkim=none (message not signed)
 header.d=none;prevas.dk; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB3427.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:159::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.19; Tue, 8 Sep
 2020 06:53:00 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::649e:777a:346c:fd09]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::649e:777a:346c:fd09%4]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 06:53:00 +0000
Subject: Re: [PATCH] rootfs-postcommands.bbclass: make /etc/timestamp path configurable
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: chbs@prevas.dk
References: <20200904070807.401-1-rasmus.villemoes@prevas.dk>
 <e3847f852942207fcac5d73bd8f97a37e49c2f95.camel@linuxfoundation.org>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <bb67707e-ac7f-9528-26ee-47e76d0b5a74@prevas.dk>
Date: Tue, 8 Sep 2020 08:52:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <e3847f852942207fcac5d73bd8f97a37e49c2f95.camel@linuxfoundation.org>
X-ClientProxiedBy: AM0PR10CA0080.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::33) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.11.132] (81.216.59.226) by AM0PR10CA0080.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend Transport; Tue, 8 Sep 2020 06:52:59 +0000
X-Originating-IP: [81.216.59.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e70a1b4-dcd5-4414-e9ad-08d853c3d343
X-MS-TrafficTypeDiagnostic: AM0PR10MB3427:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB34270F0135A1E3894A71950393290@AM0PR10MB3427.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fpTHoNZ8ot1BSvoG8xtYbcQErSK6KQ3mRoi5BNMC1bjPd0XXvmyhCbqg3RecYM3aOaa9mdZLPpvDOh2EsJpx4Kq1iRM49F5Xv+lLHnerhNrbqSJeuCTbRZx5pFfVZC5mAQGaW8YTbtwiHYABLedavd3M0Il4jbjmG8xJo7wu7A1hjPbZOLtNHaGEArP8lHKH6ET7IvG1O902Hy77pfMxDDXe5gOTi1aqzRYQq5DOu3TQt20qCf7Ox1/4P3jkcHp5xzeoes54yRUhgLK3QIGk/+pxLcnD2frLG1J6P8oVGh80qIkBF669irB+2AN5NQtXlppBCivw/dNybIWjvEZpVUfoMWw17Igp5WGx6qkvI3f3x0wXzmwK3eY468/X6Wm+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(136003)(39850400004)(396003)(8676002)(6486002)(31696002)(8936002)(8976002)(83380400001)(86362001)(66556008)(5660300002)(66476007)(66946007)(107886003)(36756003)(4326008)(2906002)(52116002)(31686004)(956004)(2616005)(316002)(16526019)(186003)(26005)(44832011)(478600001)(16576012)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	E61gZwGUu3AuRNxUI1rp/FTEsW/m2/qH1wr09vKh09vfakq7mD4bqVwOtRLfxtOZhmgLpJWenMUX3rXZzHqyDmlX0Tu3vh1odps4uaQBBZga0S6Y7TN7WdLE4hqjjd/pP/SrnhqXntJi2vzy33Wfkxzvv4/OrpUksqTz/F+fCBYQCjcPCMpbiTiOjAGbLfAv6a5/0DagrRK7wp0JTrl1ke7NdIGJ8gG+LvZj0CQRQp0WBSlGOCkChuHSw+nKA4aRQTOxlkxfUCSWhQyD9wSOdHthozYo7uG4Gj/owRpxch8xaELgy0m9Tb9PZ9pXc888ss0TtUFVJMre6pirONMMF6ohCrn/wjcLlRwPMv/eCom9+REMqa/+2zphssxKVrIS2nWcRzNGG6myAO2QwRJ9VYO7vW3SaJisWrWHQ2ZcxMuIINIQ1g7BLE/7VLMXg7HwpJ5KSPBSIyiHdkPywKLFUTcdXnoa5Q4aagTm7u3D31QlJiUYKCtoD5DXkUbFLd5+XixgUtm2z/d0vOyOXD8V/cRizTkUYN2TZraKfMdFmYOzUJUwh/DXBOayDsS5lz2vV6VToFqVMhfrRVqvp0NWwdCqtkcunHCo2+5rP4F7KftPwSK1VDD5WlerCwlvC18DmdBHRvzaOrOFEoy6/o7wsw==
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e70a1b4-dcd5-4414-e9ad-08d853c3d343
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2020 06:53:00.2995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B8Eu5dVrI5cV2iD3Gbp3xBmcz2dFoFzwm0RLzLAutLfQ38WRNrp1c6qEQl6mvjzYhkj0vox26J4Oc+AVecNZ7/zosuc+iAEbMRhG8ztp8lU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3427
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/09/2020 13.51, Richard Purdie wrote:
> On Fri, 2020-09-04 at 09:08 +0200, Rasmus Villemoes wrote:
>> Not every image necessarily wants a timestamp file,
> 
> Wouldn't you just not have rootfs_update_timestamp in
> ROOTFS_POSTPROCESS_COMMAND in that case?

Perhaps, but removing stuff from ROOTFS_POSTPROCESS_COMMAND is a little
tedious and error-prone, 8c835f63 isn't all that old. And with the other
use case in mind, it really isn't a lot of extra logic to assign a
meaning to ROOTFS_TIMESTAMP_FILE being empty.

> 
> I have a feeling there are other consumers of this file which would
> also need to be changed to reference ROOTFS_TIMESTAMP_FILE?

Well, there are two files associated to the initscripts recipe
mentioning it, and a mention in devtool. But I don't imagine
ROOTFS_TIMESTAMP_FILE being set globally, it's really something one can
set in individual image recipes for images that don't create an ordinary
linux rootfs (e.g. bootfiles for RPi). Dunno, if somebody sets
ROOTFS_TIMESTAMP_FILE for their proper rootfs and also include the
initscripts package in that rootfs, I suppose they should match, but I
don't know where one should set the variable.

Btw., is there some good reason that by default, with reprocible_builds
turned on, the rootfs gets two files with the exact same content
(/etc/timestamp and /etc/version)? Because we'll need to fix (or avoid)
the creation of /etc/version in the same way for some of our images.

Rasmus
