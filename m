Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QyVcY-0002Jy-Sz
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 23:13:22 +0200
Received: by eyb7 with SMTP id 7so46706eyb.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 14:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=IV3Azg9rLFs4B7/qLQkyzZZhs7XGeDuQYUYmWzZtlTc=;
	b=gIVfinTUqTVGJQloEmzCAmJGByLcd3XlK63fuAykgQhWUa5lgeuY2ldgUPjcDNd9X0
	fE+qnTbA2dCCNveViA1qnyTN09H6y7XKVoMqhtex7mdUyeBOTgB15XNnAG7XbIphdAD9
	M7i7F2gcXNEKwk+PFP6OHqjJoDVLxzmm37Tnk=
MIME-Version: 1.0
Received: by 10.213.28.193 with SMTP id n1mr519185ebc.42.1314738509274; Tue,
	30 Aug 2011 14:08:29 -0700 (PDT)
Received: by 10.213.34.148 with HTTP; Tue, 30 Aug 2011 14:08:29 -0700 (PDT)
In-Reply-To: <8954E4C1-E43C-46BE-91AB-6DAFF38D2A4A@dominion.thruhere.net>
References: <1314598341-2793-1-git-send-email-joelagnel@ti.com>
	<D6747D39-5AE0-4982-BE54-828DFF4AF761@dominion.thruhere.net>
	<CAD=GYpZi8dObBiWTAw9OpH1BmHuUZgT67jOMV6saQNcyfmW+Tg@mail.gmail.com>
	<A7D15A83-D3C5-4F64-90AA-6A77225BB6E5@dominion.thruhere.net>
	<CA+T6QPmfs0-_k+io3rviuTqxS9-qTT7q0y_=k6JNagB93TGG6Q@mail.gmail.com>
	<CAD=GYpaL73siZqSoSChCG2rbXSy7nBsJ6LmujxxmqhqubiFCWQ@mail.gmail.com>
	<CA+T6QPk=XR4M0cVoYn=EdckJxDKifooGv8+_yw+0AXTUQ85pWg@mail.gmail.com>
	<8954E4C1-E43C-46BE-91AB-6DAFF38D2A4A@dominion.thruhere.net>
Date: Tue, 30 Aug 2011 16:08:29 -0500
Message-ID: <CAD=GYpZBDShMM-fWYcTWFrJ=jHD8gNsSivOZD=BTHZUk5eek+w@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC oe-core] mkcard: Add a script to parition and format an SD Card
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Aug 2011 21:13:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 30, 2011 at 12:47 PM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>
> Op 30 aug. 2011, om 18:46 heeft Jason Kridner het volgende geschreven:
>
>> On Mon, Aug 29, 2011 at 7:08 PM, Joel A Fernandes <agnel.joel@gmail.com>=
 wrote:
>>> On Mon, Aug 29, 2011 at 4:03 PM, Jason Kridner <jkridner@beagleboard.or=
g> wrote:
>>>>>>>
>>>>>>> This script is BSP specific and shouldn't live in the OE-core layer=
.
>>>>>>
>>>>>> The only issue is this script is used from within the IMAGE_CMD_sdim=
g
>>>>>> code which lives in OE-core (meta/classes/image_types.
>>>>>
>>>>> classes shouldn't be calling external scripts
>>>>>
>>>>
>>>> Is the right approach to add parameters to the IMAGE_CMD_sdimg class
>>>> such that it can be used generically to produce SD card images,
>>>> instead of trying to move this to meta-ti? =A0Should it perhaps be a b=
it
>>>> closer to what is being done by the Linaro image tools [1]?
>>>>
>>>> [1] https://wiki.linaro.org/Source/ImageBuilding
>>>>
>>>
>>> Don't the Linaro scripts need to run on the target?
>>
>> No.
>>
>>> Does it fit well
>>> with OE(-core) ?
>>
>> I don't know, but I hoped that others would comment to help figure it
>> out. =A0I think it is a common challenge not just for ARM architectures.
>> I'm not sure if the approach is general enough or not, but it does go
>> beyond the BeagleBoard.
>>
>> My primary concerns about leaving it in the BSP are:
>> 1) that there is some room for non-BeagleBoard specific optimizations
>> to the card layout and
>> 2) there may be improvements to the tools that make it easier to
>> create images for systems with different boot requirements.
>>
>> Also, I think we might want to move to an ext3 partition only in the
>> future or other such layout optimizations. =A0I'd like that to be
>> something that can be parameterized by the BSP.
>
> I think you're missing the point:
>
> The *script* needs to go into the BSP, you are free to extend the bbclass=
es with code to deal with sd cards internally in OE-core.
>
>

I think there are 2 threads to this discussion. One talks about mkcard
script (which I think Koen is asking to move to BSP), and the other is
the IMAGE_CMD_sdimg variable from image_types.bbclass which holds the
code to create the image (which Jason is referring to).

I am dropping mkcard script as it requires root access (due to kparted
and device mapper), instead I'm just using loop and avoiding device
mapper.

As for the IMAGE_CMD_sdimg , I'm thinking a clean way is to extend
image_types.bbclass from within the BSP layer (which I think Koen also
is suggesting).

Maybe I'm just summarizing what everyone is saying, but just making
sure everyone is on the same page.

Thanks,
Joel


