Return-Path: <mac@mcrowe.com>
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
	by mail.openembedded.org (Postfix) with ESMTP id AD0396C1D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 12:16:01 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id Nd2Tg9ZSGx6b6Nd2Ug2kWY; Fri, 16 Nov 2018 12:16:01 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=T4GiscCQ c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=JHtHm7312UAA:10 a=P2xTDAM0FP5LzwpPEAkA:9
	a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1gNd2T-0003CZ-CJ; Fri, 16 Nov 2018 12:15:57 +0000
Date: Fri, 16 Nov 2018 12:15:57 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20181116121557.nn3vgfhg4qdahwxc@mcrowe.com>
References: <20181115120016.29814-1-mac@mcrowe.com>
	<ea765026295a0691446d7afe29b2be2c6c0f0c43.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <ea765026295a0691446d7afe29b2be2c6c0f0c43.camel@linuxfoundation.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfNMTONtrqXTfoeBUsYBr9JwhM0IOeL7aJLCMvivgP+ILqt9AYg27qPCbsIVI6ZYnNgU7AmZOqDIxz7BHWCLWaJ+vMeeNhcA9KgHyz7lUCYK7cIzhVkEW
	cXhbILQRxJmAcZi1anpmB6FYiN736cGZJHupF9eH/uSK7QUAbmnxsXyR
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] glibc: Package AArch64 dynamic loader symlink correctly with usrmerge
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
X-List-Received-Date: Fri, 16 Nov 2018 12:16:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thursday 15 November 2018 at 19:10:08 +0000, Richard Purdie wrote:
> On Thu, 2018-11-15 at 12:00 +0000, Mike Crowe wrote:
> > When using usrmerge, the compatibility dynamic loader symlink created
> > in do_install_append_aarch64 ends up in /usr/lib rather than /lib.
> > This means that the path added to libc_baselibs needs to be altered
> > to match.
> > 
> > It's also necessary to tweak do_poststash_install_cleanup to not fail
> > when the symlink exists. I'm not entirely sure that the fix I've
> > applied here is the best one, but it does appear to work.
> 
> I'm afraid I really don't like this. Its creating a twisted web of
> logic which is going to be hard to maintain as the code is trying to do
> too many different things.
> 
> In particular, hardcoding "lib64" is usually a bad sign, as is swapping
> /lib for nonarch_base_libdir since whilst those happen to be similar,
> they do mean different things here. Its pure luck that usrmerge happens
> to end up doing the right thing and it will work until someone else
> wants to do something interesting with the layout and we can complicate
> this even more.
> 
> I'm hoping there is a better way to address this...

I can't say that I'm particularly keen on it either.

The FILES_ line used ${nonarch_base_libdir} because that's what
glibc-package.inc:do_install_append_aarch64 already used. To me, this part
seems correct: ${nonarch_base_libdir} means what will end up at /lib, no
matter what multilib (or even perhaps one day multiarch) prefix is
appropriate, and no matter whether that happens to be /usr/lib for
installation purposes due to usrmerge.

Stepping back, it looks like there are four cases to deal with based on the
two settings of multilib and usrmerge when considering the AArch64 ABI
requirement that the dynamic linker must be available in /lib.

* No multilib and no usrmerge:

The dynamic linker ends up in ${base_libdir} which is /lib. Job done.

* usrmerge but no multilib:

The dynamic linker ends up in ${base_libdir} which is /usr/lib. There's a
symlink from /lib to /usr/lib. Job done.

* multilib but no usrmerge:

The dynamic linker ends up in ${base_libdir} which is /lib64. We need to
create a symlink to /lib. The existing code appears to work for this case.

* multilib and usrmerge:

The dynamic linker ends up in ${base_libdir} which is /usr/lib64 (which is
symlinked from /lib64.) We need to create a symlink in /usr/lib (which is
symlinked from /lib. This is what I was attempting to fix.


We could invent some sort of "I really want this to be available in /lib on
the target" variable, but I don't see how that would end up being different
to nonarch_base_libdir.

I think (but haven't tested) that I can get rid of the explicit checks for
lib and lib64 by changing the patch to:

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index a98ae1a29c..73b86dfa6e 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -15,7 +15,7 @@ RPROVIDES_glibc-thread-db = "eglibc-thread-db"
 RPROVIDES_${PN}-pcprofile = "eglibc-pcprofile"
 RPROVIDES_${PN}-dbg = "eglibc-dbg"
 libc_baselibs = "${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/libmvec-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
-libc_baselibs_append_aarch64 = " /lib/ld-linux-aarch64*.so.1"
+libc_baselibs_append_aarch64 = " ${nonarch_base_libdir}/ld-linux-aarch64*.so.1"
 INSANE_SKIP_${PN}_append_aarch64 = " libdir"

 FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf"
@@ -206,7 +206,7 @@ do_poststash_install_cleanup () {
 	rm -rf ${D}${libdir}/gconv
 	rm -rf ${D}/${localedir}
 	rm -rf ${D}${datadir}/locale
-	if [ "${libdir}" != "${exec_prefix}/lib" ]; then
+	if [ "${libdir}" != "${nonarch_base_libdir}" ]; then
 		if [ -d ${D}${exec_prefix}/lib ]; then
 			# error out if directory isn't empty
 			# this dir should only contain locale dir

Thanks.

Mike.

