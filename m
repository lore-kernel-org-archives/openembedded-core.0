Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SavDP-0002W9-3H
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Jun 2012 22:46:27 +0200
Received: by werg55 with SMTP id g55so2091423wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jun 2012 13:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:to:mime-version:x-mailer;
	bh=PoK1ilIriMYP+02R+0lgysnVfc+W15XIWqRPXiguXm4=;
	b=ZS2t5V8pFaukuzOE3X8317n/gyVEY8Mh06kJRr4jlUP7+FyoC2zZN1gwv3W3MxKEXF
	ZIR/Pit5lIPIDs5nqrTJCWJTivF2cgW+FtGHR5iOwOyG0X15/I96XO9BqczDF+WYSzHa
	yaTbGEArglBplFoSiCedC0gk5u5p8qYdX0b3XnMKCT4E0pcwREYCibe/7E/uah3cFd0A
	g/S7jP4SKiifk6qcz4cp9nBVdQM4vd6Jkr9tyAYdh9py4hc5pBKUn6OD76m61Rogul+g
	vSVGyUCmN7oj/2ZRTFLFdqygfzTJHHcZoQTMO2nCL9jtVXYT2lJoytBey/j/+3UU4VLC
	nFjQ==
Received: by 10.216.228.150 with SMTP id f22mr5304165weq.192.1338669364394;
	Sat, 02 Jun 2012 13:36:04 -0700 (PDT)
Received: from [192.168.1.35] (197.Red-79-150-15.dynamicIP.rima-tde.net.
	[79.150.15.197])
	by mx.google.com with ESMTPS id ei4sm11657503wid.5.2012.06.02.13.36.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 13:36:03 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Sat, 2 Jun 2012 22:36:01 +0200
Message-Id: <56B3703F-09C3-4A9E-BF97-17DBBBE8C9AF@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
Subject: [meta-xilinx] How to debug the value of ${TARGET_ARCH} in meta-xilinx/classes/xilinx-boot.class
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
X-List-Received-Date: Sat, 02 Jun 2012 20:46:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
      How can I debug the value of ${TARGET_ARCH} in =
meta-xilinx/classes/xilinx-boot.class, for the following function:

do_export_xparam() {
bbnote "Replacing xparameters header to match hardware model"
xparam=3D$1
if [ "${TARGET_ARCH}" =3D=3D "powerpc" ]; then
	cpu=3D"PPC`echo ${TARGET_CPU} | tr '[:lower:]' '[:upper:]'`"
else
	cpu=3D`echo ${TARGET_CPU} | tr '[:lower:]' '[:upper:]'`
fi
cp ${xparam} ${S}/board/xilinx/${XILINX_BOARD}
echo "/*** Cannonical definitions ***/
#define XPAR_PLB_CLOCK_FREQ_HZ XPAR_PROC_BUS_0_FREQ_HZ
#define XPAR_CORE_CLOCK_FREQ_HZ XPAR_CPU_${cpu}_CORE_CLOCK_FREQ_HZ
#ifndef XPAR_DDR2_SDRAM_MEM_BASEADDR
# define XPAR_DDR2_SDRAM_MEM_BASEADDR XPAR_DDR_SDRAM_MPMC_BASEADDR
#endif
#define XPAR_PCI_0_CLOCK_FREQ_HZ    0" >> =
${S}/board/xilinx/${XILINX_BOARD}/xparameters.h
}

My machine is configured as virtex-5, and =
meta-xilinx/conf/machine/virtex5.conf doesn't specify TARGET_ARCH, it =
just defines the following

TARGET_CPU  =3D "440"
#tune for the 440 cpu
require conf/machine/include/tune-ppc440.inc

So is that a mistake?

At the moment, the value for cpu=3D440, instead of PPC440 for =
do_export_xparam().

Best regards,

Elvis Dowson=


