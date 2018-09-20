Return-Path: <max@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id 2963977AAE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 14:22:14 +0000 (UTC)
Received: by swift.blarg.de (Postfix, from userid 500)
	id BEE4822050E; Thu, 20 Sep 2018 16:22:15 +0200 (CEST)
Date: Thu, 20 Sep 2018 16:22:15 +0200
From: Max Kellermann <max+openembedded@blarg.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20180920142215.ttn5crsztorrrgt6@swift.blarg.de>
Mail-Followup-To: Alexander Kanavin <alex.kanavin@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <20180920131623.22048-1-max+openembedded@blarg.de>
	<CANNYZj85wzWZ4oRTzfV7wqDuXQtGO+LFVJJheXSvinn7aAkX5Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj85wzWZ4oRTzfV7wqDuXQtGO+LFVJJheXSvinn7aAkX5Q@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] openssh: make OpenSSL optional
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
X-List-Received-Date: Thu, 20 Sep 2018 14:22:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2018/09/20 16:11, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> I don't object to the patch (except it would need to be rebased on top
> of the openssl 1.1 patch), but I would like to know a bit more.

Ok, I'll do that once that one is merged.

> What is ed25519? Can a client that supports only that connect to most
> or all servers? Can a server that supports only that accept
> connections from most or all clients? Are any features lost?

It is a newer public key type, supported since OpenSSH 6.5
(https://www.openssh.com/txt/release-6.5).  The crypto math behind it
was designed by Daniel Bernstein (https://ed25519.cr.yp.to/).

Usually, OpenSSH uses OpenSSL for some of its crypto, but it can use
ed25519 natively without OpenSSL.  This means you can eliminate
OpenSSL completely in some images, without having to omit OpenSSH as
well.

The downside is that a binary compiled without OpenSSL understands
only ed25519 keys, and nothing else.  That means the server will only
be able to accept ed25519 public keys, but no RSA/DSA.  That's ok for
some people who will only use ed25519 anyway (like me).  For others,
it might be a good reason to switch to ed25519 (which is allegedly
more secure than RSA).

Max

