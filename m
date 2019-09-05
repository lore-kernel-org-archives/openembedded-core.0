Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by mail.openembedded.org (Postfix) with ESMTP id 926097F2D9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 14:43:03 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id x18so2810714ljh.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 07:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=RUoc/DBCNDNi17GmrdvvhvWNd1H1hLCH1HIoLAzqTvI=;
	b=v9zjetsZSFkMFc8saQ70dkJgZqiic0gSYB4QiyhuWWg/ZyOMpT71lGqnhClV5AoOpS
	zt3y+e9/6uBWR6GYtmG/ZVMPxeoJJVEI7lYjI3tvQC7R37MeKpmp4s6hrLdVznljPXRz
	b15zBtA0oQmIXGEyImkUR5nKz40G7zYoy3ZqfFlDtYr6mKqrZawsRdbodgL5cKvTewQs
	KMWaghkJKeUhy+H78bOX90w7JXyB/WUWHlsc/1pu3P9BuYiMo3RyKqJvnfJsHCXi3YH7
	M7P/U9251ZaY7uGd7+pJ/ylEskY9GbXKxXy3BeOQj/5+r+MoPGOBLm6e2TM8aJ9ZaflK
	iAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=RUoc/DBCNDNi17GmrdvvhvWNd1H1hLCH1HIoLAzqTvI=;
	b=dYM9PTPnLeFTmTbi5IOR5uNl9OTI3X/rxi+DRWn0hcYefPDwkEO3D0zrZrRGXcG0nL
	ecuEE7OodOntZpotgo2xmttUGHSlxgyrL7zLopiTHlqaxTnHeCIoEZkPxMz05fvPLOi2
	AAZW97Q4kLNvmBEWge4fHC1N1yT8WgKh4ohUNXJ6Fg8juuZbAEHR9mpCoFmHjWxSQQRR
	98b8NnQGFB9z6T/cz6rqJ+EBjusrKpowY+Fo0IvYzeQUCes94X4mFN6NQYiGDbsWL4B2
	UNwc2Kf/4KlABgzdiUbVPJG4n1OJBYY1NXtF6USPRF54xOh73CjvuHDup2OW96zMNiVl
	8w8A==
X-Gm-Message-State: APjAAAXbyGu5Q8S+n3VjDYVcSnCbvR5DwFMnUzHOzTrBsWbNQKnuBsgR
	ZCrdLRFIhVtvkVvIyLiwi6PAXVjjiCx+3CfixYWgtgdj/GQ=
X-Google-Smtp-Source: APXvYqzF3Otx2nqXhPfGWlbmvOyPBdzy1GZrful0UwUWP6kLnqWbxgVlZmgR0PB8jwlqWZA7kKZXHUpz/HaPkRpickI=
X-Received: by 2002:a2e:91c6:: with SMTP id u6mr2395079ljg.112.1567694583401; 
	Thu, 05 Sep 2019 07:43:03 -0700 (PDT)
MIME-Version: 1.0
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 5 Sep 2019 16:42:52 +0200
Message-ID: <CAP71WjxBhq4=rvMN5DWAamV5sE-nCenqFxLdPRYNA3st2Y0Z4Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: make-mod-scripts question
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
X-List-Received-Date: Thu, 05 Sep 2019 14:43:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi,

I was looking into a build issue today, related to signing an external
kernel module. My build failed when calling the kernel utility
sign-file, the error was that libcrypto.so was not found.

Looking a bit more into that, I realized that make-mod-scripts will
built some kernel utilities, including scripts/sign-file which link
against libcrypto, however we 'copy' sign-file into
STAGING_KERNEL_BUILDDIR.

Later on, when my own recipe uses sign-file from
STAGING_KERNEL_BUILDDIR, it still requires the libcrypto.so file which
is in the make-mod-scripts per recipe sysroot. So basically my recipe
needs a binary from STAGING_KERNEL_BUILDDIR and a shared library from
another recipe sysroot. That looks wrong to me.

My problem is fixed by adding a dependency on make-mod-scripts, it
still feels wrong to reply on another recipe sysroot , doesn't it go
against the whole idea of per recipe sysroot?

Here is the sign-file in the kernel shared workdir:

$ find tmp-glibc -name sign-file
tmp-glibc/work-shared/open-q-212a-homehub/kernel-build-artifacts/scripts/si=
gn-file

And here we can see the dependency against make-mod-scripts sysroot:
$ ldd tmp-glibc/work-shared/open-q-212a-homehub/kernel-build-artifacts/scri=
pts/sign-file
        linux-vdso.so.1 =3D>  (0x00007fff8299d000)
        libcrypto.so.1.1 =3D>
/local/mnt2/workspace2/ndec/le.um.3.4.1/build-wlan/tmp-glibc/work/open_q_21=
2a_homehub-oe-linux-gnueabi/make-mod-scripts/1.0-r0/recipe-sysroot-native/u=
sr/lib/libcrypto.so.1.1
(0x00007fcb2247d000)
        libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007fcb220b3000)
        libdl.so.2 =3D> /lib/x86_64-linux-gnu/libdl.so.2 (0x00007fcb21eaf00=
0)
        libpthread.so.0 =3D> /lib/x86_64-linux-gnu/libpthread.so.0
(0x00007fcb21c92000)
        /lib64/ld-linux-x86-64.so.2 (0x00007fcb2293c000)

or like that:
$ strings tmp-glibc/work-shared/open-q-212a-homehub/kernel-build-artifacts/=
scripts/sign-file
| grep tmp-glib
/local/mnt2/workspace2/ndec/le.um.3.4.1/build-wlan/tmp-glibc/work/open_q_21=
2a_homehub-oe-linux-gnueabi/make-mod-scripts/1.0-r0/recipe-sysroot-native/u=
sr/lib:/local/mnt2/workspace2/ndec/le.um.3.4.1/build-wlan/tmp-glibc/work/op=
en_q_212a_homehub-oe-linux-gnueabi/make-mod-scripts/1.0-r0/recipe-sysroot-n=
ative/lib

cheers
nico

