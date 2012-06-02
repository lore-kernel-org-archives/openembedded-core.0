Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SawdC-0003w1-GJ
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Jun 2012 00:17:10 +0200
Received: by wgbdr1 with SMTP id dr1so2737045wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jun 2012 15:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=M3ZrlVl+MDcUbOfwR5FRAWQQyL5vKG96kHdhqmyDv34=;
	b=l/vYZlwiIJHsJN/47cq0kIHOuXRt+Up0oHf0OJKIReGGjvrHnBolD4JuzYJUPvn3OR
	Mhiq0TMeVny2FHzEUKR4/W3MRZvhWnFSXAB++4l9Hg7gSeGU4MeP2Vt96HNhHtZD9rlr
	Jofq47JE0R+GTGEd6U3qqW5XbwWX3youptahmHjv4X6agvPMdkGdAIaIA41bwMUGgTb6
	uj8cvMvlTFPPIayjzndM96j4QJ0F2RXedudaKGP3vLxSkBdSWjix+Pi0fShd56QZ0h4p
	RWpJZH80oA/bM33T5peEfzTwZ1ziUZsy1WNrEGInXpUTXhl+yBja4VmQC7yMtQacXCyM
	HG1g==
Received: by 10.216.143.213 with SMTP id l63mr6334044wej.117.1338674807780;
	Sat, 02 Jun 2012 15:06:47 -0700 (PDT)
Received: from [192.168.1.35] (197.Red-79-150-15.dynamicIP.rima-tde.net.
	[79.150.15.197])
	by mx.google.com with ESMTPS id gv7sm7963437wib.4.2012.06.02.15.06.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 15:06:47 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <56B3703F-09C3-4A9E-BF97-17DBBBE8C9AF@gmail.com>
Date: Sun, 3 Jun 2012 00:06:44 +0200
Message-Id: <A9C91AFD-F965-453F-A418-981EB6399247@gmail.com>
References: <56B3703F-09C3-4A9E-BF97-17DBBBE8C9AF@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
Subject: Re: [meta-xilinx] How to debug the value of ${TARGET_ARCH} in meta-xilinx/classes/xilinx-boot.class
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
X-List-Received-Date: Sat, 02 Jun 2012 22:17:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

On Jun 2, 2012, at 10:36 PM, Elvis Dowson wrote:

> How can I debug the value of ${TARGET_ARCH} in =
meta-xilinx/classes/xilinx-boot.class, for the following function:
>=20
> do_export_xparam() {
> bbnote "Replacing xparameters header to match hardware model"
> xparam=3D$1
> if [ "${TARGET_ARCH}" =3D=3D "powerpc" ]; then
> 	cpu=3D"PPC`echo ${TARGET_CPU} | tr '[:lower:]' '[:upper:]'`"
> else
> 	cpu=3D`echo ${TARGET_CPU} | tr '[:lower:]' '[:upper:]'`
> fi
> cp ${xparam} ${S}/board/xilinx/${XILINX_BOARD}
> echo "/*** Cannonical definitions ***/
> #define XPAR_PLB_CLOCK_FREQ_HZ XPAR_PROC_BUS_0_FREQ_HZ
> #define XPAR_CORE_CLOCK_FREQ_HZ XPAR_CPU_${cpu}_CORE_CLOCK_FREQ_HZ
> #ifndef XPAR_DDR2_SDRAM_MEM_BASEADDR
> # define XPAR_DDR2_SDRAM_MEM_BASEADDR XPAR_DDR_SDRAM_MPMC_BASEADDR
> #endif
> #define XPAR_PCI_0_CLOCK_FREQ_HZ    0" >> =
${S}/board/xilinx/${XILINX_BOARD}/xparameters.h
> }

In the above code ${TARGET_ARCH} always evaluates to "powerpc". I just =
inserted ${TARGET_ARCH} in the echo statements, and saw the value in the =
file.

Now what I can't seem to figure out is why, for the following if =
condition, the first branch isn't being take; the else branch is always =
evaluated, and the value for cpu is always set to "440" instead of =
"PPC440"

if [ "${TARGET_ARCH}" =3D=3D "powerpc" ]; then
	cpu=3D"PPC`echo ${TARGET_CPU} | tr '[:lower:]' '[:upper:]'`"
else
	cpu=3D"`echo ${TARGET_CPU} | tr '[:lower:]' '[:upper:]'`"
fi

Best regards,

Elvis Dowson=


