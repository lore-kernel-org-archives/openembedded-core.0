Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9abh-0004mM-Hf for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 12:46:17 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UAl9La011467; Fri, 30 Sep 2011 11:47:10 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qcCtBYONbvZf; Fri, 30 Sep 2011 11:47:09 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UAIi1q010279
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 30 Sep 2011 11:19:46 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 30 Sep 2011 11:12:18 +0100
In-Reply-To: <CAEsOVNc1Ckw-eCFSTGLngecojM=gR5rvphLFKP5TRfn17pobcg@mail.gmail.com>
References: <1317143228.26109.203.camel@ted>
	<CAEsOVNc1Ckw-eCFSTGLngecojM=gR5rvphLFKP5TRfn17pobcg@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317377605.12332.140.camel@ted>
Mime-Version: 1.0
Subject: Re: Build Times and Performance - Discussion + new ideas
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
X-List-Received-Date: Fri, 30 Sep 2011 10:46:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-30 at 01:11 +0000, McClintock Matthew-B29882 wrote:
> On Tue, Sep 27, 2011 at 12:07 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > https://wiki.yoctoproject.org/wiki/Build_Performance
> >
> > As detailed there I've setup a partition formatted with ext4 with no
> > journal, no barriers and most importantly a long commit time. The intent
> > here is to allow things to exist in memory and not block on disk IO.
> 
> Can you comment on how much these settings effect build times vs.
> saying running on ext3 which our build server happens to be using?

I don't have absolute numbers but there are the following performance
limiting factors:

- journal - turned off means faster but more data risk
- ext4 has extents (which if nothing else allow deletion of build 
  directories faster). I suspect these are a big win for us given how 
  much direct file writing we do during unpack
- noatime changes - reduces amount of writes needed
- commit time changes - not forced to only keep 5 seconds of data in 
  memory maximum so less process blocking on IO.

You can do some of these things on ext3 (or just enable the features on
your existing ext3 disk and start using them, you don't need to
reformat).

If the disk is your system and build disk, I'd get more worried and
probably not recommend the changes. I'd recommend a separate build disk
where at all possible.

Cheers,

Richard



