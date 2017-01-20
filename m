Return-Path: <raltherr@google.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6E21F772E5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 18:37:15 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id j18so67958487ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 10:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=2GGaq+ssC8jMOQBwLUtBIFCyN1WjSiUs+hFCyaoYqw0=;
	b=PY9s0EMdqg/4ud+Mmr5m0x8AEDZasaXyNGLMClPrjnS9UIq6MoS2tA6Kx0vM0sdj88
	YxztGU10O74ZuuqkD0l2MJLk5q26aalDPKHoFDKMaRnKd3wiAYws28WbaeGTnD+dSddr
	Wy0m6PKYgkpgfI3SZQ0ieNLceLzIsTzCkWE7dwrSujYKJOuI04wjiDEpYMHgy8RnN2UC
	ubiTVkXra0cWM8bd5blQhYe0Dq2T2cRjTEhujO4wcpyESljnVdqYJbnLZEgK97XpAAXE
	mIg4EJs3RzQvUpKUpqOATPQElteTZjooDQ9Z9IvBM3RSMjiH4mbe9LN7aXpad54Yj7qy
	r9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=2GGaq+ssC8jMOQBwLUtBIFCyN1WjSiUs+hFCyaoYqw0=;
	b=S5S7L5OEIfWFfXdnsYoswaWHpPTU+Un9kEo5HO300P7VIzLvljHcp/QXlPyqCvJfJt
	h3r3bBmzt6kSgj1AwdItQtG8U6hiLz1YmAzgYMOcfkVbMX6RlqSJQypnZheKSbFG35Mw
	fzH+vRi8eXA98/agBGsTcCPWEcEAx8chZLTQgP2fltVtHTDLVb5c6vXSiOE56YkxHilu
	kLfC/X+1do2/wfx5RLxUUO1DdvlED6Kpo9KUDjqHksAd1PixHZrEv8yTxZnYR8O19sV5
	7zDD9nnZhlYmpdftFJr+7Eu2sfuihia4wRgNEF6SYeTTmPKWAQxHJ+W7h2GJ5IJrFxft
	DlJQ==
X-Gm-Message-State: AIkVDXJtuldIwtd3elWX2q8V9J3oCiFXr0i3/tIP1111Go3L7TUYMag5dzwuX3iMKebgYWDpmD/6G8Q+4uaF0FTY
X-Received: by 10.107.17.101 with SMTP id z98mr17673470ioi.226.1484937435789; 
	Fri, 20 Jan 2017 10:37:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.130.106 with HTTP; Fri, 20 Jan 2017 10:37:15 -0800 (PST)
From: Rick Altherr <raltherr@google.com>
Date: Fri, 20 Jan 2017 10:37:15 -0800
Message-ID: <CAPLgG=muXdcmCcFCC7NY8Zk9ANH5yf616T5b9Bc31OCJq=AD3w@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: How to use WIC to generate raw flash images
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
X-List-Received-Date: Fri, 20 Jan 2017 18:37:17 -0000
Content-Type: multipart/alternative; boundary=001a113f3190602b5905468af04d

--001a113f3190602b5905468af04d
Content-Type: text/plain; charset=UTF-8

For OpenBMC (based on Yocto), the target is an SoC that has an external
boot flash connected via SPI.  Right now, we have a class (
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/classes/image-overlay.bbclass)
used by our top-level image recipe (
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/common/recipes-phosphor/images/obmc-phosphor-image.bb)
that manually constructs a flash image from the kernel, rootfs, etc.  I'd
like to move to an upstream-supported approach and I think that is WIC.
What I don't understand is:
- How do I build a raw flash image where it is divided into partitions but
has no partition table?
- How do I set padding to be 0xFF instead of 0x00?
- How do I include u-boot in the image?

Do I need to add a new imager plugin to support writing raw images with
non-zero padding and no partition table?  For U-Boot, do I add a new
bootimg plugin?

Rick

--001a113f3190602b5905468af04d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">For OpenBMC (based on Yocto), the target is an SoC that ha=
s an external boot flash connected via SPI.=C2=A0 Right now, we have a clas=
s (<a href=3D"https://github.com/openbmc/openbmc/blob/master/meta-phosphor/=
classes/image-overlay.bbclass">https://github.com/openbmc/openbmc/blob/mast=
er/meta-phosphor/classes/image-overlay.bbclass</a>) used by our top-level i=
mage recipe (<a href=3D"https://github.com/openbmc/openbmc/blob/master/meta=
-phosphor/common/recipes-phosphor/images/obmc-phosphor-image.bb">https://gi=
thub.com/openbmc/openbmc/blob/master/meta-phosphor/common/recipes-phosphor/=
images/obmc-phosphor-image.bb</a>) that manually constructs a flash image f=
rom the kernel, rootfs, etc.=C2=A0 I&#39;d like to move to an upstream-supp=
orted approach and I think that is WIC.=C2=A0 What I don&#39;t understand i=
s:<div>- How do I build a raw flash image where it is divided into partitio=
ns but has no partition table?</div><div>- How do I set padding to be 0xFF =
instead of 0x00?</div><div>- How do I include u-boot in the image?</div><di=
v><br></div><div>Do I need to add a new imager plugin to support writing ra=
w images with non-zero padding and no partition table?=C2=A0 For U-Boot, do=
 I add a new bootimg plugin?</div><div><br></div><div>Rick</div></div>

--001a113f3190602b5905468af04d--
