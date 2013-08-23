Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9EE776B918
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 15:29:44 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7NFferk022669; Fri, 23 Aug 2013 16:41:40 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sL7z4C2-j4QU; Fri, 23 Aug 2013 16:41:40 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7NFfZ9r022665
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 23 Aug 2013 16:41:36 +0100
Message-ID: <1377271768.6762.96.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 23 Aug 2013 16:29:28 +0100
In-Reply-To: <CAP9ODKrtNQt7XeaXbOSTqGWFnna9soB+KRE6UAumoFGVTzr-Mg@mail.gmail.com>
References: <1377269339-6139-1-git-send-email-otavio@ossystems.com.br>
	<1377269339-6139-2-git-send-email-otavio@ossystems.com.br>
	<1377269956.6762.92.camel@ted>
	<CAP9ODKrtNQt7XeaXbOSTqGWFnna9soB+KRE6UAumoFGVTzr-Mg@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Christopher Larson <clarson@kergoth.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH v5 1/2] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Aug 2013 15:29:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-08-23 at 12:11 -0300, Otavio Salvador wrote:
> On Fri, Aug 23, 2013 at 11:59 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2013-08-23 at 11:48 -0300, Otavio Salvador wrote:
> >> This allow the addition and removal of distro features easily. To add
> >> a feature, use:
> >>
> >>  EXTRA_DISTRO_FEATURES += "wayland"
> >>
> >> and to remove, use '~' prefix, as:
> >>
> >>  EXTRA_DISTRO_FEATURES += "~x11"
> >>
> >> This code has been mostly copied from Mentor Graphics public layer but
> >> changed the variable name for a more descriptive name. The original
> >> code can be seen at user_feature.bbclass at:
> >>
> >>  http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor
> >>
> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >
> > I discussed this with Otavio. My personal view is that we should hold
> > off this right now. The removal issues he ran into with poky have been
> > addressed in other ways so there is less of an immediate issue.
> >
> > The better fix for this kind of problem is -=/=- or more likely _remove
> > override support in bitbake. I did propose a _remove patch a while back
> > but Chris has some valid concerns about it, I don't remember the details
> > offhand. I'd much rather we focused on fixing that and getting that
> > merged than trying to add this functionality to every variable.
> 
> Chris, do you know the problems Richard's patch has? I can take a look
> and try to fix it so we can get this in for 1.5.

http://lists.openembedded.org/pipermail/bitbake-devel/2013-March/003319.html

We don't want to rush into adding type support to bitbake, that is
something which needs a lot of thought. It might be good enough to have
_remove assume space delimited for now and we can then have the type
flag alter the behaviour later.

So the thing that needs fixing is the naive str.replace() :)

(x.startswith(y) or x.endswith(y) or " " + y + " " in x) kind of thing.

Cheers,

Richard



