Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PzC7J-0003pL-PW
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 19:03:41 +0100
Received: by fxm19 with SMTP id 19so3097681fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2011 11:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DXMLIATSpSFhMuf4NxPcG9VP8Bzm6V7Mn+4j96R+l5k=;
	b=kBQlLe+aFHHf/z0RJHlsBF8b6xWDRxVdw9EMAbJO14vxx67xXnILLLWnlZEf2rLl3Y
	NOUrJxQ4Y/+sDtEn2XDvC8XTeVm9bEfjhNrNzk8mdGqWX/ZfYGKbEpFjlTsQE9TbqiGM
	/XrDygDhHAT9P5MEnxlbkgjoaL/+ySSCss+Ps=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=PpQamxpUEWVfcVyC0MPOUiqTUffOjlUbQu2IKQp0+N2EK3jw+cPSsP/u+sDPXb/3RV
	R1BezgkV68TmCs8+8pAeKz05yLn3zZWrrvBX/FTVj9NIVzcKDMZHsWXMbbcvkeHGXte/
	29CSaW9q4DPdg5dswmW99R89O/YbjKYzYYaVw=
Received: by 10.223.120.84 with SMTP id c20mr5887543far.144.1300125254753;
	Mon, 14 Mar 2011 10:54:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.41.89 with HTTP; Mon, 14 Mar 2011 10:52:38 -0700 (PDT)
In-Reply-To: <1299934200.1445.3023.camel@rex>
References: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
	<1299135167-18330-4-git-send-email-raj.khem@gmail.com>
	<AANLkTiks0VSWcW4_54mQUv17ZQvb8+CsbWcsDkA_9ZA+@mail.gmail.com>
	<1299610396.602.104.camel@rex>
	<AANLkTim62_Vb=EumqASMY_ARCJkS8M7rTAUtpxnMR6gx@mail.gmail.com>
	<1299934200.1445.3023.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Mar 2011 10:52:38 -0700
Message-ID: <AANLkTimM2W1XiRcSJxrXYQDDRd2Hyxg3YAqq_kBVheWK@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 3/6] gcc: Statically link in support libraries e.g. libmpfr libgmp etc.
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
X-List-Received-Date: Mon, 14 Mar 2011 18:03:41 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Mar 12, 2011 at 4:50 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2011-03-08 at 11:04 -0800, Khem Raj wrote:
>> On Tue, Mar 8, 2011 at 10:53 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Mon, 2011-03-07 at 22:38 -0800, Khem Raj wrote:
>> >> ping any opinion on this patch ?
>> >
>> > This change looks rather hacky and I'd really like to understand more
>> > about why this is needed and whether there is a better way we could
>> > ensure the right flags get passed around. Can you provide more details
>> > about whats going on with this. Obviously this change as it stands isn't
>> > acceptable to upstream gcc and I'd like to see if we could find one that
>> > was.
>>
>> this is because the supporting libraries like mpc mpfr that are needed
>> by gcc itself to run
>> we might have different versions of these libraries. So depending upon
>> shared objects
>> would mean we need to find same shared objects where say the SDK is installed
>> so either we ship the whole baggage or we link it in statically. This
>> patch makes those libs to
>> linked in statically and cross gcc wont have dependencies on these
>> libs anymore so
>> it can run on all hosts pretty much.
>
> If you look at the way the SDK toolchain works in Poky, it automatically
> ships the versions of these libraries that it needs so we don't actually
> have this problem.
>

Yes thats one way of doing it and if you got it working this is fine
but there were issues when referencing
due to ORIGIN mucking. So this was better and cleaner than we link in
this libs into binary itself.  From
my POV even this solution can be improved by adding the support libs
to gcc build itself as sources
then we dont need to muck with gcc build configury at all. I have been
doing that for non OE related
SDKs and has been best so far.

> Also, looking at the patch again, was the first LDFLAGS change meant to
> be in there, is that related or different to the shared/static
> mpfr/mpc/gmp issue?

LDFLAGS are modified to get the LDFLAGS into gcc itself otherwise it
would not honour
the modified LDFLAGS to pass -static option.

>
> Cheers,
>
> Richard
>
>


