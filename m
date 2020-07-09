Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.96])
 by mx.groups.io with SMTP id smtpd.web10.3140.1594323087575559249
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 12:31:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=aZ9FzinY;
 spf=pass (domain: prevas.dk, ip: 40.107.6.96, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1IJSbmZ4KliBppYHLGb9fgoKImTKILE8U25mwQHYST08whmZj/pzUca7yF2v4n7363vjKtA+KSt44E+R6LcocC5CZqRxZcb2b8GIrx5NN0xtBcq9wCVeLY0wDY34do3MRYKo8LvCiLUOVeaDqGlsjGXw3RAc6tjxTSJ9TvSGcxBeVNSp6A6ArFSiQv5iF2Mb3eN3u+IrExs0WZbSi/O/wArV7Cic3rx1CZcTISLl7TbsViOu1nZSDAtunrQKf0jeRtw82WOr5yMsuQh/9HrnQCpp8BdagRpJszaHNgMKsmv/fAD0VhqeYa7WaHnw/knt7/h07B2rSOHG/opAg/lJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hun33SRX9THXiIdVWCKCtX5fO4aYy7lgSi35h5Ns9Vk=;
 b=Q6nXr5TTO0h53W/oBmErWHe2BPN4EHwHRQkHkUKgoQrTxh8R3CfpR+q6xz5bMEHUCELqxTjIUKHlE1BA48krl7WdDS5GqrFdAaAHPX1L9aMyzFbWJxu8p/G5VMlqKyzyT85q42U0SsBI1rLEzWet9fkE1NWF8OoOtER6QRYU9R1Ul58rfVDO3HOe5z6oFDhom48gVIDMxN81d2GbXkzWV/fVF2QEPj0Ed4FFERKBU4Hsc/u1WgcjcL8QUCnosIH0ystc/Zz0TcLNuV5WVl1AauWRrfQmri/1eFEQog09LeLQiGy64zsjvNVpq9HtgD2WlsMrQ5WPdh3mLGc8AmfTlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hun33SRX9THXiIdVWCKCtX5fO4aYy7lgSi35h5Ns9Vk=;
 b=aZ9FzinYHrZIr8+y6fkpuR9zvAkLoH36g4WAch/F15XACQnLKiR3k7fcuMQL6W+tEc8G4yPQpii1nOKQfW+rghIZbm1KN5HgW83tENCt+21T/QNUpjuO0WeoUbCyIXLzDGW4h9zSDtgWdKDe7a4klxkZWyzaZaRkY2gieV/vx8g=
Authentication-Results: deif.com; dkim=none (message not signed)
 header.d=none;deif.com; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB3617.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:15f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Thu, 9 Jul
 2020 19:31:25 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::91fd:aebc:e8cb:a663]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::91fd:aebc:e8cb:a663%7]) with mapi id 15.20.3153.031; Thu, 9 Jul 2020
 19:31:25 +0000
Subject: Re: [OE-core] file checksums versus SRC_URI globs
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Kjeld Flarup <kfa@deif.com>,
 =?UTF-8?Q?Per_N=c3=b8rgaard_Christensen?= <per.christensen@prevas.dk>,
 Paul Eggleton <paul.eggleton@linux.intel.com>,
 =?UTF-8?Q?Kurt_=c3=98stergaard_Frandsen?= <kof@deif.com>
References: <aaad9ac7-be6a-1ffb-6990-ab371ed40015@prevas.dk>
 <20200701140321.wueczs4qd34rbhwh@qschulz>
 <161DDC5BD88A8AE5.10798@lists.openembedded.org>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <7540f712-dc06-4ab7-22e7-124aa733025c@prevas.dk>
Date: Thu, 9 Jul 2020 21:31:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <161DDC5BD88A8AE5.10798@lists.openembedded.org>
X-ClientProxiedBy: AM6P192CA0004.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::17) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (5.186.112.31) by AM6P192CA0004.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend Transport; Thu, 9 Jul 2020 19:31:24 +0000
X-Originating-IP: [5.186.112.31]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d87d1ae8-b9e5-4ddd-a7ed-08d8243eab28
X-MS-TrafficTypeDiagnostic: AM0PR10MB3617:
X-LD-Processed: d350cf71-778d-4780-88f5-071a4cb1ed61,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
 <AM0PR10MB3617C1FAC09893B5595E9D0F93640@AM0PR10MB3617.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 7p0xqEmIqcm3X4GMuQJ1P6mh9LeviXuOQ3ya8BsyVG5w8axSST1uysfbkFp8YIq9jBuOATbc2GRxLr93fVipTR8KR7un1odvYbkT/wUcOQeDUEwK1vqdv7Qx+Lc9oLufoNi2iKY+hRLCtzltIQLsV8Ly+nlkR487tXtl0DdXcyMDxcHZ/5AiCfDGlgMBOyjKb54SwvHP0M3dwrp4PV18C/UPkUsxjLeIfoKVymCAVSUCl9sUamu9FYH7Xr9P1UQzXIlxTqzDFg9ejNovtUdWGD00CD1B0KaOqP7TIbo5z79nwk9E/u9jCICn4sStmWGzKp5c7O6KSAsoHLom/NOMfREWtvgV2xTaf94mDgNKyu98fRkeqdAn7VA7mlA/ywni
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(366004)(396003)(346002)(136003)(39840400004)(376002)(44832011)(8976002)(16526019)(186003)(8936002)(6486002)(4326008)(956004)(2616005)(31696002)(36756003)(6916009)(54906003)(83380400001)(66946007)(66556008)(66476007)(52116002)(478600001)(86362001)(16576012)(2906002)(26005)(31686004)(316002)(5660300002)(8676002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
 5FLpk1V3ajVTIMXm7n7Mz2NhZ5MPrjp5IDQlJrZG7bS6IVny1/L6TJUnAVYTeOIPnAdHfrOvynnWUhRzZH9KHz6SxFKaCV2CDIDRwUxyJ+DaTFGN9SXNaoADwoAb6DajfX8fsa6/dcDuBcLiKpCGzB7AJxfjhq/ZzwcTXVp49ehpu5N+fasjSRZzAEjJgVaV/PJk2huGv2zWjyAsjCRQ7MYdkEMyDpe9QifxJmJO92gbhJbzA0f6tfS0K4dNiCxpm4k9Rp24bfhU6wIkQm7OdH885uesCSfRt3Ptx+rYfbBXIillaMkDKgnmfArRi1sfu3qibepttZaC3VgiiInpasc1G3QdmDG+Og1/hJlnSev7n6sd8RhEj5XSOUCzNzEM4Y+HTnRaJYy9iB428YZSTKMaNmUPmxz0phhf5PahTTn4GFz4iVh/1yzT1eB/EQ00q4friYow9MW7Z9KoNFDOK4k9hY8q4piScQ6JmCVV6Ho=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: d87d1ae8-b9e5-4ddd-a7ed-08d8243eab28
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 19:31:25.3784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYvPq/aTrJ8XUhV6XXA3ot3LPyJZB06LCPBKo2T5VL9n7bcBsKeuZAjctEUaaYIP87RgxVtif5zTFZX1yZ+BpUxYn2Ur4MNAJhSyy5UGrKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3617
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/07/2020 08.42, Rasmus Villemoes via lists.openembedded.org wrote:
> On 01/07/2020 16.03, Quentin Schulz wrote:
>> Hi Rasmus,
>>
>> On Wed, Jul 01, 2020 at 03:51:19PM +0200, Rasmus Villemoes wrote:
>>> Hi,
>>>
>>> We have a recipe that uses
>>>
>>>   SRC_URI += "file://somedir/*"
>>>
>>
>> Glob aren't supported. Use "file://somedir/" instead.
> 
> Thanks, that actually works for one of the cases we have (there are
> others that use globs which cannot be solved quite that simply, but for
> now I'm just listing files explicitly instead).
> 
> However, I'm not sure that "globs aren't supported". The commit I
> referenced clearly tried to make that work (better), it also "works" in
> the sense of unpacking the expected things when building from scratch -
> there's even
> 
>     def test_local_wildcard(self):
>         tree = self.fetchUnpack(['file://a', 'file://dir/*'])
>         self.assertEqual(tree, ['a',  'dir/c', 'dir/d', 'dir/subdir/e'])
> 
> in bitbake/lib/bb/tests/fetch.py. And the two upstream recipes
> connman-gnome_0.7.bb and matchbox-desktop_2.2.bb both use that exact
> pattern.
> 
> So either
> 
> - this is a plain bug in the signature computation,

I'm guessing the culprit is

commit 6c0706a28d72c591f1b75b6e3f3b645859387c7e
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Mon Dec 8 21:25:23 2014 +0000

    cache/fetch2/siggen: Ensure we track include history for file checksums

which was the one that introduced the ":True: or ":False" suffixing via

+                filelist.append(f + ":" + str(os.path.exists(f)))

and then also did

@@ -981,6 +980,10 @@ def get_file_checksums(filelist, pn):

     checksums = []
     for pth in filelist.split():
+        exist = pth.split(":")[1]
+        if exist == "False":
+            continue
+        pth = pth.split(":")[0]
         if '*' in pth:
             # Handle globs
             for f in glob.glob(pth):

which practically guaranteed that the "if '*' in pth" would be dead code.

Richard, do you agree that this is a bug in the signature computation?

As I wrote previously, there's no warning anywhere that using globs in
SRC_URI will fail to take the contents of the referenced file into
account in hashes, but there's obviously still a some code that makes
file://*.c work wrt. unpacking (and a test case for that).

Rasmus
