Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 4945C75D4A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 19:52:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 609B7608E7A
To: openembedded-core@lists.openembedded.org
References: <cover.1445010543.git.joshua.lock@collabora.co.uk>
	<013344f3d3f8c35ecb40bb8282b05d6262927b73.1445010543.git.joshua.lock@collabora.co.uk>
	<20151019125722.GC16160@ad.chargestorm.se>
From: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <56254A15.20701@collabora.co.uk>
Date: Mon, 19 Oct 2015 20:52:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151019125722.GC16160@ad.chargestorm.se>
Subject: Re: [PATCH 1/6] systemd: build with compatibility libraries
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
X-List-Received-Date: Mon, 19 Oct 2015 19:52:57 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 19/10/15 13:57, Anders Darander wrote:
> * Joshua Lock <joshua.lock@collabora.co.uk> [151016 17:52]:
>
>> There are recipes in the Core metadata that have optional systemd
>> support but expect the old, separate, libsystemd-foo pkg-config files
>> (not the newer unified libsystemd).
>
> Any size impact? Just wondering as you're changing the default.
> (Assuming that it was off by default previously?)

The compat-libs (libsystemd-daemon libsystemd-login libsystemd-journal 
libsystemd-id128) are packaged separately, so you only see an increase 
in image size if something pulls them in to your image.

The -dev, -dbg and -ptest package sizes all increase slightly:

joshuagl@owlbear:/srv/build/systemd-size$ buildhistory-diff -a | grep 
PKGSIZE
packages/i586-poky-linux/systemd/systemd-dbg: PKGSIZE changed from 
54364265 to 55148696 (+1%)
packages/i586-poky-linux/systemd/systemd-dev: PKGSIZE changed from 98921 
to 105487 (+6%)
packages/i586-poky-linux/systemd/systemd-ptest: PKGSIZE changed from 
3156181 to 3156103 (0%)

Regards,

Joshua

>
> Cheers,
> Anders
>
>
>> -PACKAGECONFIG ??= "xz ldconfig \
>> +PACKAGECONFIG ??= "xz ldconfig compat \
>>                      ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
>>                      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
>>                      ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
>> @@ -89,6 +89,7 @@ PACKAGECONFIG[ldconfig] = "--enable-ldconfig,--disable-ldconfig,,"
>>   PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
>>   PACKAGECONFIG[valgrind] = "ac_cv_header_valgrind_memcheck_h=yes ac_cv_header_valgrind_valgrind_h=yes ,ac_cv_header_valgrind_memcheck_h=no ac_cv_header_valgrind_valgrind_h=no ,valgrind"
>>   PACKAGECONFIG[qrencode] = "--enable-qrencode,--disable-qrencode,qrencode"
>> +PACKAGECONFIG[compat] = "--enable-compat-libs,--disable-compat-libs"
>
>>   CACHED_CONFIGUREVARS += "ac_cv_path_KILL=${base_bindir}/kill"
>>   CACHED_CONFIGUREVARS += "ac_cv_path_KMOD=${base_bindir}/kmod"


