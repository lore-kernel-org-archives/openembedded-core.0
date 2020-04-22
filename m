Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.406.1587577171984338362
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 10:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RxbsOSDp;
 spf=pass (domain: konsulko.com, ip: 209.85.221.66, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f66.google.com with SMTP id i10so3459048wrv.10
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 10:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=vRVr9XfWIsyx8H/1IHGH9vx5dMi6Y6AKgK5kZ59myRc=;
        b=RxbsOSDpsVP8Kj4uVWeQO5uUv7AIBzjkwgzX0xhnLWQE83cMlTmSX3THRr623nbRA5
         7q6YLSFHFZVXtmNqS0InOFuUWymIagHjpcdJpA8NR/zatRbNpxeXZa3a3yArTy4yA3qn
         ByxQpxh+JD6QiydIB2yP+8cIoQtOb0nyAJtcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=vRVr9XfWIsyx8H/1IHGH9vx5dMi6Y6AKgK5kZ59myRc=;
        b=Ap9ScNv+h5t2g8+rRMJV0PEYg8VYcx9TCuopg19PtenwVPPXEGYy+zqyCZ8LgY8L0f
         P7PYvzwwQ7VRPrbSUEY/2GIXEFHOx0G4ja8/b7hWP6D6hjr5AobOkqcgcxAMMmj3qwgb
         L+fcolObXzfKObmyCrlbm/jp1QRayCsX9LuIi2cKUZgR70sGKfpz5hgJK96Qw6DdnlXZ
         +ZNdWOlH9wFFJDIqloohB/PkqMMGtr0+qqQtH6BvydcY7uxmo8ygA6mepc8CQ/5GZdzl
         J/IDGHWJjtYfIYZX3ZWvR+wKRJ4OZ/pBkrM1QG60MWZwrYqy8eYbA8jAESrGSTkeldfR
         dArg==
X-Gm-Message-State: AGi0PuZB38+woYKGbtVqhiIhWjyQGUJM+DNi+A6LxEBu+aiFKVtU3blx
	fLtOPe6Qx2wnLy3byeb6zCr2Ig==
X-Google-Smtp-Source: APiQypLyzs1xBuCGr1qWC97O84Vc6rwgmq4p9fDnmeUfC+8LG8qaP2/p84u7JhnEpRPtfm/7/nuxNA==
X-Received: by 2002:a5d:408d:: with SMTP id o13mr144197wrp.249.1587577170465;
        Wed, 22 Apr 2020 10:39:30 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ub1910 ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id r20sm8344841wmh.26.2020.04.22.10.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 10:39:30 -0700 (PDT)
Date: Wed, 22 Apr 2020 18:39:23 +0100
From: "Paul Barker" <pbarker@konsulko.com>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v7 00/10] Fix permissions and embed-rotofs
Message-ID: <20200422183923.07fccbf1@ub1910>
In-Reply-To: <20200419063539.1467641-1-ricardo@ribalda.com>
References: <20200419063539.1467641-1-ricardo@ribalda.com>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 19 Apr 2020 08:35:28 +0200
Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:

> Today wic behaves differently if we run it from bitbake of directly from the
> commandline.
> 
> When it is run from bitbake, the permissions/usersnames are handled by the
> pseudo database of the main image.
> 
> When it is run from the comandline ,it is run outside the main image database.
> 
> This results on permissions/usernames not working ok on some usecases on both
> bitbake and wic.
> 
> 
> This is an attempt to fix all the permission bugs that I am aware from wic.
> Using the following usecases:
> 
> 
> #exclude-path
> part / --source rootfs --fstype=ext4 --exclude-path=home
> 
> #split_partition
> part / --source rootfs --ondisk sda --fstype=ext4 --exclude-path=etc/
> part /etc --source rootfs --rootfs-dir=tmp/work/qt5222-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/ --fstype=ext4
> 
> #multi_partition
> part / --source rootfs --ondisk sda --fstype=ext4
> part /export --source rootfs --rootfs=core-image-minimal-mtdutils --fstype=ext4
> 
> 
> With the current master:
> -------------------------
> #exclude-path
> From Bitbake: OK
> wic cmdline: FAIL
> 
> #split_partition
> From Bitbake: OK
> wic cmdline: FAIL, permissions invalid on both partitions
> 
> #multi_partition
> From Bitbake: FAIL second partition
> wic cmdline: OK
> 
> 
> After:  wic: Fix permissions when using exclude or include path
> --------------------------------------------------------------------
> #exclude-path
> From Bitbake: OK
> wic cmdline: OK
> 
> #split_partition
> From Bitbake: OK
> wic cmdline: FAIL, permissions invalid on second partition
> 
> #multi_partition
> From Bitbake: FAIL second partition
> wic cmdline: OK
> 
> 
> After: wic: Fix multi images .wks with bitbake
> ----------------------------------------------
> #exclude-path
> From Bitbake: OK
> wic cmdline: OK
> 
> #split_partition
> From Bitbake: FAIL, permissions invalid on second partition
> wic cmdline: FAIL, permissions invalid on second partition
> 
> #multi_partition
> From Bitbake: OK
> wic cmdline: OK
> 
> 
> 
> After: wic: Add --change-directory argument
> --------------------------------------------
> 
> we can have a .wks like:
> part / --source rootfs --ondisk sda --fstype=ext4 --exclude-path=etc/
> part /etc --source rootfs --fstype=ext4 --change-directory=etc
> 
> 
> Wich works fine from bitbake and from cmdline, and has the same functionality as
> split_partition.
> 
> 
> Changelog v6->v7 (Thanks Paul):
>   - Use passwd instead of shadow for oetests
>   - For pseudo folder inside workdir
>   - Improve comments on tar
>   - Use line number on tar name
>   - Allow include-files of files in workdir
> 
> Changelog v5->v6:
>   - Allow two arguments to include-path
>   - Fix permission on include-path
>   - exec_native with ASSUME_PROVIDED
>   - More unittesting
> 
> Changelog v4->v5:
>   - Add unittesting
>   - wic: Avoid creating invalid pseudo directory
> 
> Ricardo Ribalda Delgado (10):
>   wic: Fix permissions when using exclude or include path
>   wic: Fix multi images .wks with bitbake
>   wic: Add --change-directory argument
>   wic: Continue if excluded_path does not exist
>   wic: Avoid creating invalid pseudo directory
>   oeqa: wic: Add tests for permissions and change-directory
>   wic: misc: Do not find for executables in ALREADY_PROVIDED
>   wic: root: Add an opt. destination on include-path
>   wic: rootfs: Combine path_validation in one function
>   oeqa: wic: Add more tests for include_path
> 
>  meta/classes/image_types_wic.bbclass     |   8 +-
>  meta/lib/oeqa/selftest/cases/wic.py      | 153 ++++++++++++++++++++++-
>  meta/recipes-core/meta/wic-tools.bb      |   2 +-
>  scripts/lib/wic/help.py                  |  26 ++--
>  scripts/lib/wic/ksparser.py              |   3 +-
>  scripts/lib/wic/misc.py                  |  14 ++-
>  scripts/lib/wic/partition.py             |  20 +--
>  scripts/lib/wic/plugins/source/rootfs.py | 133 +++++++++++++++++---
>  8 files changed, 318 insertions(+), 41 deletions(-)
> 

All looks good to me now, thanks for iterating on this :)

My knowledge on pseudo is a little limited so I can't guarantee I've caught
all the implications of these changes on that front. You've included tests
and it's going to go into master at the start of a development cycle so we'll
have time for anything I've missed to get shaken out. I think it's good to
merge now.

-- 
Paul Barker
Konsulko Group
