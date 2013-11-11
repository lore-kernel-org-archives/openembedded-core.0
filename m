Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 755926CFEC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 19:13:46 +0000 (UTC)
Message-ID: <52812C68.4020701@communistcode.co.uk>
Date: Mon, 11 Nov 2013 19:13:44 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
References: <1383839993-21102-1-git-send-email-ml@communistcode.co.uk>
	<527C34A3.6050708@linux.intel.com>
In-Reply-To: <527C34A3.6050708@linux.intel.com>
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: Re: [PATCHv4] libjson: update to 0.11 and rename to json-c
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Nov 2013 19:13:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/11/2013 00:47, Saul Wold wrote:
> On 11/07/2013 07:59 AM, Jack Mitchell wrote:
>> From: Jack Mitchell <jmitchell@cbnl.com>
>>
>> libjson is now known as json-c, support for the old namespace is
>> disabled as it seems to break SEPBUILDDIR configs. Built without
>> parallel make as it fails, official word is not to bother trying.
>>
>> Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
>> ---
>>
>>   v4:
>>    - add --disable-oldname-compat to try and fix suspected SEPBUILDDIR
>>      issues
>>
>
> Jack,
>
> I hate to ask this, but given this version is also failing, how have you
> been testing this recipe?

Just the usual way, standard x86 atom target -c cleansstate and a build 
+ build -c populate_sdk. It also gets rebuilt without a clean sstate as 
I've been holding this patch in my working tree for weeks now.

I don't really know where to go with this now, I was sure it was going 
to be the compat configure functons which were breaking things, but 
obviously not. I'll see if I can find some time to tidy up the actual 
configure script some, and see if that irons out the issues we're 
seeing. I'll also give it a go with SEPBUILDDIR and see if I can get it 
failing over here too.

Cheers!

>
> I attached my do_configure log file.
>
> Thanks
>      Sau!
>
>>   meta/conf/distro/include/seperatebuilddir.inc     |  2 +-
>>   meta/recipes-devtools/json-c/json-c_0.11.bb       | 16 ++++++++++++++++
>>   meta/recipes-devtools/libjson/libjson_0.9.bb      | 14 --------------
>>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc |  2 +-
>>   4 files changed, 18 insertions(+), 16 deletions(-)
>>   create mode 100644 meta/recipes-devtools/json-c/json-c_0.11.bb
>>   delete mode 100644 meta/recipes-devtools/libjson/libjson_0.9.bb
>>
>> diff --git a/meta/conf/distro/include/seperatebuilddir.inc
>> b/meta/conf/distro/include/seperatebuilddir.inc
>> index c067183..e1a5c6b 100644
>> --- a/meta/conf/distro/include/seperatebuilddir.inc
>> +++ b/meta/conf/distro/include/seperatebuilddir.inc
>> @@ -294,7 +294,7 @@ B_pn-libice = "${SEPB}"
>>   B_pn-libice-native = "${SEPB}"
>>   B_pn-libid3tag = "${SEPB}"
>>   B_pn-libidn = "${SEPB}"
>> -B_pn-libjson = "${SEPB}"
>> +B_pn-json-c = "${SEPB}"
>>   B_pn-libksba = "${SEPB}"
>>   B_pn-libmad = "${SEPB}"
>>   B_pn-libmatchbox = "${SEPB}"
>> diff --git a/meta/recipes-devtools/json-c/json-c_0.11.bb
>> b/meta/recipes-devtools/json-c/json-c_0.11.bb
>> new file mode 100644
>> index 0000000..59a4b4d
>> --- /dev/null
>> +++ b/meta/recipes-devtools/json-c/json-c_0.11.bb
>> @@ -0,0 +1,16 @@
>> +SUMMARY = "JSON-C implements a reference counting object model that
>> allows you to easily construct JSON objects in C"
>> +HOMEPAGE = "https://github.com/json-c/json-c/wiki"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
>> +
>> +SRC_URI =
>> "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz"
>> +
>> +SRC_URI[md5sum] = "aa02367d2f7a830bf1e3376f77881e98"
>> +SRC_URI[sha256sum] =
>> "28dfc65145dc0d4df1dfe7701ac173c4e5f9347176c8983edbfac9149494448c"
>> +
>> +RPROVIDES_${PN} = "libjson"
>> +
>> +PARALLEL_MAKE = ""
>> +EXTRA_OECONF = "--disable-oldname-compat"
>> +
>> +inherit autotools
>> diff --git a/meta/recipes-devtools/libjson/libjson_0.9.bb
>> b/meta/recipes-devtools/libjson/libjson_0.9.bb
>> deleted file mode 100644
>> index e4951a8..0000000
>> --- a/meta/recipes-devtools/libjson/libjson_0.9.bb
>> +++ /dev/null
>> @@ -1,14 +0,0 @@
>> -DESCRIPTION = "JSON-C - A JSON implementation in C"
>> -HOMEPAGE = "http://oss.metaparadigm.com/json-c/"
>> -
>> -LICENSE = "MIT"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=30a276a476b02c2dcd0849bde417fb17"
>> -
>> -SRC_URI = "http://oss.metaparadigm.com/json-c/json-c-${PV}.tar.gz"
>> -SRC_URI[md5sum] = "3a13d264528dcbaf3931b0cede24abae"
>> -SRC_URI[sha256sum] =
>> "702a486c9bf8e19137d484ab5c49b4ad314eb5e1fe37062a72c0a0fa39439475"
>> -
>> -S = "${WORKDIR}/json-c-${PV}"
>> -
>> -
>> -inherit autotools
>> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>> b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>> index 4c10aa9..475da41 100644
>> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =
>> "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
>>   DEPENDS = "libatomics-ops liboil libsamplerate0 libsndfile1 libtool"
>>   # optional
>>   DEPENDS += "udev alsa-lib glib-2.0 dbus gconf"
>> -DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
>> +DEPENDS += "json-c gdbm speex libxml-parser-perl-native"
>>
>>   inherit autotools pkgconfig useradd gettext perlnative
>>
>>


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

-- 

