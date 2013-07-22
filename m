Return-Path: <net147@gmail.com>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1BE13608CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 14:01:55 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id uo1so7076429pbc.31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 07:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=NErLEonwuIpy5plzxuUxHj0In7lleDMNRn+NMsqmxjk=;
	b=O7dT4o7bO4ME/sqkU8PQ0A1XBIvvqdo+A6BHNMW/zmCstz8k/0NYzi4tFErcSkAsZr
	n8hIj1E1t/D6hx+Dxp+pXYLmgMIW2w00erPERb42xuDcJvJ3gcD7Nk5XeD9DOB56GU9+
	e6aik4O2oPXUNcsGCTvynCjebrFEVRlS43zF/db0P5lh9DmZbqUP+X760OEEarN3F+5e
	8JcjxQpaCwHd1v34qwsNxT2gBMFAR/SLZ9T0fBGI0w0V6LfhYmCIrW8Gdr19ynG8cneC
	TkQw0Vo5FI3Avb2ObjHDxPCki+OIZaiEtFjbEe/yEQ2rl9HMXh9PzXfQTqPkwCUfahS7
	B9JA==
X-Received: by 10.66.2.164 with SMTP id 4mr32471745pav.55.1374501715930;
	Mon, 22 Jul 2013 07:01:55 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id x8sm35988849pbb.39.2013.07.22.07.01.53
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 22 Jul 2013 07:01:55 -0700 (PDT)
Message-ID: <51ED3A29.3050601@gmail.com>
Date: Mon, 22 Jul 2013 23:56:57 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1374401262-6077-1-git-send-email-net147@gmail.com>
	<23B07C65-4D10-4A79-9139-6AAB23D34491@gmail.com>
In-Reply-To: <23B07C65-4D10-4A79-9139-6AAB23D34491@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-4.8: fix compiling GCC when /usr/lib/libstdc++.so is present
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
X-List-Received-Date: Mon, 22 Jul 2013 14:01:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 22/07/2013 2:12 AM, Khem Raj wrote:
> On Jul 21, 2013, at 3:07 AM, Jonathan Liu <net147@gmail.com> wrote:
>
>> libtool is picking up libstdc++.so from /usr/lib when trying to link
>> libasan due to libstdc++.la containing libdir="/usr/lib". If compiling
> Can you also see if this change works on target and SDK environments ?
I have build the Yocto Build Appliance (qemux86_64) successfully using 
poky master 31e6eee860b5f9f4ac9ef0889bcff5648de6e3f9 with this patch.
Also, I have built gcc (for qemux86) successfully from the Yocto Build 
Appliance (qemux86_64) by manually cloning poky master 
31e6eee860b5f9f4ac9ef0889bcff5648de6e3f9 with this patch and building 
GCC 4.8.1 through Hob (usually the build appliance uses an older git 
clone of poky that uses GCC 4.7).
Interestingly the build appliance has /usr/lib/libstdc++.so present so 
perhaps this libasan linking issue also affects the build appliance.

The patch only modifies the libtool (2.2) script included with GCC 
sources used for building GCC and not the libtool (2.4) that is used 
elsewhere so its effect should only be limited to building GCC.
I am not sure how to test this change in SDK environment. Could you 
elaborate?

Regards,
Jonathan
>
>> for x86 and the host has 64-bit /usr/lib/libstdc++.so, the compilation
>> fails linking libasan with:
>> /usr/lib/libstdc++.so: could not read symbols: File in wrong format
>>
>> To resolve this, patch libtool to look for the library in the path the
>> .la is contained in rather than use the libdir which usually points to
>> a host path.
>>
>> [YOCTO #4879]
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>> meta/recipes-devtools/gcc/gcc-4.8.inc                 |  1 +
>> .../gcc/gcc-4.8/0041-libtool-avoid-libdir.patch       | 19 +++++++++++++++++++
>> 2 files changed, 20 insertions(+)
>> create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0041-libtool-avoid-libdir.patch
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
>> index dafa241..42355f2 100644
>> --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
>> @@ -70,6 +70,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>> 	   file://0038-gcc-4.8-build-args.patch \
>> 	   file://0039-gcc-4.8-PR57717.patch \
>> 	   file://0040-fix-g++-sysroot.patch \
>> +	   file://0041-libtool-avoid-libdir.patch \
>> 	  "
>> SRC_URI[md5sum] = "3b2386c114cd74185aa3754b58a79304"
>> SRC_URI[sha256sum] = "545b44be3ad9f2c4e90e6880f5c9d4f0a8f0e5f67e1ffb0d45da9fa01bb05813"
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0041-libtool-avoid-libdir.patch b/meta/recipes-devtools/gcc/gcc-4.8/0041-libtool-avoid-libdir.patch
>> new file mode 100644
>> index 0000000..2dd9610
>> --- /dev/null
>> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0041-libtool-avoid-libdir.patch
>> @@ -0,0 +1,19 @@
>> +Avoid using libdir from .la which usually points to a host path
>> +
>> +Upstream-Status: Inappropriate [embedded specific]
>> +Signed-off-by: Jonathan Liu <net147@gmail.com>
>> +
>> +diff --git a/ltmain.sh b/ltmain.sh
>> +index a03433f..1902a90 100644
>> +--- a/ltmain.sh
>> ++++ b/ltmain.sh
>> +@@ -5628,6 +5628,9 @@ func_mode_link ()
>> + 	    absdir="$abs_ladir"
>> + 	    libdir="$abs_ladir"
>> + 	  else
>> ++	    # Instead of using libdir from .la which usually points to a host path,
>> ++	    # use the path the .la is contained in.
>> ++	    libdir="$abs_ladir"
>> + 	    dir="$libdir"
>> + 	    absdir="$libdir"
>> + 	  fi
>> -- 
>> 1.8.3.2
>>


