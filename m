Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F6D5C5AD49
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 17:59:08 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.27532.1748541546095639166
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 10:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NOPOCfBs;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b26d7ddbfd7so1349959a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 10:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748541545; x=1749146345; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oagTvCffXrj++GrVa3nLdl+c84vcOJUPnSCPQ39xhqA=;
        b=NOPOCfBsxHnmXM0Y7fXOiKQ64w4cFMqiMZrsy7zvydoVlrdNJw8dkfclczQ0xs6H6+
         Y9+0uVEyffWGx5pSBf6gYbRl/j9CycTmNUVs5nPeqpolxfwOWAdjirmCooiIkPrCjvck
         m096EYf5f+QX8MFddwc4MP5hIftv3MtcoGrTwSmMZhAmX8dizz+HQ5VXZGs6S4ZEhyz8
         aOsu3Mr2BuIHgsg4mmlW5HScOC0tvDKoqAQNJ75LwdykUnwny0dOGEDO2S5d16LmIzwM
         RtiayZCIUaBaePsMMl7kiM7ClOfImZ0YLtBHcM9yh5ODZSH0hCrRmKzWYPTqRjV4HJKn
         F/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748541545; x=1749146345;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oagTvCffXrj++GrVa3nLdl+c84vcOJUPnSCPQ39xhqA=;
        b=kn5kYd3DT+r0+wIR0sjjDAODL6BZ17rcMfq4yLV3rF0w5Jg2MGubaxu4uscjQ3x/oh
         qMd6uGHejbHQJ1PInRO879GX6ohoIYZyx2Pkmj5Q2F7Q+dkvNdnnt4zfC3U9TP4czRze
         sRLeX/dlSx+zRSkhvIxkJr53DcsuCDwTIH53ug7zuKrK83OWsox5LoPivy/uzHYGxNrj
         ZkuyM3N/tJ8yj/NJbG/E4D7r4PKm069NPXlhCNAI/NAwvFDVmowz1X/Ht6jSMVvG6dVB
         jcsBjbDRq5K3+nCKmNiGFb9MuOEnfJ0iWOCQurbn08BhOaFmQoRbsaCp3O+VOVzpo07M
         x08g==
X-Forwarded-Encrypted: i=1; AJvYcCV7ilKYIedNhxr9MQ7M/8Y9nQV8iYv9B6ZJ+tlVasArrkXUNlcHnWNjeLxquOHKceN50Gc3ZBX1cBRb46+lJYiv5w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyD+FXPYNmmXvYZ/Dfv20Fdp/AFJ+sYA0BdYEhVTZYTUWnI8G8H
	d6ViQtl1yFSxT6f8lTpfbhKCPvAdFistQyVbXu9rcsZVoF9SauO6KFoz
X-Gm-Gg: ASbGnctp6l/2VsVMgGYE/ZsClfx33RGdEctIV7NEZD84l0i5sWCAltfP3nmcx7gTtIm
	LumBIzoE2On3eRgNsQnu49WooQscp6ry8Ft6MaATyEXZpdl8JiVRxONWCeWmpeKcENot9lvptCi
	o/MzbBv2sQHWHrMxIgLrfIZBC/LhfGcdRkhHE/nSh1rJYRCXL6KfDeF7q9OYACa5W7PGIA9A0ek
	oGLvugBeduVMDy6OM6jLg44OTfh/PDNWKwUlmKlaMc41md9UkO0Xw6uS2buzgjYtfoUSUyYnduV
	irRLIygCHUtF4fNC3yN8OWKS/UVOI3UrZ1ifm9sIDlpjezKd1qZom1cOPBRAb0oRSc6gFcA30/h
	qJfGpfDjIVaAig1Xe6lAT4E8eR4XTzacMQQSmYFQ=
X-Google-Smtp-Source: AGHT+IFdDUOAiuuVjQGNCjHzHcFl5yR38eigEh/Bx2+ChXfMRSJT7y8/UyiIG96wzXhXXrDL7Z5WnA==
X-Received: by 2002:a05:6a21:164e:b0:215:fb74:2dc2 with SMTP id adf61e73a8af0-21ad95296ddmr900093637.11.1748541545198;
        Thu, 29 May 2025 10:59:05 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:80ca:2bbb:3b17:9c91? ([2601:646:8201:fd20:80ca:2bbb:3b17:9c91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe9629fsm1625214b3a.5.2025.05.29.10.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 10:59:04 -0700 (PDT)
Message-ID: <d8f36286-97a2-4189-82bd-79b66afa9c9e@gmail.com>
Date: Thu, 29 May 2025 10:59:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 05/13] tcf-agent: Fix ranlib call when using
 llvm-ranlib
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
 <20250522-clang-toolchain-v3-5-16cfc6d9891b@gmail.com>
 <a5225b45761850e1a99e7f3c069768f2449fa472.camel@linuxfoundation.org>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <a5225b45761850e1a99e7f3c069768f2449fa472.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 17:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217431



On 5/29/25 2:20 AM, Richard Purdie wrote:
> On Thu, 2025-05-22 at 20:52 -0700, Khem Raj via lists.openembedded.org wrote:
>> This ensures that binutils-ranlib or llvm-ranlib
>> behaves same as gcc-ranlib
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
>> index 235936288ba792c86af4dd1899b2f6585328141f..41706f4b60f1f25233ff91c8f112b8122a5c6c30 100644
>> --- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
>> +++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
>> @@ -51,6 +51,11 @@ CFLAGS:append:riscv64 = " ${LCL_STOP_SERVICES}"
>>   CFLAGS:append:riscv32 = " ${LCL_STOP_SERVICES}"
>>   CFLAGS:append:loongarch64 = " ${LCL_STOP_SERVICES}"
>>   
>> +# This works with gcc-ranlib wrapper only which expands $@ shell array,
>> +# but it will fail if RANLIB was set to <cross>-ranlib or
>> +# <cross>-llvm-ranlib has same behaviour
>> +RANLIB:append:toolchain-clang = " $@"
>> +
>>   do_install() {
>>   	oe_runmake install INSTALLROOT=${D}
>>   	install -d ${D}${sysconfdir}/init.d/
>>
> 
> The people on the patch review calls are struggling to understand the
> issue here. Could you explain this a bit more in the comment so we can
> understand it?
> 
> Does this imply there is a missing piece on the commandline in the
> makefiles (or whatever) of tcf-agent which should really be fixed
> instead?

I can explain it a bit more. tcf-agent calls RANLIB after calling AR to 
create the archive [1], when RANLIB is set to gcc-ranlib this goes 
unnoticed, since calling gcc-ranlib without any arguments it silenlty 
does nothing and exits with return code 0, however, calling ranlib or 
llvm-ranlib does demand library name as commandline option and since it 
is not there it exits with code 1

aarch64-poky-linux-musl-llvm-ranlib
OVERVIEW: LLVM ranlib

Generate an index for archives

USAGE: aarch64-poky-linux-musl-llvm-ranlib archive...

OPTIONS:
   -h --help             - Display available options
   -V --version          - Display the version of this program
   -D                    - Use zero for timestamps and uids/gids (default)
   -U                    - Use actual timestamps and uids/gids
   -X{32|64|32_64|any}   - Specify which archive symbol tables should be 
generated if they do not already exist (AIX OS only)
aarch64-poky-linux-musl-llvm-ranlib: error: an archive name must be 
specified
make: *** [Makefile:53: obj/GNU/Linux/a64/Debug/libtcf.a] Error 1


When we add $@, to RANLIB then it becomes the make variable,
$@ - An automatic Makefile variable that expands to the target name (the 
file being built)


so the makefile target now rightly adds the .a filename to RANLIB call.

tcf-agent seems to add $@ for solaris and osx, I guess someone saw the 
problem on default ranlib on these platforms but not on linux where 
gcc-ar is used commonly.

[1] 
https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/blob/master/agent/Makefile?ref_type=heads#L53

> 
> Cheers,
> 
> Richard


