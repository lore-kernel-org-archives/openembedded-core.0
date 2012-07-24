Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1StbDs-0003JY-Hx
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 11:16:08 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:33504 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Stb2l-0003Wk-Hd for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 05:04:39 -0400
Date: Tue, 24 Jul 2012 05:04:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207240455440.18822@oneiric>
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
Subject: more pedantry: inconsistent presentation of how to introduce layers
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
X-List-Received-Date: Tue, 24 Jul 2012 09:16:08 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i asked about this not that long ago but i'm still a bit puzzled --
what's the best practice for adding new layers in terms of how
bblayers.conf and the various layer.conf files are defined?

  the default layer.conf for oe-core contains:

BBPATH .= ":${LAYERDIR}"
...
BBFILE_PRIORITY_normal = "5"

so, clearly, the oe-core layer is being *appended* to whatever is in
BBPATH.  ok, let's go with that.

  on the other hand, that same file for the meta-yocto layer contains:

BBPATH := "${LAYERDIR}:${BBPATH}"
...
BBFILE_PRIORITY_yocto = "5"

so it's being *prepended*.  is that deliberate?  the end result is
that my BBPATH is:

/home/rpjday/yocto/git/meta-yocto:/home/rpjday/yocto/builds/bbc4:/home/rpjday/yocto/git/meta

which clearly represents:

 * the yocto layer
 * my build layer
 * the oe-core layer

with both the yocto and oe-core layer having priority 5.  is there no
chance of confusion here?

  in addition, the yocto development manual itself, in section 4.1.2
on layers, stresses the use of:

BBPATH := "${LAYERDIR}:${BBPATH}"

but every single meta-openembedded sub-layer uses the *other* form:

BBPATH .= ":${LAYERDIR}"

  anyone reading the manual and trying to match it up to the code is
bound to get confused.  thoughts?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


