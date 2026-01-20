Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B820CA5FD5
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 17:58:18 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12562.1768931892664381668
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 09:58:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=rkTIjK8E;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=SLDxmeoy;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id C81DCEC00A6;
	Tue, 20 Jan 2026 12:58:11 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 20 Jan 2026 12:58:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1768931891; x=1769018291; bh=V7Ev7F1Pko00V9w/TXXlpyGjJx4vO9lJ
	0R/33OkqUD4=; b=rkTIjK8EaPYt5dp0erxZxYagveEOLKxxPxD1GWF56qv5Xrft
	PrI76NtZA+6dIWrYw9JwXwQqahrxFelchOzPcvUpNmNalsWhiLAQgwwsg4iBjxsW
	9Wxnp/+ewLOeB/8PBuRBJVb1AcSM2JUO9VQazkkisqKVUZ+o4O/fSIzcyWakEmV0
	lgFW1sx/6GL+aJCsc83qXsDq00gfOYIg7I8jNyvjkf9d5DHi8h7nX7JQJyofEMz/
	45DXwdsnESQjg5WH6uftp77KtXuPYmkBHSa3RRvcQY36xKsNg1plxsTNZ7qDEkBz
	e620j+XokbmuWJ5Z20+AznlyFXU2IwwvhQPbdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768931891; x=
	1769018291; bh=V7Ev7F1Pko00V9w/TXXlpyGjJx4vO9lJ0R/33OkqUD4=; b=S
	LDxmeoyEIaHLWsmCpLAwHWatmqtf1Y+wrhcsIX6vcSqEagTlka2nw7VYrfVjKq3u
	h59hqCOjo9dE99Gabep2yZYXiRuzVOTRY6v3CF8q7atHLZaq6kfS8ksgprSVWES+
	Q0syxWbdoGTKAwGX7nAFCjayDX0wn5JttTOZT+pi3G5aTAUCDnzOC3oeoxJ3VwFd
	QfB92J6cfkgpRTE3SBHmUxGqCXQ6G7qPyCplC1nFThZSd6ELb5wiG+J7YkaXAkhj
	uxU9KPxHk/j0HOfobqRkXodSfjZ++kyv94dpHto78i4+2dk1xexiPO7QFdrOqO4k
	FzHmg/kSQfIYADLySGjMA==
X-ME-Sender: <xms:M8Jvabd9lwia_IktMqKHMG2NMRCUT3oH15um94BPe8BvgqKOeeybdA>
    <xme:M8JvafI5AYJ-lrUrPbEtuHkenstT2wTWLFHA7KfizdPf3WYP1b3vYuTaruK8P9QFZ
    5sfpdW4LZevsaQX2rgLP-2ccep1EjAUROiyQ1ifXnmuiaKIuGuUl9M>
X-ME-Received: <xmr:M8JvacGVc6XCByHKPyG2bA63k_XTGu31r5NFiW1XmJFv4XFsUw3RYmlnemXLEhRDRVqfpejyssgwnbYVZOAyC4uTjuL34xT8BkmY3kE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugedutdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvffftggfggesghdtreertderje
    enucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggv
    vheqnecuggftrfgrthhtvghrnhepjeekheejfeduieeifeduhfeitdetgedthedttdfhff
    efgffgueetgeeivdehjeeinecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhr
    ghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprg
    hulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtohephihotghtoheslhhishhtshdrhihotghtohhprhhojhgvtg
    htrdhorhhgpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishht
    shdrohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:M8JvaZoURlRZk5v2bxTjnebH1TEFrxDh6lKOEPGfAqFf0GAjR0bXOQ>
    <xmx:M8JvaVTU5T1knBGRQjZi8lDPmWlW5Hd-gjgn-PyIzgGsu8EPbxfTuQ>
    <xmx:M8JvaWPX4B7MWtl90-C2xWZp7jow68BuECzlKMqYBmP36QFO-VVstA>
    <xmx:M8JvaYOvAMW55Cx3qCrIbonr8rM9tTbIlhX_rrq86KYgBWsnJUULFA>
    <xmx:M8JvacebpxgM7I5lo0e3pZcIPnwW1n6itPym2QrnMe2peXR9kdowMmS6>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jan 2026 12:58:10 -0500 (EST)
Message-ID: <2fb5a1df2514dd372d6681314737889411eb935f.camel@pbarker.dev>
Subject: Progress on AB-INT issues // Help needed!
From: Paul Barker <paul@pbarker.dev>
To: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Jan 2026 17:58:04 +0000
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-kPYIqoZqacnwlRPZE8rE"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229764


--=-kPYIqoZqacnwlRPZE8rE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Firstly I want to thank everyone who has helped out with the
intermittent autobuilder issues and our current high priority issues so
far. There have been contributions from several different folks and they
are really appreciated.

This help means that we've made good progress!

We've been able to resolve several AB-INT issues so far (#16118, #16121,
#15912, #15188, #15495) and have patches available for others which need
reviewing and merging (#15696, #15885). Some issues are resolved on
master and just waiting on backporting of patches to the relevant stable
branches (#16000, maybe others).

We need to keep up the momentum as we still have a couple of open issues
blocking the Yocto 6.0 M1 build and we still have too many intermittent
failures occurring on the autobuilder.

There are a few issues I can flag where we need extra help:

- segfault in matchbox-windowmanager on qemux86-64 intermittently
  (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13908):
  It's unclear why the simple-looking code here is segfaulting. Ross has
  tried running with ASAN but that didn't give us any new information.
  Can someone add further debugging to the code to catch what's going
  on?

- AB-INT: fetch/sstate/CDN - Missing objects in the cache: Bad file
  descriptor (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15945):
  The error here suggests we may have exceeded limits on the number of
  open file descriptors. Can someone add diagnostics to the relevant
  code path to print how many open file descriptors we have when the
  error occurs?

- AB-INT: runqemu.QemuTest.test_qemu_can_shutdown hangs with "Data
  received serial thread"
  (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15698):
  This needs further investigation.

- AB-INT PTEST: openssl ['Dubious,_test_returned_1', 'openssl'] test
  failure (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15357):
  We need someone to check the logs and confirm that it is always the
  same test case that is failing. If that's true, we can take a patch to
  skip the flaky test.

- Various gstreamer PTEST failures (#16127, #16108, #15408, #15973,
  #15910, #15718):
  Each of these needs to be reviewed to see if upstream have replied to
  our bug reports. If any haven't been filed upstream then they need to
  be. If there isn't an upstream fix available, we can take patches to
  skip the flaky tests.

- Various PTEST failures on RISC-V (#15895, #15884, #15942, #15929,
  #15896):
  We don't use KVM for running qemuriscv64 so tests can be much slower,
  this may be causing various timeouts. Some of the failing cases create
  a large amount of data so there may be issues with buffering. Further
  investigation is needed, we could take patches to skip these tests on
  RISC-V.

We will have another call tomorrow at 09:00 PST / 17:00 UTC to discuss
the issues further and make sure we're focusing effort in the right
places. Please attend via zoom if you're able to help out:
https://lists.yoctoproject.org/g/yocto/topic/yocto_project_ab_int_bug/11736=
4044.

If you're unable to attend the call then you can still help by picking
up one of the issues above.

Best regards,

--=20
Paul Barker


--=-kPYIqoZqacnwlRPZE8rE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaW/CLBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bnSCAPwJJvJ/e3lQ5qsPoHuvORyUkcmqiRpbL3ke
QUTT1GMBpQEAlM2gY5/dOqZKSO0KCoLoYA6BJJjd1ULwASUeCUul0wo=
=XalH
-----END PGP SIGNATURE-----

--=-kPYIqoZqacnwlRPZE8rE--

