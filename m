Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A643C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 18:37:59 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.36473.1659033469261117676
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 11:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=sdKFbFd+;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.49,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f49.google.com with SMTP id tk8so4583917ejc.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 11:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4pGiC5iPM7BAHyVnrAp7Dmn7uMmuHtD2S3Hb+7KAQZ0=;
        b=sdKFbFd+ukt3cSXAZl2lRYjFcBY1WqNWX+xHsMCsGpQRn8QRSpAW8L84iqUhIXAa95
         koav3fXjLreuuOKA/bScoiPagBHc+dVKmK/G7ZrYwj7qn8JKH8jvvS3rrwiC5C0h8wDZ
         Sg1NnMe8Qqx2bkexRtF0oc8nRI7O2SZ0BupbgJX4dcmhgfx+Q2wj8OvziU0ctJKEQfQ/
         Y3vSgx0GkwLzVT1omIYrfzdGcYHHU6Salyj+t39P/VA71o2E9syktzYGyscLK91JJP9v
         Xfig1n+jA1ddMWgjRbP/6c4XmbIz9es3ckQ+SsBQ2Gh9PVhr26qcq+d2Z954be0aBcqu
         Jtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4pGiC5iPM7BAHyVnrAp7Dmn7uMmuHtD2S3Hb+7KAQZ0=;
        b=cff4tavEj8U+TYZBPvUuR/cGPXtMMbzuMQQWHDFST6xuS9pXkgoJL1YNR8DnJ3t0MV
         iSuFTEX/44dOTZ5aVcjHq6Tfw+QQ+Rq0NCcDr/svueWI8eNXTMXWyC3lx2CAVrNAJgcH
         FbUaIvaRlM9XO19XdUkjXmmsaT8U/pfQzZtH1nze/YLkDZoGfCcBekcrQ2m4uXuO9tEw
         6Omk/nj0qxUeZAtIg0rGZb5G0V5vIjowbmB3B677BviqEEFSqr9OQw/JFsfM99v+su/f
         y5jYe8HvL4z0XM06seHiUsx2zLSfeHOKzgbMySV0YP4Qn6fgMBTM0d6KfttR5ZviK45s
         VUNQ==
X-Gm-Message-State: AJIora+1AuLYRS5GMCbYDY6Gtu9tRLJH2IRLMsB15edLAcEHUfbtIHvQ
	fU3lKthV97ZZnl/L+/jIaesOo1PFkWiQlpBiDxAzQA==
X-Google-Smtp-Source: 
 AGRyM1vJ8Gz0bmkuuc2djXEvg4VMPZWuuOv/CQYXRy7Lhjq6E1gMD5QorfY24ZAa7Mx4Kmm55hUbR4q/hTg3yHrAVkY=
X-Received: by 2002:a17:907:8a16:b0:72b:9196:f029 with SMTP id
 sc22-20020a1709078a1600b0072b9196f029mr168566ejc.359.1659033467543; Thu, 28
 Jul 2022 11:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1658882276.git.steve@sakoman.com>
 <bb1dc2bbfe268e73008dc37d6b1f83a861b48915.1658882276.git.steve@sakoman.com>
 <CAB=6tBTxdkT640huLEiMRKxWbONvbniKBb6_oiz7P_aUwjNKYQ@mail.gmail.com>
In-Reply-To: 
 <CAB=6tBTxdkT640huLEiMRKxWbONvbniKBb6_oiz7P_aUwjNKYQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 28 Jul 2022 08:37:36 -1000
Message-ID: 
 <CAOSpxdY9JCXzDo6z2GxyTbXFQynFD2nj7T-FoJAEJzay3QnDJQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 13/15] gobject-introspection-data: Disable
 cache for g-ir-scanner
To: Chuck Wolber <chuckwolber@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 18:37:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168613

On Thu, Jul 28, 2022 at 7:55 AM Chuck Wolber <chuckwolber@gmail.com> wrote:
>
> FWIW, the gobject-introspection-native recipe was one of the "canaries in=
 the mine" that reliably caused an image build to die while I was actively =
encountering this GCC10 compiler issue in Hardknott:

Have you encountered this issue with Kirkstone?

Steve

>
> https://www.mail-archive.com/yocto@lists.yoctoproject.org/msg06163.html
> https://lists.yoctoproject.org/g/yocto/message/53971
>
> Upon re-reading my post, I regret that I did not mention this fact. The p=
roduction image recipe I was working on at the time did not happen to invol=
ve gobject-introspection-native, so I overlooked it. Our other image recipe=
s *DID* invoke gobject-introspection-native, but those were not as immediat=
ely important at the time, and I was trying to keep the problem description=
 as focused as possible.
>
> I do not expect this reply to result in anything materially relevant to t=
he problem (it still exists, but we use buildtools to get around it) other =
than to add more data that may be relevant to someone googling something si=
milar in the future.
>
> ..Ch:W..
>
> On Tue, Jul 26, 2022 at 5:41 PM Steve Sakoman <steve@sakoman.com> wrote:
>>
>> From: Tom Hochstein <tom.hochstein@nxp.com>
>>
>> An intermittent failure occurs in libical-native do_compile:
>>
>> | Traceback (most recent call last):
>> |   File "/.../build/tmp/work/x86_64-linux/libical-native/3.0.14-r0/reci=
pe-sysroot-native/usr/lib/python3.10/shutil.py", line 813, in move
>> |     os.rename(src, real_dst)
>> | OSError: [Errno 18] Invalid cross-device link: '/tmp/g-ir-scanner-cach=
e-adxo_2bq' -> '/home/bamboo/.cache/g-ir-scanner/bab9a83d2cd93e62ed005a2c1d=
4f89ae75c67251'
>> |
>> | During handling of the above exception, another exception occurred:
>> |
>> | Traceback (most recent call last):
>> |   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sys=
root-native/usr/lib/pkgconfig/../../../usr/bin/g-ir-scanner", line 99, in <=
module>
>> |     sys.exit(scanner_main(sys.argv))
>> |   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sys=
root-native/usr/lib/gobject-introspection/giscanner/scannermain.py", line 5=
90, in scanner_main
>> |     transformer =3D create_transformer(namespace, options)
>> |   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sys=
root-native/usr/lib/gobject-introspection/giscanner/scannermain.py", line 4=
09, in create_transformer
>> |     transformer.register_include(include_obj)
>> |   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sys=
root-native/usr/lib/gobject-introspection/giscanner/transformer.py", line 1=
40, in register_include
>> |     self._parse_include(filename)
>> |   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sys=
root-native/usr/lib/gobject-introspection/giscanner/transformer.py", line 2=
30, in _parse_include
>> |     self._parse_include(dep_filename)
>> |   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sys=
root-native/usr/lib/gobject-introspection/giscanner/transformer.py", line 2=
25, in _parse_include
>> |     self._cachestore.store(filename, parser)
>> |   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sys=
root-native/usr/lib/gobject-introspection/giscanner/cachestore.py", line 15=
3, in store
>> |     shutil.move(tmp_filename, store_filename)
>> |   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sys=
root-native/usr/lib/python3.10/shutil.py", line 833, in move
>> |     copy_function(src, real_dst)
>> |   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sys=
root-native/usr/lib/python3.10/shutil.py", line 435, in copy2
>> |     copystat(src, dst, follow_symlinks=3Dfollow_symlinks)
>> |   File "/.../tmp/work/x86_64-linux/libical-native/3.0.14-r0/recipe-sys=
root-native/usr/lib/python3.10/shutil.py", line 374, in copystat
>> |     lookup("utime")(dst, ns=3D(st.st_atime_ns, st.st_mtime_ns),
>> | FileNotFoundError: [Errno 2] No such file or directory
>>
>> A similar issue is described in a fix for gobject-introspection-native.
>>
>> https://github.com/openembedded/openembedded-core/commit/d3c48ff7d19e86b=
2338b1778f9563969bba3d336
>>
>> The problem was fixed there by setting the environment variable
>> GI_SCANNER_DISABLE_CACHE to disable the use of $HOME/.cache.
>>
>> Extend the fix to users of gobject-instropection by promoting the fix
>> to the bbclass.
>>
>> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
>> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> (cherry picked from commit 35d5f707f6bb2ce5e9ab908e66e1ea9eeac754b1)
>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> ---
>>  meta/classes/gobject-introspection-data.bbclass              | 5 +++++
>>  .../gobject-introspection/gobject-introspection_1.72.0.bb    | 3 ---
>>  2 files changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/classes/gobject-introspection-data.bbclass b/meta/clas=
ses/gobject-introspection-data.bbclass
>> index 2ef684626a..d90cdb4839 100644
>> --- a/meta/classes/gobject-introspection-data.bbclass
>> +++ b/meta/classes/gobject-introspection-data.bbclass
>> @@ -5,3 +5,8 @@
>>  # so that qemu use can be avoided when necessary.
>>  GI_DATA_ENABLED ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'gobject-=
introspection-data', \
>>                        bb.utils.contains('MACHINE_FEATURES', 'qemu-userm=
ode', 'True', 'False', d), 'False', d)}"
>> +
>> +do_compile:prepend() {
>> +    # This prevents g-ir-scanner from writing cache data to $HOME
>> +    export GI_SCANNER_DISABLE_CACHE=3D1
>> +}
>> diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspect=
ion_1.72.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspect=
ion_1.72.0.bb
>> index 355e77d107..9a47e908b7 100644
>> --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.7=
2.0.bb
>> +++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.7=
2.0.bb
>> @@ -113,9 +113,6 @@ EOF
>>  }
>>
>>  do_compile:prepend() {
>> -        # This prevents g-ir-scanner from writing cache data to $HOME
>> -        export GI_SCANNER_DISABLE_CACHE=3D1
>> -
>>          # Needed to run g-ir unit tests, which won't be able to find th=
e built libraries otherwise
>>          export GIR_EXTRA_LIBS_PATH=3D$B/.libs
>>  }
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#168536): https://lists.openembedded.org/g/openembedd=
ed-core/message/168536
>> Mute This Topic: https://lists.openembedded.org/mt/92640670/894569
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [c=
huckwolber@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>
> --
> "Perfection must be reached by degrees; she requires the slow hand of tim=
e." - Voltaire

