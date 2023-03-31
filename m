Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8C6C6FD18
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 07:34:06 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.49195.1680248039631454723
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 00:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GdGvYUB9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id m2so21432242wrh.6
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 00:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680248038;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cAq0N4lVFl0fPL7o2nygl/8D3m9FeJWKtTInuTZeNm0=;
        b=GdGvYUB9w8onmL6C8X/pPRgYJg127D5+Doyf20kgYzJa9N3NBDcnQUwE40OL1I/ArR
         4tu+H80NshWBW+E0HncIz9th35kos9FDgGUBa9teeZcgBFC24roT0EmBjPOZkJVoxZQV
         W1diqrnHbZ0SP07TFUoPUPtvY4DL8N8rhENj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680248038;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cAq0N4lVFl0fPL7o2nygl/8D3m9FeJWKtTInuTZeNm0=;
        b=k4YzuzbTKRkY0szpuqn6EXqGguZzBulPgC8/kCq0clyImzmRElQmKAGjVgILCOkNl7
         ttwrO9Y1cX/kdoAKOinjonqGCCzihcU/yNOEWnKsqR+sVsmNXwUzFl85eySK4JNwrMtd
         967kbfip1ZJNndnM5mPlX7eRzPUQw+pG7rVxJXRZNwyUxZ1AsgMdE+HnXrVldaRGxI0j
         EPtxinzhF9Yubw4qEYFwypOo+CYbG9puZ/2zGFP+JXjwwiikd72Cy7W/8ieY9YOyLZyk
         gwQfuHVR0C7ayIsjoHDxB151tEBhaY5bOBoGgf1X1biFkFsaoxVkdQ0O4ap9dXmnsEXy
         Ly0A==
X-Gm-Message-State: AAQBX9cmzgZupW4xuk2H7Ol0SuNrl9NFZ6sz1jDvmqODohfkIGcafOr7
	7PByOXuXtq2fU68TSAI3ZcGwmQ==
X-Google-Smtp-Source: AKy350a59HA4JvqBbTveDKgiWCO8coa8RCJv3qrMiB8q6GUHH2zP0ccDuErSkks5l3S++FcuvxfS6g==
X-Received: by 2002:adf:ed0e:0:b0:2d1:86e6:bd6 with SMTP id a14-20020adfed0e000000b002d186e60bd6mr19619463wro.22.1680248037955;
        Fri, 31 Mar 2023 00:33:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:18b7:bfe:d74b:7341? ([2001:8b0:aba:5f3c:18b7:bfe:d74b:7341])
        by smtp.gmail.com with ESMTPSA id z15-20020adfec8f000000b002cf1c435afcsm1436115wrn.11.2023.03.31.00.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 00:33:57 -0700 (PDT)
Message-ID: <55d2ebb68df985c02213a7a37174a29c9403c45a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/runtime: clean up deprecated backslash
 expansion
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>, 
	openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Fri, 31 Mar 2023 08:33:56 +0100
In-Reply-To: <20230330171226.3693157-1-ross.burton@arm.com>
References: <20230330171226.3693157-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 07:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179401

On Thu, 2023-03-30 at 18:12 +0100, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/lib/oeqa/runtime/cases/apt.py       | 4 ++--
>  meta/lib/oeqa/runtime/cases/buildcpio.py | 7 +++++--
>  meta/lib/oeqa/runtime/cases/systemd.py   | 2 +-
>  3 files changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runtime/c=
ases/apt.py
> index 4e09374adde..8000645843a 100644
> --- a/meta/lib/oeqa/runtime/cases/apt.py
> +++ b/meta/lib/oeqa/runtime/cases/apt.py
> @@ -39,9 +39,9 @@ class AptRepoTest(AptTest):
>          self.target.run('cd %s; echo deb [ allow-insecure=3Dyes ] %s/all=
 ./ > sources.list' % (apt_get_sourceslist_dir, apt_get_source_server))
> =20
>      def setup_source_config_for_package_install_signed(self):
> -        apt_get_source_server =3D 'http:\/\/%s:%s' % (self.tc.target.ser=
ver_ip, self.repo_server.port)
> +        apt_get_source_server =3D 'http://%s:%s' % (self.tc.target.serve=
r_ip, self.repo_server.port)
>          apt_get_sourceslist_dir =3D '/etc/apt/'
> -        self.target.run("cd %s; cp sources.list sources.list.bak; sed -i=
 's/\[trusted=3Dyes\] http:\/\/bogus_ip:bogus_port/%s/g' sources.list" % (a=
pt_get_sourceslist_dir, apt_get_source_server))
> +        self.target.run("cd %s; cp sources.list sources.list.bak; sed -i=
 's|\[trusted=3Dyes\] http://bogus_ip:bogus_port|%s|g' sources.list" % (apt=
_get_sourceslist_dir, apt_get_source_server))
> =20
>      def cleanup_source_config_for_package_install(self):
>          apt_get_sourceslist_dir =3D '/etc/apt/'
> diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py b/meta/lib/oeqa/run=
time/cases/buildcpio.py
> index bd3b46d9ef0..c08de3c914d 100644
> --- a/meta/lib/oeqa/runtime/cases/buildcpio.py
> +++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
> @@ -29,7 +29,10 @@ class BuildCpioTest(OERuntimeTestCase):
>      @OEHasPackage(['autoconf'])
>      def test_cpio(self):
>          self.project.download_archive()
> -        self.project.run_configure('--disable-maintainer-mode',
> -                                   'sed -i -e "/char \*program_name/d" s=
rc/global.c;')
> +        self.project.run_configure('--disable-maintainer-mode')
> +        # This sed is needed until
> +        # https://git.savannah.gnu.org/cgit/cpio.git/commit/src/global.c=
?id=3D641d3f489cf6238bb916368d4ba0d9325a235afb
> +        # is in a release.
> +        self.project._run(r'sed -i -e "/char \*program_name/d" src/globa=
l.c')
>          self.project.run_make()
>          self.project.run_install()
> diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runti=
me/cases/systemd.py
> index 720b4b517ae..37f295492d3 100644
> --- a/meta/lib/oeqa/runtime/cases/systemd.py
> +++ b/meta/lib/oeqa/runtime/cases/systemd.py
> @@ -154,7 +154,7 @@ class SystemdJournalTests(SystemdTest):
>          """
> =20
>          # The expression chain that uniquely identifies the time boot me=
ssage.
> -        expr_items=3D['Startup finished', 'kernel', 'userspace','\.$']
> +        expr_items=3D['Startup finished', 'kernel', 'userspace', r'\.$']
>          try:
>              output =3D self.journalctl(args=3D'-o cat --reverse')
>          except AssertionError:


https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/6944/step=
s/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/6898/step=
s/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/6918/step=
s/12/logs/stdio

and quite a few more :(

Cheers,

Richard


