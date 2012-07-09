Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SoLKy-0003p1-7e
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 23:17:44 +0200
Received: from mail-qa0-f52.google.com ([209.85.216.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 09 Jul 2012 14:06:32 -0700
Received: by qabj34 with SMTP id j34so1803028qab.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 14:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=HlpmB9Hk90qV3jxoUnJvqmH5tSORzlv6f6hdkEyJ5bQ=;
	b=V+b1hrg0IU4wKZdYcMkmqLYrh0f7rIrto98yP+wMrnLtYosH4lDOX7USEl2AREX0t0
	6yWm1LdbPpUp/jpWtb3eqIozlu5eXIB1QbtFI8H8sfwgqhtGv6txWCRP3KuT3YO/HVKp
	MmrjhIHcA9kHzyLMgpNC/XGoJmmXh3eg1vjQD5cXcwv7uf1CAZyhyKdH64XgZemYrd37
	4x+3vm2hmha6oVG/IOxEC/q/ynuJ4lE4+qqlDejC+xsVTYo2LXAnxrd6WP9okoHba2YG
	OIaMgGkY4+HQjMZSDKALQYwd3vFpBE9fIvw63jw7a2fiURdjgVHyaR7XqzNwWaMGWk7y
	JGuw==
Received: by 10.229.136.17 with SMTP id p17mr22094076qct.86.1341867991692;
	Mon, 09 Jul 2012 14:06:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.16.207 with HTTP; Mon, 9 Jul 2012 14:06:11 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Jul 2012 22:06:11 +0100
Message-ID: <CAJTo0LZ1W6mD2mdadeqdvyVubgGSozcF_Nw8xbvr4fAsRgJK8A@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmZfkjZfHBpjq5S1qHAY0WkZ/McfyFi1IMJh3+YO5rHVRY4triXkjO7HxmnacizHXiFFz1o
Subject: The Mythical Sato Replacement
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2012 21:17:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

I've been mulling over a replacement for the Sato environment for some
time now, so I think it's time to talk about my thoughts and get more
feedback from users of oe-core.

Some background: back in 2007[1] Sato was designed to be an
reference/demo PDA environment for mobile devices with (relatively!)
high-DPI but physically small screens[2], such as the Sharp Zaurus and
Nokia 770/N800/N810/etc.  It was designed to look visually distinctive
compared to the competition at the time, and demonstrate all the
features that a handheld PDA should have (at the time).  I think it's
fair to say it mostly succeeded at that although it didn't exactly set
the world on fire.

Fast-forward five years: Sato is still part of oe-core and showing
it's age and unsuitability for the requirements that oe-core now has
compared to the original design requirements for Sato.

So, what does oe-core require from a graphical environment?  As this
is oe-core the list should be fairly short, so how about:
- some way of launching arbitrary applications
- a terminal
- a text editor
- a web browser
- network configuration
- an interactive test suite for verifying that various pieces of
hardware are working: play a media file, show touchscreen events,
display key events, and so on.  More about this later.
- lightweight

There's also a set of anti-requirements:
- no half-baked PIM suite
- no games
- no giant dependency stack or tight integration into the rest of
oe-core.  Pulling the Sato replacement out entirely, or reusing parts
of it, should be easily done.

Re-using an existing environment is one option but I don't think it's
a great one.  LXDE is very minimal but the Windows 95 aesthetic isn't
exactly attractive, XFCE is surprisingly large these days.  We don't
really want much, so I think maintaining our own shell is a worthwhile
investment.

Hopefully there aren't any objections so far?  I'll assume not, and
introduce my proposal for Project Shuku[3].

Shuku will be a descendent of Sato, that is continue to use the
Matchbox Window Manager, Desktop, and Panel; although the latter two
will be updated for GTK+ 3.  All applications will be removed and
fully reconsidered when adding back, so the text editor might well
change from leafpad to something that had a release in two years,
Midori is looking like a good web browser choice instead of Web, the
PIM suite removed, and so on.

The interesting bit is then the test application.  We need a graphical
environment so that we can run applications specific to our needs (and
the desktop handles this fine already) and verify that the system is
in fact working correctly.  Currently this is done in an ad-hoc
manner: using the music player to play audio files, gst-launch to play
videos, poking at the the touchscreen to verify that it works.  I'm
proposing a specific test application so that instead of attempting to
use general purpose applications as test tools, we have a specific
tool.

For example, when playing back a video file it's important that any
hardware acceleration available is actually used.  The test tool could
play the file using GStreamer's playbin and then display the resulting
pipeline so you can verify that VAAPI is being used, the correct audio
sink, the correct network source, and so on.  To verify that the input
devices are working, list them at the evdev level and let you see the
raw events, display touches, and so on.

I've also been considering the brave new world of Wayland.  Whilst
porting to GTK+ 3 all of the X11-specific code can be logically
separated so that a small Weston plugin can be written that integrates
the pieces together.  This will give a Wayland-native graphical
environment that is visually identical to the X environment.

There's plenty of other things to discuss -- visual design and so on
-- but that can wait for another day.

So those are my thoughts.  Any comments?

Ross

[1] Five years ago!
http://www.burtonini.com/wordpress/2007/08/01/poky-linux-3-0-blinky-release=
d/
[2] QVGA, for example, was explicitly not a target.  The Sharp Zaurus,
a typical test device, had a VGA screen.
[3] In the glorious tradition of naming projects by translating words
to other languages, I ended up with =E5=B0=97 (U+5C17) which means "younger=
 of
brothers", and Shuku is one of the pronunciations.


