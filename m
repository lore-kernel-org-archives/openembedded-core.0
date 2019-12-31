Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id E77E57FC22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 19:11:22 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id d18so29397591qtj.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 11:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tTmVMYCOyVwMOQytRypYxS/Mcgeou3QQiQ7ipjDRBpU=;
	b=VQMOuJFQUhczllRwyzfZnd2WFBxfoEQNxIS9o1VodMy98gtXhd4+vbCIcLw41fTCGn
	rIO/19CDvEtBwLUsjIDJyMhDr/XbRmx8xM0NygtwaECcv+PARP4Adu7UsoDQceDK0vYd
	xdAGHqzFOZsSUwuVyJF6vGiacHTCOOt8rzoNyYYo3fHA8Jgjjf79PSUO2EmvlZ/GbjSo
	l9xttpHJptXtCOFHPiCDwvBXpYYLTfADNYLOfc3cHqHxN6qWGAD6GXpPMMbn1+8ve/hi
	oGA0LKXXGGkqOvVVAP9uw5wI32OetG6EQ4Ya69Hxl+crFJo4G0mCTE1NHklF62hwdFof
	5fsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tTmVMYCOyVwMOQytRypYxS/Mcgeou3QQiQ7ipjDRBpU=;
	b=CWrJ/nGF9NdnFOfHkBU6xC1njBbxpto4erZiv7RQYeXnkSKZGf2cYpsBV6UE+6q+s5
	jVGePOyWPjteTczrX3AO0WkRdBUZvL9aTChh7S94R+TQMR6ze5GsScrRl7iNUU2qoXUh
	KpCeGBeg84lUK0ZmkLRZpiZI+i7YpkuU9QsDPV0A5d6hOI/jS9QvI0NzsfmyMx6egrtQ
	PUUu5nH5eutsSJP9UD3wzkjn43VDK70Q1Cn8BPb2ilgEDXPlTQYAq24pJkJnvcm+Pkeb
	5lj/Jck6S8RI3sekw4GVDaCrzhRuLSPj/UvpBUQcukyFxnvUHyzao6HhCzJLrVrsHp1l
	bWWg==
X-Gm-Message-State: APjAAAUKZtdR+7jYsFxe2SH0avST1XD3RQGA2PRPpOLNwqSWv+PpHzzR
	JIDMbuCIPQbHU7A/K/WXsWeTaaGESGUPuOT3GHw=
X-Google-Smtp-Source: APXvYqzjSov/vAg/gaKgN0PJtQx5ORaPhyE9py0JIDA2+5Bz21xQY8kcKBtXMyxOB+og6o53HlgzR78SqEL5KrNL06g=
X-Received: by 2002:ac8:7592:: with SMTP id s18mr44198294qtq.378.1577819483607;
	Tue, 31 Dec 2019 11:11:23 -0800 (PST)
MIME-Version: 1.0
References: <20191230205941.1878175-1-JPEWhacker@gmail.com>
	<20191231190657.2411408-1-JPEWhacker@gmail.com>
In-Reply-To: <20191231190657.2411408-1-JPEWhacker@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Dec 2019 11:11:01 -0800
Message-ID: <CAMKF1srq0Y67L7bKRSCREfjJ6G23M+UuxVJh=C69ugt3CUjrXQ@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python3: RDEPEND on libgcc
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
X-List-Received-Date: Tue, 31 Dec 2019 19:11:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 31, 2019 at 11:07 AM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> Python uses features of glibc that require it to dynamically load (i.e.
> dlopen()) libgcc_s at runtime. However, since this isn't a link time
> dependency, it doesn't get picked up automatically by bitbake so
> manually add it to RDEPENDS.
>
> There is an outstanding bug in Python to make it explicitly link against
> libgcc at link time which would remove the need for this. See:
> https://bugs.python.org/issue37395
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-devtools/python/python3_3.7.5.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3_3.7.5.bb b/meta/recipes-devtools/python/python3_3.7.5.bb
> index 137b540dba..78312b05f3 100644
> --- a/meta/recipes-devtools/python/python3_3.7.5.bb
> +++ b/meta/recipes-devtools/python/python3_3.7.5.bb
> @@ -306,6 +306,8 @@ RPROVIDES_${PN}-venv += "python3-pyvenv"
>  PACKAGES =+ "libpython3 libpython3-staticdev"
>  FILES_libpython3 = "${libdir}/libpython*.so.*"
>  FILES_libpython3-staticdev += "${prefix}/lib/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}-*/libpython${PYTHON_BINABI}.a"
> +# See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
> +RDEPENDS_libpython3 += "libgcc"

while this is glibc specific change depending on gcc runtime, it seems
we should only apply is when we use gcc runtime and glibc

glibc part is easy just use libc-glibc override for gcc runtime piece
perhaps, its good to introduce, virtual/compiler-runtime and let
libgcc
provide it by default, but let apps depend on virtual/compiler-runtime


>  INSANE_SKIP_${PN}-dev += "dev-elf"
>
>  # catch all the rest (unsorted)
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

