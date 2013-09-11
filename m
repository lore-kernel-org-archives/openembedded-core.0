Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 7B0526BE7E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 16:46:32 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8BH04CK011306; Wed, 11 Sep 2013 18:00:05 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UIPVufDzU-UQ; Wed, 11 Sep 2013 18:00:04 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8BGxuew011284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 11 Sep 2013 17:59:58 +0100
Message-ID: <1378917967.3484.199.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Sep 2013 17:46:07 +0100
In-Reply-To: <CAJTo0LYUL1kvZB=Lk8ine+zVpAipRNMevnnpLi5C2_+ZobLdyw@mail.gmail.com>
References: <cover.1378361078.git.nitin.a.kamble@intel.com>
	<2b4e12bfea634eaecac61b471a9d607fe127d1cd.1378361078.git.nitin.a.kamble@intel.com>
	<1378369981.32427.23.camel@ted>
	<CAJTo0LbLaH4-YTJVo_yr-gsaaSbXXe9Ucfbq_i+4gO+qKa354Q@mail.gmail.com>
	<CAP9ODKo0KQ3gJd+eCfzDF0QX9EYb_NhRRX6NWJOKsxWth7_wxg@mail.gmail.com>
	<CAJTo0LYUL1kvZB=Lk8ine+zVpAipRNMevnnpLi5C2_+ZobLdyw@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	"meta-intel@yoctoproject.org" <meta-intel@yoctoproject.org>,
	Darren Hart <darren.hart@intel.com>, Saul Wold <saul.wold@intel.com>
Subject: Re: [Patch-v2 1/1] mesa: avoid unnecessary rerunning of tasks
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
X-List-Received-Date: Wed, 11 Sep 2013 16:46:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-09-09 at 12:36 +0100, Burton, Ross wrote:
> On 7 September 2013 00:56, Otavio Salvador <otavio@ossystems.com.br> wrote:
> >> Maybe it is time to have a mesa-gl recipe alongside mesa that *just*
> >> builds the GL libraries.  EMGD can depend on it for the driver modules
> >> it installs, and presumably other vendors with binary drivers can
> >> install it for the software rendering/GLX support (Otavio etc, please
> >> step in here!).
> >
> > Yes; we have both situations at Freescale ARM BSP.
> >
> > For the AMD GPU binaries, which are used in MX5 SoCs we *just* use
> > mesa GL and do software rendering.
> 
> So mesa-gl will work fine there.
> 
> > For Vivante GPU binaries, used for
> > MX6, we use mesa GL *headers* but Vivante provides a libGL binary.
> 
> My, that's horrific.  I'd forgotten about this, for good reason clearly.

So I now have actual code which is better than any thought experiment :)

First, I have this applied:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t1&id=3e2c058ffab5b4e92523dac3078c1bc02d0eb8b8

This creates a machine specific pkgdata/shlibs directory instead of the
current multiple directories and iterations we use. Its not complete yet
(buildhistory is broken for example), its another proof of concept. What
this does is ensure that the main TUNE_PKGARCH directory doesn't get
corrupted with emgd shlibs below, accidentally or otherwise.

We then have two PoC patches one for OE-Core, one for meta-intel. These
put the gl bits into "i586-emgd" instead of "i586" so they're isolated.

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t1&id=258e068bbb309877b6e36eeec1107806fc710cde
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/metaintel&id=917286eebc5e4eeb13fcc1b0db6adb50ccd847a0

I hacked emenlow so it shared qemux86's TUNE_PKGARCH for testing
purposes. You can then build both qemux86 and emenlow in the same build
directory without them trampling clutter.

cogl would also need to inherit the gl class so its rough around the
edges but basically works.

Thoughts?

Cheers,

Richard




