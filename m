Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Su81q-0001qT-T8
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 22:17:55 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:57377 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Su7qk-0002kC-5q for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 16:06:26 -0400
Date: Wed, 25 Jul 2012 16:06:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1207251558160.15120@oneiric>
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
Subject: how to properly use "EXTRA_ASSUME_PROVIDED"?
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
X-List-Received-Date: Wed, 25 Jul 2012 20:17:55 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  what is the proper way to use EXTRA_ASSUME_PROVIDED, and is the
effect of that visible in the bitbake environment?

  as in, based on the current version of bitbake.conf, i can see this
with "bitbake -e":

ASSUME_PROVIDED="bzip2-native git-native grep-native diffstat-native
patch-native perl-native-runtime python-native-runtime tar-native
virtual/libintl-native"

  if i add the following silliness to my local.conf,

ASSUME_PROVIDED += "rday-native"

i can see that in the env as well:

ASSUME_PROVIDED="bzip2-native git-native grep-native diffstat-native
patch-native perl-native-runtime python-native-runtime tar-native
virtual/libintl-native  rday-native"

  but is it correct to run the following:

$ bitbake -I EXTRA_ASSUME_PROVIDED="rday-native" -e core-image-minimal

and if it is, should i be able to verify that anywhere in the
environment?  doesn't seem so.  from bitbake/lib/bb/cooker.py, it
looks like whatever i put there is being processed thusly:

  ignore = self.configuration.data.getVar("ASSUME_PROVIDED", True) or ""
  self.status.ignored_dependencies = set(ignore.split())

  for dep in self.configuration.extra_assume_provided:
      self.status.ignored_dependencies.add(dep)

so is there any way to see that?  thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



