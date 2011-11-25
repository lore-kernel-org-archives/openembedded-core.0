Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTjaD-0007SY-9k for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 01:24:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAP0HSS6000344;
	Fri, 25 Nov 2011 00:17:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32555-04; Fri, 25 Nov 2011 00:17:23 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAP0HJSt000337
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 25 Nov 2011 00:17:20 GMT
Message-ID: <1322180245.10928.50.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Date: Fri, 25 Nov 2011 00:17:25 +0000
In-Reply-To: <CAEsOVNe6ywzXK2b483FA-2T3A8x6-OwQXWKnsdMVWq5QTKh7sw@mail.gmail.com>
References: <1322041226-10075-1-git-send-email-msm@freescale.com>
	<CAEsOVNe6ywzXK2b483FA-2T3A8x6-OwQXWKnsdMVWq5QTKh7sw@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] gcc-cross.inc: Add depedency on BUILD_ARCH
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
X-List-Received-Date: Fri, 25 Nov 2011 00:24:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-11-24 at 23:56 +0000, McClintock Matthew-B29882 wrote:
> On Wed, Nov 23, 2011 at 3:40 AM, Matthew McClintock <msm@freescale.com> wrote:
> > +# we also add this to the PV so its clear in filenames
> > +# that this is arch specific even though it's labeled as
> > +# a target package
> > +PV .= "+${BUILD_ARCH_EXPANDED}"
> 
> Seems like based on discussion this should be the following instead:
> 
> PN .= "-{BUILD_ARCH}-${TARGET_ARCH}"

What we really want is something like this in cross.bbclass:

MULTIMACH_TARGET_SYS = "${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
PN .= "-${TRANSLATED_TARGET_ARCH}"

so that WORKDIR gets changed. I've not tested what this does to the
build though.

Also, looking at sstate.bbclass it does:

    elif bb.data.inherits_class('cross', d):
        bb.data.setVar('SSTATE_PKGARCH', bb.data.expand("${BUILD_ARCH}_${TUNE_PKGARCH}", d), d)
        bb.data.setVar('SSTATE_MANMACH', bb.data.expand("${BUILD_ARCH}_${MACHINE}", d), d)

so it should be sticking BUILD_ARCH into the sstate file name directly.
This should mean you can't use 32 bit sstate files on a 64 bit system
and vice versa already?

Cheers,

Richard




