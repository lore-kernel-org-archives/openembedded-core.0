Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TyfLg-0004bM-3d
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 10:13:24 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0P8vnBZ016366
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 00:57:49 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Fri, 25 Jan 2013 00:57:49 -0800
Message-ID: <5102491B.20603@windriver.com>
Date: Fri, 25 Jan 2013 16:58:03 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1359014474.git.Qi.Chen@windriver.com>
	<c60b41bd635d38aa01ffdd5c6221fd1a9c34b68f.1359014474.git.Qi.Chen@windriver.com>
	<20130124103150.GA3012@jama> <1359027432.3616.7.camel@ted>
	<CAJTo0LY9sXyoe9=rgGtstf3umrA+XeLJ1bDbJkM9S9bsqpA=HQ@mail.gmail.com>
In-Reply-To: <CAJTo0LY9sXyoe9=rgGtstf3umrA+XeLJ1bDbJkM9S9bsqpA=HQ@mail.gmail.com>
X-Originating-IP: [128.224.163.154]
Subject: Re: [PATCH 05/12] volatiles.bbclass: add recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 09:13:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/24/2013 07:45 PM, Burton, Ross wrote:
> On 24 January 2013 11:37, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>>> +inherit ${@base_contains('DISTRO_FEATURES','sysvinit','volatiles_sysvinit','',d)}
>>> Does "inherit " work?
>>>
>>> I mean empty inherit when DISTRO_FEATURES don't contain sysvinit? IIRC
>>> it will fail to parse.
>> The above syntax does now work. A plain "inherit " won't but something
>> with an expression in does get handled correctly. It did not used to
>> work with older bitbake versions.
> The syntax works but that expression won't. If sysvinit was backfilled
> (pending patch from Marcin) because the distribution didn't pick
> sysvinit or systemd explicitly, the backfill happens after this
> expression is parsed.
>
> I'm testing a change where these tests happen against
> DISTRO_FEATURES_INITMAN instead now.
>
> Ross
>
> _

It seems that the backfill happens *before* this expression is parsed.

I tested it with DISTRO_FEATURES explicitly set in local.conf (basically 
the default value, except that it contains no init manager). It worked 
out well.

#
DISTRO ?= "poky"
DISTRO_FEATURES_LIBC_DEFAULT = "ipv4 ipv6 libc-backtrace libc-big-macros 
libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
                     libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt 
libc-fmtmsg libc-fstab libc-ftraverse \
                     libc-getlogin libc-idn libc-inet-anl libc-libm 
libc-libm-big libc-locales libc-locale-code \
                     libc-memusage libc-nis libc-nsswitch libc-rcmd 
libc-rtld-debug libc-spawn libc-streams libc-sunrpc \
                     libc-utmp libc-utmpx libc-wordexp 
libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
                     libc-posix-wchar-io"
DISTRO_FEATURES_LIBC = "${DISTRO_FEATURES_LIBC_DEFAULT}"
DISTRO_FEATURES_LIBC_class-nativesdk = "${DISTRO_FEATURES_LIBC_DEFAULT}"
DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia 
usbgadget usbhost wifi xattr nfs zeroconf pci 3g x11 
${DISTRO_FEATURES_LIBC}"


I also added the following lines to volatiles.bbclass to examine the 
DISTRO_FEATURES when parsing the volatiles.bbclass.

+python __anonymous() {
+    bb.error("DISTRO_FEATURES: %s" % d.getVar('DISTRO_FEATURES', True))
+}
+
  inherit 
${@base_contains('DISTRO_FEATURES','sysvinit','volatiles_sysvinit','',d)}

And the DISTRO_FEATURES contains 'sysvinit'.

ERROR: DISTRO_FEATURES: alsa argp bluetooth ext2 irda largefile pcmcia 
usbgadget usbhost wifi xattr nfs zeroconf pci 3g x11 ipv4 ipv6 
libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets 
libc-charsets libc-crypt libc-crypt-ufc libc-db-aliases libc-envz 
libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse libc-getlogin libc-idn 
libc-inet-anl libc-libm libc-libm-big libc-locales libc-locale-code 
libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug 
libc-spawn libc-streams libc-sunrpc libc-utmp libc-utmpx libc-wordexp 
libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc 
libc-posix-wchar-io pulseaudio sysvinit largefile opengl multiarch

Best Regards,
Chen Qi

> ______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



