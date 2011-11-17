Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RQxsz-0005na-Oo
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 10:03:57 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id EEEE6110018B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 09:57:34 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 8E0661100182
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 09:57:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225005235.adsl.alicedsl.de
	[92.225.5.235]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 09:57:32 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 8DC8030008; Thu, 17 Nov 2011 09:57:30 +0100 (CET)
Date: Thu, 17 Nov 2011 09:57:30 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20111117085730.GA4551@mail.familie-heinold.de>
References: <1321496999.1264.24.camel@localhost.localdomain>
	<CAEsOVNdL3bTKA9rv6p9SEpvoY+a3b5y6Ftn=ySMVdgkW3nMm3w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEsOVNdL3bTKA9rv6p9SEpvoY+a3b5y6Ftn=ySMVdgkW3nMm3w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: how to exclude files when packaging?
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
X-List-Received-Date: Thu, 17 Nov 2011 09:03:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 17, 2011 at 08:14:06AM +0000, McClintock Matthew-B29882 wrote:
> On Wed, Nov 16, 2011 at 8:29 PM, Ni Qingliang
> <niqingliang@insigma.com.cn> wrote:
> > Hello, All:
> >        I'm working on opensaf, wrote a bb file for it,
> > and found that the FILES_${PN} has included /usr/lib/${PN}/*.
> > but there are some .a and .so(symlink) in /usr/lib/${PN}, which will
> > result QA issue.
> >        how to exclude some files (e.g. *.a, *.so) in FILES_${PN}?
> >
> >        there are some elf in /usr/lib/${PN} whose prefix is not 'lib', so if
> > no 'exclude' feature, I must redefine FILES_${PN} like this:
> >        FILES_${PN} = "/usr/lib/${PN}/*.so.* \
> >                       /usr/lib/${PN}/saf* \
> >                       /usr/lib/${PN}/open* \
> >                       /usr/lib/${PN}/immload \
> >                       /usr/lib/${PN}/nid_tipc \
> >                       /usr/lib/${PN}/smf* \
> >                       /usr/lib/${PN}/clc-cli/*"
> 
> Explicitly list what you want in FILES_${PN}
> 
> FILES_${PN} = /usr/lib/${PN}/saf
> 
> Make another PACKAGE for other files
> 
> PACKAGES =+ ${PN}-misc
> FILES_${PN}-misc = /usr/lib/${PN}/saf
> 
> Maybe someone else can chime in if there is a way to mask certain files...

No,

QA would always complain. For all files you do not want to package make a do_install_append()
and remove them inside this function.

Another solution would be to tweak the buildsystem of the software, not to install the unwanted
files.

Bye Henning


