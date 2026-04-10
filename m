Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2170E99062
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 09:28:39 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.152272.1775813310825940693
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 02:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gl2566xD;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso22201515e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 02:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775813309; x=1776418109; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1yn2gERuzYmAyKP795H3ry16SLvpws8EM/If6gR7Sk=;
        b=gl2566xDLHsjavZ1zrF6UG5vpl7qfWxVoNycildDeMD4FaCqbxpAz2sJIgWsIdSHkL
         rcVWz212/jGekFETh0Y9DXfd90k5qDWbDsIr6hI9QKbmWPAQVCRedRRoOheKkrXLI3sg
         rDDE/9cZTKkM4rsWKE0EHXlvCyN8Iq1T1+K7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813309; x=1776418109;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s1yn2gERuzYmAyKP795H3ry16SLvpws8EM/If6gR7Sk=;
        b=d5FXcQShdBL0PD8RkBLusXW1THpRg7Rnv9220pAKPw0DDZMWZF5EEG8Xys1QCDlpO4
         ASwNXRgSArIo+uVe1PWa0K0ovykNopQSurWGl+HpPba/g2UEi84RGAMbyilmu0Jj4QD/
         fzc65T1RnY/ooPDu9Jp4nEjXWV36sHjY+Xcz7bvJDm9Vl9MRCgybOqg6W0TI7m/eMHgN
         h5xNDuVGPy7MmH/lG8hg6l1AXtYiV2xlG5odZvZSZo0Xl33zRajmcK88EQAv0BoK7Ng1
         FDoHQlW77TQYI3zJ5mpKEV0aRqhmBlxXwnfkHJ4cDIrctzDhPLMJNtlKQa4IYSlpRURt
         bszQ==
X-Gm-Message-State: AOJu0YwFAIPdF+K2i2tGnmTdBFTyiEbLcH4d8quGo+tvAGlgrpilHhQf
	RjsgnJPuFqZPJ75VLaqzsE5hs1nSJusdBrwoFVRwstrWwqza+YS/vh8GHW4zmagLfow=
X-Gm-Gg: AeBDies3gUoXuIIiHXjr4CYToii8TTpU4cr+awb7GfwHqyDcC+9Y058Jrbyg0Vb6jRO
	dbJUG6lcdw+5DQ/lyENxUg9sgsxXgVNRKFRx+P20pJ4x/ylAbznc6ag6JH5Rcmh00WVJe1TxCFY
	3+BjLKQfFpTKd8adbIydoJEtX3yEajUIQmMZVx4jXdnSMOawmXML6ZmL4/wvT7qCphrZ87gS6t9
	RlqimjEuUrirjKAOxWyNu1vtp6RMmIadQ1tas27NCkRGI6irgh21w4dYPISfWvEN0Aj7+8QjvLq
	/vfduoDDJcy95ibUES03UFMAgK8C6AK12HP9jaRpFI6D4bGre2AMoQTwiVYtn9/GMPMe4+sASvz
	tkx1duroSDIyEF3F/4CQqoVgAGm5mlabDF+FgdkQMor9xstKlXeIH4jSURJvqXU8Dj3ObuXbh1g
	r68Xii+6wqNGEyBS5sqE7jQP19z5CfGHNj5sA7qCL5Ip8Jkj6KrtF5dn++ctjSbZPvnVgnLvIn+
	+cIxJrBOqcvjH0q
X-Received: by 2002:a05:600c:c0da:b0:485:4eaf:eb53 with SMTP id 5b1f17b1804b1-488d685c12dmr24366635e9.19.1775813309028;
        Fri, 10 Apr 2026 02:28:29 -0700 (PDT)
Received: from localhost (2a01cb001331aa00bcd4fc1a1ff2417c.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bcd4:fc1a:1ff2:417c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d70315sm18335375e9.1.2026.04.10.02.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 02:28:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Apr 2026 11:28:28 +0200
Message-Id: <DHPDA3LTW9U8.2AC8TDM9LDC0L@smile.fr>
Subject: Re: [OE-core] [whinlatter][PATCH 1/9] dtc: backport fix for build
 with glibc-2.43
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>, "Mathieu Dubois-Briand"
 <mathieu.dubois-briand@bootlin.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
To: "Martin Jansa" <martin.jansa@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260409152839.2894434-1-martin.jansa@gmail.com>
 <DHOV6DD1DEG9.2REH24GS0QYC3@smile.fr>
 <CA+chaQdA95XBr+n+-Zm2dE9sxFiaAjhthSpGvP-g+N60yj=MJQ@mail.gmail.com>
 <DHPB0K1HXR2T.1N8T3183RMIUJ@smile.fr>
 <CA+chaQcHomAk3+9-aJ5vKgnNE_q8EtacTMSv8v1Ns8n1gA0xPw@mail.gmail.com>
In-Reply-To: <CA+chaQcHomAk3+9-aJ5vKgnNE_q8EtacTMSv8v1Ns8n1gA0xPw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 09:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235001

On Fri Apr 10, 2026 at 11:09 AM CEST, Martin Jansa wrote:
> On Fri, Apr 10, 2026 at 9:42=E2=80=AFAM Yoann Congal <yoann.congal@smile.=
fr> wrote:
>>
>> On Thu Apr 9, 2026 at 11:29 PM CEST, Martin Jansa wrote:
>> > On Thu, Apr 9, 2026 at 9:17=E2=80=AFPM Yoann Congal <yoann.congal@smil=
e.fr> wrote:
>> >>
>> >> On Thu Apr 9, 2026 at 5:28 PM CEST, Martin Jansa via lists.openembedd=
ed.org wrote:
>> >> > From: Martin Jansa <martin.jansa@gmail.com>
>> >> >
>> >> > glibc-2.43 isn't used in OE builds yet, but this fixes dtc-native:
>> >> > https://errors.yoctoproject.org/Errors/Details/903983/
>> >> >
>> >> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c: In function =E2=80=98ove=
rlay_fixup_phandle=E2=80=99:
>> >> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:424:21: error: assignment=
 discards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werr=
or=3Ddiscarded-qualifiers]
>> >> >   424 |                 sep =3D memchr(fixup_str, ':', fixup_len);
>> >> >       |                     ^
>> >> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:434:21: error: assignment=
 discards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werr=
or=3Ddiscarded-qualifiers]
>> >> >   434 |                 sep =3D memchr(name, ':', fixup_len);
>> >> >       |                     ^
>> >> > cc1: all warnings being treated as errors
>> >> >
>> >> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>> >> > Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin=
.com>
>> >> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> >> > ---
>> >>
>> >> Hello,
>> >>
>> >> I've started a whinlatter bringup build on the new Ubuntu 26.04 worke=
r
>> >> with this series applied:
>> >> https://autobuilder.yoctoproject.org/valkyrie/#/builders/96/builds/23
>> >>
>> >> It got 2 errors (Other errors are most likely consequences of these o=
nes):
>> >>
>> >> ERROR: shadow-native-4.18.0-r0 do_configure: configure failed:
>> >> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/96/builds/2=
3/steps/12/logs/stdio line 6269:
>> >> | checking for crypt in -lcrypt... no
>> >> | configure: error: crypt() not found
>> >> | NOTE: The following config.log files may provide further informatio=
n.
>> >> | NOTE: /srv/pokybuild/yocto-worker/bringup/build/build/tmp/work/x86_=
64-linux/shadow-native/4.18.0/build/config.log
>> >> | ERROR: configure failed
>> >> | WARNING: exit code 1 from a shell command.
>> >> NOTE: recipe shadow-native-4.18.0-r0: task do_configure: Failed
>> >
>> > Hello,
>> >
>> > for shadow please read
>> > https://lists.openembedded.org/g/openembedded-core/message/234119 the
>> > important part:
>> > "libcrypt-dev is no longer installed as a dependency in my minimal doc=
ker image"
>> > I guess it's now missing on your ubuntu-26.04 host as well.
>> > It used to be typically installed by build-essential -> libc6-dev ->
>> > libcrypt-dev but not anymore since 2.42-7:
>> >
>> > 25.10 questing with 2.42-0ubuntu3.1:
>> > https://packages.ubuntu.com/questing/libc6-dev
>> > 26.04 resolute with 2.43-2ubuntu1:
>> > https://packages.ubuntu.com/resolute/libc6-dev
>> >
>> > https://changelogs.ubuntu.com/changelogs/pool/main/g/glibc/glibc_2.43-=
2ubuntu1/changelog:
>> > ...
>> > glibc (2.42-7) unstable; urgency=3Dmedium
>> >
>> >   [ Aurelien Jarno ]
>> >   * debian/control.in/libc, debian/rules.d/debhelper.mk: drop libcrypt=
-dev
>> >     dependency from libc6-dev. Thanks to Helmut Grohne for proposing t=
hat,
>> >     doing an archive rebuild and filling the bug reports.
>> >   * debian/control.in/main, debian/sysdeps/linux.mk: enable SystemTap =
static
>> >     probes.
>> >   * debian/debhelper.in/libc-dev.NEWS: add a NEWS entry about the remo=
val of
>> >     the obsolete termio interface.  Closes: #1124068.
>> >   * debian/rules.d/debhelper.mk: ensure that linker scripts work even =
when
>> >     /usr is unmerged.  Closes: #1120508
>> >   * debian/debhelper.in/libc-dev{,-alt}.lintian-overrides,
>> >     source/lintian-overrides, rules.d/debhelper.mk, salsa-ci.yml: drop
>> >     unpack-message-for-{orig,source} overrides, fixed in lintian 2.128=
.0.
>> >   * debian/control.in/main: drop Rules-Requires-Root: no, this is now =
the
>> >     default.
>> >   * debian/libc6.symbols.i386, debian/libc6-i386.symbols.{amd64,x32}: =
remove
>> >     the workaround for GLIBC_ABI_GNU_TLS.  Closes: #1122038.
>> >   * debian/control.in/{libc,i386}: ensure that libdpkg-perl is fixed w=
rt
>> >     GLIBC_ABI_GNU_TLS.
>> >
>> >  -- Aurelien Jarno <aurel32@debian.org>  Sun, 04 Jan 2026 10:07:24 +01=
00
>> > ...
>>
>> Hello,
>>
>> In that case, shouldn't we remove "virtual/crypt-native" from ASSUME_PRO=
VIDED?
>> https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.co=
nf#n232
>>
>> I've tried it but then libxcrypt-native fails to build with:
>> | ../sources/libxcrypt-4.4.38/lib/crypt-gost-yescrypt.c: In function =E2=
=80=98_crypt_crypt_gost_yescrypt_rn=E2=80=99:
>> | ../sources/libxcrypt-4.4.38/lib/crypt-gost-yescrypt.c:134:16: error: i=
nitialization discards =E2=80=98const=E2=80=99 qualifier from pointer targe=
t type [-Werror=3Ddiscarded-qualifiers]
>> |   134 |   char *hptr =3D strchr ((const char *) intbuf->retval + 3, '$=
');
>> |       |                ^~~~~~
>> | cc1: all warnings being treated as errors
>>
>> It looks like the fixes for that are on master but the patches don't
>> apply.
>>
>> Can you send an update series with those fixes?
>
>
> Patches for building libxcrypt-native? I still see
> virtual/crypt-native in ASSUME_PROVIDED in master, that's why I've
> added libcrypt-dev into the ubuntu-26.04 image at least until the same
> is resolved in wrynose/master. The same issue is in current master.

(Sorry, our mails crossed)

I discussed that with Paul. He suggested to add libcrypt-dev as a host
dependency instead (ie. what you describe). I agree (sorry about the
sudden change of heart).

Can you send the yocto-docs patch to do this?
--=20
Yoann Congal
Smile ECS


