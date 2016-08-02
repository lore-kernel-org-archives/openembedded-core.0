Return-Path: <seebs@seebs.net>
Received: from mail.plethora.net (mail.plethora.net [184.173.250.112])
	by mail.openembedded.org (Postfix) with ESMTP id 9149F731E5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 06:30:10 +0000 (UTC)
Received: from [10.10.10.132] (home.seebs.net [74.122.98.108])
	by mail.plethora.net (Postfix) with ESMTPSA id 2DCBBC495D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 01:30:11 -0500 (CDT)
From: Seebs <seebs@seebs.net>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Tue, 02 Aug 2016 01:30:10 -0500
Message-ID: <E145B74B-3968-45C3-A0B0-D557C76ADC38@seebs.net>
In-Reply-To: <57A03888.1@windriver.com>
References: <577B8AA9.5040808@windriver.com>
	<dc216358-8a1f-1490-2fc0-db22f98741c3@windriver.com>
	<579B07F9.9000708@windriver.com>
	<B3108E03-1852-4237-8320-E2BFEC66F9B3@seebs.net>
	<579EE4BB.6070709@windriver.com>
	<F5BAFB71-1FCC-4F9D-999C-5960E8CD7213@seebs.net>
	<579F0EE8.3080009@windriver.com>
	<39329191-8DC4-43B6-9B38-5AD173C8F0DC@seebs.net>
	<1470081674.9142.108.camel@linuxfoundation.org>
	<BDA8434F-AE7B-4D8D-B6C3-2D4ED599E9E8@seebs.net>
	<1470092106.9142.113.camel@linuxfoundation.org>
	<579FFCEB.6090200@windriver.com>
	<47AE4E78-D57B-44C1-B5D5-4509B15AD3BC@seebs.net>
	<57A03888.1@windriver.com>
MIME-Version: 1.0
X-Mailer: MailMate (1.9.4r5234)
Subject: Re: About pseudo's chmod
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
X-List-Received-Date: Tue, 02 Aug 2016 06:30:10 -0000
Content-Type: text/plain; format=flowed

On 2 Aug 2016, at 1:07, Robert Yang wrote:

> Currently, the problem in oe-core is:
>
>       1) bitbake gzip
>       2) Edit rpm-native or package.bbclass to make do_package re-run.
>       3) bitbake gzip
>       After the first build, build/version.c in gzip-dbg is 0444, but 
> after
>       the second build, it will be 0644, this is because do_package 
> does:
>       $ ln ${B}/version.c gzip-dbg/version.c,
>       $ chmod 0444 gzip-dbg/version.c (it runs chmod 0644 on the real 
> filesystem)
>       And in the second build, the gzip-dbg/version.c will be removed 
> and
>       created again, so that stat() can't get 0444 but 0644 since
>       ${B}/version.c is not tracked by pseudo.

Hmm. I'm a bit confused by this. Wouldn't the second build also do a
"chmod 0444" on gzip-dbg/version.c? Why is it doing that chmod the first
time and not the second? If it does it the second time, the fact that
the underlying file's mode changed won't matter.

But in this case... While I'm fine with modifying things to track the
file linked-to, it still feels like this is a usage error. 
Fundamentally,
we're unpacking a file (${B}/version.c), then linking to it, changing
the link in some way, deleting the link, and expecting the original file
to be unchanged. That doesn't seem right to me.

-s

