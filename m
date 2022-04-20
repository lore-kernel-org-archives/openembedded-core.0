Return-Path: <russ.dill@nikolamotor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D07CC64E70
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web08.10078.1650472683903270846
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 09:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nikolamotor-com.20210112.gappssmtp.com header.s=20210112
 header.b=DDgFHa1H;
 spf=pass (domain: nikolamotor.com, ip: 209.85.217.41,
 mailfrom: russ.dill@nikolamotor.com)
Received: by mail-vs1-f41.google.com with SMTP id z139so2103040vsz.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 09:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nikolamotor-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LGnh8khyEDRhvEY1GA/dxjFJ+o6A/XNKidbn45VaYdg=;
        b=DDgFHa1H+o7wavfN/JPn7Sp6EA9zKCGjONSCUFVW4UWbaBXf/AMWaaz6ybobI3tDF/
         b6MrHUEC2H3veol8ODM4TZrg5/akd2N3sdVPGZSR6X31Agh0vM+cGebxuqDdHBc70/9d
         g6p2hnF8k2NoxWnDAN4A+xIO6l/4gRsH6b1MrN4E/Ij+f6DhQ8Ys6qCU5ecSzw5JO9Ae
         g/FQmIr1eSSP3tvVHPxFu8mVGqxnbME7kOR74AQpsvFCuvfHbrXQMGOtLEaYBUanBD4F
         w5amPsFRNvJYp3OE4rtM023r+8Eb3v0JcBLb6rtJYiwAKc6NPOWYS7sx6ABAJPFwSZEu
         Fb/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LGnh8khyEDRhvEY1GA/dxjFJ+o6A/XNKidbn45VaYdg=;
        b=eT3M6RK4Ei0a9UwDVvTM2BJlhqjF3UP6lq9BA0Mh0CH1m1G/N+f2j4rgTrWJ+hdc+C
         TWa6PUSVhIFUu6c0Heff3gfyJaR4OugLWvH7Qsi2u4hPInK13i0lbORYns+CjL26YNy8
         e3mzkvKCBnXvrnJWDR9ntBlznXuTq7eezwe61qIXhioSBmCPT7Z0seMEKWBgezllvCDR
         wcurtHpmZY4My/Ws8S5COeVojcEzPZiS4bHHUD64QSGRmgm4NBu7/q+cHa8xvBm+LDDo
         ZRysojaL928YT1WNgymJLtqVo4ADmjg/mQWCwr09l508EY0o1j3cBelyCO9K2ahBY1vT
         gnlA==
X-Gm-Message-State: AOAM530XBK/+LAUpKkfoDMzoweL94quhLvNwCgXKCCXuhn4jBZELqz2+
	akZYtWx027p8vfz0NdgYrlhDgbNQHZLLshrlxpPXgwjJyiN/XZnqzXdTvGtMgGwZhibyKWlqfMW
	/KWOUDXbDA5RPDI1nuuGkku/gEq3EQCvPpBH7Zqne7zQnaMYQdPM6919riesKL2ns3mPdx46Cxk
	Q7f+r0Gs1FF1+rTItdGrDrAUEgB4coVsXyTW0cIpAhmMtEg+I4p8DKcUSC+AtYCzrCWsdN/XwGV
	xF7G8wEpTCp2go=
X-Google-Smtp-Source: 
 ABdhPJzwL/j2P+3zajpGvu+TiuO+QwQ9/oyoDMlB0F68fTAn8/lBvCaAYZAXFAhHsoj+Epcm8R+hilQ5U0aC5nirWfY=
X-Received: by 2002:a05:6102:3bc1:b0:32a:1f70:a5f9 with SMTP id
 a1-20020a0561023bc100b0032a1f70a5f9mr6747921vsv.85.1650472682526; Wed, 20 Apr
 2022 09:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220420162738.3371938-1-russ.dill@nikolamotor.com>
 <CADkTA4Pi8bwhNe3k6+eVdgrmvCxE9ScVzRKeg_3N02N8SULv8Q@mail.gmail.com>
In-Reply-To: 
 <CADkTA4Pi8bwhNe3k6+eVdgrmvCxE9ScVzRKeg_3N02N8SULv8Q@mail.gmail.com>
From: Russ Dill <russ.dill@nikolamotor.com>
Date: Wed, 20 Apr 2022 09:37:51 -0700
Message-ID: 
 <CA+05MtpPevqVGSt8ZnqQFoGwOFWJ2u9c6ySmhO=xHJ-M0fGzxw@mail.gmail.com>
Subject: Re: [PATCH] kernel-yocto.bbclass: Run do_kernel_configcheck from
 source directory
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
X-CLOUD-SEC-AV-Info: nikolamotor2,google_mail,monitor
X-CLOUD-SEC-AV-Sent: true
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164718

On Wed, Apr 20, 2022 at 9:32 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
>
>
> On Wed, Apr 20, 2022 at 12:28 PM Russ Dill <russ.dill@nikolamotor.com> wrote:
>>
>> do_kernel_configcheck utilizes pathnames relative to the sourcedir
>> but does not specify ${S} in [dirs]. tasks that do not specify
>> [dirs] default to the cwd of the bitbake parent process. This can be
>> seen by inspection of exec_func/exec_func_python of
>> bitbake/lib/bb/build.py or by placing a "print('CWD', os.getcwd())"
>> at the head of do_kernel_configcheck.
>>
>> This is problematic if bitbake is run from a directory that
>> contains a meta/ subdirectory. In this case the code:
>>
>>     kmeta = d.getVar("KMETA") or "meta"
>>     if not os.path.exists(kmeta):
>>         kmeta = subprocess.check_output(['kgit', '--meta'], cwd=d.getVar('S')).decode('utf-8').rstrip()
>>
>> Causes kmeta to be set to just "meta" if a meta directory exists
>> in the cwd of the bitbake parent process, or to the output of
>
>
> That isn't actually a problem, and is the design intent of that check. It allows a temporary/local override of the meta data, simply by creating a 'meta' subdir.
>

It's not working as intended though. While the check for the "meta"
path is done in the cwd of the bitbake parent process, the actual
usage of it is done in ${S}:

    if analysis:
        outfile = "{}/{}/cfg/invalid.txt".format(s,kmeta)

Which leads to:

DEBUG: Executing python function do_kernel_configcheck
ERROR: Error executing a python function in exec_func_python() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:do_kernel_configcheck(d)
     0003:
File: '/home/[USER]/[SRC-PATH]/build/../meta/classes/kernel-yocto.bbclass',
lineno: 591, function: do_kernel_configcheck
     0587:    if analysis:
     0588:        outfile = "{}/{}/cfg/invalid.txt".format(s,kmeta)
     0589:        if os.path.isfile(outfile):
     0590:           os.remove(outfile)
 *** 0591:        with open(outfile, 'w+') as f:
     0592:            f.write( analysis )
     0593:
     0594:        if bsp_check_visibility and os.stat(outfile).st_size > 0:
     0595:            with open (outfile, "r") as myfile:
Exception: FileNotFoundError: [Errno 2] No such file or directory:
'[YOCTO-TMP-PATH]/work/[MACHINE]/[PN]/[PV]/git/meta/cfg/invalid.txt'



>
> Bruce
>
>
>>
>> kgit --meta if it does not.
>>
>> Signed-off-by: Russ Dill <russ.dill@nikolamotor.com>
>> ---
>>  meta/classes/kernel-yocto.bbclass | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
>> index 1d5a8cdf29..c787b2a122 100644
>> --- a/meta/classes/kernel-yocto.bbclass
>> +++ b/meta/classes/kernel-yocto.bbclass
>> @@ -620,6 +620,7 @@ python do_kernel_configcheck() {
>>      if warnings_detected and kmeta_audit_werror:
>>          bb.fatal( "configuration warnings detected, werror is set, promoting to fatal" )
>>  }
>> +do_kernel_configcheck[dirs] = "${S}"
>>
>>  # Ensure that the branches (BSP and meta) are on the locations specified by
>>  # their SRCREV values. If they are NOT on the right commits, the branches
>> --
>> 2.25.1
>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


-- 



Russ Dill

russ.dill@nikolamotor.com

NIKOLA CORPORATION | nikolamotor.com
4141 E Broadway Rd | Phoenix | AZ | 85040



INFORMATION CONTAINED IN THIS E-MAIL TRANSMISSION IS CONFIDENTIAL. IF
YOU ARE NOT THE INTENDED RECIPIENT, DO NOT READ, DISTRIBUTE OR
REPRODUCE THIS TRANSMISSION (INCLUDING ANY ATTACHMENTS). IF YOU HAVE
RECEIVED THIS E-MAIL IN ERROR, PLEASE NOTIFY THE SENDER BY E-MAIL
REPLY AND THEN DELETE THIS E-MAIL.

