Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F2EFD374B4
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 22:34:48 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.611.1764974080373152915
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 14:34:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gs1bfkCr;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6444487b34cso1438383d50.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 14:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764974079; x=1765578879; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9bFc1yzHCo4t2BXIkQI4aShRRm5Q1huY4tqKOY4MlyQ=;
        b=Gs1bfkCr5M7dh/rfQHS0+zXkvIXC9ST/11Pj4F7bnwCRs3e+4YkD/J+0xK7f1h6Er5
         +6xRoVY6Wg9xGR4kQ+y2mfjkPDNubCjBEu8qNDkCLNF6BfRJIJXwMZ7lN4dgu5QOM3CG
         dhRhI+s6xVvgYtuWicSWp41d9rUMUMtBDLr+TZ9+kxYK48v0KBWMLcJfJ114Q3+fbusd
         K9lmbxoagijymKSZNcIIbF8PSUx7PRAOdxKd0YIMjZHxpDtl5h2xZMJCIfbZ+g5JxBGa
         VxfGGoorwK+9G+cyAqBd9LDypczv0YJqUZjoCWC2+hMuzlX6b9zKBvgVK8lld93JvAjM
         cxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764974079; x=1765578879;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bFc1yzHCo4t2BXIkQI4aShRRm5Q1huY4tqKOY4MlyQ=;
        b=hBNAkvRHLIK+4Zj8bbp7ctYiuVi0vfINmPerxFaArkf/534PeJwNjsy8peqZD2rE8f
         bn1SiDhq/VQ8BByc0FLy064hK23JOYI3UFfs7w+z/2giktUpXNU13B6hjopJJNtn/bLH
         FG2REnX7poPuH3dXAtFQRwOaWWJZQTQBoReP4ep1PlzMb+VOULLMtRuMdAxKU2LhdFNW
         ylHJlIPdeLGPLsQzonJxPK9C56G7xQjItV4hqf0YwPDlNmRHOSVOlkN4tjKEEpHsmKMs
         Z7bZtBbr0gHywDFj/tbiedjuUPxy+voAaJLjrC++E+S42YIRsMx44Erkhh7iqrYSjgUv
         NK6g==
X-Forwarded-Encrypted: i=1; AJvYcCUlakkoOcfQe3GjddfX30HQLoV7tc8arQaI0EdRCdki6ytly0w2VmmlqLX1MsmcaBOAbgczj8BAesM6khPiu9HMdQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxtwv0ro84YTGd3epS+UjofFI6jeiCLYQ5ZY1Mh9TA8Tn5nmQry
	msNFE6GpjCexXZQoVNbT/0YQtIW9muh7OvbWwzWBzxnwv7A/+oT47x9M4Uq9MXDjMTZNNAQAl8B
	yWkNIPAyfI2mwvRkO3CNn1tZ4HFYYTh+Aj6IK
X-Gm-Gg: ASbGncuq86dbxsIBR8wukFVlwTjl+Pjqo6n4Zh8lB0UnbGKPQGlThGjfPuF+kUegSE0
	S8qjS/KZmKiSB/xjQh1XBV3LmAUJzAxPnKqheEVpYfODQYM0FZo2BccGhWOS/qdqQF4mzqw012g
	0S0ZazyzUVnU24ORVsX24ic50dJE07jOzOJDem7KqTWESdpZKKxSsT3D0wVUQm/gU5Zv2cblUzJ
	uSLLdP95ZL+JQlwK2njRR29IYX0OLXZvqUDwyYTY1S/8RuT/ziXwDQSB3C1xM5fnnH2DMqcTtmb
	sYvhwPJ93BtbXNXG/mJfiyEt0GpAuzKmNvyhXl62S9G6TmRnJ+0tevRlAqURDpgYACAbODP/8yZ
	jfJR1kmqwxO8EOYt490I6ZKOxOKOxfh5XuSBPjc4bwg8cUQ==
X-Google-Smtp-Source: AGHT+IE2pzoi0wD/bHjPXh0j/dVmT0uSjNZYmpwWy37wUeJf5BtBccQHBCf+HfhXBvat6qO7PYdy4G8pAWrM0JVtGb8=
X-Received: by 2002:a53:d012:0:b0:644:478e:57ae with SMTP id
 956f58d0204a3-6444e7b92d5mr411282d50.40.1764974079280; Fri, 05 Dec 2025
 14:34:39 -0800 (PST)
MIME-Version: 1.0
References: <20251023134656.2059483-1-ecordonnier@snap.com>
 <20251023134656.2059483-2-ecordonnier@snap.com> <2da2af64-1607-49f3-a438-43525b4b8b02@gmail.com>
 <CAHUKmYbfri0mDeJJ6FH1YVtNe9R_YTdC8iFQxOx7zLRqizvhKA@mail.gmail.com>
 <CAMKF1sqn_G1QjZB0SJhvWXKS8e5amjs5e2swZUZNsakivNs+Eg@mail.gmail.com>
 <CAMKF1so01+JEg5PD7A0e1dg9NQfz=DOC-JbKw22usNZNUgO02g@mail.gmail.com>
 <CAHUKmYYLi9TOibJGYvHN66ZGwoCaDTmrKGBAVZ4atrG13XyD_w@mail.gmail.com> <CAHUKmYYeWWXXWpwjafwuVW9Or35m7PDRZ7b6=g8wgoNajSEtOA@mail.gmail.com>
In-Reply-To: <CAHUKmYYeWWXXWpwjafwuVW9Or35m7PDRZ7b6=g8wgoNajSEtOA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Dec 2025 14:34:28 -0800
X-Gm-Features: AWmQ_bkIF-2LuHgtoQrVKg6j1rVypPGRL3JwwartKAOT5K3wApAVfNLEt_3EI68
Message-ID: <CAMKF1so0cXMM_imqEkJQs7Lku+nFU-Hkc3vb=KOh=EhRdoD81g@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4 2/2] opkg: upgrade 0.8.0 -> 0.9.0
To: Etienne Cordonnier <ecordonnier@snap.com>
Cc: Gyorgy Sarvari <skandigraun@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000088c1806453c0d3d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 22:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227354

--000000000000088c1806453c0d3d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My case is yoe distro rpi4-64 building yoe-kiosk-image I do not set
IMAGE_LINGUAS to get into the problem if I set it then it works

On Fri, Dec 5, 2025 at 2:16=E2=80=AFPM Etienne Cordonnier <ecordonnier@snap=
.com>
wrote:

> Hi Khem,
> I've not managed to reproduce at the moment, neither on poky nor on
> yoe-distro. I'm on Ubuntu 24.04. Can you maybe send me your local.conf?:
>
> ecordonnier@lj8k2dq3:~/dev/yoe$ cat conf/local.conf
> IMAGE_LINGUAS =3D "en-us en-gb"
> ENABLE_BINARY_LOCALE_GENERATION =3D "1"
> SSTATE_MIRRORS =3D " \
>     file://.*
> https://sstate.yoctoproject.org/all/PATH;downloadfilename=3DPATH \
> "
> ecordonnier@lj8k2dq3:~/dev/yoe$ git rev-parse HEAD
> 7ce0a300ea45d28cfd58094cb5e9e07651797226
> cordonnier@lj8k2dq3:~/dev/yoe$ . ./envsetup.sh rpi4-64
> Setting PROJECT=3Drpi4-64
> Setting MACHINE=3Draspberrypi4-64
> /home/ecordonnier/dev/yoe/conf/auto.conf has been updated
> Setting DOCKER_REPO to yoedistro/yoe-build:trixie-x86_64
> ecordonnier@lj8k2dq3:~/dev/yoe$ yoe_setup
> ecordonnier@lj8k2dq3:~/dev/yoe$ bitbake yoe-kiosk-image
> NOTE: Started PRServer with DBfile:
> /home/ecordonnier/dev/yoe/cache/prserv.sqlite3, Address: 127.0.0.1:44795,
> PID: 111
> WARNING: You are using a local hash equivalence server but have configure=
d
> an sstate mirror. This will likely mean no sstate will match from the
> mirror. You may wish to disable the hash equivalence use (BB_HASHSERVE), =
or
> use a hash equivalence server alongside the sstate mirror.
> Loading cache: 100%
> |########################################################################=
###########################################################################=
#################################################################|
> Time: 0:00:02
> Loaded 5831 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "2.16.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "aarch64-yoe-linux"
> MACHINE              =3D "raspberrypi4-64"
> DISTRO               =3D "yoe"
> DISTRO_VERSION       =3D "2025.11"
> TUNE_FEATURES        =3D "aarch64 crc cortexa72 nocrypto"
> TARGET_FPU           =3D ""
> meta-yoe             =3D "master:7ce0a300ea45d28cfd58094cb5e9e07651797226=
"
> meta-raspberrypi     =3D "HEAD:b667e177b1e6642cb11301801db44d4515c1652d"
> meta-clang           =3D "HEAD:d0a67c76b7a3b585dbe2ba8ad509dc0fe0e58af2"
> meta-qt6             =3D "HEAD:836b1c3212c3562c0909468ab415df98c1145759"
> meta-filesystems
> meta-gnome
> meta-initramfs
> meta-multimedia
> meta-networking
> meta-oe
> meta-perl
> meta-python
> meta-webserver
> meta-xfce            =3D "HEAD:219328f37cbf6aa4b2d7b77d21e00240543d73ad"
> meta                 =3D "HEAD:ac7327583aef83fd400190506f3147623de38b68"
>
> Sstate summary: Wanted 2 Local 0 Mirrors 2 Missed 0 Current 3493 (100%
> match, 100%
> complete)################################################################=
#######################################################
>                      | ETA:  0:00:00
> Initialising tasks: 100%
> |########################################################################=
###########################################################################=
############################################################|
> Time: 0:00:05
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 7090 tasks of which 7088 didn't need to be
> rerun and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 5 seconds
>
> Summary: There was 1 WARNING message.
>
> On Thu, Dec 4, 2025 at 7:56=E2=80=AFPM Etienne Cordonnier <ecordonnier@sn=
ap.com>
> wrote:
>
>> Hi Khem,
>> I haven't had the time to debug yet, but I've seen your message.
>>
>> =C3=89tienne
>>
>> On Wed, Dec 3, 2025 at 10:35=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wr=
ote:
>>
>>> It can be reproduced with direct invocation
>>>
>>> kraj@apollo
>>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-im=
age/1.0
>>> =E2=9D=AF recipe-sysroot-native/usr/bin/opkg \
>>>   --volatile-cache \
>>>   -f opkg.conf \
>>>   -t temp/ipktemp/ \
>>>   -o rootfs \
>>>   --force-postinstall \
>>>   --prefer-arch-to-version \
>>>   --force-depends \
>>>   remove glibc-binary-localedata-en-gb glibc-binary-localedata-c
>>> glibc-binary-localedata-en-us
>>>
>>> [1]    346156 segmentation fault (core dumped)
>>>  recipe-sysroot-native/usr/bin/opkg --volatile-cache -f opkg.conf -t  -=
o
>>> roots
>>>
>>> I have a workaround by setting
>>>
>>> IMAGE_LINGUAS =3D "en-us"
>>>
>>> in local.conf which avoids the need for opkg remove operation which is
>>> crashing.
>>>
>>> On Wed, Dec 3, 2025 at 1:04=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wr=
ote:
>>>
>>>> I am starting to see the following crash in opkg when building image.
>>>> Anyone seeing something like this?
>>>>
>>>> (No debugging symbols found in
>>>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-i=
mage/1.0/recipe-sysroot-native/usr/bin/opkg)
>>>> [New LWP 34493]
>>>> [Thread debugging using libthread_db enabled]
>>>> Using host libthread_db library "/usr/lib/libthread_db.so.1".
>>>> Core was generated by
>>>> `/mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-=
image/1.0/recipe-sysroot-native/usr/bin/opkg
>>>> --volatile-cache -f
>>>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-i=
mage/1.0/opkg.conf
>>>> -t
>>>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-i=
mage/1.0/temp/ipktemp/
>>>> -o
>>>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-i=
mage/1.0/rootfs
>>>> --force-postinstall --prefer-arch-to-version --force-depends remove
>>>> glibc-binary-localedata-en-gb glibc-binary-localedata-c
>>>> glibc-binary-localedata-en-us'.
>>>> Program terminated with signal SIGSEGV, Segmentation fault.
>>>> #0  0x00007f50a8190d20 in stringpool_strn2id () from
>>>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-i=
mage/1.0/recipe-sysroot-native/usr/bin/../lib/./libsolv.so.1
>>>> (gdb) bt
>>>> #0  0x00007f50a8190d20 in stringpool_strn2id () from
>>>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-i=
mage/1.0/recipe-sysroot-native/usr/bin/../lib/./libsolv.so.1
>>>> #1  0x00007f50a818a3dc in pool_str2id () from
>>>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-i=
mage/1.0/recipe-sysroot-native/usr/bin/../lib/./libsolv.so.1
>>>> #2  0x00007f50a84fe4ad in ?? () from
>>>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-i=
mage/1.0/recipe-sysroot-native/usr/bin/../lib/libopkg.so.1
>>>> #3  0x00007f50a84ff4df in opkg_solver_remove () from
>>>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-i=
mage/1.0/recipe-sysroot-native/usr/bin/../lib/libopkg.so.1
>>>> #4  0x00007f50a84e9bfb in ?? () from
>>>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-i=
mage/1.0/recipe-sysroot-native/usr/bin/../lib/libopkg.so.1
>>>> #5  0x00007f50a84eadb2 in opkg_cmd_exec () from
>>>> /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-i=
mage/1.0/recipe-sysroot-native/usr/bin/../lib/libopkg.so.1
>>>> #6  0x00005557220b6a9d in ?? ()
>>>> #7  0x00007f50a8311f68 in __libc_start_call_main () from
>>>> /mnt/b/yoe/master/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.s=
o.6
>>>> #8  0x00007f50a831201b in __libc_start_main () from
>>>> /mnt/b/yoe/master/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.s=
o.6
>>>> #9  0x00005557220b6bf1 in ?? ()
>>>>
>>>> On Thu, Nov 27, 2025 at 10:11=E2=80=AFAM Etienne Cordonnier via
>>>> lists.openembedded.org
>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembed=
ded.org&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkb=
NonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2D=
Ufu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&s=3D7Hhr9df0PBRkpiFWBooOX6tv5kZhGeHxO5S6v=
VaNiw8&e=3D>
>>>> <ecordonnier=3Dsnap.com@lists.openembedded.org> wrote:
>>>>
>>>>> Hi Gyorgy,
>>>>> I have sent a patch to opkg upstream which disables the ACL option by
>>>>> default again (it is https://lists.yoctoproject.org/g/opkg/message/17=
5
>>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.yoctopr=
oject.org_g_opkg_message_175&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGk=
ICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXi=
gbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&s=3D4U1D3q2TfA7jjhTo=
68DgNSOLopG_6Nlj6Ta9OG8TN_g&e=3D>
>>>>> , however the web-view doesn't seem to work at the moment. I only see
>>>>> "Forbidden").
>>>>>
>>>>> =C3=89tienne
>>>>>
>>>>>
>>>>>
>>>>> On Thu, Nov 27, 2025 at 6:08=E2=80=AFPM Gyorgy Sarvari <skandigraun@g=
mail.com>
>>>>> wrote:
>>>>>
>>>>>> I just tried this, but it seems that the ACL switch was toggled duri=
ng
>>>>>> the CMake transition. With Autotools ACL was disabled by default, bu=
t
>>>>>> with CMake it seems to be enabled - and it complains that it can't
>>>>>> find
>>>>>> libacl on my machine.
>>>>>>
>>>>>> On 10/23/25 15:46, Etienne Cordonnier via lists.openembedded.org
>>>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openemb=
edded.org&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAh=
kbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM=
2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&s=3D7Hhr9df0PBRkpiFWBooOX6tv5kZhGeHxO5S=
6vVaNiw8&e=3D>
>>>>>> wrote:
>>>>>> > From: Etienne Cordonnier <ecordonnier@snap.com>
>>>>>> >
>>>>>> > See release notes at
>>>>>> > -
>>>>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoct=
oproject.org_releases_opkg_opkg-2D0.9.0.release-2Dnotes&d=3DDwICaQ&c=3DncDT=
mphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJT=
KUkSGa66m67E&m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y_QGHVaD7rHv=
Ef9Kx5&s=3Dqvmy1QT46Bl7mVt_XDbuHiic2IjU6z7Zku_Gid-CVYc&e=3D
>>>>>> >
>>>>>> > [0.9.0] - 2025-06-27
>>>>>> >
>>>>>> > Semiannual opkg release.
>>>>>> > Bumping the minor version as a result of the project build tooling
>>>>>> changing from autotools to cmake.
>>>>>> >
>>>>>> > - Added a Dockerfile container definition (`:docker/`) for a valid
>>>>>> developer build environment for opkg.
>>>>>> >   - It's recommended that project contributors use this container
>>>>>> to build and test their changes.
>>>>>> > - The AutoTools-based build framework has [been replaced](
>>>>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproj=
ect.org_opkg_commit_-3Fid-3D3f6040e321634471ec442fb0e80f140f1437e90b&d=3DDw=
ICaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Q=
j9TsRih1DULJTKUkSGa66m67E&m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk=
4Y_QGHVaD7rHvEf9Kx5&s=3DGgRxioBjt-ii5JWUrYQ0I-FmXvKxVxKNH3Nj22i_jiM&e=3D
>>>>>> ) with a more modern, CMake framework.
>>>>>> >   - Refer to the `docs/CONTRIBUTING.md` documentation for updated
>>>>>> build instructions.
>>>>>> >
>>>>>> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>>>>>> > ---
>>>>>> >  .../opkg/opkg/0002-config.h.in-fix-typo.patch | 27
>>>>>> +++++++++++++++++++
>>>>>> >  meta/recipes-devtools/opkg/opkg/run-ptest     |  2 +-
>>>>>> >  .../opkg/{opkg_0.8.0.bb
>>>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.8.0.=
bb&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVu=
MIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0s=
g0bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DXvRK6ACbDsce-6GfM1z7bmWP89Drkdoim4UnjGId7j=
E&e=3D>
>>>>>> =3D> opkg_0.9.0.bb
>>>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.=
bb&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVu=
MIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0s=
g0bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DPCgmYCv6lZBoj7mQyNmGExGtaa-iO2KXWfMw-LSuRr=
o&e=3D>}
>>>>>>    | 22 ++++++++-------
>>>>>> >  3 files changed, 41 insertions(+), 10 deletions(-)
>>>>>> >  create mode 100644
>>>>>> meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
>>>>>> >  rename meta/recipes-devtools/opkg/{opkg_0.8.0.bb
>>>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.8.0.=
bb&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVu=
MIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0s=
g0bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DXvRK6ACbDsce-6GfM1z7bmWP89Drkdoim4UnjGId7j=
E&e=3D>
>>>>>> =3D> opkg_0.9.0.bb
>>>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.=
bb&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVu=
MIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0s=
g0bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DPCgmYCv6lZBoj7mQyNmGExGtaa-iO2KXWfMw-LSuRr=
o&e=3D>}
>>>>>> (76%)
>>>>>> >
>>>>>> > diff --git
>>>>>> a/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
>>>>>> b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
>>>>>> > new file mode 100644
>>>>>> > index 00000000000..626bbd01b68
>>>>>> > --- /dev/null
>>>>>> > +++
>>>>>> b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
>>>>>> > @@ -0,0 +1,27 @@
>>>>>> > +From 5a81faadbc2397d554bc598d535fd2d44cbc8d10 Mon Sep 17 00:00:00
>>>>>> 2001
>>>>>> > +From: Etienne Cordonnier <ecordonnier@snap.com>
>>>>>> > +Date: Mon, 20 Oct 2025 18:57:56 +0200
>>>>>> > +Subject: [PATCH] config.h.in
>>>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__config.h.in&d=
=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB=
32_yW13Nh-HmRl8UbCQaTnb5&s=3DdOZFRTTcPycQ3CB3uYzjTaJbkYiw-ptty6e5ymgao80&e=
=3D>:
>>>>>> fix typo
>>>>>> > +
>>>>>> > +Upstream-Status: Backport [
>>>>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproj=
ect.org_opkg_commit_-3Fid-3Dd723a90bfe6409c7ad983ed911225d4aefbfd09e&d=3DDw=
ICaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Q=
j9TsRih1DULJTKUkSGa66m67E&m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk=
4Y_QGHVaD7rHvEf9Kx5&s=3D5scf6nlpBtSePSuPjyopoX7FmlAyiSwI03Ry11w4tl8&e=3D
>>>>>> ]
>>>>>> > +Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>>>>>> > +---
>>>>>> > + config.h.in
>>>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__config.h.in&d=
=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB=
32_yW13Nh-HmRl8UbCQaTnb5&s=3DdOZFRTTcPycQ3CB3uYzjTaJbkYiw-ptty6e5ymgao80&e=
=3D>
>>>>>> | 2 +-
>>>>>> > + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>> > +
>>>>>> > +diff --git a/config.h.in
>>>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__config.h.in&d=
=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB=
32_yW13Nh-HmRl8UbCQaTnb5&s=3DdOZFRTTcPycQ3CB3uYzjTaJbkYiw-ptty6e5ymgao80&e=
=3D>
>>>>>> b/config.h.in
>>>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__config.h.in&d=
=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB=
32_yW13Nh-HmRl8UbCQaTnb5&s=3DdOZFRTTcPycQ3CB3uYzjTaJbkYiw-ptty6e5ymgao80&e=
=3D>
>>>>>> > +index 4fa9842..877b8c7 100644
>>>>>> > +--- a/config.h.in
>>>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__config.h.in&d=
=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB=
32_yW13Nh-HmRl8UbCQaTnb5&s=3DdOZFRTTcPycQ3CB3uYzjTaJbkYiw-ptty6e5ymgao80&e=
=3D>
>>>>>> > ++++ b/config.h.in
>>>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__config.h.in&d=
=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGR=
fPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB=
32_yW13Nh-HmRl8UbCQaTnb5&s=3DdOZFRTTcPycQ3CB3uYzjTaJbkYiw-ptty6e5ymgao80&e=
=3D>
>>>>>> > +@@ -2,7 +2,7 @@
>>>>>> > + #cmakedefine01 WITH_XZ
>>>>>> > + #cmakedefine01 WITH_BZIP2
>>>>>> > + #cmakedefine01 WITH_LZ4
>>>>>> > +-#cmakedefine01 WITH_LZSTD
>>>>>> > ++#cmakedefine01 WITH_ZSTD
>>>>>> > + #cmakedefine01 WITH_CURL
>>>>>> > + #cmakedefine01 WITH_SSLCURL
>>>>>> > + #cmakedefine01 WITH_ACL
>>>>>> > +--
>>>>>> > +2.43.0
>>>>>> > +
>>>>>> > diff --git a/meta/recipes-devtools/opkg/opkg/run-ptest
>>>>>> b/meta/recipes-devtools/opkg/opkg/run-ptest
>>>>>> > index 5fb7077eec9..d485a4aace5 100644
>>>>>> > --- a/meta/recipes-devtools/opkg/opkg/run-ptest
>>>>>> > +++ b/meta/recipes-devtools/opkg/opkg/run-ptest
>>>>>> > @@ -2,4 +2,4 @@
>>>>>> >
>>>>>> >  OPKG_PATH=3D$(which opkg)
>>>>>> >
>>>>>> > -make OPKG_PATH=3D$OPKG_PATH run-tests
>>>>>> > +make -C tests DATADIR=3D/share SYSCONFDIR=3D/etc VARDIR=3D/var
>>>>>> OPKG_PATH=3D$OPKG_PATH
>>>>>> > diff --git a/meta/recipes-devtools/opkg/opkg_0.8.0.bb
>>>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.8.0.=
bb&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVu=
MIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0s=
g0bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DXvRK6ACbDsce-6GfM1z7bmWP89Drkdoim4UnjGId7j=
E&e=3D>
>>>>>> b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
>>>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.=
bb&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVu=
MIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0s=
g0bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DPCgmYCv6lZBoj7mQyNmGExGtaa-iO2KXWfMw-LSuRr=
o&e=3D>
>>>>>> > similarity index 76%
>>>>>> > rename from meta/recipes-devtools/opkg/opkg_0.8.0.bb
>>>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.8.0.=
bb&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVu=
MIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0s=
g0bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DXvRK6ACbDsce-6GfM1z7bmWP89Drkdoim4UnjGId7j=
E&e=3D>
>>>>>> > rename to meta/recipes-devtools/opkg/opkg_0.9.0.bb
>>>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.=
bb&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVu=
MIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0s=
g0bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DPCgmYCv6lZBoj7mQyNmGExGtaa-iO2KXWfMw-LSuRr=
o&e=3D>
>>>>>> > index 12e2edf7e3f..ed2f36d636b 100644
>>>>>> > --- a/meta/recipes-devtools/opkg/opkg_0.8.0.bb
>>>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.8.0.=
bb&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVu=
MIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0s=
g0bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DXvRK6ACbDsce-6GfM1z7bmWP89Drkdoim4UnjGId7j=
E&e=3D>
>>>>>> > +++ b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
>>>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.=
bb&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVu=
MIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0s=
g0bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DPCgmYCv6lZBoj7mQyNmGExGtaa-iO2KXWfMw-LSuRr=
o&e=3D>
>>>>>> > @@ -15,34 +15,35 @@ PE =3D "1"
>>>>>> >  SRC_URI =3D "
>>>>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoct=
oproject.org_releases_-24-257BBPN-257D_-24-257BBPN-257D-2D-24-257BPV-257D.t=
ar.gz&d=3DDwICaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNo=
nVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRX=
Tj24AF_PScvk4Y_QGHVaD7rHvEf9Kx5&s=3DmKc8LzZ_Q2orQLqa_38Jr7E7tfyD4-rcsgI-wPk=
x_Zg&e=3D
>>>>>> \
>>>>>> >             file://opkg.conf \
>>>>>> >
>>>>>>  file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.pa=
tch \
>>>>>> > +           file://0002-config.h.in-fix-typo.patch \
>>>>>> >             file://run-ptest \
>>>>>> >             "
>>>>>> >
>>>>>> > -SRC_URI[sha256sum] =3D
>>>>>> "582a4c9e220cce0b7d08a0915c95db9f24ae43ad372ed5d42d5ec5f6cd413f0c"
>>>>>> > +SRC_URI[sha256sum] =3D
>>>>>> "440ef321862e01f83da4d02884a0cbb4d9d7b32f82faa81a6a85493f0c89d0f5"
>>>>>> >
>>>>>> >  # This needs to be before ptest inherit, otherwise all ptest file=
s
>>>>>> end packaged
>>>>>> >  # in libopkg package if OPKGLIBDIR =3D=3D libdir, because default
>>>>>> >  # PTEST_PATH ?=3D "${libdir}/${BPN}/ptest"
>>>>>> >  PACKAGES =3D+ "libopkg"
>>>>>> >
>>>>>> > -inherit autotools pkgconfig ptest
>>>>>> > +inherit cmake pkgconfig ptest
>>>>>> >
>>>>>> >  target_localstatedir :=3D "${localstatedir}"
>>>>>> >  OPKGLIBDIR ??=3D "${target_localstatedir}/lib"
>>>>>> >
>>>>>> >  PACKAGECONFIG ??=3D "libsolv"
>>>>>> >
>>>>>> > -PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,\
>>>>>> > +PACKAGECONFIG[gpg] =3D "-DWITH_GPGME=3DON,-DWITH_GPGME=3DOFF,\
>>>>>> >      gnupg gpgme libgpg-error,\
>>>>>> >      ${@ "gnupg" if ("native" in d.getVar("PN")) else "gnupg-gpg"}=
\
>>>>>> >      "
>>>>>> > -PACKAGECONFIG[curl] =3D "--enable-curl,--disable-curl,curl"
>>>>>> > -PACKAGECONFIG[ssl-curl] =3D
>>>>>> "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
>>>>>> > -PACKAGECONFIG[sha256] =3D "--enable-sha256,--disable-sha256"
>>>>>> > -PACKAGECONFIG[libsolv] =3D "--with-libsolv,--without-libsolv,libs=
olv"
>>>>>> > +PACKAGECONFIG[curl] =3D "-DWITH_CURL=3DON,-DWITH_CURL=3DOFF,curl"
>>>>>> > +PACKAGECONFIG[ssl-curl] =3D
>>>>>> "-DWITH_SSLCURL=3DON,-DWITH_SSLCURL=3DOFF,curl openssl"
>>>>>> > +PACKAGECONFIG[sha256] =3D "-DWITH_SHA256=3DON,-DWITH_SHA256=3DOFF=
"
>>>>>> > +PACKAGECONFIG[libsolv] =3D
>>>>>> "-DUSE_SOLVER_LIBSOLV=3DON,-DUSE_SOLVER_LIBSOLV=3DOFF,libsolv"
>>>>>> >
>>>>>> > -EXTRA_OECONF =3D "--enable-zstd"
>>>>>> > -EXTRA_OECONF:append:class-native =3D "
>>>>>> --localstatedir=3D/${@os.path.relpath('${localstatedir}',
>>>>>> '${STAGING_DIR_NATIVE}')} --sysconfdir=3D/${@os.path.relpath('${sysc=
onfdir}',
>>>>>> '${STAGING_DIR_NATIVE}')}"
>>>>>> > +EXTRA_OECMAKE =3D "-DWITH_ZSTD=3DON"
>>>>>> > +EXTRA_OECMAKE:append:class-native =3D "
>>>>>> -DVARDIR=3D/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NA=
TIVE}')}
>>>>>> -DSYSCONFDIR=3D/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_N=
ATIVE}')}"
>>>>>> >
>>>>>> >  do_install:append () {
>>>>>> >       install -d ${D}${sysconfdir}/opkg
>>>>>> > @@ -56,6 +57,9 @@ do_install:append () {
>>>>>> >  }
>>>>>> >
>>>>>> >  do_install_ptest () {
>>>>>> > +     # the ptest class uses a Makefile for installation, but cmak=
e
>>>>>> uses Ninja per default so we need to install ptests manually:
>>>>>> > +     cp -r ${S}/tests ${D}${PTEST_PATH}
>>>>>> > +
>>>>>> >       sed -i -e '/@echo $^/d' ${D}${PTEST_PATH}/tests/Makefile
>>>>>> >       sed -i -e '/@PYTHONPATH=3D. $(PYTHON) $^/a\\t@if [ "$$?" !=
=3D
>>>>>> "0" ];then echo "FAIL:"$^;else echo "PASS:"$^;fi'
>>>>>> ${D}${PTEST_PATH}/tests/Makefile
>>>>>> >  }
>>>>>> >
>>>>>> >
>>>>>> >
>>>>>>
>>>>>>
>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>> Links: You receive all messages sent to this group.
>>>>> View/Reply Online (#226864):
>>>>> https://lists.openembedded.org/g/openembedded-core/message/226864
>>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openemb=
edded.org_g_openembedded-2Dcore_message_226864&d=3DDwMFaQ&c=3DncDTmphkJTvjI=
DPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m=
67E&m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&s=
=3DRM3vVpXB68pNmt1v3I8UHhC8fbIHFusxWhHViuMiKjI&e=3D>
>>>>> Mute This Topic: https://lists.openembedded.org/mt/115910660/1997914
>>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openemb=
edded.org_mt_115910660_1997914&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabg=
GkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6dqwyPgB=
XigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DTfGnmOyEtO9VQX=
e3p4174fbjQnzAW_wgb7-9bBzLre4&e=3D>
>>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
>>>>> <https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openemb=
edded.org_g_openembedded-2Dcore_unsub&d=3DDwMFaQ&c=3DncDTmphkJTvjIDPh0hpF_4=
vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D6=
dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&s=3DHrgmZCb=
tNYqyFd-8EM0T4MpJVrJzIQuEEgQV1qr3Mkg&e=3D>
>>>>> [raj.khem@gmail.com]
>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>
>>>>>

--000000000000088c1806453c0d3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">My case is yoe distro rpi4-64 building yoe-kiosk-image I =
do not set IMAGE_LINGUAS to get into the problem if I set it then it works=
=C2=A0</div><div dir=3D"auto"><br><div class=3D"gmail_quote gmail_quote_con=
tainer" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 5, 2=
025 at 2:16=E2=80=AFPM Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier=
@snap.com">ecordonnier@snap.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr">Hi Khem,<br>I&#39;ve not managed to reproduc=
e at the moment,=C2=A0neither=C2=A0on=C2=A0poky nor on yoe-distro. I&#39;m =
on Ubuntu 24.04. Can you maybe send me your local.conf?:<br><br>ecordonnier=
@lj8k2dq3:~/dev/yoe$ cat conf/local.conf<br>IMAGE_LINGUAS =3D &quot;en-us e=
n-gb&quot;<br>ENABLE_BINARY_LOCALE_GENERATION =3D &quot;1&quot;<br>SSTATE_M=
IRRORS =3D &quot; \<br>=C2=A0 =C2=A0 file://.* <a href=3D"https://sstate.yo=
ctoproject.org/all/PATH;downloadfilename=3DPATH" target=3D"_blank">https://=
sstate.yoctoproject.org/all/PATH;downloadfilename=3DPATH</a> \<br>&quot;<br=
>ecordonnier@lj8k2dq3:~/dev/yoe$ git rev-parse HEAD<br>7ce0a300ea45d28cfd58=
094cb5e9e07651797226<br>cordonnier@lj8k2dq3:~/dev/yoe$ . ./envsetup.sh rpi4=
-64<br>Setting PROJECT=3Drpi4-64<br>Setting MACHINE=3Draspberrypi4-64<br>/h=
ome/ecordonnier/dev/yoe/conf/auto.conf has been updated<br>Setting DOCKER_R=
EPO to yoedistro/yoe-build:trixie-x86_64<br>ecordonnier@lj8k2dq3:~/dev/yoe$=
 yoe_setup<br>ecordonnier@lj8k2dq3:~/dev/yoe$ bitbake yoe-kiosk-image<br>NO=
TE: Started PRServer with DBfile: /home/ecordonnier/dev/yoe/cache/prserv.sq=
lite3, Address: <a href=3D"http://127.0.0.1:44795" target=3D"_blank">127.0.=
0.1:44795</a>, PID: 111<br>WARNING: You are using a local hash equivalence =
server but have configured an sstate mirror. This will likely mean no sstat=
e will match from the mirror. You may wish to disable the hash equivalence =
use (BB_HASHSERVE), or use a hash equivalence server alongside the sstate m=
irror.<br>Loading cache: 100% |############################################=
###########################################################################=
###########################################################################=
##################| Time: 0:00:02<br>Loaded 5831 entries from dependency ca=
che.<br>NOTE: Resolving any missing task queue dependencies<br><br>Build Co=
nfiguration:<br>BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;2.1=
6.0&quot;<br>BUILD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x=
86_64-linux&quot;<br>NATIVELSBSTRING =C2=A0 =C2=A0 =C2=A0=3D &quot;universa=
l&quot;<br>TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;aarch64-=
yoe-linux&quot;<br>MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D &quot;raspberrypi4-64&quot;<br>DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D &quot;yoe&quot;<br>DISTRO_VERSION =C2=A0 =C2=A0 =C2=
=A0 =3D &quot;2025.11&quot;<br>TUNE_FEATURES =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=
 &quot;aarch64 crc cortexa72 nocrypto&quot;<br>TARGET_FPU =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D &quot;&quot;<br>meta-yoe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D &quot;master:7ce0a300ea45d28cfd58094cb5e9e07651797226&quo=
t;<br>meta-raspberrypi =C2=A0 =C2=A0 =3D &quot;HEAD:b667e177b1e6642cb113018=
01db44d4515c1652d&quot;<br>meta-clang =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D &quot;HEAD:d0a67c76b7a3b585dbe2ba8ad509dc0fe0e58af2&quot;<br>meta-qt6 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;HEAD:836b1c3212c3562c09=
09468ab415df98c1145759&quot;<br>meta-filesystems =C2=A0 =C2=A0 <br>meta-gno=
me =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>meta-initramfs =C2=A0 =C2=A0 =C2=
=A0 <br>meta-multimedia =C2=A0 =C2=A0 =C2=A0<br>meta-networking =C2=A0 =C2=
=A0 =C2=A0<br>meta-oe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>m=
eta-perl =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>meta-python =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>meta-webserver =C2=A0 =C2=A0 =C2=A0 <br>meta=
-xfce =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;HEAD:219328f37cbf6=
aa4b2d7b77d21e00240543d73ad&quot;<br>meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;HEAD:ac7327583aef83fd400190506f3147623de=
38b68&quot;<br><br>Sstate summary: Wanted 2 Local 0 Mirrors 2 Missed 0 Curr=
ent 3493 (100% match, 100% complete)#######################################=
###########################################################################=
##### =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| ETA: =C2=A00:00:00<br>Initialising tasks: 100% |##################=
###########################################################################=
###########################################################################=
#######################################| Time: 0:00:05<br>NOTE: Executing T=
asks<br>NOTE: Tasks Summary: Attempted 7090 tasks of which 7088 didn&#39;t =
need to be rerun and all succeeded.<br>NOTE: Writing buildhistory<br>NOTE: =
Writing buildhistory took: 5 seconds<br><br>Summary: There was 1 WARNING me=
ssage.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Thu, Dec 4, 2025 at 7:56=E2=80=AFPM Etienne Cordonnier &lt;<a href=
=3D"mailto:ecordonnier@snap.com" target=3D"_blank">ecordonnier@snap.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr">Hi Khem,<br>I haven&#39;t had the time to debug yet, but I&#39=
;ve seen your message.<br><br>=C3=89tienne</div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 3, 2025 at 10:35=E2=
=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blan=
k">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr">It can be reproduced with direct invo=
cation<div><br></div><div>kraj@apollo /mnt/b/yoe/master/build/tmp/work/rasp=
berrypi4_64-yoe-linux/yoe-kiosk-image/1.0<br>=E2=9D=AF recipe-sysroot-nativ=
e/usr/bin/opkg \<br>=C2=A0 --volatile-cache \<br>=C2=A0 -f opkg.conf \<br>=
=C2=A0 -t temp/ipktemp/ \<br>=C2=A0 -o rootfs \<br>=C2=A0 --force-postinsta=
ll \<br>=C2=A0 --prefer-arch-to-version \<br>=C2=A0 --force-depends \<br>=
=C2=A0 remove glibc-binary-localedata-en-gb glibc-binary-localedata-c glibc=
-binary-localedata-en-us<br><br>[1] =C2=A0 =C2=A0346156 segmentation fault =
(core dumped) =C2=A0recipe-sysroot-native/usr/bin/opkg --volatile-cache -f =
opkg.conf -t =C2=A0-o roots</div><div><br></div><div>I have a workaround by=
 setting</div><div><br></div><div>IMAGE_LINGUAS =3D &quot;en-us&quot;<br></=
div><div><br></div><div>in local.conf which avoids the need for=C2=A0opkg r=
emove operation which is crashing.</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 3, 2025 at 1:04=E2=80=
=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">=
raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><div dir=3D"ltr">I am starting to see the following crash=
 in opkg when building image. Anyone seeing something=C2=A0like this?<div><=
br></div><div>(No debugging symbols found in /mnt/b/yoe/master/build/tmp/wo=
rk/raspberrypi4_64-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-native/usr/=
bin/opkg)<br>[New LWP 34493]<br>[Thread debugging using libthread_db enable=
d]<br>Using host libthread_db library &quot;/usr/lib/libthread_db.so.1&quot=
;.<br>Core was generated by `/mnt/b/yoe/master/build/tmp/work/raspberrypi4_=
64-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-native/usr/bin/opkg --volat=
ile-cache -f /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe=
-kiosk-image/1.0/opkg.conf -t /mnt/b/yoe/master/build/tmp/work/raspberrypi4=
_64-yoe-linux/yoe-kiosk-image/1.0/temp/ipktemp/ -o /mnt/b/yoe/master/build/=
tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/1.0/rootfs --force-posti=
nstall --prefer-arch-to-version --force-depends remove glibc-binary-localed=
ata-en-gb glibc-binary-localedata-c glibc-binary-localedata-en-us&#39;.<br>=
Program terminated with signal SIGSEGV, Segmentation fault.<br>#0 =C2=A00x0=
0007f50a8190d20 in stringpool_strn2id () from /mnt/b/yoe/master/build/tmp/w=
ork/raspberrypi4_64-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-native/usr=
/bin/../lib/./libsolv.so.1<br>(gdb) bt<br>#0 =C2=A00x00007f50a8190d20 in st=
ringpool_strn2id () from /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-y=
oe-linux/yoe-kiosk-image/1.0/recipe-sysroot-native/usr/bin/../lib/./libsolv=
.so.1<br>#1 =C2=A00x00007f50a818a3dc in pool_str2id () from /mnt/b/yoe/mast=
er/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/1.0/recipe-sysr=
oot-native/usr/bin/../lib/./libsolv.so.1<br>#2 =C2=A00x00007f50a84fe4ad in =
?? () from /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-k=
iosk-image/1.0/recipe-sysroot-native/usr/bin/../lib/libopkg.so.1<br>#3 =C2=
=A00x00007f50a84ff4df in opkg_solver_remove () from /mnt/b/yoe/master/build=
/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-nati=
ve/usr/bin/../lib/libopkg.so.1<br>#4 =C2=A00x00007f50a84e9bfb in ?? () from=
 /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image=
/1.0/recipe-sysroot-native/usr/bin/../lib/libopkg.so.1<br>#5 =C2=A00x00007f=
50a84eadb2 in opkg_cmd_exec () from /mnt/b/yoe/master/build/tmp/work/raspbe=
rrypi4_64-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-native/usr/bin/../li=
b/libopkg.so.1<br>#6 =C2=A00x00005557220b6a9d in ?? ()<br>#7 =C2=A00x00007f=
50a8311f68 in __libc_start_call_main () from /mnt/b/yoe/master/build/tmp/sy=
sroots-uninative/x86_64-linux/lib/libc.so.6<br>#8 =C2=A00x00007f50a831201b =
in __libc_start_main () from /mnt/b/yoe/master/build/tmp/sysroots-uninative=
/x86_64-linux/lib/libc.so.6<br>#9 =C2=A00x00005557220b6bf1 in ?? ()</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Thu, Nov 27, 2025 at 10:11=E2=80=AFAM Etienne Cordonnier via <a href=3D"ht=
tps://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.org&=
amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3D=
AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEO=
ukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&amp;s=3D7Hhr9df0PBRkpiFWBooOX6tv5=
kZhGeHxO5S6vVaNiw8&amp;e=3D" target=3D"_blank">lists.openembedded.org</a> &=
lt;ecordonnier=3D<a href=3D"mailto:snap.com@lists.openembedded.org" target=
=3D"_blank">snap.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Gyorgy,<br>I=
 have sent a patch to opkg upstream which disables the ACL option by defaul=
t again (it is <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp=
s-3A__lists.yoctoproject.org_g_opkg_message_175&amp;d=3DDwMFaQ&amp;c=3DncDT=
mphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1D=
ULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-=
HmRl8UbCQaTnb5&amp;s=3D4U1D3q2TfA7jjhTo68DgNSOLopG_6Nlj6Ta9OG8TN_g&amp;e=3D=
" target=3D"_blank">https://lists.yoctoproject.org/g/opkg/message/175</a> ,=
 however the web-view doesn&#39;t seem to work at the moment. I only see &q=
uot;Forbidden&quot;).<br><br>=C3=89tienne<br><br><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 27, 2025=
 at 6:08=E2=80=AFPM Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.=
com" target=3D"_blank">skandigraun@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">I just tried this, but it seems=
 that the ACL switch was toggled during<br>
the CMake transition. With Autotools ACL was disabled by default, but<br>
with CMake it seems to be enabled - and it complains that it can&#39;t find=
<br>
libacl on my machine.<br>
<br>
On 10/23/25 15:46, Etienne Cordonnier via <a href=3D"https://urldefense.pro=
ofpoint.com/v2/url?u=3Dhttp-3A__lists.openembedded.org&amp;d=3DDwMFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_=
yW13Nh-HmRl8UbCQaTnb5&amp;s=3D7Hhr9df0PBRkpiFWBooOX6tv5kZhGeHxO5S6vVaNiw8&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wr=
ote:<br>
&gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" t=
arget=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt;<br>
&gt; See release notes at<br>
&gt; - <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__dow=
nloads.yoctoproject.org_releases_opkg_opkg-2D0.9.0.release-2Dnotes&amp;d=3D=
DwICaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWW=
RXTj24AF_PScvk4Y_QGHVaD7rHvEf9Kx5&amp;s=3Dqvmy1QT46Bl7mVt_XDbuHiic2IjU6z7Zk=
u_Gid-CVYc&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefens=
e.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoctoproject.org_releases_op=
kg_opkg-2D0.9.0.release-2Dnotes&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjIDPh0hpF=
_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E=
&amp;m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y_QGHVaD7rHvEf9Kx5&a=
mp;s=3Dqvmy1QT46Bl7mVt_XDbuHiic2IjU6z7Zku_Gid-CVYc&amp;e=3D</a> <br>
&gt;<br>
&gt; [0.9.0] - 2025-06-27<br>
&gt;<br>
&gt; Semiannual opkg release.<br>
&gt; Bumping the minor version as a result of the project build tooling cha=
nging from autotools to cmake.<br>
&gt;<br>
&gt; - Added a Dockerfile container definition (`:docker/`) for a valid dev=
eloper build environment for opkg.<br>
&gt;=C2=A0 =C2=A0- It&#39;s recommended that project contributors use this =
container to build and test their changes.<br>
&gt; - The AutoTools-based build framework has [been replaced](<a href=3D"h=
ttps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_=
opkg_commit_-3Fid-3D3f6040e321634471ec442fb0e80f140f1437e90b&amp;d=3DDwICaQ=
&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRf=
Px_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24=
AF_PScvk4Y_QGHVaD7rHvEf9Kx5&amp;s=3DGgRxioBjt-ii5JWUrYQ0I-FmXvKxVxKNH3Nj22i=
_jiM&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proo=
fpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_opkg_commit_-3Fid-3D3f=
6040e321634471ec442fb0e80f140f1437e90b&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjI=
DPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSG=
a66m67E&amp;m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y_QGHVaD7rHvE=
f9Kx5&amp;s=3DGgRxioBjt-ii5JWUrYQ0I-FmXvKxVxKNH3Nj22i_jiM&amp;e=3D</a> ) wi=
th a more modern, CMake framework.<br>
&gt;=C2=A0 =C2=A0- Refer to the `docs/CONTRIBUTING.md` documentation for up=
dated build instructions.<br>
&gt;<br>
&gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../opkg/opkg/0002-config.h.in-fix-typo.patch | 27 +++++++++++++=
++++++<br>
&gt;=C2=A0 meta/recipes-devtools/opkg/opkg/run-ptest=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
&gt;=C2=A0 .../opkg/{<a href=3D"https://urldefense.proofpoint.com/v2/url?u=
=3Dhttp-3A__opkg-5F0.8.0.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vC=
HvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp=
;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&amp;s=
=3DXvRK6ACbDsce-6GfM1z7bmWP89Drkdoim4UnjGId7jE&amp;e=3D" rel=3D"noreferrer"=
 target=3D"_blank">opkg_0.8.0.bb</a> =3D&gt; <a href=3D"https://urldefense.=
proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.bb&amp;d=3DDwMFaQ&amp;c=3Dn=
cDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRi=
h1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13=
Nh-HmRl8UbCQaTnb5&amp;s=3DPCgmYCv6lZBoj7mQyNmGExGtaa-iO2KXWfMw-LSuRro&amp;e=
=3D" rel=3D"noreferrer" target=3D"_blank">opkg_0.9.0.bb</a>}=C2=A0 =C2=A0 =
=C2=A0| 22 ++++++++-------<br>
&gt;=C2=A0 3 files changed, 41 insertions(+), 10 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/opkg/opkg/0002-config.h=
.in-fix-typo.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/opkg/{<a href=3D"https://urldefense=
.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.8.0.bb&amp;d=3DDwMFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW1=
3Nh-HmRl8UbCQaTnb5&amp;s=3DXvRK6ACbDsce-6GfM1z7bmWP89Drkdoim4UnjGId7jE&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">opkg_0.8.0.bb</a> =3D&gt; <a hre=
f=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.bb&=
amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3D=
AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEO=
ukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&amp;s=3DPCgmYCv6lZBoj7mQyNmGExGta=
a-iO2KXWfMw-LSuRro&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">opkg_0.9.=
0.bb</a>} (76%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo=
.patch b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch<br=
>
&gt; new file mode 100644<br>
&gt; index 00000000000..626bbd01b68<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch<=
br>
&gt; @@ -0,0 +1,27 @@<br>
&gt; +From 5a81faadbc2397d554bc598d535fd2d44cbc8d10 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" =
target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; +Date: Mon, 20 Oct 2025 18:57:56 +0200<br>
&gt; +Subject: [PATCH] <a href=3D"https://urldefense.proofpoint.com/v2/url?=
u=3Dhttp-3A__config.h.in&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=
=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&amp;s=
=3DdOZFRTTcPycQ3CB3uYzjTaJbkYiw-ptty6e5ymgao80&amp;e=3D" rel=3D"noreferrer"=
 target=3D"_blank">config.h.in</a>: fix typo<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://urldefense.proofpoint.c=
om/v2/url?u=3Dhttps-3A__git.yoctoproject.org_opkg_commit_-3Fid-3Dd723a90bfe=
6409c7ad983ed911225d4aefbfd09e&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_=
4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&=
amp;m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y_QGHVaD7rHvEf9Kx5&am=
p;s=3D5scf6nlpBtSePSuPjyopoX7FmlAyiSwI03Ry11w4tl8&amp;e=3D" rel=3D"noreferr=
er" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=
__git.yoctoproject.org_opkg_commit_-3Fid-3Dd723a90bfe6409c7ad983ed911225d4a=
efbfd09e&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw=
&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D1A1uWL9SVAUWAO=
RYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y_QGHVaD7rHvEf9Kx5&amp;s=3D5scf6nlpBtSePSuP=
jyopoX7FmlAyiSwI03Ry11w4tl8&amp;e=3D</a> ]<br>
&gt; +Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@s=
nap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; +---<br>
&gt; + <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__con=
fig.h.in&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw=
&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzf=
ameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&amp;s=3DdOZFRTTcPycQ3CB3=
uYzjTaJbkYiw-ptty6e5ymgao80&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">=
config.h.in</a> | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3D=
http-3A__config.h.in&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGk=
ICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D6d=
qwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&amp;s=3DdOZF=
RTTcPycQ3CB3uYzjTaJbkYiw-ptty6e5ymgao80&amp;e=3D" rel=3D"noreferrer" target=
=3D"_blank">config.h.in</a> b/<a href=3D"https://urldefense.proofpoint.com/=
v2/url?u=3Dhttp-3A__config.h.in&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF=
_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E=
&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&a=
mp;s=3DdOZFRTTcPycQ3CB3uYzjTaJbkYiw-ptty6e5ymgao80&amp;e=3D" rel=3D"norefer=
rer" target=3D"_blank">config.h.in</a><br>
&gt; +index 4fa9842..877b8c7 100644<br>
&gt; +--- a/<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A=
__config.h.in&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epc=
kfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBX=
igbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&amp;s=3DdOZFRTTcPyc=
Q3CB3uYzjTaJbkYiw-ptty6e5ymgao80&amp;e=3D" rel=3D"noreferrer" target=3D"_bl=
ank">config.h.in</a><br>
&gt; ++++ b/<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A=
__config.h.in&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epc=
kfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBX=
igbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&amp;s=3DdOZFRTTcPyc=
Q3CB3uYzjTaJbkYiw-ptty6e5ymgao80&amp;e=3D" rel=3D"noreferrer" target=3D"_bl=
ank">config.h.in</a><br>
&gt; +@@ -2,7 +2,7 @@<br>
&gt; + #cmakedefine01 WITH_XZ<br>
&gt; + #cmakedefine01 WITH_BZIP2<br>
&gt; + #cmakedefine01 WITH_LZ4<br>
&gt; +-#cmakedefine01 WITH_LZSTD<br>
&gt; ++#cmakedefine01 WITH_ZSTD<br>
&gt; + #cmakedefine01 WITH_CURL<br>
&gt; + #cmakedefine01 WITH_SSLCURL<br>
&gt; + #cmakedefine01 WITH_ACL<br>
&gt; +-- <br>
&gt; +2.43.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/opkg/opkg/run-ptest b/meta/recipes-=
devtools/opkg/opkg/run-ptest<br>
&gt; index 5fb7077eec9..d485a4aace5 100644<br>
&gt; --- a/meta/recipes-devtools/opkg/opkg/run-ptest<br>
&gt; +++ b/meta/recipes-devtools/opkg/opkg/run-ptest<br>
&gt; @@ -2,4 +2,4 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 OPKG_PATH=3D$(which opkg)<br>
&gt;=C2=A0 <br>
&gt; -make OPKG_PATH=3D$OPKG_PATH run-tests<br>
&gt; +make -C tests DATADIR=3D/share SYSCONFDIR=3D/etc VARDIR=3D/var OPKG_P=
ATH=3D$OPKG_PATH<br>
&gt; diff --git a/meta/recipes-devtools/opkg/<a href=3D"https://urldefense.=
proofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.8.0.bb&amp;d=3DDwMFaQ&amp;c=3Dn=
cDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRi=
h1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13=
Nh-HmRl8UbCQaTnb5&amp;s=3DXvRK6ACbDsce-6GfM1z7bmWP89Drkdoim4UnjGId7jE&amp;e=
=3D" rel=3D"noreferrer" target=3D"_blank">opkg_0.8.0.bb</a> b/meta/recipes-=
devtools/opkg/<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-=
3A__opkg-5F0.9.0.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkI=
CC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D6dq=
wyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&amp;s=3DPCgmY=
Cv6lZBoj7mQyNmGExGtaa-iO2KXWfMw-LSuRro&amp;e=3D" rel=3D"noreferrer" target=
=3D"_blank">opkg_0.9.0.bb</a><br>
&gt; similarity index 76%<br>
&gt; rename from meta/recipes-devtools/opkg/<a href=3D"https://urldefense.p=
roofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.8.0.bb&amp;d=3DDwMFaQ&amp;c=3Dnc=
DTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih=
1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13N=
h-HmRl8UbCQaTnb5&amp;s=3DXvRK6ACbDsce-6GfM1z7bmWP89Drkdoim4UnjGId7jE&amp;e=
=3D" rel=3D"noreferrer" target=3D"_blank">opkg_0.8.0.bb</a><br>
&gt; rename to meta/recipes-devtools/opkg/<a href=3D"https://urldefense.pro=
ofpoint.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.bb&amp;d=3DDwMFaQ&amp;c=3DncDT=
mphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1D=
ULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-=
HmRl8UbCQaTnb5&amp;s=3DPCgmYCv6lZBoj7mQyNmGExGtaa-iO2KXWfMw-LSuRro&amp;e=3D=
" rel=3D"noreferrer" target=3D"_blank">opkg_0.9.0.bb</a><br>
&gt; index 12e2edf7e3f..ed2f36d636b 100644<br>
&gt; --- a/meta/recipes-devtools/opkg/<a href=3D"https://urldefense.proofpo=
int.com/v2/url?u=3Dhttp-3A__opkg-5F0.8.0.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmphk=
JTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJT=
KUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl=
8UbCQaTnb5&amp;s=3DXvRK6ACbDsce-6GfM1z7bmWP89Drkdoim4UnjGId7jE&amp;e=3D" re=
l=3D"noreferrer" target=3D"_blank">opkg_0.8.0.bb</a><br>
&gt; +++ b/meta/recipes-devtools/opkg/<a href=3D"https://urldefense.proofpo=
int.com/v2/url?u=3Dhttp-3A__opkg-5F0.9.0.bb&amp;d=3DDwMFaQ&amp;c=3DncDTmphk=
JTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJT=
KUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl=
8UbCQaTnb5&amp;s=3DPCgmYCv6lZBoj7mQyNmGExGtaa-iO2KXWfMw-LSuRro&amp;e=3D" re=
l=3D"noreferrer" target=3D"_blank">opkg_0.9.0.bb</a><br>
&gt; @@ -15,34 +15,35 @@ PE =3D &quot;1&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttp-3A__downloads.yoctoproject.org_releases_-24-257BBPN-257D_-24=
-257BBPN-257D-2D-24-257BPV-257D.tar.gz&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjI=
DPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSG=
a66m67E&amp;m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y_QGHVaD7rHvE=
f9Kx5&amp;s=3DmKc8LzZ_Q2orQLqa_38Jr7E7tfyD4-rcsgI-wPkx_Zg&amp;e=3D" rel=3D"=
noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3D=
http-3A__downloads.yoctoproject.org_releases_-24-257BBPN-257D_-24-257BBPN-2=
57D-2D-24-257BPV-257D.tar.gz&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4v=
CHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&am=
p;m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y_QGHVaD7rHvEf9Kx5&amp;=
s=3DmKc8LzZ_Q2orQLqa_38Jr7E7tfyD4-rcsgI-wPkx_Zg&amp;e=3D</a>=C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://opkg.conf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-opkg_conf-c=
reate-opkg.lock-in-run-instead-of-var-run.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-config.h.in-fix-=
typo.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI[sha256sum] =3D &quot;582a4c9e220cce0b7d08a0915c95db9f24ae43ad=
372ed5d42d5ec5f6cd413f0c&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;440ef321862e01f83da4d02884a0cbb4d9d7b32f=
82faa81a6a85493f0c89d0f5&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # This needs to be before ptest inherit, otherwise all ptest fil=
es end packaged<br>
&gt;=C2=A0 # in libopkg package if OPKGLIBDIR =3D=3D libdir, because defaul=
t<br>
&gt;=C2=A0 # PTEST_PATH ?=3D &quot;${libdir}/${BPN}/ptest&quot;<br>
&gt;=C2=A0 PACKAGES =3D+ &quot;libopkg&quot;<br>
&gt;=C2=A0 <br>
&gt; -inherit autotools pkgconfig ptest<br>
&gt; +inherit cmake pkgconfig ptest<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 target_localstatedir :=3D &quot;${localstatedir}&quot;<br>
&gt;=C2=A0 OPKGLIBDIR ??=3D &quot;${target_localstatedir}/lib&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PACKAGECONFIG ??=3D &quot;libsolv&quot;<br>
&gt;=C2=A0 <br>
&gt; -PACKAGECONFIG[gpg] =3D &quot;--enable-gpg,--disable-gpg,\<br>
&gt; +PACKAGECONFIG[gpg] =3D &quot;-DWITH_GPGME=3DON,-DWITH_GPGME=3DOFF,\<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 gnupg gpgme libgpg-error,\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${@ &quot;gnupg&quot; if (&quot;native&quot; in d.=
getVar(&quot;PN&quot;)) else &quot;gnupg-gpg&quot;}\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; -PACKAGECONFIG[curl] =3D &quot;--enable-curl,--disable-curl,curl&quot;=
<br>
&gt; -PACKAGECONFIG[ssl-curl] =3D &quot;--enable-ssl-curl,--disable-ssl-cur=
l,curl openssl&quot;<br>
&gt; -PACKAGECONFIG[sha256] =3D &quot;--enable-sha256,--disable-sha256&quot=
;<br>
&gt; -PACKAGECONFIG[libsolv] =3D &quot;--with-libsolv,--without-libsolv,lib=
solv&quot;<br>
&gt; +PACKAGECONFIG[curl] =3D &quot;-DWITH_CURL=3DON,-DWITH_CURL=3DOFF,curl=
&quot;<br>
&gt; +PACKAGECONFIG[ssl-curl] =3D &quot;-DWITH_SSLCURL=3DON,-DWITH_SSLCURL=
=3DOFF,curl openssl&quot;<br>
&gt; +PACKAGECONFIG[sha256] =3D &quot;-DWITH_SHA256=3DON,-DWITH_SHA256=3DOF=
F&quot;<br>
&gt; +PACKAGECONFIG[libsolv] =3D &quot;-DUSE_SOLVER_LIBSOLV=3DON,-DUSE_SOLV=
ER_LIBSOLV=3DOFF,libsolv&quot;<br>
&gt;=C2=A0 <br>
&gt; -EXTRA_OECONF =3D &quot;--enable-zstd&quot;<br>
&gt; -EXTRA_OECONF:append:class-native =3D &quot; --localstatedir=3D/${@os.=
path.relpath(&#39;${localstatedir}&#39;, &#39;${STAGING_DIR_NATIVE}&#39;)} =
--sysconfdir=3D/${@os.path.relpath(&#39;${sysconfdir}&#39;, &#39;${STAGING_=
DIR_NATIVE}&#39;)}&quot;<br>
&gt; +EXTRA_OECMAKE =3D &quot;-DWITH_ZSTD=3DON&quot;<br>
&gt; +EXTRA_OECMAKE:append:class-native =3D &quot; -DVARDIR=3D/${@os.path.r=
elpath(&#39;${localstatedir}&#39;, &#39;${STAGING_DIR_NATIVE}&#39;)} -DSYSC=
ONFDIR=3D/${@os.path.relpath(&#39;${sysconfdir}&#39;, &#39;${STAGING_DIR_NA=
TIVE}&#39;)}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_install:append () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/opkg<br>
&gt; @@ -56,6 +57,9 @@ do_install:append () {<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_install_ptest () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# the ptest class uses a Makefile for installatio=
n, but cmake uses Ninja per default so we need to install ptests manually:<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0cp -r ${S}/tests ${D}${PTEST_PATH}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;/@echo $^/d&#39; ${D}${PTEST_=
PATH}/tests/Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;/@PYTHONPATH=3D. $(PYTHON) $^=
/a\\t@if [ &quot;$$?&quot; !=3D &quot;0&quot; ];then echo &quot;FAIL:&quot;=
$^;else echo &quot;PASS:&quot;$^;fi&#39; ${D}${PTEST_PATH}/tests/Makefile<b=
r>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#226864): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_22=
6864&amp;d=3DDwMFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameB=
p2CEOukeCpM2DUfu0sg0bB32_yW13Nh-HmRl8UbCQaTnb5&amp;s=3DRM3vVpXB68pNmt1v3I8U=
HhC8fbIHFusxWhHViuMiKjI&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://lists.openembedded.org/g/openembedded-core/message/226864</a><br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_115910660_1997914&amp;d=3DDwMFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_yW1=
3Nh-HmRl8UbCQaTnb5&amp;s=3DTfGnmOyEtO9VQXe3p4174fbjQnzAW_wgb7-9bBzLre4&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115910660/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwMFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3D6dqwyPgBXigbzfameBp2CEOukeCpM2DUfu0sg0bB32_=
yW13Nh-HmRl8UbCQaTnb5&amp;s=3DHrgmZCbtNYqyFd-8EM0T4MpJVrJzIQuEEgQV1qr3Mkg&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.or=
g/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>
</blockquote></div></div>

--000000000000088c1806453c0d3d--

