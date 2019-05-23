Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by mail.openembedded.org (Postfix) with ESMTP id 35EA37E400
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 06:53:50 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id d8so3542294lfb.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 23:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=T2DIxuuqPN/2+5tG9JAjv8X+OwXmCIFFHBsTjKCq/Dc=;
	b=uS7AP7fUEV3hqxYqEkgA2kbqlGjOTtynUy5OFYsn46onTvgawbJZ82l8mTOUmOnKOC
	KU07/UxpZXT53OVerrgwCrIngcBps2F21kF33AqbnB+PrywQoc3vc7XcOPB5nT+CZwvm
	rpkDiYchIriuebvY25jfpg5OqsjUn9cVCg8jJQQPijmkw6MKBuRwpJQKpkfzpb1xh6TU
	vDzkOY09vm72GtRBnKGgR9Ctg/9iso0RZ00+k2uWkhAXoLlVotgs4xKRlXTT3Nm11XIU
	qOuRr00uD/9KaPPyPOjkQsoCNr1lExIof20KJDH/MxB2AdUWUwrh12GFKIWw26snUvfx
	D7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=T2DIxuuqPN/2+5tG9JAjv8X+OwXmCIFFHBsTjKCq/Dc=;
	b=uDRTeE0Q/QgDohM8FUHXHV4J0i7rZOIEraSeMALinE6+jx+P0FIhQxoLML5bS8mscn
	Hk8XQ6zTIErHWFZcl/7jcffP8kwgQCjI3E31aJpnpcGbGD/uKexXIpB04lycyN5gvweo
	Q/LSXnnKTmdfFUkktSWREq7RIw13VEoW3X1NQwAQx86anVXP5OWYZ9qDIiI+Bxz3yLeF
	OD8a56WIMI8RIpNK/sWVtgMXC6mJsmGqHXJYSW+d+7p0xSG3PLJml6BMKcvtjT6QqKrC
	6OpL5t39sh9FMcUe376UyLHWwS/UHxds8UuVSgUZcGCFZpAfQ/nw07UGmX9jYtVjacJi
	k+Lg==
X-Gm-Message-State: APjAAAX6sXTMlEiGjRQ/OAlQu0u6RNTiB4fNd+xkkyEGdqp3Zk5zBfNp
	11ZM9GvPz8ywQQHK0x6HpKLvKAB3DMrrkoHIDdkKxqe9hMI=
X-Google-Smtp-Source: APXvYqwO6kgjvzWlGmQZVZT1EmaHL6Ps7Fd6olEKLSVYzfcENRGs0GTlu8h58z9yJhgyfaQpU/9HY3cVSAy6RL5kF04=
X-Received: by 2002:ac2:4c38:: with SMTP id u24mr28974716lfq.168.1558594430216;
	Wed, 22 May 2019 23:53:50 -0700 (PDT)
MIME-Version: 1.0
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 23 May 2019 08:53:39 +0200
Message-ID: <CAP71WjzDVJuGSVmOErD9bpH+Wv=MHTLJXVt3rp=8mOF8MKMiHA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: possible issue with buildhistory?
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
X-List-Received-Date: Thu, 23 May 2019 06:53:50 -0000
Content-Type: text/plain; charset="UTF-8"

hi,

not sure if it's been discussed reported before. but i ended up in a
situation where a package is "empty" (e.g. it's not created) even
though "files-in-packages.txt" in its buildhistory folder shows it
should contain a file.

I have a synthetic example:

$ cat buildhistory/packages/aarch64-linaro-linux/helloworld/latest
PV = 1.0
PR = r0
DEPENDS = autoconf-native automake-native gnu-config-native
libtool-cross libtool-native virtual/aarch64-linaro-linux-compilerlibs
virtual/aarch64-linaro-linux-gcc virtual/libc
PACKAGES = helloworld-src helloworld-dbg helloworld-staticdev
helloworld-dev helloworld-doc helloworld-locale helloworld
goodbyeworld
LAYER = meta-rpb

then:

$ cat buildhistory/packages/aarch64-linaro-linux/helloworld/goodbyeworld/files-in-package.txt
drwxr-xr-x root       root             4096 ./usr
drwxr-xr-x root       root             4096 ./usr/bin
-rwxr-xr-x root       root             6144 ./usr/bin/goodbyeworld

However goodbyeworld package does not exist, and /usr/bin/goodbyeworld
is in the helloworld package:

$ dpkg -c tmp-rpb-glibc/deploy/ipk/aarch64/helloworld_1.0-r0_aarch64.ipk
drwxrwxrwx root/root         0 2019-05-23 08:25 ./
drwxr-xr-x root/root         0 2019-05-23 08:25 ./usr/
drwxr-xr-x root/root         0 2019-05-23 08:25 ./usr/bin/
-rwxr-xr-x root/root      6144 2019-05-23 08:25 ./usr/bin/goodbyeworld
-rwxr-xr-x root/root      6144 2019-05-23 08:25 ./usr/bin/helloworld

It is worth saying that the file should indeed be in helloworld
package since there was a bug in my recipe! So buildhistory is wrong
here.

The recipe is a simple one:

SRC_URI = "file://helloworld.c \
  file://goodbyeworld.c \
  file://Makefile.am \
  file://configure.ac \
  file://COPYING"
S = "${WORKDIR}"
inherit autotools
PACKAGES += "goodbyeworld"
FILES_goodbyeworld += "${bindir}/goodbyeworld"

Clearly the recipe has a bug, and if I do this instead:
PACKAGES =+ "goodbyeworld"

/usr/bin/goodbyeworld ends up in the right package... however I think
in the previous case, buildhistory should have shown
/usb/bin/goodbyeworld in helloworld package, not goodbyeworld...

I was testing on warrior, but i can try to reproduce on master if needed..

thanks!

