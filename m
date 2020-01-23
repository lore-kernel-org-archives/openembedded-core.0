Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 252A27FDA3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 13:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 1D8EC9C0292
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 08:14:29 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032) with ESMTP id bYCa8CENyrnj
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 08:14:28 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 82A219C0293
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 08:14:28 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id wpyVxu5Azgsf
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 08:14:28 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 61AD29C0292
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 08:14:28 -0500 (EST)
Date: Thu, 23 Jan 2020 08:14:28 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <670208445.2165783.1579785268358.JavaMail.zimbra@savoirfairelinux.com>
MIME-Version: 1.0
X-Mailer: Zimbra 8.8.11_GA_3737 (ZimbraWebClient - GC79 (Linux)/8.8.11_GA_3737)
Thread-Index: mgwTfBZwYXT1kvzLZVC7tH+oZ/2oPA==
Thread-Topic: Connectivity check uris
Subject: Connectivity check uris
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
X-List-Received-Date: Thu, 23 Jan 2020 13:14:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi folks,

I have noticed some hang-ups at the beginning of my builds on the master branch.
I have search a little and discovered that the connectivity check made by poky
was the root cause. In fact connectivity check use the CONNECTIVITY_CHECK_URIS
variable which is by default set to "https://www.example.com/".

So I have made some tests with a little script which gets the URI 100 times:

	$ cat connectivity_check.sh
	#!/bin/sh
	connectivity_check()
	{
		local ok=0
		for i in $(seq 100)
		do
			$@ > /dev/null && ok=$(($ok + 1))
		done
		echo $ok $@
	}
	connectivity_check wget -qO- --timeout=1 --tries=1 $1
	connectivity_check curl -s --connect-timeout 1 $1

Note that in the script, I use wget and curl to see if there are any differences
but I don't think that's a thing.

Here are the results:
	$ time ./connectivity_check.sh https://example.com
	45 wget -qO- --timeout=1 --tries=1 https://example.com
	45 curl -s --connect-timeout 1 https://example.com

	real	2m23.595s
	user	0m3.352s
	sys	0m1.834s

	$ time ./connectivity_check.sh https://openembedded.org
	100 wget -qO- --timeout=1 --tries=1 https://openembedded.org
	100 curl -s --connect-timeout 1 https://openembedded.org

	real	4m36.188s
	user	0m3.853s
	sys	0m1.761s

	$ time ./connectivity_check.sh https://google.com
	100 wget -qO- --timeout=1 --tries=1 https://google.com
	100 curl -s --connect-timeout 1 https://google.com

	real	0m36.328s
	user	0m4.265s
	sys	0m2.028s

So "example.com" is clearly not a good domain to do connectivity checks.

The "openembedded.org" domain is good but have a slow response time.

And finally "google.com" which have all sort of speedy networking stuff is very
efficient.

---

I think the CONNECTIVITY_CHECK_URIS variable must be updated and not use the
"example.com" domain anymore. Using "google.com" may be the best option. But
eetting up a custom domain like "connectivitycheck.openembedded.org" could be
another idea.

Any ideas ?

Jean-Marie LEMETAYER
Passionate embedded systems engineer
Savoir-faire Linux

