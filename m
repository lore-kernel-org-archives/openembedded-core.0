Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S7EkG-0000B3-Ex
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 00:33:40 +0100
Received: by dado14 with SMTP id o14so4821321dad.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2012 16:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=xuwnZh4+Y44f5RVsouUTsy5R4RIHjbxU68xJpYUGPA8=;
	b=E5+ghVB4W3+Klee5G4ObbJ5Nonu1bwWWEwptQG0FVIJ4RN7lo0qifFYBdBPlwHf/Tt
	R7wPeCTOQqo+oCuuafHtW65xsV+ZPBY4tSUeBaJiYfVBWDl272vhyBhwPCZOJDa8NEWk
	aexhkPTtEw6yb/m0ckKaA6XojaUTPyuTZjQe6DkEl5s2vXRcYG+is1kzeNyBygwoS6Uq
	ILQPaS8DLjq0ZU1XpX1S4UL2O1WpdCuga7NMihRadAQcLoe3REW1LlQ7I8atBfwAWtIB
	OARPbZ1Avb9MP+SHKp6wgwa4lC+W+rmpj+VOWmBVW2lJkWBWNfbZEG49CHSqTlpW4vlN
	4mWA==
MIME-Version: 1.0
Received: by 10.68.227.99 with SMTP id rz3mr3388621pbc.39.1331594695788; Mon,
	12 Mar 2012 16:24:55 -0700 (PDT)
Received: by 10.143.67.8 with HTTP; Mon, 12 Mar 2012 16:24:55 -0700 (PDT)
In-Reply-To: <6DFE7363-9063-4624-A0D3-9D5218520ADB@dominion.thruhere.net>
References: <CAAQYJAtC-SCxohUjEOcixWA_B+K62O9AMr-d4XWX+PBDpg6i=w@mail.gmail.com>
	<CAAQYJAvQajmU+T1oGQLingBR7S7_G_A3KxtDeB+s6_tNnmoteg@mail.gmail.com>
	<6DFE7363-9063-4624-A0D3-9D5218520ADB@dominion.thruhere.net>
Date: Tue, 13 Mar 2012 00:24:55 +0100
Message-ID: <CAAQYJAuJSqV-z8e14UWNdY1zC0Vc-qpu_Ea3CJjqq73EiyhURg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] keymaps and kernel version
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
X-List-Received-Date: Mon, 12 Mar 2012 23:33:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 5, 2012 at 2:16 PM, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
>
> Op 5 mrt. 2012, om 14:12 heeft Andrea Adami het volgende geschreven:
>
>> On Sun, Mar 4, 2012 at 12:40 AM, Andrea Adami <andrea.adami@gmail.com> w=
rote:
>>> Hi,
>>> while testing some new kernels I found out a broken keymap.
>>> After short research I could identify the cause in
>>> recipes-bsp/keymaps/files/keymap.sh:
>>> ...
>>> KERNEL_MAJMIN=3D`uname -r | cut -d '.' -f 1,2`
>>> if [ -e /etc/keymap-$KERNEL_MAJMIN.map ]; then
>>> =A0 =A0loadkeys /etc/keymap-$KERNEL_MAJMIN.map
>>> fi
>>> ...
>>>
>>> $ uname -r | cut -d '.' -f 1,2
>>> 3.2
>>>
>>>
>>> I realized we are still using some old keymap-2.6.map and this doesn't
>>> match with KERNEL_MAJMIN.
>>> Now, renaming the keymaps to 3.2 would be only a band-aid, =A03.3 is co=
ming.
>>>
>>> Maybe we should check for keymap-3.map, i.e.
>>>
>>> =A0uname -r | cut -d '.' -f 1,1
>>>
>>> =A0or embed the machine name instead.
>>>
>>> Regards
>>>
>>> Andrea
>>
>> Actually this all sounds remnant of linux 2.4 vs. 2.6 times.
>>
>> Probably today we can just set:
>> ...
>> if [ -e /etc/keymap.map ]; then
>> ...
>>
>> and the BSP layers will have to rename the overrides only once.
>
> Or just drop it completely and let udev handle it?
>
> regards,
>
> Koen

Well, maybe as second step, first I'd say we need to fix the initscripts.

Cheers
Andrea


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


