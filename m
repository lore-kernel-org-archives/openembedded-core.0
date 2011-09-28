Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R8ilM-0002sX-2G
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 03:16:40 +0200
Received: by pzd13 with SMTP id 13so19768067pzd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2011 18:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=z+s+L+59rdmmCN39/6Vsylk9EVZmbND9hnquo7RC4EM=;
	b=iBZOW/bBBinGAJLgVyVc5go+eA8p8yiPn+cYbTk+cGRF/Nunikw80wLLYNq3WORiBl
	EW6eIS5FuD91s5FRry+6pwZl6WljpzWjXWm3v1UnHAOmuzfz6Cps6AEF0bFl1GjK4JVR
	8DfWAkOG3Blqx13F6c+/HJbZLHMTBnMo1IU4Q=
Received: by 10.68.19.196 with SMTP id h4mr41038401pbe.39.1317172273063; Tue,
	27 Sep 2011 18:11:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.42.98 with HTTP; Tue, 27 Sep 2011 18:10:43 -0700 (PDT)
In-Reply-To: <1317151788.3120.7.camel@lenovo.internal.reciva.com>
References: <CAMKF1spia2JSMq_jQwUUKJWUzjNC+pD-qKTiBAaSDujHuB3iPg@mail.gmail.com>
	<1317151788.3120.7.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Sep 2011 18:10:43 -0700
Message-ID: <CAMKF1srO6v3DFRT-JN=FZ8riMo3hyWk8cDjtwYt-tiAYOXhf-A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 28 Sep 2011 01:16:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 27, 2011 at 12:29 PM, Phil Blundell <philb@gnu.org> wrote:
> On Tue, 2011-09-27 at 10:23 -0700, Khem Raj wrote:
>> We have gold and ld available to us as linker alternatives. When
>> linking webkit with ld it takes 45 mins and grabs 2G of memory where
>> as with gold on same machine
>> it took 7 minutes. But then we can not use gold to link glibc and
>> kernel and may not work on all supported arches. So gold may not be a
>> complete replacement for ld. A good solution is that we make it
>> possible
>> to choose linker at compile time when building the application. gcc
>> does not have provisions to select linker on commandline although it
>> has configure
>> options to select default linker.
>
> Are there any real-world scenarios where this is actually causing a
> problem? =C2=A0Glibc already has its own private compiler (i.e.
> gcc-cross-initial) which it can configure any way it wishes, and the
> kernel generally likes to call ld directly rather than via the gcc
> driver. =C2=A0So those two are basically a non-issue as far as gold is
> concerned. =C2=A0The thing about not working on all arches is also someth=
ing
> of an non-problem from this point of view, since if gold doesn't work on
> a particular architecture (eg mips, I think) then there can't be any
> question about which linker should be selected and specifying it
> per-recipe would be pointless.
>
> I'm not necessarily opposed to adding a wrapper to make the linker
> selectable per recipe but it does rather seem to me that it's a solution
> in search of a problem. =C2=A0And, if it genuinely is a widespread proble=
m I
> would have rather thought that it ought to be tackled in consultation
> with gcc upstream, otherwise they might go off and invent a different
> mechanism for doing the same thing.
>

I have thought of that and we know about kernel and eglibc but we
don't know about rest of apps
that we build. I don't know if gold has been deployed distro wide
thats why the approach was to have gold replace parts where it really matte=
rs

then we might have packages where they use linker directly and or have
own linker
scripts which are tuned to ld and may yield something different with
gold of-course
those problems should be fixed but having something in place to make packag=
e
wise choice sounded better to me.

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


