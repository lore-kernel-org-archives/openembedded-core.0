Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f172.google.com (unknown [74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 59C576098B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 09:26:24 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id k48so77833wev.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 02:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:content-transfer-encoding:message-id:references:to;
	bh=Z1YMiNkl9n3goeBEaoIqBv07A1AOXVDIeox+p5eIHUI=;
	b=cMsC2jLrb9v693G2YBL/22CjQV+9hHqNYRysruV66oRTHW8Oa4dNdsqmudhPKMiAQe
	D6qMKv4tzxDDgmipF2ysdcXkhprVEzRw2F31OPBlSTLdnGYw5AKFndqNCoZuKCzwgUkH
	mjSD9kpqA79pxGv8MU655hhUYipER35WbaX4QLKNsRPHdZQq2rUA/O3KuxvqugoUZPZn
	XL46vYdYtuF73YQ/GpQ0mZ7WE+E6gelPYTyMLOyKpDZlaenj2mKcBSDoi0fRaoLFkUMu
	rIHdxIz0zO2oevrhVtz8xd5usoYS8xSQHD8xw3U7M237XgF7sjnUqGBHjH1XYQeAwN64
	AiYQ==
X-Gm-Message-State: ALoCoQmNp5kNXDESAsx3xNheN6+dFbV5uiPo/G2vLCjd82bHnCFVzO2BPRLTbvR8lIsFYJ4GN/Td
X-Received: by 10.180.206.205 with SMTP id lq13mr19906496wic.11.1399973185221; 
	Tue, 13 May 2014 02:26:25 -0700 (PDT)
Received: from ?IPv6:2001:610:612::d90e:8256:7752:a01e?
	([2001:610:612:0:d90e:8256:7752:a01e])
	by mx.google.com with ESMTPSA id fq2sm20900591wib.2.2014.05.13.02.26.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 13 May 2014 02:26:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen.kooi@linaro.org>
In-Reply-To: <1399966241-25745-1-git-send-email-koen.kooi@linaro.org>
Date: Tue, 13 May 2014 11:26:24 +0200
Message-Id: <6A2B2269-AA5F-4AFD-AC4F-F02B519F05DC@linaro.org>
References: <1399966241-25745-1-git-send-email-koen.kooi@linaro.org>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1874)
Subject: Re: [RFC][PATCH] curl: work around RRECOMMENDS problems in -native* recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 May 2014 09:26:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Op 13 mei 2014, om 09:30 heeft Koen Kooi <koen.kooi@linaro.org> het =
volgende geschreven:

> Both curl-native and git-(replacement-)native need ca-certs installed =
to support https:// but since PACKAGES is reset to "" R* variables don't =
work and ca-certs don't end up in sysroot. Adding it to DEPENDS works =
around this.

And here's the error message

WARNING: Failed to fetch URL =
git://github.com/kernelslacker/trinity.git;protocol=3Dhttps, attempting =
MIRRORS if available
ERROR: Fetcher failure: Fetch command failed with exit code 128, output:
Cloning into bare repository =
'/build/linaro/build/build/downloads/git2/github.com.kernelslacker.trinity=
.git'...
fatal: unable to access 'https://github.com/kernelslacker/trinity.git/': =
error setting certificate verify locations:
  CAfile: =
/build/linaro/build/build/tmp-eglibc/sysroots/x86_64-linux/etc/ssl/certs/c=
a-certificates.crt
  CApath: none

ERROR: Function failed: Fetcher failure for URL: =
'git://github.com/kernelslacker/trinity.git;protocol=3Dhttps'. Unable to =
fetch URL from any source.
ERROR: Logfile of failure stored in: =
/build/linaro/build/build/tmp-eglibc/work/aarch64-oe-linux/trinity/1.3-r0/=
temp/log.do_fetch.7843
ERROR: Task 1378 =
(/build/linaro/build/meta-linaro/meta-linaro/recipes-extra/trinity/trinity=
_1.3.bb, do_fetch) failed with exit code '1'

The bad news: the postinst needs to run for -native* as well :(

--
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs




>=20
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
> meta/recipes-support/curl/curl_7.36.0.bb | 7 +++++--
> 1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-support/curl/curl_7.36.0.bb =
b/meta/recipes-support/curl/curl_7.36.0.bb
> index f3401fa..affc2e1 100644
> --- a/meta/recipes-support/curl/curl_7.36.0.bb
> +++ b/meta/recipes-support/curl/curl_7.36.0.bb
> @@ -6,8 +6,11 @@ LICENSE =3D "MIT"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;beginline=3D7;md5=3D3a34942f4ae3fbf1a303160714e664ac"
>=20
> DEPENDS =3D "zlib gnutls"
> -DEPENDS_class-native =3D "zlib-native openssl-native"
> -DEPENDS_class-nativesdk =3D "nativesdk-zlib"
> +
> +# RDEPENDS/RRECOMMENDS don't work for -native, so add ca-certs to =
DEPENDS to install=20
> +# them into sysroot to make https:// work for curl and git
> +DEPENDS_class-native =3D "zlib-native openssl-native =
ca-certificates-native"
> +DEPENDS_class-nativesdk =3D "nativesdk-zlib =
ca-certificates-nativesdk"
>=20
> SRC_URI =3D "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>            file://pkgconfig_fix.patch \
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


