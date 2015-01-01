Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9080C720D6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jan 2015 01:26:01 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id lf10so22061328pab.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 17:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Ge05G5z8Lr9t1Qi8B/5dF0Ne3Tqrw1iE1BFwQxuDWIQ=;
	b=oFfCCXE+t6HcU1w9u4PyZPZaS7eHmUCYTZsI1mVRMxjq2rxzDLgiCWiTTekKSoSmKm
	a584eZfFfP2wOAdCgcBVH7hSLIWAtBHivXW/aohrVJBQaNCnH3QrCdi6sOkmOX5TGfok
	HuKyocx469I92HI1gi1VQ+6ajchxnqYIgz6V1fURIE6W8XMJe9MvwrPJ1sSoe8cJpoWj
	OGUBbnjHLMm3vYzsCkLGMXB2FJKZj3KoCb6KwRznBYodhHlGuucjpUqSvBxZpHo30JZy
	QWa1XprB9mHXyWiLKgNrer+mPspEmkC3VpL3QHs+w4AZfFsNmbCSdc6I6WRco/h6uJcq
	Sm1w==
X-Received: by 10.70.96.162 with SMTP id dt2mr110809533pdb.57.1420075561896;
	Wed, 31 Dec 2014 17:26:01 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:91e4:f8f7:9c14:a30c?
	([2601:9:3580:84c:91e4:f8f7:9c14:a30c])
	by mx.google.com with ESMTPSA id v8sm42284448pdp.94.2014.12.31.17.26.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 31 Dec 2014 17:26:01 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <0ea1de1c5e4859d675eb6fd202a3cb8bd4090786.1418885581.git.kai.kang@windriver.com>
Date: Wed, 31 Dec 2014 17:25:59 -0800
Message-Id: <C584909B-80AD-4600-97C2-032C73C03F62@gmail.com>
References: <cover.1418885577.git.kai.kang@windriver.com>
	<0ea1de1c5e4859d675eb6fd202a3cb8bd4090786.1418885581.git.kai.kang@windriver.com>
To: Kai Kang <kai.kang@windriver.com>
X-Mailer: Apple Mail (2.1993)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 11/19] guile: allow compilation for aarch64
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
X-List-Received-Date: Thu, 01 Jan 2015 01:26:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Dec 18, 2014, at 12:51 AM, Kai Kang <kai.kang@windriver.com> wrote:
>=20
> From: Joe Slater <jslater@windriver.com>
>=20
> Add aarch64 endianness specification to scm file.
>=20
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
> meta/recipes-devtools/guile/files/arm_aarch64.patch | 19 =
+++++++++++++++++++
> meta/recipes-devtools/guile/guile_2.0.11.bb         |  1 +
> 2 files changed, 20 insertions(+)
> create mode 100644 meta/recipes-devtools/guile/files/arm_aarch64.patch
>=20
> diff --git a/meta/recipes-devtools/guile/files/arm_aarch64.patch =
b/meta/recipes-devtools/guile/files/arm_aarch64.patch
> new file mode 100644
> index 0000000..f1788b6
> --- /dev/null
> +++ b/meta/recipes-devtools/guile/files/arm_aarch64.patch
> @@ -0,0 +1,19 @@
> +guile: add aarch64 recognition
> +
> +Assume little-endian.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: joe.slater@windriver.com
> +
> +--- a/module/system/base/target.scm
> ++++ b/module/system/base/target.scm
> +@@ -70,6 +70,8 @@
> +             ((member cpu '("sparc" "sparc64" "powerpc" "powerpc64" =
"spu"
> +                            "mips" "mips64"))
> +              (endianness big))
> ++            ((string-match "^aarch64" cpu)
> ++             (endianness little))

While you are at it. can you also set it for aarch64_be case as well ?



