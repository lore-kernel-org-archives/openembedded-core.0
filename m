Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 38AB86084E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 22:06:23 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id h3so3200801igd.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 15:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=llYPf9EYt1aGuAXVwMq78uoAlPDZtC4X+rG6bS3MgKA=;
	b=nSkdkGZwH1PW61lZi95/hf5WPyVXTOJ22gSlG8jTzg7Gtv1AWci+JLZsJmvuzBafHd
	sgnouc4xEk9Wuf11ZkY/qMK0q4j8f8dNpXXCZ1SXcQOqevjZE5SP6Z1MwwTCwoT7XbJ/
	n1m+2mqg43+RbFxH2BJFbAFsbqL4zZOGDmzveHipyPUmKYA70ijptY3DApVNOZ00rfXi
	0dqWjDJSNoZnuCY9YcOyy1EiaaVheTkFg6KCUiGvq3/k5Rzmj+L8ejCLusZ3qpjqZPyG
	whp8M41yLn1WDdMgIdIF0f3OpE5gfhuzKVeRAE4uKsCfCs4TuJpng6/Sxa3xnu+1usVf
	Bc4w==
X-Received: by 10.50.25.71 with SMTP id a7mr52217508igg.17.1407967584268; Wed,
	13 Aug 2014 15:06:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.126.103 with HTTP; Wed, 13 Aug 2014 15:05:53 -0700 (PDT)
In-Reply-To: <53EBDA75.4040101@pabigot.com>
References: <53E9134F.7040108@pabigot.com>
	<CAMKF1soHVxmjWW=TBqjh1P0ddPuMkxtmxXdnbLCSMLgQm2=hcQ@mail.gmail.com>
	<53EBD76A.3010401@pabigot.com> <53EBDA75.4040101@pabigot.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Aug 2014 15:05:53 -0700
Message-ID: <CAMKF1soioSe+U1CkB+PDsZyfDyaEFovugjOr+Tw+rGNjK57cJg@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Yocto development with C++11 threads and gcc
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
X-List-Received-Date: Wed, 13 Aug 2014 22:06:25 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 13, 2014 at 2:36 PM, Peter A. Bigot <pab@pabigot.com> wrote:
> In any case, Khem can you run with this?  It'd be fixed a lot better that
> way....

We do not configure target gcc with right matching cpu defaults,
atomic instruction strex/ldrex are only added after armv6 but defaults
for gcc if not specified is armv5t and hence it does not use the right
set as expected by libstdc++ which has been cross compiled. so while
you are at it and can reproduce it. Try to add

EXTRA_OECONF += '${@bb.utils.contains("TUNE_FEATURES", "armv7a", "
--with-cpu=armv7-a", "", d)}'

to gcc-target.inc and see if resulting gcc is any better

