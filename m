Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0465179BC9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 10:43:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44LMcF2wH4z7G;
	Fri, 15 Mar 2019 11:43:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1552646590;
	bh=js0DokW5/feqXWorDYnKIGl8Eq0wv0PVdMNuxBxpN4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RqBPL0A9L9ZkZAYrbbG1RWVwxj7YaMW0nNoQT270DjTwcHQSOhNvSirw/xMedvKy8
	YpbVl06UmFwfHwbMVQgrQ4fSOkm6pVhjwVbu3djT6tLFedWLyG7j69gwIrUes4fAm/
	RlrMqTQiNwO1uCO3Ucr5Y4B8LKREwr96AqqrLM/nVHqO82C9eINgNJR00RAJruqUZV
	mUe2M6v6gSjBxxZ5XfVeI3ZhHihFtvNBAg72Iz1yzj5DpH+7kkUsfqer5UeuSzEZQL
	Mf+98OrOYr4vv4mICeKH+Uvyms110CsK2TdnjFH5JyFfQxLtfAMsFTdL+7THTEXTUD
	Z10H6tgSjROJ6bLd0SQsLqVkM8K2g0K1RvFtHikYM44g2ETi70YIK4UqbZJHWfmZMY
	6cFvMaAlMHVegjMweXrGKzO9Xd4vuE5WSADWGV8/fkIUm7jR0I+Q8ajUv6kar5NlWS
	PlDDjymn9atYmShX6X4Ou+vdTsQ4Ja+C63wVKpaRrhEfIZ6VQvVLQIEo0hGwzii1xu
	h8IBGvBKE7/dCsxxRX6E1Hi1Zm8RgzQLc84kFmQUXB+dM8QD4lO7iK5MUrdggVS9YA
	yVMkAAz4aQ6le0KQ5/0rMbFd6MmS/VcmWAybHnm4wxoImOsSqaJJsUfhYWQE4OXDRs
	wrgpqPVJhGVPKGce0ta8G45A=
Date: Fri, 15 Mar 2019 12:43:06 +0200
From: Adrian Bunk <bunk@stusta.de>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20190315104306.GA14180@localhost>
References: <20190314191924.44162-1-joe.slater@windriver.com>
	<CAJTo0LafGyAEuh8hbQoXNQCR5bJ9YBmMDJV-idGZ0OPMkTGQoQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LafGyAEuh8hbQoXNQCR5bJ9YBmMDJV-idGZ0OPMkTGQoQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] puzzles: fix uninitialized variable compiler error
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
X-List-Received-Date: Fri, 15 Mar 2019 10:43:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 14, 2019 at 07:25:16PM +0000, Burton, Ross wrote:
> Can we *please* start sending these upstream.  It's not like the
> maintainer isn't responsive.

This would also help to get such patches properly reviewed.

> Ross
> 
> On Thu, 14 Mar 2019 at 19:20, Joe Slater <joe.slater@windriver.com> wrote:
>...
> > +The compiler does not realize that we must go through the while()
> > +loop at least once, so we replace it with a for() loop.
>...
> > +-    n = t->root;
> > +-    while (n) {
> > ++    /*
> > ++     * We know t->root is not NULL.  The logic
> > ++     * to break out of this is at the end of the loop.
> > ++     */
> > ++    for (n = t->root;;) {
>...

This is the second patch this week where I don't see why a "fix" should 
make any difference.

The code immediately above is:

 if (t->root == NULL) {
         ...
         return orig_e;
 )

The submitter did not provide information how to reproduce,
but when I try to reproduce the problem on amd64 it happens
only with -Og (due to puzzles upstream building with -Werror).

This would also explain why such patches suddenly start getting 
submitted - 2 weeks ago DEBUG_OPTIMIZATION was changed from -O to -Og.

-Werror is added after the passed CFLAGS so adding -Wno-error globally
would not help here, but a non-upstreamable patch to remove the -Werror
looks more correct here as a short-term workaround.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


