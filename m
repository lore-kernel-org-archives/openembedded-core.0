Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by mail.openembedded.org (Postfix) with ESMTP id 4DEEB6D2F9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 17:15:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9MHFxCA003445
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 12:15:59 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9MHFxQu029184
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 12:15:59 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 22 Oct 2013 12:15:59 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH][for-dora] udev: update local rules for new touchscreen
	device
Thread-Index: AQHOzp+C4CvPt7E8rEWIvWWNA2YgspoA92aA
Date: Tue, 22 Oct 2013 17:15:58 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597CF89C@DLEE11.ent.ti.com>
References: <1382391869-2030-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1382391869-2030-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH][for-dora] udev: update local rules for new touchscreen device
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
X-List-Received-Date: Tue, 22 Oct 2013 17:16:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Maupin, Chase
>Sent: Monday, October 21, 2013 4:44 PM
>To: openembedded-core@lists.openembedded.org
>Cc: Maupin, Chase
>Subject: [PATCH][for-dora] udev: update local rules for new
>touchscreen device

Please ignore this in favor of the patch from Tom Rini.

>
>* While working with a new capacitive touchscreen it was found
>  that the existing udev rule that creates the
>  /dev/input/touchscreen0 symlink was too restrictive and did not
>  match the MODALAIS entry for this touchscreen. which is:
>
>  MODALIAS=3Dinput:b0018v0000p0000e0000-
>e0,1,3,k14A,ra0,1,2F,35,36,39,mlsfw
>
>* By looking at the input_print_modalias function in the Linux
>  kernel drivers/input/input.c file and referencing the meaning
>  of the evbits and attributes of the input_dev structure it seems
>  that for identification of a touchscreen the match with ,18
>  which was matching part of the absbit structure is overkill.
>
>* It seems that the absbit entry is used for devices like
>  touchscreens and if that the the "a" is followed by 0 and 1 this
>  is sufficient.
>
>* So the logic has now been changed to check for the "e" 0 and 3
>  values which correspond to EV_SYN and EV_ABS, then check for
>  the "a" attribute with 0 and 1.
>
>Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>---
> meta/recipes-core/udev/udev/local.rules |    4 +++-
> 1 files changed, 3 insertions(+), 1 deletions(-)
>
>diff --git a/meta/recipes-core/udev/udev/local.rules
>b/meta/recipes-core/udev/udev/local.rules
>index 72d92ef..d0cbf91 100644
>--- a/meta/recipes-core/udev/udev/local.rules
>+++ b/meta/recipes-core/udev/udev/local.rules
>@@ -17,5 +17,7 @@
> ACTION=3D=3D"add", DEVPATH=3D=3D"/devices/*", ENV{MODALIAS}=3D=3D"?*",
>RUN+=3D"/sbin/modprobe $env{MODALIAS}"
>
> # Create a symlink to any touchscreen input device
>-SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*",
>ATTRS{modalias}=3D=3D"input:*-e0*,3,*a0,1,*18,*",
>SYMLINK+=3D"input/touchscreen0"
>+# Trigger based on input type, that the evbit (-e) has EV_SYN and
>EV_ABS,
>+# has an EV_ABS value (-a) which is used for touchscreen type
>devices.
>+SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*",
>ATTRS{modalias}=3D=3D"input:*-e0*,3,*a0,1,*",
>SYMLINK+=3D"input/touchscreen0"
>
>--
>1.7.0.4


