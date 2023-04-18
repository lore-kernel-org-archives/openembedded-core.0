Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44001C6FD18
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 15:44:24 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.13089.1681832660301450459
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 08:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=aXDpAzME;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.47, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f47.google.com with SMTP id c9so35515650ejz.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 08:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681832658; x=1684424658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5JEyd+YFF1I6BtR1TGc6DRBDNEOIRI7/xq1cpiVIPE=;
        b=aXDpAzMELpEePY2VMUxd7q36YDenf5CGStgSb1e4GBondg6IEEYSjHluQG3GiIIsfm
         YFPalpT3xP2veQVuda/rW6dBV+9xG/Q8Mqc5d7pGTBqUiDBeIFGKNnq1ADkybzbcPfnR
         fRxr9Xo18yWMiXu7QS10OnsZEAE87AzO5t+8VJs2rC1ZdJziy1yfcVPjYa3BFxwdo740
         dSmbJl7jdyDEYwMyQTxppmFZTEFw+n9y6ICoaGvmzf0An1Zbe9ExJh3ShZKPb0CFwrcf
         KB4vArT95Ae3QxK4N0stM0lwucVZDf4FobJNELRDbFh0kAz9hNjjbwZi/uJIZ9kmwOiF
         3Xrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681832658; x=1684424658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5JEyd+YFF1I6BtR1TGc6DRBDNEOIRI7/xq1cpiVIPE=;
        b=HdxI3khQhtM39+PTKOmv7wNvI24AQMZPoCin2CCJ6ICRHMfq5N/2uzvxGyNo5z6sbE
         qv51RWHp+vcJgJihlrLI/fxFrWAAF0pYZ3D0o2fh2abDLCi/ofPF8eeqwY/PagORSGcD
         ZEqKHqcUE+O2n46YbATNdZH/aedpf6vhpsIF+2ROSO2y5MlQ+2A136O4g2AdvLpYnEBa
         Wsd9Q3djZ6IxZ4KOY7u7/DR/FTB9hliUw4laojBCW90iuitcx3D5DJ73yV3BmUOMwDRU
         9Z5oXu8r1tgZkNdrr9cietDZZKbVVE4OaHhR9m23aPRSfkq38U4FCbyQXdibHE0h6GfN
         T7dw==
X-Gm-Message-State: AAQBX9c7z/D0QyT3qq0D7lUHkisO5XktRny9AtQ7XdmkEaQ7T79cCvdf
	HWYNzxk40PbPkIVAOzxu75QHStNFzFOLohBuBiZASd84zMJWnqfThHM=
X-Google-Smtp-Source: AKy350a+HKx42jP6F6wDnAEgPZGnVN1w2rD/We3g/nm2ZoAombhCKPwA/yOuGmxRrNH3KfYBpRtdT5OtfV/OMuRfjuU=
X-Received: by 2002:a17:906:f57:b0:931:3a19:d835 with SMTP id
 h23-20020a1709060f5700b009313a19d835mr5717143ejj.3.1681832658116; Tue, 18 Apr
 2023 08:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230418060859.241917-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20230418060859.241917-1-xiangyu.chen@eng.windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 18 Apr 2023 05:44:07 -1000
Message-ID: <CAOSpxdZWBF0ud-+vDddNYQ5cG6RYDdv6A1-3f3ZsvpPZ+Z=M_g@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] shadow: backport patch to fix CVE-2023-29383
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 15:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180194

I encountered a couple of issues with this patch.

1. The patch file for a CVE fix should have the CVE number in the
filename, i.e. CVE-2023-29383.patch rather than
0001-Added-control-character-check.patch
2. Applying the patch resulted in many errors of the type:

example 1

TOPDIR/tmp/work/core2-32-poky-linux/cronie/1.6.1-r0/recipe-sysroot-native/u=
sr/sbin/useradd
Running groupadd commands...
NOTE: cronie: Performing groupadd with [--root
TOPDIR/tmp/work/core2-32-poky-linux/cronie/1.6.1-r0/recipe-sysroot
--system crontab]
configuration error - unknown item 'SYSLOG_SU_ENAB' (notify administrator)
configuration error - unknown item 'SYSLOG_SG_ENAB' (notify administrator)
groupadd: failure while writing changes to /etc/group
ERROR: cronie: groupadd command did not succeed.
WARNING: exit code 1 from a shell command.

example 2

TOPDIR/tmp/work/core2-64-poky-linux/dbus/1.14.6-r0/recipe-sysroot-native/us=
r/sbin/useradd
Running useradd commands...
NOTE: dbus: Performing useradd with [--root
TOPDIR/tmp/work/core2-64-poky-linux/dbus/1.14.6-r0/recipe-sysroot
--system --home /var/lib/dbus
--no-create-home --shell /bin/false
--user-group messagebus]
configuration error - unknown item 'SYSLOG_SU_ENAB' (notify administrator)
configuration error - unknown item 'SYSLOG_SG_ENAB' (notify administrator)
useradd: Warning: missing or non-executable shell '/bin/false'
useradd: failure while writing changes to /etc/passwd
ERROR: dbus: useradd command did not succeed.
WARNING: TOPDIR/tmp/work/core2-64-poky-linux/dbus/1.14.6-r0/temp/run.userad=
d_sysroot.3937179:345
exit 1 from 'exit 1'
WARNING: Backtrace (BB generated script):
#1: bbfatal, TOPDIR/tmp/work/core2-64-poky-linux/dbus/1.14.6-r0/temp/run.us=
eradd_sysroot.3937179,
line 345
#2: perform_useradd,
TOPDIR/tmp/work/core2-64-poky-linux/dbus/1.14.6-r0/temp/run.useradd_sysroot=
.3937179,
line 331
#3: useradd_preinst,
TOPDIR/tmp/work/core2-64-poky-linux/dbus/1.14.6-r0/temp/run.useradd_sysroot=
.3937179,
line 256
#4: useradd_sysroot,
TOPDIR/tmp/work/core2-64-poky-linux/dbus/1.14.6-r0/temp/run.useradd_sysroot=
.3937179,
line 186
#5: main, TOPDIR/tmp/work/core2-64-poky-linux/dbus/1.14.6-r0/temp/run.usera=
dd_sysroot.3937179,
line 357

I see that the two items are set in
meta/recipes-extended/shadow/files/login.defs_shadow-sysroot

Not sure how your patch triggers this, but it will need to be resolved
before I can take the patch.

Thanks for helping fix CVEs!

Steve

On Mon, Apr 17, 2023 at 8:09=E2=80=AFPM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  .../0001-Added-control-character-check.patch  | 53 +++++++++++++++++++
>  meta/recipes-extended/shadow/shadow.inc       |  1 +
>  2 files changed, 54 insertions(+)
>  create mode 100644 meta/recipes-extended/shadow/files/0001-Added-control=
-character-check.patch
>
> diff --git a/meta/recipes-extended/shadow/files/0001-Added-control-charac=
ter-check.patch b/meta/recipes-extended/shadow/files/0001-Added-control-cha=
racter-check.patch
> new file mode 100644
> index 0000000000..f53341d3fc
> --- /dev/null
> +++ b/meta/recipes-extended/shadow/files/0001-Added-control-character-che=
ck.patch
> @@ -0,0 +1,53 @@
> +From e5905c4b84d4fb90aefcd96ee618411ebfac663d Mon Sep 17 00:00:00 2001
> +From: tomspiderlabs <128755403+tomspiderlabs@users.noreply.github.com>
> +Date: Thu, 23 Mar 2023 23:39:38 +0000
> +Subject: [PATCH] Added control character check
> +
> +Added control character check, returning -1 (to "err") if control charac=
ters are present.
> +
> +CVE: CVE-2023-29383
> +Upstream-Status: Backport
> +
> +Reference to upstream:
> +https://github.com/shadow-maint/shadow/commit/e5905c4b84d4fb90aefcd96ee6=
18411ebfac663d
> +
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> +---
> + lib/fields.c | 11 +++++++----
> + 1 file changed, 7 insertions(+), 4 deletions(-)
> +
> +diff --git a/lib/fields.c b/lib/fields.c
> +index 640be931..fb51b582 100644
> +--- a/lib/fields.c
> ++++ b/lib/fields.c
> +@@ -21,9 +21,9 @@
> +  *
> +  * The supplied field is scanned for non-printable and other illegal
> +  * characters.
> +- *  + -1 is returned if an illegal character is present.
> +- *  +  1 is returned if no illegal characters are present, but the fiel=
d
> +- *       contains a non-printable character.
> ++ *  + -1 is returned if an illegal or control character is present.
> ++ *  +  1 is returned if no illegal or control characters are present,
> ++ *       but the field contains a non-printable character.
> +  *  +  0 is returned otherwise.
> +  */
> + int valid_field (const char *field, const char *illegal)
> +@@ -45,10 +45,13 @@ int valid_field (const char *field, const char *ille=
gal)
> +       }
> +
> +       if (0 =3D=3D err) {
> +-              /* Search if there are some non-printable characters */
> ++              /* Search if there are non-printable or control character=
s */
> +               for (cp =3D field; '\0' !=3D *cp; cp++) {
> +                       if (!isprint (*cp)) {
> +                               err =3D 1;
> ++                      }
> ++                      if (!iscntrl (*cp)) {
> ++                              err =3D -1;
> +                               break;
> +                       }
> +               }
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-exten=
ded/shadow/shadow.inc
> index 5106b95571..8546501a04 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -16,6 +16,7 @@ SRC_URI =3D "https://github.com/shadow-maint/shadow/rel=
eases/download/v${PV}/${BP}
>             ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}'=
, '', d)} \
>             file://shadow-relaxed-usernames.patch \
>             file://useradd \
> +           file://0001-Added-control-character-check.patch \
>             "
>
>  SRC_URI:append:class-target =3D " \
> --
> 2.32.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180179): https://lists.openembedded.org/g/openembedde=
d-core/message/180179
> Mute This Topic: https://lists.openembedded.org/mt/98338508/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

