Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <d56b277b2dc37a0674698c5c4ca069696723afce.camel@linuxfoundation.org>
Subject: Concerns about hash equivalence reliability
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 29 Sep 2021 17:13:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>

I'm getting a bit worried about where we're at with reproducibility and hash
equivalence. As a test, I ran a build on the autobuilder:


https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/4053

which is a master-next build of MACHINE=qemux86-64, nothing special.

I then tried to use the sstate and hash equivalence public servers to reuse it
(with the same revision of master-next). I didn't get much reuse which was odd.

I therefore reran the build on the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/4055

which also didn't reuse much of the sstate.

I then repeated the external test and whilst there was more reuse this time, it
still wasn't right, e.g. the kernel was rebuilding.

So we have a problem, but what is the problem? I had a feeling the output wasn't
reproducing correctly, so how to debug and identify?

I ran the build on an autobuilder worker and also on my local build machine with
sstate and hashequiv disabled so it would build from scratch. I then collected
the depsig files from both builds:

tar -cvzf depsig.tgz tmp/work/*/*/*/temp/depsig.do_*

and then compared them.

I'm seeing -native populate_sysroot differences which is expected as there are
different host distros being used which will result in differing output. I'm
also seeing:

* do_package_write_rpm differences from parallel compression options
* hardcoded paths in pkgdata *.pclist files which break do_packagedata and 
  do_package
* kernel do_deploy filenames change (probably needs to use SDE rather than
DATETIME)
* hardcoded paths in libtool-cross
* hardcoded data in postinst-useradd- scripts
* hardcoded paths in curl-config
* some issue with gnupg binariess differing

I have fixes for some of these, attempts at others and some I haven't even
touched upon yet.

I kind of feel like I'm drowning in problems again. We do need to improve the
tests to avoid these issues.

Cheers,

Richard





