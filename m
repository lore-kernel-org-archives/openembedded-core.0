Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6C269771E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 09:17:47 +0000 (UTC)
Received: by ioir85 with SMTP id r85so18421871ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 01:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=QIoteDKZPrW5Rqcy8pgiF8I0P07G9+q4dacJpnTrMy8=;
	b=HawVx54P04L6qLdAgx6h2Zic0K0HlHP9+PxIXUL7p3CTGcjsSw2s6I/WoFIk/IvYYh
	KgzYAA9pAO8eH1BKfUdaFdazoc1rVkMjPc1+PZ+2l35Be65QkizzLpoI1u476cDwTAYO
	TIYnnGcFE70+u6bM91fguEFdv5ahTw+HxHj69BzDgBmRvzQM21N9lhD+zNfg6JKuFl3k
	gU+3RpGU3E24ssmOaEN9N4/0QlgsBgPCGQy9cIwi1LqHZv3uWBzi+IspPWfapy7uj2VO
	3r1AOIuZudicMJwd0lOX7VAb/Dee/t/qnbhKu+gu/bBxmkCYyObjeoStJMStu2ZEJDgs
	m1Cw==
MIME-Version: 1.0
X-Received: by 10.107.130.155 with SMTP id m27mr15028104ioi.133.1447319867870; 
	Thu, 12 Nov 2015 01:17:47 -0800 (PST)
Received: by 10.36.31.131 with HTTP; Thu, 12 Nov 2015 01:17:47 -0800 (PST)
In-Reply-To: <564456AE.6020909@windriver.com>
References: <cover.1447318250.git.liezhi.yang@windriver.com>
	<8d5508408ad7f619d8981aaf098592e2fa2244a8.1447318250.git.liezhi.yang@windriver.com>
	<CALbNGRQSo-T+OJp4aS4PaJhVRo918ECObe0yOS+jgKH5mXG+5w@mail.gmail.com>
	<564456AE.6020909@windriver.com>
Date: Thu, 12 Nov 2015 10:17:47 +0100
Message-ID: <CALbNGRSVOnr5+rScvstYDou7u-ngdx=9mGgwa9cdtBWVvus2Fg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] clutter-gst-3.0: add --enable/disable-gudev
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
X-List-Received-Date: Thu, 12 Nov 2015 09:17:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 10:06 AM, Robert Yang <liezhi.yang@windriver.com> w=
rote:
>
>
> On 11/12/2015 05:00 PM, Andreas M=C3=BCller wrote:
>>
>> On Thu, Nov 12, 2015 at 9:51 AM, Robert Yang <liezhi.yang@windriver.com>
>> wrote:
>>>
>>> Fix dangling dependns on gudev, and systemd doesn't provide libgudev, s=
o
>>> it can't be enabled when systemd either.
>>>
>>> Fixed:
>>> libtool: error: cannot find the library
>>> 'tmp/sysroots/qemuarm64/usr/lib64/libgudev-1.0.la' or unhandled argumen=
t
>>> 'tmp/sysroots/qemuarm64/usr/lib64/libgudev-1.0.la'
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>>   meta/recipes-graphics/clutter/clutter-gst-3.0.inc  |   15 ++++++-
>>>   .../0001-configure.ac-add-enable-gudev.patch       |   45
>>> ++++++++++++++++++++
>>>   2 files changed, 59 insertions(+), 1 deletion(-)
>>>   create mode 100644
>>> meta/recipes-graphics/clutter/clutter-gst-3.0/0001-configure.ac-add-ena=
ble-gudev.patch
>>>
>>> diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
>>> b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
>>> index d4fed71..c29bc7a 100644
>>> --- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
>>> +++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
>>> @@ -4,7 +4,12 @@ LICENSE =3D "LGPLv2+"
>>>
>>>   inherit clutter
>>>
>>> -SRC_URI +=3D
>>> "file://0001-Install-example-binary-needed-for-core-image-clutter.patch=
"
>>> +SRC_URI +=3D
>>> "file://0001-Install-example-binary-needed-for-core-image-clutter.patch=
 \
>>> +            file://0001-configure.ac-add-enable-gudev.patch \
>>> +            "
>>> +
>>> +PACKAGECONFIG ??=3D ""
>>> +PACKAGECONFIG[gudev] =3D "--enable-gudev,--disable-gudev,udev"
>>>
>>>   DEPENDS =3D "gstreamer1.0-plugins-base gstreamer1.0-plugins-bad
>>> clutter-1.0"
>>>   RDEPENDS_${PN} +=3D "gstreamer1.0-meta-base"
>>> @@ -12,6 +17,14 @@ PACKAGES  =3D+ "${PN}-examples"
>>>
>>>   EXTRA_OECONF +=3D "--disable-introspection"
>>>
>>> +python () {
>>> +    if bb.utils.contains('EXTRA_OECONF', '--enable-gudev', True, False=
,
>>> d) and \
>>> +        bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d=
):
>>> +            bb.warn("%s: gudev can't be enabled since systemd doesn't
>>> provide libgudev" % \
>>> +                    d.getVar("PN", True))
>>> +            d.appendVar('EXTRA_OECONF', ' --disable-gudev')
>>> +}
>>> +
>>
>> I think this part of the patch is wrong: You have to replace udev by
>> gudev in DEPENDS part of packageconfig above and skip python function
>
>
> I think that there is no gudev but udev ? udev provides gudev, but system=
d
> only provides udev, no gudev.
>
Sorry I meant libgudev - it is in meta-oe.

I think there two cases of interest (packageconfig 'gudev' not set is
boring - so not a case :)

* distros with system: If packageconfig 'gudev' is set and meta-oe is
not layers a parse error will occure similar to your python code.
* non-systemd-distros: If packageconfig is set udev is pulled in (udev
provides gudev for non systemd distros)

Regards

Andreas

