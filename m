Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TYfb5-0002k2-Tq for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 17:13:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAEFxtmL021270;
	Wed, 14 Nov 2012 15:59:55 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20196-07; Wed, 14 Nov 2012 15:59:51 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAEFxmhu021264
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 14 Nov 2012 15:59:49 GMT
Message-ID: <1352908789.15477.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 14 Nov 2012 15:59:49 +0000
In-Reply-To: <20121114152206.GO3928@jama.jama.net>
References: <1352815500.24487.123.camel@ted>
	<20121114150945.GN3928@jama.jama.net>
	<20121114152206.GO3928@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: Be consistent about sstate-inputdirs/outputdirs ending with '/'
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
X-List-Received-Date: Wed, 14 Nov 2012 16:13:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-11-14 at 16:22 +0100, Martin Jansa wrote:
> On Wed, Nov 14, 2012 at 04:09:45PM +0100, Martin Jansa wrote:
> > On Tue, Nov 13, 2012 at 02:05:00PM +0000, Richard Purdie wrote:
> > > If sstate-inputdirs and sstate-outputdirs don't match with ending '/'
> > > characters, the manifest file can end up corrupted. This change
> > > ensures the metadata is consistent in ending do_populate_root tasks
> > > with this character to avoid manifest file corruption.
> > > 
> > > diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> > > index ff6556c..1ac1db6 100644
> > > --- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> > > +++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> > > @@ -74,6 +74,6 @@ sysroot_stage_all() {
> > >  	mv ${SYSROOT_DESTDIR}${target_libdir}/* ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${target_libdir}/ || true
> > >  }
> > >  
> > > -do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_HOST} ${SYSROOT_DESTDIR}/${STAGING_DIR_TARGET}/${target_base_libdir}"
> > > -do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_HOST} ${STAGING_DIR_TCBOOTSTRAP}/${target_base_libdir}"
> > > +do_populate_sysroot[sstate-inputdirs] = "${SYSROOT_DESTDIR}/${STAGING_DIR_HOST}/ ${SYSROOT_DESTDIR}/${STAGING_DIR_TARGET}/${target_base_libdir}/"
> > > +do_populate_sysroot[sstate-outputdirs] = "${STAGING_DIR_HOST}/ ${STAGING_DIR_TCBOOTSTRAP}/${target_base_libdir}/"
> > 
> > Not sure if it can be caused by this, but building from scratch fails
> > today with:
> > 
> 
> with some added debug output it looks like trying to move the same directory twice:
> WARNING: Moving
> /OE/oe-core/tmp-eglibc/work/x86_64-oe-linux/gcc-cross-initial-4.7.2-r13/sstate-install-populate-sysroot/
> to
> /OE/oe-core/tmp-eglibc/work/x86_64-oe-linux/gcc-cross-initial-4.7.2-r13/sysroot-destdir///OE/oe-core/tmp-eglibc/sysroots/x86_64-linux/
> WARNING: Moving
> /OE/oe-core/tmp-eglibc/work/x86_64-oe-linux/gcc-cross-initial-4.7.2-r13/sstate-install-populate-sysroot/
> to
> /OE/oe-core/tmp-eglibc/work/x86_64-oe-linux/gcc-cross-initial-4.7.2-r13/sysroot-destdir///OE/oe-core/tmp-eglibc/sysroots/qemux86-64//lib/
> ERROR: Error executing a python function in
> /OE/oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-cross-initial_4.7.bb:

There is something missing from after sstate-install-populate-sysroot/.
I've pushed a fix into master. Its only appearing when installing from
sstate.

Cheers,

Richard



