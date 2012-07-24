Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Stbbr-0004Ik-ID
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 11:40:55 +0200
Received: by yhjj56 with SMTP id j56so5937693yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 02:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=5FmjkJqnZsStI2N/WHImVT6PK7PEemMJBcJD7FZj00c=;
	b=PCNJAfxoZSsQJBtkoKtaQaFh8WwN8cwbVXEJA0rFuchlHH44T4sVOVkcVbn9VT7DZ2
	DadAfAGx2FsUf3QDV/mBrLA34tDAKoZb14qboNloSiYodz0CnzFdZMynP4qczM3ryNQo
	KiWNBPasAfu3Ze9SrM3oqYFj3qvZPXicNTIM9288pKm/RFXMZjA+JC5KfRwZc9Hp38vy
	HUhx7e9VG6w01Ibh8+uRyTSV7MQSQTFntIsnq4ilZK0C8vnKy6lgZleY2KPfB/KSklg4
	ffdNBweQWC2dwn07ZMPl4YSuy+WUdHMg59VHlpKLYToZjh91ggvMgE625TNlUoBmrSiV
	HGgw==
MIME-Version: 1.0
Received: by 10.42.154.199 with SMTP id r7mr13761318icw.55.1343122166579; Tue,
	24 Jul 2012 02:29:26 -0700 (PDT)
Received: by 10.64.23.72 with HTTP; Tue, 24 Jul 2012 02:29:26 -0700 (PDT)
In-Reply-To: <1610928.T7hSJDQ7P6@helios>
References: <alpine.DEB.2.02.1207240455440.18822@oneiric>
	<1610928.T7hSJDQ7P6@helios>
Date: Tue, 24 Jul 2012 11:29:26 +0200
Message-ID: <CA+chaQdQwBe9Z7Np9fqGXGbC1Ghe9MFAP0E2vOFEM-MiTWb4eg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: more pedantry: inconsistent presentation of how to introduce layers
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
X-List-Received-Date: Tue, 24 Jul 2012 09:40:55 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 24, 2012 at 11:15 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Tuesday 24 July 2012 05:04:25 Robert P. J. Day wrote:
>>   i asked about this not that long ago but i'm still a bit puzzled --
>> what's the best practice for adding new layers in terms of how
>> bblayers.conf and the various layer.conf files are defined?
>>
>>   the default layer.conf for oe-core contains:
>>
>> BBPATH .= ":${LAYERDIR}"
>> ...
>> BBFILE_PRIORITY_normal = "5"
>>
>> so, clearly, the oe-core layer is being *appended* to whatever is in
>> BBPATH.  ok, let's go with that.
>
> FWIW, this was a relatively recent change.
>
>>   on the other hand, that same file for the meta-yocto layer contains:
>>
>> BBPATH := "${LAYERDIR}:${BBPATH}"
>> ...
>> BBFILE_PRIORITY_yocto = "5"
>>
>> so it's being *prepended*.  is that deliberate?
>
> Not sure, but being kind of like a distro layer it's not unreasonable to
> expect that classes and conf files in it will take precedence. That said in
> most cases we probably ought to be consistent and stick to appending to
> BBPATH.
>
>> the end result is that my BBPATH is:
>>
>> /home/rpjday/yocto/git/meta-yocto:/home/rpjday/yocto/builds/bbc4:/home/rpjda
>> y/yocto/git/meta
>>
>> which clearly represents:
>>
>>  * the yocto layer
>>  * my build layer
>>  * the oe-core layer
>>
>> with both the yocto and oe-core layer having priority 5.  is there no
>> chance of confusion here?
>
> As I mentioned before, the priority currently has no bearing on the order of
> BBPATH - that is determined by the order in which the layer conf files are
> parsed and (as you highlight) whether they prepend or append to BBPATH.
> Remember that the BBPATH only affects how class and conf files are found - it
> does not have anything to do with recipes.

And order of .bbappends applied, no? In case some recipe has
.bbappends in multiple layers and
later layer is trying to override some setting which is also altered
by some bbappend in layer between.

>
>>   in addition, the yocto development manual itself, in section 4.1.2
>> on layers, stresses the use of:
>>
>> BBPATH := "${LAYERDIR}:${BBPATH}"
>>
>> but every single meta-openembedded sub-layer uses the *other* form:
>>
>> BBPATH .= ":${LAYERDIR}"
>
> Again, only as of quite recently - something we should correct in the manual
> though.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


