Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S1Jtl-0007al-NN for openembedded-core@lists.openembedded.org;
	Sat, 25 Feb 2012 16:51:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1PFgdqC021280
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 15:42:39 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20924-01 for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 15:42:34 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1PFgVeb021274
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 15:42:33 GMT
Message-ID: <1330184551.13788.39.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 25 Feb 2012 15:42:31 +0000
In-Reply-To: <20120225131218.GP3769@jama.jama.net>
References: <cover.1329147583.git.Martin.Jansa@gmail.com>
	<b17109ebc9396973f7c0dbf6812699e2c0930349.1329147583.git.Martin.Jansa@gmail.com>
	<1329992873.32110.58.camel@ted> <20120225000546.GO3769@jama.jama.net>
	<1330131768.13788.6.camel@ted> <20120225131218.GP3769@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/4] gdb-cross-canadian: use NATIVESDK paths as it happens to be here
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
X-List-Received-Date: Sat, 25 Feb 2012 15:51:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-02-25 at 14:12 +0100, Martin Jansa wrote:
> On Sat, Feb 25, 2012 at 01:02:48AM +0000, Richard Purdie wrote:
> > I seem to remember strongly disagreeing with:
> > 
> > SDK_NAME = "oecore-${SDK_ARCH}-${TARGET_ARCH}"
> > SDKPATH = "/usr/local/${SDK_NAME}"
> > 
> > that is in bitbake.conf but probably wasn't able to articulate why at
> > the time. You'll note that poky.conf does:
> > 
> > SDK_VERSION := "${@'${DISTRO_VERSION}'.replace('snapshot-${DATE}','snapshot')}"
> > SDK_NAME = "${DISTRO}-${TCLIBC}-${SDK_ARCH}-${TARGET_ARCH}"
> > SDKPATH = "/opt/${DISTRO}/${SDK_VERSION}"
> > 
> > so the SDKPATH is not dependent on TARGET_ARCH. It doesn't need to
> > depend on SDK_ARCH either although that is not the problematic part
> > here.
> > 
> > If you think about what is happening, bitbake will reuse the sstate
> > files for each nativesdk, they are meant to be equivalent for each
> > SDKMACHINE. If you hardcode TARGET_ARCH into the path, they are not.
> 
> I'll update my first patch to remove TARGET_ARCH, I'm testing
> SDKPATH = "/usr/local/${SDK_NAME_PREFIX}"
> now, then we still have to deal with different toplevel SYSROOT (if we
> want to use STAGING_LIBDIR etc).

Ok, we need to do this one step at a time :)

> x86_64-nativesdk-oesdk-linux (python-nativesdk)
> x86_64-oesdk-linux-nativesdk (gdb-cross-canadian-*)

This looks broken, the python-nativesdk looks right, the cross-canadian
one looks wrong.

Thinking further, cross-candian is never used from staging. Its
therefore entirely possible the path is just totally broken in
cross-canadian.bbclass. We can probably do something like:

-STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_SYS}-nativesdk"
+STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}"

> And that looks even more like another wrong variable to me, but as I've
> said in 1st thread (SDK confusion) I normaly don't build SDKs so maybe
> there are hidden reasons to stage them in different dirs.
> 
> I can use Eric's
> ${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}
> to look into right sysroot, but maybe it's again not right direction.
> 
> > So I'd say that SDKPATH containing SDK_NAME is clearly bogus and
> > TARGET_ARCH needs to be removed in somehow at the very least. Fix that
> > and your problems should go away. 
> 
> Not really but it's getting better :).
> 
> > The patches you're sending don't fix the root problem though.
> 
> Originaly they were meant mostly to show the difference between
> nativesdk and cross-canadian paths.. so I'm not much surprised :).

Hopefully with the above we can resolve this!

Cheers,

Richard



