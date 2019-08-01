Return-Path: <seebs@seebs.net>
X-Greylist: delayed 311 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 01 Aug 2019 16:22:13 UTC
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 8BCD07F4F4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 16:22:13 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 4D4B62E890F;
	Thu,  1 Aug 2019 11:17:03 -0500 (CDT)
Date: Thu, 1 Aug 2019 11:17:01 -0500
From: Seebs <seebs@seebs.net>
To: Max Kellermann <max+openembedded@blarg.de>
Message-ID: <20190801111701.367588b2@seebsdell>
In-Reply-To: <20190801160206.24078-1-max+openembedded@blarg.de>
References: <20190801160206.24078-1-max+openembedded@blarg.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH pseudo] ports/linux: wrap faccessat()
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
X-List-Received-Date: Thu, 01 Aug 2019 16:22:14 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  1 Aug 2019 18:02:06 +0200
Max Kellermann <max+openembedded@blarg.de> wrote:

> + * wrap_access(int dirfd, const char *path, int mode, int flags) {

This should probably say "faccessat". I know it's just a comment, but
I try to be consistent about these.

> +	rc = real___fxstatat64(_STAT_VER, dirfd, path, &buf, AT_SYMLINK_NOFOLLOW);

We should probably be using flags here, not AT_SYMLINK_NOFOLLOW.
Or possibly (flags & AT_SYMLINK_NOFOLLOW). Otherwise, we'll get the wrong
results if called with flags not including AT_SYMLINK_NOFOLLOW.

-s

