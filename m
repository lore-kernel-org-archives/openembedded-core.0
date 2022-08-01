Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7EBC19F2C
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 16:55:29 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web09.27538.1659372919828189396
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 09:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zWK5mA2b;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.49,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f49.google.com with SMTP id rq15so15442968ejc.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 09:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AtXikr3V+HqZrn3VTGM9ht+XEn4j/2r1jWqpQFF7nHw=;
        b=zWK5mA2bTn3YXbhhWoyX0u4htdFC9GcNXrKhdVg96+ZKVijfJrQKytbWMg7yFHFir5
         Eu38UQDpLEHMsDx1C+UgwnzD27bqcbQfySsi4t9bmBwZtp8C5Z211t8w0d/Yv1Z4mEAo
         cQHLUWeJ/qydcOIpbRhcWx8ridrfKs9/Y8obBrSVMkfEx1rtbpqH8vsOxsaJk4kgtfA2
         q1zE30pB67LTAG+kg7x6XJShybKAK8VhgBU+fOwvqDEeFl2U7Ym8HE+/TSQ4t9W4DQRK
         /oWVZrW4UAHZd4FrMOYmgRfdoIPpt1sLUEY37SfkMZ9d6yu098UodpqPs6hxHp1g3FVo
         B/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AtXikr3V+HqZrn3VTGM9ht+XEn4j/2r1jWqpQFF7nHw=;
        b=m6wAy0IsEw+K/M4HptyoOpDK/4n7PGrn3be6fnmeCrQN70XoH6xxHjlHxW9ow8ym9W
         leMdQzgvMQD/PgWLjycQ3N+Enkyd1iRqFTNGY/mdnk5raLTgure3e3/r3jssdZikXBv1
         eWqZZsgDpzUeDco1meNqTsPFwvN0t57jhxteOAhiwu1OnaDQ5mpyQ7S5AwXmdVHHEGLw
         Oe7Sghm/1GPzUluApm5tg908jr9wnRa/4hpAZYZ1IoHaz5NJcISGqgRP1JCQrfrAv7B3
         CbzAHXQA0iNUw/jAP6QjGK8/2B1Tat9feJlWMAn3bhSAN+Kwp3L+ljNjU0g5f1YhD6WB
         TSsg==
X-Gm-Message-State: AJIora/0bMvjDpP0pIeFpQeTjiMmx0VgdyL88p55cWEt1/Ozx+DwW1l0
	oEuM9dna/w+yL6UQeDTrEiF7a4huc7LIJN8rThuy1Q==
X-Google-Smtp-Source: 
 AGRyM1soNxeiD6eJAgK5023P8eBzOVIJGBtVp4Zjfm05JjWvJSlxo4pY29g5EzYW4KTE+/YhaKHcHJpBiF5I3/h5IjI=
X-Received: by 2002:a17:907:a0c6:b0:72d:3fd2:5daa with SMTP id
 hw6-20020a170907a0c600b0072d3fd25daamr13589674ejc.728.1659372918089; Mon, 01
 Aug 2022 09:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220731110127.15278-1-flowergom@gmail.com>
 <170746C5522DE6D5.4252@lists.openembedded.org>
In-Reply-To: <170746C5522DE6D5.4252@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 1 Aug 2022 06:55:06 -1000
Message-ID: 
 <CAOSpxda83P-3E6YXFfV1nvE4p3LZz6eEn=cwbVjwLoPD82T8BQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] u-boot: fix CVE-2022-34835
To: steve@sakoman.com
Cc: Minjae Kim <flowergom@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 16:55:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168756

On Mon, Aug 1, 2022 at 6:53 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> On Sun, Jul 31, 2022 at 1:05 AM Minjae Kim <flowergom@gmail.com> wrote:
> >
> > i2c: fix stack buffer overflow vulnerability in i2c md command
> >
> > CVE: CVE-2022-34835
>
> I'm seeing do_patch errors with this:
>
> stdio: ERROR: u-boot-1_2020.01-r0 do_patch: Applying patch
> 'CVE-2022-34835.patch' on target directory
> '/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/1_2020.01-r0/git'
> stdio: ERROR: Logfile of failure stored in:
> /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/1_2020.01-r0/temp/log.do_patch.32232
> stdio: ERROR: Task
> (/home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-bsp/u-boot/u-boot_2020.01.bb:do_patch)
> failed with exit code '1'
> stdio: ERROR: Command . ./oe-init-build-env; bitbake core-image-sato
> core-image-sato-dev core-image-sato-sdk core-image-minimal
> core-image-minimal-dev core-image-sato-ptest
> core-image-sato:do_populate_sdk -k failed with exit code 1, see errors
> above. (1659369029.4: 2180.9)

More details in the log here:

https://errors.yoctoproject.org/Errors/Details/663916/

Steve

> > Signed-off-by:Minjae Kim <flowergom@gmail.com>
> > ---
> >  .../u-boot/files/CVE-2022-34835.patch         | 124 ++++++++++++++++++
> >  meta/recipes-bsp/u-boot/u-boot_2020.01.bb     |   4 +
> >  2 files changed, 128 insertions(+)
> >  create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2022-34835.patch
> >
> > diff --git a/meta/recipes-bsp/u-boot/files/CVE-2022-34835.patch b/meta/recipes-bsp/u-boot/files/CVE-2022-34835.patch
> > new file mode 100644
> > index 0000000000..f1c1a91dcf
> > --- /dev/null
> > +++ b/meta/recipes-bsp/u-boot/files/CVE-2022-34835.patch
> > @@ -0,0 +1,124 @@
> > +From 19cc75158388ec7e09e0d2bd7a2866d08974d059 Mon Sep 17 00:00:00 2001
> > +From: Nicolas Iooss <nicolas.iooss+uboot@ledger.fr>
> > +Date: Fri, 10 Jun 2022 14:50:25 +0000
> > +Subject: [PATCH] i2c: fix stack buffer overflow vulnerability in i2c md
> > + command
> > +
> > +When running "i2c md 0 0 80000100", the function do_i2c_md parses the
> > +length into an unsigned int variable named length. The value is then
> > +moved to a signed variable:
> > +
> > +    int nbytes = length;
> > +    #define DISP_LINE_LEN 16
> > +    int linebytes = (nbytes > DISP_LINE_LEN) ? DISP_LINE_LEN : nbytes;
> > +    ret = dm_i2c_read(dev, addr, linebuf, linebytes);
> > +
> > +On systems where integers are 32 bits wide, 0x80000100 is a negative
> > +value to "nbytes > DISP_LINE_LEN" is false and linebytes gets assigned
> > +0x80000100 instead of 16.
> > +
> > +The consequence is that the function which reads from the i2c device
> > +(dm_i2c_read or i2c_read) is called with a 16-byte stack buffer to fill
> > +but with a size parameter which is too large. In some cases, this could
> > +trigger a crash. But with some i2c drivers, such as drivers/i2c/nx_i2c.c
> > +(used with "nexell,s5pxx18-i2c" bus), the size is actually truncated to
> > +a 16-bit integer. This is because function i2c_transfer expects an
> > +unsigned short length. In such a case, an attacker who can control the
> > +response of an i2c device can overwrite the return address of a function
> > +and execute arbitrary code through Return-Oriented Programming.
> > +
> > +Fix this issue by using unsigned integers types in do_i2c_md. While at
> > +it, make also alen unsigned, as signed sizes can cause vulnerabilities
> > +when people forgot to check that they can be negative.
> > +
> > +Signed-off-by: Nicolas Iooss <nicolas.iooss+uboot@ledger.fr>
> > +Reviewed-by: Heiko Schocher <hs@denx.de>
> > +
> > +Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/8f8c04bf1ebbd2f72f1643e7ad9617dafa6e5409]
> > +Signed-off-by:Minjae Kim <flowergom@gmail.com>
> > +---
> > + cmd/i2c.c | 24 ++++++++++++------------
> > + 1 file changed, 12 insertions(+), 12 deletions(-)
> > +
> > +diff --git a/cmd/i2c.c b/cmd/i2c.c
> > +index 43a76299b3..f239d3f336 100644
> > +--- a/cmd/i2c.c
> > ++++ b/cmd/i2c.c
> > +@@ -246,10 +246,10 @@ int i2c_set_bus_speed(unsigned int speed)
> > +  *
> > +  * Returns the address length.
> > +  */
> > +-static uint get_alen(char *arg, int default_len)
> > ++static uint get_alen(char *arg, uint default_len)
> > + {
> > +-      int     j;
> > +-      int     alen;
> > ++      uint    j;
> > ++      uint    alen;
> > +
> > +       alen = default_len;
> > +       for (j = 0; j < 8; j++) {
> > +@@ -292,7 +292,7 @@ static int do_i2c_read ( cmd_tbl_t *cmdtp, int flag, int argc, char * const argv
> > + {
> > +       uint    chip;
> > +       uint    devaddr, length;
> > +-      int alen;
> > ++      uint    alen;
> > +       u_char  *memaddr;
> > +       int ret;
> > + #ifdef CONFIG_DM_I2C
> > +@@ -345,7 +345,7 @@ static int do_i2c_write(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[
> > + {
> > +       uint    chip;
> > +       uint    devaddr, length;
> > +-      int alen;
> > ++      uint    alen;
> > +       u_char  *memaddr;
> > +       int ret;
> > + #ifdef CONFIG_DM_I2C
> > +@@ -511,8 +511,8 @@ static int do_i2c_md ( cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[]
> > + {
> > +       uint    chip;
> > +       uint    addr, length;
> > +-      int alen;
> > +-      int     j, nbytes, linebytes;
> > ++      uint    alen;
> > ++      uint    j, nbytes, linebytes;
> > +       int ret;
> > + #ifdef CONFIG_DM_I2C
> > +       struct udevice *dev;
> > +@@ -630,9 +630,9 @@ static int do_i2c_mw ( cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[]
> > + {
> > +       uint    chip;
> > +       ulong   addr;
> > +-      int     alen;
> > ++      uint    alen;
> > +       uchar   byte;
> > +-      int     count;
> > ++      uint    count;
> > +       int ret;
> > + #ifdef CONFIG_DM_I2C
> > +       struct udevice *dev;
> > +@@ -716,8 +716,8 @@ static int do_i2c_crc (cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[]
> > + {
> > +       uint    chip;
> > +       ulong   addr;
> > +-      int     alen;
> > +-      int     count;
> > ++      uint    alen;
> > ++      uint    count;
> > +       uchar   byte;
> > +       ulong   crc;
> > +       ulong   err;
> > +@@ -1023,7 +1023,7 @@ static int do_i2c_probe (cmd_tbl_t *cmdtp, int flag, int argc, char * const argv
> > + static int do_i2c_loop(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
> > + {
> > +       uint    chip;
> > +-      int alen;
> > ++      uint    alen;
> > +       uint    addr;
> > +       uint    length;
> > +       u_char  bytes[16];
> > +--
> > +2.25.1
> > +
> > diff --git a/meta/recipes-bsp/u-boot/u-boot_2020.01.bb b/meta/recipes-bsp/u-boot/u-boot_2020.01.bb
> > index 02d67c0db2..16e2340bb6 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot_2020.01.bb
> > +++ b/meta/recipes-bsp/u-boot/u-boot_2020.01.bb
> > @@ -2,3 +2,7 @@ require u-boot-common.inc
> >  require u-boot.inc
> >
> >  DEPENDS += "bc-native dtc-native"
> > +
> > +SRC_URI_append = " \
> > +    file://CVE-2022-34835.patch \
> > +"
> > --
> > 2.25.1
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168755): https://lists.openembedded.org/g/openembedded-core/message/168755
> Mute This Topic: https://lists.openembedded.org/mt/92725052/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

