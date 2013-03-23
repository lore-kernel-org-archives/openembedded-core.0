Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UJSht-0007Tt-7Z for openembedded-core@lists.openembedded.org;
	Sat, 23 Mar 2013 18:58:17 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2NHokvk000732; Sat, 23 Mar 2013 17:50:46 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Pk09to57gNXF; Sat, 23 Mar 2013 17:50:46 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2NHoekK000724
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sat, 23 Mar 2013 17:50:43 GMT
Message-ID: <1364060460.3097.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Sat, 23 Mar 2013 17:41:00 +0000
In-Reply-To: <8581719.do5prz68m2@helios>
References: <cover.1363981980.git.paul.eggleton@linux.intel.com>
	<d6c0028803399294e9eb24cd598a2edf65bbcfbf.1363981980.git.paul.eggleton@linux.intel.com>
	<1364054720.3097.27.camel@ted> <8581719.do5prz68m2@helios>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] classes/buildhistory: implement history collection for SDKs
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
X-List-Received-Date: Sat, 23 Mar 2013 17:58:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-03-23 at 17:32 +0000, Paul Eggleton wrote:
> On Saturday 23 March 2013 16:05:20 Richard Purdie wrote:
> > On Fri, 2013-03-22 at 19:53 +0000, Paul Eggleton wrote:
> > > SDKs are constructed in a similar manner to images, and the contents can
> > > be influenced by a number of different factors, thus tracking the
> > > contents of produced SDKs when buildhistory is enabled can help detect
> > > the same kinds of issues as with images.
> > > 
> > > This required adding POPULATE_SDK_POST_HOST_COMMAND and
> > > SDK_POSTPROCESS_COMMAND variables so that data collection functions can
> > > be injected at the appropriate points in the SDK construction process,
> > > as well as moving the list_installed_packages and
> > > rootfs_list_installed_depends functions from the rootfs_{rpm,ipk,deb} to
> > > the package_{rpm,ipk,deb} classes so they can also be called during
> > > do_populate_sdk as well as do_rootfs.
> > > 
> > > Implements [YOCTO #3964].
> > > 
> > > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > > ---
> > > 
> > >  meta/classes/buildhistory.bbclass      |  130
> > >  ++++++++++++++++++++++---------- meta/classes/package_deb.bbclass      
> > >  |   28 +++++++
> > >  meta/classes/package_ipk.bbclass       |   24 ++++++
> > >  meta/classes/package_rpm.bbclass       |   17 +++++
> > >  meta/classes/populate_sdk_base.bbclass |    2 +
> > >  meta/classes/populate_sdk_deb.bbclass  |    1 +
> > >  meta/classes/populate_sdk_ipk.bbclass  |    2 +
> > >  meta/classes/populate_sdk_rpm.bbclass  |    1 +
> > >  meta/classes/rootfs_deb.bbclass        |   27 -------
> > >  meta/classes/rootfs_ipk.bbclass        |   22 ------
> > >  meta/classes/rootfs_rpm.bbclass        |   16 ----
> > >  11 files changed, 165 insertions(+), 105 deletions(-)
> > 
> > This broke all the builds. Try setting PACKAGE_CLASSES with multiple
> > entries. The order determines the exact breakage. The first class
> > inherited needs to "win" but with the overlapping function names, this
> > isn't the case.
> 
> I will look into this this evening.

I realised there is a relatively easy way to fix this which I've pushed.
I'll run another build on the AB, see how things look.

Cheers,

Richard



