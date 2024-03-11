Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B66C54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 09:30:49 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.58404.1710149446522351608
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 02:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jcghk0O0;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: zboszor@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7c8b8618457so2814539f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 02:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710149445; x=1710754245; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kdFvIkWNPKMOBj64e4MavuHq4v8bUgNhu8+8pEx00wk=;
        b=Jcghk0O0MnhbdVH+7qv3JABSQQSZmWoU8ApydF23+Y8SBD6nFcYK5zhvn2XkCBmKBm
         rcRhuI71FAaFT+meABXLn+b7FIqC/KutawwXAVLu5WxYG3DJuVIsYxIv3sEZjlf07vSa
         3ZC9khrZd+odVuhLmzNAKFB2saumxYQhzTMYAejVrv7vefRWu+doOz/OSsnE/iYTC1FB
         Ooet/PnsZc7hq8ZD/x3k7e7ROHXrKenyie2IS2av7ojJnebZ4L0Sd+qBnP9XFht8SYIK
         bJDau/1iabf7s8EngjN6igZX4vG4hIxHf3tiKUp9rewZqxy3uCsn+oQouZjFkkc/WdON
         mRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710149445; x=1710754245;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kdFvIkWNPKMOBj64e4MavuHq4v8bUgNhu8+8pEx00wk=;
        b=ioQpEB79HJYuGpkEHrcEQ/UtEGfRvWA6YSGlJJgowKBubDQfmufU6L7YD9Vt+7HMgn
         rufaBS+rITorrnsHT8V87dHbNw5kVZTXPfNjguh5kBFVsNJSv5fsgb9qb6Z4tRkJ9cGZ
         p7IcW+P36N7elsATjnX/vf7/RJMEyyz+p+DwVLAwf24nbpy1jv44kMZAHq1FjE+S9FvO
         EJeREVItXNIrUV8DLeBSfQADjfgTnXYXbXMR11CNPuL9yk4xKPPyoA8n5kLSAdI2QHra
         xAdrKDVOK6CWlvvLEo+onDJrUFYRUML4R8ZYr8cjCl2S3wTvW3drVHNP/OwSorU1/h9I
         YcmQ==
X-Gm-Message-State: AOJu0YzMjQtMoqUAkhnIpQDhq9sMcmGp++i6tw9bMHA6gswnoThLqHtA
	lDyl3nSUPxKkVKnJp5kVGN5VMmesbLLzWfyixzrkkfJts8AJn/7b
X-Google-Smtp-Source: AGHT+IEnWGfMTOSw2KSTTsvHP6OlDBuRlEeTypH1IXDjl7ZzdyeCqhjwQ35YzZa0tM+qmccw0YwAqw==
X-Received: by 2002:a05:6602:1248:b0:7c8:b59a:8dd with SMTP id o8-20020a056602124800b007c8b59a08ddmr3287948iou.13.1710149445537;
        Mon, 11 Mar 2024 02:30:45 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id cw7-20020a05663849c700b004750097315csm1628895jab.16.2024.03.11.02.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 02:30:45 -0700 (PDT)
Message-ID: <a70cbc1e-f234-45ba-a886-51461f2e8689@gmail.com>
Date: Mon, 11 Mar 2024 10:30:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Yocto rpm packages do not keep the modified CONFFILES
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <0e38566f-a1f9-4ebb-8492-2c50945eeeb4@gmail.com>
 <CANNYZj96nE0kVyLW=DnrzwfN9UROZ1AzUG5kJ7Y6W2eF2tqAvQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj96nE0kVyLW=DnrzwfN9UROZ1AzUG5kJ7Y6W2eF2tqAvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 09:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196929

2024. 03. 09. 17:39 keltezéssel, Alexander Kanavin írta:
> I think (noreplace) flag only matters when the file has been manually
> edited after rpm installation and its checksum diverges from what is
> registered in rpm database. Which is not a common scenario in
> embedded.

So from Yocto's POV it's the same either way, right?

>   If you manually edit the file on target, you might as well
> manually resolve which version you want after the update as both are
> available regardless of whether (noreplace) was used or not. Or
> perhaps merge the manual edits into the new version.

The interesting use case here is that the configuration file
in question is generated on the machine using a GUI,
while a minimal stock version of the file is shipped by the package.

>
> Alex
>
> On Fri, 8 Mar 2024 at 12:20, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>> Hi,
>>
>> I just found out that if an updated package ships a modified
>> configuration file, then the Yocto package upgrade does this:
>>
>> * rename the edited conffile to conffile.rpmsave
>> * install the new, modified one from the package
>>
>> instead of:
>>
>> * keep the edited conffile intact
>> * install the new, modified one from the package as conffile.rpmnew
>>
>> I think this is what was asked in 2017 here:
>> https://docs.yoctoproject.org/pipermail/yocto/2017-May/036031.html
>>
>> The answer was a little uninformed about saying that using
>> CONFFILES is the fix, because rpm can behave two ways, see above.
>>
>> Yocto, to this day, uses "%config /path/to/conffile" instead of
>> "%config(noreplace) /path/to/conffile" in package_rpm.bbclass.
>> The latter would behave as "keep modified conffile + install conffile.rpmnew".
>>
>> What's the official stance on this behaviour?
>> Is it a known issue?
>> Is this what the project would expect from a package upgrade?
>>
>> FWIW, this one liner would change the behaviour:
>>
>> diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
>> index 2e3e4e8c79..6610115849 100644
>> --- a/meta/classes-global/package_rpm.bbclass
>> +++ b/meta/classes-global/package_rpm.bbclass
>> @@ -256,7 +256,7 @@ python write_specfile () {
>>                    attr = get_attr(file)
>>                    p = path + '/' + file
>>                    if conffiles.count(p):
>> -                    target.append(attr + '%config "' + escape_chars(p) + '"')
>> +                    target.append(attr + '%config(noreplace) "' + escape_chars(p) + '"')
>>                    else:
>>                        target.append(attr + '"' + escape_chars(p) + '"')
>>
>>
>> Maybe it's better to make it conditional on a different variable:
>>
>> CONFFILES_MODE = "keepold"
>> vs
>> CONFFILES_MODE = "installnew"
>>
>> and the patch would be something like this below (untested),
>> keeping the current behaviour as default:
>>
>> diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
>> index 2e3e4e8c79..f0651d69ba 100644
>> --- a/meta/classes-global/package_rpm.bbclass
>> +++ b/meta/classes-global/package_rpm.bbclass
>> @@ -191,7 +191,7 @@ python write_specfile () {
>>                    if not len(depends_dict[dep]):
>>                        array.append("%s: %s" % (tag, dep))
>>
>> -    def walk_files(walkpath, target, conffiles, dirfiles):
>> +    def walk_files(d, walkpath, target, conffiles, dirfiles):
>>            # We can race against the ipk/deb backends which create CONTROL or DEBIAN
>> directories
>>            # when packaging. We just ignore these files which are created in
>>            # packages-split/ and not package/
>> @@ -250,13 +250,19 @@ python write_specfile () {
>>                    if (not files and not dirs) or path in dirfiles:
>>                        target.append(attr + '%dir "' + escape_chars(path) + '"')
>>
>> +            conffiles_mode = d.getVar("CONFFILES_MODE") or "installnew"
>> +            if conffiles_mode != "installnew" and conffiles_mode != "keepold":
>> +                conffiles_mode = "installnew"
>>                for file in files:
>>                    if file == "CONTROL" or file == "DEBIAN":
>>                        continue
>>                    attr = get_attr(file)
>>                    p = path + '/' + file
>>                    if conffiles.count(p):
>> -                    target.append(attr + '%config "' + escape_chars(p) + '"')
>> +                    if conffiles_mode == "keepold":
>> +                        target.append(attr + '%config(noreplace) "' + escape_chars(p) + '"')
>> +                    else:
>> +                        target.append(attr + '%config "' + escape_chars(p) + '"')
>>                    else:
>>                        target.append(attr + '"' + escape_chars(p) + '"')
>>
>> @@ -430,7 +436,7 @@ python write_specfile () {
>>                srcrpostrm     = splitrpostrm
>>
>>                file_list = []
>> -            walk_files(root, file_list, conffiles, dirfiles)
>> +            walk_files(localdata, root, file_list, conffiles, dirfiles)
>>                if not file_list and localdata.getVar('ALLOW_EMPTY', False) != "1":
>>                    bb.note("Not creating empty RPM package for %s" % splitname)
>>                else:
>> @@ -522,7 +528,7 @@ python write_specfile () {
>>
>>            # Now process files
>>            file_list = []
>> -        walk_files(root, file_list, conffiles, dirfiles)
>> +        walk_files(localdata, root, file_list, conffiles, dirfiles)
>>            if not file_list and localdata.getVar('ALLOW_EMPTY', False) != "1":
>>                bb.note("Not creating empty RPM package for %s" % splitname)
>>            else:
>>
>> Best regards,
>> Zoltán Böszörményi
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#196869): https://lists.openembedded.org/g/openembedded-core/message/196869
>> Mute This Topic: https://lists.openembedded.org/mt/104806483/3617728
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


