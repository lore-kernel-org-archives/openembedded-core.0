Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.6638.1586430638602441581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 04:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=BcNtID0K;
 spf=pass (domain: konsulko.com, ip: 209.85.128.65, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f65.google.com with SMTP id d77so3490713wmd.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 04:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=NXl7Z0YKxwTzDZfcEkRBRuZSJLzK/fnRsX46vWw0FG4=;
        b=BcNtID0KUXHubPzzV6KutFYiFM0yECrFpmuFYdEqLSK+KznVsvTeZzUIFliktOfywk
         2zHN8aH+uUp2eWOqJQfFu3dsqgfhrxgHfUEQhNU0kPOhHJPdmP4M5XWO+N/yMlhMpRHM
         TSXRFi3w/DrAmav1G4hKkOaKHHpoX8qFZv6a8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=NXl7Z0YKxwTzDZfcEkRBRuZSJLzK/fnRsX46vWw0FG4=;
        b=F42n+XQ+ijd95VA44DKHNUHlzbmpvdiYaU4eElCrQQhRPoYh3I3v/zqfRgzR6eSEME
         7Bb+hmi8AJhk0VMLn4FHEj8rWn/f3JOtVhNSGvCxg8HXikj7ST0nnpnHJhs9p6UKh7jq
         qlSwP2UrgCaUgIdfeF7hU7lLLhxOkPFzt4N/sSeGQrkZYGg8RdXn/YByE2Gy/XzE79mh
         WoWxJlvptL9M4FkYjh9waKEMYXWSegTs8bh2ZRpob4dbl+/8WVxIjVzwI7e9ZE1FjD8i
         eaJEO32Gcl778MvMIQhqioDY3pFGleYKpWj+KouOvZVAQf/U1/ZnMhzvY1p5GhiZKazV
         8v6g==
X-Gm-Message-State: AGi0Pubvdh1iYDpeHEzUsdSwIK7SVBD7TinRIE7SR/kPOMhMMWvHk3Pw
	K1RYrkcOXNqI1DD/EPgMdzqcRw==
X-Google-Smtp-Source: APiQypJFKXoeiRqTHj7I9gQjsLqLyDbUXo2Okk3ZymLwrjbWwUS8deH9+dDUAGGVTWnaq/MbUFHXOg==
X-Received: by 2002:a7b:c8cd:: with SMTP id f13mr9846126wml.181.1586430637029;
        Thu, 09 Apr 2020 04:10:37 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ub1910 ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id w7sm40226519wrr.60.2020.04.09.04.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 04:10:36 -0700 (PDT)
Date: Thu, 9 Apr 2020 12:10:31 +0100
From: "Paul Barker" <pbarker@konsulko.com>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 0/4] wic: Fix permissions
Message-ID: <20200409121031.0efee461@ub1910>
In-Reply-To: <20200409104951.948242-1-ricardo@ribalda.com>
References: <20200409104951.948242-1-ricardo@ribalda.com>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu,  9 Apr 2020 12:49:47 +0200
Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:

> Hi
>=20
>=20
> Today wic behaves differently if we run it from bitbake of directly from =
the
> commandline.
>=20
> When it is run from bitbake, the permissions/usersnames are handled by th=
e=20
> pseudo database of the main image.
>=20
> When it is run from the comandline , it is run outside the main image dat=
abase.
>=20
> This results on permissions/usernames not working ok on some usecases on =
both
> bitbake and wic.
>=20
>=20
> This is an attempt to fix all the permission bugs that I am aware from wi=
c.
> Using the following usecases
>=20
>=20
> #exclude-path
> part / --source rootfs --fstype=3Dext4 --exclude-path=3Dhome
>=20
> #split_partition
> part / --source rootfs --ondisk sda --fstype=3Dext4 --exclude-path=3Detc/
> part /etc --source rootfs --rootfs-dir=3Dtmp/work/qt5222-poky-linux/core-=
image-minimal/1.0-r0/rootfs/etc/ --fstype=3Dext4
>=20
> #multi_partition
> part / --source rootfs --ondisk sda --fstype=3Dext4
> part /export --source rootfs --rootfs=3Dcore-image-minimal-mtdutils --fst=
ype=3Dext4
>=20
>=20
> With the current master:
> -------------------------
> #exclude-path
> From Bitbake: OK
> wic cmdline: FAIL
>=20
> #split_partition
> From Bitbake: OK
> wic cmdline: FAIL, permissions invalid on both partitions
>=20
> #multi_partition
> From Bitbake: FAIL second partition
> wic cmdline: OK
>=20
>=20
> After: =C2=A0wic: Fix permissions when using exclude or include path
> --------------------------------------------------------------------
> #exclude-path
> From Bitbake: OK
> wic cmdline: OK
>=20
> #split_partition
> From Bitbake: OK
> wic cmdline: FAIL, permissions invalid on second partition
>=20
> #multi_partition
> From Bitbake: FAIL second partition
> wic cmdline: OK
>=20
>=20
> After: wic: Fix multi images .wks with bitbake
> ----------------------------------------------
> #exclude-path
> From Bitbake: OK
> wic cmdline: OK
>=20
> #split_partition
> From Bitbake: FAIL, permissions invalid on second partition
> wic cmdline: FAIL, permissions invalid on second partition
>=20
> #multi_partition
> From Bitbake: OK
> wic cmdline: OK
>=20

This looks really good, are you able to automate any of these tests and put
them in meta/lib/oeqa/selftest/cases/wic.py?

>=20
>=20
> After: wic: Add --change-directory argument
> --------------------------------------------
>=20
> we can have a .wks like:
> part / --source rootfs --ondisk sda --fstype=3Dext4 --exclude-path=3Detc/=
 =C2=A0=20
> part /etc --source rootfs --fstype=3Dext4 --change-directory=3D/etc
>=20
>=20
> Wich works fine from bitbake and from cmdline, and has the same functiona=
lity as
> split_partition.
>=20
>=20
> Ricardo Ribalda Delgado (4):
>   wic: Fix permissions when using exclude or include path
>   wic: Fix multi images .wks with bitbake
>   wic: Add --change-directory argument
>   wic: Continue if excluded_path does not exist
>=20
>  meta/classes/image_types_wic.bbclass     |  8 +++-
>  scripts/lib/wic/help.py                  |  6 +++
>  scripts/lib/wic/ksparser.py              |  1 +
>  scripts/lib/wic/partition.py             | 15 ++++---
>  scripts/lib/wic/plugins/source/rootfs.py | 52 ++++++++++++++++++++++--
>  5 files changed, 68 insertions(+), 14 deletions(-)
>=20

I'll give this a detailed review over the weekend. Looks good at first
glance, though I may suggest renaming `--change-directory` to something else
so it's more obvious what it's doing when you just read that in a wks file.
Perhaps `--part-subdir`, I don't know. Let's not bikeshed it too much thoug=
h.

Thanks,

--=20
Paul Barker
Konsulko Group
