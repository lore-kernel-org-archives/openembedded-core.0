Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QRoto-0003V0-Dm
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 19:08:04 +0200
Received: by vws2 with SMTP id 2so2597vws.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2011 10:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=RnjTv1WMW3d48MN4EzV+ROpbc0rzB4ghzUyCqtCqUmo=;
	b=Xg0x3DGYR90RusaCb+yDTI8jhFkUQ7Dj7DWs7i2Luo43Upygk9Sn2SHd7r8Czek/Co
	WaQB1xN0pN0zT3GfsYOASpOelWXmkudKTg1uwI468/NLJJdnjH46ziVkxFyUiEP6lxDy
	keqoaDmnYMbXvh5w6LTgzir8srD4duXQnTKvo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=vxvg9z5CDxxc6GAV57BQAbysZ/BgVdynBrtMH33f2LkxaZRqoZIB3sEjFyMIAQwzYs
	0Iopy9Tqp9OLeqsHbmeuLkrm5G3di23NFJVsdgNY4/7x8X/ZWMfY/pNM8vLjkG9f9Z4P
	3qPPnCha/5j/pmnuTJfGgJiCnJx1HH+H/THAQ=
Received: by 10.52.176.106 with SMTP id ch10mr10310589vdc.155.1306947511097;
	Wed, 01 Jun 2011 09:58:31 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.101.134 with HTTP; Wed, 1 Jun 2011 09:58:11 -0700 (PDT)
In-Reply-To: <1306945558.27470.435.camel@rex>
References: <4DE56B0D.4020209@intel.com>
	<1306940803.2529.101.camel@phil-desktop>
	<1306945558.27470.435.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 1 Jun 2011 09:58:11 -0700
X-Google-Sender-Auth: bicOGh18y11mb07MVx-GMqAWxRQ
Message-ID: <BANLkTi=Q3aMmzd3kAa4usT7wMzyhXL+bnw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Tell me your build error message annoyances!
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
X-List-Received-Date: Wed, 01 Jun 2011 17:08:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 1, 2011 at 9:25 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-06-01 at 16:06 +0100, Phil Blundell wrote:
>> On Tue, 2011-05-31 at 15:26 -0700, Scott Garman wrote:
>> > I'd like to collect some feedback on error messages while building tha=
t
>> > you find confusing/annoying/unhelpful. I'm going to be working on tryi=
ng
>> > to improve the situation and would like to hear from you about what
>> > could be more helpful.
>>
>> Funnily enough we were just having a discussion about this on irc. =C2=
=A0My
>> personal top two least favourite diagnostics are:
>>
>> a) "bitbake -b nonexistent-file" gives ten lines of so of python
>> exception traceback and then prints "MultipleMatches".
>>
>> b) "bitbake -b recipe.bb", with a recipe that skips (due to an
>> inCOMPATIBLE_MACHINE or whatever) gives the traditional ten lines of
>> traceback spew and then prints "TypeError: 'NoneType' object is not
>> iterable".
>>
>> This is with bitbake 1.13.0.
>
> Agreed, these are issues.
>
> I'd like to highlight that there is an underlying design issue in
> bitbake which make these hard issues to fix. Its very hard for bitbake
> to work out when it needs to show the traceback and when it doesn't.
>
> If the user has been given an explanation of the problem we shouldn't
> show the traceback but its hard to know that is the case.
>
> Somehow we therefore need to improve the error infrastructure in bitbake
> to be able to tell the difference between an unexpected error where a
> traceback is useful and a known error which has been explained to the
> user and no traceback is required.

I think we have too many places where exceptions are responded to. If
we pushed the handling up as far as we can, it'd reduce the
duplication of error handling code a great deal.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


