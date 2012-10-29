Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TStL9-0004ij-US
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 18:41:32 +0100
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 29 Oct 2012 10:27:02 -0700
Received: by mail-ob0-f197.google.com with SMTP id tb18so15694835obb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2012 10:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=gXYCbhRoDWTW6PKcHBxlqQLoxssW/30IJrwCwN37PUo=;
	b=U/fa1u4Yo+XSlMwXAwYbcu6NTdzq6dfO91O/cb3htCR/9EM7N2SEPa4/6+Us+UeYea
	lj3e+2l3k+4O6ObKGanZBViTdf1leBD6SLfOeNiuumxrQQf+6HVkwUT580Bq2mNPbRvA
	Ov7qwgpGZ0ggq+Hqfrc6ptI/8/h7iwRtIq5AG/dGiAGZLK3SyHwXz4RR7j/C08mtJOGR
	4wWYItZPYQDxDBAmIemed7nxmtdjrHeX4kJoiRPFISxnoqOJXY9Wtd8WnrJZqiHsIRYA
	bWhiyW682qYZ6si1kvzS9O6dkNiRfXL7dUPbl9I20+XK5v7URFzvtm3alf8bzvPqvC7A
	bqyw==
Received: by 10.50.178.67 with SMTP id cw3mr10130961igc.53.1351531617660;
	Mon, 29 Oct 2012 10:26:57 -0700 (PDT)
Received: by 10.50.178.67 with SMTP id cw3mr10130959igc.53.1351531617604; Mon,
	29 Oct 2012 10:26:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.68.41 with HTTP; Mon, 29 Oct 2012 10:26:31 -0700 (PDT)
In-Reply-To: <50866812.10408@r-finger.com>
References: <CAJTo0LboPRF7Oxnwh8QS6b6ReS-1-P+=r04L54QRptPnHfV5oQ@mail.gmail.com>
	<5085800A.4060600@r-finger.com>
	<CAPj87rOXzZ5EwKYCrBnYtYAQo3cUyXtXyyDSh2nKh05Gy=uY9A@mail.gmail.com>
	<50865733.40007@r-finger.com>
	<CAPj87rOZokkPT_a7kbaqmai2bWwV5xLL8oV2UNOfoxkARHfwCg@mail.gmail.com>
	<50866812.10408@r-finger.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Oct 2012 17:26:31 +0000
Message-ID: <CAJTo0LbCB2K2wfbMF2sb=qosAYheFNc2zncOFfZqoj7c7eBDvw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
X-Gm-Message-State: ALoCoQn11SSVXOyTDPZD+rkD8d5AodZJKDrII4xy3wcOyWJ/wKWS6Bc7NE+RfIhqTf0oC3+woz51t1rOjnAX7/IwfqMbe8uSQYiFVfaapTPX869zErYJKG/qd81fYPSORa4L3uWMlBpA1bBCga06Krj9zs7LLo71dxzTvggZrlcnZITwVWWR6TSxrDZWhAmIKFXfTHLNyMhZ
Subject: Re: [RFC] OpenGL packaging/staging policy
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
X-List-Received-Date: Mon, 29 Oct 2012 17:41:32 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

This was interesting discussion and certainly achieved the goal of
soliciting comments...  A less aggressive plan:

Rule 1.  Unambiguous package naming

I won't repeat this, everyone agreed this was sane.  I've a patch for
mesa that I'll submit shortly.

Rule 2.  No whitelisting for GL driver conflicts

The target GL shall be staged, and situations which result in multiple
GLs being installed should handle this case and resolve it.

For atom-pc this means building Mesa.  For Beagle this means staging
the Beagle binary drivers.  For Tegra as I've discovered this is
"interesting" as they don't appear to provide any headers in their
Tegra For Linux tarball...

For Cedar Trail and EMGD, the easiest solution is a dedicated Mesa
building just GL.  As Mesa's DRI driver API isn't stable this is
practically required anyway: the ABI of the libGL we build and the
libGL that the binary driver was built against need to match.  This
mesa-just-gl (mesa-solo?) can be in meta-intel unless other machines
turn out to have a similar (crazy) requirement.

Rule 3.  No dependencies on specific GL implementations

Useful so that GL implementations are swappable on systems where that
can happen, but not essential if there isn't a single blessed GL for
sysroot.  We'll do this later.

Some things that will also happen whilst I do this:
1) mesa-dri renamed to mesa.  Let's get this done nice and early!
2) mesa stops architecture-overriding enabling of EGL and GLES, so all
architectures that build Mesa get GL/EGL/GLESv1/GLESv2.  If you don't
want this don't build Mesa, and the namespaced packaging means there
won't be conflicts.

Any more comments?

Ross


