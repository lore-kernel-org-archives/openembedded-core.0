Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R5ekl-0007sp-UJ
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 16:23:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8JEI680009315
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2011 07:18:06 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 19 Sep 2011 07:18:05 -0700
Message-ID: <4E774F1D.1020105@windriver.com>
Date: Mon, 19 Sep 2011 09:18:05 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1316275989.6161.23.camel@trisquel>
In-Reply-To: <1316275989.6161.23.camel@trisquel>
Subject: Re: armv6-novfp and armv6-vfp and tune files
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
X-List-Received-Date: Mon, 19 Sep 2011 14:23:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 9/17/11 11:13 AM, Denis 'GNUtoo' Carikli wrote:
> hi,
> I've an HTC Dream, it has an armv6 CPU but lack a vfp unit.
> I want to add correct support for it in meta-smartphone/meta-htc.
> In order to have a correct machine config that works a tune inc file
> must be required in it.
> 
> In openembedded-core there is no tune file yet for an armv6 that lacks a
> vfp, but there are theses two files:
> meta/conf/machine/include/tune-arm1136jf-s.inc
> meta/conf/machine/include/arm/arch-armv6.inc
> 
> tune-arm1136jf-s.inc requires arch-armv6.inc.
> 
> So I need to create an tune-arm1136ej-s.inc which requires an
> arch-armv6-novfp.inc(also to be created).
> 

Is the arm1136ej-s the core in the HTC dream?  Or is it a custom armv6 (w/o vfp)?

If it's the later you should add a new tune file for this htc dream's processor.

The arch-armv6 should be modified to include a novfp feature.  Using the armv5
as an example, I suggest:

 # Little Endian
-AVAILTUNES += "armv6 armv6t armv6hf armv6thf"
+AVAILTUNES += "armv6-novfp armv6 armv6t armv6hf armv6thf"

+TUNE_FEATURES_tune-armv6-novfp ?= "armv6"

+PACKAGE_EXTRA_ARCHS_tune-armv6-novfp = "${PACKAGE_EXTRA_ARCHS_tune-armv5e} armv6"

(if there is a thumb variant, add that as well...)

(...and... if there is a big endian variant add that as well...)

Then using tune-arm1136ej-s.inc as a model for a new htc-dream tune:

DEFAULTTUNE ?= "htcdream"

require conf/machine/include/arm/arch-armv6.inc

TUNEVALID[htcdream] = "Enable HTC dream specific processor optimizations"
TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "htcdream",
"-mtune=<something appropriate here>", "", d)}"

AVAILTUNES += "htcdream"
TUNE_FEATURES_tune-htcdream = "${TUNE_FEATURES_tune-armv6-novfp} htcdream"
PACKAGE_EXTRA_ARCHS_tune-htcdream = "${PACKAGE_EXTRA_ARCHS_tune-armv6-novfp}"

If the htc-dream has an existing core, then you can simply add a "novfp" variant
to that core.

> 
> however I wonder how to create the armv6-novfp.inc:
> arch-armv6.inc has things like that inside:
> TUNE_FEATURES_tune-armv6 ?= "armv6 vfp"
> or:
> PACKAGE_EXTRA_ARCHS_tune-armv6 = "${PACKAGE_EXTRA_ARCHS_tune-armv5e-vfp}
> armv6-vfp"
> or:
> TUNEVALID[armv6] = "Enable instructions for ARMv6"
> 
> in the recipes and in the feeds and in the workdir it's labeled as
> "armv6-vfp".
> 
> So the correct way would be to label an armv6 that lacks a vfp "armv6".
> 
> however, I fear that the armv6 override is already taken, and also maybe
> the arch-armv6.inc should be moved to arch-armv6-vfp.inc.

Due to the way this was originally implemented, I was told no variants of the
armv6 existed w/o VFP.....  so the naming is what it is, I'm open to suggesting
a change to make it more explicit that armv6 is w/o VFP and armv6-vfp is w/ VFP.
 But it's up to the oe-core community if they'll accept that change to the core
tunings.  It's more likely they will accept armv6-novfp (as in the examples above.)

--Mark

> Denis.
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



