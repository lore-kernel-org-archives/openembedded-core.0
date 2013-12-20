Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id F3B8660FF6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2013 12:37:40 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBKCbZCu006658; Fri, 20 Dec 2013 12:37:35 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OzdeS--ZFR2i; Fri, 20 Dec 2013 12:37:35 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBKCbWGC006654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 20 Dec 2013 12:37:33 GMT
Message-ID: <1387543048.6402.96.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 20 Dec 2013 12:37:28 +0000
In-Reply-To: <20131220123348.GV3706@jama>
References: <1387541162.6402.91.camel@ted> <20131220123348.GV3706@jama>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: Convert to use ':' as a filename sperator and use SSTATE_SWSPEC globally
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
X-List-Received-Date: Fri, 20 Dec 2013 12:37:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-12-20 at 13:33 +0100, Martin Jansa wrote:
> On Fri, Dec 20, 2013 at 12:06:02PM +0000, Richard Purdie wrote:
> > Currently the code has problems differentiating between "gcc-cross" and "gcc-cross-initial"
> > sstate files. We could add in a ton of special casing but tests show this isn't scaling
> > well. Using a more unique separator resolves the issue.
> > 
> > The choice of which separator to use is a hard one. We need something which isn't commonly
> > used in PN, PV, PR, *_OS and *_ARCH which rules out '-', '_' and it needs to work ok with
> > webservers/http which makes ';' and '%' harder.
> > 
> > The change also sets SSTATE_SWSPEC globally since writing out differently named siginfo
> > files for the fetch/unpack/patch tasks is a waste of diskspace, the hashes match for
> > all PN in the majority of cases and if they don't, its not a big issue as the hash is
> > different. This makes the results from sstate debugging more understandable.
> 
> Can you mention why :: is sometimes used in SWSPEC?
> 
> I guess it's again just for easier differentianting, but maybe it should
> be mentioned in commit message.

Its so there are the same number of fields in there, its just empty for
the non-arch specific cases. 

Cheers,

Richard



