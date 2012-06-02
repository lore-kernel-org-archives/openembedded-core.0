Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Sawjb-00040f-1N
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Jun 2012 00:23:47 +0200
Received: by werg55 with SMTP id g55so2116846wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jun 2012 15:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=heg2FtTmNj9Cgyoe+vHivryobzsHJBtUVfBOiXu5qnA=;
	b=a9DoqxQ5iqRZtwY4Xh22bVSgj7j8C14Oubps0uYm3c66mgOXrHNyoBM0wWXVRJ6yFd
	KQQMOEtLJUFFffjv4z31L+HiSd2TdcgZxo61uajbvyhSFPLX4S8BW2EVBSKiFmzeazPv
	vDP9Ie0Rfllbh+D7aRhNrpq45+1lXlcBJROrRXWpbsenVO3DigtjMKq24YFfy+qNTLS6
	AWr+OIRkGjXWKsLPFXTLh28T4aIf7AJAihVkuOyIlHyneIZv9qAThYmbPj41AXkAxlFX
	nj6LgeTJXv6urVBKdVDQAozyow39SlyJ4+IDKrmA8uKd9k6m4Jp+gZJZyKp0wBQClf9V
	Xtug==
Received: by 10.216.210.225 with SMTP id u75mr6234570weo.13.1338675204401;
	Sat, 02 Jun 2012 15:13:24 -0700 (PDT)
Received: from [192.168.1.35] (197.Red-79-150-15.dynamicIP.rima-tde.net.
	[79.150.15.197])
	by mx.google.com with ESMTPS id i10sm12532401wiy.10.2012.06.02.15.13.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 15:13:23 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <A9C91AFD-F965-453F-A418-981EB6399247@gmail.com>
Date: Sun, 3 Jun 2012 00:13:21 +0200
Message-Id: <E100C99B-7213-4B02-A6FF-C9878DF57562@gmail.com>
References: <56B3703F-09C3-4A9E-BF97-17DBBBE8C9AF@gmail.com>
	<A9C91AFD-F965-453F-A418-981EB6399247@gmail.com>
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
X-List-Received-Date: Sat, 02 Jun 2012 22:23:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

> On Jun 2, 2012, at 10:36 PM, Elvis Dowson wrote:
>=20
>> How can I debug the value of ${TARGET_ARCH} in =
meta-xilinx/classes/xilinx-boot.class, for the following function:
>>=20
>> do_export_xparam() {
>> bbnote "Replacing xparameters header to match hardware model"
>> xparam=3D$1
>> if [ "${TARGET_ARCH}" =3D=3D "powerpc" ]; then
>> 	cpu=3D"PPC`echo ${TARGET_CPU} | tr '[:lower:]' '[:upper:]'`"
>> else
>> 	cpu=3D`echo ${TARGET_CPU} | tr '[:lower:]' '[:upper:]'`
>> fi
>> cp ${xparam} ${S}/board/xilinx/${XILINX_BOARD}
>> echo "/*** Cannonical definitions ***/
>> #define XPAR_PLB_CLOCK_FREQ_HZ XPAR_PROC_BUS_0_FREQ_HZ
>> #define XPAR_CORE_CLOCK_FREQ_HZ XPAR_CPU_${cpu}_CORE_CLOCK_FREQ_HZ
>> #ifndef XPAR_DDR2_SDRAM_MEM_BASEADDR
>> # define XPAR_DDR2_SDRAM_MEM_BASEADDR XPAR_DDR_SDRAM_MPMC_BASEADDR
>> #endif
>> #define XPAR_PCI_0_CLOCK_FREQ_HZ    0" >> =
${S}/board/xilinx/${XILINX_BOARD}/xparameters.h
>> }
>=20
> In the above code ${TARGET_ARCH} always evaluates to "powerpc". I just =
inserted ${TARGET_ARCH} in the echo statements, and saw the value in the =
file.
>=20
> Now what I can't seem to figure out is why, for the following if =
condition, the first branch isn't being take; the else branch is always =
evaluated, and the value for cpu is always set to "440" instead of =
"PPC440"
>=20
> if [ "${TARGET_ARCH}" =3D=3D "powerpc" ]; then
> 	cpu=3D"PPC`echo ${TARGET_CPU} | tr '[:lower:]' '[:upper:]'`"
> else
> 	cpu=3D"`echo ${TARGET_CPU} | tr '[:lower:]' '[:upper:]'`"
> fi

Changing it to use a single =3D , instead of =3D=3D solved it, but it =
would help if someone could explain why. =46rom the link below=20
http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html
apparently, using a "=3D" is for strict posix compilance.

but I fail to see why when ${TARGET_ARCH} evaluates to "powerpc", and I =
do a string comparision if [ "${TARGET_ARCH}" =3D=3D "powerpc" ] it =
evaluates to false, and if [ "${TARGET_ARCH}" =3D "powerpc" ] evaluates =
to true.

Best regards,

Elvis Dowson=


