Return-Path: <cordlandwehr@kde.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6853BE9272A
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 19:18:32 +0000 (UTC)
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by mx.groups.io with SMTP id smtpd.web11.24767.1696533503991327145
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 12:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kde.org header.s=users header.b=lu0s0pJn;
 spf=pass (domain: kde.org, ip: 46.43.1.242, mailfrom: cordlandwehr@kde.org)
Received: from [IPV6:2003:e2:7f45:2f00:231b:a83b:3afc:caa3] (p200300e27f452f00231ba83b3afccaa3.dip0.t-ipconnect.de [IPv6:2003:e2:7f45:2f00:231b:a83b:3afc:caa3])
	(Authenticated sender: cordlandwehr)
	by letterbox.kde.org (Postfix) with ESMTPSA id DF08832CE1E;
	Thu,  5 Oct 2023 20:18:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
	t=1696533502; bh=qPinkS3jsS5ygSOpqrf+mq5ZKZZ0M36xjcMzqRtzmNY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lu0s0pJnW1NPDMUHd0TbSTjxHSx3k0KszHdLovg+fQ2gIneptF4oqzWBQvFyqkiys
	 R4c4fTTh+AxpZV29Hjqc6AoeUnmAoKKX85G9ezcVe5sQ6mlvtO4JbGHfTGvENXWemV
	 sabzWb6oxbBBjfR7PxXYcNzkU58Pdi+/Ix7YblKDE0SlWSuA2RzYk+ETah0JSlbopL
	 q4PZgEGIeR+E4YZVpkz0FpMgsyqo48mQBnHAoRVD8IIsmEORWLqLXT1khYdKNoRRyQ
	 gb6j5kRws46xxU01bvQcadN/vG5i5VXBbjUsC7GKynsnPgXWmFWS076LmzJGh0Pelo
	 WyOnMP4TfRTNw==
Message-ID: <3acd980a-f3d2-cd5b-faef-8dbcca331dee@kde.org>
Date: Thu, 5 Oct 2023 21:18:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [OE-core] [PATCH] wayland: consider pkgconfig sysroot for
 pkgdatadir
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20231001102818.797907-1-cordlandwehr@kde.org>
 <CANNYZj_mUOxDWyT68ygkD4q5dEwP08FdAsb7JG1UUxesDorzfQ@mail.gmail.com>
From: Andreas Cord-Landwehr <cordlandwehr@kde.org>
In-Reply-To: <CANNYZj_mUOxDWyT68ygkD4q5dEwP08FdAsb7JG1UUxesDorzfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 19:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188729

Hi Alex,

this patch is needed for building kwin and layer-shell-qt from meta-kde 
layer. Right now, we carry this patch for Wayland to fix essentially 
pkg-config's call "pkg-config --variable=pkgdatadir wayland-client" to 
locate the folder with wayland.xml, which is needed during code 
generation of the C & C++ API with wayland-scanner and qtwaylandscanner.
Without the patch the pkgdatadir location is reported, and I think that 
is the biggest issue here, to be "/usr/share/wayland/" as an absolute 
path and thus breaks out of the recipe-sysroot and leaks the host 
system's wayland.xml in the build process.

Regarding a switch away from pkg-config, I like to let others comment 
with more insights into that topic :)

Best regards,
Andreas

On 05.10.23 10:53, Alexander Kanavin wrote:
> Can you show where this is causing problems for you? We're not seeing
> the issue in CI builds, so the problem this is solving needs to be
> better explained.
> 
> Also upstream has a point: we should migrate away from a long
> unmaintained freedesktop pkg-config.
> 
> Alex
> 
> On Sun, 1 Oct 2023 at 12:28, Andreas Cord-Landwehr <cordlandwehr@kde.org> wrote:
>>
>> Fix pkgconfig find calls to find wayland protocol XML files.
>> See discussion in:
>> https://gitlab.freedesktop.org/wayland/wayland/-/merge_requests/102
>>
>> Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
>> ---
>>   ...der-pkgconfig-sysroot-for-pkgdatadir.patch | 46 +++++++++++++++++++
>>   .../wayland/wayland_1.22.0.bb                 |  1 +
>>   2 files changed, 47 insertions(+)
>>   create mode 100644 meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch
>>
>> diff --git a/meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch b/meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch
>> new file mode 100644
>> index 0000000000..4573bb635a
>> --- /dev/null
>> +++ b/meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch
>> @@ -0,0 +1,46 @@
>> +From ff8ecbe8891d592e645927659318720f9e190054 Mon Sep 17 00:00:00 2001
>> +From: Andreas Cord-Landwehr <cordlandwehr@kde.org>
>> +Date: Sun, 6 Feb 2022 17:23:46 +0100
>> +Subject: [PATCH] Consider pkgconfig sysroot for pkgdatadir
>> +
>> +For libs/cflags this is done automatically, but not for manually accessed
>> +variables. This matches what wayland-protocols does.
>> +
>> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/wayland/-/merge_requests/272]
>> +---
>> + src/meson.build | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/src/meson.build b/src/meson.build
>> +index a8a1d2b..721e151 100644
>> +--- a/src/meson.build
>> ++++ b/src/meson.build
>> +@@ -65,7 +65,7 @@ if get_option('scanner')
>> +               version: meson.project_version(),
>> +               variables: [
>> +                       'datarootdir=' + join_paths('${prefix}', get_option('datadir')),
>> +-                      'pkgdatadir=' + join_paths('${datarootdir}', meson.project_name()),
>> ++                      'pkgdatadir=' + join_paths('${pc_sysrootdir}${datarootdir}', meson.project_name()),
>> +                       'bindir=' + join_paths('${prefix}', get_option('bindir')),
>> +                       'wayland_scanner=${bindir}/wayland-scanner'
>> +               ],
>> +@@ -211,7 +211,7 @@ if get_option('libraries')
>> +               filebase: 'wayland-server',
>> +               variables: [
>> +                       'datarootdir=' + join_paths('${prefix}', get_option('datadir')),
>> +-                      'pkgdatadir=' + join_paths('${datarootdir}', meson.project_name())
>> ++                      'pkgdatadir=' + join_paths('${pc_sysrootdir}${datarootdir}', meson.project_name())
>> +               ]
>> +       )
>> +
>> +@@ -250,7 +250,7 @@ if get_option('libraries')
>> +               filebase: 'wayland-client',
>> +               variables: [
>> +                       'datarootdir=' + join_paths('${prefix}', get_option('datadir')),
>> +-                      'pkgdatadir=' + join_paths('${datarootdir}', meson.project_name())
>> ++                      'pkgdatadir=' + join_paths('${pc_sysrootdir}${datarootdir}', meson.project_name())
>> +               ]
>> +       )
>> +
>> +--
>> +2.37.2
>> diff --git a/meta/recipes-graphics/wayland/wayland_1.22.0.bb b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
>> index 26bad580eb..17e4a0cd98 100644
>> --- a/meta/recipes-graphics/wayland/wayland_1.22.0.bb
>> +++ b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
>> @@ -15,6 +15,7 @@ DEPENDS = "expat libffi wayland-native"
>>   SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
>>              file://run-ptest \
>>              file://0001-build-Fix-strndup-detection-on-MinGW.patch \
>> +           file://0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch \
>>              "
>>   SRC_URI[sha256sum] = "1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12936ebb7e7cbc2425842"
>>
>> --
>> 2.39.2
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#188480): https://lists.openembedded.org/g/openembedded-core/message/188480
>> Mute This Topic: https://lists.openembedded.org/mt/101689465/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

