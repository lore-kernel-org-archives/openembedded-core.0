Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.72.1614730640231222383
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 16:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XvvemvYq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id o16so4458721wmh.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 16:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=dHmP8Ts/iHXUfP0lHEK0SgoB1ESMByx1qJHxmxADnCI=;
        b=XvvemvYqG8VwnzaAhGmvosx5CfxeGyqkIRH0e5aKJRgywU4YW2uaVdvWP84MD7HEQ1
         z1ZyvUXVUcGyqZv+gGspWrgXjqCRjm9nZdXCupA1fkqw5xmEr41SLIr99YA/B7DpTtws
         DadJSD1jtgbCnIWvqg1cLjZdUYalIDlxGO3BE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=dHmP8Ts/iHXUfP0lHEK0SgoB1ESMByx1qJHxmxADnCI=;
        b=Z3JUJ9EL4gmyjCY5ghYzBGw10epynTuLYId4EGGO9k9DI8JT0daJDNqUcvTHpTqPQ4
         SxXCvXNRBi07TjM4tZJsM915CM+MxPF495Pwc6lgDp8EQ73LU2Me34B3mX54qvE6e2iY
         NkDOt4cJG+YO4fi0+/tzXzW2oKoLrMgS/MPg8A8eMbYEa/l/XmT7M69n8Rf30TbImVS9
         jqAMrAHSWd0W/fCQiVlYuV0D9FsRJ3V+Lpydn+9JC2I7fvKNx8Qw73Hvw7qjVTq4F2Gt
         3fh2p4LnugA0sIjB/UmuaJJ4Xt0ugEmBZiA8TroCQ/tq+p1b0XhDK8l34sGVTGbaTrMe
         MwIA==
X-Gm-Message-State: AOAM5325Uknt7ejxkLQL2BBP/bG19QTPWvVrUBPrkzvsuVpmFAb+OaTr
	y8+yCKgs6hE8cAPjSYTsHnIx2w==
X-Google-Smtp-Source: ABdhPJy/xeRC9Xk/9Kw9BnZeeLgcW4d6Hoyt1kbe7yEOYzYl+tvfiE/bldBfV1Ju8Hr1Za5Q3abn6w==
X-Received: by 2002:a1c:2ed4:: with SMTP id u203mr6486707wmu.45.1614730638518;
        Tue, 02 Mar 2021 16:17:18 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1694:293b:180e:a3b2? ([2001:8b0:aba:5f3c:1694:293b:180e:a3b2])
        by smtp.gmail.com with ESMTPSA id m3sm3932403wmc.48.2021.03.02.16.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 16:17:18 -0800 (PST)
Message-ID: <7047a53a435f496516e40fa5d21b46f66328c66b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/2] lib/oeqa/selftest/cases/reproducible.py : updated test to faketime in future when buiding the second test build.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Sangeeta Jain <sangeeta.jain@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 03 Mar 2021 00:17:17 +0000
In-Reply-To: <1614672488-32161-1-git-send-email-sangeeta.jain@intel.com>
References: <1614672488-32161-1-git-send-email-sangeeta.jain@intel.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-03-02 at 16:08 +0800, Sangeeta Jain wrote:
> From: sangeeta jain <sangeeta.jain@intel.com>
> 
> This update will ensure that recipes are not including time stamps by creating an
> image with modified system time. It uses libfaketime recipe to fake system
> time to advance by 34308122 seconds
> 
> Signed-off-by: sangeeta jain <sangeeta.jain@intel.com>
> ---
>  meta/lib/oeqa/selftest/cases/reproducible.py | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
> index f2d9f95..c7e1fdf 100644
> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> @@ -163,6 +163,7 @@ class ReproducibleTests(OESelftestTestCase):
>      # will test that and also make the test run faster. If your sstate is not
>      # reproducible, disable this in your derived test class
>      build_from_sstate = True
> +    use_faketime = False
>  
> 
>      def setUpLocal(self):
>          super().setUpLocal()
> @@ -210,7 +211,7 @@ class ReproducibleTests(OESelftestTestCase):
>          bb.utils.mkdirhier(os.path.dirname(dest))
>          shutil.copyfile(source, dest)
>  
> 
> -    def do_test_build(self, name, use_sstate):
> +    def do_test_build(self, name, use_sstate, use_faketime):
>          capture_vars = ['DEPLOY_DIR_' + c.upper() for c in self.package_classes]
>  
> 
>          tmpdir = os.path.join(self.topdir, name, 'tmp')
> @@ -239,6 +240,18 @@ class ReproducibleTests(OESelftestTestCase):
>                  SSTATE_MIRRORS = ""
>                  ''')
>  
> 
> +        if use_faketime:
> +            # This config fragment will enable to fake system time
> +            # advance by 34308122 sec
> +            bitbake("libfaketime")
> +            find_binary = "find . -path '*/image/*/libfaketime.so.1"
> +            full_path_to_binary = runCmd(find_binary)
> +            binary_path = full_path_to_binary.split("./")
> +            ld_preload_path = os.path.join(os.environ.get('BUILDDIR'), binary_path[1])
> +            seconds_add_to_system_time = "+34308122"
> +            cmd = 'LD_PRELOAD=%s FAKETIME=%s' %(ld_preload_path, seconds_add_to_system_time)
> +            runCmd(cmd)
> +

This doesn't make sense to me. Surely the build has to run under the 
LD_PRELOAD to fake the time? How did you test this?

This method of finding the binary looks error prone too, which "image"
directory are you trying to use here?

Also, the recipe addition doesn't add a maintainers entry.

Cheers,

Richard


