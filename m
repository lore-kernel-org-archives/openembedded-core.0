Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QoCaC-0003QF-Nt for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 12:52:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p72AlwKZ014857;
	Tue, 2 Aug 2011 11:47:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14687-02; Tue,  2 Aug 2011 11:47:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p72Alnog014851
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 2 Aug 2011 11:47:49 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E3717AE.7010504@linux.intel.com>
References: <1311847292.30326.423.camel@phil-desktop>
	<4E3717AE.7010504@linux.intel.com>
Date: Tue, 02 Aug 2011 11:47:34 +0100
Message-ID: <1312282054.2344.580.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] glibc: deleted
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
X-List-Received-Date: Tue, 02 Aug 2011 10:52:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 14:16 -0700, Saul Wold wrote:
> On 07/28/2011 03:01 AM, Phil Blundell wrote:
> > Glibc 2.10.1 is outdated now and eglibc seems to provide a superset of
> > its functionality.
> >
> > Signed-off-by: Phil Blundell<philb@gnu.org>
> >
> 
> Merged into OE-Core
> 
> But this seems to have triggered a problem with PREFERRED_PROVIDER from 
> multiple recipes. (see http://bugzilla.pokylinux.org/show_bug.cgi?id=1309)

This isn't really as a result of Phils patch. I've a proposed fix:

---

Author: Richard Purdie <richard.purdie@linuxfoundation.org>

eglibc: Add missing ${PN} and ${PKGSUFFIX} usages
    
This fixes warning messages such as:
   
The providers found were: ['virtual:nativesdk:eglibc_2.13.bb', 'eglibc_2.13.bb']
The PREFERRED_PROVIDER entries resulting in this conflict were: ['PREFERRED_PROVIDER_virtual/libc-nativesdk = eglibc-nativesdk', 'PREFERRED_PROVIDER_virtual/libc = eglibc']
NOTE: multiple providers are available for runtime glibc-utils (eglibc, eglibc-nativesdk, external-csl-toolchain, external-poky-toolchain)
NOTE: consider defining a PREFERRED_PROVIDER entry to match glibc-utils
    
This highlights how ugly adding to PN is when using BBCLASSEXTEND. We need to do this to
eglibc so the nativesdk class continues to work correctly for now and ensure consistency
in how the various eglibc packages are generated.
    
Longer term, if we switch nativesdk to use the multilib approach and MLPREFIX, we can
remove all the PKGSUFFIX mess. I'd rather not get into changing nativesdk right at this
time though given all the other changes that are going on.
   
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 7646ea4..77519d2 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -20,7 +20,7 @@ USE_LDCONFIG ?= "1"
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 
-PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils eglibc-extra-nss eglibc-thread-db${PKGSUFFIX} ${PN}-pic ${PN}-dev eglibc-doc libcidn libmemusage libsegfault${PKGSUFFIX} eglibc-pcprofile libsotruss${PKGSUFFIX}"
+PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils eglibc-extra-nss${PKGSUFFIX} eglibc-thread-db${PKGSUFFIX} ${PN}-pic ${PN}-dev ${PN}-doc libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX} libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX}"
 
 # Create a eglibc-binaries
 ALLOW_EMPTY_${PN}-binaries = "1"
@@ -42,48 +42,48 @@ ALLOW_EMPTY_${PN}-localedatas = "1"
 PACKAGES += "${PN}-localedatas"
 RRECOMMENDS_${PN}-localedatas =  "${@" ".join([p for p in d.getVar('PACKAGES', True).split() if p.find("eglibc-localedata") != -1])}"
 
-RPROVIDES_eglibc = "glibc"
-RPROVIDES_${PN}-utils = "glibc-utils"
-RPROVIDES_eglibc-pic = "glibc-pic"
-RPROVIDES_eglibc-dev = "glibc-dev"
-RPROVIDES_eglibc-doc = "glibc-doc"
-RPROVIDES_eglibc-extra-nss = "glibc-extra-nss"
-RPROVIDES_eglibc-thread-db = "glibc-thread-db"
-RPROVIDES_eglibc-pcprofile = "glibc-pcprofile"
-RPROVIDES_eglibc-dbg = "glibc-dbg"
+RPROVIDES_${PN} = "glibc${PKGSUFFIX}"
+RPROVIDES_${PN}-utils = "glibc${PKGSUFFIX}-utils"
+RPROVIDES_${PN}-pic = "glibc${PKGSUFFIX}-pic"
+RPROVIDES_${PN}-dev = "glibc${PKGSUFFIX}-dev"
+RPROVIDES_${PN}-doc = "glibc${PKGSUFFIX}-doc"
+RPROVIDES_eglibc-extra-nss${PKGSUFFIX} = "glibc-extra-nss${PKGSUFFIX}"
+RPROVIDES_eglibc-thread-db${PKGSUFFIX} = "glibc-thread-db${PKGSUFFIX}"
+RPROVIDES_${PN}-pcprofile = "glibc${PKGSUFFIX}-pcprofile"
+RPROVIDES_${PN}-dbg = "glibc-dbg${PKGSUFFIX}"
 libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
 
 FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '', d)}"
 FILES_ldd${PKGSUFFIX} = "${bindir}/ldd"
 FILES_libsegfault${PKGSUFFIX} = "${base_libdir}/libSegFault*"
-FILES_libcidn = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
-FILES_libmemusage = "${base_libdir}/libmemusage.so"
-FILES_eglibc-extra-nss = "${base_libdir}/libnss_*-*.so ${base_libdir}/libnss_*.so.*"
-FILES_sln = "/sbin/sln"
-FILES_eglibc-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/"
+FILES_libcidn{PKGSUFFIX} = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
+FILES_libmemusage{PKGSUFFIX} = "${base_libdir}/libmemusage.so"
+FILES_eglibc-extra-nss{PKGSUFFIX} = "${base_libdir}/libnss_*-*.so ${base_libdir}/libnss_*.so.*"
+FILES_sln{PKGSUFFIX} = "/sbin/sln"
+FILES_${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/"
 FILES_libsotruss${PKGSUFFIX} = "${libdir}/audit/sotruss-lib.so"
-FILES_eglibc-dev_append += "${bindir}/rpcgen ${libdir}/*.a \
+FILES_${PN}-dev_append += "${bindir}/rpcgen ${libdir}/*.a \
 	${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
 FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd*"
-FILES_eglibc-utils = "${bindir}/* ${sbindir}/*"
+FILES_${PN}-utils = "${bindir}/* ${sbindir}/*"
 FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/audit/.debug"
 FILES_catchsegv${PKGSUFFIX} = "${bindir}/catchsegv"
 RDEPENDS_catchsegv${PKGSUFFIX} = "libsegfault"
-RDEPENDS_eglibc-utils += "bash"
-FILES_eglibc-pcprofile = "${base_libdir}/libpcprofile.so"
+RDEPENDS_${PN}-utils += "bash"
+FILES_${PN}-pcprofile = "${base_libdir}/libpcprofile.so"
 FILES_eglibc-thread-db${PKGSUFFIX} = "${base_libdir}/libthread_db.so.* ${base_libdir}/libthread_db-*.so"
-RPROVIDES_eglibc-dev += "libc-dev"
+RPROVIDES_${PN}-dev += "libc-dev"
 
 SUMMARY_sln = "The static ln."
 DESCRIPTION_sln = "Similar to the 'ln' utility, but statically linked.  sln is useful to make symbolic links to dynamic libraries if the dynamic linking system, for some reason, is not functional."
 SUMMARY_nscd = "Name service cache daemon"
 DESCRIPTION_nscd = "nscd, name service cache daemon, caches name service lookups for the passwd, group and hosts information.  It can damatically improvide performance with remote, such as NIS or NIS+, name services."
-SUMMARY_eglibc-extra-nss = "hesiod, NIS and NIS+ nss libraries"
-DESCRIPTION_eglibc-extra-nss = "eglibc: nis, nisplus and hesiod search services."
+SUMMARY_eglibc-extra-nss${PKGSUFFIX} = "hesiod, NIS and NIS+ nss libraries"
+DESCRIPTION_eglibc-extra-nss${PKGSUFFIX} = "eglibc: nis, nisplus and hesiod search services."
 SUMMARY_ldd = "print shared library dependencies"
 DESCRIPTION_ldd = "/usr/bin/ldd prints shared library dependencies for each program or shared library specified on the command line."
-SUMMARY_eglibc-utils = "Miscellaneous utilities provided by eglibc"
-DESCRIPTION_eglibc-utils = "Miscellaneous utilities including getconf, iconf, locale, gencat, tzselect, zic, rpcinfo, ..."
+SUMMARY_${PN}-utils = "Miscellaneous utilities provided by eglibc"
+DESCRIPTION_${PN}-utils = "Miscellaneous utilities including getconf, iconf, locale, gencat, tzselect, zic, rpcinfo, ..."
 DESCRIPTION_libsotruss = "Library to support sotruss which traces calls through PLTs"
 
 inherit libc-common multilib_header



