Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dromede@gmail.com>) id 1TZmwX-00064V-Pr
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Nov 2012 19:16:38 +0100
Received: by mail-vc0-f175.google.com with SMTP id p1so3914075vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2012 10:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=hnrQNTn/z7rYcZ6qKEScjbVQomkoKZ3Ol1fhdZq48kU=;
	b=1Fme6EbzXN3CL2M/kzcYUsb1pSxQM8eEHuxPhyOwRHNxu5ZZSSKnBP5T3s7uaqSnzp
	VIEhW0z8O6M2VqH+LY0k0fGEOx1DpklaFvDvkCdgp1QTgCVQKcLABik4zCMfSdAF0tem
	+vA76uN0TcZN5oPBWFeUKkcVCErlnyD5OYLjmWL31kUwJP+cfs0ZFNLqIsY2L3Xnh1zR
	2A6YFO62HemBN8UfcAkU5BixdvGKRrPkdhv7xuVrbVVS7YN8Xe9fatDms+91DveeXqRK
	Fycj0wC7oVScS8OfT4Sj0VA+VgZmA+ayyZoZOvHKCN8oRZEaHPh/WAd9Q5Zs3X7dmaC+
	cQQA==
MIME-Version: 1.0
Received: by 10.58.33.229 with SMTP id u5mr10340148vei.0.1353175357459; Sat,
	17 Nov 2012 10:02:37 -0800 (PST)
Received: by 10.58.127.225 with HTTP; Sat, 17 Nov 2012 10:02:37 -0800 (PST)
In-Reply-To: <CABcZANnSgJYUvwPFzcHaD-W7aBK+7Q=uh785-sQzbokSrq2UoQ@mail.gmail.com>
References: <1353096699-19130-1-git-send-email-dromede@gmail.com>
	<20121116213636.GC3411@jama.jama.net>
	<CAHod+GfAof60ycR5EXosair15O87dvZhnxWSouhdF49x8sZQqQ@mail.gmail.com>
	<20121116222855.GD3411@jama.jama.net>
	<CABcZANnSgJYUvwPFzcHaD-W7aBK+7Q=uh785-sQzbokSrq2UoQ@mail.gmail.com>
Date: Sat, 17 Nov 2012 19:02:37 +0100
Message-ID: <CAHod+GeYEUMW6z25i0xOEqGvRHfKrWV3TNHyEO8B9ZjFeDEBOA@mail.gmail.com>
From: =?UTF-8?B?TWFya28gS2F0acSH?= <dromede@gmail.com>
To: Chris Larson <clarson@kergoth.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] udev: Remove deprecated binaries from packaging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Nov 2012 18:16:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

i definitely should have written a much more elaborate commit message,
sorry about that.

The patch is definitely not cosmetic. This patch also deals with the changed
installation path of udevadm. Older versions of udev installed udevadm in /sbin.
Recent versions of udev install udevadm into /usr/bin. This means that the
udev-utils package will be empty because:

a) udevinfo and udevtest no longer exist
b) udevadm is no longer installed in base_sbindir, so it will end up
in the main udev package.

Therefore, udev-utils package will not be made at all. This breaks
do_rootfs stage since udev.inc RRECOMMENDS udev-utils.

Also, the initscript that comes with udev 182 calls udevadm via
it's absolute path - /usr/bin/udevadm. Initscripts in older versions
of udev expect udevadm in /sbin/.

I don't know exactly which version of udev deprecated udevinfo and
udevtest. There is no mention of it
in udev 182 changelog and i couldn't find a git commit that made this
change. The entire udev 182 source
tree only mentions udevinfo and udevtest in the changelog and the NEWS file.

Chris, you raise a valid point concerning older udev versions. If the
general concensus is that udev.inc in
OE-Core should support older and newer versions of udev, then my patch
is clearly not a proper solution.

A proper solution might be to:

a) Leave udevtest and udevinfo in udev-utils to properly support older
versions of udev that have these packages.
b) Move udevadm into the main udev package. This makes a lot of sense
since udevadm is crucial for proper udev operation.
c) Remove udev-utils from RRECOMMENDS.

Or we could just add ALLOW_EMPTY to udev.inc. A messy but simple solution.


