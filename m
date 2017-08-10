Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EC2E66FFD8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 20:34:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7AKYoaD025921
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 10 Aug 2017 13:34:50 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 10 Aug 2017 13:34:49 -0700
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <f05e1212a87f739cf27fe9a6c32f45ef92a6fdab.1501250341.git-series.patrick.ohly@intel.com>
	<CAMKF1sq98x8jpV_A0Fz2doMO25Cii9v4Ez178ex4uUoPqnnB8A@mail.gmail.com>
	<CA+chaQetLEuL79Utj_C+e7yQpg9Hw1ZhVQsOdCEeLZNziAzMqQ@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <04c5a375-93ee-7f32-4f91-a4dc3f7c9b1c@windriver.com>
Date: Thu, 10 Aug 2017 15:34:48 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQetLEuL79Utj_C+e7yQpg9Hw1ZhVQsOdCEeLZNziAzMqQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autoconf-archive: move from meta-oe to OE-core
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
X-List-Received-Date: Thu, 10 Aug 2017 20:34:51 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/10/17 3:18 PM, Martin Jansa wrote:
> -2

I agree that autoconf-archive should be in oe-core.  But...

> LBTM
> 
> 
> If gnome-common should depend on TUNE_PKGARCH autoconf-archive, then it cannot inherit allarch anymore, see:
> 
> 
> ERROR: gnome-common different signature for task do_package_write_ipk.sigdata between qemux86copy and qemuarm
> runtaskdeps changed:
> autoconf-archive/autoconf-archive_2016.09.16.bb.do_packagedata with hash e26a8076711b7e88a3ffcda74a9e5332
>  changed to
> autoconf-archive/autoconf-archive_2016.09.16.bb.do_packagedata with hash ee3f5138593bed3feb8519cf3c26aa7b
> Hash for dependent task autoconf-archive/autoconf-archive_2016.09.16.bb.do_packagedata changed from e26a8076711b7e88a3ffcda74a9e5332 to ee3f5138593bed3feb8519cf3c26aa7b
> 

There should not be an architectural difference.  There is no reason it
shouldn't be allarch.  Part of the reason we really need to move it into oe-core
is that currently different BSPs may implement it differently making the
'allarch' even MORE complicated.

--Mark

> 
> On Fri, Jul 28, 2017 at 6:45 PM, Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     On Fri, Jul 28, 2017 at 7:01 AM, Patrick Ohly <patrick.ohly@intel.com
>     <mailto:patrick.ohly@intel.com>> wrote:
>     > Having common macros in OE-core that are needed by autotools based
>     > projects makes sense. For example, tpm2.0-tools in meta-measured
>     > depended on meta-oe only because of autoconf-archive.
>     >
>     > This is a verbatim copy of the autoconf-archive recipe in
>     > meta-openembedded rev 1cbd1bc1, with just one change: the patch which
>     > disabled the installation of ax_code_coverage.m4 and
>     > ax_check_enable_debug.m4 was removed.
>     >
>     > So now autoconf-archive in OE-core provides them. gnome-common in
>     > meta-oe will be changed to not install them and instead depend on
>     > autoconf-archive.
> 
>     +1
>     LGTM
> 
>     >
>     > Signed-off-by: Patrick Ohly <patrick.ohly@intel.com
>     <mailto:patrick.ohly@intel.com>>
>     > ---
>     >  meta/recipes-devtools/autoconf-archive/autoconf-archive.inc           |
>     15 +++++++++++++++
>     >  meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
>     <http://autoconf-archive_2016.09.16.bb> | 13 +++++++++++++
>     >  2 files changed, 28 insertions(+)
>     >  create mode 100644
>     meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
>     >  create mode 100644
>     meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
>     <http://autoconf-archive_2016.09.16.bb>
>     >
>     > diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
>     b/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
>     > new file mode 100644
>     > index 0000000..9684d1f
>     > --- /dev/null
>     > +++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
>     > @@ -0,0 +1,15 @@
>     > +LICENSE = "GPLv3"
>     > +HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/
>     <http://www.gnu.org/software/autoconf-archive/>"
>     > +SECTION = "devel"
>     > +
>     > +DEPENDS += "m4-native"
>     > +DEPENDS_class-native = "m4-native gnu-config-native"
>     > +DEPENDS_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
>     > +
>     > +RDEPENDS_${PN} = "m4 gnu-config gnome-common"
>     > +RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
>     > +RDEPENDS_${PN}_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
>     > +
>     > +SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
>     > +
>     > +inherit autotools
>     > diff --git
>     a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
>     <http://autoconf-archive_2016.09.16.bb>
>     b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
>     <http://autoconf-archive_2016.09.16.bb>
>     > new file mode 100644
>     > index 0000000..0a1a771
>     > --- /dev/null
>     > +++
>     b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
>     <http://autoconf-archive_2016.09.16.bb>
>     > @@ -0,0 +1,13 @@
>     > +require autoconf-archive.inc
>     > +
>     > +
>     > +PARALLEL_MAKE = ""
>     > +
>     > +LICENSE = "GPLv2 & GPLv3"
>     > +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>     > +
>     > +SRC_URI[md5sum] = "bf19d4cddce260b3c3e1d51d42509071"
>     > +SRC_URI[sha256sum] =
>     "e8f2efd235f842bad2f6938bf4a72240a5e5fcd248e8444335e63beb60fabd82"
>     > +
>     > +EXTRA_OECONF += "ac_cv_path_M4=m4"
>     > +BBCLASSEXTEND = "native nativesdk"
>     >
>     > base-commit: d3a41fbd94462efc8c6f1b55f6fb54001b447c45
>     > --
>     > git-series 0.9.1
>     > --
>     > _______________________________________________
>     > Openembedded-core mailing list
>     > Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
> 
> 
> 
> 


