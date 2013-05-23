Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 226FC6086B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 23:23:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4NNNoYp023531
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 May 2013 16:23:50 -0700 (PDT)
Received: from msp-dhcp14.wrs.com (172.25.34.14) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 23 May 2013 16:23:48 -0700
Message-ID: <519EA503.4000303@windriver.com>
Date: Thu, 23 May 2013 18:23:47 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Subject: gcc 4.8
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
X-List-Received-Date: Thu, 23 May 2013 23:23:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I found an issue w/ the gcc 4.8 in oe-core as on Monday.  Some of my automated 
build machines are RHEL 5.9 machines.  These boxes have a host compiler that 
does not support -Wno-narrowing and -Wno-overlength-strings.  Unfortunately, 
when building target gcc (via the cross compiler) the system tries to use target 
compiler options on the system host compiler.

I tracked this down to the configure script checks support for those warnings 
(and others), but it only looks with the $CC value.  It then passes these values 
in via LOOSE_WARN and STRICT_WARN.. eventually these go through the system and 
end up in BUILD_COMPILERFLAGS via ALL_CXXFLAGS via WARN_CXXFLAGS via 
GCC_WARN_CXXFLAGS...  So configure checking only the cross compiler is the issue.

Below is the error that I got:

g++  -c   -O2 -pipe -g -fvisibility-inlines-hidden -DIN_GCC   -fno-exceptions 
-fno-rtti -fasynchronous-unwind-tables -W -Wall -Wno-narrowing -Wwrite-strings 
-Wcast-qual -Wmissing-format-attribute -pedantic -Wno-long-long 
-Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H -DGENERATOR_FILE 
-I. -Ibuild 
-I/home/nxadm/nx/yow-blade16.1/builds-2013-05-23-130402/qemuppc_world/bitbake_build/tmp/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc 
-I/home/nxadm/nx/yow-blade16.1/builds-2013-05-23-130402/qemu
ppc_world/bitbake_build/tmp/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/build 
-I/home/nxadm/nx/yow-blade16.1/builds-2013-05-23-130402/qemuppc_world/bitbake_build/tmp/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/../include 
-I/home/nxadm/nx/yow-blade16.1/builds-2013-05-23-130402/qemuppc_world/bitbake_build/tmp/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/../libcpp/include 
 
-I/home/nxadm/nx/yow-blade16.1/builds-2013-05-23-130402/qemuppc_world/bitbake_build/tmp/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/../libdecnumber 

-I/home/nxadm/nx/yow-blade16.1/builds-2013-05-23-130402/qemuppc_world/bitbake_build/tmp/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/../libdecnumber/dpd 
-I../libdecnumber 
-I/home/nxadm/nx/yow-blade16.1/builds-2013-05-23-130402/qemuppc_world/bitbake_build/tmp/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/../libbacktrace 
    \
	-DBASEVER="\"4.8.0\"" -DDATESTAMP="\"\"" \
	-DREVISION="\"\"" \
	-DDEVPHASE="\"\"" -DPKGVERSION="\"(GCC) \"" \
	-DBUGURL="\"<http://gcc.gnu.org/bugs.html>\"" -o build/version.o 
/home/nxadm/nx/yow-blade16.1/builds-2013-05-23-130402/qemuppc_world/bitbake_build/tmp/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/version.c
cc1plus: error: unrecognized command line option "-Wno-narrowing"
cc1plus: error: unrecognized command line option "-Wno-overlength-strings"
make[2]: *** [build/version.o] Error 1
make[2]: *** Waiting for unfinished jobs....
/bin/sh 
/home/nxadm/nx/yow-blade16.1/builds-2013-05-23-130402/qemuppc_world/bitbake_build/tmp/work-shared/gcc-4.8.0-r0/gcc-4.8.0/gcc/../move-if-change 
tmp-optionlist optionlist
echo timestamp > s-options
make[2]: *** wait: No child processes.  Stop.
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory 
`/home/nxadm/nx/yow-blade16.1/builds-2013-05-23-130402/qemuppc_world/bitbake_build/tmp/work/ppc603e-wrs-linux/gcc/4.8.0-r0/gcc-4.8.0/build.powerpc-wrs-linux.powerpc-wrs-linux'

