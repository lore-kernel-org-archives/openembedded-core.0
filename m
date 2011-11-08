Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RNoff-0003O2-BO
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 17:37:11 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Nov 2011 08:30:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="72345454"
Received: from unknown (HELO [10.255.12.16]) ([10.255.12.16])
	by orsmga002.jf.intel.com with ESMTP; 08 Nov 2011 08:30:49 -0800
Message-ID: <4EB95939.40303@linux.intel.com>
Date: Tue, 08 Nov 2011 08:30:49 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
	<484f22280e380ecdf10dc1bd6b89f69c37be1f68.1320709417.git.josh@linux.intel.com>
	<4EB9546A.7070507@linux.intel.com>
In-Reply-To: <4EB9546A.7070507@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/12] clutter-gst-1.8: add 1.4.2 for use with clutter 1.8
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
X-List-Received-Date: Tue, 08 Nov 2011 16:37:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 08/11/11 08:10, Saul Wold wrote:
> On 11/07/2011 04:10 PM, Joshua Lock wrote:
>> Signed-off-by: Joshua Lock<josh@linux.intel.com>
>> ---
>>   .../clutter/clutter-gst-1.8_1.4.2.bb               |   22
>> ++++++++++++++++++++
>>   .../clutter/clutter-gst/enable_tests-1.8.bb        |   15 +++++++++++++
>>   2 files changed, 37 insertions(+), 0 deletions(-)
>>   create mode 100644
>> meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.2.bb
>>   create mode 100644
>> meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.8.bb
>>
>> diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.2.bb
>> b/meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.2.bb
>> new file mode 100644
>> index 0000000..54b1fc1
>> --- /dev/null
>> +++ b/meta/recipes-graphics/clutter/clutter-gst-1.8_1.4.2.bb
>> @@ -0,0 +1,22 @@
>> +require recipes-graphics/clutter/clutter-gst.inc
>> +
>> +PR = "r0"
>> +
>> +LIC_FILES_CHKSUM =
>> "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
>> +                   
>> file://clutter-gst/clutter-gst.h;beginline=1;endline=24;md5=95baacba194e814c110ea3bdf25ddbf4"
>>
>> +
>> +DEPENDS += "clutter-1.8 gstreamer"
>> +RDEPENDS_${PN} += "gst-meta-base"
>> +
>> +SRC_URI =
>> "http://source.clutter-project.org/sources/clutter-gst/1.4/clutter-gst-${PV}.tar.bz2
>> \
>> +           file://enable_tests-1.8.patch"
>> +
> We seem to be missing the enable_tests-1.8.patch file

It's further down this email, and in master:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=65ce67a64ea0494e388b7f53275c70df71d06a6b

Joshua

> Sau!
> 
> 
>> +S = "${WORKDIR}/clutter-gst-${PV}"
>> +
>> +SRC_URI[md5sum] = "fd6b2a54f43d04382748e9e4d8a335c5"
>> +SRC_URI[sha256sum] =
>> "b0e7ff76ee14307b6d26856972ec9e718f62aec2bc8807fb3f2960e508e578b5"
>> +
>> +do_configure_prepend () {
>> +       # Disable DOLT
>> +       sed -i -e 's/^DOLT//' ${S}/configure.ac
>> +}
>> diff --git
>> a/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.8.bb
>> b/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.8.bb
>> new file mode 100644
>> index 0000000..35e60ca
>> --- /dev/null
>> +++ b/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.8.bb
>> @@ -0,0 +1,15 @@
>> +Install example binary needed for poky-image-clutter
>> +
>> +Signed-off-by: Zhai Edwin<edwin.zhai@intel.com>
>> +Index: clutter-gst-1.3.8/examples/Makefile.am
>> +===================================================================
>> +--- clutter-gst-1.3.8.orig/examples/Makefile.am
>> ++++ clutter-gst-1.3.8/examples/Makefile.am
>> +@@ -1,6 +1,6 @@
>> + NULL = #
>> +
>> +-noinst_PROGRAMS = video-player video-sink video-sink-navigation
>> ++bin_PROGRAMS = video-player video-sink video-sink-navigation
>> +
>> + INCLUDES = -I$(top_srcdir) \
>> +        $(MAINTAINER_CFLAGS) \

-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


