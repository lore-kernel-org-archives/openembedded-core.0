Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6C9737318F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7O7IlHm028292; Wed, 24 Aug 2016 08:18:47 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CXdHxeIeWQE0; Wed, 24 Aug 2016 08:18:47 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7O7Ij67028288
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 24 Aug 2016 08:18:46 +0100
Message-ID: <1472023124.16712.127.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>, Peter Kjellerstedt
	<peter.kjellerstedt@axis.com>, Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 24 Aug 2016 08:18:44 +0100
In-Reply-To: <57BD403E.3080305@topic.nl>
References: <0bf5343047414781867c8fc56c68ccba@XBOX02.axis.com>
	<1471966349.16712.106.camel@linuxfoundation.org>
	<57BD403E.3080305@topic.nl>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: inherit allarch and use RDEPENDS
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
X-List-Received-Date: Wed, 24 Aug 2016 07:18:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-08-24 at 08:35 +0200, Mike Looijmans wrote:
> First time I've heard about this limitation, I don't understand 
> what's this about either. I've been telling people to put their arch 
> or machine specific code into a seperate package and RDEPEND on it 
> from an allarch package that holds the Python code that calls into
> that.
> 
> We haven't seen any problems with that.
> 
> So what is the bad thing that would happen if we don't set the 
> SIGGEN_EXCLUDE... variables in the layer.conf file?

If you have an allarch recipe X and you depend on a tune or machine
specific package from it, what you'll see is that when you switch
MACHINE (with a different tune), the recipe X will rebuild each time.
This is obviously suboptimal however its not the end of the world. It
is problematic if you're using PR server.

The reason it rebuilds is that its checksum has a dependency on
something which is tune or machine specific, you change MACHINE, the
checksum changes and the allarch recipe's checksum changes.

If we remove the dependency from the task checksum, the problem isn't
there and it doesn't rebuild, however there are some circumstances
where this could be an issue, e.g. if a dependency name was renamed by
debian.bbclass for example.

The mechanism for removing such a dependency is the one I've mentioned
in layer.conf.

You can see if you have a problem with your layers by running:

oe-selftest -r sstatetests.SStateTests.test_sstate_allarch_samesigs

Does that make the issue any clearer?

Related bugs:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=7298
https://bugzilla.yoctoproject.org/show_bug.cgi?id=8078
https://bugzilla.yoctoproject.org/show_bug.cgi?id=7724

Cheers,

Richard



