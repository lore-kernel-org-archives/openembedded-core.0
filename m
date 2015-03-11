Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5896C73AB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 02:43:45 +0000 (UTC)
Received: by pabrd3 with SMTP id rd3so7383082pab.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 19:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=/zIpnQMuecFA4DDlb9654R16vA5VxY4DsLVxte6hoWM=;
	b=rHPf0hdfHZKecxR5+TxddJUxN5uhve6ij3U0RwzmEoYF2VJjXOtB6BKzv7890u8OHV
	5wLUZk4RKdSZYDs3aAqCDOITh7jjdjhaNOm2oe5jD2qYcOfhu1HCph8EX0SaTDab+uD0
	CN/EF/k/d8Aajr62u0ZVyI3zhiPnc81880eg0gKOw3vNf4u3Ou94VCqHU7Rh6rhNAi81
	Mw5eD61lb9H79ZnOkciMZy61GWzkLR2O9y/nUZuUzTbYNZwI9ibWQoxSyrQiJolP6bEh
	ppS6dlJKm/uATtWCQFeQwiIbwMCK/5qbCWyiAJYImA2SnZS2E7RAgQPKWW0OfdzG3mk2
	28Fg==
X-Received: by 10.70.123.131 with SMTP id ma3mr44055992pdb.16.1426041826393;
	Tue, 10 Mar 2015 19:43:46 -0700 (PDT)
Received: from 10.25.113.106-ra01.pleasanton.ca.sfba.comcast.net
	([69.241.124.150])
	by mx.google.com with ESMTPSA id t5sm3162460pdn.58.2015.03.10.19.43.45
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Mar 2015 19:43:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1426041185-27916-1-git-send-email-net147@gmail.com>
Date: Tue, 10 Mar 2015 19:43:44 -0700
Message-Id: <5AFC8E79-5AD6-4CED-BE24-98C2A6D6F944@gmail.com>
References: <1426041185-27916-1-git-send-email-net147@gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dizzy][PATCH] libunwind: backport patch to link against libgcc_s intead of libgcc
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
X-List-Received-Date: Wed, 11 Mar 2015 02:43:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Mar 10, 2015, at 7:33 PM, Jonathan Liu <net147@gmail.com> wrote:
>=20
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
> ...-libunwind-to-libgcc_s-rather-than-libgcc.patch | 42 =
++++++++++++++++++++++
> meta/recipes-support/libunwind/libunwind_1.1.bb    |  1 +
> 2 files changed, 43 insertions(+)
> create mode 100644 =
meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-ra=
ther-than-libgcc.patch
>=20
> diff --git =
a/meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-=
rather-than-libgcc.patch =
b/meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-=
rather-than-libgcc.patch
> new file mode 100644
> index 0000000..0e55c91
> --- /dev/null
> +++ =
b/meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-=
rather-than-libgcc.patch
> @@ -0,0 +1,42 @@
> +=46rom 508ca17a7be01d1cc960d9a07d0af4513948fb8d Mon Sep 17 00:00:00 =
2001
> +From: Thierry Reding <treding@nvidia.com>
> +Date: Fri, 27 Jun 2014 08:40:33 +0200
> +Subject: [PATCH] Link libunwind to libgcc_s rather than libgcc
> +
> +For some architectures, -lgcc and -lgcc_s are not equivalent. On ARM =
for
> +example, libgcc_s.so.1 contains some symbols needed by libunwind =
which
> +are not present in libgcc.
> +
> +This causes the following link error when building the X.Org X server
> +with libunwind support:
> +
> +	  CCLD     Xorg
> +	/usr/lib/libunwind.so: undefined reference to =
`__aeabi_unwind_cpp_pr0'
> +	/usr/lib/libunwind.so: undefined reference to =
`__aeabi_unwind_cpp_pr1'
> +
> +Linking against libgcc_s explicitly solves this problem.
> +

have you tried it at runtime too ?


