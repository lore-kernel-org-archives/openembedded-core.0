Received: from mail-ob0-f177.google.com ([209.85.214.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U6iGn-0004lq-Ci
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Feb 2013 14:57:41 +0100
Received: by mail-ob0-f177.google.com with SMTP id wc18so4359293obb.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2013 05:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ufpl8knHfva1lcWmm9+7dEQwoj0difUTQIuCryWqA6E=;
	b=pgIBwaNqkDkrJVpx0BJPHGnbFPE22kja/cPYsY9XijxjVk3f854Q9gUelLYboUpHmx
	eXlwwdLzBs2MOJoyVJUrTL0qCCQcxGGJ58oufQEEPWbExsEVA1A5YLOCYe748YngtX2B
	P0FbN8zLqd91xUVDvlqJg+/LeoRYapsrzP9UVPyld2t+/f9/wylSQ2GAjxQb5zC5FqVY
	TLOaQ/4JXZKrg3VZLQEB2r++vRVX8vw0t94BYjEwkOnitjB28kXAKs8BKon8cZq4jy1u
	EdA/lp+cdBm0DdVYccNy0KsKaNjDct81J7uyERa0c5Jq7pxKt3I+w8ke5H86uBff9SNT
	FzSA==
MIME-Version: 1.0
X-Received: by 10.182.88.103 with SMTP id bf7mr3771796obb.7.1361022091888;
	Sat, 16 Feb 2013 05:41:31 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Sat, 16 Feb 2013 05:41:31 -0800 (PST)
In-Reply-To: <1361019187.31795.49.camel@ted>
References: <lyk3q9sam4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1361006114.31795.19.camel@ted>
	<CAP9ODKq_XBobE5vCOCCSgusT9RQyY3VSbUZmR9yAcQ4eFkKLBg@mail.gmail.com>
	<1361019187.31795.49.camel@ted>
Date: Sat, 16 Feb 2013 11:41:31 -0200
X-Google-Sender-Auth: DZ6SwKCvA6m5xpD-gu-XXdwqG34
Message-ID: <CAP9ODKosL9YcwoXhZ58VsQ=S+ynzwe_vTZQG4GGtKTjvzUEafQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFE: make the init manager an image feature (again)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Feb 2013 13:57:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Feb 16, 2013 at 10:53 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2013-02-16 at 08:47 -0200, Otavio Salvador wrote:
>> On Sat, Feb 16, 2013 at 7:15 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Fri, 2013-02-15 at 19:19 +0100, Enrico Scholz wrote:
>> >> it would be nice when the decision to make the init manager a distribution
>> >> feature will be reverted to the old oe-meta mechanism.
>> >>
>> >> Being a distribution feature means, that packages are created in such a
>> >> way that it is impossible to split off unwanted and heavy weighted
>> >> functionality at image creation time.
>> >>
>> >> E.g. on most of my systems, I create two kinds of images: a full
>> >> featured, systemd based one and a very minimal rescue system with
>> >> busybox and some filesystem utilities.  With recent systemd packaging
>> >> change, the rescue image size grow up from 5.9 MiB to 27 MiB because
>> >> systemd dependencies are hardcoded in mandatory packages.
>> >>
>> >> Formerly, systemd dependencies could be avoided by adding the -systemd
>> >> packages to BAD_RECOMMENDATIONS (e.g. due to busybox-syslog ->
>> >> busybox-syslog-systemd rrecommend).
>> >>
>> >> I am aware that initscripts were always part of the main package.  But
>> >> sysvinit was very lightweighted and the extra space either negligible or
>> >> easy to recover by removing some files in IMAGE_PREPROCESS_COMMAND.
>> >>
>> >> Hence my recommendation: make the init manager an image feature again
>> >> and create -systemd and -sysv packages with the corresponding scripts.
>> >> OpenEmbedded is still for embedded devices where size matters.
>> >>
>> >> Of course, systemd can be still a distribution feature to enable things
>> >> like socket activation as part of PACKAGE_CONFIG.  But dependencies on
>> >> init system packages should be RRECOMMENDS which can be overridden
>> >> easily at image creation time.
>> >
>> > The trouble is that by making it an "image feature", people will expect
>> > *everything* to work properly and to be able to have fully functional
>> > sysvinit and systemd variants of images. We already see this
>> > expectation. Trying to explain to people what the limitations are, what
>> > is expected to work and what isn't will be difficult. I know you
>> > understand this but going forward most people will simply not and I
>> > think it will be a nightmare for usability.
>>
>> You said you already see it so what is the change? For me less
>> flexibility is more problem and the result are more ugly hacks. I've
>> been using the systemd system in meta-oe in product for long time and
>> it works fine. In same distro I build other product with is sysvinit
>> based and it also works fine.
>>
>> Now I have a nightmare in upgrade path, a change in the way my
>> customer work and as a plus the need to make two different
>> distributions for same product. No sense to me.
>>
>> Final result? This product won't go out of danny as I won't be able to
>> provide an usable upgrade path without forking OE or having an insane
>> amount of bbappend hacks.
>
> When systemd was added to meta-oe, it was clearly mentioned that it was
> a proof of concept to experiment with integrating it and subject to
> change until it made it into OE-Core. The fact is is changing is
> therefore not a surprise. We do need to think about making sure we have
> equivalent functionality, we also need to think about migration but the
> fact changes happened with some experimental work should not surprise
> people. I appreciate that isn't ideal but it is the way it is.

Sure; I'd expect a change for the better ... besides all the work done
in meta-oe lead it to a proper and good implementation (having it
being split and drop the contamination of images we had first
implementation). Having it as a distro feature is a good option too
but all package split, logic and implementation of rest were good and
flexible.

>> > For that reason I'd rather see this done in a different way, for example
>> > blacklisting the problematic systemd dependencies at image generation
>> > time with some kind of stronger BAD_RECOMMENDS code. Yes, this means
>> > there would be some systemd config files lying around but you'd stop the
>> > main bulk of it coming in (and as you said, some small config files
>> > aren't an issue).
>>
>> Check the amount of changes for do_install_append has sent today. This
>> was all not need with the code we had and which works fine. This is
>> just duplicated code all over recipes. Seriously the systemd
>> integration was done in complete wrong way in my POV. It broght up
>> problems we have fixed and do major improvements in meta-oe ... at no
>> profit.
>
> Sorry you feel that way. I'm equally frustrated with the way systemd was
> added to meta-oe and the damage it did to the overall usability of the
> OE ecosystem. I'm trying to take positive actions from that such as
> ensuring we never do something like it again.

Agreed. This was fix when we moved it to meta-oe/meta-systemd.

> As for the integration into the core, I haven't been too involved with
> that and perhaps I should be. The trouble is I alone don't scale and I'm

Agreed. Another problem is I didn't see *any* public discussion how it
would be done *before* the patchsets. The patchset were done and post
as RFC but I'd expect a wider discussion on how it would and should be
done before it.

> trying to ensure we have more people taking on this kind of work. This
> means letting others take it on and learn. There is a requirement from
> the community to ensure people working on improvements like this have
> all the needed data and that is something which I don't think happened
> well here. My point is that I think there have been failings in various
> places and the community needs to take some responsibility too.

Agreed. But bear on mind I complained in mailing list about this in
past (when the systemd patchset were send so it not new I'd prefer it
in another way).

http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/31067/focus=31090

> On the specifics of the do_install_append, you've seen my comments about
> how we're not learning from past mistakes with the way the do_install in
> the class was written. I note Phil also agreed with them, both of us
> remembering some of the horrors we've dealt with in the past (and
> binconfig.bbclass is still around, sadly).

So you prefer same code to copy same type of files all over the recipes?

> One of the goals of OE-Core is to improve quality. I appreciate in this
> case you disagree about the "quality" of those bbappends but I still
> believe that approach will be better in the long term as upstream
> software starts shipping systemd support. Short term its uglier, I
> totally agree. Part of my role in things is to look beyond the short
> term, even if people don't want to hear that.

Quality is relative. For me avoid code duplication is one of quality
aspects I like.

>> I know it is not the better thing to read but I think it is nice when
>> we receive feedback as it allows for rethink of our path of work.
>
> See above as there is some feedback there too ;-)

heh :-)

> I'd also note that its ELC next week and I'll be travelling. Lack of
> response doesn't mean I don't care about this, I do. There are only so
> many hours in the day though and whilst at ELC, I will need to focus
> primarily on that.

Sure; we all have commitments. I'd appreciate if people comment on this as well.

I belive more people that *use* systemd in products or development
should make clear if they expect to be able to build images with
sysv-only and systemd-only support without having to maintain two
distros. For me I even need it for initramfs installers which with
systemd are huge.

Regards,

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


