Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4D2EF7829B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 13:17:07 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7NDH4j4025034
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 23 Aug 2017 14:17:05 +0100
Message-ID: <1503494224.32591.156.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, Robert Yang
	<liezhi.yang@windriver.com>
Date: Wed, 23 Aug 2017 14:17:04 +0100
In-Reply-To: <2904894.l3jg57PGWo@peggleto-mobl.ger.corp.intel.com>
References: <cover.1503364879.git.liezhi.yang@windriver.com>
	<00ad9ee0ea4e4de1773220dfca8792819701092f.1503364879.git.liezhi.yang@windriver.com>
	<2904894.l3jg57PGWo@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 23 Aug 2017 14:17:05 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 6/9] core/target/ssh.py: replace decode errors
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
X-List-Received-Date: Wed, 23 Aug 2017 13:17:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-08-22 at 22:55 +1200, Paul Eggleton wrote:
> On Tuesday, 22 August 2017 1:23:10 PM NZST Robert Yang wrote:
> > 
> > There might be wild strings when read from target (especially when
> > reading ptest results), replace the errors to avoid breaking the
> > test.
> > 
> > Fixed: (Not always happen)
> > $ bitbake core-image-sato -ctestimage
> > [snip]
> >     status, output = self.target.run('ptest-runner', 0)
> >   File "/buildarea/lyang1/poky/meta/lib/oeqa/core/target/ssh.py",
> > line 84, in run
> >     status, output = self._run(sshCmd, processTimeout, True)
> >   File "/buildarea/lyang1/poky/meta/lib/oeqa/core/target/ssh.py",
> > line 55, in _run
> >     status, output = SSHCall(command, self.logger, timeout)
> >   File "/buildarea/lyang1/poky/meta/lib/oeqa/core/target/ssh.py",
> > line 258, in SSHCall
> >     run()
> >   File "/buildarea/lyang1/poky/meta/lib/oeqa/core/target/ssh.py",
> > line 236, in run
> >     output = process.communicate()[0].decode("utf-8")
> > UnicodeDecodeError: 'utf-8' codec can't decode byte 0xc3 in
> > position 4906: invalid continuation byte
> > 
> > [YOCTO #11547]
> > 
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > ---
> >  meta/lib/oeqa/core/target/ssh.py | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/lib/oeqa/core/target/ssh.py
> > b/meta/lib/oeqa/core/target/ssh.py
> > index b80939c..a2eafcd 100644
> > --- a/meta/lib/oeqa/core/target/ssh.py
> > +++ b/meta/lib/oeqa/core/target/ssh.py
> > @@ -211,7 +211,7 @@ def SSHCall(command, logger, timeout=None,
> > **opts):
> >                              process.stdout.close()
> >                              eof = True
> >                          else:
> > -                            data = data.decode("utf-8")
> > +                            data = data.decode("utf-8",
> > errors='replace')
> >                              output += data
> >                              logger.debug('Partial data from SSH
> > call: %s' % data)
> Since we're dealing with partial data here, shouldn't we be using a
> reader object? e.g.:
> 
>   http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=bfd8c35c3
> f917e3806c8dfe36c98c70fbccbb3c9


I've decided to merge this series as it improves the ptest support
substantially however I am expecting a follow up with the tweaks Paul
suggests here please.

Cheers,

Richard


