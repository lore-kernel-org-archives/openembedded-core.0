Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 085C770262
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 21:22:01 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 32667F81202; Mon, 14 Jul 2014 15:22:01 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id A2B90F811FF;
	Mon, 14 Jul 2014 15:21:59 -0600 (MDT)
Message-ID: <53C449F8.4030504@mlbassoc.com>
Date: Mon, 14 Jul 2014 15:22:00 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <53C00B20.7060204@mlbassoc.com> <53C434D9.7000704@windriver.com>
In-Reply-To: <53C434D9.7000704@windriver.com>
Subject: Re: rpm-native build error
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
X-List-Received-Date: Mon, 14 Jul 2014 21:22:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-07-14 13:51, Mark Hatle wrote:
> On 7/11/14, 11:04 AM, Gary Thomas wrote:
>> I'm getting a build error on rpm-native on my venerable Fedora-13
>> based builder (which I am loathe to update/replace).  This probably
>> happened with the update to 5.4.14 but I didn't notice until now
>> as I was away on holiday.  Here are the details:
>
> Latest rpm uses C++ to link a few components.  (It doesn't use the C++ type library though!)
>
> So I'm a bit confused by it trying to link libstdc++.so.6.
>
> I don't think I have a F-13 machine anymore, I replaced mine finally a couple of months ago.  The only thing I can suggest is to look at the makefile and see about linking (and
> compiling) the components with gcc instead of g++.  It -might- be a simple patch the makefile.

Thanks, I'll give it a try.

>> | /usr/bin/ld: rpm.o: undefined reference to symbol '__gxx_personality_v0@@CXXABI_1.3'
>> | /usr/bin/ld: note: '__gxx_personality_v0@@CXXABI_1.3' is defined in DSO /usr/lib/libstdc++.so.6 so try adding it to the linker command line
>> | /usr/lib/libstdc++.so.6: could not read symbols: Invalid operation
>> | collect2: ld returned 1 exit status
>> | make[2]: *** [rpm] Error 1
>> | make[2]: *** Waiting for unfinished jobs....
>> | /usr/bin/ld: rpmbuild.o: undefined reference to symbol '__gxx_personality_v0@@CXXABI_1.3'
>> | /usr/bin/ld: note: '__gxx_personality_v0@@CXXABI_1.3' is defined in DSO /usr/lib/libstdc++.so.6 so try adding it to the linker command line
>> | /usr/lib/libstdc++.so.6: could not read symbols: Invalid operation
>> | collect2: ld returned 1 exit status
>> | make[2]: *** [rpmbuild] Error 1
>> | make[2]: Leaving directory `/home/local/imx53_2014-07-12/tmp/work/i686-linux/rpm-native/5.4.14-r0/build'
>> | make[1]: *** [all-recursive] Error 1
>> | make[1]: Leaving directory `/home/local/imx53_2014-07-12/tmp/work/i686-linux/rpm-native/5.4.14-r0/build'
>> | make: *** [all] Error 2
>> | ERROR: oe_runmake failed
>> | WARNING: /home/local/imx53_2014-07-12/tmp/work/i686-linux/rpm-native/5.4.14-r0/temp/run.do_compile.18609:1 exit 1 from
>> |   exit 1
>> | ERROR: Function failed: do_compile (log file is located at /home/local/imx53_2014-07-12/tmp/work/i686-linux/rpm-native/5.4.14-r0/temp/log.do_compile.18609)
>> ERROR: Task 382 (virtual:native:/home/local/poky-cutting-edge/meta/recipes-devtools/rpm/rpm_5.4.14.bb, do_compile) failed with exit code '1'
>>
>> My configuration is:
>> BB_VERSION        = "1.23.1"
>> BUILD_SYS         = "i686-linux"
>> NATIVELSBSTRING   = "Fedora-13"
>> TARGET_SYS        = "arm-amltd-linux-gnueabi"
>> MACHINE           = "imx53qsb"
>> DISTRO            = "amltd"
>> DISTRO_VERSION    = "1.6+snapshot-20140711"
>> TUNE_FEATURES     = "arm armv7a vfp neon"
>> TARGET_FPU        = "vfp-neon"
>> meta              = "master:1cb9f7b00b5ede62a9546c39d798c876775b08c0"
>> meta-oe-local     = "master:7dd439b185ccb0de3bb8311122d79e13e8fc2fef"
>> meta-amltd        = "master:0b6506b9505e8274110f1a011372c215b517f947"
>> meta-imx6         = "master:fbfbc3ced45619c9f27c0f0694289b97ae935e73"
>> meta-fsl-arm      = "master:3941fe0fda4ac9ef372699160133c92ebf4df4e8"
>> meta-fsl-arm-extra = "master:456c27085a70bb1385a4c2e28ba80ac74d6f533e"
>>
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

