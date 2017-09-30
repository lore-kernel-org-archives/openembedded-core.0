Return-Path: <gizero@gmail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id B790660268
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Sep 2017 15:51:48 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id l94so1253240ual.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Sep 2017 08:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=81Bi5z+hiqB4wnTbrBfsvMIuIj4kAf6jWPdyyKtMHPY=;
	b=qR8GFzQYlof1r2z8mry5SOYEgdTephK/PCd9s7TTycCR3RFNy7L93sV0IdZK8EbDR2
	wMH/CrUWvBLTbTaSzEghwVS7ig97ZIYcPC+NLY1L3KC97hLb2IRdyF6QzCa0t8xt0n2K
	gg99hmvMGQ4Ob5Qv0yDgMW9K4kg+gahar4GplUFSFjdlMCJNO3Hh/hi/M8qQE9i32xtT
	O2Eb5NmiO5fcR6SaQ6Ob00zWB7adq1tK/cLEa+k4gA8uym6BcNls6eB7s+o4HgkWkdB7
	sgNu58+kSEUgmcLdMuF8RFtKXPuqgJnwmG4N0DhOGx6x2mElhQExowOFf6RB21dsTXzB
	RYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=81Bi5z+hiqB4wnTbrBfsvMIuIj4kAf6jWPdyyKtMHPY=;
	b=O5Rl7p0eCrO13UPWHoJ8qBLePmzqJXyv3DzCWbevTGhPo72/VfRCg9W4Oq7yu5OPM8
	0sVJiS4Q98mE6u7BH3iAMU/6D/yBDretbOozmYNotIVV5MN25y0Pp8AgGTgc2W3cNxZ8
	krAwoj7hwRC54oF91Fsz/WBUOGADOdDENeAcy4/BwidDPK/IGwZ9oEejZXzZuBPtaKgX
	uPZW/sDKvIOVOzmdaIueC3hfbShF7zZCei9tOBl3IBlDjK83p0T4ntj9vCrYVEKN0h5v
	mKG5f0mznn1pZI2lRMF1jtwgHDIP8xyojmOehUgfvXuCHoAw8HpMNo4xmHK/yo6lH7dM
	Befg==
X-Gm-Message-State: AHPjjUgcjgII20AxYkh3+9U3fUlO+ghOWs59n/SmzTxpnP/YpJnQQ7iw
	x7UAZDJH6CYyEAcdIgE9FnShPVnprwVjiJcMojJ4+w==
X-Google-Smtp-Source: AOwi7QDhvmgXtVT1iPbz3V2aQsZ1n+Uhom3uaYfHOEXhMqIb5k1Qw4Vr2j8m/pvw/R+gAwcNsppnMF/hhk30C02keF0=
X-Received: by 10.176.64.162 with SMTP id i31mr6370133uad.60.1506786709008;
	Sat, 30 Sep 2017 08:51:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.71.83 with HTTP; Sat, 30 Sep 2017 08:51:48 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
Date: Sat, 30 Sep 2017 17:51:48 +0200
Message-ID: <CAC+thW2LM0aNJ+Ro8mq6GX1gYB8K83tro8v-kYxfa+oLoJYj-g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: non uniform directories permissions in sstate-cache
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
X-List-Received-Date: Sat, 30 Sep 2017 15:51:49 -0000
Content-Type: multipart/alternative; boundary="94eb2c122c508af7ac055a6a1e9d"

--94eb2c122c508af7ac055a6a1e9d
Content-Type: text/plain; charset="UTF-8"

Recent posts on both Yocto's ML and here mentioned this issue, but I prefer
to post in a new thread, since it's possible that the main focus of those
thread (sharing sstate-cache between multiple users) might somewhat have
shadowed what IMHO seems indeed an issue with directories permissions in
sstate-cache.

What I observed on at least three different build hosts is quite simple:
the permissions directories in sstate-cache/ are not uniform. Most of them
are 775, but some are 755. This happens with fresh builds (all by the same
user) and can be observed on master and morty branches for sure (not
verified with pyro).

Anyone else seeing this? It might have been unnoticed, or you might have an
explanation to state this is normal, but I'd be very surprised if you told
me I'm alone in seeing this. Between the hosts that showed this behaviour I
have Ubuntu 16.04 boxes (either baremetal or Virtualbox VMs) and the
crops/poky-container running on OSX native docker implementation.

After noticing this, I got a look at sstate.bbclass, which I believe is the
code responsible for actually creating those hierarchies. The following
snippet seems to be the place where, regardless of the process' umask,
bitbake should ensure sstate-cache subdirs are created with 775 permissions
(by changing the process' umask to 002). Am I missing other places where
this is handled indeed?

   omask = os.umask(0o002)
   if omask != 0o002:
      bb.note("Using umask 0o002 (not %0o) for sstate packaging" % omask)
   sstate_package(shared_state, d)
   os.umask(omask)

Now, I'd don't feel confident enough with the code to push my investigation
further, than I'm writing this to hopefully have someone more experienced
looking at it and help figuring out what's going on.

Any thought? Should I file it as a bug?

--94eb2c122c508af7ac055a6a1e9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Recent posts on both Yocto&#39;s ML and here mentioned thi=
s issue, but I prefer to post in a new thread, since it&#39;s possible that=
 the main focus of those thread (sharing sstate-cache between multiple user=
s) might somewhat have shadowed what IMHO seems indeed an issue with direct=
ories permissions in sstate-cache.<div><br></div><div>What I observed on at=
 least three different build hosts is quite simple: the permissions directo=
ries in sstate-cache/ are not uniform. Most of them are 775, but some are 7=
55. This happens with fresh builds (all by the same user) and can be observ=
ed on master and morty branches for sure (not verified with pyro).</div><di=
v><br></div><div>Anyone else seeing this? It might have been unnoticed, or =
you might have an explanation to state this is normal, but I&#39;d be very =
surprised if you told me I&#39;m alone in seeing this. Between the hosts th=
at showed this behaviour I have Ubuntu 16.04 boxes (either baremetal or Vir=
tualbox VMs) and the crops/poky-container running on OSX native docker impl=
ementation.</div><div><br></div><div>After noticing this, I got a look at s=
state.bbclass, which I believe is the code responsible for actually creatin=
g those hierarchies. The following snippet seems to be the place where, reg=
ardless of the process&#39; umask, bitbake should ensure sstate-cache subdi=
rs are created with 775 permissions (by changing the process&#39; umask to =
002). Am I missing other places where this is handled indeed?</div><div><br=
></div><div><div><div>=C2=A0=C2=A0 omask =3D os.umask(0o002)</div><div>=C2=
=A0 =C2=A0if omask !=3D 0o002:</div><div>=C2=A0 =C2=A0 =C2=A0 bb.note(&quot=
;Using umask 0o002 (not %0o) for sstate packaging&quot; % omask)</div><div>=
=C2=A0 =C2=A0sstate_package(shared_state, d)</div><div>=C2=A0 =C2=A0os.umas=
k(omask)</div></div></div><div><br></div><div>Now, I&#39;d don&#39;t feel c=
onfident enough with the code to push my investigation further, than I&#39;=
m writing this to hopefully have someone more experienced looking at it and=
 help figuring out what&#39;s going on.</div><div><br></div><div>Any though=
t? Should I file it as a bug?</div></div>

--94eb2c122c508af7ac055a6a1e9d--
