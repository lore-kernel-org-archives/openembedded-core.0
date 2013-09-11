Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f172.google.com (mail-ve0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8AFE760F85
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 17:52:18 +0000 (UTC)
Received: by mail-ve0-f172.google.com with SMTP id oz11so6027995veb.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 10:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=J55Aj8ITUQaps3zZ99VSazc+aTaPW+xq1GLS/F7GFnM=;
	b=ZjXAH79/YUGNu3oS+KuylpoRkLmV/Gc69SA8CMc6Bfm45ccmVsXwSsGYEx0703MvgH
	WSo+P6y6GM9jIBNpR854yPXBJ8WjX9XVc1wG5rv1UC1fpa4GPdLCu/se6GUJ4ateIes8
	BLSZsR23SXhvE+sipMJ6ToFiERrIlW4bRE1I2WlVGzcGsVhzTpGnfNp+znWvbDjKpal+
	hzBPoGJ+fEYGprXLwcqLuWNHJT/QEfSvhqUDMFyNJKx55A9+4gKIulxvZ5RJUgpeyvKw
	iPQXr9QJkn5w+GgB3vcya63N1urtzRddwjzuqjjr0I84pRaXBakW66ZljeazdwYkJFtI
	tkYg==
X-Gm-Message-State: ALoCoQmF3ctmWIr5bV1v8XJLUGzkOCPZyEIGzolCysxwLA93CGT1sIJ9X3m9MfvONd30F9DlXUnR
X-Received: by 10.58.155.6 with SMTP id vs6mr1361063veb.32.1378921940372; Wed,
	11 Sep 2013 10:52:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 11 Sep 2013 10:52:00 -0700 (PDT)
In-Reply-To: <5230AAB4.2060005@mentor.com>
References: <5230AAB4.2060005@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Sep 2013 18:52:00 +0100
Message-ID: <CAJTo0LZMNna84CTpC3QTr6X+kMMcFXCERgsx=8kaqL3PpRr_hw@mail.gmail.com>
To: Stefan Seefeld <stefan_seefeld@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: build errors after upgrading
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
X-List-Received-Date: Wed, 11 Sep 2013 17:52:19 -0000
Content-Type: text/plain; charset=UTF-8

On 11 September 2013 18:39, Stefan Seefeld <stefan_seefeld@mentor.com> wrote:
> I was successfully building images for qemux86_64, when I decided to
> update to pull in recent fixes and improvements. So after git-pulling
> I'm now seeing these errors:
>
> ERROR: Nothing PROVIDES 'virtual/libgl' (but
> /usr/local/OpenEmbedded/oe-core/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.1.bb
> DEPENDS on or otherwise requires it)
> ERROR: mesa PROVIDES virtual/libgl but was skipped: missing required
> distro feature ['opengl'] (not in DISTRO_FEATURES)
> ERROR: mesa PROVIDES virtual/libgl but was skipped: missing required
> distro feature ['opengl'] (not in DISTRO_FEATURES)
>
>
> which I was able to work around by adding "opengl" to the distro
> features via
>
> DISTRO_FEATURES_append = " opengl ptest"

So the X vmware driver has a hard dependency on DRI if your X server
is recent, instead of having a configure option. Now that Mesa is
refusing to build in distros where you haven't asked for any OpenGL,
this is being discovered.  It should be fairly simple to add a
configure option to enable/disable the graphics module of
xf86-video-vmware.

> Now I'm getting a link error during the xorg-xserver build (two missing
> symbols are "noXFree86DRIExtension" and "noGlxExtension", which makes me
> wonder whether these are related to the above.

Now that is interesting.  Can you mail me privately a full log?  I'll
try and replicate tomorrow.

Ross

