Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 114687C446
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 23:57:26 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id D0E6D2E892B;
	Thu,  1 Aug 2019 18:57:27 -0500 (CDT)
Date: Thu, 1 Aug 2019 18:57:25 -0500
From: Seebs <seebs@seebs.net>
To: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <20190801185725.139cfa73@seebsdell>
In-Reply-To: <8934e4e0-aaf6-5eb6-5d1b-355063bee94a@windriver.com>
References: <20190801200354.119252-1-jason.wessel@windriver.com>
	<8934e4e0-aaf6-5eb6-5d1b-355063bee94a@windriver.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] pseudo: Upgrade to latest to fix openat() with a directory symlink [NAK]
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
X-List-Received-Date: Thu, 01 Aug 2019 23:57:27 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 1 Aug 2019 16:37:26 -0500
Jason Wessel <jason.wessel@windriver.com> wrote:

> It seems to have caused really odd problems with the oe link
> management that were not there previously, such as:
> 
> 
> WARNING: pinentry-1.1.0-r0 do_package_qa: QA Issue:
> pinentry: /usr/bin/pinentry is owned by uid 5002, which is the same
> as the user running bitbake. This may be due to host contamination
> [host-user-contaminated]
> 
> I'll continue to look into the problem.

There's a possibility that the right flag is something like
	(flags&O_NOFOLLOW)&&!(flags&O_PATH)

or something like that. There's a handful of references to this in
wrapfuncs.in in ports/unix and ports/linux.

-s

