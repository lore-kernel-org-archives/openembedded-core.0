Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQLBk-0003HD-6p
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 18:49:26 +0200
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 22 Oct 2012 09:35:48 -0700
Received: by mail-oa0-f69.google.com with SMTP id j6so8682990oag.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 09:35:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type
	:x-gm-message-state;
	bh=pdHbpJ86UzxhvPiVyvwSIdHxAloMxsnQ+RV+r3pDxtM=;
	b=Wz5QDk4uuhMfX5lF46PTcMhaJVv3OJvboGZF7JtULdN38RSfjBScwx5HR4dNRdn3Pe
	7P48XIc2tPo07ddpGzF/FiUZeQWer/ICbMq6SSjeMGA4nTph0kNwBOe+igCMIkVGqTID
	7nnl2CqLyKoDuRorAfkFSM3PS8DIKTAA5SbUhyyjJJT+HY8QG9VpnrXLposI58pKzTI2
	pXg6RfQ4Yc6EYSdn6Eubs1KgZlPBQL8Ch11lnOmkPk0xp8VLQIU8z9d2MpoidARmYbGA
	um0GqDytAutOjryBIog+sSff6MWiNoHu3pB7yc29UbeYbaYauSmR9S5psRdPmLspSlRm
	KMAw==
Received: by 10.182.228.69 with SMTP id sg5mr2276884obc.2.1350923747815;
	Mon, 22 Oct 2012 09:35:47 -0700 (PDT)
Received: by 10.182.228.69 with SMTP id sg5mr2276876obc.2.1350923747734; Mon,
	22 Oct 2012 09:35:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Mon, 22 Oct 2012 09:35:27 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Oct 2012 17:35:27 +0100
Message-ID: <CAJTo0LboPRF7Oxnwh8QS6b6ReS-1-P+=r04L54QRptPnHfV5oQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmS5pchdIYpmjBQCBtvZE5vAycqgRosIeYZyG916XvOfLJAkAj0WAl3m2KcXRmK+ZjO1qvX0KaBVFvKchRa+5HH47vluGMdgX0t3sjpsOS5HzVABXVQp4DJe0X6XISsgOq0etEF+tM1nQEsqbuCnIgifl4k83cvlm9K8D6h7KNYMGTwuDRs6aHzW1uPJmysqw7+7sOt
Subject: [RFC] OpenGL packaging/staging policy
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
X-List-Received-Date: Mon, 22 Oct 2012 16:49:26 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Now that we've almost got 1.3 out of the door we can go back to
breaking everything. Hooray!  Let's try to (un)break OpenGL again.

First, I should say that I'm not looking at this from an GenX/Intel
specific perspective where Mesa is all you need.  meta-intel ships two
different binary GL drivers (cdt-pvr for Cedar Trail, EMGD for
everything else Atom that doesn't have i945) so I'm perfectly aware of
the problems.

For example, Cedar Trail's (SGX545-based) GL stack comprises of GLESv1
GLESv2 and EGL library blobs, and a DRI driver blob.  This DRI driver
can be used by Mesa's libGL.  This is actually a more complex problem
than Beagle has where it just doesn't do GL.

This is my attempt at a simple solution that doesn't involve
complicated packaging tricks.

Rule 1.  Unambiguous package naming

Debian-style renaming and multiple providers of the same API doesn't
work as you'll end up with multiple packages in the same feed called
libgl1, so all GL packages should be named in the style of libgl-foo,
where foo is the source of the package.  I've got a branch where this
is implemented for Mesa as a proof of concept[1], and the Python
fragment could easily be moved into a class and re-used easily.

Rule 2. No dependencies on specific GL implementations

Packages currently depend on the exact GL that they were built with,
although the GL packages are swappable.  Not very interesting for
systems where there's only one provider, but still a valid problem for
systems with swappable hardware or alternative GL stacks.  All linkage
to the GL stack should be intercepted and replaced by something like
"virtual/libgl | libgl-mesa".

This means changing the shlib dependency detection code to support
per-library overrides, there's plenty of prior art in existing
distributions to help here.

Rule 3. Only Mesa stages, nothing else

Whilst there are multiple GL implementations that offer various
subsets of GL, they are all effectively interchangeable.  It's not a
massive concern what exact GL is present when building because they've
all got the same API.  We can take advantage of this and remove the
problems caused by multiple GL implementations staging by only putting
Mesa into the sysroot.  Any other GL implementation should explicitly
stop staging itself to avoid sysroot tainting.  This can be
implemented by making Mesa build all APIs on all platforms (which
isn't a problem when it comes to image building or feeds, thanks to
rule 1), and removing the virtual/libgl PROVIDES from the other GL
implementations.

For systems which don't use Mesa at all (for example, BeagleBoard)
then this potentially means that Mesa will be built when it shouldn't.
 GLX support in the X server may already be pulling it in (I made this
a packageconfig in 1.3 so distros can turn it off), but in any case I
think this is an acceptable compromise - Mesa isn't slow to build in
the scheme of things, and per Rule 2 this is purely in sysroot and not
in the images.


tl;dr: all packages built against a constant GL, all GL
implementations interchangable, no package conflicts in the feeds.

Any comments before I get my hands dirty with the next incomplete task
(shlib dependency generation)?

Ross

[1] http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=ross/mesa&id=784fa1372bb38dbc82e53a49b757c3c02593f2b8


