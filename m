Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67149CAC5BB
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 13:31:30 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.10592.1759671079923780089
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 06:31:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uo/DaaHV;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6318855a83fso8185980a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 06:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759671078; x=1760275878; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gJqvpiCeUgRo4bvNs9g743+PbDh+m+JyWGgxNqP5Uo4=;
        b=Uo/DaaHV58lkDNqdX4TRFJzv+xRqpfBJALHklzZxJlQMbKspunEStNLQoUO92vYMnG
         jSWr9oc49gu8Xkf4lsgFgTSMIZu25vKJdkCKUKxoQRggyn7G+w8Y5jNqxSgzfnGKlE47
         lxZFFo28pOoumP953mAu024K9iGrdOZ69kw9jwbVdypTzKnEgunZJYKG1niArSiIs6Yn
         QWXQ6RAn+jQ+BRLXjZW5ByI1DOT7L5SWHcltTXXPr+H8zIHe6RB4x0YXbbDj7zA2ptV6
         Vq+TZgoe8Epb3bZw3aAW+DsTnx6/k3ANo6bxhc2g99+xhFhsKZdAccga+OGGP8FWNyNj
         7GSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759671078; x=1760275878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gJqvpiCeUgRo4bvNs9g743+PbDh+m+JyWGgxNqP5Uo4=;
        b=hPH2sC663SCQdsWenTer6jOVVSR8WXGXbiueiF1sRgI8DFRorj1lDMZe24bMFP2fiN
         98LG8yhi+ZkZ+Lujb8FU9SwnV1bxilGttA3A1WCrf32f5BQuaZ0NL24R7bZMXo6orD2c
         UMOvIWbpvb0BRWBIlgoGF2gWon8STnJiv/C3IYTakXt0HJDhtM2F3Emi9Cz6jTM3H9KN
         zUktJ5LUaIBVjNPITgVVRQ6aQefxb83Hy0pBMmHvutEJ+1WbYGkgf2mwmzwUOL0zwjr8
         VgXw44vSfVARR/ldi9xYpLVMQ7obmW+RAqJ0da2j4zYAWAbDkvtkc1AqvxnvwEHPI3Hn
         FuSw==
X-Forwarded-Encrypted: i=1; AJvYcCWmrgX0RoKXa8kriMsYdb6suumMIiTx4JckncU0Gm9/HTLM0mU0iDBfA+J4gzBjhSdGN1rMUsvQHA/u96IqmI++lA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx38FRkBEXxmB6HhHFHR+odRb6IPGCIU/1IBoAS2AonxbUlHZO2
	vffQMpma/JxbDihRe0C5DNVV1DeWbSBmj2QT2yp9ZwuLnI1GeAFrd2BS
X-Gm-Gg: ASbGnctrjbadBvyigYBoawO2McSGd9+kS4dLd67M6UMcE6lkt5xoVCYMfm/lDQ55TSV
	U6KR0gc1kHAaf6S1BtIoK9qCUgfzbEZ/NnxXOU8o243xmGNIvUhgQnu4QRo8bsODmUOHxaPLIjt
	xjoZynqgpMhNLfz1UvRs8z6ddF18Chd4ZBLAn03LURRj27lHCE+bVklAZK+cfe8NXZXBtNwiQLE
	lO5AyfTl71QqPsCHZT3dm6VAyrw4Yu82NfkRInz1bX8L/iVp2mtUBaE6Gz/zsHbARvYhtedDp5r
	2xWF2pUdBwdHvIRmkJ+ucuecsSnP+TC/G8StWjU34p5y5S0+A+SCR+y07MRPEZ8xDXhCQ4hUURg
	N0b1+dHegNFOE034o8RSccligFuMF/AO6t7ZLt54XuKUsDu9bBYbJhDKva0jpVhSkIWqX/6PUSS
	AJ
X-Google-Smtp-Source: AGHT+IGU0sxs8QkiP5ZaEB/MpK7sDz1jbC0c2uVNzNdN1MqVyHSHMkvDlktMOuNXVCuscCr2y7kZAw==
X-Received: by 2002:a17:907:3d16:b0:b04:3bfe:5b20 with SMTP id a640c23a62f3a-b49c373ebc2mr1189081766b.30.1759671078088;
        Sun, 05 Oct 2025 06:31:18 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b32bsm933669766b.50.2025.10.05.06.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Oct 2025 06:31:17 -0700 (PDT)
Message-ID: <e6fb29a7-48da-4753-9bae-c9dd0bf55034@gmail.com>
Date: Sun, 5 Oct 2025 15:31:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH] cargo_common.bbclass: use source
 replacement instead of dependency patching
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
References: <20251003213000.2256939-1-skandigraun@gmail.com>
 <DDAF5YSSFJS8.2RCPLOVKYH00N@bootlin.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <DDAF5YSSFJS8.2RCPLOVKYH00N@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 13:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224439

On 10/5/25 15:23, Mathieu Dubois-Briand wrote:
> On Fri Oct 3, 2025 at 11:30 PM CEST, Gyorgy Sarvari via lists.openembedded.org wrote:
>> Cargo.toml files usually contain a list of dependencies in one of two forms:
>> either a crate name that can be fetched from some registry (like crates.io), or
>> as a source crate, which is most often fetched from a git repository.
>>
>> Normally cargo handles fetching the crates from both the registry and from git,
>> however with Yocto this task is taken over by Bitbake.
>>
>> After fetching these crates, they are made available to cargo by adding the location
>> to $CARGO_HOME/config.toml. The source crates are of interest here: each git repository
>> that can be found in the SRC_URI is added as one source crate.
>>
>> This works most of the time, as long as the repository really contains one crate only.
>>
>> However in case the repository is a cargo workspace, it contains multiple crates in
>> different subfolders, and in order to allow cargo to process them, they need to be
>> listed separately. This is not happening with the current implementation of cargo_common.
>>
>> This change introduces the following:
>> - instead of patching the dependencies, use source replacement (the primary motivation for
>>   this was that maturin seems to ignore source crate patches from config.toml)
>> - the above also allows to keep the original Cargo.lock untouched (the original implementation
>>   deleted git repository lines from it)
>> - it adds a new folder, currently ${UNPACKDIR}/yocto-vendored-source-crates. During processing
>>   the separate crate folders are copied into this folder, and it is used as the central
>>   vendoring folder. This is needed for source replacements: the folder that is used for
>>   vendoring needs to contain the crates separately, one crate in one folder. Each folder
>>   has the name of the crate that it contains. Workspaces are not included here (unless the
>>   given manifest is a workspace AND a package at once)
>> - previuosly the SRC_URI had to contain a "name" and a "destsuffix" parameter to be considered
>>   to be a rust crate. The name is not derived from the Cargo.toml file, not from the SRC_URI.
>>   Having destsuffix is still mandatory though.
>>
>> The change does not handle nested workspaces, only the top level Cargo.toml is processed.
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> Cc: Tom Geelen <t.f.g.geelen@gmail.com>
>>
>> ---
> Hi Gyorgy,
>
> I know this is just an RFC, but I still took it for a run on the
> autobuilder. It looks like id does break rust build:
>
> ERROR: rust-native-1.90.0-r0 do_configure: Error executing a python function in exec_func_python() autogenerated:
>
> The stack trace of python calls that resulted in this exception/failure was:
> File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
>      0001:
>  *** 0002:cargo_common_do_patch_paths(d)
>      0003:
> File: '/srv/pokybuild/yocto-worker/genericx86-64/build/meta/classes-recipe/cargo_common.bbclass', lineno: 182, function: cargo_common_do_patch_paths
>      0178:    lockfile = d.getVar("CARGO_LOCK_PATH")
>      0179:    if not os.path.exists(lockfile):
>      0180:        bb.fatal(f"{lockfile} file doesn't exist")
>      0181:
>  *** 0182:    lockfile = load_toml_file(lockfile)
>      0183:
>      0184:    # key is the repo url, value is a boolean, which is used later
>      0185:    # to indicate if there is a matching repository in SRC_URI also
>      0186:    lockfile_git_repos = {}
> File: '/srv/pokybuild/yocto-worker/genericx86-64/build/meta/classes-recipe/cargo_common.bbclass', lineno: 137, function: load_toml_file
>      0133:        cargo_toml_path = os.path.join(path, 'Cargo.toml')
>      0134:        return os.path.exists(cargo_toml_path)
>      0135:
>      0136:    def load_toml_file(toml_path):
>  *** 0137:        import tomllib
>      0138:        with open(toml_path, 'rb') as f:
>      0139:            toml = tomllib.load(f)
>      0140:        return toml
>      0141:
> Exception: ModuleNotFoundError: No module named 'tomllib'

Thanks a lot for testing.
Looks like I got to target older Python versions than 3.11... is 3.9 the
oldest that is still supported?

> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/2528
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2505
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2543
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2497
>
> Thanks,
> Mathieu
>


