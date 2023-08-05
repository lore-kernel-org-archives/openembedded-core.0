Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7517CEB64DD
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 06:09:19 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.1510.1691215750996671784
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Aug 2023 23:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cagWJpye;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3a74d759be4so2158972b6e.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Aug 2023 23:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691215750; x=1691820550;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVrBpWVT58oB2Lm/fApLrW4n8id4JPlgca4/135ixjE=;
        b=cagWJpyejkqEvIie5EIAtWxz8bHQ4y0h9EVCTUBm8Rmrq/iJ9artuveCBep4RJcCc/
         uqtM3OJUajHywBV6bB3BRTctzHD5VUlKt906Z/hlBpFpuH5sVYSUI1TjRpym5bK/zDNJ
         vW/DAYYPjyechhYxm4WkVn8arxgodVBNnwJGJmkQiJeIkEp5wW8d7bG3MhHgTiNM2qMz
         U7ktdyD64r0IN+7rzhe3ugDAGYC0gONXS+idwecA75sKJcwzLbkExE9I23CAcRRW5u7Z
         3LpOcIrteL3EsGX+gIHvuVkXo+E33DMnpRH6cBbQrOkRFe9Cp3WaLvGxVhVweihnq9Ag
         g2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691215750; x=1691820550;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVrBpWVT58oB2Lm/fApLrW4n8id4JPlgca4/135ixjE=;
        b=HtH5iKxbKNjo+cL1zZO3Zmcsy6bdiT0jzYt+aO+n+5KvLyqLHSYIY0+ym/zu28l+x5
         guXv9/rNMAkuYOFMaSxlIS7X//CfeeSY1cJ1DYKSLNpwp69C3lqTCptCWhm1zGNbsvsM
         sREMv1KCTKyatmiJm+DTzfFWmDg2FuDpeqkiy3woo/rQGD3OJ21mQEdWDabnIDKiZQTo
         pdpwek0/GuQXMaLBPPt4HzNbUSOdJUCOmeWP/aDiZIcVU01awgt++b10Rys3/2G/EXRi
         NXzEkgy7AZDUrHgdVL7zTbbpsIfig9r+JocpPC5RZQBZ9HJoiPEM0QDpaIdXijYdPgbO
         CNKQ==
X-Gm-Message-State: AOJu0YyvDmJ6/VcpIl1tc9uhCuHnrFM2wgbV7w78e17wJS4LzoaOnGRf
	4b77o7I9QOwP+hwR5eKVJroHUfrEK3k0Wyo7Bqry40Ab6Aw=
X-Google-Smtp-Source: AGHT+IG5vn0G/xwHqKLFW6ywVBed1/gBFM2FS0LRKuzf9JcX4n4uBjY8wj5wW5cXB+HMwRNFNv+GQJqzSLCn9InyBK0=
X-Received: by 2002:aca:1c18:0:b0:3a3:fde5:dd20 with SMTP id
 c24-20020aca1c18000000b003a3fde5dd20mr4505435oic.30.1691215749962; Fri, 04
 Aug 2023 23:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230724204639.353571-1-p.lobacz@welotec.com> <20230724204639.353571-3-p.lobacz@welotec.com>
 <57eff0d7-f507-42b5-ae96-525d6b54eda1@gmail.com>
In-Reply-To: <57eff0d7-f507-42b5-ae96-525d6b54eda1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Aug 2023 23:08:43 -0700
Message-ID: <CAMKF1spoRy1WiHvcgy2Op0kbKqk9Xtv8AiWYgJyDMb1qXnYOKQ@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v10][master-next 3/5] opkg-utils: add acl and
 xattr support
To: =?UTF-8?Q?Piotr_=C5=81obacz?= <p.lobacz@welotec.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 06:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185546

On Fri, Aug 4, 2023 at 8:27=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
> On 7/24/23 1:46 PM, Piotr =C5=81obacz wrote:
> > Add support for tar archives created with --acls and/or --xattrs option=
s,
> > PAX header format.
> >
> > GNU tar and libarchive already supports ACLs and extended attributes.
> > We can now add this support as well to opkg-build script in order to us=
e
> > fsetattr or setcap inside do_install command and end up with a file in
> > an image with the relevant ACLs and xattrs.
>
> this patch series is regressing ipk backends with errors like below
> I am using archlinux for by build system if that matters.
>
> ERROR: linux-libc-headers-6.4-r0 do_package_write_ipk: Fatal errors
> occurred in subprocesses:
> Command
> 'PATH=3D"/mnt/b/yoe/master/build/tmp/sysroots-uninative/x86_64-linux/usr/=
bin:/mnt/b/yoe/master/sources/poky/scripts:/mnt/b/yoe/master/build/tmp/work=
/cortexa72-cortexa53-crypto-yoe-linux/linux-libc-headers/6.4-r0/recipe-sysr=
oot-native/usr/bin/aarch64-yoe-linux:/mnt/b/yoe/master/build/tmp/work/corte=
xa72-cortexa53-crypto-yoe-linux/linux-libc-headers/6.4-r0/recipe-sysroot/us=
r/bin/crossscripts:/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-cry=
pto-yoe-linux/linux-libc-headers/6.4-r0/recipe-sysroot-native/usr/sbin:/mnt=
/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/linux-lib=
c-headers/6.4-r0/recipe-sysroot-native/usr/bin:/mnt/b/yoe/master/build/tmp/=
work/cortexa72-cortexa53-crypto-yoe-linux/linux-libc-headers/6.4-r0/recipe-=
sysroot-native/sbin:/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-cr=
ypto-yoe-linux/linux-libc-headers/6.4-r0/recipe-sysroot-native/bin:/mnt/b/y=
oe/master/sources/poky/bitbake/bin:/mnt/b/yoe/master/build/tmp/hosttools"
> opkg-build -Z zstd -a "--threads=3D44" linux-libc-headers-dbg
> /mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/lin=
ux-libc-headers/6.4-r0/deploy-ipks/cortexa72-cortexa53-crypto'
> returned non-zero exit status 1.
> Subprocess output:find: paths must precede expression: `BUILD_CCLD=3Dgcc =
'
> Command
> 'PATH=3D"/mnt/b/yoe/master/build/tmp/sysroots-uninative/x86_64-linux/usr/=
bin:/mnt/b/yoe/master/sources/poky/scripts:/mnt/b/yoe/master/build/tmp/work=
/cortexa72-cortexa53-crypto-yoe-linux/linux-libc-headers/6.4-r0/recipe-sysr=
oot-native/usr/bin/aarch64-yoe-linux:/mnt/b/yoe/master/build/tmp/work/corte=
xa72-cortexa53-crypto-yoe-linux/linux-libc-headers/6.4-r0/recipe-sysroot/us=
r/bin/crossscripts:/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-cry=
pto-yoe-linux/linux-libc-headers/6.4-r0/recipe-sysroot-native/usr/sbin:/mnt=
/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/linux-lib=
c-headers/6.4-r0/recipe-sysroot-native/usr/bin:/mnt/b/yoe/master/build/tmp/=
work/cortexa72-cortexa53-crypto-yoe-linux/linux-libc-headers/6.4-r0/recipe-=
sysroot-native/sbin:/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-cr=
ypto-yoe-linux/linux-libc-headers/6.4-r0/recipe-sysroot-native/bin:/mnt/b/y=
oe/master/sources/poky/bitbake/bin:/mnt/b/yoe/master/build/tmp/hosttools"
> opkg-build -Z zstd -a "--threads=3D44" linux-libc-headers-dev
> /mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/lin=
ux-libc-headers/6.4-r0/deploy-ipks/cortexa72-cortexa53-crypto'
> returned non-zero exit status 1.
> Subprocess output:find: paths must precede expression: `BUILD_CCLD=3Dgcc =
'
>

I think this is more related to building on hosts with glibc 2.38
rather than opkg issue. So this patch might not
be the cause of this problem but maybe something in pseudo or some such lay=
er.

> >
> > Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
> > ---
> >   ...kg-build-Add-acls-and-xattrs-support.patch | 164 +++++++++++++++++=
+
> >   .../opkg-utils/opkg-utils_0.6.2.bb            |   1 +
> >   2 files changed, 165 insertions(+)
> >   create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0002-o=
pkg-build-Add-acls-and-xattrs-support.patch
> >
> > diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-buil=
d-Add-acls-and-xattrs-support.patch b/meta/recipes-devtools/opkg-utils/opkg=
-utils/0002-opkg-build-Add-acls-and-xattrs-support.patch
> > new file mode 100644
> > index 0000000000..0874d3f75c
> > --- /dev/null
> > +++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Add-a=
cls-and-xattrs-support.patch
> > @@ -0,0 +1,164 @@
> > +From 5a5901f703bfac7376cfef3d4734c37400db03f1 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Piotr=3D20=3DC5=3D81obacz?=3D <p.lobacz@welotec.com>
> > +Date: Wed, 5 Jul 2023 10:31:13 +0200
> > +Subject: [PATCH] opkg-build: Add acls and xattrs support
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +Add support for tar archives created with --acls and/or --xattrs optio=
ns,
> > +PAX header format.
> > +
> > +GNU tar and libarchive already supports ACLs and extended attributes.
> > +We can now add this support as well to opkg-build script in order to u=
se
> > +fsetattr or setcap inside do_install command and end up with a file in
> > +an image with the relevant ACLs and xattrs.
> > +
> > +Upstream-Status: Submitted [https://groups.google.com/g/opkg-devel/c/d=
YNHrLjDwg8]
> > +
> > +[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15097
> > +[2] https://groups.google.com/g/opkg-devel/c/aEGL7XRXfaA
> > +
> > +Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
> > +---
> > + opkg-build | 76 +++++++++++++++++++++++++++++++++++------------------=
-
> > + 1 file changed, 50 insertions(+), 26 deletions(-)
> > +
> > +diff --git a/opkg-build b/opkg-build
> > +index a9e45d4..b3127e0 100755
> > +--- a/opkg-build
> > ++++ b/opkg-build
> > +@@ -145,6 +145,7 @@ You probably want to chown these to a system user:=
 " >&2
> > + ###
> > + # opkg-build "main"
> > + ###
> > ++attributesargs=3D""
> > + ogargs=3D""
> > + outer=3Dar
> > + noclean=3D0
> > +@@ -153,22 +154,6 @@ compressor=3Dgzip
> > + zipargs=3D"-9n"
> > + compressorargs=3D""
> > +
> > +-# Determine if tar supports the --format argument by checking the hel=
p output.
> > +-#
> > +-# This is needed because:
> > +-#    - Busybox tar doesn't support '--format'
> > +-#    - On some Linux distros, tar now defaults to posix format if '--=
format'
> > +-#      isn't explicitly specified
> > +-#    - Opkg doesn't currently support posix format archives
> > +-#
> > +-# It's easier to check for mention of the '--format' option than to d=
etect the
> > +-# tar implementation and maintain a list of which support '--format'.
> > +-tarformat=3D""
> > +-if tar --help 2>&1 | grep -- "--format" > /dev/null;
> > +-then
> > +-    tarformat=3D"--format=3Dgnu"
> > +-fi
> > +-
> > + compressor_ext() {
> > +     case $1 in
> > +     gzip|pigz)
> > +@@ -197,13 +182,17 @@ compressor_ext() {
> > + : <<=3Dcut
> > + =3Dhead1 SYNOPSIS
> > +
> > +-B<opkg-build> [B<-c>] [B<-C>] [B<-Z> I<compressor>] [B<-a>] [B<-O>] [=
B<-o> I<owner>] [B<-g> I<group>] I<pkg_directory> [I<destination_directory>=
]
> > ++B<opkg-build> [B<-A>] [B<-X>] [B<-c>] [B<-C>] [B<-Z> I<compressor>] [=
B<-a>] [B<-O>] [B<-o> I<owner>] [B<-g> I<group>] I<pkg_directory> [I<destin=
ation_directory>]
> > +
> > + =3Dcut
> > +
> > +-usage=3D"Usage: $0 [-c] [-C] [-Z compressor] [-a compressor_args] [-O=
] [-o owner] [-g group] <pkg_directory> [<destination_directory>]"
> > +-while getopts "a:cCg:ho:vOZ:" opt; do
> > ++usage=3D"Usage: $0 [-A] [-X] [-c] [-C] [-Z compressor] [-a compressor=
_args] [-O] [-o owner] [-g group] <pkg_directory> [<destination_directory>]=
"
> > ++while getopts "Aa:cCg:ho:vOXZ:" opt; do
> > +     case $opt in
> > ++        A ) attributesargs=3D"--acls"
> > ++            ;;
> > ++        X ) attributesargs=3D"$attributesargs --xattrs"
> > ++            ;;
> > +     o ) owner=3D$OPTARG
> > +         ogargs=3D"--owner=3D$owner"
> > +         ;;
> > +@@ -232,6 +221,31 @@ while getopts "a:cCg:ho:vOZ:" opt; do
> > +     esac
> > + done
> > +
> > ++# Determine if tar supports the --format argument by checking the hel=
p output.
> > ++#
> > ++# This is needed because:
> > ++#    - Busybox tar doesn't support '--format'
> > ++#    - On some Linux distros, tar now defaults to posix format if '--=
format'
> > ++#      isn't explicitly specified
> > ++#    - Opkg doesn't currently support posix format archives
> > ++#
> > ++# It's easier to check for mention of the '--format' option than to d=
etect the
> > ++# tar implementation and maintain a list of which support '--format'.
> > ++tarformat=3D""
> > ++if tar --help 2>&1 | grep -- "--format" > /dev/null;
> > ++then
> > ++    # For ACLs or xattr support, gnu format will not work
> > ++    # we need to set posix format instead
> > ++    if [ ! -z "$attributesargs" ] ; then
> > ++        tarformat=3D"--format=3Dposix"
> > ++    else
> > ++        tarformat=3D"--format=3Dgnu"
> > ++    fi
> > ++elif [ ! -z "$attributesargs" ] ; then
> > ++    echo "*** Error: Attributes: $attributesargs, doesn't' work, with=
out posix format, which is not supported by tar command." >&2
> > ++    exit 1
> > ++fi
> > ++
> > + cext=3D$(compressor_ext $compressor)
> > +
> > + # pgzip requires -T to avoid timestamps on the gzip archive
> > +@@ -301,21 +315,31 @@ fi
> > + tmp_dir=3D$dest_dir/IPKG_BUILD.$$
> > + mkdir $tmp_dir
> > +
> > +-build_date=3D"${SOURCE_DATE_EPOCH:-$(date +%s)}"
> > +-
> > +-mtime_args=3D""
> > ++mtime_args=3D"--mtime=3D@${SOURCE_DATE_EPOCH:-$(date +%s)}"
> > + # --clamp-mtime requires tar > 1.28. Only use it if SOURCE_DATE_EPOCH=
 is set, to avoid having a generic case dependency on tar > 1.28.
> > + # this setting will make sure files generated at build time have cons=
istent mtimes, for reproducible builds.
> > + if [ ! -z "$SOURCE_DATE_EPOCH"  ]; then
> > +-    mtime_args=3D"--mtime=3D@$build_date --clamp-mtime"
> > ++    mtime_args=3D"$mtime_args --clamp-mtime"
> > ++fi
> > ++
> > ++# Notice, that if you create an archive in POSIX format (see section =
GNU tar and POSIX tar) and the environment variable POSIXLY_CORRECT is set,
> > ++# then the two archives created using the same options on the same se=
t of files will not be byte-to-byte equivalent even with the above option.
> > ++# This is because the posix default for extended header names include=
s the PID of the tar process, which is different at each run. To produce
> > ++# byte-to-byte equivalent archives in this case, either unset POSIXLY=
_CORRECT, or use the following option:
> > ++#
> > ++# --pax-option=3Dexthdr.name=3D%d/PaxHeaders/%f,atime:=3D0,ctime:=3D0
> > ++#
> > ++# https://www.gnu.org/software/tar/manual/html_node/PAX-keywords.html
> > ++if [ $tarformat =3D=3D "--format=3Dposix" ]; then
> > ++    mtime_args=3D"$mtime_args --pax-option=3Dexthdr.name=3D%d/PaxHead=
ers/%f,atime:=3D0,ctime:=3D0"
> > + fi
> > +
> > + export LANG=3DC
> > + export LC_ALL=3DC
> > + ( cd $pkg_dir/$CONTROL && find . -type f | sort > $tmp_dir/control_li=
st )
> > + ( cd $pkg_dir && find . -path ./$CONTROL -prune -o -path . -o -print =
 | sort > $tmp_dir/file_list )
> > +-( cd $pkg_dir && tar $ogargs $tsortargs --no-recursion $mtime_args -c=
 $tarformat -T $tmp_dir/file_list | $compressor $compressorargs > $tmp_dir/=
data.tar.$cext )
> > +-( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --no-recursion --mti=
me=3D@$build_date -c $tarformat -T $tmp_dir/control_list | gzip $zipargs > =
$tmp_dir/control.tar.gz )
> > ++( cd $pkg_dir && tar $attributesargs $ogargs $tsortargs --numeric-own=
er --no-recursion $mtime_args -c $tarformat -T $tmp_dir/file_list | $compre=
ssor $compressorargs > $tmp_dir/data.tar.$cext )
> > ++( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --no-recursion $mtim=
e_args -c $tarformat -T $tmp_dir/control_list | gzip $zipargs > $tmp_dir/co=
ntrol.tar.gz )
> > + rm $tmp_dir/file_list
> > + rm $tmp_dir/control_list
> > +
> > +@@ -331,7 +355,7 @@ rm -f $pkg_file
> > + if [ "$outer" =3D "ar" ] ; then
> > +   ( cd $tmp_dir && ar -crfD $pkg_file ./debian-binary ./control.tar.g=
z ./data.tar.$cext )
> > + else
> > +-  ( cd $tmp_dir && tar -c $tsortargs --mtime=3D@$build_date $tarforma=
t ./debian-binary ./control.tar.gz ./data.tar.$cext | gzip $zipargs > $pkg_=
file )
> > ++  ( cd $tmp_dir && tar -c $tsortargs $mtime_args $tarformat ./debian-=
binary ./control.tar.gz ./data.tar.$cext | gzip $zipargs > $pkg_file )
> > + fi
> > +
> > + rm $tmp_dir/debian-binary $tmp_dir/data.tar.$cext $tmp_dir/control.ta=
r.gz
> > +--
> > +2.34.1
> > +
> > diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb b/met=
a/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
> > index eb88b9b734..d5ce2cfbe2 100644
> > --- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
> > +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
> > @@ -9,6 +9,7 @@ PROVIDES +=3D "${@bb.utils.contains('PACKAGECONFIG', 'u=
pdate-alternatives', 'virtu
> >
> >   SRC_URI =3D "git://git.yoctoproject.org/opkg-utils;protocol=3Dhttps;b=
ranch=3Dmaster \
> >              file://0001-update-alternatives-correctly-match-priority.p=
atch \
> > +           file://0002-opkg-build-Add-acls-and-xattrs-support.patch \
> >              "
> >   SRCREV =3D "67994e62dc598282830385da75ba9b1abbbda941"
> >
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#184815): https://lists.openembedded.org/g/openembed=
ded-core/message/184815
> > Mute This Topic: https://lists.openembedded.org/mt/100337842/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

