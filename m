Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id E9E0D71D8C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 18:45:36 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=tp13)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
	(envelope-from <pb@pbcl.net>)
	id 1cS6r0-0003fS-ON; Fri, 13 Jan 2017 19:45:36 +0100
Message-ID: <1484333133.3966.76.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Jan 2017 18:45:33 +0000
In-Reply-To: <CAJTo0LZYiqp+b7hwsGaZDKbpwo4UPxyLLw7Eje1-Y5Fg-=Jwow@mail.gmail.com>
References: <20170111035102.18447-1-raj.khem@gmail.com>
	<20170111035102.18447-2-raj.khem@gmail.com>
	<CAJTo0LZYiqp+b7hwsGaZDKbpwo4UPxyLLw7Eje1-Y5Fg-=Jwow@mail.gmail.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] glibc: Upgrade to 2.25
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
X-List-Received-Date: Fri, 13 Jan 2017 18:45:38 -0000
Content-Type: multipart/alternative; boundary="=-uu+ulv5u443eROBjV2sy"

--=-uu+ulv5u443eROBjV2sy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-01-11 at 12:19 +0000, Burton, Ross wrote:
> > > The gdk-pixbuf link does use -lpthread, is this saying that libpng
should be linked against pthread too?  I can replicate on demand if
you have any suggestions.
> 
> 

So, amusingly, it now appears that libpng in pthread-using programs has
actually been a bit broken for a long time, since about glibc 2.22.
 It's just that the failure has now become more obvious, because ld.so
will refuse to load the binary at all rather than allowing it to load
and having it crash later under some circumstances.

Whether the circumstances that would cause the crash (libpng calling
longjmp) can ever arise with gdk-pixbuf is another question and I don't
know the answer offhand.  If this can happen then it would probably be
when dealing with a corrupted input file.

Anyway, this is definitely a glibc bug and it is now on the list of
blockers for 2.25.  Good work by Ross in finding it!

p.


--=-uu+ulv5u443eROBjV2sy
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html><head></head><body><div>On Wed, 2017-01-11 at 12:19 +0000, Burton, Ross wrote:</div><blockquote type="cite"><div dir="ltr"><div>The gdk-pixbuf link does use -lpthread, is this saying that libpng should be linked against pthread too?&nbsp; I can replicate on demand if you have any suggestions.</div></div>
</blockquote><div><br></div><div>So, amusingly, it now appears that libpng in pthread-using programs has actually been a bit broken for a long time, since about glibc 2.22. &nbsp;It's just that the failure has now become more obvious, because ld.so will refuse to load the binary at all rather than allowing it to load and having it crash later under some circumstances.</div><div><br></div><div>Whether the circumstances that would cause the crash (libpng calling longjmp) can ever arise with gdk-pixbuf is another question and I don't know the answer offhand. &nbsp;If this can happen then it would probably be when dealing with a corrupted input file.</div><div><br></div><div>Anyway, this is definitely a glibc bug and it is now on the list of blockers for 2.25. &nbsp;Good work by Ross in finding it!</div><div><br></div><div>p.</div><div><br></div></body></html>

--=-uu+ulv5u443eROBjV2sy--
