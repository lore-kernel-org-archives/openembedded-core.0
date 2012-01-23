Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RpSXp-0004G8-Dg
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 23:39:21 +0100
Received: by qadz30 with SMTP id z30so691646qad.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2012 14:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=9enedqGsjDMt1EJfKGniiuZBo6m8s4yRyQ14pG9oKk8=;
	b=RP8kW38D/odHNDCzgFChKr4l932g/Tp0NOkQQP7/YcppsKsn7BPxhVZ2M2C6V6tySF
	71CYxayVgwJhsEfrGR7eP2Oj5Qic6eJ5iNi+LD/0Rxo5WT+SRvhFnCe4QQv9Yt4pKlz4
	X/p/c98ocVyL1AGeMbXz0mLsaqMRot7tLucAs=
Received: by 10.224.97.135 with SMTP id l7mr11942818qan.54.1327357896295; Mon,
	23 Jan 2012 14:31:36 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.235.211 with HTTP; Mon, 23 Jan 2012 14:31:15 -0800 (PST)
In-Reply-To: <4F1DDB53.2030502@mlbassoc.com>
References: <4F1DDB53.2030502@mlbassoc.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 23 Jan 2012 15:31:15 -0700
X-Google-Sender-Auth: 4RXFGmv8filWNSUdg6ooqtgHZ4w
Message-ID: <CABcZANkBdYXvR5Z3FG2RAGiEjSDuo5gM1xvyOOj8k1rKrPfYXg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: bitbake.lock?
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
X-List-Received-Date: Mon, 23 Jan 2012 22:39:21 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 23, 2012 at 3:12 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> I've noticed that recent versions of bitbake leave this file
> in the build directory.
>
> What is it for & why is it left around?

It's used to ensure only one bitbake runs against a given build
directory at a time. I'm not sure why it's left around, it seems like
some of the ways in which bitbake exits don't result in a cleanup. I'm
sure Richard would know for sure.

Just as an FYI, it does check the pid stored there against the running
processes, so if it errors out indicating there's a second bitbake
running, there really is, even if you don't know it. Could have a
remnant process from a previous build, depending on how it exited,
I've noticed. Particularly hitting the parse error hang issue can
result in remnant processes hanging around monopolizing the build dir.
kill is our friend in those cases. I just wanted to note this to
ensure that no one physically removes the .lock when encountering the
error.
-- 
Christopher Larson


