Received: from mail-ie0-f181.google.com ([209.85.223.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U5SZe-0005f5-Js
	for Openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 04:00:11 +0100
Received: by mail-ie0-f181.google.com with SMTP id 17so1062525iea.40
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 18:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=IDyy6lKpbCmOiy3cr688zky+yAEy2cCrrAcfOv/8pGk=;
	b=QzzBOX0WfObXoxS8ih77TFYILvCf3YFKqwHPjSXeUrUBpq1P37f0xeGGgcs/Zt48us
	YglEhc0m+jRtidZypamrBDqtBsqXPX8L+bHJTyroBPsxIcu0psh3Q8vrmmTiPl2Jwz11
	pc6BQm8A/2Eum9TF8YSd+G53/HfHtxfr4cPZrJ1Yh4FD2DZesy9TfLXm0VN0bpo/H2rn
	mgAHtoEn+F+MG2bSVMWjC/k/tzUTMrUndMG1tmFzhgucUZCSf86rMNUCQo1yx+eVpBWF
	Osa4uxXsHCgswdaQhyYyy+X9j9NiHEA/o1mNH3S+CVp+NsH/H1E3GD3Kuz8rAf3NPbLa
	bLCA==
X-Received: by 10.50.155.134 with SMTP id vw6mr8170972igb.34.1360723433892;
	Tue, 12 Feb 2013 18:43:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.13.204 with HTTP; Tue, 12 Feb 2013 18:43:23 -0800 (PST)
In-Reply-To: <1360709606.11225.1.camel@ted>
References: <1360697804-39039-1-git-send-email-jason.wessel@windriver.com>
	<1360705147.30425.70.camel@ted> <511ABC32.4000803@windriver.com>
	<1360709606.11225.1.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Feb 2013 18:43:23 -0800
Message-ID: <CAMKF1sp-P6R7izkULawssoQJFQ7LcSb9Crc3ajb95W4UR1QTZg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libtool-native_2.4.2.bb: Always use /bin/sed for SED
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
X-List-Received-Date: Wed, 13 Feb 2013 03:00:12 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 12, 2013 at 2:53 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2013-02-12 at 16:03 -0600, Jason Wessel wrote:
>> On 02/12/2013 03:39 PM, Richard Purdie wrote:
>> > On Tue, 2013-02-12 at 13:36 -0600, Jason Wessel wrote:
>> >> If you never use sstate and always build everything from scratch you
>> >> will never see this problem.  However, if you use sstate and build
>> >> directories that last a long time eventually you can end up with the
>> >> scenario where libtool gets a hard coded path in it for sed, and sed
>> >> may not exist.  The reason you don't see this problem to often if you
>> >> generally build from scratch is that libtool builds before sed and
>> >> will pickup the host's /bin/sed.
>> >>
>> >> The way to reproduce the issue is:
>> >>
>> >> bitbake some_image
>> >> bitbake -c cleansstate libtool-native
>> >> bitbake sed-native
>> >> bitbake libtool-native
>> >> bitbake -c clean sed-native
>> >> bitbake ANY_PACKAGE_THAT_USES_LIBTOOL_NATIVE
>> >>
>> >> In my case I used modphp, which doesn't exist in the oe-core. You will
>> >> end up with a strange looking error like:
>> >>
>> >> | make[1]: *** [buckets/apr_buckets_alloc.lo] Error 1
>> >> | /opt/build/bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-libtool: line 981: /opt/build/bitbake_build/tmp/sysroots/x86_64-linux//bin/sed: No such file or directory
>> >>
>> >> The solution is to always use /bin/sed for libtool-native.
>> >>
>> >> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> >> ---
>> >>  .../libtool/libtool-native_2.4.2.bb                |    3 ++-
>> >>  1 files changed, 2 insertions(+), 1 deletions(-)
>> >>
>> >> diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb b/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
>> >> index f12e6a1..18188ef 100644
>> >> --- a/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
>> >> +++ b/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
>> >> @@ -2,12 +2,13 @@ require libtool-${PV}.inc
>> >>
>> >>  DEPENDS = ""
>> >>
>> >> -PR = "${INC_PR}.0"
>> >> +PR = "${INC_PR}.1"
>> >>  SRC_URI += "file://prefix.patch"
>> >>
>> >>  inherit native
>> >>
>> >>  EXTRA_OECONF = " --with-libtool-sysroot=${STAGING_DIR_NATIVE}"
>> >> +CACHED_CONFIGUREVARS += "ac_cv_path_SED=/bin/sed"
>> > Do we have to set a path for it? Can't we rely on PATH being sane? I'm
>> > wondering if we should actually set this in the core site files.
>> > Hardcoding a path to utilities never usually ends well and this is just
>> > the tip of an iceberg.
>> >
>> > If we have to use a path, "${bindir}/env sed"?
>> >
>>
>> The libtool seems to be in a class of its own with respect to
>> internally hard coding things, so I am inclined to say this is a one
>> off because A) it is libtool and B) it is part of the boot strap. For
>> any other packages I have not observed any kind of problem with the
>> sysroot sed vs host provided sed.
>>
>> Unfortunately doing ${bindir}/env sed can lead to a fairly rare race
>> where sed can be there an get removed later because it will prefer the
>> sed in the sysroot area because it is in the path first.  I never hit
>> any of these problems until recently while continuing to just randomly
>> build things with the usual stream of updates from the git repository.
>>
>> If we want libtool-native to use something other than /bin/sed on the
>> host, the bootstrap needs some kind of overhaul to make libtool depend
>> correctly on sed.  Currently we end up with a circular dependency if
>> you try to make libtool-native depend on sed-native.
>
> Does it make sense for sed-native to ever be built? I know we have
> issues with some others like tar, bzip/gzip and friends but no issues
> with sed afaik?
>

we could if we get rid of it from following

meta/classes/populate_sdk_base.bbclass:SDK_DEPENDS =
"virtual/fakeroot-native sed-native"
meta/recipes-core/meta/external-python-tarball.bb:DEPENDS =
"opkg-native opkg-utils-native virtual/fakeroot-native sed-native"
meta/recipes-devtools/libtool/libtool-2.4.2.inc:# Don't want paths to
sed-native (or anything else) encoded
meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb:    sed-native \




> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


