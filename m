Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SZRRL-0006dI-Do
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 20:46:43 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4TIaOU4012765
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 11:36:24 -0700 (PDT)
Received: from msp-dhcp40.wrs.com (172.25.34.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 29 May 2012 11:36:23 -0700
Message-ID: <4FC51727.6020205@windriver.com>
Date: Tue, 29 May 2012 13:36:23 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <E071AE73-05A7-4D16-9442-952E65ECA96C@gmail.com>
In-Reply-To: <E071AE73-05A7-4D16-9442-952E65ECA96C@gmail.com>
Subject: Re: meta-xilinx: ERROR: Failure expanding variable TUNE_PKGARCH ppc440
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
X-List-Received-Date: Tue, 29 May 2012 18:46:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/29/12 1:20 PM, Elvis Dowson wrote:
> Hi,
> I've added the meta-xilinx layer, and modified my build/conf/local.conf file as
> follows:
>
> # Set the target machine details
> MACHINE ?= "virtex5"
> # Set Xilinx Platform Studio hardware project path
> XILINX_BSP_PATH ?= "/project/xilinx-ml507"
> # Set target board
> XILINX_BOARD ?= "ml507"
>
> and when I try to build the meta-toolchain
>
> $ cd /tool/yocto/poky
> $ source oe-init-build-env build
> $ bitbake meta-toolchain
>
> I get the following errors:
>
> ERROR: Execution of event handler 'check_sanity_eventhandler' failed
> Traceback (most recent call last):
> File "/tool/yocto/poky/bitbake/lib/bb/utils.py", line 397, in
> better_eval(source=<code object <module> at 0x344b6b0, file "MACHINE_ARCH", line
> 1>, locals={'d': <bb.data_smart.DataSmart object at 0x1450050>}):
> def better_eval(source, locals):
>  > return eval(source, _context, locals)
> File "MACHINE_ARCH", line 1, in <module>
> File "/tool/yocto/poky/bitbake/lib/bb/data_smart.py", line 282, in
> DataSmart.getVar(var='TUNE_PKGARCH', expand=True, noweakdefault=False):
> if expand and value:
>  > return self.expand(value, var)
> return value
> File "/tool/yocto/poky/bitbake/lib/bb/data_smart.py", line 151, in
> DataSmart.expand(s='${@bb.utils.contains("TUNE_FEATURES", "ppc440", "ppc440",
> "${PPCPKGARCH}", d)}', varname='TUNE_PKGARCH'):
> def expand(self, s, varname = None):
>  > return self.expandWithRefs(s, varname).value
> File "/tool/yocto/poky/bitbake/lib/bb/data_smart.py", line 141, in
> DataSmart.expandWithRefs(s='${@bb.utils.contains("TUNE_FEATURES", "ppc440",
> "ppc440", "${PPCPKGARCH}", d)}', varname='TUNE_PKGARCH'):
> except Exception as exc:
>  > raise ExpansionError(varname, s, exc)
> ExpansionError: Failure expanding variable TUNE_PKGARCH, expression was
> ${@bb.utils.contains("TUNE_FEATURES", "ppc440", "ppc440", "${PPCPKGARCH}", d)}
> which triggered exception SyntaxError: EOL while scanning string literal
> (TUNE_PKGARCH, line 1)
>
> ERROR: Failure expanding variable TUNE_PKGARCH, expression was
> ${@bb.utils.contains("TUNE_FEATURES", "ppc440", "ppc440", "${PPCPKGARCH}", d)}
> which triggered exception SyntaxError: EOL while scanning string literal
> (TUNE_PKGARCH, line 1)
> ERROR: Command execution failed: Exited with 1
>
> Summary: There were 3 ERROR messages shown, returning a non-zero exit code.
>
> Has support for the PowerPC440 processor (present in the Virtex-5 FPGA) been
> removed from the newer gcc-versions?

The error above is an issue w/ the tune configuration.  In stock oe-core there 
is no 405/440 configuration.

You will need to create a new tune file, see 
meta/conf/machine/include/tune-ppc603e.inc as a reasonable example..

--Mark

> Best regards,
>
> Elvis Dowson
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



