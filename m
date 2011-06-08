Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QU8BE-0008Gp-Qo
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 04:07:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5824IGg018819
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Jun 2011 19:04:18 -0700 (PDT)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 7 Jun 2011 19:04:17 -0700
Message-ID: <4DEED8A1.8030402@windriver.com>
Date: Wed, 8 Jun 2011 10:04:17 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1307438945.git.kai.kang@windriver.com>	<46fc6e81f626e87f30a0d0980ed2b8fc3747e6be.1307438945.git.kai.kang@windriver.com>
	<BANLkTimSHyuZ38S_bDA=9VSzKhESxxu88g@mail.gmail.com>
In-Reply-To: <BANLkTimSHyuZ38S_bDA=9VSzKhESxxu88g@mail.gmail.com>
X-Originating-IP: [128.224.162.154]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p5824IGg018819
Subject: Re: [PATCH 2/2] eglibc: migrate configurability from oe
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
X-List-Received-Date: Wed, 08 Jun 2011 02:07:37 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B406=E6=9C=8808=E6=97=A5 01:50, Khem Raj wrote:
> On Tue, Jun 7, 2011 at 2:42 AM, Kang Kai<kai.kang@windriver.com>  wrote=
:
>> From: Kang Kai<kai.kang@windriver.com>
>>
>> Migrate configurability from oe, try to shrink minimal image size
>>
>> Update to get eglibc configuration options from DISTRO_FEATURES and en=
able them. All
>> the options are enabled by default.
>>
>> Uncomment the line in conf/local.extended.conf to define DISTRO_FEATUR=
ES, so put
>> what options you want to enable there.
>>
>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
>> ---
>>   meta/conf/distro/include/default-distrovars.inc    |    8 ++-
>>   .../eglibc-2.13-fix-macro-RTLD_DEBUG.patch         |   20 ++++++
>>   meta/recipes-core/eglibc/eglibc-options.inc        |   62 ++++++++++=
++++++++++
>>   meta/recipes-core/eglibc/eglibc.inc                |    6 ++
>>   meta/recipes-core/eglibc/eglibc_2.13.bb            |    4 +-
>>   5 files changed, 98 insertions(+), 2 deletions(-)
>>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/eglibc-2.13-=
fix-macro-RTLD_DEBUG.patch
>>   create mode 100644 meta/recipes-core/eglibc/eglibc-options.inc
>>
>> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/co=
nf/distro/include/default-distrovars.inc
>> index 4b68a0a..16ac681 100644
>> --- a/meta/conf/distro/include/default-distrovars.inc
>> +++ b/meta/conf/distro/include/default-distrovars.inc
>> @@ -10,7 +10,13 @@ LIMIT_BUILT_LOCALES ?=3D "POSIX en_US en_GB"
>>   ENABLE_BINARY_LOCALE_GENERATION ?=3D "1"
>>   LOCALE_UTF8_ONLY ?=3D "0"
>>
>> -DISTRO_FEATURES ?=3D "alsa bluetooth ext2 irda pcmcia usbgadget usbho=
st wifi nfs zeroconf pci"
>> +DISTRO_FEATURES ?=3D "alsa bluetooth ext2 irda pcmcia usbgadget usbho=
st wifi nfs zeroconf pci \
>> +               libc-ipv6 libc-backtrace libc-big-macros libc-bsd libc=
-cxx-tests libc-catgets libc-charsets libc-crypt \
>> +               libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt lib=
c-fmtmsg libc-fstab libc-ftraverse \
>> +               libc-getlogin libc-idn libc-inet libc-inet-anl libc-li=
bm libc-libm-big libc-locales libc-locale-code \
>> +               libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rt=
ld-debug libc-spawn libc-streams libc-sunrpc \
>> +               libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wch=
ar libc-posix-regexp libc-posix-regexp-glibc \
>> +               libc-posix-wchar-io"
>>

Hi Khem,
> libc-ipv6 should be merged with existing ipv6 DISTRO_FEATURE we do not
> need two keywords for same feature
> we also need documentation on these features and probably mention in
> local.conf.sample or may be a new file
> for adavanced configuration
>
I put some information in conf/local.extended.conf in my first patch.

diff --git a/meta-yocto/conf/local.conf.sample.extended b/meta-yocto/conf=
/local.conf.sample.extended
new file mode 100644
index 0000000..048d641
--- /dev/null
+++ b/meta-yocto/conf/local.conf.sample.extended
@@ -0,0 +1,5 @@
+# eglibc configurability is used to reduce minimal images's size.
+# the all supported eglibc options are default enabled by adding
+# to DISTRO_FEATURES in default-distrovars.inc
+# put the options what you want to enable below and uncomment it
+#DISTRO_FEATURES =3D "alsa bluetooth ext2 irda pcmcia usbgadget usbhost =
wifi nfs zeroconf pci"


Is that enough or not?

Thanks and Regards,
Kai



