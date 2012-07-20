Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SsG43-0002cQ-HM for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 18:28:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6KGH4ul013494
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 17:17:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10396-09 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 17:16:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6KGGqkS013488
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 17:16:55 +0100
Message-ID: <1342801015.21788.42.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jul 2012 17:16:55 +0100
In-Reply-To: <1342719981-1324-1-git-send-email-morgan.little@windriver.com>
References: <1342719981-1324-1-git-send-email-morgan.little@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v2 00/16] python-native: Put binaries in seperate directory
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
X-List-Received-Date: Fri, 20 Jul 2012 16:28:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-19 at 13:46 -0400, Morgan Little wrote:
> I updated python-native like it was suggest by Richard here:
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-June/024644.html
> 
> It is to resolve an issue that comes up when python-native is building and 
> autoconf finds the binary but not the libraries. This fix moves where the 
> binaries are installed to remove this issue and use the system's python.
> 
> I have used bitbake world to build to make sure most things are build and 
> have added all of the recipes that I found were affected. I will be building 
> more to make sure I managed to get all of them.
> 
> -----V2 Change-----
> Updated distutils-base to inherit pythonnative
> 
> Removed added pythonnative inherit in distutils
> 
> Removed added inherit for pythonnative from python-dbus, python-pygtk,
> python-setuptools, python-gst, python-pygobject since they get the inherit from
> distutils-base
> 
> Updated perf for the change
> 
> 
> The following changes since commit 28715eff6dff3415b1d7b0be8cbb465c417e307f:
>   Richard Purdie (1):
>         boot-directdisk: Fix kernel location after STAGING_KERNEL_DIR change
> 
> are available in the git repository at:
> 
>   git@github.com:morganlittle/oe-core.git master
> 
> Morgan Little (16):
>       python-native: Put binaries in seperate directory
>       python: Update for python-native changes
>       python-scons-native: Update for python-native changes
>       python-pyrex-native: Update for python-native changes
>       mklibs-native: Update for python-native changes
>       telepathy-glib: Update for python-native changes
>       telepathy-python: Update for python-native changes
>       libxml2: Update for python-native changes
>       gnome-doc-utils: Update for python-native changes
>       gobject-introspection: Update for python-native changes
>       mesa-common: Update for python-native changes
>       libxcb: Update for python-native changes
>       xcb-proto: Update for python-native changes
>       perf: Update for python-native changes
>       kernelshark: Update for python-native changes
>       trace-cmd: Update for python-native changes

I've been testing this and making a more detailed review of the changes.
Firstly, I realised you were adding the pythonnative class to recipes
which never had DEPENDS = "python-native". That isn't right and
shouldn't be done for telepathy-glib, libxcb, kernelshark and
trace-cmd. 

gnome-doc-utils needed further attention. I've looked into it and I
think we need to put a wrapper around xmlto in the native case so that
we can use the full path to python. I'm going to submit a patch for
this.

You can see the version of this patch set I plan to merge on master-next
(dropping the above mentioned patches).

Cheers,

Richard






