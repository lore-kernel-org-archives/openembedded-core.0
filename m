Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B132CE81BCC
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 14:05:39 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48026.1770645937978815159
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 06:05:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mczvMQbp;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c6a822068eso401525885a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 06:05:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770645937; cv=none;
        d=google.com; s=arc-20240605;
        b=UCXOWTbYdSpQk1+9RFM9jUBYxvGnEpHYVxDlwGNi2CDMb8TiSGoPyt1J97V2zulWwf
         2km35Fn4PZyJDTjuXAhyGixrDD3gfiK96LgOwkoxi9zkX5hu4B9AkzSYvkyaMAL/aOaU
         4lOeZgzFonN1YTATfwoL/ZQJk/grP5HWYNZJEZ3SjIYXnGgOm1VLl5dTQ20Oq8BJorhH
         DtA5RtBeh+2xizO9NQc9oln62SSfy1p+JnHk9Qd3ZNUdJnOZOsUaLiwdJiuQMt8l5mAC
         xff1cSDtVY11NmthPMeewGSu/RiaLqS7u9jalXZBjqyHgspTfdyKeveY3K7NG7e6Uzt7
         wRWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XAd9nNeOOt5i/uKOFz+UDLNqnQ8xKiHXme/qf349220=;
        fh=85FywoQ4TyE09dpZ07ihji6RE1UFygBEWt/2b8ei3sM=;
        b=f06QZ+7OSXyCAQ/tP7JXNqmbYPHccDrLdGdev5Iv4T7CXHLcOqd+246q+VPWXU6iXC
         /KVYKYmQ4WaHF0onhjvH4JhrfAF+g7tDA5Ccfh4q6UROf2V/4omjD7I+b8tr3oawUtPz
         uVwbU7mog0ovxKS+C1APr6JvE97FNz2fWGQ1S2cPqdpX0TxeGr3aN2H9vlB1FazS4UBc
         uB9qq0wreIeOcF9SFHjID1X95Xv9Y5gEtcQl3CIAUOcOlAMgGDvoVkjJbE5hdKanFVGF
         rlNdedK//uF8OgN/Uq0NRWxxqTJyqxCumCnboDaOyNh8aQ0nwz+di/ot6SCXDD07eagE
         DErA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770645937; x=1771250737; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XAd9nNeOOt5i/uKOFz+UDLNqnQ8xKiHXme/qf349220=;
        b=mczvMQbpGDMcmUTCDb7XYfF1EOcIJvNeISEO0N+50kU7Ozrgn37TyQzqQB5Aq3+uIH
         rJubu2Qmot66MEUSRjYOHWwsUxHz3/aUON3CZdqK0++xZp9U4a34Al6mv3K8fIefn5Oo
         xABIeYBOY/Sy85IMbg1uGWkNRumX17ai91tz9tptqCOit/wxSFAlSKNCBHjL1PUubMis
         pUq1BLuwL8kZiHyRpCaQSozSKsYflY8SZA+ul6KEZKYtC4HDjg/PjziJ54JL+ZeLSRQV
         xqWeD5FkVP4hu/tcuMur7yWOqN3O48D6ZnGyOLdNPUBvm7RvXyvOFuW2WcRJOst+wMLU
         A0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770645937; x=1771250737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAd9nNeOOt5i/uKOFz+UDLNqnQ8xKiHXme/qf349220=;
        b=LYfdrQWe0NY2uW3LQVu6eWW7P+ULtaD2Bx7rGIhxyMdE16iIrnvyYiR3UDp1BJFAJG
         CnGJDcabNIkRfDcCBRHzx+GzvHsqHF8vqWoZp15oP7i/roy3Addy9Os+qu+CPiUjKR9+
         qSija92r10d0z2mGCE9O1BI1iNhIJohpDwq9hNIm755faSYNh3dVe6gOpma7Kqj67HVg
         7MtkcxGmAp9p5noZrR0u+tOq3J5tS3vSYykqiS796EQdnH8h2CtNpynhgcnECWefpUUb
         Y5FrmIdSaYLjU5fBEa/kUmIBpwKtaNLr3XUtecHL9ErkojZNw4tq6B+ByvVsEgUrq+Hv
         hPBQ==
X-Gm-Message-State: AOJu0Yxr9LM5QTsL4jPWCWItSril2o3GuEDYKCpM4WaJ25u1cMqh6Ham
	d8lidHtwtjc7yKbw+LzOeaq1Co9xXZ254xd7XbmtFC6F1k50FIyjLkQm9UHWzIfGgO8HOGRzkMu
	gswa01pyOOTq0uUL0GJ5lJr7zrRmOm82uKQ==
X-Gm-Gg: AZuq6aKpGL7gIWvbFU5sVnxf4X3H+4zbPFHEd3H0TjZWLfJ9O/VTsiLkMUUdPoA+tBQ
	gQiiC+YLk5VDFh0MMdHL30nN1y4Ov0aE/TR5ZOfdjguLM0a9NnK7hfXvr6RdpTxq5gpt1OJg8oM
	pQVUZtxMgZB3VH6JpPCcF2CsAETuSv1GaeINwZ8Mb1rtwqDnfVpU17yxE66ZAL1XdwnKw9yngPA
	7udzVGSnuwqC0+LSZbV+8/UrOYAZro3iypJBMkKU1VM7M8VSo/QkBeQgdygk7pGC2sPqnEw9wiK
	Dq8XLluCDA4CP50Scuf4UE8GvdIO8WCr8ajaK8eRFQ==
X-Received: by 2002:a05:620a:6cc2:b0:8c7:1156:efeb with SMTP id
 af79cd13be357-8caef4fe15emr1534665885a.24.1770645936810; Mon, 09 Feb 2026
 06:05:36 -0800 (PST)
MIME-Version: 1.0
References: <20260207051305.2363194-1-Qi.Chen@windriver.com>
In-Reply-To: <20260207051305.2363194-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Feb 2026 15:05:25 +0100
X-Gm-Features: AZwV_QiZEfUF7wuaMGpMFih97jvd3LchUoiQDf_5Cw2MsAxSTOQNimAdbdpL9_E
Message-ID: <CANNYZj8ttf6mEjnWfSyS-yToT5jZdbg=s1DKJz5dpQpZw02FMw@mail.gmail.com>
Subject: Re: [OE-core][RFC][PATCH] oeqa/selftest/sdk: add test_sdk_runqemu
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 14:05:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230800

Thanks for writing this up, I'll get to it once some more pressing
issues are taken care of.

Alex

On Sat, 7 Feb 2026 at 06:13, <Qi.Chen@windriver.com> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Add test case to ensure runqemu works in SDK.
>
> Using runqemu from SDK has been supported for many years. Add a
> test case to ensure we have no regression.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/lib/oeqa/selftest/cases/sdk.py | 88 ++++++++++++++++++++++++++++-
>  1 file changed, 87 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/sdk.py b/meta/lib/oeqa/selftest/cases/sdk.py
> index 3971365029..ee1e4ca420 100644
> --- a/meta/lib/oeqa/selftest/cases/sdk.py
> +++ b/meta/lib/oeqa/selftest/cases/sdk.py
> @@ -4,7 +4,13 @@
>  # SPDX-License-Identifier: MIT
>  #
>
> -import os.path
> +import os
> +import shutil
> +import subprocess
> +import glob
> +import time
> +import select
> +from tempfile import TemporaryDirectory
>
>  from oeqa.selftest.case import OESelftestTestCase
>  from oeqa.utils.commands import bitbake, get_bb_vars
> @@ -37,3 +43,83 @@ IMAGE_INSTALL:append = " selftest-hello"
>          path = os.path.join(vars["SDK_DEPLOY"], vars["TOOLCHAIN_OUTPUTNAME"] + ".target.manifest")
>          self.assertNotEqual(os.path.getsize(path), 0, msg="Target manifest is empty")
>          self.assertIn("selftest-hello", self.load_manifest(path))
> +
> +    def test_sdk_runqemu(self):
> +        """Test using runqemu from SDK which has no bitbake available"""
> +
> +        def path_with_no_bitbake():
> +            orig_paths = os.environ["PATH"].split(":")
> +            new_paths = []
> +            for orig_path in orig_paths:
> +                if not os.access(os.path.join(orig_path, "bitbake"), os.X_OK):
> +                    new_paths.append(orig_path)
> +            return ":".join(new_paths)
> +
> +        def runqemu_works_from_sdk(sdk_dir, sdk_env, machine, path, timeout=360):
> +            env = os.environ.copy()
> +            env["PATH"] = path
> +
> +            cmd = f'cd {sdk_dir}; . {sdk_env}; runqemu {machine} snapshot slirp nographic'
> +            self.logger.info(f"Running {cmd}")
> +            proc = subprocess.Popen(
> +                ['bash', '-c', cmd],
> +                stdout=subprocess.PIPE,
> +                stderr=subprocess.STDOUT,
> +                text=True,
> +                bufsize=1,
> +                env=env
> +            )
> +            buffer = ""
> +            start = time.time()
> +            while time.time() - start < timeout:
> +                if proc.poll() is not None:
> +                    chunk = proc.stdout.read()
> +                    if chunk:
> +                        buffer += chunk
> +                    return ('Linux version' in buffer, "\n".join(buffer.split('\n')[-10:]))
> +                ready, _, _ = select.select([proc.stdout], [], [], 0.1)
> +                if ready:
> +                    chunk = proc.stdout.read(4096)
> +                    if chunk:
> +                        buffer += chunk
> +                        if "Linux version" in buffer:
> +                            proc.terminate()
> +                            return (True, "\n".join(buffer.split('\n')[-10:]))
> +                time.sleep(0.1)
> +            proc.terminate()
> +            time.sleep(5)
> +            if proc.poll() is None:
> +                proc.kill()
> +            return (False, "\n".join(buffer.split('\n')[-10:]))
> +
> +        image = "core-image-minimal"
> +
> +        self.write_config('QEMU_USE_KVM = "1"')
> +
> +        # generate image and SDK
> +        bitbake(f"{image}")
> +        bitbake(f"{image} -c populate_sdk")
> +
> +        # create a temporary destdir to test runqemu from SDK
> +        with TemporaryDirectory() as tmpdir:
> +            self.logger.debug(f"Created tempdir: {tmpdir}")
> +            vars = get_bb_vars(["DEPLOY_DIR_IMAGE", "SDK_DEPLOY", "TOOLCHAIN_OUTPUTNAME", "MACHINE"], image)
> +            machine = vars["MACHINE"]
> +            image_dir = vars["DEPLOY_DIR_IMAGE"]
> +            sdk_path = os.path.join(vars["SDK_DEPLOY"], vars["TOOLCHAIN_OUTPUTNAME"] + ".sh")
> +            self.logger.debug(f"machine: {machine}")
> +            self.logger.debug(f"image_dir: {image_dir}")
> +            self.logger.debug(f"sdk_path: {sdk_path}")
> +            dst_image_dir = os.path.join(tmpdir, os.path.basename(image_dir))
> +            shutil.copytree(image_dir, dst_image_dir)
> +            subprocess.check_call(f"{sdk_path} -d {tmpdir} -y", shell=True)
> +            sdk_env = glob.glob(tmpdir + '/environment-setup-*')[0]
> +            self.logger.debug(f"sdk_env: {sdk_env}")
> +
> +            path = path_with_no_bitbake()
> +            self.logger.debug(f"path: {path}")
> +
> +            runqemu_works, output = runqemu_works_from_sdk(tmpdir, sdk_env, machine, path)
> +            self.logger.debug(f"runqemu works in SDK: {runqemu_works}\n{output}")
> +
> +            self.assertTrue(runqemu_works, f"runqemu does not work in SDK\n{output}")
> --
> 2.43.0
>

