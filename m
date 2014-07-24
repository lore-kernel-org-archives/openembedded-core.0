Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7D2A27054E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 12:07:54 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6OC6afb006063; Thu, 24 Jul 2014 13:06:36 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GvWKZLZcc3jl; Thu, 24 Jul 2014 13:06:35 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6OC6V7f006040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 24 Jul 2014 13:06:33 +0100
Message-ID: <1406203585.27697.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 24 Jul 2014 13:06:25 +0100
In-Reply-To: <alpine.LFD.2.11.1407240709110.8468@localhost>
References: <alpine.LFD.2.11.1407240709110.8468@localhost>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: simple dependency question
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
X-List-Received-Date: Thu, 24 Jul 2014 12:08:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-07-24 at 07:13 -0400, Robert P. J. Day wrote:
>   i realize that "DEPENDS" represents build-time dependencies, as in
> ... all of the DEPENDS recipes must build *completely* before this
> recipe can *begin* to build, is that correct?
> 
>   however, in something like module.bbclass where one finds:
> 
> do_make_scripts[deptask] = "do_populate_sysroot"
> 
> does that now *override* the normal build-time dependency to say only
> that this recipe's do_make_scripts task need only wait until all of
> the "DEPENDS" recipes have completed their do_populate_sysroot tasks?

The original DEPENDS meaning remains unchanged and applies to the
configure task. The behaviour of DEPENDS comes from:

do_configure[deptask] = "do_populate_sysroot"

which means the configure task waits for all the populate_sysroot tasks
of DEPENDS to complete before executing this task.

do_make_scripts[deptask] = "do_populate_sysroot"

Adds constraints to the make_scripts task where it also must wait until
all DEPENDS populate_sysroot have run before it can.

>   in other words, the instant i define an inter-task dependency, does
> that relax the normal strong build dependency? since, if it didn't,
> this wouldn't make any sense.

and hence no, it doesn't relax other rules.

Cheers,

Richard


