Return-Path: <ola.x.nilsson@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A647EC47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 12:10:54 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.87])
 by mx.groups.io with SMTP id smtpd.web11.11915.1705407049278633762
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 04:10:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=WgngB8Iy;
 spf=pass (domain: axis.com, ip: 40.107.104.87, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6rbGVgi9is1SD+nPrzM3k0ZDzzgy9oFr14ACJ2qBzzLXMSMw7J3OAHB2NsTf0oPLghwGfp12c5ib4QXYnwlrv+1aTwo1suWu9X0LyLKLT0KdDa7f3fiFZWKQtaG2GvrQ5seuORlL+sY6zcNJSVpeeslqjPbKE7cUQD03pAkANsVbuIADwqhGm8fW2Ti+UR0B0NQkifapJmLjDBGFWUVeIDuqSsMZ/tHocflJlUm1HAm7ufJfV1+x07wpVI23wk4mf+sU0nikzwJcg4WvlS0kqX6HzangcmprVFnsjG2PLVD1li2gocGKyCfxucbpFx7lX+1qSI+j80EgRQ6TOHQGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juZa/xr9z0rtOEgDWn9847baIu5QNo+Ub0RNeP5Xvfc=;
 b=nz3Gf5xGbHmL3XXEtFINBFjSL03oeMY8YRLpqnLUaNu/10YJqC+GPldOta9iGfn7r/FY1GbTeKe9MJgYczpQG+nZP7xkzDgEPhdPyfJgNSX7zNfQmnFrM/lHdhl9evubegdaNs9+M40h6VVdAW7skoNY4eadr63SDjRpo6NWluSd2CQ3wa++/bochvC4UFEe96ciiLXJcJ21qtmOi83W+b0mKJ9L8cBEtVhtc92c2EyML851cakr0CAoxomFqpFTj7ZEUqWgU1UKCeIvrCn1MuYyiwn0Rb4ThmmLm24zJRPm7zp4iOfe6C4dkPHhunFfYHJzWSesJj7wkmfF6HC0fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=bootlin.com smtp.mailfrom=axis.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=juZa/xr9z0rtOEgDWn9847baIu5QNo+Ub0RNeP5Xvfc=;
 b=WgngB8IyB1yThc6LZMntYlHnXZl0mynCqfVwec3zdrsCnfN9zGamllB+cep6tepJvRM4w58U475Sve0/JopZjfWsUUTVHH8pmpslmYFLyqKz/pwgI7Cd29t2bFeUSe+GGoZ64ww5x06VL+yCvXNYXFRrfjiUJE0npdaDNkfRUbw=
Received: from AM0PR04CA0140.eurprd04.prod.outlook.com (2603:10a6:208:55::45)
 by PA4PR02MB6526.eurprd02.prod.outlook.com (2603:10a6:102:d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.28; Tue, 16 Jan
 2024 12:10:45 +0000
Received: from AM3PEPF0000A78F.eurprd04.prod.outlook.com
 (2603:10a6:208:55:cafe::a4) by AM0PR04CA0140.outlook.office365.com
 (2603:10a6:208:55::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.24 via Frontend
 Transport; Tue, 16 Jan 2024 12:10:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A78F.mail.protection.outlook.com (10.167.16.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Tue, 16 Jan 2024 12:10:45 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 Jan
 2024 13:10:45 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 Jan
 2024 13:10:44 +0100
Received: from lnxolani1 (10.0.5.60) by se-mail01w.axis.com (10.20.40.7) with
 Microsoft SMTP Server id 15.1.2375.34 via Frontend Transport; Tue, 16 Jan
 2024 13:10:44 +0100
References: <20240112151403.3810910-1-olani@axis.com>
 <20240112151403.3810910-2-olani@axis.com>
 <20240115165552bd7f2545@mail.local>
 <CANNYZj_w3qXZFRCpgUShCGeMqQe5daGyMkMR7Pc0va2eCrd_Pg@mail.gmail.com>
User-agent: mu4e 1.8.14; emacs 29.1.90
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: <openembedded-core@lists.openembedded.org>,
	<alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 2/3] insane.bbclass: Make
 check_32bit_symbols check for file functions too
Date: Tue, 16 Jan 2024 13:09:21 +0100
Organization: Axis Communications AB
In-Reply-To: <CANNYZj_w3qXZFRCpgUShCGeMqQe5daGyMkMR7Pc0va2eCrd_Pg@mail.gmail.com>
Message-ID: <jwqh6jdxyuz.fsf@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78F:EE_|PA4PR02MB6526:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e12df8-e6a1-45de-76e1-08dc168c2b22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4N7vdDoBHjByPEMQL8pdNhZqWygyGY2mMzg1W33uRwswXdoW1Uwf7i0KS3/Mqj1mb2ILoPGKLOmf84hBG9DGWYmdSHNvN+HudiZOITP6UCg/DkHJCZ04JBKaBwHzu79Tch/xR4iyjKsotm/vicdocZxLYnKP9DMYXc8nLf0FCOw4yOZdAHYtWMEESbqEDwmc2NXgDheMjtyjTSjQ97WCdk4GRL1EhYu7DVziy06sVVk2WQDUw682GtOnLRFkaV7wx2TUg1P62lYPOBd/57K1iNKP4ZJeZOin5iQXnJW3p+2LzBT2NAsJd+LVZ1tQyNerZ/Kg6DyDgc5uTThRssOuNZDrlikPNW9cpn2JWndtiGFIXuzlz7zyWR1/zcf/BQ0kVOWH76JEAE4+kpWnzAUTsFU7HGTzbKokUGv73840s13Sc99i3GZkeuUpj8lNSMY8c+cAMW2RdC749I8cyDThAWT5fzfdy5Jm/OCuRcj7AjUfzIDD3WoaUVMdlLEXDDJqIZTE5kkrk2rBNuJVe6CpUzF6jiyI0Alz2RfM74qsRWm73j47xAn2emHarAai8zcWJNtVTRa2KQeHSB1Ngq/CouS1ABiUUeyu0mOa7LO8rvXTy4Pb39JgiKWV7SiT06AHLxF+FfQtZh+qqPC04+X+SBGX1+aCl3BpKr6d0qKrVFJ8JPLmWrjAyg5TzxExsvS5Irzso4d5cimX/g/tCLLyUVlx0IMW1Uf5NuDuLT/IocH1uVrCmd7NvCK3m43UA71ZRMuxujaY0vXdoXSqwUv6zLn8023Fu1GkijY2NfVA36k=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(230173577357003)(230273577357003)(64100799003)(82310400011)(186009)(451199024)(1800799012)(40470700004)(36840700001)(46966006)(66899024)(36860700001)(82740400003)(2906002)(36756003)(41300700001)(86362001)(47076005)(81166007)(356005)(36916002)(8936002)(6666004)(54906003)(70206006)(6916009)(8676002)(316002)(966005)(426003)(336012)(83380400001)(5660300002)(4326008)(2616005)(26005)(70586007)(478600001)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 12:10:45.4366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e12df8-e6a1-45de-76e1-08dc168c2b22
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6526
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 12:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193858


Seems I have my work cut out for me.  Thanks for the feedback.

/Ola

On Mon, Jan 15 2024, Alexander Kanavin wrote:

> I guess the patch needs to be adjusted to suppress the warnings from here?
> https://git.yoctoproject.org/poky/tree/meta/conf/distro/include/time64.inc
> Any suppressions should come with upstream ticket links.
>
> Better yet, make patches to address the issues. Seems like there's not
> a lot of them.
>
> Alex
>
> On Mon, 15 Jan 2024 at 17:55, Alexandre Belloni via
> lists.openembedded.org
> <alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
>>
>> This causes a bunch of warnings on the autobuilders:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/8306/steps/12/logs/warnings
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/5587/steps/11/logs/warnings
>>
>> stdio: WARNING: lib32-openssh-9.5p1-r0 do_package_qa: QA Issue: /usr/bin/ssh-keyscan uses 32-bit api 'mkstemp'
>> stdio: WARNING: lib32-python3-numpy-1.26.2-r0 do_package_qa: QA Issue: /usr/lib/python3.11/site-packages/numpy/core/_multiarray_umath.cpython-311-i386-linux-gnu.so uses 32-bit api 'fallocate'
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/8499/steps/12/logs/warnings
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/5675/steps/12/logs/warnings
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/8382/steps/12/logs/warnings
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/8363/steps/13/logs/warnings
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/7305/steps/12/logs/warnings
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/160/builds/295/steps/12/logs/warnings
>>
>> stdio: WARNING: openssh-9.5p1-r0 do_package_qa: QA Issue: /usr/sbin/sshd uses 32-bit api 'mkstemp'
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/7404/steps/12/logs/warnings
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/7327/steps/12/logs/warnings
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/5743/steps/13/logs/warnings
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/7174/steps/13/logs/warnings
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/2749/steps/21/logs/warnings
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/8386/steps/13/logs/warnings
>>
>> stdio: WARNING: openssh-9.5p1-r0 do_package_qa: QA Issue: /usr/bin/ssh-keyscan uses 32-bit api 'mkstemp'
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/8436/steps/12/logs/warnings
>>
>> stdio: WARNING: openssh-9.5p1-r0 do_package_qa: QA Issue: /usr/lib/openssh/ptest/regress/unittests/hostkeys/test_hostkeys uses 32-bit api 'mkstemp'
>>
>>
>> On 12/01/2024 16:14:02+0100, Ola x Nilsson wrote:
>> > Since _TIME_BITS=64 forces the use of _FILE_OFFSET_BITS=64, also check
>> > for functions redirected only based on _FILE_OFFSET_BITS and
>> > __USE_FILE_OFFSET64.
>> >
>> > Signed-off-by: Ola x Nilsson <olani@axis.com>
>> > ---
>> >  meta/classes-global/insane.bbclass | 31 ++++++++++++++++++++++++++++++
>> >  1 file changed, 31 insertions(+)
>> >
>> > diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
>> > index 69741a6a79..1ff6a319c4 100644
>> > --- a/meta/classes-global/insane.bbclass
>> > +++ b/meta/classes-global/insane.bbclass
>> > @@ -598,6 +598,37 @@ def check_32bit_symbols(path, packagename, d, elf, messages):
>> >          "fts_set",
>> >          # /usr/include/netdb.h
>> >          "gai_suspend",
>> > +
>> > +        # Since _TIME_BITS=64 forces the use of _FILE_OFFSET_BITS=64,
>> > +        # also check for functions redirected only based on _FILE_OFFSET_BITS
>> > +        # and __USE_FILE_OFFSET64
>> > +        # /usr/include/bits/fcntl-linux.h
>> > +        "fallocate",
>> > +        # /usr/include/bits/resource.h
>> > +        "prlimit",
>> > +        # /usr/include/sys/statfs.h
>> > +        "statfs", "fstatfs", "statvfs", "fstatvfs",
>> > +        # /usr/include/sys/sendfile.h
>> > +        "sendfile",
>> > +        # /usr/include/sys/resource.h
>> > +        "getrlimit", "setrlimit",
>> > +        # /usr/include/sys/uio.h
>> > +        "preadv", "pwritev", "preadv2", "pwritev2",
>> > +        # /usr/include/sys/mman.h
>> > +        "mmap",
>> > +        # /usr/include/stdlib.h
>> > +        "mkstemp", "mkstemps", "mkostemp", "mkostemps",
>> > +        # /usr/include/stdio.h
>> > +        "fopen", "tmpfile", "freopen", "fseeko", "ftello", "fgetpos",
>> > +        "fsetpos",
>> > +        # /usr/include/dirent.h
>> > +        "readdir",
>> > +        "readdir_r", "scandir", "scandirat", "alphasort", "getdirentries",
>> > +        "versionsort",
>> > +        # /usr/include/unistd.h
>> > +        "lseek", "pread", "pwrite", "truncate", "ftruncate", "lockf",
>> > +        # /usr/include/fcntl.h
>> > +        "open", "openat", "creat", "posix_fadvise", "posix_fallocate",
>> >      }
>> >
>> >      ptrn = re.compile(
>> > --
>> > 2.39.2
>> >
>>
>> >
>> >
>> >
>>
>>
>> --
>> Alexandre Belloni, co-owner and COO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#193689): https://lists.openembedded.org/g/openembedded-core/message/193689
>> Mute This Topic: https://lists.openembedded.org/mt/103684364/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


-- 
Ola x Nilsson

