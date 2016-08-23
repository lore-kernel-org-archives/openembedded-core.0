Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 904E877042
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 15:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7NFWXRG024792; Tue, 23 Aug 2016 16:32:33 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BcyPBvg_jvdc; Tue, 23 Aug 2016 16:32:33 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7NFWT51024788
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 23 Aug 2016 16:32:30 +0100
Message-ID: <1471966349.16712.106.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Martin Jansa
	<martin.jansa@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 23 Aug 2016 16:32:29 +0100
In-Reply-To: <0bf5343047414781867c8fc56c68ccba@XBOX02.axis.com>
References: <0bf5343047414781867c8fc56c68ccba@XBOX02.axis.com>
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
X-List-Received-Date: Tue, 23 Aug 2016 15:32:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-08-23 at 15:15 +0000, Peter Kjellerstedt wrote:
> This is the first I heard about limits to recipes that inherit
> allarch 
> and also use RDEPENDS. So after I read the above, I went and read the
> documentation for the allarch class, which unfortunately did not make
> my understanding much clearer.
> 
> Am I to understand that a recipe that inherits allarch cannot have 
> runtime dependencies on packages that are built differently per 
> architecture or MACHINE? If so, what can it have runtime dependencies
> on? Only other allarch recipes? What are the design limitations 
> behind this and is there anything that could be done to change the
> situation?

It can depend on them, only if you add it to the list of dependencies
in layer.conf, either SIGGEN_EXCLUDERECIPES_ABISAFE or
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS. The implication of that is that if
one of these recipes changes, the dependency will not be rebuilt, so
you have to be careful about things like these packages getting
renamed.

Its basically a choice, we can have allarch packages and accept we
can't always rebuild them through the sstate hash changes, or we don't
have allarch packages at all (or have packages that can't have non
-allarch dependencies).


> As an example, say that I have a recipe that only installs a static 
> script, so inheriting allarch is a natural thing to do. However, for 
> this script to work it must call a binary built by another recipe so 
> it of course RDEPENDS on that other package. Are you saying this is 
> wrong? Because that sounds odd to me as it severely limits the 
> usefulness of the allarch class.

You can do this if and only if you list it in layer.conf.

> Another example would be a recipe that installs a static Perl script.
> Can it not inherit allarch while also have a runtime dependency on
> perl?
> 
> If the above is true, why are there no QA tests or similar that catch
> these kind of problems?

We do have sstate hash tests in oe-selftest which would highlight such
a problem.

There are various open bugs complaining about this situation however
I've yet to come up with a way which solves the problem perfectly, much
as I'd like to.

Cheers,

Richard

