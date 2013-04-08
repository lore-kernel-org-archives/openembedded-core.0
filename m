Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UP7ES-0000Gk-Kj
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 10:15:24 +0200
Received: by mail-ea0-f175.google.com with SMTP id r16so2109382ead.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 00:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=nAR1Tkq+w2WPNfTfY+6MVFRqu9h68kmSwcdFCHlnXkU=;
	b=C3A6JyU6+YNMkAkRDmZHDd7KYH4+l6BDkCvcXBVcPzhjEMvdZldaJWCMU1aZCkRkKp
	PSjoWgUCRTtCP+QLgtKy+d/R24csNWfHsuK4Rfy9DhvIGF1lBUG5lDMaPN+vjWojBn7y
	BzTcJ69yEG3ho9TcFh+v4ST1TasLim/RL50D9MgLPt+5kR6z4/yjKfSZg7M1P8iYpfhQ
	VFltlQ6n7Va/jXl4rtylHpxzvcUnTVq5O79BlfaGM5FzaB21xPQKzXsdG4V3frsXfWLS
	QalkI7HeCf/onOBZIRvcD9A+dSY8xof0PU8QstmdrtY7Uz/3FpVL9ZS+nma4S08Zvy+i
	CsHw==
X-Received: by 10.15.45.136 with SMTP id b8mr40459863eew.11.1365407878316;
	Mon, 08 Apr 2013 00:57:58 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id u44sm30412797eel.7.2013.04.08.00.57.55
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 08 Apr 2013 00:57:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <5162038C.2020706@pseudoterminal.org>
Date: Mon, 8 Apr 2013 09:57:55 +0200
Message-Id: <9E7EB4C7-5A2C-4754-B37E-A0F048F22BBF@dominion.thruhere.net>
References: <5162038C.2020706@pseudoterminal.org>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQl5cPyFsXeTwaAefwWhj85WlmHdUZ5WYKxOctLaczw/RT6Roe32P5pWy5kD7n56alpOIyvr
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: gstreamer 1.0 recipes
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
X-List-Received-Date: Mon, 08 Apr 2013 08:15:46 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 8 apr. 2013, om 01:38 heeft Carlos Rafael Giani =
<dv@pseudoterminal.org> het volgende geschreven:

> Hello all,
>=20
> to start working with GStreamer 1.0 on several embedded platforms, I =
decided to adapt the existing GStreamer recipes from danny for 1.0. Out =
of this I created a layer, which is hosted at =
https://github.com/dv1/meta-gstreamer1.0 .
>=20
> I write this RFC, because I figure that GStreamer 1.0 support is =
already on TODO lists of several people, and will eventually end up in =
OE-Core, just like GStreamer 0.10 did. For this reason, I also didn't =
add it to the layer index.
>=20
> I built the packages for several platforms (cubox, beagleboard, imx6), =
and they worked well. Since 1.0 has been designed to be able to coexist =
with 0.10 in the same rootfs, I changed the naming convention for the =
packages: they all start with "gstreamer1.0-" .
>=20
> I also tried to reuse the existing patches. I was able to reuse three. =
Several others are no longer necessary. Four are unclear to me, so I did =
not port them:
> * gstreamer: check_fix.patch (I could not reproduce the documented =
problem), and gstregistrybin.c/.h (why are these present?)
> * gst-plugins-base: configure.ac-fix-subparse-plugin.patch (not sure =
what this is trying to fix, and this line does not exist in 1.0), and =
gst-plugins-base-tremor.patch (again, works well without it)
>=20
> gst-ffmpeg was replaced by gst-libav upstream. So was gst-openmax =
(gst-omx is its successor). gst-omx has special support for the =
Raspberry Pi and its custom OpenMax IL implementation. The recipe is =
designed in a way that allows for setting the target to something like =
"rpi", and the recipe then sets the PACKAGE_ARCH automatically to =
MACHINE_ARCH. However, I wasn't able to test it on an RPi yet, since I =
do not have one. I will get access to one in a few days.
>=20
> I am also considering some kind of autodetection for when yasm and =
liborc are available (for example, because meta-oe was added to =
bblayers.conf), and then switches on Orc and enables yasm in gst-libav. =
Or better yet, if libav is available as a recipe, it lets gst-libav use =
it instead of its internal copy. These autodetections would improve =
performance significantly.

I've been meaning to ask the same questions, since I need both orc and =
external libav to make gstreamer  (0.10, but still) useable on my =
platforms. I came up with the following ideas:

1) Make every external dep a PACKAGECONFIG option in OE-core gstreamer
2) Add bbappends with extra PACKAGECONFIG options for gstreamer in the =
layer that has the external dep
3) add bbappens in the DISTRO layer that enables extra external =
dependencies.

Angstrom is currently using 3) and I absolutely hate it. 2) is scales a =
lot better, but apparently is verboten judging from the patches sent =
that remove the qt bbappends that do the same.
Which leaves 1), which will cause problems for most users, since they =
will spot the PACKAGECONFIG options but not bother to read the comments =
saying they need to enable extra layers.

I favour 1) since that has all the knowledge in a single place, looked =
after by the OE gst maintainer (which we don't have yet, but still).

regards,

Koen=


