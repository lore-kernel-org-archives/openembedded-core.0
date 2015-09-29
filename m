Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6FB0077002
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 18:11:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8TIBlLv027340
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Sep 2015 11:11:47 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Tue, 29 Sep 2015 11:11:47 -0700
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1443533187.5162.34.camel@linuxfoundation.org>
	<350A363C-E3A9-4ED3-BCE9-83623AC94092@gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
X-Enigmail-Draft-Status: N1110
Organization: Wind River Systems
Message-ID: <560AD462.4080501@windriver.com>
Date: Tue, 29 Sep 2015 13:11:46 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <350A363C-E3A9-4ED3-BCE9-83623AC94092@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] prelink: Allow it to work on 64 bit binaries in /lib
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
X-List-Received-Date: Tue, 29 Sep 2015 18:11:51 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 9/29/15 12:12 PM, Khem Raj wrote:
> 
>> On Sep 29, 2015, at 6:26 AM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>
>> Checks within prelink force 64 bit binaries into lib64 and n32 binaries
>> into lib32. We load prelink.conf with all combinations but this code
>> then defeats it for us and means /lib is ignored.
>>
>> Comment out this code to disable it and allow our settings to work. This
>> allows 64 bit binaries in /lib to work. We pass in the correct dyanamic
>> loader path anyhow and our binaries don't contain ld.so so this should
>> be safe for us.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> diff --git a/meta/recipes-devtools/prelink/prelink/64bitfix.patch b/meta/recipes-devtools/prelink/prelink/64bitfix.patch
>> new file mode 100644
>> index 0000000..74b1a7d
>> --- /dev/null
>> +++ b/meta/recipes-devtools/prelink/prelink/64bitfix.patch
>> @@ -0,0 +1,35 @@
>> +These checks force 64 bit binaries into lib64 and n32 binaries into lib32. We
>> +load prelink.conf with all combinations but this code then defeats it for us
>> +and means /lib is ignored.
>> +
>> +Comment out this code to disable it and allow our settings to work. This
>> +allows 64 bit binaries in /lib to work. We pass in the correct dyanamic
>> +loader path anyhow and our binaries don't contain ld.so so this should be
>> +safe for us.
>> +
>> +Upstream-Status: Inappropriate
>> +RP 2015/9/23
>> +
>> +
>> +Index: trunk/src/rtld/rtld.c
>> +===================================================================
>> +--- trunk.orig/src/rtld/rtld.c
>> ++++ trunk/src/rtld/rtld.c
>> +@@ -334,7 +334,7 @@ load_ld_so_conf (int use_64bit, int use_
>> +
>> +   /* Only use the correct machine, to prevent mismatches if we
>> +      have both /lib/ld.so and /lib64/ld.so on x86-64.  */
>> +-  if (use_64bit)
>> ++  /*if (use_64bit)
> 
> may be it would be good to use it as fallback if nothing comes out of prelink.conf
> such a patch would be acceptable upstream too.

This is the emulated rtld that prelink uses.  It's only in the cross-prelink.

As far as I can tell the previous 'upstream prelink' is abandon-ware now.. so
cross-prelink is more or less the new (final) upstream.

This code block is from the original (cross) prelink work done back in roughly
2006.  Obviously things have changed a bit since then.

However, this code will break the normal multilib use-case.  So I don't think it
can be generically applied.

The dst_LIB value being set to only 'lib' won't be set properly.  (dst_LIB is
used when executables or libraries have embedded '$LIB', this is similar to
$PLATFORM, or $ORIGIN...)  So any executables using it in their internal search
paths will reference the wrong values in a any config where 'libdir' isn't '/lib'.

The 'ld_dirs' is used by the dynamic search capabilities of the emulated rtld.
So when something says give me "libfoo.so.1".  It uses the ld_dirs to search for
the library.  Again if the libdir is not '/lib' then it won't find the libraries
and prelinking may abort for that particular item.

>> +     {
>> +       dst_LIB = "lib64";
>> +       add_dir (&ld_dirs, "/lib64/tls", strlen ("/lib64/tls"));
>> +@@ -350,7 +350,7 @@ load_ld_so_conf (int use_64bit, int use_
>> +       add_dir (&ld_dirs, "/usr/lib32/tls", strlen ("/usr/lib32/tls"));
>> +       add_dir (&ld_dirs, "/usr/lib32", strlen ("/usr/lib32"));
>> +     }
>> +-  else
>> ++  else*/
>> +     {
>> +       dst_LIB = "lib";
>> +       add_dir (&ld_dirs, "/lib/tls", strlen ("/lib/tls"));

If we were to only comment out the last 'else'.  We still have the dst_LIB issue
as mentioned above.. (what is the right value?)

It also open up the possibility though where the system has a flaw -- where an
ELF64/ELF N32 is on the system and asks for libfoo.so.1, but that was not
installed for the 64-bit/n32 system.  It will fall back and find it in the
'32-bit' side and use that for the processing....  (I'm not sure if prelink has
the ability to detect that there is a mismatch between the two executables.)

The rtld as far as I can remember does nothing globally to make sure that the
binaries are all for the same machine type... (this may be a bug that could be
easily fixed given a good test case, like what I suggested above.  Pull the
machine from the executable and skip any libraries that are not of the same
machine type....)


An alternative to all of this would be only applying the path if BASELIB == lib?

--Mark

>> diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
>> index 79a5f501..0cbce36 100644
>> --- a/meta/recipes-devtools/prelink/prelink_git.bb
>> +++ b/meta/recipes-devtools/prelink/prelink_git.bb
>> @@ -27,6 +27,7 @@ FILES_${PN}-cron = "${sysconfdir}/cron.daily ${sysconfdir}/default"
>> PACKAGES =+ "${PN}-cron"
>>
>> SRC_URI = "git://git.yoctoproject.org/prelink-cross.git;branch=cross_prelink \
>> +           file://64bitfix.patch \
>>            file://prelink.conf \
>>            file://prelink.cron.daily \
>>            file://prelink.default \
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 
> 


