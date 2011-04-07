Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cgwalters@gmail.com>) id 1Q7rHi-0002OK-LE
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Apr 2011 17:38:14 +0200
Received: by vxd7 with SMTP id 7so2260681vxd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2011 08:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=FQEyzplzQhyHhhAw8pkqFh9XJy8YSe1AP8rguLYZ+PA=;
	b=JJtv6Cdc341AkDQa94kMTtk4zX8iUcaTFUvCzypbnlM1y1qfx8c0YECogkUIk2ci9D
	0883OMf4wtelm3bErK6Eeke6ei4RCItvsyiqu0yS1HhzXjllo/Ef2sD2hes+eRIP5QGn
	JNAY2MEEoEeCuac7/OVCN94CK8mvT9xlDy/bo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	b=U0w/74XItWP/GF6s4Nh20TAYNNh5rw6t1MJE4+9O3vx7plIor1EyyP+Fk2PGalskxY
	xARUyTVQz+JcTAYYQbqUJWMF/qYJUMyIx2DLt6uZk5x/CIP0SsLXy+zKNIDVJtk8SCuc
	EA4juCJmySnzQz1w5BwxpmOgIlBH27EWlQ+WA=
MIME-Version: 1.0
Received: by 10.52.66.241 with SMTP id i17mr1477318vdt.54.1302190565868; Thu,
	07 Apr 2011 08:36:05 -0700 (PDT)
Sender: cgwalters@gmail.com
Received: by 10.220.44.198 with HTTP; Thu, 7 Apr 2011 08:36:05 -0700 (PDT)
In-Reply-To: <1302001365.24596.459.camel@rex>
References: <1302001365.24596.459.camel@rex>
Date: Thu, 7 Apr 2011 11:36:05 -0400
X-Google-Sender-Auth: ClkQNZryw35UPiXP0s8zZdiEGcs
Message-ID: <BANLkTinaGY_6Ks7pTfwYcVaDxs3ANbT2Gg@mail.gmail.com>
From: Colin Walters <walters@verbum.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailman-Approved-At: Thu, 07 Apr 2011 17:42:02 +0200
Cc: poky <poky@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky] Proposed Multilib Implementation Brainstorming
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
X-List-Received-Date: Thu, 07 Apr 2011 15:38:15 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 5, 2011 at 7:02 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> One of the items on our post 1.0 schedule is multilib and we need a plan
> of implementation. I've been thinking about this for a while and at
> least have some ideas how some of the issues can be handled.
>
> In case anyone isn't familiar with the idea of multilibs, the most
> common example are x86 systems which have both 32 bit and 64 bit
> libraries installed at the same time in /lib/ and /lib64/ directories or
> similar and hence both types of binaries can be used.

I call this "rpm style" multilib.

> The number of libs isn't limited to two choices as for example the mips
> platform has three choices which can be used in parallel. The x32 ABI
> would mean three possible x86 options too.

I don't think there's any precedent in RPM for anything beyond 2 (is there?)

In this discussion we should be sure we're clear on the distinction
between "multilib" and "multiarch".  Multilib's goal is simply
parallel-installable libraries mainly; for the use case stated above,
where you have a 64 bit system and want to run a 32 bit Unix
application, or vice versa.

Multiarch is much more ambitious - it includes cross compilation for
example (something that people keep thinking multilib was designed
for, but it never was).

So are you proposing multilib or multiarch for OE?  It looks like
multilib, but I want to be sure we're clear on the goal.

In your proposal, it looks like you're suggesting the libdir names are
up to the image creator?  If we're doing something new *now* without
any backwards compatibility concerns, we might consider using the
Debian/Ubuntu scheme for libdirs.  This may come at the expense of
having to patch RPM, but I'm not sure how hardcoded the lib/lib64
paths are in the ecosystem; it may be pretty easy.


