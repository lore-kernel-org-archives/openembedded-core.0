Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.5398.1587240478772855357
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 13:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kB9H7DOn;
 spf=pass (domain: konsulko.com, ip: 209.85.221.68, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f68.google.com with SMTP id i10so7113070wrv.10
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2020 13:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=2OotSic3Nai8YgcYUQcrhOWadtl6K+8PLOgliuyZy5s=;
        b=kB9H7DOnHF8khxgaQUV5k+SgLfpjmXdZs0NaFCTfeERyRIX1BIqi/Hw7mgTl5i166B
         L9Tomlw/VCO3XVBc9p9I9HaYu7plDG1rtuJq26ndGZtEzktUhUW2+4BO1auWJXGkY0c6
         5WAGjEMle0FD8YD8Y4m79nlJlckNjmKy3nh+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=2OotSic3Nai8YgcYUQcrhOWadtl6K+8PLOgliuyZy5s=;
        b=jZGY1qoqh6yNY6ae6JSOyoBRBlS0VbEtZb02irlzvnwXfU44n9FEbbKgmEAV603I2Q
         mA0b0bra8mRQu4ERwwq5TAfz2PpRiMeMSAwrcFcwF1mlKI+XK4BiXe+/UiomC5B2g9oL
         A1UCOjfhJj8PkwUjpsaNfrPx+3fX5ZirSrK5xvrz2FJO5Pt7nZphtAGx2Ny5dXqmy7wT
         LZHvJ8aH3ZP7Ch8BW0grzhmqRavM3vTxe7VmogQxWGewnlmXviDBUopEFr2H4qhhO45U
         tGK721vaaXliRfnlsBO5wlQJZAYDsqzIBTcTkxxRXEzpf95mcKA6xaBcuVY0C/56DWi/
         CuHQ==
X-Gm-Message-State: AGi0Puatgyto9c4O5jbMEbKJn5lnvSqP1UacFlWBn+tWu/k9uQvAxFTt
	Z+OptrzZTFb/zj/ue35lbNeNbw==
X-Google-Smtp-Source: APiQypLWcIJQylABHpsFtL4B5yYwsqmhIbfjkgsnDmbAfDVJ1MCN38V49k6vCDXl719n6VpY8cpSHg==
X-Received: by 2002:a5d:4447:: with SMTP id x7mr10300075wrr.299.1587240477210;
        Sat, 18 Apr 2020 13:07:57 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ub1910 ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id x18sm36479696wrs.11.2020.04.18.13.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 13:07:56 -0700 (PDT)
Date: Sat, 18 Apr 2020 21:07:52 +0100
From: "Paul Barker" <pbarker@konsulko.com>
To: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6 06/10] oeqa: wic: Add tests for permissions and change-directory
Message-ID: <20200418210752.6b7727c8@ub1910>
In-Reply-To: <20200414133614.1830058-7-ricardo@ribalda.com>
References: <20200414133614.1830058-1-ricardo@ribalda.com>
	<20200414133614.1830058-7-ricardo@ribalda.com>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 14 Apr 2020 15:36:10 +0200
Ricardo Ribalda Delgado <ricardo@ribalda.com> wrote:

> Make sure that the permissions and username are respected when using all
> the rootfs modifiers.
>=20
> Add tests for change-directory command
>=20
> Cc: Paul Barker <pbarker@konsulko.com>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> ---
>  meta/lib/oeqa/selftest/cases/wic.py | 91 +++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest=
/cases/wic.py
> index 626a217e69..8ef08c3d77 100644
> --- a/meta/lib/oeqa/selftest/cases/wic.py
> +++ b/meta/lib/oeqa/selftest/cases/wic.py
> @@ -62,6 +62,12 @@ def extract_files(debugfs_output):
>      return [line.split('/')[5].strip() for line in \
>              debugfs_output.strip().split('/\n')]
> =20
> +def files_own_by_root(debugfs_output):
> +    for line in debugfs_output.strip().split('/\n'):
> +        if line.split('/')[3:5] !=3D ['0', '0']:
> +            print(debugfs_output)
> +            return False
> +    return True
> =20
>  class WicTestCase(OESelftestTestCase):
>      """Wic test class."""
> @@ -84,6 +90,7 @@ class WicTestCase(OESelftestTestCase):
>                  self.skipTest('wic-tools cannot be built due its (intlto=
ol|gettext)-native dependency and NLS disable')
> =20
>              bitbake('core-image-minimal')
> +            bitbake('core-image-minimal-mtdutils')
>              WicTestCase.image_is_ready =3D True
> =20
>          rmtree(self.resultdir, ignore_errors=3DTrue)
> @@ -506,6 +513,90 @@ part /part2 --source rootfs --ondisk mmcblk0 --fstyp=
e=3Dext4 --include-path %s"""
>                                        % (wks_file, self.resultdir), igno=
re_status=3DTrue).status)
>          os.remove(wks_file)
> =20
> +    def test_permissions(self):
> +        """Test permissions are respected"""
> +
> +        oldpath =3D os.environ['PATH']
> +        os.environ['PATH'] =3D get_bb_var("PATH", "wic-tools")
> +
> +        t_normal =3D """
> +part / --source rootfs --fstype=3Dext4
> +"""
> +        t_exclude =3D """
> +part / --source rootfs --fstype=3Dext4 --exclude-path=3Dhome
> +"""
> +        t_multi =3D """
> +part / --source rootfs --ondisk sda --fstype=3Dext4
> +part /export --source rootfs --rootfs=3Dcore-image-minimal-mtdutils --fs=
type=3Dext4
> +"""
> +        t_change =3D """
> +part / --source rootfs --ondisk sda --fstype=3Dext4 --exclude-path=3Detc=
/=C2=A0 =C2=A0
> +part /etc --source rootfs --fstype=3Dext4 --change-directory=3Detc
> +"""
> +        tests =3D [t_normal, t_exclude, t_multi, t_change]
> +
> +        try:
> +            for test in tests:
> +                include_path =3D os.path.join(self.resultdir, 'test-incl=
ude')
> +                os.makedirs(include_path)
> +                wks_file =3D os.path.join(include_path, 'temp.wks')
> +                with open(wks_file, 'w') as wks:
> +                    wks.write(test)
> +                runCmd("wic create %s -e core-image-minimal -o %s" \
> +                                       % (wks_file, self.resultdir))
> +
> +                for part in glob(os.path.join(self.resultdir, 'temp-*.di=
rect.p*')):
> +                    res =3D runCmd("debugfs -R 'ls -p' %s 2>/dev/null" %=
 (part))
> +                    self.assertEqual(True, files_own_by_root(res.output))
> +
> +                rmtree(self.resultdir, ignore_errors=3DTrue)
> +
> +        finally:
> +            os.environ['PATH'] =3D oldpath
> +
> +    def test_change_directory(self):
> +        """Test --change-directory wks option."""
> +
> +        oldpath =3D os.environ['PATH']
> +        os.environ['PATH'] =3D get_bb_var("PATH", "wic-tools")
> +
> +        try:
> +            include_path =3D os.path.join(self.resultdir, 'test-include')
> +            os.makedirs(include_path)
> +            wks_file =3D os.path.join(include_path, 'temp.wks')
> +            with open(wks_file, 'w') as wks:
> +                rootfs_dir =3D get_bb_var('IMAGE_ROOTFS', 'core-image-mi=
nimal')
> +                wks.write("part /etc --source rootfs --fstype=3Dext4 --c=
hange-directory=3Detc")
> +            runCmd("wic create %s -e core-image-minimal -o %s" \
> +                                       % (wks_file, self.resultdir))
> +
> +            part1 =3D glob(os.path.join(self.resultdir, 'temp-*.direct.p=
1'))[0]
> +
> +            res =3D runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part1))
> +            files =3D extract_files(res.output)
> +            self.assertIn('shadow', files)

This fails if `shadow` isn't part of the image:

2020-04-18 20:57:31,625 - oe-selftest - INFO - test_change_directory (wic.W=
ic)
2020-04-18 20:57:42,105 - oe-selftest - INFO -  ... FAIL
2020-04-18 20:57:42,105 - oe-selftest - INFO - Traceback (most recent call =
last):
  File "/home/pbarker/Projects/Yocto/poky/meta/lib/oeqa/selftest/cases/wic.=
py", line 639, in test_change_directory
    self.assertIn('shadow', files)
AssertionError: 'shadow' not found in [...]

> +
> +        finally:
> +            os.environ['PATH'] =3D oldpath
> +
> +    def test_change_directory_errors(self):
> +        """Test --change-directory wks option error handling."""
> +        wks_file =3D 'temp.wks'
> +
> +        # Absolute argument.
> +        with open(wks_file, 'w') as wks:
> +            wks.write("part / --source rootfs --fstype=3Dext4 --change-d=
irectory /usr")
> +        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minim=
al -o %s" \
> +                                      % (wks_file, self.resultdir), igno=
re_status=3DTrue).status)
> +        os.remove(wks_file)
> +
> +        # Argument pointing to parent directory.
> +        with open(wks_file, 'w') as wks:
> +            wks.write("part / --source rootfs --fstype=3Dext4 --change-d=
irectory ././..")
> +        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minim=
al -o %s" \
> +                                      % (wks_file, self.resultdir), igno=
re_status=3DTrue).status)
> +        os.remove(wks_file)
> +
>  class Wic2(WicTestCase):
> =20
>      def test_bmap_short(self):



--=20
Paul Barker
Konsulko Group
