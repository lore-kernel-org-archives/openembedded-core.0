Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SDeDn-0006rk-0P
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 17:58:39 +0200
Received: by wgbdr12 with SMTP id dr12so642222wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 08:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=z/A2583xVmI+WKeYfinmNiJtm63aqHDGaE9zhXh5250=;
	b=JqTe7QXaSlFg1Drh6vhhhvkKiU/SWi2nsg3qMGwa5iFNRNnPfOG9AnvOJfSzZ9DfG7
	R+kyWZ9swCH4DEzyTLNVrKQef5YXafrhGh8ZH6uD+We4Sa2VANiqTo9+dhnTVCB8K05/
	uIfWN7T2XTvRwK0b2HKvogxF2RZYyEH+VOx0wSt9cw5o5LcuV0hdNZ7MdHV2IRLjpz/s
	YR6JYEHOxhP5geue9wxEMigo8AuxpYZt47kZoV6qzTauWkJDJJJhW7VoPh/lAX/9m2g7
	ZThgywh/SRkLC47U6Rm5p5xwVHU0pwki8uLUaP0P6RfflZnwo1nbvmrbSXQOo6J1jgr/
	n0Xw==
MIME-Version: 1.0
Received: by 10.180.102.101 with SMTP id fn5mr7701318wib.6.1333122573891; Fri,
	30 Mar 2012 08:49:33 -0700 (PDT)
Received: by 10.216.38.135 with HTTP; Fri, 30 Mar 2012 08:49:33 -0700 (PDT)
In-Reply-To: <20120330172440.54592fce@eb-e6520>
References: <20120329225332.0e8cc2f4@eb-e6520> <1333058593.18082.40.camel@ted>
	<20120330105006.00955b5d@eb-e6520> <1333120364.18082.77.camel@ted>
	<20120330172440.54592fce@eb-e6520>
Date: Fri, 30 Mar 2012 11:49:33 -0400
Message-ID: <CADkTA4PygfQymsiWhLTTDHLBhTCxx9FY-wWDQNnkaNBfOZ_GwA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Fetch time optimization (svn : gcc/eglibc - git : linux-yocto)
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
X-List-Received-Date: Fri, 30 Mar 2012 15:58:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 30, 2012 at 11:24 AM, Eric B=E9nard <eric@eukrea.com> wrote:
> Le Fri, 30 Mar 2012 16:12:44 +0100,
> Richard Purdie <richard.purdie@linuxfoundation.org> a =E9crit :
>> On Fri, 2012-03-30 at 10:50 +0200, Eric B=E9nard wrote:
>> > the default configuration seems to fetch from source control systems
>> > as I always see very long time to fetch gcc/eglibc/linux-yocto
>> > (despite having a 2.2 MBytes/s downlink DSL line).
>>
>> If you're hitting the SCMs I can understand the frustration.
>>
> that's not a frustration, that's a feedback on the default
> behaviour. But I agree with you that could be a frustration for someone
> trying OE-core for the first time ;-)
>
>> Try adding this to your configuration:
>>
>> PREMIRRORS =3D "\
>> git://.*/.* =A0 http://downloads.yoctoproject.org/mirror/sources/ \n \
>> svn://.*/.* =A0 http://downloads.yoctoproject.org/mirror/sources/ \n"
>>
>> and see if that helps the performance. It might be we consider making
>> this the default for OE-Core although some people are nervous about
>> doing this...
>>
> sure that will help : in my work setup I have my own mirrors configured
> but here again, that's not what a new user will have and in that
> case, I'm testing the plain default configuration to help finding bugs
> or things to improve the release.
>
> I think fetching from git or svn should not be the first thing to do in
> recipes like gcc, eglibc, linux & co where we are based on a
> stable released version : this doesn't bring real added value to the
> user in OE context and this wastes bandwidth (a tbz2 kernel is around

s/user/developer/ and there is value in having git history. I know we'd nev=
er do
without it in our shop.

I suggested shallow clones and some other options to Richard a few weeks
ago, or some other hybrid models. They all vary in terms of nastiness and
have some good and bad points.

But from a kernel guy's point of view, you definitely want to work
inside git, but
I can see from non-kernel point of view, build and boot is all that
really matters.

Cheers,

Bruce

> 75MB, a git one is around 600MB).
>
> Eric
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


