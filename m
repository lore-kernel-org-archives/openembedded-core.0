Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 75CC374D3C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 21:45:06 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id B95002E8922;
	Wed,  4 Apr 2018 16:45:06 -0500 (CDT)
Date: Wed, 4 Apr 2018 16:45:05 -0500
From: Seebs <seebs@seebs.net>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180404164505.00553b97@seebsdell>
In-Reply-To: <39787e20-0d21-00bd-a5bb-73faa52c0839@gmail.com>
References: <20180327154802.14611-1-ross.burton@intel.com>
	<39787e20-0d21-00bd-a5bb-73faa52c0839@gmail.com>
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
X-List-Received-Date: Wed, 04 Apr 2018 21:45:06 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 Apr 2018 14:28:11 -0700
Khem Raj <raj.khem@gmail.com> wrote:

> what is the performance impact of adding another stack frame and
> function call in the chain here. Do we have data ?

Very close to unmeasurable, because *almost nothing ever uses syscall*.

This is used only for the case where someone is explicitly calling
syscall(), not for any other system call use case. And my
implementation (which is not the same as this one) also overrides the
wrapper generation, so there's no standard pseudo wrapper overhead
(which is several times larger and involves mutexes and signal mask
changing), it's just passing the call on unless it's SYS_renameat2.

-s

