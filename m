Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C00E77188
	for <webhook@archiver.kernel.org>; Sun, 12 Jan 2025 09:46:22 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.33510.1736675179674570477
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jan 2025 01:46:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JLg2lyWs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so32916865e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 01:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736675178; x=1737279978; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzpHE8eKZqOxW+xKWp6Rk1hu5gEXwSC602V5fsXFvAo=;
        b=JLg2lyWscsUuMzjOKpKG1WZOf/5zDwN88DopzkGc41DOt6xGf7ntuJUEl8YldhsgZU
         ImVmOdQFV6lg4Fkcz037NNmbxVfjQy7VPRKkupSai4oPgio/K3jOPw09+kbqocQmyMU6
         bo397gsiO8nOynxxTuyIKmkJDNhafXSLNWNxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736675178; x=1737279978;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EzpHE8eKZqOxW+xKWp6Rk1hu5gEXwSC602V5fsXFvAo=;
        b=wjD4PJaNkbPN8XzXTw13/7lKmQ2fdmQ0+iV+T1SmjircETJR41DRPmd9a7zTheDN4o
         lg4MwT+c3h8GDTt6HHFi1FTCBfYhXvyH/8gPLN/gN2IDlQS6SGqJ5PCM1itOeCSd/YrY
         xSYd+LtCXHjVaTepjTDKQpYe1KtfYzr8FTkgBsSfwo5HruxU2dsXeMHB3IlWossArlsx
         yIWOiMKCVq4Yh+Vnn+n6Jr0OKd/G0fekSw+cqAZIOiW1NT6ghADDpZLBE1hQG1V59EjF
         /YlZ3omRtn40zyShusjk7ascaF/U/oO6gyWNgU9pr07rrlAvOVJom6v07FAX7HnKCbCZ
         f8bA==
X-Forwarded-Encrypted: i=1; AJvYcCVtvDPx2IrgT1YaQerjCtjr6GHBDdBbKdTH9sba3g4neBEPpRZrj2uMV6KpbI6lCbz4hxh7/L8oiVJGMfGUY4ykow==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwWkM8QbQ7iuYpoF4ZKt1cJZXpr3MYAO+0nXdNEfvMR0Alez4lJ
	39zSXvsmMshf3PV30LgS+LpoWodLaa3I2QPW6pCjncDU8lEFA03uK8EwBp8LrlI=
X-Gm-Gg: ASbGncvZWGBY2lBU6AsUhbrQjNMXdu3YPu2rFg+o8QwFRXZS1pm7eP86ok4Uhtc7e1A
	CvYsNBzpw9vHAsDxZYn4ictUHQjYYn1vuoIN/YVfA7VpFZ9VTLPw0q9VJbgFoiLrOZF6rNFic6p
	MeP3JvSex5d06RKDe9D7L6izoiVEwKfjdN+LUhjGFgXxfZRd/BeA1mYuWKdOs8drvfsUGk1ABwJ
	p68ftBBDI8AJfX7XOp1wp9tvJPbdCAJEXOl6jkcYUzVbKt2DoTZOFbJKjn/HsuNGaNPwF/4LGBl
	XCHbFfzKKxKG3pq0wziik63qkpGPHgFc26+yBFMWc+M=
X-Google-Smtp-Source: AGHT+IGq+pPx3gbqFKSBfA0g9G6bPCAvgJfGgczxlHoKFX2zA253ywF8JA73Y1fe0wAFCF6z8DrJug==
X-Received: by 2002:a05:600c:5246:b0:434:feb1:adbb with SMTP id 5b1f17b1804b1-436e271d5d6mr157041045e9.31.1736675177918;
        Sun, 12 Jan 2025 01:46:17 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ce7f:c82:f2ea:4999? ([2001:8b0:aba:5f3c:ce7f:c82:f2ea:4999])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38ef6asm9454377f8f.60.2025.01.12.01.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 01:46:17 -0800 (PST)
Message-ID: <b17876f669978bdde2f1d0b843f35780f86a0bb2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 2/2] selftest/reproducible: Print error
 context on failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Date: Sun, 12 Jan 2025 09:46:16 +0000
In-Reply-To: <20250112002310.4045706-2-yoann.congal@smile.fr>
References: <20250112002310.4045706-1-yoann.congal@smile.fr>
	 <20250112002310.4045706-2-yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jan 2025 09:46:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209676

On Sun, 2025-01-12 at 01:23 +0100, Yoann Congal via lists.openembedded.org =
wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
>=20
> Printed logs during the reproducible test look like this in case of
> failure:
> 2025-01-12 00:39:00,807 - oe-selftest - INFO - Building reproducibleA (ss=
tate allowed)...
> 2025-01-12 00:40:08,323 - oe-selftest - ERROR - Bitbake failed! but keep =
going... Log:
> 2025-01-12 00:40:08,323 - oe-selftest - INFO - Found ERROR (line 126):
> 2025-01-12 00:40:08,323 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: recipe opkg-utils-native-0.7.0-r0: task do_populate_sysroot=
_setscene: Succeeded
> 2025-01-12 00:40:08,323 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: Running setscene task 74 of 333 (virtual:native:.../poky/me=
ta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
> 2025-01-12 00:40:08,323 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: recipe bash-5.2.37-r0: task do_populate_sysroot_setscene: S=
ucceeded
> 2025-01-12 00:40:08,323 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: recipe cve-update-nvd2-native-1.0-r0: task do_unpack: Succe=
eded
> 2025-01-12 00:40:08,323 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: Running task 4 of 974 (.../poky/meta/recipes-core/hello-sin=
gle/hello-fail_1.0.bb:do_cve_check)
> 2025-01-12 00:40:08,323 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succee=
ded
> 2025-01-12 00:40:08,323 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: recipe hello-fail-1.0-r0: task do_packagedata_setscene: Sta=
rted
> 2025-01-12 00:40:08,323 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: Running setscene task 77 of 333 (.../poky/meta/recipes-exte=
nded/bash/bash_5.2.37.bb:do_recipe_qa_setscene)
> 2025-01-12 00:40:08,323 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: Running setscene task 78 of 333 (.../poky/meta/recipes-core=
/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
> 2025-01-12 00:40:08,324 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: recipe hello-fail-1.0-r0: task do_populate_sysroot_setscene=
: Started
> 2025-01-12 00:40:08,324 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ERROR: hello-fail-1.0-r0 do_populate_sysroot_setscene: this is an=
 error
> 2025-01-12 00:40:08,324 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ERROR: hello-fail-1.0-r0 do_populate_sysroot_setscene: Error exec=
uting a python function in exec_func_python() autogenerated:
> 2025-01-12 00:40:08,324 - oe-selftest - INFO -
> 2025-01-12 00:40:08,324 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 The stack trace of python calls that resulted in this exception/f=
ailure was:
> 2025-01-12 00:40:08,324 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 File: 'exec_func_python() autogenerated', lineno: 2, function: <m=
odule>
> 2025-01-12 00:40:08,324 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0001:
> 2025-01-12 00:40:08,324 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *** 0002:do_populate_sysroot_setscene(d)
> 2025-01-12 00:40:08,324 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0003:
> 2025-01-12 00:40:08,324 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 File: '.../poky/meta/recipes-core/hello-single/hello-fail_1.0.bb'=
, lineno: 17, function: do_populate_sysroot_setscene
> 2025-01-12 00:40:08,324 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0013:}
> 2025-01-12 00:40:08,324 - oe-selftest - INFO - Found ERROR (line 127):
> 2025-01-12 00:40:08,324 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: Running setscene task 74 of 333 (virtual:native:.../poky/me=
ta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
> 2025-01-12 00:40:08,324 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: recipe bash-5.2.37-r0: task do_populate_sysroot_setscene: S=
ucceeded
> 2025-01-12 00:40:08,324 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: recipe cve-update-nvd2-native-1.0-r0: task do_unpack: Succe=
eded
> 2025-01-12 00:40:08,324 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: Running task 4 of 974 (.../poky/meta/recipes-core/hello-sin=
gle/hello-fail_1.0.bb:do_cve_check)
> 2025-01-12 00:40:08,324 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succee=
ded
> 2025-01-12 00:40:08,324 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: recipe hello-fail-1.0-r0: task do_packagedata_setscene: Sta=
rted
> 2025-01-12 00:40:08,324 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: Running setscene task 77 of 333 (.../poky/meta/recipes-exte=
nded/bash/bash_5.2.37.bb:do_recipe_qa_setscene)
> 2025-01-12 00:40:08,324 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: Running setscene task 78 of 333 (.../poky/meta/recipes-core=
/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
> 2025-01-12 00:40:08,324 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: recipe hello-fail-1.0-r0: task do_populate_sysroot_setscene=
: Started
> 2025-01-12 00:40:08,324 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ERROR: hello-fail-1.0-r0 do_populate_sysroot_setscene: this is an=
 error
> 2025-01-12 00:40:08,324 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ERROR: hello-fail-1.0-r0 do_populate_sysroot_setscene: Error exec=
uting a python function in exec_func_python() autogenerated:
> 2025-01-12 00:40:08,325 - oe-selftest - INFO -
> 2025-01-12 00:40:08,325 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 The stack trace of python calls that resulted in this exception/f=
ailure was:
> 2025-01-12 00:40:08,325 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 File: 'exec_func_python() autogenerated', lineno: 2, function: <m=
odule>
> 2025-01-12 00:40:08,325 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0001:
> 2025-01-12 00:40:08,325 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *** 0002:do_populate_sysroot_setscene(d)
> 2025-01-12 00:40:08,325 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0003:
> 2025-01-12 00:40:08,325 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 File: '.../poky/meta/recipes-core/hello-single/hello-fail_1.0.bb'=
, lineno: 17, function: do_populate_sysroot_setscene
> 2025-01-12 00:40:08,325 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0013:}
> 2025-01-12 00:40:08,325 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0014:
> 2025-01-12 00:40:08,325 - oe-selftest - INFO - End of log:
> 2025-01-12 00:40:08,325 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: Running task 955 of 974 (.../poky/meta/recipes-core/hello-s=
ingle/hello-fail_1.0.bb:do_populate_sysroot)
> 2025-01-12 00:40:08,325 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: recipe hello-fail-1.0-r0: task do_populate_sysroot: Started
> 2025-01-12 00:40:08,325 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: recipe hello-fail-1.0-r0: task do_populate_sysroot: Succeed=
ed
> 2025-01-12 00:40:08,325 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: Running noexec task 973 of 974 (.../poky/meta/recipes-core/=
hello-single/hello-fail_1.0.bb:do_build)
> 2025-01-12 00:40:08,325 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: Running noexec task 974 of 974 (.../poky/meta/recipes-core/=
hello-single/hello-norepro_1.0.bb:do_build)
> 2025-01-12 00:40:08,325 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: Tasks Summary: Attempted 974 tasks of which 958 didn't need=
 to be rerun and all succeeded.
> 2025-01-12 00:40:08,325 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTE: Generating JSON CVE summary
> 2025-01-12 00:40:08,325 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Complete CVE JSON report summary created at: .../poky/build-maste=
r-st/reproducibleA/tmp/log/cve/cve-summary.json
> 2025-01-12 00:40:08,325 - oe-selftest - INFO -
> 2025-01-12 00:40:08,325 - oe-selftest - INFO -=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Summary: There were 2 ERROR messages, returning a non-zero exit c=
ode.
> 2025-01-12 00:40:08,326 - oe-selftest - ERROR - reproducibleA build faile=
d. Trying to compute built packages differences but the test will fail.
>=20
> Fixes [YOCTO #15655] (second half).
>=20
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
> RFC: As you can see, some lines are displayed multiple times if they are
> in multiple errors contexts. I started implementing merging contexts
> blocks but the code I wrote is really not good. If someone has a clever
> idea on how to do this, I'll take it.
> In the meantime, I think this simpler patch can be merged and the
> print_condensed_error_log function improved later if that is worth it.

Thanks for working on this. I think the multiple lines is fine. As
someone who spends a lot of time looking at failures, I'm fine with too
much information rather than the current situation where it isn't
clear.

Obviously it is nice to make it really concise but that is a nice to
have.

Cheers,

Richard

