Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 855DC76F8C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 09:40:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id DF8F3608B90
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1445010332.git.joshua.lock@collabora.co.uk>
	<cover.1445010543.git.joshua.lock@collabora.co.uk>
	<013344f3d3f8c35ecb40bb8282b05d6262927b73.1445010543.git.joshua.lock@collabora.co.uk>
	<F5A83BC1-2C25-4C65-9298-066627AFF5E8@gmail.com>
From: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <56260C1D.9020901@collabora.co.uk>
Date: Tue, 20 Oct 2015 10:40:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <F5A83BC1-2C25-4C65-9298-066627AFF5E8@gmail.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 20 Oct 2015 09:40:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/10/15 04:23, Khem Raj wrote:
>
>> On Oct 16, 2015, at 8:51 AM, Joshua Lock <joshua.lock@collabora.co.uk> wrote:
>>
>> There are recipes in the Core metadata that have optional systemd
>> support but expect the old, separate, libsystemd-foo pkg-config files
>> (not the newer unified libsystemd).
>>
>> Add a PACKAGECONFIG option to build systemd with the compatibility
>> pc files and default to enabling this option so that we can make use of
>> them in the weston recipe.
>>
>> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
>> ---
>> meta/recipes-core/systemd/systemd_225.bb | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
>> index c2dad58..594c5aa 100644
>> --- a/meta/recipes-core/systemd/systemd_225.bb
>> +++ b/meta/recipes-core/systemd/systemd_225.bb
>> @@ -58,7 +58,7 @@ LDFLAGS_append_libc-uclibc = " -lrt"
>>
>> GTKDOC_DOCDIR = "${S}/docs/"
>>
>> -PACKAGECONFIG ??= "xz ldconfig \
>> +PACKAGECONFIG ??= "xz ldconfig compat \
>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
>> @@ -89,6 +89,7 @@ PACKAGECONFIG[ldconfig] = "--enable-ldconfig,--disable-ldconfig,,"
>> PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
>> PACKAGECONFIG[valgrind] = "ac_cv_header_valgrind_memcheck_h=yes ac_cv_header_valgrind_valgrind_h=yes ,ac_cv_header_valgrind_memcheck_h=no ac_cv_header_valgrind_valgrind_h=no ,valgrind"
>> PACKAGECONFIG[qrencode] = "--enable-qrencode,--disable-qrencode,qrencode"
>> +PACKAGECONFIG[compat] = "--enable-compat-libs,--disable-compat-libs”
>
> I would rather expect this to not be there in first place, if its needed for some, then lets not enable it by default
> what would it take to fix weston ?

Very little effort, it seems - the backport for Weston is trivial.

I'll prepare a v2 series where this PACKAGECONFIG is added but not 
enabled by default and add an extra change to backport the weston 
configure.ac update for the new libsystemd pkg-config.

Regards,

Joshua


