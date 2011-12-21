Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RdKBv-0005tf-CD for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 12:18:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBLBBVGC007904
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 11:11:31 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06943-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 11:11:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBLBBK7Q007897
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 11:11:22 GMT
Message-ID: <1324465882.16323.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Dec 2011 11:11:22 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: RFC: nativesdk and native recipe names
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
X-List-Received-Date: Wed, 21 Dec 2011 11:18:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We have a problem looming on the horizon with regard to the native and
particularly nativesdk recipe names.

We originally ran into this problem with the multilib code. The issue is
that its rather hard to automagically translate PACKAGES and
DEPENDS/RDEPENDS etc. into something the BBCLASSEXTEND classes can use
and be consistent.

To illustrate the problem, imagine a PACKAGES like foo:

foo-dev doo-dbg foo-doc foo-utils

which is built from:

${PN} ${PN}-dev ${PN}-dbg ${PN}-doc ${PN}-utils

The class extension code changes PN and since these are constructed with
PN, they become:

foo-<class> foo-<class>-dev foo-<class>-dbg foo-<class>-doc foo-<class>-utils

Imagine you're then presented with some dependency like "foo-utils". How
do you know where to place "-<class>"?

We could write code which splits on the first dash character or a
variety of other ways but for multilibs the easiest approach was to use
a prefix instead of a suffix.

I recently proposed a patch to native.bbclass and removed some ugly
workarounds. It turns out this breaks nativesdk. There is some code in
nativesdk designed to help with this but its disabled. I tried to enable
it and hit these exact problems.

If we change nativesdk to become a prefix, the problem can share the
same code as multilib and become much more widely usable rather than the
current special cases. Its obviously a fairly major change in recipe
naming though. Would changing this be acceptable?

Just for reference, -native is special in that PACKAGES = "" so its
easier to handle. In theory we do still have the same issue there but
R*_${PN} dependencies tend not to be problematic so we've got lucky so
far.

Cheers,

Richard




