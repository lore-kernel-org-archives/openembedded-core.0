Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 410E56A5B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 02:21:35 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id 4so8009466pdd.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 19:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=4tRuo4YBbWtdRlAyTxmtrkBYsNqRcO5wZumjWQupaiI=;
	b=djHRN+XdIyrw7evnGvc/CS/RIh+AcqRU6rDiyNDbTTYfTH3wxSz/3r+nLwiuTjqxtl
	hHQqMcLUoNa61BTXUhjYPCPleGxARPdD6WtuzX78irj69r5LhO7G9dxpxpjJXIB2Ho4s
	kb+7AdhguHjN/sWJkd+FC6AxcpzuPkMx9HtUDntCTnV0Amzk+W9qXCqiFcyZJFxWq01W
	PMz3LnqimacQCGCw9P82jAx4KcYSthcpM2U/onjtaXiIFpuTZPHiLbnH4CJJ8hdSHAWF
	HDqR+SWNKWhZXXMwSTJ88u6vZW8XoZS0Lo1iDVnfQU7dntLugmlKa0vyUh37bE0Uy8aI
	Fscg==
X-Received: by 10.68.222.74 with SMTP id qk10mr12439197pbc.58.1370917296253;
	Mon, 10 Jun 2013 19:21:36 -0700 (PDT)
Received: from [10.32.109.148] ([12.250.97.26])
	by mx.google.com with ESMTPSA id l4sm12483707pbo.6.2013.06.10.19.21.35
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 19:21:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1370015746-22465-1-git-send-email-mark.hatle@windriver.com>
Date: Mon, 10 Jun 2013 19:21:34 -0700
Message-Id: <7FC71AE1-8B85-4A2C-8E5D-A8A29DF05193@gmail.com>
References: <1370015746-22465-1-git-send-email-mark.hatle@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] gcc: add build directory to include directories
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
X-List-Received-Date: Tue, 11 Jun 2013 02:21:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

what happens if you use --disable-libunwind-exceptions

On May 31, 2013, at 8:55 AM, Mark Hatle <mark.hatle@windriver.com> =
wrote:

> From: "Roy.Li" <rongqing.li@windriver.com>
>=20
> Add build directory to include directories by -I${B}/include which =
will
> be searched before standard system include directories.
>=20
> Both libunwind and gcc supply unwind.h, once gcc use libunwind's =
unwind.h,
> the compiling will fail.
>=20
> This patch is generally not applicable to the upstream as they do not
> use libunwind.
>=20
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
> meta/recipes-devtools/gcc/gcc_4.7.bb | 2 +-
> meta/recipes-devtools/gcc/gcc_4.8.bb | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc_4.7.bb =
b/meta/recipes-devtools/gcc/gcc_4.7.bb
> index 9954375..f68c67a 100644
> --- a/meta/recipes-devtools/gcc/gcc_4.7.bb
> +++ b/meta/recipes-devtools/gcc/gcc_4.7.bb
> @@ -2,4 +2,4 @@ require recipes-devtools/gcc/gcc-${PV}.inc
> require gcc-configure-target.inc
> require gcc-package-target.inc
>=20
> -ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_INCDIR}"
> +ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_INCDIR} =
-I${B}/gcc/include/ "
> diff --git a/meta/recipes-devtools/gcc/gcc_4.8.bb =
b/meta/recipes-devtools/gcc/gcc_4.8.bb
> index 9954375..f68c67a 100644
> --- a/meta/recipes-devtools/gcc/gcc_4.8.bb
> +++ b/meta/recipes-devtools/gcc/gcc_4.8.bb
> @@ -2,4 +2,4 @@ require recipes-devtools/gcc/gcc-${PV}.inc
> require gcc-configure-target.inc
> require gcc-package-target.inc
>=20
> -ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_INCDIR}"
> +ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_INCDIR} =
-I${B}/gcc/include/ "
> --=20
> 1.8.3.rc1.25.g423ecb0
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


