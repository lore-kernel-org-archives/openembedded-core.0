Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B3CC77B7A
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 15:17:27 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.20101.1684423041774740164
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 May 2023 08:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jUvp6Z6W;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 271C260003;
	Thu, 18 May 2023 15:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684423039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=imtqPWUZvYaWoKc+escayAKc2ZuU4Ev1r3yaIVpEBVo=;
	b=jUvp6Z6W3ghI7F0/NOEV9v+3xzAJXEdCXKPWabmtCsnuPe4WR5AFu56Bof7dUEzFIv6Z6t
	/fGLxFlTBlMz9y2BXDGYtqH3NU49sY7aXxeQ2AFmj4STAT7Lb+KWGzrJD8eJ3DcBjXDgbV
	K9z5r/zgxbnHnsORgmcPol1oE46nBru/pR01VLQ9Fe0wJaf+SKejMXCGA0B2qs+L1j2Q7U
	0U/PG1ETkl7KckRmn94oUhGnBlfjajh1I48jybtRVqxgYUvt/wVmnNMquTtgggGeJ/TMPU
	LJHHJj0mZNHTV2JcoIvlzokcswmUkLj+SzwOoVuKLw4u6RluiKz9gPaVdLu39A==
Date: Thu, 18 May 2023 17:17:18 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [OE-core][PATCH 06/20] python3-libfdt: new package
Message-ID: <20230518151718e4c83ed0@mail.local>
References: <20230517080639.9336-1-brgl@bgdev.pl>
 <20230517080639.9336-7-brgl@bgdev.pl>
 <6c6ca6c1-3052-5a3b-5173-df780d77a64b@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c6ca6c1-3052-5a3b-5173-df780d77a64b@baylibre.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 15:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181523

On 17/05/2023 12:16:21-0400, Trevor Gamblin wrote:
> 
> On 2023-05-17 04:06, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > 
> > Add a recipe for python bindings for libfdt (spun out of upstream dtc)
> > fetched from pypi.
> > 
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >   .../python/python3-libfdt_1.7.0.post1.bb      | 20 +++++++++++++++++++
> >   1 file changed, 20 insertions(+)
> >   create mode 100644 meta/recipes-devtools/python/python3-libfdt_1.7.0.post1.bb
> > 
> > diff --git a/meta/recipes-devtools/python/python3-libfdt_1.7.0.post1.bb b/meta/recipes-devtools/python/python3-libfdt_1.7.0.post1.bb
> > new file mode 100644
> > index 0000000000..1ff3decbb9
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3-libfdt_1.7.0.post1.bb
> > @@ -0,0 +1,20 @@
> > +SUMMARY = "Python bindings for libfdt."
> > +LICENSE = "GPL-2.0-only | BSD-2-Clause"
> > +LIC_FILES_CHKSUM = " \
> > +    file://BSD-2-Clause;md5=5d6306d1b08f8df623178dfd81880927 \
> > +    file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> > +"
> > +
> > +inherit pypi setuptools3
> > +
> > +PYPI_PACKAGE = "pylibfdt"
> > +
> > +SRC_URI[sha256sum] = "2d048f9f8ce9a0527d497f423dea1f1135f9811c05b009cc5d5753771c1f9ba1"
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > +
> > +DEPENDS += " \
> > +    python3-pip-native \
> > +    python3-setuptools-scm-native \
> > +    swig-native \
> > +"
> Can you also add this recipe to the meta/conf/distro/include/maintainers.inc
> file?

As stated, this fails on the autobuilders:

The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
python3-libfdt (/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-devtools/python/python3-libfdt_1.7.0.post1.bb)

I also got this:

stdio: WARNING: python3-libfdt-1.7.0.post1-r0 do_fetch: QA Issue: Recipe python3-libfdt in /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-libfdt_1.7.0.post1.bb does not contain a HOMEPAGE. Please add an entry. [missing-metadata]
stdio: WARNING: python3-libfdt-1.7.0.post1-r0 do_fetch: QA Issue: Recipe python3-libfdt in /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-libfdt_1.7.0.post1.bb does not have an assigned maintainer. Please add an entry into meta/conf/distro/include/maintainers.inc. [missing-metadata]
stdio: WARNING: python3-libfdt-native-1.7.0.post1-r0 do_fetch: QA Issue: Recipe python3-libfdt in /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-libfdt_1.7.0.post1.bb does not contain a HOMEPAGE. Please add an entry. [missing-metadata]
stdio: WARNING: nativesdk-python3-libfdt-1.7.0.post1-r0 do_fetch: QA Issue: Recipe python3-libfdt in /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-libfdt_1.7.0.post1.bb does not contain a HOMEPAGE. Please add an entry. [missing-metadata]

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

