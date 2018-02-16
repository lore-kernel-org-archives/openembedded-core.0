Return-Path: <seebs@seebs.net>
X-Greylist: delayed 359 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 16 Feb 2018 17:57:47 UTC
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 8878477D16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 17:57:47 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id F222D2E8958;
	Fri, 16 Feb 2018 11:51:49 -0600 (CST)
Date: Fri, 16 Feb 2018 11:51:47 -0600
From: Seebs <seebs@seebs.net>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20180216115147.2869fdf2@seebsdell>
In-Reply-To: <CA+chaQeEdY8tjp4PMsMCfZNoi2NwGqZoOcOqme9Ju-Ext6FkaQ@mail.gmail.com>
References: <20180216095628.15414-1-alexander.kanavin@linux.intel.com>
	<CA+chaQeEdY8tjp4PMsMCfZNoi2NwGqZoOcOqme9Ju-Ext6FkaQ@mail.gmail.com>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: update to latest master
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
X-List-Received-Date: Fri, 16 Feb 2018 17:57:47 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 16 Feb 2018 17:55:54 +0100
Martin Jansa <martin.jansa@gmail.com> wrote:

> $ grep -c "tried to close client 0 (highest is 1)"
> update-rc.d/0.7-r5/pseudo/pseudo.log
> 579655922
> 
> All pseudo processes I've seen on various servers which were building
> with this change included got stuck until disk space run out..

Oh-hoh! That could be the epoll thing that I wasn't able to reproduce.

> commit 26e30fa2e1a0fe4e885d7eea3f55d23cd2c3158f
> Author: Seebs <seebs@seebs.net>
> Date:   Fri Feb 16 11:49:49 2018 -0600
>
>     Allow closing client 0

Added a thing to master. It looks like the failure mode is that a
client ended up on fd 0, and for some reason, back in 2010, I thought
that would be invalid and did not allow it. So change is to replace "<=
0" with "< 0".

-s

