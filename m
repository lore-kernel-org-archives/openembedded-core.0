Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RAo1j-0007lc-Fc
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 21:18:20 +0200
Received: by yxj17 with SMTP id 17so3766825yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 12:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=hr7/A8c+qLs34yDmGa6woJN+dayN5ZGOpFlMIk1BuTc=;
	b=K7iceG6PZBg5Cp+lJnN5Q+JzIyQj/FeYT8InZZvGbwjEETI4H5fOd0V8Pc/zRmIojH
	S2+Cz1uR+cK42EQEIsaOaWcGHb//BQgA0G43XRaoyRqHpQ7Y++6sf76TmcZ1aAvk/O+i
	6UVxHMhWlIoL2MY4xL+npbNgyXprivadZfA+w=
Received: by 10.151.85.9 with SMTP id n9mr466476ybl.428.1317669153915;
	Mon, 03 Oct 2011 12:12:33 -0700 (PDT)
Received: from [172.23.2.133] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id c9sm2814202yba.28.2011.10.03.12.12.28
	(version=SSLv3 cipher=OTHER); Mon, 03 Oct 2011 12:12:29 -0700 (PDT)
Message-ID: <4E8A091B.6040503@gmail.com>
Date: Mon, 03 Oct 2011 12:12:27 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAMKF1spia2JSMq_jQwUUKJWUzjNC+pD-qKTiBAaSDujHuB3iPg@mail.gmail.com>
	<1317151788.3120.7.camel@lenovo.internal.reciva.com>
	<CAMKF1srO6v3DFRT-JN=FZ8riMo3hyWk8cDjtwYt-tiAYOXhf-A@mail.gmail.com>
	<1317305306.3304.8.camel@lenovo.internal.reciva.com>
In-Reply-To: <1317305306.3304.8.camel@lenovo.internal.reciva.com>
Subject: Re: Selectable linker (ld or gold) per recipe
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
X-List-Received-Date: Mon, 03 Oct 2011 19:18:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 9/29/2011 7:08 AM, Phil Blundell wrote:
> On Tue, 2011-09-27 at 18:10 -0700, Khem Raj wrote:
>> I have thought of that and we know about kernel and eglibc but we
>> don't know about rest of apps
>> that we build. I don't know if gold has been deployed distro wide
>> thats why the approach was to have gold replace parts where it really matters
>> then we might have packages where they use linker directly and or have
>> own linker
>> scripts which are tuned to ld and may yield something different with
>> gold of-course
>> those problems should be fixed but having something in place to make package
>> wise choice sounded better to me.
>
> I think I would rather wait until such issues actually arise before
> trying to fix them.  Adding per-recipe linker selection seems like quite
> a lot of mechanism, with associated potential fragility, to solve a
> problem that might not even exist in reality.
>
> Also, thinking about this more, I am not convinced that wrapping ld
> directly is going to work reliably.  If I remember right, gcc inspects
> some attributes of the target linker (plugin support being the most
> obvious one) during configure and adapts itself accordingly.

plugin support is now supported in both linkers 2.21+ should not be any 
issue
any other differences between both linkers I am not aware that gcc
would care when configuring itself

> Subsequently swapping out the linker under its feet at runtime seems
> like it would be a bad idea.  If it does turn out that there are
> packages which simply must be built with BFD ld, I think we should
> either:
>
> a) just declare them incompatible with the ld-is-gold DISTRO_FEATURE,
> and say that the programs in question aren't supported by such DISTROs
> (which might or might not be a defensible position, depending on the
> extent to which such programs are a fringe interest); or

this could be a starter

>
> b) fix the programs and/or gold to make them compatible, or if that's
> really intractable; or

obviously wanted to avoid that

>
> c) work with upstream gcc to figurd

yes

>
> c) build a parallel toolchain which uses BFD ld and has its own copy of
> gcc which is appropriately configured, and arrange for the recipes in
> question to find that toolchain in their $PATH.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



