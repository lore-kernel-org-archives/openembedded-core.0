Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rj7lU-0006Eo-2v for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 12:15:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06B7qLr019577
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 11:07:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18968-05 for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 11:07:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06B7iTk019570
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 11:07:46 GMT
Message-ID: <1325848065.20759.84.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jan 2012 11:07:45 +0000
In-Reply-To: <lyboqh86qb.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <cover.1325744640.git.sgw@linux.intel.com>
	<04bb0f6bbd41ec9c2234df49130dba2346d9a3bf.1325744640.git.sgw@linux.intel.com>
	<lyboqh86qb.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 04/28] ncurses: move libraries to base_libdir
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
X-List-Received-Date: Fri, 06 Jan 2012 11:15:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-06 at 11:29 +0100, Enrico Scholz wrote:
> Saul Wold <sgw-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> writes:
> 
> > -		f=${D}${libdir}/$i.so
> > +                f=${D}${base_libdir}/$i.so
> 
> this breaks builds because 'ld' does not search ${base_libdir}:
> 
> | gcc -shared ... -ltermcap
> | /usr/bin/ld: cannot find -ltermcap
> | ERROR: Task 216 (virtual:native:.../readline/readline_6.2.bb, do_install) failed with exit code '1'
> | ERROR: 'virtual:native:.../readline/readline_6.2.bb' failed

Note this is a -native problem, not a target library one. I suspect we
need to enhance:

export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
                        -Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} \
                        -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-O1"

in bitbake.conf.

Cheers,

Richard



