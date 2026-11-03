Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11818.1793714591836859463
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 06:03:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wUhDRBuv;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 83BB71A1415
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Nov 2026 14:03:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 567616046C;
	Tue,  3 Nov 2026 14:03:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 18905103291EE;
	Tue,  3 Nov 2026 15:03:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793714585; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EYzzoRhBWmRUIsCpFXndBsu6MRytOyE4tRZa2l/4GWU=;
	b=wUhDRBuv+XTIghFIEFoK4inpakjkJVxd8CiXxZfaMY9klfA8GmHTVqRcCgVLSOwYtYZier
	9AnYNB03WG/EqUhaiUcFFhsnBg1cU5q2WOxT0v9237cZxNlaVBoqeDKP6AZo2pYt6MvH2P
	5JColYqsjBx5TfMmCCTbiAMPq5APcaz1BD6j8XT+/Vl0ID+3msW34q2YWVC5pawoNsPThh
	HIZOdENKXKhsd4uGy68Y+dC2yKpUnsNpp6h8Z4/EVeNRi3GzivtaMOnHek4MEK62sY51ww
	ddHe9j0zWmSaBq1hbThTzVuZ9lSrUUplr9GDhQbfPJM7XjAEXo+aHDvkBLDMZA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Nov 2026 15:03:03 +0100
Message-Id: <DMLMR3WP1E5A.M59CDZB7EE06@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5 3/3] python3: Upgrade 3.14.10 -> 3.15.2
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
 <20261102080823.31025-1-jaipaul.cheernam@est.tech>
 <20261102080823.31025-4-jaipaul.cheernam@est.tech>
In-Reply-To: <20261102080823.31025-4-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 14:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249281

On Mon Nov 2, 2026 at 9:08 AM CET, Jaipaul Cheernam wrote:
> ReleaseNotes: https://docs.python.org/3/whatsnew/changelog.html#python-3-=
15-2-final
>
> - Drop patches which are part of upstream release
>   - 0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch
>   - 0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch
>   - 0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch
>   - valid-dists.patch
> - Add --without-system-libmpdec as EXTRA_OECONF configure option
>   (--with-system-libmpdec is needed new package mpdecimal [1])
> - Bump PYTHON_BASEVERSION to 3.15 in python3-dir.bbclass
> - Update python3-manifest
> - Refresh existing patches
> - Add two fixes needed for the new release
>   - 0001-gh-160881-Fix-test_is_python_process_non_python_subp.patch
>   - 0001-configure-clear-RUNSHARED-when-cross-compiling.patch
>
> Verification:
> - Built python3 for glibc and musl
> - verified ptest for all 34 python3 packages which supports ptest
>
> [1] https://github.com/python/cpython/issues/115119
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Another issue, sorry. With python3-wcwidth ptest:

Failed ptests:
{'python3-wcwidth': 'START: ptest-runner\n'
                    '2026-11-03T11:04\n'
                    'SKIP: '
                    'tests/test_fastcall_args.py:tests/test_fastcall_args.p=
y # '
                    "SKIP could not import 'wcwidth._wcwidth_c': No module =
"
                    "named 'wcwidth._wcwidth_c'\n"
                    'SKIP: tests/test_setup.py:tests/test_setup.py # SKIP '
                    "could not import 'setuptools': No module named "
                    "'setuptools'\n"
                    '\n'
                    '@pytest.fixture(autouse=3DTrue)\n'
                    '    def _verify_extension_mode():\n'
                    '        """\n'
                    '        Assert the loaded implementation matches the '
                    'WCWIDTH_PYTHON env var.\n'
                    '    \n'
                    '        In extension mode the C extension must be acti=
ve; '
                    'in Python mode it must not be, so a silently-\n'
                    '        failed C build is caught in CI.\n'
                    '        """\n'
                    '        # local\n'
                    '        import wcwidth\n'
                    '    \n'
                    "        if os.environ.get('WCWIDTH_PYTHON', ''):\n"
                    '            assert not wcwidth.HAS_C_EXTENSION, "C '
                    'extension loaded in Python mode"\n'
                    '        else:\n'
                    '>           assert wcwidth.HAS_C_EXTENSION, "C extensi=
on '
                    'not loaded in extension mode"\n'
                    'E           AssertionError: C extension not loaded in =
'
                    'extension mode\n'
                    'E           assert False\n'
                    "E            +  where False =3D <module 'wcwidth' from=
 "
                    "'/usr/lib/python3.15/site-packages/wcwidth/__init__.py=
'>.HAS_C_EXTENSION\n"
                    '\n'
                    'tests/conftest.py:27: AssertionError\n'
                    'ERROR: '
                    'tests/test_ambiguous.py:test_wcwidth_ambiguous_default=
[\\xa1-INVERTED_EXCLAMATION]\n'
                    '\n'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1508

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

