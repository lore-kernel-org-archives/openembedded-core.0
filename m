Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UGLds-0005vx-NY
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Mar 2013 04:49:29 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2F3WWwZ005899
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Mar 2013 20:32:32 -0700 (PDT)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 14 Mar 2013 20:32:32 -0700
Message-ID: <5142964C.1050004@windriver.com>
Date: Fri, 15 Mar 2013 11:32:28 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1363154328.git.liezhi.yang@windriver.com>
	<055756a16301a9a8d41701c48d30cf4bddc44617.1363154328.git.liezhi.yang@windriver.com>
	<5140AA60.8020705@linux.intel.com>
In-Reply-To: <5140AA60.8020705@linux.intel.com>
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] cairo: add libpng to EXTRA_libcairo_la_DEPENDENCIES
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
X-List-Received-Date: Fri, 15 Mar 2013 03:49:37 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/14/2013 12:33 AM, Saul Wold wrote:
> On 03/13/2013 01:58 AM, Robert Yang wrote:
>> There is a build error when I update the git repo and build again:
>>
>> x86_64-linux-libtool: link: cannot find the library
>> `/path/to/sysroots/x86_64-linux/usr/lib/libpng15.la' or ...
>>
>> This because libpng was 1.5 before I update the git repo, and it
>> is 1.6 now, libpng's include dir and lib dir are special, they are:
>>
>> /usr/include/libpngXX/png.h
>> /usr/lib/libpngXX.la
>>
>> The XX is the version, e.g, libpng15.la, cairo doesn't handle this
>> depends well, the configure finds that the lbpng is 1.6 after the
>> update, but it doesn't rebuild libcairo.la since this depends isn't in
>> the Makefile, it should have a file like cairo.def (cairo has this file,
>> but it is only used for windows) to record this dependency.  Add
>> libpng's includedir to EXTRA_libcairo_la_DEPENDENCIES as a quick fix.
>>
> I understand what you are trying to do here, but this is a point fix for a much
> bigger issue with the renaming of libpngXX, there are a number of other issues
> that will be uncovered and making this a hard code change here is not correct.
>

Hi Saul,

Thanks, there is already a symlink libpng.pc to libpngXX.pc, but the content of
libpngXX.pc is still -lpngXX, change this to -lpng would fix the problem, I'm
thinking about whether we should change /usr/include/libpngXX/ to /usr/include
/libpng/ or make a symlink for it.

I will send a patch if you are fine with it.

// Robert

> There are other .la that will contain pngXX and cause problems, this issue is
> also contained in SSTATE files, in the past we would do PR bumps to all the
> affected recipes that depended on PNG.
>
> Sau!
>
>> [YOCTO #4002]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-graphics/cairo/cairo_1.12.14.bb | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/meta/recipes-graphics/cairo/cairo_1.12.14.bb
>> b/meta/recipes-graphics/cairo/cairo_1.12.14.bb
>> index 16f9d7b..857cfa6 100644
>> --- a/meta/recipes-graphics/cairo/cairo_1.12.14.bb
>> +++ b/meta/recipes-graphics/cairo/cairo_1.12.14.bb
>> @@ -38,6 +38,19 @@ FILES_cairo-gobject = "${libdir}/libcairo-gobject.so.*"
>>   FILES_cairo-script-interpreter = "${libdir}/libcairo-script-interpreter.so.*"
>>   FILES_cairo-perf-utils = "${bindir}/cairo-trace
>> ${libdir}/cairo/libcairo-trace.so.*"
>>
>> +do_compile() {
>> +    # The libpng's include is special, it is usually
>> +    # usr/include/libpngXX, the XX is the version number, add it to
>> +    # libcairo.la's dependencies so that libcairo.la can be rebuilt
>> +    # when libpng upgrades.
>> +    if [ "${PN}" = "cairo-native" ]; then
>> +        libpng_DEPS="`pkg-config libpng --variable=includedir`"
>> +    else
>> +        libpng_DEPS="${STAGING_DIR_HOST}`pkg-config libpng
>> --variable=includedir`"
>> +    fi
>> +    oe_runmake EXTRA_libcairo_la_DEPENDENCIES="$libpng_DEPS"
>> +}
>> +
>>   do_install_append () {
>>       rm -rf ${D}${bindir}/cairo-sphinx
>>       rm -rf ${D}${libdir}/cairo/cairo-fdr*
>>
>
>


