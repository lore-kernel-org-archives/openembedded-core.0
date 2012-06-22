Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Si7W6-0007ou-EP
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 19:19:31 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga11.intel.com with ESMTP/TLS/RC4-MD5; 22 Jun 2012 10:08:40 -0700
Received: by pbbro8 with SMTP id ro8so3873723pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 10:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=VAKA5ym3sFP4uMROGoU3z9XQ+4tN3Ylk5OIkihWvyWs=;
	b=KHTHCAvPjSWjoHDyU5EHwFpCw93oCdjmQJDAqERIdWHrVremmYVLWy56LhNakOVZ6g
	DN7mAFEq4x8JzUlypQG4pRoU1sEN19vLY5yEgLKvkH2kr1bl6UuDMtV3hZh61F3Skvyu
	MCXKy+0k+8aU0FJ/lzUNNoaNpN4xp5rKFCH3Fz3ZufRMTCdVp5II0SOvt0NtamIW21tl
	SioDoswV4cauWzcmGMyN64UR1zZ58NYGx3gR1DsqLGQh1RhDuGJxYq/oRtY5uaMZBzMZ
	Hu/4QgYALWUx86e354DdCBEkDK6QpVxonLN5Onc+aDuIqnCHVtMelvuVZGGcHvQdlmST
	DNcw==
Received: by 10.68.192.73 with SMTP id he9mr12537307pbc.17.1340384920172;
	Fri, 22 Jun 2012 10:08:40 -0700 (PDT)
Received: from [10.1.10.192] (c-50-137-42-92.hsd1.or.comcast.net.
	[50.137.42.92])
	by mx.google.com with ESMTPS id iv8sm39452399pbc.53.2012.06.22.10.08.38
	(version=SSLv3 cipher=OTHER); Fri, 22 Jun 2012 10:08:39 -0700 (PDT)
Message-ID: <4FE4A694.2040504@intel.com>
Date: Fri, 22 Jun 2012 10:08:36 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4FE431E4.6070706@communistcode.co.uk>
In-Reply-To: <4FE431E4.6070706@communistcode.co.uk>
X-Gm-Message-State: ALoCoQk0bIkVfjz5I8NO+/h5La/WbSmzFJ7ZdacqQZSqA/lUZ0kbXX+s//CNzCKoSkgnFTgM86sj
Subject: Re: sgml-common sstate_task_postfunc failure
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
X-List-Received-Date: Fri, 22 Jun 2012 17:19:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/22/2012 01:50 AM, Jack Mitchell wrote:
> I have had issues building sgml-common the past few days with oe-core
> master. Could anyone shed any light on the debug messages I am receiving
> and what I could do to go about fixing them.
>
> I don't really understand the recipe, it seems to be some sort of
> surrogate recipe for transferring over specified files.

The sgml catalog generation process has been plagued with race 
conditions and special cases like requiring SSTATEPOSTINSTFUNCS from the 
start - the problem is that unlike most packages, we're not installing 
static files but need to dynamically update the sgml catalog every time 
a new dtd gets installed.

If this is reproducible, and you've only been experiencing it for the 
past few days, could you possibly bisect which commit has caused this error?

Scott

>
> [jack@archHP ~]$ cat
> /home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/sgml-common-native-0.6.3-r0/temp/log.do_populate_sysroot.21669
>
> DEBUG: Executing python function sstate_task_prefunc
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/bin/sgmlwhich
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/bin/install-catalog
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml.dcl
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOgrk2.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOgrk1.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOlat1.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOdia.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOcyr2.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOgrk3.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOamsc.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOlat2.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOnum.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOtech.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOamsb.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOamsr.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOamso.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOgrk4.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOcyr1.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOamsa.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISObox.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOpub.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOamsn.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/catalog
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOgrk2.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOgrk1.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOlat1.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOdia.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOcyr2.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOgrk3.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOamsc.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOlat2.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOnum.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOtech.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOamsb.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOamsr.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOamso.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOgrk4.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOcyr1.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOamsa.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISObox.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOpub.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOamsn.ent
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/catalog
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/etc/sgml/sgml-ent.cat
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/etc/sgml/sgml.conf
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/etc/sgml/sgml-docbook.cat
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/etc/sgml/catalog
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/etc/sgml/
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/bin/
>
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/etc/
> DEBUG: Removing manifest:
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/
> DEBUG: Python function sstate_task_prefunc finished
> DEBUG: Executing python function do_populate_sysroot
> DEBUG: Executing shell function sysroot_stage_all
> DEBUG: Shell function sysroot_stage_all finished
> DEBUG: Executing python function relocatable_binaries_preprocess
> DEBUG: Python function relocatable_binaries_preprocess finished
> DEBUG: Executing shell function sgml_common_native_mangle
> DEBUG: Shell function sgml_common_native_mangle finished
> DEBUG: Python function do_populate_sysroot finished
> DEBUG: Executing python function do_qa_staging
> NOTE: QA checking staging
> DEBUG: Python function do_qa_staging finished
> DEBUG: Executing python function sstate_task_postfunc
> DEBUG: Staging files from
> /home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/sgml-common-native-0.6.3-r0/sysroot-destdir///home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
> to /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
> DEBUG: Staging files from
> /home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/sgml-common-native-0.6.3-r0/sysroot-destdir///home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
> to /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
> DEBUG: Staging files from
> /home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/sgml-common-native-0.6.3-r0/sysroot-destdir///home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
> to /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
> DEBUG: Staging files from
> /home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/sgml-common-native-0.6.3-r0/sysroot-destdir///home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
> to /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
> DEBUG: Staging files from
> /home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/sgml-common-native-0.6.3-r0/sysroot-destdir///home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
> to /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
> DEBUG: Staging files from
> /home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/sgml-common-native-0.6.3-r0/sysroot-destdir///home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
> to /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
> DEBUG: Staging files from
> /home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/sgml-common-native-0.6.3-r0/sysroot-destdir///home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
> to /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
> DEBUG: Staging files from
> /home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/sgml-common-native-0.6.3-r0/sysroot-destdir///home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
> to /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
> DEBUG: Staging files from
> /home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/sgml-common-native-0.6.3-r0/sysroot-destdir///home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
> to /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
> DEBUG: Executing shell function sgml_common_sstate_postinst
> DEBUG: Python function sstate_task_postfunc finished
> ERROR: Function failed: sgml_common_sstate_postinst (see
> /home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/sgml-common-native-0.6.3-r0/temp/log.do_populate_sysroot.21669
> for further information)
> install-catalog: addition of
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/etc/sgml/sgml-docbook-dtd-3.1.cat
> in
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/etc/sgml/sgml-docbook.cat
>
> install-catalog: addition of
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/etc/sgml/dsssl-docbook-stylesheets.cat
> in
> /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/etc/sgml/sgml-docbook.cat
>
> install-catalog:
> "/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/etc/sgml/sgml-docbook-dtd-4.1.cat"
> does not exist or is empty.
>


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center




