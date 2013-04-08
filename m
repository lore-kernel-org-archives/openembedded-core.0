Received: from mail-oa0-f43.google.com ([209.85.219.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1UPGx9-00053A-Au
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 20:38:04 +0200
Received: by mail-oa0-f43.google.com with SMTP id l10so6526245oag.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 11:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:date:from:organization:user-agent
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=t34MHxGBBYp9lHC8xDHMU0kKoOiWLwPgV12b+sJTijg=;
	b=Tk6/m3ma+/ImnC29mkGIrGC5m+QlX6xMLYtsZ00kXAS8oMVcfk7PKTLn99r01rrJCO
	rA52NigKvFwgEi6bLUQgFihXExi9LpWGdtJ6smAFEFgD0dSuOKlg9qV3KAy77NFvZMet
	ZIB4czpVA20A/uAg9XJUylQ2E+APAU8s5ONCkorcdYmRwQxdWT3QqubEnMyBOTfq4BgG
	cRjckgHadlh5IsLtqb3Ojmz3GWuloTE8HuO25FPPR4VC/2ORf9hAA2raYqfrDtBQfw/2
	ZB8plhRSMQXNO2fEBmRW/nnyTfMvtmNiV2BUu4Kcjsb8K3X2PegrtkhzfLuE9hDufwQR
	YhNA==
X-Received: by 10.60.117.233 with SMTP id kh9mr8585832oeb.50.1365445244023;
	Mon, 08 Apr 2013 11:20:44 -0700 (PDT)
Received: from [10.6.18.24] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id a3sm26408584oee.8.2013.04.08.11.20.42
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 08 Apr 2013 11:20:43 -0700 (PDT)
Message-ID: <51630A75.2000604@intel.com>
Date: Mon, 08 Apr 2013 11:20:37 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Trevor Woerner <twoerner@gmail.com>
References: <1364949284-32569-1-git-send-email-ronunes@gmail.com>
	<CAHUNapSqp4+8sL6+e_NWUx7GqSZRX1iH_xQTQV19XLciG_C=9g@mail.gmail.com>
In-Reply-To: <CAHUNapSqp4+8sL6+e_NWUx7GqSZRX1iH_xQTQV19XLciG_C=9g@mail.gmail.com>
X-Gm-Message-State: ALoCoQla4hJcNTJnYx6wbIZ74g4pOhC/B7w+Vj+pOIIHcAbcLjwhbHpUHfOQ9Y3eKemUhnJkx5gH
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] alsa-tools: fix build when x11 and gtk+ not available
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
X-List-Received-Date: Mon, 08 Apr 2013 18:38:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/08/2013 06:33 AM, Trevor Woerner wrote:
> With a rather recent HEAD
>
> Build Configuration:
> BB_VERSION        = "1.17.1"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "openSUSE-project-12.3"
> TARGET_SYS        = "x86_64-poky-linux"
> MACHINE           = "qemux86-64"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.3+snapshot-20130407"
> TUNE_FEATURES     = "m64"
> TARGET_FPU        = ""
> meta
> meta-yocto
> meta-yocto-bsp    = "master:813127247a1100b1abe179dfba25795560eac864"
>
> I am able to successfully perform a "bitbake world" on a number of
> different targets:
>
> - qemux86
> - qemuarm
> - qemumips
> - qemux86-64
>
> Unfortunately qemuppcfails when building alsa-tools. Is anyone else
> seeing the same thing?
>
> | make[1]: Entering directory
> `/home/trevor/build/yocto/fullbuild/qemuppc/work/ppc603e-poky-linux/alsa-tools/1.0.26.1-r1/alsa-tools-1.0.26.1/hda-verb'
> | make[1]: warning: jobserver unavailable: using -j1.  Add `+' to parent
> make rule.
> | powerpc-poky-linux-gcc  -m32 -mhard-float  -mcpu=603e
> --sysroot=/home/trevor/build/yocto/fullbuild/qemuppc/sysroots/qemuppc
> -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\"
> -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\"
> -DPACKAGE=\"hda-verb\" -DVERSION=\"0.4\" -DSTDC_HEADERS=1 -I.     -O2
> -Wall -pipe -g -MT hda-verb.o -MD -MP -MF .deps/hda-verb.Tpo -c -o
> hda-verb.o hda-verb.c
> | hda-verb.c:17:20: fatal error: sys/io.h: No such file or directory
> | compilation terminated.
> | make[1]: *** [hda-verb.o] Error 1
> | make[1]: Leaving directory
> `/home/trevor/build/yocto/fullbuild/qemuppc/work/ppc603e-poky-linux/alsa-tools/1.0.26.1-r1/alsa-tools-1.0.26.1/hda-verb'
> | make: *** [all] Error 1
> | ERROR: oe_runmake failed

I recall doing a patch for this, I just reviewed it and it seems I did 
not do the right #if directive.

I was fixing the mips build which had the same problem and did not 
correctly retest.

Patch out shortly.

Sau!



