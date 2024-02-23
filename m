Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341B5C5478C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 20:33:58 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.5422.1708720435586206169
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 12:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=UAKVfgBt;
 spf=pass (domain: mvista.com, ip: 209.85.210.181, mailfrom: jpuhlman@mvista.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e3ffafa708so1296632b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 12:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1708720434; x=1709325234; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XS3xGUhnibIvvX7vqums7FP08UebNFeHLZBILcNkLdY=;
        b=UAKVfgBtKotGMD43bH8y8r2HXF6vN4gmzgA+1KSHZccmui24UJizPX6K/XFsq2uPmY
         r9cmZndgvPLTDmwsLJWX9I61xxqadPE7az5BQeqMVl8sccKk8yKK8vRmRr8KGVW+Tia4
         KmTYtp+wLEYji2/fGIujmLYWlgu8Fs7vv/DQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708720434; x=1709325234;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XS3xGUhnibIvvX7vqums7FP08UebNFeHLZBILcNkLdY=;
        b=AAQaDYEn15KAXAu8VnVNSPau2imoTWxFMrMktvjJHa4XCH0vZyez4NGbUicaEZ0xwr
         iiecTSDi2eIqUbcaxaxBDlxc5qmkwDBRMmsf0aC2FhOj8sJCF0I85FsJCNrOAr0Aay42
         qrk8OfpAqq59jFPH8adzNEkUv+F39GZjvGn6Kd/SIgVTd1/kjb8eJRTj+6X2w3xWjaIG
         TgeNe1nGGVibCBjmty8TLqzenfcgXBHDAXhCGpcQV7TeSR0C9ap/oFMWOlxUIyinxMB1
         8v5/gaV5labgF5OBHw2f1mh6lAHyhqu12z0hs4T0Tztws3uKFndck6E3CMy+FQ99fA8P
         +JvQ==
X-Gm-Message-State: AOJu0Ywv2rfMSVNaJZakDRYEVaeV3Wj3ZR+ZD01i8xZ55XFVJ81pB0qX
	8oUdJ2qKI6e4XGz6MrDyugruF6Q0FMhQkizLl+k0p+WCLoet1RGbqOFegWWbrfxMx/Yo2h95HR8
	g
X-Google-Smtp-Source: AGHT+IF6LIENUxDZ1K2iHZefuAnCjl86EWWeVEYcz4UUL+Lsr9gqID4zM1IaSX/y4TtR5NFtLV3How==
X-Received: by 2002:a05:6a21:1014:b0:1a0:e4ae:34c2 with SMTP id nk20-20020a056a21101400b001a0e4ae34c2mr944208pzb.50.1708720433852;
        Fri, 23 Feb 2024 12:33:53 -0800 (PST)
Received: from [192.168.1.9] (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id a2-20020aa78642000000b006e34008d0c3sm12557464pfo.100.2024.02.23.12.33.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Feb 2024 12:33:53 -0800 (PST)
Message-ID: <ba284035-ee83-42d0-be21-a6f31532f9cb@mvista.com>
Date: Fri, 23 Feb 2024 12:33:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] package_rpm: Fix backtrace on missing
 directory.
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <17B69806B1DEE2BA.25421@lists.openembedded.org>
From: Jeremy Puhlman <jpuhlman@mvista.com>
In-Reply-To: <17B69806B1DEE2BA.25421@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 20:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196110

It says usr//usr in the comment, but when I ran on a clean build it
started complaining about opt//opt as well. Its not really clear why
it is looking for those directories, and I am sure this is not likely
the correct solution, but I wanted to get it out here so someone who
has kicked this area of code might know what may be happening.

On 2/23/2024 12:30 PM, Jeremy Puhlman via lists.openembedded.org wrote:
> From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
>
> This seems to work around the following issue. The recipe in quesiton
> places all of its content in /opt, and we turn on license collection
> globally. Systemd is turned on so usrmerge is also on. I doubt this
> is the correct way to deal with this as it is not clear why it is
> looking for /usr//usr in the first place. Not sure if its just a
> wierd edge case or what.
>
> File:
> '/build/../layers/poky/meta/classes-global/package_rpm.bbclass',
> lineno: 527, function: write_specfile
>       0523:            spec_scriptlets_bottom.append('')
>       0524:
>       0525:        # Now process files
>       0526:        file_list = []
>   *** 0527:        walk_files(root, file_list, conffiles, dirfiles)
>       0528:        if not file_list and localdata.getVar('ALLOW_EMPTY',
> False) != "1":
>       0529:            bb.note("Not creating empty RPM package for %s" %
> splitname)
>       0530:        else:
>       0531:            spec_files_bottom.append('%%files -n %s' %
> splitname)
> File:
> '/build/../layers/poky/meta/classes-global/package_rpm.bbclass',
> lineno: 249, function: walk_files
>       0245:                    target.append(get_attr(dir) + '%dir "' +
> escape_chars(p) + '"')
>       0246:            else:
>       0247:                # packages own only empty directories or
> explict directory.
>       0248:                # This will prevent the overlapping of
> security permission.
>   *** 0249:                attr = get_attr(path)
>       0250:                if path and not files and not dirs:
>       0251:                    target.append(attr + '%dir "' +
> escape_chars(path) + '"')
>       0252:                elif path and path in dirfiles:
>       0253:                    target.append(attr + '%dir "' +
> escape_chars(path) + '"')
> File:
> '/build/../layers/poky/meta/classes-global/package_rpm.bbclass',
> lineno: 203, function: get_attr
>       0199:        # of the walk, the isdir() test would then fail and
> the walk code would assume its a file
>       0200:        # hence we check for the names in files too.
>       0201:        for rootpath, dirs, files in os.walk(walkpath):
>       0202:            def get_attr(path):
>   *** 0203:                stat_f = os.stat(rootpath + "/" + path,
> follow_symlinks=False)
>       0204:                mode = stat.S_IMODE(stat_f.st_mode)
>       0205:                try:
>       0206:                    owner =
> pwd.getpwuid(stat_f.st_uid).pw_name
>       0207:                except Exception as e:
> Exception: FileNotFoundError: [Errno 2] No such file or directory:
> '/build/tmp/work/corei7-64-montavista-linux/mvtest/2.0/packages-split/mvtest-lic/opt//opt'
>
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>   meta/classes-global/package_rpm.bbclass | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
> index 2e3e4e8c79..a6885ac74e 100644
> --- a/meta/classes-global/package_rpm.bbclass
> +++ b/meta/classes-global/package_rpm.bbclass
> @@ -200,6 +200,8 @@ python write_specfile () {
>           # hence we check for the names in files too.
>           for rootpath, dirs, files in os.walk(walkpath):
>               def get_attr(path):
> +                if not os.path.exists(rootpath + "/" + path):
> +                   return ""
>                   stat_f = os.stat(rootpath + "/" + path, follow_symlinks=False)
>                   mode = stat.S_IMODE(stat_f.st_mode)
>                   try:
> @@ -243,7 +245,7 @@ python write_specfile () {
>                       p = path + '/' + dir
>                       # All packages own the directories their files are in...
>                       target.append(get_attr(dir) + '%dir "' + escape_chars(p) + '"')
> -            elif path:
> +            elif path and os.path.exists(path):
>                   # packages own only empty directories or explict directory.
>                   # This will prevent the overlapping of security permission.
>                   attr = get_attr(path)
> @@ -257,7 +259,7 @@ python write_specfile () {
>                   p = path + '/' + file
>                   if conffiles.count(p):
>                       target.append(attr + '%config "' + escape_chars(p) + '"')
> -                else:
> +                elif attr:
>                       target.append(attr + '"' + escape_chars(p) + '"')
>   
>       # Prevent the prerm/postrm scripts from being run during an upgrade
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196109): https://lists.openembedded.org/g/openembedded-core/message/196109
> Mute This Topic: https://lists.openembedded.org/mt/104536226/2167262
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jpuhlman@mvista.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
Jeremy Puhlman
jpuhlman@mvista.com


