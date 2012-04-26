Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SNXYS-0008Tr-RL
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 00:52:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3QMhEV6027213
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2012 15:43:14 -0700 (PDT)
Received: from wrlaptop (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 26 Apr 2012 15:43:13 -0700
Date: Thu, 26 Apr 2012 17:42:55 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120426174255.6739e594@wrlaptop>
In-Reply-To: <4F99C5C5.8090901@windriver.com>
References: <20120425203805.71113201@wrlaptop>
	<20120426160844.2d2a0b9f@wrlaptop> <4F99C5C5.8090901@windriver.com>
X-Mailer: Claws Mail 3.7.8 (GTK+ 2.24.4; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: Toolchain library whitelisting: A first pass (preliminary patch/RFC)
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
X-List-Received-Date: Thu, 26 Apr 2012 22:52:53 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Thu, 26 Apr 2012 17:01:41 -0500
Mark Hatle <mark.hatle@windriver.com> wrote:

> split does a whitespace based split automatically, I'm used to
> seeing .split() everywhere.  (I won't comment on the other similar
> split items)

Okay.
 
> > +    validities = data.getVarFlags('TUNEVALID') or ""
 
> "validities"?  that a new word?  ;)

Pretty much.  I was trying to think of a name for "the set of valid
things".  :)

> Change the above to:
>      multilibs = data.getVar("MULTILIBS", True)
>      if multilibs:

If someone has done:

MULTILIBS = ""

this then ends up being confused because pairs[0] of the single
returned item is still "", and that's not valid.
 
> > +		if pairs[1] == 'lib':
> > +		    tune_error_set.append("The multilib 'lib' was
> > specified, but that doesn't work. You need lib32 or lib64.")
 
> I'm surprised, why doesn't 'lib' work?  I was under the impression
> the naming was completely arbitrary.

I am surprised too, but if I use that name, I get a cryptic parse
error from libxcb's recipe which I couldn't understand.
 
> Also we can definitely have more then just lib32 or lib64.  We
> already often use libx32 in testing the x32 layer.

Okay.  I can improve the message, for sure.
 
> If the tune isn't defined, then the multilib configuration is
> invalid.  I thought we already had a check for that somewhere else..
> but if not.. it wouldn't be a bad idea to mention that here for the
> user.

That probably wants to be tested too.

> I wonder if this is an error or a warning.. I suspect it would be
> unintentional, but I'm not sure it's a failure?

I'm not totally sure.  I blamed that for my problem where I kept
getting a TUNE_ARCH of "x86_64x86_64" or "i586i586", but it turned out
to be a red herring.

I could change that to a warning.

> Your whitespace usage looks different.. perhaps that is just my
> mailer.

I almost certainly have tabs.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


