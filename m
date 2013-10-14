Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by mail.openembedded.org (Postfix) with ESMTP id A22C06CDD0
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 14:09:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9EE9T0C015059;
	Mon, 14 Oct 2013 09:09:29 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EE9TVY004527;
	Mon, 14 Oct 2013 09:09:29 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Mon, 14 Oct 2013 09:09:29 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Andrea Adami <andrea.adami@gmail.com>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] udev: update local rules for new touchscreen
	device
Thread-Index: AQHOyOWfBvPDwy6rA0eQxnCPkTsj85n0O9og
Date: Mon, 14 Oct 2013 14:09:28 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597AC445@DLEE11.ent.ti.com>
References: <1381761079-8709-1-git-send-email-Chase.Maupin@ti.com>
	<CAAQYJAtZYFkxBMHz8eO_KCnXrToKb1uocVsDtnoeOphqQCYkSA@mail.gmail.com>
In-Reply-To: <CAAQYJAtZYFkxBMHz8eO_KCnXrToKb1uocVsDtnoeOphqQCYkSA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] udev: update local rules for new touchscreen	device
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
X-List-Received-Date: Mon, 14 Oct 2013 14:09:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: openembedded-core-bounces@lists.openembedded.org
>[mailto:openembedded-core-bounces@lists.openembedded.org] On
>Behalf Of Andrea Adami
>Sent: Monday, October 14, 2013 8:59 AM
>To: Openembedded-core@lists.openembedded.org
>Subject: Re: [OE-core] [PATCH] udev: update local rules for new
>touchscreen device
>
>On Mon, Oct 14, 2013 at 4:31 PM, Chase Maupin
><Chase.Maupin@ti.com> wrote:
>> * While working with a new capacitive touchscreen it was found
>>   that the existing udev rule that creates the
>>   /dev/input/touchscreen0 symlink was too restrictive and did
>not
>>   match the MODALAIS entry for this touchscreen. which is:
>>
>>   MODALIAS=3Dinput:b0018v0000p0000e0000-
>e0,1,3,k14A,ra0,1,2F,35,36,39,mlsfw
>>
>> * By looking at the input_print_modalias function in the Linux
>>   kernel drivers/input/input.c file and referencing the meaning
>>   of the evbits and attributes of the input_dev structure it
>seems
>>   that for identification of a touchscreen the match with ,18
>>   which was matching part of the absbit structure is overkill.
>>
>> * It seems that the absbit entry is used for devices like
>>   touchscreens and if that the the "a" is followed by 0 and 1
>this
>>   is sufficient.
>>
>> * So the logic has now been changed to check for the "e" 0 and 3
>>   values which correspond to EV_SYN and EV_ABS, then check for
>>   the "a" attribute with 0 and 1.
>>
>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> ---
>>  meta/recipes-core/udev/udev/local.rules |    4 +++-
>>  meta/recipes-core/udev/udev_182.bb      |    2 +-
>>  2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/udev/udev/local.rules
>b/meta/recipes-core/udev/udev/local.rules
>> index 72d92ef..d0cbf91 100644
>> --- a/meta/recipes-core/udev/udev/local.rules
>> +++ b/meta/recipes-core/udev/udev/local.rules
>> @@ -17,5 +17,7 @@
>>  ACTION=3D=3D"add", DEVPATH=3D=3D"/devices/*", ENV{MODALIAS}=3D=3D"?*",
>RUN+=3D"/sbin/modprobe $env{MODALIAS}"
>>
>>  # Create a symlink to any touchscreen input device
>> -SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*",
>ATTRS{modalias}=3D=3D"input:*-e0*,3,*a0,1,*18,*",
>SYMLINK+=3D"input/touchscreen0"
>> +# Trigger based on input type, that the evbit (-e) has EV_SYN
>and EV_ABS,
>> +# has an EV_ABS value (-a) which is used for touchscreen type
>devices.
>> +SUBSYSTEM=3D=3D"input", KERNEL=3D=3D"event[0-9]*",
>ATTRS{modalias}=3D=3D"input:*-e0*,3,*a0,1,*",
>SYMLINK+=3D"input/touchscreen0"
>>
>> diff --git a/meta/recipes-core/udev/udev_182.bb b/meta/recipes-
>core/udev/udev_182.bb
>> index d66292e..a90c289 100644
>> --- a/meta/recipes-core/udev/udev_182.bb
>> +++ b/meta/recipes-core/udev/udev_182.bb
>> @@ -1,6 +1,6 @@
>>  include udev.inc
>>
>> -PR =3D "r7"
>> +PR =3D "r8"
>>
>>  # module-init-tools from kmod_git will provide libkmod runtime
>>  DEPENDS +=3D "module-init-tools"
>> --
>> 1.7.0.4
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>Agreed
>
>I noticed it some time ago but the patch is still on hold....
>http://patchwork.openembedded.org/patch/25093/

Thanks.  I missed this.  I can confirm this works for my TS device as well.

>
>
>Acked-by: Andrea Adami <andrea.adami@gmail.com>
>_______________________________________________
>Openembedded-core mailing list
>Openembedded-core@lists.openembedded.org
>http://lists.openembedded.org/mailman/listinfo/openembedded-core

