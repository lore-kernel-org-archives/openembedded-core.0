Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.6088.1630419049892108280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 07:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=nPgVyBos;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1630419050;
  x=1661955050;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=C7gGX/LATWJHvInOARlVD4NGtZaUgL3Rx7B+MpuUVF8=;
  b=nPgVyBos0BfUVHKV+pOjIn7pCvKoOnkGCQpz3Z50dwDWtznIUepKhnb3
   tdgcJNaLi5m8dz1pyM+ieQuOm/dRF4LL8hv1mdSUf9ELCRR4sUebLG1Wz
   jzsVkbPRs0acUDC5UEOkTsIUtCAYU2xJLpTfsKK+fB5vtpPxEipshhdFS
   DqEZue3QujZ97Np/g/J9piUnlHK/uRvS2o0eAvUESUlWKWmeOL0BQ/+ub
   9Nxi+44kM4jXf3dIrkJff3FkMxyYuepcsMI/CNnGg5DKsXLFUAeqUd5rs
   dO/IFZEU2RfGBjRUyMFs6nuNaed2rH1f2p0FEyBdlyuwan7BxFKfr+LNE
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] oeqa/buildtools-cases: Allow bitbake time to shutdown
Thread-Topic: [OE-core] [PATCH] oeqa/buildtools-cases: Allow bitbake time to
 shutdown
Thread-Index: AQHXnmpSdmHt7t206Em5mRwWcDundKuNpuQA
Date: Tue, 31 Aug 2021 14:10:47 +0000
Message-ID: <7864781c8f9c4c1aa207dc937f445131@axis.com>
References: <20210831131540.867057-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210831131540.867057-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 31 augusti 2021 15:16
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] oeqa/buildtools-cases: Allow bitbake time to
> shutdown
>=20
> bitbake may still be shutting down when the UI exists. Wait for the lock

I assume you mean "exits" rather than "exists"?

//Peter

> to disappear before trying to delete the directory to avoid errors.
>=20
> Traceback (most recent call last):
>   File "/home/pokybuild/yocto-
> worker/buildtools/build/meta/lib/oeqa/sdk/buildtools-cases/build.py", lin=
e
> 23, in test_libc
>     self._run('. %s/oe-init-build-env %s && bitbake virtual/libc' %
> (corebase, testdir))
>   File "/usr/lib64/python3.7/tempfile.py", line 807, in __exit__
>     self.cleanup()
>   File "/usr/lib64/python3.7/tempfile.py", line 811, in cleanup
>     _shutil.rmtree(self.name)
>   File "/usr/lib64/python3.7/shutil.py", line 494, in rmtree
>     _rmtree_safe_fd(fd, path, onerror)
>   File "/usr/lib64/python3.7/shutil.py", line 452, in _rmtree_safe_fd
>     onerror(os.unlink, fullname, sys.exc_info())
>   File "/usr/lib64/python3.7/shutil.py", line 450, in _rmtree_safe_fd
>     os.unlink(entry.name, dir_fd=3Dtopfd)
> FileNotFoundError: [Errno 2] No such file or directory: 'bitbake.sock'
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/sdk/buildtools-cases/build.py | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oeqa/sdk/buildtools-cases/build.py
> b/meta/lib/oeqa/sdk/buildtools-cases/build.py
> index 5a17ab98c6c..a69e4a2443f 100644
> --- a/meta/lib/oeqa/sdk/buildtools-cases/build.py
> +++ b/meta/lib/oeqa/sdk/buildtools-cases/build.py
> @@ -3,6 +3,7 @@
>  #
>=20
>  import os, tempfile
> +import time
>  from oeqa.sdk.case import OESDKTestCase
>  from oeqa.utils.subprocesstweak import errors_have_output
>  errors_have_output()
> @@ -20,4 +21,10 @@ class BuildTests(OESDKTestCase):
>                  conf.write('\n')
>                  conf.write('DL_DIR =3D "%s"\n' % self.td['DL_DIR'])
>=20
> -            self._run('. %s/oe-init-build-env %s && bitbake virtual/libc=
'
> % (corebase, testdir))
> +            try:
> +                self._run('. %s/oe-init-build-env %s && bitbake
> virtual/libc' % (corebase, testdir))
> +            finally:
> +                delay =3D 10
> +                while delay and os.path.exists(testdir +
> "/build//bitbake.lock"):
> +                    time.sleep(1)
> +                    delay =3D delay - 1
> --
> 2.32.0

