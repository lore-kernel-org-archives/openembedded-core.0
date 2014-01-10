Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 3867E6B89F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 12:51:31 +0000 (UTC)
Received: from [172.16.141.123] (172.16.141.123) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 10 Jan 2014 13:51:27 +0100
Message-ID: <52CFECCF.3090802@enea.com>
Date: Fri, 10 Jan 2014 13:51:27 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20131101174955.09FA3503F0@opal>
In-Reply-To: <20131101174955.09FA3503F0@opal>
X-Originating-IP: [172.16.141.123]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : cross-canadian: Handle powerpc linux verses linux-gnuspe
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
X-List-Received-Date: Fri, 10 Jan 2014 12:51:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-11-01 18:49, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master-next
> Commit: a1d6331238982b0c5d39b0a18794f6654b00d46a
> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=a1d6331238982b0c5d39b0a18794f6654b00d46a
>
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Thu Oct 17 12:22:35 2013 +0100
>
> cross-canadian: Handle powerpc linux verses linux-gnuspe
>
> PowerPC toolchains can use the OS "linux" or "linux-gnuspe". This
> patch links them together so the one cross-canadian toolchain can support
> both.
>
> GCC_FOR_TARGET is set for the GCC recipe as otherwise configure
> can pick up an incorrect value.
>
> [YOCTO #5354]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>

> --- a/meta/classes/cross-canadian.bbclass
> +++ b/meta/classes/cross-canadian.bbclass
> @@ -15,12 +15,30 @@ STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${S
>   # Update BASE_PACKAGE_ARCH and PACKAGE_ARCHS
>   #
>   PACKAGE_ARCH = "${SDK_ARCH}-${SDKPKGSUFFIX}"
> +CANADIANEXTRAOS = ""
>   python () {
>       archs = d.getVar('PACKAGE_ARCHS', True).split()
>       sdkarchs = []
>       for arch in archs:
>           sdkarchs.append(arch + '-${SDKPKGSUFFIX}')
>       d.setVar('PACKAGE_ARCHS', " ".join(sdkarchs))
> +
> +    # PowerPC can build "linux" and "linux-gnuspe"
> +    tarch = d.getVar("TARGET_ARCH", True)
> +    if tarch == "powerpc":
> +        tos = d.getVar("TARGET_OS", True)
> +        if (tos != "linux" and tos != "linux-gnuspe"):
> +            bb.fatal("Building cross-candian powerpc for an unknown TARGET_SYS (%s), please update cross-canadian.bbclass" % d.getVar("TARGET_SYS", True))
> +        # Have to expand DEPENDS before we change the extensions
> +        d.setVar("DEPENDS", d.getVar("DEPENDS", True))
> +        d.setVar("STAGING_BINDIR_TOOLCHAIN", d.getVar("STAGING_BINDIR_TOOLCHAIN", True))
> +        for prefix in ["AR", "AS", "DLLTOOL", "CC", "CXX", "GCC", "LD", "LIPO", "NM", "OBJDUMP", "RANLIB", "STRIP", "WINDRES"]:
> +            n = prefix + "_FOR_TARGET"
> +            d.setVar(n, d.getVar(n, True))
> +
> +        d.setVar("LIBCEXTENSION", "")
> +        d.setVar("ABIEXTENSION", "")
> +        d.setVar("CANADIANEXTRAOS", "linux-gnuspe")
>   }


Hi,

I believe this commit is the cause of some problems I'm seeing with ppc 
SDK toolchain tarballs on poky master.

1. Looks like the relocation scripts fails for environments:

~/tests/poky [master]
$ cat /opt/oel/2014-01-01/environment-setup-ppce500v2-oel-linux | grep "#"
export SDKTARGETSYSROOT=##SDKTARGETSYSROOT##

~/tests/poky [master]
$ cat /opt/oel/2014-01-01/environment-setup-ppce500v2-oel-linux-gnuspe | 
grep "#"

2. SDK gnuspe compiler does not allow -mabi=spe
ABIEXTENSION is zeroed both for linux-gnuspe and linux

3. Compiler can't create executables.
I think this is due to libgcc_s.so from the SDK target sysroot is in 
mabi=spe.

4. -mspe is included in CC var for both linux and gnuspe.

cat /opt/oel/2014-01-01/environment-setup-ppce500v2-oel-linux | grep mabi
export CC="powerpc-oel-linux-gcc  -m32 -mcpu=8548 -mabi=spe -mspe 
-mfloat-gprs=double --sysroot=$SDKTARGETSYSROOT"
export CXX="powerpc-oel-linux-g++  -m32 -mcpu=8548 -mabi=spe -mspe 
-mfloat-gprs=double --sysroot=$SDKTARGETSYSROOT"
export CPP="powerpc-oel-linux-gcc -E  -m32 -mcpu=8548 -mabi=spe -mspe 
-mfloat-gprs=double --sysroot=$SDKTARGETSYSROOT"

Seems to work in dora though,

Any thoughts on this ?

Br,
David


