Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 582A460720
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 17:28:21 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id u138so3708681wmu.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 10:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=ohCHFUg49SgIlllGS/hbo74mcJyN8gttQdXe3euVdoY=;
	b=NFJaTHIbZC7iFsjDKIHHCwj+KiPFQL+BsOISCYSMXq4LYF3IwdRNrNcIt7G1UXGjqG
	WA0AfomyGXPo7rdd+EMQ09oV2Wk6j++lIbe6mZC/emw932W+YJRkkq3r1eCtW0vhyHKl
	LbFHdviyP95nKX8nPPGsvuwihjcf11lY5v56r64xAL0Bd72oSk3Sbxd4NLvQ+5e5f2oZ
	V0784TOesZqbwMAhddh9dqSLpAa0vzuHlbVT87eW5C4aOq0biWXD7VZnPj1M+8rR/CbY
	J0DmSgs3dhbybGSTJhTbHMW20nUSmnQU3w938Q+A9inrycaWIYhWWQE6w3/ZX7z87oF9
	FDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=ohCHFUg49SgIlllGS/hbo74mcJyN8gttQdXe3euVdoY=;
	b=Gj0DzBlkKsgSIRG/x+0vljDpf0EYzWOJFKNfY73Z2a1ZDSDoca49DBc21EftN1oLkF
	hKqoZnuDwAn+6dTLAV557MRDuw9n0L/7booDdvCbsr6mH42B7VJJZarSM1FadNfhda93
	CNBd8V2snyeWsEdgqzcPbU19rusTbOwonIP78mnleehGZ2oizL4KGmpyaNGXVIG3iwNF
	3AQDtICZIvxggkGXcJnqgwHucKsbpiSYpQrLjlWi/rNuCEQ1xPNFb8H2XdZ06aK0wPxw
	TelWa+NUioxkpdC9GOeKl902QWW2CwFBr0isa3H4ociUCwAA3glCEoDvdnnAdRBzO/SR
	gn3Q==
X-Gm-Message-State: AMCzsaVqXHN3LHj/G1iiD/2Ujns/WuTEgyi+adiTUJYuY8+bHv7ciJWB
	XOfOkbhLOSNKCPxL+CQ1Ivrb+6EDR1EwvzEdee9RL47H
X-Google-Smtp-Source: AOwi7QAnBd8J8N1aKUese/HXMPV5fG9/4DC2jGePl2mLva1/qkuRq198tg8gpqiJFaOYGV5weBDPOXsodIBngdRvWng=
X-Received: by 10.28.236.212 with SMTP id h81mr1659954wmi.42.1506619702271;
	Thu, 28 Sep 2017 10:28:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.155.157 with HTTP; Thu, 28 Sep 2017 10:28:21 -0700 (PDT)
From: Paul Barker <pbarker@toganlabs.com>
Date: Thu, 28 Sep 2017 18:28:21 +0100
Message-ID: <CAPyrkgyyXnZCkL=_GzW1pwfXzUmRrRQ8UiqNDcKdGiNqc5ruSQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Go runtime host contamination
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
X-List-Received-Date: Thu, 28 Sep 2017 17:28:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey,

I'm trying to upgrade runc-opencontainers in meta-virtualization to
v1.0.0-rc4 and hitting a host contamination issue.

Both host and target are x86-64 but I'm using glibc on the host
(Ubuntu 16.04) and musl on the target. I'm getting link failures
referring to missing symbols "__vfprintf_chk" and "__fprintf_chk" in
libcontainer. I'm pretty sure these symbols exist in glibc but not in
musl.

The failure is occurring when trying to link libcontainer which uses
the go extension cgo to incorporate some c code in with the go code.

Using a pretty dumb grep, I can see the contamination in the go-runtime pac=
kage:

    $ grep -r __fprintf_chk
tmp/work/core2-64-oe-linux-musl/go-runtime/1.9-r0/image/
    Binary file
tmp/work/core2-64-oe-linux-musl/go-runtime/1.9-r0/image/usr/lib/go/src/host=
-tools/trace
matches
    Binary file
tmp/work/core2-64-oe-linux-musl/go-runtime/1.9-r0/image/usr/lib/go/src/host=
-tools/pprof
matches
    Binary file
tmp/work/core2-64-oe-linux-musl/go-runtime/1.9-r0/image/usr/lib/go/pkg/linu=
x_amd64/runtime/cgo.a
matches

The go build process seems to build host tools & runtime first and
then the target runtime, even for the go-runtime recipe. It looks like
it's installing the host version of the runtime library instead of the
target version but I'm not 100% sure here. There is some code in
go/src/make.bash to handle the case when host arch & os match target
arch & os and I think this is getting tripped up.

I can provide further info and logs tomorrow. Just wondering if anyone
has seen this sort of problem before and has any suggestions.

Cheers,

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

