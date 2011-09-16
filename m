Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R4Urn-0004vU-FU for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 11:37:51 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8G9cV5X007939; Fri, 16 Sep 2011 10:38:31 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QVg-ySA-V-E2; Fri, 16 Sep 2011 10:38:31 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8G9cQ8U007929
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 16 Sep 2011 10:38:28 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 16 Sep 2011 10:32:14 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316165543.25993.59.camel@ted>
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Multilib status
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Sep 2011 09:37:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Mark/Dongxaio,

We really need to get the remainder of the multilib bugs wrapped up. I
think there is some confusion about the exact approach to take to fix
some of them so I'm hoping to try and summarise the problems here so we
can work out some resolutions.

Problem A
=========

We can have multiple forms of "machine specific" packages now, one for
each multilib e.g.:

task-core-x11-base-1.0-r34.qemux86_64.rpm ("normal")
task-core-x11-base-1.0-r34.qemux86_64.rpm ("lib64")
task-core-x11-base-1.0-r34.qemux86_64.rpm ("lib32")

(lets assume the first uses /lib/, the second /lib64/ and the
thrid /lib32/, an artificial example I realise)

I know one proposal was to map:

task-core-x11-base-1.0-r34.lib32_qemux86_64.rpm to
task-core-x11-base-1.0-r34.lib32_qemux86.rpm but this isn't correct
since the library directories are different. In this specific case it
might not matter but in general it would. What is also important is that
the different versions imply different dependencies. The lib64 bit
version would pull in and select lib64 bit libs. Its these dependencies
which are a key reason these are not "all" arch packages.

The end result is therefore we likely want:

task-core-x11-base-1.0-r34.qemux86_64.rpm
task-core-x11-base-1.0-r34.lib64_qemux86_64.rpm
task-core-x11-base-1.0-r34.lib32_qemux86_64.rpm

and I believe there are some patches Dongxiao has created which do this.

Problem B
=========

If we install task-core-x11-base-1.0-r34.qemux86_64.rpm which depends on
"connman", how does the system figure out to associate this to mean we
want the "x86_64" architecture packages installed?

As far as I can tell there are two proposals around:

1) Set the architecture in the package provides and depends (a bit ugly)

2) Configure libzypp to understand that qemux86_64 does really map to
x86_64 architecture and imply x86_64 dependencies.

Solving problem A above is the first step towards resolving this either
way but we don't seem to have a resolution on this second part.

For reference, we really do want these task packages to have an
associated architecture so the user can easily build up blocks of the
system using a given ABI.



What I really need now is an idea of which patches you both agree on
that we need to merge (I think we have some for problem A) and a
resolution on problem B along with some patches so we can close this set
of issues out.

If there are further issues can you reply to this email either with the
details or a pointer to the specific additional problems.

Cheers,

Richard




