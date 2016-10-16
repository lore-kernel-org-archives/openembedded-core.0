Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5D46771A27
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Oct 2016 12:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u9GCx67B013886 for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Oct 2016 13:59:06 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id g0UCQlJqH6mk
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Oct 2016 13:59:06 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u9GCx4iV013883
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Oct 2016 13:59:05 +0100
Message-ID: <1476622744.3357.12.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 16 Oct 2016 13:59:04 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: uninative, older distros and libstdc++ [2.2 uninative issue]
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
X-List-Received-Date: Sun, 16 Oct 2016 12:59:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We've had a lot of success with uninative but in the 2.2-rc2 build
which I ran last night on two different autobuilders, we saw two
different failures:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=10441

On a system compiling source-highlight-native with gcc 4.9 where boost-
native was built on a gcc 5 system, we see one error. On a system
compiling source-highlight-native with gcc 4.8 where boost-native was
built on a gcc 4.9 system, we see a different error.

The trouble is that libboost_regex.so in these cases wants the newer
libstdc++ but at link time of executable, it can only see the host
system and hence can't see newer symbols like
std::runtime_error::runtime_error(char const*) or
std::__throw_out_of_range_fmt(char const*, ...).

I have done a lot of experimentation and the only way I can see of
possibly making this work is to add -Wl,--unresolved-symbols=ignore-in-
shared-libs to BUILD_LDFLAGS for source-highlight *and* ensure any
native binaries get tweaked to use our own uninative loader before
they're run. The former is horrible and the latter bit is hard.

Another option would be to have multiple uninative feeds based on gcc
version rather than a single uninative one.

This close to release, I'm reluctant to poke this too much. We don't
have many components that using C++, source-highlight is a
comparatively new one which isn't in our default configuration for now.
I'm therefore tempted to release note and look at this in 2.3.

Opinions? Other ideas?

Cheers,

Richard



