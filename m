Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1T3uJa-0000o0-W2
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 21:40:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7LJSYGv002684
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 12:28:34 -0700 (PDT)
Received: from e6410-2 (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 21 Aug 2012 12:28:34 -0700
Date: Tue, 21 Aug 2012 14:28:20 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: "openembedded-core@"
	<lists.openembedded.org.openembedded-core@lists.openembedded.org>
Message-ID: <20120821142820.59b3d124@e6410-2>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: pseudo diagnostics: please do not ignore these completely!
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 19:40:39 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

If you have really weird build problems:

Check the pseudo.log file for a given package. A lot of packages are
generating a fair number of diagnostics and warnings some of which
indicate that stuff is non-trivially busted for some packages. A quick
scan of a small build turned up 16 packages with no diagnostics, and 21
which had diagnostics of some sort. Of those 21, 18 had at least one
case in which the database showed an inode as being a directory, and a
request showed that it wasn't anymore, or vice versa.

Pseudo is fairly paranoid about trying to catch stuff like this, but it
tends to do its best to fail quietly and just log the errors -- these
logs don't do much if we don't follow up on them, though.

The basic rule is:

If pseudo is aware of or using a file or directory, that file or
directory should not be moved/renamed, or replaced, except under
pseudo.

In many cases, things will recover. If a file is created under pseudo,
then renamed outside pseudo, then statted under pseudo again, the
database entry for the inode will be found and pseudo will probably do
the right thing. If there's a mismatch where an inode's basic type
(file/directory/link) mismatches between the database and an incoming
request, pseudo will nuke the bogus database entry.

But this won't catch everything.

So if you have a strange problem that you can't reproduce, check the
pseudo.log file. It may not mean much to you, but if it says anything
about "dir err" or "ino mismatch", something has gone pretty badly
wrong. If you can reproduce "this file is full of weird messages" with
a given package, that's probably a bug in the package, and I will try
to look into some of these when I have a minute or three and see
whether I can find any patterns.

And yes, I'm aware that running things under pseudo is slow. I have
plans to work on that too. Maybe I should do a kickstarter. :)

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


