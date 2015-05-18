Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id EB375609B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 09:00:01 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so45379551pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 02:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=k2Du1ycCxKR/Rtqz+cZ945Pupt337XbwN1x4t+GpsHU=;
	b=y2WxIppGL+qgDmDiXvszjiNnT7msAB4xEkrnaVXSBRXmjXMPIJ+LtxmaaP/c5P7Z66
	1ni7kNGPJEF1M8RsWiEhUQaWVKsBeJXW32O+XL3zGxP0If0kXK8xUeUiDZmKE6gSl8KQ
	h1qajmg6Tijc7gVyOo84E0z2+krNNxc/SWvVQ68OlsCvgsRbdTSu+yEaaqE0TRZcc96j
	VVStUssJf0uQzR8A/B4a1IEYP/uGa5GkiWGEIiNDclM9p1TAV4mmSvb2bfXuOzL0Q2uK
	sji0SzkNvuvMHsrPRXQZSOR0OVw9LnOxqNh2VEE/f4331aCYujCBmsZ8nkBKQC0jA/wn
	X0aw==
MIME-Version: 1.0
X-Received: by 10.68.57.170 with SMTP id j10mr25489791pbq.150.1431939602680;
	Mon, 18 May 2015 02:00:02 -0700 (PDT)
Received: by 10.70.54.3 with HTTP; Mon, 18 May 2015 02:00:02 -0700 (PDT)
In-Reply-To: <20150518080138.GD9407@jama>
References: <CALbNGRRq94M86hm=0y8ZR7+5RXDMCJkXPxGREzAOjNQLerNkPw@mail.gmail.com>
	<20150518080138.GD9407@jama>
Date: Mon, 18 May 2015 11:00:02 +0200
Message-ID: <CALbNGRReeZHBXDo2C4tRTHfdCwSfS5QxpKdGWpsZJbgAGGCYdw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: trouble related to oe-core update
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
X-List-Received-Date: Mon, 18 May 2015 09:00:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2015 at 10:01 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Mon, May 18, 2015 at 09:46:03AM +0200, Andreas M=C3=BCller wrote:
>> Hi,
>
> Hi,
>
>> have seen that a while ago but had no time to take care.
>>
>> Since oe-core commit
>>
>> commit 3e760031f91fb87c3e2f62b77a117eb41164f259
>> Author: Martin Jansa <martin.jansa@gmail.com>
>> Date:   Wed Feb 18 15:40:35 2015 +0100
>>
>>     feature-arm-thumb.inc: respect ARM_INSTRUCTION_SET when adding thumb=
 suffix
>>
>> I get
>>
>> ERROR:  OE-core's config sanity checker detected a potential misconfigur=
ation.
>>     Either fix the cause of this error or at your own risk disable the
>> checker (see sanity.conf).
>>     Following is the list of potential problems / advisories:
>>
>>     Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH
>> (cortexa9t2hf-vfp-neon).
>>
>> I don't understand this fully but it seems that
>> fsl-dynamic-packagearch.bbclass would add this pkg arch but this never
>> happens because sanity.bbclass is executed first and interrupts
>> parsing. What I don't understand: Am I the only one having this issue
>>o
> I'm not using meta-fsl*, butdo you have this patch in your setup?
> http://patches.openembedded.org/patch/90989/
> it was discussed off-list a while ago and this change looks like result
> of that discussion.
>
Have meta-fsl-arm current master in my layers. This contains a similar patc=
h:

commit bfe01a0ebde407086f4a7710ea165c6beff310d7
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Mon Mar 30 23:49:32 2015 +0200

    fsl-dynamic-packagearch: add all MACHINE_SOCARCH feeds

Have rebased the mentionioned patch -> same result.

My problem seems to be that sanity.bbclass bails out before code in
fsl-dynamic-packagearch.bbclass is executed (and would fix). Playing
around with layer priorities / order of layers nothing changed
situation.

Andreas

