Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.1015.1608563174733725676
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 07:06:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1FX7hqUx;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.44, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f44.google.com with SMTP id jx16so13853907ejb.10
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Dec 2020 07:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DFS8fKBkMnbAeKdQvGKgUqetsZnGuAKN9bRfnokK92M=;
        b=1FX7hqUxG6LFKCWd+4qKHgFQb4aHslqSBfMVgSOPRjmFOu9cKYGxYaNgBC5giUQrRI
         xRafZ5k/aLgXRWEIFSf+Xug4CukiwkbjcpSa3eK9Gy0+RW9UvjWi09J8Jk4c2cEy+Qa3
         vyqXabZs2Fe6XGTRLYw/NB2QEHELuKrp3PpxUScl3Tg40nJMrE7LTYMx+0Cg8MuP5J0M
         OeeZy77d7UdgXl/3rgunhu9X+tNGWUotVD5FiHkd54Cn5cN9mxHGzERYTKsm2VVSkAyW
         NjvidPPMnNg/x4S1mmqn1OHrzTeZpXUmsyrA2xmvOt9G9VVrxupSEi48wewDWhxQyC4v
         5fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DFS8fKBkMnbAeKdQvGKgUqetsZnGuAKN9bRfnokK92M=;
        b=E+ie7Vw9DeU0bJtR93tGpimnRCUvD9Dr8LyGiLpm5ch4G7vpB2vDkQg8sboNrSR38C
         SCle2Wq9v9R5dbkL02aMf1U+JrlKimDHx8NyPXWy7vWO6YUxl5Kp5RB3QkW4e86HbsfO
         lPiC4Tb5mYx7psxYRk6CYyFioH/GaW3oX96WSHyOuiHVryAhfoKRZS9F+RMxk40RsTjT
         pQztBF3pw34DvCoMdM3OXoZMxackQAm7L4anFxd8nFZPVUnbGnePeCP7QLFAMeviYo3l
         vz6TQ+m50oF0+tzlFE7HaXXrrVFrCs1MhUmkGChP4g2ROFcVUUdWotp7fM/A/ohqu3AY
         6HhQ==
X-Gm-Message-State: AOAM533GXJuCi8gTbIhkiq1dMUA6saSOuD+tFMsVyVFpz3rUJamWJbSV
	oKIbMQkbk/f+E1ZLIcYmZBfbCLmwzgAvbQ14z6AsvA==
X-Google-Smtp-Source: ABdhPJwGXlYPoOxLTRTsN3JMe5Zc5av8gxRtfE5tX4IGlsfpMLxXlf3m+r6/uMc9ELIQa7yUF78qCYUWM/nid71y3JY=
X-Received: by 2002:a17:906:fa8b:: with SMTP id lt11mr15866237ejb.94.1608563173081;
 Mon, 21 Dec 2020 07:06:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607007208.git.steve@sakoman.com> <CA+chaQeEFu6++N5J2qkEjU9HZPqjAahuDVGZAcfsma-9zjDLZw@mail.gmail.com>
In-Reply-To: <CA+chaQeEFu6++N5J2qkEjU9HZPqjAahuDVGZAcfsma-9zjDLZw@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 21 Dec 2020 05:06:01 -1000
Message-ID: <CAOSpxdaJXGM5HMR0yvobzN2sa2cy-+AxLqsa99tD4pn6fiN7+g@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/28] Patch review - pseudo file mode corruption fix series
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 21, 2020 at 4:33 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Just curious, is this PR on hold or rejected completely?
>
> I don't have strong opinion either way, I was just wondering about this one when other newer PRs were already merged.

This series is still actively being tested. I've been waiting for a
couple of related patches from master to hit before sending a v2.

If there are still no objections at that point I'll send a merge request.

Steve

> On Thu, Dec 3, 2020 at 4:08 PM Steve Sakoman <steve@sakoman.com> wrote:
>>
>> Issues with undetected file mode corruption in pseudo have been identified.
>>
>> Fixes have been merged into master and gatesgarth over the past couple of months and
>> things seem to have stabilized enough that we can consider backporting these fixes
>> to dunfell.
>>
>> This is a somewhat more invasive change than normal. Specifically the user will
>> be required to clean TMPDIR after this merge. It may also expose issues with
>> other layers, though master and gategarth have probably helped to pave the way for
>> this change.
>>
>> Personally I think that this fixes a serious enough issue that we should consider
>> this series for dunfell.
>>
>> Please have comments back by Monday morning.
>>
>> The following changes since commit 071806feb195961e59069f778c9ae8f27a739d9a:
>>
>>   e2fsprogs: Fix a ptest permissions determinism issue (2020-11-30 12:05:57 -1000)
>>
>> are available in the Git repository at:
>>
>>   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
>>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut
>>
>> Jacob Kroon (1):
>>   bitbake.conf: Remove TERM from default BB_HASHBASE_WHITELIST
>>
>> Joe Slater (1):
>>   pseudo: fix renaming to self
>>
>> Martin Jansa (1):
>>   base.bbclass: use os.path.normpath instead of just comparing WORKDIR
>>     and S as strings
>>
>> Mingli Yu (2):
>>   tcl: adapt to potential pseudo changes
>>   bitbake.conf: Exclude ${CCACHE_DIR} from pseudo database
>>
>> Ricardo Ribalda Delgado (3):
>>   wic: Fix permissions when using exclude or include path
>>   wic: Fix multi images .wks with bitbake
>>   wic: Avoid creating invalid pseudo directory
>>
>> Richard Purdie (19):
>>   pseudo: Switch to oe-core branch in git repo
>>   pseudo: merge in fixes for setfacl issue
>>   pseudo: Update to add OFC fcntl lock updates
>>   pseudo: Ignore mismatched inodes from the db
>>   pseudo: Add support for ignoring paths from the pseudo DB
>>   pseudo: Abort on mismatch patch
>>   psuedo: Add tracking of linked files for fds
>>   pseudo: Fix xattr segfault
>>   pseudo: Add may unlink patch
>>   pseudo: Add pathfix patch
>>   base/bitbake.conf: Enable pseudo path filtering
>>   wic: Handle new PSEUDO_IGNORE_PATHS variable
>>   pseudo: Fix statx function usage
>>   bitbake.conf: Extend PSEUDO_IGNORE_PATHS to ${COREBASE}/meta
>>   abi_version,sanity: Tell users TMPDIR must be clean after pseudo
>>     changes
>>   pseudo: Update to account for patches merged on branch
>>   pseudo: Upgrade to include mkostemp64 wrapper
>>   oeqa/selftest/runtime_test: Exclude gpg directory from pseudo database
>>   uninative: Don't use single sstate for pseudo-native
>>
>> Ross Burton (1):
>>   devtool: remove unused variable
>>
>>  meta/classes/archiver.bbclass                 |   2 +-
>>  meta/classes/base.bbclass                     |   6 +
>>  meta/classes/image_types_wic.bbclass          |  12 +-
>>  meta/classes/populate_sdk_base.bbclass        |   2 +
>>  meta/classes/sanity.bbclass                   |   3 +
>>  meta/classes/sstate.bbclass                   |   4 +
>>  meta/conf/abi_version.conf                    |   2 +-
>>  meta/conf/bitbake.conf                        |  13 +-
>>  meta/lib/oe/sstatesig.py                      |   4 +-
>>  meta/lib/oeqa/selftest/cases/runtime_test.py  |   1 +
>>  .../pseudo/files/0001-Add-statx.patch         | 106 --------------
>>  ...001-maketables-wrappers-use-Python-3.patch |  34 -----
>>  ...ixup-remove-files-that-do-not-exist-.patch |  49 -------
>>  .../0001-pseudo_ipc.h-Fix-enum-typedef.patch  |  31 ----
>>  ...1-realpath.c-Remove-trailing-slashes.patch |  57 --------
>>  ...xattr-adjust-for-attr-2.4.48-release.patch |  48 ------
>>  .../pseudo/files/moreretries.patch            |  19 ---
>>  .../pseudo/files/seccomp.patch                | 137 ------------------
>>  .../pseudo/files/toomanyfiles.patch           |  71 ---------
>>  .../pseudo/files/xattr_version.patch          |  54 -------
>>  meta/recipes-devtools/pseudo/pseudo_git.bb    |  14 +-
>>  meta/recipes-devtools/tcltk/tcl_8.6.10.bb     |   1 +
>>  scripts/lib/devtool/standard.py               |   1 -
>>  scripts/lib/wic/partition.py                  |  23 +--
>>  scripts/lib/wic/plugins/source/rootfs.py      |  37 ++++-
>>  scripts/postinst-intercepts/update_font_cache |   2 +
>>  26 files changed, 89 insertions(+), 644 deletions(-)
>>  delete mode 100644 meta/recipes-devtools/pseudo/files/0001-Add-statx.patch
>>  delete mode 100644 meta/recipes-devtools/pseudo/files/0001-maketables-wrappers-use-Python-3.patch
>>  delete mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo-On-a-DB-fixup-remove-files-that-do-not-exist-.patch
>>  delete mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo_ipc.h-Fix-enum-typedef.patch
>>  delete mode 100644 meta/recipes-devtools/pseudo/files/0001-realpath.c-Remove-trailing-slashes.patch
>>  delete mode 100644 meta/recipes-devtools/pseudo/files/0006-xattr-adjust-for-attr-2.4.48-release.patch
>>  delete mode 100644 meta/recipes-devtools/pseudo/files/moreretries.patch
>>  delete mode 100644 meta/recipes-devtools/pseudo/files/seccomp.patch
>>  delete mode 100644 meta/recipes-devtools/pseudo/files/toomanyfiles.patch
>>  delete mode 100644 meta/recipes-devtools/pseudo/files/xattr_version.patch
>>
>> --
>> 2.17.1
>>
>>
>> 
>>
