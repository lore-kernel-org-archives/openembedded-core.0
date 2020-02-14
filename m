Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6AB3A610AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 14:47:05 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id w47so7088978qtk.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 06:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=KGzTTo9kgeR6p0bHoy8fMX5BOSzF0snpqnfMz3bPrt8=;
	b=Zu+8VuXznFBmAbiU5XE04mMyGcuJdBg3G384McCpNEGPpLz+gAQL6Z67yiKRSvM0sT
	AuVb/BGNoy+144N8QavwtBHWVH+rpajcQLdt8X2Ln6MuBMP7Vzb6Kkyl5aSdlgEa1Czx
	g8WK5HfbyFLbKkt6rynRU+3lyOclQJaFtkzuTDoFE0MsheBRdf/IWjvacAHn023glhN3
	tTw5ReDwyOFB+GTbIv1XuugKYWWz61Y8jT2f7wsVzN92uSQ5OW1czvdS47oVBwico3l8
	nZozgLFm1v8TSebDqzzWzF/LKPZYq8QjDEBqyAazKvG+dhIPkRsDse6C1msckXA5yEz+
	Jewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=KGzTTo9kgeR6p0bHoy8fMX5BOSzF0snpqnfMz3bPrt8=;
	b=OfRpMDUat/iXemoVng4LAY+MCmxrqF7aIwxSAHBby1xqenewoO4EwSJWxy6Sg8G/by
	XKdRPyGpfDdG3YREuB7+7JvHd9EBbr7FG0mqNrWa5itQNUOXZ2gXWHUwpdagH3CqutQJ
	3Wb60Sc1JoaHWgfEy9rY8zTrPD4Uv34IsfLlfhb/i9KhTTgiI+pAf37zEwgVZwT292sw
	PxrjZaL78hduJEbLRak0C5qjktRdjrFI+QRLcXTJyevPa/3HE7DZr4O3/K4UQ/Ms3kJD
	mCkDWPLtZnZEoAvqe//NrMHnjtuLzZsxBrFOTxhW9PFAXgRpOP6zhngT/UW+lpgBJNf8
	Zp9g==
X-Gm-Message-State: APjAAAXPK4ZoR8d9F72DkogvM9MKA5hwF9jWeVWUh3vrpgtURkFPXvbn
	TBj46UtA9fHrOpnPnwg8gt35OPhZ2ZfpHxyvFVY=
X-Google-Smtp-Source: APXvYqy0SNO5iBnOl7Sn1Rd+9/JxV994Tgbl1LVeHy6qt0qYq5P3skgRDUlV8FvTFDaXQKoc6DRezYY4sd1Cqm5SL14=
X-Received: by 2002:ac8:1a30:: with SMTP id v45mr2765600qtj.80.1581691625924; 
	Fri, 14 Feb 2020 06:47:05 -0800 (PST)
MIME-Version: 1.0
References: <20200214130238.20381-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200214130238.20381-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Feb 2020 06:46:39 -0800
Message-ID: <CAMKF1sqnFuCbDiRZi9=Cok9+9_+coVb8U6ot+CKSrD60rcp_hQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] staging: Handle races between binaries and their libs
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
X-List-Received-Date: Fri, 14 Feb 2020 14:47:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2020 at 5:03 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> There is a long standing issue where a binary could be installed into the
> sysroot before its library dependencies. We've always argued nothing shou=
ld
> use the binary until its been installed by a dependency but there are iss=
ues
> around binaries which conflict with the host system, for example patch,
> python3, gzip and more.
>
> With the recent patch changes we've see issues like:
> ERROR: gdb-cross-canadian-powerpc-8.3.1-r0 do_patch: Command Error: 'quil=
t --quiltrc /home/pokybuild/yocto-worker/qemuppc/build/build/tmp/work/x86_6=
4-nativesdk-pokysdk-linux/gdb-cross-canadian-powerpc/8.3.1-r0/recipe-sysroo=
t-native/etc/quiltrc push' exited with 0  Output:
> Applying patch 0009-Change-order-of-CFLAGS.patch
> patch: /lib64/libattr.so.1: version `ATTR_1.3' not found (required by pat=
ch)
> Patch 0009-Change-order-of-CFLAGS.patch does not apply (enforce with -f)
>
> which is a symptom of this issue (libattr-native is a dependency of patch=
-native).
>

ah so this was the problem I wondered

> There are other ways to fix this such as disabling libattr in patch, inst=
alling
> patch to a subdirectory and requiring PATH manipulation and so on.
>
> We can simply fix the staging code to handle /bin/ after everything else =
so lets
> do that and avoid all these other complications.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/staging.bbclass | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
> index 4dd2ed01010..530e23b1853 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -470,6 +470,7 @@ python extend_recipe_sysroot() {
>          elif os.path.lexists(depdir + "/" + c):
>              os.unlink(depdir + "/" + c)
>
> +    binfiles =3D {}
>      # Now handle installs
>      for dep in configuredeps:
>          c =3D setscenedeps[dep][0]
> @@ -562,7 +563,16 @@ python extend_recipe_sysroot() {
>                      if l.endswith("/"):
>                          staging_copydir(l, targetdir, dest, seendirs)
>                          continue
> -                    staging_copyfile(l, targetdir, dest, postinsts, seen=
dirs)
> +                    if "/bin/" in l:
> +                        # defer /bin/* files until last in case they nee=
d libs
> +                        binfiles[l] =3D (targetdir, dest)
> +                    else:
> +                        staging_copyfile(l, targetdir, dest, postinsts, =
seendirs)
> +
> +    # Handle deferred binfiles
> +    for l in binfiles:
> +        (targetdir, dest) =3D binfiles[l]
> +        staging_copyfile(l, targetdir, dest, postinsts, seendirs)
>
>      bb.note("Installed into sysroot: %s" % str(msg_adding))
>      bb.note("Skipping as already exists in sysroot: %s" % str(msg_exists=
))
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

