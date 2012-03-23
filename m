Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SB8gb-0001Ji-QM for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 18:54:02 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NHj52j029932;
	Fri, 23 Mar 2012 17:45:05 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28271-09; Fri, 23 Mar 2012 17:45:01 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NHittW029922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 23 Mar 2012 17:44:56 GMT
Message-ID: <1332524697.9740.465.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 23 Mar 2012 17:44:57 +0000
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C0137C776@ORSMSX106.amr.corp.intel.com>
References: <xna3ujdvoyvh9m51g7hfhmvu.1332520606617@email.android.com>
	<ADD6A3980E8C39419A432FF422031B4C0137C776@ORSMSX106.amr.corp.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
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
X-List-Received-Date: Fri, 23 Mar 2012 17:54:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-23 at 17:01 +0000, Kamble, Nitin A wrote:
> 
> > -----Original Message-----
> > From: Khem Raj [mailto:raj.khem@gmail.com]
> > Sent: Friday, March 23, 2012 9:37 AM
> > To: Kamble, Nitin A
> > Cc: eric; Patches and discussions about the oe-core layer; Martin Jansa
> > Subject: RE: [OE-core] [PATCH 1/1] Revert "gdb-cross-canadian: build
> > gdb with python support"
> > 
> > My patch took care of everything including paths
> > -khem
> > 
> 
> 
> Khem, 
>   I am testing your commit here. From the patch looks like it is taking care of rpath issue for gdb. The rpath issue also needs to be corrected for all the sdk executables.
> And I have this fix for general sdk rpath fix.
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=nitin/sdk-rpath

Er, looking at that patch:

 BUILDSDK_LDFLAGS = "-L${STAGING_LIBDIR} \
 -Wl,-rpath-link,${STAGING_LIBDIR} \
 -Wl,-rpath,${libdir} -Wl,-O1 \
+ -Wl,-rpath,${libdir}/.. -Wl,-O1 \
 -L${STAGING_DIR_HOST}${base_libdir} \
 -Wl,-rpath-link,${STAGING_DIR_HOST}${base_libdir} \
 -Wl,-rpath,${base_libdir} -Wl,-O1"

Things look confused. In the commit message you say:

/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib

but then add:
-Wl,-rpath,${libdir}/.. -Wl,-O1 \

which is:
 
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr

(i.e. without the /lib on the end?) ?

Cheers,

Richard





