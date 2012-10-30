Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TT9B9-0004Yh-EV
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 11:36:15 +0100
Received: from mail-ia0-f197.google.com ([209.85.210.197])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 30 Oct 2012 03:22:38 -0700
Received: by mail-ia0-f197.google.com with SMTP id j5so158926iaf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 03:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=dIiy//WCrZA88MgJdoA31AOllWRr9YVXthX0FeIzLwU=;
	b=CouW3otzjhN9CewnsKyOwLsxzbMmm9FpVCZ1QD4XYd+B1EWt2XCoJTfJPTM5hzjxrO
	XF7DgOXMMewCk8h99V6eO3r72bWw3Y7dpHTxgmIE4pqZG++h/F2RdIPs8Ydp0V8MSNRD
	YZBXkDTEuieNB6gQhPvPUkoeujB65GCTw3TX4JvVowuC2DcjNL0AUa6gS/+RViBPngq/
	qzVJx7iZb1KENdL1dStL6rmcPhBjE356ldoKmTCDGQJWvAIIslqfLf5tGeYiacsWppS/
	u+HIJhq3CS6zvZOM15whhnwfeu95VqBqhjvCIiJ5Oaf/70fK+MNyFJRq+GXp7Znmtl9K
	wV9g==
Received: by 10.60.32.210 with SMTP id l18mr28904148oei.79.1351592556718;
	Tue, 30 Oct 2012 03:22:36 -0700 (PDT)
Received: by 10.60.32.210 with SMTP id l18mr28904145oei.79.1351592556665; Tue,
	30 Oct 2012 03:22:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.68.135 with HTTP; Tue, 30 Oct 2012 03:22:16 -0700 (PDT)
In-Reply-To: <508FA924.4030301@communistcode.co.uk>
References: <508FA924.4030301@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Oct 2012 10:22:16 +0000
Message-ID: <CAJTo0LZg4x6GpDHAop6aCMNfOE-zK_hnr=T4SxfgSYEucRVWkA@mail.gmail.com>
To: ml@communistcode.co.uk
X-Gm-Message-State: ALoCoQkaousDBy9HcXYO1A3AkvrIlljyKavERegVxZUvX1nGMkzK6HNpSvFY92qznB8DwZmfMZVqYnRZjblQnu2n9VohwaqRtbyIM8ecXYVFuPYKva+IiY4q/TYqd/hlvywG/YxgBaQnshda9tvzRRdcI/7EPARxJzrQ8pLYSKtd6fRP+Ji8lRO3GcnQk0sPm/rfhytRPHGV
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Removing netbase from an image
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
X-List-Received-Date: Tue, 30 Oct 2012 10:36:15 -0000
Content-Type: text/plain; charset=UTF-8

On 30 October 2012 10:17, Jack Mitchell <ml@communistcode.co.uk> wrote:
> I am attempting to remove netbase from a custom image. I would like to
> replace it with connman. I have added connman through EXTRA_IMAGE_INSTALL,
> however netbase is brought in via packagegroup-core-boot.bb which funnily
> enough has some very important features and I would like to keep.
>
> What would be the best way to make this replacement. Should I copy
> packagegroup-core-boot.bb and keep a local copy, while keeping it in sync
> manually? Alternatively, I notice quite a few packages in
> packagegroup-core-boot have a VIRTUAL-RUNTIME_* define. Would it be worth
> having a VIRTUAL-RUNTIME_network ?= "netbase" which could be overridden?

You don't want to remove netbase, you just want to remove the
/etc/network/interfaces file.  The rest of netbase is very important
to have.

Dig on the list and you'll find patches to split that file out but
they didn't get into 1.3.  Unless you're working against master and
willing to help get those patches tested and merged, the easy solution
is to use a .bbappend and ship an empty interfaces file
(meta-guacamayo does this if you want prior art).

Ross


