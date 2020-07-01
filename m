Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.104])
 by mx.groups.io with SMTP id smtpd.web10.22284.1593611483441981927
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 06:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=SMi+y8fI;
 spf=pass (domain: prevas.dk, ip: 40.107.21.104, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QflVwx9WX3w2rrWvBIkIXK/QXsxzmfNnPUbCXaV7NsceLboNgayylbyEnpwW5hXEir9syGSp3OCoD7eKwDiGfEAmySF9Mye6bQCOIINpNB7uPHP7TGX5L+TC2krACfVZGf26MsXFEPO//rVOn/ItBUNWanldW/NE6GepWEGpSjVHfZR9nASQYN62dgWFezIZJbZEcJXQ1RBqWGoRcZ3UjnF9mHqaFz8vgJvITNB8D3nnfDm8Ii1sw1bKbfPis6in0ld3m8tLd/qeORfma1+HP5QUqtc923GqH9KlvRqV+CfaJ1af6mltjeAXGx7GeOYHU9iBnjhFeC+oUJ2jRdSXSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayQuNgtS80AeCasTO7lV9lcrUjEXvrDCzVbsZmnmzfA=;
 b=UV1Pf1/8z8MbJoRMddJ5wpoG871zCs71EolI/sZUjwKebQXtffKssagNIKuJp84Jt7wab/Ev6WM6DzndAIwK4aBIsZZf+0MajVwBoKoYfxKFGSEw/44l1JSpV5QhYJn7yVeRf7oIVYt3tp4bWI3r81z/uwkeF2dUvv8aHrvSc4EkfgwBnQ0YQNwZqay2cJe7SkbPBMOgoGl+hLcIWrmaCuUOoDIP21NsIo98G7cA5umTNsbWCGttX/DmB/jSSuwt8VEWUUv2l53nB0oSk2jG2F0QluUKqdVpPU8L5wiGvQXraI8YwB3O0v3WpB/Uif/CLDG9LkXeRDfJaRxv5QQung==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayQuNgtS80AeCasTO7lV9lcrUjEXvrDCzVbsZmnmzfA=;
 b=SMi+y8fIyHWxeLqBkkEjMumH8SLKCxTEel0nu5Ot0VB/NNyGnZq4W45o0UHsQ5UrEK9bdKaK2xLXHDi5gx9f6XkpMj4C2NYb+S6Pb9VU9yGhU77AeVvN1QQcgY8UbO6G/Iahn1pkSNhPKlQJD2smGWlppVf0iMmHlDutN5lSPAk=
Authentication-Results: deif.com; dkim=none (message not signed)
 header.d=none;deif.com; dmarc=none action=none header.from=prevas.dk;
Received: from AM6PR10MB1880.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:2f::12)
 by AM5PR1001MB0978.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:203:7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21; Wed, 1 Jul
 2020 13:51:20 +0000
Received: from AM6PR10MB1880.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4d30:d2b9:cdfb:57e5]) by AM6PR10MB1880.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4d30:d2b9:cdfb:57e5%7]) with mapi id 15.20.3131.028; Wed, 1 Jul 2020
 13:51:20 +0000
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Kjeld Flarup <kfa@deif.com>,
 =?UTF-8?Q?Per_N=c3=b8rgaard_Christensen?= <per.christensen@prevas.dk>,
 Paul Eggleton <paul.eggleton@linux.intel.com>,
 =?UTF-8?Q?Kurt_=c3=98stergaard_Frandsen?= <kof@deif.com>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Subject: file checksums versus SRC_URI globs
Message-ID: <aaad9ac7-be6a-1ffb-6990-ab371ed40015@prevas.dk>
Date: Wed, 1 Jul 2020 15:51:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
X-ClientProxiedBy: AM0PR10CA0065.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::18) To AM6PR10MB1880.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:2f::12)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.11.153] (81.216.59.226) by AM0PR10CA0065.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Wed, 1 Jul 2020 13:51:20 +0000
X-Originating-IP: [81.216.59.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7db4e8dd-e742-4c8d-4e25-08d81dc5d5c9
X-MS-TrafficTypeDiagnostic: AM5PR1001MB0978:
X-LD-Processed: d350cf71-778d-4780-88f5-071a4cb1ed61,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
 <AM5PR1001MB097827DED3170DC847043571936C0@AM5PR1001MB0978.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 04519BA941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 11OARMNjBBMG/jjMOvfNLWIZy5vdFialvtjstjC/doZqxVCzyCwJbEcscW+L1u6eHuAsoRONah+TSLnKdpqOs55HKyiq/LFCyeQDhcWe6gSch+nnAiebhKoX+/jHz2lZ50bIdK0OdE5xASb9HC6mI4jDb9WwpYDHUWt+SxdB1QQoS4mhydWuye0KLsSk4PWZzCwQ2mXtdLiKqMd58IAI61BlrS2XV47x7mCTH+B1s1eOsLUqZiCK9wne+u2wCiCleDUU2j1tEkCf8BB5Xc14G9JPn+Ko//gZ7CV6hzubXdr3Qsw5I3rinj0tIoblBYPVwtf067RU6EgQXgF4DQ5evLY3vP8+AFwKRFUH3eEv7+RJ2XtksDAjRsTKQmIg61PT
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR10MB1880.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(346002)(39850400004)(376002)(396003)(366004)(136003)(83380400001)(31686004)(8936002)(86362001)(8676002)(16526019)(31696002)(8976002)(478600001)(54906003)(316002)(16576012)(52116002)(6916009)(2906002)(36756003)(26005)(4326008)(186003)(6486002)(2616005)(956004)(66476007)(44832011)(66556008)(66946007)(5660300002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
 WI9Y+jzcUzjE8URrMFsX+gUGJ2Bv5okDi5R78c5lbJ81cT/4ZlWUTvI6G3ixtVnbkOHRJSqfX2jcDgGW+Hg33UpidFoo/JNtaDAcrmy6qZC4GWFr0eBdmmmc2ZuG/85vnkSdASASrgcFlbJG2eybL2Q7JwWIXdLYiPTn1XCsm+Vkunym3i4eydWOf/2CT9DS7swBWHX2OnuVSRFaZ1SavRufoUgjiJGVxNUgeB9WylsZp09eBCmXLNScitqgu76vyG7sGYU4Wib8GV10mlkCYt7Kzomf22VrBc45jixnwgqVeIuwKfVjPLSE37asDJAxLOfM4VDt2mRqVsS38k0L3U94SwYQ375Ktxv4GIgyflV7o66J2SAYqIO9dxCoPqyp+xek9IsYyx+Loztt13xiFjUQ3yiPrpPZJubd3iC8amNEAfZ51Q4kMMVCJ9mQxOYjS6ha95ep/VcJ8gnXgURSWWk+ASOQPOcSeS/7NA7Bvxg=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db4e8dd-e742-4c8d-4e25-08d81dc5d5c9
X-MS-Exchange-CrossTenant-AuthSource: AM6PR10MB1880.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2020 13:51:20.8196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OahCqF+nAURNTMlPEuVrLbm0gUwKEypDhfiLoFcLr1wSrsO2qOCH7phrRLYK1U5HCsU57e9TC1JQg5J0anG2FRrHK5WJdN2ljGv1JN0RT48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB0978
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

We have a recipe that uses

  SRC_URI += "file://somedir/*"

and we have noticed that changing one of the files inside somedir does
not cause the recipe to be rebuilt - in fact, no task hashes are
affected; we discovered this because a clean build worked correctly,
while one that uses an sstate mirror would end up with an old version of
those files on the target.

Digging around, it _seems_ that this should be supported, e.g.

commit bb66113bde5361b869dce2bdaece5b938f077ea8
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Sun Apr 6 11:08:22 2014 +0100

    bitbake: fetch2: Fix bug in file checksum generation

However, it also seems that something since then has broken the
checksumming of files specified via a glob pattern. At least if I take
the recipe mentioned in that commit and run "bitbake-dumpsig -t
connman-gnome do_fetch", I get

Variable SRC_URI value is
git://github.com/connectivity/connman-gnome.git
file://0001-Removed-icon-from-connman-gnome-about-applet.patch
 file://null_check_for_ipv4_config.patch            file://images/*
      file://connman-gnome-fix-dbus-interface-name.patch
file://0001-Port-to-Gtk3.patch
...
This task depends on the checksums of files:
[('0001-Removed-icon-from-connman-gnome-about-applet.patch',
'4c1b4d89f92949f34d5c232d85398bb4'),
('connman-gnome-fix-dbus-interface-name.patch',
'51f2ebbc91ec35184876dfdf8aec35fd'),
('null_check_for_ipv4_config.patch',
'a23271e41c9fe81551244d875106af10'), ('0001-Port-to-Gtk3.patch',
'fa8ffcd77c330fd5063c7a7c62dd7c69')]

i.e., none of the files in images/ are mentioned, contrary to what was
apparently the case back in 2014.

Rasmus
