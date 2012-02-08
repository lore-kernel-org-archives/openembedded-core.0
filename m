Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RvEEK-0008W2-W7
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 21:35:05 +0100
Received: by lahc1 with SMTP id c1so889964lah.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2012 12:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=bk7QRxLOuoz7USgKQ3tSqGy9nJ8jCSQUtPRcx1B31X0=;
	b=cfl2Jpbuzy8L2D3ubruGWFwGo5TEV8gerxqZLXMuXelKQsLbziYVCwbSfHimzfJF/x
	nR1Cv7aToddthJdEk4zYjcZbR2ajABf1/heXBZO3SZrvq0QyR5PntdVtSeS+a7uP+wqD
	ovuPbr5Tu+62NPfX83eW/Gov2RQM5a6cXMv+c=
Received: by 10.152.125.20 with SMTP id mm20mr11889010lab.6.1328732821246;
	Wed, 08 Feb 2012 12:27:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 8 Feb 2012 12:26:31 -0800 (PST)
In-Reply-To: <1328712879.29471.34.camel@ted>
References: <1328712879.29471.34.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Feb 2012 12:26:31 -0800
Message-ID: <CAMKF1sprctS74sf1HrmoBEvLeH7Y-VnKLZF6nZdn48VAeMzhzg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Some notes on speeding up do_package_write_rpm
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
X-List-Received-Date: Wed, 08 Feb 2012 20:35:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 8, 2012 at 6:54 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> real =C2=A0 =C2=A07m15.207s
> user =C2=A0 =C2=A02m31.320s
> sys =C2=A0 =C2=A0 0m27.720s
>
> and after, with the python script:
>
> real =C2=A0 =C2=A05m23.727s
> user =C2=A0 =C2=A03m25.540s
> sys =C2=A0 =C2=A0 1m4.530s
>
> So in real terms its much faster but it claims to be using more user and
> sys resources. So it looks to be a performance speedup (and everything
> I've done would agree with that) but those user/sys numbers don't make
> sense.
>
> I find the first set of numbers odd anyway as how can something spending
> 2.5 minutes in user and 0.5 minutes in sys making a total of 3 minutes,
> take 7.25 minutes to run on a multicore system that is otherwise idle. I
> suspect somewhere, the accounting in the kernel is screwing up maybe in
> the handling of the many short lived processes we were triggering.

yeah could be its so small that it gets rounded off.

The
> real numbers correspond with my stopwatch so I'm happy to proceed with
> changes in this direction but if anyone does understand why those
> numbers would differ like that, I'd be interested to know about it.

I think it could be that there is more parallel threads now. since user+sys
is across all cpus so you see more user+sys but overall real time
is improved so its good.


