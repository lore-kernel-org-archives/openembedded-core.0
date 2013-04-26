Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UVjLL-0003jL-Hm
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 16:09:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3QDpwKN025741
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2013 06:51:58 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Fri, 26 Apr 2013 06:51:57 -0700
Message-ID: <517A867E.3030708@windriver.com>
Date: Fri, 26 Apr 2013 08:51:58 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <20130426092655.1d0ffdb2@e6520eb>
In-Reply-To: <20130426092655.1d0ffdb2@e6520eb>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	r3QDpwKN025741
Subject: Re: dylan: meta-toolchain and u-boot : "cannot find -lgcc"
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
X-List-Received-Date: Fri, 26 Apr 2013 14:09:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 4/26/13 2:26 AM, Eric B=E9nard wrote:
> Hi,
>
> here is a problem I met while trying to build u-boot with a toolchain
> generated using dylan.
>
> steps to reproduce :
> - bitbake meta-toolchain for an armv5t target
>
> - install the sdk to a custom path ($HOME/oecore-x86_64/ for example
>    instead of /usr/local/oecore-x86_64/
>
> - get u-boot :
> git clone git://git.denx.de/u-boot.git
> source ~/oecore-x86_64/environment-setup-armv5te-oe-linux-gnueabi
> make LDFLAGS=3D"" ARCH=3Darm CROSS_COMPILE=3Darm-oe-linux-gnueabi-
>    da850evm_config
> make LDFLAGS=3D"" ARCH=3Darm CROSS_COMPILE=3Darm-oe-linux-gnueabi-
>
> you will get :
> arm-oe-linux-gnueabi-gcc -E -g  -Os   -fno-common -ffixed-r8 -msoft-flo=
at  -D__KERNEL__ -ffunction-sections -fdata-sections -DCONFIG_SYS_TEXT_BA=
SE=3D0xc1080000 -DCONFIG_SPL_TEXT_BASE=3D0x80000000 -DCONFIG_SPL_PAD_TO=3D=
0 -DCONFIG_SPL_BUILD -I/data/testdylan/tmp/u-boot/include -fno-builtin -f=
freestanding -nostdinc -isystem /data/testdylan/oecore-x86_64/sysroots/x8=
6_64-oesdk-linux/usr/bin/armv5te-oe-linux-gnueabi/../../lib/armv5te-oe-li=
nux-gnueabi/gcc/arm-oe-linux-gnueabi/4.7.2/include -pipe  -DCONFIG_ARM -D=
__ARM__ -marm -mno-thumb-interwork -mabi=3Daapcs-linux -march=3Darmv5te -=
include /data/testdylan/tmp/u-boot/include/u-boot/u-boot.lds.h -include /=
data/testdylan/tmp/u-boot/include/config.h -DCPUDIR=3Darch/arm/cpu/arm926=
ejs  -I/data/testdylan/tmp/u-boot/spl/. -ansi -D__ASSEMBLY__ -P - < /data=
/testdylan/tmp/u-boot/board/davinci/da8xxevm/u-boot-spl-da850evm.lds > /d=
ata/testdylan/tmp/u-boot/spl/u-boot-spl.lds
> cd /data/testdylan/tmp/u-boot/spl/ && arm-oe-linux-gnueabi-ld.bfd  -T /=
data/testdylan/tmp/u-boot/spl/u-boot-spl.lds --gc-sections -Bstatic -Ttex=
t 0x80000000 arch/arm/cpu/arm926ejs/start.o --start-group arch/arm/cpu/ar=
m926ejs/davinci/libdavinci.o arch/arm/cpu/arm926ejs/libarm926ejs.o arch/a=
rm/lib/libarm.o board/davinci/da8xxevm/libda8xxevm.o common/libcommon.o c=
ommon/spl/libspl.o drivers/mtd/spi/libspi_flash.o drivers/serial/libseria=
l.o drivers/spi/libspi.o lib/libgeneric.o --end-group /data/testdylan/tmp=
/u-boot/spl/arch/arm/lib/eabi_compat.o -L . -lgcc -Map u-boot-spl.map -o =
u-boot-spl
> arm-oe-linux-gnueabi-ld.bfd: cannot find -lgcc
>
> this can be fixed by installing the sdk to it's standard path
> (/usr/local/oecore-x86_64/ in the present case).
>
> Is that an expected behaviour (as the sdk is primarly designed to build
> applications) or can that be fixed during the sdk relocation ?

When you use the SDK, you need to be sure to source the SDK environment s=
etup.=20
Once you do that, pass to the compiler/linker the included CFLAGS and LDF=
LAGS as=20
specified in that environment file.

They should end up passing at some point a --sysroot=3D... and that will =
tell gcc=20
where the libraries and headers are for linking.  Without the --sysroot=3D=
 option,=20
the compiler has no choice but to look for it's original compilation dire=
ctory.

--Mark

> Thanks,
> Eric
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



