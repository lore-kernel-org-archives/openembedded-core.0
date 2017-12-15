Return-Path: <linus.svensson@axis.com>
X-Greylist: delayed 470 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 15 Dec 2017 16:09:35 UTC
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 09C2B78824
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 16:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 4B79518454
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 17:01:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id OlhaGerGrYsY
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 17:01:43 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 9CBAD18440
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 17:01:43 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 83E9D1E074
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 17:01:43 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 78FD51E05C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 17:01:43 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 17:01:43 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 6DAB42FFC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 17:01:43 +0100 (CET)
Received: from [10.94.48.1] (10.0.5.60) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 15 Dec 2017 17:01:41 +0100
To: <openembedded-core@lists.openembedded.org>
References: <cover.1510920094.git.alexander.kanavin@linux.intel.com>
	<9f035d6ed0e27ff91e41b67dab0ae852e96c8232.1510920094.git.alexander.kanavin@linux.intel.com>
	<CAJ86T=Xk+1sKXvfq3EfEwOuwfuPDeW72G0GSdQtqgTKieLH3JQ@mail.gmail.com>
	<1513351792.21903.53.camel@andred.net>
From: Linus Svensson <linus.svensson@axis.com>
Message-ID: <5A33F1E3.8020205@axis.com>
Date: Fri, 15 Dec 2017 17:01:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1513351792.21903.53.camel@andred.net>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX04.axis.com (10.0.5.18) To XBOX03.axis.com (10.0.5.17)
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 1/9] meson: add a recipe and class from meta-oe
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
X-List-Received-Date: Fri, 15 Dec 2017 16:09:36 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit

On 12/15/2017 04:29 PM, André Draszik wrote:
> On Thu, 2017-12-07 at 11:27 -0800, Andre McCurdy wrote:
>>> +MESON_TARGET_ENDIAN = "${@bb.utils.contains('TUNE_FEATURES',
>>> 'bigendian', 'big', 'little', d)}"
>> This won't work for all targets (e.g. PowerPC is big endian but
>> doesn't include "bigendian" in TUNE_FEATURES). To determine the
>> endianness of the target, use SITEINFO_ENDIANNESS instead.
> ${MESON_TARGET_ENDIAN} is used inside a [target_machine] statement, though.
> Not sure about the naming and intention here...
meson define host,target and build the same way as autotools do.
meson will fetch information about the build machine from the environment
and host/target is specified in the cross-file. The intention with this
statement is to specify the endianness for the target system. Is that
information available in oe?

 From mesonbuild.com:
target machine is the machine on which the compiled binary's output will run
(this is only meaningful for programs such as compilers that, when run,
produce object code for a different CPU than what the program is being 
run on)

/Linus

