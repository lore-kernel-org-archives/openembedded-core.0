Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 6F867605BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 15:53:32 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 8CB3D2E8928;
	Tue, 27 Mar 2018 10:53:33 -0500 (CDT)
Date: Tue, 27 Mar 2018 10:53:31 -0500
From: Seebs <seebs@seebs.net>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20180327105331.17fc7d86@seebsdell>
In-Reply-To: <20180327154802.14611-1-ross.burton@intel.com>
References: <20180327154802.14611-1-ross.burton@intel.com>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][RFC] pseudo: intercept syscall() and return ENOTSUP for renameat2
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
X-List-Received-Date: Tue, 27 Mar 2018 15:53:32 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Mar 2018 16:48:02 +0100
Ross Burton <ross.burton@intel.com> wrote:

> This patch intercepts syscall() and returns ENOTSUP if renameat2() is
> being called.

I am inclined to NAK this until we have a clearer understanding of the
mechanics observed in glibc's syscall implementation; it's doing magic
that this will not do, and will in fact undo, and we don't know *why*
it does that magic. It seems dangerous to break a thing without first
knowing why it was there in the first place.

If we want to wrap this, at a bare minimum, we should be using a
custom wrapper which doesn't use any of the standard wrapper magic. At
that point, we can *probably* pass args along and just return
immediately after the real_syscall call and get usable results? (And
bail prematurely if it's a call we need to prevent.)

-s

