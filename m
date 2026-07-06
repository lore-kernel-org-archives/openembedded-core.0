Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE80C44500
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 09:42:16 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.147470.1783330929334520984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 02:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=04JpTtDK;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4759b4f0897so1127055f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 02:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783330927; x=1783935727; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftIEUn0ptdSp7xJ4EcY0c+y6vXIeSoLcNP2WGZWgo6M=;
        b=04JpTtDKA4hbJLDmxPR4Axm3dGjbMjZQ/Sgb4Eg3Ud09m319s0E6+o4r5/ol9RzyJF
         M1E7+CQiw8D2cnvsyqZPbdncwWoOoA+XnmkQnS06hNUe61UTbSd1BdkFbI1qeckWCJlI
         mdrZM3A+enrfFIpMWtLkay+OTeoYa/l1Sjkt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330927; x=1783935727;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ftIEUn0ptdSp7xJ4EcY0c+y6vXIeSoLcNP2WGZWgo6M=;
        b=lzeQRTmXCbe7IQr3XjZbp91kwkVeBWr+ddEsNA5vY7Q8h3nv5zEECGA+u3UVtP2GBi
         G0DmhQ6SOTSyQxjCIpRtCFYzB4YRnrReKPq8fr6TOZdH14FPiTlvKWFuSvvWXrpGiEQn
         hrzhp2k3nNHh6cKdcj+S6ALqqZNjELFci1Wer+AfryxXS1wWjhHCVuZV75sGc8zaFcWC
         Hk49MD2pw8qLl6KUgyv/3XlgTNMHEtt2pkYw/7ecqlhhqyfomG+pdIy8gGVjRRxmgXC/
         fDfYHePLJBrVxzHu731WZBhKKX9F7fKhAn4lzPJMN6gv7tW3SkYToNVRdGT8Zw/WAKeP
         2+OA==
X-Forwarded-Encrypted: i=1; AHgh+RrO2qZNqhoPfdBMEdZhhSUMQZ3wu7721P/PxE27LGIyVScSlYcKSa+2DjQAQqPG5a5AGcopi9i3oCPMTDI0yY2OnQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxObfATovs9pDgvDSrmHjFy/0qMx4yPlg1TMuFGSOv7dSxzSD39
	+M6lzC5dc1nUgSwZbmVsdNNquZYicD04lGc4urRZoHFAPXcKUAbtaNsPFIPocE3U0L4Nr0RsS1c
	Hb4Z73fs=
X-Gm-Gg: AfdE7cnwPrH2rNfh+zq8IcmkGj/siyjkyv+coUdrI7csHhTzvPvrJMKj8gRagpfYp3s
	qUU/DhZnFufOwHcmujsn3rsURF4VdEF0OvpjlNuamAPB1cz7Hcs+MTcqvHwD36OEX+HSTssmtve
	KpZuv7yjYG6PVYDQf+KTXFLHZ74TalHZE8TcoZVnUxhip4iDZolvCmilBaLjCCgpcI6hoCCwoRI
	HmtzR8/MTlzSBWHxB68VN3G8+vRSgN1Rbslx+gj5hqcj56O4M/dOLBihhESsdSMR20SaJS97+s4
	qhiDg0K8c0Lb0rbM3tCY0eq/jIL3nKxOeXwraSdvG+99nla7q9RUzPwr2ZQD4Fd+D+AkjDs+cqP
	5IifTFuEJiMXV2rwNHU/MSl7nsf/GLnfOxoPogeEB7fnlEnKTJsGNW5VQLFzXw809NhevfgywtF
	W0gpu9571cvXcq9FE=
X-Received: by 2002:a05:6000:2408:b0:45e:eaed:afd2 with SMTP id ffacd0b85a97d-47aa7ca8972mr11576556f8f.0.1783330927302;
        Mon, 06 Jul 2026 02:42:07 -0700 (PDT)
Received: from localhost ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d6da9sm22780571f8f.12.2026.07.06.02.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:42:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 11:42:06 +0200
Message-Id: <DJRE1XRAJU6Z.28VJVT0OMGUVB@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH V2] gdb: Upgrade 17.1 -> 17.2
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <Sundeep.Kokkonda@windriver.com>
To: "Deepesh Varatharajan" <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260630075003.1692482-1-Deepesh.Varatharajan@windriver.com>
 <DJQTD0V57D7M.2UJBWEZBMPTQP@smile.fr>
 <a56bc0e3-ecd7-4383-aabe-48b7a1f71536@windriver.com>
In-Reply-To: <a56bc0e3-ecd7-4383-aabe-48b7a1f71536@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 09:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240232

On Mon Jul 6, 2026 at 7:16 AM CEST, Deepesh Varatharajan wrote:
>
> On 05-07-2026 22:59, Yoann Congal wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender a=
nd know the content is safe.
>>
>> On Tue Jun 30, 2026 at 9:50 AM CEST, Deepesh via lists.openembedded.org =
Varatharajan wrote:
>>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>>
>>> This is a corrective release over GDB 17.1, fixing the following issues=
:
>>>
>>>   * PR dap/33228 ([gdb/dap] error while listing register children)
>>>
>>>   * PR gdb/33737 (gdb --help says 'For more information, type "stream"
>>>     from within GDB', but "stream" is not a defined command)
>>>
>>>   * PR build/33747 (Incompatible with MUSL libc: no member named 'c_osp=
eed'
>>>     in 'termios')
>>>
>>>   * PR gdb/33748 (gdb17 regression with displaying ANSI colors)
>>>
>>>   * PR gdb/33753 (Out-of-bounds writes in string_{v}printf -- threads
>>>     and static data don't mix)
>>>
>>>   * PR cli/33761 (Setting style colors is broken on MS-Windows)
>>>
>>>   * PR gdb/33768 (Loading compressed GDB scripts from .debug_gdb_script=
s fails)
>>>
>>>   * PR symtab/33775 ([gdb/symtab] data race in
>>>     dwarf2_per_cu::{set_addr_size,set_offset_size,set_ref_addr_size})
>>>
>>>   * PR symtab/33777 ([gdb/symtab] dw2_get_file_names doesn't cache resu=
lt
>>>     for dummy CU)
>>>
>>>   * PR symtab/33825 ([dwz] Extremely slow symbol lookup with DWZ-compre=
ssed
>>>     debug info (thousands of partial units))
>>>
>>>   * PR testsuite/33845 (gdb: There are 4 unexpected failures in
>>>     breakpoint-in-ro-region.exp)
>>>
>>>   * PR gdb/33872 (`skip -gfile` has inverted logic)
>>>
>>>   * PR gdb/33926 (GDB 17.1 AArch64: redefinition of user_gcs struct on =
musl)
>>>
>>>   * PR breakpoints/34112 (rbreak `file:regex` sets breakpoints for matc=
hes
>>>     outside of `file` [reproducer attached])
>>>
>>> Drop patches merged upstream:
>>>    * 0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau.patch
>>>    * 0010-GDB-aarch64-linux-Fix-build-failure-on-musl-systems.patch
>>>
>>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com=
>
>> When looking at the commit log:
>>     $ git log --format=3Doneline --abbrev-commit gdb-17.1-release..gdb-1=
7.2-release |grep -v "Automatic date update in version.in"
>>    7adf9fa6b1c Set GDB version number to 17.2.
>>    063b0d3f0b3 [gdb/breakpoints] Don't ignore <file> in rbreak <file>:<r=
egexp>
>>    17d05df7da1 gdb/ser-unix: add POSIX cfsetispeed/cfsetospeed support f=
or custom baud rates
>>    56c4ba5d7b5 gdb/ser-unix: fix musl build failure when setting custom =
baud rates
>>    1ccc3f6a2e2 GDB: aarch64-linux: Fix build failure on musl systems
>>    a4477520f93 gdb: Fix unexpected failures in breakpoint-in-ro-region.e=
xp
>>    eaf673ca75c gdb: Make test result accurate in breakpoint-in-ro-region=
.exp
>>    91080fe0d50 Revert "skip -gfile: call fnmatch without FNM_FILE_NAME"
>>    36356c77b89 [gdb/symtab] Fix slow symbol lookup with dwz
>>    07e542a3bd0 gdb/
>>    101b318a6a6 gdb: fix handling of raw ANSI escape sequences printed fr=
om Python
>>    0ac91006f95 [gdb/symtab] Cache dw2_get_file_names result for dummy CU
>>    32adc7212e4 gdb/dwarf: make dwarf2_per_cu size fields atomic
>>    59ffbefc0ee [gdbsupport] Fix get_print_cell use in threads
>>    0926b8b8339 gdb: fix loading compressed scripts from `.debug_gdb_scri=
pts`-section
>>    8e246f43277 Change handling of over-long DAP variables requests
>>    4393da33773 Fix --help output
>>    35880717849 Bump GDB's version number to 17.1.90.DATE-git.
>>
>> ... one commit stands out: "17d05df7da1 gdb/ser-unix: add POSIX cfsetisp=
eed/cfsetospeed support for custom baud rates".
>> This look like feature addition (e.g new config option). But, in this
>> case, if I understood correctly, this is the merged version of the
>> removed patch "0009-PR-gdb-33747-gdb-ser-unix-modernize-Linux-custom-bau=
.patch",
>> so this should be okay to merge but I think the commit message must
>> include this explanation.
> Yes, you are right that feature/bug fix is already part of wrynose as a=
=20
> local patch.
> Will explain in commit message and send V3.
>>
>> I wonder why this particular change was not part of the changelog you
>> added...
> It's there in the commit message.
>
> * PR build/33747 (Incompatible with MUSL libc: no member named 'c_ospeed'
>  =C2=A0 =C2=A0in 'termios')
>
> The above PR brings in the below commit.
>
> 17d05df7da1 gdb/ser-unix: add POSIX cfsetispeed/cfsetospeed support for=
=20
> custom baud rates

Oh right, the link is no easy to see.
Thanks for the v3, it does look good.

>
> Regards,
> Deepesh

--=20
Yoann Congal
Smile ECS


