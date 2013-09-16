Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id B7A3B60F28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 17:09:39 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id rp2so4360643pbb.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 10:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=73cJdEFIzfjiI1AHfPPMUwu3oN0gv1YiSI30f4aeICQ=;
	b=qavvfxops13NtVzPnIrP8oemeubGKiAt0HsnZJ/5sDW8swdQAWLeJpySwkvONxyGmn
	RHcyWxIC43S+ZaX8P1Jtk6uLVmNq68CGBfSNJf4NBmonvUgzElo2UJRysLGtqbZ1EqIp
	w9d0FWWAVdwtUbRFaXVkZIp5vr2k5tLMCEY9yO6BMkOa0fIbJbaxl67X88L/xSY/TPJb
	HjfYDs7FFlxWi+0+Ba+CBtDaLgkhW36/tB/u5CupP8pWbxHhc70N/RAQiSQlu7hXKzAI
	AIy/7VTFnYhD4Q7kk+rqLvPQq8eG830zmwxTar5KESuPH19Xrn4YANBovBQv5+FE4qkw
	L8Iw==
X-Received: by 10.67.30.100 with SMTP id kd4mr32505777pad.24.1379351381238;
	Mon, 16 Sep 2013 10:09:41 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	im2sm32409463pbd.31.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 10:09:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <dd0104c4f2811038c1ee78605e6b81a50045f5f6.1379329974.git.hongxu.jia@windriver.com>
Date: Mon, 16 Sep 2013 10:09:41 -0700
Message-Id: <C187B0ED-19E6-47C1-AD22-CF80F1EC19B3@gmail.com>
References: <cover.1379329974.git.hongxu.jia@windriver.com>
	<dd0104c4f2811038c1ee78605e6b81a50045f5f6.1379329974.git.hongxu.jia@windriver.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Mailer: Apple Mail (2.1510)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] libxml2: fix LSB desktop-xml tests failure
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
X-List-Received-Date: Mon, 16 Sep 2013 17:09:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Sep 16, 2013, at 4:14 AM, Hongxu Jia <hongxu.jia@windriver.com> =
wrote:

> The commit
> =
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D8780c5ddf2916b=
bd42fc67b79c286652aebb1546
> add a patch to fix a security issue. It modify include file 'tree.h'
> to add 'const char *dummy_children' on 'struct _xmlNs'.
>=20
> But lsb test suites didn't do this in his own include file, so the LSB
> desktop-xml tests failed.

IMO the testcase should be fixed. This is security patch that you are =
disabling. I don't think LSB compliance
should mean less secure

>=20
> Disable this patch for linuxstdbase could fix this issue.
>=20
> [YOCTO #5151]
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
> meta/recipes-core/libxml/libxml2_2.9.1.bb | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.1.bb =
b/meta/recipes-core/libxml/libxml2_2.9.1.bb
> index fa9c657..3b031a1 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.1.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.1.bb
> @@ -1,6 +1,9 @@
> require libxml2.inc
>=20
> -SRC_URI +=3D "file://libxml2-CVE-2012-2871.patch \
> +LIBXML2_CVE =3D "file://libxml2-CVE-2012-2871.patch"
> +LIBXML2_CVE_linuxstdbase =3D ""
> +
> +SRC_URI +=3D "${LIBXML2_CVE} \
>             =
http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=3Dtesttar \
> 	   "
>=20
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


