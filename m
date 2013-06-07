Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id D3EF7601AF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 10:47:52 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57AquUN013888 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 11:52:56 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VbEhUVYkk-hD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 11:52:56 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57Aqp3b013883
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 11:52:52 +0100
Message-ID: <1370602058.6864.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 07 Jun 2013 11:47:38 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: OE-Core and Bitbake wrapper changes (min 2.7.3 python version)
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
X-List-Received-Date: Fri, 07 Jun 2013 10:47:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Its not secret that I hate the current bitbake wrapper script and want
to remove it for 101 different reasons.

I now have code which removes the need for the double execution of
bitbake which was the only fundamental reason we had it. The question
therefore remains, what to do with the other pieces of the wrapper,
specifically the tar and git versions checks.

As a reminder for those who don't remember the problem here, the git
version is checked since we use certain parameters in the git fetcher
which need certain versions of git and git is in ASSUME_PROVIDED these
days. Its possible to trigger git operations at part time to resolve
revisions. tar is even more ugly since the wrong version has issues
extracting sstate archives. These issues mean injecting building them
into the dependency chain at the right point is hard.

Personally, I think we carry around a bit too much legacy these days and
its starting to hurt us. I would therefore like to propose that we take
this opportunity to do some spring cleaning and simply error on:

* broken tar versions
* too old versions of git
* python < 2.7.3

The python version check would move to the oe-init-build-env script, the
git/tar versions to sanity.bbclass.

The recommendation for anyone with these older versions would be to
install our standalone tools tarball which would have python 2.7.3 and
working versions of tar/git.

The reason for the python version change is so we can embrace the
unittest improvements in 2.7 and drop all of the workarounds for pre
2.7.3 bugs in bitbake. This starts to move us towards python 3, if this
tarball works well, we'd use the same approach to move to python 3.

Any objections?

Cheers,

Richard




