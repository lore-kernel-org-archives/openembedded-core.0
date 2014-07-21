Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8372270507
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 12:49:44 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id o8so5487607qcw.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 05:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=3POW4huD4iYamoUI9BBOdiqLXvqK9b6VwJJIZo3q/sc=;
	b=cy6zA5mg4R9DvBljhfsA5qgkBHhT+0+/RzZfJrgdp2lHxM0mp2Gt0TeqbNtqTFuI+t
	47nw8IAAEvamDyevzdswepB9tgIqL+dqY9i0COjg1VM9awFlZ8NpZKz408GAaZ49mRJW
	kJEvTDwiFIg1byxYAnbUjrX3Jj0pcAnNytoDo2zhMFTTKBeofrfgJqVO+hWf7vGRey1K
	FMlTIYelHR2xTAH6l1jI0HmWZeHdxIPOvrEzFWZSMUgWnrSGjZLUjucm06J2cuo6p0Dl
	tUgEK0rEaHYoF7NgvyrakeUq3QJVixCN+QVWvX8zh6AubPyW8M1kXWtRm+y0qXfLe7R8
	26jA==
X-Gm-Message-State: ALoCoQmOeJAtYGAmHdOBK+MezYtO+0P93mtfeROovbs5WbF0zm32ZXIzpmMmrBs/emBhnpemEKaB
X-Received: by 10.140.47.129 with SMTP id m1mr31228714qga.95.1405946984853;
	Mon, 21 Jul 2014 05:49:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Mon, 21 Jul 2014 05:49:24 -0700 (PDT)
In-Reply-To: <1405946349-16124-1-git-send-email-jacob.kroon@mikrodidakt.se>
References: <1405946349-16124-1-git-send-email-jacob.kroon@mikrodidakt.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Jul 2014 13:49:24 +0100
Message-ID: <CAJTo0Lafck2hOcUfpqYTnARMuzLOfNbA-GnnLcHF-oUBnc9zwA@mail.gmail.com>
To: Jacob Kroon <jacob.kroon@mikrodidakt.se>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pixbufcache: Add missing dependency on jpeg-native
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
X-List-Received-Date: Mon, 21 Jul 2014 12:49:51 -0000
Content-Type: text/plain; charset=UTF-8

On 21 July 2014 13:39, Jacob Kroon <jacob.kroon@mikrodidakt.se> wrote:
> gdk-pixbuf-native uses png and jpeg loaders. When updating the
> loader-cache, these needs to be already populated in the sysroot.
>
> Although png was present, the jpeg dependency was missing, so add it.

But those dependencies are dependent on a PACKAGECONFIG setting, so
you'll potentially be forcing a build of libjpeg purely to satisfy a
fetch from sstate of a JPEG-disabled gdk-pixbuf.  Also, libtiff and
libjasper are missing.

If we can't change the sysroot creation order so that the order is
zlib, libpng, libjpeg, and then gdk-pixbuf then I think this needs to
be pulled out to a function that can do neater logic, such as iterate
through PACKAGECONFIG and add the required dependencies (for each
enabled option, turn the build depends into
%s-native:do_populate_sysroot_setscene).

Ross

