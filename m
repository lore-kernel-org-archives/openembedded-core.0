Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 679326FFCD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 21:41:54 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id to4so88453864igc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 13:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=X+wQ3buA17PUTfBbFOoQ6egd4Kxe2VhAuB35UNy9tRk=;
	b=uZ4k+wFNx+wykC7pD2bIFppU4WidFtHhlCR8vPwwW6vbL+Cxx/Vqt1LEB6H+ogc9QU
	kQUy40KlgAVDrfqI3rsfQiZCsLHBp3Ns3mi1aoDUaGUDVc/0AWJmh2O5x6yC816kUCsO
	QW35+AhsrmuuehrO2iUID5nq1IUhLRxXQ9W6BmHwFwvn1ZgUwTei7nIznxfULJgqVDd/
	XpPYPuNA/GapCjyCcHESlUluXQGLru+l3YrHWD3fHjREeETkoS1PhUXvmiBAYhBQYBbO
	7Qxquzh2yScJYe5XWjKUkGV2FyLODXBFmNX0//bsbX0psDiYUAG0LaEP/akmbw7+Yy3h
	v1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=X+wQ3buA17PUTfBbFOoQ6egd4Kxe2VhAuB35UNy9tRk=;
	b=erxStkoddPjClAYlddL33u7l8Z2hSuYB/F/H2t/SR+KdMkbIVWFRVP741P5qAs2dBB
	8AOjZdbH3ZlGQ9UmJT2mluizpv1ewkSOk218E6lWJTSLv4kjcQOHQrWlvqPdQaFzuxPp
	I9hTve3gFGQOLrRqscBskOZIBTzVmUFGr5ayJdP6KnVmudbVvYvYKTcC11ifCva19WOi
	Nzy4t+vO0OGai8BRMa5PPVhc+/cXzRhtF57EGKJ4At1OTMQXJfeKQROOhMPCV1iuLfbk
	A6FfxKwaBmeOMSVHef6RmapMfPCemhZeSWADSJlO+9cWFqu4k+hrLt0iq4jmGtW0lrfD
	qMEA==
X-Gm-Message-State: ALoCoQkx6gB+jIIPTxX8hIYHApGvpm2jL2qs5XGG2uQlePr+em/kMg/UBAMX/TglG0evSJaOu0BWNjhYyIxmU6DEd2BvS5w0ouqCxHSsjVwVd5PLNffmTco=
X-Received: by 10.50.126.8 with SMTP id mu8mr31178104igb.52.1450906914663;
	Wed, 23 Dec 2015 13:41:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 23 Dec 2015 13:41:35 -0800 (PST)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Dec 2015 21:41:35 +0000
Message-ID: <CAJTo0LayEjj9moB9xgup=vB+C9Sn2-WX+s97UWRt9tg=HYFnag@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: [RFC] Delete all .la files?
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
X-List-Received-Date: Wed, 23 Dec 2015 21:41:54 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf4041fb0527979790

--047d7b1635bf4041fb0527979790
Content-Type: text/plain; charset=UTF-8

Hi,

So I've just done an oe-core world build with my latest .la-killer class
enabled (
https://github.com/rossburton/meta-ross/blob/master/classes/wipe-la.bbclass)
and the results are pretty good.  Basically this class hooks onto
do_install and simply deletes every *.la file it can find in ${D}, with an
opt-out if required.  .la files can cause rebuild problems if directories
move around and are mostly pointless on Linux anyway, so they can just be
deleted.

One recipe (opensp-native) needs to opt out of the .la deletion as
openjade-native for <redacted> reasons explicitly expects .la files to be
installed.  Some other desktop distros already strip out .la files so I
wouldn't be surprised if there's a patch floating around to solve this.

One recipe fails to build (gcc-sanitizers) as it expects to have built its
own libstdc++ so the recipe just deletes the source and drops in symlinks
to the libraries in the sysroot.  Works, but is nasty.   I could either opt
gcc out of la removal, or improve the fixup to make it actually link to the
installed libraries.  Or, merge the sanitisers into the main gcc recipe, as
I can't recall why they're separate anyway.

Apart from that, my world build was successful.

So in the new year I plan on submitting a renamed version of this class to
oe-core and adding it to INHERIT_DISTRO.  Any comments?

Ross

--047d7b1635bf4041fb0527979790
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>So I&#39;ve just done an oe-core wo=
rld build with my latest .la-killer class enabled (<a href=3D"https://githu=
b.com/rossburton/meta-ross/blob/master/classes/wipe-la.bbclass">https://git=
hub.com/rossburton/meta-ross/blob/master/classes/wipe-la.bbclass</a>) and t=
he results are pretty good.=C2=A0 Basically this class hooks onto do_instal=
l and simply deletes every *.la file it can find in ${D}, with an opt-out i=
f required. =C2=A0.la files can cause rebuild problems if directories move =
around and are mostly pointless on Linux anyway, so they can just be delete=
d.</div><div><br></div><div>One recipe (opensp-native) needs to opt out of =
the .la deletion as openjade-native for &lt;redacted&gt; reasons explicitly=
 expects .la files to be installed.=C2=A0 Some other desktop distros alread=
y strip out .la files so I wouldn&#39;t be surprised if there&#39;s a patch=
 floating around to solve this.</div><div><br></div><div>One recipe fails t=
o build (gcc-sanitizers) as it expects to have built its own libstdc++ so t=
he recipe just deletes the source and drops in symlinks to the libraries in=
 the sysroot.=C2=A0 Works, but is nasty. =C2=A0 I could either opt gcc out =
of la removal, or improve the fixup to make it actually link to the install=
ed libraries.=C2=A0 Or, merge the sanitisers into the main gcc recipe, as I=
 can&#39;t recall why they&#39;re separate anyway.</div><div><br></div><div=
>Apart from that, my world build was successful.</div><div><br></div><div>S=
o in the new year I plan on submitting a renamed version of this class to o=
e-core and adding it to INHERIT_DISTRO.=C2=A0 Any comments?</div><div><br><=
/div><div>Ross</div></div>

--047d7b1635bf4041fb0527979790--
