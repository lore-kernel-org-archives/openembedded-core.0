Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T2LcN-000478-Dy
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 14:25:35 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 17 Aug 2012 05:13:07 -0700
Received: by obceq6 with SMTP id eq6so4525925obc.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 05:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type
	:x-gm-message-state;
	bh=7v9DYHGIIwueL56lhVQp0A06xMlFzpeQ4DEgDRqoR7M=;
	b=fwxGH6I2WZY3+ZqvQddzEGsekffDpkk3smCuL2+DMHtVjextlq5QdKiMbQwwTI2PAN
	vCus8c1THtDfW+YaDPFW4ZQM2FFkVBMT7CwJpe6VxL2XomcSFSSEIDJgV0uvkMAt3QpO
	KWR2N5NIyLCV31ODRFwfKzzbua5B/wArxtxwsIF8nrE6KAXk0nwS08R6dm1BSodboNwQ
	DOSK5fEYRzy2dMUaOeDoG3oaC02dERydHrKQnD2HrvAIPiV6x53gDZUywoCroRcTsLbu
	00E+U0iJYg4EO/VekUNvIe5sn5Hjum09C7z4REGxuek4nZieEZ4RBnrhcllUsRtuQkci
	jqbg==
Received: by 10.60.28.162 with SMTP id c2mr3773141oeh.3.1345205585980; Fri, 17
	Aug 2012 05:13:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Fri, 17 Aug 2012 05:12:45 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Aug 2012 13:12:45 +0100
Message-ID: <CAJTo0LZpSd6LB+9W2kUcxfeU4GOVO5VOnLHMbHYT+1W6iVzcBQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmUVCJhLLUW6NjOnmcvbpYLEkNe/yjEGbWCokapBcnSpjHYFmr6aZ/RqgVs49vIwvbxE861
Subject: RFC: One X Server To Rule Them All
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
X-List-Received-Date: Fri, 17 Aug 2012 12:25:35 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

It's bugged me for a while that oe-core is shipping both "big" X.org
(in two variations) and "small" kdrive.  A quick review shows:

- oe-core is using X.org for the qemu images on all platforms
- meta-yocto is using big X.org for Atom, "lite" Xorg for beagleboard,
and kdrive for mpc8315e/routerstationpro.
- meta-ti is using xserver-xorg (and not the lite variation for
beagle).  It also ships a binary kdrive-based Xsgx, but that doesn't
require kdrive in oe-core.

I looked at a few other BSPs but the ones I found appeared to leave X
server choice to the user.  I also see that meta-oe is shipping
another X.org server.

Some consolidation is required, obviously.

Xorg lite is just X.org with --disable-dri --disable-glx
--disable-dga.  I need to investigate how much a difference that
actually makes to the server binary and if it can be controlled by
machine features or more granular packaging.

Here's my plan:
1) Investigate differences between xorg/xorg-lite/kdrive, producing a
feature matrix and binary size comparison.  Then assuming it's fine:
2) Remove xorg-lite, switch beagleboard in meta-yocto to X.org as per
meta-ti's example
3) Remove kdrive, switch meta-yocto's remaining machines  to X.org
4) Review differences between oe-core and meta-oe's X.org, merge,
unification at last, street party.

I'm sure the combined members of oe-core and oe-devel have something
to say about this.  Comments welcome!

I'd obviously need to test X.org on the MPC8315e and RouterStation
Pro, so if anyone has one of these set up then offering to test would
be much appreciated.

Cheers,
Ross


