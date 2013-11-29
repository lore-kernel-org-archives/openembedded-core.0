Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 609D26D138
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 08:45:49 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id hq4so1831631wib.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 00:45:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-type:content-transfer-encoding
	:subject:date:message-id:cc:to:mime-version;
	bh=qwxZC+mjBmNXCoKTVqpmETV5/HMKnKtGiz8QyGd0b64=;
	b=cm+P+WqIQD5SPDG4RxCFO3O3E0CGkz7Oa3zy2zyYbdgXOLwLCG1sgpma+B9n84Bh1M
	pyMm6B9Msh7h2azCNNlj1y6Mt3iDlJ0kzr9YDISeKAOxKvTnKptEeP4zFzoAkg5liBv/
	00D7ScSRniIQV8RwKcLeGcBQ5WyAmXrezFqL5Kl0yg/cKLHggsmYHCq5GjQWl0VoB+lz
	Zm4bpSx16fluPKU5gqhcA9WlfZ1jOY6+zCkcm7zppmFW02F0hcxu2PkTRMNihRmxcH+R
	9Tc2b9QvvfmMipmY0MWZISZPmblTnP7G0bREIb6oblbGpVfxE2J9xEJ4LcHxMZGY3GnE
	um6w==
X-Gm-Message-State: ALoCoQmUaOAgA3qhlSTsyLuzoOQv9O9XmrGb07yEADU9kLXt4M63Nm1/WDB3B04tdGuq/ilFDJ5N
X-Received: by 10.181.11.201 with SMTP id ek9mr5821214wid.54.1385714748165;
	Fri, 29 Nov 2013 00:45:48 -0800 (PST)
Received: from [172.20.0.138] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id g16sm49352305wiw.6.2013.11.29.00.45.46
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 29 Nov 2013 00:45:47 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 29 Nov 2013 09:45:46 +0100
Message-Id: <F8B3526C-4727-4090-A092-1827AAE52F71@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Nitin A Kamble <nitin.a.kamble@intel.com>
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
X-Mailer: Apple Mail (2.1822)
Cc: Tim Orling <ticotimo@gmail.com>, Elias Bakken <elias.bakken@gmail.com>
Subject: Perl CPAN module install path bug in cpan_build.bbclass?
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
X-List-Received-Date: Fri, 29 Nov 2013 08:45:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

I've been working on perl modules and I noticed some of them don't work =
properly and nearly all of the non-working ones are Build.PL based and =
use cpan_build.bbclass.=20

A working module looks like this:
	[koen@rrmbp v2013.06]$ dpkg-deb -c =
deploy/eglibc/ipk/armv7ahf-vfp-neon/perl-module-test-differences_0.61-r0.1=
_armv7ahf-vfp-neon.ipk
	-r--r--r-- root/root     19567 2013-11-28 15:20 =
./usr/lib/perl/vendor_perl/5.14.3/Test/Differences.pm

A non-working one looks like this:
	[koen@rrmbp v2013.06]$ dpkg-deb -c =
deploy/eglibc/ipk/armv7ahf-vfp-neon/perl-module-build-withxspp_0.14-r0.0_a=
rmv7ahf-vfp-neon.ipk
	-rw-r--r-- root/root       361 2013-11-28 16:50 =
./usr/lib/perl/auto/Module/Build/WithXSpp/.packlist
	-r--r--r-- root/root     22557 2013-11-28 16:50 =
./usr/share/perl/Module/Build/WithXSpp.pm

Looking through the git logs it looks like Nitin tried to fix it, but =
stopped halfway and only did cpan.bbclass properly:

	=
https://github.com/openembedded/oe-core/commit/83796edd29561f02b6f7b036351=
711f8def77a4f

Since I don't know anything about perl, should cpan_build.bbclass be =
changes to install into /usr/lib/perl/vendor_perl/5.14.3 as well or are =
Build.PL based modules 'special' and need a lot more work? This is what =
I had in mind:

-        --install_path lib=3D"${datadir}/perl" \
+        --install_path =
lib=3D"${libdir}/perl/vendor_perl/${@get_perl_version(d)}" \

regards,

Koen=

