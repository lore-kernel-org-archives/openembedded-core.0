Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2CD1160232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 05:38:22 +0000 (UTC)
Received: by qgez77 with SMTP id z77so37030316qge.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 22:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=y/wzrX6KfXvC7DxkP7DJqOHdSyX8eWI14Pohhwm2AQs=;
	b=RqjiCd7IyCp2YGPCCAhYMFubknFnPe1DtXahydPkkJHgVuOzlYMHamdOKbBxD+5vDt
	v5RP0Z8lImesiQDbVFI+6FACrd82+RZH+IcDDzqTI7CkH1M5Ix6VQP8t30dZZ2C/G0Tl
	nV2SLr0lfR7x8DKQNo+REZhOfVFiySw3Rx85ivkSEenfLeC3mTExczOtCRH63YxHFjQm
	ADEMgtl7AoX+dzxcA0RjC++L7MAJYzsUZRdTOgiWPA3gzwTGGf+BzvfoXdrxaSg2fI85
	a52ImHXFfc8y9BAI+tM3neTROnaoGA/P9ARHKgGk2IW0qhiJfxYOC1ZtnMGkHlparYCe
	rmLg==
X-Gm-Message-State: ALoCoQkOdYtoFe5jNG8+9bC4BiaEKjyg+aAJiUB0dSTPZojbK9mUjp4+Nx7jnMBstbMo5+hwVG7/
X-Received: by 10.140.151.76 with SMTP id 73mr43097211qhx.61.1443073102829;
	Wed, 23 Sep 2015 22:38:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.55 with HTTP; Wed, 23 Sep 2015 22:38:03 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 23 Sep 2015 22:38:03 -0700
Message-ID: <CAP71WjyWRXrvUyi1HvdusRkKLb5Gf3H2gzCNPKkUDAstA4M55A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Including machine specific mesa-driver
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
X-List-Received-Date: Thu, 24 Sep 2015 05:38:24 -0000
Content-Type: multipart/alternative; boundary=001a1137676cadf365052077a371

--001a1137676cadf365052077a371
Content-Type: text/plain; charset=UTF-8

hi,

in the qemu reference machine we see this pattern:

XSERVER = "xserver-xorg
\

           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
'mesa-driver-swrast', '', d)}
\


Which is what I had done for my BSP layer as well. However this doesn't
take into account non X11 based graphics config, such as when building a
wayland/weston image. The mesa-driver should be conditionally pulled when
'mesa' is pulled in.

I cannot find a satisfying way of specifying this better to take both cases
into account.

we could move

${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast', '',
d)}

into MACHINE_RRDEPENS, but that's not quite right, since that driver is
only needed when any of the mesa binary packages is in the image, and non
graphics image wouldnt' need that.

Since mesa produces a lot of binary packages , using RDEPENDS_xxx for all
of them doesn't seem very nice neither..

What would you recommend we do? I think we need to fix the qemu images
anyways.

cheers

--001a1137676cadf365052077a371
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2PjxkaXY+PGRpdj48ZGl2PjxkaXY+aGksPGJyPjxicj48
L2Rpdj5pbiB0aGUgcWVtdSByZWZlcmVuY2UgbWFjaGluZSB3ZSBzZWUgdGhpcyBwYXR0ZXJuOjxi
cj48YnI+WFNFUlZFUiA9ICZxdW90O3hzZXJ2ZXIteG9yZyBcwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPsKgwqDCoMKgwqDCoMKg
wqDCoMKgICR7QGJiLnV0aWxzLmNvbnRhaW5zKCYjMzk7RElTVFJPX0ZFQVRVUkVTJiMzOTssICYj
Mzk7b3BlbmdsJiMzOTssICYjMzk7bWVzYS1kcml2ZXItc3dyYXN0JiMzOTssICYjMzk7JiMzOTss
IGQpfSBcwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj7CoDxicj48
L2Rpdj5XaGljaCBpcyB3aGF0IEkgaGFkIGRvbmUgZm9yIG15IEJTUCBsYXllciBhcyB3ZWxsLiBI
b3dldmVyIHRoaXMgZG9lc24mIzM5O3QgdGFrZSBpbnRvIGFjY291bnQgbm9uIFgxMSBiYXNlZCBn
cmFwaGljcyBjb25maWcsIHN1Y2ggYXMgd2hlbiBidWlsZGluZyBhIHdheWxhbmQvd2VzdG9uIGlt
YWdlLiBUaGUgbWVzYS1kcml2ZXIgc2hvdWxkIGJlIGNvbmRpdGlvbmFsbHkgcHVsbGVkIHdoZW4g
JiMzOTttZXNhJiMzOTsgaXMgcHVsbGVkIGluLjxicj48YnI+PC9kaXY+SSBjYW5ub3QgZmluZCBh
IHNhdGlzZnlpbmcgd2F5IG9mIHNwZWNpZnlpbmcgdGhpcyBiZXR0ZXIgdG8gdGFrZSBib3RoIGNh
c2VzIGludG8gYWNjb3VudC48YnI+PGJyPjwvZGl2PndlIGNvdWxkIG1vdmUgPGJyPjxicj4ke0Bi
Yi51dGlscy5jb250YWlucygmIzM5O0RJU1RST19GRUFUVVJFUyYjMzk7LCAmIzM5O29wZW5nbCYj
Mzk7LCAmIzM5O21lc2EtZHJpdmVyLXN3cmFzdCYjMzk7LCAmIzM5OyYjMzk7LCBkKX0gPGJyPjxi
cj48L2Rpdj5pbnRvIE1BQ0hJTkVfUlJERVBFTlMsIGJ1dCB0aGF0JiMzOTtzIG5vdCBxdWl0ZSBy
aWdodCwgc2luY2UgdGhhdCBkcml2ZXIgaXMgb25seSBuZWVkZWQgd2hlbiBhbnkgb2YgdGhlIG1l
c2EgYmluYXJ5IHBhY2thZ2VzIGlzIGluIHRoZSBpbWFnZSwgYW5kIG5vbiBncmFwaGljcyBpbWFn
ZSB3b3VsZG50JiMzOTsgbmVlZCB0aGF0Ljxicj48YnI+U2luY2UgbWVzYSBwcm9kdWNlcyBhIGxv
dCBvZiBiaW5hcnkgcGFja2FnZXMgLCB1c2luZyBSREVQRU5EU194eHggZm9yIGFsbCBvZiB0aGVt
IGRvZXNuJiMzOTt0IHNlZW0gdmVyeSBuaWNlIG5laXRoZXIuLjxicj48YnI+PC9kaXY+PGRpdj5X
aGF0IHdvdWxkIHlvdSByZWNvbW1lbmQgd2UgZG8/IEkgdGhpbmsgd2UgbmVlZCB0byBmaXggdGhl
IHFlbXUgaW1hZ2VzIGFueXdheXMuPGJyPjxicj48L2Rpdj48ZGl2PmNoZWVyczxicj48YnI+PC9k
aXY+PC9kaXY+DQo=

--001a1137676cadf365052077a371--
