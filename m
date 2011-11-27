Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RUiFC-0005HJ-4x
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Nov 2011 18:10:23 +0100
Received: by lahe6 with SMTP id e6so338121lah.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Nov 2011 09:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=THkciftYxLsS3wSIBFTN+DBdBWhPE6nqWslqdQ74RIg=;
	b=rFa39SScXvYYA0Ok/qKG7YpM2zhpruG3rd8wCtPwVxMT7snAgTyfwsgcY3FyuaFy1r
	5xbbL7yGwcCPvMJY0CM6RtUPV00zJtqczaaR2te5+fU4Lj6Q+1PC6z84LKHWkKzWtRBf
	5Gk4A6cFveBeOsEV3oFKteghCgP7YyGIGTt4g=
Received: by 10.152.132.39 with SMTP id or7mr25904664lab.14.1322413417239;
	Sun, 27 Nov 2011 09:03:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Sun, 27 Nov 2011 09:03:05 -0800 (PST)
In-Reply-To: <1322393859.4798.13.camel@ted>
References: <cover.1322095568.git.sgw@linux.intel.com>
	<f8e475e6907d1ad9bfb93ec4c37a0876bc5ed90f.1322095568.git.sgw@linux.intel.com>
	<CAMKF1srOcDxn+y3JaLrN=PCyeHYdhp45ypSy-g4NUc5=uMGwzQ@mail.gmail.com>
	<4ED134CF.70706@linux.intel.com>
	<CAMKF1spYAcXRg3of=P-bjoZmb11HhnaDztomSBMCjPFx=zsGRw@mail.gmail.com>
	<1322393859.4798.13.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Nov 2011 09:03:05 -0800
Message-ID: <CAMKF1squ5ea8QK8MpB1Htq_sjizR_w_OiaTwLUPagDDzM8tPrw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] intltool: remove XML::Parser check
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
X-List-Received-Date: Sun, 27 Nov 2011 17:10:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 27, 2011 at 3:37 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2011-11-26 at 13:36 -0800, Khem Raj wrote:
>> Hi Saul
>>
>> On Sat, Nov 26, 2011 at 10:49 AM, Saul Wold <sgw@linux.intel.com> wrote:
>> > On 11/24/2011 11:37 AM, Khem Raj wrote:
>> >>
>> >> On Thu, Nov 24, 2011 at 10:29 AM, Saul Wold<sgw@linux.intel.com> =C2=
=A0wrote:
>> >>>
>> >>> Add Patch to disable the XML::Parser check in the target
>> >>> intltool.m4, this check will find the host (not native)
>> >>> XML::Parser if it's installed possibly causing Host
>> >>> contamination, but will also fail configuration if XML::Parser
>> >>> is not installed on the host.
>> >>>
>> >>> Since we know that XML::Parser is installed on the image, we don't
>> >>> really need this check, so comment it out.
>> >>
>> >> if it is installed then why does it fail to detect it ?
>> >>
>> > Because the recipes that depend on intltool do not inherit perlnative,=
 the
>> > recipes in question are gconf and shared-mime-info. =C2=A0They depend =
on
>> > intltool, but do not need to directly inherit perlnative (at least acc=
ording
>> > to RP).
>>
>> why dont they need to inherit perlnative ? If they depend on intltool wh=
ich
>> expects that its dependees inherit perlnative. I am just worried where t=
his
>> may cause issues. There might be other recipes which should need XML par=
ser
>> and may not get it since we remove the test here.
>
> All of the intltool scripts have the correct paths to perl already
> embedded into them and can find perl fine.

I see. I think this should be added to comments somewhere may be in
intltool recipe itself
and I hope this also works for target intltool recipe.

If the recipe needs perl for
> some other reason than intltool, it needs perlnative but it if only
> needs perl for intltool, we shouldn't need the dependency. The .m4 macro
> checks are well intended but don't fit the way we use perl. I really
> don't want to end up in a position where intltool automatically means we
> have to add perlnative as a dependency and we've previously seen many
> problems related to that.

agreed.

>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


