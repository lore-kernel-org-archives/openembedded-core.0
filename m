Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 006D770E41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 07:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7L7osZm024907; Thu, 21 Aug 2014 08:50:54 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jMmUcmEE711y; Thu, 21 Aug 2014 08:50:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7L7oogT024903
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 21 Aug 2014 08:50:51 +0100
Message-ID: <1408607451.1669.109.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mario Domenech Goulart <mario@ossystems.com.br>
Date: Thu, 21 Aug 2014 08:50:51 +0100
In-Reply-To: <1408047639-18852-1-git-send-email-mario@ossystems.com.br>
References: <1408047639-18852-1-git-send-email-mario@ossystems.com.br>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libxml2: explicitly disable zlib for native builds
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
X-List-Received-Date: Thu, 21 Aug 2014 07:51:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-08-14 at 17:20 -0300, Mario Domenech Goulart wrote:
> Without this change, meta-openembedded's php recipe (as of 45e62fb8 --
> "php 5.4.14: use pkg-config for libxml2 detection") breaks with this
> error on my system:
> 
>    tmp/sysroots/x86_64-linux/usr/lib/libxml2.so: undefined reference
>    to `gzopen64@ZLIB_1.2.3.3'
> 
> It seems that the host's zlib is leaking into libxml2's build.

It turns out we need a zlib dependency here, else createrepo fails to
deal with the compressed index files in the rpm repos. With rpm enabled,
you can reproduce with:

"bitbake package-index"

Unfortunately this error causes a cascade of other problems and caused
several people hours of work trying to figure out why the autobuilder
was "exploding".

Basically, the error above triggers a binary character to be emitted
into the logs. The error reporting tool chokes on this since JSON can't
handle the character causing an exception deep in the event handling
code.

That exception is badly handled and causes bitbake to enter an infinite
loop, spewing traceback data to the console. That in turn creates
gigabytes of log files and the autobuilder falls over.

So if anyone wonders why we haven't had patches merging, this is why.
We're now quite behind with the queue.

Obviously there are fixes to make in multiple parts of the system to
stop this kind of error escalating so badly again.

Cheers,

Richard


