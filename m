Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA7AF6010B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 19:19:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u88JJJpt022830
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Sep 2016 12:19:19 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 8 Sep 2016 12:19:19 -0700
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1473361447-11655-1-git-send-email-ross.burton@intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <cba00f95-da02-2a0b-893c-516539104999@windriver.com>
Date: Thu, 8 Sep 2016 14:19:17 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1473361447-11655-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] rpm: remove redundant removals
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
X-List-Received-Date: Thu, 08 Sep 2016 19:19:22 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 9/8/16 2:04 PM, Ross Burton wrote:
> These were noticed by the use of bashisms (rm *.{foo,bar}) and lots of these rm
> commands are deleting files which don't exist in the first place.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/rpm/rpm_5.4.16.bb | 45 ---------------------------------
>  1 file changed, 45 deletions(-)
> 
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
> index 9f78dee..2b8768c 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
> @@ -554,54 +554,11 @@ do_install_append() {
>  	install -m 0755 ${WORKDIR}/pythondeps.sh ${D}/${libdir}/rpm/pythondeps.sh
>  	install -m 0755 ${WORKDIR}/perfile_rpmdeps.sh ${D}/${libdir}/rpm/perfile_rpmdeps.sh
>  
> -	# Remove unpackaged files (based on list in rpm.spec)
> -	rm -f ${D}/${libdir}/rpm/{Specfile.pm,cpanflute,cpanflute2,rpmdiff,rpmdiff.cgi,sql.prov,sql.req,tcl.req,trpm}

The above files can 'appear' in some odd cases.  But likely it is safe to remove
the 'rm'.

> -	rm -f ${D}/${mandir}/man8/rpmcache.8*
> -	rm -f ${D}/${mandir}/man8/rpmgraph.8*
> -	rm -f ${D}/${mandir}/*/man8/rpmcache.8*
> -	rm -f ${D}/${mandir}/*/man8/rpmgraph.8*
> -	rm -rf ${D}/${mandir}/{fr,ko}

Above cases need to be removed.  We do not support the rpmcache or rpmgraph, and
at least for a long time the man pages were being generated for them.  (If this
is no longer true, and man pages ARE being generated they should be removed.)

> -	rm -f ${D}/${includedir}/popt.h
> -	rm -f ${D}/${libdir}/libpopt.*
> -	rm -f ${D}/${libdir}/pkgconfig/popt.pc
> -	rm -f ${D}/${datadir}/locale/*/LC_MESSAGES/popt.mo
> -	rm -f ${D}/${mandir}/man3/popt.3

We can use either an internal or external version of the popt library.  If the
internal version is used, we MUST remove all of these files.  If the external
version is used, the RPM won't end up doing anything.

> -	rm -f ${D}/${mandir}/man1/xar.1*
> -	rm -f ${D}/${bindir}/xar
> -	rm -rf ${D}/${includedir}/xar
> -	rm -f ${D}/${libdir}/libxar*
> -
> -	rm -f ${D}/${bindir}/lz*
> -	rm -f ${D}/${bindir}/unlzma
> -	rm -f ${D}/${bindir}/unxz
> -	rm -f ${D}/${bindir}/xz*
> -	rm -rf ${D}/${includedir}/lzma*
> -	rm -f ${D}/${mandir}/man1/lz*.1
> -	rm -f ${D}/${libdir}/pkgconfig/liblzma*

Above files may be generated in some configurations.  (Possible that is no
longer true.)

> -	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/*.a
>  	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/*.la
> -	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/rpm/*.a
>  	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/rpm/*.la

The .a files were removed because we didn't want anyone statically linking to
python.a, not sure they they were being produced to begin with.. but that is why
that was there.

> -	#find ${D}/${libdir}/perl5 -type f -a \( -name perllocal.pod -o -name .packlist \
> -	#	-o \( -name '*.bs' -a -empty \) \) -exec rm -f {} ';'
> -	#find ${D}/${libdir}/perl5 -type d -depth -exec rmdir {} 2>/dev/null ';'
> -

Don't know what the above is.

>  	rm -f ${D}/${libdir}/rpm/dbconvert.sh
>  
> -	rm -f ${D}/${libdir}/rpm/libsqldb.*
> -

If 'sqlite' support is enabled in RPM, the above should be removed.  It will
clash with external components.

> -	# We don't want, nor need the Mandriva multiarch items
> -	rm -f ${D}/${bindir}/multiarch-dispatch
> -	rm -f ${D}/${bindir}/multiarch-platform
> -	rm -f ${D}/${libdir}/rpm/check-multiarch-files
> -	rm -f ${D}/${libdir}/rpm/mkmultiarch
> -	rm -f ${D}/${includedir}/multiarch-dispatch.h
> -

Again, some configs may produce these.. if they're not produced in our config we
can remove it.

>  	rm -f ${D}/${libdir}/rpm/gstreamer.sh
>  	rm -f ${D}/${libdir}/rpm/gem_helper.rb
>  	rm -f ${D}/${libdir}/rpm/rubygems.rb
> @@ -610,12 +567,10 @@ do_install_append() {
>  	rm -f ${D}/${libdir}/rpm/macros.d/kernel
>  	rm -f ${D}/${libdir}/rpm/macros.d/gstreamer
>  	rm -f ${D}/${libdir}/rpm/bin/mgo
> -	rm -f ${D}/${libdir}/rpm/bin/dbconvert

dbconvert is not useful for us.. it used to be provided, so we removed it.

>  	rm -f ${D}/${libdir}/rpm/bin/pom2spec
>  
>  	rm -rf ${D}/var/lib/wdj ${D}/var/cache/wdj
>  	rm -f ${D}/${libdir}/rpm/bin/api-sanity-checker.pl
> -
>  }
>  
>  do_install_append_class-target() {
> 


