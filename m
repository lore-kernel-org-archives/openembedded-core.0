Received: from sputnik.urmx.de ([88.198.51.18])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Eibach@gdsys.de>) id 1S5D2I-0004Q3-HA
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Mar 2012 10:19:54 +0100
Received: from mailrelay.gdsys.de (unknown [217.6.197.20])
	by sputnik.urmx.de (Postfix) with ESMTP id D0E6F6020208
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2012 10:11:17 +0100 (CET)
Received: from mailsgw.gdsys.de (localhost [127.0.0.1])
	by mailsgw.gdsys.de (Postfix) with ESMTP id 075D61F8802
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2012 10:11:19 +0100 (CET)
X-Spam-Processed: srv201.gdsys.de, Wed, 07 Mar 2012 10:11:15 +0100
	(not processed: message from trusted or authenticated source)
X-Return-Path: Eibach@gdsys.de
X-Envelope-From: Eibach@gdsys.de
X-MDaemon-Deliver-To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.3790.4913
Importance: normal
Priority: normal
Date: Wed, 7 Mar 2012 10:11:22 +0100
Message-ID: <48D3D52125C49B43AE880038E2E5314BB5BFA7@SRV101.gdsys.de>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [OE-core] [PATCH] arch-powerpc.inc: use default value
	ofTUNE_PKGARCH
thread-index: Acz7+EKQc7LX+AQFSWiFTJMtxnHdLAAScZQg
References: <1331076055-15262-1-git-send-email-msm@freescale.com>
From: "Eibach, Dirk" <Eibach@gdsys.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>, 
	<openembedded-core@openembedded.org>
X-SafeGuard_MailGateway: Version: 5.60.3.11066 SGMG Date: 20120307091118Z
X-AntiVirus: checked by AntiVir MailGate (version: 2.0.2-5; AVE: 7.9.10.8;
	VDF: 7.11.24.196; host: mailrelay)
Subject: Re: [PATCH] arch-powerpc.inc: use default value ofTUNE_PKGARCH
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
X-List-Received-Date: Wed, 07 Mar 2012 09:19:54 -0000
Content-Class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

 

> We can use the default value for TUNE_PKGARCH, and now we 
> just append "-nf" if TARGET_FPU is fpu-soft
> 
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  meta/conf/machine/include/powerpc/arch-powerpc.inc |    6 ++----
>  1 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git 
> a/meta/conf/machine/include/powerpc/arch-powerpc.inc 
> b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> index c9b2829..abd72ed 100644
> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> @@ -18,10 +18,8 @@ TARGET_FPU .= 
> "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft", "soft", "", d)}
>  
>  ABIEXTENSION = "${@['','spe'][d.getVar('TARGET_FPU', True) 
> in ['ppc-efd', 'ppc-efs']]}"
>  
> -PPCPKGSFX_FPU = "${@bb.utils.contains("TUNE_FEATURES", 
> "fpu-hard" , "", "-nf", d)}"
> -
> -PPCPKGARCH = "${TUNE_ARCH}${PPCPKGSFX_FPU}"
> -TUNE_PKGARCH ?= "${PPCPKGARCH}"
> +PPCPKGSFX_FPU = "${@['', 
> '-nf'][bb.data.getVar('TARGET_FPU',d,1) in ['fpu-soft']]}"
> +TUNE_PKGARCH_append = "${PPCPKGSFX_FPU}"
>  
>  # Basic tune definitions
>  AVAILTUNES += "powerpc powerpc-nf" 

This fixes my issues with e500v2 cores.

Tested-by: Dirk Eibach <eibach@gdsys.de>




