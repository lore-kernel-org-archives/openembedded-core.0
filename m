Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TjYoV-0002rP-JL
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 18:12:48 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:33576 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TjYaO-0008Hr-0c; Fri, 14 Dec 2012 11:58:08 -0500
Date: Fri, 14 Dec 2012 11:58:04 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: =?ISO-8859-2?Q?Marko_Kati=E6?= <dromede@gmail.com>
In-Reply-To: <1355503781.9104.27.camel@dromedary>
Message-ID: <alpine.DEB.2.02.1212141152280.9381@oneiric>
References: <CAOHjBZvW_wovoRDXuk=sbc-sgf64zLjsZYwDv+1UnXgkrLE_Nw@mail.gmail.com>
	<1355503781.9104.27.camel@dromedary>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: gcc-4.7.inc wrong FILESPATH setting?
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
X-List-Received-Date: Fri, 14 Dec 2012 17:12:49 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-12319598-1355504287=:9381"

--8323329-12319598-1355504287=:9381
Content-Type: TEXT/PLAIN; charset=ISO-8859-2
Content-Transfer-Encoding: 8BIT

On Fri, 14 Dec 2012, Marko Katiæ wrote:

> On Fri, 2012-12-14 at 17:41 +0100, Giuseppe Condorelli wrote:
> > Hi All,
> >
> > I've seen that, in the given .inc file, the FILESPATH is statically
> > set to
> >
> > FILESPATH = "${FILE_DIRNAME}/gcc-4.7"
> >
> > This seems to avoid any FILESEXTRAPATHS_prepend usage on append file.
> > I need to add further patches for gcc-4.7.2 in my own meta layer but
> > if I set the FILESEXTRAPATHS_prepend as usual
> > nothing happens, sources are taken only from the directory set by
> > FILESPATH.
> > Also I saw this setting was different in the past
> >
> > FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.7' ], d)}"

  i'm fairly sure i posted on this recently.  base.bbclass
*explicitly* sets FILESPATH to a set of variations thusly:

FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"

which works fine with the recipes in the underlying oe-core layer.

  however, when you use FILESEXTRAPATHS_prepend, you get additional
directories based on *only* the name you specify.  so if you do:

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

are you thinking you should also get all variations of "gcc-4.7"?
because that's not what's going to happen.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323329-12319598-1355504287=:9381--
