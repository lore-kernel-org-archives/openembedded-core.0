Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D59DC54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 14:16:32 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.13241.1709043386346715460
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 06:16:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=h0nV0Ysm;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.173, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-60925c4235eso7419247b3.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 06:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709043385; x=1709648185; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YwCUIGd2ypbj3hwXrUStYt2nvvIgiZTay26ax61w/N8=;
        b=h0nV0YsmHcxG4RRxaBwcl8LXPgwm7OA+h6lI0xLuhgp5MRNSsCmXJT/d2v9vBytBop
         nrZpSBOsk4gwWmbUtwXohktIYPNsou0eIZiuCFQHsHdjdfv3EeKYYdKgTuwLIhMM5LpI
         8XXaRmU/jQCL0gq6rl9XQKVZiBlJ1a+1Jc5nReday46heEpVwKvHDrqw5wbP7XOiTy5L
         rAFHzYRNuc7xkNstmilGp1Jn8HWlaTQXM46lW6VohudpOZ7XSF6quzWWtkS2C9jLZUq3
         9cdVe3Ot6O2kwWO1njbfO4vOVaRuFmWiUfevaa8IiOvCuVhMftxBQsLhnNbmYpkotwHb
         MLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709043385; x=1709648185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwCUIGd2ypbj3hwXrUStYt2nvvIgiZTay26ax61w/N8=;
        b=oaBJSrJi/yyYYPGoXLMxg9fhNRgnrzfm0Vg2lJXI7WzuKlzxdh+c5IyjfJjYVyp5rI
         2hgC84DNehAxVfOKYwXAAmA6pIvxZLRKx2Du3fEvTUFUGJndQkRxNp+iOscmu+jZEL3s
         p1lEF9ZMkF7b39bvgzp07BNmQd/rOwfL8G32JAKvcKBSkNwL09GPhYO5DTzyVP+hfQNT
         MOgLnc/MXoteQpfRa7NB/N/hLNMfNeB/Ry5k1RgzmGCBPn2/zTGl4ALdJncwCI0hVo+h
         u5ggivyXy1nqqp4C8jU2yzPLZprH3abPomzJUI63+H1sruXkQ2KuQbdle1vJLdS/aT4E
         TsYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi6KzGpO9MRoEYuFL/8q/EmTM0nKdlpa8NaVi4JBypXBdXEEIP90HdLQbWe547dwRKRIqmiC4N5dt+ZQICBemAGWYgOiVSAjceZRUEQDoOU5sl/UXz1STj
X-Gm-Message-State: AOJu0YyGLjwlDjYWfFnRYNnMKOSXaKeL1RDO9XzdmxRmNjy8GtlAVzdE
	e82axGz3jnzV2elrQgxw/g2k8YeWUgXRtugU0j5ihIhIzQM1KJx/2i9ARXuTCPdWh1OVESyikCp
	o9duJeDLJvX4j486F9oQZ8Hc/dUQeVd5ufA9big==
X-Google-Smtp-Source: AGHT+IH5GJlv0uL++PyltfVV0Ryq3zLQwxooZaxRMQVUa3I31Eb+IZj0qa1srSUlUrtuDqZRKVjIwoZhQv79KYzs9p8=
X-Received: by 2002:a5b:845:0:b0:dc2:3279:fde5 with SMTP id
 v5-20020a5b0845000000b00dc23279fde5mr2019475ybq.22.1709043384824; Tue, 27 Feb
 2024 06:16:24 -0800 (PST)
MIME-Version: 1.0
References: <20240130071405.3675-1-mail2szahir@gmail.com> <CAOSpxdYqD2Tcm5dDheZVTv4E3dVYJ0=pZOe09=F=jLr41ktkww@mail.gmail.com>
 <MA0PR01MB10021441948EA4F3A7D0BB12A8C552@MA0PR01MB10021.INDPRD01.PROD.OUTLOOK.COM>
 <CAOSpxdYUqhBCLyvTLxcaNptqxJJUk-dCYrh1Kg=okWO=w6HsGw@mail.gmail.com> <MA0PR01MB10021DF09FEDA76154177162D8C5A2@MA0PR01MB10021.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA0PR01MB10021DF09FEDA76154177162D8C5A2@MA0PR01MB10021.INDPRD01.PROD.OUTLOOK.COM>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 27 Feb 2024 04:16:13 -1000
Message-ID: <CAOSpxda9JcOv7YzUHdaK2GjjtxrUHjBnHQACiCHuX9XCcLH1rw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH V2] nghttp2: fix CVE-2023-44487
To: Zahir Hussain Sikkendar Basha <Zahir.Basha@kpit.com>
Cc: aszh07 <mail2szahir@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Virendra Kumar Thakur <Virendra.Thakur@kpit.com>
Content-Type: multipart/related; boundary="000000000000dc679506125dab7b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 14:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196273

--000000000000dc679506125dab7b
Content-Type: multipart/alternative; boundary="000000000000dc679406125dab7a"

--000000000000dc679406125dab7a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, but it still doesn't work:

steve@hexa ~/builds/poky-contrib-kirkstone ((HEAD detached at 0b39955d146))
$ git am -3 ~/Downloads/kirkstone-V2-nghttp2-fix-CVE-2023-44487.patch
Applying: nghttp2: fix CVE-2023-44487
steve@hexa ~/builds/poky-contrib-kirkstone ((HEAD detached from
0b39955d146)) $ bitbake nghttp2
Loading cache: 100% |


                                                                          |
ETA:  --:--:--
Loaded 0 entries from dependency cache.
Parsing recipes: 100%
|##########################################################################=
###########################################################################=
###########################################################################=
########################################################|
Time: 0:00:07
Parsing of 883 .bb files complete (0 cached, 883 parsed). 1644 targets, 43
skipped, 0 masked, 0 errors.
Removing 2 recipes from the core2-64 sysroot: 100%
|##########################################################################=
###########################################################################=
###########################################################################=
###########################|
Time: 0:00:00
Removing 3 recipes from the qemux86_64 sysroot: 100%
|##########################################################################=
###########################################################################=
###########################################################################=
#########################|
Time: 0:00:00
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           =3D "2.0.0"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "universal"
TARGET_SYS           =3D "x86_64-poky-linux"
MACHINE              =3D "qemux86-64"
DISTRO               =3D "poky"
DISTRO_VERSION       =3D "4.0.16"
TUNE_FEATURES        =3D "m64 core2"
TARGET_FPU           =3D ""
meta
meta-poky
meta-yocto-bsp
workspace            =3D "HEAD:f07ef560f0128de6d9a5b3d93fddec83066badd8"

Initialising tasks: 100%
|##########################################################################=
###########################################################################=
###########################################################################=
#####################################################|
Time: 0:00:00
Sstate summary: Wanted 131 Local 62 Mirrors 0 Missed 69 Current 143 (47%
match, 74% complete)
Removing 3 stale sstate objects for arch core2-64: 100%
|##########################################################################=
###########################################################################=
###########################################################################=
######################|
Time: 0:00:00
Removing 30 stale sstate objects for arch qemux86_64: 100%
|##########################################################################=
###########################################################################=
###########################################################################=
###################|
Time: 0:00:00
Removing 6 stale sstate objects for arch x86_64: 100%
|##########################################################################=
###########################################################################=
###########################################################################=
########################|
Time: 0:00:00
NOTE: Executing Tasks
ERROR: nghttp2-1.47.0-r0 do_patch: Applying patch 'CVE-2023-44487.patch' on
target directory
'/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-lin=
ux/nghttp2/1.47.0-r0/nghttp2-1.47.0'
CmdError('quilt --quiltrc
/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-linu=
x/nghttp2/1.47.0-r0/recipe-sysroot-native/etc/quiltrc
push', 0, 'stdout: Applying patch CVE-2023-44487.patch
patching file CMakeLists.txt
Hunk #1 succeeded at 301 (offset 39 lines).
Hunk #2 succeeded at 342 (offset 39 lines).
patching file cmakeconfig.h.in
Hunk #1 succeeded at 31 (offset -3 lines).
Hunk #2 succeeded at 76 (offset -3 lines).
patching file configure.ac
Hunk #1 succeeded at 922 (offset 315 lines).
Hunk #2 succeeded at 997 (offset 315 lines).
Hunk #3 succeeded at 1023 (offset 315 lines).
patching file doc/Makefile.am
Hunk #1 FAILED at 69.
1 out of 1 hunk FAILED -- rejects in file doc/Makefile.am
patching file lib/CMakeLists.txt
patching file lib/Makefile.am
Hunk #1 FAILED at 49.
Hunk #2 FAILED at 65.
2 out of 2 hunks FAILED -- rejects in file lib/Makefile.am
patching file lib/includes/nghttp2/nghttp2.h
Hunk #1 succeeded at 2800 (offset 37 lines).
patching file lib/nghttp2_option.c
patching file lib/nghttp2_ratelim.c
patching file lib/nghttp2_ratelim.h
patching file lib/nghttp2_session.c
Hunk #4 succeeded at 4164 (offset 9 lines).
Hunk #5 succeeded at 4210 (offset 9 lines).
Hunk #6 succeeded at 6991 (offset -3 lines).
patching file lib/nghttp2_session.h
Hunk #4 succeeded at 234 (offset -3 lines).
patching file lib/nghttp2_time.c
patching file lib/nghttp2_time.h
patching file tests/nghttp2_ratelim_test.c
patching file tests/nghttp2_ratelim_test.h
patching file tests/nghttp2_session_test.c
Hunk #1 succeeded at 11089 (offset 276 lines).
patching file tests/nghttp2_session_test.h
Hunk #1 succeeded at 162 (offset 2 lines).
patching file tests/CMakeLists.txt
patching file tests/Makefile.am
Hunk #1 FAILED at 40.
1 out of 1 hunk FAILED -- rejects in file tests/Makefile.am
patching file lib/nghttp2_option.h
patching file tests/main.c
Hunk #2 succeeded at 330 (offset 6 lines).
Hunk #3 succeeded at 428 (offset 7 lines).
Patch CVE-2023-44487.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in:
/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-linu=
x/nghttp2/1.47.0-r0/temp/log.do_patch.1640561
ERROR: Task
(/home/steve/builds/poky-contrib-kirkstone/meta/recipes-support/nghttp2/ngh=
ttp2_1.47.0.bb:do_patch)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 926 tasks of which 923 didn't need to be
rerun and 1 failed.
Complete CVE report summary created at:
/home/steve/builds/poky-contrib-kirkstone/build/tmp/log/cve/cve-summary
NOTE: Generating JSON CVE summary
Complete CVE JSON report summary created at:
/home/steve/builds/poky-contrib-kirkstone/build/tmp/log/cve/cve-summary.jso=
n

Summary: 1 task failed:

/home/steve/builds/poky-contrib-kirkstone/meta/recipes-support/nghttp2/nght=
tp2_1.47.0.bb:
do_patch
Summary: There was 1 ERROR message, returning a non-zero exit code.
steve@hexa ~/builds/poky-contrib-kirkstone ((HEAD detached from
0b39955d146)) $

Please download your patch from patchworks and try using that version.  It
may have been corrupted by your mailer.

You can get it here:


https://patchwork.yoctoproject.org/project/oe-core/patch/20240130071405.367=
5-1-mail2szahir@gmail.com/

Click mbox in the upper right corner to download the patch.

Steve



On Mon, Feb 26, 2024 at 11:26=E2=80=AFPM Zahir Hussain Sikkendar Basha <
Zahir.Basha@kpit.com> wrote:

> Hi Steve,
>
> I have applied the patch on top of kirkstone branch, HEAD is { Commit ID =
:
> 0b39955d14600257a6eafc211fd68a933c69a0e9 }.
>
> please refer the below screenshot
>
>
> And also attached the complete log {*log.do_patch*} of do_patch
> compilation.
>
> Please check the patch on kirkstone branch and Head commit mentioned abov=
e.
>
> Note:
> I have confirmed that there is no .bbappend file for nghttp2 in the whole
> repo.
>
> Please refer below screenshot for reference.
>
>
>
> Best regards,
> Zahir hussain.
> ------------------------------
> *From:* Steve Sakoman <steve@sakoman.com>
> *Sent:* Friday, February 23, 2024 9:57 PM
> *To:* Zahir Hussain Sikkendar Basha <Zahir.Basha@kpit.com>
> *Cc:* aszh07 <mail2szahir@gmail.com>;
> openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>; Virendra Kumar Thakur <
> Virendra.Thakur@kpit.com>
> *Subject:* Re: [OE-core][kirkstone][PATCH V2] nghttp2: fix CVE-2023-44487
>
> Caution: This email originated from outside of the KPIT. Do not click
> links or open attachments unless you recognize the sender and know the
> content is safe.
>
> On Thu, Feb 22, 2024 at 7:41=E2=80=AFPM Zahir Hussain Sikkendar Basha
> <Zahir.Basha@kpit.com> wrote:
> >
> > Hi Steve,
> >
> > Apologies for the late reply. Can you please recheck the patch again?
> > Same patch works in our build without any Hunk failure issue, And also
> confirmed that the patch changes are available in the source code of
> nghttp2 V1.47.0.
>
> It still fails for me:
>
> (stable/kirkstone-nut) $ bitbake nghttp2
> Loading cache: 100% |
>
>
>
>                   | ETA:  --:--:--
> Loaded 0 entries from dependency cache.
> Parsing recipes: 100%
>
> |########################################################################=
###########################################################################=
###########################################################################=
##########################################################|
> Time: 0:00:07
> Parsing of 883 .bb files complete (0 cached, 883 parsed). 1644
> targets, 43 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "2.0.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "x86_64-poky-linux"
> MACHINE              =3D "qemux86-64"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D "4.0.16"
> TUNE_FEATURES        =3D "m64 core2"
> TARGET_FPU           =3D ""
> meta
> meta-poky
> meta-yocto-bsp
> workspace            =3D
> "stable/kirkstone-nut:80bb7659e17fa1404f48c95da3a077563bb6806a"
>
> Initialising tasks: 100%
>
> |########################################################################=
###########################################################################=
###########################################################################=
#######################################################|
> Time: 0:00:00
> Sstate summary: Wanted 92 Local 85 Mirrors 0 Missed 7 Current 182 (92%
> match, 97% complete)
> Removing 6 stale sstate objects for arch core2-64: 100%
>
> |########################################################################=
###########################################################################=
###########################################################################=
########################|
> Time: 0:00:00
> Removing 1 stale sstate objects for arch qemux86_64: 100%
>
> |########################################################################=
###########################################################################=
###########################################################################=
######################|
> Time: 0:00:00
> NOTE: Executing Tasks
> ERROR: nghttp2-1.47.0-r0 do_patch: Applying patch
> 'CVE-2023-44487.patch' on target directory
>
> '/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-l=
inux/nghttp2/1.47.0-r0/nghttp2-1.47.0'
> CmdError('quilt --quiltrc
>
> /home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-li=
nux/nghttp2/1.47.0-r0/recipe-sysroot-native/etc/quiltrc
> push', 0, 'stdout: Applying patch CVE-2023-44487.patch
> patching file CMakeLists.txt
> Hunk #1 succeeded at 301 (offset 39 lines).
> Hunk #2 succeeded at 342 (offset 39 lines).
> patching file cmakeconfig.h.in
> Hunk #1 succeeded at 31 (offset -3 lines).
> Hunk #2 succeeded at 76 (offset -3 lines).
> patching file configure.ac
> Hunk #1 succeeded at 922 (offset 315 lines).
> Hunk #2 succeeded at 997 (offset 315 lines).
> Hunk #3 succeeded at 1023 (offset 315 lines).
> patching file doc/Makefile.am
> Hunk #1 FAILED at 69.
> 1 out of 1 hunk FAILED -- rejects in file doc/Makefile.am
> patching file lib/CMakeLists.txt
> patching file lib/Makefile.am
> Hunk #1 FAILED at 49.
> Hunk #2 FAILED at 65.
> 2 out of 2 hunks FAILED -- rejects in file lib/Makefile.am
> patching file lib/includes/nghttp2/nghttp2.h
> Hunk #1 succeeded at 2800 (offset 37 lines).
> patching file lib/nghttp2_option.c
> patching file lib/nghttp2_ratelim.c
> patching file lib/nghttp2_ratelim.h
> patching file lib/nghttp2_session.c
> Hunk #4 succeeded at 4164 (offset 9 lines).
> Hunk #5 succeeded at 4210 (offset 9 lines).
> Hunk #6 succeeded at 6991 (offset -3 lines).
> patching file lib/nghttp2_session.h
> Hunk #4 succeeded at 234 (offset -3 lines).
> patching file lib/nghttp2_time.c
> patching file lib/nghttp2_time.h
> patching file tests/nghttp2_ratelim_test.c
> patching file tests/nghttp2_ratelim_test.h
> patching file tests/nghttp2_session_test.c
> Hunk #1 succeeded at 11089 (offset 276 lines).
> patching file tests/nghttp2_session_test.h
> Hunk #1 succeeded at 162 (offset 2 lines).
> patching file tests/CMakeLists.txt
> patching file tests/Makefile.am
> Hunk #1 FAILED at 40.
> 1 out of 1 hunk FAILED -- rejects in file tests/Makefile.am
> patching file lib/nghttp2_option.h
> patching file tests/main.c
> Hunk #2 succeeded at 330 (offset 6 lines).
> Hunk #3 succeeded at 428 (offset 7 lines).
> Patch CVE-2023-44487.patch does not apply (enforce with -f)
>
> stderr: ')
> ERROR: Logfile of failure stored in:
>
> /home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-li=
nux/nghttp2/1.47.0-r0/temp/log.do_patch.1234204
> ERROR: Task
> (/home/steve/builds/poky-contrib-kirkstone/meta/recipes-support/nghttp2/n=
ghttp2_1.47.0.bb:
> do_patch)
> failed with exit code '1'
>
> Make sure you are using the current kirkstone head, and don't have a
> bbappend for nghttp2 in another included layer.
>
> Steve
> ______________________________
> > From: Steve Sakoman <steve@sakoman.com>
> > Sent: Tuesday, January 30, 2024 10:39 PM
> > To: aszh07 <mail2szahir@gmail.com>
> > Cc: openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org>; Virendra Kumar Thakur <
> Virendra.Thakur@kpit.com>; Zahir Hussain Sikkendar Basha <
> Zahir.Basha@kpit.com>
> > Subject: Re: [OE-core][kirkstone][PATCH V2] nghttp2: fix CVE-2023-44487
> >
> > Caution: This email originated from outside of the KPIT. Do not click
> links or open attachments unless you recognize the sender and know the
> content is safe.
> >
> > This fails at build time:
> >
> > ERROR: nghttp2-1.47.0-r0 do_patch: Applying patch
> > 'CVE-2023-44487.patch' on target directory
> >
> '/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-l=
inux/nghttp2/1.47.0-r0/nghttp2-1.47.0'
> > CmdError('quilt --quiltrc
> >
> /home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-li=
nux/nghttp2/1.47.0-r0/recipe-sysroot-native/etc/quiltrc
> > push', 0, 'stdout: Applying patch CVE-2023-44487.patch
> > patching file CMakeLists.txt
> > Hunk #1 succeeded at 301 (offset 39 lines).
> > Hunk #2 succeeded at 342 (offset 39 lines).
> > patching file cmakeconfig.h.in
> > Hunk #1 succeeded at 31 (offset -3 lines).
> > Hunk #2 succeeded at 76 (offset -3 lines).
> > patching file configure.ac
> > Hunk #1 succeeded at 922 (offset 315 lines).
> > Hunk #2 succeeded at 997 (offset 315 lines).
> > Hunk #3 succeeded at 1023 (offset 315 lines).
> > patching file doc/Makefile.am
> > Hunk #1 FAILED at 69.
> > 1 out of 1 hunk FAILED -- rejects in file doc/Makefile.am
> > patching file lib/CMakeLists.txt
> > patching file lib/Makefile.am
> > Hunk #1 FAILED at 49.
> > Hunk #2 FAILED at 65.
> > 2 out of 2 hunks FAILED -- rejects in file lib/Makefile.am
> > patching file lib/includes/nghttp2/nghttp2.h
> > Hunk #1 succeeded at 2800 (offset 37 lines).
> > patching file lib/nghttp2_option.c
> > patching file lib/nghttp2_ratelim.c
> > patching file lib/nghttp2_ratelim.h
> > patching file lib/nghttp2_session.c
> > Hunk #4 succeeded at 4164 (offset 9 lines).
> > Hunk #5 succeeded at 4210 (offset 9 lines).
> > Hunk #6 succeeded at 6991 (offset -3 lines).
> > patching file lib/nghttp2_session.h
> > Hunk #4 succeeded at 234 (offset -3 lines).
> > patching file lib/nghttp2_time.c
> > patching file lib/nghttp2_time.h
> > patching file tests/nghttp2_ratelim_test.c
> > patching file tests/nghttp2_ratelim_test.h
> > patching file tests/nghttp2_session_test.c
> > Hunk #1 succeeded at 11089 (offset 276 lines).
> > patching file tests/nghttp2_session_test.h
> > Hunk #1 succeeded at 162 (offset 2 lines).
> > patching file tests/CMakeLists.txt
> > patching file tests/Makefile.am
> > Hunk #1 FAILED at 40.
> > 1 out of 1 hunk FAILED -- rejects in file tests/Makefile.am
> > patching file lib/nghttp2_option.h
> > patching file tests/main.c
> > Hunk #2 succeeded at 330 (offset 6 lines).
> > Hunk #3 succeeded at 428 (offset 7 lines).
> > Patch CVE-2023-44487.patch does not apply (enforce with -f)
> >
> > Steve
> >
> > On Mon, Jan 29, 2024 at 9:17=E2=80=AFPM aszh07 <mail2szahir@gmail.com> =
wrote:
> > >
> > > From: Zahir Hussain <zahir.basha@kpit.com>
> > >
> > > The HTTP/2 protocol allows a denial of service (server resource
> consumption)
> > > because request cancellation can reset many streams quickly, as
> exploited in
> > > the wild in August through October 2023.
> > >
> > > References:
> > >
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.n=
ist.gov%2Fvuln%2Fdetail%2FCVE-2023-44487&data=3D05%7C02%7CZahir.Basha%40kpi=
t.com%7Cd4fde3a4f7d34f1dad8a08dc348c6208%7C3539451eb46e4a26a242ff61502855c7=
%7C0%7C0%7C638443024796434732%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DfiFq8J6J=
GjGPo%2Bj6hd5yueYw7ty%2FHOmxO8ZKk%2FG3v%2Bs%3D&reserved=3D0
> <https://nvd.nist.gov/vuln/detail/CVE-2023-44487>
> > >
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fnghttp2%2Fnghttp2%2Fcommit%2F72b4af6143681f528f1d237b21a9a7aee17388=
32&data=3D05%7C02%7CZahir.Basha%40kpit.com%7Cd4fde3a4f7d34f1dad8a08dc348c62=
08%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638443024796440958%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C0%7C%7C%7C&sdata=3Dflz7P2tqDjNvOZYYz95xlEFKSnfkWFIZR8aiEVJ6Wng%3D=
&reserved=3D0
> <https://github.com/nghttp2/nghttp2/commit/72b4af6143681f528f1d237b21a9a7=
aee1738832>
> > >
> > > Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
> > > ---
> > >  .../nghttp2/nghttp2/CVE-2023-44487.patch      | 926 ++++++++++++++++=
++
> > >  .../recipes-support/nghttp2/nghttp2_1.47.0.bb |   1 +
> > >  2 files changed, 927 insertions(+)
> > >  create mode 100644
> meta/recipes-support/nghttp2/nghttp2/CVE-2023-44487.patch
> > >
> > > diff --git a/meta/recipes-support/nghttp2/nghttp2/CVE-2023-44487.patc=
h
> b/meta/recipes-support/nghttp2/nghttp2/CVE-2023-44487.patch
> > > new file mode 100644
> > > index 0000000000..48099683e6
> > > --- /dev/null
> > > +++ b/meta/recipes-support/nghttp2/nghttp2/CVE-2023-44487.patch
> > > @@ -0,0 +1,926 @@
> > > +From 72b4af6143681f528f1d237b21a9a7aee1738832 Mon Sep 17 00:00:00 20=
01
> > > +From: Tatsuhiro Tsujikawa <tatsuhiro.t@gmail.com>
> > > +Date: Sun, 1 Oct 2023 00:05:01 +0900
> > > +Subject: [PATCH] Rework session management
> > > +
> > > +CVE: CVE-2023-44487
> > > +
> > > +Upstream-Status: Backport [
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fnghttp2%2Fnghttp2%2Fcommit%2F72b4af6143681f528f1d237b21a9a7aee17388=
32&data=3D05%7C02%7CZahir.Basha%40kpit.com%7Cd4fde3a4f7d34f1dad8a08dc348c62=
08%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638443024796444047%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C0%7C%7C%7C&sdata=3DlpL%2B5UUS16t1gXwGciLB6rtVhwadjEek7CGf7Q8O6P0%=
3D&reserved=3D0
> <https://github.com/nghttp2/nghttp2/commit/72b4af6143681f528f1d237b21a9a7=
aee1738832>
> ]
> > > +
> > > +Signed-off-by: Zahir Hussain zahir.basha@kpit.com
> > > +---
> > > +CMakeLists.txt                 |   4 ++
> > > +cmakeconfig.h.in               |   9 +++
> > > +configure.ac                   |  21 +++++++
> > > +doc/Makefile.am                |   1 +
> > > +lib/CMakeLists.txt             |   2 +
> > > +lib/Makefile.am                |   4 ++
> > > +lib/includes/nghttp2/nghttp2.h |  17 ++++++
> > > +lib/nghttp2_option.c           |   7 +++
> > > +lib/nghttp2_ratelim.c          |  75 ++++++++++++++++++++++++
> > > +lib/nghttp2_ratelim.h          |  57 ++++++++++++++++++
> > > +lib/nghttp2_session.c          |  34 ++++++++++-
> > > +lib/nghttp2_session.h          |  12 +++-
> > > +lib/nghttp2_time.c             |  62 ++++++++++++++++++++
> > > +lib/nghttp2_time.h             |  38 ++++++++++++
> > > +tests/nghttp2_ratelim_test.c   | 101 +++++++++++++++++++++++++++++++=
+
> > > +tests/nghttp2_ratelim_test.h   |  35 +++++++++++
> > > +tests/nghttp2_session_test.c   | 103 +++++++++++++++++++++++++++++++=
++
> > > +tests/nghttp2_session_test.h   |   1 +
> > > +tests/CMakeLists.txt           |   1 +
> > > +tests/Makefile.am              |   6 +-
> > > +lib/nghttp2_option.h           |   6 ++
> > > +tests/main.c                   |   7 ++-
> > > +22 files changed, 598 insertions(+), 5 deletions(-)
> > > +create mode 100644 lib/nghttp2_ratelim.c
> > > +create mode 100644 lib/nghttp2_ratelim.h
> > > +create mode 100644 lib/nghttp2_time.c
> > > +create mode 100644 lib/nghttp2_time.h
> > > +create mode 100644 tests/nghttp2_ratelim_test.c
> > > +create mode 100644 tests/nghttp2_ratelim_test.h
> > > +
> > > +--- a/CMakeLists.txt
> > > ++++ b/CMakeLists.txt
> > > +@@ -262,6 +262,7 @@ check_include_file("netinet/in.h"   HAVE
> > > + check_include_file("pwd.h"          HAVE_PWD_H)
> > > + check_include_file("sys/socket.h"   HAVE_SYS_SOCKET_H)
> > > + check_include_file("sys/time.h"     HAVE_SYS_TIME_H)
> > > ++check_include_file("sysinfoapi.h"   HAVE_SYSINFOAPI_H)
> > > + check_include_file("syslog.h"       HAVE_SYSLOG_H)
> > > + check_include_file("time.h"         HAVE_TIME_H)
> > > + check_include_file("unistd.h"       HAVE_UNISTD_H)
> > > +@@ -302,8 +303,11 @@ check_type_size("time_t"  SIZEOF_TIME_T)
> > > + include(CheckFunctionExists)
> > > + check_function_exists(_Exit     HAVE__EXIT)
> > > + check_function_exists(accept4   HAVE_ACCEPT4)
> > > ++check_function_exists(clock_gettime HAVE_CLOCK_GETTIME)
> > > + check_function_exists(mkostemp  HAVE_MKOSTEMP)
> > > +
> > > ++check_symbol_exists(GetTickCount64 sysinfoapi.h HAVE_GETTICKCOUNT64=
)
> > > ++
> > > + include(CheckSymbolExists)
> > > + # XXX does this correctly detect initgroups (un)availability on
> cygwin?
> > > + check_symbol_exists(initgroups grp.h HAVE_DECL_INITGROUPS)
> > > +--- a/cmakeconfig.h.in
> > > ++++ b/cmakeconfig.h.in
> > > +@@ -34,9 +34,15 @@
> > > + /* Define to 1 if you have the `accept4` function. */
> > > + #cmakedefine HAVE_ACCEPT4 1
> > > +
> > > ++/* Define to 1 if you have the `clock_gettime` function. */
> > > ++#cmakedefine HAVE_CLOCK_GETTIME 1
> > > ++
> > > + /* Define to 1 if you have the `mkostemp` function. */
> > > + #cmakedefine HAVE_MKOSTEMP 1
> > > +
> > > ++/* Define to 1 if you have the `GetTickCount64` function. */
> > > ++#cmakedefine HAVE_GETTICKCOUNT64 1
> > > ++
> > > + /* Define to 1 if you have the `initgroups` function. */
> > > + #cmakedefine01 HAVE_DECL_INITGROUPS
> > > +
> > > +@@ -73,6 +79,9 @@
> > > + /* Define to 1 if you have the <sys/time.h> header file. */
> > > + #cmakedefine HAVE_SYS_TIME_H 1
> > > +
> > > ++/* Define to 1 if you have the <sysinfoapi.h> header file. */
> > > ++#cmakedefine HAVE_SYSINFOAPI_H 1
> > > ++
> > > + /* Define to 1 if you have the <syslog.h> header file. */
> > > + #cmakedefine HAVE_SYSLOG_H 1
> > > +
> > > +--- a/configure.ac
> > > ++++ b/configure.ac
> > > +@@ -607,6 +607,7 @@ AC_CHECK_HEADERS([ \
> > > +   string.h \
> > > +   sys/socket.h \
> > > +   sys/time.h \
> > > ++  sysinfoapi.h \
> > > +   syslog.h \
> > > +   time.h \
> > > +   unistd.h \
> > > +@@ -681,6 +682,7 @@ AC_FUNC_STRNLEN
> > > + AC_CHECK_FUNCS([ \
> > > +   _Exit \
> > > +   accept4 \
> > > ++  clock_gettime \
> > > +   dup2 \
> > > +   getcwd \
> > > +   getpwnam \
> > > +@@ -706,6 +708,25 @@ AC_CHECK_FUNCS([ \
> > > + AC_CHECK_FUNC([timerfd_create],
> > > +               [have_timerfd_create=3Dyes], [have_timerfd_create=3Dn=
o])
> > > +
> > > ++AC_MSG_CHECKING([checking for GetTickCount64])
> > > ++AC_LINK_IFELSE([AC_LANG_PROGRAM(
> > > ++[[
> > > ++#include <sysinfoapi.h>
> > > ++]],
> > > ++[[
> > > ++GetTickCount64();
> > > ++]])],
> > > ++[have_gettickcount64=3Dyes],
> > > ++[have_gettickcount64=3Dno])
> > > ++
> > > ++if test "x${have_gettickcount64}" =3D "xyes"; then
> > > ++  AC_MSG_RESULT([yes])
> > > ++  AC_DEFINE([HAVE_GETTICKCOUNT64], [1],
> > > ++            [Define to 1 if you have `GetTickCount64` function.])
> > > ++else
> > > ++  AC_MSG_RESULT([no])
> > > ++fi
> > > ++
> > > + # For cygwin: we can link initgroups, so AC_CHECK_FUNCS succeeds, b=
ut
> > > + # cygwin disables initgroups due to feature test macro magic with o=
ur
> > > + # configuration.  FreeBSD declares initgroups() in unistd.h.
> > > +--- a/doc/Makefile.am
> > > ++++ b/doc/Makefile.am
> > > +@@ -69,6 +69,7 @@ APIDOCS=3D \
> > > +        nghttp2_option_set_user_recv_extension_type.rst \
> > > +        nghttp2_option_set_max_outbound_ack.rst \
> > > +        nghttp2_option_set_max_settings.rst \
> > > ++       nghttp2_option_set_stream_reset_rate_limit.rst \
> > > +        nghttp2_pack_settings_payload.rst \
> > > +        nghttp2_priority_spec_check_default.rst \
> > > +        nghttp2_priority_spec_default_init.rst \
> > > +--- a/lib/CMakeLists.txt
> > > ++++ b/lib/CMakeLists.txt
> > > +@@ -23,6 +23,8 @@ set(NGHTTP2_SOURCES
> > > +   nghttp2_mem.c
> > > +   nghttp2_http.c
> > > +   nghttp2_rcbuf.c
> > > ++  nghttp2_ratelim.c
> > > ++  nghttp2_time.c
> > > +   nghttp2_debug.c
> > > + )
> > > +
> > > +--- a/lib/Makefile.am
> > > ++++ b/lib/Makefile.am
> > > +@@ -49,6 +49,8 @@ OBJECTS =3D nghttp2_pq.c nghttp2_map.c ngh
> > > +        nghttp2_mem.c \
> > > +        nghttp2_http.c \
> > > +        nghttp2_rcbuf.c \
> > > ++       nghttp2_ratelim.c \
> > > ++       nghttp2_time.c \
> > > +        nghttp2_debug.c
> > > +
> > > + HFILES =3D nghttp2_pq.h nghttp2_int.h nghttp2_map.h nghttp2_queue.h=
 \
> > > +@@ -65,6 +67,8 @@ HFILES =3D nghttp2_pq.h nghttp2_int.h nght
> > > +        nghttp2_mem.h \
> > > +        nghttp2_http.h \
> > > +        nghttp2_rcbuf.h \
> > > ++       nghttp2_ratelim.h \
> > > ++       nghttp2_time.h \
> > > +        nghttp2_debug.h
> > > +
> > > + libnghttp2_la_SOURCES =3D $(HFILES) $(OBJECTS)
> > > +--- a/lib/includes/nghttp2/nghttp2.h
> > > ++++ b/lib/includes/nghttp2/nghttp2.h
> > > +@@ -2763,6 +2763,23 @@ nghttp2_session_client_new2(nghttp2_sess
> > > + /**
> > > +  * @function
> > > +  *
> > > ++ * This function sets the rate limit for the incoming stream reset
> > > ++ * (RST_STREAM frame).  It is server use only.  It is a token-bucke=
t
> > > ++ * based rate limiter.  |burst| specifies the number of tokens that
> is
> > > ++ * initially available.  The maximum number of tokens is capped to
> > > ++ * this value.  |rate| specifies the number of tokens that are
> > > ++ * regenerated per second.  An incoming RST_STREAM consumes one
> token.
> > > ++ * If there is no token available, GOAWAY is sent to tear down the
> > > ++ * connection.  |burst| and |rate| default to 1000 and 33
> > > ++ * respectively.
> > > ++ */
> > > ++NGHTTP2_EXTERN void
> > > ++nghttp2_option_set_stream_reset_rate_limit(nghttp2_option *option,
> > > ++                                           uint64_t burst, uint64_t
> rate);
> > > ++
> > > ++/**
> > > ++ * @function
> > > ++ *
> > > +  * Like `nghttp2_session_server_new()`, but with additional options
> > > +  * specified in the |option|.
> > > +  *
> > > +--- a/lib/nghttp2_option.c
> > > ++++ b/lib/nghttp2_option.c
> > > +@@ -126,3 +126,10 @@ void nghttp2_option_set_max_settings(ngh
> > > +   option->opt_set_mask |=3D NGHTTP2_OPT_MAX_SETTINGS;
> > > +   option->max_settings =3D val;
> > > + }
> > > ++
> > > ++void nghttp2_option_set_stream_reset_rate_limit(nghttp2_option
> *option,
> > > ++                                                uint64_t burst,
> uint64_t rate) {
> > > ++  option->opt_set_mask |=3D NGHTTP2_OPT_STREAM_RESET_RATE_LIMIT;
> > > ++  option->stream_reset_burst =3D burst;
> > > ++  option->stream_reset_rate =3D rate;
> > > ++}
> > > +--- /dev/null
> > > ++++ b/lib/nghttp2_ratelim.c
> > > +@@ -0,0 +1,75 @@
> > > ++/*
> > > ++ * nghttp2 - HTTP/2 C Library
> > > ++ *
> > > ++ * Copyright (c) 2023 nghttp2 contributors
> > > ++ *
> > > ++ * Permission is hereby granted, free of charge, to any person
> obtaining
> > > ++ * a copy of this software and associated documentation files (the
> > > ++ * "Software"), to deal in the Software without restriction,
> including
> > > ++ * without limitation the rights to use, copy, modify, merge,
> publish,
> > > ++ * distribute, sublicense, and/or sell copies of the Software, and =
to
> > > ++ * permit persons to whom the Software is furnished to do so,
> subject to
> > > ++ * the following conditions:
> > > ++ *
> > > ++ * The above copyright notice and this permission notice shall be
> > > ++ * included in all copies or substantial portions of the Software.
> > > ++ *
> > > ++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > > ++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES =
OF
> > > ++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > > ++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> HOLDERS BE
> > > ++ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> ACTION
> > > ++ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> CONNECTION
> > > ++ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> > > ++ */
> > > ++#include "nghttp2_ratelim.h"
> > > ++#include "nghttp2_helper.h"
> > > ++
> > > ++void nghttp2_ratelim_init(nghttp2_ratelim *rl, uint64_t burst,
> uint64_t rate) {
> > > ++  rl->val =3D rl->burst =3D burst;
> > > ++  rl->rate =3D rate;
> > > ++  rl->tstamp =3D 0;
> > > ++}
> > > ++
> > > ++void nghttp2_ratelim_update(nghttp2_ratelim *rl, uint64_t tstamp) {
> > > ++  uint64_t d, gain;
> > > ++
> > > ++  if (tstamp =3D=3D rl->tstamp) {
> > > ++    return;
> > > ++  }
> > > ++
> > > ++  if (tstamp > rl->tstamp) {
> > > ++    d =3D tstamp - rl->tstamp;
> > > ++  } else {
> > > ++    d =3D 1;
> > > ++  }
> > > ++
> > > ++  rl->tstamp =3D tstamp;
> > > ++
> > > ++  if (UINT64_MAX / d < rl->rate) {
> > > ++    rl->val =3D rl->burst;
> > > ++
> > > ++    return;
> > > ++  }
> > > ++
> > > ++  gain =3D rl->rate * d;
> > > ++
> > > ++  if (UINT64_MAX - gain < rl->val) {
> > > ++    rl->val =3D rl->burst;
> > > ++
> > > ++    return;
> > > ++  }
> > > ++
> > > ++  rl->val +=3D gain;
> > > ++  rl->val =3D nghttp2_min(rl->val, rl->burst);
> > > ++}
> > > ++
> > > ++int nghttp2_ratelim_drain(nghttp2_ratelim *rl, uint64_t n) {
> > > ++  if (rl->val < n) {
> > > ++    return -1;
> > > ++  }
> > > ++
> > > ++  rl->val -=3D n;
> > > ++
> > > ++  return 0;
> > > ++}
> > > +--- /dev/null
> > > ++++ b/lib/nghttp2_ratelim.h
> > > +@@ -0,0 +1,57 @@
> > > ++/*
> > > ++ * nghttp2 - HTTP/2 C Library
> > > ++ *
> > > ++ * Copyright (c) 2023 nghttp2 contributors
> > > ++ *
> > > ++ * Permission is hereby granted, free of charge, to any person
> obtaining
> > > ++ * a copy of this software and associated documentation files (the
> > > ++ * "Software"), to deal in the Software without restriction,
> including
> > > ++ * without limitation the rights to use, copy, modify, merge,
> publish,
> > > ++ * distribute, sublicense, and/or sell copies of the Software, and =
to
> > > ++ * permit persons to whom the Software is furnished to do so,
> subject to
> > > ++ * the following conditions:
> > > ++ *
> > > ++ * The above copyright notice and this permission notice shall be
> > > ++ * included in all copies or substantial portions of the Software.
> > > ++ *
> > > ++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > > ++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES =
OF
> > > ++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > > ++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> HOLDERS BE
> > > ++ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> ACTION
> > > ++ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> CONNECTION
> > > ++ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> > > ++ */
> > > ++#ifndef NGHTTP2_RATELIM_H
> > > ++#define NGHTTP2_RATELIM_H
> > > ++
> > > ++#ifdef HAVE_CONFIG_H
> > > ++#  include <config.h>
> > > ++#endif /* HAVE_CONFIG_H */
> > > ++
> > > ++#include <nghttp2/nghttp2.h>
> > > ++
> > > ++typedef struct nghttp2_ratelim {
> > > ++  /* burst is the maximum value of val. */
> > > ++  uint64_t burst;
> > > ++  /* rate is the amount of value that is regenerated per 1 tstamp. =
*/
> > > ++  uint64_t rate;
> > > ++  /* val is the amount of value available to drain. */
> > > ++  uint64_t val;
> > > ++  /* tstamp is the last timestamp in second resolution that is know=
n
> > > ++     to this object. */
> > > ++  uint64_t tstamp;
> > > ++} nghttp2_ratelim;
> > > ++
> > > ++/* nghttp2_ratelim_init initializes |rl| with the given parameters.
> */
> > > ++void nghttp2_ratelim_init(nghttp2_ratelim *rl, uint64_t burst,
> uint64_t rate);
> > > ++
> > > ++/* nghttp2_ratelim_update updates rl->val with the current |tstamp|
> > > ++   given in second resolution. */
> > > ++void nghttp2_ratelim_update(nghttp2_ratelim *rl, uint64_t tstamp);
> > > ++
> > > ++/* nghttp2_ratelim_drain drains |n| from rl->val.  It returns 0 if =
it
> > > ++   succeeds, or -1. */
> > > ++int nghttp2_ratelim_drain(nghttp2_ratelim *rl, uint64_t n);
> > > ++
> > > ++#endif /* NGHTTP2_RATELIM_H */
> > > +--- a/lib/nghttp2_session.c
> > > ++++ b/lib/nghttp2_session.c
> > > +@@ -36,6 +36,7 @@
> > > + #include "nghttp2_option.h"
> > > + #include "nghttp2_http.h"
> > > + #include "nghttp2_pq.h"
> > > ++#include "nghttp2_time.h"
> > > + #include "nghttp2_debug.h"
> > > +
> > > + /*
> > > +@@ -443,6 +444,10 @@ static int session_new(nghttp2_session *
> > > +       NGHTTP2_DEFAULT_MAX_CONCURRENT_STREAMS;
> > > +   (*session_ptr)->pending_enable_push =3D 1;
> > > +
> > > ++  nghttp2_ratelim_init(&(*session_ptr)->stream_reset_ratelim,
> > > ++                       NGHTTP2_DEFAULT_STREAM_RESET_BURST,
> > > ++                       NGHTTP2_DEFAULT_STREAM_RESET_RATE);
> > > ++
> > > +   if (server) {
> > > +     (*session_ptr)->server =3D 1;
> > > +   }
> > > +@@ -527,6 +532,12 @@ static int session_new(nghttp2_session *
> > > +         option->max_settings) {
> > > +       (*session_ptr)->max_settings =3D option->max_settings;
> > > +     }
> > > ++
> > > ++    if (option->opt_set_mask & NGHTTP2_OPT_STREAM_RESET_RATE_LIMIT)=
 {
> > > ++      nghttp2_ratelim_init(&(*session_ptr)->stream_reset_ratelim,
> > > ++                           option->stream_reset_burst,
> > > ++                           option->stream_reset_rate);
> > > ++    }
> > > +   }
> > > +
> > > +   rv =3D nghttp2_hd_deflate_init2(&(*session_ptr)->hd_deflater,
> > > +@@ -4144,6 +4155,23 @@ static int session_process_priority_fram
> > > +   return nghttp2_session_on_priority_received(session, frame);
> > > + }
> > > +
> > > ++static int session_update_stream_reset_ratelim(nghttp2_session
> *session) {
> > > ++  if (!session->server || (session->goaway_flags &
> NGHTTP2_GOAWAY_SUBMITTED)) {
> > > ++    return 0;
> > > ++  }
> > > ++
> > > ++  nghttp2_ratelim_update(&session->stream_reset_ratelim,
> > > ++                         nghttp2_time_now_sec());
> > > ++
> > > ++  if (nghttp2_ratelim_drain(&session->stream_reset_ratelim, 1) =3D=
=3D 0)
> {
> > > ++    return 0;
> > > ++  }
> > > ++
> > > ++  return nghttp2_session_add_goaway(session,
> session->last_recv_stream_id,
> > > ++                                    NGHTTP2_INTERNAL_ERROR, NULL, 0=
,
> > > ++                                    NGHTTP2_GOAWAY_AUX_NONE);
> > > ++}
> > > ++
> > > + int nghttp2_session_on_rst_stream_received(nghttp2_session *session=
,
> > > +                                            nghttp2_frame *frame) {
> > > +   int rv;
> > > +@@ -4173,7 +4201,8 @@ int nghttp2_session_on_rst_stream_receiv
> > > +   if (nghttp2_is_fatal(rv)) {
> > > +     return rv;
> > > +   }
> > > +-  return 0;
> > > ++
> > > ++  return session_update_stream_reset_ratelim(session);
> > > + }
> > > +
> > > + static int session_process_rst_stream_frame(nghttp2_session
> *session) {
> > > +@@ -6965,6 +6994,9 @@ int nghttp2_session_add_goaway(nghttp2_s
> > > +     nghttp2_mem_free(mem, item);
> > > +     return rv;
> > > +   }
> > > ++
> > > ++  session->goaway_flags |=3D NGHTTP2_GOAWAY_SUBMITTED;
> > > ++
> > > +   return 0;
> > > + }
> > > +
> > > +--- a/lib/nghttp2_session.h
> > > ++++ b/lib/nghttp2_session.h
> > > +@@ -39,6 +39,7 @@
> > > + #include "nghttp2_buf.h"
> > > + #include "nghttp2_callbacks.h"
> > > + #include "nghttp2_mem.h"
> > > ++#include "nghttp2_ratelim.h"
> > > +
> > > + /* The global variable for tests where we want to disable strict
> > > +    preface handling. */
> > > +@@ -102,6 +103,10 @@ typedef struct {
> > > + /* The default value of maximum number of concurrent streams. */
> > > + #define NGHTTP2_DEFAULT_MAX_CONCURRENT_STREAMS 0xffffffffu
> > > +
> > > ++/* The default values for stream reset rate limiter. */
> > > ++#define NGHTTP2_DEFAULT_STREAM_RESET_BURST 1000
> > > ++#define NGHTTP2_DEFAULT_STREAM_RESET_RATE 33
> > > ++
> > > + /* Internal state when receiving incoming frame */
> > > + typedef enum {
> > > +   /* Receiving frame header */
> > > +@@ -176,7 +181,9 @@ typedef enum {
> > > +   /* Flag means GOAWAY was sent */
> > > +   NGHTTP2_GOAWAY_SENT =3D 0x4,
> > > +   /* Flag means GOAWAY was received */
> > > +-  NGHTTP2_GOAWAY_RECV =3D 0x8
> > > ++  NGHTTP2_GOAWAY_RECV =3D 0x8,
> > > ++  /* Flag means GOAWAY has been submitted at least once */
> > > ++  NGHTTP2_GOAWAY_SUBMITTED =3D 0x10
> > > + } nghttp2_goaway_flag;
> > > +
> > > + /* nghttp2_inflight_settings stores the SETTINGS entries which loca=
l
> > > +@@ -230,6 +237,9 @@ struct nghttp2_session {
> > > +   /* Queue of In-flight SETTINGS values.  SETTINGS bearing ACK is n=
ot
> > > +      considered as in-flight. */
> > > +   nghttp2_inflight_settings *inflight_settings_head;
> > > ++  /* Stream reset rate limiter.  If receiving excessive amount of
> > > ++     stream resets, GOAWAY will be sent. */
> > > ++  nghttp2_ratelim stream_reset_ratelim;
> > > +   /* The number of outgoing streams. This will be capped by
> > > +      remote_settings.max_concurrent_streams. */
> > > +   size_t num_outgoing_streams;
> > > +--- /dev/null
> > > ++++ b/lib/nghttp2_time.c
> > > +@@ -0,0 +1,62 @@
> > > ++/*
> > > ++ * nghttp2 - HTTP/2 C Library
> > > ++ *
> > > ++ * Copyright (c) 2023 nghttp2 contributors
> > > ++ *
> > > ++ * Permission is hereby granted, free of charge, to any person
> obtaining
> > > ++ * a copy of this software and associated documentation files (the
> > > ++ * "Software"), to deal in the Software without restriction,
> including
> > > ++ * without limitation the rights to use, copy, modify, merge,
> publish,
> > > ++ * distribute, sublicense, and/or sell copies of the Software, and =
to
> > > ++ * permit persons to whom the Software is furnished to do so,
> subject to
> > > ++ * the following conditions:
> > > ++ *
> > > ++ * The above copyright notice and this permission notice shall be
> > > ++ * included in all copies or substantial portions of the Software.
> > > ++ *
> > > ++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > > ++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES =
OF
> > > ++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > > ++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> HOLDERS BE
> > > ++ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> ACTION
> > > ++ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> CONNECTION
> > > ++ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> > > ++ */
> > > ++#include "nghttp2_time.h"
> > > ++
> > > ++#ifdef HAVE_TIME_H
> > > ++#  include <time.h>
> > > ++#endif /* HAVE_TIME_H */
> > > ++
> > > ++#ifdef HAVE_SYSINFOAPI_H
> > > ++#  include <sysinfoapi.h>
> > > ++#endif /* HAVE_SYSINFOAPI_H */
> > > ++
> > > ++#ifndef HAVE_GETTICKCOUNT64
> > > ++static uint64_t time_now_sec(void) {
> > > ++  time_t t =3D time(NULL);
> > > ++
> > > ++  if (t =3D=3D -1) {
> > > ++    return 0;
> > > ++  }
> > > ++
> > > ++  return (uint64_t)t;
> > > ++}
> > > ++#endif /* HAVE_GETTICKCOUNT64 */
> > > ++
> > > ++#ifdef HAVE_CLOCK_GETTIME
> > > ++uint64_t nghttp2_time_now_sec(void) {
> > > ++  struct timespec tp;
> > > ++  int rv =3D clock_gettime(CLOCK_MONOTONIC, &tp);
> > > ++
> > > ++  if (rv =3D=3D -1) {
> > > ++    return time_now_sec();
> > > ++  }
> > > ++
> > > ++  return (uint64_t)tp.tv_sec;
> > > ++}
> > > ++#elif defined(HAVE_GETTICKCOUNT64)
> > > ++uint64_t nghttp2_time_now_sec(void) { return GetTickCount64() /
> 1000; }
> > > ++#else  /* !HAVE_CLOCK_GETTIME && !HAVE_GETTICKCOUNT64 */
> > > ++uint64_t nghttp2_time_now_sec(void) { return time_now_sec(); }
> > > ++#endif /* !HAVE_CLOCK_GETTIME && !HAVE_GETTICKCOUNT64 */
> > > +--- /dev/null
> > > ++++ b/lib/nghttp2_time.h
> > > +@@ -0,0 +1,38 @@
> > > ++/*
> > > ++ * nghttp2 - HTTP/2 C Library
> > > ++ *
> > > ++ * Copyright (c) 2023 nghttp2 contributors
> > > ++ *
> > > ++ * Permission is hereby granted, free of charge, to any person
> obtaining
> > > ++ * a copy of this software and associated documentation files (the
> > > ++ * "Software"), to deal in the Software without restriction,
> including
> > > ++ * without limitation the rights to use, copy, modify, merge,
> publish,
> > > ++ * distribute, sublicense, and/or sell copies of the Software, and =
to
> > > ++ * permit persons to whom the Software is furnished to do so,
> subject to
> > > ++ * the following conditions:
> > > ++ *
> > > ++ * The above copyright notice and this permission notice shall be
> > > ++ * included in all copies or substantial portions of the Software.
> > > ++ *
> > > ++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > > ++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES =
OF
> > > ++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > > ++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> HOLDERS BE
> > > ++ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> ACTION
> > > ++ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> CONNECTION
> > > ++ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> > > ++ */
> > > ++#ifndef NGHTTP2_TIME_H
> > > ++#define NGHTTP2_TIME_H
> > > ++
> > > ++#ifdef HAVE_CONFIG_H
> > > ++#  include <config.h>
> > > ++#endif /* HAVE_CONFIG_H */
> > > ++
> > > ++#include <nghttp2/nghttp2.h>
> > > ++
> > > ++/* nghttp2_time_now_sec returns seconds from implementation-specifi=
c
> > > ++   timepoint.  If it is unable to get seconds, it returns 0. */
> > > ++uint64_t nghttp2_time_now_sec(void);
> > > ++
> > > ++#endif /* NGHTTP2_TIME_H */
> > > +--- /dev/null
> > > ++++ b/tests/nghttp2_ratelim_test.c
> > > +@@ -0,0 +1,101 @@
> > > ++/*
> > > ++ * nghttp2 - HTTP/2 C Library
> > > ++ *
> > > ++ * Copyright (c) 2023 nghttp2 contributors
> > > ++ *
> > > ++ * Permission is hereby granted, free of charge, to any person
> obtaining
> > > ++ * a copy of this software and associated documentation files (the
> > > ++ * "Software"), to deal in the Software without restriction,
> including
> > > ++ * without limitation the rights to use, copy, modify, merge,
> publish,
> > > ++ * distribute, sublicense, and/or sell copies of the Software, and =
to
> > > ++ * permit persons to whom the Software is furnished to do so,
> subject to
> > > ++ * the following conditions:
> > > ++ *
> > > ++ * The above copyright notice and this permission notice shall be
> > > ++ * included in all copies or substantial portions of the Software.
> > > ++ *
> > > ++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > > ++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES =
OF
> > > ++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > > ++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> HOLDERS BE
> > > ++ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> ACTION
> > > ++ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> CONNECTION
> > > ++ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> > > ++ */
> > > ++#include "nghttp2_ratelim_test.h"
> > > ++
> > > ++#include <stdio.h>
> > > ++
> > > ++#include <CUnit/CUnit.h>
> > > ++
> > > ++#include "nghttp2_ratelim.h"
> > > ++
> > > ++void test_nghttp2_ratelim_update(void) {
> > > ++  nghttp2_ratelim rl;
> > > ++
> > > ++  nghttp2_ratelim_init(&rl, 1000, 21);
> > > ++
> > > ++  CU_ASSERT(1000 =3D=3D rl.val);
> > > ++  CU_ASSERT(1000 =3D=3D rl.burst);
> > > ++  CU_ASSERT(21 =3D=3D rl.rate);
> > > ++  CU_ASSERT(0 =3D=3D rl.tstamp);
> > > ++
> > > ++  nghttp2_ratelim_update(&rl, 999);
> > > ++
> > > ++  CU_ASSERT(1000 =3D=3D rl.val);
> > > ++  CU_ASSERT(999 =3D=3D rl.tstamp);
> > > ++
> > > ++  nghttp2_ratelim_drain(&rl, 100);
> > > ++
> > > ++  CU_ASSERT(900 =3D=3D rl.val);
> > > ++
> > > ++  nghttp2_ratelim_update(&rl, 1000);
> > > ++
> > > ++  CU_ASSERT(921 =3D=3D rl.val);
> > > ++
> > > ++  nghttp2_ratelim_update(&rl, 1002);
> > > ++
> > > ++  CU_ASSERT(963 =3D=3D rl.val);
> > > ++
> > > ++  nghttp2_ratelim_update(&rl, 1004);
> > > ++
> > > ++  CU_ASSERT(1000 =3D=3D rl.val);
> > > ++  CU_ASSERT(1004 =3D=3D rl.tstamp);
> > > ++
> > > ++  /* timer skew */
> > > ++  nghttp2_ratelim_init(&rl, 1000, 21);
> > > ++  nghttp2_ratelim_update(&rl, 1);
> > > ++
> > > ++  CU_ASSERT(1000 =3D=3D rl.val);
> > > ++
> > > ++  nghttp2_ratelim_update(&rl, 0);
> > > ++
> > > ++  CU_ASSERT(1000 =3D=3D rl.val);
> > > ++
> > > ++  /* rate * duration overflow */
> > > ++  nghttp2_ratelim_init(&rl, 1000, 100);
> > > ++  nghttp2_ratelim_drain(&rl, 999);
> > > ++
> > > ++  CU_ASSERT(1 =3D=3D rl.val);
> > > ++
> > > ++  nghttp2_ratelim_update(&rl, UINT64_MAX);
> > > ++
> > > ++  CU_ASSERT(1000 =3D=3D rl.val);
> > > ++
> > > ++  /* val + rate * duration overflow */
> > > ++  nghttp2_ratelim_init(&rl, UINT64_MAX - 1, 2);
> > > ++  nghttp2_ratelim_update(&rl, 1);
> > > ++
> > > ++  CU_ASSERT(UINT64_MAX - 1 =3D=3D rl.val);
> > > ++}
> > > ++
> > > ++void test_nghttp2_ratelim_drain(void) {
> > > ++  nghttp2_ratelim rl;
> > > ++
> > > ++  nghttp2_ratelim_init(&rl, 100, 7);
> > > ++
> > > ++  CU_ASSERT(-1 =3D=3D nghttp2_ratelim_drain(&rl, 101));
> > > ++  CU_ASSERT(0 =3D=3D nghttp2_ratelim_drain(&rl, 51));
> > > ++  CU_ASSERT(0 =3D=3D nghttp2_ratelim_drain(&rl, 49));
> > > ++  CU_ASSERT(-1 =3D=3D nghttp2_ratelim_drain(&rl, 1));
> > > ++}
> > > +--- /dev/null
> > > ++++ b/tests/nghttp2_ratelim_test.h
> > > +@@ -0,0 +1,35 @@
> > > ++/*
> > > ++ * nghttp2 - HTTP/2 C Library
> > > ++ *
> > > ++ * Copyright (c) 2023 nghttp2 contributors
> > > ++ *
> > > ++ * Permission is hereby granted, free of charge, to any person
> obtaining
> > > ++ * a copy of this software and associated documentation files (the
> > > ++ * "Software"), to deal in the Software without restriction,
> including
> > > ++ * without limitation the rights to use, copy, modify, merge,
> publish,
> > > ++ * distribute, sublicense, and/or sell copies of the Software, and =
to
> > > ++ * permit persons to whom the Software is furnished to do so,
> subject to
> > > ++ * the following conditions:
> > > ++ *
> > > ++ * The above copyright notice and this permission notice shall be
> > > ++ * included in all copies or substantial portions of the Software.
> > > ++ *
> > > ++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > > ++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES =
OF
> > > ++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> > > ++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> HOLDERS BE
> > > ++ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> ACTION
> > > ++ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> CONNECTION
> > > ++ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> > > ++ */
> > > ++#ifndef NGHTTP2_RATELIM_TEST_H
> > > ++#define NGHTTP2_RATELIM_TEST_H
> > > ++
> > > ++#ifdef HAVE_CONFIG_H
> > > ++#  include <config.h>
> > > ++#endif /* HAVE_CONFIG_H */
> > > ++
> > > ++void test_nghttp2_ratelim_update(void);
> > > ++void test_nghttp2_ratelim_drain(void);
> > > ++
> > > ++#endif /* NGHTTP2_RATELIM_TEST_H */
> > > +--- a/tests/nghttp2_session_test.c
> > > ++++ b/tests/nghttp2_session_test.c
> > > +@@ -10813,6 +10813,109 @@ void test_nghttp2_session_set_stream_use
> > > +   nghttp2_session_del(session);
> > > + }
> > > +
> > > ++void test_nghttp2_session_stream_reset_ratelim(void) {
> > > ++  nghttp2_session *session;
> > > ++  nghttp2_session_callbacks callbacks;
> > > ++  nghttp2_frame frame;
> > > ++  ssize_t rv;
> > > ++  nghttp2_bufs bufs;
> > > ++  nghttp2_buf *buf;
> > > ++  nghttp2_mem *mem;
> > > ++  size_t i;
> > > ++  nghttp2_hd_deflater deflater;
> > > ++  size_t nvlen;
> > > ++  nghttp2_nv *nva;
> > > ++  int32_t stream_id;
> > > ++  nghttp2_outbound_item *item;
> > > ++  nghttp2_option *option;
> > > ++
> > > ++  mem =3D nghttp2_mem_default();
> > > ++  frame_pack_bufs_init(&bufs);
> > > ++
> > > ++  memset(&callbacks, 0, sizeof(nghttp2_session_callbacks));
> > > ++  callbacks.send_callback =3D null_send_callback;
> > > ++
> > > ++  nghttp2_option_new(&option);
> > > ++  nghttp2_option_set_stream_reset_rate_limit(
> > > ++      option, NGHTTP2_DEFAULT_STREAM_RESET_BURST, 0);
> > > ++
> > > ++  nghttp2_session_server_new2(&session, &callbacks, NULL, option);
> > > ++
> > > ++  nghttp2_frame_settings_init(&frame.settings, NGHTTP2_FLAG_NONE,
> NULL, 0);
> > > ++  rv =3D nghttp2_frame_pack_settings(&bufs, &frame.settings);
> > > ++
> > > ++  CU_ASSERT(0 =3D=3D rv);
> > > ++
> > > ++  nghttp2_frame_settings_free(&frame.settings, mem);
> > > ++
> > > ++  buf =3D &bufs.head->buf;
> > > ++  rv =3D nghttp2_session_mem_recv(session, buf->pos,
> nghttp2_buf_len(buf));
> > > ++
> > > ++  CU_ASSERT((ssize_t)nghttp2_buf_len(buf) =3D=3D rv);
> > > ++
> > > ++  /* Send SETTINGS ACK */
> > > ++  rv =3D nghttp2_session_send(session);
> > > ++
> > > ++  CU_ASSERT(0 =3D=3D rv);
> > > ++
> > > ++  nghttp2_hd_deflate_init(&deflater, mem);
> > > ++
> > > ++  for (i =3D 0; i < NGHTTP2_DEFAULT_STREAM_RESET_BURST + 2; ++i) {
> > > ++    stream_id =3D (int32_t)(i * 2 + 1);
> > > ++
> > > ++    nghttp2_bufs_reset(&bufs);
> > > ++
> > > ++    /* HEADERS */
> > > ++    nvlen =3D ARRLEN(reqnv);
> > > ++    nghttp2_nv_array_copy(&nva, reqnv, nvlen, mem);
> > > ++    nghttp2_frame_headers_init(&frame.headers,
> NGHTTP2_FLAG_END_HEADERS,
> > > ++                               stream_id, NGHTTP2_HCAT_HEADERS,
> NULL, nva,
> > > ++                               nvlen);
> > > ++    rv =3D nghttp2_frame_pack_headers(&bufs, &frame.headers,
> &deflater);
> > > ++
> > > ++    CU_ASSERT(0 =3D=3D rv);
> > > ++
> > > ++    nghttp2_frame_headers_free(&frame.headers, mem);
> > > ++
> > > ++    buf =3D &bufs.head->buf;
> > > ++    rv =3D nghttp2_session_mem_recv(session, buf->pos,
> nghttp2_buf_len(buf));
> > > ++
> > > ++    CU_ASSERT((ssize_t)nghttp2_buf_len(buf) =3D=3D rv);
> > > ++
> > > ++    nghttp2_bufs_reset(&bufs);
> > > ++
> > > ++    /* RST_STREAM */
> > > ++    nghttp2_frame_rst_stream_init(&frame.rst_stream, stream_id,
> > > ++                                  NGHTTP2_NO_ERROR);
> > > ++    nghttp2_frame_pack_rst_stream(&bufs, &frame.rst_stream);
> > > ++    nghttp2_frame_rst_stream_free(&frame.rst_stream);
> > > ++
> > > ++    buf =3D &bufs.head->buf;
> > > ++    rv =3D nghttp2_session_mem_recv(session, buf->pos,
> nghttp2_buf_len(buf));
> > > ++
> > > ++    CU_ASSERT((ssize_t)nghttp2_buf_len(buf) =3D=3D rv);
> > > ++
> > > ++    if (i < NGHTTP2_DEFAULT_STREAM_RESET_BURST) {
> > > ++      CU_ASSERT(0 =3D=3D nghttp2_outbound_queue_size(&session->ob_r=
eg));
> > > ++
> > > ++      continue;
> > > ++    }
> > > ++
> > > ++    CU_ASSERT(1 =3D=3D nghttp2_outbound_queue_size(&session->ob_reg=
));
> > > ++
> > > ++    item =3D nghttp2_session_get_next_ob_item(session);
> > > ++
> > > ++    CU_ASSERT(NGHTTP2_GOAWAY =3D=3D item->frame.hd.type);
> > > ++    CU_ASSERT(NGHTTP2_DEFAULT_STREAM_RESET_BURST * 2 + 1 =3D=3D
> > > ++              item->frame.goaway.last_stream_id);
> > > ++  }
> > > ++
> > > ++  nghttp2_hd_deflate_free(&deflater);
> > > ++  nghttp2_session_del(session);
> > > ++  nghttp2_bufs_free(&bufs);
> > > ++  nghttp2_option_del(option);
> > > ++}
> > > ++
> > > + static void check_nghttp2_http_recv_headers_fail(
> > > +     nghttp2_session *session, nghttp2_hd_deflater *deflater, int32_=
t
> stream_id,
> > > +     int stream_state, const nghttp2_nv *nva, size_t nvlen) {
> > > +--- a/tests/nghttp2_session_test.h
> > > ++++ b/tests/nghttp2_session_test.h
> > > +@@ -160,6 +160,7 @@ void test_nghttp2_session_removed_closed
> > > + void test_nghttp2_session_pause_data(void);
> > > + void test_nghttp2_session_no_closed_streams(void);
> > > + void test_nghttp2_session_set_stream_user_data(void);
> > > ++void test_nghttp2_session_stream_reset_ratelim(void);
> > > + void test_nghttp2_http_mandatory_headers(void);
> > > + void test_nghttp2_http_content_length(void);
> > > + void test_nghttp2_http_content_length_mismatch(void);
> > > +--- a/tests/CMakeLists.txt
> > > ++++ b/tests/CMakeLists.txt
> > > +@@ -21,6 +21,7 @@ if(HAVE_CUNIT)
> > > +     nghttp2_npn_test.c
> > > +     nghttp2_helper_test.c
> > > +     nghttp2_buf_test.c
> > > ++    nghttp2_ratelim_test.c
> > > +   )
> > > +
> > > +   add_executable(main EXCLUDE_FROM_ALL
> > > +--- a/tests/Makefile.am
> > > ++++ b/tests/Makefile.am
> > > +@@ -40,14 +40,16 @@ OBJECTS =3D main.c nghttp2_pq_test.c nghtt
> > > +        nghttp2_hd_test.c \
> > > +        nghttp2_npn_test.c \
> > > +        nghttp2_helper_test.c \
> > > +-       nghttp2_buf_test.c
> > > ++       nghttp2_buf_test.c \
> > > ++       nghttp2_ratelim_test.c
> > > +
> > > + HFILES =3D nghttp2_pq_test.h nghttp2_map_test.h nghttp2_queue_test.=
h \
> > > +        nghttp2_session_test.h \
> > > +        nghttp2_frame_test.h nghttp2_stream_test.h nghttp2_hd_test.h=
 \
> > > +        nghttp2_npn_test.h nghttp2_helper_test.h \
> > > +        nghttp2_test_helper.h \
> > > +-       nghttp2_buf_test.h
> > > ++       nghttp2_buf_test.h \
> > > ++       nghttp2_ratelim_test.h
> > > +
> > > + main_SOURCES =3D $(HFILES) $(OBJECTS)
> > > +
> > > +--- a/lib/nghttp2_option.h
> > > ++++ b/lib/nghttp2_option.h
> > > +@@ -68,6 +68,7 @@ typedef enum {
> > > +   NGHTTP2_OPT_NO_CLOSED_STREAMS =3D 1 << 10,
> > > +   NGHTTP2_OPT_MAX_OUTBOUND_ACK =3D 1 << 11,
> > > +   NGHTTP2_OPT_MAX_SETTINGS =3D 1 << 12,
> > > ++  NGHTTP2_OPT_STREAM_RESET_RATE_LIMIT =3D 1 << 15,
> > > + } nghttp2_option_flag;
> > > +
> > > + /**
> > > +@@ -75,6 +76,11 @@ typedef enum {
> > > +  */
> > > + struct nghttp2_option {
> > > +   /**
> > > ++   * NGHTTP2_OPT_STREAM_RESET_RATE_LIMIT
> > > ++   */
> > > ++  uint64_t stream_reset_burst;
> > > ++  uint64_t stream_reset_rate;
> > > ++  /**
> > > +    * NGHTTP2_OPT_MAX_SEND_HEADER_BLOCK_LENGTH
> > > +    */
> > > +   size_t max_send_header_block_length;
> > > +--- a/tests/main.c
> > > ++++ b/tests/main.c
> > > +@@ -40,6 +40,7 @@
> > > + #include "nghttp2_npn_test.h"
> > > + #include "nghttp2_helper_test.h"
> > > + #include "nghttp2_buf_test.h"
> > > ++#include "nghttp2_ratelim_test.h"
> > > +
> > > + extern int nghttp2_enable_strict_preface;
> > > +
> > > +@@ -323,6 +324,8 @@ int main() {
> > > +                    test_nghttp2_session_no_closed_streams) ||
> > > +       !CU_add_test(pSuite, "session_set_stream_user_data",
> > > +                    test_nghttp2_session_set_stream_user_data) ||
> > > ++      !CU_add_test(pSuite, "session_stream_reset_ratelim",
> > > ++                  test_nghttp2_session_stream_reset_ratelim) ||
> > > +       !CU_add_test(pSuite, "http_mandatory_headers",
> > > +                    test_nghttp2_http_mandatory_headers) ||
> > > +       !CU_add_test(pSuite, "http_content_length",
> > > +@@ -418,7 +421,9 @@ int main() {
> > > +       !CU_add_test(pSuite, "bufs_advance",
> test_nghttp2_bufs_advance) ||
> > > +       !CU_add_test(pSuite, "bufs_next_present",
> > > +                    test_nghttp2_bufs_next_present) ||
> > > +-      !CU_add_test(pSuite, "bufs_realloc",
> test_nghttp2_bufs_realloc)) {
> > > ++      !CU_add_test(pSuite, "bufs_realloc",
> test_nghttp2_bufs_realloc) ||
> > > ++      !CU_add_test(pSuite, "ratelim_update",
> test_nghttp2_ratelim_update) ||
> > > ++      !CU_add_test(pSuite, "ratelim_drain",
> test_nghttp2_ratelim_drain)) {
> > > +     CU_cleanup_registry();
> > > +     return (int)CU_get_error();
> > > +   }
> > > diff --git a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
> b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
> > > index 0b9091f7e8..b67313b5c2 100644
> > > --- a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
> > > +++ b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
> > > @@ -10,6 +10,7 @@ SRC_URI =3D "\
> > >
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fnghttp2%2Fnghttp2%2Freleases%2Fdownload%2Fv%24&data=3D05%7C02%7CZah=
ir.Basha%40kpit.com%7Cd4fde3a4f7d34f1dad8a08dc348c6208%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C638443024796447032%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sd=
ata=3D81qMDnTOR20hwVm%2B9foAKitKFCfZ5wID8Ez8FuvkoCo%3D&reserved=3D0{PV}/ngh=
ttp2-${PV}.tar.xz
> <https://github.com/nghttp2/nghttp2/releases/download/v$> \
> > >      file://0001-fetch-ocsp-response-use-python3.patch \
> > >      file://CVE-2023-35945.patch \
> > > +    file://CVE-2023-44487.patch \
> > >  "
> > >  SRC_URI[sha256sum] =3D
> "68271951324554c34501b85190f22f2221056db69f493afc3bbac8e7be21e7cc"
> > >
> > > --
> > > 2.17.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#194488):
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.openembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F194488&data=3D05%7C02=
%7CZahir.Basha%40kpit.com%7Cd4fde3a4f7d34f1dad8a08dc348c6208%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C638443024796450121%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C=
%7C&sdata=3DU5DbxB9sGN68GlDwA0wUuuzOjd23ib1EPu%2FSMN1uwNI%3D&reserved=3D0
> <https://lists.openembedded.org/g/openembedded-core/message/194488>
> > > Mute This Topic:
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.openembedded.org%2Fmt%2F104049487%2F3620601&data=3D05%7C02%7CZahir.Basha%4=
0kpit.com%7Cd4fde3a4f7d34f1dad8a08dc348c6208%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C638443024796453311%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DY%2F=
g7gZKGTAm%2F0hdg8sIsu8SxpuyJhMRd9%2BRsE44M9p8%3D&reserved=3D0
> <https://lists.openembedded.org/mt/104049487/3620601>
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe:
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.openembedded.org%2Fg%2Fopenembedded-core%2Funsub&data=3D05%7C02%7CZahir.Ba=
sha%40kpit.com%7Cd4fde3a4f7d34f1dad8a08dc348c6208%7C3539451eb46e4a26a242ff6=
1502855c7%7C0%7C0%7C638443024796456329%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=
=3DJd9ALQDgBD8QQj6Oe0WGYcURQoJtTLV%2Fq2S38gSK2HU%3D&reserved=3D0
> <https://lists.openembedded.org/g/openembedded-core/unsub> [
> steve@sakoman.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> > This message contains information that may be privileged or confidentia=
l
> and is the property of the KPIT Technologies Ltd. It is intended only for
> the person to whom it is addressed. If you are not the intended recipient=
,
> you are not authorized to read, print, retain copy, disseminate,
> distribute, or use this message or any part thereof. If you receive this
> message in error, please notify the sender immediately and delete all
> copies of this message. KPIT Technologies Ltd. does not accept any
> liability for virus infected mails.
> This message contains information that may be privileged or confidential
> and is the property of the KPIT Technologies Ltd. It is intended only for
> the person to whom it is addressed. If you are not the intended recipient=
,
> you are not authorized to read, print, retain copy, disseminate,
> distribute, or use this message or any part thereof. If you receive this
> message in error, please notify the sender immediately and delete all
> copies of this message. KPIT Technologies Ltd. does not accept any
> liability for virus infected mails.
>

--000000000000dc679406125dab7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, but it still doesn&#39;t work:<div><br></div><div>s=
teve@hexa ~/builds/poky-contrib-kirkstone ((HEAD detached at 0b39955d146)) =
$ git am -3 ~/Downloads/kirkstone-V2-nghttp2-fix-CVE-2023-44487.patch<br>Ap=
plying: nghttp2: fix CVE-2023-44487<br>steve@hexa ~/builds/poky-contrib-kir=
kstone ((HEAD detached from 0b39955d146)) $ bitbake nghttp2<br>Loading cach=
e: 100% | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA: =C2=A0--:--:--<br>Loaded 0 entrie=
s from dependency cache.<br>Parsing recipes: 100% |########################=
###########################################################################=
###########################################################################=
###########################################################################=
###############################| Time: 0:00:07<br>Parsing of 883 .bb files =
complete (0 cached, 883 parsed). 1644 targets, 43 skipped, 0 masked, 0 erro=
rs.<br>Removing 2 recipes from the core2-64 sysroot: 100% |################=
###########################################################################=
###########################################################################=
###########################################################################=
##########| Time: 0:00:00<br>Removing 3 recipes from the qemux86_64 sysroot=
: 100% |###################################################################=
###########################################################################=
###########################################################################=
################################| Time: 0:00:00<br>NOTE: Resolving any miss=
ing task queue dependencies<br><br>Build Configuration:<br>BB_VERSION =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;2.0.0&quot;<br>BUILD_SYS =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-linux&quot;<br>NATIVELSB=
STRING =C2=A0 =C2=A0 =C2=A0=3D &quot;universal&quot;<br>TARGET_SYS =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-poky-linux&quot;<br>MACHINE =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;qemux86-64&quot;<=
br>DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;poky&q=
uot;<br>DISTRO_VERSION =C2=A0 =C2=A0 =C2=A0 =3D &quot;4.0.16&quot;<br>TUNE_=
FEATURES =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;m64 core2&quot;<br>TARGET_FPU=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;&quot;<br>meta =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>meta-poky =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0<br>meta-yocto-bsp =C2=A0 =C2=A0 =C2=A0 <br>workspa=
ce =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;HEAD:f07ef560f0128de6=
d9a5b3d93fddec83066badd8&quot;<br><br>Initialising tasks: 100% |###########=
###########################################################################=
###########################################################################=
###########################################################################=
#########################################| Time: 0:00:00<br>Sstate summary:=
 Wanted 131 Local 62 Mirrors 0 Missed 69 Current 143 (47% match, 74% comple=
te)<br>Removing 3 stale sstate objects for arch core2-64: 100% |###########=
###########################################################################=
###########################################################################=
###########################################################################=
##########| Time: 0:00:00<br>Removing 30 stale sstate objects for arch qemu=
x86_64: 100% |#############################################################=
###########################################################################=
###########################################################################=
################################| Time: 0:00:00<br>Removing 6 stale sstate =
objects for arch x86_64: 100% |############################################=
###########################################################################=
###########################################################################=
######################################################| Time: 0:00:00<br>NO=
TE: Executing Tasks<br>ERROR: nghttp2-1.47.0-r0 do_patch: Applying patch &#=
39;CVE-2023-44487.patch&#39; on target directory &#39;/home/steve/builds/po=
ky-contrib-kirkstone/build/tmp/work/core2-64-poky-linux/nghttp2/1.47.0-r0/n=
ghttp2-1.47.0&#39;<br>CmdError(&#39;quilt --quiltrc /home/steve/builds/poky=
-contrib-kirkstone/build/tmp/work/core2-64-poky-linux/nghttp2/1.47.0-r0/rec=
ipe-sysroot-native/etc/quiltrc push&#39;, 0, &#39;stdout: Applying patch CV=
E-2023-44487.patch<br>patching file CMakeLists.txt<br>Hunk #1 succeeded at =
301 (offset 39 lines).<br>Hunk #2 succeeded at 342 (offset 39 lines).<br>pa=
tching file <a href=3D"http://cmakeconfig.h.in">cmakeconfig.h.in</a><br>Hun=
k #1 succeeded at 31 (offset -3 lines).<br>Hunk #2 succeeded at 76 (offset =
-3 lines).<br>patching file <a href=3D"http://configure.ac">configure.ac</a=
><br>Hunk #1 succeeded at 922 (offset 315 lines).<br>Hunk #2 succeeded at 9=
97 (offset 315 lines).<br>Hunk #3 succeeded at 1023 (offset 315 lines).<br>=
patching file doc/Makefile.am<br>Hunk #1 FAILED at 69.<br>1 out of 1 hunk F=
AILED -- rejects in file doc/Makefile.am<br>patching file lib/CMakeLists.tx=
t<br>patching file lib/Makefile.am<br>Hunk #1 FAILED at 49.<br>Hunk #2 FAIL=
ED at 65.<br>2 out of 2 hunks FAILED -- rejects in file lib/Makefile.am<br>=
patching file lib/includes/nghttp2/nghttp2.h<br>Hunk #1 succeeded at 2800 (=
offset 37 lines).<br>patching file lib/nghttp2_option.c<br>patching file li=
b/nghttp2_ratelim.c<br>patching file lib/nghttp2_ratelim.h<br>patching file=
 lib/nghttp2_session.c<br>Hunk #4 succeeded at 4164 (offset 9 lines).<br>Hu=
nk #5 succeeded at 4210 (offset 9 lines).<br>Hunk #6 succeeded at 6991 (off=
set -3 lines).<br>patching file lib/nghttp2_session.h<br>Hunk #4 succeeded =
at 234 (offset -3 lines).<br>patching file lib/nghttp2_time.c<br>patching f=
ile lib/nghttp2_time.h<br>patching file tests/nghttp2_ratelim_test.c<br>pat=
ching file tests/nghttp2_ratelim_test.h<br>patching file tests/nghttp2_sess=
ion_test.c<br>Hunk #1 succeeded at 11089 (offset 276 lines).<br>patching fi=
le tests/nghttp2_session_test.h<br>Hunk #1 succeeded at 162 (offset 2 lines=
).<br>patching file tests/CMakeLists.txt<br>patching file tests/Makefile.am=
<br>Hunk #1 FAILED at 40.<br>1 out of 1 hunk FAILED -- rejects in file test=
s/Makefile.am<br>patching file lib/nghttp2_option.h<br>patching file tests/=
main.c<br>Hunk #2 succeeded at 330 (offset 6 lines).<br>Hunk #3 succeeded a=
t 428 (offset 7 lines).<br>Patch CVE-2023-44487.patch does not apply (enfor=
ce with -f)<br><br>stderr: &#39;)<br>ERROR: Logfile of failure stored in: /=
home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-linux=
/nghttp2/1.47.0-r0/temp/log.do_patch.1640561<br>ERROR: Task (/home/steve/bu=
ilds/poky-contrib-kirkstone/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb:=
do_patch) failed with exit code &#39;1&#39;<br>NOTE: Tasks Summary: Attempt=
ed 926 tasks of which 923 didn&#39;t need to be rerun and 1 failed.<br>Comp=
lete CVE report summary created at: /home/steve/builds/poky-contrib-kirksto=
ne/build/tmp/log/cve/cve-summary<br>NOTE: Generating JSON CVE summary<br>Co=
mplete CVE JSON report summary created at: /home/steve/builds/poky-contrib-=
kirkstone/build/tmp/log/cve/cve-summary.json<br><br>Summary: 1 task failed:=
<br>=C2=A0 /home/steve/builds/poky-contrib-kirkstone/meta/recipes-support/n=
ghttp2/nghttp2_1.47.0.bb:do_patch<br>Summary: There was 1 ERROR message, re=
turning a non-zero exit code.<br>steve@hexa ~/builds/poky-contrib-kirkstone=
 ((HEAD detached from 0b39955d146)) $</div><div><br></div><div>Please downl=
oad your patch from patchworks and try using that version.=C2=A0 It may hav=
e been corrupted by your mailer.</div><div><br></div><div>You can get it he=
re:=C2=A0</div><div><br></div><div>=C2=A0<a href=3D"https://patchwork.yocto=
project.org/project/oe-core/patch/20240130071405.3675-1-mail2szahir@gmail.c=
om/">https://patchwork.yoctoproject.org/project/oe-core/patch/2024013007140=
5.3675-1-mail2szahir@gmail.com/</a><br></div><div><br></div><div>Click mbox=
 in the upper right corner to download the patch.</div><div><br></div><div>=
Steve</div><div><br></div><div><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 26, 2024 at 11:26=E2=
=80=AFPM Zahir Hussain Sikkendar Basha &lt;<a href=3D"mailto:Zahir.Basha@kp=
it.com">Zahir.Basha@kpit.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div class=3D"msg-4709259264332911284">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
Hi Steve,</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div><span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServic=
e,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">I have appl=
ied the patch on top of kirkstone branch, HEAD is { Commit ID : 0b39955d146=
00257a6eafc211fd68a933c69a0e9
 }.<br>
<br>
</span></div>
<div><span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServic=
e,Calibri,Helvetica,sans-serif;font-size:16px;color:rgb(0,0,0);background-c=
olor:rgb(255,255,255)">please refer the below screenshot</span></div>
<div><span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServic=
e,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)"><img style=
=3D"max-width: 571px;" src=3D"cid:ii_18deae82eb9cb971f161"><br>
<br>
And also attached the complete log {<b>log.do_patch</b>} of do_patch compil=
ation.<br>
<br>
Please check the patch on kirkstone branch and Head commit mentioned above.=
</span></div>
<div><span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServic=
e,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)"><br>
Note:<br>
I have confirmed that there is no .bbappend file for nghttp2 in the whole r=
epo.</span></div>
<div><span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServic=
e,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)"><br>
Please refer below screenshot for reference.</span></div>
<div><span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServic=
e,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)"><br>
<img style=3D"max-width: 571px;" src=3D"cid:ii_18deae82ebacb971f162"><br>
<br>
</span></div>
<div id=3D"m_-4709259264332911284Signature">
<div><span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServic=
e,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">Best regard=
s,</span></div>
<div><span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServic=
e,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">Zahir hussa=
in.</span></div>
</div>
<div id=3D"m_-4709259264332911284appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_-4709259264332911284divRplyFwdMsg" dir=3D"ltr"><span style=3D"=
font-family:Calibri,sans-serif;font-size:11pt;color:rgb(0,0,0)"><b>From:</b=
>=C2=A0Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" target=3D"_bl=
ank">steve@sakoman.com</a>&gt;<br>
<b>Sent:</b>=C2=A0Friday, February 23, 2024 9:57 PM<br>
<b>To:</b>=C2=A0Zahir Hussain Sikkendar Basha &lt;<a href=3D"mailto:Zahir.B=
asha@kpit.com" target=3D"_blank">Zahir.Basha@kpit.com</a>&gt;<br>
<b>Cc:</b>=C2=A0aszh07 &lt;<a href=3D"mailto:mail2szahir@gmail.com" target=
=3D"_blank">mail2szahir@gmail.com</a>&gt;; <a href=3D"mailto:openembedded-c=
ore@lists.openembedded.org" target=3D"_blank">openembedded-core@lists.opene=
mbedded.org</a> &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.=
org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;; Vi=
rendra Kumar Thakur &lt;<a href=3D"mailto:Virendra.Thakur@kpit.com" target=
=3D"_blank">Virendra.Thakur@kpit.com</a>&gt;<br>
<b>Subject:</b>=C2=A0Re: [OE-core][kirkstone][PATCH V2] nghttp2: fix CVE-20=
23-44487</span>
<div>=C2=A0</div>
</div>
<div><span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontServic=
e,Calibri,Helvetica,sans-serif;font-size:11pt;color:rgb(0,0,0)">Caution: Th=
is email originated from outside of the KPIT. Do not click links or open at=
tachments unless you
 recognize the sender and know the content is safe.<br>
<br>
On Thu, Feb 22, 2024 at 7:41=E2=80=AFPM Zahir Hussain Sikkendar Basha<br>
&lt;<a href=3D"mailto:Zahir.Basha@kpit.com" target=3D"_blank">Zahir.Basha@k=
pit.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Steve,<br>
&gt;<br>
&gt; Apologies for the late reply. Can you please recheck the patch again?<=
br>
&gt; Same patch works in our build without any Hunk failure issue, And also=
 confirmed that the patch changes are available in the source code of nghtt=
p2 V1.47.0.<br>
<br>
It still fails for me:<br>
<br>
(stable/kirkstone-nut) $ bitbake nghttp2<br>
Loading cache: 100% |<br>
<br>
<br>
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ETA:=C2=A0 --:--:--<br>
Loaded 0 entries from dependency cache.<br>
Parsing recipes: 100%<br>
|##########################################################################=
###########################################################################=
###########################################################################=
########################################################|<br>
Time: 0:00:07<br>
Parsing of 883 .bb files complete (0 cached, 883 parsed). 1644<br>
targets, 43 skipped, 0 masked, 0 errors.<br>
NOTE: Resolving any missing task queue dependencies<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D =
&quot;2.0.0&quot;<br>
BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D &quot;x86_64-linux&quot;<br>
NATIVELSBSTRING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;universal&quot;<br>
TARGET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D =
&quot;x86_64-poky-linux&quot;<br>
MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D &quot;qemux86-64&quot;<br>
DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D &quot;poky&quot;<br>
DISTRO_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;4.0.16&quot;<b=
r>
TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;m64 core2=
&quot;<br>
TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D =
&quot;&quot;<br>
meta<br>
meta-poky<br>
meta-yocto-bsp<br>
workspace=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D<br>
&quot;stable/kirkstone-nut:80bb7659e17fa1404f48c95da3a077563bb6806a&quot;<b=
r>
<br>
Initialising tasks: 100%<br>
|##########################################################################=
###########################################################################=
###########################################################################=
#####################################################|<br>
Time: 0:00:00<br>
Sstate summary: Wanted 92 Local 85 Mirrors 0 Missed 7 Current 182 (92%<br>
match, 97% complete)<br>
Removing 6 stale sstate objects for arch core2-64: 100%<br>
|##########################################################################=
###########################################################################=
###########################################################################=
######################|<br>
Time: 0:00:00<br>
Removing 1 stale sstate objects for arch qemux86_64: 100%<br>
|##########################################################################=
###########################################################################=
###########################################################################=
####################|<br>
Time: 0:00:00<br>
NOTE: Executing Tasks<br>
ERROR: nghttp2-1.47.0-r0 do_patch: Applying patch<br>
&#39;CVE-2023-44487.patch&#39; on target directory<br>
&#39;/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky=
-linux/nghttp2/1.47.0-r0/nghttp2-1.47.0&#39;<br>
CmdError(&#39;quilt --quiltrc<br>
/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-linu=
x/nghttp2/1.47.0-r0/recipe-sysroot-native/etc/quiltrc<br>
push&#39;, 0, &#39;stdout: Applying patch CVE-2023-44487.patch<br>
patching file CMakeLists.txt<br>
Hunk #1 succeeded at 301 (offset 39 lines).<br>
Hunk #2 succeeded at 342 (offset 39 lines).<br>
patching file <a href=3D"http://cmakeconfig.h.in" target=3D"_blank">cmakeco=
nfig.h.in</a><br>
Hunk #1 succeeded at 31 (offset -3 lines).<br>
Hunk #2 succeeded at 76 (offset -3 lines).<br>
patching file <a href=3D"http://configure.ac" target=3D"_blank">configure.a=
c</a><br>
Hunk #1 succeeded at 922 (offset 315 lines).<br>
Hunk #2 succeeded at 997 (offset 315 lines).<br>
Hunk #3 succeeded at 1023 (offset 315 lines).<br>
patching file doc/Makefile.am<br>
Hunk #1 FAILED at 69.<br>
1 out of 1 hunk FAILED -- rejects in file doc/Makefile.am<br>
patching file lib/CMakeLists.txt<br>
patching file lib/Makefile.am<br>
Hunk #1 FAILED at 49.<br>
Hunk #2 FAILED at 65.<br>
2 out of 2 hunks FAILED -- rejects in file lib/Makefile.am<br>
patching file lib/includes/nghttp2/nghttp2.h<br>
Hunk #1 succeeded at 2800 (offset 37 lines).<br>
patching file lib/nghttp2_option.c<br>
patching file lib/nghttp2_ratelim.c<br>
patching file lib/nghttp2_ratelim.h<br>
patching file lib/nghttp2_session.c<br>
Hunk #4 succeeded at 4164 (offset 9 lines).<br>
Hunk #5 succeeded at 4210 (offset 9 lines).<br>
Hunk #6 succeeded at 6991 (offset -3 lines).<br>
patching file lib/nghttp2_session.h<br>
Hunk #4 succeeded at 234 (offset -3 lines).<br>
patching file lib/nghttp2_time.c<br>
patching file lib/nghttp2_time.h<br>
patching file tests/nghttp2_ratelim_test.c<br>
patching file tests/nghttp2_ratelim_test.h<br>
patching file tests/nghttp2_session_test.c<br>
Hunk #1 succeeded at 11089 (offset 276 lines).<br>
patching file tests/nghttp2_session_test.h<br>
Hunk #1 succeeded at 162 (offset 2 lines).<br>
patching file tests/CMakeLists.txt<br>
patching file tests/Makefile.am<br>
Hunk #1 FAILED at 40.<br>
1 out of 1 hunk FAILED -- rejects in file tests/Makefile.am<br>
patching file lib/nghttp2_option.h<br>
patching file tests/main.c<br>
Hunk #2 succeeded at 330 (offset 6 lines).<br>
Hunk #3 succeeded at 428 (offset 7 lines).<br>
Patch CVE-2023-44487.patch does not apply (enforce with -f)<br>
<br>
stderr: &#39;)<br>
ERROR: Logfile of failure stored in:<br>
/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-linu=
x/nghttp2/1.47.0-r0/temp/log.do_patch.1234204<br>
ERROR: Task (/home/steve/builds/poky-contrib-kirkstone/meta/recipes-support=
/nghttp2/nghttp2_1.47.0.bb:do_patch)<br>
failed with exit code &#39;1&#39;<br>
<br>
Make sure you are using the current kirkstone head, and don&#39;t have a<br=
>
bbappend for nghttp2 in another included layer.<br>
<br>
Steve<br>
______________________________<br>
&gt; From: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" target=3D=
"_blank">steve@sakoman.com</a>&gt;<br>
&gt; Sent: Tuesday, January 30, 2024 10:39 PM<br>
&gt; To: aszh07 &lt;<a href=3D"mailto:mail2szahir@gmail.com" target=3D"_bla=
nk">mail2szahir@gmail.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"mai=
lto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembedde=
d-core@lists.openembedded.org</a>&gt;; Virendra Kumar Thakur &lt;<a href=3D=
"mailto:Virendra.Thakur@kpit.com" target=3D"_blank">Virendra.Thakur@kpit.co=
m</a>&gt;; Zahir Hussain Sikkendar Basha &lt;<a href=3D"mailto:Zahir.Basha@=
kpit.com" target=3D"_blank">Zahir.Basha@kpit.com</a>&gt;<br>
&gt; Subject: Re: [OE-core][kirkstone][PATCH V2] nghttp2: fix CVE-2023-4448=
7<br>
&gt;<br>
&gt; Caution: This email originated from outside of the KPIT. Do not click =
links or open attachments unless you recognize the sender and know the cont=
ent is safe.<br>
&gt;<br>
&gt; This fails at build time:<br>
&gt;<br>
&gt; ERROR: nghttp2-1.47.0-r0 do_patch: Applying patch<br>
&gt; &#39;CVE-2023-44487.patch&#39; on target directory<br>
&gt; &#39;/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64=
-poky-linux/nghttp2/1.47.0-r0/nghttp2-1.47.0&#39;<br>
&gt; CmdError(&#39;quilt --quiltrc<br>
&gt; /home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky=
-linux/nghttp2/1.47.0-r0/recipe-sysroot-native/etc/quiltrc<br>
&gt; push&#39;, 0, &#39;stdout: Applying patch CVE-2023-44487.patch<br>
&gt; patching file CMakeLists.txt<br>
&gt; Hunk #1 succeeded at 301 (offset 39 lines).<br>
&gt; Hunk #2 succeeded at 342 (offset 39 lines).<br>
&gt; patching file <a href=3D"http://cmakeconfig.h.in" target=3D"_blank">cm=
akeconfig.h.in</a><br>
&gt; Hunk #1 succeeded at 31 (offset -3 lines).<br>
&gt; Hunk #2 succeeded at 76 (offset -3 lines).<br>
&gt; patching file <a href=3D"http://configure.ac" target=3D"_blank">config=
ure.ac</a><br>
&gt; Hunk #1 succeeded at 922 (offset 315 lines).<br>
&gt; Hunk #2 succeeded at 997 (offset 315 lines).<br>
&gt; Hunk #3 succeeded at 1023 (offset 315 lines).<br>
&gt; patching file doc/Makefile.am<br>
&gt; Hunk #1 FAILED at 69.<br>
&gt; 1 out of 1 hunk FAILED -- rejects in file doc/Makefile.am<br>
&gt; patching file lib/CMakeLists.txt<br>
&gt; patching file lib/Makefile.am<br>
&gt; Hunk #1 FAILED at 49.<br>
&gt; Hunk #2 FAILED at 65.<br>
&gt; 2 out of 2 hunks FAILED -- rejects in file lib/Makefile.am<br>
&gt; patching file lib/includes/nghttp2/nghttp2.h<br>
&gt; Hunk #1 succeeded at 2800 (offset 37 lines).<br>
&gt; patching file lib/nghttp2_option.c<br>
&gt; patching file lib/nghttp2_ratelim.c<br>
&gt; patching file lib/nghttp2_ratelim.h<br>
&gt; patching file lib/nghttp2_session.c<br>
&gt; Hunk #4 succeeded at 4164 (offset 9 lines).<br>
&gt; Hunk #5 succeeded at 4210 (offset 9 lines).<br>
&gt; Hunk #6 succeeded at 6991 (offset -3 lines).<br>
&gt; patching file lib/nghttp2_session.h<br>
&gt; Hunk #4 succeeded at 234 (offset -3 lines).<br>
&gt; patching file lib/nghttp2_time.c<br>
&gt; patching file lib/nghttp2_time.h<br>
&gt; patching file tests/nghttp2_ratelim_test.c<br>
&gt; patching file tests/nghttp2_ratelim_test.h<br>
&gt; patching file tests/nghttp2_session_test.c<br>
&gt; Hunk #1 succeeded at 11089 (offset 276 lines).<br>
&gt; patching file tests/nghttp2_session_test.h<br>
&gt; Hunk #1 succeeded at 162 (offset 2 lines).<br>
&gt; patching file tests/CMakeLists.txt<br>
&gt; patching file tests/Makefile.am<br>
&gt; Hunk #1 FAILED at 40.<br>
&gt; 1 out of 1 hunk FAILED -- rejects in file tests/Makefile.am<br>
&gt; patching file lib/nghttp2_option.h<br>
&gt; patching file tests/main.c<br>
&gt; Hunk #2 succeeded at 330 (offset 6 lines).<br>
&gt; Hunk #3 succeeded at 428 (offset 7 lines).<br>
&gt; Patch CVE-2023-44487.patch does not apply (enforce with -f)<br>
&gt;<br>
&gt; Steve<br>
&gt;<br>
&gt; On Mon, Jan 29, 2024 at 9:17=E2=80=AFPM aszh07 &lt;<a href=3D"mailto:m=
ail2szahir@gmail.com" target=3D"_blank">mail2szahir@gmail.com</a>&gt; wrote=
:<br>
&gt; &gt;<br>
&gt; &gt; From: Zahir Hussain &lt;<a href=3D"mailto:zahir.basha@kpit.com" t=
arget=3D"_blank">zahir.basha@kpit.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; The HTTP/2 protocol allows a denial of service (server resource c=
onsumption)<br>
&gt; &gt; because request cancellation can reset many streams quickly, as e=
xploited in<br>
&gt; &gt; the wild in August through October 2023.<br>
&gt; &gt;<br>
&gt; &gt; References:<br>
&gt; &gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-44487" id=3D=
"m_-4709259264332911284OWAaccf2496-adc2-d864-d5a1-107152aa546c" target=3D"_=
blank">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.nis=
t.gov%2Fvuln%2Fdetail%2FCVE-2023-44487&amp;data=3D05%7C02%7CZahir.Basha%40k=
pit.com%7Cd4fde3a4f7d34f1dad8a08dc348c6208%7C3539451eb46e4a26a242ff61502855=
c7%7C0%7C0%7C638443024796434732%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3Dfi=
Fq8J6JGjGPo%2Bj6hd5yueYw7ty%2FHOmxO8ZKk%2FG3v%2Bs%3D&amp;reserved=3D0</a><b=
r>
&gt; &gt; <a href=3D"https://github.com/nghttp2/nghttp2/commit/72b4af614368=
1f528f1d237b21a9a7aee1738832" id=3D"m_-4709259264332911284OWAd81bfe25-d8f0-=
d130-6ed9-bec976b895fc" target=3D"_blank">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fnghttp2%2Fnghttp2%2Fcommit%2F72b4af6143681f528f1d237b21a9a7aee1738832=
&amp;data=3D05%7C02%7CZahir.Basha%40kpit.com%7Cd4fde3a4f7d34f1dad8a08dc348c=
6208%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638443024796440958%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3Dflz7P2tqDjNvOZYYz95xlEFKSnfkWFIZR8aiEVJ6=
Wng%3D&amp;reserved=3D0</a><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Zahir Hussain &lt;<a href=3D"mailto:zahir.basha@kp=
it.com" target=3D"_blank">zahir.basha@kpit.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../nghttp2/nghttp2/CVE-2023-44487.patch=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 926 ++++++++++++++++++<br>
&gt; &gt;=C2=A0 .../recipes-support/nghttp2/<a href=3D"http://nghttp2_1.47.=
0.bb" target=3D"_blank">nghttp2_1.47.0.bb</a> |=C2=A0=C2=A0 1 +<br>
&gt; &gt;=C2=A0 2 files changed, 927 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-support/nghttp2/nghttp2/CVE=
-2023-44487.patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-support/nghttp2/nghttp2/CVE-2023-44487.=
patch b/meta/recipes-support/nghttp2/nghttp2/CVE-2023-44487.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..48099683e6<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-support/nghttp2/nghttp2/CVE-2023-44487.patch<b=
r>
&gt; &gt; @@ -0,0 +1,926 @@<br>
&gt; &gt; +From 72b4af6143681f528f1d237b21a9a7aee1738832 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: Tatsuhiro Tsujikawa &lt;<a href=3D"mailto:tatsuhiro.t@gmai=
l.com" target=3D"_blank">tatsuhiro.t@gmail.com</a>&gt;<br>
&gt; &gt; +Date: Sun, 1 Oct 2023 00:05:01 +0900<br>
&gt; &gt; +Subject: [PATCH] Rework session management<br>
&gt; &gt; +<br>
&gt; &gt; +CVE: CVE-2023-44487<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Backport [<a href=3D"https://github.com/nghttp2=
/nghttp2/commit/72b4af6143681f528f1d237b21a9a7aee1738832" id=3D"m_-47092592=
64332911284OWAa46e2be6-319c-3d61-427e-481ebebcf820" target=3D"_blank">https=
://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2=
Fnghttp2%2Fnghttp2%2Fcommit%2F72b4af6143681f528f1d237b21a9a7aee1738832&amp;=
data=3D05%7C02%7CZahir.Basha%40kpit.com%7Cd4fde3a4f7d34f1dad8a08dc348c6208%=
7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638443024796444047%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C0%7C%7C%7C&amp;sdata=3DlpL%2B5UUS16t1gXwGciLB6rtVhwadjEek7CGf7Q8O6P0=
%3D&amp;reserved=3D0</a>]<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Zahir Hussain <a href=3D"mailto:zahir.basha@kpit.=
com" target=3D"_blank">zahir.basha@kpit.com</a><br>
&gt; &gt; +---<br>
&gt; &gt; +CMakeLists.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 ++<br>
&gt; &gt; +<a href=3D"http://cmakeconfig.h.in" target=3D"_blank">cmakeconfi=
g.h.in</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +++<br>
&gt; &gt; +<a href=3D"http://configure.ac" target=3D"_blank">configure.ac</=
a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 21 +++++++<br>
&gt; &gt; +doc/Makefile.am=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +<br>
&gt; &gt; +lib/CMakeLists.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +<br>
&gt; &gt; +lib/Makefile.am=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 ++<br>
&gt; &gt; +lib/includes/nghttp2/nghttp2.h |=C2=A0 17 ++++++<br>
&gt; &gt; +lib/nghttp2_option.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +++<br>
&gt; &gt; +lib/nghttp2_ratelim.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 75 ++++++++++++++++++++++++<br>
&gt; &gt; +lib/nghttp2_ratelim.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 57 ++++++++++++++++++<br>
&gt; &gt; +lib/nghttp2_session.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 34 ++++++++++-<br>
&gt; &gt; +lib/nghttp2_session.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 12 +++-<br>
&gt; &gt; +lib/nghttp2_time.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 62 ++++++++++++++++++++<br>
&gt; &gt; +lib/nghttp2_time.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 38 ++++++++++++<br>
&gt; &gt; +tests/nghttp2_ratelim_test.c=C2=A0=C2=A0 | 101 +++++++++++++++++=
+++++++++++++++<br>
&gt; &gt; +tests/nghttp2_ratelim_test.h=C2=A0=C2=A0 |=C2=A0 35 +++++++++++<=
br>
&gt; &gt; +tests/nghttp2_session_test.c=C2=A0=C2=A0 | 103 +++++++++++++++++=
++++++++++++++++<br>
&gt; &gt; +tests/nghttp2_session_test.h=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +<br>
&gt; &gt; +tests/CMakeLists.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +<br>
&gt; &gt; +tests/Makefile.am=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-<br>
&gt; &gt; +lib/nghttp2_option.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 ++<br>
&gt; &gt; +tests/main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +=
+-<br>
&gt; &gt; +22 files changed, 598 insertions(+), 5 deletions(-)<br>
&gt; &gt; +create mode 100644 lib/nghttp2_ratelim.c<br>
&gt; &gt; +create mode 100644 lib/nghttp2_ratelim.h<br>
&gt; &gt; +create mode 100644 lib/nghttp2_time.c<br>
&gt; &gt; +create mode 100644 lib/nghttp2_time.h<br>
&gt; &gt; +create mode 100644 tests/nghttp2_ratelim_test.c<br>
&gt; &gt; +create mode 100644 tests/nghttp2_ratelim_test.h<br>
&gt; &gt; +<br>
&gt; &gt; +--- a/CMakeLists.txt<br>
&gt; &gt; ++++ b/CMakeLists.txt<br>
&gt; &gt; +@@ -262,6 +262,7 @@ check_include_file(&quot;netinet/in.h&quot;=
=C2=A0=C2=A0 HAVE<br>
&gt; &gt; + check_include_file(&quot;pwd.h&quot;=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 HAVE_PWD_H)<br>
&gt; &gt; + check_include_file(&quot;sys/socket.h&quot;=C2=A0=C2=A0 HAVE_SY=
S_SOCKET_H)<br>
&gt; &gt; + check_include_file(&quot;sys/time.h&quot;=C2=A0=C2=A0=C2=A0=C2=
=A0 HAVE_SYS_TIME_H)<br>
&gt; &gt; ++check_include_file(&quot;sysinfoapi.h&quot;=C2=A0=C2=A0 HAVE_SY=
SINFOAPI_H)<br>
&gt; &gt; + check_include_file(&quot;syslog.h&quot;=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 HAVE_SYSLOG_H)<br>
&gt; &gt; + check_include_file(&quot;time.h&quot;=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 HAVE_TIME_H)<br>
&gt; &gt; + check_include_file(&quot;unistd.h&quot;=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 HAVE_UNISTD_H)<br>
&gt; &gt; +@@ -302,8 +303,11 @@ check_type_size(&quot;time_t&quot;=C2=A0 SI=
ZEOF_TIME_T)<br>
&gt; &gt; + include(CheckFunctionExists)<br>
&gt; &gt; + check_function_exists(_Exit=C2=A0=C2=A0=C2=A0=C2=A0 HAVE__EXIT)=
<br>
&gt; &gt; + check_function_exists(accept4=C2=A0=C2=A0 HAVE_ACCEPT4)<br>
&gt; &gt; ++check_function_exists(clock_gettime HAVE_CLOCK_GETTIME)<br>
&gt; &gt; + check_function_exists(mkostemp=C2=A0 HAVE_MKOSTEMP)<br>
&gt; &gt; +<br>
&gt; &gt; ++check_symbol_exists(GetTickCount64 sysinfoapi.h HAVE_GETTICKCOU=
NT64)<br>
&gt; &gt; ++<br>
&gt; &gt; + include(CheckSymbolExists)<br>
&gt; &gt; + # XXX does this correctly detect initgroups (un)availability on=
 cygwin?<br>
&gt; &gt; + check_symbol_exists(initgroups grp.h HAVE_DECL_INITGROUPS)<br>
&gt; &gt; +--- a/<a href=3D"http://cmakeconfig.h.in" target=3D"_blank">cmak=
econfig.h.in</a><br>
&gt; &gt; ++++ b/<a href=3D"http://cmakeconfig.h.in" target=3D"_blank">cmak=
econfig.h.in</a><br>
&gt; &gt; +@@ -34,9 +34,15 @@<br>
&gt; &gt; + /* Define to 1 if you have the `accept4` function. */<br>
&gt; &gt; + #cmakedefine HAVE_ACCEPT4 1<br>
&gt; &gt; +<br>
&gt; &gt; ++/* Define to 1 if you have the `clock_gettime` function. */<br>
&gt; &gt; ++#cmakedefine HAVE_CLOCK_GETTIME 1<br>
&gt; &gt; ++<br>
&gt; &gt; + /* Define to 1 if you have the `mkostemp` function. */<br>
&gt; &gt; + #cmakedefine HAVE_MKOSTEMP 1<br>
&gt; &gt; +<br>
&gt; &gt; ++/* Define to 1 if you have the `GetTickCount64` function. */<br=
>
&gt; &gt; ++#cmakedefine HAVE_GETTICKCOUNT64 1<br>
&gt; &gt; ++<br>
&gt; &gt; + /* Define to 1 if you have the `initgroups` function. */<br>
&gt; &gt; + #cmakedefine01 HAVE_DECL_INITGROUPS<br>
&gt; &gt; +<br>
&gt; &gt; +@@ -73,6 +79,9 @@<br>
&gt; &gt; + /* Define to 1 if you have the &lt;sys/time.h&gt; header file. =
*/<br>
&gt; &gt; + #cmakedefine HAVE_SYS_TIME_H 1<br>
&gt; &gt; +<br>
&gt; &gt; ++/* Define to 1 if you have the &lt;sysinfoapi.h&gt; header file=
. */<br>
&gt; &gt; ++#cmakedefine HAVE_SYSINFOAPI_H 1<br>
&gt; &gt; ++<br>
&gt; &gt; + /* Define to 1 if you have the &lt;syslog.h&gt; header file. */=
<br>
&gt; &gt; + #cmakedefine HAVE_SYSLOG_H 1<br>
&gt; &gt; +<br>
&gt; &gt; +--- a/<a href=3D"http://configure.ac" target=3D"_blank">configur=
e.ac</a><br>
&gt; &gt; ++++ b/<a href=3D"http://configure.ac" target=3D"_blank">configur=
e.ac</a><br>
&gt; &gt; +@@ -607,6 +607,7 @@ AC_CHECK_HEADERS([ \<br>
&gt; &gt; +=C2=A0=C2=A0 string.h \<br>
&gt; &gt; +=C2=A0=C2=A0 sys/socket.h \<br>
&gt; &gt; +=C2=A0=C2=A0 sys/time.h \<br>
&gt; &gt; ++=C2=A0 sysinfoapi.h \<br>
&gt; &gt; +=C2=A0=C2=A0 syslog.h \<br>
&gt; &gt; +=C2=A0=C2=A0 time.h \<br>
&gt; &gt; +=C2=A0=C2=A0 unistd.h \<br>
&gt; &gt; +@@ -681,6 +682,7 @@ AC_FUNC_STRNLEN<br>
&gt; &gt; + AC_CHECK_FUNCS([ \<br>
&gt; &gt; +=C2=A0=C2=A0 _Exit \<br>
&gt; &gt; +=C2=A0=C2=A0 accept4 \<br>
&gt; &gt; ++=C2=A0 clock_gettime \<br>
&gt; &gt; +=C2=A0=C2=A0 dup2 \<br>
&gt; &gt; +=C2=A0=C2=A0 getcwd \<br>
&gt; &gt; +=C2=A0=C2=A0 getpwnam \<br>
&gt; &gt; +@@ -706,6 +708,25 @@ AC_CHECK_FUNCS([ \<br>
&gt; &gt; + AC_CHECK_FUNC([timerfd_create],<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 [have_timerfd_create=3Dyes], [have_timerfd_create=3Dn=
o])<br>
&gt; &gt; +<br>
&gt; &gt; ++AC_MSG_CHECKING([checking for GetTickCount64])<br>
&gt; &gt; ++AC_LINK_IFELSE([AC_LANG_PROGRAM(<br>
&gt; &gt; ++[[<br>
&gt; &gt; ++#include &lt;sysinfoapi.h&gt;<br>
&gt; &gt; ++]],<br>
&gt; &gt; ++[[<br>
&gt; &gt; ++GetTickCount64();<br>
&gt; &gt; ++]])],<br>
&gt; &gt; ++[have_gettickcount64=3Dyes],<br>
&gt; &gt; ++[have_gettickcount64=3Dno])<br>
&gt; &gt; ++<br>
&gt; &gt; ++if test &quot;x${have_gettickcount64}&quot; =3D &quot;xyes&quot=
;; then<br>
&gt; &gt; ++=C2=A0 AC_MSG_RESULT([yes])<br>
&gt; &gt; ++=C2=A0 AC_DEFINE([HAVE_GETTICKCOUNT64], [1],<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 [Define to 1 if you have `GetTickCount64` function.])<br>
&gt; &gt; ++else<br>
&gt; &gt; ++=C2=A0 AC_MSG_RESULT([no])<br>
&gt; &gt; ++fi<br>
&gt; &gt; ++<br>
&gt; &gt; + # For cygwin: we can link initgroups, so AC_CHECK_FUNCS succeed=
s, but<br>
&gt; &gt; + # cygwin disables initgroups due to feature test macro magic wi=
th our<br>
&gt; &gt; + # configuration.=C2=A0 FreeBSD declares initgroups() in unistd.=
h.<br>
&gt; &gt; +--- a/doc/Makefile.am<br>
&gt; &gt; ++++ b/doc/Makefile.am<br>
&gt; &gt; +@@ -69,6 +69,7 @@ APIDOCS=3D \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_option_set_us=
er_recv_extension_type.rst \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_option_set_ma=
x_outbound_ack.rst \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_option_set_ma=
x_settings.rst \<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_option_set_stream_=
reset_rate_limit.rst \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_pack_settings=
_payload.rst \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_priority_spec=
_check_default.rst \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_priority_spec=
_default_init.rst \<br>
&gt; &gt; +--- a/lib/CMakeLists.txt<br>
&gt; &gt; ++++ b/lib/CMakeLists.txt<br>
&gt; &gt; +@@ -23,6 +23,8 @@ set(NGHTTP2_SOURCES<br>
&gt; &gt; +=C2=A0=C2=A0 nghttp2_mem.c<br>
&gt; &gt; +=C2=A0=C2=A0 nghttp2_http.c<br>
&gt; &gt; +=C2=A0=C2=A0 nghttp2_rcbuf.c<br>
&gt; &gt; ++=C2=A0 nghttp2_ratelim.c<br>
&gt; &gt; ++=C2=A0 nghttp2_time.c<br>
&gt; &gt; +=C2=A0=C2=A0 nghttp2_debug.c<br>
&gt; &gt; + )<br>
&gt; &gt; +<br>
&gt; &gt; +--- a/lib/Makefile.am<br>
&gt; &gt; ++++ b/lib/Makefile.am<br>
&gt; &gt; +@@ -49,6 +49,8 @@ OBJECTS =3D nghttp2_pq.c nghttp2_map.c ngh<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_mem.c \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_http.c \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_rcbuf.c \<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_ratelim.c \<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_time.c \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_debug.c<br>
&gt; &gt; +<br>
&gt; &gt; + HFILES =3D nghttp2_pq.h nghttp2_int.h nghttp2_map.h nghttp2_que=
ue.h \<br>
&gt; &gt; +@@ -65,6 +67,8 @@ HFILES =3D nghttp2_pq.h nghttp2_int.h nght<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_mem.h \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_http.h \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_rcbuf.h \<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_ratelim.h \<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_time.h \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_debug.h<br>
&gt; &gt; +<br>
&gt; &gt; + libnghttp2_la_SOURCES =3D $(HFILES) $(OBJECTS)<br>
&gt; &gt; +--- a/lib/includes/nghttp2/nghttp2.h<br>
&gt; &gt; ++++ b/lib/includes/nghttp2/nghttp2.h<br>
&gt; &gt; +@@ -2763,6 +2763,23 @@ nghttp2_session_client_new2(nghttp2_sess<=
br>
&gt; &gt; + /**<br>
&gt; &gt; +=C2=A0 * @function<br>
&gt; &gt; +=C2=A0 *<br>
&gt; &gt; ++ * This function sets the rate limit for the incoming stream re=
set<br>
&gt; &gt; ++ * (RST_STREAM frame).=C2=A0 It is server use only.=C2=A0 It is=
 a token-bucket<br>
&gt; &gt; ++ * based rate limiter.=C2=A0 |burst| specifies the number of to=
kens that is<br>
&gt; &gt; ++ * initially available.=C2=A0 The maximum number of tokens is c=
apped to<br>
&gt; &gt; ++ * this value.=C2=A0 |rate| specifies the number of tokens that=
 are<br>
&gt; &gt; ++ * regenerated per second.=C2=A0 An incoming RST_STREAM consume=
s one token.<br>
&gt; &gt; ++ * If there is no token available, GOAWAY is sent to tear down =
the<br>
&gt; &gt; ++ * connection.=C2=A0 |burst| and |rate| default to 1000 and 33<=
br>
&gt; &gt; ++ * respectively.<br>
&gt; &gt; ++ */<br>
&gt; &gt; ++NGHTTP2_EXTERN void<br>
&gt; &gt; ++nghttp2_option_set_stream_reset_rate_limit(nghttp2_option *opti=
on,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t burst, uint64_t rate);<br>
&gt; &gt; ++<br>
&gt; &gt; ++/**<br>
&gt; &gt; ++ * @function<br>
&gt; &gt; ++ *<br>
&gt; &gt; +=C2=A0 * Like `nghttp2_session_server_new()`, but with additiona=
l options<br>
&gt; &gt; +=C2=A0 * specified in the |option|.<br>
&gt; &gt; +=C2=A0 *<br>
&gt; &gt; +--- a/lib/nghttp2_option.c<br>
&gt; &gt; ++++ b/lib/nghttp2_option.c<br>
&gt; &gt; +@@ -126,3 +126,10 @@ void nghttp2_option_set_max_settings(ngh<br=
>
&gt; &gt; +=C2=A0=C2=A0 option-&gt;opt_set_mask |=3D NGHTTP2_OPT_MAX_SETTIN=
GS;<br>
&gt; &gt; +=C2=A0=C2=A0 option-&gt;max_settings =3D val;<br>
&gt; &gt; + }<br>
&gt; &gt; ++<br>
&gt; &gt; ++void nghttp2_option_set_stream_reset_rate_limit(nghttp2_option =
*option,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint6=
4_t burst, uint64_t rate) {<br>
&gt; &gt; ++=C2=A0 option-&gt;opt_set_mask |=3D NGHTTP2_OPT_STREAM_RESET_RA=
TE_LIMIT;<br>
&gt; &gt; ++=C2=A0 option-&gt;stream_reset_burst =3D burst;<br>
&gt; &gt; ++=C2=A0 option-&gt;stream_reset_rate =3D rate;<br>
&gt; &gt; ++}<br>
&gt; &gt; +--- /dev/null<br>
&gt; &gt; ++++ b/lib/nghttp2_ratelim.c<br>
&gt; &gt; +@@ -0,0 +1,75 @@<br>
&gt; &gt; ++/*<br>
&gt; &gt; ++ * nghttp2 - HTTP/2 C Library<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * Copyright (c) 2023 nghttp2 contributors<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * Permission is hereby granted, free of charge, to any person =
obtaining<br>
&gt; &gt; ++ * a copy of this software and associated documentation files (=
the<br>
&gt; &gt; ++ * &quot;Software&quot;), to deal in the Software without restr=
iction, including<br>
&gt; &gt; ++ * without limitation the rights to use, copy, modify, merge, p=
ublish,<br>
&gt; &gt; ++ * distribute, sublicense, and/or sell copies of the Software, =
and to<br>
&gt; &gt; ++ * permit persons to whom the Software is furnished to do so, s=
ubject to<br>
&gt; &gt; ++ * the following conditions:<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * The above copyright notice and this permission notice shall =
be<br>
&gt; &gt; ++ * included in all copies or substantial portions of the Softwa=
re.<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY=
 OF ANY KIND,<br>
&gt; &gt; ++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANT=
IES OF<br>
&gt; &gt; ++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND<br>
&gt; &gt; ++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT =
HOLDERS BE<br>
&gt; &gt; ++ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN=
 AN ACTION<br>
&gt; &gt; ++ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN C=
ONNECTION<br>
&gt; &gt; ++ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWA=
RE.<br>
&gt; &gt; ++ */<br>
&gt; &gt; ++#include &quot;nghttp2_ratelim.h&quot;<br>
&gt; &gt; ++#include &quot;nghttp2_helper.h&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++void nghttp2_ratelim_init(nghttp2_ratelim *rl, uint64_t burst, =
uint64_t rate) {<br>
&gt; &gt; ++=C2=A0 rl-&gt;val =3D rl-&gt;burst =3D burst;<br>
&gt; &gt; ++=C2=A0 rl-&gt;rate =3D rate;<br>
&gt; &gt; ++=C2=A0 rl-&gt;tstamp =3D 0;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++void nghttp2_ratelim_update(nghttp2_ratelim *rl, uint64_t tstam=
p) {<br>
&gt; &gt; ++=C2=A0 uint64_t d, gain;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (tstamp =3D=3D rl-&gt;tstamp) {<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 return;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (tstamp &gt; rl-&gt;tstamp) {<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 d =3D tstamp - rl-&gt;tstamp;<br>
&gt; &gt; ++=C2=A0 } else {<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 d =3D 1;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 rl-&gt;tstamp =3D tstamp;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (UINT64_MAX / d &lt; rl-&gt;rate) {<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 rl-&gt;val =3D rl-&gt;burst;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 return;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 gain =3D rl-&gt;rate * d;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (UINT64_MAX - gain &lt; rl-&gt;val) {<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 rl-&gt;val =3D rl-&gt;burst;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 return;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 rl-&gt;val +=3D gain;<br>
&gt; &gt; ++=C2=A0 rl-&gt;val =3D nghttp2_min(rl-&gt;val, rl-&gt;burst);<br=
>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++int nghttp2_ratelim_drain(nghttp2_ratelim *rl, uint64_t n) {<br=
>
&gt; &gt; ++=C2=A0 if (rl-&gt;val &lt; n) {<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 return -1;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 rl-&gt;val -=3D n;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 return 0;<br>
&gt; &gt; ++}<br>
&gt; &gt; +--- /dev/null<br>
&gt; &gt; ++++ b/lib/nghttp2_ratelim.h<br>
&gt; &gt; +@@ -0,0 +1,57 @@<br>
&gt; &gt; ++/*<br>
&gt; &gt; ++ * nghttp2 - HTTP/2 C Library<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * Copyright (c) 2023 nghttp2 contributors<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * Permission is hereby granted, free of charge, to any person =
obtaining<br>
&gt; &gt; ++ * a copy of this software and associated documentation files (=
the<br>
&gt; &gt; ++ * &quot;Software&quot;), to deal in the Software without restr=
iction, including<br>
&gt; &gt; ++ * without limitation the rights to use, copy, modify, merge, p=
ublish,<br>
&gt; &gt; ++ * distribute, sublicense, and/or sell copies of the Software, =
and to<br>
&gt; &gt; ++ * permit persons to whom the Software is furnished to do so, s=
ubject to<br>
&gt; &gt; ++ * the following conditions:<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * The above copyright notice and this permission notice shall =
be<br>
&gt; &gt; ++ * included in all copies or substantial portions of the Softwa=
re.<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY=
 OF ANY KIND,<br>
&gt; &gt; ++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANT=
IES OF<br>
&gt; &gt; ++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND<br>
&gt; &gt; ++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT =
HOLDERS BE<br>
&gt; &gt; ++ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN=
 AN ACTION<br>
&gt; &gt; ++ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN C=
ONNECTION<br>
&gt; &gt; ++ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWA=
RE.<br>
&gt; &gt; ++ */<br>
&gt; &gt; ++#ifndef NGHTTP2_RATELIM_H<br>
&gt; &gt; ++#define NGHTTP2_RATELIM_H<br>
&gt; &gt; ++<br>
&gt; &gt; ++#ifdef HAVE_CONFIG_H<br>
&gt; &gt; ++#=C2=A0 include &lt;config.h&gt;<br>
&gt; &gt; ++#endif /* HAVE_CONFIG_H */<br>
&gt; &gt; ++<br>
&gt; &gt; ++#include &lt;nghttp2/nghttp2.h&gt;<br>
&gt; &gt; ++<br>
&gt; &gt; ++typedef struct nghttp2_ratelim {<br>
&gt; &gt; ++=C2=A0 /* burst is the maximum value of val. */<br>
&gt; &gt; ++=C2=A0 uint64_t burst;<br>
&gt; &gt; ++=C2=A0 /* rate is the amount of value that is regenerated per 1=
 tstamp. */<br>
&gt; &gt; ++=C2=A0 uint64_t rate;<br>
&gt; &gt; ++=C2=A0 /* val is the amount of value available to drain. */<br>
&gt; &gt; ++=C2=A0 uint64_t val;<br>
&gt; &gt; ++=C2=A0 /* tstamp is the last timestamp in second resolution tha=
t is known<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 to this object. */<br>
&gt; &gt; ++=C2=A0 uint64_t tstamp;<br>
&gt; &gt; ++} nghttp2_ratelim;<br>
&gt; &gt; ++<br>
&gt; &gt; ++/* nghttp2_ratelim_init initializes |rl| with the given paramet=
ers. */<br>
&gt; &gt; ++void nghttp2_ratelim_init(nghttp2_ratelim *rl, uint64_t burst, =
uint64_t rate);<br>
&gt; &gt; ++<br>
&gt; &gt; ++/* nghttp2_ratelim_update updates rl-&gt;val with the current |=
tstamp|<br>
&gt; &gt; ++=C2=A0=C2=A0 given in second resolution. */<br>
&gt; &gt; ++void nghttp2_ratelim_update(nghttp2_ratelim *rl, uint64_t tstam=
p);<br>
&gt; &gt; ++<br>
&gt; &gt; ++/* nghttp2_ratelim_drain drains |n| from rl-&gt;val.=C2=A0 It r=
eturns 0 if it<br>
&gt; &gt; ++=C2=A0=C2=A0 succeeds, or -1. */<br>
&gt; &gt; ++int nghttp2_ratelim_drain(nghttp2_ratelim *rl, uint64_t n);<br>
&gt; &gt; ++<br>
&gt; &gt; ++#endif /* NGHTTP2_RATELIM_H */<br>
&gt; &gt; +--- a/lib/nghttp2_session.c<br>
&gt; &gt; ++++ b/lib/nghttp2_session.c<br>
&gt; &gt; +@@ -36,6 +36,7 @@<br>
&gt; &gt; + #include &quot;nghttp2_option.h&quot;<br>
&gt; &gt; + #include &quot;nghttp2_http.h&quot;<br>
&gt; &gt; + #include &quot;nghttp2_pq.h&quot;<br>
&gt; &gt; ++#include &quot;nghttp2_time.h&quot;<br>
&gt; &gt; + #include &quot;nghttp2_debug.h&quot;<br>
&gt; &gt; +<br>
&gt; &gt; + /*<br>
&gt; &gt; +@@ -443,6 +444,10 @@ static int session_new(nghttp2_session *<br=
>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NGHTTP2_DEFAULT_MAX_CONCURR=
ENT_STREAMS;<br>
&gt; &gt; +=C2=A0=C2=A0 (*session_ptr)-&gt;pending_enable_push =3D 1;<br>
&gt; &gt; +<br>
&gt; &gt; ++=C2=A0 nghttp2_ratelim_init(&amp;(*session_ptr)-&gt;stream_rese=
t_ratelim,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NGHTT=
P2_DEFAULT_STREAM_RESET_BURST,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NGHTT=
P2_DEFAULT_STREAM_RESET_RATE);<br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0=C2=A0 if (server) {<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 (*session_ptr)-&gt;server =3D 1;<br>
&gt; &gt; +=C2=A0=C2=A0 }<br>
&gt; &gt; +@@ -527,6 +532,12 @@ static int session_new(nghttp2_session *<br=
>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 option-&gt;max_=
settings) {<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (*session_ptr)-&gt;max_sett=
ings =3D option-&gt;max_settings;<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 if (option-&gt;opt_set_mask &amp; NGHTTP2_OP=
T_STREAM_RESET_RATE_LIMIT) {<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_ratelim_init(&amp;(*sess=
ion_ptr)-&gt;stream_reset_ratelim,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 option-&gt;stream_reset_burst,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 option-&gt;stream_reset_rate);<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; +=C2=A0=C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0=C2=A0 rv =3D nghttp2_hd_deflate_init2(&amp;(*session_ptr)=
-&gt;hd_deflater,<br>
&gt; &gt; +@@ -4144,6 +4155,23 @@ static int session_process_priority_fram<=
br>
&gt; &gt; +=C2=A0=C2=A0 return nghttp2_session_on_priority_received(session=
, frame);<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; ++static int session_update_stream_reset_ratelim(nghttp2_session =
*session) {<br>
&gt; &gt; ++=C2=A0 if (!session-&gt;server || (session-&gt;goaway_flags &am=
p; NGHTTP2_GOAWAY_SUBMITTED)) {<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 return 0;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 nghttp2_ratelim_update(&amp;session-&gt;stream_reset_rat=
elim,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 nghttp2_time_now_sec());<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (nghttp2_ratelim_drain(&amp;session-&gt;stream_reset_=
ratelim, 1) =3D=3D 0) {<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 return 0;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 return nghttp2_session_add_goaway(session, session-&gt;l=
ast_recv_stream_id,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NG=
HTTP2_INTERNAL_ERROR, NULL, 0,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NG=
HTTP2_GOAWAY_AUX_NONE);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; + int nghttp2_session_on_rst_stream_received(nghttp2_session *ses=
sion,<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_frame *frame) {<br>
&gt; &gt; +=C2=A0=C2=A0 int rv;<br>
&gt; &gt; +@@ -4173,7 +4201,8 @@ int nghttp2_session_on_rst_stream_receiv<b=
r>
&gt; &gt; +=C2=A0=C2=A0 if (nghttp2_is_fatal(rv)) {<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 return rv;<br>
&gt; &gt; +=C2=A0=C2=A0 }<br>
&gt; &gt; +-=C2=A0 return 0;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 return session_update_stream_reset_ratelim(session);<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; + static int session_process_rst_stream_frame(nghttp2_session *se=
ssion) {<br>
&gt; &gt; +@@ -6965,6 +6994,9 @@ int nghttp2_session_add_goaway(nghttp2_s<b=
r>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_mem_free(mem, item);<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 return rv;<br>
&gt; &gt; +=C2=A0=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 session-&gt;goaway_flags |=3D NGHTTP2_GOAWAY_SUBMITTED;<=
br>
&gt; &gt; ++<br>
&gt; &gt; +=C2=A0=C2=A0 return 0;<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; +--- a/lib/nghttp2_session.h<br>
&gt; &gt; ++++ b/lib/nghttp2_session.h<br>
&gt; &gt; +@@ -39,6 +39,7 @@<br>
&gt; &gt; + #include &quot;nghttp2_buf.h&quot;<br>
&gt; &gt; + #include &quot;nghttp2_callbacks.h&quot;<br>
&gt; &gt; + #include &quot;nghttp2_mem.h&quot;<br>
&gt; &gt; ++#include &quot;nghttp2_ratelim.h&quot;<br>
&gt; &gt; +<br>
&gt; &gt; + /* The global variable for tests where we want to disable stric=
t<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 preface handling. */<br>
&gt; &gt; +@@ -102,6 +103,10 @@ typedef struct {<br>
&gt; &gt; + /* The default value of maximum number of concurrent streams. *=
/<br>
&gt; &gt; + #define NGHTTP2_DEFAULT_MAX_CONCURRENT_STREAMS 0xffffffffu<br>
&gt; &gt; +<br>
&gt; &gt; ++/* The default values for stream reset rate limiter. */<br>
&gt; &gt; ++#define NGHTTP2_DEFAULT_STREAM_RESET_BURST 1000<br>
&gt; &gt; ++#define NGHTTP2_DEFAULT_STREAM_RESET_RATE 33<br>
&gt; &gt; ++<br>
&gt; &gt; + /* Internal state when receiving incoming frame */<br>
&gt; &gt; + typedef enum {<br>
&gt; &gt; +=C2=A0=C2=A0 /* Receiving frame header */<br>
&gt; &gt; +@@ -176,7 +181,9 @@ typedef enum {<br>
&gt; &gt; +=C2=A0=C2=A0 /* Flag means GOAWAY was sent */<br>
&gt; &gt; +=C2=A0=C2=A0 NGHTTP2_GOAWAY_SENT =3D 0x4,<br>
&gt; &gt; +=C2=A0=C2=A0 /* Flag means GOAWAY was received */<br>
&gt; &gt; +-=C2=A0 NGHTTP2_GOAWAY_RECV =3D 0x8<br>
&gt; &gt; ++=C2=A0 NGHTTP2_GOAWAY_RECV =3D 0x8,<br>
&gt; &gt; ++=C2=A0 /* Flag means GOAWAY has been submitted at least once */=
<br>
&gt; &gt; ++=C2=A0 NGHTTP2_GOAWAY_SUBMITTED =3D 0x10<br>
&gt; &gt; + } nghttp2_goaway_flag;<br>
&gt; &gt; +<br>
&gt; &gt; + /* nghttp2_inflight_settings stores the SETTINGS entries which =
local<br>
&gt; &gt; +@@ -230,6 +237,9 @@ struct nghttp2_session {<br>
&gt; &gt; +=C2=A0=C2=A0 /* Queue of In-flight SETTINGS values.=C2=A0 SETTIN=
GS bearing ACK is not<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 considered as in-flight. */<br>
&gt; &gt; +=C2=A0=C2=A0 nghttp2_inflight_settings *inflight_settings_head;<=
br>
&gt; &gt; ++=C2=A0 /* Stream reset rate limiter.=C2=A0 If receiving excessi=
ve amount of<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 stream resets, GOAWAY will be sent. */=
<br>
&gt; &gt; ++=C2=A0 nghttp2_ratelim stream_reset_ratelim;<br>
&gt; &gt; +=C2=A0=C2=A0 /* The number of outgoing streams. This will be cap=
ped by<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remote_settings.max_concurrent_st=
reams. */<br>
&gt; &gt; +=C2=A0=C2=A0 size_t num_outgoing_streams;<br>
&gt; &gt; +--- /dev/null<br>
&gt; &gt; ++++ b/lib/nghttp2_time.c<br>
&gt; &gt; +@@ -0,0 +1,62 @@<br>
&gt; &gt; ++/*<br>
&gt; &gt; ++ * nghttp2 - HTTP/2 C Library<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * Copyright (c) 2023 nghttp2 contributors<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * Permission is hereby granted, free of charge, to any person =
obtaining<br>
&gt; &gt; ++ * a copy of this software and associated documentation files (=
the<br>
&gt; &gt; ++ * &quot;Software&quot;), to deal in the Software without restr=
iction, including<br>
&gt; &gt; ++ * without limitation the rights to use, copy, modify, merge, p=
ublish,<br>
&gt; &gt; ++ * distribute, sublicense, and/or sell copies of the Software, =
and to<br>
&gt; &gt; ++ * permit persons to whom the Software is furnished to do so, s=
ubject to<br>
&gt; &gt; ++ * the following conditions:<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * The above copyright notice and this permission notice shall =
be<br>
&gt; &gt; ++ * included in all copies or substantial portions of the Softwa=
re.<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY=
 OF ANY KIND,<br>
&gt; &gt; ++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANT=
IES OF<br>
&gt; &gt; ++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND<br>
&gt; &gt; ++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT =
HOLDERS BE<br>
&gt; &gt; ++ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN=
 AN ACTION<br>
&gt; &gt; ++ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN C=
ONNECTION<br>
&gt; &gt; ++ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWA=
RE.<br>
&gt; &gt; ++ */<br>
&gt; &gt; ++#include &quot;nghttp2_time.h&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++#ifdef HAVE_TIME_H<br>
&gt; &gt; ++#=C2=A0 include &lt;time.h&gt;<br>
&gt; &gt; ++#endif /* HAVE_TIME_H */<br>
&gt; &gt; ++<br>
&gt; &gt; ++#ifdef HAVE_SYSINFOAPI_H<br>
&gt; &gt; ++#=C2=A0 include &lt;sysinfoapi.h&gt;<br>
&gt; &gt; ++#endif /* HAVE_SYSINFOAPI_H */<br>
&gt; &gt; ++<br>
&gt; &gt; ++#ifndef HAVE_GETTICKCOUNT64<br>
&gt; &gt; ++static uint64_t time_now_sec(void) {<br>
&gt; &gt; ++=C2=A0 time_t t =3D time(NULL);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (t =3D=3D -1) {<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 return 0;<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 return (uint64_t)t;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++#endif /* HAVE_GETTICKCOUNT64 */<br>
&gt; &gt; ++<br>
&gt; &gt; ++#ifdef HAVE_CLOCK_GETTIME<br>
&gt; &gt; ++uint64_t nghttp2_time_now_sec(void) {<br>
&gt; &gt; ++=C2=A0 struct timespec tp;<br>
&gt; &gt; ++=C2=A0 int rv =3D clock_gettime(CLOCK_MONOTONIC, &amp;tp);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 if (rv =3D=3D -1) {<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 return time_now_sec();<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 return (uint64_t)tp.tv_sec;<br>
&gt; &gt; ++}<br>
&gt; &gt; ++#elif defined(HAVE_GETTICKCOUNT64)<br>
&gt; &gt; ++uint64_t nghttp2_time_now_sec(void) { return GetTickCount64() /=
 1000; }<br>
&gt; &gt; ++#else=C2=A0 /* !HAVE_CLOCK_GETTIME &amp;&amp; !HAVE_GETTICKCOUN=
T64 */<br>
&gt; &gt; ++uint64_t nghttp2_time_now_sec(void) { return time_now_sec(); }<=
br>
&gt; &gt; ++#endif /* !HAVE_CLOCK_GETTIME &amp;&amp; !HAVE_GETTICKCOUNT64 *=
/<br>
&gt; &gt; +--- /dev/null<br>
&gt; &gt; ++++ b/lib/nghttp2_time.h<br>
&gt; &gt; +@@ -0,0 +1,38 @@<br>
&gt; &gt; ++/*<br>
&gt; &gt; ++ * nghttp2 - HTTP/2 C Library<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * Copyright (c) 2023 nghttp2 contributors<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * Permission is hereby granted, free of charge, to any person =
obtaining<br>
&gt; &gt; ++ * a copy of this software and associated documentation files (=
the<br>
&gt; &gt; ++ * &quot;Software&quot;), to deal in the Software without restr=
iction, including<br>
&gt; &gt; ++ * without limitation the rights to use, copy, modify, merge, p=
ublish,<br>
&gt; &gt; ++ * distribute, sublicense, and/or sell copies of the Software, =
and to<br>
&gt; &gt; ++ * permit persons to whom the Software is furnished to do so, s=
ubject to<br>
&gt; &gt; ++ * the following conditions:<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * The above copyright notice and this permission notice shall =
be<br>
&gt; &gt; ++ * included in all copies or substantial portions of the Softwa=
re.<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY=
 OF ANY KIND,<br>
&gt; &gt; ++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANT=
IES OF<br>
&gt; &gt; ++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND<br>
&gt; &gt; ++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT =
HOLDERS BE<br>
&gt; &gt; ++ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN=
 AN ACTION<br>
&gt; &gt; ++ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN C=
ONNECTION<br>
&gt; &gt; ++ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWA=
RE.<br>
&gt; &gt; ++ */<br>
&gt; &gt; ++#ifndef NGHTTP2_TIME_H<br>
&gt; &gt; ++#define NGHTTP2_TIME_H<br>
&gt; &gt; ++<br>
&gt; &gt; ++#ifdef HAVE_CONFIG_H<br>
&gt; &gt; ++#=C2=A0 include &lt;config.h&gt;<br>
&gt; &gt; ++#endif /* HAVE_CONFIG_H */<br>
&gt; &gt; ++<br>
&gt; &gt; ++#include &lt;nghttp2/nghttp2.h&gt;<br>
&gt; &gt; ++<br>
&gt; &gt; ++/* nghttp2_time_now_sec returns seconds from implementation-spe=
cific<br>
&gt; &gt; ++=C2=A0=C2=A0 timepoint.=C2=A0 If it is unable to get seconds, i=
t returns 0. */<br>
&gt; &gt; ++uint64_t nghttp2_time_now_sec(void);<br>
&gt; &gt; ++<br>
&gt; &gt; ++#endif /* NGHTTP2_TIME_H */<br>
&gt; &gt; +--- /dev/null<br>
&gt; &gt; ++++ b/tests/nghttp2_ratelim_test.c<br>
&gt; &gt; +@@ -0,0 +1,101 @@<br>
&gt; &gt; ++/*<br>
&gt; &gt; ++ * nghttp2 - HTTP/2 C Library<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * Copyright (c) 2023 nghttp2 contributors<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * Permission is hereby granted, free of charge, to any person =
obtaining<br>
&gt; &gt; ++ * a copy of this software and associated documentation files (=
the<br>
&gt; &gt; ++ * &quot;Software&quot;), to deal in the Software without restr=
iction, including<br>
&gt; &gt; ++ * without limitation the rights to use, copy, modify, merge, p=
ublish,<br>
&gt; &gt; ++ * distribute, sublicense, and/or sell copies of the Software, =
and to<br>
&gt; &gt; ++ * permit persons to whom the Software is furnished to do so, s=
ubject to<br>
&gt; &gt; ++ * the following conditions:<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * The above copyright notice and this permission notice shall =
be<br>
&gt; &gt; ++ * included in all copies or substantial portions of the Softwa=
re.<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY=
 OF ANY KIND,<br>
&gt; &gt; ++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANT=
IES OF<br>
&gt; &gt; ++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND<br>
&gt; &gt; ++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT =
HOLDERS BE<br>
&gt; &gt; ++ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN=
 AN ACTION<br>
&gt; &gt; ++ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN C=
ONNECTION<br>
&gt; &gt; ++ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWA=
RE.<br>
&gt; &gt; ++ */<br>
&gt; &gt; ++#include &quot;nghttp2_ratelim_test.h&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++#include &lt;stdio.h&gt;<br>
&gt; &gt; ++<br>
&gt; &gt; ++#include &lt;CUnit/CUnit.h&gt;<br>
&gt; &gt; ++<br>
&gt; &gt; ++#include &quot;nghttp2_ratelim.h&quot;<br>
&gt; &gt; ++<br>
&gt; &gt; ++void test_nghttp2_ratelim_update(void) {<br>
&gt; &gt; ++=C2=A0 nghttp2_ratelim rl;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 nghttp2_ratelim_init(&amp;rl, 1000, 21);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(1000 =3D=3D rl.val);<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(1000 =3D=3D rl.burst);<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(21 =3D=3D rl.rate);<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(0 =3D=3D rl.tstamp);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 nghttp2_ratelim_update(&amp;rl, 999);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(1000 =3D=3D rl.val);<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(999 =3D=3D rl.tstamp);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 nghttp2_ratelim_drain(&amp;rl, 100);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(900 =3D=3D rl.val);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 nghttp2_ratelim_update(&amp;rl, 1000);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(921 =3D=3D rl.val);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 nghttp2_ratelim_update(&amp;rl, 1002);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(963 =3D=3D rl.val);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 nghttp2_ratelim_update(&amp;rl, 1004);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(1000 =3D=3D rl.val);<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(1004 =3D=3D rl.tstamp);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* timer skew */<br>
&gt; &gt; ++=C2=A0 nghttp2_ratelim_init(&amp;rl, 1000, 21);<br>
&gt; &gt; ++=C2=A0 nghttp2_ratelim_update(&amp;rl, 1);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(1000 =3D=3D rl.val);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 nghttp2_ratelim_update(&amp;rl, 0);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(1000 =3D=3D rl.val);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* rate * duration overflow */<br>
&gt; &gt; ++=C2=A0 nghttp2_ratelim_init(&amp;rl, 1000, 100);<br>
&gt; &gt; ++=C2=A0 nghttp2_ratelim_drain(&amp;rl, 999);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(1 =3D=3D rl.val);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 nghttp2_ratelim_update(&amp;rl, UINT64_MAX);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(1000 =3D=3D rl.val);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* val + rate * duration overflow */<br>
&gt; &gt; ++=C2=A0 nghttp2_ratelim_init(&amp;rl, UINT64_MAX - 1, 2);<br>
&gt; &gt; ++=C2=A0 nghttp2_ratelim_update(&amp;rl, 1);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(UINT64_MAX - 1 =3D=3D rl.val);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; ++void test_nghttp2_ratelim_drain(void) {<br>
&gt; &gt; ++=C2=A0 nghttp2_ratelim rl;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 nghttp2_ratelim_init(&amp;rl, 100, 7);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(-1 =3D=3D nghttp2_ratelim_drain(&amp;rl, 101))=
;<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(0 =3D=3D nghttp2_ratelim_drain(&amp;rl, 51));<=
br>
&gt; &gt; ++=C2=A0 CU_ASSERT(0 =3D=3D nghttp2_ratelim_drain(&amp;rl, 49));<=
br>
&gt; &gt; ++=C2=A0 CU_ASSERT(-1 =3D=3D nghttp2_ratelim_drain(&amp;rl, 1));<=
br>
&gt; &gt; ++}<br>
&gt; &gt; +--- /dev/null<br>
&gt; &gt; ++++ b/tests/nghttp2_ratelim_test.h<br>
&gt; &gt; +@@ -0,0 +1,35 @@<br>
&gt; &gt; ++/*<br>
&gt; &gt; ++ * nghttp2 - HTTP/2 C Library<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * Copyright (c) 2023 nghttp2 contributors<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * Permission is hereby granted, free of charge, to any person =
obtaining<br>
&gt; &gt; ++ * a copy of this software and associated documentation files (=
the<br>
&gt; &gt; ++ * &quot;Software&quot;), to deal in the Software without restr=
iction, including<br>
&gt; &gt; ++ * without limitation the rights to use, copy, modify, merge, p=
ublish,<br>
&gt; &gt; ++ * distribute, sublicense, and/or sell copies of the Software, =
and to<br>
&gt; &gt; ++ * permit persons to whom the Software is furnished to do so, s=
ubject to<br>
&gt; &gt; ++ * the following conditions:<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * The above copyright notice and this permission notice shall =
be<br>
&gt; &gt; ++ * included in all copies or substantial portions of the Softwa=
re.<br>
&gt; &gt; ++ *<br>
&gt; &gt; ++ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY=
 OF ANY KIND,<br>
&gt; &gt; ++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANT=
IES OF<br>
&gt; &gt; ++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND<br>
&gt; &gt; ++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT =
HOLDERS BE<br>
&gt; &gt; ++ * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN=
 AN ACTION<br>
&gt; &gt; ++ * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN C=
ONNECTION<br>
&gt; &gt; ++ * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWA=
RE.<br>
&gt; &gt; ++ */<br>
&gt; &gt; ++#ifndef NGHTTP2_RATELIM_TEST_H<br>
&gt; &gt; ++#define NGHTTP2_RATELIM_TEST_H<br>
&gt; &gt; ++<br>
&gt; &gt; ++#ifdef HAVE_CONFIG_H<br>
&gt; &gt; ++#=C2=A0 include &lt;config.h&gt;<br>
&gt; &gt; ++#endif /* HAVE_CONFIG_H */<br>
&gt; &gt; ++<br>
&gt; &gt; ++void test_nghttp2_ratelim_update(void);<br>
&gt; &gt; ++void test_nghttp2_ratelim_drain(void);<br>
&gt; &gt; ++<br>
&gt; &gt; ++#endif /* NGHTTP2_RATELIM_TEST_H */<br>
&gt; &gt; +--- a/tests/nghttp2_session_test.c<br>
&gt; &gt; ++++ b/tests/nghttp2_session_test.c<br>
&gt; &gt; +@@ -10813,6 +10813,109 @@ void test_nghttp2_session_set_stream_u=
se<br>
&gt; &gt; +=C2=A0=C2=A0 nghttp2_session_del(session);<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; ++void test_nghttp2_session_stream_reset_ratelim(void) {<br>
&gt; &gt; ++=C2=A0 nghttp2_session *session;<br>
&gt; &gt; ++=C2=A0 nghttp2_session_callbacks callbacks;<br>
&gt; &gt; ++=C2=A0 nghttp2_frame frame;<br>
&gt; &gt; ++=C2=A0 ssize_t rv;<br>
&gt; &gt; ++=C2=A0 nghttp2_bufs bufs;<br>
&gt; &gt; ++=C2=A0 nghttp2_buf *buf;<br>
&gt; &gt; ++=C2=A0 nghttp2_mem *mem;<br>
&gt; &gt; ++=C2=A0 size_t i;<br>
&gt; &gt; ++=C2=A0 nghttp2_hd_deflater deflater;<br>
&gt; &gt; ++=C2=A0 size_t nvlen;<br>
&gt; &gt; ++=C2=A0 nghttp2_nv *nva;<br>
&gt; &gt; ++=C2=A0 int32_t stream_id;<br>
&gt; &gt; ++=C2=A0 nghttp2_outbound_item *item;<br>
&gt; &gt; ++=C2=A0 nghttp2_option *option;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 mem =3D nghttp2_mem_default();<br>
&gt; &gt; ++=C2=A0 frame_pack_bufs_init(&amp;bufs);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 memset(&amp;callbacks, 0, sizeof(nghttp2_session_callbac=
ks));<br>
&gt; &gt; ++=C2=A0 callbacks.send_callback =3D null_send_callback;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 nghttp2_option_new(&amp;option);<br>
&gt; &gt; ++=C2=A0 nghttp2_option_set_stream_reset_rate_limit(<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 option, NGHTTP2_DEFAULT_STREAM_R=
ESET_BURST, 0);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 nghttp2_session_server_new2(&amp;session, &amp;callbacks=
, NULL, option);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 nghttp2_frame_settings_init(&amp;frame.settings, NGHTTP2=
_FLAG_NONE, NULL, 0);<br>
&gt; &gt; ++=C2=A0 rv =3D nghttp2_frame_pack_settings(&amp;bufs, &amp;frame=
.settings);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(0 =3D=3D rv);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 nghttp2_frame_settings_free(&amp;frame.settings, mem);<b=
r>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 buf =3D &amp;bufs.head-&gt;buf;<br>
&gt; &gt; ++=C2=A0 rv =3D nghttp2_session_mem_recv(session, buf-&gt;pos, ng=
http2_buf_len(buf));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 CU_ASSERT((ssize_t)nghttp2_buf_len(buf) =3D=3D rv);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 /* Send SETTINGS ACK */<br>
&gt; &gt; ++=C2=A0 rv =3D nghttp2_session_send(session);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 CU_ASSERT(0 =3D=3D rv);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 nghttp2_hd_deflate_init(&amp;deflater, mem);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 for (i =3D 0; i &lt; NGHTTP2_DEFAULT_STREAM_RESET_BURST =
+ 2; ++i) {<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 stream_id =3D (int32_t)(i * 2 + 1);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 nghttp2_bufs_reset(&amp;bufs);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 /* HEADERS */<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 nvlen =3D ARRLEN(reqnv);<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 nghttp2_nv_array_copy(&amp;nva, reqnv, nvlen=
, mem);<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 nghttp2_frame_headers_init(&amp;frame.header=
s, NGHTTP2_FLAG_END_HEADERS,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stream_id, NGHTTP2_HCAT_HEADERS,=
 NULL, nva,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvlen);<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 rv =3D nghttp2_frame_pack_headers(&amp;bufs,=
 &amp;frame.headers, &amp;deflater);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 CU_ASSERT(0 =3D=3D rv);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 nghttp2_frame_headers_free(&amp;frame.header=
s, mem);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 buf =3D &amp;bufs.head-&gt;buf;<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 rv =3D nghttp2_session_mem_recv(session, buf=
-&gt;pos, nghttp2_buf_len(buf));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 CU_ASSERT((ssize_t)nghttp2_buf_len(buf) =3D=
=3D rv);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 nghttp2_bufs_reset(&amp;bufs);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 /* RST_STREAM */<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 nghttp2_frame_rst_stream_init(&amp;frame.rst=
_stream, stream_id,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NGHTTP2_NO_ERR=
OR);<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 nghttp2_frame_pack_rst_stream(&amp;bufs, &am=
p;frame.rst_stream);<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 nghttp2_frame_rst_stream_free(&amp;frame.rst=
_stream);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 buf =3D &amp;bufs.head-&gt;buf;<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 rv =3D nghttp2_session_mem_recv(session, buf=
-&gt;pos, nghttp2_buf_len(buf));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 CU_ASSERT((ssize_t)nghttp2_buf_len(buf) =3D=
=3D rv);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 if (i &lt; NGHTTP2_DEFAULT_STREAM_RESET_BURS=
T) {<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CU_ASSERT(0 =3D=3D nghttp2_outbo=
und_queue_size(&amp;session-&gt;ob_reg));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 CU_ASSERT(1 =3D=3D nghttp2_outbound_queue_si=
ze(&amp;session-&gt;ob_reg));<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 item =3D nghttp2_session_get_next_ob_item(se=
ssion);<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 CU_ASSERT(NGHTTP2_GOAWAY =3D=3D item-&gt;fra=
me.hd.type);<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 CU_ASSERT(NGHTTP2_DEFAULT_STREAM_RESET_BURST=
 * 2 + 1 =3D=3D<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 item-&gt;frame.goaway.last_stream_id);<br>
&gt; &gt; ++=C2=A0 }<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 nghttp2_hd_deflate_free(&amp;deflater);<br>
&gt; &gt; ++=C2=A0 nghttp2_session_del(session);<br>
&gt; &gt; ++=C2=A0 nghttp2_bufs_free(&amp;bufs);<br>
&gt; &gt; ++=C2=A0 nghttp2_option_del(option);<br>
&gt; &gt; ++}<br>
&gt; &gt; ++<br>
&gt; &gt; + static void check_nghttp2_http_recv_headers_fail(<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_session *session, nghttp2_hd_de=
flater *deflater, int32_t stream_id,<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 int stream_state, const nghttp2_nv *nva=
, size_t nvlen) {<br>
&gt; &gt; +--- a/tests/nghttp2_session_test.h<br>
&gt; &gt; ++++ b/tests/nghttp2_session_test.h<br>
&gt; &gt; +@@ -160,6 +160,7 @@ void test_nghttp2_session_removed_closed<br>
&gt; &gt; + void test_nghttp2_session_pause_data(void);<br>
&gt; &gt; + void test_nghttp2_session_no_closed_streams(void);<br>
&gt; &gt; + void test_nghttp2_session_set_stream_user_data(void);<br>
&gt; &gt; ++void test_nghttp2_session_stream_reset_ratelim(void);<br>
&gt; &gt; + void test_nghttp2_http_mandatory_headers(void);<br>
&gt; &gt; + void test_nghttp2_http_content_length(void);<br>
&gt; &gt; + void test_nghttp2_http_content_length_mismatch(void);<br>
&gt; &gt; +--- a/tests/CMakeLists.txt<br>
&gt; &gt; ++++ b/tests/CMakeLists.txt<br>
&gt; &gt; +@@ -21,6 +21,7 @@ if(HAVE_CUNIT)<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_npn_test.c<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_helper_test.c<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_buf_test.c<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 nghttp2_ratelim_test.c<br>
&gt; &gt; +=C2=A0=C2=A0 )<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0=C2=A0 add_executable(main EXCLUDE_FROM_ALL<br>
&gt; &gt; +--- a/tests/Makefile.am<br>
&gt; &gt; ++++ b/tests/Makefile.am<br>
&gt; &gt; +@@ -40,14 +40,16 @@ OBJECTS =3D main.c nghttp2_pq_test.c nghtt<b=
r>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_hd_test.c \<b=
r>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_npn_test.c \<=
br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_helper_test.c=
 \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_buf_test.c<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_buf_test.c \<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_ratelim_test.c<br>
&gt; &gt; +<br>
&gt; &gt; + HFILES =3D nghttp2_pq_test.h nghttp2_map_test.h nghttp2_queue_t=
est.h \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_session_test.=
h \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_frame_test.h =
nghttp2_stream_test.h nghttp2_hd_test.h \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_npn_test.h ng=
http2_helper_test.h \<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_test_helper.h=
 \<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_buf_test.h<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_buf_test.h \<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nghttp2_ratelim_test.h<br>
&gt; &gt; +<br>
&gt; &gt; + main_SOURCES =3D $(HFILES) $(OBJECTS)<br>
&gt; &gt; +<br>
&gt; &gt; +--- a/lib/nghttp2_option.h<br>
&gt; &gt; ++++ b/lib/nghttp2_option.h<br>
&gt; &gt; +@@ -68,6 +68,7 @@ typedef enum {<br>
&gt; &gt; +=C2=A0=C2=A0 NGHTTP2_OPT_NO_CLOSED_STREAMS =3D 1 &lt;&lt; 10,<br=
>
&gt; &gt; +=C2=A0=C2=A0 NGHTTP2_OPT_MAX_OUTBOUND_ACK =3D 1 &lt;&lt; 11,<br>
&gt; &gt; +=C2=A0=C2=A0 NGHTTP2_OPT_MAX_SETTINGS =3D 1 &lt;&lt; 12,<br>
&gt; &gt; ++=C2=A0 NGHTTP2_OPT_STREAM_RESET_RATE_LIMIT =3D 1 &lt;&lt; 15,<b=
r>
&gt; &gt; + } nghttp2_option_flag;<br>
&gt; &gt; +<br>
&gt; &gt; + /**<br>
&gt; &gt; +@@ -75,6 +76,11 @@ typedef enum {<br>
&gt; &gt; +=C2=A0 */<br>
&gt; &gt; + struct nghttp2_option {<br>
&gt; &gt; +=C2=A0=C2=A0 /**<br>
&gt; &gt; ++=C2=A0=C2=A0 * NGHTTP2_OPT_STREAM_RESET_RATE_LIMIT<br>
&gt; &gt; ++=C2=A0=C2=A0 */<br>
&gt; &gt; ++=C2=A0 uint64_t stream_reset_burst;<br>
&gt; &gt; ++=C2=A0 uint64_t stream_reset_rate;<br>
&gt; &gt; ++=C2=A0 /**<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 * NGHTTP2_OPT_MAX_SEND_HEADER_BLOCK_LENGTH<br=
>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 */<br>
&gt; &gt; +=C2=A0=C2=A0 size_t max_send_header_block_length;<br>
&gt; &gt; +--- a/tests/main.c<br>
&gt; &gt; ++++ b/tests/main.c<br>
&gt; &gt; +@@ -40,6 +40,7 @@<br>
&gt; &gt; + #include &quot;nghttp2_npn_test.h&quot;<br>
&gt; &gt; + #include &quot;nghttp2_helper_test.h&quot;<br>
&gt; &gt; + #include &quot;nghttp2_buf_test.h&quot;<br>
&gt; &gt; ++#include &quot;nghttp2_ratelim_test.h&quot;<br>
&gt; &gt; +<br>
&gt; &gt; + extern int nghttp2_enable_strict_preface;<br>
&gt; &gt; +<br>
&gt; &gt; +@@ -323,6 +324,8 @@ int main() {<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_nghttp2_session_no=
_closed_streams) ||<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !CU_add_test(pSuite, &quot;=
session_set_stream_user_data&quot;,<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_nghttp2_session_se=
t_stream_user_data) ||<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !CU_add_test(pSuite, &quot;sessi=
on_stream_reset_ratelim&quot;,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_nghttp2_session_stream_reset_r=
atelim) ||<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !CU_add_test(pSuite, &quot;=
http_mandatory_headers&quot;,<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_nghttp2_http_manda=
tory_headers) ||<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !CU_add_test(pSuite, &quot;=
http_content_length&quot;,<br>
&gt; &gt; +@@ -418,7 +421,9 @@ int main() {<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !CU_add_test(pSuite, &quot;=
bufs_advance&quot;, test_nghttp2_bufs_advance) ||<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !CU_add_test(pSuite, &quot;=
bufs_next_present&quot;,<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_nghttp2_bufs_next_=
present) ||<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !CU_add_test(pSuite, &quot;bufs_=
realloc&quot;, test_nghttp2_bufs_realloc)) {<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !CU_add_test(pSuite, &quot;bufs_=
realloc&quot;, test_nghttp2_bufs_realloc) ||<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !CU_add_test(pSuite, &quot;ratel=
im_update&quot;, test_nghttp2_ratelim_update) ||<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !CU_add_test(pSuite, &quot;ratel=
im_drain&quot;, test_nghttp2_ratelim_drain)) {<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 CU_cleanup_registry();<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 return (int)CU_get_error();<br>
&gt; &gt; +=C2=A0=C2=A0 }<br>
&gt; &gt; diff --git a/meta/recipes-support/nghttp2/<a href=3D"http://nghtt=
p2_1.47.0.bb" target=3D"_blank">nghttp2_1.47.0.bb</a> b/meta/recipes-suppor=
t/nghttp2/<a href=3D"http://nghttp2_1.47.0.bb" target=3D"_blank">nghttp2_1.=
47.0.bb</a><br>
&gt; &gt; index 0b9091f7e8..b67313b5c2 100644<br>
&gt; &gt; --- a/meta/recipes-support/nghttp2/<a href=3D"http://nghttp2_1.47=
.0.bb" target=3D"_blank">nghttp2_1.47.0.bb</a><br>
&gt; &gt; +++ b/meta/recipes-support/nghttp2/<a href=3D"http://nghttp2_1.47=
.0.bb" target=3D"_blank">nghttp2_1.47.0.bb</a><br>
&gt; &gt; @@ -10,6 +10,7 @@ SRC_URI =3D &quot;\<br>
&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a href=3D"https://github.com/nghtt=
p2/nghttp2/releases/download/v$" id=3D"m_-4709259264332911284OWAb72eae15-3f=
12-17cb-91ea-59e4d7e227e2" target=3D"_blank">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fnghttp2%2Fnghttp2%2Freleases%2Fdownload%2Fv%24&amp;data=3D05%7C02%7CZ=
ahir.Basha%40kpit.com%7Cd4fde3a4f7d34f1dad8a08dc348c6208%7C3539451eb46e4a26=
a242ff61502855c7%7C0%7C0%7C638443024796447032%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&=
amp;sdata=3D81qMDnTOR20hwVm%2B9foAKitKFCfZ5wID8Ez8FuvkoCo%3D&amp;reserved=
=3D0{PV}/nghttp2-${PV}.tar.xz</a>=C2=A0\<br>
&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-fetch-ocsp-response-use=
-python3.patch=C2=A0\<br>
&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://CVE-2023-35945.patch=C2=A0\<=
br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 file://CVE-2023-44487.patch=C2=A0\<br>
&gt; &gt;=C2=A0 &quot;<br>
&gt; &gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;68271951324554c34501b85190f22f=
2221056db69f493afc3bbac8e7be21e7cc&quot;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; 2.17.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#194488): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/message/194488" id=3D"m_-4709259264332911284OWA8b=
82cf9c-531d-18ad-ab9e-b05576aee3e1" target=3D"_blank">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F194488&amp;data=3D05%7C=
02%7CZahir.Basha%40kpit.com%7Cd4fde3a4f7d34f1dad8a08dc348c6208%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C638443024796450121%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%=
7C%7C&amp;sdata=3DU5DbxB9sGN68GlDwA0wUuuzOjd23ib1EPu%2FSMN1uwNI%3D&amp;rese=
rved=3D0</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104=
049487/3620601" id=3D"m_-4709259264332911284OWA749ea887-02b3-a4d0-4124-3081=
fa01639a" target=3D"_blank">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fmt%2F104049487%2F3620601&amp;data=3D05%7C02%7CZahir.Basha=
%40kpit.com%7Cd4fde3a4f7d34f1dad8a08dc348c6208%7C3539451eb46e4a26a242ff6150=
2855c7%7C0%7C0%7C638443024796453311%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=
=3DY%2Fg7gZKGTAm%2F0hdg8sIsu8SxpuyJhMRd9%2BRsE44M9p8%3D&amp;reserved=3D0</a=
><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedde=
d.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/unsub" id=3D"m_-4709259264332911284OWAb936c72d-d961-acbc-efe9-4a5=
e5846267d" target=3D"_blank">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-core%2Funsub&amp;data=3D05%7C02%7CZahir.=
Basha%40kpit.com%7Cd4fde3a4f7d34f1dad8a08dc348c6208%7C3539451eb46e4a26a242f=
f61502855c7%7C0%7C0%7C638443024796456329%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;s=
data=3DJd9ALQDgBD8QQj6Oe0WGYcURQoJtTLV%2Fq2S38gSK2HU%3D&amp;reserved=3D0</a=
>=C2=A0[<a href=3D"mailto:steve@sakoman.com" target=3D"_blank">steve@sakoma=
n.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
&gt; This message contains information that may be privileged or confidenti=
al and is the property of the KPIT Technologies Ltd. It is intended only fo=
r the person to whom it is addressed. If you are not the intended recipient=
, you are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.</span></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</div>

</div></blockquote></div>

--000000000000dc679406125dab7a--

--000000000000dc679506125dab7b
Content-Type: image/png; name="image.png"
Content-Disposition: inline; filename="image.png"
Content-Transfer-Encoding: base64
Content-ID: <ii_18deae82eb9cb971f161>
X-Attachment-Id: ii_18deae82eb9cb971f161

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
--000000000000dc679506125dab7b
Content-Type: image/png; name="image.png"
Content-Disposition: inline; filename="image.png"
Content-Transfer-Encoding: base64
Content-ID: <ii_18deae82ebacb971f162>
X-Attachment-Id: ii_18deae82ebacb971f162

iVBORw0KGgoAAAANSUhEUgAAA+IAAABZCAYAAAC6/55gAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAADY2SURBVHhe7Z1PiCPLned/3pt9e+CTH/20TfXu
A8HYdTHMHlauNQ19eIPUsIcBMaAHtYeCMQLtg4XCjA4yQ8HCQyBsqMMUjGAQ+DDwSvgdGgpvW3uY
AV96PSB4Qzc9abBPA77Zvnl/v/iTikxlpiJSmSlV1fcD2V0pRaZ+EfGLP7+I+EV87U8MZfDll1/S
J598Yu6SPHnyxPy1oTt7Q5MO0Wp8SsOl+VDozuiNfBHNqd+b0tp8TO0R3S4G1OI/o3mfelP9TZvD
LyQ8RTTv98h8nMD+VrQa0yX/WEaQcHm2aNPodkGD1orGp0NyXyGEv79LszcT4m/4K5Z7quXexFd9
sUMmP3zSZ5/092MTX4nX+HJKS/OudrtLFxcndD0srw/p9G+PbmkxaG2eTeXDs8DwsVwxxfrg4pX+
DlYWwY37fjjpT1ZmGwf3M0MpfTC/4am3WWUmjvvOdzzw8qgISU9H/tR7pXy9uDinp3c9Jy1Cw4ey
eb+k287y7mLzSHSyz3mbHShIflevNrK0+fMLuhp0lJ67+RuuPwAAAAAA+/EfzP/Ns57S5TxSf7YG
C3rz5o264k7w6ibXCFzerdT/rc6EFuY5uWZd9XFFrGl6I7/TocntjGYzfY26bf11MEu6juO7kVvi
u1rp+FSFV/rskf5+LGnYn7P5xrQGNFls5FgsuEOtesIOtcuzL/76sI9+ts5esLlQBW/pvU5OTrs7
Y7iu6Z39LHrPIRwOlP7r6SWpn2UdWRQm0AMvj8Fw+RqvVPlKv1fK12CrgIWGDyWwvLss79gEFzhv
neeS6RMm//rV6wxZFmycd9iQrzZ/AQAAAADKcDhDnFlPe9SXzpXqMRn4ZjXu02nR1MxySP156rk6
kN8R+Vod6nT0dXZivitBHF9zz5Gl1bxPwzt7+66aGRfP9Cmd/r6wcdfrj2m+ipw4y0+s1CxVOq61
y7MvvvoQqJ9ijI4r1+c1vXqtX7i626SdNQqzdO0w6c8G9qUx4NjAKjROH3h5DIbfa8uXi5SvOefZ
VpaFhg8lsLxvECOen9uVQCHyG1kSQSVc/3STvwAAAAAAB6SypelgD+zyx9X4OAxOcADM0usIOnBw
UB4BAAAAAEDNHHRG/NHRHdHtrEttZzVtWz4zy3/dmUvwyOhe0KAV0fwaOtAYKI8AAAAAAOBAYEa8
SeJNiTLA7Nsjpc324BVN3I3jQDOgPAIAAAAAgAOBGfEmWV5n++DOx9RHp//x8jSicf8URnjToDwC
AAAAAIADgRlxAAAAAAAAAACgQTAjDgAAAAAAAAAANAgMcQAAAAAAAAAAoEFgiAMAAAAAAAAAAA1y
jw3xLs1ub9XxQwAAAEA+aC/AfrTbbXJOOjww0OfD8pI+/snP6Ds/fGnuAQCgHJUa4t3ZG3rz5g01
1ja0WtQyfzZLm0a3Oq7udcsN46xbU2Pd5oZ3NqPZqOv3fs/w7e6M5XbiIXEofEaO2+Jn3HjPRsTR
zkbkSLx/RqNaEqg87dGtjocjmP3MvdzvweHIyi9wvOTl17G1F43LA/ai0fxqj+hqsaCr2uoc7lPM
km3Ozvqtqf6PHPMoMt2O/PoeNXM09f+HLfq6+RPUy0Oom9vdkRo8s+Vb6TD3h3P7zjUSmp5oG+vl
Hs+IL2l4eupx1q81mm89DUA2pNPGKT/rYwC3uGHsTBa08P4tX9iYXUyo0+lQ5+zEfFaEX3gpXItJ
R9rzDRKHwYQWmSVO0nJBkwE/Yz4RWp0BTS4ywnPn5VbkSAamweKYCnSXLgYi4IpuHuTxYaH6Xzf7
ynPf8uvY0r9pjiW/fNuLunns+gC20e3qINFQ7uJY9LlpjqU++YK+evln9M9/+4W5B8dJaH1bU/3M
NsViMuC+cLKMt7g/PPHoD7dHMql2fxuM+y5/3cBHPIHM3rIhfU70+qZPp9LQ8dUfRznGaUTzvg6j
wvXHtFJnErfY2Jzx26pAKgY2Zs3dbjzDs5F8bgKtxm5c5xwrpnO+VRF1Z9xZUPVIlHxG4v1eBXFg
Oa4G2mBfjamvwvZpPNeHNnfOj2V0/VylVTS/5q7NhvW0t4mfkRkcnrz8AscJ8gvcb9rc7t3SrWnL
WoOFXvk24varqgas/YLOdENJY6c/0XuQA8P7gfoE3Fei1ZzL96bfrPrD2mCgzqTYXnj2tEOdp8/M
3f3jvstfNzDEY4wB2+LGsDek6XLTCK6XQ22MdSaFI1fr9ZKGvVMuXHLXofO9R4BEJm38RvM5N9O7
CAj/7GlsJA8TcZ3SjXqwRYlykzDce8lnJN7TVLPodi6GS9Kh17ScXpKya1sDyppEb5aHPhv+0HiM
+dVWvqn3kyby6z6nDzhuujR7s6CJtvzUILt0piPpCgy4/aq6Xxm9p7dohgpAew3uKWxD9IZTWq5d
veX+8ND0h7m/fYJm7NHSiCEuI8p2ibe1TV2fA7UUPLEMPE8j2dCU0WnZpMRemZaxGKT2fXYWV2ap
7Wf6ch9tj65UuNV4mDnSun71Ws0Ud57vth6Xd9oEbp29YEn2wBizERvLvek782EBIeHfvtcz375Y
w507JNceQ9HtF2fG0L9LpeeaXr3Wv9zKrXlkZYLkb73+5HWMrmf63Bc5AbW7Wqcdvdzfbyhc/2OU
T7/rx1TslpHv9+Q+sYc8DkX5levDlOPfWK7+qTu+0vHn77RQ/Dv6+cViocJn+kSG5BfLqPZ3cPWT
w0sdmg6/SR8rh/19535WvKqlbPnKai80oenj214Uky+PiFGv/vvWJwn9b4tM9hkJr8NkEljefSlf
vgLrzwyy8ive8yMnMay8rg5Z/ZWB597wFcmir+huSsOhrJbqe7WDuYjblo3jwqwcaw1oYT9LyaLx
1+ey+hCSV01z+NnwNn30w5/Rd2STNnvlbNb2zR/+C/35F/9CH3+fb04+o49/ou///Iuf6c+y4P7Q
Nz/9Mb/XhtXh5Te+YYJYNu+XTeP039/5VPLKuf/hZ1vP0YneZM59/8efbr8/lEr1jT9T93l7Eux8
f2h9G14/l63f8klOfEl9pfde2n5Xm+tsVQ9UVDZD5fcJ36T8D4HaDXFpFCfK90mWcfdoayDzufhO
uD7H4qPMHauc0vvufURRJBffVLZZSZteKAvWNTJ1oxcr28VT87kHyzvSk8pPaa9B8/WUev0+dwI8
m52Q8OtXpOxhNcu/KRDSsVQz3ymDu32iUzp6/crMbhfz7KkJ//6t+t9l/c4Y4jlLVVSDK3kr/uS1
TZtXP7oulU+mz/1kkd1hks7YYqJ8A5OPdGhydYCl+1LBKp/+hDTaLSOjUdTxzfN7uuAUrpKaZkMC
6p/m4ntCoytxL4loNR/TeDyn1SraLi9B+cX12ZXZ3yEhPuse1wELMR7NJy6dibxf/90aXNFs5tx3
ila1lMuvne2FwjN9mH3biyJ56taH4PpEOJE6RWQy96IPkxx/x8DyXorg8hUY3xR5+bWe3ug2OcPl
in/YrPZK6qpuw1Z0l9mcrr3awaoJ1ucAfYjT39zbvLo93/krDXAcs+G//82/0R9/Kxff+GzW9tFn
9J3PP6UPPjT3nKYfDH9GH21t3cNG/v/8KT17+T36ehxW4N/47o/o2z/5MX3TfOLywfBH8bu//vJ/
08c/dO6/+yk9cY3+77OR/7l87+Yny/NS3p9htJehAn2bPTe3WYTUb00QaL9s84xMVznB+tUNvaYz
bkf0IDP/hOqry98LrrPP+NubVxWUg1D5PcM3Jv8DoVZD3KdTJRuKRdyZ0j7E4qO84tDyRUaDKUs5
pkMaDuW60eEyWdO0t/HD0Es/RAb7mb5ie9Uuo47exY2r8odm5dHPXNJ77lxllJcc3hK3l0wFy00S
S1k88A4vaaR9VKSjowccZPO2Abd1c+r3pomORmxYv1srY30za6FH5fOiKeFDsYa6kGXIuxQdKVO0
ZLXy0XXuzF3poVR+p+tzr/W5taXPXZrZmZBIfIc2ernZa6AsgfqvYHlUBZv0/z+1smy5EpjBK8Yt
v3KJ/PPEpgFl5ElS12yIf/3TYHzZwD2LxnTa6ymXj+XSzMIlHgjNL4Z77xK278ohsqvwOa40K5aD
w2l3G250W1w38L3dNyFvhVCZ/PIzwhmv9BF824tsiuWpWR+C6xNNZ3BGkdUHm7ecb2cv0oFL6E8J
vMtXyfi6FOfXkvRCte20yF+9JXTIYxFcODJobuJ42jf7snA74OrRto94uD5760NB+ssmtIfm8LPh
wpr+/e9/QF/9rVx/R380nxbxwcv/Rn+c/SX9s2zs9tnf0G9/I5+y8ftfM5T5txH9jsP+6jMOK+Hd
Zz78Hn2oZrxT/PJvVLi3v5Qbfu+3/p5+xfe/+kJrxwf/xc7Yv6SPh2zks9bIb7jv/516f8poL0lI
/aMHViRPk/VDi+uMPPzeH1rflm+vw+yXbaxey+8lurrrJU3Nyhu7r5Jgf0svczcf7kGo/N7hG5L/
oVCbIe7dqVLLqK0PseTfkC5VxmUV3powy65jo8+OkK9ujNxcULXj9MOi/YyeZzSyrdZTyk16NSLG
BmT8mJ1RK5hBkeWPYrTnzLptIT75XMmOucLN37CG33kro2uyS70sk029uctyLq5yKsMaZsPjzpzo
8+adufrcfa4rYOl89ZKVkvK554qqGsk8MfJE80tucFxhWBaj+9lGV0TRu7cJWUX+qVS05n5/apwN
Ca5/mogvxzOr1XcJzi+uw7hhlLBJNzWW3YTPmlG2deJbPbLIH+jBSnewbJvw/PJuLxQe6bMn/vLU
ow/B9YmF26xYH4rytnR5D8SzfJWOr8Env5bX2uBtDdzVClZX+bnUWnMbvjOR9uVCD9bfN0dOX31w
9oxJpz/3tQ9MjfV/3fzy7+irnxuZ331Bv/7HX6g/v/7hf1b/b1jTr//2L1TY37tehYXPEP3hN/+q
/v/9b0RTmd++o9/L/a//Td9bvv+cPuD//vDF/9rII/D7vzLv3xjtexBY/+TXDzn4vr8pPOu3TBKD
X5e5bcyJniXUdZfXqUkBhMpfIr61yv9AqMUQ75xvGkXxryqqO8ssXa6aeNm1nb1NG+ZCqE91Jq4v
insdYmkNG7JqWSJ3QJwZEbVrekuOGMuWqcP5ujWDIl+0BpWesSqd2aXbQUzRVUtktewyqy+DAQn/
PpOnmcSNQNYMyH746nPoUv+6sfLIrsBb+qnWFaWxvv6yNMw+c0vKr38/B/dtjiC/Go2vbNpk/swj
PL+ELB/xovAsSmpFS1Z6bRGYXyHthcIjffbBT55m9CG0fVxlr6Peopz+hBMqf2h4wVt/rDsWa2c8
xmB1NXpNWysllauXrBCQ9kWviFPLMDmNilaBHROh+pCV/nbPm4NRW/3fpo8S/tgbv+ntpePl+N0/
hRxvluUjztfwe+b7bf7466TSWsM8zTc++o/q/6+//Gny3TveH0oV+mbLexa+72+KMvWVgo1wWWKv
UiE1+JWge0GDlh5c7MnKmYpWKllqr59rlv+hUM+MeDxdyp2UHcdUlVm6fBDW7wIMcev3EdGxRm+z
1OsytUM8dz7UEHgr0z87cwbFDJlnFUS1IZuEEaO9l70RXjhdei7Cy4oFlmU57KlRe+XDqjrB1uc/
o3PF3420E/zWDMg+uEv3fQgNXzdWnkJaJ4myLEe8qaVJccFocdHv0EB8OisblKknvywh6d9MfP0I
zy9ZlZLlI+6Qyl8vtp4pkV8B7UUjeMpTpz5UXj+k8qlMeS9DI/Wht/5sVrbpcFZXpSnJWYEkbVdP
L7GUiR91GokyzCv0oz8EOfpwLO3Rhnrr/4PxrZOUT/ZL+viLLB9xh61nPDDPfCPhF55Dmff7Ure+
VVBXlaGU/LJC1DHC+7mruzjcRJaCm9ny9VTNPu866iyEUPnDwtcv/0OhpqXpXGmO/WZK83fOPjLa
J7rg+BCPsqdnblxfFPfymAWqmNCK0C5NDQ2fZZwXjYZ6YfLCfX45lI6SnZ3SO19mdq7UCB3/L0Z8
hWkex9dTn0PD142VZzXO0k9zpfYNEGRpUs/qdH9zLmZy+ece1JRfltD0rz2+noTmV+yLFslZxc6K
FrnMQFollMov//aiGfzlqUsf6q4fypb3UJqpDwP0J95I9YxedDdHbPpOtEXvpsowV0VG3lFP9jRO
3fpWmlrr/zX9+q8df+z4+gv6tcchNVXyjU//h1o6Tr/5Bb39zPHhlmuml47vg126/ruZ89709def
q2XtTXC0+hZIsPzKCJeNRqUp1kZ4rlpzPzc9Wy6Dv1L3VJVsofIHhW9A/odCLYa4Wh62dGZKB3m+
uvxdHYZaIPHSCqsdZhl6QjbrQ+VBV03XsvxHsuy4CN+CZY9vCw1PneepDqmzyVGBUd/udqnbzdmI
bf2KbrjjdZmY7pZBjr5aWr9ayeZnfdoeaKx/dN1Xn2Od2/eIu4qw8uzlF7qW1Qlmd+JK8M+vvIbd
pn0ee9U/lcfXn9D8sgNvq5th6izT3WnkT7nyFdJeNEFpeWrQh7rax0rKuweh8peJb1h+Lena+DQO
ZK8T+ajEkmdd3ySPHLrPxO1RRoRsf6Z5HuhseAZ2xvp3//gD+vdUv8guK98H6zNeiR94BRynvoUT
Vl85Rvhcn25UaB+sZRPSbb1fDoeVDUrVWj83IP9DobbN2hTLIenddbnRyzuOSfn2bvyt5Iw6vYFB
RK8Lt7c3O5NvGXpp1qTLfIvOLnL8utKGNyuQWsEW7wRoG4Ri5Hw82UBMu9gd98Yi8Vnn0mlxfBrV
jujGRzBRsIx/nYRPH3dmwyf8dxx/vEnsTyc+qvq8dq6Jcs9h1cdaTGgyWeTMbnCHlzteKXuCWZMs
rZeNztLGhqLk6HrcaMgsV5Y4zGbgIeWrLpvGZelzPDMzUEsc3fcqPdpxRrM/HvovWHlE/pT/oz33
Mbkfnui69od1Ysv5a3cBzcNTHiEgv7LySHTTboaSi3f900B8QwjMLztQIUtyN7rGcRnZ+FbAvrNX
Pu1FaXzbC4dCeerVh+D6JJTg8l4Sz/JVSXw99Sf+LUW+kSfpkP0OO5ic2um4UUrocxGuPqTS3zTv
1SH+sWo/gh1749Q6G74v/0p/kN3Gv/s881ixUOyM9Qf//TP6Zuyf3qZvfPpj+k8vJRH25Od39Dv5
/7s/2jqX/BsnL9X56Lnnm9dBQt+S9UO1+hba/gaG96zfVHvxRoxwfUpFrk94FfiWL8FbfkNoeOBF
vYY4s55e6uMAxODIaNlXqxV/NVE7X8smKPEZdTsrX+vvxYYed4hmM31lbZQTG52sRPZ35IrFic/U
3jRqaqkzP6YP9b+ip5HZpj8BN/jOof8LtfmZfM6Ne78Kf+g2d4hs3M51urTO6MJ+5hQITUD45bU5
poHjoJZzmzjYWQI2lC8TGWDT2y7/3g6f7M9w+Eu966wUXp3u4qOqQnP2+i17zBqBK8ceo+u20RBd
c/I7oc7G/0VwN0ASfVZs6fOShvbYGi4b7ns3elQNO/VfoWeURJ50OJFHzjrfwvjDbsJu8rfomBk/
eQLzKyOPRDcjrl+KCKp/ao1vKGH5FRsfCV3juAy4a7AjjfzYo3w57GovyuPfXrgUylOnPgTXJ6GU
KO8l8C5fFcXXS3/sQLuQuY+I5tmFlvtW6ckLesqftZ6PaHarXZ+Kdjqun3L6nI9dKbCd/nJueZV0
L0yfgf/N31m6mvqkPtZmN/Pv0bOf/Jg+/qG+Pvp+ufT//f/9P/QH+ePDT+nZ53YjtZ/St19+j/74
y/2XphN9QV/NfqF+Q51L7mzW9u3Pf0Tf+m415d0fV9+S9YPUGVUS2v6GhPet3zbHlCX7z+6VJ08o
fuVLkyd/lFPfhoYHftRuiKsGwzHItpTtbqg3vDG3UvGu5BzLjCUNW8gIuDzLHSI5306uzN3x1Ug5
h8ttTzaN2uYsXf5MnYMn/nI9krM71bmfBXJJgyWjXf3KfL6f0VMTL9mt3BYuG9fOVmRDwnP85Bzx
rXSR9B9vnSOu4HSUM09ls5oNkfZ1yQrPHR6966y5F6IVyfmMRdmrOlP8UCT+rD564MNeo+tiNMuZ
lbkKpNjevIkxOpGpNyZ9VFzNR4KK9+X+/pkxO/XfwOGsPC4ij+xOn4yCSZOU7Da+hSO+PvIE55fI
I7ppbkWPReY7c5uHd/1Tc3zLEJJfRWVxVxr5UNns1Y72Yh8kH3zaiwR58tSvD8H1SSgh+lOWgPa9
mviG6U+R+9jyWrePshmcLGPnJpU75/y/xGFXHjdBKX3OZzv9dV71bpL6sS/W0BFy3dOOejbc8PMf
0K/EuP3we/TBd831kfkulHef0/+zZ3pbfvML+u1nf0Zf/ZO53xeWV37jt79M5ucf5Hdmf0lf/dx8
0BCxvpl7q29xe2SOytwbz/o2JiT8PvZLTXiVL0uO/LJsPpPQ8MCLr/2JMX8n+PLLL+mTTz4xd0me
PHli/ipPd6aXcMtmMceSh1ommc2uypAGx0GbRmoWA3l7P6g/v46x/rm/oHyBJMddvjbLRL311Rw3
xA8c3gB/EIhLxzrH0EJ98qjpzvQRiqvxQQ3aIo6//1BUvsCx0cCM+P1BlqOPV7Ic/TZj2Te4v8js
v17ZgEb9PoD8ul8gv8B9oc2daL1h0lHPtj54iowE1CePAtlfaMb9bKejnbvnEAgERvh9AoZ4An0m
db9/Q3R2TlfGD0Jd9/nMUAAAAODRIrOs0pYv1EyWgI4+AIfkqfbDdvfHiU8yGGOlGng0wBDPYL1e
qrNClU94hWeqAhCOLKPcNFS7r1k1u+gCAMCDrH8i7ucH+sDLHgvcD8CydAAqYnmd2pOA4Ru1RxGs
cPCIOJiPOADAB+vP6MuKxqdV7NgPAACofwAAAIC6gCEOAAAAAAAAAAA0CJamAwAAAAAAAAAADQJD
HAAAAAAAAAAAaBAY4qAkXZrd3qrjJwAAAAAAAAAA+HOUhnh7dKt2YL0dPY4Dw+5tfFstfdQEAHtw
CP3vzvQuz/d5HEnOXJXBML1btb5ub2fUDUxGpH85qkp/L9pdms1mNBt16ztG0/7GbLQVB5tfhVcV
mSkyqGPGzMXpWYVahurbQ9BPAAAAx88RGuJduhiIebeim4McFWLPG72tpAOwm0PHtyxLGsqxbjhm
4pGzb3m5b/ofGt+a6pPuTJ252mklh8JarQ5NFiEGBNK/FJWlvw9snC4m1Ol0qHN2Yj6rGk6nK/Mb
nTMq8yvR+7fmr5K0R3Qr8XSTlNNzUHl6AgAAAMfB0Rni7dG5Oiolml8/iiNQHlt8AXCB/pcnWs1p
3O/TqQyIqatP45U+lLUz8TvPGelfnirSfzcykBByfFg52qMrGrSi5Jm+DsuhjWP6GtNKhYjo9at9
BnJkIGCgV1itxtRX7+b0nJv0PB9xCAAAAOBhcWSG+H2dHS5Lmfi2qd1GlwQ0RZ369tjKe4Ush9Qb
Tmm5dtNtzR9fkrZdWnSyM9uQ/qWpJP13IUb4gg1kGSiZG4O3BtojuuIfWY0v6bX5yJvucz1IsLqh
vVSo/YLORBU5luPhklNS4PScmvRsDegCs+IAAAAeGEdliBfNzmx8tjY+ZNqn0bmfZYyaK58z14/v
NsPPzi5flEt3fKQjJUviNs9lLI9jA6U7mtFt/KxcegMznz7Y7tkoll3eKT8c+84taLFYqN/K9On0
iq8Dhx/NWOY4fJGfI6eThJVN2uyVs2bQ9bFrdzmN4veLPAWpEyh/vp9mwW8E4Pv+XJ9Cjrt67jap
m6HpUzY9VVhXPzkus1wnVl99K1leUviVd75hQ2HjNyry6zBZZKZNTh7E7Hx/aHzD06d0ecmlRU+f
mT9zQPqrwIpDpP9OjHEarcbUm74zH1ZP92JArWhO18FLIjidz5UZTqu74IcTtF+ccYoxq7uULq7p
1Ws9K97af2RDEZq/1egDAAAAsM0RGeJ+szOdycaHrDW4otnMue+kRs2lAVU+ZyaAokWdwYQWeZ1C
b7gTcrWgyaAje5Y5tFgOef+upYkhs1En2n+PIlrNxzQez2m1iqiV7umFxpc7wBJ+wAmYeEL8HK+y
0+fde1m+aJYw8u8kop7Fc/Gl5DQyt1oeNuyyevOB8ssmU/l+mhc70n83db9fEZI+QkB4LX9KP/mm
M1ns2O3eU9/2wlP/T0RHJQ/MvcR3ku3vG8fX3Nu0mT03t1kEvL8RQvVhi2f0dPNwAUj/TBpLfw/W
U+r1+9Srcx8OrnMnnYjml1MzCx2AM4u9px1Oz0yiZfmZr98ZQ7yK+qfG+hYAAAAI5WgMcW9fxdVY
+aaN1To9bhRbc+VP1re+ZM9tA9mlmWpA2ZgYO358/TEpN77EUrc1TXvW561vlhZy56RvP9PXVn+I
rVF5d98Nx+/XS+k6dF7Qm/SOr9AZ0FnE8e71aDhd0nI5peGwl9ooLSS+AofnDrDqYETi67iJQ98+
s4UsFRzyb8t1w7+0G9n8J2JjTvv88bs549RznfNUZztU/ja90L3AxPut/PPVe/Vdeep+v8Y/fTTe
4dt6uakQzTfpacO3ct6v2KlvJcuLg6/+dwZnFFl9kHRXv9Wisxdp4a1hmcwviW+L0ywPv/eHxrd8
+oTqQxqbrvJ7RXtnIf0Pm/7eJJa+V42uc8suK8+fxS5P9K7O+Ibn7776AAAAABRxJIa4/+ywHTF/
+141h9Jyc7eL+ytm1DzG+K5F80vucDnvXC9peKO97TZGexm4s8fGibw76Sa4pKl5f/4Ivn98NRyu
yKoRQuNrffvYCO/3xNdRfapYyzPDEjMkWahlldbnT8QZ0qXqGac626XzK2IVeJuQVeSfiv+mud+P
mt/vmz4Wz/CbTrKE30i/8/0KD33biwD9ZyMh1gdJ97yyFfuq5qVPDr7vb4pQfXBJDL5cFhhXSP9c
Gkn/46Arq8lYB8QnOxyrQxHNw9e0FyNuMbIMfOeqshKE5u8++gAAAADs4DgM8bgTt3tkPT1inndk
SvtEd4hasows9u8yl8wCVEKWj7jH+wPiq4je067JldD42vDR61dxJ6MOfJcahueX9R2Upaz2GfFb
n9Eo1wfa9R11r6ylsGXeH07oUsy6wys89G0vAvTf1/c01ueC+Gaxr29r1ZTKL0G5mWx2nXYHX7ZA
+ufSSPofA2pJOsfXZ0VWFlaHote012bpDROav6X1AQAAAPDgCAxxu+FLRSPrrRN+48bnrBATthwy
ap/lI+6Q+f6K42sIjW/sk1fzUkDf95fJr/W0p5cKxv38lvLfHogPdAXrBut+vxCa/qHpWXf+hlOR
/qd0ofL47lU3lKeU/DKD6BiB/cIZTqR/EfWn/zFgdCCa02XJAYPuc9EhfkXFA7lqQ7b1koayFLw3
LDdIUEBo/lamzwAAAEAGhzfEuxd6V9uSfmp52KXrq7H27cq8euWXX8e+gNEqdZYsX2y85XIk8bXh
q9qJNg/f95fNL1kq2LP+oJwP9hzf1iBrMzXXd9S9erl5Efb+cELTPzQ9687fYGrW/6OLbyDB8isj
UJYYS1WkjcDCZEX6F1J7+h8FZkO51oAWiZVB6R3m85aGd0nb4b6uVbuJ9SdjlrlotUUoofl73/UZ
AADAcXNgQ7ye2WHBLh/bzw88HzsDtLoZps6S3XQctjme+MbL685e1Drz5NuxqiS/OB+WwxvuHtZE
wfvzDJF8XdCEdjzrDl8v9et/Vnzt7N19ICy/HCNwrnfXLjaLkP67qDf9j4W39H61olXGpXOR46Pu
s11U4kHoCjdpW796rX+78zxl/DubZlYwOx1aH4aGBwAAAEKoxxAXf7lc31uHmmZnFMs7bTB1Jlvn
erfb+uzs7BNI1qT7lC06u8g/v9oaXp3zkXPmdpujPos37NnimOJrw8usyK0bBx1+lnUmewLuzEkS
bHWcUog8zjngciarTp+IXrvOhcH5xTIaf+1NWPHZt7sW70vY+2NDRGbKzQNyBnmuLlh808fiGX7T
sZXwTgw4/KLo/cH4lRdFU/qfSp/KtoRQBMRXERjeWx9YP9+IEahPGfDySUb6Hzb9m2Jn+ysbjdrT
L9zrmvSR3RzXa7nPWjG2MYy9/ft9+gPrV+a3OzSJ63+pb6+0zhadc+7b3xC889cQGh4AAAAIoBZD
vHth/OWk85O7s2h9szOaJQ3NUSPqXG/VUOtrsdBnZ+exvFNdyq3nXEMwNnTYkJ2oZXxyLdjI4a7Z
Sj+f5Njiy+H784w46PAFyWPgzpza4Zg7Tmywzmb6Sm9kJrMsLTkH3L6be+Xq1VvGQIn8Mv7am7Di
s6/Dld6EyCXk/dYQkfQwaSlnkGfrwgb/9NF4h19P492q3Q3wJLyiQmPMp7w0of/XcXyT6SNpViV+
8d0QEt43fzfHZLmbCSYvpL/mONK/DJxnpl6dzc61HK0zurCfOQaii1/7W5ISZ4f7ycPtyaVpj+J8
2tS3q5t8N7KQ+OblbxRY3+aFBwAAAEKoxRC3HR8hdzlZnbMzFvHvVWc+6w6iJYpWNB/3KXdPHX6u
P3c36cqADR15d+LV8t7+KQ3vzL3LMcbXxEHCJ6Ihfu+XHv7zkk5iPLPBKuetynV2Yr6z3Jkw5pbf
Tis51zor8YPkl4GEbdkl06qZoQp9vx7Y2Iiuw2XqgktI+ggB4bc3m2OM/LnvL4NPeWlA/+P4mnub
NnEemKMO98Ynvi4h4UP1wRek/2HTvxTP6KmpVzudVmxs2rq2s1XZarza35JYozdkoNNbnqI2teDH
guKbk7/iVpBJaHgAAAAggK/9iTF/J/jyyy/pk08+MXdJnjx5Yv4qQpb0rnM6Xm0a3crGMBE3svkb
ZT0cHlt8ucM2e6OWpMrma+izbBOaPvc7PQ+s/92ZPgJvNT6QQbWbevMX6b+Lh1dfFbW/h6BueY4t
vgAAAMBuatysrahRtLtXPw6j9PHFFwCXhvS/O9L7CzirU8VP/1YsLObYzqxuDqT/4+PYjNK65YER
DgAA4P5x4F3TAQCgKp5qP2B3v4OJ8R9djbEyo3aQ/gAAAAAAvsAQBwA8DJbX2p8z4WMqPp36fGdQ
M0j/DGR39c3AxO4r7+xuAAAAADw0avQRBwAAAB4z9pgzX1Y0Ph16b4QGAAAAgPsLDHEAAAAAgAa4
vv4H85cfFxd/Zf4CAADw0MDSdAAAAAAAAAAAoEFgiAMAAAAAAAAAAA1yjw3xLs1ub9VxOQAAAEA+
aC/AfrTbclY5AAAAUB2VGuLdmd75tbG+Tqulj8ZpnDaNbtO73b6hW+7ozbo1NdZt7kjOZjQbdf3e
7xm+3Z2x3E48JA6Fz7SpO+Jn3HjPRsTRzkbkSLx/RqNaEqg87dGtjocjmP3MvdzvweHIyi9wvOTl
17G1F43LA/ai0fxqj+hqsaAr1DkAAAAq5B7PiC9peHpKpzuPxbFG862nAciGdNo45Wd9DOAWd/Q6
kwUtvH/LFzZmFxPqdDrUOTsxnxXhF146MotJR/qnGyQOgwktMns3kpYLmgz4GfOJ0OoMaHKREZ47
L7ciRzIwDRbH1Nnt0sVABFzRzXStP3pQhOp/3ewrz33Lr2NL/6Y5lvzybS/q5rHrAwAAAAAs8BFP
ILO3bEifE72+6dOpdNz46o+jHOM0onlfh1Hh+mNaqTN0W2xsVnUerHTcQo6/8QzPRvK5CbQau3Gd
c6yYzvlWR7E7W5DqU3OIxDMS7/cqiAPLcTXQBvtqTH0Vtk/juT5kuHM+4hCHpz06V2kVza8TRwat
p71N/IzM4PDk5Rc4TpBf4H7T5nbvlm5NW9YaLPTKtxG3XxhIAQAAsCcwxGOMAdta0bg3pOlyM3uz
Xg61MdaZFM7krtdLGvZOabySuw6d7z3lITJp4zeaz0m9tpCA8M+exkbyMBHXKd2oB1v09Jn6SJMw
3HvJZyTe01Q3u/2CzvQP0Hi4JB16TcvpJSm7tjWgrEn0Znnos+EPjceYX23lm3o/aSK/7nP6gOOm
S7M3C5rokSQ1yB6t5hRJV2DA7ZfbPgIAAAAlaMQQlxFlu8Tb2qauf5daCp5YBp7XsWJDU0anZdMd
e+Uuobbvs7O4MkttP9OX+2h7dKXCrcbDzJmb9avXaqa483y39bi80yZw6+wFS7IHxpiN2FjuTd+Z
DwsICf/2vZ759sUa7twhufaY2mq/ODOG/l0qPdf06rX+5dZJXurIygTJ33r9yeuYrcv0uc91oGfa
Xa3Tjl5KvIse2U24/scon37XP77YLaPdHaXCW/ndJ/aQx6Eov3L9RTk/1PtvkyswytU/dcdXOv78
nRaKf0c/v1gsVPhMn/iQ/GIZ1f4Orn5yeKlD0+E36WPlsL/v3M+KV7WULV9Z7YUmNH1824ti8uUR
MerVf9/6JKH/bZHJPiPhdZhMAsu7L+XLV2D9mUFWfsV7fuQkhpXX1SGrvzLw3Bu+Iln0Fd1NaTiU
1VJ9r3YQAAAAKKJ2Q1waxYlyEpZl3D3amhh5PtN+yuZWOiidAXeschrMd+8jiiK5+Kayzdra9EJZ
sK6RqTtxtkGfXTw1n3uwvNOz0a2ntNeg+XpKvX6fOwGeLX5I+PUrUvawmuV3Oh/csVQz3ymDu32i
Uzp6/crMbhfz7KkJ//6t+t9l/c4Y4okp9w2qAyR5K/7ktU2bVz9bJ529TJ/7ySLbADA+9AMuH8lH
OjS5OsDSfekEK5/+hDTaLSNlyAo6voNUeCP/4oJTuEpqml0NqH+ai+8Jja7EvSSi1XxM4/GcVqto
u7wE5RfXZ1dmf4eE+Kx7XAcsxHg0n7h0JvJ+/XdrcEWzmXPfKVrVUi6/drYXCs/0YfZtL4rkqVsf
gusT4UTqFJHJ3Is+THL80QPLeymCy1dgfFPk5dd6eqPb5AyXK/5hs9orqau6DVvRXWZzuvZqBwEA
AIAiajXEfTpVsqFYxJ0p7UMsPsorDi1fZDSYamnzkIZDuW50uEzWNO3p98nItXbxFRnsZ/qK7VW7
jDp6Fzeuyh+aG2f9zCW9586V2z8o5i1x/49pUe6kry/rwObeO7ykUZ/G3IGVjo4ecJDN2wbc95hT
vzdNdDRiw/rdWhnrm1mL7Bk1i4QPxRrqQpYh71J0pEzRktXKZ8O5M3elp7r4na7Pvdbn1pY+d2nG
HWb1RDSnceZeA2UJ1H8Fy6M6zEn//1Mry5YrgRm8YtzyK5fIP09sGlBGniSV55fBv/5pML5s4J5F
Yzrt9ZTLx3JpZuESD4TmF8PWqITtu3KI7Cp8jivNiuXgcNrdho2iFtcNfG/3TchbIVQmv/yMcMYr
fQTf9iKbYnlq1ofg+kTTGZxRZPXB5i3n29mLdOAS+lMC7/JVMr4uxfm1JL1QbTst8ldvCR3yWAQH
AAAAlKI2Q9y7U6WWUVsfYu6yLId0qXuGGZ2HmjDLrmOjz46Qr26M3NyR0o7TD4v2M3qemH7QtFpP
KTfp1QwHG5DxY3ZGrWAGRZY/itGeM+u2hfjkc4dwzB3EXq7i8Dtv36hlqQt+99aMSZflXFzldN5q
mA2PO3Oiz5t35upz97kyVLjXqQY9HJd77XM/TA6E1I6RJ5pfskHgCsOyGN3PNroiit69Tcgq8k9Z
fl8DbDc1zYYLwfVPE/HleBaNSgjB+cV1GBurEjYxVieym/BZM8q2TnyrRxb5Az1Y6Q6WbROeX97t
hcIjffbEX5569CG4PrFwmxXrQ1Heli7vgXiWr9LxNfjk1/Jab0TaGrirFayu8nOpteY2fGci7cuF
Hqzfe2QdAAAA2FCLId453zSK4l9V1Kkqs3S5auJl13b2Nm2YC6E+1Zm4voLulbN0sFbYkFXLErkD
4syIqF3TW3LEWLZMHc7XrRkU+aI1qPSMVenMLt0OYoquWiKrZZdZfRkMSPj3mTzNxBrBmTMg++Gr
z6FL/evGyiO7Am/p50SlVgrr66+Xjlo9Vn79+zm4b3ME+dVofKP3tC1VkvD8ErJ8xIvCsyipFS1Z
6bVFYH6FtBcKj/TZBz95mtGH0PZxlb2Oeoty+hNOqPyh4QVv/bHuWKyd8RiD1dXoNb1KP6dcvWSF
gLQvekWcWlbPaVS0CgwAAADwpZ4Z8Xi6lDspO46pKrN0+SCs3wUY4s9Ir+SO6Fijt1k6epnaIZ47
H2odaivTPztzBkWvW83sKKkN2SSMGO297I3wwunScxFeViywLMthTy2dVT6sqhNsff4zOlcyGKKd
4LdmQPbBXbrvQ2j4urHyFNI6SZRlOeJNLR2NC4bx6xefzsoGZerJL0tI+jcTXz/C80tWpWT5iDuk
8teLrWdK5FdAe9EInvLUqQ+V1w+pfCpT3svQSH3orT+blW06nNVVaUpyViBJ29XTm7PJxLw6jUQZ
5hX60QMAAHi01LQ0XWYq/WZK83fOPjLaJ9zMexKPsqdnblxfQffymAWqmNCOj12aGho+yziPZ4N9
ZteyMHnhPr8cSkfJzk7pnYkzO1fdC71rcex2UA1xfD31OTR83Vh5VuMs/TRXat8AQZaO9qxO9/Xq
BCG5/HMPasovS2j61x5fT0Lzyw68UbSiMcudCGcG0iqhVH75txfN4C9PXfpQd/1QtryH0kx9GKA/
8UaqZ/Siuzli03MhAbd/U2WYqyIj76gnewAAADwSajHE1fKwpTNTOsjz1eXv6jDUAomXvtlOgFmG
npDNHt/lQVdN17L8R7LsuAjfjo89vi00PHWepzqkziZHBUZ9u9ulbjdnI7b1K7rhjtdlYrpbBjn6
amn9aiWbn/Vp24203tlVwVefY53b94i7irDy7OUXupbVCWZ34krwz6+8jrxN+zz2qn8qj68/ofll
B95WN0NapjZ03JVG/pQrXyHtRROUlqcGfairfaykvHsQKn+Z+Ibl15Kujc/5QPY6kY9KuLzo+qZF
GeICAAAA3tS2WZtiOTS763Kjl3cck/Lt3fhbyTmievfUiF5vryt2MDuTbxl6adak+xwtOrvI8etK
G97rKakVbPFOrZslbEW0zdm22sWuho2lKiQ+61w6LY5Po9oR3fgIJjo+xr9OwqePO7PhE/6Jjj/e
JPanEx9VfV47FZxHro+xmdBkssiZ3eAOL3e8UvYEsyZZWi8bnaWNDUXJ2dXYaJZZrixxmM3AQ8pX
XTaNy9LneGZmoJY4uu9VerTjjGZ/PPRfsPKI/Cn/R5FHjvJL7ocnuq79YZ3Ycv6amddcPOURAvIr
K49EN+1OzLl41z8NxDeEwPyyAxWyJHejaxyXkY1vBey7esGnvSiNb3vhUChPvfoQXJ+EElzeS+JZ
viqJr6f+xL+lyB80knTIfocdTI5oj7EQAAAAgL72J8b8neDLL7+kTz75xNwlefLkifkrSXemjVBZ
7raZjWQj9lYvFeYv4iNm4rCrlTriZAsnbC7cSKuNZaKVPnKFeX93rfyGE9hwKTZyWhlXND61fsz8
2YyNxo5ucNU5tbJhi5Lr7SZOmXDjvnPnXx9EhgvSJ5jL7uR8GVkU7+/o2tmRNiy8ky9ZmN28E1HI
SUdFVvi2PtM26yeSOpJEGeJWMB898MLGt0zecKf7jZxbnCQdh4TcabLiUZA+melZlp36b+BwMqiS
pxLJ8NlpYpEjiHJ3vPeSJzS/cvLI1i+p9Ayvf+qOr2B+wzfvQ/KrqCxmpFG6Lre6HcfTxil+Jrx8
hbQXmsD0SRPLnN1ehMlTvz6E1CfZsjNb+eQQoj+BhJevsPgK4fqzwT6bmS4GGybiOLy+e09Pz7n8
cPiopc9pL8zjAq6v/8H85cfFxV+ZvwAAADw06p0RV6xpeqmPAZHR7q1R9ruh3vDG3HLzRitu4PIa
0AQyAi7PtjqqsZfr7MR856JGyt1NddLYTVzcs3T5MzmbVvnL9dRZtD35u0CuiH9gNe5TvzKf72f0
1MRLdivXXZRWHNfOVmRDwuul3OOtdJH0H2d3TjgdT/t6s5oNEXdUcsLHu86ae4E7wXJ+blH2rqeX
NOeHIvFn9dEDH/aarVvSkOMxz1cgxfbmTYzRiUy9Memj4mo+ElS8L0sYGnns1H8Dh7PyuIg8sjt9
MgomTVKy2/gWdlB95AnOL5FHdNPcih6LzHfmNg/v+qfm+JYhJL+KyuKuNPJh39nwmB3txT5IPvi0
Fwny5KlfH4Lrk1BC9KcsAe17NfEN058i97HltW4fZTM4WcbOTSq1Ovy/xGFXHgMAAAAeVDojHkLu
CP4B0TJVNZsNjofw2TpwSOrPr2Osf+4vKF8gyXGXL7uaIUBfzYoSfmBvAxwz4gAAACwNzIjfH2Tn
7fGK1BnaM8evDdx3ZPZfr2yAkXAfQH7dL5Bf4L7Qpu7MuBTsvXoDAAAA2A8Y4gn0mdT9/g3R2Tld
vXlDb+yFM0MBAACAe4is2pC2fKFm6oXE5qIAAADAAcDSdACOmuJNobZxNxwEeaD+AcCHcvUPP3Rk
5cvZxE35eF+yXIeZDsfSdAAAAJaDzYgvh7KUEZ1gAEDzoP4BoD6Or3xZ9wntQnEoIxwAAABwOdiM
OAAAAAAAAAAA8BiBjzgAAAAAAAAAANAgMMQBAAAAAAAAAIAGgSEOAAAAAAAAAAA0CAxxAAAAAAAA
AACgQWCIAwAAAAAAAAAADQJDHAAAAAAAAAAAaBAY4gAAAAAAAAAAQIPAEAcAAAAAAAAAABqD6P8D
5em0ODoKHgoAAAAASUVORK5CYII=
--000000000000dc679506125dab7b--

