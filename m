Return-Path: <seebs@seebs.net>
Received: from mail.plethora.net (mail.plethora.net [184.173.250.112])
	by mail.openembedded.org (Postfix) with ESMTP id AB830607B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 13:25:31 +0000 (UTC)
Received: from [10.10.10.132] (home.seebs.net [74.122.98.108])
	by mail.plethora.net (Postfix) with ESMTPSA id 2F7F1C4993;
	Wed, 28 Sep 2016 08:25:32 -0500 (CDT)
From: Seebs <seebs@seebs.net>
To: "Robert Yang" <liezhi.yang@windriver.com>
Date: Wed, 28 Sep 2016 08:25:31 -0500
Message-ID: <CB05DC3E-85D6-4866-9EA0-7341AC8C5FEC@seebs.net>
In-Reply-To: <cover.1475043600.git.liezhi.yang@windriver.com>
References: <cover.1475043600.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
X-Mailer: MailMate (1.9.5r5263)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] pseudo: add prefix for log and make log consistent
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
X-List-Received-Date: Wed, 28 Sep 2016 13:25:31 -0000
Content-Type: text/plain; format=flowed
Content-Transfer-Encoding: quoted-printable

On 28 Sep 2016, at 1:22, Robert Yang wrote:
>
> meta/recipes-devtools/pseudo/files/0001-pseudo_server.c-add-prefix-for-=
log-and-make-log-cons.patch

I don't think this produces desireable behavior in the command-line use =

case; so far as I can tell, this would result in getting no messages at =

all now.

We definitely don't want to unconditionally prepend "pseudo:" to =

absolutely all log messages, that'd be gigabytes of data in a lot of =

cases. Furthermore, pseudo_diag() is sometimes used to produce partial =

lines. So
	pseudo_diag("foo: ");
	pseudo_diag("bar\n");
would now produce
	pseudo: foo: pseudo: bar
which is not desireable. It would make more sense to add the prefix to =

the specific things you're likely to see during startup, of which =

there's only a few.

I think the right answer probably involves distinguishing between cases =

where we're spawning a daemon because a client has requested one, and =

command-line invocation. This can be partially fixed by moving the =

pseudo_debug_logfile() call up, and making it conditional on opt_d, but =

then pseudo should also probably start a daemon directly (without that) =

rather than relying
on the client spawning code when execing something. I can probably fix =

this soonish.

-s

