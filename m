Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1ROA79-0003v3-NP
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 16:30:59 +0100
Received: by wwf4 with SMTP id 4so2111725wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2011 07:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=Qr0x99+YkhRw5JcxAPlgJZnUeKGmjZZGBCp/nB+FIK0=;
	b=MoLl/ZREVRwXYudPS3oIpQHOQ6AU+pDFsjQJxq3G1AdhrmlhTA7Zb+N8LmbKdp/Y6I
	OnCq+Nb+sau2LyQ1eCguMjMa7lgHOH0tpV4mLZqzISq5yZvubkRC/qq9D7t9zzOXxv3b
	cJSNu/XRJf2ETLrYOvI9cgaOcIFpmC/VrW/SA=
Received: by 10.216.229.14 with SMTP id g14mr524438weq.6.1320852284135; Wed,
	09 Nov 2011 07:24:44 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.28.138 with HTTP; Wed, 9 Nov 2011 07:24:23 -0800 (PST)
In-Reply-To: <4EBA9534.1010107@linux.intel.com>
References: <1320839575.10843.165.camel@ted> <4EBA9534.1010107@linux.intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 9 Nov 2011 08:24:23 -0700
X-Google-Sender-Auth: culp8hwd6pl7JQKzA89LV0_3EKA
Message-ID: <CABcZAN=GPiw7nXaVxp4WQMy9Uwr38M_G2H2XjXzabZhfyU0=mw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: bb.data.*Var -> d.*Var conversion
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
X-List-Received-Date: Wed, 09 Nov 2011 15:30:59 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 9, 2011 at 7:59 AM, Darren Hart <dvhart@linux.intel.com> wrote:
> Hi Richard,
>
> On 11/09/2011 03:52 AM, Richard Purdie wrote:
>> I'm tempted to run the following over the metata to convert the
>> bb.data.*Var(...,d) and similar expressions to the form d.*Var(...).
>
> Oh yes please!
>
>>
>> Why? We get a lot of people doing copy, paste and edit of the code and
>> this way, we'll increase the chances of them finding better examples.
>>
>> I'm still looking at the diff this generates to see if there are any
>> more corner cases I need to tweak the expression for but feedback
>> welcome.
>>
>> sed \
>> -e 's:bb.data.\(setVar([^,]*,[^,]*\), \([^ )]*\) *):\2.\1):g' \
>
> Be sure to escape your periods, they are single character wildcards.
> It's unlikely you'll match something else, but better safe than sorry.
>
>> -e 's:bb.data.\(setVarFlag([^,]*,[^,]*,[^,]*\), \([^) ]*\) *):\2.\1):g' \
>> -e 's:bb.data.\(getVar([^,]*\), \([^, ]*\) *,\([^)]*\)):\2.\1,\3):g' \
>> -e 's:bb.data.\(getVarFlag([^,]*,[^,]*\), \([^, ]*\) *,\([^)]*\)):\2.\1,\3):g' \
>> -e 's:bb.data.\(getVarFlag([^,]*,[^,]*\), \([^) ]*\) *):\2.\1):g' \
>> -e 's:bb.data.\(getVar([^,]*\), \([^) ]*\) *):\2.\1):g' \
>> -i `grep -ril bb.data *`
>
> Why ignore case?
>
> I suggest running the grep first redirected to the file, then editing
> the contents to ensure you don't get things like CHANGELOG and probably
> be careful with the Documentation.
>
> The groups look sane to me.
>
> The only other thing I'd make sure to try and watch (not necessarily
> handle) are multi-line bb.data.[sg]et(Flag)? calls. I suspect there are
> few enough of them, if any, that they could be managed by hand.

Heh, too bad bitbake doesn't know how to emit metadata back out from
its ast. This seems like it'd be an ideal case for writing a custom
2to3 fixer rather than using sed. It would catch the multi-line case
you mention, since it lets you specify grammatical patterns against
the python parse tree and do transforms against it.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


