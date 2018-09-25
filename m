Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7E208793CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 11:08:37 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8PB8OiB017831
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 25 Sep 2018 12:08:25 +0100
Message-ID: <576c5e5174123059cfa49e8cf647716497a35610.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko.Rapeli@bmw.de, openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2018 12:08:24 +0100
In-Reply-To: <20180925104443.GP9430@hiutale>
References: <1537871293-32494-1-git-send-email-mikko.rapeli@bmw.de>
	<20180925104443.GP9430@hiutale>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH RFC] insane.bbclass: add buildpaths_cmake and buildpaths_pkgconfig checks
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
X-List-Received-Date: Tue, 25 Sep 2018 11:08:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-09-25 at 10:44 +0000, Mikko.Rapeli@bmw.de wrote:
> On Tue, Sep 25, 2018 at 01:28:13PM +0300, Mikko Rapeli wrote:
> > And enable them by default as ERROR_QA. Reason is that
> > absolute build directory paths in CMake .cmake modules
> > and in pkg-config .pc files cause recipe builds to escape
> > their recipe specific sysroots and triggers hard to debug
> > and timing sensitive build failures. It's better to fail
> > early.
> > 
> > A failure from sumo version of libical looks like:
> > 
> > ERROR: libical-2.0.0-r0 do_package_qa: QA Issue: CMake module
> > /work/i586-poky-linux/libical/2.0.0-r0/packages-split/libical-
> > dev/usr/lib/cmake/LibIcal/LibIcalTargets-noconfig.cmake contains
> > reference to tmpdir which causes build raceconditions between
> > recipes [buildpaths_cmake]
> > ERROR: libical-2.0.0-r0 do_package_qa: QA run found fatal errors.
> > Please consider fixing them.
> > ERROR: libical-2.0.0-r0 do_package_qa: Function failed:
> > do_package_qa
> > ERROR: Logfile of failure stored in:
> > /home/builder/src/yocto/poky/build/tmp/work/i586-poky-
> > linux/libical/2.0.0-r0/temp/log.do_package_qa.4934
> > NOTE: recipe libical-2.0.0-r0: task do_package_qa: Failed
> > ERROR: Task (/home/builder/src/yocto/poky/meta/recipes-
> > support/libical/libical_2.0.0.bb:do_package_qa) failed with exit
> > code '1'
> > 
> > For some reason libical from poky master branch is not affected.
> 
> The reason why master branch is not affected is:
> 
> commit 26cccb93059b8963651b7d17cea2ee95f52633b7
> Author: Juro Bystricky <juro.bystricky@intel.com>
> Date:   Tue Mar 20 15:36:36 2018 -0700
> 
>     libical-dev_2.0: improve reproducibility
>     
>     Remove build host references from distributed files.
>     
>     (From OE-Core rev: 20f2670e755bcbf90b2b6c08192c022fe7e7eaad)
>     
>     Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> >
> 
> diff --git a/meta/recipes-support/libical/libical_2.0.0.bb
> b/meta/recipes-support/libical/libical_2.0.0.
> index dcc21cc..daa47ab 100644
> --- a/meta/recipes-support/libical/libical_2.0.0.bb
> +++ b/meta/recipes-support/libical/libical_2.0.0.bb
> @@ -17,3 +17,10 @@ SRC_URI[sha256sum] =
> "654c11f759c19237be39f6ad401d917e5a05f36f1736385ed958e60cf2
>  UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
>  
>  inherit cmake pkgconfig
> +
> +do_install_append_class-target () {
> +    # Remove build host references
> +    sed -i \
> +       -e 's,${STAGING_LIBDIR},${libdir},g' \
> +       ${D}${libdir}/cmake/LibIcal/LibIcalTargets-noconfig.cmake
> +}
> 
> Now I'm struggling horribly with the same problem in various custom
> CMake modules, so how about doing that same STAGING_LIBDIR to libdir
> switch for all CMake modules automatically in cmake.bbclass?
> 
> I tried to correctly fix the libical CMake files too with help from
> #cmake, but eventually had to give up. libical has an embedded
> FindICU.cmake module but it seems like the upstream FindICU.cmake
> ends
> up producing the same absolute paths while it does fix some other
> bugs, and of course introduces new ones like no longer providing
> ICU_I18N_FOUND variable when i18n ICU module is found.

I suspect we need to talk to cmake upstream about fixing this properly
but adding something in the class may be an option until a better
upstream solution can be found.

I am puzzled by the need to add a .pc file path check since I thought
there was already a test for that in insane.bbclass?

package_qa_check_staged maybe? "Check staged la and pc files for common
problems like references to the work directory."

Cheers,

Richard









