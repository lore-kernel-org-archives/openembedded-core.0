Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxKFM-00007B-CK
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 17:29:21 +0100
Received: from mail-vb0-f70.google.com ([209.85.212.70])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 08:12:41 -0800
Received: by mail-vb0-f70.google.com with SMTP id s24so7039551vbi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 08:13:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=knol/fifxDBDNGo5mNGfj+XPtEBv7/ntRL/LNgXTFhE=;
	b=EhD6gqS8MlvDtuDfQWCpIaDp1qZ+fCG79d9j5k+2OHyQj0e/XdF1j9BDd+XxgOB816
	wLVExZDNIVdMMy9d/EPkKjGLA1UszEbCegyQljdn9ZFcAfAkw3RGac+/w2SxaigNAg8c
	ur+CDJ4kgU322pv9LYIg3NcvOYYUha1WGKdlN874jvYKWbuIbi64zBu4Y/jUKAcf1Xz0
	mCCXri2SkOucpvSOoZH06SGI2WrQoxtcz/H/+N6aYRQ8bbOlQMQAOdUoK1BzqUOLAnZK
	WMA4LUWVhn0uqYe1bBKhZy27/4xYfMB0nRFddr2yJ36inePaGpywAVrPdQT/Cmd68rk5
	ijng==
X-Received: by 10.221.9.137 with SMTP id ow9mr12297176vcb.22.1358784828324;
	Mon, 21 Jan 2013 08:13:48 -0800 (PST)
X-Received: by 10.221.9.137 with SMTP id ow9mr12297166vcb.22.1358784828234;
	Mon, 21 Jan 2013 08:13:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.152.232 with HTTP; Mon, 21 Jan 2013 08:13:27 -0800 (PST)
In-Reply-To: <1358783859.14265.66.camel@ted>
References: <cover.1358782098.git.ross.burton@intel.com>
	<1358783859.14265.66.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Jan 2013 16:13:27 +0000
Message-ID: <CAJTo0LawOifGyQ_c1bgik6u-xA8Y7_d35zkBAE3AHPCfLZ4DQw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQk//UoLfi43kB5Ep3WaNndsN3rCgWqwRMKEcx7zAH17441rLuJcRdhFOudsV8dl2qXJbXqtnFqs9iohRUd7nArV/KxIy+5CVKkKSunMrpCgdcQTNYpygmE/kdrlFDRU4+fybCbnTjcABjQTXMgdhyt9IKLqSXC66tNTvkhZ57YCba+amc97k4SGlmnCFB1xIUvLgadA
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Remove GUPnP
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
X-List-Received-Date: Mon, 21 Jan 2013 16:29:23 -0000
Content-Type: text/plain; charset=UTF-8

On 21 January 2013 15:57, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> There is a trend at the moment to remove things from OE-Core. That is
> well and good but the question is where to draw the line. I do want to
> ensure we keep at least some cross section of software in the core so
> that the core can be stressed in a variety of environments.
>
> I'm not saying gupnp shouldn't move out however I do want to figure out
> what is going to stay in the core that we can test with. Obviously
> things remaining the core really do need end user apps that we can
> stress them with.
>
> I was a little sad to see gthumb being removed for example as we now
> have no image viewer in the core. It was also a larger gtk app so
> stressed more of that side of the apis. I took the patches as it
> probably does belong in meta-gnome. How do we test the various image
> decoding libraries are in fact working though?

On the whole, agreed.

Regarding image decoding, were QA actually testing the decoding
libraries in gthumb?  If we want to verify that libpng/libjpeg/etc
work then there are many options that don't involve a desktop image
editor and looking at the screen as that doesn't catch subtle decoding
problems.  This can be part of the automated tests - decode a sample
PNG, md5 the raw data, compare with reference md5sum.

Regarding GUPnP, as fond of it as I am, we were only compile-testing
it in world builds.  Who knows if the libraries were actually worked
because it was never actually linked to.  Now that it and related
projects have a new home we need to work with community members who
also use GUPnP to ensure that there is one canonical location, even if
they prefer to work with copies of the recipes instead of including
meta-oe (which is understandable).

Ross


