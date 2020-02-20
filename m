Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id BE65061328
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 12:00:09 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id m16so4273898wrx.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 04:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=qlR7lKn0L2pTzgLfdhyStqmt7U0lqJl8brTUKYgM6H8=;
	b=JWEviJk3CJRClOfC5edAcm9QHCBEooVee10jrYg5xNANjzoXOVJj1fCrN5E75mzyNn
	9Wzcw3njlB0PzhlH0ghbXxIp0iKi6L5JvIooxY9/k+KogHgq4Qym3TqTqQZh7gmi5qli
	KVCc0QnDJrPdhde2yCRRI7U2Cnk/gy9JrZGO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=qlR7lKn0L2pTzgLfdhyStqmt7U0lqJl8brTUKYgM6H8=;
	b=aziqbUUwDvJUamuC4/BqArIRKZIp70vbgtLGGTcjros1WZCz/8EM+shuZGB4ot+kVn
	cp7xjNzxB2+lLeBEMwLlkD79GdpJb3/RRbNqwhWNeW+Kp09g8ZLheP42N6zA+UJa3Kof
	T5U8F8txYgz63qAc6W8/apM0jVlqtS07WVDM2j/Z2uTG2Nad7vagLLMg/OkVFtDlDF/7
	nnz1zLtkYDVTZUKtAHTIuwPy8Jrd/ZZ8hyu8UbISOTC+rKlUGUo+lwW2DvtbGLBs4bnY
	pqvVZAvU+pX4HEolUW2cr6xAgZEaTKFArC3dXVrawYBa/MRkQF4cJ6pHN+i5aAd2yyJe
	mHEA==
X-Gm-Message-State: APjAAAVfdsN06lXjAcSRJAuJXxIALIUr/LK1qcG9O38qtiZfMTFMWh+y
	SjTT4gIx7pOVdWjay4P/cjE/ZA==
X-Google-Smtp-Source: APXvYqzlMtANxaUILZt0WPv2ZUJoUg4cRCFUqCiK6nyqriUcuuXlTiYCjhEgYpOLYSTOosol4DbqNw==
X-Received: by 2002:a5d:4f8b:: with SMTP id d11mr40243216wru.87.1582200010237; 
	Thu, 20 Feb 2020 04:00:10 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id w7sm4063058wmi.9.2020.02.20.04.00.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 04:00:09 -0800 (PST)
Message-ID: <f4564a97ae2675d00d806180f63b0299ff4946b9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2020 12:00:08 +0000
In-Reply-To: <f7970658-f3a4-051c-cd6b-b40d2b72b61c@geanix.com>
References: <20200219152355.123718-1-richard.purdie@linuxfoundation.org>
	<f7970658-f3a4-051c-cd6b-b40d2b72b61c@geanix.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH] gstreamer: Fix reproducibility issue around libcap
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
X-List-Received-Date: Thu, 20 Feb 2020 12:00:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-02-20 at 12:56 +0100, Martin Hundebøll wrote:
> On 19/02/2020 16.23, Richard Purdie wrote:
> > Add an option to avoid builds depending on the presence of setcap
> > from the host system.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >   .../gstreamer/gstreamer1.0/capfix.patch       | 37 +++++++++++++++++++
> >   .../gstreamer/gstreamer1.0_1.16.1.bb          |  2 +
> >   2 files changed, 39 insertions(+)
> >   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
> > 
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
> > new file mode 100644
> > index 00000000000..7ca3d5ad4a6
> > --- /dev/null
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
> > @@ -0,0 +1,37 @@
> > +Currently gstreamer configuration depends on whether setcap is found on the host
> > +system. Turn this into a configure option to make builds deterinistic.
> > +
> > +RP 2020/2/19
> > +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > +Upstream-Status: Pending
> > +
> > +Index: gstreamer-1.16.1/libs/gst/helpers/meson.build
> > +===================================================================
> > +--- gstreamer-1.16.1.orig/libs/gst/helpers/meson.build
> > ++++ gstreamer-1.16.1/libs/gst/helpers/meson.build
> > +@@ -73,7 +73,12 @@ if have_ptp
> > +     endif
> > +   endif
> > +
> > +-  setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
> > ++  setcap_feature = get_option('setcap')
> > ++  if setcap_feature.disabled()
> > ++    setcap = find_program('dontexist', required : false)
> > ++  else
> > ++    setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
> > ++  endif
> 
> I think this can be simplified by using get_option() directly for the 
> "required" argument:
> 
> setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', 
> required : get_option('setcap'))

Yes, that looks better. I'm no meson expert, this is the first time
I've touched it.

I'd love if it someone was able to get this resolved with upstream. 

I've been trying to work on getting various things fixed upstream (e.g.
some of the perl changes) but I'm having to take a practical view in
some areas. Getting the autobuilder stable/working sanely is currently
more of a priority than getting involved in a discussion with upstream
on something I know little about :/.

I've merged this patch but if anyone wants to improve it, I'm fine with
that.

Cheers,

Richard










