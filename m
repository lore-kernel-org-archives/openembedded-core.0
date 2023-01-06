Return-Path: <florian.bezdeka@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32529C5479D
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 08:48:29 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.51])
 by mx.groups.io with SMTP id smtpd.web11.9442.1672994899983807226
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 00:48:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=A6cfcSD/;
 spf=pass (domain: siemens.com, ip: 40.107.7.51, mailfrom: florian.bezdeka@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8CEwMVeqqDVl8RydrvWqcX4GR7VD+Ra8EGEyouKQqxlLsk247s0xIJmwt3CJHjfOYjtmaryfrKVDLSOKZtrVzGCXess30jt5PgxJ748uldytd5cyXji9o08ySPMEH7QCHv8fVOxWrO7oViECvhIbq1VxdfVjVa5erZzjKLXKgK1c16fepvfH/AhpC50XZrGom1dAtrxBe5SKirTaajb6PiWyBqUyykJojqk9c3RBYD41sSSOMRg4BUwx68iT+s7KSe/HlyJQ16UGWSm3JPdABUkYQo9bsmNDbzwWJ7inasmSaZP03Xzk9KBbApK/gDcLzusKf3ASf0RqeCSGbp+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lftrHt6BsgSACeDfDgNrQwIAqSGL/tMDwR+wsG6NOVs=;
 b=Vzz3myTCLyDaUHzAcO9+fp0gl+6U5/9tENeteBdJNoT5VCSybqSQfy2Uak8hHI3c3bNKZoVYFrADCr7ffgm65BvpmSpkjYNitR8FLf0QH7ifAG5hFZtOe7fTYR4jFSPE5D9s4nblPTS24AFcoug5vld6Co5UEBG4ewTxUQqv09vhKtx0XZopN36PIHhbZTwIASgkKmG5ImOggIqtm3vHue9TWwld26JRY0GxdkvGXrGNs1sd8hUjkXD1SKulXmiOaI1MY9EODgAVcUBbqOPKMTvHGSFTXC8Po8bBuI/6s9GeBNIZGcIMFy6d4Q/2wIxmrAVXyO4Th+AtoGecByAOnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lftrHt6BsgSACeDfDgNrQwIAqSGL/tMDwR+wsG6NOVs=;
 b=A6cfcSD/P28XWQ+FueEqQ4+djv7MMDJwH/y1KmF1crajNm9SwHEknMaisgub+G4fL60HapcwXhLccQarDceHnaxQyLNA0EJGlzO5+cWeQCL8P3xY3W+7x8xjR5egSVNmyaSyT/IpVQYokKA2lq/4aUwxKEe5ZQ/HCDONb8BFp/jbp4LuNT2yKWKJcIitzYBfVyX0UiDW9fGKbFocih2KvmbLwwqoEfX1WezLIoXLjzWQAwlupYEuIKxPSX4AtsmPmErZAp+fzbuXxpypKOquKxkOL9F0w8IFKeXHAioyyU4YwX96ewa2/4E/JbNAWNyg+Acy/s5UXscSrvcorhevYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from PAXPR10MB5712.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:248::14)
 by DU0PR10MB5430.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:329::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 08:48:16 +0000
Received: from PAXPR10MB5712.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::13db:8a1:709a:4671]) by PAXPR10MB5712.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::13db:8a1:709a:4671%5]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 08:48:16 +0000
Message-ID: <be26914f-98dd-81d7-09a4-edadb888fcf2@siemens.com>
Date: Fri, 6 Jan 2023 09:48:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [OE-core][PATCH 0/2] wic/plugins/images/direct: replace fstab
 entries
Content-Language: en-US
To: henning.schild@siemens.com,
 Felix Moessbauer <felix.moessbauer@siemens.com>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com,
 alexandre.belloni@bootlin.com, richard.purdie@linuxfoundation.org,
 tobiasschmidl@siemens.com, luca.ceresoli@bootlin.com
References: <20230105125223.398216-1-felix.moessbauer@siemens.com>
 <20230105142224.7743db91@md1za8fc.ad001.siemens.net>
From: Florian Bezdeka <florian.bezdeka@siemens.com>
In-Reply-To: <20230105142224.7743db91@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::14) To PAXPR10MB5712.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:248::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR10MB5712:EE_|DU0PR10MB5430:EE_
X-MS-Office365-Filtering-Correlation-Id: cd927158-1327-4a13-1e1e-08daefc2c0be
X-LD-Processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cYbijX0bceHMTkW7PuL32qfdU6HwH2Ost/eFcwTE5Vb/x6eDrpQqaVkPIsg4oTEyU59xFUuHV2D2NzMUFFxviB1fszcLZNj7V5+OFCJHSVATfY4MVVggHZmqfnhRTTItoqbuW1qqsn75QSlDsaJ/nEkBuusWECtubywTzxovAMwct4+4pH8U+4k06SF+b5Djhe75vFXa+XoBiDX19Nsw0b3DklrCapAD48AYdYeWZNZ0E6FAdHA+2+wihTA1nDskad+GXdqHrsCFXob5JSC6IEmcrg00gMezIgtbV2OX1zFpiOWUUBXwcFdWluwgiQ0TdmWJ+15YOjuxny1D7ywxdWXRGVrgl0stNyn38neL1HOVwGRlvK0m1npCR/Pguy6XJ8l8KfJXf0g/fTYblMO6Zpp2Ge814cTdWcCBp0AG2qMyH0ndl5JG8ICHELMM253j4hzX9toNuUwxvgEsVFrI3zikvkppiLUQHHshL+uMsLRG0yNx2SMGjhYVnqsBgGP14yZu9CN3Z3y5q/13TgQYdpRJICxYp2viAt/FTWV21dBK2nBHcKblhRC+cU6vmzb728pA58WY859U+5jSPDDziKdRP2tG9M6uRe8vPJ92ueEG30JlbL3uF+XAnxgq7xRvVDqkdVTZZB+VV0zxEi1s0V0eJLirh19W2+UCu1Xe8tuEq4q+8U+KbzhOqkTgS9yRmk2c5wZtL+FNEZxS1eyE7VA7oBh4PDvTUtg6ri7cYLTFrhmRRIUldi54bhYGPjH9nh/Nx4ZbM4RyWJFcWwrU1hJyxL5yz/B9WoRkfcWocKIVstaSEH9Ks3gm3y/437pF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR10MB5712.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199015)(83380400001)(86362001)(31696002)(8936002)(44832011)(2906002)(38100700002)(5660300002)(41300700001)(6666004)(478600001)(2616005)(8676002)(186003)(6512007)(53546011)(316002)(6506007)(66476007)(4326008)(26005)(966005)(66946007)(6486002)(66556008)(6862004)(6636002)(37006003)(66899015)(31686004)(82960400001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cWdHV2xsWWo3KzlBdVFnNFFwZ1ljNU5wSVJNdVRpTzRRdVRvWGVWOWhPcmtZ?=
 =?utf-8?B?c1JXRFF1ZGJqRTdwaFgzOUp6K3d6RFcwMTZXLzJXQVQ5Y1BTcVR5Q2JWWm5m?=
 =?utf-8?B?TWJ5VTNnU28ranZtaTd5bERIdjJnQ2JyK3FCL2xjRFJTUFdZTDMweUdtKzZ5?=
 =?utf-8?B?Sm1VeFNqcmJheUFIV2xsVDZQZlc3U1Y1dHZsT2dDUFlacG03czJWVFI5blBX?=
 =?utf-8?B?N0s3cnBVc2ErWGdLTHVVRDBVOStnbDJJcEpmL3lDaVU0TVlUN01zQ003Z0ZW?=
 =?utf-8?B?U2hWRlAyM2lJbGRQMHh0SDZ6N1RFMmxFRTFuZXo3NW1PTnVLRDFOallNL0NB?=
 =?utf-8?B?RzE1dElZenR6RnowVkp3QlgrUlVQcEcyQWVoM0dJOXRCOEwxWXBWb0o5aGZy?=
 =?utf-8?B?VjJrMDBBQktsdktZeFlnYXNCbXVUMzU4VmdWM0hNRlQxTXZQK1FNRG1zSFRL?=
 =?utf-8?B?WTJKZlRoZlpqNDBHWGcwQjlGa0tGd1k4eXFUeUpDU3hVSGhLR2pZeWdaekJF?=
 =?utf-8?B?Q1RWR1MrRVZqdzdobS9vTmxPVzd1MjFwaUh4WHdSeUo4bkdOajFTbE1ISjIr?=
 =?utf-8?B?NVFaUjRlTWNrNTlTeHRXa0NHK3hoNTBDL3FGdDY2dHpKcitURWZUZ1h4cEN6?=
 =?utf-8?B?UmRHNXNJbnkrYlhyblozNjg3aXBHa3haVndrVThSS1laUlhyMGN3bXVOdk53?=
 =?utf-8?B?M0VlaUxuWVlpVER5enRpR090T3M5cmcrdytYSEpNMFZXOWhieVgrMUtkeVNj?=
 =?utf-8?B?RHZvVlRqRmNRazVKRmlMU3ZTSFpMS3hBWG13R2NsMFE5R0t5ZWppOVNtTWRW?=
 =?utf-8?B?YzFacCtvZm9DLysvNlNMaVl6NnNJeEpibjJ1dWhOT1orMS9yUVhOcW5wRnI3?=
 =?utf-8?B?TEI3SUhBalZKTmNEZEJub2hPVnZXZ0FnbFNnb25yTVYyQXdjK2VFSTRWc1o1?=
 =?utf-8?B?MVZib2NVQy82cys3dGlCUVhwRkFPamd5OVZ2UzlrZHZaNkxxTHgzSmRWU2lJ?=
 =?utf-8?B?bHBKSkJaNVlvMWVXcWNKL2ZCWnNyMG5ReDdsUm8rOWFnNVY2TUczRkMwQjBN?=
 =?utf-8?B?OFVXRmJLYzJZWEQ2SW1MR0pheU5kWGFoWlg3ME1IM3lNa2plNlpURXpzeFNL?=
 =?utf-8?B?QjIvNTZ2ZUlSMCtCMjdQcmJwNzhHbWlCZ0JlbkExalZaZndDbFgySmZ1Y2o4?=
 =?utf-8?B?RlhrOUFidnBPOWxVbG1uRldyVm1aK1NlTHhXR1dZYXZ5a3lzek82bktZc041?=
 =?utf-8?B?STI0a0k1Nnlwc2lZOGhWeUEvTGR6UHlyUGFQUEk5NkhVYTZSSEhFMkJ3cVRG?=
 =?utf-8?B?T2pSamFIUm1LZ3VHa3hnRVpWWjVwOVdQRDJzWTAxRzdUdHlUVkluaU9QQjZ4?=
 =?utf-8?B?TEdBZVlGZHZibnJwRWthaHM4MGxpQ21SYSsvNUFzOFBjTWkvcktuZllHWHk4?=
 =?utf-8?B?V29BckF0R3l5L0xHMEJtZFhUaEZTY0c2TFBVKzBWUDJlbUVwRG1SeEM5dGdQ?=
 =?utf-8?B?ekpvMEM2bEFCMTIrYlJHSjNRMTJFY25kVDZPQjVMK3FIT3ZMYXdYTHFTQWJn?=
 =?utf-8?B?elhUTjNrWnlyOU1nTkVrekVPczlqc25yTEx3RVNCbnBqeEVBaW14QWtBbHNS?=
 =?utf-8?B?WUhUNW5VVVg2RFFmUzdBVVVHbnlmZzZWUjdPQmJ5RlFiT0hDSnlVejZNZmw2?=
 =?utf-8?B?Wm5CZ1YxdDZ3VU4yUHJJdDM3WXNZZmlUU2ZpdWk1b1RXb1JEVEZISzlCc0Z3?=
 =?utf-8?B?Uk8rSy9odmRQTnd4a1BrMEUzUnBKMXBPT1dBbTcxWFlWeTk3bEhMZGU4TThZ?=
 =?utf-8?B?dFd5emFVMkhFbUpmRWFhL2JmMGZhM01NOWcvNkdsamxibm1XNjRqZWprd1pm?=
 =?utf-8?B?RUh4ODVLaWFRQkdjTHVVR05BaXd2MTIzR1FCdmFaNGs3VzJQYitvNTFXNVpq?=
 =?utf-8?B?WnRFWk9KWkJLN0Vua04wQVFPVTdnTnpsRHdBR2kvaTZqVDdBQktWV1F4ZHpu?=
 =?utf-8?B?dmNIUVhvWURSUDIzU2xrbXJxN1FaenNRNTR6dExTUzBidUo2TzRDTGRUaHVI?=
 =?utf-8?B?LzNRZkZEWFZydld5R1V2a2MvYjM2N0VGTGwyY282L1NQZFFvelQ1WmNOSFcw?=
 =?utf-8?B?cVFoRUtsb3liQ05yV3EvSFlqVzVhdVhjSjd2YWdta3AyWkEzL20rSFJLWWdK?=
 =?utf-8?B?Q3c9PQ==?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd927158-1327-4a13-1e1e-08daefc2c0be
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB5712.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 08:48:16.4756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NQfEReX/wSqKVhcGvcOAqwJBXi4RhwZ/BSVutRZojw7V6xaOcfK1xaiFwu+V+MsXeY0KlYrLl/BAus0dJqX39mB4Fq8I+k90CLY4wbYp5l8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5430
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 08:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175561

On 05.01.23 14:22, Henning Schild via lists.openembedded.org wrote:
> Am Thu,  5 Jan 2023 12:52:21 +0000
> schrieb Felix Moessbauer <felix.moessbauer@siemens.com>:
> 
>> For comparison, here the fstab files for the ext4 and the wic version
>> of the core-image-minimal (see below).
> 
> In fact one probably really wants no fstab / line at all, unless it is
> ever somehow explicitly asked for.
> The bootloader and kernel need to know that, in the rootfs it only
> makes some sense if you have "special needs". Having it in the rootfs
> just means that your rootfs is kind of device specific ... say you want
> to use the same rootfs for nfs and nvme, or same content but in ext4 vs
> btrfs

Henning, for now we're not trying to introduce any architectural or
fundamental change. We simply fix a bug (duplicate / entry in fstab).

The duplicate entry was not a problem in the past but that changed with
newer systemd versions. That was the reason why the initial
implementation was reverted.

If necessary wic can now replace the entry for the rootfs if it has to,
e.g. for adding a correct UUID. In addition the image stays consistent
when wic is not used as imager (like for ext4 images).

> 
> I think the best way would be to drop / from the template first. Later
> allow wic to edit and add it like proposed here. But only when that is
> explicit ... --root-fstab-update
> 
> Or in the end people can decide what to do about their own template,
> but i suggest making this explicit for this special mountpoint
> with something like --root-fstab-update
> 
> Henning
> 
>> Putting all persons in CC who have been involved in the first try and
>> in the revert.
>>
>> Best regards,
>> Felix Moessbauer
>> Siemens AG
>>
>> .ext4
>> ```
>> # stock fstab - you probably want to override this with a machine
>> specific one
>>
>> /dev/root            /                    auto       defaults
>>      1  1 proc                 /proc                proc
>> defaults              0  0 devpts               /dev/pts
>> devpts     mode=0620,ptmxmode=0666,gid=5      0  0 tmpfs
>>   /run                 tmpfs      mode=0755,nodev,nosuid,strictatime
>> 0  0 tmpfs                /var/volatile        tmpfs      defaults
>>           0  0
>>
>> # uncomment this if your device has a SD/MMC/Transflash slot
>> #/dev/mmcblk0p1       /media/card          auto
>> defaults,sync,noauto  0  0 ```
>>
>> .wic
>> ```
>> # stock fstab - you probably want to override this with a machine
>> specific one
>>
>> proc                 /proc                proc       defaults
>>      0  0 devpts               /dev/pts             devpts
>> mode=0620,ptmxmode=0666,gid=5      0  0 tmpfs                /run
>>             tmpfs      mode=0755,nodev,nosuid,strictatime 0  0 tmpfs
>>               /var/volatile        tmpfs      defaults              0
>>  0
>>
>> # uncomment this if your device has a SD/MMC/Transflash slot
>> #/dev/mmcblk0p1       /media/card          auto
>> defaults,sync,noauto  0  0
>>
>> /dev/sda1       /boot   vfat    defaults        0       0
>> UUID=c53e2046-48db-4533-8083-b997d9976fbf       /       ext4
>> defaults        0       0 ```
>>
>>
>> Felix Moessbauer (2):
>>   wic/plugins/images/direct: replace fstab entries
>>   Revert "Revert "wic/plugins/images/direct: Allow changes in fstab on
>>     rootfs""
>>
>>  scripts/lib/wic/plugins/imager/direct.py | 12 +++++++++++-
>>  1 file changed, 11 insertions(+), 1 deletion(-)
>>
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175524): https://lists.openembedded.org/g/openembedded-core/message/175524
> Mute This Topic: https://lists.openembedded.org/mt/96070800/5792637
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [florian.bezdeka@siemens.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


