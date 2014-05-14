Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 54F75660FF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 08:51:52 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4E8plwS013593 for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 09:51:47 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id d7l1QfMzAs52
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 09:51:47 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4E8phIS013588
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 09:51:45 +0100
Message-ID: <1400057497.31891.233.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 14 May 2014 09:51:37 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: RFC: Removing binconfig -config files - Request for help
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
X-List-Received-Date: Wed, 14 May 2014 08:51:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Anyone who has looked at what the binconfig class actually does will
realised its pretty gruesome. It applies a long list of replacements
against the -config files in ${S} and ${B} and doesn't even wait for the
software to install them. This is dated and there is a much better
alternative, pkg-config.

We added pkg-config to those pieces of software that were missing them a
while ago. Now, I believe the time has come to stop installing some of
the -config files. Once this was a huge challenge but there aren't that
many left.

My proposal is that we add some new function to utils.bbclass which we
can call and which creates a "dead" -config script which simply prints
and error and then "exit 1".

We'd then one by one stop classes inheriting the binconfig class and
replace them with calls to this function. I filed an enhancement in the
Yocto bugzilla for this:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=6320

There is also a patch attached there which starts some of this work.
Specifically:

* Converts several gnupg related m4 files to use pkg-config instead of 
  the -config scripts and make sure the pkgconfig files have the right
  data in them.
* Fix libarchive to use pkg-config for libxml-2.0
* Fix lighthttp to use pkg-config for pcre
* Fix libxslt to use pkg-config for libxml-2.0

I did post on the gnupg mailing list asking whether they could switch 
to pkg-config. There is history in the archives to suggest they 
won't, based on bad reasoning but asking again doesn't hurt. No reply
as yet. This is probably the biggest chunk of users we have left.

Potential issues I'm aware of:

* apr-1-config/apu-1-config for subversion/apache
* curl-config for python-pycurl
* cups-config for cups itself

What I don't know at this point is how much of meta-oe uses the -config
files. There are a few other files in crossscripts such as guile-config,
some tcl pieces and so on, I was planning just to leave those alone.

We have here and in that patch a pretty good set of examples on how to
proceed with this, I'm hoping someone who fancies a bit of a challenge
may pick this up and help. The next steps probably need to be:

* A world build of OE-Core before and after this patch set with 
  buildhistory, see if anything changes
* Clean up and submit the patches in the existing large patch to OE-Core
* Iterate one by one through the OE-Core recipes inheriting binconfig, 
  checking meta-oe for recipes depending on that one and check they use 
  pkg-config and not the -config script
* Write the utils.bbclass helper function
* Convert recipes to stop inheriting binconfig and instead neuter the 
  -config files.
* Investigate the remaining four -config files above. I suspect the 
  apache projects aren't going to switch but we can ask. It may well be 
  worth leaving those alone. Investigate curl/cups further.

This probably isn't something we'll solve tomorrow but I think the time
is right to have a plan in place and to start to execute on it.

Any thoughts/comments/concerns?

Cheers,

Richard



