Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C0AC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 14:49:29 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.11498.1646318968301712852
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 06:49:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=NdE+mfjt;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.50,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f50.google.com with SMTP id p15so11169317ejc.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 06:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UA9RfjpXv+4ybaNN6QL61NXKlULvmRvMVyGMsnc8l/c=;
        b=NdE+mfjt3rm4Bl3mmVfNeuOFPOqRjWx0FDzzJudd1kO2qpvxtkSUqtQ0XoJiTu25cN
         rq4s13J5SCB7Qa9ZqmBgGJNav16FN7qY7+jd3/SZ5Rh01n5qXpRJbRnoS4PSsTqlKXj6
         VfGnUClDMOa+DAnShHp/zedKHMmk3laHPfuw7w/BbOHTLYXiS6huCB7bWStMEwPopYtA
         z8c+ILE+SBWEqhjOGRRDr6wrwt8egQGVsUWRY1DYi+d1UpTwlSefzXXur7dHgPOETnMl
         4cw9kiJ4qjgN3p8IQKdkJHyKkfuruDllb4PZ1UqX18IK1JkWTt5JepN7/wiRvwtS7CKt
         +gkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UA9RfjpXv+4ybaNN6QL61NXKlULvmRvMVyGMsnc8l/c=;
        b=p5Ahr6UzfpY9QdII5ZBos2T/XQypCkT2cblx2PHkgJCYbgI0r1u8mb0LYbnjMEJLSD
         8Q80lq4QQCtxdsHWP8gzqLE2d5me3TKGojtXiTFy0Ipy3aAcmnQdxclawpWDMeNGYmlM
         D5OD39HVOq2UUKCc9P/46vrJuqdGvnIw5qu6UQ2foAsEK2QB9haVZ2XxWqK4H1PeHb0b
         y6tQSZHF7Ck/R/n0jWtkgiyVeg9QkMvTXNYMowj4oB4t027uAgWWO3K8Vc9jlSRa/7tL
         8xDMxzoYjtLm5BBc61TbZYe17VK7BBxHoLIoQDnwE9+PM7FP36sRA2/HaUwlaZKvw0r5
         6OTw==
X-Gm-Message-State: AOAM530IyHQu1HFO1WOvq39OeADNzBAjiKEdVwaXUOLG0H9cULVYYsGk
	3LuhNavSJAQtwLJOisO+hs8U2mj83Xg0M+G/BXn24A==
X-Google-Smtp-Source: 
 ABdhPJwiXQaXTVVSBvptOJFtYxiZlZzSC7V+2HVfObQG45E8KUocPmRbziTxh1zDQ6u826AqokvW7fjyBYV0RQHJqck=
X-Received: by 2002:a17:907:7e81:b0:6da:6950:897 with SMTP id
 qb1-20020a1709077e8100b006da69500897mr6035329ejc.602.1646318966580; Thu, 03
 Mar 2022 06:49:26 -0800 (PST)
MIME-Version: 1.0
References: <16D869D532B5A22D.25756@lists.openembedded.org>
 <CANPvuRk2wx+yXfviZADt8AoF-zR+H89Spj8NcQzAgsFL2LLCfQ@mail.gmail.com>
In-Reply-To: 
 <CANPvuRk2wx+yXfviZADt8AoF-zR+H89Spj8NcQzAgsFL2LLCfQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 3 Mar 2022 04:49:15 -1000
Message-ID: 
 <CAOSpxdYz=saGTeRm48L+C_RgB51eOdQC6GgAo3j5ZrifWPuXYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] buildhistory.bbclass: create the
 buildhistory directory when needed
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 14:49:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162657

On Wed, Mar 2, 2022 at 2:07 PM Jose Quaresma <quaresma.jose@gmail.com> wrot=
e:
>
> Can this patch be backported to dunfell?

I've added it to my test queue.

Steve

>
> Jose
>
> Jose Quaresma via lists.openembedded.org <quaresma.jose=3Dgmail.com@lists=
.openembedded.org> escreveu no dia quarta, 2/03/2022 =C3=A0(s) 00:47:
>>
>> When the BUILDHISTORY_RESET is enabled we need to move the
>> content from BUILDHISTORY_DIR to BUILDHISTORY_OLD_DIR but
>> when we start a clean build in the first run we don't have the
>> BUILDHISTORY_DIR so the move of files will fail.
>>
>> | ERROR: Command execution failed: Traceback (most recent call last):
>> |  File "/xxx/poky/bitbake/lib/bb/command.py", line 110, in runAsyncComm=
and
>> |    commandmethod(self.cmds_async, self, options)
>> |  File "/xxx/poky/bitbake/lib/bb/command.py", line 564, in buildTargets
>> |    command.cooker.buildTargets(pkgs_to_build, task)
>> |  File "/xxx/poky/bitbake/lib/bb/cooker.py", line 1481, in buildTargets
>> |    bb.event.fire(bb.event.BuildStarted(buildname, ntargets), self.data=
builder.mcdata[mc])
>> |  File "/xxx/home/builder/src/base/poky/bitbake/lib/bb/event.py", line =
214, in fire
>> |    fire_class_handlers(event, d)
>> |  File "/xxx/poky/bitbake/lib/bb/event.py", line 121, in fire_class_han=
dlers
>> |    execute_handler(name, handler, event, d)
>> |  File "/xxx/poky/bitbake/lib/bb/event.py", line 93, in execute_handler
>> |    ret =3D handler(event)
>> |  File "/xxx/poky/meta/classes/buildhistory.bbclass", line 919, in buil=
dhistory_eventhandler
>> |    entries =3D [ x for x in os.listdir(rootdir) if not x.startswith('.=
') ]
>> | FileNotFoundError: [Errno 2] No such file or directory: '/xxx/buildhis=
tory'
>>
>> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>> ---
>>  V2: remove the check to see if the directory exists
>>
>>  meta/classes/buildhistory.bbclass | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhisto=
ry.bbclass
>> index 49797a6701..8db79a4829 100644
>> --- a/meta/classes/buildhistory.bbclass
>> +++ b/meta/classes/buildhistory.bbclass
>> @@ -896,6 +896,7 @@ python buildhistory_eventhandler() {
>>                  if os.path.isdir(olddir):
>>                      shutil.rmtree(olddir)
>>                  rootdir =3D e.data.getVar("BUILDHISTORY_DIR")
>> +                bb.utils.mkdirhier(rootdir)
>>                  entries =3D [ x for x in os.listdir(rootdir) if not x.s=
tartswith('.') ]
>>                  bb.utils.mkdirhier(olddir)
>>                  for entry in entries:
>> --
>> 2.35.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#162587): https://lists.openembedded.org/g/openembedd=
ed-core/message/162587
>> Mute This Topic: https://lists.openembedded.org/mt/89491842/5052612
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [q=
uaresma.jose@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma

