Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QdjYB-0003xs-Dq for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 15:50:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p64DlBGu018450
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Jul 2011 14:47:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17831-10 for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2011 14:47:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p64Dl6XJ018444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Jul 2011 14:47:07 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAP9ODKpeG=a71mZNRTRzt=Ehjy3iEBhBa0dPCA71vKnA-Cz30A@mail.gmail.com>
References: <CAP9ODKpeG=a71mZNRTRzt=Ehjy3iEBhBa0dPCA71vKnA-Cz30A@mail.gmail.com>
Date: Mon, 04 Jul 2011 14:46:37 +0100
Message-ID: <1309787198.20015.669.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFH] Wrong behaviour regarding SDK native and target paths
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
X-List-Received-Date: Mon, 04 Jul 2011 13:51:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-07-03 at 19:29 -0300, Otavio Salvador wrote:
> Hello,
> 
> I am looking for help to get our nativesdk working fine and I am quite
> confused how does it can work after all.
> 
> I have looked at meta/recipes-qt/meta/meta-toolchain-qte.bb and it has:
> 
> QT_TOOLS_PREFIX = "${SDKPATHNATIVE}${bindir_nativesdk}"
> 
> Running it is expanded to:
> 
> QT_TOOLS_PREFIX="/usr/local/oecore-i686-i586/sysroots/i686-oesdk-linux/usr/bin"
> 
> It seems right but in fact it is wrong since Qt binaries are installed into:
> 
> (devel)~/hacking/el% tar tjf
> tmp-eglibc-eglibc/deploy/sdk/oecore-i686-i586-toolchain-devel.tar.bz2|
> grep 'bin/moc4'
> ./usr/local/oecore-i686-i686/sysroots/i686-oesdk-linux/usr/bin/moc4
> 
> so, the generated information for the script won't work.
> 
> I am quite confused by all this is suppose to work. Someone help me?

It looks like in OE-Core we have:

conf/bitbake.conf:SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
conf/bitbake.conf:SDKPATH = "/usr/local/${SDK_NAME}"
conf/bitbake.conf:SDK_NAME = "oecore-${SDK_ARCH}-${TARGET_ARCH}"

and in meta-yocto:

conf/distro/poky.conf:SDKPATH = "/opt/${DISTRO}/${SDK_VERSION}"

I suspect having TARGET_ARCH in the PATH might be a bad idea and we need
to rethink the defaults in OE-Core. Using something more like the
meta-yocto default above might help your problem.

Cheers,

Richard



