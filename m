Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C12777632E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 12:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6RCGmZ9019242; Mon, 27 Jul 2015 13:16:58 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uslf-N0_Ccdf; Mon, 27 Jul 2015 13:16:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6RCGklU019169
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 27 Jul 2015 13:16:57 +0100
Message-ID: <1437999406.821.240.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <kergoth@gmail.com>
Date: Mon, 27 Jul 2015 13:16:46 +0100
In-Reply-To: <CABcZANnnqTczLS4B=663mrPOG7i3WoKXdkPONu0wScxgHdSMGw@mail.gmail.com>
References: <cover.1437663603.git.chris_larson@mentor.com>
	<1437840549.821.171.camel@linuxfoundation.org>
	<CABcZANnnqTczLS4B=663mrPOG7i3WoKXdkPONu0wScxgHdSMGw@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 0/6] recipetool/devtool/oe-selftest: pull from BBPATH
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
X-List-Received-Date: Mon, 27 Jul 2015 12:17:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2015-07-25 at 12:18 -0700, Christopher Larson wrote:
> 
> On Sat, Jul 25, 2015 at 9:09 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>         however when I apply this and your other series, the
>         autobuilder
>         oe-selftest does this:
>         
>         https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/92/steps/Running%20oe-selftest/logs/stdio
>         
>         which is substantially worse. I can't immediately see what the
>         issue is
>         but the two runs above pretty much bisect this down to the
>         patch series.
>         I'm therefore reluctant to merge these until we can figure out
>         what is
>         going on...
> 
> Given that both failures have nothing to do with devtool, recipetool,
> or oe-selftest and are simply bitbake build failures as called by
> tests, I don’t really see how these could have anything to do with
> that, but understood.

FWIW, the issue is that you use the "xxx:do_unpack" syntax in one of the
tests. This breaks toaster.bbclass and once its broken, it stays broken
as its doing a split(":") on data in a file it never cleans up if the
function fails.

I've taken a fix which should avoid these issues. Will rerun a build
with that applied (and various other fixes) and hopefully we can then
get things merged.

Cheers,

Richard





