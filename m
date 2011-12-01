Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RWAdD-00085m-PD
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 18:41:14 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 3C49311000B4;
	Thu,  1 Dec 2011 18:34:32 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 0FEE311000B0;
	Thu,  1 Dec 2011 18:34:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (f052225171.adsl.alicedsl.de
	[78.52.225.171]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Thu,  1 Dec 2011 18:34:30 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id BB16C3C49D; Thu,  1 Dec 2011 18:34:29 +0100 (CET)
Date: Thu, 1 Dec 2011 18:34:29 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Ulf Samuelsson <openembedded-core@emagii.com>
Message-ID: <20111201173429.GC4447@mail.familie-heinold.de>
References: <4EC24711.2010805@eukrea.com>
	<CAOd_LFzLRF3VvbQqrGekjtLSvfyXHQHeKyd=QcnAUFQpaGg8uA@mail.gmail.com>
	<1322743693.17484.120.camel@ted>
	<CAOd_LFwOiy9hR0M9FjRE5xRdN-HLwQUpMsWqiNKppr6QjvjzKw@mail.gmail.com>
	<4ED7A46E.2030603@emagii.com>
MIME-Version: 1.0
In-Reply-To: <4ED7A46E.2030603@emagii.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Reproducible build problem with BB_NUMBER_THREADS=8
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
X-List-Received-Date: Thu, 01 Dec 2011 17:41:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> #	source='libcg_ba.cpp' object='libcg_ba.o' libtool=no 
> arm-angstrom-linux-gnueabi-g++  -march=armv5te  -mno-thumb -mthumb-interwork  -mtune=arm926ej-s -mthumb-interwork -mno-thumb --sysroot=/media/SSD/OE_core/setup-scripts/build/tmp-angstrom_2010_x-eglibc/sysroots/qemuarm -DHAVE_CONFIG_H -I. -I.. -I../include    -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden -fvisibility-inlines-hidden -c -o libcg_ba.o libcg_ba.cpp
> libcg_ba.cpp:18:18: fatal error: string: No such file or directory
> compilation terminated.

Hi Ulf,

that does not look like the BB_THREAD bug.  It is more the wrong c++ include dir bug, when --sysroot is not used.

Problem is in gcc-cross-configure.inc:

EXTRA_OECONF_PATHS = "--with-local-prefix=${STAGING_DIR_TARGET}${target_exec_prefix} \
                      --with-gxx-include-dir=${target_includedir}/c++ \

which results in c++ defaultheadersearchdir "...../usr/bin/usr/include/c++" and so the the string c++ header is not found.

Bye Henning


