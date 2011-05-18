Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QMjqO-0004xP-1K
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 18:43:32 +0200
Received: by ewy5 with SMTP id 5so523169ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 09:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=dth1BhMruKa0vT7OSopoC6DZslFjw2+tYbP0b17Bqgs=;
	b=xBbiK9/YllzulI9iiOPHuTplTSJwu3g+QOCST1GbMUZfaly9+vZ0J5wv2ucw+rhMRn
	p4ifP+UVVdLuX2dJ1Du2nVv4ICqlPUjxTrAXBrKVuh1CnGYjxfdqfocBHcNl4gGnfe0v
	/UIT2nKUHOnDh0hcyCyvba1SfXvxY2BpyDZZs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=J/6R3uMSMqk5uCy6Pjw3IfAcT/woCNtkRI0hgBUb/wl8cLo5FZfYncptWEPv70DqDM
	Jow5ubauB0vJwPioN9jdZmXGoA11RiLISG8+Lfl58VCiNf1cAB0szJc1SwHmc6vQt7dY
	8+B4QWpBrisFgMhgdo4YaabgSlUmTDhoKTnCM=
Received: by 10.14.11.203 with SMTP id 51mr677175eex.204.1305736837098; Wed,
	18 May 2011 09:40:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Wed, 18 May 2011 09:40:04 -0700 (PDT)
In-Reply-To: <1305734038.18415.108.camel@lenovo.internal.reciva.com>
References: <cover.1305665459.git.raj.khem@gmail.com>
	<cc2e6337ae338737455bf63bd43278dee302fb5c.1305665459.git.raj.khem@gmail.com>
	<1305734038.18415.108.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 May 2011 09:40:04 -0700
Message-ID: <BANLkTikiNW0UEfLM_UtKeekTcrW5UNNfUA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] default-distrovars.inc, task-core-boot.bb: Create distro overridable varibales
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
X-List-Received-Date: Wed, 18 May 2011 16:43:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 18, 2011 at 8:53 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2011-05-17 at 13:57 -0700, Khem Raj wrote:
>> With default-setup being pulled in via bitbake.conf and task-core-boot
>> being pulled into all images in distros, we need
>> to have some variables that distro's can override if need be
>> This is a backport from angstrom/OE. It will help distros which
>> e.g. would like to use busybox-mdev instead of udev and similarly
>> for login manager these variables can be defined in distro policies
>
> I'm not massively convinced that this proliferation of extra switches is
> a very good thing. =C2=A0With each DISTRO now having its own layer, it's
> quite straightforward for it to provide its own customised rootfs
> recipes which contain exactly the set of packages that it wants. =C2=A0Tr=
ying
> to create a sort of "generic" rootfs recipe in which every other
> dependency can be tweaked by some obscure variable doesn't seem like an
> especially productive way to proceed.
>

Problem I have is, I dont want udev in RDEPENDS which is added by
task-core-boot
and task-core-boot is added to DISTRO_EXTRA_RDEPENDS through
default-distrovars.inc -> defaultsetup.conf -> bitbake.conf

and my distro adds DISTRO_EXTRA_RDEPENDS to its RDEPENDS
as I think the variable is meant for distro's to define some extra
stuff if needed.

How should I solve this problem ?


> Also, any new variable which is added to default-distrovars.inc will be
> included in the parsed metadata for everything and, although the
> marginal cost (in memory/performance terms) of adding one extra global
> variable is not that great, it's not zero either. =C2=A0Perhaps more
> significantly, there is also a cost in terms of metadata
> comprehensibility: one of the common complaints about "classic oe" was
> that it was difficult to get your head around the myriad little
> variables that you could tweak in some or other configuration file.
>
> So, all in all, I think we should try to keep a lid on the amount of
> stuff that goes into default-distrovars and its friends. =C2=A0If the ide=
a of
> a sort of templated rootfs image really seems like a valuable one then
> maybe we could put those vars in a dedicated config file which is only
> included by the rootfs recipes.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


