Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1S8GGW-000309-8N
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 20:23:12 +0100
Received: by ghbz2 with SMTP id z2so3390064ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 12:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=OV0fa+rDtY8JfqT5B8Q+kODVoNl1DJfjaCRP9y3te+8=;
	b=SVsyV4jGrSv+wMXwD21U1nQ65tQQZl+e5bZ4jXmvgYwFTmoKjflDilMek01zeT1jDu
	bM/WWMADcPsapmdJfYxcnTMYJh9M/a0zZKvW02oAXOfhhBu05GsCmeecOazupwQGx6+o
	ll0kx6gMZYGwUM8AGBXTOBBJ0xPiYvCkg1E7q7RN6J8zjIcKKuARzWJatvD/uWRtrwu6
	Nkxcf8c0nq/qc72tfsEMlQNfyhGrMBGtmm28nhFSiP6oRA/xxLE7jPMjdI4r2K687O2g
	6Lbp5Gvllgz7dQCalXl4Lre3sla0tYqWUk8+yISsUNr12ruXXR/u0uU2217utshrt1jc
	D+/g==
MIME-Version: 1.0
Received: by 10.60.14.4 with SMTP id l4mr9707261oec.39.1331838864778; Thu, 15
	Mar 2012 12:14:24 -0700 (PDT)
Received: by 10.182.246.8 with HTTP; Thu, 15 Mar 2012 12:14:24 -0700 (PDT)
In-Reply-To: <4F62171B.4060203@windriver.com>
References: <CAGDS+n=KnzzUvUfv_T5X9yHPtOzQ7cgORh-ZbOJZDbFis9F69Q@mail.gmail.com>
	<1331818796.18586.85.camel@ted> <4F62171B.4060203@windriver.com>
Date: Thu, 15 Mar 2012 12:14:24 -0700
Message-ID: <CAGDS+nmdJNhd4X2=vSFNsexnXZvE_pOy2vjD-k+6DoLGefFpCA@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: boost breaks on rebuild
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
X-List-Received-Date: Thu, 15 Mar 2012 19:23:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 15, 2012 at 9:21 AM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 3/15/12 8:39 AM, Richard Purdie wrote:
>>
>> On Wed, 2012-03-14 at 15:28 -0700, Steve Sakoman wrote:
>>>
>>> NOTE: package boost-1.49.0-r2.0: task do_compile: Failed
>>>
>>> I don't have a fix for this but wanted to document the failure.
>>>
>>> As with all the other failures of this type, a -c cleansstate and
>>> rebuild is the workaround.
>>>
>>> It feels to me like there are quite a few recipes that don't handle
>>> rebuilds -- I seem to run into a few after every pull.
>
>
> I've observed the same thing. =A0There seem to be a lot of packages that =
once
> they've been configured, compiled and installed, won't rebuild without be=
ing
> cleaned in someway.

This is the one that really pisses me off, happens after every pull on
my Ubuntu 64 bit build machine:

Summary: 1 task failed:
  virtual:native:/home/steve/source/yocto/poky/meta/recipes-devtools/pseudo=
/pseudo_1.2.bb,
do_compile
Summary: There were 8 WARNING messages shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

No simple fix since any bitbake command complains about needing to
rebuild psuedo:

Pseudo is not present but is required, building this first before the main =
build

And of course the psuedo rebuild instantly fails!

Steve

> One suggestion, maybe a new flag for a recipe that says that recipe rebui=
lds
> need to start from a clean patched tree? =A0Then if the do_configure ->
> do_install steps have been run, it knows it needs to clean and
> fetch/unpack/patch before it tries to rebuild the component... =A0(Maybe
> sstate-cache can help speed this up in some way...)
>
> Then over time we can find the items with the flags and attempt to fix th=
em
> in other ways...
>
> --Mark
>
>
>> Agreed, there is a problem here. I've filed the bug:
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2123
>>
>> since I think we systematically need to work through these and eradicate
>> them.
>>
>> An alternative to fix some of the compile cases would be to run a "make
>> clean" before the make. I suspect this would annoy people and its a
>> shame to do that because of a few broken recipes though...
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


