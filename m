Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AD5C25B79
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 08:13:59 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.11043.1716538413876533982
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 01:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UyWJm686;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e716e302bdso66877511fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 01:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716538412; x=1717143212; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=//b5KILcAsck+FszHaB9b/dYVvxOm8fex2Pk79AJGSg=;
        b=UyWJm686Nws8Lee75bMK166MBtU/0yF66Do9V6uf5LMUm15s1k5q+OhTAPCrLffLma
         Uq5zh+1b9Nh6GMNqNYJBa2ZCZl+nMhS7Mm84sMbDYsACzO2/52hSjB922Gt+ZNBzyaFb
         Po+wwiEI33vqpEiZRgwO97s3pHPCtkSy7stX/RSD+TE+3BItX1VUiXU5mzn158H/86RT
         5XrU/keBL75Cvvi5ckgY8Anp1yI0gs93Dg/zt/PTu+PhMYIyc19XOSeCByeDDscN1CJx
         8/V9fsgx5+jWMct+kj4gBS/k94977RgP/qxJX0XHkc1u8mlhd5lbrZg46uXqkEfkb3lM
         IPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716538412; x=1717143212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//b5KILcAsck+FszHaB9b/dYVvxOm8fex2Pk79AJGSg=;
        b=mcZoX60ACTwLJ+Sw0YenJ536c0T4FsWRaVAsP90wzRGFGw5L+et2h++QXiQ6xacLDs
         qRN1W6H35GCkj5+EPTv04e9KD5v2RaPZagm1Pi3VHVl3iJUlnJlqnv9CBROfX65dp9ol
         bpUbw80qGVB5GC2tiwAEUYZ0BdyZxtE1LbY5AwZSHmrPBAfraXDM2Bshy3M8/zUu2gOo
         7KLz+xBuRVqMkPwy+q/tfBXGKWXMiSm7/m3Q/U3v1uT7YfSOiv2Elw9HnztSnA941MWR
         rJC/WT8ceM7vY0+AZNkbhZyDOlXQU8ycYenQxbmpzRUUCq+XJtYbQb8WHwpI3pvQNTz0
         s22w==
X-Gm-Message-State: AOJu0YwhOZ8UGKEevlynvFDV+RpB+W/dax09Npkb31PGAzZfbk/5I9tb
	ctSR+rh+N4RbJaVUDz6EndPMaoeb9GQfn4rn52HD4pe/apwdLHG68Mxoj7rc37c327IQFK5gBEB
	SeZT2VCH4K8M516WGuq6ahokGLwI=
X-Google-Smtp-Source: AGHT+IFQw1rNuanFc5ORy+T7HxqwaZStdgCK/JRmghuov0QWqFD52VTq99RijyDioci7h8+2MTLbO0no89cndEFXFLc=
X-Received: by 2002:a2e:3519:0:b0:2e6:f5f5:f6e with SMTP id
 38308e7fff4ca-2e95b04164emr8434431fa.9.1716538411800; Fri, 24 May 2024
 01:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <30216.1716477852755796076@lists.openembedded.org> <Groupsio.1.30216.1716477852755796076@lists.openembedded.org>
In-Reply-To: <Groupsio.1.30216.1716477852755796076@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 May 2024 10:13:19 +0200
Message-ID: <CANNYZj-LvZ6akEmDgfGGLCf6xdy_0k1rb=Z428gJVr35Xg6u+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] buildhistory: Fix do_package race issues
To: pmi183@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 08:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199833

Hello Pedro,

is it possible to separate all needed changes into a set of nice,
small, simple, easy to review commits? That would go a long way
towards fixing all issues. I don't have a hard opinion on the best way
to fix this, I just want to ensure there are no mysteries in what is
happening, and the fixing isn't in the form of gigantic, invasive,
single commit. If you need to move code *and* change what it does,
move in one commit, change in another, for example.

buildhistory is an old class, has been worked on by many people over
the years, and the original author (Paul Eggleton) isn't involved in
yocto any longer unfortunately. So the fixes may have been done to
resolve 'pressing problems' rather than with long term quality of the
code in mind.

Also note there are selftests for it:
alex@Zen2:/srv/storage/alex/yocto/build-64-alt$ oe-selftest -l|grep -i
buildhistory
2024-05-24 10:06:56,818 - oe-selftest - INFO -
buildoptions.BuildhistoryTests.test_buildhistory_basic
2024-05-24 10:06:56,818 - oe-selftest - INFO -
buildoptions.BuildhistoryTests.test_buildhistory_buildtime_pr_backwards
2024-05-24 10:06:56,818 - oe-selftest - INFO -
buildoptions.BuildhistoryTests.test_fileinfo
2024-05-24 10:06:56,830 - oe-selftest - INFO -
oelib.buildhistory.TestBlobParsing.test_blob_to_dict
2024-05-24 10:06:56,830 - oe-selftest - INFO -
oelib.buildhistory.TestBlobParsing.test_compare_dict_blobs
2024-05-24 10:06:56,830 - oe-selftest - INFO -
oelib.buildhistory.TestBlobParsing.test_compare_dict_blobs_default
2024-05-24 10:06:56,831 - oe-selftest - INFO -
oelib.buildhistory.TestFileListCompare.test_compare_file_lists
2024-05-24 10:06:56,832 - oe-selftest - INFO -
oescripts.BuildhistoryDiffTests.test_buildhistory_diff

So if you make sure they continue to pass, that'd be good. If you can
add to them, that's better.


Alex



On Thu, 23 May 2024 at 17:24, pmi183 via lists.openembedded.org
<pmi183=gmail.com@lists.openembedded.org> wrote:
>
> [Edited Message Follows]
>
> Hi Alex,
>
> So problem starts at sstate.bbclass:406 (sstate_install(ss, d)), this should be running after the next for loop (for plain in ss['plaindirs']:).
>
> Having this fixed, jumping to the buildhistory.bbclass:602, find should be out of the loop to give a hard error if it misses.
> Then inside the for loop, while checking if output folder exists (buildhistory.bbclass:607), this doesnt make sense to me the way it is running:
>  - the comment refers "Make sure the output folder exists...", but we are not creating it if we need, just skipping if doesnt exists.
>  - this folder is being created on do_packagedata (buildhistory.bbclass:396) to write down latest file.
>
> So before spending more time on this topic i have a few questions to understand a little bit of what should be the strategy to fix this:
>
> - If we want to keep files-in-package.txt being created on do_package, shouldnt `buildhistory_list_pkg_files()` (buildhistory.bbclass:600) be responsible to create the folder on buildhistory side?
> - If we keep `buildhistory_list_pkg_files` being triggered by do_package is there any case of do_package_setscene trigger this? I couldnt find any case to support this option (buildhistory.bbclass:101).
> - If not we dont need in fact to create files-in-package.txt on do_package, should files-in-package.txt creation be moved to do_packagedata?
>
> Thanks,
>
> Pedro
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199810): https://lists.openembedded.org/g/openembedded-core/message/199810
> Mute This Topic: https://lists.openembedded.org/mt/87258776/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

