Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6885C54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 22:58:28 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.8533.1708729107123139739
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 14:58:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RFX+MwHd;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: jpuhlman@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d95d67ff45so9162945ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 14:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1708729106; x=1709333906; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4+hESRxa+7YMLWTCUMmF0CxCwSJ00btFYlIyEpHqDSI=;
        b=RFX+MwHdyvhKv+Sr8Wgdivd3wo3QpmWR0vC9y97uZadB/5RpnOQmHj5bU65QI8Ic4N
         vO0cH2sxIoNruj7c/e87fBZD4JJKIwrVXIv9v3DQOpqsTcSm9jcJCX5hN6WH0/jcpex6
         7Px9TLe1DjasyI1f4xWmkEtwAXpdlnGLqmrvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708729106; x=1709333906;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+hESRxa+7YMLWTCUMmF0CxCwSJ00btFYlIyEpHqDSI=;
        b=uFOOwFsJn44w0/EswwQPaxXQFzlFe6Ol//ORuQ+2ZgcTg0l2XCQ6Lp6kqloYBMP8Kc
         UmhENudOMqg4aB1YbER7usT5z/Z9zA7LCpdn7gitCZm5RBk0PzyK5rzLchH8HzJOAbIc
         BbA8Hsz+MRtupo92C/SB74VpwUROnS0Uuz8++olZxLVrB2Oi+rngMaB3jUDIb8PawJHb
         vz4WQaVexns+gtqksf4H5yUAzzxSIPc7cmuV6ksYiV0/dYJtbX3o2KsoB6XnfxzHtUHm
         bDUrpRmO9YLT1Rqkg0UUJneTbKaQ2JA/Z1QwZSuwp6ON/wSt5CzRUFcUiuzgAgx1JU1z
         PXNg==
X-Gm-Message-State: AOJu0YwWXso9Wb/TpcyljmA0e3rUEjHL5+ZfdU+mdSEmWhbM9zJMG+qh
	F3Dz3N8I/9wrmWMio5D2iiTJPo8klb2ouKcRqtQh0afvM6a/tRPsafgjbWYGtaI=
X-Google-Smtp-Source: AGHT+IG+xTJS3mYSU55rKrQlvFmm0VIeHs02uFH/Nb3FGy/Ll4/y1N0EmN+54ZpjEbPi+JjWClaxXA==
X-Received: by 2002:a17:902:d2c5:b0:1dc:524:6da4 with SMTP id n5-20020a170902d2c500b001dc05246da4mr1557691plc.8.1708729106469;
        Fri, 23 Feb 2024 14:58:26 -0800 (PST)
Received: from [10.5.0.2] ([185.187.168.209])
        by smtp.gmail.com with ESMTPSA id o13-20020a170903008d00b001db40866e09sm12132747pld.260.2024.02.23.14.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Feb 2024 14:58:25 -0800 (PST)
Message-ID: <54ac6f59-e88e-4226-8c4c-ea2928cfa829@mvista.com>
Date: Fri, 23 Feb 2024 14:58:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] package_rpm: Fix backtrace on missing
 directory.
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240223203051.1575654-1-jpuhlman@mvista.com>
 <CANNYZj8JykJuL+Q4hsM_xut_=7E45Bbt-W6NEQZRPP6R_HfSCQ@mail.gmail.com>
From: Jeremy Puhlman <jpuhlman@mvista.com>
In-Reply-To: <CANNYZj8JykJuL+Q4hsM_xut_=7E45Bbt-W6NEQZRPP6R_HfSCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 22:58:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196117



On 2/23/2024 1:20 PM, Alexander Kanavin wrote:
> Somewhere in the overall function the paths aren't formed correctly,
> but this patch is very much not a correct fix either, and should be
> marked as such.
Is there a preferred way to do that? I mention in the commit message 
that is not
the right way to handle it and followed up with a reply to the patch 
mentioning
as such.

>   If you can provide a minimal reproducer recipe, that
> would help; I can't say what is wrong otherwise.
I will try and reduce it down later this evening, but the recipe in 
question is here:
https://github.com/MontaVista-OpenSourceTechnology/meta-qa/blob/master/meta-qa-framework/recipes-qatest/mvtest/mvtest_2.0.bb
Using stock poky/meta-oe/meta-python and that repo causes the issue with 
mvtest.

The recipe is fairly basic, nothing really crazy, which is what is 
baffling about the error.
>
> You might want to insert debugging statements to see where opt//opt
> formation is happening.
Tried poking at  that for a while and really didn't make much progress 
before I got
pulled off to something else.

>
> Alex
>
> On Fri, 23 Feb 2024 at 21:31, Jeremy Puhlman via
> lists.openembedded.org <jpuhlman=mvista.com@lists.openembedded.org>
> wrote:
>> From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
>>
>> This seems to work around the following issue. The recipe in quesiton
>> places all of its content in /opt, and we turn on license collection
>> globally. Systemd is turned on so usrmerge is also on. I doubt this
>> is the correct way to deal with this as it is not clear why it is
>> looking for /usr//usr in the first place. Not sure if its just a
>> wierd edge case or what.
>>
>> File:
>> '/build/../layers/poky/meta/classes-global/package_rpm.bbclass',
>> lineno: 527, function: write_specfile
>>       0523:            spec_scriptlets_bottom.append('')
>>       0524:
>>       0525:        # Now process files
>>       0526:        file_list = []
>>   *** 0527:        walk_files(root, file_list, conffiles, dirfiles)
>>       0528:        if not file_list and localdata.getVar('ALLOW_EMPTY',
>> False) != "1":
>>       0529:            bb.note("Not creating empty RPM package for %s" %
>> splitname)
>>       0530:        else:
>>       0531:            spec_files_bottom.append('%%files -n %s' %
>> splitname)
>> File:
>> '/build/../layers/poky/meta/classes-global/package_rpm.bbclass',
>> lineno: 249, function: walk_files
>>       0245:                    target.append(get_attr(dir) + '%dir "' +
>> escape_chars(p) + '"')
>>       0246:            else:
>>       0247:                # packages own only empty directories or
>> explict directory.
>>       0248:                # This will prevent the overlapping of
>> security permission.
>>   *** 0249:                attr = get_attr(path)
>>       0250:                if path and not files and not dirs:
>>       0251:                    target.append(attr + '%dir "' +
>> escape_chars(path) + '"')
>>       0252:                elif path and path in dirfiles:
>>       0253:                    target.append(attr + '%dir "' +
>> escape_chars(path) + '"')
>> File:
>> '/build/../layers/poky/meta/classes-global/package_rpm.bbclass',
>> lineno: 203, function: get_attr
>>       0199:        # of the walk, the isdir() test would then fail and
>> the walk code would assume its a file
>>       0200:        # hence we check for the names in files too.
>>       0201:        for rootpath, dirs, files in os.walk(walkpath):
>>       0202:            def get_attr(path):
>>   *** 0203:                stat_f = os.stat(rootpath + "/" + path,
>> follow_symlinks=False)
>>       0204:                mode = stat.S_IMODE(stat_f.st_mode)
>>       0205:                try:
>>       0206:                    owner =
>> pwd.getpwuid(stat_f.st_uid).pw_name
>>       0207:                except Exception as e:
>> Exception: FileNotFoundError: [Errno 2] No such file or directory:
>> '/build/tmp/work/corei7-64-montavista-linux/mvtest/2.0/packages-split/mvtest-lic/opt//opt'
>>
>> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
>> ---
>>   meta/classes-global/package_rpm.bbclass | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
>> index 2e3e4e8c79..a6885ac74e 100644
>> --- a/meta/classes-global/package_rpm.bbclass
>> +++ b/meta/classes-global/package_rpm.bbclass
>> @@ -200,6 +200,8 @@ python write_specfile () {
>>           # hence we check for the names in files too.
>>           for rootpath, dirs, files in os.walk(walkpath):
>>               def get_attr(path):
>> +                if not os.path.exists(rootpath + "/" + path):
>> +                   return ""
>>                   stat_f = os.stat(rootpath + "/" + path, follow_symlinks=False)
>>                   mode = stat.S_IMODE(stat_f.st_mode)
>>                   try:
>> @@ -243,7 +245,7 @@ python write_specfile () {
>>                       p = path + '/' + dir
>>                       # All packages own the directories their files are in...
>>                       target.append(get_attr(dir) + '%dir "' + escape_chars(p) + '"')
>> -            elif path:
>> +            elif path and os.path.exists(path):
>>                   # packages own only empty directories or explict directory.
>>                   # This will prevent the overlapping of security permission.
>>                   attr = get_attr(path)
>> @@ -257,7 +259,7 @@ python write_specfile () {
>>                   p = path + '/' + file
>>                   if conffiles.count(p):
>>                       target.append(attr + '%config "' + escape_chars(p) + '"')
>> -                else:
>> +                elif attr:
>>                       target.append(attr + '"' + escape_chars(p) + '"')
>>
>>       # Prevent the prerm/postrm scripts from being run during an upgrade
>> --
>> 2.31.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#196109): https://lists.openembedded.org/g/openembedded-core/message/196109
>> Mute This Topic: https://lists.openembedded.org/mt/104536226/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Jeremy Puhlman
jpuhlman@mvista.com


