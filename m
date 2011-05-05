Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QI1w0-0004Lc-V4
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 19:01:53 +0200
Received: by ewy5 with SMTP id 5so729300ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2011 09:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=GoqWyNN5SMr6fW+rgR/hAyutyZLRJl6ejpDppSeo5FE=;
	b=rHU9Ua+JKxJph5f+mh4yMHFyRctQiakrEvTMSHYZ8Jdv8tEuGrKzpugQRiLYGbqHdc
	CcorBvep/spqN/w+GSSre53IcP0AB+X46KDsnVpq1Oj6EJ4Gyq+NoFU2FyTm29kMiwQw
	EtH8CJL3lMZb6YfqN3Cc3d84mavGnnFxTPNC4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=f1wVGTkCxVteDfWGHaYLrGywCocCcF+O7yox2sHNl5fStN9T/rbPiEMXXNhQ0KZ8vm
	vyipRobXecROX5LIVoj6HmB7cUIWWCWkqwfi6rxgmU3g+2DQf8cFIgYTR5SimUTLoXyX
	V9IMdQDI2MMIQqrMNQD7iBM3oxo9d/Y+rqrS4=
Received: by 10.14.125.4 with SMTP id y4mr1345769eeh.109.1304614750119; Thu,
	05 May 2011 09:59:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Thu, 5 May 2011 09:58:39 -0700 (PDT)
In-Reply-To: <1304588513.20791.15.camel@rex>
References: <cover.1303889119.git.sgw@linux.intel.com>
	<ed1614da74a5bf5820855d9d5bd9ab6213bc36de.1303889119.git.sgw@linux.intel.com>
	<1303981290.21461.39.camel@rex>
	<BANLkTimx4ry=vZdiNzYna1EE121Q85mUOA@mail.gmail.com>
	<1304424898.21461.107.camel@rex>
	<20110503180447.GB5436@sakrah.homelinux.org>
	<1304462379.21461.144.camel@rex>
	<BANLkTi=y+rFFeojpoX_OB2uoswF373P_Ww@mail.gmail.com>
	<1304588513.20791.15.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 May 2011 09:58:39 -0700
Message-ID: <BANLkTimaLRjHoPa4DfA0gZShMpP6ZKxAKA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 36/52] gettext.bbclass: Use _append instead of =+
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
X-List-Received-Date: Thu, 05 May 2011 17:01:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 5, 2011 at 2:41 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-05-04 at 18:07 -0700, Khem Raj wrote:
>> a build from scratch revealed few more issues with this patch too.
>>
>> 1. We have to only remove gettext from dependencies if its a target
>> package for all other it still it needed otherwise all native and
>> cross tools start failing to build
>> =C2=A0e.g. binutils-cross this can be easily solved by a patch
>>
>> iff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
>> index 6f79e5e..cc39204 100644
>> --- a/meta/classes/gettext.bbclass
>> +++ b/meta/classes/gettext.bbclass
>> @@ -1,5 +1,5 @@
>> =C2=A0def gettext_dependencies(d):
>> - =C2=A0 =C2=A0if d.getVar('USE_NLS', True) =3D=3D 'no':
>> + =C2=A0 =C2=A0if d.getVar('USE_NLS', True) =3D=3D 'no' and not oe.utils=
.inherits(d,
>> 'native', 'nativesdk', 'cross')
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ""
>> =C2=A0 =C2=A0 =C2=A0if bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, True) a=
nd not
>> oe.utils.inherits(d, 'cross-canadian')
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ""
>
> This looks reasonable, its still much clearer what is happening and why
> compared to the original version...
>
>> second problem is that EXTRA_OECONF when recipes override it instead
>> of +=3D or appending etc.
>> then --enable|--disable-nls that we added via gettext_oeconf() is lost
>> as a result some packages complain about config.rpath
>> when USE_NLS is set to no the reason is their configure is missing the
>> argument --disable-nls this works ok
>> for eglibc based targets since default is to enable-nls if nothing is
>> specified but uclibc fails. As a testcase try to preprocess
>> utils-linux
>> recipe and check the contents of EXTRA_OECONF
>
> I suspect we can fix this with:
>
> -EXTRA_OECONF +=3D "${@gettext_oeconf(d)}"
> +EXTRA_OECONF_append =3D " ${@gettext_oeconf(d)}"
>
> ?
>
yes something like that
somehow the patch I attached did not make it to ml
I have sent it separately now.


> Cheers,
>
> Richard
>
>


